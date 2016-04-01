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
