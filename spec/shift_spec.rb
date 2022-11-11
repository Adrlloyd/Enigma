require './lib/cipher'
require './lib/shift'

RSpec.describe Shift do
  it 'exists' do
    shift = Shift.new
    
    expect(shift).to be_a Shift
  end
  
  describe '#the_keys' do
    let(:shift) {Shift.new}
        
    it 'splits the random number into pairs' do
      input = shift.the_keys
      
      expect(input[:A].length).to eq 2
      # expect(input[:A]).to eq "02"
      # expect(input[:B]).to eq "27"
      # expect(input[:C]).to eq "71"
      # expect(input[:D]).to eq "15"
      expect(input[:E]).to eq nil
      expect(input).to be_a Hash
    end
  end

  describe '#the_offset' do
    let(:shift) {Shift.new}
       
    it 'creates the offset amount for each key' do
      input = shift.the_offset
  
      expect(input[:A].length).to eq 1
      expect(input[:A]).to eq "8"
      # expect(input[:B]).to eq "8"
      # expect(input[:C]).to eq "8"
      # expect(input[:D]).to eq "4"
      expect(input[:E]).to eq nil
      expect(input).to be_a Hash
    end
  end
end