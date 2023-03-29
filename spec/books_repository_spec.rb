require 'book_repository'

RSpec.describe BookRepository do
  
  def reset_books_table
    seed_sql = File.read('spec/seeds_book.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_books_table
  end
  
  it 'returns two books' do
    repo = BookRepository.new

    books = repo.all

    expect(books.length).to eq  2
    expect(books[0].id).to eq '1'
    expect(books[0].title).to eq 'Emma'
    expect(books[0].author_name).to eq 'Jane Austin'

    expect(books[1].id).to eq '2'
    expect(books[1].title).to eq 'Dracula'
    expect(books[1].author_name).to eq 'Bram Stoker'
  end
end