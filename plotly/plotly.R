library(ggplot2)
library(data.table)
library(plotly)

purchases <- fread('./dataset_5/purchases.csv')
str(purchases)

price.hist <- ggplot(purchases)+
  geom_histogram(aes(totalcents), fill = 'white', color = 'black')

interact.price.hist <- ggplotly(price.hist)

# --------------------------- teapot ---------------
teapot <- fread('teapot.csv')
str(teapot)

plot_ly(x = x, y = y, z = outer(x, y, f), type = 'surface')

i <- seq(1, nrow(teapot), 3)
j <- seq(2, nrow(teapot), 3)
k <- seq(3, nrow(teapot), 3)

plot_ly(
        x = teapot$x[1:3], 
        y = teapot$y[1:3], 
        z = teapot$z[1:3], type='mesh3d')

plot_ly(data = teapot[1:3],
        x = ~x,
        y = ~y,
        z = ~z,
        type = 'mesh3d') %>% add_mesh()


