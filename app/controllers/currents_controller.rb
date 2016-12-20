class CurrentsController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def create
  	current = Current.create(user: current_user, book_id: params[:book_id])

    read = Read.where(user_id: current_user.id, book_id:params[:book_id])[0]
    if read
      read.destroy
    end

    interested = Interested.where(user_id: current_user.id, book_id:params[:book_id])[0]
    if interested
      interested.destroy
    end
    redirect_to '/books'

  end

  def destroy
  	User.delete(params[:id])
  end
end
