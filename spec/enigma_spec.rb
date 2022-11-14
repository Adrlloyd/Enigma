require 'date'
require './lib/enigma'


RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    
    expect(enigma).to be_a Enigma
  end

  describe '#encrypt' do
    let(:enigma) {Enigma.new}
    let(:today) {Date.today.strftime("%m%d%y")}

    it 'encrypts a message' do
      input = enigma.encrypt("hello world", "02715", "040895")
      
      expect(input).to be_a Hash
      expect(input[:encryption]).to eq "keder ohulw"
      expect(input[:key]).to eq "02715"
      expect(input[:date]).to eq "040895"
    end

    it 'allows the user to only input the key' do
      allow(enigma).to receive(:today).and_return("040895")
      input = enigma.encrypt("hello world", "02715")

      expect(input[:encryption]).to eq "keder ohulw"
      expect(input[:key]).to eq "02715"
      expect(input[:date]).to eq "040895"
    end

    it 'allows the user to not input the key or date' do
      allow(enigma).to receive(:rand_keys).and_return("02715")
      allow(enigma).to receive(:today).and_return("040895")
      input = enigma.encrypt("hello world")

      expect(input[:encryption]).to eq "keder ohulw"
      expect(input[:key].length).to eq 5
      expect(input[:date]).to eq "040895"
    end
    
    it 'converts the message to lower case' do
      allow(enigma).to receive(:today).and_return("040895")
      input1 = enigma.encrypt("HELLO WORLD", "02715", "040895")

      expect(input1[:encryption]).to eq "keder ohulw"
    end
  end

  describe '#decrypt' do
    let(:enigma) {Enigma.new}
    let(:today) {Date.today.strftime("%m%d%y")}

    it 'decrypts a message' do
      input = enigma.decrypt("keder ohulw", "02715", "040895")

      expect(input).to be_a Hash
      # expect(input[:decryption]).to eq "hello world"
      expect(input[:key]).to eq "02715"
      expect(input[:date]).to eq "040895"
    end

    it 'allows the user to only input the key' do
      allow(enigma).to receive(:today).and_return("040895")
      input = enigma.decrypt("keder ohulw", "02715")
      
      # expect(input[:decryption]).to eq "hello world"
      expect(input[:key]).to eq "02715"
      expect(input[:date]).to eq "040895"
    end

    it 'converts the message to lower case' do
      input1 = enigma.decrypt("HELLO WORLD", "02715", "040895")

      expect(input1[:decryption]).to eq "hello world"
    end
  end
end