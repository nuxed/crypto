# Nuxed\\Crypto\\Asymmetric\\Authentication\\Key\\SignaturePrivateKey




## Interface Synopsis




``` Hack
namespace Nuxed\Crypto\Asymmetric\Authentication\Key;

final class SignaturePrivateKey extends \Nuxed\Crypto\Asymmetric\Authentication\SignatureKey {...}
```




### Public Methods




+ [` ->__construct(\Nuxed\Crypto\HiddenString $material) `](<class.Nuxed.Crypto.Asymmetric.Authentication.Key.SignaturePrivateKey.__construct.md>)
+ [` ->derivePublicKey(): SignaturePublicKey `](<class.Nuxed.Crypto.Asymmetric.Authentication.Key.SignaturePrivateKey.derivePublicKey.md>)\
  See the appropriate derived class
+ [` ->toEncryptionKey(): \Nuxed\Crypto\Asymmetric\Encryption\Key\PrivateKey `](<class.Nuxed.Crypto.Asymmetric.Authentication.Key.SignaturePrivateKey.toEncryptionKey.md>)\
  Get an encryption private key from a signing private key