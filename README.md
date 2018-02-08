Sub-Folders:
.../JointProposals/ 		results of the regression (see below)
.../OptimizedJointPositions/	final, optimized results (see below)

Results are provided in text files - one file per frame.


File description:
-----------------
JointProposals:
  each line contains all proposals for a single joint/landmark and a corresponding confidence measure, i.e.,
  <x1> <y1> <z1> <conf1> <x2> <y2> <z2> <conf2> ...
  proposals are ordered by descending confidence; confidence values sum to 200 (maximum)
  locations are specified in meters

OptimizedJointPositions:
  each line contains optimized position for a single joint/landmark, i.e.,
  <x> <y> <z>
  locations are specified in meters

Joint/landmark order:
- ICVL Dataset (16 positions)
They are ordered the same way as in the dataset (see [2])

- NYU Dataset (36 positions)
The joint proposal files contain all 36 annotated positions.
They are ordered the same way as in the dataset (see [3])
However, we only optimized for a subset of 25 positions, from which 12 are used for evaluation.
This 12 are the same as suggested in [3,4], except for two positions on the palm, which were not represented by our model (cf., the paper [1]).
The used joint positions and correspondences are given in the simple example script ./NYU/main_VisualizePositionsExample.m


References:
-----------
[1] Poier et al., Hybrid One-Shot 3D Hand Pose Estimation by Exploiting Uncertainties. BMVC, 2015
[2] http://www.iis.ee.ic.ac.uk/~dtang/hand.html
[3] http://cims.nyu.edu/~tompson/NYU_Hand_Pose_Dataset.htm
[4] Tompson et al., Real-time continuous pose recovery of human hands using convolutional networks. ACM ToG (SIGGRAPH), 2014
