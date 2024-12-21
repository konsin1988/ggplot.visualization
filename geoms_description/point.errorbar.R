library(ggplot2)
library(dplyr)
library(data.table)

str(diamonds)

ggplot(diamonds, aes(x = price)) +
  geom_histogram() +
  geom_smooth(aes(y = carat))


str(airquality)

gr_airquality <- airquality %>%
  group_by(Month) %>%
  summarise(mean_temp = mean(Temp), mean_wind = mean(Wind))

dt_airquality <- data.table(airquality)            
dt_airquality[
  ,mean_temp := mean(Temp), by=Month
][
  ,.(unique(mean_temp)), by=Month
]
ggplot(gr_airquality, aes(Month, mean_temp))+
  geom_line()+
  geom_point(aes(size = mean_wind, color = mean_wind))+
  geom_hline(yintercept = 75, linetype = 3, size = 1.2, alpha = 0.6, color='#D34523')

gr_mtcars <- mtcars %>%
  group_by(am, vs)%>%
  summarise(mean_mpg = mean(mpg),
            y_max = mean(mpg) + 1.96 * sd(mpg) / sqrt(length(mpg)),
            y_min = mean(mpg) - 1.96 * sd(mpg) / sqrt(length(mpg)))


ggplot(gr_mtcars, aes(x = factor(am), 
                      y = mean_mpg, 
                      colour = factor(vs),
                      group = factor(vs))) +
  geom_line() +
  geom_errorbar(aes(ymin = y_min, ymax = y_max), width = .4, size=1.3) +
  geom_point(size = 5, shape = 21, fill='white')

ggplot(mtcars, aes(x = factor(am), y = mpg)) +
  stat_summary(fun.data = mean_cl_boot, geom = 'errorbar')+
  geom_point()

df <- mtcars %>%
  mutate(am = factor(.$am))
  
ggplot(mtcars, aes(x = factor(am), y = mpg))+
  geom_violin()+
  geom_boxplot(width=0.2)
  
# ------------ Tasks -------------
sales = read.csv("https://stepik.org/media/attachments/course/724/sales.csv", 
                 stringsAsFactors = T)
str(sales)

ggplot(sales, aes(x = income, y = sale))+
  geom_point(aes(color = shop))+
  geom_smooth(method = 'lm')

ggplot(sales, aes(x = shop, y = income, color = season, group=season))+
  stat_summary(fun.data = mean_cl_boot, position = position_dodge(width=0.3))


p <- position_dodge(width=0.3)
ggplot(sales, aes(x = factor(date), y = sale, color = shop, group = shop))+
  stat_summary(fun.data = mean_cl_boot, 
               position = p, 
               geom='errorbar',
               width = 0.5)+
  stat_summary(fun.data = mean_cl_boot, 
               position = p, 
               geom='point')+
  stat_summary(fun.data = mean_cl_boot, 
               position = p, 
               geom='line')


ggplot(mtcars, aes(x = factor(am),
                   y = mpg,
                   col = factor(cyl),
                   group = factor(cyl)))+
  # stat_summary(fun = mean, geom = 'point')+
   stat_summary(fun.data = mean_cl_boot, geom = 'errorbar', width=0.5, 
                position = position_dodge(0.2))+
  stat_summary(fun = mean, geom = 'line', position = position_dodge(0.2))






