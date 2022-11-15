require './lib/shift'

RSpec.describe Shift do
  it 'exists' do
    shift = Shift.new
    
    expect(shift).to be_a Shift
  end
  
  describe '#the_keys' do
    let(:shift) {Shift.new}
        
    it 'splits the key into pairs' do
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
    date = "040895"
       
    it 'creates the offset amount for each key' do
      input = shift.the_offsets("040895")
      input2 = date_squared = (date.to_i ** 2).to_s
      input3 = offset_amount = date_squared[-4..-1]

      expect(input2).to eq "1672401025"
      expect(input3).to eq "1025"

      expect(input[:A].length).to eq 1
      expect(input[:A]).to eq "1"
      expect(input[:B]).to eq "0"
      expect(input[:C]).to eq "2"
      expect(input[:D]).to eq "5"
      expect(input[:E]).to eq nil
      expect(input).to be_a Hash
    end
  end

  describe '#the_shifts' do
    let(:shift) {Shift.new}

    it 'caluclates the shift' do
      keys = shift.the_keys("02715")
      offsets = shift.the_offsets("040895")
      input = shift.the_shifts(keys, offsets)

      expect(input[:A]).to eq 3
      expect(input[:B]).to eq 27
      expect(input[:C]).to eq 73
      expect(input[:D]).to eq 20
      expect(input[:E]).to eq nil
      expect(input).to be_a Hash
    end
  end
end