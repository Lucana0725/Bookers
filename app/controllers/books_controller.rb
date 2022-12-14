class BooksController < ApplicationController
  # indexとnewを同一ページ上に表示するにあたってnewのviewは表示しない(index上で表示されるため)し、
  # @book = Book.new もindexアクション内で実行するため、newアクション自体が不要になった。
  
  # def new
  #   # Bookモデルをもとにオブジェクトを作成、インスタンス変数として保持してviewで用いる
  #   # (= Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する)
  #   @book = Book.new
  # end
  
  # createアクションの作成
  def create
    # validation実装時は条件分岐でエラー文を表示させる際、renderで別のアクションを実行するため、@をつけないとrender先のviewで表示できなくなる。
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      # redirect_to '/books'  showを作ってないので一旦indexへ遷移させる
      redirect_to book_path(@book.id)  # showを作ったのでshowへ遷移。
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
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
