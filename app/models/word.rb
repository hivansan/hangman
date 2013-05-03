class Word < ActiveRecord::Base
  attr_accessible :word
  
  def self.random_word
    Word.find(rand(Word.count) + 1).word.upcase
  end
end
