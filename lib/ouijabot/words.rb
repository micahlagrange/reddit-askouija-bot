require 'ouijabot/post'

module OuijaBot

  Goodbye = Struct.new(:name, :word).new('Goodbye', 'Goodbye.')

  class Word
    def initialize(word)
      @word = word
      @resolved = false
    end

    def resolved?
      @resolved
    end

    def last_letter
      @word[-1]
    end

    def next_letter
      Goodbye if resolved?

      case last_letter
      when 'd'
        'i'
      when 'i'
        'g'
      when 'g'
        resolve
      end
    end

    def resolve
      @resolved = true
      Goodbye
    end
  end

  module Words
    def self.words_in_post(post:)
      post.words.map{|word| Word.new(word)}
    end
  end
end

