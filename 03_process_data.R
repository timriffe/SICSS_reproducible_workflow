source("01_install_load.R")


# what's the UN code for Nigeria?
Nigeria_code_UN <-
  countrycode("Nigeria",
              origin = 'country.name', 
              destination = "un" )

e0m <- 
  read_excel("Data/wpp2019_male_e0.xlsx", 
             skip = 16, 
             na = "...") %>% 
  dplyr::filter(`Country code` == Nigeria_code_UN) %>% 
  pivot_longer(`1950-1955`:`2015-2020`, 
               names_to = "period", 
               values_to = "e0") %>% 
  mutate(sex = "Male") %>% 
  select(period, sex, e0)

e0f <- 
  read_excel("Data/wpp2019_female_e0.xlsx", 
             skip = 16, 
             na = "...") %>% 
  filter(`Country code` == Nigeria_code_UN) %>% 
  pivot_longer(`1950-1955`:`2015-2020`, 
               names_to = "period", 
               values_to = "e0") %>% 
  mutate(sex = "Female") %>% 
  select(period, sex, e0)

# combine the two sexes from the UN data:
e0wpp <-
  bind_rows(e0m, e0f) %>% 
  separate(period, 
           into = c("year", NA), 
           sep = "-", 
           convert = TRUE) %>% 
  mutate(source = "WPP2019",
         year = year + 2.5) # mid period reference


#

e0who <- read_csv("Data/WHO_e0.csv",
                  show_col_types = FALSE) %>% 
  select(1, 2, contains("birth")) %>% 
  select(1, 2, !contains("HALE")) %>% 
  row_to_names(1) %>% 
  select(Country, Year, Male, Female) %>% 
  pivot_longer(c(Male, Female), 
               names_to = "sex", 
               values_to = "e0") %>% 
  clean_names() %>% 
  mutate(source = "WHO",
         e0 = as.double(e0),
         year = as.double(year) + .5) %>% 
  filter(country == "Nigeria")

# data used to make figure 1
e0 <-
  bind_rows(e0who,
            e0wpp)

