using RCall
R"library(rgl)"
R"library(plot3D)"
R"library(plot3Drgl)"

R"triangles3d(cbind(x=rnorm(9), y=rnorm(9), z=rnorm(9)), col='green')"
R"decorate3d()"
R"bg3d('lightgray')"
R"aspect3d(1,1,1)"

R"with(iris, plot3d(Sepal.Length, Sepal.Width, Petal.Length,
type='s', col=as.numeric(Species)))"

R"""
data(volcano)
y <- 5 * volcano + 20 * sin(volcano)
x <- 10 * (1:nrow(y))
z <- 10 * (1:ncol(y))
surface3d(x, z, y, col='green', alpha=0.8)
"""
# R"rglwidget()"
R"""
data(iris)
x <- rnorm(10000)
y <- rnorm(10000)
z <- rnorm(10000)
rgl.bg(color = "grey") # Setup the background color
rgl.spheres(x, y, z, r = 0.5, color = rainbow(7))
"""
R"""
xyz <- matrix(rnorm(30000), ncol = 3)
plot3d(xyz)
arrow3d(xyz[1,], xyz[2,], type = 'extrusion', col = 'red')
arrow3d(xyz[3,], xyz[4,], type = 'flat',      col = 'blue')
arrow3d(xyz[5,], xyz[6,], type = 'rotation',  col = 'green')
arrow3d(xyz[7,], xyz[8,], type = 'lines',     col = 'black')
arrow3d(spriteOrigin = xyz[9:10000,],            col = 'purple')
"""

R"""
library(matlib)
vec <- rbind(diag(3), c(1,1,1))
rownames(vec) <- c("X", "Y", "Z", "J")
open3d()
vectors3d(vec, color=c(rep("black",3), "red"), lwd=2, radius=1/25)
# draw the XZ plane, whose equation is Y=0
planes3d(0, 0, 1, 0, col="gray", alpha=0.2)
vectors3d(c(1,1,0), col="green", lwd=2, radius=1/25)
"""

R"""
x = seq(1,10)
y = seq(1,10)
z = matrix( rnorm(100000), nrow=length(x), ncol=length(y) );
hist3D(x, y, z)
plotrgl()
"""

R"""
# create grid matrices
X <- seq(0, pi, length.out = 100)
Y <- seq(0, 2*pi, length.out = 100)
M <- mesh(X, Y)
phi <- M$x
theta <- M$y
# x, y and z grids
r <- sin(4*phi)^3 + cos(2*phi)^3 + sin(6*theta)^2 + cos(6*theta)^4
x <- r * sin(phi) * cos(theta)
y <- r * cos(phi)
z <- r * sin(phi) * sin(theta)
# full colored image
surf3D(x, y, z, colvar = y, colkey = FALSE, shade = 0.5,
box = FALSE, theta = 60)
plotrgl()
"""

R"""
X <- seq(0, pi, length.out=100)
Y <- seq(0, pi, length.out=100)
M <- mesh(X, Y)
z <- sin(M$x) + cos(M$y)
surf3D(M$x,M$y,z, shade=0.3, bty = 'f', ticktype = 'detailed', plot=FALSE)
plotrgl(lighting=TRUE, smooth=TRUE)
"""

R"""
# http://www.rforscience.com/portfolio/shell/
# par(mar = c(0, 0, 0, 0))
X  <- seq(0, 4*pi, length.out = 200)
Y  <- seq(0, 2*pi, length.out = 100)
M  <- mesh(X, Y)
u  <- M$x
v  <- M$y
x  <- 1.2 ^ u * (1 + cos(v)) * cos(u)
y  <- 1.2 ^ u * (1 + cos(v)) * sin(u)
z  <- 1.2 ^ u * sin(v) - 1.5 * 1.2 ^ u
surf3D(x, y, z, colvar = y, colkey = FALSE, shade = 0.5,
       theta = 150, box = FALSE, plot = FALSE)
plotrgl(lighting = TRUE, smooth = TRUE)
"""

R"""
Data <- expand.grid(x=seq(0,999),y=seq(0,999))
Data$z <- Data$x^2+Data$y^2
zmat <- matrix(Data$z,1000,1000)
persp3d(x=seq(0,999), y=seq(0,999), z=zmat, front='lines', col='lightblue')
"""
