class WordsController < ApplicationController
  # GET /words
  # GET /words.xml
  def index
    @words = Word.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /words/1
  def show
    @word = Word.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @word }
    end
  end

  # GET /words/new
  def new
    @word = Word.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /words/1/edit
  def edit
    @word = Word.find(params[:id])
  end

  # POST /words
  def create
    @word = Word.new(params[:word])

    respond_to do |format|
      if @word.save
        format.html { redirect_to( words_url , :notice => 'Word was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /words/1
  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        format.html { redirect_to(@word, :notice => 'Word was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /words/1
  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    respond_to do |format|
      format.html { redirect_to(words_url) }
    end
  end
end
