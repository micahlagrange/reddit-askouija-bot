require 'ouijabot/words'
require 'ouijabot/post'

FAKEWORDS = %w(have you ever dig di d heard the tragedy of darth plageous the wise?)

describe OuijaBot::Words do
  subject { described_class }

  describe '.words_in_post' do 
    it 'returns a Word array' do
      post = OuijaBot::Post.new(FAKEWORDS)
      expect(subject.words_in_post(post: post)).to all ( be_a( OuijaBot::Word ) )
    end
  end

end
describe OuijaBot::Word do

  subject { OuijaBot::Word.new('bob') }

  describe '#next_letter' do
    it 'predicts what the next letter should be' do
      word = OuijaBot::Word.new('d')
      expect(word.next_letter).to match 'i'
      word = OuijaBot::Word.new('di')
      expect(word.next_letter).to match 'g'
      word = OuijaBot::Word.new('dig')
      expect(word.next_letter).to match OuijaBot::Goodbye
    end
  end

  describe '#last_letter' do
    it 'responds to #last_letter' do
      expect(subject.last_letter).to be_a String
    end
  end

end

