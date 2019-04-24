home = getenv('HOME');
  
ssc_script_dir = [home '/research/SignedSpectralClustering/'];
script_dir = [home '/research/SemanticWordClustering/'];
addpath(genpath(script_dir), genpath(ssc_script_dir))
cd(script_dir);

load optimization_workspace;

n = str2num(getenv('RUNTYPE'));
sigma = str2num(getenv('SIGMA'));
K = floor(str2num(getenv('NUMK')));
thresh = str2num(getenv('THRESH'));
beta_0 = str2num(getenv('BETA_0'));
beta_syn = str2num(getenv('BETA_SYN'));
beta_ant = str2num(getenv('BETA_ANT'));

beta = [beta_0 beta_syn beta_ant];
switch n
case 1
  x = calcGoodness(sigma, thresh, beta, WD, K, thesaurus_aligned, true);
  fprintf('SC %f %f %f %f %f %d %f \n', sigma, thresh, beta_0, beta_syn, beta_ant, K, x);
case 2
  x = calcGoodness(sigma, thresh, 1, WD, K, thesaurus_aligned, false);
  fprintf('SC %f %f %f %f %f %d %f \n', sigma, thresh, 1, 0, 0, K, x);
    
otherwise
  fprintf('ERROR\n')
end

exit;
