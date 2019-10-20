# Nuxed\\Crypto\\Symmetric\\Password\\hash()




Hash then encrypt a password




``` Hack
namespace Nuxed\Crypto\Symmetric\Password;

function hash(
  \Nuxed\Crypto\HiddenString $password,
  \Nuxed\Crypto\Symmetric\Encryption\Secret $secret,
  \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE,
  string $additionalData = '',
): string;
```




## Parameters




+ [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)`` $password ``
+ [` \Nuxed\Crypto\Symmetric\Encryption\Secret `](<class.Nuxed.Crypto.Symmetric.Encryption.Secret.md>)`` $secret ``
+ ` \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE `
+ ` string $additionalData = '' `




## Returns




* ` string `