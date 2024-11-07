main: main.o function.o 
	gcc -w -Wall -o main main.o function.o -lpthread -lm 


function.o: function.c aux.h
	gcc -w -Wall -c function.c -o function.o -lpthread -lm 

main.o: main.c aux.h
	gcc -w -Wall -c main.c -o main.o -lpthread -lm 

clean:
	rm -rf *.o main
