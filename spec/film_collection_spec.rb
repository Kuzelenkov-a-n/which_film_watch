require 'nokogiri'
require 'open-uri'
require 'film_collection'
require 'film'

describe FilmCollection do
  let(:collection_from_fixtures) { FilmCollection.from_dir("#{__dir__}/fixtures") }
  let(:collection_from_wiki) { FilmCollection.from_wiki("#{__dir__}/fixtures/wiki_films.html") }
  let(:test_films) do
    [
      Film.new('Терминатор 2: Судный день', 'Джеймс Кэмерон', '1991'),
      Film.new('Пятый элемент', 'Люк Бессон', '1997'),
      Film.new('Армагеддон', 'Майкл Бэй', '1998')
    ]
  end

  let(:test_collection) { FilmCollection.new(test_films) }

  describe '.new' do
    it 'returns films titles array' do
      expect(test_collection.film_collection.map(&:title))
        .to match_array ['Терминатор 2: Судный день', 'Пятый элемент', 'Армагеддон']
    end
  end

  describe '.from_dir' do
    it 'returns correctly readed files' do
      expect(collection_from_fixtures.film_collection.map(&:title))
        .to contain_exactly('Терминатор 2: Судный день', 'Пятый элемент', 'Армагеддон')
    end
  end

  describe '.from_wiki' do
    it 'returns correctly parsed html' do
      expect(collection_from_wiki.film_collection.map(&:title))
        .to contain_exactly("Крёстный отец", "Крёстный отец 2", "Побег из Шоушенка")
    end
  end

  describe '#producers' do
    it 'returns 3 producers without repeats' do
      expect(test_collection.producers)
        .to match_array ['Джеймс Кэмерон', 'Люк Бессон', 'Майкл Бэй']
    end
  end

  describe '#film_by_producer' do
    it 'returns film by producer converted into string' do
      expect(test_collection.film_by_producer('Джеймс Кэмерон').to_s)
        .to eq 'Джеймс Кэмерон - Терминатор 2: Судный день (1991)'
    end
  end
end
