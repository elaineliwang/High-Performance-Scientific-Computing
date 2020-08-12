program taylor
    implicit none                  
    real (kind=16) :: x, sin_true, y
    real (kind=16), external :: sinetaylor
    integer :: n

    n = 20               ! number of terms to use
    x = 1.0
    sin_true = sin(x)
    y = sinetaylor(x,n)   ! uses function below
    print *, "x = ",x
    print *, "n = ",n
    print *, "sin_true  = ",sin_true
    print *, "sintaylor = ",y
    print *, "error     = ",y - sin_true

end program taylor