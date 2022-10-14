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
    redirect_to '/books' # showを作ってないので一旦indexへ変遷させる
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
  

  private
  # ストロングパラメーター
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
