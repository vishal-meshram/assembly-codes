#include <stdio.h>
#include <stdlib.h>

struct demo
{
	char 	  chChar;
	int  	  iNo;
	short int shiNo;
} obj1 = {'A',10,20};

int main()
{
	struct demo obj2 = {'B', 30, 40};

	printf("Obj 1:\n");
	printf("chChar=%c\tiNo=%d\tshiNo=%hd\t\n\n",obj1.chChar,obj1.iNo,obj1.shiNo);

	printf("Obj 2:\n");
	printf("chChar=%c\tiNo=%d\tshiNo=%hd\t\n\n",obj2.chChar,obj2.iNo,obj2.shiNo);
	
	exit(0);
}

