#include<iostream>
#include<string>

int main(){
int a=11;
 int b=20.55;
 int c=22;
 int d=2048;
 std::string e="stroka";
 int f[]=[1,2,3,4,5,6,7,8];
 bool g=true;
 
for(int i=0; i<5; i++)
{
	a=a+2;
	b=b-1.7;
	c=c*2;
	d=d/2;
}

for(int i=0; i<10; i++)
{
	g=!g;
	if(g)
	{
		d=d+a;
	}
	else
	{
		d=d+c;
	}
}

for(int i=0; i<8; i++)
{
	f[i]+=i;
}

while(c>32)
{
	c=(int)(c/2);
}


d=d%23;

if(d!=12)
{
	d=23;
}

else if(d==11)
{
	d=22222;
}

else
{
	d=0;
}

if(a==21)
{
	a=43;
}

c=a+c;
a=c-a;

return 0;
}