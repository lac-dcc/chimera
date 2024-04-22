-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/trilogy/VITAL/X_RAMB16BWE.vhd,v 1.5 2010/07/15 21:55:35 wloo Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2009 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component 16K-Bit Data
--  /   /                       and 2K-Bit Parity Dual Port Block RAM
-- /___/   /\     Filename : X_RAMB16BWE.vhd
-- \   \  /  \    Timestamp : Wed Sep 30 14:33:07 PDT 2009
--  \___\/\___\
--
-- Revision:
--    09/30/09 - Initial version.
--    07/13/10 - Initialized memory to zero for INIT_FILE (CR 560672).
-- End Revision

----- CELL X_RAMB16BWE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_TEXTIO.all;

library STD;
use STD.TEXTIO.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;
use simprim.VPACKAGE.all;


entity X_RAMB16BWE is

  generic (
    TimingChecksOn : boolean := true;
    InstancePath   : string  := "*";
    Xon            : boolean := true;
    MsgOn          : boolean := true;
    LOC            : string  := "UNPLACED";


    DATA_WIDTH_A : integer := 0;
    DATA_WIDTH_B : integer := 0;

    INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

    INIT_A : bit_vector := X"000000000";
    INIT_B : bit_vector := X"000000000";

    INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";

    INIT_FILE : string := "NONE";
    
    SETUP_ALL : VitalDelayType := 1000 ps;
    SETUP_READ_FIRST : VitalDelayType := 3000 ps;

    SIM_COLLISION_CHECK : string := "ALL";

    SRVAL_A : bit_vector := X"000000000";
    SRVAL_B : bit_vector := X"000000000";

    WRITE_MODE_A : string := "WRITE_FIRST";
    WRITE_MODE_B : string := "WRITE_FIRST";

--- VITAL input wire delays

    tipd_ADDRA   : VitalDelayArrayType01(13 downto 0) := (others => (0 ps, 0 ps));
    tipd_CLKA    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIA     : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIPA    : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));
    tipd_ENA     : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_SSRA    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEA     : VitalDelayArrayType01 (3 downto 0) := (others => (0 ps, 0 ps));

    tipd_ADDRB   : VitalDelayArrayType01(13 downto 0) := (others => (0 ps, 0 ps));
    tipd_CLKB    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIB     : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIPB    : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));
    tipd_ENB     : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_SSRB    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEB     : VitalDelayArrayType01 (3 downto 0) := (others => (0 ps, 0 ps));


--- VITAL pin-to-pin propagation delays


    tpd_CLKA_DOA  : VitalDelayArrayType01(31 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKA_DOPA : VitalDelayArrayType01(3 downto 0)  := (others => (100 ps, 100 ps));

    tpd_CLKB_DOB  : VitalDelayArrayType01(31 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKB_DOPB : VitalDelayArrayType01(3 downto 0)  := (others => (100 ps, 100 ps));



    tpd_SSRA_DOA  : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tpd_SSRA_DOPA : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));

    tpd_SSRB_DOB  : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tpd_SSRB_DOPB : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));


--- VITAL setup time 

    tsetup_ADDRA_CLKA_negedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    tsetup_ADDRA_CLKA_posedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    tsetup_DIA_CLKA_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIA_CLKA_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIPA_CLKA_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_DIPA_CLKA_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_ENA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_SSRA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEA_CLKA_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_WEA_CLKA_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);

    tsetup_ADDRB_CLKB_negedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    tsetup_ADDRB_CLKB_posedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    tsetup_DIB_CLKB_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIB_CLKB_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIPB_CLKB_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_DIPB_CLKB_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_ENB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_SSRB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEB_CLKB_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_WEB_CLKB_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);

--- VITAL hold time 

    thold_ADDRA_CLKA_negedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    thold_ADDRA_CLKA_posedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    thold_DIA_CLKA_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIA_CLKA_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIPA_CLKA_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_DIPA_CLKA_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_ENA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_ENA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;
    thold_SSRA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEA_CLKA_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_WEA_CLKA_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);

    thold_ADDRB_CLKB_negedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    thold_ADDRB_CLKB_posedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    thold_DIB_CLKB_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIB_CLKB_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIPB_CLKB_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_DIPB_CLKB_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_ENB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_ENB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;
    thold_SSRB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEB_CLKB_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_WEB_CLKB_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);


    ticd_CLKA          : VitalDelayType                     := 0 ps;
    tisd_ADDRA_CLKA    : VitalDelayArrayType(13 downto 0)   := (others => 0 ps);
    tisd_DIA_CLKA      : VitalDelayArrayType(31 downto 0)   := (others => 0 ps);
    tisd_DIPA_CLKA     : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);
    tisd_ENA_CLKA      : VitalDelayType                     := 0 ps;
    tisd_SSRA_CLKA     : VitalDelayType                     := 0 ps;
    tisd_WEA_CLKA      : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);


    ticd_CLKB          : VitalDelayType                     := 0 ps;
    tisd_ADDRB_CLKB    : VitalDelayArrayType(13 downto 0)   := (others => 0 ps);
    tisd_DIB_CLKB      : VitalDelayArrayType(31 downto 0)   := (others => 0 ps);
    tisd_DIPB_CLKB     : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);
    tisd_ENB_CLKB      : VitalDelayType                     := 0 ps;
    tisd_SSRB_CLKB     : VitalDelayType                     := 0 ps;
    tisd_WEB_CLKB      : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);

    tperiod_clka_posedge : VitalDelayType := 0 ps;
    tperiod_clkb_posedge : VitalDelayType := 0 ps;

    tpw_CLKA_negedge : VitalDelayType := 0 ps;
    tpw_CLKA_posedge : VitalDelayType := 0 ps;
    tpw_CLKB_negedge : VitalDelayType := 0 ps;
    tpw_CLKB_posedge : VitalDelayType := 0 ps;

    tpw_SSRA_posedge : VitalDelayType := 0 ps;
    tpw_SSRB_posedge : VitalDelayType := 0 ps

    );

  port(
    DOA          : out std_logic_vector (31 downto 0);
    DOB          : out std_logic_vector (31 downto 0);
    DOPA         : out std_logic_vector (3 downto 0);
    DOPB         : out std_logic_vector (3 downto 0);

    ADDRA        : in  std_logic_vector (13 downto 0);
    ADDRB        : in  std_logic_vector (13 downto 0);
    CLKA         : in  std_ulogic;
    CLKB         : in  std_ulogic;
    DIA          : in  std_logic_vector (31 downto 0);
    DIB          : in  std_logic_vector (31 downto 0);
    DIPA         : in  std_logic_vector (3 downto 0);
    DIPB         : in  std_logic_vector (3 downto 0);
    ENA          : in  std_ulogic;
    ENB          : in  std_ulogic;
    SSRA         : in  std_ulogic;
    SSRB         : in  std_ulogic;
    WEA          : in  std_logic_vector (3 downto 0);
    WEB          : in  std_logic_vector (3 downto 0)
    );
  
    attribute VITAL_LEVEL0 of X_RAMB16BWE : entity is true;
  
end X_RAMB16BWE;

-- Architecture body --

architecture X_RAMB16BWE_V of X_RAMB16BWE is

  attribute VITAL_LEVEL0 of
    X_RAMB16BWE_V : architecture is true;
    
  function GetWidestWidth (
    wr_width_a : in integer;
    wr_width_b : in integer
    ) return integer is
    variable func_widest_width : integer;
  begin
    if (wr_width_a >= wr_width_b) then
      func_widest_width := wr_width_a;
    else
      func_widest_width := wr_width_b;
    end if;
    return func_widest_width;
  end;

    
  function GetWidth (
    rdwr_width : in integer
    ) return integer is
    variable func_width : integer;
  begin
    case rdwr_width is
      when 1 => func_width := 1;
      when 2 => func_width := 2;
      when 4 => func_width := 4;
      when 9 => func_width := 8;
      when 18 => func_width := 16;
      when 36 => func_width := 32;
      when others => func_width := 1;
    end case;
    return func_width;
  end;

    
  function GetWidthINITF (
    rdwr_width_initf : in integer
    ) return integer is
    variable func_width_initf : integer;
  begin
    case rdwr_width_initf is
      when 1 => func_width_initf := 4;
      when 2 => func_width_initf := 4;
      when 4 => func_width_initf := 4;
      when 9 => func_width_initf := 12;
      when 18 => func_width_initf := 20;
      when 36 => func_width_initf := 36;
      when 72 => func_width_initf := 72;
      when others => func_width_initf := 1;
    end case;
    return func_width_initf;
  end;

    
  function GetWidthp (
    rdwr_widthp : in integer
    ) return integer is
    variable func_widthp : integer;
  begin
    case rdwr_widthp is
      when 9 => func_widthp := 1;
      when 18 => func_widthp := 2;
      when 36 => func_widthp := 4;
      when others => func_widthp := 0;
    end case;
    return func_widthp;
  end;

    
  function GetWidthpINITF (
    rdwr_widthp_initf : in integer
    ) return integer is
    variable func_widthp_initf : integer;
  begin
    case rdwr_widthp_initf is
      when 9 => func_widthp_initf := 4;
      when 18 => func_widthp_initf := 4;
      when 36 => func_widthp_initf := 4;
      when 72 => func_widthp_initf := 8;
      when others => func_widthp_initf := 1;
    end case;
    return func_widthp_initf;
  end;


  function GetWidthpTmpWidthp (
    rdwr_tmp_widthp : in integer
    ) return integer is
    variable func_widthp_tmp : integer;
  begin
    case rdwr_tmp_widthp is
      when 1 | 2 | 4 => func_widthp_tmp := 0;
      when 9 => func_widthp_tmp := 1;
      when 18 => func_widthp_tmp := 2;
      when 36 => func_widthp_tmp := 4;
      when 72 => func_widthp_tmp := 8;
      when others => func_widthp_tmp := 8;
    end case;
    return func_widthp_tmp;
  end;

    
  function GetMemoryDepth (
    rdwr_width : in integer
    ) return integer is
    variable func_mem_depth : integer;
  begin
    case rdwr_width is
      when 1 => func_mem_depth := 16384;
      when 2 => func_mem_depth := 8192;
      when 4 => func_mem_depth := 4096;
      when 9 => func_mem_depth := 2048;
      when 18 => func_mem_depth := 1024;
      when 36 => func_mem_depth := 512;
      when others => func_mem_depth := 16384;
    end case;
    return func_mem_depth;
  end;

  
  function GetMemoryDepthP (
    rdwr_width : in integer
    ) return integer is
    variable func_memp_depth : integer;
  begin
    case rdwr_width is
      when 9 => func_memp_depth := 2048;
      when 18 => func_memp_depth := 1024;
      when 36 => func_memp_depth := 512;
      when others => func_memp_depth := 2048;
    end case;
    return func_memp_depth;
  end;

  
  function GetAddrbitLSB (
    rdwr_width : in integer
    ) return integer is
    variable func_lsb : integer;
  begin
    case rdwr_width is
      when 1 => func_lsb := 0;
      when 2 => func_lsb := 1;
      when 4 => func_lsb := 2;
      when 9 => func_lsb := 3;
      when 18 => func_lsb := 4;
      when 36 => func_lsb := 5;
      when others => func_lsb := 10;
    end case;
    return func_lsb;
  end;

    
  function GetAddrbit124 (
    rdwr_width : in integer;
    w_width : in integer
    ) return integer is
    variable func_widest_width : integer;
  begin
    case rdwr_width is
      when 1 => case w_width is
                  when 2 => func_widest_width := 0;
                  when 4 => func_widest_width := 1;
                  when 9 => func_widest_width := 2;
                  when 18 => func_widest_width := 3;
                  when 36 => func_widest_width := 4;
                  when 72 => func_widest_width := 5;
                  when others => func_widest_width := 10;
                end case;
      when 2 => case w_width is
                  when 4 => func_widest_width := 1;
                  when 9 => func_widest_width := 2;
                  when 18 => func_widest_width := 3;
                  when 36 => func_widest_width := 4;
                  when 72 => func_widest_width := 5;
                  when others => func_widest_width := 10;
                end case;
      when 4 => case w_width is
                  when 9 => func_widest_width := 2;
                  when 18 => func_widest_width := 3;
                  when 36 => func_widest_width := 4;
                  when 72 => func_widest_width := 5;
                  when others => func_widest_width := 10;
                end case;
      when others => func_widest_width := 10;
    end case;
    return func_widest_width;
  end;

  
  function GetAddrbit8 (
    rdwr_width : in integer;
    w_width : in integer
    ) return integer is
    variable func_widest_width : integer;
  begin
    case rdwr_width is
      when 9 => case w_width is
                  when 18 => func_widest_width := 3;
                  when 36 => func_widest_width := 4;
                  when 72 => func_widest_width := 5;
                  when others => func_widest_width := 10;
                end case;
      when others => func_widest_width := 10;
    end case;
    return func_widest_width;
  end;

  
  function GetAddrbit16 (
    rdwr_width : in integer;
    w_width : in integer
    ) return integer is
    variable func_widest_width : integer;
  begin
    case rdwr_width is
      when 18 => case w_width is
                  when 36 => func_widest_width := 4;
                  when 72 => func_widest_width := 5;
                  when others => func_widest_width := 10;
                end case;
      when others => func_widest_width := 10;
    end case;
    return func_widest_width;
  end;

  
  function GetAddrbit32 (
    rdwr_width : in integer;
    w_width : in integer
    ) return integer is
    variable func_widest_width : integer;
  begin
    case rdwr_width is
      when 36 => case w_width is
                  when 72 => func_widest_width := 5;
                  when others => func_widest_width := 10;
                end case;
      when others => func_widest_width := 10;
    end case;
    return func_widest_width;
  end;

  ---------------------------------------------------------------------------
  -- Function SLV_X_TO_HEX returns a hex string version of the std_logic_vector
  -- argument.
  ---------------------------------------------------------------------------
  function SLV_X_TO_HEX (
    SLV : in std_logic_vector;
    string_length : in integer
    ) return string is

    variable i : integer := 1;
    variable j : integer := 1;
    variable STR : string(string_length downto 1);
    variable nibble : std_logic_vector(3 downto 0) := "0000";
    variable full_nibble_count : integer := 0;
    variable remaining_bits : integer := 0;

  begin
    full_nibble_count := SLV'length/4;
    remaining_bits := SLV'length mod 4;
    for i in 1 to full_nibble_count loop
      nibble := SLV(((4*i) - 1) downto ((4*i) - 4));
      if (((nibble(0) xor nibble(1) xor nibble (2) xor nibble(3)) /= '1') and
          (nibble(0) xor nibble(1) xor nibble (2) xor nibble(3)) /= '0')  then
        STR(j) := 'x';
      elsif (nibble = "0000")  then
        STR(j) := '0';
      elsif (nibble = "0001")  then
        STR(j) := '1';
      elsif (nibble = "0010")  then
        STR(j) := '2';
      elsif (nibble = "0011")  then
        STR(j) := '3';
      elsif (nibble = "0100")  then
        STR(j) := '4';
      elsif (nibble = "0101")  then
        STR(j) := '5';
      elsif (nibble = "0110")  then
        STR(j) := '6';
      elsif (nibble = "0111")  then
        STR(j) := '7';
      elsif (nibble = "1000")  then
        STR(j) := '8';
      elsif (nibble = "1001")  then
        STR(j) := '9';
      elsif (nibble = "1010")  then
        STR(j) := 'a';
      elsif (nibble = "1011")  then
        STR(j) := 'b';
      elsif (nibble = "1100")  then
        STR(j) := 'c';
      elsif (nibble = "1101")  then
        STR(j) := 'd';
      elsif (nibble = "1110")  then
        STR(j) := 'e';
      elsif (nibble = "1111")  then
        STR(j) := 'f';
      end if;
      j := j + 1;
    end loop;
    
    if (remaining_bits /= 0) then
      nibble := "0000";
      nibble((remaining_bits -1) downto 0) := SLV((SLV'length -1) downto (SLV'length - remaining_bits));
      if (((nibble(0) xor nibble(1) xor nibble (2) xor nibble(3)) /= '1') and
          (nibble(0) xor nibble(1) xor nibble (2) xor nibble(3)) /= '0')  then
        STR(j) := 'x';
      elsif (nibble = "0000")  then
        STR(j) := '0';
      elsif (nibble = "0001")  then
        STR(j) := '1';
      elsif (nibble = "0010")  then
        STR(j) := '2';
      elsif (nibble = "0011")  then
        STR(j) := '3';
      elsif (nibble = "0100")  then
        STR(j) := '4';
      elsif (nibble = "0101")  then
        STR(j) := '5';
      elsif (nibble = "0110")  then
        STR(j) := '6';
      elsif (nibble = "0111")  then
        STR(j) := '7';
      elsif (nibble = "1000")  then
        STR(j) := '8';
      elsif (nibble = "1001")  then
        STR(j) := '9';
      elsif (nibble = "1010")  then
        STR(j) := 'a';
      elsif (nibble = "1011")  then
        STR(j) := 'b';
      elsif (nibble = "1100")  then
        STR(j) := 'c';
      elsif (nibble = "1101")  then
        STR(j) := 'd';
      elsif (nibble = "1110")  then
        STR(j) := 'e';
      elsif (nibble = "1111")  then
        STR(j) := 'f';
      end if;
    end if;    
    return STR;
  end SLV_X_TO_HEX;


  constant widest_width : integer := GetWidestWidth(DATA_WIDTH_A, DATA_WIDTH_B);
  constant mem_depth : integer := GetMemoryDepth(widest_width);
  constant memp_depth : integer := GetMemoryDepthP(widest_width);
  constant width : integer := GetWidth(widest_width);
  constant widthp : integer := GetWidthp(widest_width);
  constant width_initf : integer := GetWidthINITF(widest_width);
  constant widthp_initf : integer := GetWidthpINITF(widest_width);  
  constant a_width : integer := GetWidth(DATA_WIDTH_A);
  constant b_width : integer := GetWidth(DATA_WIDTH_B);
  constant a_widthp : integer := GetWidthp(DATA_WIDTH_A);
  constant b_widthp : integer := GetWidthp(DATA_WIDTH_B);
  constant addra_lbit_124 : integer := GetAddrbitLSB(DATA_WIDTH_A);
  constant addrb_lbit_124 : integer := GetAddrbitLSB(DATA_WIDTH_B);
  constant addra_bit_124 : integer := GetAddrbit124(DATA_WIDTH_A, widest_width);
  constant addrb_bit_124 : integer := GetAddrbit124(DATA_WIDTH_B, widest_width);
  constant addra_bit_8 : integer := GetAddrbit8(DATA_WIDTH_A, widest_width);
  constant addrb_bit_8 : integer := GetAddrbit8(DATA_WIDTH_B, widest_width);
  constant addra_bit_16 : integer := GetAddrbit16(DATA_WIDTH_A, widest_width);
  constant addrb_bit_16 : integer := GetAddrbit16(DATA_WIDTH_B, widest_width);
  constant col_addr_lsb : integer := GetAddrbitLSB(widest_width);
  constant tmp_widthp : integer := GetWidthpTmpWidthp(widest_width);

  type Two_D_array_type_tmp_mem is array ((mem_depth -  1) downto 0) of std_logic_vector((widest_width - 1) downto 0);
    
  type Two_D_array_type is array ((mem_depth -  1) downto 0) of std_logic_vector((width - 1) downto 0);
  type Two_D_parity_array_type is array ((memp_depth - 1) downto 0) of std_logic_vector((widthp -1) downto 0);

  type Two_D_array_type_initf is array ((mem_depth -  1) downto 0) of std_logic_vector((width_initf - 1) downto 0);
  type Two_D_parity_array_type_initf is array ((memp_depth - 1) downto 0) of std_logic_vector((widthp_initf -1) downto 0);


  signal ADDRA_dly    : std_logic_vector(15 downto 0) := (others => 'X');
  signal ADDRA_int    : std_logic_vector(13 downto 0) := (others => 'X');
  signal CLKA_dly     : std_ulogic                    := 'X';
  signal DIA_dly      : std_logic_vector(63 downto 0) := (others => 'X');
  signal DIA_int      : std_logic_vector(31 downto 0) := (others => 'X');
  signal DIPA_dly     : std_logic_vector(7 downto 0)  := (others => 'X');
  signal DIPA_int     : std_logic_vector(3 downto 0)  := (others => 'X');
  signal ENA_dly      : std_ulogic                    := 'X';
  signal SSRA_dly     : std_ulogic                    := 'X';
  signal WEA_dly      : std_logic_vector(7 downto 0)  := (others => 'X');
  signal WEA_int      : std_logic_vector(3 downto 0)  := (others => 'X');
  signal ADDRB_dly    : std_logic_vector(15 downto 0) := (others => 'X');
  signal ADDRB_int    : std_logic_vector(13 downto 0) := (others => 'X');
  signal CLKB_dly     : std_ulogic                    := 'X';
  signal DIB_dly      : std_logic_vector(63 downto 0) := (others => 'X');
  signal DIB_int      : std_logic_vector(31 downto 0) := (others => 'X');
  signal DIPB_dly     : std_logic_vector(7 downto 0)  := (others => 'X');
  signal DIPB_int     : std_logic_vector(3 downto 0)  := (others => 'X');
  signal ENB_dly      : std_ulogic                    := 'X';
  signal SSRB_dly     : std_ulogic                    := 'X';
  signal WEB_dly      : std_logic_vector(7 downto 0)  := (others => 'X');
  signal WEB_int      : std_logic_vector(3 downto 0)  := (others => 'X');
  
  signal doado_out : std_logic_vector(63 downto 0) := (others => 'X');
  signal dopadop_out : std_logic_vector(7 downto 0) := (others => 'X');
  signal dobdo_out : std_logic_vector(63 downto 0) := (others => 'X');
  signal dopbdop_out : std_logic_vector(7 downto 0) := (others => 'X');

  signal GSR_dly : std_ulogic := '0';
  signal di_x : std_logic_vector(63 downto 0) := (others => 'X');

  signal SRVAL_A_STD : std_logic_vector(35 downto 0) := To_StdLogicVector(SRVAL_A);
  signal INIT_A_STD : std_logic_vector(35 downto 0) := To_StdLogicVector(INIT_A);
  signal SRVAL_B_STD : std_logic_vector(35 downto 0) := To_StdLogicVector(SRVAL_B);
  signal INIT_B_STD : std_logic_vector(35 downto 0) := To_StdLogicVector(INIT_B);

  signal ViolationA        : std_ulogic                     := '0';
  signal ViolationB        : std_ulogic                     := '0';

  signal ADDRA_ipd : std_logic_vector(13 downto 0);
  signal ADDRB_ipd : std_logic_vector(13 downto 0);
  signal CLKA_ipd : std_ulogic;
  signal CLKB_ipd : std_ulogic;
  signal DIA_ipd : std_logic_vector(31 downto 0);
  signal DIB_ipd : std_logic_vector(31 downto 0);
  signal DIPA_ipd : std_logic_vector(3 downto 0);
  signal DIPB_ipd : std_logic_vector(3 downto 0);
  signal ENA_ipd : std_ulogic;
  signal ENB_ipd : std_ulogic;
  signal SSRA_ipd : std_ulogic;
  signal SSRB_ipd : std_ulogic;
  signal WEA_ipd : std_logic_vector(3 downto 0);
  signal WEB_ipd : std_logic_vector(3 downto 0);

  
  function slv_to_two_D_array(
    slv_length : integer;
    slv_width : integer;
    SLV : in std_logic_vector
    )
    return two_D_array_type is
    variable two_D_array : two_D_array_type;
    variable intermediate : std_logic_vector((slv_width - 1) downto 0);
  begin
    for i in 0 to (slv_length - 1) loop
      intermediate := SLV(((i*slv_width) + (slv_width - 1)) downto (i* slv_width));
      two_D_array(i) := intermediate; 
    end loop;
    return two_D_array;
  end;


  function slv_to_two_D_parity_array(
    slv_length : integer;
    slv_width : integer;
    SLV : in std_logic_vector
    )
    return two_D_parity_array_type is
    variable two_D_parity_array : two_D_parity_array_type;
    variable intermediate : std_logic_vector((slv_width - 1) downto 0);
  begin
    for i in 0 to (slv_length - 1)loop
      intermediate := SLV(((i*slv_width) + (slv_width - 1)) downto (i* slv_width));
      two_D_parity_array(i) := intermediate; 
    end loop;
    return two_D_parity_array;
  end;


  impure function two_D_mem_initf(
    slv_width : integer
    )
    return two_D_array_type_tmp_mem is

    variable input_initf_tmp : Two_D_array_type_initf;
    variable input_initf : Two_D_array_type_tmp_mem := (others => (others => '0'));
    file int_infile : text;
    variable data_line, data_line_tmp, out_data_line : line;
    variable i : integer := 0;
    variable good_data : boolean := false;
    variable ignore_line : boolean := false;
    variable char_tmp : character;
    variable init_addr_slv : std_logic_vector(31 downto 0) := (others => '0');
    variable open_status : file_open_status;
    
  begin

    if (INIT_FILE /= "NONE") then
      
      file_open(open_status, int_infile, INIT_FILE, read_mode);

      while not endfile(int_infile) loop
          
        readline(int_infile, data_line);

        while (data_line /= null and data_line'length > 0) loop
          
          if (data_line(data_line'low to data_line'low + 1) = "//") then
            deallocate(data_line);

          elsif (data_line(data_line'low to data_line'low + 1) = "/*") then
            deallocate(data_line);
            ignore_line := true;

          elsif (ignore_line = true and data_line(data_line'high-1 to data_line'high) = "*/") then
            deallocate(data_line);
            ignore_line := false;


          elsif (ignore_line = false and data_line(data_line'low) = '@') then
            read(data_line, char_tmp);
            hread(data_line, init_addr_slv, good_data);

            i := SLV_TO_INT(init_addr_slv);

          elsif (ignore_line = false) then

            hread(data_line, input_initf_tmp(i), good_data);
            input_initf(i)(slv_width - 1 downto 0) := input_initf_tmp(i)(slv_width - 1 downto 0);
          
            if (good_data = true) then
              i := i + 1;             
            end if;
          else
            deallocate(data_line);
                     
          end if;
        
        end loop;
        
      end loop;

    end if;
        
    return input_initf;

  end;


  function two_D_mem_init(  
    slv_length : integer;
    slv_width : integer;
    SLV : in std_logic_vector;
    temp_mem : two_D_array_type_tmp_mem
    )
    return two_D_array_type is
    variable two_D_array_mem_init : two_D_array_type;
  begin
     if (INIT_FILE = "NONE") then
       two_D_array_mem_init := slv_to_two_D_array(slv_length, slv_width, SLV);
     else

       for i in 0 to (slv_length - 1) loop
         two_D_array_mem_init(i)(slv_width-1 downto 0) := temp_mem(i)(slv_width-1 downto 0);
       end loop;
                           
     end if;
     return two_D_array_mem_init;
  end;


  function two_D_mem_initp(  
    slv_length : integer;
    slv_width : integer;
    SLV : in std_logic_vector;
    temp_mem : two_D_array_type_tmp_mem;
    mem_width : integer
    )
    return two_D_parity_array_type is
    variable two_D_array_mem_initp : two_D_parity_array_type;
  begin
     if (INIT_FILE = "NONE") then
       two_D_array_mem_initp := slv_to_two_D_parity_array(slv_length, slv_width, SLV);
     else

       if (slv_width > 0) then
         
         for i in 0 to (slv_length - 1) loop
           two_D_array_mem_initp(i)(slv_width-1 downto 0) := temp_mem(i)(mem_width + slv_width - 1 downto mem_width);
         end loop;

       end if;
     end if;
     return two_D_array_mem_initp;
  end;

       
  procedure prcd_chk_for_col_msg (
    constant wea_tmp : in std_ulogic;
    constant web_tmp : in std_ulogic;
    constant addra_tmp : in std_logic_vector (15 downto 0);
    constant addrb_tmp : in std_logic_vector (15 downto 0);
    variable col_wr_wr_msg : inout std_ulogic;
    variable col_wra_rdb_msg : inout std_ulogic;
    variable col_wrb_rda_msg : inout std_ulogic
    ) is
    
    variable string_length_1 : integer;
    variable string_length_2 : integer;
    variable message : LINE;
    constant MsgSeverity : severity_level := Error;

  begin
    
    if ((SIM_COLLISION_CHECK = "ALL" or SIM_COLLISION_CHECK = "WARNING_ONLY")
        and (not(((WRITE_MODE_B = "READ_FIRST" and web_tmp = '1' and wea_tmp = '0') and (not(rising_edge(clka_dly) and (not(rising_edge(clkb_dly))))))
              or ((WRITE_MODE_A = "READ_FIRST" and wea_tmp = '1' and web_tmp = '0') and (not(rising_edge(clkb_dly) and (not(rising_edge(clka_dly))))))))) then

      if ((addra_tmp'length mod 4) = 0) then
        string_length_1 := addra_tmp'length/4;
      elsif ((addra_tmp'length mod 4) > 0) then
        string_length_1 := addra_tmp'length/4 + 1;      
      end if;
      if ((addrb_tmp'length mod 4) = 0) then
        string_length_2 := addrb_tmp'length/4;
      elsif ((addrb_tmp'length mod 4) > 0) then
        string_length_2 := addrb_tmp'length/4 + 1;      
      end if;

      if (wea_tmp = '1' and web_tmp = '1' and col_wr_wr_msg = '1') then
        Write ( message, STRING'(" Memory Collision Error on X_RAMB16BWE :"));
        Write ( message, STRING'(X_RAMB16BWE'path_name));
        Write ( message, STRING'(" at simulation time "));
        Write ( message, now);
        Write ( message, STRING'("."));
        Write ( message, LF );
        Write ( message, STRING'(" A write was requested to the same address simultaneously at both Port A and Port B of the RAM."));
        Write ( message, STRING'(" The contents written to the RAM at address location "));      
        Write ( message, SLV_X_TO_HEX(addra_tmp, string_length_1));
        Write ( message, STRING'(" (hex) "));            
        Write ( message, STRING'("of Port A and address location "));
        Write ( message, SLV_X_TO_HEX(addrb_tmp, string_length_2));
        Write ( message, STRING'(" (hex) "));            
        Write ( message, STRING'("of Port B are unknown. "));
        ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
        DEALLOCATE (message);
        col_wr_wr_msg := '0';
        
      elsif (wea_tmp = '1' and web_tmp = '0' and col_wra_rdb_msg = '1') then
        Write ( message, STRING'(" Memory Collision Error on X_RAMB16BWE :"));
        Write ( message, STRING'(X_RAMB16BWE'path_name));
        Write ( message, STRING'(" at simulation time "));
        Write ( message, now);
        Write ( message, STRING'("."));
        Write ( message, LF );            
        Write ( message, STRING'(" A read was performed on address "));
        Write ( message, SLV_X_TO_HEX(addrb_tmp, string_length_2));
        Write ( message, STRING'(" (hex) "));            
        Write ( message, STRING'("of port B while a write was requested to the same address on Port A. "));
        Write ( message, STRING'(" The write will be successful however the read value on port B is unknown until the next CLKB cycle. "));
        ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
        DEALLOCATE (message);
        col_wra_rdb_msg := '0';
        
      elsif (wea_tmp = '0' and web_tmp = '1' and col_wrb_rda_msg = '1') then
        Write ( message, STRING'(" Memory Collision Error on X_RAMB16BWE :"));
        Write ( message, STRING'(X_RAMB16BWE'path_name));
        Write ( message, STRING'(" at simulation time "));
        Write ( message, now);
        Write ( message, STRING'("."));
        Write ( message, LF );            
        Write ( message, STRING'(" A read was performed on address "));
        Write ( message, SLV_X_TO_HEX(addra_tmp, string_length_1));
        Write ( message, STRING'(" (hex) "));            
        Write ( message, STRING'("of port A while a write was requested to the same address on Port B. "));
        Write ( message, STRING'(" The write will be successful however the read value on port A is unknown until the next CLKA cycle. "));
        ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
        DEALLOCATE (message);
        col_wrb_rda_msg := '0';
        
      end if;      

    end if;
    
  end prcd_chk_for_col_msg;

    
  procedure prcd_write_ram (
    constant we : in std_logic;
    constant di : in std_logic_vector;
    constant dip : in std_logic;
    variable mem_proc : inout std_logic_vector;
    variable memp_proc : inout std_logic
    ) is
    
    alias di_tmp : std_logic_vector (di'length-1 downto 0) is di;
    alias mem_proc_tmp : std_logic_vector (mem_proc'length-1 downto 0) is mem_proc;

    begin
      if (we = '1') then
        mem_proc_tmp := di_tmp;

        if (width >= 8) then
          memp_proc := dip;
        end if;
      end if;
  end prcd_write_ram;

    
  procedure prcd_write_ram_col (
    constant we_o : in std_logic;
    constant we : in std_logic;
    constant di : in std_logic_vector;
    constant dip : in std_logic;
    variable mem_proc : inout std_logic_vector;
    variable memp_proc : inout std_logic
    ) is
    
    alias di_tmp : std_logic_vector (di'length-1 downto 0) is di;
    alias mem_proc_tmp : std_logic_vector (mem_proc'length-1 downto 0) is mem_proc;
    variable i : integer := 0;
    
    begin
      if (we = '1') then

        for i in 0 to di'length-1 loop
          if ((mem_proc_tmp(i) /= 'X') or (not(we = we_o and we = '1'))) then
            mem_proc_tmp(i) := di_tmp(i);
          end if;
        end loop;

        if (width >= 8 and ((memp_proc /= 'X') or (not(we = we_o and we = '1')))) then
          memp_proc := dip;
        end if;

      end if;
  end prcd_write_ram_col;

  
  procedure prcd_x_buf (
    constant wr_rd_mode : in std_logic_vector (1 downto 0);
    constant do_uindex : in integer;
    constant do_lindex : in integer;
    constant dop_index : in integer;
    constant do_ltmp : in std_logic_vector (63 downto 0);
    variable do_tmp : inout std_logic_vector (63 downto 0);
    constant dop_ltmp : in std_logic_vector (7 downto 0);
    variable dop_tmp : inout std_logic_vector (7 downto 0)
    ) is
    
    variable i : integer;

    begin
      if (wr_rd_mode = "01") then
        for i in do_lindex to do_uindex loop
          if (do_ltmp(i) = 'X') then
            do_tmp(i) := 'X';
          end if;
        end loop;
        
        if (dop_ltmp(dop_index) = 'X') then
          dop_tmp(dop_index) := 'X';
        end if;
          
      else
        do_tmp(do_lindex + 7 downto do_lindex) := do_ltmp(do_lindex + 7 downto do_lindex);
        dop_tmp(dop_index) := dop_ltmp(dop_index);
      end if;

  end prcd_x_buf;

    
  procedure prcd_rd_ram_a (
    constant addra_tmp : in std_logic_vector (15 downto 0);
    variable doado_tmp : inout std_logic_vector (63 downto 0);
    variable dopadop_tmp : inout std_logic_vector (7 downto 0);
    constant mem : in Two_D_array_type;
    constant memp : in Two_D_parity_array_type     
    ) is
    variable prcd_tmp_addra_dly_depth : integer;
    variable prcd_tmp_addra_dly_width : integer;

  begin
    
    case a_width is

      when 1 | 2 | 4 => if (a_width >= width) then
                          prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_lbit_124));
                          doado_tmp(a_width-1 downto 0) := mem(prcd_tmp_addra_dly_depth);
                        else
                          prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_124 + 1));
                          prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_124 downto addra_lbit_124));
                          doado_tmp(a_width-1 downto 0) := mem(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * a_width) + a_width - 1 downto prcd_tmp_addra_dly_width * a_width);
                        end if;

      when 8 => if (a_width >= width) then
                  prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 3));
                  doado_tmp(7 downto 0) := mem(prcd_tmp_addra_dly_depth);
                  dopadop_tmp(0 downto 0) := memp(prcd_tmp_addra_dly_depth);
                else
                  prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_8 + 1));
                  prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_8 downto 3));
                  doado_tmp(7 downto 0) := mem(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 8) + 7 downto prcd_tmp_addra_dly_width * 8);
                  dopadop_tmp(0 downto 0) := memp(prcd_tmp_addra_dly_depth)(prcd_tmp_addra_dly_width downto prcd_tmp_addra_dly_width);
                end if;

      when 16 => if (a_width >= width) then
                  prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 4));
                  doado_tmp(15 downto 0) := mem(prcd_tmp_addra_dly_depth);
                  dopadop_tmp(1 downto 0) := memp(prcd_tmp_addra_dly_depth);
                 else
                  prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_16 + 1));
                  prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_16 downto 4));
                  doado_tmp(15 downto 0) := mem(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 16) + 15 downto prcd_tmp_addra_dly_width * 16);
                  dopadop_tmp(1 downto 0) := memp(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 2) + 1 downto prcd_tmp_addra_dly_width * 2);
                 end if;

      when 32 => if (a_width >= width) then
                  prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 5));
                  doado_tmp(31 downto 0) := mem(prcd_tmp_addra_dly_depth);
                  dopadop_tmp(3 downto 0) := memp(prcd_tmp_addra_dly_depth);
                end if;

      when others => null;

    end case;

  end prcd_rd_ram_a;

  
  procedure prcd_rd_ram_b (
    constant addrb_tmp : in std_logic_vector (15 downto 0);
    variable dobdo_tmp : inout std_logic_vector (63 downto 0);
    variable dopbdop_tmp : inout std_logic_vector (7 downto 0);
    constant mem : in Two_D_array_type;
    constant memp : in Two_D_parity_array_type     
    ) is
    variable prcd_tmp_addrb_dly_depth : integer;
    variable prcd_tmp_addrb_dly_width : integer;

  begin
    
    case b_width is

      when 1 | 2 | 4 => if (b_width >= width) then
                          prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_lbit_124));
                          dobdo_tmp(b_width-1 downto 0) := mem(prcd_tmp_addrb_dly_depth);
                        else
                          prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_124 + 1));
                          prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_124 downto addrb_lbit_124));
                          dobdo_tmp(b_width-1 downto 0) := mem(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * b_width) + b_width - 1 downto prcd_tmp_addrb_dly_width * b_width);
                        end if;

      when 8 => if (b_width >= width) then
                  prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 3));
                  dobdo_tmp(7 downto 0) := mem(prcd_tmp_addrb_dly_depth);
                  dopbdop_tmp(0 downto 0) := memp(prcd_tmp_addrb_dly_depth);
                else
                  prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_8 + 1));
                  prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_8 downto 3));
                  dobdo_tmp(7 downto 0) := mem(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 8) + 7 downto prcd_tmp_addrb_dly_width * 8);
                  dopbdop_tmp(0 downto 0) := memp(prcd_tmp_addrb_dly_depth)(prcd_tmp_addrb_dly_width downto prcd_tmp_addrb_dly_width);
                end if;

      when 16 => if (b_width >= width) then
                  prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 4));
                  dobdo_tmp(15 downto 0) := mem(prcd_tmp_addrb_dly_depth);
                  dopbdop_tmp(1 downto 0) := memp(prcd_tmp_addrb_dly_depth);
                 else
                  prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_16 + 1));
                  prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_16 downto 4));
                  dobdo_tmp(15 downto 0) := mem(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 16) + 15 downto prcd_tmp_addrb_dly_width * 16);
                  dopbdop_tmp(1 downto 0) := memp(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 2) + 1 downto prcd_tmp_addrb_dly_width * 2);
                 end if;

      when 32 => if (b_width >= width) then
                  prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 5));
                  dobdo_tmp(31 downto 0) := mem(prcd_tmp_addrb_dly_depth);
                  dopbdop_tmp(3 downto 0) := memp(prcd_tmp_addrb_dly_depth);
                end if;

      when others => null;

    end case;

  end prcd_rd_ram_b;


  procedure prcd_col_wr_ram_a (
    constant seq : in std_logic_vector (1 downto 0);
    constant web_tmp : in std_logic_vector (7 downto 0);
    constant wea_tmp : in std_logic_vector (7 downto 0);
    constant dia_tmp : in std_logic_vector (63 downto 0);
    constant dipa_tmp : in std_logic_vector (7 downto 0);
    constant addrb_tmp : in std_logic_vector (15 downto 0);
    constant addra_tmp : in std_logic_vector (15 downto 0);
    variable mem : inout Two_D_array_type;
    variable memp : inout Two_D_parity_array_type;
    variable col_wr_wr_msg : inout std_ulogic;
    variable col_wra_rdb_msg : inout std_ulogic;
    variable col_wrb_rda_msg : inout std_ulogic
    ) is
    variable prcd_tmp_addra_dly_depth : integer;
    variable prcd_tmp_addra_dly_width : integer;
    variable junk : std_ulogic;

  begin
    
    case a_width is

      when 1 | 2 | 4 => if (not(wea_tmp(0) = '1' and web_tmp(0) = '1' and a_width > b_width) or seq = "10") then
                          if (a_width >= width) then
                            prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_lbit_124));
                            prcd_write_ram_col (web_tmp(0), wea_tmp(0), dia_tmp(a_width-1 downto 0), '0', mem(prcd_tmp_addra_dly_depth), junk);
                          else
                            prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_124 + 1));
                            prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_124 downto addra_lbit_124));
                            prcd_write_ram_col (web_tmp(0), wea_tmp(0), dia_tmp(a_width-1 downto 0), '0', mem(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * a_width) + a_width - 1 downto (prcd_tmp_addra_dly_width * a_width)), junk);
                          end if;

                          if (seq = "00") then
                            prcd_chk_for_col_msg (wea_tmp(0), web_tmp(0), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                          end if;
                        end if;
      
      when 8 => if (not(wea_tmp(0) = '1' and web_tmp(0) = '1' and a_width > b_width) or seq = "10") then
                  if (a_width >= width) then
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 3));
                    prcd_write_ram_col (web_tmp(0), wea_tmp(0), dia_tmp(7 downto 0), dipa_tmp(0), mem(prcd_tmp_addra_dly_depth), memp(prcd_tmp_addra_dly_depth)(0));
                  else
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_8 + 1));
                    prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_8 downto 3));
                    prcd_write_ram_col (web_tmp(0), wea_tmp(0), dia_tmp(7 downto 0), dipa_tmp(0), mem(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 8) + 7 downto (prcd_tmp_addra_dly_width * 8)), memp(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width)));
                  end if;
  
                  if (seq = "00") then
                    prcd_chk_for_col_msg (wea_tmp(0), web_tmp(0), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                  end if;
                end if;

      when 16 => if (not(wea_tmp(0) = '1' and web_tmp(0) = '1' and a_width > b_width) or seq = "10") then
                  if (a_width >= width) then
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 4));
                    prcd_write_ram_col (web_tmp(0), wea_tmp(0), dia_tmp(7 downto 0), dipa_tmp(0), mem(prcd_tmp_addra_dly_depth)(7 downto 0), memp(prcd_tmp_addra_dly_depth)(0));
                  else
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_16 + 1));
                    prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_16 downto 4));
                    prcd_write_ram_col (web_tmp(0), wea_tmp(0), dia_tmp(7 downto 0), dipa_tmp(0), mem(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 16) + 7 downto (prcd_tmp_addra_dly_width * 16)), memp(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 2)));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (wea_tmp(0), web_tmp(0), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                  end if;
                 
                  if (a_width >= width) then
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 4));
                    prcd_write_ram_col (web_tmp(1), wea_tmp(1), dia_tmp(15 downto 8), dipa_tmp(1), mem(prcd_tmp_addra_dly_depth)(15 downto 8), memp(prcd_tmp_addra_dly_depth)(1));
                  else
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_16 + 1));
                    prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_16 downto 4));
                    prcd_write_ram_col (web_tmp(1), wea_tmp(1), dia_tmp(15 downto 8), dipa_tmp(1), mem(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 16) + 15 downto (prcd_tmp_addra_dly_width * 16) + 8), memp(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 2) + 1));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (wea_tmp(1), web_tmp(1), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                  end if;
                 
                end if;

      when 32 => if (not(wea_tmp(0) = '1' and web_tmp(0) = '1' and a_width > b_width) or seq = "10") then

                   prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 5));
                   prcd_write_ram_col (web_tmp(0), wea_tmp(0), dia_tmp(7 downto 0), dipa_tmp(0), mem(prcd_tmp_addra_dly_depth)(7 downto 0), memp(prcd_tmp_addra_dly_depth)(0));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (wea_tmp(0), web_tmp(0), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                   end if;

                   prcd_write_ram_col (web_tmp(1), wea_tmp(1), dia_tmp(15 downto 8), dipa_tmp(1), mem(prcd_tmp_addra_dly_depth)(15 downto 8), memp(prcd_tmp_addra_dly_depth)(1));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (wea_tmp(1), web_tmp(1), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                   end if;
                   
                   prcd_write_ram_col (web_tmp(2), wea_tmp(2), dia_tmp(23 downto 16), dipa_tmp(2), mem(prcd_tmp_addra_dly_depth)(23 downto 16), memp(prcd_tmp_addra_dly_depth)(2));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (wea_tmp(2), web_tmp(2), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                   end if;

                   prcd_write_ram_col (web_tmp(3), wea_tmp(3), dia_tmp(31 downto 24), dipa_tmp(3), mem(prcd_tmp_addra_dly_depth)(31 downto 24), memp(prcd_tmp_addra_dly_depth)(3));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (wea_tmp(3), web_tmp(3), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                   end if;

                 end if;

      when others => null;

    end case;

  end prcd_col_wr_ram_a;

  
  procedure prcd_col_wr_ram_b (
    constant seq : in std_logic_vector (1 downto 0);
    constant wea_tmp : in std_logic_vector (7 downto 0);
    constant web_tmp : in std_logic_vector (7 downto 0);
    constant dib_tmp : in std_logic_vector (63 downto 0);
    constant dipb_tmp : in std_logic_vector (7 downto 0);
    constant addra_tmp : in std_logic_vector (15 downto 0);
    constant addrb_tmp : in std_logic_vector (15 downto 0);
    variable mem : inout Two_D_array_type;
    variable memp : inout Two_D_parity_array_type;
    variable col_wr_wr_msg : inout std_ulogic;
    variable col_wra_rdb_msg : inout std_ulogic;
    variable col_wrb_rda_msg : inout std_ulogic
    ) is
    variable prcd_tmp_addrb_dly_depth : integer;
    variable prcd_tmp_addrb_dly_width : integer;
    variable junk : std_ulogic;

  begin
    
    case b_width is

      when 1 | 2 | 4 => if (not(wea_tmp(0) = '1' and web_tmp(0) = '1' and b_width > a_width) or seq = "10") then
                          if (b_width >= width) then
                            prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_lbit_124));
                            prcd_write_ram_col (wea_tmp(0), web_tmp(0), dib_tmp(b_width-1 downto 0), '0', mem(prcd_tmp_addrb_dly_depth), junk);
                          else
                            prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_124 + 1));
                            prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_124 downto addrb_lbit_124));
                            prcd_write_ram_col (wea_tmp(0), web_tmp(0), dib_tmp(b_width-1 downto 0), '0', mem(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * b_width) + b_width - 1 downto (prcd_tmp_addrb_dly_width * b_width)), junk);
                          end if;

                          if (seq = "00") then
                            prcd_chk_for_col_msg (wea_tmp(0), web_tmp(0), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                          end if;
                        end if;

      when 8 => if (not(wea_tmp(0) = '1' and web_tmp(0) = '1' and b_width > a_width) or seq = "10") then
                  if (b_width >= width) then
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 3));
                    prcd_write_ram_col (wea_tmp(0), web_tmp(0), dib_tmp(7 downto 0), dipb_tmp(0), mem(prcd_tmp_addrb_dly_depth), memp(prcd_tmp_addrb_dly_depth)(0));
                  else
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_8 + 1));
                    prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_8 downto 3));
                    prcd_write_ram_col (wea_tmp(0), web_tmp(0), dib_tmp(7 downto 0), dipb_tmp(0), mem(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 8) + 7 downto (prcd_tmp_addrb_dly_width * 8)), memp(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width)));
                  end if;
    
                  if (seq = "00") then
                    prcd_chk_for_col_msg (wea_tmp(0), web_tmp(0), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                  end if; 
                end if;

      when 16 => if (not(wea_tmp(0) = '1' and web_tmp(0) = '1' and b_width > a_width) or seq = "10") then
                  if (b_width >= width) then
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 4));
                    prcd_write_ram_col (wea_tmp(0), web_tmp(0), dib_tmp(7 downto 0), dipb_tmp(0), mem(prcd_tmp_addrb_dly_depth)(7 downto 0), memp(prcd_tmp_addrb_dly_depth)(0));
                  else
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_16 + 1));
                    prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_16 downto 4));
                    prcd_write_ram_col (wea_tmp(0), web_tmp(0), dib_tmp(7 downto 0), dipb_tmp(0), mem(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 16) + 7 downto (prcd_tmp_addrb_dly_width * 16)), memp(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 2)));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (wea_tmp(0), web_tmp(0), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                  end if;

                  if (b_width >= width) then
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 4));
                    prcd_write_ram_col (wea_tmp(1), web_tmp(1), dib_tmp(15 downto 8), dipb_tmp(1), mem(prcd_tmp_addrb_dly_depth)(15 downto 8), memp(prcd_tmp_addrb_dly_depth)(1));
                  else
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_16 + 1));
                    prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_16 downto 4));
                    prcd_write_ram_col (wea_tmp(1), web_tmp(1), dib_tmp(15 downto 8), dipb_tmp(1), mem(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 16) + 15 downto (prcd_tmp_addrb_dly_width * 16) + 8), memp(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 2) + 1));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (wea_tmp(1), web_tmp(1), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                  end if;

                end if;
      when 32 => if (not(wea_tmp(0) = '1' and web_tmp(0) = '1' and b_width > a_width) or seq = "10") then

                   prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 5));
                   prcd_write_ram_col (wea_tmp(0), web_tmp(0), dib_tmp(7 downto 0), dipb_tmp(0), mem(prcd_tmp_addrb_dly_depth)(7 downto 0), memp(prcd_tmp_addrb_dly_depth)(0));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (wea_tmp(0), web_tmp(0), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                   end if;

                   prcd_write_ram_col (wea_tmp(1), web_tmp(1), dib_tmp(15 downto 8), dipb_tmp(1), mem(prcd_tmp_addrb_dly_depth)(15 downto 8), memp(prcd_tmp_addrb_dly_depth)(1));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (wea_tmp(1), web_tmp(1), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                   end if;
                   
                   prcd_write_ram_col (wea_tmp(2), web_tmp(2), dib_tmp(23 downto 16), dipb_tmp(2), mem(prcd_tmp_addrb_dly_depth)(23 downto 16), memp(prcd_tmp_addrb_dly_depth)(2));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (wea_tmp(2), web_tmp(2), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                   end if;

                   prcd_write_ram_col (wea_tmp(3), web_tmp(3), dib_tmp(31 downto 24), dipb_tmp(3), mem(prcd_tmp_addrb_dly_depth)(31 downto 24), memp(prcd_tmp_addrb_dly_depth)(3));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (wea_tmp(3), web_tmp(3), addra_tmp, addrb_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
                   end if;

                 end if;

      when others => null;

    end case;

  end prcd_col_wr_ram_b;


  procedure prcd_col_rd_ram_a (
    constant viol_type_tmp : in std_logic_vector (1 downto 0);
    constant seq : in std_logic_vector (1 downto 0);
    constant web_tmp : in std_logic_vector (7 downto 0);
    constant wea_tmp : in std_logic_vector (7 downto 0);
    constant addra_tmp : in std_logic_vector (15 downto 0);
    variable doado_tmp : inout std_logic_vector (63 downto 0);
    variable dopadop_tmp : inout std_logic_vector (7 downto 0);
    constant mem : in Two_D_array_type;
    constant memp : in Two_D_parity_array_type;
    constant wr_mode_a_tmp : in std_logic_vector (1 downto 0)

    ) is
    variable prcd_tmp_addra_dly_depth : integer;
    variable prcd_tmp_addra_dly_width : integer;
    variable junk : std_ulogic;
    variable doado_ltmp : std_logic_vector (63 downto 0);
    variable dopadop_ltmp : std_logic_vector (7 downto 0);
    
  begin

    doado_ltmp := (others => '0');
    dopadop_ltmp := (others => '0');
    
    case a_width is
      
      when 1 | 2 | 4 => if ((web_tmp(0) = '1' and wea_tmp(0) = '1') or (seq = "01" and web_tmp(0) = '1' and wea_tmp(0) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and web_tmp(0) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and web_tmp(0) /= '1')) then

                          if (a_width >= width) then
                            prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_lbit_124));
                            doado_ltmp(a_width-1 downto 0) := mem(prcd_tmp_addra_dly_depth);
                          else
                            prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_124 + 1));
                            prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_124 downto addra_lbit_124));
                            doado_ltmp(a_width-1 downto 0) := mem(prcd_tmp_addra_dly_depth)(((prcd_tmp_addra_dly_width * a_width) + a_width - 1) downto (prcd_tmp_addra_dly_width * a_width));

                          end if;
                          prcd_x_buf (wr_mode_a_tmp, 3, 0, 0, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);
                        end if;

      when 8 => if ((web_tmp(0) = '1' and wea_tmp(0) = '1') or (seq = "01" and web_tmp(0) = '1' and wea_tmp(0) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and web_tmp(0) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and web_tmp(0) /= '1')) then

                  if (a_width >= width) then
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 3));
                    doado_ltmp(7 downto 0) := mem(prcd_tmp_addra_dly_depth);
                    dopadop_ltmp(0) := memp(prcd_tmp_addra_dly_depth)(0);
                  else
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_8 + 1));
                    prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_8 downto 3));
                    doado_ltmp(7 downto 0) := mem(prcd_tmp_addra_dly_depth)(((prcd_tmp_addra_dly_width * 8) + 7) downto (prcd_tmp_addra_dly_width * 8));
                    dopadop_ltmp(0) := memp(prcd_tmp_addra_dly_depth)(prcd_tmp_addra_dly_width);
                  end if;
                  prcd_x_buf (wr_mode_a_tmp, 7, 0, 0, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                end if;

      when 16 => if ((web_tmp(0) = '1' and wea_tmp(0) = '1') or (seq = "01" and web_tmp(0) = '1' and wea_tmp(0) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and web_tmp(0) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and web_tmp(0) /= '1')) then

                  if (a_width >= width) then
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 4));
                    doado_ltmp(7 downto 0) := mem(prcd_tmp_addra_dly_depth)(7 downto 0);
                    dopadop_ltmp(0) := memp(prcd_tmp_addra_dly_depth)(0);
                  else
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_16 + 1));
                    prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_16 downto 4));

                    doado_ltmp(7 downto 0) := mem(prcd_tmp_addra_dly_depth)(((prcd_tmp_addra_dly_width * 16) + 7) downto (prcd_tmp_addra_dly_width * 16));                    
                    dopadop_ltmp(0) := memp(prcd_tmp_addra_dly_depth)(prcd_tmp_addra_dly_width * 2);
                  end if;
                  prcd_x_buf (wr_mode_a_tmp, 7, 0, 0, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                end if;

                if ((web_tmp(1) = '1' and wea_tmp(1) = '1') or (seq = "01" and web_tmp(1) = '1' and wea_tmp(1) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and web_tmp(1) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and web_tmp(1) /= '1')) then

                  if (a_width >= width) then
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 4));
                    doado_ltmp(15 downto 8) := mem(prcd_tmp_addra_dly_depth)(15 downto 8);
                    dopadop_ltmp(1) := memp(prcd_tmp_addra_dly_depth)(1);
                  else
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_16 + 1));
                    prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_16 downto 4));

                    doado_ltmp(15 downto 8) := mem(prcd_tmp_addra_dly_depth)(((prcd_tmp_addra_dly_width * 16) + 15) downto ((prcd_tmp_addra_dly_width * 16) + 8));
                    dopadop_ltmp(1) := memp(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 2) + 1);
                  end if;
                  prcd_x_buf (wr_mode_a_tmp, 15, 8, 1, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);
                  
                end if;

      when 32 => if (a_width >= width) then

                   prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 5));

                   if ((web_tmp(0) = '1' and wea_tmp(0) = '1') or (seq = "01" and web_tmp(0) = '1' and wea_tmp(0) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and web_tmp(0) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and web_tmp(0) /= '1')) then

                     doado_ltmp(7 downto 0) := mem(prcd_tmp_addra_dly_depth)(7 downto 0);
                     dopadop_ltmp(0) := memp(prcd_tmp_addra_dly_depth)(0);
                     prcd_x_buf (wr_mode_a_tmp, 7, 0, 0, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                   end if;

                   if ((web_tmp(1) = '1' and wea_tmp(1) = '1') or (seq = "01" and web_tmp(1) = '1' and wea_tmp(1) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and web_tmp(1) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and web_tmp(1) /= '1')) then

                     doado_ltmp(15 downto 8) := mem(prcd_tmp_addra_dly_depth)(15 downto 8);
                     dopadop_ltmp(1) := memp(prcd_tmp_addra_dly_depth)(1);
                     prcd_x_buf (wr_mode_a_tmp, 15, 8, 1, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                   end if;

                   if ((web_tmp(2) = '1' and wea_tmp(2) = '1') or (seq = "01" and web_tmp(2) = '1' and wea_tmp(2) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and web_tmp(2) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and web_tmp(2) /= '1')) then

                     doado_ltmp(23 downto 16) := mem(prcd_tmp_addra_dly_depth)(23 downto 16);
                     dopadop_ltmp(2) := memp(prcd_tmp_addra_dly_depth)(2);
                     prcd_x_buf (wr_mode_a_tmp, 23, 16, 2, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                   end if;

                   if ((web_tmp(3) = '1' and wea_tmp(3) = '1') or (seq = "01" and web_tmp(3) = '1' and wea_tmp(3) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and web_tmp(3) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and web_tmp(3) /= '1')) then

                     doado_ltmp(31 downto 24) := mem(prcd_tmp_addra_dly_depth)(31 downto 24);
                     dopadop_ltmp(3) := memp(prcd_tmp_addra_dly_depth)(3);
                     prcd_x_buf (wr_mode_a_tmp, 31, 24, 3, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                   end if;
  
                end if;
  
      when others => null;

    end case;

  end prcd_col_rd_ram_a;


  procedure prcd_col_rd_ram_b (
    constant viol_type_tmp : in std_logic_vector (1 downto 0);
    constant seq : in std_logic_vector (1 downto 0);
    constant wea_tmp : in std_logic_vector (7 downto 0);
    constant web_tmp : in std_logic_vector (7 downto 0);
    constant addrb_tmp : in std_logic_vector (15 downto 0);
    variable dobdo_tmp : inout std_logic_vector (63 downto 0);
    variable dopbdop_tmp : inout std_logic_vector (7 downto 0);
    constant mem : in Two_D_array_type;
    constant memp : in Two_D_parity_array_type;
    constant wr_mode_b_tmp : in std_logic_vector (1 downto 0)

    ) is
    variable prcd_tmp_addrb_dly_depth : integer;
    variable prcd_tmp_addrb_dly_width : integer;
    variable junk : std_ulogic;
    variable dobdo_ltmp : std_logic_vector (63 downto 0);
    variable dopbdop_ltmp : std_logic_vector (7 downto 0);
    
  begin

    dobdo_ltmp := (others => '0');
    dopbdop_ltmp := (others => '0');
    
    case b_width is
      
      when 1 | 2 | 4 => if ((web_tmp(0) = '1' and wea_tmp(0) = '1') or (seq = "01" and wea_tmp(0) = '1' and web_tmp(0) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and wea_tmp(0) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and wea_tmp(0) /= '1')) then

                          if (b_width >= width) then
                            prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_lbit_124));
                            dobdo_ltmp(b_width-1 downto 0) := mem(prcd_tmp_addrb_dly_depth);
                          else
                            prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_124 + 1));
                            prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_124 downto addrb_lbit_124));
                            dobdo_ltmp(b_width-1 downto 0) := mem(prcd_tmp_addrb_dly_depth)(((prcd_tmp_addrb_dly_width * b_width) + b_width - 1) downto (prcd_tmp_addrb_dly_width * b_width));
                          end if;
                          prcd_x_buf (wr_mode_b_tmp, 3, 0, 0, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                        end if;

      when 8 => if ((web_tmp(0) = '1' and wea_tmp(0) = '1') or (seq = "01" and wea_tmp(0) = '1' and web_tmp(0) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and wea_tmp(0) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and wea_tmp(0) /= '1')) then

                  if (b_width >= width) then
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 3));
                    dobdo_ltmp(7 downto 0) := mem(prcd_tmp_addrb_dly_depth);
                    dopbdop_ltmp(0) := memp(prcd_tmp_addrb_dly_depth)(0);
                  else
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_8 + 1));
                    prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_8 downto 3));
                    dobdo_ltmp(7 downto 0) := mem(prcd_tmp_addrb_dly_depth)(((prcd_tmp_addrb_dly_width * 8) + 7) downto (prcd_tmp_addrb_dly_width * 8));
                    dopbdop_ltmp(0) := memp(prcd_tmp_addrb_dly_depth)(prcd_tmp_addrb_dly_width);
                  end if;
                  prcd_x_buf (wr_mode_b_tmp, 7, 0, 0, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                end if;

      when 16 => if ((web_tmp(0) = '1' and wea_tmp(0) = '1') or (seq = "01" and wea_tmp(0) = '1' and web_tmp(0) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and wea_tmp(0) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and wea_tmp(0) /= '1')) then

                  if (b_width >= width) then
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 4));
                    dobdo_ltmp(7 downto 0) := mem(prcd_tmp_addrb_dly_depth)(7 downto 0);
                    dopbdop_ltmp(0) := memp(prcd_tmp_addrb_dly_depth)(0);
                  else
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_16 + 1));
                    prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_16 downto 4));

                    dobdo_ltmp(7 downto 0) := mem(prcd_tmp_addrb_dly_depth)(((prcd_tmp_addrb_dly_width * 16) + 7) downto (prcd_tmp_addrb_dly_width * 16));
                    dopbdop_ltmp(0) := memp(prcd_tmp_addrb_dly_depth)(prcd_tmp_addrb_dly_width * 2);
                  end if;
                  prcd_x_buf (wr_mode_b_tmp, 7, 0, 0, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                end if;


                if ((web_tmp(1) = '1' and wea_tmp(1) = '1') or (seq = "01" and wea_tmp(1) = '1' and web_tmp(1) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and wea_tmp(1) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and wea_tmp(1) /= '1')) then

                  if (b_width >= width) then
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 4));
                    dobdo_ltmp(15 downto 8) := mem(prcd_tmp_addrb_dly_depth)(15 downto 8);
                    dopbdop_ltmp(1) := memp(prcd_tmp_addrb_dly_depth)(1);
                  else
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_16 + 1));
                    prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_16 downto 4));

                    dobdo_ltmp(15 downto 8) := mem(prcd_tmp_addrb_dly_depth)(((prcd_tmp_addrb_dly_width * 16) + 15) downto ((prcd_tmp_addrb_dly_width * 16) + 8));
                    dopbdop_ltmp(1) := memp(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 2) + 1);
                  end if;
                  prcd_x_buf (wr_mode_b_tmp, 15, 8, 1, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                end if;

      when 32 => if (b_width >= width) then

                   prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 5));

                   if ((web_tmp(0) = '1' and wea_tmp(0) = '1') or (seq = "01" and wea_tmp(0) = '1' and web_tmp(0) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and wea_tmp(0) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and wea_tmp(0) /= '1')) then

                     dobdo_ltmp(7 downto 0) := mem(prcd_tmp_addrb_dly_depth)(7 downto 0);
                     dopbdop_ltmp(0) := memp(prcd_tmp_addrb_dly_depth)(0);
                     prcd_x_buf (wr_mode_b_tmp, 7, 0, 0, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                   end if;

                   if ((web_tmp(1) = '1' and wea_tmp(1) = '1') or (seq = "01" and wea_tmp(1) = '1' and web_tmp(1) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and wea_tmp(1) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and wea_tmp(1) /= '1')) then

                     dobdo_ltmp(15 downto 8) := mem(prcd_tmp_addrb_dly_depth)(15 downto 8);
                     dopbdop_ltmp(1) := memp(prcd_tmp_addrb_dly_depth)(1);
                     prcd_x_buf (wr_mode_b_tmp, 15, 8, 1, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                   end if;

                   if ((web_tmp(2) = '1' and wea_tmp(2) = '1') or (seq = "01" and wea_tmp(2) = '1' and web_tmp(2) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and wea_tmp(2) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and wea_tmp(2) /= '1')) then

                     dobdo_ltmp(23 downto 16) := mem(prcd_tmp_addrb_dly_depth)(23 downto 16);
                     dopbdop_ltmp(2) := memp(prcd_tmp_addrb_dly_depth)(2);
                     prcd_x_buf (wr_mode_b_tmp, 23, 16, 2, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                   end if;
  
                   if ((web_tmp(3) = '1' and wea_tmp(3) = '1') or (seq = "01" and wea_tmp(3) = '1' and web_tmp(3) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and wea_tmp(3) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and wea_tmp(3) /= '1')) then

                     dobdo_ltmp(31 downto 24) := mem(prcd_tmp_addrb_dly_depth)(31 downto 24);
                     dopbdop_ltmp(3) := memp(prcd_tmp_addrb_dly_depth)(3);
                     prcd_x_buf (wr_mode_b_tmp, 31, 24, 3, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                   end if;
  
                end if;
  
      when others => null;

    end case;

  end prcd_col_rd_ram_b;


  procedure prcd_wr_ram_a (
    constant wea_tmp : in std_logic_vector (7 downto 0);
    constant dia_tmp : in std_logic_vector (63 downto 0);
    constant dipa_tmp : in std_logic_vector (7 downto 0);
    constant addra_tmp : in std_logic_vector (15 downto 0);
    variable mem : inout Two_D_array_type;
    variable memp : inout Two_D_parity_array_type
    ) is
    variable prcd_tmp_addra_dly_depth : integer;
    variable prcd_tmp_addra_dly_width : integer;
    variable junk : std_ulogic;

  begin
    
    case a_width is

      when 1 | 2 | 4 =>
                          if (a_width >= width) then
                            prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_lbit_124));
                            prcd_write_ram (wea_tmp(0), dia_tmp(a_width-1 downto 0), '0', mem(prcd_tmp_addra_dly_depth), junk);
                          else
                            prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_124 + 1));
                            prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_124 downto addra_lbit_124));
                            prcd_write_ram (wea_tmp(0), dia_tmp(a_width-1 downto 0), '0', mem(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * a_width) + a_width - 1 downto (prcd_tmp_addra_dly_width * a_width)), junk);
                          end if;

      when 8 =>
                  if (a_width >= width) then
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 3));
                    prcd_write_ram (wea_tmp(0), dia_tmp(7 downto 0), dipa_tmp(0), mem(prcd_tmp_addra_dly_depth), memp(prcd_tmp_addra_dly_depth)(0));
                  else
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_8 + 1));
                    prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_8 downto 3));
                    prcd_write_ram (wea_tmp(0), dia_tmp(7 downto 0), dipa_tmp(0), mem(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 8) + 7 downto (prcd_tmp_addra_dly_width * 8)), memp(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width)));
                  end if;
  
      when 16 =>
                  if (a_width >= width) then
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 4));
                    prcd_write_ram (wea_tmp(0), dia_tmp(7 downto 0), dipa_tmp(0), mem(prcd_tmp_addra_dly_depth)(7 downto 0), memp(prcd_tmp_addra_dly_depth)(0));
                    prcd_write_ram (wea_tmp(1), dia_tmp(15 downto 8), dipa_tmp(1), mem(prcd_tmp_addra_dly_depth)(15 downto 8), memp(prcd_tmp_addra_dly_depth)(1));
                  else
                    prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto addra_bit_16 + 1));
                    prcd_tmp_addra_dly_width := SLV_TO_INT(addra_tmp(addra_bit_16 downto 4));
                    prcd_write_ram (wea_tmp(0), dia_tmp(7 downto 0), dipa_tmp(0), mem(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 16) + 7 downto (prcd_tmp_addra_dly_width * 16)), memp(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 2)));
                    prcd_write_ram (wea_tmp(1), dia_tmp(15 downto 8), dipa_tmp(1), mem(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 16) + 15 downto (prcd_tmp_addra_dly_width * 16) + 8), memp(prcd_tmp_addra_dly_depth)((prcd_tmp_addra_dly_width * 2) + 1));
                  end if;

      when 32 =>
                   prcd_tmp_addra_dly_depth := SLV_TO_INT(addra_tmp(14 downto 5));

                   prcd_write_ram (wea_tmp(0), dia_tmp(7 downto 0), dipa_tmp(0), mem(prcd_tmp_addra_dly_depth)(7 downto 0), memp(prcd_tmp_addra_dly_depth)(0));
                   prcd_write_ram (wea_tmp(1), dia_tmp(15 downto 8), dipa_tmp(1), mem(prcd_tmp_addra_dly_depth)(15 downto 8), memp(prcd_tmp_addra_dly_depth)(1));
                   prcd_write_ram (wea_tmp(2), dia_tmp(23 downto 16), dipa_tmp(2), mem(prcd_tmp_addra_dly_depth)(23 downto 16), memp(prcd_tmp_addra_dly_depth)(2));
                   prcd_write_ram (wea_tmp(3), dia_tmp(31 downto 24), dipa_tmp(3), mem(prcd_tmp_addra_dly_depth)(31 downto 24), memp(prcd_tmp_addra_dly_depth)(3));

      when others => null;

    end case;

  end prcd_wr_ram_a;


  procedure prcd_wr_ram_b (
    constant web_tmp : in std_logic_vector (7 downto 0);
    constant dib_tmp : in std_logic_vector (63 downto 0);
    constant dipb_tmp : in std_logic_vector (7 downto 0);
    constant addrb_tmp : in std_logic_vector (15 downto 0);
    variable mem : inout Two_D_array_type;
    variable memp : inout Two_D_parity_array_type     
    ) is
    variable prcd_tmp_addrb_dly_depth : integer;
    variable prcd_tmp_addrb_dly_width : integer;
    variable junk : std_ulogic;

  begin
    
    case b_width is

      when 1 | 2 | 4 =>
                          if (b_width >= width) then
                            prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_lbit_124));
                            prcd_write_ram (web_tmp(0), dib_tmp(b_width-1 downto 0), '0', mem(prcd_tmp_addrb_dly_depth), junk);
                          else
                            prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_124 + 1));
                            prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_124 downto addrb_lbit_124));
                            prcd_write_ram (web_tmp(0), dib_tmp(b_width-1 downto 0), '0', mem(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * b_width) + b_width - 1 downto (prcd_tmp_addrb_dly_width * b_width)), junk);
                          end if;

      when 8 => 
                  if (b_width >= width) then
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 3));
                    prcd_write_ram (web_tmp(0), dib_tmp(7 downto 0), dipb_tmp(0), mem(prcd_tmp_addrb_dly_depth), memp(prcd_tmp_addrb_dly_depth)(0));
                  else
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_8 + 1));
                    prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_8 downto 3));
                    prcd_write_ram (web_tmp(0), dib_tmp(7 downto 0), dipb_tmp(0), mem(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 8) + 7 downto (prcd_tmp_addrb_dly_width * 8)), memp(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width)));
                  end if;
  
      when 16 =>
                  if (b_width >= width) then
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 4));
                    prcd_write_ram (web_tmp(0), dib_tmp(7 downto 0), dipb_tmp(0), mem(prcd_tmp_addrb_dly_depth)(7 downto 0), memp(prcd_tmp_addrb_dly_depth)(0));
                    prcd_write_ram (web_tmp(1), dib_tmp(15 downto 8), dipb_tmp(1), mem(prcd_tmp_addrb_dly_depth)(15 downto 8), memp(prcd_tmp_addrb_dly_depth)(1));
                  else
                    prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto addrb_bit_16 + 1));
                    prcd_tmp_addrb_dly_width := SLV_TO_INT(addrb_tmp(addrb_bit_16 downto 4));
                    prcd_write_ram (web_tmp(0), dib_tmp(7 downto 0), dipb_tmp(0), mem(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 16) + 7 downto (prcd_tmp_addrb_dly_width * 16)), memp(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 2)));
                    prcd_write_ram (web_tmp(1), dib_tmp(15 downto 8), dipb_tmp(1), mem(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 16) + 15 downto (prcd_tmp_addrb_dly_width * 16) + 8), memp(prcd_tmp_addrb_dly_depth)((prcd_tmp_addrb_dly_width * 2) + 1));
                  end if;

      when 32 =>
                   prcd_tmp_addrb_dly_depth := SLV_TO_INT(addrb_tmp(14 downto 5));
                   prcd_write_ram (web_tmp(0), dib_tmp(7 downto 0), dipb_tmp(0), mem(prcd_tmp_addrb_dly_depth)(7 downto 0), memp(prcd_tmp_addrb_dly_depth)(0));
                   prcd_write_ram (web_tmp(1), dib_tmp(15 downto 8), dipb_tmp(1), mem(prcd_tmp_addrb_dly_depth)(15 downto 8), memp(prcd_tmp_addrb_dly_depth)(1));
                   prcd_write_ram (web_tmp(2), dib_tmp(23 downto 16), dipb_tmp(2), mem(prcd_tmp_addrb_dly_depth)(23 downto 16), memp(prcd_tmp_addrb_dly_depth)(2));
                   prcd_write_ram (web_tmp(3), dib_tmp(31 downto 24), dipb_tmp(3), mem(prcd_tmp_addrb_dly_depth)(31 downto 24), memp(prcd_tmp_addrb_dly_depth)(3));

      when others => null;

    end case;

  end prcd_wr_ram_b;


  procedure prcd_warn_msg (
    constant addr_str : in string;
    constant clk_str : in string
    ) is

    variable message : LINE;
    constant MsgSeverity : severity_level := Warning;

  begin
        Write ( message, STRING'(" Setup/Hold Violation on "));
        Write ( message, STRING'(addr_str));
        Write ( message, STRING'(" with respect to "));
        Write ( message, STRING'(clk_str));
        Write ( message, STRING'(" when memory has been enabled. The memory contents at "));
        Write ( message, STRING'(addr_str));
        Write ( message, STRING'(" of the RAM can be corrupted. "));
        Write ( message, STRING'("This corruption is not modeled in this simulation model. Please take the necessary steps to recover from this data corruption in hardware."));
        ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
        DEALLOCATE (message);

  end prcd_warn_msg;

  
  
  begin

  ---------------------
  --  INPUT PATH DELAYs
  --------------------
  WireDelay     : block
  begin

-----  Port A

    ADDRA_DELAY : for i in 13 downto 0 generate
      VitalWireDelay (ADDRA_ipd(i), ADDRA(i), tipd_ADDRA(i));
    end generate ADDRA_DELAY;

    DIA_DELAY   : for i in 31 downto 0 generate
      VitalWireDelay (DIA_ipd(i), DIA(i), tipd_DIA(i));
    end generate DIA_DELAY;

    DIPA_DELAY  : for i in 3 downto 0 generate
      VitalWireDelay (DIPA_ipd(i), DIPA(i), tipd_DIPA(i));
    end generate DIPA_DELAY;

    WEA_DELAY : for i in  3 downto 0 GENERATE
      VitalWireDelay (WEA_ipd(i) , WEA(i), tipd_WEA(i));
    end generate WEA_DELAY;

    VitalWireDelay (CLKA_ipd, CLKA, tipd_CLKA);
    VitalWireDelay (ENA_ipd, ENA, tipd_ENA);
    VitalWireDelay (SSRA_ipd, SSRA, tipd_SSRA);

-----  Port B

    ADDRB_DELAY : for i in 13 downto 0 generate
      VitalWireDelay (ADDRB_ipd(i), ADDRB(i), tipd_ADDRB(i));
    end generate ADDRB_DELAY;

    DIB_DELAY   : for i in 31 downto 0 generate
      VitalWireDelay (DIB_ipd(i), DIB(i), tipd_DIB(i));
    end generate DIB_DELAY;

    DIPB_DELAY  : for i in 3 downto 0 generate
      VitalWireDelay (DIPB_ipd(i), DIPB(i), tipd_DIPB(i));
    end generate DIPB_DELAY;

    WEB_DELAY : for i in  3 downto 0 GENERATE
      VitalWireDelay (WEB_ipd(i) , WEB(i), tipd_WEB(i));
    end generate WEB_DELAY;

    VitalWireDelay (CLKB_ipd, CLKB, tipd_CLKB);
    VitalWireDelay (ENB_ipd, ENB, tipd_ENB);
    VitalWireDelay (SSRB_ipd, SSRB, tipd_SSRB);

----- GSR


  end block;

  SignalDelay   : block
  begin

-----  Port A

    ADDRA_DELAY : for i in 13 downto 0 generate
      VitalSignalDelay (ADDRA_int(i), ADDRA_ipd(i), tisd_ADDRA_CLKA(i));
    end generate ADDRA_DELAY;

    DIA_DELAY   : for i in 31 downto 0 generate
      VitalSignalDelay (DIA_int(i), DIA_ipd(i), tisd_DIA_CLKA(i));
    end generate DIA_DELAY;

    DIPA_DELAY  : for i in 3 downto 0 generate
      VitalSignalDelay (DIPA_int(i), DIPA_ipd(i), tisd_DIPA_CLKA(i));
    end generate DIPA_DELAY;

    WEA_DELAY   : for i in 3 downto 0 generate
      VitalSignalDelay (WEA_int(i), WEA_ipd(i), tisd_WEA_CLKA(i));
    end generate WEA_DELAY;

    VitalSignalDelay (CLKA_dly, CLKA_ipd, ticd_CLKA);
    VitalSignalDelay (ENA_dly, ENA_ipd, tisd_ENA_CLKA);
    VitalSignalDelay (SSRA_dly, SSRA_ipd, tisd_SSRA_CLKA);

-----  Port B   

    ADDRB_DELAY : for i in 13 downto 0 generate
      VitalSignalDelay (ADDRB_int(i), ADDRB_ipd(i), tisd_ADDRB_CLKB(i));
    end generate ADDRB_DELAY;


    DIB_DELAY   : for i in 31 downto 0 generate
      VitalSignalDelay (DIB_int(i), DIB_ipd(i), tisd_DIB_CLKB(i));
    end generate DIB_DELAY;

    DIPB_DELAY  : for i in 3 downto 0 generate
      VitalSignalDelay (DIPB_int(i), DIPB_ipd(i), tisd_DIPB_CLKB(i));
    end generate DIPB_DELAY;

    WEB_DELAY   : for i in 3 downto 0 generate
      VitalSignalDelay (WEB_int(i), WEB_ipd(i), tisd_WEB_CLKB(i));
    end generate WEB_DELAY;

    VitalSignalDelay (CLKB_dly, CLKB_ipd, ticd_CLKB);
    VitalSignalDelay (ENB_dly, ENB_ipd, tisd_ENB_CLKB);
    VitalSignalDelay (SSRB_dly, SSRB_ipd, tisd_SSRB_CLKB);

  end block;


    gsr_dly <= GSR;
    dia_dly <= X"00000000" & DIA_int;
    dib_dly <= X"00000000" & DIB_int;
    dipa_dly <= "0000" & DIPA_int;
    dipb_dly <= "0000" & DIPB_int;
    wea_dly <= "0000" & WEA_int;
    web_dly <= "0000" & WEB_int;
    addra_dly <= "00" & ADDRA_int;
    addrb_dly <= "00" & ADDRB_int;

    
  --------------------
  --  BEHAVIOR SECTION
  --------------------

    prcs_clk: process (clka_dly, clkb_dly, gsr_dly, ssra_dly, ssrb_dly, ena_dly, enb_dly)

      variable mem_slv : std_logic_vector(16383 downto 0) := To_StdLogicVector(INIT_3F) &
                                                       To_StdLogicVector(INIT_3E) &
                                                       To_StdLogicVector(INIT_3D) &
                                                       To_StdLogicVector(INIT_3C) &
                                                       To_StdLogicVector(INIT_3B) &
                                                       To_StdLogicVector(INIT_3A) &
                                                       To_StdLogicVector(INIT_39) &
                                                       To_StdLogicVector(INIT_38) &
                                                       To_StdLogicVector(INIT_37) &
                                                       To_StdLogicVector(INIT_36) &
                                                       To_StdLogicVector(INIT_35) &
                                                       To_StdLogicVector(INIT_34) &
                                                       To_StdLogicVector(INIT_33) &
                                                       To_StdLogicVector(INIT_32) &
                                                       To_StdLogicVector(INIT_31) &
                                                       To_StdLogicVector(INIT_30) &
                                                       To_StdLogicVector(INIT_2F) &
                                                       To_StdLogicVector(INIT_2E) &
                                                       To_StdLogicVector(INIT_2D) &
                                                       To_StdLogicVector(INIT_2C) &
                                                       To_StdLogicVector(INIT_2B) &
                                                       To_StdLogicVector(INIT_2A) &
                                                       To_StdLogicVector(INIT_29) &
                                                       To_StdLogicVector(INIT_28) &
                                                       To_StdLogicVector(INIT_27) &
                                                       To_StdLogicVector(INIT_26) &
                                                       To_StdLogicVector(INIT_25) &
                                                       To_StdLogicVector(INIT_24) &
                                                       To_StdLogicVector(INIT_23) &
                                                       To_StdLogicVector(INIT_22) &
                                                       To_StdLogicVector(INIT_21) &
                                                       To_StdLogicVector(INIT_20) &
                                                       To_StdLogicVector(INIT_1F) &
                                                       To_StdLogicVector(INIT_1E) &
                                                       To_StdLogicVector(INIT_1D) &
                                                       To_StdLogicVector(INIT_1C) &
                                                       To_StdLogicVector(INIT_1B) &
                                                       To_StdLogicVector(INIT_1A) &
                                                       To_StdLogicVector(INIT_19) &
                                                       To_StdLogicVector(INIT_18) &
                                                       To_StdLogicVector(INIT_17) &
                                                       To_StdLogicVector(INIT_16) &
                                                       To_StdLogicVector(INIT_15) &
                                                       To_StdLogicVector(INIT_14) &
                                                       To_StdLogicVector(INIT_13) &
                                                       To_StdLogicVector(INIT_12) &
                                                       To_StdLogicVector(INIT_11) &
                                                       To_StdLogicVector(INIT_10) &
                                                       To_StdLogicVector(INIT_0F) &
                                                       To_StdLogicVector(INIT_0E) &
                                                       To_StdLogicVector(INIT_0D) &
                                                       To_StdLogicVector(INIT_0C) &
                                                       To_StdLogicVector(INIT_0B) &
                                                       To_StdLogicVector(INIT_0A) &
                                                       To_StdLogicVector(INIT_09) &
                                                       To_StdLogicVector(INIT_08) &
                                                       To_StdLogicVector(INIT_07) &
                                                       To_StdLogicVector(INIT_06) &
                                                       To_StdLogicVector(INIT_05) &
                                                       To_StdLogicVector(INIT_04) &
                                                       To_StdLogicVector(INIT_03) &
                                                       To_StdLogicVector(INIT_02) &
                                                       To_StdLogicVector(INIT_01) &
                                                       To_StdLogicVector(INIT_00);

    variable memp_slv : std_logic_vector(2047 downto 0) := To_StdLogicVector(INITP_07) &
                                                       To_StdLogicVector(INITP_06) &
                                                       To_StdLogicVector(INITP_05) &
                                                       To_StdLogicVector(INITP_04) &
                                                       To_StdLogicVector(INITP_03) &
                                                       To_StdLogicVector(INITP_02) &
                                                       To_StdLogicVector(INITP_01) &
                                                       To_StdLogicVector(INITP_00);

    variable tmp_mem : Two_D_array_type_tmp_mem := two_D_mem_initf(widest_width);
    variable mem : Two_D_array_type := two_D_mem_init(mem_depth, width, mem_slv, tmp_mem);
    variable memp : Two_D_parity_array_type := two_D_mem_initp(memp_depth, widthp, memp_slv, tmp_mem, width);
    variable tmp_addra_dly_depth : integer;
    variable tmp_addra_dly_width : integer;
    variable tmp_addrb_dly_depth : integer;
    variable tmp_addrb_dly_width : integer;
    variable junk1 : std_logic;
    variable wr_mode_a : std_logic_vector(1 downto 0) := "00";
    variable wr_mode_b : std_logic_vector(1 downto 0) := "00";
    variable tmp_syndrome_int : integer;    
    variable doado_buf : std_logic_vector(63 downto 0) := (others => '0');
    variable dobdo_buf : std_logic_vector(63 downto 0) := (others => '0');
    variable dopadop_buf : std_logic_vector(7 downto 0) := (others => '0');
    variable dopbdop_buf : std_logic_vector(7 downto 0) := (others => '0');    
    variable syndrome : std_logic_vector(7 downto 0) := (others => '0');
    variable addra_dly_15_reg_var : std_logic := '0';
    variable addrb_dly_15_reg_var : std_logic := '0';
    variable addra_dly_15_reg_bram_var : std_logic := '0';
    variable addrb_dly_15_reg_bram_var : std_logic := '0';
    variable FIRST_TIME : boolean := true;

    variable curr_time : time := 0 ps;
    variable prev_time : time := 0 ps;
    variable viol_time : integer := 0;
    variable viol_type : std_logic_vector(1 downto 0) := (others => '0');
    variable message : line;

    variable dia_reg_dly : std_logic_vector(63 downto 0) := (others => '0');
    variable dipa_reg_dly : std_logic_vector(7 downto 0) := (others => '0');
    variable wea_reg_dly : std_logic_vector(7 downto 0) := (others => '0');
    variable addra_reg_dly : std_logic_vector(15 downto 0) := (others => '0');
    variable dib_reg_dly : std_logic_vector(63 downto 0) := (others => '0');
    variable dipb_reg_dly : std_logic_vector(7 downto 0) := (others => '0');
    variable web_reg_dly : std_logic_vector(7 downto 0) := (others => '0');
    variable addrb_reg_dly : std_logic_vector(15 downto 0) := (others => '0');
    variable col_wr_wr_msg : std_ulogic := '1';
    variable col_wra_rdb_msg : std_ulogic := '1';
    variable col_wrb_rda_msg : std_ulogic := '1';
    variable addr_col : std_logic := '0';
    
  begin  -- process prcs_clka    

    if (FIRST_TIME) then

      case DATA_WIDTH_A is
        when 0 | 1 | 2 | 4 | 9 | 18 | 36 => null;

        when others => GenericValueCheckMessage
                         (  HeaderMsg            => " Attribute Syntax Error : ",
                            GenericName          => " DATA_WIDTH_A ",
                            EntityName           => "X_RAMB16BWE",
                            GenericValue         => DATA_WIDTH_A,
                            Unit                 => "",
                            ExpectedValueMsg     => " The Legal values for this attribute are ",
                            ExpectedGenericValue => " 0, 1, 2, 4, 9, 18 or 36.",
                            TailMsg              => "",
                            MsgSeverity          => failure
                            );
      end case;


      case DATA_WIDTH_B is
        when 0 | 1 | 2 | 4 | 9 | 18 | 36 => null;

        when others => GenericValueCheckMessage
                         (  HeaderMsg            => " Attribute Syntax Error : ",
                            GenericName          => " DATA_WIDTH_B ",
                            EntityName           => "X_RAMB16BWE",
                            GenericValue         => DATA_WIDTH_B,
                            Unit                 => "",
                            ExpectedValueMsg     => " The Legal values for this attribute are ",
                            ExpectedGenericValue => " 0, 1, 2, 4, 9, 18 or 36.",
                            TailMsg              => "",
                            MsgSeverity          => failure
                            );
      end case;

      
      if (DATA_WIDTH_A = 0 and DATA_WIDTH_B = 0) then
        assert false
        report "Attribute Syntax Error : Attributes DATA_WIDTH_A and DATA_WIDTH_B on X_RAMB16BWE instance, both can not be 0."
        severity failure;
      end if;

      
      if (WRITE_MODE_A = "WRITE_FIRST") then
        wr_mode_a := "00";
      elsif (WRITE_MODE_A = "READ_FIRST") then
        wr_mode_a := "01";
      elsif (WRITE_MODE_A = "NO_CHANGE") then
        wr_mode_a := "10";
      else
        GenericValueCheckMessage
          ( HeaderMsg            => " Attribute Syntax Error : ",
            GenericName          => " WRITE_MODE_A ",
            EntityName           => "X_RAMB16BWE",
            GenericValue         => WRITE_MODE_A,
            Unit                 => "",
            ExpectedValueMsg     => " The Legal values for this attribute are ",
            ExpectedGenericValue => " WRITE_FIRST, READ_FIRST or NO_CHANGE ",
            TailMsg              => "",
            MsgSeverity          => failure
            );
      end if;
    
      if (WRITE_MODE_B = "WRITE_FIRST") then
        wr_mode_b := "00";
      elsif (WRITE_MODE_B = "READ_FIRST") then
        wr_mode_b := "01";
      elsif (WRITE_MODE_B = "NO_CHANGE") then
        wr_mode_b := "10";
      else
        GenericValueCheckMessage
          ( HeaderMsg            => " Attribute Syntax Error : ",
            GenericName          => " WRITE_MODE_B ",
            EntityName           => "X_RAMB16BWE",
            GenericValue         => WRITE_MODE_B,
            Unit                 => "",
            ExpectedValueMsg     => " The Legal values for this attribute are ",
            ExpectedGenericValue => " WRITE_FIRST, READ_FIRST or NO_CHANGE ",
            TailMsg              => "",
            MsgSeverity          => failure
            );
      end if;

    
      if (not ((SIM_COLLISION_CHECK = "NONE") or (SIM_COLLISION_CHECK = "WARNING_ONLY") or (SIM_COLLISION_CHECK = "GENERATE_X_ONLY") or (SIM_COLLISION_CHECK = "ALL"))) then
        GenericValueCheckMessage
          (HeaderMsg => "Attribute Syntax Error",
           GenericName => "SIM_COLLISION_CHECK",
           EntityName => "X_RAMB16BWE",
           GenericValue => SIM_COLLISION_CHECK,
           Unit => "",
           ExpectedValueMsg => "Legal Values for this attribute are ALL, NONE, WARNING_ONLY or GENERATE_X_ONLY",
           ExpectedGenericValue => "",
           TailMsg => "",
           MsgSeverity => error
           );
      end if;

      
    end if;
    -- end of FIRST_TIME
    

    if (rising_edge(clka_dly)) then

      if (ena_dly = '1') then      
        prev_time := curr_time;
        curr_time := now;
        addra_reg_dly := addra_dly;
        wea_reg_dly := wea_dly;
        dia_reg_dly := dia_dly;
        dipa_reg_dly := dipa_dly;
      end if;
      
    end if;
    
    if (rising_edge(clkb_dly)) then

      if (enb_dly = '1') then
        prev_time := curr_time;
        curr_time := now;
        addrb_reg_dly := addrb_dly;
        web_reg_dly := web_dly;
        dib_reg_dly := dib_dly;
        dipb_reg_dly := dipb_dly;
      end if;
      
    end if;
    
    if (gsr_dly = '1' or FIRST_TIME) then

      doado_out(a_width-1 downto 0) <= INIT_A_STD(a_width-1 downto 0);

      if (a_width >= 8) then
        dopadop_out(a_widthp-1 downto 0) <= INIT_A_STD((a_width+a_widthp)-1 downto a_width);            
      end if;

      dobdo_out(b_width-1 downto 0) <= INIT_B_STD(b_width-1 downto 0);          

      if (b_width >= 8) then
        dopbdop_out(b_widthp-1 downto 0) <= INIT_B_STD((b_width+b_widthp)-1 downto b_width);            
      end if;

      FIRST_TIME := false;
      
    elsif (gsr_dly = '0') then

     if (rising_edge(clka_dly) or rising_edge(clkb_dly)) then

-------------------------------------------------------------------------------
-- Collision starts
-------------------------------------------------------------------------------

       if (SIM_COLLISION_CHECK /= "NONE") then

        
        if (curr_time - prev_time = 0 ps) then
          viol_time := 1;
        elsif (curr_time - prev_time <= SETUP_READ_FIRST) then
          viol_time := 2;
        end if;

        
        if (ena_dly = '0' or enb_dly = '0') then
          viol_time := 0;
        end if;

        
        if ((DATA_WIDTH_A <= 9 and wea_dly(0) = '0') or (DATA_WIDTH_A = 18 and wea_dly(1 downto 0) = "00") or (DATA_WIDTH_A = 36 and wea_dly(3 downto 0) = "0000")) then
          if ((DATA_WIDTH_B <= 9 and web_dly(0) = '0') or (DATA_WIDTH_B = 18 and web_dly(1 downto 0) = "00") or (DATA_WIDTH_B = 36 and web_dly(3 downto 0) = "0000")) then
            viol_time := 0;
          end if;
        end if;

        
        if (viol_time /= 0) then
          
          if (rising_edge(clka_dly) and rising_edge(clkb_dly)) then
            if (addra_dly(13 downto col_addr_lsb) = addrb_dly(13 downto col_addr_lsb)) then
              
              viol_type := "01";

              prcd_rd_ram_a (addra_dly, doado_buf, dopadop_buf, mem, memp);
              prcd_rd_ram_b (addrb_dly, dobdo_buf, dopbdop_buf, mem, memp);
              
              prcd_col_wr_ram_a ("00", web_dly, wea_dly, di_x, di_x(7 downto 0), addrb_dly, addra_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
              prcd_col_wr_ram_b ("00", wea_dly, web_dly, di_x, di_x(7 downto 0), addra_dly, addrb_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);

              prcd_col_rd_ram_a (viol_type, "01", web_dly, wea_dly, addra_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              prcd_col_rd_ram_b (viol_type, "01", wea_dly, web_dly, addrb_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);

              prcd_col_wr_ram_a ("10", web_dly, wea_dly, dia_dly, dipa_dly, addrb_dly, addra_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);

              prcd_col_wr_ram_b ("10", wea_dly, web_dly, dib_dly, dipb_dly, addra_dly, addrb_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);

              
              if (wr_mode_a /= "01") then
                prcd_col_rd_ram_a (viol_type, "11", web_dly, wea_dly, addra_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              end if;

              if (wr_mode_b /= "01") then
                prcd_col_rd_ram_b (viol_type, "11", wea_dly, web_dly, addrb_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);
              end if;

            else
              viol_time := 0;
              
            end if;

          elsif (rising_edge(clka_dly) and  (not(rising_edge(clkb_dly)))) then
            if (addra_dly(13 downto col_addr_lsb) = addrb_reg_dly(13 downto col_addr_lsb)) then
              
              viol_type := "10";

              prcd_rd_ram_a (addra_dly, doado_buf, dopadop_buf, mem, memp);

              prcd_col_wr_ram_a ("00", web_reg_dly, wea_dly, di_x, di_x(7 downto 0), addrb_reg_dly, addra_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
              prcd_col_wr_ram_b ("00", wea_dly, web_reg_dly, di_x, di_x(7 downto 0), addra_dly, addrb_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);

              prcd_col_rd_ram_a (viol_type, "01", web_reg_dly, wea_dly, addra_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              prcd_col_rd_ram_b (viol_type, "01", wea_dly, web_reg_dly, addrb_reg_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);

              prcd_col_wr_ram_a ("10", web_reg_dly, wea_dly, dia_dly, dipa_dly, addrb_reg_dly, addra_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);

              prcd_col_wr_ram_b ("10", wea_dly, web_reg_dly, dib_reg_dly, dipb_reg_dly, addra_dly, addrb_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);

			    
              if (wr_mode_a /= "01") then
                prcd_col_rd_ram_a (viol_type, "11", web_reg_dly, wea_dly, addra_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              end if;

              if (wr_mode_b /= "01") then
                prcd_col_rd_ram_b (viol_type, "11", wea_dly, web_reg_dly, addrb_reg_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);
              end if;

            else
              viol_time := 0;
              
            end if;

          elsif ((not(rising_edge(clka_dly))) and rising_edge(clkb_dly)) then
            if (addra_reg_dly(13 downto col_addr_lsb) = addrb_dly(13 downto col_addr_lsb)) then
                              
              viol_type := "11";

              prcd_rd_ram_b (addrb_dly, dobdo_buf, dopbdop_buf, mem, memp);

              prcd_col_wr_ram_a ("00", web_dly, wea_reg_dly, di_x, di_x(7 downto 0), addrb_dly, addra_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);
              prcd_col_wr_ram_b ("00", wea_reg_dly, web_dly, di_x, di_x(7 downto 0), addra_reg_dly, addrb_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);

              prcd_col_rd_ram_a (viol_type, "01", web_dly, wea_reg_dly, addra_reg_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              prcd_col_rd_ram_b (viol_type, "01", wea_reg_dly, web_dly, addrb_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);

              prcd_col_wr_ram_a ("10", web_dly, wea_reg_dly, dia_reg_dly, dipa_reg_dly, addrb_dly, addra_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);

              prcd_col_wr_ram_b ("10", wea_reg_dly, web_dly, dib_dly, dipb_dly, addra_reg_dly, addrb_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg);

			    
              if (wr_mode_a /= "01") then
                prcd_col_rd_ram_a (viol_type, "11", web_dly, wea_reg_dly, addra_reg_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              end if;

              if (wr_mode_b /= "01") then
                prcd_col_rd_ram_b (viol_type, "11", wea_reg_dly, web_dly, addrb_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);
              end if;

            else
              viol_time := 0;
              
            end if;
          end if;

          if (SIM_COLLISION_CHECK = "WARNING_ONLY") then
            viol_time := 0;
          end if;
          
        end if;
      end if;
-------------------------------------------------------------------------------
-- end collision
-------------------------------------------------------------------------------

    end if;
       
-------------------------------------------------------------------------------
-- Port A
-------------------------------------------------------------------------------        
    if (rising_edge(clka_dly)) then
      
      if (gsr_dly = '0' and ena_dly = '1') then

        if (ssra_dly = '1') then

          doado_buf(a_width-1 downto 0) := SRVAL_A_STD(a_width-1 downto 0);
          doado_out(a_width-1 downto 0) <= SRVAL_A_STD(a_width-1 downto 0);          

          if (a_width >= 8) then
            dopadop_buf(a_widthp-1 downto 0) := SRVAL_A_STD((a_width+a_widthp)-1 downto a_width);
            dopadop_out(a_widthp-1 downto 0) <= SRVAL_A_STD((a_width+a_widthp)-1 downto a_width);            
          end if;

        end if;

        
        if (viol_time = 0) then
          -- read for rf
          if (wr_mode_a = "01" and ssra_dly = '0') then
            prcd_rd_ram_a (addra_dly, doado_buf, dopadop_buf, mem, memp);
          end if;

          if (ena_dly = '1') then
            prcd_wr_ram_a (wea_dly, dia_dly, dipa_dly, addra_dly, mem, memp);    
          end if;
          
          if (wr_mode_a /= "01" and ssra_dly = '0') then
            prcd_rd_ram_a (addra_dly, doado_buf, dopadop_buf, mem, memp);
          end if;

        
        end if;
      end if;
    end if;
    
-------------------------------------------------------------------------------
-- Port B
-------------------------------------------------------------------------------

    if (rising_edge(clkb_dly)) then

      if (gsr_dly = '0' and enb_dly = '1') then

        if (ssrb_dly = '1') then

          dobdo_buf(b_width-1 downto 0) := SRVAL_B_STD(b_width-1 downto 0);
          dobdo_out(b_width-1 downto 0) <= SRVAL_B_STD(b_width-1 downto 0);          

          if (b_width >= 8) then
            dopbdop_buf(b_widthp-1 downto 0) := SRVAL_B_STD((b_width+b_widthp)-1 downto b_width);
            dopbdop_out(b_widthp-1 downto 0) <= SRVAL_B_STD((b_width+b_widthp)-1 downto b_width);            
          end if;

        end if;


        if (viol_time = 0) then
          
          if (wr_mode_b = "01" and ssrb_dly = '0') then
            prcd_rd_ram_b (addrb_dly, dobdo_buf, dopbdop_buf, mem, memp);            
          end if;

          if (enb_dly = '1') then
            prcd_wr_ram_b (web_dly, dib_dly, dipb_dly, addrb_dly, mem, memp);
          end if;
          
          if (wr_mode_b /= "01" and ssrb_dly = '0') then
            prcd_rd_ram_b (addrb_dly, dobdo_buf, dopbdop_buf, mem, memp);
          end if;
          
        end if;
      end if;
    end if;
    

    if (ena_dly = '1' and (rising_edge(clka_dly) or viol_time /= 0)) then
      if (ssra_dly = '0' and (wr_mode_a /= "10" or (DATA_WIDTH_A <= 9 and wea_dly(0) = '0') or (DATA_WIDTH_A = 18 and wea_dly(1 downto 0) = "00") or (DATA_WIDTH_A = 36 and wea_dly(3 downto 0) = "0000"))) then

        doado_out <= doado_buf;
        dopadop_out <= dopadop_buf;

      end if;
    end if;

    
    if (enb_dly = '1' and (rising_edge(clkb_dly) or viol_time /= 0)) then

      if (ssrb_dly = '0' and (wr_mode_b /= "10" or (DATA_WIDTH_B <= 9 and web_dly(0) = '0') or (DATA_WIDTH_B = 18 and web_dly(1 downto 0) = "00") or (DATA_WIDTH_B = 36 and web_dly(3 downto 0) = "0000"))) then

        dobdo_out <= dobdo_buf;
        dopbdop_out <= dopbdop_buf;

      end if;
    end if;

    
    viol_time := 0;
    viol_type := "00";
    col_wr_wr_msg := '1';
    col_wra_rdb_msg := '1';
    col_wrb_rda_msg := '1';


  end if;


  end process prcs_clk;


-------------------------------------------------------------------------------
-- Timing check
-------------------------------------------------------------------------------
  process

    variable ENA_dly_sampled   : std_ulogic := 'X';
    variable ENB_dly_sampled   : std_ulogic := 'X';
    variable WEA_dly_sampled   : std_logic_vector(7 downto 0) := (others => 'X');
    variable WEB_dly_sampled   : std_logic_vector(7 downto 0) := (others => 'X');
    
    variable Tviol_ADDRA0_CLKA_posedge  : std_ulogic := '0';
    variable Tviol_ADDRA1_CLKA_posedge  : std_ulogic := '0';
    variable Tviol_ADDRA2_CLKA_posedge  : std_ulogic := '0';
    variable Tviol_ADDRA3_CLKA_posedge  : std_ulogic := '0';
    variable Tviol_ADDRA4_CLKA_posedge  : std_ulogic := '0';
    variable Tviol_ADDRA5_CLKA_posedge  : std_ulogic := '0';
    variable Tviol_ADDRA6_CLKA_posedge  : std_ulogic := '0';
    variable Tviol_ADDRA7_CLKA_posedge  : std_ulogic := '0';
    variable Tviol_ADDRA8_CLKA_posedge  : std_ulogic := '0';
    variable Tviol_ADDRA9_CLKA_posedge  : std_ulogic := '0';
    variable Tviol_ADDRA10_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA11_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA12_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA13_CLKA_posedge : std_ulogic := '0';
    variable Tviol_DIA0_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_DIA1_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_DIA2_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_DIA3_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_DIA4_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_DIA5_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_DIA6_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_DIA7_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_DIA8_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_DIA9_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_DIA10_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA11_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA12_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA13_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA14_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA15_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA16_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA17_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA18_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA19_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA20_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA21_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA22_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA23_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA24_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA25_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA26_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA27_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA28_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA29_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA30_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA31_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIPA0_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIPA1_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIPA2_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIPA3_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_ENA_CLKA_posedge     : std_ulogic := '0';
    variable Tviol_SSRA_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_WEA0_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_WEA1_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_WEA2_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_WEA3_CLKA_posedge    : std_ulogic := '0';

    variable Tviol_ADDRB0_CLKB_posedge  : std_ulogic := '0';
    variable Tviol_ADDRB1_CLKB_posedge  : std_ulogic := '0';
    variable Tviol_ADDRB2_CLKB_posedge  : std_ulogic := '0';
    variable Tviol_ADDRB3_CLKB_posedge  : std_ulogic := '0';
    variable Tviol_ADDRB4_CLKB_posedge  : std_ulogic := '0';
    variable Tviol_ADDRB5_CLKB_posedge  : std_ulogic := '0';
    variable Tviol_ADDRB6_CLKB_posedge  : std_ulogic := '0';
    variable Tviol_ADDRB7_CLKB_posedge  : std_ulogic := '0';
    variable Tviol_ADDRB8_CLKB_posedge  : std_ulogic := '0';
    variable Tviol_ADDRB9_CLKB_posedge  : std_ulogic := '0';
    variable Tviol_ADDRB10_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB11_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB12_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB13_CLKB_posedge : std_ulogic := '0';
    variable Tviol_DIB0_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_DIB1_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_DIB2_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_DIB3_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_DIB4_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_DIB5_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_DIB6_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_DIB7_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_DIB8_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_DIB9_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_DIB10_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB11_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB12_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB13_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB14_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB15_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB16_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB17_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB18_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB19_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB20_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB21_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB22_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB23_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB24_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB25_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB26_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB27_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB28_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB29_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB30_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB31_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIPB0_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIPB1_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIPB2_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIPB3_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_ENB_CLKB_posedge     : std_ulogic := '0';
    variable Tviol_SSRB_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_WEB0_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_WEB1_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_WEB2_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_WEB3_CLKB_posedge    : std_ulogic := '0';

    variable Tviol_CLKA_CLKB_all        : std_ulogic := '0';
    variable Tviol_CLKA_CLKB_read_first : std_ulogic := '0';
    variable Tviol_CLKB_CLKA_all        : std_ulogic := '0';
    variable Tviol_CLKB_CLKA_read_first : std_ulogic := '0';

    variable Tmkr_ADDRA0_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA1_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA2_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA3_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA4_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA5_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA6_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA7_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA8_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA9_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA10_CLKA_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA11_CLKA_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA12_CLKA_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA13_CLKA_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA0_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA1_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA2_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA3_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA4_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA5_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA6_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA7_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA8_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA9_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA10_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA11_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA12_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA13_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA14_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA15_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA16_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA17_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA18_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA19_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA20_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA21_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA22_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA23_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA24_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA25_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA26_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA27_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA28_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA29_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA30_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA31_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPA0_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPA1_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPA2_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPA3_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENA_CLKA_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSRA_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEA0_CLKA_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEA1_CLKA_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEA2_CLKA_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEA3_CLKA_posedge      : VitalTimingDataType := VitalTimingDataInit;

    variable Tmkr_ADDRB0_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB1_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB2_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB3_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB4_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB5_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB6_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB7_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB8_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB9_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB10_CLKB_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB11_CLKB_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB12_CLKB_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB13_CLKB_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB0_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB1_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB2_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB3_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB4_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB5_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB6_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB7_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB8_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB9_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB10_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB11_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB12_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB13_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB14_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB15_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB16_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB17_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB18_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB19_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB20_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB21_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB22_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB23_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB24_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB25_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB26_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB27_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB28_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB29_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB30_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB31_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPB0_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPB1_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPB2_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPB3_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENB_CLKB_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSRB_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEB0_CLKB_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEB1_CLKB_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEB2_CLKB_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEB3_CLKB_posedge      : VitalTimingDataType := VitalTimingDataInit;

    variable Tmkr_CLKA_CLKB_all        : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKA_CLKB_read_first : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKB_CLKA_all        : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKB_CLKA_read_first : VitalTimingDataType := VitalTimingDataInit;


    variable Pviol_CLKA, Pviol_CLKB : std_ulogic          := '0';
    variable Pinfo_CLKA, Pinfo_CLKB : VitalPeriodDataType := VitalPeriodDataInit;

    variable Pviol_SSRA, Pviol_SSRB : std_ulogic          := '0';
    variable Pinfo_SSRA, Pinfo_SSRB : VitalPeriodDataType := VitalPeriodDataInit;

    
  begin  -- process
    if (TimingChecksOn) then

    ENA_dly_sampled   := ENA_dly;
    ENB_dly_sampled   := ENB_dly;
    WEA_dly_sampled   := WEA_dly;
    WEB_dly_sampled   := WEB_dly;
      
      VitalPeriodPulseCheck (
         Violation      => Pviol_SSRA,
         PeriodData     => PInfo_SSRA,
         TestSignal     => SSRA_dly,
         TestSignalName => "SSRA",
         TestDelay      => 0 ns,
         Period         => 0 ns,
         PulseWidthHigh => tpw_SSRA_posedge,
         PulseWidthLow  => 0 ns,
         CheckEnabled   => TRUE,
         HeaderMsg      => "/X_RAMB16BWE",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => warning);
      VitalPeriodPulseCheck (
         Violation      => Pviol_SSRB,
         PeriodData     => PInfo_SSRB,
         TestSignal     => SSRB_dly,
         TestSignalName => "SSRB",
         TestDelay      => 0 ns,
         Period         => 0 ns,
         PulseWidthHigh => tpw_SSRB_posedge,
         PulseWidthLow  => 0 ns,
         CheckEnabled   => TRUE,
         HeaderMsg      => "/X_RAMB16BWE",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ENA_CLKA_posedge,
        TimingData     => Tmkr_ENA_CLKA_posedge,
        TestSignal     => ENA_dly,
        TestSignalName => "ENA",
        TestDelay      => tisd_ENA_CLKA,
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ENA_CLKA_posedge_posedge,
        SetupLow       => tsetup_ENA_CLKA_negedge_posedge,
        HoldLow        => thold_ENA_CLKA_negedge_posedge,
        HoldHigh       => thold_ENA_CLKA_posedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_SSRA_CLKA_posedge,
        TimingData     => Tmkr_SSRA_CLKA_posedge,
        TestSignal     => SSRA_dly,
        TestSignalName => "SSRA",
        TestDelay      => tisd_SSRA_CLKA,
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_SSRA_CLKA_posedge_posedge,
        SetupLow       => tsetup_SSRA_CLKA_negedge_posedge,
        HoldLow        => thold_SSRA_CLKA_negedge_posedge,
        HoldHigh       => thold_SSRA_CLKA_posedge_posedge,
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
       VitalSetupHoldCheck (
        Violation      => Tviol_WEA0_CLKA_posedge,
        TimingData     => Tmkr_WEA0_CLKA_posedge,
        TestSignal     => WEA_dly(0),
        TestSignalName => "WEA(0)",
        TestDelay      => tisd_WEA_CLKA(0),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_WEA_CLKA_posedge_posedge(0),
        SetupLow       => tsetup_WEA_CLKA_negedge_posedge(0),
        HoldLow        => thold_WEA_CLKA_negedge_posedge(0),
        HoldHigh       => thold_WEA_CLKA_posedge_posedge(0),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEA1_CLKA_posedge,
        TimingData     => Tmkr_WEA1_CLKA_posedge,
        TestSignal     => WEA_dly(1),
        TestSignalName => "WEA(1)",
        TestDelay      => tisd_WEA_CLKA(1),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_WEA_CLKA_posedge_posedge(1),
        SetupLow       => tsetup_WEA_CLKA_negedge_posedge(1),
        HoldLow        => thold_WEA_CLKA_negedge_posedge(1),
        HoldHigh       => thold_WEA_CLKA_posedge_posedge(1),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEA2_CLKA_posedge,
        TimingData     => Tmkr_WEA2_CLKA_posedge,
        TestSignal     => WEA_dly(2),
        TestSignalName => "WEA(2)",
        TestDelay      => tisd_WEA_CLKA(2),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_WEA_CLKA_posedge_posedge(2),
        SetupLow       => tsetup_WEA_CLKA_negedge_posedge(2),
        HoldLow        => thold_WEA_CLKA_negedge_posedge(2),
        HoldHigh       => thold_WEA_CLKA_posedge_posedge(2),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEA3_CLKA_posedge,
        TimingData     => Tmkr_WEA3_CLKA_posedge,
        TestSignal     => WEA_dly(3),
        TestSignalName => "WEA(3)",
        TestDelay      => tisd_WEA_CLKA(3),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_WEA_CLKA_posedge_posedge(3),
        SetupLow       => tsetup_WEA_CLKA_negedge_posedge(3),
        HoldLow        => thold_WEA_CLKA_negedge_posedge(3),
        HoldHigh       => thold_WEA_CLKA_posedge_posedge(3),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA0_CLKA_posedge,
        TimingData     => Tmkr_ADDRA0_CLKA_posedge,
        TestSignal     => ADDRA_dly(0),
        TestSignalName => "ADDRA(0)",
        TestDelay      => tisd_ADDRA_CLKA(0),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(0),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(0),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(0),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(0),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA1_CLKA_posedge,
        TimingData     => Tmkr_ADDRA1_CLKA_posedge,
        TestSignal     => ADDRA_dly(1),
        TestSignalName => "ADDRA(1)",
        TestDelay      => tisd_ADDRA_CLKA(1),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(1),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(1),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(1),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(1),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA2_CLKA_posedge,
        TimingData     => Tmkr_ADDRA2_CLKA_posedge,
        TestSignal     => ADDRA_dly(2),
        TestSignalName => "ADDRA(2)",
        TestDelay      => tisd_ADDRA_CLKA(2),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(2),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(2),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(2),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(2),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA3_CLKA_posedge,
        TimingData     => Tmkr_ADDRA3_CLKA_posedge,
        TestSignal     => ADDRA_dly(3),
        TestSignalName => "ADDRA(3)",
        TestDelay      => tisd_ADDRA_CLKA(3),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(3),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(3),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(3),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(3),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA4_CLKA_posedge,
        TimingData     => Tmkr_ADDRA4_CLKA_posedge,
        TestSignal     => ADDRA_dly(4),
        TestSignalName => "ADDRA(4)",
        TestDelay      => tisd_ADDRA_CLKA(4),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(4),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(4),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(4),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(4),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA5_CLKA_posedge,
        TimingData     => Tmkr_ADDRA5_CLKA_posedge,
        TestSignal     => ADDRA_dly(5),
        TestSignalName => "ADDRA(5)",
        TestDelay      => tisd_ADDRA_CLKA(5),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(5),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(5),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(5),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(5),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA6_CLKA_posedge,
        TimingData     => Tmkr_ADDRA6_CLKA_posedge,
        TestSignal     => ADDRA_dly(6),
        TestSignalName => "ADDRA(6)",
        TestDelay      => tisd_ADDRA_CLKA(6),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(6),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(6),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(6),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(6),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA7_CLKA_posedge,
        TimingData     => Tmkr_ADDRA7_CLKA_posedge,
        TestSignal     => ADDRA_dly(7),
        TestSignalName => "ADDRA(7)",
        TestDelay      => tisd_ADDRA_CLKA(7),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(7),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(7),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(7),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(7),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA8_CLKA_posedge,
        TimingData     => Tmkr_ADDRA8_CLKA_posedge,
        TestSignal     => ADDRA_dly(8),
        TestSignalName => "ADDRA(8)",
        TestDelay      => tisd_ADDRA_CLKA(8),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(8),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(8),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(8),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(8),
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPA0_CLKA_posedge,
        TimingData     => Tmkr_DIPA0_CLKA_posedge,
        TestSignal     => DIPA_dly(0),
        TestSignalName => "DIPA(0)",
        TestDelay      => tisd_DIPA_CLKA(0),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIPA_CLKA_posedge_posedge(0),
        SetupLow       => tsetup_DIPA_CLKA_negedge_posedge(0),
        HoldLow        => thold_DIPA_CLKA_negedge_posedge(0),
        HoldHigh       => thold_DIPA_CLKA_posedge_posedge(0),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPA1_CLKA_posedge,
        TimingData     => Tmkr_DIPA1_CLKA_posedge,
        TestSignal     => DIPA_dly(1),
        TestSignalName => "DIPA(1)",
        TestDelay      => tisd_DIPA_CLKA(1),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIPA_CLKA_posedge_posedge(1),
        SetupLow       => tsetup_DIPA_CLKA_negedge_posedge(1),
        HoldLow        => thold_DIPA_CLKA_negedge_posedge(1),
        HoldHigh       => thold_DIPA_CLKA_posedge_posedge(1),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPA2_CLKA_posedge,
        TimingData     => Tmkr_DIPA2_CLKA_posedge,
        TestSignal     => DIPA_dly(2),
        TestSignalName => "DIPA(2)",
        TestDelay      => tisd_DIPA_CLKA(2),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIPA_CLKA_posedge_posedge(2),
        SetupLow       => tsetup_DIPA_CLKA_negedge_posedge(2),
        HoldLow        => thold_DIPA_CLKA_negedge_posedge(2),
        HoldHigh       => thold_DIPA_CLKA_posedge_posedge(2),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPA3_CLKA_posedge,
        TimingData     => Tmkr_DIPA3_CLKA_posedge,
        TestSignal     => DIPA_dly(3),
        TestSignalName => "DIPA(3)",
        TestDelay      => tisd_DIPA_CLKA(3),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIPA_CLKA_posedge_posedge(3),
        SetupLow       => tsetup_DIPA_CLKA_negedge_posedge(3),
        HoldLow        => thold_DIPA_CLKA_negedge_posedge(3),
        HoldHigh       => thold_DIPA_CLKA_posedge_posedge(3),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA0_CLKA_posedge,
        TimingData     => Tmkr_DIA0_CLKA_posedge,
        TestSignal     => DIA_dly(0),
        TestSignalName => "DIA(0)",
        TestDelay      => tisd_DIA_CLKA(0),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(0),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(0),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(0),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(0),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA1_CLKA_posedge,
        TimingData     => Tmkr_DIA1_CLKA_posedge,
        TestSignal     => DIA_dly(1),
        TestSignalName => "DIA(1)",
        TestDelay      => tisd_DIA_CLKA(1),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(1),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(1),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(1),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(1),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA2_CLKA_posedge,
        TimingData     => Tmkr_DIA2_CLKA_posedge,
        TestSignal     => DIA_dly(2),
        TestSignalName => "DIA(2)",
        TestDelay      => tisd_DIA_CLKA(2),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(2),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(2),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(2),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(2),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA3_CLKA_posedge,
        TimingData     => Tmkr_DIA3_CLKA_posedge,
        TestSignal     => DIA_dly(3),
        TestSignalName => "DIA(3)",
        TestDelay      => tisd_DIA_CLKA(3),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(3),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(3),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(3),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(3),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA4_CLKA_posedge,
        TimingData     => Tmkr_DIA4_CLKA_posedge,
        TestSignal     => DIA_dly(4),
        TestSignalName => "DIA(4)",
        TestDelay      => tisd_DIA_CLKA(4),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(4),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(4),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(4),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(4),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA5_CLKA_posedge,
        TimingData     => Tmkr_DIA5_CLKA_posedge,
        TestSignal     => DIA_dly(5),
        TestSignalName => "DIA(5)",
        TestDelay      => tisd_DIA_CLKA(5),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(5),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(5),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(5),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(5),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA6_CLKA_posedge,
        TimingData     => Tmkr_DIA6_CLKA_posedge,
        TestSignal     => DIA_dly(6),
        TestSignalName => "DIA(6)",
        TestDelay      => tisd_DIA_CLKA(6),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(6),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(6),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(6),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(6),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA7_CLKA_posedge,
        TimingData     => Tmkr_DIA7_CLKA_posedge,
        TestSignal     => DIA_dly(7),
        TestSignalName => "DIA(7)",
        TestDelay      => tisd_DIA_CLKA(7),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(7),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(7),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(7),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(7),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA8_CLKA_posedge,
        TimingData     => Tmkr_DIA8_CLKA_posedge,
        TestSignal     => DIA_dly(8),
        TestSignalName => "DIA(8)",
        TestDelay      => tisd_DIA_CLKA(8),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(8),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(8),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(8),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(8),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA9_CLKA_posedge,
        TimingData     => Tmkr_DIA9_CLKA_posedge,
        TestSignal     => DIA_dly(9),
        TestSignalName => "DIA(9)",
        TestDelay      => tisd_DIA_CLKA(9),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(9),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(9),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(9),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(9),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA10_CLKA_posedge,
        TimingData     => Tmkr_DIA10_CLKA_posedge,
        TestSignal     => DIA_dly(10),
        TestSignalName => "DIA(10)",
        TestDelay      => tisd_DIA_CLKA(10),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(10),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(10),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(10),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(10),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA11_CLKA_posedge,
        TimingData     => Tmkr_DIA11_CLKA_posedge,
        TestSignal     => DIA_dly(11),
        TestSignalName => "DIA(11)",
        TestDelay      => tisd_DIA_CLKA(11),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(11),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(11),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(11),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(11),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA12_CLKA_posedge,
        TimingData     => Tmkr_DIA12_CLKA_posedge,
        TestSignal     => DIA_dly(12),
        TestSignalName => "DIA(12)",
        TestDelay      => tisd_DIA_CLKA(12),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(12),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(12),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(12),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(12),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA13_CLKA_posedge,
        TimingData     => Tmkr_DIA13_CLKA_posedge,
        TestSignal     => DIA_dly(13),
        TestSignalName => "DIA(13)",
        TestDelay      => tisd_DIA_CLKA(13),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(13),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(13),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(13),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(13),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA14_CLKA_posedge,
        TimingData     => Tmkr_DIA14_CLKA_posedge,
        TestSignal     => DIA_dly(14),
        TestSignalName => "DIA(14)",
        TestDelay      => tisd_DIA_CLKA(14),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(14),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(14),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(14),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(14),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA15_CLKA_posedge,
        TimingData     => Tmkr_DIA15_CLKA_posedge,
        TestSignal     => DIA_dly(15),
        TestSignalName => "DIA(15)",
        TestDelay      => tisd_DIA_CLKA(15),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(15),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(15),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(15),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(15),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA16_CLKA_posedge,
        TimingData     => Tmkr_DIA16_CLKA_posedge,
        TestSignal     => DIA_dly(16),
        TestSignalName => "DIA(16)",
        TestDelay      => tisd_DIA_CLKA(16),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(16),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(16),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(16),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(16),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA17_CLKA_posedge,
        TimingData     => Tmkr_DIA17_CLKA_posedge,
        TestSignal     => DIA_dly(17),
        TestSignalName => "DIA(17)",
        TestDelay      => tisd_DIA_CLKA(17),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(17),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(17),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(17),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(17),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA18_CLKA_posedge,
        TimingData     => Tmkr_DIA18_CLKA_posedge,
        TestSignal     => DIA_dly(18),
        TestSignalName => "DIA(18)",
        TestDelay      => tisd_DIA_CLKA(18),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(18),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(18),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(18),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(18),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA19_CLKA_posedge,
        TimingData     => Tmkr_DIA19_CLKA_posedge,
        TestSignal     => DIA_dly(19),
        TestSignalName => "DIA(19)",
        TestDelay      => tisd_DIA_CLKA(19),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(19),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(19),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(19),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(19),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA20_CLKA_posedge,
        TimingData     => Tmkr_DIA20_CLKA_posedge,
        TestSignal     => DIA_dly(20),
        TestSignalName => "DIA(20)",
        TestDelay      => tisd_DIA_CLKA(20),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(20),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(20),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(20),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(20),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA21_CLKA_posedge,
        TimingData     => Tmkr_DIA21_CLKA_posedge,
        TestSignal     => DIA_dly(21),
        TestSignalName => "DIA(21)",
        TestDelay      => tisd_DIA_CLKA(21),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(21),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(21),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(21),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(21),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA22_CLKA_posedge,
        TimingData     => Tmkr_DIA22_CLKA_posedge,
        TestSignal     => DIA_dly(22),
        TestSignalName => "DIA(22)",
        TestDelay      => tisd_DIA_CLKA(22),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(22),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(22),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(22),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(22),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA23_CLKA_posedge,
        TimingData     => Tmkr_DIA23_CLKA_posedge,
        TestSignal     => DIA_dly(23),
        TestSignalName => "DIA(23)",
        TestDelay      => tisd_DIA_CLKA(23),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(23),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(23),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(23),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(23),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA24_CLKA_posedge,
        TimingData     => Tmkr_DIA24_CLKA_posedge,
        TestSignal     => DIA_dly(24),
        TestSignalName => "DIA(24)",
        TestDelay      => tisd_DIA_CLKA(24),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(24),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(24),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(24),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(24),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA25_CLKA_posedge,
        TimingData     => Tmkr_DIA25_CLKA_posedge,
        TestSignal     => DIA_dly(25),
        TestSignalName => "DIA(25)",
        TestDelay      => tisd_DIA_CLKA(25),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(25),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(25),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(25),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(25),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA26_CLKA_posedge,
        TimingData     => Tmkr_DIA26_CLKA_posedge,
        TestSignal     => DIA_dly(26),
        TestSignalName => "DIA(26)",
        TestDelay      => tisd_DIA_CLKA(26),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(26),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(26),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(26),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(26),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA27_CLKA_posedge,
        TimingData     => Tmkr_DIA27_CLKA_posedge,
        TestSignal     => DIA_dly(27),
        TestSignalName => "DIA(27)",
        TestDelay      => tisd_DIA_CLKA(27),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(27),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(27),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(27),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(27),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA28_CLKA_posedge,
        TimingData     => Tmkr_DIA28_CLKA_posedge,
        TestSignal     => DIA_dly(28),
        TestSignalName => "DIA(28)",
        TestDelay      => tisd_DIA_CLKA(28),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(28),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(28),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(28),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(28),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA29_CLKA_posedge,
        TimingData     => Tmkr_DIA29_CLKA_posedge,
        TestSignal     => DIA_dly(29),
        TestSignalName => "DIA(29)",
        TestDelay      => tisd_DIA_CLKA(29),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(29),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(29),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(29),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(29),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA30_CLKA_posedge,
        TimingData     => Tmkr_DIA30_CLKA_posedge,
        TestSignal     => DIA_dly(30),
        TestSignalName => "DIA(30)",
        TestDelay      => tisd_DIA_CLKA(30),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(30),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(30),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(30),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(30),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA31_CLKA_posedge,
        TimingData     => Tmkr_DIA31_CLKA_posedge,
        TestSignal     => DIA_dly(31),
        TestSignalName => "DIA(31)",
        TestDelay      => tisd_DIA_CLKA(31),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_DIA_CLKA_posedge_posedge(31),
        SetupLow       => tsetup_DIA_CLKA_negedge_posedge(31),
        HoldLow        => thold_DIA_CLKA_negedge_posedge(31),
        HoldHigh       => thold_DIA_CLKA_posedge_posedge(31),
        CheckEnabled   => (TO_X01(ena_dly_sampled)    = '1' and
                           TO_X01(wea_dly_sampled(0)) = '1' and
                           TO_X01(wea_dly_sampled(1)) = '1' and
                           TO_X01(wea_dly_sampled(2)) = '1' and
                           TO_X01(wea_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ENB_CLKB_posedge,
        TimingData     => Tmkr_ENB_CLKB_posedge,
        TestSignal     => ENB_dly,
        TestSignalName => "ENB",
        TestDelay      => tisd_ENB_CLKB,
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ENB_CLKB_posedge_posedge,
        SetupLow       => tsetup_ENB_CLKB_negedge_posedge,
        HoldLow        => thold_ENB_CLKB_negedge_posedge,
        HoldHigh       => thold_ENB_CLKB_posedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_SSRB_CLKB_posedge,
        TimingData     => Tmkr_SSRB_CLKB_posedge,
        TestSignal     => SSRB_dly,
        TestSignalName => "SSRB",
        TestDelay      => tisd_SSRB_CLKB,
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_SSRB_CLKB_posedge_posedge,
        SetupLow       => tsetup_SSRB_CLKB_negedge_posedge,
        HoldLow        => thold_SSRB_CLKB_negedge_posedge,
        HoldHigh       => thold_SSRB_CLKB_posedge_posedge,
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEB0_CLKB_posedge,
        TimingData     => Tmkr_WEB0_CLKB_posedge,
        TestSignal     => WEB_dly(0),
        TestSignalName => "WEB(0)",
        TestDelay      => tisd_WEB_CLKB(0),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_WEB_CLKB_posedge_posedge(0),
        SetupLow       => tsetup_WEB_CLKB_negedge_posedge(0),
        HoldLow        => thold_WEB_CLKB_negedge_posedge(0),
        HoldHigh       => thold_WEB_CLKB_posedge_posedge(0),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEB1_CLKB_posedge,
        TimingData     => Tmkr_WEB1_CLKB_posedge,
        TestSignal     => WEB_dly(1),
        TestSignalName => "WEB(1)",
        TestDelay      => tisd_WEB_CLKB(1),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_WEB_CLKB_posedge_posedge(1),
        SetupLow       => tsetup_WEB_CLKB_negedge_posedge(1),
        HoldLow        => thold_WEB_CLKB_negedge_posedge(1),
        HoldHigh       => thold_WEB_CLKB_posedge_posedge(1),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEB2_CLKB_posedge,
        TimingData     => Tmkr_WEB2_CLKB_posedge,
        TestSignal     => WEB_dly(2),
        TestSignalName => "WEB(2)",
        TestDelay      => tisd_WEB_CLKB(2),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_WEB_CLKB_posedge_posedge(2),
        SetupLow       => tsetup_WEB_CLKB_negedge_posedge(2),
        HoldLow        => thold_WEB_CLKB_negedge_posedge(2),
        HoldHigh       => thold_WEB_CLKB_posedge_posedge(2),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEB3_CLKB_posedge,
        TimingData     => Tmkr_WEB3_CLKB_posedge,
        TestSignal     => WEB_dly(3),
        TestSignalName => "WEB(3)",
        TestDelay      => tisd_WEB_CLKB(3),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_WEB_CLKB_posedge_posedge(3),
        SetupLow       => tsetup_WEB_CLKB_negedge_posedge(3),
        HoldLow        => thold_WEB_CLKB_negedge_posedge(3),
        HoldHigh       => thold_WEB_CLKB_posedge_posedge(3),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB0_CLKB_posedge,
        TimingData     => Tmkr_ADDRB0_CLKB_posedge,
        TestSignal     => ADDRB_dly(0),
        TestSignalName => "ADDRB(0)",
        TestDelay      => tisd_ADDRB_CLKB(0),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(0),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(0),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(0),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(0),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB1_CLKB_posedge,
        TimingData     => Tmkr_ADDRB1_CLKB_posedge,
        TestSignal     => ADDRB_dly(1),
        TestSignalName => "ADDRB(1)",
        TestDelay      => tisd_ADDRB_CLKB(1),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(1),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(1),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(1),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(1),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB2_CLKB_posedge,
        TimingData     => Tmkr_ADDRB2_CLKB_posedge,
        TestSignal     => ADDRB_dly(2),
        TestSignalName => "ADDRB(2)",
        TestDelay      => tisd_ADDRB_CLKB(2),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(2),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(2),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(2),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(2),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB3_CLKB_posedge,
        TimingData     => Tmkr_ADDRB3_CLKB_posedge,
        TestSignal     => ADDRB_dly(3),
        TestSignalName => "ADDRB(3)",
        TestDelay      => tisd_ADDRB_CLKB(3),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(3),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(3),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(3),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(3),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB4_CLKB_posedge,
        TimingData     => Tmkr_ADDRB4_CLKB_posedge,
        TestSignal     => ADDRB_dly(4),
        TestSignalName => "ADDRB(4)",
        TestDelay      => tisd_ADDRB_CLKB(4),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(4),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(4),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(4),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(4),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB5_CLKB_posedge,
        TimingData     => Tmkr_ADDRB5_CLKB_posedge,
        TestSignal     => ADDRB_dly(5),
        TestSignalName => "ADDRB(5)",
        TestDelay      => tisd_ADDRB_CLKB(5),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(5),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(5),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(5),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(5),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB6_CLKB_posedge,
        TimingData     => Tmkr_ADDRB6_CLKB_posedge,
        TestSignal     => ADDRB_dly(6),
        TestSignalName => "ADDRB(6)",
        TestDelay      => tisd_ADDRB_CLKB(6),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(6),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(6),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(6),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(6),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB7_CLKB_posedge,
        TimingData     => Tmkr_ADDRB7_CLKB_posedge,
        TestSignal     => ADDRB_dly(7),
        TestSignalName => "ADDRB(7)",
        TestDelay      => tisd_ADDRB_CLKB(7),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(7),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(7),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(7),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(7),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB8_CLKB_posedge,
        TimingData     => Tmkr_ADDRB8_CLKB_posedge,
        TestSignal     => ADDRB_dly(8),
        TestSignalName => "ADDRB(8)",
        TestDelay      => tisd_ADDRB_CLKB(8),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(8),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(8),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(8),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(8),
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPB0_CLKB_posedge,
        TimingData     => Tmkr_DIPB0_CLKB_posedge,
        TestSignal     => DIPB_dly(0),
        TestSignalName => "DIPB(0)",
        TestDelay      => tisd_DIPB_CLKB(0),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIPB_CLKB_posedge_posedge(0),
        SetupLow       => tsetup_DIPB_CLKB_negedge_posedge(0),
        HoldLow        => thold_DIPB_CLKB_negedge_posedge(0),
        HoldHigh       => thold_DIPB_CLKB_posedge_posedge(0),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPB1_CLKB_posedge,
        TimingData     => Tmkr_DIPB1_CLKB_posedge,
        TestSignal     => DIPB_dly(1),
        TestSignalName => "DIPB(1)",
        TestDelay      => tisd_DIPB_CLKB(1),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIPB_CLKB_posedge_posedge(1),
        SetupLow       => tsetup_DIPB_CLKB_negedge_posedge(1),
        HoldLow        => thold_DIPB_CLKB_negedge_posedge(1),
        HoldHigh       => thold_DIPB_CLKB_posedge_posedge(1),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPB2_CLKB_posedge,
        TimingData     => Tmkr_DIPB2_CLKB_posedge,
        TestSignal     => DIPB_dly(2),
        TestSignalName => "DIPB(2)",
        TestDelay      => tisd_DIPB_CLKB(2),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIPB_CLKB_posedge_posedge(2),
        SetupLow       => tsetup_DIPB_CLKB_negedge_posedge(2),
        HoldLow        => thold_DIPB_CLKB_negedge_posedge(2),
        HoldHigh       => thold_DIPB_CLKB_posedge_posedge(2),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPB3_CLKB_posedge,
        TimingData     => Tmkr_DIPB3_CLKB_posedge,
        TestSignal     => DIPB_dly(3),
        TestSignalName => "DIPB(3)",
        TestDelay      => tisd_DIPB_CLKB(3),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIPB_CLKB_posedge_posedge(3),
        SetupLow       => tsetup_DIPB_CLKB_negedge_posedge(3),
        HoldLow        => thold_DIPB_CLKB_negedge_posedge(3),
        HoldHigh       => thold_DIPB_CLKB_posedge_posedge(3),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB0_CLKB_posedge,
        TimingData     => Tmkr_DIB0_CLKB_posedge,
        TestSignal     => DIB_dly(0),
        TestSignalName => "DIB(0)",
        TestDelay      => tisd_DIB_CLKB(0),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(0),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(0),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(0),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(0),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB1_CLKB_posedge,
        TimingData     => Tmkr_DIB1_CLKB_posedge,
        TestSignal     => DIB_dly(1),
        TestSignalName => "DIB(1)",
        TestDelay      => tisd_DIB_CLKB(1),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(1),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(1),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(1),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(1),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB2_CLKB_posedge,
        TimingData     => Tmkr_DIB2_CLKB_posedge,
        TestSignal     => DIB_dly(2),
        TestSignalName => "DIB(2)",
        TestDelay      => tisd_DIB_CLKB(2),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(2),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(2),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(2),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(2),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB3_CLKB_posedge,
        TimingData     => Tmkr_DIB3_CLKB_posedge,
        TestSignal     => DIB_dly(3),
        TestSignalName => "DIB(3)",
        TestDelay      => tisd_DIB_CLKB(3),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(3),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(3),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(3),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(3),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB4_CLKB_posedge,
        TimingData     => Tmkr_DIB4_CLKB_posedge,
        TestSignal     => DIB_dly(4),
        TestSignalName => "DIB(4)",
        TestDelay      => tisd_DIB_CLKB(4),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(4),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(4),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(4),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(4),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB5_CLKB_posedge,
        TimingData     => Tmkr_DIB5_CLKB_posedge,
        TestSignal     => DIB_dly(5),
        TestSignalName => "DIB(5)",
        TestDelay      => tisd_DIB_CLKB(5),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(5),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(5),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(5),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(5),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB6_CLKB_posedge,
        TimingData     => Tmkr_DIB6_CLKB_posedge,
        TestSignal     => DIB_dly(6),
        TestSignalName => "DIB(6)",
        TestDelay      => tisd_DIB_CLKB(6),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(6),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(6),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(6),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(6),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB7_CLKB_posedge,
        TimingData     => Tmkr_DIB7_CLKB_posedge,
        TestSignal     => DIB_dly(7),
        TestSignalName => "DIB(7)",
        TestDelay      => tisd_DIB_CLKB(7),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(7),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(7),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(7),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(7),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB8_CLKB_posedge,
        TimingData     => Tmkr_DIB8_CLKB_posedge,
        TestSignal     => DIB_dly(8),
        TestSignalName => "DIB(8)",
        TestDelay      => tisd_DIB_CLKB(8),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(8),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(8),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(8),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(8),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB9_CLKB_posedge,
        TimingData     => Tmkr_DIB9_CLKB_posedge,
        TestSignal     => DIB_dly(9),
        TestSignalName => "DIB(9)",
        TestDelay      => tisd_DIB_CLKB(9),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(9),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(9),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(9),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(9),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB10_CLKB_posedge,
        TimingData     => Tmkr_DIB10_CLKB_posedge,
        TestSignal     => DIB_dly(10),
        TestSignalName => "DIB(10)",
        TestDelay      => tisd_DIB_CLKB(10),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(10),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(10),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(10),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(10),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB11_CLKB_posedge,
        TimingData     => Tmkr_DIB11_CLKB_posedge,
        TestSignal     => DIB_dly(11),
        TestSignalName => "DIB(11)",
        TestDelay      => tisd_DIB_CLKB(11),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(11),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(11),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(11),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(11),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB12_CLKB_posedge,
        TimingData     => Tmkr_DIB12_CLKB_posedge,
        TestSignal     => DIB_dly(12),
        TestSignalName => "DIB(12)",
        TestDelay      => tisd_DIB_CLKB(12),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(12),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(12),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(12),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(12),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB13_CLKB_posedge,
        TimingData     => Tmkr_DIB13_CLKB_posedge,
        TestSignal     => DIB_dly(13),
        TestSignalName => "DIB(13)",
        TestDelay      => tisd_DIB_CLKB(13),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(13),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(13),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(13),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(13),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB14_CLKB_posedge,
        TimingData     => Tmkr_DIB14_CLKB_posedge,
        TestSignal     => DIB_dly(14),
        TestSignalName => "DIB(14)",
        TestDelay      => tisd_DIB_CLKB(14),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(14),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(14),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(14),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(14),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB15_CLKB_posedge,
        TimingData     => Tmkr_DIB15_CLKB_posedge,
        TestSignal     => DIB_dly(15),
        TestSignalName => "DIB(15)",
        TestDelay      => tisd_DIB_CLKB(15),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(15),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(15),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(15),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(15),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB16_CLKB_posedge,
        TimingData     => Tmkr_DIB16_CLKB_posedge,
        TestSignal     => DIB_dly(16),
        TestSignalName => "DIB(16)",
        TestDelay      => tisd_DIB_CLKB(16),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(16),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(16),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(16),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(16),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB17_CLKB_posedge,
        TimingData     => Tmkr_DIB17_CLKB_posedge,
        TestSignal     => DIB_dly(17),
        TestSignalName => "DIB(17)",
        TestDelay      => tisd_DIB_CLKB(17),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(17),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(17),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(17),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(17),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB18_CLKB_posedge,
        TimingData     => Tmkr_DIB18_CLKB_posedge,
        TestSignal     => DIB_dly(18),
        TestSignalName => "DIB(18)",
        TestDelay      => tisd_DIB_CLKB(18),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(18),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(18),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(18),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(18),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB19_CLKB_posedge,
        TimingData     => Tmkr_DIB19_CLKB_posedge,
        TestSignal     => DIB_dly(19),
        TestSignalName => "DIB(19)",
        TestDelay      => tisd_DIB_CLKB(19),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(19),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(19),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(19),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(19),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB20_CLKB_posedge,
        TimingData     => Tmkr_DIB20_CLKB_posedge,
        TestSignal     => DIB_dly(20),
        TestSignalName => "DIB(20)",
        TestDelay      => tisd_DIB_CLKB(20),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(20),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(20),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(20),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(20),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB21_CLKB_posedge,
        TimingData     => Tmkr_DIB21_CLKB_posedge,
        TestSignal     => DIB_dly(21),
        TestSignalName => "DIB(21)",
        TestDelay      => tisd_DIB_CLKB(21),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(21),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(21),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(21),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(21),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB22_CLKB_posedge,
        TimingData     => Tmkr_DIB22_CLKB_posedge,
        TestSignal     => DIB_dly(22),
        TestSignalName => "DIB(22)",
        TestDelay      => tisd_DIB_CLKB(22),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(22),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(22),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(22),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(22),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB23_CLKB_posedge,
        TimingData     => Tmkr_DIB23_CLKB_posedge,
        TestSignal     => DIB_dly(23),
        TestSignalName => "DIB(23)",
        TestDelay      => tisd_DIB_CLKB(23),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(23),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(23),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(23),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(23),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB24_CLKB_posedge,
        TimingData     => Tmkr_DIB24_CLKB_posedge,
        TestSignal     => DIB_dly(24),
        TestSignalName => "DIB(24)",
        TestDelay      => tisd_DIB_CLKB(24),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(24),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(24),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(24),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(24),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB25_CLKB_posedge,
        TimingData     => Tmkr_DIB25_CLKB_posedge,
        TestSignal     => DIB_dly(25),
        TestSignalName => "DIB(25)",
        TestDelay      => tisd_DIB_CLKB(25),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(25),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(25),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(25),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(25),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB26_CLKB_posedge,
        TimingData     => Tmkr_DIB26_CLKB_posedge,
        TestSignal     => DIB_dly(26),
        TestSignalName => "DIB(26)",
        TestDelay      => tisd_DIB_CLKB(26),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(26),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(26),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(26),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(26),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB27_CLKB_posedge,
        TimingData     => Tmkr_DIB27_CLKB_posedge,
        TestSignal     => DIB_dly(27),
        TestSignalName => "DIB(27)",
        TestDelay      => tisd_DIB_CLKB(27),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(27),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(27),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(27),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(27),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB28_CLKB_posedge,
        TimingData     => Tmkr_DIB28_CLKB_posedge,
        TestSignal     => DIB_dly(28),
        TestSignalName => "DIB(28)",
        TestDelay      => tisd_DIB_CLKB(28),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(28),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(28),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(28),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(28),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB29_CLKB_posedge,
        TimingData     => Tmkr_DIB29_CLKB_posedge,
        TestSignal     => DIB_dly(29),
        TestSignalName => "DIB(29)",
        TestDelay      => tisd_DIB_CLKB(29),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(29),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(29),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(29),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(29),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB30_CLKB_posedge,
        TimingData     => Tmkr_DIB30_CLKB_posedge,
        TestSignal     => DIB_dly(30),
        TestSignalName => "DIB(30)",
        TestDelay      => tisd_DIB_CLKB(30),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(30),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(30),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(30),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(30),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIB31_CLKB_posedge,
        TimingData     => Tmkr_DIB31_CLKB_posedge,
        TestSignal     => DIB_dly(31),
        TestSignalName => "DIB(31)",
        TestDelay      => tisd_DIB_CLKB(31),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_DIB_CLKB_posedge_posedge(31),
        SetupLow       => tsetup_DIB_CLKB_negedge_posedge(31),
        HoldLow        => thold_DIB_CLKB_negedge_posedge(31),
        HoldHigh       => thold_DIB_CLKB_posedge_posedge(31),
--        CheckEnabled   => (TO_X01(enb_dly_sampled) = '1' and TO_X01(web_dly_sampled) = '1'),
        CheckEnabled   => (TO_X01(enb_dly_sampled)    = '1' and
                           TO_X01(web_dly_sampled(0)) = '1' and
                           TO_X01(web_dly_sampled(1)) = '1' and
                           TO_X01(web_dly_sampled(2)) = '1' and
                           TO_X01(web_dly_sampled(3)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLKA,
        PeriodData     => PInfo_CLKA,
        TestSignal     => CLKA_dly,
        TestSignalName => "CLKA",
        TestDelay      => 0 ps,
        Period         => tperiod_clka_posedge,
        PulseWidthHigh => tpw_CLKA_posedge,
        PulseWidthLow  => tpw_CLKA_negedge,
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLKB,
        PeriodData     => PInfo_CLKB,
        TestSignal     => CLKB_dly,
        TestSignalName => "CLKB",
        TestDelay      => 0 ps,
        Period         => tperiod_clkb_posedge,
        PulseWidthHigh => tpw_CLKB_posedge,
        PulseWidthLow  => tpw_CLKB_negedge,
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        HeaderMsg      => "/X_RAMB16BWE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);

    end if;

    
    ViolationA          <=
      Tviol_ADDRA0_CLKA_posedge or
      Tviol_ADDRA1_CLKA_posedge or
      Tviol_ADDRA2_CLKA_posedge or
      Tviol_ADDRA3_CLKA_posedge or
      Tviol_ADDRA4_CLKA_posedge or
      Tviol_ADDRA5_CLKA_posedge or
      Tviol_ADDRA6_CLKA_posedge or
      Tviol_ADDRA7_CLKA_posedge or
      Tviol_ADDRA8_CLKA_posedge or
      Tviol_DIA0_CLKA_posedge or
      Tviol_DIA1_CLKA_posedge or
      Tviol_DIA2_CLKA_posedge or
      Tviol_DIA3_CLKA_posedge or
      Tviol_DIA4_CLKA_posedge or
      Tviol_DIA5_CLKA_posedge or
      Tviol_DIA6_CLKA_posedge or
      Tviol_DIA7_CLKA_posedge or
      Tviol_DIA8_CLKA_posedge or
      Tviol_DIA9_CLKA_posedge or
      Tviol_DIA10_CLKA_posedge or
      Tviol_DIA11_CLKA_posedge or
      Tviol_DIA12_CLKA_posedge or
      Tviol_DIA13_CLKA_posedge or
      Tviol_DIA14_CLKA_posedge or
      Tviol_DIA15_CLKA_posedge or
      Tviol_DIA16_CLKA_posedge or
      Tviol_DIA17_CLKA_posedge or
      Tviol_DIA18_CLKA_posedge or
      Tviol_DIA19_CLKA_posedge or
      Tviol_DIA20_CLKA_posedge or
      Tviol_DIA21_CLKA_posedge or
      Tviol_DIA22_CLKA_posedge or
      Tviol_DIA23_CLKA_posedge or
      Tviol_DIA24_CLKA_posedge or
      Tviol_DIA25_CLKA_posedge or
      Tviol_DIA26_CLKA_posedge or
      Tviol_DIA27_CLKA_posedge or
      Tviol_DIA28_CLKA_posedge or
      Tviol_DIA29_CLKA_posedge or
      Tviol_DIA30_CLKA_posedge or
      Tviol_DIA31_CLKA_posedge or
      Tviol_DIPA0_CLKA_posedge or
      Tviol_DIPA1_CLKA_posedge or
      Tviol_DIPA2_CLKA_posedge or
      Tviol_DIPA3_CLKA_posedge or
      Tviol_ENA_CLKA_posedge or
      Tviol_SSRA_CLKA_posedge or
      Tviol_WEA0_CLKA_posedge or
      Tviol_WEA1_CLKA_posedge or
      Tviol_WEA2_CLKA_posedge or
      Tviol_WEA3_CLKA_posedge or
      Pviol_CLKA or Pviol_SSRA ;
    ViolationB          <=
      Tviol_ADDRB0_CLKB_posedge or
      Tviol_ADDRB1_CLKB_posedge or
      Tviol_ADDRB2_CLKB_posedge or
      Tviol_ADDRB3_CLKB_posedge or
      Tviol_ADDRB4_CLKB_posedge or
      Tviol_ADDRB5_CLKB_posedge or
      Tviol_ADDRB6_CLKB_posedge or
      Tviol_ADDRB7_CLKB_posedge or
      Tviol_ADDRB8_CLKB_posedge or
      Tviol_DIB0_CLKB_posedge or
      Tviol_DIB1_CLKB_posedge or
      Tviol_DIB2_CLKB_posedge or
      Tviol_DIB3_CLKB_posedge or
      Tviol_DIB4_CLKB_posedge or
      Tviol_DIB5_CLKB_posedge or
      Tviol_DIB6_CLKB_posedge or
      Tviol_DIB7_CLKB_posedge or
      Tviol_DIB8_CLKB_posedge or
      Tviol_DIB9_CLKB_posedge or
      Tviol_DIB10_CLKB_posedge or
      Tviol_DIB11_CLKB_posedge or
      Tviol_DIB12_CLKB_posedge or
      Tviol_DIB13_CLKB_posedge or
      Tviol_DIB14_CLKB_posedge or
      Tviol_DIB15_CLKB_posedge or
      Tviol_DIB16_CLKB_posedge or
      Tviol_DIB17_CLKB_posedge or
      Tviol_DIB18_CLKB_posedge or
      Tviol_DIB19_CLKB_posedge or
      Tviol_DIB20_CLKB_posedge or
      Tviol_DIB21_CLKB_posedge or
      Tviol_DIB22_CLKB_posedge or
      Tviol_DIB23_CLKB_posedge or
      Tviol_DIB24_CLKB_posedge or
      Tviol_DIB25_CLKB_posedge or
      Tviol_DIB26_CLKB_posedge or
      Tviol_DIB27_CLKB_posedge or
      Tviol_DIB28_CLKB_posedge or
      Tviol_DIB29_CLKB_posedge or
      Tviol_DIB30_CLKB_posedge or
      Tviol_DIB31_CLKB_posedge or
      Tviol_DIPB0_CLKB_posedge or
      Tviol_DIPB1_CLKB_posedge or
      Tviol_DIPB2_CLKB_posedge or
      Tviol_DIPB3_CLKB_posedge or
      Tviol_ENB_CLKB_posedge or
      Tviol_SSRB_CLKB_posedge or
      Tviol_WEB0_CLKB_posedge or
      Tviol_WEB1_CLKB_posedge or
      Tviol_WEB2_CLKB_posedge or
      Tviol_WEB3_CLKB_posedge or
      Pviol_CLKB or Pviol_SSRB ;

      
    if (Tviol_ADDRA0_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(0)", "CLKA");
    end if;

    if (Tviol_ADDRA1_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(1)", "CLKA");
    end if;

    if (Tviol_ADDRA2_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(2)", "CLKA");
    end if;

    if (Tviol_ADDRA3_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(3)", "CLKA");
    end if;

    if (Tviol_ADDRA4_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(4)", "CLKA");
    end if;

    if (Tviol_ADDRA5_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(5)", "CLKA");
    end if;

    if (Tviol_ADDRA6_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(6)", "CLKA");
    end if;

    if (Tviol_ADDRA7_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(7)", "CLKA");
    end if;

    if (Tviol_ADDRA8_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(8)", "CLKA");
    end if;

    if (Tviol_ADDRA9_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(9)", "CLKA");
    end if;

    if (Tviol_ADDRA10_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(10)", "CLKA");
    end if;

    if (Tviol_ADDRA11_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(11)", "CLKA");
    end if;

    if (Tviol_ADDRA12_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(12)", "CLKA");
    end if;

    if (Tviol_ADDRA13_CLKA_posedge = 'X') then
      	prcd_warn_msg ("ADDRA(13)", "CLKA");
    end if;

    
    if (Tviol_ADDRB0_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(0)", "CLKB");
    end if;

    if (Tviol_ADDRB1_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(1)", "CLKB");
    end if;

    if (Tviol_ADDRB2_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(2)", "CLKB");
    end if;

    if (Tviol_ADDRB3_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(3)", "CLKB");
    end if;

    if (Tviol_ADDRB4_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(4)", "CLKB");
    end if;

    if (Tviol_ADDRB5_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(5)", "CLKB");
    end if;

    if (Tviol_ADDRB6_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(6)", "CLKB");
    end if;

    if (Tviol_ADDRB7_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(7)", "CLKB");
    end if;

    if (Tviol_ADDRB8_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(8)", "CLKB");
    end if;

    if (Tviol_ADDRB9_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(9)", "CLKB");
    end if;

    if (Tviol_ADDRB10_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(10)", "CLKB");
    end if;

    if (Tviol_ADDRB11_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(11)", "CLKB");
    end if;

    if (Tviol_ADDRB12_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(12)", "CLKB");
    end if;

    if (Tviol_ADDRB13_CLKB_posedge = 'X') then
      	prcd_warn_msg ("ADDRB(13)", "CLKB");
    end if;

    wait on ADDRA_dly, ADDRB_dly, CLKA_dly, CLKB_dly, DIA_dly, DIB_dly, DIPA_dly, DIPB_dly, ENA_dly, ENB_dly, SSRA_dly, SSRB_dly, WEA_dly, WEB_dly;
    
  end process;

-------------------------------------------------------------------------------
-- End Timing check
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Path delay
-------------------------------------------------------------------------------
   prcs_output:process (doado_out, dopadop_out, dobdo_out, dopbdop_out)


    variable ENA_dly_sampled   : std_ulogic                      := 'X';
    variable ENB_dly_sampled   : std_ulogic                      := 'X';


    variable DOA_GlitchData0  : VitalGlitchDataType;
    variable DOA_GlitchData1  : VitalGlitchDataType;
    variable DOA_GlitchData2  : VitalGlitchDataType;
    variable DOA_GlitchData3  : VitalGlitchDataType;
    variable DOA_GlitchData4  : VitalGlitchDataType;
    variable DOA_GlitchData5  : VitalGlitchDataType;
    variable DOA_GlitchData6  : VitalGlitchDataType;
    variable DOA_GlitchData7  : VitalGlitchDataType;
    variable DOA_GlitchData8  : VitalGlitchDataType;
    variable DOA_GlitchData9  : VitalGlitchDataType;
    variable DOA_GlitchData10  : VitalGlitchDataType;
    variable DOA_GlitchData11  : VitalGlitchDataType;
    variable DOA_GlitchData12  : VitalGlitchDataType;
    variable DOA_GlitchData13  : VitalGlitchDataType;
    variable DOA_GlitchData14  : VitalGlitchDataType;
    variable DOA_GlitchData15  : VitalGlitchDataType;
    variable DOA_GlitchData16  : VitalGlitchDataType;
    variable DOA_GlitchData17  : VitalGlitchDataType;
    variable DOA_GlitchData18  : VitalGlitchDataType;
    variable DOA_GlitchData19  : VitalGlitchDataType;
    variable DOA_GlitchData20  : VitalGlitchDataType;
    variable DOA_GlitchData21  : VitalGlitchDataType;
    variable DOA_GlitchData22  : VitalGlitchDataType;
    variable DOA_GlitchData23  : VitalGlitchDataType;
    variable DOA_GlitchData24  : VitalGlitchDataType;
    variable DOA_GlitchData25  : VitalGlitchDataType;
    variable DOA_GlitchData26  : VitalGlitchDataType;
    variable DOA_GlitchData27  : VitalGlitchDataType;
    variable DOA_GlitchData28  : VitalGlitchDataType;
    variable DOA_GlitchData29  : VitalGlitchDataType;
    variable DOA_GlitchData30  : VitalGlitchDataType;
    variable DOA_GlitchData31  : VitalGlitchDataType;
    variable DOPA_GlitchData0 : VitalGlitchDataType;
    variable DOPA_GlitchData1 : VitalGlitchDataType;
    variable DOPA_GlitchData2 : VitalGlitchDataType;
    variable DOPA_GlitchData3 : VitalGlitchDataType;

    variable DOB_GlitchData0  : VitalGlitchDataType;
    variable DOB_GlitchData1  : VitalGlitchDataType;
    variable DOB_GlitchData2  : VitalGlitchDataType;
    variable DOB_GlitchData3  : VitalGlitchDataType;
    variable DOB_GlitchData4  : VitalGlitchDataType;
    variable DOB_GlitchData5  : VitalGlitchDataType;
    variable DOB_GlitchData6  : VitalGlitchDataType;
    variable DOB_GlitchData7  : VitalGlitchDataType;
    variable DOB_GlitchData8  : VitalGlitchDataType;
    variable DOB_GlitchData9  : VitalGlitchDataType;
    variable DOB_GlitchData10  : VitalGlitchDataType;
    variable DOB_GlitchData11  : VitalGlitchDataType;
    variable DOB_GlitchData12  : VitalGlitchDataType;
    variable DOB_GlitchData13  : VitalGlitchDataType;
    variable DOB_GlitchData14  : VitalGlitchDataType;
    variable DOB_GlitchData15  : VitalGlitchDataType;
    variable DOB_GlitchData16  : VitalGlitchDataType;
    variable DOB_GlitchData17  : VitalGlitchDataType;
    variable DOB_GlitchData18  : VitalGlitchDataType;
    variable DOB_GlitchData19  : VitalGlitchDataType;
    variable DOB_GlitchData20  : VitalGlitchDataType;
    variable DOB_GlitchData21  : VitalGlitchDataType;
    variable DOB_GlitchData22  : VitalGlitchDataType;
    variable DOB_GlitchData23  : VitalGlitchDataType;
    variable DOB_GlitchData24  : VitalGlitchDataType;
    variable DOB_GlitchData25  : VitalGlitchDataType;
    variable DOB_GlitchData26  : VitalGlitchDataType;
    variable DOB_GlitchData27  : VitalGlitchDataType;
    variable DOB_GlitchData28  : VitalGlitchDataType;
    variable DOB_GlitchData29  : VitalGlitchDataType;
    variable DOB_GlitchData30  : VitalGlitchDataType;
    variable DOB_GlitchData31  : VitalGlitchDataType;
    variable DOPB_GlitchData0 : VitalGlitchDataType;
    variable DOPB_GlitchData1 : VitalGlitchDataType;
    variable DOPB_GlitchData2 : VitalGlitchDataType;
    variable DOPB_GlitchData3 : VitalGlitchDataType;

   begin

    ENA_dly_sampled   := ENA_dly;
    ENB_dly_sampled   := ENB_dly;

    VitalPathDelay01 (
      OutSignal     => DOA(0),
      GlitchData    => DOA_GlitchData0,
      OutSignalName => "DOA(0)",
      OutTemp       => doado_out(0),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(0), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(0), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(1),
      GlitchData    => DOA_GlitchData1,
      OutSignalName => "DOA(1)",
      OutTemp       => doado_out(1),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(1), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(1), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(2),
      GlitchData    => DOA_GlitchData2,
      OutSignalName => "DOA(2)",
      OutTemp       => doado_out(2),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(2), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(2), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(3),
      GlitchData    => DOA_GlitchData3,
      OutSignalName => "DOA(3)",
      OutTemp       => doado_out(3),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(3), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(3), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(4),
      GlitchData    => DOA_GlitchData4,
      OutSignalName => "DOA(4)",
      OutTemp       => doado_out(4),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(4), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(4), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(5),
      GlitchData    => DOA_GlitchData5,
      OutSignalName => "DOA(5)",
      OutTemp       => doado_out(5),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(5), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(5), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(6),
      GlitchData    => DOA_GlitchData6,
      OutSignalName => "DOA(6)",
      OutTemp       => doado_out(6),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(6), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(6), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(7),
      GlitchData    => DOA_GlitchData7,
      OutSignalName => "DOA(7)",
      OutTemp       => doado_out(7),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(7), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(7), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(8),
      GlitchData    => DOA_GlitchData8,
      OutSignalName => "DOA(8)",
      OutTemp       => doado_out(8),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(8), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(8), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(9),
      GlitchData    => DOA_GlitchData9,
      OutSignalName => "DOA(9)",
      OutTemp       => doado_out(9),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(9), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(9), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(10),
      GlitchData    => DOA_GlitchData10,
      OutSignalName => "DOA(10)",
      OutTemp       => doado_out(10),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(10), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(10), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(11),
      GlitchData    => DOA_GlitchData11,
      OutSignalName => "DOA(11)",
      OutTemp       => doado_out(11),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(11), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(11), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(12),
      GlitchData    => DOA_GlitchData12,
      OutSignalName => "DOA(12)",
      OutTemp       => doado_out(12),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(12), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(12), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(13),
      GlitchData    => DOA_GlitchData13,
      OutSignalName => "DOA(13)",
      OutTemp       => doado_out(13),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(13), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(13), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(14),
      GlitchData    => DOA_GlitchData14,
      OutSignalName => "DOA(14)",
      OutTemp       => doado_out(14),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(14), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(14), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(15),
      GlitchData    => DOA_GlitchData15,
      OutSignalName => "DOA(15)",
      OutTemp       => doado_out(15),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(15), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(15), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(16),
      GlitchData    => DOA_GlitchData16,
      OutSignalName => "DOA(16)",
      OutTemp       => doado_out(16),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(16), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(16), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(17),
      GlitchData    => DOA_GlitchData17,
      OutSignalName => "DOA(17)",
      OutTemp       => doado_out(17),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(17), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(17), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(18),
      GlitchData    => DOA_GlitchData18,
      OutSignalName => "DOA(18)",
      OutTemp       => doado_out(18),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(18), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(18), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(19),
      GlitchData    => DOA_GlitchData19,
      OutSignalName => "DOA(19)",
      OutTemp       => doado_out(19),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(19), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(19), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(20),
      GlitchData    => DOA_GlitchData20,
      OutSignalName => "DOA(20)",
      OutTemp       => doado_out(20),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(20), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(20), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(21),
      GlitchData    => DOA_GlitchData21,
      OutSignalName => "DOA(21)",
      OutTemp       => doado_out(21),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(21), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(21), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(22),
      GlitchData    => DOA_GlitchData22,
      OutSignalName => "DOA(22)",
      OutTemp       => doado_out(22),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(22), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(22), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(23),
      GlitchData    => DOA_GlitchData23,
      OutSignalName => "DOA(23)",
      OutTemp       => doado_out(23),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(23), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(23), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(24),
      GlitchData    => DOA_GlitchData24,
      OutSignalName => "DOA(24)",
      OutTemp       => doado_out(24),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(24), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(24), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(25),
      GlitchData    => DOA_GlitchData25,
      OutSignalName => "DOA(25)",
      OutTemp       => doado_out(25),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(25), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(25), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(26),
      GlitchData    => DOA_GlitchData26,
      OutSignalName => "DOA(26)",
      OutTemp       => doado_out(26),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(26), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(26), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(27),
      GlitchData    => DOA_GlitchData27,
      OutSignalName => "DOA(27)",
      OutTemp       => doado_out(27),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(27), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(27), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(28),
      GlitchData    => DOA_GlitchData28,
      OutSignalName => "DOA(28)",
      OutTemp       => doado_out(28),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(28), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(28), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(29),
      GlitchData    => DOA_GlitchData29,
      OutSignalName => "DOA(29)",
      OutTemp       => doado_out(29),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(29), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(29), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(30),
      GlitchData    => DOA_GlitchData30,
      OutSignalName => "DOA(30)",
      OutTemp       => doado_out(30),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(30), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(30), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(31),
      GlitchData    => DOA_GlitchData31,
      OutSignalName => "DOA(31)",
      OutTemp       => doado_out(31),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(31), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOA(31), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(0),
      GlitchData    => DOPA_GlitchData0,
      OutSignalName => "DOPA(0)",
      OutTemp       => dopadop_out(0),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOPA(0), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOPA(0), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(1),
      GlitchData    => DOPA_GlitchData1,
      OutSignalName => "DOPA(1)",
      OutTemp       => dopadop_out(1),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOPA(1), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOPA(1), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(2),
      GlitchData    => DOPA_GlitchData2,
      OutSignalName => "DOPA(2)",
      OutTemp       => dopadop_out(2),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOPA(2), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOPA(2), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(3),
      GlitchData    => DOPA_GlitchData3,
      OutSignalName => "DOPA(3)",
      OutTemp       => dopadop_out(3),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOPA(3), (ena_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRA_dly'last_event, tpd_SSRA_DOPA(3), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

----- Port B
    VitalPathDelay01 (
      OutSignal     => DOB(0),
      GlitchData    => DOB_GlitchData0,
      OutSignalName => "DOB(0)",
      OutTemp       => dobdo_out(0),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(0), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(0), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(1),
      GlitchData    => DOB_GlitchData1,
      OutSignalName => "DOB(1)",
      OutTemp       => dobdo_out(1),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(1), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(1), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(2),
      GlitchData    => DOB_GlitchData2,
      OutSignalName => "DOB(2)",
      OutTemp       => dobdo_out(2),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(2), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(2), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(3),
      GlitchData    => DOB_GlitchData3,
      OutSignalName => "DOB(3)",
      OutTemp       => dobdo_out(3),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(3), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(3), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(4),
      GlitchData    => DOB_GlitchData4,
      OutSignalName => "DOB(4)",
      OutTemp       => dobdo_out(4),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(4), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(4), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(5),
      GlitchData    => DOB_GlitchData5,
      OutSignalName => "DOB(5)",
      OutTemp       => dobdo_out(5),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(5), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(5), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(6),
      GlitchData    => DOB_GlitchData6,
      OutSignalName => "DOB(6)",
      OutTemp       => dobdo_out(6),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(6), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(6), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(7),
      GlitchData    => DOB_GlitchData7,
      OutSignalName => "DOB(7)",
      OutTemp       => dobdo_out(7),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(7), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(7), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(8),
      GlitchData    => DOB_GlitchData8,
      OutSignalName => "DOB(8)",
      OutTemp       => dobdo_out(8),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(8), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(8), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(9),
      GlitchData    => DOB_GlitchData9,
      OutSignalName => "DOB(9)",
      OutTemp       => dobdo_out(9),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(9), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(9), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(10),
      GlitchData    => DOB_GlitchData10,
      OutSignalName => "DOB(10)",
      OutTemp       => dobdo_out(10),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(10), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(10), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(11),
      GlitchData    => DOB_GlitchData11,
      OutSignalName => "DOB(11)",
      OutTemp       => dobdo_out(11),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(11), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(11), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(12),
      GlitchData    => DOB_GlitchData12,
      OutSignalName => "DOB(12)",
      OutTemp       => dobdo_out(12),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(12), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(12), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(13),
      GlitchData    => DOB_GlitchData13,
      OutSignalName => "DOB(13)",
      OutTemp       => dobdo_out(13),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(13), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(13), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(14),
      GlitchData    => DOB_GlitchData14,
      OutSignalName => "DOB(14)",
      OutTemp       => dobdo_out(14),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(14), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(14), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(15),
      GlitchData    => DOB_GlitchData15,
      OutSignalName => "DOB(15)",
      OutTemp       => dobdo_out(15),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(15), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(15), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(16),
      GlitchData    => DOB_GlitchData16,
      OutSignalName => "DOB(16)",
      OutTemp       => dobdo_out(16),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(16), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(16), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(17),
      GlitchData    => DOB_GlitchData17,
      OutSignalName => "DOB(17)",
      OutTemp       => dobdo_out(17),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(17), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(17), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(18),
      GlitchData    => DOB_GlitchData18,
      OutSignalName => "DOB(18)",
      OutTemp       => dobdo_out(18),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(18), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(18), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(19),
      GlitchData    => DOB_GlitchData19,
      OutSignalName => "DOB(19)",
      OutTemp       => dobdo_out(19),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(19), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(19), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(20),
      GlitchData    => DOB_GlitchData20,
      OutSignalName => "DOB(20)",
      OutTemp       => dobdo_out(20),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(20), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(20), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(21),
      GlitchData    => DOB_GlitchData21,
      OutSignalName => "DOB(21)",
      OutTemp       => dobdo_out(21),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(21), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(21), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(22),
      GlitchData    => DOB_GlitchData22,
      OutSignalName => "DOB(22)",
      OutTemp       => dobdo_out(22),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(22), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(22), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(23),
      GlitchData    => DOB_GlitchData23,
      OutSignalName => "DOB(23)",
      OutTemp       => dobdo_out(23),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(23), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(23), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(24),
      GlitchData    => DOB_GlitchData24,
      OutSignalName => "DOB(24)",
      OutTemp       => dobdo_out(24),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(24), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(24), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(25),
      GlitchData    => DOB_GlitchData25,
      OutSignalName => "DOB(25)",
      OutTemp       => dobdo_out(25),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(25), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(25), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(26),
      GlitchData    => DOB_GlitchData26,
      OutSignalName => "DOB(26)",
      OutTemp       => dobdo_out(26),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(26), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(26), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(27),
      GlitchData    => DOB_GlitchData27,
      OutSignalName => "DOB(27)",
      OutTemp       => dobdo_out(27),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(27), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(27), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(28),
      GlitchData    => DOB_GlitchData28,
      OutSignalName => "DOB(28)",
      OutTemp       => dobdo_out(28),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(28), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(28), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(29),
      GlitchData    => DOB_GlitchData29,
      OutSignalName => "DOB(29)",
      OutTemp       => dobdo_out(29),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(29), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(29), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(30),
      GlitchData    => DOB_GlitchData30,
      OutSignalName => "DOB(30)",
      OutTemp       => dobdo_out(30),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(30), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(30), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(31),
      GlitchData    => DOB_GlitchData31,
      OutSignalName => "DOB(31)",
      OutTemp       => dobdo_out(31),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(31), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOB(31), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(0),
      GlitchData    => DOPB_GlitchData0,
      OutSignalName => "DOPB(0)",
      OutTemp       => dopbdop_out(0),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOPB(0), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOPB(0), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(1),
      GlitchData    => DOPB_GlitchData1,
      OutSignalName => "DOPB(1)",
      OutTemp       => dopbdop_out(1),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOPB(1), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOPB(1), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(2),
      GlitchData    => DOPB_GlitchData2,
      OutSignalName => "DOPB(2)",
      OutTemp       => dopbdop_out(2),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOPB(2), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOPB(2), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(3),
      GlitchData    => DOPB_GlitchData3,
      OutSignalName => "DOPB(3)",
      OutTemp       => dopbdop_out(3),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOPB(3), (enb_dly_sampled /= '0' and GSR_dly /= '1')),
                        1 => (SSRB_dly'last_event, tpd_SSRB_DOPB(3), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

   end process prcs_output;
---------------------------------------------------------------------------
-- End Path delay
---------------------------------------------------------------------------

end X_RAMB16BWE_V;
