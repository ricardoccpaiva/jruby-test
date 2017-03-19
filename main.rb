require 'jbundler'

java_import java.security.InvalidAlgorithmParameterException
java_import java.security.KeyPair
java_import java.security.NoSuchAlgorithmException
java_import java.security.NoSuchProviderException

keypair = Java::IoJsonwebtokenImplCrypto::EllipticCurveProvider.generateKeyPair(
  Java::IoJsonwebtoken::SignatureAlgorithm.forName(algorithm)
)

encoder = Java::JavaUtil::Base64.getEncoder
{
  public_key: encoder.encodeToString(keypair.getPublic.getEncoded),
  private_key: encoder.encodeToString(keypair.getPrivate.getEncoded)
}

puts encoder
