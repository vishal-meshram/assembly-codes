#include <stdio.h>
#include <stdlib.h>

#define LT 1
#define GT 2
#define EQ 4
#define LE 8
#define GE 16

char compare(int iNo1,int iNo2);

int main()
{
	int iNo1;
	int iNo2;
	char cResult='\0';

	printf("Enter two Numbers : ");
	scanf("%d%d",&iNo1,&iNo2);

	cResult = compare(iNo1, iNo2);

	if((cResult & LT) == LT)
	{
		printf("%d is less than %d\n",iNo1,iNo2);
		printf("%d is less than or equal to %d\n",iNo1,iNo2);
	}
	if((cResult & GT) == GT)
	{
		printf("%d is greater than %d\n",iNo1,iNo2);
		printf("%d is greater than or equal to %d\n",iNo1,iNo2);
	}
	if((cResult & EQ) == EQ)
	{
		printf("%d is equal to %d\n",iNo1,iNo2);
		printf("%d is less than or equal to %d\n",iNo1,iNo2);
		printf("%d is greater than or equal to %d\n",iNo1,iNo2);
	}

			
	exit(0);
}

char compare(int iNo1,int iNo2)
{
	char iAns;
	iAns = iAns ^ iAns; 

	if(iNo1 < iNo2)
		iAns = iAns | LT;
	if(iNo1 > iNo2)
		iAns = iAns | GT;
	if(iNo1 == iNo2)
		iAns = iAns | EQ;
	if(iNo1 <= iNo2)
		iAns = iAns | LE;
	if(iNo1 >= iNo2)
		iAns = iAns | GE;
	return(iAns);
}

