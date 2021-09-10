export interface ZebraPrinterPlugin {
  /**
   * Discover available printers
   *
   * @param options
   */
  discover(options: DiscoverOptions): Promise<DiscoverResult>

  /**
   * Show bluetooth devices picker
   */
   showBluetoothPrintersPicker(): Promise<void>

  /**
   * Connect to a printer
   *
   * @param options
   */
   connect(options: ConnectOptions): Promise<void>

  /**
   * Close the connection to the printer
   */
   closeConnection(): Promise<void>

  /**
   * Disconnect the connection to the printer and release resource
   */
   disconnect(): Promise<void>

  /**
   * Send print command
   *
   * @param options
   */
   print(options: PrintOptions): Promise<void>
}

export type DiscoverOptions = {
  type: 'Bluetooth' | 'TCP',
  hops?: number,
  timeout?: number,
}

export type DiscoverResult = {
  printers: Array<{
    name: string,
    serialNumber: string,
    modelNumber: string,
    manufacturer: string,
    isConnected: boolean,
  }>,
}

export type ConnectOptions = {
  serialNumber?: string,
  address?: string,
}

export type PrintOptions = {
  command: string,
}
