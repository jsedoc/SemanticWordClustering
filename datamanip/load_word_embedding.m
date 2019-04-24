function [WordEmbedding, WordDic, Emb] = load_word_embedding(filename, dim, names, delimiter)
% load_word_embedding this is a script for loading clove data. the script is
% intended to be modular and support any glove based files.

%% Initialize variable defaults.
if nargin < 1
    filename = '/home/stat/joao/research/SSC/data/glove.6B.200d.txt';
end
if nargin < 2
    dim = 200;
end
if nargin < 3
  load /home/stat/joao/research/SSC/data/wordnetjcnbrownnames_filtered.mat;
    names = wordnetjcnbrownnames_filtered;
end
if nargin < 4
    delimiter = ' ';
end

%% Format string for each line of text:
str='';
for i = 1:dim
    str = sprintf('%s%%f',str);
end
formatSpec = ['%s' str '%[^\n\r]'];
    
%% Open the text file.
fileID = fopen(filename,'r');
%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);

n = length(dataArray{1,1});
% WordEmbedding = zeros(n,dim);
WordDic = dataArray{:, 1};
for i=1:dim
    WordEmbedding(:,i) = dataArray{:, i+1};
end

%% Close the text file.
fclose(fileID);

Emb = zeros(numel(names), size(WordEmbedding,2));
[~,Ix, Iy] = intersect(names, WordDic);
Emb(Ix,:) = WordEmbedding(Iy,:);
%for i = 1:numel(names)
%    if sum(ismember(WordDic,names(i)))>0
%        Emb(i,:) = WordEmbedding(ismember(WordDic,names(i)),:);
%    end
%end


%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans;
end
