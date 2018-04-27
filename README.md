# E7-Final-Project-S18

## Climate Wedges

MATLAB App to model climate change mitigation through climate wedges

Nico Carballal, Cheljea Jang, Josh DeWitt

#### Inputs:

Wedges, Constraints, and Strategy can be inputted through a file or by directly in a table.  The file path can be typed into the text box, or the ‘Browse…’ button can be used to select the file.  When a file is selected, the header is cross-checked with given headers, and each line is checked to ensure that there are the right number of items.  This information is then stored into global structures and displayed in tables which can be edited to view or change data.  


#### Editing Data:

Cells must be reselected after every row operation, due to the static indices Matlab stores.  ‘Add Row Below’, without a recent cell selection, will act as ‘Add Row at Bottom’, so a row can always be added without cell selection. The row operations work by taking the data from the table and inserting a blank row vector of cells, or removing it.  After any cell operation, including editing, the information is stored back into the structure.


The wedges are stored in a struct with each column name as a field, with the ID as the position within the struct array.  The strategies are stored in a similar way, with ID and Start Year as the fields.  Their position is unrelated to their ID, but must be sorted by Start Year before they can be plotted.  The sorting function sorts wedges with the same start year in order of ascending ID for convenience while plotting.  Constraints are stored slightly differently, with the Sector stored as the field name.  When adding a constraint through the table, a filler sector is assigned because a blank character vector cannot be a field name to a structure.

Every table can be saved to a file.  Output data is shown in a table, and can be saved with the button in the corner. Wedges, Constraints, and Strategy can also be saved to pass the information to another person or session.  

#### Graphing:

When the app starts, historical data, a Business As Usual prediction line, and a flatline prediction are plotted. Once wedges and a strategy are input, wedges are graphed at the push of a button.  The flatline prediction will move based on the first year a strategy is implemented.  Wedges can be plotted in any year between 2018 and 2068, and are labeled by their ID and a color corresponding to their category. 

CO2 concentrations and warming trends are graphed in another tab for easy access while not cluttering the main wedges graph. The user can switch between the two graphs and also adjust the lambda value for calculating warming. Data will already be plotted even without any wedges to reflect historical data and the business as usual prediction.  As wedges are added, the data is updated with the reduced emissions.  As each wedge is added, an array of emissions is updated from the wedge’s start year to 2068 with the reduced emissions.

#### Constraints:

Constraints are checked at each edit to ensure no constraints are violated.  The total number of each sector is calculated and stored in a separate structure.  Any violations, whether in sector usage or single wedge, are displayed in an alert box, and the offending wedges are highlighted in red.  All wedges that fall under the constraint are highlighted, allowing the user to select which one should be removed.  While there are violations, the Graph button is disabled, and is only re-enabled when violations have been cleared.

#### Calculations:

Wedges are curved exponential functions, like the prediction line.  A linear regression in log-log space is used, with base form y = a*exp(b*t), where a is the emission value at the starting year, b is a coefficient of growth, and t is (time - starting year). If the predicted emissions in 50 years is less than the current year, the wedge is instead plotted as a straight line, since the exponential function will become arbitrarily close to a line when the starting and ending emissions values are nearly the same. The regression subfunction takes a function handle as an input, which allows us to stack prior wedges and plot wedges with different starting years.

The number of wedges to flatline to current year values is determined by calculating the predicted emissions 50 years in the future. From there, each wedge will have a 1 GtC/year impact, meaning that the difference between the predicted value 50 years in the future and the current value is the number of wedges needed.  Since any wedge below the flatline is a straight line, the wedge’s contribution at 2068 is dependent solely on the start year. Thus, a single wedge’s contribution at 2068 is determined, which helps determine the amount of wedges to go from flatline to 1990 levels. Finally, the ceiling is taken between the summation of the wedges above flatline and below flatline.

#### Advanced Features:

1. Stabilization wedges can be plotted at any years between 2018 & 2068
2. Brief, explanatory text is shown in “Pick Wedges” Tab upon selection of strategy cell
3. Unique feature allows user to edit and save their custom edited constraints, strategy, and wedges tables to their own files.

￼![Why didn't Nico save the files?](https://i.imgur.com/I9DSQld.png "Explanatory Picture 1")

![To be honest, it's not like I would have either](https://i.imgur.com/F2cUi8a.png "Explanatory Picture 2")
