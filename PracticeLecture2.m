filename= 'EER_EPMRU_PF4_Y35NY_DPGm.xls'

[NUM WORD COMBINED] = xlsread(filename)


%lecture 2

filename= 'EER_EPMRU_PF4_Y35NY_DPGm.xls'

%[NUM WORD COMBINED] = xlsread(filename)
%don't need to separate it out

data=xlsread(filename)

%since we didn't specify, ignores the dates and just reports the number
%price data.....don't need to use the date info to figure out rest of
%task....especially since data file is so small, and out of order

%starts June 1986--> ends July 2016

%incomplete data for 1986 and 2016.....just get rid of it

%take vector and turn it into a matrix
%how many years of data?

years=length(data)/12

matrix=zeros(years, 12);

%nested for loop to fill in values

for i=1:years %for every row in matrix
    
    for j=1:12 %for every column in matrix
        
        matrix(i, j)=data((i-1)*12+j);  %spot (year, month)
    end
    
end


matrix
%each column is a month
%first row is prices for 1987.....

%find monthly average
%matlab default finds mean across column


for i=1:12 %for each month
    average_monthly_price(i)= mean(matrix(:,i)); %monthly price for i is the mean of all the rows in column i
end
    
average_monthly_price
    
xlswrite('PracticeLecture2.xls', average_monthly_price)
