THE_URL:https://www.ncl.ucar.edu/Document/Functions/Built-in/csa2s.shtml
THE_TITLE:csa2s

csa2s

   Calculates an approximating cubic spline for two-dimensional input data.

Prototype

        function csa2s (
                xi    [*] : float,
                yi    [*] : float,
                zi        : float,
                knots [2] : integer,
                xo    [*] : float,
                yo    [*] : float
        )

        return_val  :  float

Arguments

   xi

   A 1-dimensional array of length nxi containing the X coordinates of the input data points.
   yi

   A 1-dimensional array of length nxi containing the Y coordinates of the input data points.
   zi

   An array of any dimensionality (last dimension must be nxi) containing the functional values at the input data
   coordinates given by xi and yi. That is, zi(...,i) is the input function value at (xi(i),yi(i)) for i=0 to nxi-1.
   knots

   The number of knots to be used in constructing the approximating surface. knots(0) and knots(1) must both be at least 4.
   The larger the value for knots, the closer the approximated surface will come to passing through the input function
   values.
   xo

   A one-dimensional array of length nxo containing the X coordinates of the output surface.
   yo

   A one-dimensional array of length nyo containing the Y coordinates of the output surface.

Return value

   An array containing the calculated functional values. The array will be dimensioned N x nxo x nyo, where N represents all
   but the last dimension of zi. If zo is the returned value, then zo(...,i,j) contains the functional value at coordinate
   (xo(i),yo(j)).

Description

   This function is part of the Csagrid package - a software package that implements a cubic spline approximation algorithm
   to fit a function to input data. The input for the approximation is a set of randomly-spaced data, which may be
   one-dimensional, two-dimensional, or three-dimensional. The general documentation for Csagrid contains several complete
   examples.

   The following three two-dimensional functions all do the same thing, differing only in the type of the input and output
   arrays: csa2 (generic input/output); csa2s (single input/output); csa2d (double input/output).

   If you want to weight the input data values, calculate derivatives, or handle sparse data areas specially, you should
   instead use one of these "expanded" functions (note the "x" following the "2" in the name): csa2x (generic input/output);
   csa2xs (single input/output); csa2xd (double input/output).

   If you want to compute function values at a specified list of coordinate positions, rather than at coordinate positions
   forming a rectangular grid, you should use one of these six "list form" functions (note the "l" following the "2" in the
   name): csa2l; csa2ls; csa2ld; csa2lx; csa2lxs; csa2lxd.

Examples

begin

;
;  Create the input arrays.
;
  xmin = -1.
  xmax =  1.
  ymin = -1.
  ymax =  1.

  nx = 29
  ny = 25

  ndata = 1000
  xi = new(ndata,float)
  yi = new(ndata,float)
  zi = new(ndata,float)

;
;  Generate input data using the function f(x,y) = y**2 - 0.5*y*x**2
;
  do i=0,ndata-1
      xi(i) = xmin + (xmax-xmin)*rand()/32767.
      yi(i) = ymin + (ymax-ymin)*rand()/32767.
      zi(i) = yi(i)*yi(i) - 0.5*xi(i)*xi(i)*yi(i)
  end do

;
;  Set up the output grid.
;
  xo = fspan(xmin,xmax,nx)
  yo = fspan(ymin,ymax,ny)

  knots = (/4,4/)
;
;  Calculate the approximated function values.
;
  zo = csa2s(xi,yi,zi,knots,xo,yo)

end


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
2015-10-03 23:00:48 +0800
# vim:set fdm=indent foldlevel=0:
