# Nuxed\\Crypto\\Symmetric\\Password\\stale()




Is this password hash stale ?




``` Hack
namespace Nuxed\Crypto\Symmetric\Password;

function stale(
  string $stored,
  \Nuxed\Crypto\Symmetric\Encryption\Secret $secret,
  \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE,
  string $additionalData = '',
): bool;
```




## Parameters




+ ` string $stored `
+ [` \Nuxed\Crypto\Symmetric\Encryption\Secret `](<class.Nuxed.Crypto.Symmetric.Encryption.Secret.md>)`` $secret ``
+ ` \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE `
+ ` string $additionalData = '' `




## Returns




* ` bool `