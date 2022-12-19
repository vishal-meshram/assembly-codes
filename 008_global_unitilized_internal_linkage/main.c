#include <stdio.h>
#include <stdlib.h>

void fun();

int main()
{
	extern int g_iNo;
	
	printf("in main(): giNo = %d\n",g_iNo);
	
	fun();
	
	exit(0);
}

int g_iNo = 10;
