# Program for gnuplot to draw a glide computer
# Kevin R. Johnson
# Kevin.Ray.Johnson@gmail.com
# VFR Sectionals are 6.86 NM per inch.
# Get to know program state...
reset
set title "J-3 Glide Computer 10-40:1" offset 0.25 font "default, 12"

# USER SELECTABLE VARIABLES
Dmax = 25.0 # Maximum distance on computer in Nautical Miles.
DmaxKft = Dmax * 6.0#7611549 # A conversion from NM to Kft.
Dmin = 5.0 # Minimum range to place a range ring.
Dinterval = 5.0 # Interval between range rings.
Amax = 15.0 # Maximum altitude on computer in thousans of feet.
radials = Amax  # The number of altitude radial lines plotted.
radialAngleSep = (360/radials)*(pi/180) # Angulare spacing of each radial

# SETUP THE GRID
set polar # Plot in polar cordinates.
unset border    # Gets rid of the silly box around the computer face.
set angles radians  # Make sure are are working in radian measure for angles.
set size square 1.012925,1.012925    # Make it not-squished
set trange [0:2*pi] # Sets the domain of our calulation variable.
set xrange [-Dmax:Dmax] # Plot the whole computer
set yrange [-Dmax:Dmax]
set xtics axis font "default, 12"
set ytics axis font "default, 12"
set xtics offset 0.0,graph 0.070 # These numbers are hand tuned...
set ytics offset 1.5,graph 0.010
set xtics Dinterval
set ytics Dinterval
set tics scale 0.01    # Hide the little straight tic marks
set grid front polar radialAngleSep lt -1   # Draws the right number of altitude radial lines
unset key # We get rid of these because they are ugly.

# PLACE LABELS
# Note: thse lables are hand placed currently.  So if you change the computer 
# either comment them out or return them to taste.
scale = 1.09
unset label
set label "1Kft " at scale*Dmax*cos(1* radialAngleSep)-1,scale*Dmax*sin(1* radialAngleSep) font "default, 12"
set label "2Kft " at scale*Dmax*cos(2* radialAngleSep)-1,scale*Dmax*sin(2* radialAngleSep)-0.5 font "default, 12"
set label "3Kft " at scale*Dmax*cos(3* radialAngleSep)-1,scale*Dmax*sin(3* radialAngleSep)-0.5 font "default, 12"
set label "4Kft " at scale*Dmax*cos(4* radialAngleSep)-1,scale*Dmax*sin(4* radialAngleSep)-0.5 font "default, 12"
set label "5Kft " at scale*Dmax*cos(5* radialAngleSep)-1,scale*Dmax*sin(5* radialAngleSep)-0.5 font "default, 12"
set label "6Kft " at scale*Dmax*cos(6* radialAngleSep)-1,scale*Dmax*sin(6* radialAngleSep)-0.5 font "default, 12"
set label "7Kft " at scale*Dmax*cos(7* radialAngleSep)-1,scale*Dmax*sin(7* radialAngleSep)-0.5 font "default, 12"
set label "8Kft " at scale*Dmax*cos(8* radialAngleSep)-1,scale*Dmax*sin(8* radialAngleSep) font "default, 12"
set label "9Kft " at scale*Dmax*cos(9* radialAngleSep)-1,scale*Dmax*sin(9* radialAngleSep) font "default, 12"
set label "10Kft" at scale*Dmax*cos(10* radialAngleSep)-1,scale*Dmax*sin(10* radialAngleSep)+1 font "default, 12"
set label "11Kft" at scale*Dmax*cos(11* radialAngleSep)-1,scale*Dmax*sin(11* radialAngleSep)+1.5 font "default, 12"
set label "12Kft" at scale*Dmax*cos(12* radialAngleSep)-1,scale*Dmax*sin(12* radialAngleSep)+1.5 font "default, 12"
set label "13Kft" at scale*Dmax*cos(13* radialAngleSep)-1,scale*Dmax*sin(13* radialAngleSep)+1 font "default, 12"
set label "14Kft" at scale*Dmax*cos(14* radialAngleSep)-1,scale*Dmax*sin(14* radialAngleSep)+1 font "default, 12"
set label "15Kft" at scale*Dmax*cos(15* radialAngleSep)-1,scale*Dmax*sin(15* radialAngleSep)+1 font "default, 12"
#set label "16Kft" at scale*Dmax*cos(16* radialAngleSep)-1,scale*Dmax*sin(16* radialAngleSep)+1 font "default, 12"
#set label "17Kft" at scale*Dmax*cos(17* radialAngleSep)-1,scale*Dmax*sin(17* radialAngleSep) font "default, 12"
#set label "18Kft" at scale*Dmax*cos(18* radialAngleSep)-1,scale*Dmax*sin(18* radialAngleSep) font "default, 12"
# To hide labels uncomment the line below...
#unset label

# CALCULATIONS
# Define some useful working constants
Gmin = DmaxKft / Amax

# This is the fundamental glide curve function...
# Multiply by glide slope and plot to computer face.
glide(t) = t * (Dmax / (2 * pi * Gmin))

# An alternate line style
set style line 1 lt 2 lc rgb "red" lw 3

# PLOT HERE
set terminal svg enhanced size 850 1100 fname "Times" fsize 36
set output 'J-3_26NM_Glide_Computer.svg'

# Now we plot glide curves for some glide ratios
plot   10 * glide(t) < Dmax ? (10 * glide(t)) : Dmax ti "10:1" ls 1, \
       15 * glide(t) < Dmax ? (15 * glide(t)) : Dmax ti "15:1" lt 1, \
       20 * glide(t) < Dmax ? (20 * glide(t)) : Dmax ti "20:1" ls 1, \
       25 * glide(t) < Dmax ? (25 * glide(t)) : Dmax ti "25:1" lt 1, \
       30 * glide(t) < Dmax ? (30 * glide(t)) : Dmax ti "30:1" ls 1, \
       35 * glide(t) < Dmax ? (35 * glide(t)) : Dmax ti "35:1" lt 1, \
       40 * glide(t) < Dmax ? (40 * glide(t)) : Dmax ti "40:1" ls 1

#set terminal png size 960, 960
#set output 'J-3_26NM_Glide_Computer.png'
#replot

# END PROGRAM

