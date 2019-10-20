# Nuxed\\Crypto\\Base32\\Hex\\encode_upper()




Encode into uppercase Base32 (RFC 4648)




``` Hack
namespace Nuxed\Crypto\Base32\Hex;

function encode_upper(
  string $src,
  bool $strictPadding = false,
): string;
```




Base32 character set:
[0-9]      [A-V]
0x30-0x39, 0x41-0x56




## Parameters




+ ` string $src `
+ ` bool $strictPadding = false `




## Returns




* ` string `