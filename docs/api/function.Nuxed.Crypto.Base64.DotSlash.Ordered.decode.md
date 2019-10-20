# Nuxed\\Crypto\\Base64\\DotSlash\\Ordered\\decode()




Decode a base64-encoded string into raw binary




``` Hack
namespace Nuxed\Crypto\Base64\DotSlash\Ordered;

function decode(
  string $src,
  bool $strictPadding = false,
): string;
```




Base64 character set:
[.-9]      [A-Z]      [a-z]
0x2e-0x39, 0x41-0x5a, 0x61-0x7a




## Parameters




+ ` string $src `
+ ` bool $strictPadding = false `




## Returns




* ` string `