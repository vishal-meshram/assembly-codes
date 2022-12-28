#include <stdio.h>
#include <stdlib.h>

int main()
{
	int iNo;
	int iCounter;

	printf("Enter the Number : ");
	scanf("%d",&iNo);
	
	for(iCounter=1; iCounter<iNo; iCounter++)
	{
		if(iCounter%2 == 0)
			continue;
		printf("%d\n",iCounter);
	}

	exit(0);
}
