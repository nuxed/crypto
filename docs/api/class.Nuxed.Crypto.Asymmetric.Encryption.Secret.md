# Nuxed\\Crypto\\Asymmetric\\Encryption\\Secret




## Interface Synopsis




``` Hack
namespace Nuxed\Crypto\Asymmetric\Encryption;

abstract class Secret extends \Nuxed\Crypto\Asymmetric\Secret {...}
```




### Public Methods




+ [` ::generate(): (Secret\PrivateSecret, Secret\PublicSecret) `](<class.Nuxed.Crypto.Asymmetric.Encryption.Secret.generate.md>)
+ [` ::private(\Nuxed\Crypto\HiddenString $material): Secret\PrivateSecret `](<class.Nuxed.Crypto.Asymmetric.Encryption.Secret.private.md>)
+ [` ::public(\Nuxed\Crypto\HiddenString $material): Secret\PublicSecret `](<class.Nuxed.Crypto.Asymmetric.Encryption.Secret.public.md>)
+ [` ::shared(Secret\PrivateSecret $private, Secret\PublicSecret $public): \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.Asymmetric.Encryption.Secret.shared.md>)\
  Diffie-Hellman, ECDHE, etc