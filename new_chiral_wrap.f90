module new_chiral_wrap

  !Wrap chiral_pot for use in C that can then be passed to cython

  use iso_c_binding, only: c_double, c_int

  !expose chiral_pot to c, declaring argument c_types

  use chiral_potentials, only:  chiral_pot


  implicit none


contains

! The expression bind(c) tells the compiler to
! make the naming convention in the object file
! match the naming convention here.

  subroutine c_chiral_pot(nx1, ny1, nz1, nx2, ny2, nz2, nx3, ny3, nz3,&
    nx4,ny4,nz4,m1,m2,m3,m4,t1,t2,t3,t4,L,twistx,twisty,twistz, &
    matel_real, matel_im) bind(c)

    ! I am assuming that complex*16 means I have two real*8 values...

    complex*16 :: matel

    !All variables will be passed by reference
    !All inputs will come from c/cython, so declare them with c types

    real(c_double), intent(out) :: matel_real
    real(c_double), intent(out) :: matel_im

    integer(c_int), intent(in) :: nx1, ny1, nz1, nx2, ny2, nz2,&
      nx3, ny3, nz3, nx4,ny4,nz4,m1,m2,m3,m4,t1,t2,t3,t4

    real(c_double), intent(in) :: L, twistx, twisty, twistz


    matel = chiral_pot(nx1, ny1, nz1, nx2, ny2, nz2, nx3, ny3, nz3,&
      nx4,ny4,nz4,m1,m2,m3,m4,t1,t2,t3,t4,L,twistx,twisty,twistz)


    matel_real = RealPart(matel)

    matel_im = ImagPart(matel)

  end subroutine c_chiral_pot

end module new_chiral_wrap