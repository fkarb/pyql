# distutils: language = c++
# distutils: libraries = QuantLib


cimport _optimization as _opt

from quantlib.handle cimport shared_ptr

cdef class OptimizationMethod:
    def __cinit__(self):
        self._thisptr = NULL

    def __dealloc__(self):
        pass

cdef class LevenbergMarquardt(OptimizationMethod):

    def __init__(self, double epsfcn=1e-8, double xtol=1e-8, double gtol=1e-8):
        self._thisptr = new shared_ptr[_opt.OptimizationMethod](
            new _opt.LevenbergMarquardt(
                epsfcn,
                xtol,
                gtol
            )
        )

cdef class EndCriteria:

    def __cinit__(self):
        self._thisptr = NULL

    def __dealloc__(self):
        pass

    def __init__(self, int max_iterations, max_stationary_state_iterations,
            root_epsilon, function_epsilon, gradient_epsilon
    ): 
        self._thisptr = new shared_ptr[_opt.EndCriteria](
            new _opt.EndCriteria(
                max_iterations,
                max_stationary_state_iterations,
                root_epsilon,
                function_epsilon,
                gradient_epsilon
            )
        )


