require "rsa/tools/version"
require "rsa/tools/utility"
require "rsa/tools/generator"

module Rsa::Tools
  # 验签 & 用对方的公钥验签
  def self.verify(public_key, data, original_data)
    Utility.verify(public_key, data, original_data)
  end

  # 签名 & 用自己私钥签名 & RSAWithSha256 的签名
  def self.sign(private_key, data)
    Utility.sign(private_key, data)
  end
  
  # TO C的业务 & 私钥加密 公钥解密
  def self.encrypt(private_key, data)
    Utility.encrypt(private_key, data)
  end

  def self.decrypt(public_key, encrypted)
    Utility.decrypt(public_key, encrypted)
  end

  # TO B的业务 & 公钥加密 私钥解密
  def self.pub_encrypt(public_key, data)
    Utility.pub_encrypt(public_key, data)
  end

  def self.pri_decrypt(private_key, encrypted)
    Utility.pri_decrypt(private_key, encrypted)
  end

  def self.key_pairs
    return Generator.key_pairs
  end

  def self.pem_pairs(pub_path = nil, pri_path = nil)
    return Generator.pem_pairs(pub_path, pri_path)
  end
end
