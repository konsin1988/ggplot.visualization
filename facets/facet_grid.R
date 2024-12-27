library(ggplot2)
library(dplyr)
library(data.table)

ggplot(mtcars, aes(hp, mpg, colour = factor(am), 
                   size = disp))+
  geom_point()

str(mtcars)
ggplot(mtcars, aes(x = mpg, color = factor(am)))+
  geom_density()+
  facet_grid(vs ~ am)

str(diamonds)

ggplot(diamonds, aes(x = carat, fill=clarity))+
  geom_density(adjust=1)+
  facet_grid(. ~ cut)

# -----------------------------
mtcars <- mtcars %>%
  mutate(am = factor(am, labels = c('Auto', 'Manual')), 
         vs = factor(vs, labels = c('V', 'S')))

ggplot(mtcars, aes(hp, fill = vs))+
  geom_dotplot(color = 'white')+
  facet_grid(am ~ vs, margins = T)
str(mtcars)

ggplot(mtcars, aes(hp, mpg))+
  geom_point(aes(color = factor(cyl))) +
  facet_grid(. ~ am)+
  geom_smooth(method = 'lm')

# ------------- FACET_WRAP -----------------
ggplot(diamonds, aes(carat))+
  geom_density()+
  facet_wrap( ~ cut + color)

ggplot(mtcars, aes(mpg, color=vs))+
  geom_density()+
  facet_wrap(~ am + vs, ncol = 4) 

ggplot(diamonds, aes(carat, price))+
  geom_smooth()+
  facet_grid(. ~ cut)

# ---------------- TASKS -----------------
# Используя facet_grid постройте следующий график 
# и сохраните его в переменную mpg_facet
ggplot(mtcars, aes(mpg))+
  geom_dotplot()+
  facet_grid(am ~ vs)

# Используя данные iris, постройте график плотности 
# для переменной Sepal.Length. 
# Разбейте график на части по переменной 
# Species при помощи facet_wrap. 
# Результат сохраните в переменную sl_wrap.
ggplot(iris, aes(x = Sepal.Length))+
  geom_density()+
  facet_wrap(~ Species)

# постройте график, иллюстрирующий взаимосвязь 
# переменных Sepal.Length и Sepal.Width 
# внутри каждого вида (переменной Species), 
# при помощи facet_wrap().
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point()+
  geom_smooth()+
  facet_wrap( ~ Species)

# выясним, есть ли различия в бюджетах фильмов 
# разного жанра из года в год.
movies_data <- fread('myMovieData.csv', stringsAsFactors = T)
str(movies_data)

ggplot(movies_data, aes(x = Type, y = Budget))+
  geom_boxplot()+
  facet_grid(. ~ Year)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

