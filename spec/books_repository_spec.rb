require 'book_repository'

RSpec.describe BookRepository do
  it 'returns two books' do
    repo = BookRepository.new

    books = repo.all

    books.length # =>  2

    books[0].id # =>  1
    books[0].name # =>  'David'
    books[0].cohort_name # =>  'April 2022'

    books[1].id # =>  2
    books[1].name # =>  'Anna'
    books[1].cohort_name # =>  'May
  end
end