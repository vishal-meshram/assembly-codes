#include <stdio.h>
#include <stdlib.h>

int main()
{
	int iNo;
	int iCounter;

	printf("Enter the number: ");
	scanf("%d",&iNo);

	iCounter = 0;
	while(iCounter<iNo)
	{
		printf("%d\n",iCounter);
		iCounter++;
	}
	exit(0);
}

