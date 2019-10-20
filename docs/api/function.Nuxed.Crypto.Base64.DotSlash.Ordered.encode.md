# Nuxed\\Crypto\\Base64\\DotSlash\\Ordered\\encode()




Convert a binary string into a base64-encoded string




``` Hack
namespace Nuxed\Crypto\Base64\DotSlash\Ordered;

function encode(
  string $src,
  bool $pad = true,
): string;
```




Base64 character set:
[.-9]      [A-Z]      [a-z]
0x2e-0x39, 0x41-0x5a, 0x61-0x7a




## Parameters




+ ` string $src `
+ ` bool $pad = true `




## Returns




* ` string `