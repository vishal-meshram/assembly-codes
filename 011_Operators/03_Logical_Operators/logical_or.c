#include <stdio.h>
#include <stdlib.h>

int main()
{
	int iNo1;
	int iNo2;
	int iNo3;
	int iAns;

	printf("Enter 3 Numbers: ");
	scanf("%d%d%d",&iNo1,&iNo2,&iNo3);
	
	iAns = iNo1 && iNo2++ || iNo3++ ;

	printf("iNo1=%d\niNo2=%d\niNo3=%d\niAns=%d\n",iNo1,iNo2,iNo3,iAns);
	
	exit(0);
}
