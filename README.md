## Программа "Фильм на вечер" (Ruby)

Консольная программа для выбора фильма на вечер.

**Поддерживается 2 функции выбора фильмов:**
1. Из текстовых файлов в папке ```/data/``` (встроенная видеотека) 
2. С сайта "wikipedia" с помощью гема ```nokogiri``` и модуля ```OpenURI```

При выборе одной из функций программа выведет список режиссеров.
Далее Вы указываете порядковый номер понравившегося режиссера и 
программа выведет в консоли название фильма.

### Для запуска программы:
1. Скачайте все файлы из репозитория или склонируйте его на свой ПК
2. Откройте терминал
3. Перейдите в папку прокета (с помощью команды **cd**)
```
cd ~/which_film_watch/
```
4. Находясь в корневой папке прокета установите зависимости с помощью команды:
```
bundle install
```
5. Запустите программу:
```
bundle exec ruby main.rb
```
*Автор приложения: Кузеленков Андрей (в рамках прохождения интенсива "Хороший программист")*