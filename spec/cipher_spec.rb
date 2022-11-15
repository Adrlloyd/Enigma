require 'date'
require './lib/cipher'


RSpec.describe Cipher do
  let(:enigma) {Enigma.new}
  let(:today) {Date.today.strftime("%m%d%y")}

  describe '#rand_keys' do
    it 'creates a string of 5 random keys(digits)' do
     expect(enigma.rand_keys).to be_a String
     expect(enigma.rand_keys.length).to eq 5
    end
  end

  describe '#today' do
    it 'generates todays date' do
      expect(enigma.today.length).to eq 6
      expect(enigma.today).to eq (Date.today.strftime("%d%m%y"))
    end
  end

  describe '#characters' do
    it 'creates the array of characters with the added space' do
      expect(enigma.characters.count).to eq 27
      expect(enigma.characters.class).to eq Array
      expect(enigma.characters[1]).to eq "b"
      expect(enigma.characters[26]).to eq " "
    end
  end
end