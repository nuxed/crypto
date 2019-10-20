# Nuxed\\Crypto\\Symmetric\\Password\\hash()




Hash then encrypt a password




``` Hack
namespace Nuxed\Crypto\Symmetric\Password;

function hash(
  \Nuxed\Crypto\HiddenString $password,
  \Nuxed\Crypto\Symmetric\Encryption\Key $key,
  \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE,
): string;
```




## Parameters




+ [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)`` $password ``
+ [` \Nuxed\Crypto\Symmetric\Encryption\Key `](<class.Nuxed.Crypto.Symmetric.Encryption.Key.md>)`` $key ``
+ ` \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE `




## Returns




* ` string `