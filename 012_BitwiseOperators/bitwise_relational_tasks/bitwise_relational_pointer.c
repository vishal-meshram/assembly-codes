#include <stdio.h>
#include <stdlib.h>

#define lt 1
#define gt 2
#define eq 4
#define le 8
#define ge 16

void compare(int iNo1, int No2, char* iAns);

int main()
{

	int iNo1;
	int iNo2;
	char iAns;

	printf("Enter two Numbers: ");
	scanf("%d%d",&iNo1,&iNo2);

	compare(iNo1, iNo2, &iAns);
	
	if((iAns & lt) == lt)  
	{ 
		printf(" The %d less than %d\n",iNo1,iNo2);
		printf(" The %d is less than or equal to %d\n",iNo1, iNo2);
	}
		
	if((iAns & gt) == gt)
	{
		printf(" The %d greater than %d\n",iNo1,iNo2);
		printf(" The %d is greater than or equal to %d\n",iNo1, iNo2);
	}
	if((iAns & eq) == eq)
	{
		printf(" The %d equal %d\n",iNo1,iNo2);
		printf(" The %d is less than or equal to %d\n",iNo1, iNo2);
		printf(" The %d is greater than or equal to %d\n",iNo1, iNo2);
	}

	printf("Thank you..\n");
	exit(0);
}

void compare(int iNo1, int iNo2, char* iAns)
{
	char ans;
	ans = ans ^ ans; //Zero out the value of iAns using X-OR
	
	if(iNo1 < iNo2)
		ans = ans | lt;
	if(iNo1 > iNo2)
		ans = ans | gt;
	if(iNo1 == iNo2)
		ans = ans | eq;
	if(iNo1 <= iNo2)
		ans = ans | le;
	if(iNo1 >= iNo2)
		ans = ans | ge;

	*iAns = ans;
}
