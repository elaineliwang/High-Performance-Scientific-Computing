module approx_norm
    use omp_lib
    implicit none
    integer :: nsamples, seed
    save

contains

    subroutine approx_norm1(a, anorm, method)

    implicit none
    real(kind=8), dimension(:,:), intent(in) :: a
    integer , intent(in) :: method
    real(kind=8) :: a2
    integer :: n, j,i
    real(kind=8), dimension(:), allocatable :: x,a1
    real(kind=8), intent(out) :: anorm
    
    n = size(a,1)  
    allocate(x(n))
    allocate(a1(n))
    call random_number(x)
    do i =1,n
            a1(i) = sum(a(i,:)*x)
           enddo
    anorm = sum(abs(a1))/sum(abs(x))
        !$omp parallel do private(i,x) if(method ==1)
        do j=1,nsamples
            call random_number(x)
            do i =1,n !$omp parallel do if(method == 2)
             a1(i) = sum(a(i,:)*x)
            enddo
            a2 = sum(abs(a1))/sum(abs(x))
              if (anorm < a2) then 
                anorm = a2 
                endif
            enddo
       
    end subroutine approx_norm1
end module approx_norm
