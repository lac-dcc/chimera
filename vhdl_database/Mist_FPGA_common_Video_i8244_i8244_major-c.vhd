-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_major-c.vhd,v 1.3 2007/02/05 21:57:37 arnim Exp $
--
-------------------------------------------------------------------------------

configuration i8244_major_rtl_c0 of i8244_major is

  for rtl

    for single_object
      for all : i8244_major_obj
        use configuration work.i8244_major_obj_rtl_c0;
      end for;
    end for;

    for quad_object
      for all : i8244_major_quad_obj
        use configuration work.i8244_major_quad_obj_rtl_c0;
      end for;
    end for;

  end for;

end i8244_major_rtl_c0;
