!Fortran loop
program testloop
real :: i, j, k
j = 15
k = (j + 13) / 27
do while (k <= 10)
    k = k + 1.2
    i = 3 * k - 1
    print *, 'i = ',i
    print *, 'k = ',k
    print *, 'j = ',j
end do
end program testloop

