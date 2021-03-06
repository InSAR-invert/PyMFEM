%module nonlinearform
%{
#include "fem/linearform.hpp"    
#include "fem/nonlininteg.hpp"
#include "fem/nonlinearform.hpp"
#include "numpy/arrayobject.h"
#include "pyoperator.hpp"     
%}

%init %{
import_array();
%}

%include "exception.i"
%import "operators.i"
%import "fespace.i"
%import "nonlininteg.i"
%import "../common/exception.i"

namespace mfem { 
%pythonprepend NonlinearForm::AddDomainIntegrator %{
#    if not hasattr(self, "_integrators"): self._integrators = []
#    self._integrators.append(nlfi)
    nlfi.thisown=0 
%}
%pythonprepend NonlinearForm::AddInteriorFaceIntegrator %{
#    if not hasattr(self, "_integrators"): self._integrators = []
#    self._integrators.append(nlfi)
    nlfi.thisown=0 
%}
%pythonprepend NonlinearForm::AddBdrFaceIntegrator %{
#    if not hasattr(self, "_integrators"): self._integrators = []
#    self._integrators.append(nlfi)
    nlfi = args[0]
    nlfi.thisown=0 
%}
}

%include "fem/nonlinearform.hpp"

%extend mfem::NonlinearForm{
  mfem::SparseMatrix *GetGradientMatrix(const mfem::Vector &x) const
  {
      return  dynamic_cast<mfem::SparseMatrix *>(&$self->GetGradient(x));
  }
};
