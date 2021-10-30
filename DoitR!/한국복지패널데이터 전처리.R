#한국복지패널데이터 전처리

library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
library(haven)
raw_welfare <- read.spss(file="Koweps_hpc10_2015_beta1.sav", to.data.frame = T)

welfare <- raw_welfare

head(welfare)

welfare <- rename(welfare,
                  sex = h10_g3, #성별
                   marriage = h10_g10, #혼인 상태
                  birth = h10_g4, #태어난 연도
                  religion = h10_g11, #종교
                  income = p1002_8aq1, #월급
                  code_job = h10_eco9, #직업 코드
                  code_region = h10_reg7) #지역 코드