library(ggplot2)
library(dplyr)
library(data.table)

mtcars_f <- mtcars %>%
  mutate(am = factor(am, labels = c('Auto', 'Manual')),
         vs = factor(vs, labels = c('V', 'S')))
str(mtcars_f)

# ------------ point + color -----------------------
ggplot(mtcars_f, aes(x = mpg, y = hp, col = am))+
  geom_point(size = 2)+
  scale_x_continuous(name = '	Miles/(US) gallon',
                     breaks = seq(20,35,5),
                     limits = c(5, 35))+
  scale_y_continuous(name = '	Gross horsepower',
                     breaks = seq(50, 350, 30),
                     limits = c(40, 350))+
  scale_color_manual(values = c('green', 'blue'),
                     name = 'Transmission',
                     labels = c('Auto', 'Manual'),
                      )

# ------------- density -------------------------------
ggplot(mtcars_f, aes(x = hp, fill = am, group = am))+
  geom_density(alpha = 0.7, color = NA, adjust = 1.3)+
  scale_fill_manual(values = c('#f88379', '#ffcba4'),
                     name = 'Transmission',
                     labels = c('A', 'M'))

# ---------------- point + size ------------------
ggplot(mtcars_f, aes(hp, mpg, size = disp, shape = vs))+
  geom_point()+
  scale_size_continuous(name = 'Displacement', 
                        breaks = seq(100, 400, 50))+
  scale_shape_discrete(name = 'Engine',
                       labels = c('V-shaped', 'Straight')
                       )

# ------------- boxplot ----------------------  
ggplot(mtcars_f, aes(x = am, y = hp))+
  geom_boxplot()+
  scale_x_discrete(name = 'Transmission', 
                   labels = c('Automat', 'Manual trans'))

# ---------- Task -------
# Ось X - "Длина чашелистика".
# Ось Y - "Длина лепестка".
# Название легенды - "Вид цветка".
# Расшифровка легенды: "Ирис щетинистый", 
# "Ирис разноцветный", "Ирис виргинский".
  
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species, group = Species))+
  geom_point()+
  geom_smooth(method = lm)+
  scale_x_continuous(name = 'Длина чашелистика', 
                     breaks = seq(4, 8, 1),
                     limits = c(4,8))+
  scale_y_continuous(name = 'Длина лепестка', 
                     breaks = seq(1,7,1))+
  scale_color_discrete(name = 'Вид цветка',
                       labels = c("Ирис щетинистый", 
                                  "Ирис разноцветный", 
                                  "Ирис виргинский"))
