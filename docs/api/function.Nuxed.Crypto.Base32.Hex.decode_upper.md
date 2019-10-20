# Nuxed\\Crypto\\Base32\\Hex\\decode_upper()




Decode a Base32-encoded uppercase string into raw binary




``` Hack
namespace Nuxed\Crypto\Base32\Hex;

function decode_upper(
  string $src,
  bool $strictPadding = false,
): string;
```




Base32 character set:
[0-9]      [A-V]
0x30-0x39, 0x41-0x56




## Parameters




+ ` string $src `
+ ` bool $strictPadding = false `




## Returns




* ` string `