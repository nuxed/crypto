# Nuxed\\Crypto\\Base32\\decode()




Decode a Base32-encoded string into raw binary




``` Hack
namespace Nuxed\Crypto\Base32;

function decode(
  string $src,
  bool $strictPadding = false,
): string;
```




Base32 character set:
[a-z]      [2-7]
0x61-0x7a, 0x32-0x37




## Parameters




+ ` string $src `
+ ` bool $strictPadding = false `




## Returns




* ` string `