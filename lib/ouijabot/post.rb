module OuijaBot

  class Post
    def initialize(words)
      @words = words
    end

    def find_target_word(regex)
      @words.select{|word| word =~ regex}
    end

    def words
      @words
    end
  end

end
