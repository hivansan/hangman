class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @current_word = @game.current_word
  end

  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(params[:game])
    @game.word = Word.random_word
    @game.status = "In Progress"
    @game.guesses = ""
    @game.save
    redirect_to @game
  end

  def update
    @game = Game.find(params[:id])
    
    # si las letras no son mayores a 1
    unless params[:game][:guesses].length > 1
      cur_params = params[:game]
      
      
      # los intentos no incluyen la letra
      unless @game.guesses.include? cur_params[:guesses].to_s.upcase
        temp_guess = @game.guesses.to_s + cur_params[:guesses].to_s.upcase
        @game.update_attributes(:guesses => temp_guess)
        
        # la palabra no incluye la letra
        unless @game.word.split(//).include? cur_params[:guesses].to_s.upcase
          misses = @game.misses.to_i
          misses += 1
          @game.update_attributes(:misses => misses)
        end
      else
        flash[:notice] = 'You\'ve already tried that!'  
      end
      
      
      # hello".split(//)   => ["h", "e", "l", "l", "o"]
      # var win contiene las letras que ha adivinado
      win = @game.word.split(//).collect do |c|
        c if @game.guesses.include? c
      end

      @game.update_attributes(:status => 'Won!') if win.join.match @game.word
      @game.update_attributes(:status => 'Lose!') if @game.misses.to_i >= (10/@game.difficulty)
    else
      flash[:notice] = 'Only 1 letter at a time!'
    end

    redirect_to(@game)
  end
end
