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

  def self.key_pairs
    return Generator.key_pairs
  end

  def self.pem_pairs(pub_path = nil, pri_path = nil)
    return Generator.pem_pairs(pub_path, pri_path)
  end
end
