# Climate Wedges Matlab App

# Engineering 7 Final Project S18

By Nico Carballal, Cheljea Jang, Josh DeWitt

\#ThanksTina

Below is the rough draft/live draft of the write up with features of the app as they are implemented, as well as possible improvements.

## Data Input

Fundamentally, data can be fed in through two methods.  Through text files in the format specified in the assignment PDF, or through tables.

### Text Files

Text files can be given as an input to the app, in the order of Wedges, Constraints, Strategy.  We use varargin so that any number of files can be given as an input.  The other files can be given through the GUI.  A text input field appears for each file, with an indicator of whether or not it has been entered into the program.  When a file is entered, the field will grey out.  A `Browse...` Button appears to allow a user to navigate to the relavent file.  If a file or file location entered is invalid, an error message will display at the bottom of the screen.

TODO: offer way to change text file (ie delete the struct and allow it to be reentered).  Error message changes text color, flash indicator?  When text changed, revert color to black.

### Tables

Data can also be entered into tables for Wedges and Constraints.  Strategy updates will be done live within the app to show changes, so this table is omitted for now.

TODO: make tables with input.  Allow tables to read file and display it in a more readable form.  Allow changes to file from table, additions/subtractions.  Delete/add rows?
