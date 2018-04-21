# Climate Wedges Matlab App

# Engineering 7 Final Project S18

By Nico Carballal, Cheljea Jang, Josh DeWitt

\#ThanksTina

Below is the rough draft/live draft of the write up with features of the app as they are implemented, as well as possible improvements.

## Data Input

Fundamentally, data can be fed in through two methods.  Through text files in the format specified in the assignment PDF, or through tables.

Strategy Table can be edited by user.

You can only input .txt files with the correct format. For example, one cannot submit constraint.txt into the wedges option, and one cannot submit the wedges.txt into the constraint option. This will bring upon an error.

### Text Files

Text files can be given as an input to the app, in the order of Wedges, Constraints, Strategy.  We use varargin so that any number of files can be given as an input.  The other files can be given through the GUI.  A text input field appears for each file, with an indicator of whether or not it has been entered into the program.  When a file is entered, the field will grey out.  A `Browse...` Button appears to allow a user to navigate to the relavent file.  If a file or file location entered is invalid, an error message will display at the bottom of the screen.


### Tables

Data can also be entered into tables for Wedges, Constraints, and Strategy.  These tables can have basic operations done on them.  Pre-loaded files can be edited.  When a cell is selected, a row can be added above or below, or the row can be deleted.  After the operation is completed, the add above and delete row buttons are unenabled, since MATLAB only store the indices selected when a selection event happens, and if the selection is out of bounds, it will cause an error.  

As soon as any edit is done to a table, the data will be pushed back into the struct for that segment of data.  The file name in the `File` tab will be updated as `From Table`.

Data is automatically stored into Historical Data table when app loads in.

TODO: ??Although Strategy updates will also be done live within the app, it is setup now to just read the information from the file and put it in table.


### Data Structures

The data read from files is read into three structs.  While similar, the structs have slightly different formats to deal with the data, and the way it is accessed.

#### Wedges

The wedges are stored into a 1xP struct with fields 

Wedges are now plotted exponentially on the emissions graph.

### Graphs

Historical Data is plotted on the Emissions Graph, with the predictive line and flat line both coded in. 

Wedges can be specified on Strategy table and will be plotted on emissions graph.



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


## Output

All file saving dialogs open a window to choose the location and name of the file.  The default setting is txt.

### Save to File

Each section; Wedges, Constraints, and Strategy; have their own `Save to File` button.  This allows the data inputed into the table to be saved to a file in the same format as the given files.  This feature is useful to make small changes to these files in a grpahic setting.

### Output File

Data summarizing the wedges choosen can be viewed in a table, and then saved to a file.  This table is not editable, as all of it's information is drawn from other tables, namely Wedges and Strategy.
