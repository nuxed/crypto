# Nuxed\\Crypto\\Base32\\encode_upper()




Convert a binary string into a base32-encoded string without cache-timing
leaks, returning uppercase letters (as per RFC 4648)




``` Hack
namespace Nuxed\Crypto\Base32;

function encode_upper(
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