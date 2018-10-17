require "base64"

module Rsa::Tools
  class Utility

    #  我们是服务端的时候验证别人的请求的时候用这个方法
    def self.verify(public_key, data, original_data)
      key = OpenSSL::PKey::RSA.new(public_key)
      key.verify(OpenSSL::Digest::SHA256.new, Base64.decode64(data), Digest::MD5.hexdigest(original_data.force_encoding("utf-8")))
    end

    # 三方要求我们私钥加签的时候调用这方法签名
    def self.sign(private_key, data)
      key = OpenSSL::PKey::RSA.new(private_key)
      sign = key.sign(OpenSSL::Digest::SHA256.new, Digest::MD5.hexdigest(data.force_encoding("utf-8")))
      Base64.strict_encode64(sign)
    end

    def self.encrypt(private_key, data)
      key = OpenSSL::PKey::RSA.new(private_key)
      return Base64.strict_encode64(key.private_encrypt(data))
    end

    def self.decrypt(public_key, encrypted)
      key = OpenSSL::PKey::RSA.new(public_key)
      return key.public_decrypt(Base64.decode64(encrypted))
    end


    def self.pub_encrypt(public_key, data)
      key = OpenSSL::PKey::RSA.new(public_key)
      return Base64.strict_encode64(key.public_encrypt(data))
    end

    def self.pri_decrypt(private_key, encrypted)
      key = OpenSSL::PKey::RSA.new(private_key)
      return key.private_decrypt(Base64.decode64(encrypted))
    end
  end
end
