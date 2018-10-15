require 'openssl'

module Rsa::Tools
  class Generator
    
    # call this function if you just want to save it to your database & send string to others
    def self.key_pairs
      private_key, public_key = generate_pairs
      return private_key.to_s, public_key.to_s
    end

    # call this function if pem files were wanted
    def self.pem_pairs(pub_path = nil, pri_path = nil)
      private_key, public_key = generate_pairs
      open 'keys/private_key.pem', 'w' do |io| io.write private_key.to_pem end
      open 'keys/public_key.pem',  'w' do |io| io.write public_key.to_pem  end
    end

    private
      def self.generate_pairs
        pri_key = OpenSSL::PKey::RSA.new(2048)
        return pri_key, pri_key.public_key
      end
  end
end