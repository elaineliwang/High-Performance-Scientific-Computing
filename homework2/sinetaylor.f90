function sinetaylor(x,n)
!==========================
    implicit none

    ! function arguments:
    real (kind=16), intent(in) :: x
    integer, intent(in) :: n
    real (kind=16) :: sinetaylor

    ! local variables:
    real (kind=8) :: term, partial_sum
    integer :: j,s

    term = 1.
    partial_sum = 0

    do j=1,n
        ! j'th term is  x**j / j!  which is the previous term times x/j:
        term = term*x/j  
            if(mod(j,2) == 0) then
            s = 0
            else if (mod(j-1,4) == 0) then
            s = 1
            else
            s = -1
            end if
        ! add this term to the partial sum:
            partial_sum = partial_sum + s*term   
            enddo
     sinetaylor = partial_sum  ! this is the value returned
end function sinetaylor
