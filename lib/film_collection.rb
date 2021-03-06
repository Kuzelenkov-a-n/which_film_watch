class FilmCollection
  attr_reader :film_collection

  class << self
    def from_dir(dir_path)
      film_files = Dir[File.join(dir_path, '*.txt')]
      film_collection = film_files.map do |film|
        film = File.readlines(film, chomp: true)
        Film.new(film[0], film[1], film[2])
      end

      new(film_collection)
    end

    def from_wiki(url)
      page = Nokogiri::HTML(URI.open(url) { |f| f.read })
      film_collection =
        page.css('.standard tbody tr:nth-last-child(-n+250)').map do |node|
          title = node.css('td:nth-child(2)').text
          producer = node.css('td:nth-child(4)').text
          year = node.css('td:nth-child(3)').text
          Film.new(title, producer, year)
        end

      new(film_collection)
    end
  end

  def initialize(film_collection)
    @film_collection = film_collection
  end

  def producers
    @film_collection.map(&:producer).uniq
  end

  def film_by_producer(chosen_producer)
    @film_collection.select { |film| film.producer == chosen_producer }.sample
  end
end
