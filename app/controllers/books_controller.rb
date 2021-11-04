class BooksController < ApplicationController
  def new
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id

      if @book.save
      redirect_to book_path(@book.id),notice: 'You have created book successfully.'
      else
        @user=current_user
        @books=Book.all
      render :index
      end
  end

  def index
    @book=Book.new
    @user=current_user
    @books=Book.all
  end

  def show
     @book = Book.find(params[:id])
     @user=@book.user
     @book_new=Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end

  def edit
     
     @book = Book.find(params[:id])
          if @book.user == current_user
            render "edit"
          else
            redirect_to books_path
          end
      
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    redirect_to book_path(book.id),notice: 'You have created book successfully.'
    else
       @book=book
    render :edit
    end
  end

   private
  def book_params

    params.require(:book).permit(:title, :body)
  end
end
