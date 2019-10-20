# Nuxed\\Crypto\\Base32\\decode_upper()




Decode a Base32-encoded uppercase string into raw binary




``` Hack
namespace Nuxed\Crypto\Base32;

function decode_upper(
  string $src,
  bool $strictPadding = false,
): string;
```




Base32 character set:
[A-Z]      [2-7]
0x41-0x5a, 0x32-0x37




## Parameters




+ ` string $src `
+ ` bool $strictPadding = false `




## Returns




* ` string `