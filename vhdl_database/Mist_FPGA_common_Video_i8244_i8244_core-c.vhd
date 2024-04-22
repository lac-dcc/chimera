-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_core-c.vhd,v 1.4 2007/02/05 21:57:37 arnim Exp $
--
-------------------------------------------------------------------------------

configuration i8244_core_struct_c0 of i8244_core is

  for struct

    for sync_gen_b: i8244_sync_gen
      use configuration work.i8244_sync_gen_rtl_c0;
    end for;

    for grid_b: i8244_grid
      use configuration work.i8244_grid_rtl_c0;
    end for;

    for major_b: i8244_major
      use configuration work.i8244_major_rtl_c0;
    end for;

    for minor_b: i8244_minor
      use configuration work.i8244_minor_rtl_c0;
    end for;

    for cpuio_b: i8244_cpuio
      use configuration work.i8244_cpuio_rtl_c0;
    end for;

    for col_mux_b: i8244_col_mux
      use configuration work.i8244_col_mux_rtl_c0;
    end for;

    for sound_b: i8244_sound
      use configuration work.i8244_sound_rtl_c0;
    end for;

  end for;

end i8244_core_struct_c0;
