function c=myconv(a,b)
%实现一维卷积，a、b为行向量
na=length(a);nb=length(b);
len=na+nb;
if na<nb
    t=a;a=b;b=t;
end
nb=length(b);b=b';
a=[zeros(1,nb-1) fliplr(a) zeros(1,nb-1)];
c=zeros(1,len-1);
for i=1:len-1
	c(i)=a(1:nb)*b;
	a=circshift(a,[0 -1]);
end
c=fliplr(c);