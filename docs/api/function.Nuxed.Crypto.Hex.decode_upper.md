# Nuxed\\Crypto\\Hex\\decode_upper()




Convert a hexadecimal uppercase string into a binary string without cache-timing
leaks




``` Hack
namespace Nuxed\Crypto\Hex;

function decode_upper(
  string $hex,
  bool $strictPadding = false,
): string;
```




Hex ( Base16 ) character set:
[0-9]      [A-F]
0x30-0x39, 0x41-0x46




Note: Hex\\decode is capable of decoding uppercase hexadecimal strings,
this function exists only for consistency.




## Parameters




+ ` string $hex `
+ ` bool $strictPadding = false `




## Returns




* ` string `