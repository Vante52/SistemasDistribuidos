CC = gcc
CFLAGS = -Wall -g -std=c99

all:servidor cliente

servidor:cliente.c
	$(CC) $(CFLAGS) -o servidor servidor.c

cliente:servidor.c
	$(CC) $(CFLAGS) -o cliente cliente.c -lpthread

clean:
	rm -f cliente servidor *.o

run-receptor: cliente
	./cliente -p pipe_solicitud -f db_file.txt -v
run-solicitud-file: servidor
	./servidor -p pipe_solicitud -i instrucciones.txt
run-solicitud-interactive: servidor
	./servidor .p pipe_solicitud

.PHONY: all clean run-receptor run-solicitud-file run-solicitud-interactive