test_cookie
===========

BDD tests for cookies in Chrome Browser

В данном тестовом проекте реализованы BDD-сценарии для тестирования механизма cookies в браузере Chrome c применением фреймворков Selenium (webdriver) и Behave.
Тесты описаны на русском языке с использованием нотации формального языка Gherkin (features/cookies.feature).

системные требования:
* python 2.7.*;
* flask;
* behave;
* selenium;

желательно:
* установить pip, virtualenv
* создать виртуальное окружение
* установить пакеты в вирт.окружение

Тесты запускаются командой ./test_runner из командной строки.

Микрофреймворк flask используется в качестве серверного решения для генерации cookie.
Можно было бы устанавливать cookie на клиенте и парсить заголовки запроса, однако webdriver не поддерживает парсинг заголовков. Данной функциональностью обладает selenium remote controle. Но это уже устаревающая технология.

P.S. как это работает, можно посмотреть [здесь](http://youtu.be/1sK6EmBTXSQ)
