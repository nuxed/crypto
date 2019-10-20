# Nuxed\\Crypto\\Base32\\Hex\\encode()




Encode into Base32 (RFC 4648)




``` Hack
namespace Nuxed\Crypto\Base32\Hex;

function encode(
  string $src,
  bool $strictPadding = false,
): string;
```




Base32 character set:
[0-9]      [a-v]
0x30-0x39, 0x61-0x76




## Parameters




+ ` string $src `
+ ` bool $strictPadding = false `




## Returns




* ` string `