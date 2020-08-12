
program main

    use random_util, only: init_random_seed
    use approx_norm, only: approx_norm1, nsamples

    implicit none
    real(kind=8), allocatable, dimension(:,:) :: a
    real(kind=8) :: colsum, colsum_max, anorm
    integer :: n, seed, i, j,nthreads,method

    open(unit=21, file='input_data.txt', status='old')
    read(21,*) n
    read(21,*) seed
    read(21,*) nsamples
    read(21,*) method
    call init_random_seed(seed)  
     
    !Specify number of threads to use:
     nthreads = 1  ! need this value in serial mode
    !$ read(21,*) nthreads
    !$ call omp_set_num_threads(nthreads)
    !$ print"('nthreads =  ' ,i3)",nthreads
    ! Create random matrix:
    allocate(a(n,n))
    call random_number(a)

    !Compute 1-norm as max column sum:
   
    colsum_max = 0.d0
    !$omp parallel do private(i,colsum)&
    !$omp          reduction(max: colsum_max) 
    
    do j=1,n
        colsum = 0.d0
        do i=1,n
            colsum = colsum + abs(a(i,j))
            enddo
        
        colsum_max = max(colsum_max, colsum)
        enddo
            
    ! Estimate 1-norm:
    call approx_norm1(a, anorm, method)
    
    print 600, n, colsum_max
600 format("Using matrix with n = ",i5,"   True 1-norm:   ",f16.6)
    print 601, nsamples, anorm
601 format("Based on ",i6," samples, Approximate 1-norm: ",f16.6)

end program main
