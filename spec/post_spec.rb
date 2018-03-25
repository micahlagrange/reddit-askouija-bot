require 'ouijabot/post'

FAKEWORDS2 = %w(have you ever dig di d heard the tragedy of darth plageous the wise?)

describe OuijaBot::Post do

  subject { OuijaBot::Post.new(FAKEWORDS2) }

  describe '.find_target_word' do
    target = /^[dD](i?)(g?)$/
    it 'returns the target word if it exists in a post' do
      expect(subject.find_target_word(target)).to all(match(target))
      expect(subject.find_target_word(target).last).to match 'd'
      expect(subject.find_target_word(target).first).to match 'dig'
    end
  end

end

