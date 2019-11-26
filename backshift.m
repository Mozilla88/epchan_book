function y=backshift(day,x)
% y=backshift(day,x)
% 
% written by:
% Ernest Chan
%
% Author of ?Quantitative Trading: 
% How to Start Your Own Algorithmic Trading Business?
%
% ernest@epchan.com
% www.epchan.com

%assert(day>=0);
if day<0 
    error(['day = ' num2str(day) '<0, error!']); 
end 
y=[NaN(day,size(x,2), size(x, 3));x(1:end-day,:, :)];
%tmp=[day,size(x,2),size(x,3)];
%tmp(1:day,1:size(x,2),1:size(x,3))=NaN;
%y=[tmp;x(1:end-day,:, :)];