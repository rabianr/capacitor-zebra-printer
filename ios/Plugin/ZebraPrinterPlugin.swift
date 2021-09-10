import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(ZebraPrinterPlugin)
public class ZebraPrinterPlugin: CAPPlugin {
    private let implementation = ZebraPrinter()

    /**
     * Discover available printers
     */
    @objc func discover(_ call: CAPPluginCall) {
        let type = call.getString("type", "Bluetooth")
        var printers = [Any]()

        if type == "Bluetooth" {
            printers += implementation.discoverBluetooth()
        } else if type == "TCP" {
            let hops = call.getInt("hops", 1)
            let timeout = call.getInt("timeout", -1)
            printers += implementation.discoverTcp(hops: hops, waitForResponsesTimeout: timeout)
        }

        call.resolve([
            "printers": printers
        ])
    }

    /**
     * Show bluetooth devices picker
     */
    @objc public func showBluetoothPrintersPicker(_ call: CAPPluginCall) {
        implementation.showBluetoothAccessoryPicker(completion: { error in
            if error == nil {
                call.resolve()
            } else {
                call.reject(error!.localizedDescription)
            }
            Swift.print(error)
        })
    }

    /**
     * Connect to a printer
     */
    @objc func connect(_ call: CAPPluginCall) {
        if let serialNumber = call.getString("serialNumber") {
            implementation.connectBluetooth(serialNumber)
        } else if let address = call.getString("address") {
            implementation.connectTcp(address)
        } else {
            call.reject("Please specify connection details")
        }

        call.resolve()
    }

    /**
     * Close the connection to the printer
     */
    @objc func closeConnection(_ call: CAPPluginCall) {
        implementation.disconnect()

        call.resolve()
    }

    /**
     * Disconnect the connection to the printer and release resource
     */
    @objc func disconnect(_ call: CAPPluginCall) {
        implementation.disconnect()

        call.resolve()
    }

    /**
     * Send print command
     */
    @objc func print(_ call: CAPPluginCall) {
        guard let command = call.getString("command") else {
            call.reject("Print command cannot be blank")

            return
        }

        let error = implementation.print(command)

        if error == nil {
            call.resolve()
        } else {
            call.reject(error!.localizedDescription)
        }
    }
}
