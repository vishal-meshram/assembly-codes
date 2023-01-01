#include <stdio.h>
#include <stdlib.h>

int main()
{
	int iNo;
	int iCounter;
	
	printf("Enter Number: ");
	scanf("%d",&iNo);

	iCounter = 0;

	do
	{
		printf("%d\n",iCounter);
		iCounter++;	
	}while(iCounter < iNo);

	exit(0);
}
