# Climate Wedges Matlab App

# Engineering 7 Final Project S18

By Nico Carballal, Cheljea Jang, Josh DeWitt

\#ThanksTina

Below is the rough draft/live draft of the write up with features of the app as they are implemented, as well as possible improvements.

## Data Input

Fundamentally, data can be fed in through two methods.  Through text files in the format specified in the assignment PDF, or through tables.

You can only input .txt files with the correct format. For example, one cannot submit constraint.txt into the wedges option, and one cannot 
submit the wedges.txt into the constraint option. This will bring upon an error.

### Text Files

Text files can be given as an input to the app, in the order of Wedges, Constraints, Strategy.  We use varargin so that any number of files can be given as an input.  The other files can be given through the GUI.  A text input field appears for each file, with an indicator of whether or not it has been entered into the program.  When a file is entered, the field will grey out.  A `Browse...` Button appears to allow a user to navigate to the relavent file.  If a file or file location entered is invalid, an error message will display at the bottom of the screen.

TODO: offer way to change text file (ie delete the struct and allow it to be reentered).  Error message changes text color, flash indicator?  When text changed, revert color to black.

TODO Error checking: try catch/ if statements for fid = -1, header correct, each line has same # of values as header (8)

`app.ErrorText.Value = sprintf(app.fileError, 'Constraints');
 app.ConstraintsTextFile.FontColor = 'red';
 app.ErrorText.FontColor = 'red';`

### Tables

Data can also be entered into tables for Wedges and Constraints.  Strategy updates will be done live within the app to show changes, so this table is omitted for now.
Although Strategy updates will also be done live within the app, it is setup now to just read the information from the file and put it in table.

TODO: make tables with input.  Allow tables to read file and display it in a more readable form.  Allow changes to file from table, additions/subtractions.  Delete/add rows?


### Data Structures

The data read from files is read into three structs.  While similar, the structs have slightly different formats to deal with the data, and the way it is accessed.

#### Wedges

The wedges are stored into a 1xP struct with fields 

```MATLAB

ID

Category

StrategyName

Sector

Description

Needs

Challenges

Cost

```

in accordance with the header of `wedges.txt`.  Each wedge has it's ID stored both in the `ID` field, and as it's position index within the struct.  To check if the struct is filled in other functions, the struct is checked to see if `ID` is a field within in.  Whenever the code errors out, it resets the struct so that it has no fields.  For error checking, the header line of the file is string compared to the given header to see if it is in the right format.  In addition, each string split line is checked to ensure there are the right number of items in the line.

#### Constraints

Constraints are stored with the Sector as the field name, and the number of wedges as the value.  When checking for constraints on the number of wedges, the struct will be checked if the sector exists within it (i.e. there are constraints for this sector) and then the value used.  This struct is always 1x1, with only the number of fields changing.

#### Strategy

Strategy is stored into a Bx1 struct with fields

```MATLAB

ID

YearStart

```

in accordance with the header of `strategy.txt`.  Each wedge has it's ID within the `ID` field, but the ID is not tied to the index of the wedge within the struct.  The wedges are in order of input.  

