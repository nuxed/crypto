# Nuxed\\Crypto\\Base64\\DotSlash\\encode()




Convert a binary string into a base64-encoded string




``` Hack
namespace Nuxed\Crypto\Base64\DotSlash;

function encode(
  string $src,
  bool $pad = true,
): string;
```




Base64 character set:
./         [A-Z]      [a-z]     [0-9]
0x2e-0x2f, 0x41-0x5a, 0x61-0x7a, 0x30-0x39




## Parameters




+ ` string $src `
+ ` bool $pad = true `




## Returns




* ` string `