# Nuxed\\Crypto\\Symmetric\\Password\\verify()




verify a password




``` Hack
namespace Nuxed\Crypto\Symmetric\Password;

function verify(
  \Nuxed\Crypto\HiddenString $password,
  string $stored,
  \Nuxed\Crypto\Symmetric\Encryption\Secret $secret,
  string $additionalData = '',
): bool;
```




## Parameters




+ [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)`` $password ``
+ ` string $stored `
+ [` \Nuxed\Crypto\Symmetric\Encryption\Secret `](<class.Nuxed.Crypto.Symmetric.Encryption.Secret.md>)`` $secret ``
+ ` string $additionalData = '' `




## Returns




* ` bool `