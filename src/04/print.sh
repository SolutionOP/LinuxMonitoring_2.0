#!/bin/bash

counterOfFiles=1
day=$(date +%d)

for ((; counterOfFiles < 6; counterOfFiles++ )); do
    countOfStrings=$(shuf -i 100-1000 -n1)
    for (( i = 0; i < countOfStrings; i++ )); do
        echo -n "$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1)" >> $counterOfFiles.log
        echo -n " - - " >> $counterOfFiles.log
        echo -n "[$day$(date +/%b/%Y:$(shuf -n1 -i 1-23):$(shuf -n1 -i 1-59):$(shuf -n1 -i 1-59)) +0000] " >> $counterOfFiles.log
        echo -n "\"$(shuf -n1 methods) " >> $counterOfFiles.log
        echo -n "$(shuf -n1 uri) " >> $counterOfFiles.log
        echo -n "$(shuf -n1 protocol)\" " >> $counterOfFiles.log
        echo -n "$(shuf -n1 codes) " >> $counterOfFiles.log
        echo -n $RANDOM >> $counterOfFiles.log
        echo -n " \"-\" " >> $counterOfFiles.log
        echo "\"$(shuf -n1 agent)\"" >> $counterOfFiles.log
    done
    let day=day-1
done

# 200 - Успешно
# 201 - Создано
# 400 - Плохой запрос
# 401 - Неавторизированно
# 403 - Запрещено
# 404 - Не найден
# 500 - Внутренняя ошибка сервера
# 501 - Не выполненно
# 502 - Плохой шлюз
# 503 - Сервис недоступен