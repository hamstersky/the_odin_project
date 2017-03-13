require 'spec_helper'
require 'caesar_cipher'

describe ".caesar_cipher" do
  context "empty string" do
    context "given '' and key of 1" do
      it "returns '' " do
        expect(caesar_cipher('', 1)).to eql('')
      end
    end
  end

  context "one word" do
    context "given 'world' and key of 1" do
      it "returns 'xpsme'" do
        expect(caesar_cipher('world', 1)).to eql('xpsme')
      end
    end
      context "given 'world' and key of 4" do
        it "returns 'asvph'" do
          expect(caesar_cipher('world', 4)).to eql('asvph')
        end
      end

    context "multiple words and non-word characters" do
      context "given 'hello world!' and key of 1" do
        it "returns 'ifmmp xpsme!'" do
          expect(caesar_cipher('hello world!', 1)).to eql('ifmmp xpsme!')
        end
      end

      context "given 'hello world!' and key of 4" do
        it "returns 'lipps xpsme!'" do
          expect(caesar_cipher('hello world!', 4)).to eql('lipps asvph!')
        end
      end
    end
end
