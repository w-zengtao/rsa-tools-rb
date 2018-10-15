module Rsa::Tools
  class Utility

    #  我们是服务端的时候验证别人的请求的时候用这个方法
    def verify(public_key, data)
    end

    # 三方要求我们私钥加签的时候调用这方法签名
    def sign(private_key, data)
    end

    def test
      puts "abc"
    end
  end
end