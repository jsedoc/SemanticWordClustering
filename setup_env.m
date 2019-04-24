%home = getenv('HOME');  
%SSC_dir = [home '/research/SSC/'];
SSC_dir = input('Please enter SSC path: ','s');
SSC_dir = [SSC_dir '/'];

addpath(genpath('scripts'), 'datamanip')
addpath([SSC_dir 'ncut'], [SSC_dir 'helper_fxns'], [SSC_dir 'analysis'])

clear SSC_dir;