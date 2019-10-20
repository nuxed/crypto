# Nuxed\\Crypto\\Base64\\UrlSafe\\decode()




Decode a base64-encoded string into raw binary




``` Hack
namespace Nuxed\Crypto\Base64\UrlSafe;

function decode(
  string $src,
  bool $strictPadding = false,
): string;
```




Base64 character set:
[A-Z]      [a-z]      [0-9]      -     _
0x41-0x5a, 0x61-0x7a, 0x30-0x39, 0x2d, 0x5f




## Parameters




+ ` string $src `
+ ` bool $strictPadding = false `




## Returns




* ` string `