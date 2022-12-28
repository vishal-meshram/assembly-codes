#include <stdio.h>
#include <stdlib.h>

int main()
{
	int iNum;   //Numerator
	int iDen;   //Denominator
	int iQuo;   //Quotient
	int iRem;   //Reminder
	
	printf("Enter the Numerator: ");
	scanf("%d",&iNum);
	
	printf("Enter the Denominator: ");
	scanf("%d",&iDen);

	iQuo = iNum/iDen;
	iRem = iNum%iDen;

	printf("Quotient = %d\n",iQuo);
	printf("iRem = %d\n",iRem);
 	
	exit(0);
}
