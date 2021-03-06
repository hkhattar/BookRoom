class BooksController < ApplicationController
  def new
  end


  def show
  	@book = Book.find(params[:id])
  	@user = User.find(session[:user_id])
  	@comments = Comment.where(book_id:params[:id])
  end

  def index
  	@books = Book.all
  	render 'index'
  end

  def create
  		puts '**********'
  	puts params[:book][:title]
  	@book = Book.create(title: params[:book][:title], author: params[:book][:author], description: params[:book][:description],category: params[:book][:category], user_id: params[:user_id])
  	
  
  	if params[:book][:shelf] == 'Already read'
  	@read = Read.create(user_id: session[:user_id],book_id: @book.id)
  	elsif params[:book][:shelf] == 'Interested in reading'
  	@interested = Interested.create(user_id: session[:user_id],book_id: @book.id)
  	elsif params[:book][:shelf] = 'Currently reading'
  	@current = Current.create(user_id: session[:user_id],book_id: @book.id)
    end

    redirect_to '/books'

  end


end
