#include <stdio.h>
#include <stdlib.h>

void fun(int* piNo);

int main()
{
	int iNo=10;
	
	printf("before calling fun(): iNo = %d\n",iNo);

	fun(&iNo);
  
	printf("after calling fun(): iNo = %d\n",iNo);

	exit(0);
}

void fun(int* piNo)
{

	printf("fun(): before increment iNo = %d\n",*piNo);

	(*piNo)++;
  
	printf("fun(): after increment iNo = %d\n",*piNo);
	
}
