require './lib/cypher'
require './lib/shift'

RSpec.describe Shift do
  it 'exists' do
    shift = Shift.new
    
    expect(shift).to be_a Shift
  end
  
  describe '#the_keys' do
    let(:shift) {Shift.new}
        
    it 'splits the random number into pairs' do
      input = shift.the_keys("02715")
      
      expect(input[:A].length).to eq 2
      expect(input[:A]).to eq "02"
      expect(input[:B]).to eq "27"
      expect(input[:C]).to eq "71"
      expect(input[:D]).to eq "15"
      expect(input[:E]).to eq nil
      expect(input).to be_a Hash
    end
  end

  describe '#the_offset' do
    let(:shift) {Shift.new}
       
    it 'creates the offset amount for each key' do
      input = shift.the_offsets("040895")
      
      expect(input[:A].length).to eq 1
      # expect(input[:A]).to eq "1"
      # expect(input[:B]).to eq "0"
      # expect(input[:C]).to eq "2"
      # expect(input[:D]).to eq "5"
      expect(input[:E]).to eq nil
      expect(input).to be_a Hash
    end
  end

  describe '#shifts' do
    let(:shift) {Shift.new}

    xit 'caluclates the shift' do
      input = shift.the_shifts()

      expect(input[:A]).to eq 3
      expect(input[:B]).to eq 27
      expect(input[:C]).to eq 73
      expect(input[:D]).to eq 20
      expect(input[:E]).to eq nil
      expect(input).to be_a Hash
    end
  end
end