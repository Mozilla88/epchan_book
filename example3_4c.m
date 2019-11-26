clear; % make sure previously defined variables are erased.

cls=getCls('IGE');

dailyret=(cls(2:end)-cls(1:end-1))./cls(1:end-1); % daily returns

excessRet=dailyret - 0.04/252; % excess daily returns = strategy returns - financing cost, assuming risk-free rate of 4% per annum and 252 trading days in a year

sharpeRatio=sqrt(252)*mean(excessRet)/std(excessRet) % the output should be 0.7893

cls=getCls('SPY'); % sort cls into ascending order of dates.

dailyretSPY=(cls(2:end)-cls(1:end-1))./cls(1:end-1); % daily returns

netRet=(dailyret - dailyretSPY)/2; % net daily returns (divide by 2 because we now have twice as much capital.)

sharpeRatio=sqrt(252)*mean(netRet)/std(netRet) % the output should be 0.7837

cumret=cumprod(1+netRet)-1; % cumulative compounded returns

plot(cumret);

[maxDrawdown, maxDrawdownDuration]=calculateMaxDD(cumret);

maxDrawdown % maximum drawdown. Output should be 0.1053 

maxDrawdownDuration % maximum drawdown duration. Output should be 497.