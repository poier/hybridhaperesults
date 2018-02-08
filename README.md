# Hybrid One-Shot 3D Hand Pose Estimation by Exploiting Uncertainties
The repository contains the results and a simple visualization script for the method we proposed in:  

[Hybrid One-Shot 3D Hand Pose Estimation by Exploiting Uncertainties](https://files.icg.tugraz.at/seafhttp/files/2ce2540b-5e81-4f31-9417-bc922d325532/poier_bmvc15.pdf)  
Georg Poier, Konstantinos Roditakis, Samuel Schulter, Damien Michel, Horst Bischof and Antonis A. Argyros.  
In *Proc. BMVC*, 2015. ([Project Page](https://www.tugraz.at/institute/icg/research/team-bischof/lrs/downloads/hybridhpe/)).

If you can make use of it, please cite:
```
@inproceedings{Poier2015bmvc_hybridhape,  
  author = {Georg Poier and Konstantinos Roditakis and Samuel Schulter and Damien Michel and Horst Bischof and Antonis A. Argyros},  
  title = {{Hybrid One-Shot 3D Hand Pose Estimation by Exploiting Uncertainties}},  
  booktitle = {{Proc. British Machine Vision Conference (BMVC)}},  
  year = {2015}
}
```

![Method sketch in images](/doc/method_sketch_images.png)  
A learned joint regressor might fail to recover the pose of a hand due to ambiguities or lack of training data (a). We make use of the inherent uncertainty of a regressor by enforcing it to generate multiple proposals (b). The crosses show the top three proposals for the proximal interphalangeal joint of the ring finger for which the corresponding ground truth position is drawn in green. The marker size of the proposals corresponds to degree of confidence. Our subsequent model-based optimisation procedure exploits these proposals to estimate the true pose (c).

## Overview
* `ICVL` - Results for the ICVL dataset [2]
* `NYU` - Results for the NYU dataset [3]

Results are provided in text files - one file per frame.

### Subdirectories
* `JointProposals` - Results of the regression  
Each line contains all proposals for a single joint/landmark and a 
  corresponding confidence measure, *i.e.*,
  `<x1> <y1> <z1> <conf1> <x2> <y2> <z2> <conf2> ...`  
  proposals are ordered by descending confidence; confidence values sum to 200 (maximum)  
  locations are specified in meters
* `OptimizedJointPositions` - Final, optimized results  
Each line contains optimized position for a single joint/landmark, *i.e.*,
  `<x> <y> <z>`  
  locations are specified in meters

### Joint/landmark order
 - ICVL Dataset (16 positions)  
They are ordered the same way as in the dataset (see [2])

 - NYU Dataset (36 positions)  
The joint proposal files contain all 36 annotated positions.
They are ordered the same way as in the dataset (see [3])
However, we only optimized for a subset of 25 positions, 
from which 12 are used for evaluation.
This 12 are the same as suggested in [3,4], 
except for two positions on the palm, which were not represented by our model 
(cf., the paper [1]).
The used joint positions and correspondences are given in the simple example script 
*./NYU/main_VisualizePositionsExample.m*


## References
[1] Poier et al., Hybrid One-Shot 3D Hand Pose Estimation by Exploiting Uncertainties. BMVC, 2015  
[2] Dataset at 
[http://www.iis.ee.ic.ac.uk/~dtang/hand.html](http://www.iis.ee.ic.ac.uk/~dtang/hand.html)  
[3] Dataset at 
[https://cims.nyu.edu/~tompson/NYU\_Hand\_Pose\_Dataset.htm](https://cims.nyu.edu/~tompson/NYU_Hand_Pose_Dataset.htm)  
[4] Tompson et al., Real-time continuous pose recovery of human hands using convolutional networks. 
ACM ToG (SIGGRAPH), 2014
