

Тестовый стенд построен с помощью утилиты docker-compose. Он включает в себя 5 docker-контейнеров.

2 контейнера это приложения по тестовому заданию:
 - хранение тарифов и балансов пользователей (services:wk-backend).
 - кеширования балансов пользователей с отправкой сообщений состояние кеша для пользователей (services:balance-cache).

3 контейнера вспомогательных, для работы разрабатываемых приложений:
 - CouchbaseServer (services:couchbase)
 - RabbitMQ (services:rabbitmq)
 - MySQL (services:mysql)

Запуск стенда осуществляется, на хосте с установленным docker и docker-compose, командой:

`docker-compose up -d`

Команда запускается в одной директории с файлом `docker-compose.yml`. 
Для работы сервисов должны присутствовать директории `./mysql` и `./couchbase/data` 

Всё взаимодействие контейнеров происходит внутри docker.

Для оценки и управления службами контейнеров осуществлен проброс портов на хостовую машину.

#services:wk-backend

REST API для получения данных из services:mysql в формате xml и json.
 
`http://localhost:8080/users/xml`
`http://localhost:8080/users/json`

#services:balance-cache

REST API для  listener-rabbitmq, получает состояние кеша всех пользователей, баланс которых составляет < K.

`http://localhost/users/limit`

#services:mysql

User: root Password: password

`http://localhost:3307/`

#services:rabbitmq

Админка для RabbitMQ / User: guest Password: guest

`http://localhost:8888/`

#services:couchbase

Админка для CouchbaseServer / User: Administrator Password: password
 - bucket: default
 - index: CREATE PRIMARY INDEX `default_primary_index` ON `default` USING View

`http://localhost:8091/`

#Особенности приложения при запуске в docker-среде

При тестировании приложения в docker-среде, после перезапуска контейнеров происходит долгая инициализация bucket couchbase.
На хостовой машине, локально таких проблем не наблюдалось. Установить точную причину такого поведения не удалось.
Могу только предположить, что это как то связано с тем, что  bucket монтируется через volumes.
Нужно дождаться пока bucket перейдет из состояние pending и желательно перезапустить контейнер services:balance-cache.

`docker-compose restart balance-cache`