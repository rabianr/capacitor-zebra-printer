import Foundation

@objc public class ZebraPrinter: NSObject {
    var printerConn: ZebraPrinterConnection?

    @objc public func discoverBluetooth() -> Array<Any> {
        var printers = [Any]()

        let connectedAccessories = EAAccessoryManager.shared().connectedAccessories

        for accessory in connectedAccessories {
            if accessory.protocolStrings.contains("com.zebra.rawport") {
                printers.append([
                    "name": accessory.name,
                    "serialNumber": accessory.serialNumber,
                    "modelNumber": accessory.modelNumber,
                    "manufacturer": accessory.manufacturer,
                    "isConnected": accessory.isConnected,
                ])
            }
        }

        return printers
    }

    @objc public func discoverTcp(hops: Int, waitForResponsesTimeout: Int) -> Array<Any> {
        var printers = [Any]()

        do {
            printers += try NetworkDiscoverer.multicast(withHops: hops,
                andWaitForResponsesTimeout: waitForResponsesTimeout) as! [DiscoveredPrinter]
        } catch {
            Swift.print(error)
        }

        return printers
    }

    @objc public func showBluetoothAccessoryPicker(completion: @escaping (Error?) -> Void) {
        DispatchQueue.main.async {
            EAAccessoryManager.shared()
                .showBluetoothAccessoryPicker(withNameFilter: nil, completion: completion)
        }
    }

    @objc public func connectBluetooth(_ serialNumber: String) {
        if printerConn == nil {
            printerConn = MfiBtPrinterConnection(serialNumber: serialNumber)
        }

        if printerConn?.isConnected() == false {
            printerConn?.open()
        }
    }

    @objc public func connectTcp(_ address: String) {
        if printerConn == nil {
            printerConn = TcpPrinterConnection(address: address, andWithPort: 9100)
        }

        if printerConn?.isConnected() == false {
            printerConn?.open()
        }
    }

    @objc public func closeConnection() {
        printerConn?.close()
    }

    @objc public func disconnect() {
        closeConnection()
        printerConn = nil
    }

    @objc public func print(_ command: String) -> NSError? {
        let data = command.data(using: .utf8)
        var error: NSError?

        printerConn?.write(data, error: &error)

        return error
    }
}
