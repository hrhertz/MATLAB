%%
% Modify DataBase Table in PostgreSQL 10.
% This is to load data into a table to store historical data for stock ticker.
%
% Matlab 2017a w/ Database Tool Box.
%
% Copyright (c) 2018 Ken Segura.
%
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%
% DB is written in the following format
% Date, Open, High, Low, Close, Volume
%
% The CSV is from nasdaq historical data. 
% http://www.nasdaq.com/symbol/intc/historical
%
% Note: Remove first two lines in top of CVS before loading.
% CSV from nasdaq is the following format
% Date, Close, Volume, Open, high, Low
%

%Clear !
clear

%%
% Make sure you have JDBC loaded.
% javaclasspath('postgresql-42.1.4.jar'); 

%%
%
format bank;
tableName = {'<Ticker>'};


%% 
% Open File.
fileID = fopen('<Ticker>.csv','r');

%%
% While loop. Insert until EOF.
%
while ~feof(fileID)

%%
% Connect to DB
conn = database('<DB_Name>','<UserName>','<PassWord>','Vendor','PostgreSQL','Server','<IP_Address>','PortNumber',5432);
    
%%
%
InputText1 = textscan(fileID,'%s%f%f%f%f%f%[\n\r]',1,'delimiter',',');

%%
% Setup Varaibles
% 
dateVar = (InputText1{1,1});
closeVar = (InputText1{1,2});
volumeVar = (InputText1{1,3});
openVar = (InputText1{1,4});
highVar = (InputText1{1,5});
lowVar = (InputText1{1,6});

dateStr = InputText1{1,1};
DateNumber = datenum(dateStr);

exData = {DateNumber, openVar, highVar, lowVar, closeVar, volumeVar};

%%
% Insert the exDate in to the DB.
%
insert(conn, tableName, {'DateValue';'Open';'High';'Low';'Close';'Volume'}, exData);

%%
% Clear Varables.
clear InputText1{:};

clear dateVar;
clear closeVar;
clear volumeVar;
clear openVar;
clear highVar;
clear lowVar;

clear dateStr;
clear DateNumber;

clear exData{:};

%%
% Close the connections.
%
close (conn);

%%
% End While
%
end


%% Close File
%
fclose(fileID);

