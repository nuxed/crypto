# Nuxed\\Crypto\\Base64\\UrlSafe\\encode()




Convert a binary string into a base64-encoded string




``` Hack
namespace Nuxed\Crypto\Base64\UrlSafe;

function encode(
  string $src,
  bool $pad = true,
): string;
```




Base64 character set:
[A-Z]      [a-z]      [0-9]      -     _
0x41-0x5a, 0x61-0x7a, 0x30-0x39, 0x2d, 0x5f




## Parameters




+ ` string $src `
+ ` bool $pad = true `




## Returns




* ` string `