#include <stdio.h>
#include <stdlib.h>

void fun1();
void fun2();

int main()
{
	int iCounter;
	
	printf("Calling fun1:\n");
	for(iCounter=0; iCounter < 3; iCounter++)
		fun1();

	printf("Calling fun2:\n");
	for(iCounter=0; iCounter < 3; iCounter++)
		fun2();

	exit(0);
}

void fun1()
{
	int iNo=10;
	
	iNo++;
	printf("in fun1(): iNo = %d\n",iNo);
}

void fun2()
{
	static int iNo=10;

	iNo++;
	printf("in fun2(): iNo=%d\n",iNo);
}	
	
