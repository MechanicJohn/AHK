EXAMPLE SCRIPTS

In the folders under this folder you will find some examples
of autohotkey scripts that demonstrate the basic features of
the dynamic obfuscator. 

START EASY WITH "@SIMPLEST EXAMPLE" FOLDER
AND LOOK AT THE PROCEDURE.txt file which explains the very basic proccess.

The files in each folder follow some common file naming
conventions as shown below. 

example.ahk
	- the autohotkey script that i start with
example_includemap.txt
	- lists all source code files to process.
	- manually created by user by using text editor
example_obfuscated.ahk
	- obfuscated code that was output by obfuscator
	- did not check 'no comments' or 'randomize order'
example_obfuscated_nocomments.ahk
	- obfuscated code that was output by obfuscator
	- checked 'no comments' and 'randomize order'
example_TransMAP.txt
	- translations map file
	- obfuscator made this file and uses it also as input for obfuscation
example_TransMAP_RMESS.txt
	- translations messages
	- obfuscator made this file for debugging purposes
	-it contains the obfuscated names it has created for all

The first file is the unobfuscated example autohotkey script.

The second file contains a list of file names and paths for all
the source code files that are part of the project and that the
obfuscator will need to process. this file has to be specified as
an input file when the obfuscator runs. In this case 'example.ahk'.

The 'example_obfuscated.ahk' files found in each directory were
created by me by running the obfuscator with neither the 'strip
comments' nor the 'randomize function order' fields being
checked on the obfuscator run window.

The 'example_obfuscated_nocomments.ahk' files were similarly
created by me by running the obfusctor but this time i checked
both the 'strip comments' and the 'randomize function order'
fields.

To verify that the example obfuscated files are in fact obfuscated,
bring them up in your text editor. afterwards run them and make
sure everything is ok.

The 'example_transMAP.txt' file is both output and input by the
obfuscator. the obfuscator has 2 main functions, the create trans
map function and the obfuscate program function. this file is
output by the first function and input by the second.

TO DO A NEW RUN (=RE-CREATE) OF THE OBFUSCATOR ON AN EXAMPLE FILE 
run the obfuscator and choose 'create trans map'.
select the '*_includemap.txt' file as input and set
'*_transMAP.txt' as your output. 

Then verify that the file was written
to and the time/date changed. 

Now run the obfuscate function and
set the same '*_includemap.txt' and '*_transMAP.txt' files as input
and specify your output file as '*_obfuscated.ahk' or '*_obfuscated_nocomments.ahk'. 

Then verify that the output obfuscated file was updated and the date/time has changed.

Finally, run the output obfuscated file and make sure everything run ok.
