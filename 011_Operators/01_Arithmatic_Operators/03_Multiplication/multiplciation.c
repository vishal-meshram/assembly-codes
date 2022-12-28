#include <stdio.h>
#include <stdlib.h>

int main()
{
	int iNo1;
	int iNo2;
	int iAns;

	printf("Enter 2 Numbers: ");
	scanf("%d%d",&iNo1,&iNo2);

	iAns= iNo1 * iNo2;
	
	printf("Multiplciation= %d\n",iAns);
	
	exit(0);
}
