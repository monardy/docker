Этот Контейнер собирался специально для кластера и marathon + mesos.
Что бы собрался кластер нужно запускать контейнеры последовательно.
Кластер собирается только с FQDN именем.
ЕСЛИ ПО КАКОЙ ТО ПРИЧИНЕ КЛАСТЕР НЕ СОБРАЛСЯ, А КОНТЕЙНЕРЫ РАБОТАЮТ ПО ОТДЕЛЬНОСТИ. ПОТУШИТЕ ОДИН КОНТЕЙНЕР И УДАЛИТЕ ЕГО ДАННЫЕ ИЗ КАТАЛОГА С БАЗОЙ.

git: https://github.com/monardy/docker/tree/master/oel7_rabbitmq

docker run -d \
--name=rabbitmq-1.test \
--hostname=rabbitmq-1.test.marathon.mesos.it.ru \
--privileged \
-p "4369:4369" \
-p "5672:5672" \
-p "15672:15672" \
-p "44001:44001" \
-v "/media/data/envs/test/rabbitmq1/:/media/data/rabbitmq/" \
-e "VM_MEMORY_HIGT_WATERMARK=200" \
-e "RABBITMQ_ERLANG_COOKIE=HBHYHBGJBBBJBYHBBK" \
-e "RABBITMQ_CLUSTER=rabbit@rabbitmq-1.test.marathon.mesos.it.ru rabbit@rabbitmq-2.test.marathon.mesos.it.ru" \
-e "LOGIN=root" \
-e "PASS=root" \
-e "DISC_FREE_LIMIT=2000" \
-e "PASS=root" \
sergeyxx12xx/rabbitmq:1 sh /run.sh
