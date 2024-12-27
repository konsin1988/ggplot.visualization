library(ggplot2)
library(dplyr)
library(data.table)

dt <- fread('example_data.csv')
str(dt)
head(dt)

p <- ggplot(dt, aes(x = date, y = percent, color=system, group = system))+
  geom_line(linewidth = 2)+
  geom_point(shape = 21, size = 2.5, fill = 'black', 
             stroke = 1.8)+   # толщина обводки точек
  geom_vline(xintercept = 7.5, color = 'red', linetype = 3)+
  scale_color_manual(values = c('orangered1', 'red', 'cyan', 'yellow1', 'springgreen2'))+
  scale_y_continuous(breaks = c(0, .04, .08, .11, .15), 
                     limits = c(0, .15), 
                     labels = scales::percent)+
  xlab('')+
  ylab('')+
  ggtitle('Top 5 Linux distributions')+
  theme_classic()

p + theme(
  legend.title = element_blank(),  
  legend.position = 'top',
  plot.background = element_rect(fill = 'black', color = 'black'),
  legend.background = element_rect(fill = 'black'),
  axis.text = element_text(color = 'white'),
  legend.box.background = element_rect(fill = 'black'),
  panel.background = element_rect(fill = 'black'),
  axis.text.x = element_text(angle = 30, size = 12, face = 'bold'),
  axis.text.y = element_text(size = 12, face = 'bold'),
  legend.text = element_text(color = 'white', face = 'bold', size = 10),
  panel.grid.major.y = element_line(color = '#d4d2c1', size=.08, linetype = 5),
  panel.grid.major.x = element_line(color = '#d4d2c1', linewidth =.05),
  plot.margin = unit(x=c(5,0,5,0), units = 'mm'),
  title = element_text(color='white', face = 'bold', 
                       family = 'italic')
)

# текст на графике
library(grid)
grid.text("Data sourse: The DistroWatch's page Hit Ranking (Nov.23, 2011)", 
          x = 0.02, y = 0.02, just = c('left', 'bottom'),
          gp = gpar(fontface = 'bold', fontsize = 9, col = 'white'))
grid.text('www.pingdom.com', 
          x = 0.98, y = 0.02, just = c('right', 'bottom'),
          gp = gpar(fontface = 'bold', fontsize = 9, col = 'white'))





