#include <stdio.h>
#include <stdlib.h>

int main()
{
	int iNo1;
	int iNo2;

	printf("Enter 2 Numbers: ");
	scanf("%d%d",&iNo1,&iNo2);

	printf("AND  = %d\n",iNo1 & iNo2);
	printf("OR   = %d\n",iNo1 | iNo2);
	printf("X-OR = %d\n",iNo1 ^ iNo2);
	printf("~iNO1= %d\n",~iNo1);
	printf("~iNo2= %d\n",~iNo2);

	printf("iNo1<<2=%d\n",iNo1<<2);
	printf("iNo1>>2=%d\n",iNo1>>2);
	printf("iNo2<<2=%d\n",iNo2<<2);
	printf("iNo2>>2=%d\n",iNo2>>2);

	exit(0);
}
