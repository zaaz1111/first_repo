#This is my code for Izzy
shelf(tidyverse, readxl, here)

#Read in the data, making specifications for each column
##Importantly, we are really only doing this for the dates and the numerics, as
##the others have no immediate relevance and we can deal with the default (character)
##format easily enough
sealdata<-read_xlsx(here('raw data/seal sanctuary data.xlsx'),sheet=1,col_types = 
                      c('guess','guess','guess','date','guess','numeric','numeric','numeric',
                        'numeric','numeric','numeric','numeric','guess'))%>%
  #pipe the data to mutate immediately, and make new columns that do the length
  #standardization immediately
  mutate(ax_sl_std=sealdata$Width_ax_cm/sealdata$`Standard _length_cm`,
         fprint_sl_std=sealdata$Footprint/sealdata$`Standard _length_cm`,
         vol_sl_std=sealdata$Volume_m3/sealdata$`Standard _length_cm`,
         so_no_head_sl_std=sealdata$Volume_no_head_m3/sealdata$`Standard _length_cm`)

#Subset the drone data
drone<-sealdata%>%
  subset(subset=sealdata$File_type=="Drone")

#Subset the scan data
scan<-sealdata%>%
  subset(subset=sealdata$File_type=="Scan")
