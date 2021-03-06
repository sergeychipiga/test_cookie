Функционал: Механизм cookies в браузере Chrome
    Для того чтобы протестировать работу механизма cookies в браузере Chrome
    Как любопытный исследователь
    Я хочу запустить несколько тестов и убедиться, что они работают

    Предыстория: Посетим страничку, отдающую куку
        Когда я открываю страницу, отдающую куку

    Сценарий: Установка cookie
        Тогда в браузере устанавливается кука

    Сценарий: Обновление cookie
        Когда я открываю страницу, изменяющую куку
        Тогда в браузере будет измененная кука

    Сценарий: Удаление cookie по имени
        Когда я удаляю куку по имени
        Тогда в браузере не остается куки

    Сценарий: Удаление всех cookies
        Когда я удаляю все куки браузера
        Тогда в браузере не остается куки

    Сценарий: Установка несколько cookies
        Когда я открываю страницу, отдающую другую куку
        Тогда в браузере будет "2" куки

    Сценарий: Истечение cookie
        Когда я открываю страницу, отдающую истекающую куку
        И я жду, пока кука истечет
        И я отправляю запрос на страницу, отдающую список полученных кук
        Тогда я не получу ни одной куки в ответ

    Сценарий: Автоудаление cookie после закрытия бразуера
        Когда я закрываю браузер
        И я открываю браузер заново
        Тогда в браузере не остается кук

    Сценарий: Секурная кука
        Когда я открываю страницу, отдающую секурную куку
        Тогда в браузере не будет секурной куки, т.к. протокол незащищенный

    Сценарий: Распространение cookie на все страницы хоста
        Тогда эта кука будет передаваться другим страницам хоста

    Сценарий: Cookie c определенным адресом передается по этому адресу
        Когда я открываю страницу, отдающую куку с определенным адресом
        Тогда эта кука будет передаваться по этому адресу

    Сценарий: Cookie co определенным адресом не передается другим адресам
        Когда я открываю страницу, отдающую куку с определенным адресом
        Тогда эта кука не будет передаваться другим страницам

    Сценарий: Cookie для чужого домена не будет передаваться своему домену
        Когда я открываю страницу, отдающую куку для чужого домена
        Тогда эта кука не будет передаваться своему домену

    Сценарий: Cookie для чужого домена не будет передаваться чужому домену
        """
        Оказывается спецификация домена в куки работает только в рамках
        сабдоменов основного домена. Но нельзя передавать куки от одного
        домена в другой - запрещено браузером в целях безопасности.
        Можно было бы организовать тестирование и для сабдоменов, но это
        скорее всего нужно заморачиваться изменением /etc/hosts, поэтому
        пока оставим это дело.
        """
        Когда я открываю страницу, отдающую куку для чужого домена
        Тогда эта кука не будет передаваться чужому домену

    Сценарий: Сохранение в cookie utf-8 символов
        """
        Вот это стало для меня сюрпризом, т.к. оказалось, что передаваемые
        flask'ом utf-8 символы в куке хранятся не в utf-8 формате. Поэтому
        будем считать этот тест проваленным до выяснения такого поведения.
        """
        Когда я открываю страницу, отдающую куку в виде utf-8 символов
        Тогда в браузере будет кука содержащая utf-8 символы

    Сценарий: Передача в cookie пустой строки
        Когда я открываю страницу, передающую в куке пустые строки
        Тогда в браузере будет пустая кука

    Сценарий: Переполнение длины cookie
        """
        В этом тесте валится сервер при попытке передать куку длиной
        в 1000000 символов. Попытка же установки такой длинной куки
        через веб-драйвер привела к тому, что отвалился веб-драйвер и
        дальнейшие тесты уже не проходили. Поэтому оставим пока так.
        """
        Когда я открываю страницу, отдающую куку ОГРОМНОЙ длины
        Тогда у меня отваливается сервер :)

    Сценарий: Переполнение количества cookies
        """
        При передаче большого количества сookies (500 шт.) Chrome
        не сохраняет более 163 cookies. Хотя весьма вероятно это
        определяется настройками выделенной под cookies памяти
        """
        Когда я устанавливаю МНОГО кук
        Тогда количество кук в браузере ограничено
