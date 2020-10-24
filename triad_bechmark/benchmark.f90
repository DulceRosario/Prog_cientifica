program benchmark
    implicit none
    real(16) :: MFLOPS

    INTEGER :: i

     do i=1,100000, 10
    
        CALL getMFlops(i ,MFLOPS)
       
    end do
    call execute_command_line('gnuplot -p plot.plt')

end program benchmark


subroutine getMFlops(N,  MFLOPS)
implicit none
INTEGER*4,intent(in) :: N
real(16),intent(out) ::  MFLOPS
INTEGER :: i,j,R,fu
DOUBLE PRECISION, dimension(N) :: A,B,C,D
DOUBLE PRECISION:: S,E, exec_seg

R=1
do i=1,N
    A(i) = 0.d0; B(i) = 1.d0
    C(i) = 2.d0; D(i) = 3.d0
end do

open (newunit=fu, action='write', file='data.txt', position='append')

do 
    call get_walltime(S)
    do j=1,R
        do i=1,N
            A(i) = B(i) + C(i)*D(i) 
        end do
        if(A(2).lt.0) call dummy(N,A,B,C,D) 
    end do

    call get_walltime(E)! get time stamp
    exec_seg= E-S
    if(exec_seg.ge.0.01d0) exit
    R = R*2
enddo    
    MFLOPS = (N*R*2.d0)/((exec_seg)*1.d6)
    print *, "Length: ",N," R:", R, "Tiempo:", exec_seg, "  MFLOP/s: ",MFLOPS

    write (fu, *) N, MFLOPS
    close (fu)


end subroutine 






subroutine dummy(N,A, B, C, D)
    INTEGER*4,intent(in) :: N
    DOUBLE PRECISION, dimension(N) :: A,B,C,D
    D= A+B+C
    RETURN
end

