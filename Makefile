main:  pas_lex.o
	gcc -o scanner.exe pas_lex.o


pas_lex.o: pas_lex.c
	gcc -c pas_lex.c

pas_lex.c: pas_lex.l
	flex -o pas_lex.c pas_lex.l

	
clean:
	del *.o pas_lex.c scanner.exe

# hidden rules
.c:	.l
	flex -o$< $@
