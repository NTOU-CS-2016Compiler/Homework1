#Homework 1#
### Due date: 2016-04-08 ###

----------

- Use lex or flex to implement a lexical analyzer to parse a C source code.  

	Given a correct C source codes, your program must be able to output tokens found in the source code. The tokens you have to process include:	
	1. Reserved words: For example, if, else, for. The complete list of reserved words may be found [here](https://msdn.microsoft.com/en-us/library/befeaky0.aspx). You only need to handle standard C reserved words (keywords). You don't need to handle other platform specific extensions. Also you don't need to handle preprocess directives like #include and #define. Please output reserved words **in uppercase**, e.g., IF, ELSE, and FOR.
	2. Operators: For example, + and -. You may find the list of operators from here and here. Please enclose an identified operator **with brackets**, e.g., [+], [-], and [*].
	3. Identifiers: A C identifier starts with a non-digit character from a set containing { _, a-z, A-Z}, and then followed by zero or more digits or characters { _, 0-9, a-z, A-Z}. Suppose you have found an identifier xyz, please output it **with a prefix "ID"**. For example, ID:xyz. 
	4. Numbers: For simplicity, we do not separate the process for integer and real numbers. You can simply output a number with a prefix "NUM". For example, NUM:123. 
	5. Strings: For simplicity, we treat texts quoted with either single-quotes (') or double-quotes (") as a string literal. But you cannot mix them together, i.e., you cannot start a string with a single-quote but terminate it with a double-quote, and vice-versa. It would be better if your program can handle the escape character (\), which treats a followed single-quote or double-quote symbol as a regular character. When your program outputs a string, **add a prefix "STR"** before the string. For example, STR:string-literal.

-  Test Input:

1) test1.c:

    #include <stdio.h>
    int main() {
    	printf("Hello, World\n");
    	return(0);
    }

2) test2.c:

    #include <stdio.h>
    int factorial(int n) {
    	if(n <= 1)
   	 	return(1);
    	return(n*factorial(n-1));
    }
    int main() {
    	printf("factorial = %d \n", factorial(10));
    	return(0);
    }

3) test3.c:

    #include <stdio.h>
    int main() {
    	int a, b, n;
    	a = 1;
    	b = 1;
    	n = 13;
    	printf("a = %d \n",a);
    	printf("b = %d \n",b);
    	while(n > 0) {
    		int c;
    		c = a + b;
    		printf("c = %d \n",c);
    		a = b;
    		b = c;
    		n = n-1;
    	}
    	return(0);
    }

- How to Test Your Code:

	Suppose the executable you generated is hw1.exe, you can feed the sample input into your program and check if your output is correct.

	`$ cat input-source-code | ./hw1`

	Alternatively, you may use input redirection symbol (<) to pass an input file to your program.

	`$ ./hw1 < input-source-code`
