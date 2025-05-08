#Press Ctrl+Shift+H to interactively choose the wanted directory
#OR (for Windows) copy (but don't paste) the directory path, which will look like this: 
#D:/Name/Bioacoustics and 
#run the next line of code
FolderPath <- normalizePath(readClipboard(), "/")
#set the working directory
setwd(FolderPath)
#In Linux, one can just copy-paste the folderpath directly:
setwd("~/Zoology/Bioacoustics dataset paper")

getwd() #To verify the current working directory (optional)

#Change the the path in quotes with your own directory path
#See the files in the folder (optional) 
list.files()

if (!require("exiftoolr")) install.packages("exiftoolr")
library(exiftoolr)
#Ignore "Warning message: package ‘exiftoolr’ was built under R version 4.3.3" 
#(if you see it)
#install_exiftool()  #Uncomment (remove #) and install if not already present

#Change the working directory to audiomoth_test:
setwd("~/Zoology/Paul-Pop_audiomoth_test")
getwd()
#Get the names (and extensions) of all the files present in the directory: 
file_names <- list.files()

#Extract all the meta-data:
data <- exif_read(file_names)

#View 10 rows of data from the created table (optional):
head(data, 10)
class(data)

#To prevent the writing of the table if one of the columns in the table in stored
#as a list, coerce all of the columns in the data frame to character:
data <- apply(data,2,as.character)

#Write this dataframe to a csv file
write.csv(data, "audiomoth_metdata.csv")

#Change the working directory to focal_test:
setwd("~/Zoology/Paul-Pop_focal_test")
getwd()
#Get the names (and extensions) of all the files present in the directory: 
file_names <- list.files()

#Extract all the meta-data:
data <- exif_read(file_names)

#View 10 rows of data from the created table (optional):
head(data, 10)
class(data)

#To prevent the non-writing of the table if one of the columns in the table in stored
#as a list, coerce all of the columns in the data frame to character:
data <- apply(data,2,as.character)

#Write this dataframe to a csv file
write.csv(data, "focal_metdata.csv")

