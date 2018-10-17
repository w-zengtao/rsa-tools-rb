RSpec.describe Rsa::Tools do
  context "When use Generator tools" do
    before {
      @private_key, @public_key = Rsa::Tools.key_pairs
      @data = "origin data"
    }

    it "Should not be empty" do
      expect(@public_key).not_to be nil
      expect(@private_key).not_to be nil
      expect(@private_key.length).to be > @public_key.length
    end

    it "Should sign and verify as expected" do
      signature = Rsa::Tools.sign(@private_key, @data)
      expect(signature.length).to be 344
      result = Rsa::Tools.verify(@public_key, signature, @data)
      expect(result).to be true
    end

    it "To B" do 
      encrypted = Rsa::Tools.pub_encrypt(@public_key, @data)
      expect(Rsa::Tools.pri_decrypt(@private_key, encrypted)).to eq @data
    end

    it "To C" do
      encrypted = Rsa::Tools.encrypt(@private_key, @data)
      expect(Rsa::Tools.decrypt(@private_key, encrypted)).to eq @data
    end
  end

end
