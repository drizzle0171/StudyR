#성별에 따른 월급 차이

#성별
class(welfare$sex) #타입 확인
table(welfare$sex)# 1이 남자, 2가 여자

welfare$sex <- ifelse(welfare$sex ==1, "male", "female")
table(welfare$sex)
qplot(welfare$sex)

#월급
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income) + xlim(0, 1000)

welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income) #결측치 = NA
table(is.na(welfare$income))

sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))
sex_income

ggplot(data = sex_income, aes(x=sex, y=mean_income)) + geom_col()