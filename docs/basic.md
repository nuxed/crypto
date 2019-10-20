# Basic Usage

## Error Handling

Unless stated otherwise, any time invalid data is encountered (an attacker tampered with the ciphertext, you have the wrong decryption secret, etc.), an Exception will be thrown. If you catch one, you should log the incident and fail closed (i.e. terminate the script gracefully) rather than proceeding as if nothing happened.

For authentication functions, typically `false` will be returned.

## Encryption

Encryption functions expect your message to be encapsulated in an instance of the `HiddenString` class. Decryption functions will return the decrypted plaintext in a `HiddenString` object.

## Symmetric Encryption

First, you'll need is an encryption secret. The easiest way to obtain one is to generate it:

```hack
use namespace Nuxed\Crypto\Symmetric;

<<__EntryPoint>>
async function main(): Awaitable<void> {
  $secret = Symmetric\Encryption\Secret::generate();
}
```

This generates a strong random secret. If you'd like to reuse it, you can simply export it into a file.

```hack
use namespace Nuxed\Crypto\Symmetric;
use namespace HH\Lib\Experimental\File;

<<__EntryPoint>>
async function main(): Awaitable<void> {
  $secret = Symmetric\Encryption\Secret::generate();
  
  await using ($file = File\open_write_only('/path/to/encryption.key')) {
    await $file->writeAsync($secret->export()->toString());
  }
}
```

Later, you can load it like so:

```hack
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Symmetric;
use namespace HH\Lib\Experimental\File;

<<__EntryPoint>>
async function main(): Awaitable<void> {
  await using ($file = File\open_read_only('/path/to/encryption.key')) {
    $secret = Symmetric\Encryption\Secret::import(
      new Crypto\HiddenString(
        await $file->readAsync();
      )
    );
  }
}
```

---

*Encryption* should be rather straightforward:

```hack
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Symmetric;

<<__EntryPoint>>
async function main(): Awaitable<void> {
  $secret = Symmetric\Encryption\Secret::generate();

  $plaintext = new Crypto\HiddenString('Hello, World!');
  $ciphertext = Symmetric\Encryption\encrypt($plaintext, $secret);
}
```

The inverse operation, decryption is congruent:

```hack
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Symmetric;

<<__EntryPoint>>
async function main(): Awaitable<void> {
  $secret = Symmetric\Encryption\Secret::generate();

  $plaintext = new Crypto\HiddenString('Hello, World!');
  $ciphertext = Symmetric\Encryption\encrypt($plaintext, $secret);
  $message = Symmetric\Encryption\decrypt($ciphertext, $secret);

  echo $message->toString(); // Hello, World!
}
```

## Authenticated Asymmetric Encryption (Encrypting)

This API facilitates message encryption between to participants in a conversation. It requires your private secret and your partner's public secret.

Assuming you are Alice, you would generate your secret-pair like so. (The other person, Bob, will do the same on his end.)

```hack
use namespace Nuxed\Crypto\Hex;
use namespace Nuxed\Crypto\Asymmetric\Encryption;

<<__EntryPoint>>
async function alice(): Awaitable<void> {
  // Generate a public + private signature secrets.
  list(
    $alicePrivateSecret,
    $alicePublicSecret, 
  ) = Encryption\Secret::generate();

  // hex-encode the public secret to send to bob.
  $sendToBob = Hex\encode($alicePublicSecret->toString());
}
```

Alice will then load Bob's public secret into the appropriate object like so:

```hack
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Hex;
use namespace Nuxed\Crypto\Asymmetric\Encryption;

<<__EntryPoint>>
async function alice(): Awaitable<void> {
  ...

  // retrieve bob's public secret ( assuming its hex encoded )
  $recievedFromBob = ...;
  // load bob's public secret into the appropriate object
  $bobPublicSecret = Encryption\Secret::public(
    new Crypto\HiddenString(
      Hex\decode($recievedFromBob)
    )
  );
}
```

---

*Encrypting* a message from Alice to send to Bob:

```hack
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Hex;
use namespace Nuxed\Crypto\Asymmetric\Encryption;

<<__EntryPoint>>
async function alice(): Awaitable<void> {
  ...

  $message = new Crypt\HiddenString('Hello Bob, This is Alice!');
  // encrypt the message to send to bob.
  $ciphertext = Hex\encode(Encryption\encrypt(
    $message,
    $alicePrivateSecret,
    $bobPublicSecret
  ));
}
```

*Decrypting* a message that Alice received from Bob:

```hack
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Hex;
use namespace Nuxed\Crypto\Asymmetric\Encryption;

<<__EntryPoint>>
async function alice(): Awaitable<void> {
  ...
  
  // retrieve the ciphertext send by bob ( assuming its hex encoded )
  $ciphertextFromBob = ...;
  $message = Encrpyiton\decrypt(
    Hex\decode($ciphertextFromBob),
    $alicePrivateSecret,
    $bobPublicSecret
  );
}
```

## Anonymous Asymmetric Encryption (Sealing)

A sealing interface is one where you encrypt a message with a public secret, such that only the person corresponding private secret can decrypt it.

If you wish to seal information, you only need one secret-pair rather than two.

```hack
use namespace Nuxed\Crypto\Asymmetric\Encryption;

<<__EntryPoint>>
async function main(): Awaitable<void>
{
  list($privateSecret, $publicSecret) = Encryption\Secret::generate();
}
```

Note: you want to only keep `$publicSecret` stored outside of the trusted environment.

---

*Encrypting* an anonymous message:

```hack
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Asymmetric\Encryption;

<<__EntryPoint>>
async function main(): Awaitable<void>
{
  ...

  $message = new Crypto\HiddenString('Hello, World!');
  $sealed = Encryption\seal($message, $publicSecret);
}
```

*Decrypting* an anonymous message:

```hack
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Asymmetric\Encryption;

<<__EntryPoint>>
async function main(): Awaitable<void>
{
  ...

  $opened = Encryption\unseal($sealed, $privateSecret);
}
```

## Authentication

### Symmetric Authentication

Symmetric authentication is useful if you'd like to authenticate, but not encrypt, some information that you transfer over a network or share with your end users.

First, you will need an appropriate secret. The easiest way to get one is to simply generate one randomly then store it for reuse (similar to private-secret encryption above):

```hack
use namespace Nuxed\Crypto\Symmetric\Authentication;

<<__EntryPoint>>
async function main(): Awaitable<void>
{
  $secret = Authentication\Secret::generate();
}
```

---

*Authenticating* a message:

```hack
use namespace Nuxed\Crypto\Symmetric\Authentication;

<<__EntryPoint>>
async function main(): Awaitable<void>
{
  ...

  // MAC stands for Message Authentication Code
  $mac = Authentication\authenticate('Hello, World!', $secret);
}
```

*Verifying* a message, given the message and a message authentication code:

```hack
use namespace Nuxed\Crypto\Symmetric\Authentication;

<<__EntryPoint>>
async function main(): Awaitable<void>
{
  ...

  $valid = Authentication\verify('Hello, World!', $mac, $secret);
  if ($valid) {
    // Success!
  }
}
```

### Asymmetric Authentication (Digital Signatures)

As with anonymous asymmetric encryption, you only need one secret-pair and you only give out your public secret.

```
use namespace Nuxed\Crypto\Asymmetric\Authentication;

<<__EntryPoint>>
async function main(): Awaitable<void>
{
  list($privateSecret, $publicSecret) = Authentication\SignatureSecret::generate();
}
```

---

*Signing* a message with a secret key:

```
use namespace Nuxed\Crypto\Asymmetric\Authentication;

<<__EntryPoint>>
async function main(): Awaitable<void>
{
  ...

  $message = 'Hello, World';
  $signature = Authentication\sign($message, $privateSecret);
}
```

*Verifying* the signature of a message with its corresponding public key:

```
use namespace Nuxed\Crypto\Asymmetric\Authentication;

<<__EntryPoint>>
async function main(): Awaitable<void>
{
  ...

  $message = 'Hello, World';
  $valid = Authentication\verify($message, $signature, $publicSecret);
  if ($valid) {
    // Success!
  }
}
```
