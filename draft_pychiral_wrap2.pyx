import numpy

# GUIDE 1 =  http://www.acme.byu.edu/wp-content/uploads/2014/09/Cython-Wrapping1.pdf
# GUIDE 2 =  https://maurow.bitbucket.io/notes/calling_fortran_from_python.html

# Telling cython I'm pulling function from external source (object file compiled 
# from chiral_wrap.f90 and chiral.f90). 
# All object files will be linked when compiling this cython extension module

cdef extern: #pull from external source: e.g header file containing external funcs I want

    #declare chiral_pot wrapper so cython knows to go looking for it 

    #no need for separate header file since c_chiral_pot can be declared here

    void c_chiral_pot(int* nx1, int* ny1, int* nz1, int* nx2, int* ny2, int* nz2, int* nx3, int* ny3, int* nz3,
      int* nx4, int* ny4, int* nz4, int* m1, int* m2, int* m3, int* m4, int* t1, int* t2, int* t3, int* t4, double* L,
      double* twistx, double* twisty, double* twistz, double *matel_real, double *matel_im) 

    #According to GUIDE 1, pointers should be used to pass all arguments interfacing between c and fortran.
    #Else, the python script containing this cython module may crash.


#define cython version of chiral_pot with "def" so I can call it directly from python ^_^

def chiral_pot(int nx1, int ny1, int nz1, int nx2, int ny2, int nz2, int nx3, int ny3, int nz3,
    int nx4, int ny4, int nz4, int m1, int m2, int m3, int m4, int t1, int t2, int t3, int t4, double L,
    double twistx, double twisty, double twistz)

    cdef double matel_real, matel_im #declare matrix elements with ctype

    c_chiral_pot(&nx1, &ny1, &nz1, &nx2, &ny2, &nz2, &nx3, &ny3, &nz3,
      &nx4, &ny4, &nz4, &m1, &m2, &m3, &m4, &t1, &t2, &t3, &t4, &L,
      &twistx, &twisty, &twistz, &matel_real, &matel_im) 

      #matel_real and matel_im will retrieve the goodies

    return matel_real, matel_im #convert to python type (hopefully np.double)

