# Nuxed\\Crypto\\Asymmetric\\Authentication\\SignatureSecret




## Interface Synopsis




``` Hack
namespace Nuxed\Crypto\Asymmetric\Authentication;

abstract class SignatureSecret extends \Nuxed\Crypto\Asymmetric\Secret {...}
```




### Public Methods




+ [` ::generate(): (Secret\SignaturePrivateSecret, Secret\SignaturePublicSecret) `](<class.Nuxed.Crypto.Asymmetric.Authentication.SignatureSecret.generate.md>)
+ [` ::private(\Nuxed\Crypto\HiddenString $material): Secret\SignaturePrivateSecret `](<class.Nuxed.Crypto.Asymmetric.Authentication.SignatureSecret.private.md>)
+ [` ::public(\Nuxed\Crypto\HiddenString $material): Secret\SignaturePublicSecret `](<class.Nuxed.Crypto.Asymmetric.Authentication.SignatureSecret.public.md>)