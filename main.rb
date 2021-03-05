require_relative 'lib/film'
require_relative 'lib/film_collection'

films = FilmCollection.from_dir("#{__dir__}/data")

puts 'Программа "Фильм на вечер"'
puts

films.producers.each.with_index(1) { |producer, number|
  puts "#{number}. #{producer}"}
puts "Фильм какого режиссера вы хотите сегодня посмотреть?"

answer = gets.chomp.to_i
puts
until (1..films.producers.size).include?(answer)
  puts "Введите номер ответа и нажмите Ввод"
  puts
  answer = gets.chomp.to_i
  puts
end

chosen_producer = films.producers[answer - 1]

puts "И сегодня вечером рекомендую посмотреть:"
puts films.film_by_producer(chosen_producer)
