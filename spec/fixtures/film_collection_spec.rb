require 'rspec'
require 'film_collection'
require 'film'

describe FilmCollection do

  describe '#self.from_dir' do
    it 'Is object kind of FilmCollection?' do
      films = FilmCollection.from_dir('/Users/andrey/rails_garnet2021/rubytut2/lesson31/which_film_watch/data')
      films.kind_of?(FilmCollection)
    end
  end

  describe '#producers' do
    it 'returns string like: "Марк Диппе"' do
      films = FilmCollection.from_dir('/Users/andrey/rails_garnet2021/rubytut2/lesson31/which_film_watch/data')
      expect(films.producers[0]).to eq 'Марк Диппе'
    end

    it 'Is all 21 films into array?' do
      films = FilmCollection.from_dir('/Users/andrey/rails_garnet2021/rubytut2/lesson31/which_film_watch/data')
      expect(films.producers).to eq ["Марк Диппе", "Джеймс Кэмерон", "Майкл Бэй", "Жерар Кравчик", "Стивен Херек",
                                     "Роберт Земекис", "Люк Бессон", "Роберт Родригес", "Роланд Эммерих", "Джон Бруно",
                                     "Тед Котчефф", "Мартин Кэмпбелл", "Брайан Де Пальма", "Пол Верховен", "Джон Ву",
                                     "Ридли Скотт", "Джейми Юйс", "Чак Рассел", "Айвен Райтман", "Джей Джей Абрамс"]

    end
  end

  describe '#film_by_producer' do
    it 'returns string like: "Джеймс Кэмерон - Терминатор 2: Судный день (1991)"' do
      films = FilmCollection.from_dir('/Users/andrey/rails_garnet2021/rubytut2/lesson31/which_film_watch/data')
      expect(films.film_by_producer('Джеймс Кэмерон').to_s).to eq 'Джеймс Кэмерон - Терминатор 2: '\
                                                                                 'Судный день (1991)'
    end
  end

end
