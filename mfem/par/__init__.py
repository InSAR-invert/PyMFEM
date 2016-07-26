from mpi4py import MPI


## libmfem.a is linked only with _array.so
## this make sure that symbols are resovled
import sys, ctypes
rtld_now = sys.getdlopenflags()
sys.setdlopenflags(ctypes.RTLD_GLOBAL|sys.getdlopenflags())

from  array import *
from  operators import *
from  blockoperator import *
from  blockvector import *
from  blockmatrix import *
from  coefficient import *
from  lininteg import *
from  mesh import *
from  fe_coll import *
from  vector import *
from  fespace import *
from  linearform import *
from  bilininteg import *
from  gridfunc import *
from  mesh import *
from  intrules import *
from  fe import *
from  bilinearform import *
from  sparsemat import *
from  densemat import *
from  solvers import *
from  sparsesmoothers import *
from  eltrans import *
from  geom import *
from  vertex import *
from  table import *
from  element import *
from  nonlininteg import *
from  nonlinearform import *
from  pmesh import *
from  pfespace import *
from  plinearform import *
from  pbilinearform import *
from  pgridfunc import *
from  hypre import *

sys.setdlopenflags(rtld_now)
