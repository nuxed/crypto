# Nuxed\\Crypto\\Hex\\encode_upper()




Convert a binary string into a hexadecimal string without cache-timing
leaks, returning uppercase letters (as per RFC 4648)




``` Hack
namespace Nuxed\Crypto\Hex;

function encode_upper(
  string $binary,
): string;
```




Hex ( Base16 ) character set:
[0-9]      [A-F]
0x30-0x39, 0x41-0x46




## Parameters




+ ` string $binary `




## Returns




* ` string `