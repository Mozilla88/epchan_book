function cls = getCls(filename)

[num, txt]=xlsread(filename); 

tday=num(1:end, 1);

tday=datestr(tday+datenum('30-Dec-1899'), 'yyyymmddTHHMMSS');

len=length(tday);
tdaycell = cell(len, 1);
for k=1:1:len
    tdaycell{k,1} = tday(k, 1:8);
end

tday=str2double(tdaycell);

cls=num(:, end);

[tday sortIndex]=sort(tday);

cls=cls(sortIndex);