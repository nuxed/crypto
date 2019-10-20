# Nuxed\\Crypto\\Symmetric\\Encryption\\encrypt()




Encrypt a message using the Halite encryption protocol




``` Hack
namespace Nuxed\Crypto\Symmetric\Encryption;

function encrypt(
  \Nuxed\Crypto\HiddenString $plaintext,
  Secret $secret,
  string $additionalData = '',
): string;
```




(Encrypt then MAC -- xsalsa20 then keyed-Blake2b)
You don't need to worry about chosen-ciphertext attacks.




## Parameters




+ [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)`` $plaintext ``
+ ` Secret $secret `
+ ` string $additionalData = '' `




## Returns




* ` string `