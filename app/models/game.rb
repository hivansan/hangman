# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  word       :string(255)
#  guesses    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#  misses     :integer          default(0), not null
#  status     :string(255)
#

class Game < ActiveRecord::Base
  attr_accessible :word, :guesses, :name, :status, :misses
  
  def finished?
    if status == 'Won!' || status == 'Lose!'
      true
    end
  end

  #return word with guesses filled in
  def current_word
    #for each char in the word, either fill it in if its guessed or replace with '_'
    my_word = ""
    word.each_char do |c|
      if guesses.include? c
        my_word << c
      else
      my_word << "_"
      end
    end
    my_word

  end
end
