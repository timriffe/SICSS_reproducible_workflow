
# how big are differences: compare sources
fig1 <-
e0 %>% 
  filter(year > 2000) %>% 
  ggplot(aes(x = year, 
             y = e0, 
             color = sex, 
             linetype = source, 
             group = interaction(sex, source))) +
  geom_line(size = 1.5) +
  labs(title = "wildly different life expectancy estimates for Nigeria")+
  theme_minimal() +
  geom_point(size = 2)

ggsave("fig1.pdf", fig1)



# would need to save pdf also here:
# plot the difference
e0diff %>% 
  ggplot(aes(x = year, y = e0diff, color = sex)) +
  geom_line(size = 1.5) +
  theme_minimal() +
  labs(y = "UN - WHO e0 estimates",
       title = "Large discrepancies in life expectacy estimates for Nigeria")





