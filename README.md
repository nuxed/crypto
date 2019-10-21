<p align="center"><img src="https://avatars3.githubusercontent.com/u/45311177?s=200&v=4"></p>

<p align="center">
<a href="https://travis-ci.org/nuxed/crypto"><img src="https://travis-ci.org/nuxed/crypto.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/nuxed/crypto"><img src="https://poser.pugx.org/nuxed/crypto/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/nuxed/crypto"><img src="https://poser.pugx.org/nuxed/crypto/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/nuxed/crypto"><img src="https://poser.pugx.org/nuxed/crypto/license.svg" alt="License"></a>
</p>

# Nuxed Crypto
 
## High Level Cryptoghraphy interface built in top of libsodium

Nuxed Crypto a high-level cryptography interface that relies on libsodium for all of its underlying cryptography operations, inspired by [`Halite`](https://github.com/paragonie/halite).

### Important

Although this library has developed with care, it has not been examined by security experts, there will always be a chance that we overlooked something. Please ask your favourite trusted hackers to hammer it for implementation errors and bugs before even thinking about deploying it in production.

### Installation

This package can be installed with [Composer](https://getcomposer.org).

```console
$ composer require nuxed/crypto
```

### Documentation

Documentation for Nuxed Crypto can be found in this repository under the [docs](docs/README.md) folder.

### Example

```hack
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Symmetric;
use namespace HH\Lib\Experimental\File;

<<__EntryPoint>>
async function main(): void {
  // generate a key :
  $key = Symmetric\Encryption\Key::generate();
  
  // or load a stored encryption key :
  await using ($file = File\open_read_only('/path/to/encryption.key')) {
    $key = Symmetric\Encryption\Key::import(
      new Crypto\HiddenString(
        await $file->readAsync()
      )
    );
  }

  $message = new Crypto\HiddenString('Hello, World!');
  $ciphertext = Symmetric\Encryption\encrypt($message, $key);
  $plaintext = Symmetric\Encryption\decrypt($ciphertext, $key);

  print $plaintext->toString(); // Hello, World!
}
```

---

### Security

For information on reporting security vulnerabilities in Nuxed Crypto, see [SECURITY.md](SECURITY.md).

---

### License

The Nuxed Crypto library is open-sourced software licensed under the MIT-licensed.
