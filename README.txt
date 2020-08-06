1.) Compile c wrapper with:

gfortran -fPIC -c chiral.f90 new_chiral_wrap.f90

2.) Then compile cython extension with:

python setup.py build_ext --inplace

3.) run test with:

python3 test.py

enjoy importing error :(
