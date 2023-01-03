#include <stdio.h>
#include <stdlib.h>

struct demo
{
	char chChar;
	int  iNo;
	short int shiNo;
}obj1 = {'A', 10, 20};

int main()
{
	struct demo obj2={'B', 30, 40};
	struct demo obj3={'B', 30, 40};

	printf("Obj1 Values: \n");
	printf("chChar=%c\niNo=%d\nshiNo=%hd\n",obj1.chChar,obj1.iNo,obj1.shiNo);
 
	printf("Obj2 Values: \n");
	printf("chChar=%c\niNo=%d\nshiNo=%hd\n",obj2.chChar,obj2.iNo,obj2.shiNo);
	

	printf("Obj3 Values: \n");
	printf("chChar=%c\niNo=%d\nshiNo=%hd\n",obj3.chChar,obj3.iNo,obj3.shiNo);


	printf("Obj1 and Obj2 comparasion is:  ");
	if(obj1.chChar == obj2.chChar && obj1.iNo == obj2.iNo && obj1.shiNo == obj2.shiNo)
	printf("EQUAL\n");
	else
	printf("NOT EQUAL\n");

	printf("Obj2 and Obj3 comparasion is:  ");
	if(obj2.chChar == obj3.chChar && obj2.iNo == obj3.iNo && obj2.shiNo == obj3.shiNo)
	printf("EQUAL\n");
	else
	printf("NOT EQUAL\n");

	exit(0);
}
