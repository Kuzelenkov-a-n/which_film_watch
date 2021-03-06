require_relative 'lib/film'
require_relative 'lib/film_collection'
require 'nokogiri'
require 'open-uri'

url = "https://ru.wikipedia.org/wiki/250_%D0%BB%D1%83%D1%87%"\
  "D1%88%D0%B8%D1%85_%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D0%BE%D0"\
  "%B2_%D0%BF%D0%BE_%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8_IMDb"

dir_path = "#{__dir__}/data/"

puts <<~GREETING
  Программа "Фильм на вечер"

  Выберете вариант поиска:
   [1] => С сайта ru.wikipedia.org
   [2] => Из встроенной видеотеки.txt
GREETING

choice = STDIN.gets.chomp.to_i

films = if choice == 1
          FilmCollection.from_wiki(url)
        else
          FilmCollection.from_dir(dir_path)
        end

films.producers.each.with_index(1) { |producer, number| puts "#{number}. #{producer}" }
puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'

answer = gets.chomp.to_i
puts

until (1..films.producers.size).include?(answer)
  puts 'Введите номер ответа и нажмите Ввод'
  puts
  answer = gets.chomp.to_i
  puts
end

chosen_producer = films.producers[answer - 1]

puts 'И сегодня вечером рекомендую посмотреть:'
puts films.film_by_producer(chosen_producer)
