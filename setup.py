from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
import numpy
npy_include_dir = numpy.get_include()

ext_modules = [Extension("chirality1", ["draft_pychiral_wrap2.pyx"],
                         include_dirs = [npy_include_dir],
                         extra_objects=["chiral.o", "new_chiral_wrap.o"])]

setup(name = 'Chiral Potential Matrix Elements',
      cmdclass = {'build_ext': build_ext},
      ext_modules = ext_modules)