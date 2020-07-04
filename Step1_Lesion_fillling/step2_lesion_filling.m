% This script uses the Lesion Segmentation Tool (LST) (Schmidt et al., Neuroimage, 2012) for Statistical Parametric Mapping (SPM12; Wellcome Trust Centre for
% Neuroimaging). Please install LST and SPM12 first

addpath(genpath(SPM12)) % modify the path according to your own use

clear all;clc;

list_file = 'list.txt'; % put your subject list here
list = importdata(list_file);

for i=1:length(list)
    matlabbatch{1}.spm.tools.LST.filling.data = {['list{i} '/oT1.nii,1']}; % indicate where all T1 images are
    matlabbatch{1}.spm.tools.LST.filling.data_plm = {['list{i} '/ples_lga_0_rmoFlair.nii,1']}; % indicate your renamed lesion mask
    matlabbatch{1}.spm.tools.LST.filling.html_report = 1;
    spm_jobman('run',matlabbatch);
end
