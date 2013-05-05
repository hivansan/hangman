# == Schema Information
#
# Table name: words
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  word       :string(255)
#

class Word < ActiveRecord::Base
  attr_accessible :word
  
  def self.random_word
    Word.find(rand(Word.count) + 1).word.upcase
  end
end
