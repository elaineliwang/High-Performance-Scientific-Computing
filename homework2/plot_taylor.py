import matplotlib
matplotlib.use("Agg")  
import pylab as pylab
from pylab import *
from math import *
x = pylab.linspace(-10, 10, 1000)
pylab.plot(x, x)   
pylab.plot(x, x-x**3/factorial(3))   
pylab.plot(x, x-x**3/factorial(3)+x**5/factorial(5))  
pylab.plot(x, x-x**3/factorial(3)+x**5/factorial(5)-x**7/factorial(7))  
pylab.ylim(-10,10) 
pylab.plot([-10,10], [0,0])  # plot x-axis as black line
pylab.plot([0,0],[-10,10])  # plot y-axis as black line    
fname = 'plot_taylor.png'
savefig(fname)
print "Created %s"  % fname