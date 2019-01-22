!How to loop in fortran
program testloop
integer :: i, j, k
j = 15
k = (j + 13) / 27
do while (k < 10)
    k = k + 1
    i = 3 * k - 1
    print *, 'i = ',i
    print *, 'j = ',j
    print *, 'k = ',k
end do
end program testloop