# Nuxed\\Crypto\\Asymmetric\\Encryption\\Key




## Interface Synopsis




``` Hack
namespace Nuxed\Crypto\Asymmetric\Encryption;

abstract class Key extends \Nuxed\Crypto\Asymmetric\Key {...}
```




### Public Methods




+ [` ::generate(): (Key\PrivateKey, Key\PublicKey) `](<class.Nuxed.Crypto.Asymmetric.Encryption.Key.generate.md>)
+ [` ::private(\Nuxed\Crypto\HiddenString $material): Key\PrivateKey `](<class.Nuxed.Crypto.Asymmetric.Encryption.Key.private.md>)
+ [` ::public(\Nuxed\Crypto\HiddenString $material): Key\PublicKey `](<class.Nuxed.Crypto.Asymmetric.Encryption.Key.public.md>)
+ [` ::shared(Key\PrivateKey $private, Key\PublicKey $public): \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.Asymmetric.Encryption.Key.shared.md>)\
  Diffie-Hellman, ECDHE, etc