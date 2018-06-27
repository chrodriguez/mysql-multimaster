# Mysql multi master

## Prueba con dos nodos

* Verificar no hay volumenes usándose:

```
docker volume ls | grep 'db-0'
```

* Iniciar los nodos:

```
docker-compose up
```

## Prueba con tres nodos

* Verificar no hay volumenes usándose:

```
docker volume ls | grep 'db-0'
```

* Iniciar los nodos:

```
docker-compose -f docker-compose-three-masters.yml up
```

## Verificar funcionamiento

### Con una dos nodos

```
for i in $(seq 1 2); do \
  docker-compose exec db-0$i \
    mysql -prootpass -e "show slave status \G"; done

```

### Con tres nodos

```
for i in $(seq 1 3); do \
  docker-compose -f docker-compose-three-masters.yml exec db-0$i \
    mysql -prootpass -e "show slave status \G"; done
```

Puede además crearse una base de datos en cualquier nodo y verificar se replica

# TODO

* Arreglar infra de tres nodos. No funciona el startup porque hay tuplas que se
  repiten de tablas de mysql
* Leer y analizar https://www.percona.com/blog/2011/01/12/conflict-avoidance-with-auto_increment_incremen-and-auto_increment_offset/
