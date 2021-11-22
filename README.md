# vcore3_modifications
A place where I can put modifications to the vcore3 3d printer

## VenterMech integrated v-core 3 arms
The arms are generated using a openSCAD script. The v-core arms used are from https://www.thingiverse.com/thing:5131325 by MFBS and has a https://creativecommons.org/licenses/by-sa/3.0/c license
The VenterMech is from https://www.fastbikegear.co.nz/index.php?main_page=product_info&cPath=0&products_id=12371 by MFBS and has a http://creativecommons.org/licenses/by-nc-nd/4.0/?ref=chooser-v1 license

To generate the arms:
* open the "generate vcore arms with ventermech.scad" file. 
* remove the // in front of one of the lines at the bottom
* then click the "Render" button or press the F6 key (this will take a while)
* then click "Export as STL" button or press the F7 key
* It is important to only do one line at a time, otherwise you will have to separate the bed arms in the generated STL
* Repeat for each line so that you have all 3 bed arms
