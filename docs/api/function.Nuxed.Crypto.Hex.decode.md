# Nuxed\\Crypto\\Hex\\decode()




Convert a hexadecimal string into a binary string without cache-timing
leaks




``` Hack
namespace Nuxed\Crypto\Hex;

function decode(
  string $hex,
  bool $strictPadding = false,
): string;
```




Hex ( Base16 ) character set:
[0-9]      [a-f]      [A-F]
0x30-0x39, 0x61-0x66, 0x41-0x46




## Parameters




+ ` string $hex `
+ ` bool $strictPadding = false `




## Returns




* ` string `