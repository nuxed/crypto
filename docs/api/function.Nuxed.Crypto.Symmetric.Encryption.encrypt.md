# Nuxed\\Crypto\\Symmetric\\Encryption\\encrypt()




Encrypt a message




``` Hack
namespace Nuxed\Crypto\Symmetric\Encryption;

function encrypt(
  \Nuxed\Crypto\HiddenString $plaintext,
  Key $key,
  string $additionalData = '',
): string;
```




(Encrypt then MAC -- xsalsa20 then keyed-Blake2b)
You don't need to worry about chosen-ciphertext attacks.




## Parameters




+ [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)`` $plaintext ``
+ ` Key $key `
+ ` string $additionalData = '' `




## Returns




* ` string `