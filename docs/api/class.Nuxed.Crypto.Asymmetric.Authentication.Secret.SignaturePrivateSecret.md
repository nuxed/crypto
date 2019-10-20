# Nuxed\\Crypto\\Asymmetric\\Authentication\\Secret\\SignaturePrivateSecret




## Interface Synopsis




``` Hack
namespace Nuxed\Crypto\Asymmetric\Authentication\Secret;

final class SignaturePrivateSecret extends \Nuxed\Crypto\Asymmetric\Authentication\SignatureSecret {...}
```




### Public Methods




+ [` ->__construct(\Nuxed\Crypto\HiddenString $material) `](<class.Nuxed.Crypto.Asymmetric.Authentication.Secret.SignaturePrivateSecret.__construct.md>)
+ [` ->derivePublicSecret(): SignaturePublicSecret `](<class.Nuxed.Crypto.Asymmetric.Authentication.Secret.SignaturePrivateSecret.derivePublicSecret.md>)\
  See the appropriate derived class
+ [` ->toEncryptionSecret(): \Nuxed\Crypto\Asymmetric\Encryption\Secret\PrivateSecret `](<class.Nuxed.Crypto.Asymmetric.Authentication.Secret.SignaturePrivateSecret.toEncryptionSecret.md>)\
  Get an encryption private secret from a signing private secret