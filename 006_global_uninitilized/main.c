#include <stdio.h>
#include <stdlib.h>

void fun();

int main()
{
	extern int g_iNo;
	
	printf("In main(): g_iNo = %d\n",g_iNo);
	
	fun();
	printf("In main(): g_iNo = %d\n",g_iNo);
	exit(0);
}
