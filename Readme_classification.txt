1) Copy the prop_el_all file appropriate for the region of interest in
this directory, as well as the family that you want to update.  This
exemple is provided for region 6. 

2) Copy the family file in the Asteroid Families Portal (AFP) format to fam_nov:

cp a832v40.list fam_nov

3) Change the permission of the script file to make it executable.
We provide scripts for the three most efficient algorithm that were
tested in our study: ExtraTree, KNN, and Adaboost.

chmod +x script_extra_trees

4) Run the script to generate the fam_ext file with the new possible family
members:

./script_extra_trees

5) Plot the results with octave:

octave: plot_ae

or

octave: plot_ai
