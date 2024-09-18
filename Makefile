OBJS1 := *.o
OBJECT := ${wildcard *.c}
OBJECT_2 := ${wildcard *.o}
OBJECT_3 := ${patsubst %.c, %.o,${OBJECT}}

all1:
	@echo "OBJS=${OBJS1}"
	@echo "OBJECT_3=${OBJECT_3}"

all :
	@echo "OBJS1=${OBJS1}"
	@echo "OBJECT=${OBJECT}"
	@echo "OBJECT_2=${OBJECT_2}"

cs : ${OBJECT_3}
	gcc -o run ${OBJECT_3}

var = test
test :
	@echo ${var}
OBJS = hello.o word.o
run : $(OBJS)
	$(CC) -o run $(OBJS)
hello.o : hello.c word.h
	$(CC) -c -o hello.o hello.c
word.o : word.c word.h
	$(CC) -c -o word.o word.c
.PHONY: clean
clean :
	rm ${OBJS1} run
