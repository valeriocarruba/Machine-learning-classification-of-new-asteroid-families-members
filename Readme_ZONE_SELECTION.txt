The code in this directory will select asteroids with proper elements in
the region of the main belt where the family of interest is located.
You will need to import the proper element databases afp.pro and afp.mult.pro
from the Asteroid Families Portal
(AFP, http://asteroids.matf.bg.ac.rs/fam/properelements.php)

Please edit the input_region file and select the region of interest, among
the 8 possible choices.

Run the select_zone fortran code. You may compile the code using:

gfortran select_zone.f -o select_zone -O3

This needs to be done only once, and it is unnecessary for future runs.

Once the code is compiled, just type:

./select_zone 

The code will generate a file prop_el_all that can be used to authomatically
update the membership of a family of interest.  Once this is done, please
copy this file to the directory where you want to use the machine learning
algorithm.
