require 'rspec'
require 'film'

describe Film do

  describe '#new' do
    it 'assigns instance variables' do
      film = Film.new('Терминатор 2: Судный день', 'Джеймс Кэмерон', 1991)
      expect(film.title).to eq 'Терминатор 2: Судный день'
      expect(film.producer).to eq 'Джеймс Кэмерон'
      expect(film.year).to eq 1991
    end
  end

  describe '#def to_s' do

    it 'string like: "producer - title (year)"' do
      film = Film.new('Терминатор 2: Судный день', 'Джеймс Кэмерон', 1991)
      expect(film.to_s).to eq 'Джеймс Кэмерон - Терминатор 2: Судный день (1991)'
    end
  end

end
