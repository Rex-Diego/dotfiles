THE_URL:https://www.ncl.ucar.edu/Document/Functions/Built-in/cfftb.shtml
THE_TITLE:cfftb

cfftb

   Performs a backward complex discrete fourier transform [Fourier Synthesis].

Prototype

        function cfftb (
                cf     : numeric,
                cfopt  : integer
        )

        return_val  :   typeof(x)

Arguments

   cf

   An array, possibly modified, returned by cfftf. The array should be unnormalized.
   cfopt

   Specifies how the reconstructed array will be returned,
    1. cfopt=0, return the reconstructed 'complex' periodic sequence.
    2. cfopt=1, return only the real portion of the synthesized array.
    3. cfopt=2, return only imaginary portion of the synthesized array.

Return value

   The returned array will be a real or 'complex' periodic sequence depending upon the value of cfopt. A double array is
   returned if cf is double, otherwise a float array is returned.

Description

   Given a sequence of unnormalized real and imaginary Fourier coefficients, cf, as generated by cfftf, the cfftb function
   performs a backward complex Fourier transform. This is often called Fourier Synthesis. It will normalize the results
   before returning the complex sequence.

   If any missing values [_FillValue] are encountered in one of the input arrays, then no calculations will be performed on
   that array, and the corresponding output array will be filled with missing values.

See Also

   cfftf, cfftf_frq_reorder, ezfftf, ezfftb, fft2df, fft2db, taper, dtrend, specx_anal, specxy_anal

Examples

   Example 1

   Perform a complex forward transform (fourier analysis: cfftf) of a real periodic sequence. Then perform complex backward
   transform (fourier synthesis: cfftb) to reconstruct the original series.
    x  = (/ 1002, 1017, 1018, 1020, 1018, 1027, \
            1028, 1030, 1012, 1012,  982, 1012, \
            1001,  996,  995, 1011, 1027, 1025, \
            1030, 1016,  996, 1006, 1002,  982  /)
    N  = dimsizes(x)

    cf = cfftf (x, 0.0, 0)   ; will construct a complex array
                                                ; carr = complex( x, 0.0)
    printVarSummary(cf)


    xNew = cfftb (cf, 1)    ; return only the real portion

    maxDiff = max(abs(xNew-x))

    print("cfft{f/b}: maxDiff="+maxDiff)

   The maxDiff is at machine accuracy (~1e-6 for x of type real).

   Example 2

   Perform a complex forward transform (fourier analysis: cfftf) of a real periodic sequence. Then perform complex backward
   transform (fourier synthesis: cfftb) to reconstruct the original series. Demonstrate the options
    xr = (/ 1002, 1017, 1018, 1020, 1018, 1027, \
            1028, 1030, 1012, 1012,  982, 1012, \
            1001,  996,  995, 1011, 1027, 1025, \
            1030, 1016,  996, 1006, 1002,  982  /)
    xi = xr(::-1)

    cf = cfftf (xr, xi, 0)   ; will construct a complex array
                                                ; carr = complex( x, 0.0)

    x0 = cfftb (cf, 0)    ; return complex (2,...)
    x1 = cfftb (cf, 1)    ; return only the real portion
    x2 = cfftb (cf, 2)    ; return only the imaginary portion

    print(cf)
    print(x0)
    print(x1)
    print(x2)

   Edited [reformatted] output:
Variable: cf
Type: float
Total Size: 192 bytes
            48 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [24]           <== complex
Coordinates:
Number Of Attributes: 2
  npts :        24
  frq :
(0)          FRQ        real          imag
(0)       0.00000    24265.000    24265.000
(1)       0.04167      -31.392      -40.911
(2)       0.08333     -152.488     -264.117
(3)       0.12500      -20.920      -50.506
(4)       0.16667        3.127       11.670
(5)       0.20833      -11.586      -88.001
(6)       0.25000        0.000      -24.000
(7)       0.29167       11.661      -88.573
(8)       0.33333       13.447      -50.187
(9)       0.37500       29.080      -70.205
(10)      0.41667      -29.512       51.117
(11)      0.45833       58.801      -76.631
(12)      0.50000      -43.000       43.000
(13)     -0.45833       12.033       -9.233
(14)     -0.41667       21.129      -12.199
(15)     -0.37500       22.920       -9.494
(16)     -0.33333       51.553      -13.813
(17)     -0.29167      -77.055       10.145
(18)     -0.25000        2.000        0.000
(19)     -0.20833     -117.976      -15.532
(20)     -0.16667       75.873       20.330
(21)     -0.12500       72.920       30.205
(22)     -0.08333     -171.129      -98.801
(23)     -0.04167       63.514       48.736

Variable: x0
Type: float
Total Size: 192 bytes
            48 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [24]
Coordinates:
                                          REAL
(0,0)   1002
(0,1)   1017
(0,2)   1018
(0,3)   1020
(0,4)   1018
(0,5)   1027
(0,6)   1028
(0,7)   1030
(0,8)   1012
(0,9)   1012
(0,10)  982
(0,11)  1012
(0,12)  1001
(0,13)  996
(0,14)  995
(0,15)  1011
(0,16)  1027
(0,17)  1025
(0,18)  1030
(0,19)  1016
(0,20)  996
(0,21)  1006
(0,22)  1002
(0,23)  982
                                          IMAG
(1,0)   982
(1,1)   1002
(1,2)   1006
(1,3)   996
(1,4)   1016
(1,5)   1030
(1,6)   1025
(1,7)   1027
(1,8)   1011
(1,9)   995
(1,10)  996
(1,11)  1001
(1,12)  1012
(1,13)  982
(1,14)  1012
(1,15)  1012
(1,16)  1030
(1,17)  1028
(1,18)  1027
(1,19)  1018
(1,20)  1020
(1,21)  1018
(1,22)  1017
(1,23)  1002


Variable: x1
Type: float
Total Size: 96 bytes
            24 values
Number of Dimensions: 1
Dimensions and sizes:   [24]
Coordinates:
(0)     1002
(1)     1017
(2)     1018
(3)     1020
(4)     1018
(5)     1027
(6)     1028
(7)     1030
(8)     1012
(9)     1012
(10)    982
(11)    1012
(12)    1001
(13)    996
(14)    995
(15)    1011
(16)    1027
(17)    1025
(18)    1030
(19)    1016
(20)    996
(21)    1006
(22)    1002
(23)    982


Variable: x2
Type: float
Total Size: 96 bytes
            24 values
Number of Dimensions: 1
Dimensions and sizes:   [24]
Coordinates:
(0)     982
(1)     1002
(2)     1006
(3)     996
(4)     1016
(5)     1030
(6)     1025
(7)     1027
(8)     1011
(9)     995
(10)    996
(11)    1001
(12)    1012
(13)    982
(14)    1012
(15)    1012
(16)    1030
(17)    1028
(18)    1027
(19)    1018
(20)    1020
(21)    1018
(22)    1017
(23)    1002


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
2015-10-03 22:59:59 +0800
# vim:set fdm=indent foldlevel=0: