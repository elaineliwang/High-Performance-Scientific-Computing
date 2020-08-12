def exp1(x,n,debug=True):
    import numpy as np
    if n < 0:
        print "*** Invalid input -- n must be non-negative integer"
        partial_sum = np.nan
    else:
        term = 1
        partial_sum = term 
        j = 1
        while (j < n+1):
            term = float(term*x/j) 
            previous_sum = partial_sum
            partial_sum = partial_sum + term
            if debug:
                print "j =",j, ",term =%21.14e" % term
           # "partial_sum updated from" 1.000000000000000e+00 to 2.000000000000000e+00
                print "  partial_sum updated from%21.14e"% previous_sum,"to %21.14e"% partial_sum
            j = j + 1
    return partial_sum

def sin1(x,n,debug = False):
    import numpy as np
    if n < 0:
        print "*** Invalid input -- n must be non-negative integer"
        partial_sum = np.nan
        
    else:
        term = 1
        partial_sum = 0
    
        for j in xrange(n):
            term = float(term*x/(j+1)) 
            if ((j+1)%2 == 0) :
                s = 0
            else:
                s = -1
                if  (j%4 == 0):
                    s = 1
            previous_sum = partial_sum
            partial_sum = float(partial_sum + s*term)
            if debug:
                print "j =", j+1 , "term = %21.4e" %term
                print "  partial_sum updated from%21.14e"% previous_sum,"to %21.14e"% partial_sum
                break 
    return partial_sum