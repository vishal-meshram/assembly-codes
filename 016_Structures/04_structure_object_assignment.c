#include <stdio.h>
#include <stdlib.h>

struct demo
{
	char chChar;
	int  iNo;
	short int shiNo;
}obj1;

int main()
{
	struct demo obj2;
	struct demo obj3;

	printf("Enter Obj2 Values:\n");
	printf("Enter chChar: ");
	scanf("%c",&obj2.chChar);
	printf("Enter iNo: ");
	scanf("%d",&obj2.iNo);
	printf("Enter shiNo: ");
	scanf("%hd",&obj2.shiNo);

	printf("Obj2 is:\n");
	printf("chChar=%c\niNo=%d\nshiNo=%hd\n",obj2.chChar,obj2.iNo,obj2.shiNo);
		
	obj1.chChar  =  obj2.chChar;
	obj1.iNo     =  obj2.iNo;
	obj1.shiNo   =  obj2.shiNo;

	obj3.chChar  =  obj2.chChar;
	obj3.iNo     =  obj2.iNo;
	obj3.shiNo   =  obj2.shiNo;

	printf("Obj1 is:\n");
	printf("chChar=%c\niNo=%d\nshiNo=%hd\n",obj1.chChar,obj1.iNo,obj1.shiNo);

	printf("Obj3 is:\n");
	printf("chChar=%c\niNo=%d\nshiNo=%hd\n",obj3.chChar,obj3.iNo,obj3.shiNo);

	exit(0);
}
