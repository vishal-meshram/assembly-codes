#include <stdio.h>
#include <stdlib.h>

void fun(int iNo);

int main()
{
	int iNo = 10;
	printf("Before calling fun(): iNo = %d\n",iNo);
	
	fun(iNo);

	printf("After calling fun(): iNo = %d\n",iNo);

	exit(0);
}

void fun(int iNo)
{
	printf(" in fun():before increment: %d\n",iNo);
	iNo = iNo + 1;
	printf(" in fun():after increment: %d\n",iNo);
}
	

