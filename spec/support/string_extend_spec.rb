describe 'String' do

  describe '#titleize' do

    it 'capitalizes each word in a string' do
      string = String.new('hello World')
      expect(string.titleize).to eq('Hello World')
    end
    
    it 'works with single-word strings' do
      expect('a'.titleize).to eq('A')
    end
    
    it 'capitalizes all uppercase strings' do
      expect('HELLO'.titleize).to eq('Hello')
    end
    
    it 'capitalizes mixed-case strings' do
      expect('HeLlo WOrld'.titleize).to eq('Hello World')
    end
    
  end

  describe '#blank?' do

    it 'returns true if string is empty' do
      expect(''.blank?).to be true
    end

    it 'returns true if string contains only spaces' do
      expect('   '.blank?).to be true
    end

    it 'returns true if string contains only tabs' do
      # Get a tab using a double-quoted string with \t
      # example: '\t\t\t'
      expect("\t\t\t".blank?).to be true
    end

    it 'returns true if string contains only spaces and tabs' do
      expect("  \t  \t".blank?).to be true
    end
    
    it 'returns false if string contains a letter' do
      expect('h'.blank?).to be false
    end

    it 'returns false if string contains a number' do
      expect('1'.blank?).to be false
    end
    
  end
  
end
