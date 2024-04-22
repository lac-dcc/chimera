-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/rainier/VITAL/X_RAMB18.vhd,v 1.3 2010/01/14 19:38:17 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2005 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  16K-Bit Data and 2K-Bit Parity Dual Port Block RAM
-- /___/   /\     Filename : X_RAMB18.vhd
-- \   \  /  \    Timestamp : Tues October 18 16:43:59 PST 2005
--  \___\/\___\
--
-- Revision:
--    10/18/05 - Initial version.
--    08/21/06 - Fixed vital delay for vcs_mx (CR 419867).  
--    01/04/07 - Added support of memory file to initialize memory and parity (CR 431584).
--    03/14/07 - Removed attribute INITP_FILE (CR 436003).
--    04/03/07 - Changed INIT_FILE = "NONE" as default (CR 436812).
--    08/17/07 - Added setup/hold violation message on address w.r.t. clock (CR 436931).
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision

----- CELL X_RAMB18 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_RAMB18 is
generic (

    TimingChecksOn : boolean := true;
    InstancePath   : string  := "*";
    Xon            : boolean := true;
    MsgOn          : boolean := true;

    DOA_REG : integer := 0;
    DOB_REG : integer := 0;
    INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
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
    INIT_A : bit_vector := X"00000";
    INIT_B : bit_vector := X"00000";
    INIT_FILE : string := "NONE";
    LOC : string := "UNPLACED";
    READ_WIDTH_A : integer := 0;
    READ_WIDTH_B : integer := 0;
    SETUP_ALL : time := 1000 ps;
    SETUP_READ_FIRST : time := 3000 ps;
    SIM_COLLISION_CHECK : string := "ALL";
    SRVAL_A : bit_vector := X"00000";
    SRVAL_B : bit_vector := X"00000";
    WRITE_MODE_A : string := "WRITE_FIRST";
    WRITE_MODE_B : string := "WRITE_FIRST";
    WRITE_WIDTH_A : integer := 0;
    WRITE_WIDTH_B : integer := 0;

--- VITAL input wire delays

    tipd_ADDRA   : VitalDelayArrayType01(13 downto 0) := (others => (0 ps, 0 ps));
    tipd_CLKA    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIA     : VitalDelayArrayType01(15 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIPA    : VitalDelayArrayType01(1 downto 0)  := (others => (0 ps, 0 ps));
    tipd_ENA     : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_REGCEA  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_SSRA    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEA     : VitalDelayArrayType01 (1 downto 0) := (others => (0 ps, 0 ps));

    tipd_ADDRB   : VitalDelayArrayType01(13 downto 0) := (others => (0 ps, 0 ps));
    tipd_CLKB    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIB     : VitalDelayArrayType01(15 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIPB    : VitalDelayArrayType01(1 downto 0)  := (others => (0 ps, 0 ps));
    tipd_ENB     : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_REGCEB  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_SSRB    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEB     : VitalDelayArrayType01 (1 downto 0) := (others => (0 ps, 0 ps));
    

--- VITAL pin-to-pin propagation delays


    
    tpd_CLKA_DOA  : VitalDelayArrayType01(15 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKA_DOPA : VitalDelayArrayType01(1 downto 0)  := (others => (100 ps, 100 ps));

    tpd_CLKB_DOB  : VitalDelayArrayType01(15 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKB_DOPB : VitalDelayArrayType01(1 downto 0)  := (others => (100 ps, 100 ps));

    
--- VITAL recovery time 


--- VITAL setup time 

    tsetup_ADDRA_CLKA_negedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    tsetup_ADDRA_CLKA_posedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    tsetup_DIA_CLKA_negedge_posedge    : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIA_CLKA_posedge_posedge    : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIPA_CLKA_negedge_posedge   : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    tsetup_DIPA_CLKA_posedge_posedge   : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    tsetup_ENA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_REGCEA_CLKA_negedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEA_CLKA_posedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEA_CLKA_posedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEA_CLKA_negedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_SSRA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEA_CLKA_negedge_posedge    : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    tsetup_WEA_CLKA_posedge_posedge    : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);

    tsetup_ADDRB_CLKB_negedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    tsetup_ADDRB_CLKB_posedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    tsetup_DIB_CLKB_negedge_posedge    : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIB_CLKB_posedge_posedge    : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIPB_CLKB_negedge_posedge   : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    tsetup_DIPB_CLKB_posedge_posedge   : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    tsetup_ENB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_REGCEB_CLKB_negedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEB_CLKB_posedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEB_CLKB_posedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_REGCEB_CLKB_negedge_negedge : VitalDelayType                   := 0 ps;
    tsetup_SSRB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEB_CLKB_negedge_posedge    : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    tsetup_WEB_CLKB_posedge_posedge    : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);

--- VITAL hold time 

    thold_ADDRA_CLKA_negedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    thold_ADDRA_CLKA_posedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    thold_DIA_CLKA_negedge_posedge    : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIA_CLKA_posedge_posedge    : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIPA_CLKA_negedge_posedge   : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    thold_DIPA_CLKA_posedge_posedge   : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    thold_ENA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_ENA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;
    thold_REGCEA_CLKA_negedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEA_CLKA_posedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEA_CLKA_posedge_negedge : VitalDelayType                   := 0 ps;
    thold_REGCEA_CLKA_negedge_negedge : VitalDelayType                   := 0 ps;
    thold_SSRA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEA_CLKA_negedge_posedge    : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    thold_WEA_CLKA_posedge_posedge    : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);

    thold_ADDRB_CLKB_negedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    thold_ADDRB_CLKB_posedge_posedge  : VitalDelayArrayType(13 downto 0) := (others => 0 ps);
    thold_DIB_CLKB_negedge_posedge    : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIB_CLKB_posedge_posedge    : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIPB_CLKB_negedge_posedge   : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    thold_DIPB_CLKB_posedge_posedge   : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    thold_ENB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_ENB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;
    thold_REGCEB_CLKB_negedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEB_CLKB_posedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCEB_CLKB_posedge_negedge : VitalDelayType                   := 0 ps;
    thold_REGCEB_CLKB_negedge_negedge : VitalDelayType                   := 0 ps;
    thold_SSRB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEB_CLKB_negedge_posedge    : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);
    thold_WEB_CLKB_posedge_posedge    : VitalDelayArrayType(1 downto 0)  := (others => 0 ps);


    ticd_CLKA          : VitalDelayType                     := 0 ps;
    tisd_ADDRA_CLKA    : VitalDelayArrayType(13 downto 0)   := (others => 0 ps);
    tisd_DIA_CLKA      : VitalDelayArrayType(15 downto 0)   := (others => 0 ps);
    tisd_DIPA_CLKA     : VitalDelayArrayType(1 downto 0)    := (others => 0 ps);
    tisd_ENA_CLKA      : VitalDelayType                     := 0 ps;
    tisd_REGCEA_CLKA   : VitalDelayType                     := 0 ps;
    tisd_SSRA_CLKA     : VitalDelayType                     := 0 ps;
    tisd_WEA_CLKA      : VitalDelayArrayType(1 downto 0)    := (others => 0 ps);


    ticd_CLKB          : VitalDelayType                     := 0 ps;
    tisd_ADDRB_CLKB    : VitalDelayArrayType(13 downto 0)   := (others => 0 ps);
    tisd_DIB_CLKB      : VitalDelayArrayType(15 downto 0)   := (others => 0 ps);
    tisd_DIPB_CLKB     : VitalDelayArrayType(1 downto 0)    := (others => 0 ps);
    tisd_ENB_CLKB      : VitalDelayType                     := 0 ps;
    tisd_REGCEB_CLKB   : VitalDelayType                     := 0 ps;
    tisd_SSRB_CLKB     : VitalDelayType                     := 0 ps;
    tisd_WEB_CLKB      : VitalDelayArrayType(1 downto 0)    := (others => 0 ps);

    tperiod_clka_posedge : VitalDelayType := 0 ps;
    tperiod_clkb_posedge : VitalDelayType := 0 ps;
    
    tpw_CLKA_negedge : VitalDelayType := 0 ps;
    tpw_CLKA_posedge : VitalDelayType := 0 ps;
    tpw_CLKB_negedge : VitalDelayType := 0 ps;
    tpw_CLKB_posedge : VitalDelayType := 0 ps
    
  );

port (
  
    DOA : out std_logic_vector(15 downto 0);
    DOB : out std_logic_vector(15 downto 0);
    DOPA : out std_logic_vector(1 downto 0);
    DOPB : out std_logic_vector(1 downto 0);
    
    ADDRA : in std_logic_vector(13 downto 0);
    ADDRB : in std_logic_vector(13 downto 0);
    CLKA : in std_ulogic;
    CLKB : in std_ulogic;
    DIA : in std_logic_vector(15 downto 0);
    DIB : in std_logic_vector(15 downto 0);
    DIPA : in std_logic_vector(1 downto 0);
    DIPB : in std_logic_vector(1 downto 0);
    ENA : in std_ulogic;
    ENB : in std_ulogic;
    REGCEA : in std_ulogic;
    REGCEB : in std_ulogic;
    SSRA : in std_ulogic;
    SSRB : in std_ulogic;
    WEA : in std_logic_vector(1 downto 0);
    WEB : in std_logic_vector(1 downto 0)
    
  );

  attribute VITAL_LEVEL0 of
     X_RAMB18 : entity is true;

end X_RAMB18;
                                                                        
architecture X_RAMB18_V of X_RAMB18 is

  attribute VITAL_LEVEL0 of
    X_RAMB18_V : architecture is true;

  component X_ARAMB36_INTERNAL
	generic
	(
          BRAM_MODE : string := "TRUE_DUAL_PORT";
          BRAM_SIZE : integer := 36;
          DOA_REG : integer := 0;
          DOB_REG : integer := 0;
          INIT_A : bit_vector := X"000000000000000000";
          INIT_B : bit_vector := X"000000000000000000";
          RAM_EXTENSION_A : string := "NONE";
          RAM_EXTENSION_B : string := "NONE";
          READ_WIDTH_A : integer := 0;
          READ_WIDTH_B : integer := 0;
          SIM_COLLISION_CHECK : string := "ALL";
          SRVAL_A : bit_vector := X"000000000000000000";
          SRVAL_B : bit_vector := X"000000000000000000";
          WRITE_MODE_A : string := "WRITE_FIRST";
          WRITE_MODE_B : string := "WRITE_FIRST";
          WRITE_WIDTH_A : integer := 0;
          WRITE_WIDTH_B : integer := 0;
          SETUP_ALL : time := 1000 ps;
          SETUP_READ_FIRST : time := 3000 ps;
          INIT_FILE : string := "NONE";
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
          INIT_40 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_41 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_42 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_43 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_44 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_45 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_46 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_47 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_48 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_49 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_4F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_50 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_51 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_52 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_53 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_54 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_55 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_56 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_57 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_58 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_59 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_5F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_60 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_61 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_62 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_63 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_64 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_65 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_66 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_67 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_68 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_69 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_6F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_70 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_71 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_72 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_73 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_74 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_75 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_76 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_77 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_78 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_79 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INIT_7F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
          INITP_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
           );
	port
	(
          CASCADEOUTLATA : out std_ulogic;
          CASCADEOUTLATB : out std_ulogic;
          CASCADEOUTREGA : out std_ulogic;
          CASCADEOUTREGB : out std_ulogic;
          DBITERR : out std_ulogic;
          DOA : out std_logic_vector(63 downto 0);
          DOB : out std_logic_vector(63 downto 0);
          DOPA : out std_logic_vector(7 downto 0);
          DOPB : out std_logic_vector(7 downto 0);
          ECCPARITY : out std_logic_vector(7 downto 0);
          SBITERR : out std_ulogic;
    
          ADDRA : in std_logic_vector(15 downto 0);
          ADDRB : in std_logic_vector(15 downto 0);
          CASCADEINLATA : in std_ulogic;
          CASCADEINLATB : in std_ulogic;
          CASCADEINREGA : in std_ulogic;
          CASCADEINREGB : in std_ulogic;
          CLKA : in std_ulogic;
          CLKB : in std_ulogic;
          DIA : in std_logic_vector(63 downto 0);
          DIB : in std_logic_vector(63 downto 0);
          DIPA : in std_logic_vector(7 downto 0);
          DIPB : in std_logic_vector(7 downto 0);
          ENA : in std_ulogic;
          ENB : in std_ulogic;
          REGCEA : in std_ulogic;
          REGCEB : in std_ulogic;
          REGCLKA : in std_ulogic;
          REGCLKB : in std_ulogic;
          SSRA : in std_ulogic;
          SSRB : in std_ulogic;
          WEA : in std_logic_vector(7 downto 0);
          WEB : in std_logic_vector(7 downto 0)
 	);
  end component;

  constant MAX_ADDR: integer := 13;
  constant MAX_DI:   integer := 15;
  constant MAX_DIP:  integer := 1;
  constant MAX_WEA:   integer := 1;
  constant MAX_WEB:   integer := 1;
  
  signal wea_int : std_logic_vector(7 downto 0) := (others => '0');
  signal web_int : std_logic_vector(7 downto 0) := (others => '0');
  signal addra_int : std_logic_vector(15 downto 0) := (others => '0');
  signal addrb_int : std_logic_vector(15 downto 0) := (others => '0');
  signal GND : std_ulogic := '0';
  signal GND_6 : std_logic_vector(5 downto 0) := (others => '0');
  signal GND_48 : std_logic_vector(47 downto 0) := (others => '0');
  signal OPEN_6 : std_logic_vector(5 downto 0);
  signal OPEN_48 : std_logic_vector(47 downto 0);

  signal ADDRA_ipd    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal CLKA_ipd     : std_ulogic                          := 'X';
  signal DIA_ipd      : std_logic_vector(MAX_DI  downto 0)  := (others => 'X');
  signal DIPA_ipd     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENA_ipd      : std_ulogic                          := 'X';
  signal REGCEA_ipd   : std_ulogic                          := 'X';
  signal SSRA_ipd     : std_ulogic                          := 'X';
  signal WEA_ipd      : std_logic_vector(MAX_WEA downto 0)   := (others => 'X');

  signal ADDRB_ipd    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal CLKB_ipd     : std_ulogic                          := 'X';
  signal DIB_ipd      : std_logic_vector(MAX_DI  downto 0)  := (others => 'X');
  signal DIPB_ipd     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENB_ipd      : std_ulogic                          := 'X';
  signal REGCEB_ipd   : std_ulogic                          := 'X';
  signal SSRB_ipd     : std_ulogic                          := 'X';
  signal WEB_ipd      : std_logic_vector(MAX_WEB downto 0)   := (others => 'X');

  signal GSR_ipd      : std_ulogic                          := 'X';

  signal GSR_dly      : std_ulogic                          := '0';

  signal ADDRA_dly    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal CLKA_dly     : std_ulogic                          := 'X';
  signal DIA_dly      : std_logic_vector(MAX_DI downto 0) := (others => 'X');
  signal DIPA_dly     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENA_dly      : std_ulogic                          := 'X';
  signal GSR_CLKA_dly : std_ulogic                          := '0';
  signal REGCEA_dly   : std_ulogic                          := 'X';
  signal SSRA_dly     : std_ulogic                          := 'X';
  signal WEA_dly      : std_logic_vector(MAX_WEA downto 0)   := (others => 'X');
    
  signal ADDRB_dly    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal CLKB_dly     : std_ulogic                          := 'X';
  signal DIB_dly      : std_logic_vector(MAX_DI downto 0) := (others => 'X');
  signal DIPB_dly     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal ENB_dly      : std_ulogic                          := 'X';
  signal GSR_CLKB_dly : std_ulogic                          := '0';
  signal REGCEB_dly   : std_ulogic                          := 'X';
  signal SSRB_dly     : std_ulogic                          := 'X';
  signal WEB_dly      : std_logic_vector(MAX_WEB downto 0)   := (others => 'X');
    
  signal DOA_viol     : std_logic_vector(MAX_DI downto 0);
  signal DOPA_viol    : std_logic_vector(3 downto 0);
  signal DOB_viol     : std_logic_vector(MAX_DI downto 0);
  signal DOPB_viol    : std_logic_vector(3 downto 0);
  signal DOA_zd            : std_logic_vector(MAX_DI downto 0);
  signal DOB_zd            : std_logic_vector(MAX_DI downto 0);
  signal DOPA_zd           : std_logic_vector(MAX_DIP downto 0);
  signal DOPB_zd           : std_logic_vector(MAX_DIP downto 0);
    
  signal ViolationA        : std_ulogic                     := '0';
  signal ViolationB        : std_ulogic                     := '0';


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

    ADDRA_DELAY : for i in MAX_ADDR downto 0 generate
      VitalWireDelay (ADDRA_ipd(i), ADDRA(i), tipd_ADDRA(i));
    end generate ADDRA_DELAY;

    DIA_DELAY   : for i in MAX_DI downto 0 generate
      VitalWireDelay (DIA_ipd(i), DIA(i), tipd_DIA(i));
    end generate DIA_DELAY;

    DIPA_DELAY  : for i in MAX_DIP downto 0 generate
      VitalWireDelay (DIPA_ipd(i), DIPA(i), tipd_DIPA(i));
    end generate DIPA_DELAY;

    WEA_DELAY : for i in  MAX_WEA downto 0 GENERATE
      VitalWireDelay (WEA_ipd(i) , WEA(i), tipd_WEA(i));
    end generate WEA_DELAY;

    VitalWireDelay (CLKA_ipd, CLKA, tipd_CLKA);
    VitalWireDelay (ENA_ipd, ENA, tipd_ENA);
    VitalWireDelay (REGCEA_ipd, REGCEA, tipd_REGCEA);
    VitalWireDelay (SSRA_ipd, SSRA, tipd_SSRA);

-----  Port B

    ADDRB_DELAY : for i in MAX_ADDR downto 0 generate
      VitalWireDelay (ADDRB_ipd(i), ADDRB(i), tipd_ADDRB(i));
    end generate ADDRB_DELAY;

    DIB_DELAY   : for i in MAX_DI downto 0 generate
      VitalWireDelay (DIB_ipd(i), DIB(i), tipd_DIB(i));
    end generate DIB_DELAY;

    DIPB_DELAY  : for i in MAX_DIP downto 0 generate
      VitalWireDelay (DIPB_ipd(i), DIPB(i), tipd_DIPB(i));
    end generate DIPB_DELAY;

    WEB_DELAY : for i in  MAX_WEB downto 0 GENERATE
      VitalWireDelay (WEB_ipd(i) , WEB(i), tipd_WEB(i));
    end generate WEB_DELAY;

    VitalWireDelay (CLKB_ipd, CLKB, tipd_CLKB);
    VitalWireDelay (ENB_ipd, ENB, tipd_ENB);
    VitalWireDelay (REGCEB_ipd, REGCEB, tipd_REGCEB);
    VitalWireDelay (SSRB_ipd, SSRB, tipd_SSRB);

----- GSR


  end block;

  SignalDelay   : block
  begin

-----  Port A

    ADDRA_DELAY : for i in MAX_ADDR downto 0 generate
      VitalSignalDelay (ADDRA_dly(i), ADDRA_ipd(i), tisd_ADDRA_CLKA(i));
    end generate ADDRA_DELAY;

    DIA_DELAY   : for i in MAX_DI downto 0 generate
      VitalSignalDelay (DIA_dly(i), DIA_ipd(i), tisd_DIA_CLKA(i));
    end generate DIA_DELAY;

    DIPA_DELAY  : for i in MAX_DIP downto 0 generate
      VitalSignalDelay (DIPA_dly(i), DIPA_ipd(i), tisd_DIPA_CLKA(i));
    end generate DIPA_DELAY;

    WEA_DELAY   : for i in MAX_WEA downto 0 generate
      VitalSignalDelay (WEA_dly(i), WEA_ipd(i), tisd_WEA_CLKA(i));
    end generate WEA_DELAY;

    VitalSignalDelay (CLKA_dly, CLKA_ipd, ticd_CLKA);
    VitalSignalDelay (ENA_dly, ENA_ipd, tisd_ENA_CLKA);
    VitalSignalDelay (REGCEA_dly, REGCEA_ipd, tisd_REGCEA_CLKA);
    VitalSignalDelay (SSRA_dly, SSRA_ipd, tisd_SSRA_CLKA);

-----  Port B   

    ADDRB_DELAY : for i in MAX_ADDR downto 0 generate
      VitalSignalDelay (ADDRB_dly(i), ADDRB_ipd(i), tisd_ADDRB_CLKB(i));
    end generate ADDRB_DELAY;


    DIB_DELAY   : for i in MAX_DI downto 0 generate
      VitalSignalDelay (DIB_dly(i), DIB_ipd(i), tisd_DIB_CLKB(i));
    end generate DIB_DELAY;

    DIPB_DELAY  : for i in MAX_DIP downto 0 generate
      VitalSignalDelay (DIPB_dly(i), DIPB_ipd(i), tisd_DIPB_CLKB(i));
    end generate DIPB_DELAY;

    WEB_DELAY   : for i in MAX_WEB downto 0 generate
      VitalSignalDelay (WEB_dly(i), WEB_ipd(i), tisd_WEB_CLKB(i));
    end generate WEB_DELAY;

    VitalSignalDelay (CLKB_dly, CLKB_ipd, ticd_CLKB);
    VitalSignalDelay (ENB_dly, ENB_ipd, tisd_ENB_CLKB);
    VitalSignalDelay (REGCEB_dly, REGCEB_ipd, tisd_REGCEB_CLKB);
    VitalSignalDelay (SSRB_dly, SSRB_ipd, tisd_SSRB_CLKB);

  end block;

  addra_int <= "00" & ADDRA_dly;
  addrb_int <= "00" & ADDRB_dly;
  wea_int <= WEA_dly & WEA_dly & WEA_dly & WEA_dly;
  web_int <= WEB_dly & WEB_dly & WEB_dly & WEB_dly;
                     
  
X_RAMB18_inst : X_ARAMB36_INTERNAL
	generic map (

                DOA_REG => DOA_REG,
                DOB_REG => DOB_REG,
		INIT_A  => INIT_A,
		INIT_B  => INIT_B,
                INIT_FILE => INIT_FILE,
                
		INIT_00 => INIT_00,
		INIT_01 => INIT_01,
		INIT_02 => INIT_02,
		INIT_03 => INIT_03,
		INIT_04 => INIT_04,
		INIT_05 => INIT_05,
		INIT_06 => INIT_06,
		INIT_07 => INIT_07,
		INIT_08 => INIT_08,
		INIT_09 => INIT_09,
		INIT_0A => INIT_0A,
		INIT_0B => INIT_0B,
		INIT_0C => INIT_0C,
		INIT_0D => INIT_0D,
		INIT_0E => INIT_0E,
		INIT_0F => INIT_0F,
		INIT_10 => INIT_10,
		INIT_11 => INIT_11,
		INIT_12 => INIT_12,
		INIT_13 => INIT_13,
		INIT_14 => INIT_14,
		INIT_15 => INIT_15,
		INIT_16 => INIT_16,
		INIT_17 => INIT_17,
		INIT_18 => INIT_18,
		INIT_19 => INIT_19,
		INIT_1A => INIT_1A,
		INIT_1B => INIT_1B,
		INIT_1C => INIT_1C,
		INIT_1D => INIT_1D,
		INIT_1E => INIT_1E,
		INIT_1F => INIT_1F,
		INIT_20 => INIT_20,
		INIT_21 => INIT_21,
		INIT_22 => INIT_22,
		INIT_23 => INIT_23,
		INIT_24 => INIT_24,
		INIT_25 => INIT_25,
		INIT_26 => INIT_26,
		INIT_27 => INIT_27,
		INIT_28 => INIT_28,
		INIT_29 => INIT_29,
		INIT_2A => INIT_2A,
		INIT_2B => INIT_2B,
		INIT_2C => INIT_2C,
		INIT_2D => INIT_2D,
		INIT_2E => INIT_2E,
		INIT_2F => INIT_2F,
		INIT_30 => INIT_30,
		INIT_31 => INIT_31,
		INIT_32 => INIT_32,
		INIT_33 => INIT_33,
		INIT_34 => INIT_34,
		INIT_35 => INIT_35,
		INIT_36 => INIT_36,
		INIT_37 => INIT_37,
		INIT_38 => INIT_38,
		INIT_39 => INIT_39,
		INIT_3A => INIT_3A,
		INIT_3B => INIT_3B,
		INIT_3C => INIT_3C,
		INIT_3D => INIT_3D,
		INIT_3E => INIT_3E,
		INIT_3F => INIT_3F,
                
		INITP_00 => INITP_00,
		INITP_01 => INITP_01,
		INITP_02 => INITP_02,
		INITP_03 => INITP_03,
		INITP_04 => INITP_04,
		INITP_05 => INITP_05,
		INITP_06 => INITP_06,
		INITP_07 => INITP_07,

		SIM_COLLISION_CHECK => SIM_COLLISION_CHECK,
		SRVAL_A => SRVAL_A,
		SRVAL_B => SRVAL_B,
		WRITE_MODE_A => WRITE_MODE_A,
		WRITE_MODE_B => WRITE_MODE_B,                
                BRAM_MODE => "TRUE_DUAL_PORT",
                BRAM_SIZE => 18,
                SETUP_ALL => SETUP_ALL,
                SETUP_READ_FIRST => SETUP_READ_FIRST,
                READ_WIDTH_A => READ_WIDTH_A,
                READ_WIDTH_B => READ_WIDTH_B,                
                WRITE_WIDTH_A => WRITE_WIDTH_A,
                WRITE_WIDTH_B => WRITE_WIDTH_B          
                )

  port map (
                ADDRA => addra_int,
                ADDRB => addrb_int,
                CLKA => CLKA_dly,
                CLKB => CLKB_dly,
                DIA(15 downto 0)  => DIA_dly,
                DIA(63 downto 16) => GND_48,
                DIB(15 downto 0) => DIB_dly,
                DIB(63 downto 16) => GND_48,
                DIPA(1 downto 0) => DIPA_dly,
                DIPA(7 downto 2) => GND_6,
                DIPB(1 downto 0) => DIPB_dly,
                DIPB(7 downto 2) => GND_6,
                ENA => ENA_dly,
                ENB => ENB_dly,
                SSRA => SSRA_dly,
                SSRB => SSRB_dly,
                WEA => wea_int,
                web => web_int,
                DOA(15  downto 0) => DOA_zd,
                DOA(63 downto 16) => OPEN_48,
                DOB(15 downto 0) => DOB_zd,
                DOB(63 downto 16) => OPEN_48,
                DOPA(1 downto 0) => DOPA_zd,
                DOPA(7 downto 2) => OPEN_6,
                DOPB(1 downto 0) => DOPB_zd,
                DOPB(7 downto 2) => OPEN_6,
                REGCLKA => CLKA_dly,
                REGCLKB => CLKB_dly,
                REGCEA => REGCEA_dly,
                REGCEB => REGCEB_dly,
                CASCADEOUTLATA => OPEN,
                CASCADEOUTLATB => OPEN,
                CASCADEOUTREGA => OPEN,
                CASCADEOUTREGB => OPEN,
                CASCADEINLATA => GND,
                CASCADEINLATB => GND,
                CASCADEINREGA => GND,
                CASCADEINREGB => GND
        );

-------------------------------------------------------------------------------
-- Timing check
-------------------------------------------------------------------------------
  process

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
    variable Tviol_DIPA0_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIPA1_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_ENA_CLKA_posedge     : std_ulogic := '0';
    variable Tviol_SSRA_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_WEA0_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_WEA1_CLKA_posedge    : std_ulogic := '0';

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
    variable Tviol_DIPB0_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIPB1_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_ENB_CLKB_posedge     : std_ulogic := '0';
    variable Tviol_SSRB_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_WEB0_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_WEB1_CLKB_posedge    : std_ulogic := '0';

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
    variable Tmkr_ADDRA14_CLKA_posedge  : VitalTimingDataType := VitalTimingDataInit;
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
    variable Tmkr_DIPA0_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPA1_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENA_CLKA_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSRA_CLKA_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEA0_CLKA_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEA1_CLKA_posedge      : VitalTimingDataType := VitalTimingDataInit;

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
    variable Tmkr_ADDRB14_CLKB_posedge  : VitalTimingDataType := VitalTimingDataInit;
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
    variable Tmkr_DIPB0_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPB1_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENB_CLKB_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSRB_CLKB_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEB0_CLKB_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEB1_CLKB_posedge      : VitalTimingDataType := VitalTimingDataInit;

    variable Tmkr_CLKA_CLKB_all        : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKA_CLKB_read_first : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKB_CLKA_all        : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKB_CLKA_read_first : VitalTimingDataType := VitalTimingDataInit;

    variable PViol_CLKA, PViol_CLKB : std_ulogic          := '0';
    variable PInfo_CLKA, PInfo_CLKB : VitalPeriodDataType := VitalPeriodDataInit;
    
  begin  -- process
    if (TimingChecksOn) then
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
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
 -- FP
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA9_CLKA_posedge,
        TimingData     => Tmkr_ADDRA9_CLKA_posedge,
        TestSignal     => ADDRA_dly(9),
        TestSignalName => "ADDRA(9)",
        TestDelay      => tisd_ADDRA_CLKA(9),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(9),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(9),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(9),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(9),
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA10_CLKA_posedge,
        TimingData     => Tmkr_ADDRA10_CLKA_posedge,
        TestSignal     => ADDRA_dly(10),
        TestSignalName => "ADDRA(10)",
        TestDelay      => tisd_ADDRA_CLKA(10),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(10),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(10),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(10),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(10),
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA11_CLKA_posedge,
        TimingData     => Tmkr_ADDRA11_CLKA_posedge,
        TestSignal     => ADDRA_dly(11),
        TestSignalName => "ADDRA(11)",
        TestDelay      => tisd_ADDRA_CLKA(11),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(11),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(11),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(11),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(11),
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA12_CLKA_posedge,
        TimingData     => Tmkr_ADDRA12_CLKA_posedge,
        TestSignal     => ADDRA_dly(12),
        TestSignalName => "ADDRA(12)",
        TestDelay      => tisd_ADDRA_CLKA(12),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(12),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(12),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(12),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(12),
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA13_CLKA_posedge,
        TimingData     => Tmkr_ADDRA13_CLKA_posedge,
        TestSignal     => ADDRA_dly(13),
        TestSignalName => "ADDRA(13)",
        TestDelay      => tisd_ADDRA_CLKA(13),
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_ADDRA_CLKA_posedge_posedge(13),
        SetupLow       => tsetup_ADDRA_CLKA_negedge_posedge(13),
        HoldLow        => thold_ADDRA_CLKA_negedge_posedge(13),
        HoldHigh       => thold_ADDRA_CLKA_posedge_posedge(13),
        CheckEnabled   => TO_X01(ena_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(ena_dly) = '1' and TO_X01(wea_dly) = '1'),
        CheckEnabled   => (TO_X01(ena_dly)    = '1' and
                           TO_X01(wea_dly(0)) = '1' and
                           TO_X01(wea_dly(1)) = '1' ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB9_CLKB_posedge,
        TimingData     => Tmkr_ADDRB9_CLKB_posedge,
        TestSignal     => ADDRB_dly(9),
        TestSignalName => "ADDRB(9)",
        TestDelay      => tisd_ADDRB_CLKB(9),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(9),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(9),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(9),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(9),
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB10_CLKB_posedge,
        TimingData     => Tmkr_ADDRB10_CLKB_posedge,
        TestSignal     => ADDRB_dly(10),
        TestSignalName => "ADDRB(10)",
        TestDelay      => tisd_ADDRB_CLKB(10),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(10),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(10),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(10),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(10),
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB11_CLKB_posedge,
        TimingData     => Tmkr_ADDRB11_CLKB_posedge,
        TestSignal     => ADDRB_dly(11),
        TestSignalName => "ADDRB(11)",
        TestDelay      => tisd_ADDRB_CLKB(11),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(11),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(11),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(11),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(11),
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB12_CLKB_posedge,
        TimingData     => Tmkr_ADDRB12_CLKB_posedge,
        TestSignal     => ADDRB_dly(12),
        TestSignalName => "ADDRB(12)",
        TestDelay      => tisd_ADDRB_CLKB(12),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(12),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(12),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(12),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(12),
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB13_CLKB_posedge,
        TimingData     => Tmkr_ADDRB13_CLKB_posedge,
        TestSignal     => ADDRB_dly(13),
        TestSignalName => "ADDRB(13)",
        TestDelay      => tisd_ADDRB_CLKB(13),
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_ADDRB_CLKB_posedge_posedge(13),
        SetupLow       => tsetup_ADDRB_CLKB_negedge_posedge(13),
        HoldLow        => thold_ADDRB_CLKB_negedge_posedge(13),
        HoldHigh       => thold_ADDRB_CLKB_posedge_posedge(13),
        CheckEnabled   => TO_X01(enb_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
--        CheckEnabled   => (TO_X01(enb_dly) = '1' and TO_X01(web_dly) = '1'),
        CheckEnabled   => (TO_X01(enb_dly)    = '1' and
                           TO_X01(web_dly(0)) = '1' and
                           TO_X01(web_dly(1)) = '1'
                           ),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(ena_dly) = '1',
        HeaderMsg      => "/X_RAMB18",
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
        CheckEnabled   => TO_X01(enb_dly) = '1',
        HeaderMsg      => "/X_RAMB18",
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
      Tviol_ADDRA9_CLKA_posedge or
      Tviol_ADDRA10_CLKA_posedge or
      Tviol_ADDRA11_CLKA_posedge or
      Tviol_ADDRA12_CLKA_posedge or
      Tviol_ADDRA13_CLKA_posedge or
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
      Tviol_DIPA0_CLKA_posedge or
      Tviol_DIPA1_CLKA_posedge or
      Tviol_ENA_CLKA_posedge or
      Tviol_SSRA_CLKA_posedge or
      Tviol_WEA0_CLKA_posedge or
      Tviol_WEA1_CLKA_posedge or
      Pviol_CLKA;
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
      Tviol_ADDRB9_CLKB_posedge or
      Tviol_ADDRB10_CLKB_posedge or
      Tviol_ADDRB11_CLKB_posedge or
      Tviol_ADDRB12_CLKB_posedge or
      Tviol_ADDRB13_CLKB_posedge or
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
      Tviol_DIPB0_CLKB_posedge or
      Tviol_DIPB1_CLKB_posedge or
      Tviol_ENB_CLKB_posedge or
      Tviol_SSRB_CLKB_posedge or
      Tviol_WEB0_CLKB_posedge or
      Tviol_WEB1_CLKB_posedge or
      Pviol_CLKB;

    
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
   prcs_output:process (DOA_zd, DOPA_zd, DOB_zd, DOPB_zd)

    variable ena_dly   : std_ulogic                      := 'X';
    variable enb_dly   : std_ulogic                      := 'X';


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
    variable DOPA_GlitchData0 : VitalGlitchDataType;
    variable DOPA_GlitchData1 : VitalGlitchDataType;

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
    variable DOPB_GlitchData0 : VitalGlitchDataType;
    variable DOPB_GlitchData1 : VitalGlitchDataType;
    variable DOA_viol     : std_logic_vector(MAX_DI downto 0);
    variable DOPA_viol    : std_logic_vector(MAX_DIP downto 0);
    variable DOB_viol     : std_logic_vector(MAX_DI downto 0);
    variable DOPB_viol    : std_logic_vector(MAX_DIP downto 0);
    
   begin

    DOA_viol(0)  := ViolationA xor DOA_zd(0);
    DOA_viol(1)  := ViolationA xor DOA_zd(1);
    DOA_viol(2)  := ViolationA xor DOA_zd(2);
    DOA_viol(3)  := ViolationA xor DOA_zd(3);
    DOA_viol(4)  := ViolationA xor DOA_zd(4);
    DOA_viol(5)  := ViolationA xor DOA_zd(5);
    DOA_viol(6)  := ViolationA xor DOA_zd(6);
    DOA_viol(7)  := ViolationA xor DOA_zd(7);
    DOA_viol(8)  := ViolationA xor DOA_zd(8);
    DOA_viol(9)  := ViolationA xor DOA_zd(9);
    DOA_viol(10) := ViolationA xor DOA_zd(10);
    DOA_viol(11) := ViolationA xor DOA_zd(11);
    DOA_viol(12) := ViolationA xor DOA_zd(12);
    DOA_viol(13) := ViolationA xor DOA_zd(13);
    DOA_viol(14) := ViolationA xor DOA_zd(14);
    DOA_viol(15) := ViolationA xor DOA_zd(15);
    DOPA_viol(0) := ViolationA xor DOPA_zd(0);
    DOPA_viol(1) := ViolationA xor DOPA_zd(1);

    DOB_viol(0)  := ViolationB xor DOB_zd(0);
    DOB_viol(1)  := ViolationB xor DOB_zd(1);
    DOB_viol(2)  := ViolationB xor DOB_zd(2);
    DOB_viol(3)  := ViolationB xor DOB_zd(3);
    DOB_viol(4)  := ViolationB xor DOB_zd(4);
    DOB_viol(5)  := ViolationB xor DOB_zd(5);
    DOB_viol(6)  := ViolationB xor DOB_zd(6);
    DOB_viol(7)  := ViolationB xor DOB_zd(7);
    DOB_viol(8)  := ViolationB xor DOB_zd(8);
    DOB_viol(9)  := ViolationB xor DOB_zd(9);
    DOB_viol(10) := ViolationB xor DOB_zd(10);
    DOB_viol(11) := ViolationB xor DOB_zd(11);
    DOB_viol(12) := ViolationB xor DOB_zd(12);
    DOB_viol(13) := ViolationB xor DOB_zd(13);
    DOB_viol(14) := ViolationB xor DOB_zd(14);
    DOB_viol(15) := ViolationB xor DOB_zd(15);
    DOPB_viol(0) := ViolationB xor DOPB_zd(0);
    DOPB_viol(1) := ViolationB xor DOPB_zd(1);
   
    ena_dly   := ENA_dly;
    enb_dly   := ENB_dly;

    VitalPathDelay01 (
      OutSignal     => DOA(0),
      GlitchData    => DOA_GlitchData0,
      OutSignalName => "DOA(0)",
      OutTemp       => DOA_viol(0),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(0), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(1),
      GlitchData    => DOA_GlitchData1,
      OutSignalName => "DOA(1)",
      OutTemp       => DOA_viol(1),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(1), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(2),
      GlitchData    => DOA_GlitchData2,
      OutSignalName => "DOA(2)",
      OutTemp       => DOA_viol(2),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(2), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(3),
      GlitchData    => DOA_GlitchData3,
      OutSignalName => "DOA(3)",
      OutTemp       => DOA_viol(3),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(3), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(4),
      GlitchData    => DOA_GlitchData4,
      OutSignalName => "DOA(4)",
      OutTemp       => DOA_viol(4),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(4), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(5),
      GlitchData    => DOA_GlitchData5,
      OutSignalName => "DOA(5)",
      OutTemp       => DOA_viol(5),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(5), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(6),
      GlitchData    => DOA_GlitchData6,
      OutSignalName => "DOA(6)",
      OutTemp       => DOA_viol(6),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(6), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(7),
      GlitchData    => DOA_GlitchData7,
      OutSignalName => "DOA(7)",
      OutTemp       => DOA_viol(7),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(7), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(8),
      GlitchData    => DOA_GlitchData8,
      OutSignalName => "DOA(8)",
      OutTemp       => DOA_viol(8),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(8), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(9),
      GlitchData    => DOA_GlitchData9,
      OutSignalName => "DOA(9)",
      OutTemp       => DOA_viol(9),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(9), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(10),
      GlitchData    => DOA_GlitchData10,
      OutSignalName => "DOA(10)",
      OutTemp       => DOA_viol(10),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(10), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(11),
      GlitchData    => DOA_GlitchData11,
      OutSignalName => "DOA(11)",
      OutTemp       => DOA_viol(11),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(11), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(12),
      GlitchData    => DOA_GlitchData12,
      OutSignalName => "DOA(12)",
      OutTemp       => DOA_viol(12),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(12), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(13),
      GlitchData    => DOA_GlitchData13,
      OutSignalName => "DOA(13)",
      OutTemp       => DOA_viol(13),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(13), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(14),
      GlitchData    => DOA_GlitchData14,
      OutSignalName => "DOA(14)",
      OutTemp       => DOA_viol(14),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(14), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(15),
      GlitchData    => DOA_GlitchData15,
      OutSignalName => "DOA(15)",
      OutTemp       => DOA_viol(15),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(15), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(0),
      GlitchData    => DOPA_GlitchData0,
      OutSignalName => "DOPA(0)",
      OutTemp       => DOPA_viol(0),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOPA(0), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPA(1),
      GlitchData    => DOPA_GlitchData1,
      OutSignalName => "DOPA(1)",
      OutTemp       => DOPA_viol(1),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOPA(1), (ena_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

----- Port B
    VitalPathDelay01 (
      OutSignal     => DOB(0),
      GlitchData    => DOB_GlitchData0,
      OutSignalName => "DOB(0)",
      OutTemp       => DOB_viol(0),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(0), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(1),
      GlitchData    => DOB_GlitchData1,
      OutSignalName => "DOB(1)",
      OutTemp       => DOB_viol(1),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(1), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(2),
      GlitchData    => DOB_GlitchData2,
      OutSignalName => "DOB(2)",
      OutTemp       => DOB_viol(2),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(2), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(3),
      GlitchData    => DOB_GlitchData3,
      OutSignalName => "DOB(3)",
      OutTemp       => DOB_viol(3),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(3), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(4),
      GlitchData    => DOB_GlitchData4,
      OutSignalName => "DOB(4)",
      OutTemp       => DOB_viol(4),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(4), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(5),
      GlitchData    => DOB_GlitchData5,
      OutSignalName => "DOB(5)",
      OutTemp       => DOB_viol(5),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(5), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(6),
      GlitchData    => DOB_GlitchData6,
      OutSignalName => "DOB(6)",
      OutTemp       => DOB_viol(6),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(6), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(7),
      GlitchData    => DOB_GlitchData7,
      OutSignalName => "DOB(7)",
      OutTemp       => DOB_viol(7),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(7), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(8),
      GlitchData    => DOB_GlitchData8,
      OutSignalName => "DOB(8)",
      OutTemp       => DOB_viol(8),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(8), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(9),
      GlitchData    => DOB_GlitchData9,
      OutSignalName => "DOB(9)",
      OutTemp       => DOB_viol(9),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(9), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(10),
      GlitchData    => DOB_GlitchData10,
      OutSignalName => "DOB(10)",
      OutTemp       => DOB_viol(10),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(10), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(11),
      GlitchData    => DOB_GlitchData11,
      OutSignalName => "DOB(11)",
      OutTemp       => DOB_viol(11),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(11), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(12),
      GlitchData    => DOB_GlitchData12,
      OutSignalName => "DOB(12)",
      OutTemp       => DOB_viol(12),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(12), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(13),
      GlitchData    => DOB_GlitchData13,
      OutSignalName => "DOB(13)",
      OutTemp       => DOB_viol(13),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(13), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(14),
      GlitchData    => DOB_GlitchData14,
      OutSignalName => "DOB(14)",
      OutTemp       => DOB_viol(14),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(14), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(15),
      GlitchData    => DOB_GlitchData15,
      OutSignalName => "DOB(15)",
      OutTemp       => DOB_viol(15),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(15), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(0),
      GlitchData    => DOPB_GlitchData0,
      OutSignalName => "DOPB(0)",
      OutTemp       => DOPB_viol(0),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOPB(0), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(1),
      GlitchData    => DOPB_GlitchData1,
      OutSignalName => "DOPB(1)",
      OutTemp       => DOPB_viol(1),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOPB(1), (enb_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
   end process prcs_output;
---------------------------------------------------------------------------
-- End Path delay
---------------------------------------------------------------------------
     
end X_RAMB18_V;
