require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    
    expect(enigma).to be_a Enigma
  end

  describe '#encrypt' do
    let(:enigma) {Enigma.new}
    let(:the_date) {Date.today.strftime("%m%d%y")}

    it 'encrypts a message' do
      enigma = enigma.encrypt("hello world", "02715", "040895")

      expect(enigma).to be_a Hash
      # expect(enigma[:message]).to eq "keder ohulw"
      expect(enigma[:key]).to eq "02715"
      expect(enigma[:date]).to eq "040895"
    end

    it 'allows the user to only input the key' do
      enigma = enigma.encrypt("hello world", "02715")

      # expect(enigma[:message]).to eq "keder ohulw"
      expect(enigma[:key]).to eq "02715"
      expect(enigma[:date]).to eq the_date
    end

    it 'allows the user to not input the key or date' do
      enigma = enigma.encrypt("hello world")

      # expect(enigma[:message]).to eq "keder ohulw"
      expect(enigma[:key].count).to eq 5
      expect(enigma[:date]).to eq the_date
    end
  end
end