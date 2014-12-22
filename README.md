Codebook
The dataset includes data about
The experiments which have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist...
Detailed info about the raw data can be http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
.
Current dataset represents the values of the mean and standart deviation values for parametrs like acceleration, speed etc for different subsets of data.
Each subset represents particular object of observation at a particular type of physical activity.


Data from "x_ "y_" and "subject_test" (physical parametrs, Type of activity and observation object) were combined separately for test and train samples, columns renamed appropriately (from features.txt). After that both samples were merged in a single one.
Columns which do not represent mean or standart dev. values were dropped.

Column Activity number was replaced by activity_name.
After that a summary table was created. Summary table represents the values of the mean and standart deviation values for parametrs like acceleration, speed etc for different subsets of data.
Each subset represents particular object of observation at a particular type of physical activity.

Original data was produced by
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universitа degli Studi di Genova.
