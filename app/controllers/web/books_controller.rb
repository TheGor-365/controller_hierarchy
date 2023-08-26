module Web
  class BooksController < ApplicationController
    def index
      @books = Book.all
    end
  end
end
