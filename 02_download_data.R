
# create Data directory, if it doesn't already exist
if (!dir.exists("Data")){
  dir.create("Data")
}


# 1) get the UN data
download.file("https://population.un.org/wpp/Download/Files/1_Indicators%20(Standard)/EXCEL_FILES/3_Mortality/WPP2019_MORT_F07_2_LIFE_EXPECTANCY_0_MALE.xlsx",
              destfile = "Data/wpp2019_male_e0.xlsx")
download.file("https://population.un.org/wpp/Download/Files/1_Indicators%20(Standard)/EXCEL_FILES/3_Mortality/WPP2019_MORT_F07_3_LIFE_EXPECTANCY_0_FEMALE.xlsx",
              destfile = "Data/wpp2019_female_e0.xlsx")

# 2) download the WHO data:
download.file("http://apps.who.int/gho/athena/data/GHO/WHOSIS_000001,WHOSIS_000015,WHOSIS_000002,WHOSIS_000007?filter=COUNTRY:*&ead=&x-sideaxis=COUNTRY;YEAR&x-topaxis=GHO;SEX&profile=crosstable&format=csv",
              destfile = "Data/WHO_e0.csv")

# done
