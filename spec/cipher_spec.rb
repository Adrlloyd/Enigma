require './lib/cipher'
require './lib/enigma'

RSpec.describe Cipher do
  describe '#rand_keys' do
    it 'creates a string of 5 random keys(didgits)' do
     # expect(rand_keys.count).to eq 5
    end
  end

  describe '#the_date' do
    it 'generates todays date' do
      # expect(the_date.count).to eq 6
    end
  end

  describe '#characters' do
    it 'creates the array of characters with the added space' do
      # expect(characters.count).to eq 27
      # expect(characters.class).to eq Array
      # expect(characters[1]).to eq "a"
    end
  end
end