#This is my code for Izzy
shelf(tidyverse, readxl, here)

sealdata<-read_xlsx(here('raw data/seal sanctuary data.xlsx'),sheet=1,col_types = 
                      c('guess','guess','guess','date','guess','numeric','numeric','numeric',
                        'numeric','numeric','numeric','numeric','guess'))%>%
  mutate(ax_sl_std=sealdata$Width_ax_cm/sealdata$`Standard _length_cm`,
         fprint_sl_std=sealdata$Footprint/sealdata$`Standard _length_cm`,
         vol_sl_std=sealdata$Volume_m3/sealdata$`Standard _length_cm`,
         so_no_head_sl_std=sealdata$Volume_no_head_m3/sealdata$`Standard _length_cm`)

drone<-sealdata%>%
  subset(subset=sealdata$File_type=="Drone")

scan<-sealdata%>%
  subset(subset=sealdata$File_type=="Scan")
