# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

def print_progress(index, total)

  progress = 'Progress ['

  if total % index == 0
    percentage = (index) * 100 / total
    progress << "=" * percentage
    print "\r"
    print progress + " #{percentage} %"
    $stdout.flush
  end
end

def copy_quotes
  values = CSV.read("#{Rails.root}/db/quotes.csv" , { headers: true, col_sep: ';', header_converters: :symbol })
  total = (values.count / 100.0).ceil * 100

  puts "Copying #{values.count} quotes to database"

  values.each_with_index do |val, index|
    genre = Genre.where(genre_type: (val[:genre] ||= 'general').downcase.strip).first_or_create
    author = Author.where(name: val[:author].strip).first_or_create
    Quote.where(quote: val[:quote].strip, author: author, genre: genre).first_or_create
    print_progress(index + 1, total)
  end
end

copy_quotes