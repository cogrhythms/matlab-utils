function res = fork(with)
%
%

if exist(with)==2
  withhash = md5(with);
else
  withhash = md5(with);
end


res = sprintf([...
'vs = who;\n'...
'pth__ = path;\n'...
'pwd__ = pwd;\n'...
'save(''%sdata'',vs{:});\n'...
'! screen matlab -nodesktop -r "load(''%sdata.mat''); addpath(pth__{:}); cd(pwd__); %s;" &\n'...
'\n'...
],withhash,withhash,with);
evalin('caller',res);
