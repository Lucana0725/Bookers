class BooksController < ApplicationController
  def new
    # Bookモデルをもとにオブジェクトを作成、インスタンス変数として保持してviewで用いる
    # (= Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する)
    @book = Book.new
  end
  
  # createアクションの作成
  def create
    book = Book.new(book_params)
    book.save
    flash[:notice] = "Book was successfully created."
    # redirect_to '/books'  showを作ってないので一旦indexへ遷移させる
    redirect_to book_path(book.id)  # showを作ったのでshowへ遷移。
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメーター
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
