# encoding: UTF-8

describe 'NumberHelper' do

  include NumberHelper

  describe '#number_to_currency' do

    context 'using default values' do

      it 'correctly formats an integer' do
        number = number_to_currency(10)
        expect(number).to eq('$10.00')
      end

      it 'correctly formats a float' do
        number = number_to_currency(10.75)
        expect(number).to eq('$10.70')
      end

      it 'correctly formats a string' do
        number = number_to_currency('10.4')
        expect(number).to eq('$10.40')
      end

      it 'uses delimiters for very large numbers' do
        number = number_to_currency(104452)
        expect(number).to include(',')
      end

      it 'does not have delimiters for small numbers' do
        number = number_to_currency(14)
        expect(number).to_not include(',')
      end

    end

    context 'using custom options' do

      it 'allows changing the :unit' do
        number = number_to_currency(15747, :unit => 'MAD')
        expect(number).to include('MAD')
      end

      it 'allows changing the :precision' do
        number = number_to_currency(10.4570, :precision => 3)
        expect(number).to eq('$10.450')
      end

      it 'omits the separator if :precision is 0' do
        number = number_to_currency(1078, :precision => 0)
        expect(number).to_not include('.')
      end

      it 'allows changing the :delimiter' do
        number = number_to_currency(2477, :delimiter => '-')
        expect(number).to eq('$2-477.00')
      end

      it 'allows changing the :separator' do
        number = number_to_currency(10, :separator => '_')
        expect(number).to eq('$10_00')
      end

      it 'correctly formats using multiple options' do
        number = number_to_currency(
          1540,
          :unit => 'MAD',
          :precision => 0,
          :delimiter => '-'
        )
        expect(number).to eq('MAD1-540')
      end

    end

  end

end