# Nuxed\\Crypto\\Asymmetric\\Encryption\\Secret::shared()




Diffie-Hellman, ECDHE, etc




``` Hack
final public static function shared(
  Nuxed\Crypto\Asymmetric\Encryption\Secret\PrivateSecret $private,
  Nuxed\Crypto\Asymmetric\Encryption\Secret\PublicSecret $public,
): Nuxed\Crypto\HiddenString;
```




Get a shared secret from a private key you possess and a public key for
the intended message recipient




## Parameters




+ [` Nuxed\Crypto\Asymmetric\Encryption\Secret\PrivateSecret `](<class.Nuxed.Crypto.Asymmetric.Encryption.Secret.PrivateSecret.md>)`` $private ``
+ [` Nuxed\Crypto\Asymmetric\Encryption\Secret\PublicSecret `](<class.Nuxed.Crypto.Asymmetric.Encryption.Secret.PublicSecret.md>)`` $public ``




## Returns




* [` Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)