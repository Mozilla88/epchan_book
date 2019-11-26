clear;

inputFile='Export.txt';
outputFile='SPX_20071123';

[mysym, mytday, myop, myhi, mylo, mycl, myvol]=textread(inputFile, '%s %u %f %f %f %f %u', 'delimiter', ',');

% Since the single file consists of many symbols,
% we need to find the unique set of symbols.
stocks=unique(mysym);
% Since the single file consists of many repeating set
% of dates for different symbols, we need to find the
% unique set of dates.
tday=unique(mytday);

op=NaN(length(tday), length(stocks));
hi=NaN(length(tday), length(stocks));
lo=NaN(length(tday), length(stocks));
cl=NaN(length(tday), length(stocks));
vol=NaN(length(tday), length(stocks));

for s=1:length(stocks)
    stk=stocks{s};

    % find the locations (indices) of the data with
    % the current symbol.
    idxA=strmatch(stk, mysym, 'exact'); % find the locations (indices) of the data with
    % the current set of dates.
    [foo, idxtA, idxtB]=intersect(mytday(idxA), tday);
    % Extract the set of prices for the current symbol
    % from the downloaded data.
    op(idxtB, s)=myop(idxA(idxtA));
    hi(idxtB, s)=myhi(idxA(idxtA));
    lo(idxtB, s)=mylo(idxA(idxtA));
    cl(idxtB, s)=mycl(idxA(idxtA));
    vol(idxtB, s)=myvol(idxA(idxtA));
end

save(outputFile, 'tday', 'stocks', 'op', 'hi', 'lo', 'cl', 'vol');