THE_URL:https://www.ncl.ucar.edu/Document/Functions/Contributed/getVarFillValue.shtml
THE_TITLE:getVarFillValue

getVarFillValue

   Retrieves the missing value of a variable, otherwise, it returns the default _FillValue.

   [new.gif] Available in version 4.3.1 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function getVarFillValue (
                x
        )

Arguments

   x

   An array of any dimensionality and any type.

Return value

   A value equal to the _FillValue of x, of the same type as x.

Description

   Determines the _FillValue by first looking to see if the variable has a missing value attribute. This can be an attribute
   named "_FillValue" or "missing_value". If no missing value attribute is present, the default _FillValue for the variable
   type is returned.

See Also

   getFillValue.

   In addition, there are many metadata tools available.

Examples

   Example 1: Create a new variable and assign the _FillValue associated with some variable (here, "w"). If "w" has no
   _FillValue, then "q" will be assigned the default numeric _FillValue.
     q@_FillValue = getVarFillValue(w)


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
2015-10-03 23:18:21 +0800
# vim:set fdm=indent foldlevel=0:
