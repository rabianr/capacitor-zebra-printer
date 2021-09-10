# capacitor-zebra-printer

Capacitor plugin for Zebra Printer

## Install

```bash
npm install capacitor-zebra-printer
npx cap sync
```

## API

<docgen-index>

* [`discover(...)`](#discover)
* [`showBluetoothPrintersPicker()`](#showbluetoothprinterspicker)
* [`connect(...)`](#connect)
* [`closeConnection()`](#closeconnection)
* [`disconnect()`](#disconnect)
* [`print(...)`](#print)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### discover(...)

```typescript
discover(options: DiscoverOptions) => any
```

Discover available printers

| Param         | Type                                                                          |
| ------------- | ----------------------------------------------------------------------------- |
| **`options`** | <code>{ type: "Bluetooth" \| "TCP"; hops?: number; timeout?: number; }</code> |

**Returns:** <code>any</code>

--------------------


### showBluetoothPrintersPicker()

```typescript
showBluetoothPrintersPicker() => any
```

Show bluetooth devices picker

**Returns:** <code>any</code>

--------------------


### connect(...)

```typescript
connect(options: ConnectOptions) => any
```

Connect to a printer

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code>{ serialNumber?: string; address?: string; }</code> |

**Returns:** <code>any</code>

--------------------


### closeConnection()

```typescript
closeConnection() => any
```

Close the connection to the printer

**Returns:** <code>any</code>

--------------------


### disconnect()

```typescript
disconnect() => any
```

Disconnect the connection to the printer and release resource

**Returns:** <code>any</code>

--------------------


### print(...)

```typescript
print(options: PrintOptions) => any
```

Send print command

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ command: string; }</code> |

**Returns:** <code>any</code>

--------------------

</docgen-api>
