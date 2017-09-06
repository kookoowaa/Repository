### 3D scatter
library(rgl)
attach(mtcars)
plot3d(wt,disp, mpg, main='3Dscalar')

mypal = c('blue','red', 'green')
factor(cyl)
plot3d(wt,disp, mpg, main='3Dscalar', col = mypal[factor(cyl)], size = 10)


### 3D surface
library(rgl)
z <- 2 * volcano
x <- 10 * (1:nrow(z))
y <- 10 * (1:ncol(z))
par(bg = 'slategray')
persp(x, y, z, theta = 135, phi = 30, col = 'green', scale = F, 
      ltheta = -120, shade = 0.75, border = NA, box = F)
persp3d(x, y, z, col = 'green3')
