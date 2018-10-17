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
  end

end
