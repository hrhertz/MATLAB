%%
% Create Table in PostgreSQL 10 for stock history.
%
% Matlab 2017a w/ Database Tool Box.
%
% Copyright (c) 2018 Ken Segura.
%
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

%Clear !
clear

%%
% Make sure you have JDBC loaded.
% javaclasspath('postgresql-42.1.4.jar'); 

%%
% Connect to DB
conn = database('<DB_Name>','<UserName>','<PassWord>','Vendor','PostgreSQL','Server','<IP_Address>','PortNumber',5432);

%%
% Uncomment to Create Table.
%sqlquery = ['CREATE TABLE <Ticker>(RecordNumber SERIAL,DateValue DATE, Close DECIMAL, Volume INT, Open DECIMAL, High DECIMAL, Low DECIMAL)'];

%%
%  Uncomment to Drop Table.
%sqlquery = ['DROP TABLE <Ticker>'];

curs = exec(conn,sqlquery);

%%
% Close conenctions.
%
close (conn);
display (curs);

%
%
