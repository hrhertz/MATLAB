%%
%
%Learing how to make dates.

%%
%
format bank;

%%
%
startdate = floor(now)-300;
enddate = floor(now);
startDateString = datestr(startdate);
endDateString = datestr(enddate);
disp (startDateString);
disp (endDateString);

startDateString = ['04-Apr-2017'];
endDateString = ['29-Jan-2018'];
startDateNumber = datenum(startDateString);
endDateNumber = datenum(endDateString);
disp (startDateNumber);
disp (endDateNumber);
