class FilmCollection
  attr_reader :films
  # создали все объекты класса фильм коллекции класса фильм
  def self.from_dir(dir_path)
    film_files = Dir[File.join(dir_path, '*.txt')]
    films = film_files.map do |film|
      film = File.readlines(film, chomp: true)
      film = Film.new(film[0], film[1], film[2])
    end

    new(films)
  end

  def initialize(films)
    @films = films

  end

  def producers
    @films.map(&:producer).uniq
  end

  def film_by_producer(chosen_producer)
    @films.select { |film| film.producer == chosen_producer }.sample
  end
end
