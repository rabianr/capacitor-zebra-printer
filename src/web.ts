import { WebPlugin } from '@capacitor/core'

import type {
  ZebraPrinterPlugin,
  DiscoverOptions,
  DiscoverResult,
  ConnectOptions,
  PrintOptions,
} from './definitions'

export class ZebraPrinterWeb extends WebPlugin implements ZebraPrinterPlugin {
  async discover(options: DiscoverOptions): Promise<DiscoverResult> {
    throw this.unimplemented('Not implemented on web.')
  }

  async showBluetoothPrintersPicker(): Promise<void> {
    throw this.unimplemented('Not implemented on web.')
  }

  async connect(options: ConnectOptions): Promise<void> {
    throw this.unimplemented('Not implemented on web.')
  }

  async closeConnection(): Promise<void> {
    throw this.unimplemented('Not implemented on web.')
  }

  async disconnect(): Promise<void> {
    throw this.unimplemented('Not implemented on web.')
  }

  async print(options: PrintOptions): Promise<void> {
    throw this.unimplemented('Not implemented on web.')
  }
}
