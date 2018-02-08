% The script reads ground truth and detected joint positions, extracts the
% positions which are used for evaluation (see the paper [1]) and plots
% them.
%
% The provided file with ground truth positions contains the annotations
% data-structure from the original database [2]; but only the annotations
% for the first frame.
%
% [1] Poier et al., Hybrid One-Shot 3D Hand Pose Estimation by Exploiting
% Uncertainties. BMVC, 2015
% [2] http://cims.nyu.edu/~tompson/NYU_Hand_Pose_Dataset.htm


clear variables
close all


%% Specifications
% Ground truth data
inFileGT = 'joint_data_example.mat';
kinectId = 1;

% Detections
inFileDetections = './actor1/OptimizedJointPositions/frame0002.txt';
evalJointIds_4EvalOptimize = [      1, ...          % palm
                                    5, 4, 3,...     % thumb
                                    21, 19, ...   	% pinky (f1)
                                    17, 15, ...  	% ring (f2)
                                    13, 11, ...     % middle (f3)
                                    9, 7 ];         % index (f4)]
                                  
evalJointIds_4NYUeval12From36 = [	33, ...         % palm
                                    25, 26, 28, ... % thumb
                                    1, 4, ...       % pinky (f1)
                                    7, 10, ...      % ring (f2)
                                    13, 16, ...     % middle (f3)
                                    19, 22 ];       % index (f4)
                            
% Scale factor to be applied to ground truth positions in order to bring
% them to the same space as the detections (i.e., mm to m)
scaleGt2Det = 0.001;

% Plot
colorGT         = [155/255, 187/255, 89/255];	% green
colorOptimized  = [247/255, 150/255, 70/255];  	% orange
markersize = 30;
linewidth = 2;


%% Plot example
% Load ground truth positions
load( inFileGT );
positionsGT = squeeze( joint_xyz(kinectId,:,evalJointIds_4NYUeval12From36,:) );
positionsGT = positionsGT * scaleGt2Det;

% Load detections
positionsDet = dlmread( inFileDetections );
positionsDet = positionsDet( evalJointIds_4EvalOptimize, : );

figure; hold on;
% Plot GT positions
indices = [1,4,3,2]; 	% thumb
plot3( positionsGT(indices,1), positionsGT(indices,2), positionsGT(indices,3), '.-', 'Color', colorGT, 'MarkerSize', markersize, 'LineWidth', linewidth );
indices = [1,6,5];      % pinky
plot3( positionsGT(indices,1), positionsGT(indices,2), positionsGT(indices,3), '.-', 'Color', colorGT, 'MarkerSize', markersize, 'LineWidth', linewidth );
indices = [1,8,7];      % ring
plot3( positionsGT(indices,1), positionsGT(indices,2), positionsGT(indices,3), '.-', 'Color', colorGT, 'MarkerSize', markersize, 'LineWidth', linewidth );
indices = [1,10,9];     % middle
plot3( positionsGT(indices,1), positionsGT(indices,2), positionsGT(indices,3), '.-', 'Color', colorGT, 'MarkerSize', markersize, 'LineWidth', linewidth );
indices = [1,12,11];    % index
plot3( positionsGT(indices,1), positionsGT(indices,2), positionsGT(indices,3), '.-', 'Color', colorGT, 'MarkerSize', markersize, 'LineWidth', linewidth );
% Plot detected positions
indices = [1,4,3,2]; 	% thumb
plot3( positionsDet(indices,1), positionsDet(indices,2), positionsDet(indices,3), '.-', 'Color', colorOptimized, 'MarkerSize', markersize, 'LineWidth', linewidth );
indices = [1,6,5];      % pinky
plot3( positionsDet(indices,1), positionsDet(indices,2), positionsDet(indices,3), '.-', 'Color', colorOptimized, 'MarkerSize', markersize, 'LineWidth', linewidth );
indices = [1,8,7];      % ring
plot3( positionsDet(indices,1), positionsDet(indices,2), positionsDet(indices,3), '.-', 'Color', colorOptimized, 'MarkerSize', markersize, 'LineWidth', linewidth );
indices = [1,10,9];     % middle
plot3( positionsDet(indices,1), positionsDet(indices,2), positionsDet(indices,3), '.-', 'Color', colorOptimized, 'MarkerSize', markersize, 'LineWidth', linewidth );
indices = [1,12,11];    % index
plot3( positionsDet(indices,1), positionsDet(indices,2), positionsDet(indices,3), '.-', 'Color', colorOptimized, 'MarkerSize', markersize, 'LineWidth', linewidth );
grid on
axis equal

