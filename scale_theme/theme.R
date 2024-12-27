library(ggplot2)
library(dplyr)
library(data.table)
library(ggthemes)

# https://ggplot2.tidyverse.org/reference/theme.html - full guide

ggplot(mtcars_f, aes(x = am, y = hp, fill = vs))+
  geom_boxplot()+
  scale_x_discrete(name = 'Transmission')+
  scale_y_continuous(name = 'Gross horsepower')+
  scale_fill_manual(values = c('#7b98b7', '#ffb300'), 
                    name = 'Engine',
                    labels = c('V-shaped', 'Straight'))+
  theme(axis.text.x = element_text(size = 8, face = 'bold'),
        axis.line = element_line(color = '#7b98b7', linewidth = 1.2),
        axis.title = element_text(size = 15, 
                                  face = 'italic', 
                                  color = '#7b98b7'),
        legend.position = 'right',
        legend.background = element_rect(fill = '#c2f2d0'),
        plot.background = element_rect(fill='#fdf5c9'),
        panel.background = element_rect(fill = '#c2f2d0'),
        panel.grid = element_line(color = '#ffc5d9'))

ggplot(mtcars_f, aes(x = am, y = hp, fill = vs))+
  geom_boxplot()+
  theme_excel()

ggplot(mtcars_f, aes(hp, mpg, color=am))+
  geom_point()+
  theme_few()

ggplot(iris, aes(Species, Petal.Length)) + 
  geom_boxplot()

png('test.png')
ggplot(iris, aes(y = Petal.Length, x = Species))+
  geom_boxplot()
dev.off()

?ggsave
?par
