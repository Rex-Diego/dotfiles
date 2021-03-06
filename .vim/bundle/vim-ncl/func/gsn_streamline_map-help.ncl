THE_URL:https://www.ncl.ucar.edu/Document/Graphics/Interfaces/gsn_streamline_map.shtml
THE_TITLE:gsn_streamline_map

gsn_streamline_map

   Creates and draws a streamline plot over a map.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_streamline_map (
                wks  [1] : graphic,
                u [*][*] : numeric,
                v [*][*] : numeric,
                res  [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from calling gsn_open_wks or calling create to create a
   Workstation object.
   u
   v

   The u and v data for the streamline plot; must be two-dimensional.
   res

   A variable containing an optional list of plot resources, attached as attributes. Set to True if you want the attached
   attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources
   applied.

Return value

   A scalar id of the map created is returned. The id of the streamline plot is returned as an attribute called streamline,
   and the id of the data is returned as an attribute called data. This is useful if you want to use setvalues to change
   some data or streamline options after this function has been called.

Description

   This function creates and draws a streamline plot over a map on the given workstation.

   If either u or v have a _FillValue attribute, these values will be used as missing values.

   You should use gsn_csm_streamline_map if you want a more customized streamline plot and/or if your data has coordinate
   arrays.

   To maximize the area that the plot is drawn in, set the special resource gsnMaximize to True.

   In NCL V6.1.0, this function was updated to automatically create a labeblar if stMonoLineColor is set to False.

See Also

   gsn_csm_streamline, gsn_csm_streamline_scalar, gsn_csm_streamline_contour_map, gsn_csm_streamline_contour_map_polar,
   gsn_csm_streamline_map, gsn_csm_streamline_scalar_map, gsn_csm_streamline_scalar_map_polar, gsn_csm_streamline_map_polar,
   gsn_streamline, gsn_streamline_scalar, gsn_streamline_scalar_map, gsn_csm_pres_hgt_streamline

   Special gsn resources

Examples

   For some application examples, see the streamline suite of examples.


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
2015-10-03 23:23:42 +0800
# vim:set fdm=indent foldlevel=0:
