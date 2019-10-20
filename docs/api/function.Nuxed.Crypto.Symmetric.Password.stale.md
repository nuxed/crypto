# Nuxed\\Crypto\\Symmetric\\Password\\stale()




Is this password hash stale ?




``` Hack
namespace Nuxed\Crypto\Symmetric\Password;

function stale(
  string $stored,
  \Nuxed\Crypto\Symmetric\Encryption\Key $key,
  \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE,
): bool;
```




## Parameters




+ ` string $stored `
+ [` \Nuxed\Crypto\Symmetric\Encryption\Key `](<class.Nuxed.Crypto.Symmetric.Encryption.Key.md>)`` $key ``
+ ` \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE `




## Returns




* ` bool `