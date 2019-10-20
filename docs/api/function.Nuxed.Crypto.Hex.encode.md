# Nuxed\\Crypto\\Hex\\encode()




Convert a binary string into a hexadecimal string without cache-timing
leaks




``` Hack
namespace Nuxed\Crypto\Hex;

function encode(
  string $binary,
): string;
```




Hex ( Base16 ) character set:
[0-9]      [a-f]
0x30-0x39, 0x61-0x66




## Parameters




+ ` string $binary `




## Returns




* ` string `