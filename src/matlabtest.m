function matlabtest(varargin)

% Quit if requested (for extracting CTF in docker image)
if nargin>0 & strcmp(varargin{1},'quit')
    exit
end

% Inputs
P = inputParser;
addOptional(P,'inputval','test-string')
parse(P,varargin{:});
disp(P.Results)
inputval = P.Results.inputval;

disp(inputval)

%% Exit
if isdeployed
    exit
end
