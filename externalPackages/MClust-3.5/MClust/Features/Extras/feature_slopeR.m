function [slopeData, slopeNames, slopePars] = feature_SlopeR(V, ttChannelValidity, Params)

% MClust
% interpolation to improve resolution.
%
% JCJ Sept 2002

TTData = Data(V);

[nSpikes, nCh, nSamp] = size(TTData);

f = find(ttChannelValidity);

slopeData = zeros(nSpikes, length(f));

slopeNames = cell(length(f), 1);
slopePars = {};
slopeData = squeeze(max(diff(TTData(:, f, :),1,3), [], 3));

for iCh = 1:length(f)
   slopeNames{iCh} = ['SlopeR: ' num2str(f(iCh))];
end