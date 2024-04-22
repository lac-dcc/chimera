-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_top_sync-c.vhd,v 1.2 2007/02/05 21:57:37 arnim Exp $
--
-------------------------------------------------------------------------------

configuration i8244_top_sync_struct_c0 of i8244_top_sync is

  for struct

    for core_b: i8244_core
      use configuration work.i8244_core_struct_c0;
    end for;

    for charset_rom_b: i8244_charset_rom
      use configuration work.i8244_charset_rom_rtl_c0;
    end for;

  end for;

end i8244_top_sync_struct_c0;
