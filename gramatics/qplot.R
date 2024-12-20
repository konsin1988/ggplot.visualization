library(ggplot2)
library(dplyr)

data('diamonds')

my_hist <- qplot(diamonds$depth, geom = 'histogram')

str(my_hist)

# color
qplot(x = price,
      y = carat,
      color = color,
      data = diamonds)

# shape of points
qplot(mpg, hp, 
      shape = as.factor(cyl), 
      color=as.factor(am), 
      size = I(4), 
      data = mtcars, 
      geom = 'point')

# price_carat_clarity_points
qplot(carat, price, 
      data = diamonds,
      color = clarity)

# histogram 
qplot(price, 
      data = diamonds, 
      geom = 'histogram',
      fill = color,
      col = I('black'))

# density 
qplot(price, 
      data = diamonds, 
      geom = 'density',
      fill = color,
      col = I('black'),
      alpha = I(0.3))

# density x diamonds
qplot(x, data = diamonds, geom = 'density')

qplot(x, 
      color = cut,
      data = diamonds, 
      geom = 'density' 
      )

# violin plot 
qplot(color, 
      price, 
      data = diamonds,
      geom = 'violin')






