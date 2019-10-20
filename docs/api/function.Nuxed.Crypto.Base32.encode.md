# Nuxed\\Crypto\\Base32\\encode()




Convert a binary string into a base32-encoded string without cache-timing
leaks (as per RFC 4648)




``` Hack
namespace Nuxed\Crypto\Base32;

function encode(
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