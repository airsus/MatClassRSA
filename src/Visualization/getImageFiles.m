function y = getImageFiles(iconPath)
% createCMplot = createCMplot(confMat, varargin)
% ------------------------------------------------
% Bernard Wang - April 23, 2017
%
% This is a helper function for the visualization functions
% to retrieve jpg, jpeg, or png files from a directory
%
% Required inputs:
% - iconPath: Absolute or relative path to the images to be used
%               for labeling
%
% Outputs:
% - y: a vector of jpg, jpeg, or png file names
%
% Notes

    labelStructs = dir(iconPath);
    tempLabelStruct = NaN;
    labels = [];
    for i =1:length(labelStructs)
        tempLabelStruct = labelStructs(i);
        labels = [labels string(tempLabelStruct.name)];
    end
    removeArr = [];
    % remove non-png, non-jpg files
    for i = 1:length(labels)
        if ~(endsWith(labels(i), '.jpg') ...
            || endsWith(labels(i), '.png') ...
            || endsWith(labels(i), '.jpeg') )
            removeArr = [labels(i) removeArr];
        end
    end
    tempLabels = [];
    for i = 1:length(labels)
        if ~any(removeArr==labels(i))
            tempLabels = [tempLabels labels(i)];
            continue;
        end
    end
    y = tempLabels;

end