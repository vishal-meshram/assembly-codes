#include <stdio.h>
#include <stdlib.h>

static int g_iNo;

void fun()
{

	printf("Enter the value of g_iNo: ");
	scanf("%d",&g_iNo);

	printf("In fun(): g_iNo = %d\n",g_iNo);
	
}


