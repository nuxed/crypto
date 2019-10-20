# Nuxed\\Crypto\\Password\\hash()




Hash the given password, and return hash string




``` Hack
namespace Nuxed\Crypto\Password;

function hash(
  \Nuxed\Crypto\HiddenString $password,
  \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE,
): string;
```




## Parameters




+ [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)`` $password ``
+ ` \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE `




## Returns




* ` string `