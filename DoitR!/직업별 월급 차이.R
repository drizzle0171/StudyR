#직업별 월급 차이

class(welfare$code_job)
table(welfare$code_job)

#직업 코드 전처리
library(readxl)
list_job <- read_excel("Koweps_Codebook.xlsx", col_names = T, sheet=2)
head(list_job)
dim(list_job)

welfare <- left_join(welfare, list_job, id = "code_job")
welfare %>%
  filter(!is.na(code_job)) %>% 
  select(code_job, job) %>% 
  head(10)

#그래프
job_income <- welfare %>% 
  filter(!is.na(job) & !is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income))

head(job_income)

top10<- job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)

top10

ggplot(data = top10, aes(x=reorder(job, mean_income), y = mean_income)) + geom_col()+coord_flip()
#그래프 기본값 = x축이 서로 겹쳐져 알 수가 없음
#오른쪽으로 90회전: coord_flip()

bottom10 <- job_income %>% 
  arrange(mean_income) %>% 
  head(10)

bottom10

ggplot(data = bottom10, aes(x=reorder(job, -mean_income), y = mean_income)) + geom_col()+coord_flip()+ylim(0, 850)
