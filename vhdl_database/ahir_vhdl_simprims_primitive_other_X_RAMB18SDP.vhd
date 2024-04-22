-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/rainier/VITAL/X_RAMB18SDP.vhd,v 1.3 2010/01/14 19:38:17 fphillip Exp $
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
-- /___/   /\     Filename : X_RAMB18SDP.vhd
-- \   \  /  \    Timestamp : Tues October 18 16:43:59 PST 2005
--  \___\/\___\
--
-- Revision:
--    10/18/05 - Initial version.
--    08/21/06 - Fixed vital delay for vcs_mx (CR 419867).  
--    12/06/06 - Added setup/hold checks for REGCE (CR 429753).
--    01/04/07 - Added support of memory file to initialize memory and parity (CR 431584).
--    03/14/07 - Removed attribute INITP_FILE (CR 436003).
--    04/03/07 - Changed INIT_FILE = "NONE" as default (CR 436812).
--    08/17/07 - Added setup/hold violation message on address w.r.t. clock (CR 436931).
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision

----- CELL X_RAMB18SDP -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_RAMB18SDP is
generic (

    TimingChecksOn : boolean := true;
    InstancePath   : string  := "*";
    Xon            : boolean := true;
    MsgOn          : boolean := true;

    DO_REG : integer := 0;
    INIT : bit_vector := X"000000000";
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
    INIT_FILE : string := "NONE";
    LOC : string := "UNPLACED";
    SETUP_ALL : time := 1000 ps;
    SETUP_READ_FIRST : time := 3000 ps;
    SIM_COLLISION_CHECK : string := "ALL";
    SRVAL : bit_vector := X"000000000";

--- VITAL input wire delays

    tipd_RDADDR   : VitalDelayArrayType01(8 downto 0) := (others => (0 ps, 0 ps));
    tipd_RDCLK    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DI     : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIP    : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));
    tipd_RDEN     : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_REGCE  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_SSR    : VitalDelayType01                   := ( 0 ps, 0 ps);

    tipd_WRADDR   : VitalDelayArrayType01(8 downto 0) := (others => (0 ps, 0 ps));
    tipd_WRCLK    : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WREN     : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WE     : VitalDelayArrayType01 (3 downto 0) := (others => (0 ps, 0 ps));
    

--- VITAL pin-to-pin propagation delays


    tpd_RDCLK_DO  : VitalDelayArrayType01(31 downto 0) := (others => (100 ps, 100 ps));
    tpd_RDCLK_DOP : VitalDelayArrayType01(3 downto 0)  := (others => (100 ps, 100 ps));

--- VITAL recovery time 


--- VITAL setup time 

    tsetup_RDADDR_RDCLK_negedge_posedge  : VitalDelayArrayType(8 downto 0) := (others => 0 ps);
    tsetup_RDADDR_RDCLK_posedge_posedge  : VitalDelayArrayType(8 downto 0) := (others => 0 ps);
    tsetup_DI_WRCLK_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DI_WRCLK_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DIP_WRCLK_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_DIP_WRCLK_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_RDEN_RDCLK_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_RDEN_RDCLK_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_REGCE_RDCLK_negedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_REGCE_RDCLK_posedge_posedge : VitalDelayType                   := 0 ps;
    tsetup_SSR_RDCLK_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSR_RDCLK_posedge_posedge   : VitalDelayType                   := 0 ps;

    tsetup_WRADDR_WRCLK_negedge_posedge  : VitalDelayArrayType(8 downto 0) := (others => 0 ps);
    tsetup_WRADDR_WRCLK_posedge_posedge  : VitalDelayArrayType(8 downto 0) := (others => 0 ps);
    tsetup_WREN_WRCLK_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_WREN_WRCLK_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_WE_WRCLK_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_WE_WRCLK_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    
--- VITAL hold time 

    thold_RDADDR_RDCLK_negedge_posedge  : VitalDelayArrayType(8 downto 0) := (others => 0 ps);
    thold_RDADDR_RDCLK_posedge_posedge  : VitalDelayArrayType(8 downto 0) := (others => 0 ps);
    thold_DI_WRCLK_negedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DI_WRCLK_posedge_posedge    : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DIP_WRCLK_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_DIP_WRCLK_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_RDEN_RDCLK_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_RDEN_RDCLK_posedge_posedge    : VitalDelayType                   := 0 ps;
    thold_REGCE_RDCLK_negedge_posedge : VitalDelayType                   := 0 ps;
    thold_REGCE_RDCLK_posedge_posedge : VitalDelayType                   := 0 ps;
    thold_SSR_RDCLK_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSR_RDCLK_posedge_posedge   : VitalDelayType                   := 0 ps;

    thold_WRADDR_WRCLK_negedge_posedge  : VitalDelayArrayType(8 downto 0) := (others => 0 ps);
    thold_WRADDR_WRCLK_posedge_posedge  : VitalDelayArrayType(8 downto 0) := (others => 0 ps);
    thold_WREN_WRCLK_negedge_posedge    : VitalDelayType                   := 0 ps;
    thold_WREN_WRCLK_posedge_posedge    : VitalDelayType                   := 0 ps;
    thold_WE_WRCLK_negedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_WE_WRCLK_posedge_posedge    : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    

    ticd_RDCLK          : VitalDelayType                     := 0 ps;
    tisd_RDADDR_RDCLK    : VitalDelayArrayType(8 downto 0)   := (others => 0 ps);
    tisd_DI_WRCLK      : VitalDelayArrayType(31 downto 0)   := (others => 0 ps);
    tisd_DIP_WRCLK     : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);
    tisd_RDEN_RDCLK      : VitalDelayType                     := 0 ps;
    tisd_REGCE_RDCLK   : VitalDelayType                     := 0 ps;
    tisd_SSR_RDCLK     : VitalDelayType                     := 0 ps;

    ticd_WRCLK          : VitalDelayType                     := 0 ps;
    tisd_WRADDR_WRCLK    : VitalDelayArrayType(8 downto 0)   := (others => 0 ps);
    tisd_WREN_WRCLK      : VitalDelayType                     := 0 ps;
    tisd_WE_WRCLK      : VitalDelayArrayType(3 downto 0)    := (others => 0 ps);
    
    tperiod_rdclk_posedge : VitalDelayType := 0 ps;
    tperiod_wrclk_posedge : VitalDelayType := 0 ps;
    
    tpw_RDCLK_negedge : VitalDelayType := 0 ps;
    tpw_RDCLK_posedge : VitalDelayType := 0 ps;
    tpw_WRCLK_negedge : VitalDelayType := 0 ps;
    tpw_WRCLK_posedge : VitalDelayType := 0 ps
    
  );

port (

    DO : out std_logic_vector(31 downto 0);
    DOP : out std_logic_vector(3 downto 0);
    
    DI : in std_logic_vector(31 downto 0);
    DIP : in std_logic_vector(3 downto 0);
    RDADDR : in std_logic_vector(8 downto 0);
    RDCLK : in std_ulogic;
    RDEN : in std_ulogic;
    REGCE : in std_ulogic;
    SSR : in std_ulogic;
    WE : in std_logic_vector(3 downto 0);
    WRADDR : in std_logic_vector(8 downto 0);
    WRCLK : in std_ulogic;
    WREN : in std_ulogic

  );

  attribute VITAL_LEVEL0 of
     X_RAMB18SDP : entity is true;

end X_RAMB18SDP;
                                                                        
architecture X_RAMB18SDP_V of X_RAMB18SDP is

  attribute VITAL_LEVEL0 of
    X_RAMB18SDP_V : architecture is true;
  
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

  
  constant SYNC_PATH_DELAY : time := 100 ps;
  signal we_int : std_logic_vector(7 downto 0) := (others => '0');
  signal addra_int : std_logic_vector(15 downto 0) := (others => '0');
  signal addrb_int : std_logic_vector(15 downto 0) := (others => '0');
  signal GND : std_ulogic := '0';
  signal GND_4 : std_logic_vector(3 downto 0) := (others => '0');
  signal GND_8 : std_logic_vector(7 downto 0) := (others => '0');
  signal GND_32 : std_logic_vector(31 downto 0) := (others => '0');
  signal GND_64 : std_logic_vector(63 downto 0) := (others => '0');
  signal OPEN_4 : std_logic_vector(3 downto 0);
  signal OPEN_8 : std_logic_vector(7 downto 0);
  signal OPEN_32 : std_logic_vector(31 downto 0);
  signal OPEN_64 : std_logic_vector(63 downto 0);
  signal do_dly : std_logic_vector(31 downto 0) :=  (others => '0');
  signal dop_dly : std_logic_vector(3 downto 0) :=  (others => '0');

  constant MAX_ADDR: integer := 8;
  constant MAX_DI:   integer := 31;
  constant MAX_DIP:  integer := 3;
  constant MAX_WE:   integer := 3;
  
  signal RDADDR_ipd    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal RDCLK_ipd     : std_ulogic                          := 'X';
  signal DI_ipd      : std_logic_vector(MAX_DI  downto 0)  := (others => 'X');
  signal DIP_ipd     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal RDEN_ipd      : std_ulogic                          := 'X';
  signal REGCE_ipd   : std_ulogic                          := 'X';
  signal SSR_ipd     : std_ulogic                          := 'X';
  signal WE_ipd      : std_logic_vector(MAX_WE downto 0)   := (others => 'X');    
  signal WRADDR_ipd    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal WRCLK_ipd     : std_ulogic                          := 'X';
  signal WREN_ipd      : std_ulogic                          := 'X';

  signal GSR_ipd      : std_ulogic                          := 'X';

  signal GSR_dly      : std_ulogic                          := '0';

  signal RDADDR_dly    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal RDCLK_dly     : std_ulogic                          := 'X';
  signal DI_dly      : std_logic_vector(MAX_DI downto 0) := (others => 'X');
  signal DIP_dly     : std_logic_vector(MAX_DIP downto 0)  := (others => 'X');
  signal RDEN_dly      : std_ulogic                          := 'X';
  signal GSR_RDCLK_dly : std_ulogic                          := '0';
  signal REGCE_dly   : std_ulogic                          := 'X';
  signal SSR_dly     : std_ulogic                          := 'X';
  signal WE_dly      : std_logic_vector(MAX_WE downto 0)   := (others => 'X');    
  signal WRADDR_dly    : std_logic_vector(MAX_ADDR downto 0) := (others => 'X');
  signal WRCLK_dly     : std_ulogic                          := 'X';
  signal WREN_dly      : std_ulogic                          := 'X';
  signal GSR_WRCLK_dly : std_ulogic                          := '0';
    
  signal DO_zd            : std_logic_vector(MAX_DI downto 0);
  signal DOP_zd           : std_logic_vector(MAX_DIP downto 0);
  signal DOPB_zd           : std_logic_vector(MAX_DIP downto 0);
    
  signal Violation        : std_ulogic                     := '0';

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

    RDADDR_DELAY : for i in MAX_ADDR downto 0 generate
      VitalWireDelay (RDADDR_ipd(i), RDADDR(i), tipd_RDADDR(i));
    end generate RDADDR_DELAY;

    DI_DELAY   : for i in MAX_DI downto 0 generate
      VitalWireDelay (DI_ipd(i), DI(i), tipd_DI(i));
    end generate DI_DELAY;

    DIP_DELAY  : for i in MAX_DIP downto 0 generate
      VitalWireDelay (DIP_ipd(i), DIP(i), tipd_DIP(i));
    end generate DIP_DELAY;

    VitalWireDelay (RDCLK_ipd, RDCLK, tipd_RDCLK);
    VitalWireDelay (RDEN_ipd, RDEN, tipd_RDEN);
    VitalWireDelay (REGCE_ipd, REGCE, tipd_REGCE);
    VitalWireDelay (SSR_ipd, SSR, tipd_SSR);

    WRADDR_DELAY : for i in MAX_ADDR downto 0 generate
      VitalWireDelay (WRADDR_ipd(i), WRADDR(i), tipd_WRADDR(i));
    end generate WRADDR_DELAY;

    WE_DELAY : for i in  MAX_WE downto 0 GENERATE
      VitalWireDelay (WE_ipd(i) , WE(i), tipd_WE(i));
    end generate WE_DELAY;

    VitalWireDelay (WRCLK_ipd, WRCLK, tipd_WRCLK);
    VitalWireDelay (WREN_ipd, WREN, tipd_WREN);

----- GSR


  end block;

  SignalDelay   : block
  begin

    RDADDR_DELAY : for i in MAX_ADDR downto 0 generate
      VitalSignalDelay (RDADDR_dly(i), RDADDR_ipd(i), tisd_RDADDR_RDCLK(i));
    end generate RDADDR_DELAY;

    DI_DELAY   : for i in MAX_DI downto 0 generate
      VitalSignalDelay (DI_dly(i), DI_ipd(i), tisd_DI_WRCLK(i));
    end generate DI_DELAY;

    DIP_DELAY  : for i in MAX_DIP downto 0 generate
      VitalSignalDelay (DIP_dly(i), DIP_ipd(i), tisd_DIP_WRCLK(i));
    end generate DIP_DELAY;

    VitalSignalDelay (RDCLK_dly, RDCLK_ipd, ticd_RDCLK);
    VitalSignalDelay (RDEN_dly, RDEN_ipd, tisd_RDEN_RDCLK);
    VitalSignalDelay (REGCE_dly, REGCE_ipd, tisd_REGCE_RDCLK);
    VitalSignalDelay (SSR_dly, SSR_ipd, tisd_SSR_RDCLK);

    WRADDR_DELAY : for i in MAX_ADDR downto 0 generate
      VitalSignalDelay (WRADDR_dly(i), WRADDR_ipd(i), tisd_WRADDR_WRCLK(i));
    end generate WRADDR_DELAY;

    WE_DELAY   : for i in MAX_WE downto 0 generate
      VitalSignalDelay (WE_dly(i), WE_ipd(i), tisd_WE_WRCLK(i));
    end generate WE_DELAY;

    VitalSignalDelay (WRCLK_dly, WRCLK_ipd, ticd_WRCLK);
    VitalSignalDelay (WREN_dly, WREN_ipd, tisd_WREN_WRCLK);

  end block;

  
   addra_int <= "00" & RDADDR_dly & "00000";
   addrb_int <= "00" & WRADDR_dly & "00000";
   we_int <= WE_dly & WE_dly;
   
-- X_RAMB18SDP_INTERNAL Instantiation

X_RAMB18SDP_inst : X_ARAMB36_INTERNAL
	generic map (

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

		INIT_A  => INIT,
		INIT_B  => INIT,
                INIT_FILE => INIT_FILE,
		SIM_COLLISION_CHECK => SIM_COLLISION_CHECK,
		SRVAL_A => SRVAL,
		SRVAL_B => SRVAL,
		WRITE_MODE_A => "READ_FIRST",
		WRITE_MODE_B => "READ_FIRST",                
                BRAM_MODE => "SIMPLE_DUAL_PORT",
                BRAM_SIZE => 18,
                DOA_REG => DO_REG,
                DOB_REG => DO_REG,
                SETUP_ALL => SETUP_ALL,
                SETUP_READ_FIRST => SETUP_READ_FIRST,
                READ_WIDTH_A => 36,
                READ_WIDTH_B => 36,                
                WRITE_WIDTH_A => 36,
                WRITE_WIDTH_B => 36          
                )
  
        port map (
                ADDRA => addra_int,
                ADDRB => addrb_int,
                CLKA => RDCLK_dly,
                CLKB => WRCLK_dly,
                DIA => GND_64,
                DIB(63 downto 32) => GND_32,
                DIB(31 downto 0) => DI_dly,
                DIPA => GND_8,
                DIPB(7 downto 4) => GND_4,
                DIPB(3 downto 0) => DIP_dly,
                
                ENA => RDEN_dly,
                ENB => WREN_dly,
                SSRA => SSR_dly,
                SSRB => GND,
                WEA => GND_8,
                WEB => we_int,
                DOA(31  downto 0) => DO_zd,
                DOA(63 downto 32) => OPEN_32,
                DOB => OPEN_64,
                DOPA(3 downto 0) => DOP_zd,
                DOPA(7 downto 4) => OPEN_4,
                DOPB => OPEN_8,
                CASCADEOUTLATA => OPEN,
                CASCADEOUTLATB => OPEN,
                CASCADEOUTREGA => OPEN,
                CASCADEOUTREGB => OPEN,
                CASCADEINLATA => GND,
                CASCADEINLATB => GND,
                CASCADEINREGA => GND,
                CASCADEINREGB => GND,
                REGCLKA => RDCLK_dly,
                REGCLKB => WRCLK_dly,
                REGCEA => REGCE_dly,
                REGCEB => GND,
                DBITERR => OPEN,
                SBITERR => OPEN,
                ECCPARITY => OPEN
        );

  -------------------------------------------------------------------------------
-- Timing check
-------------------------------------------------------------------------------
  process

    variable Tviol_RDADDR0_RDCLK_posedge  : std_ulogic := '0';
    variable Tviol_RDADDR1_RDCLK_posedge  : std_ulogic := '0';
    variable Tviol_RDADDR2_RDCLK_posedge  : std_ulogic := '0';
    variable Tviol_RDADDR3_RDCLK_posedge  : std_ulogic := '0';
    variable Tviol_RDADDR4_RDCLK_posedge  : std_ulogic := '0';
    variable Tviol_RDADDR5_RDCLK_posedge  : std_ulogic := '0';
    variable Tviol_RDADDR6_RDCLK_posedge  : std_ulogic := '0';
    variable Tviol_RDADDR7_RDCLK_posedge  : std_ulogic := '0';
    variable Tviol_RDADDR8_RDCLK_posedge  : std_ulogic := '0';
    variable Tviol_DI0_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DI1_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DI2_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DI3_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DI4_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DI5_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DI6_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DI7_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DI8_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DI9_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DI10_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI11_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI12_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI13_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI14_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI15_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI16_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI17_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI18_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI19_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI20_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI21_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI22_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI23_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI24_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI25_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI26_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI27_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI28_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI29_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI30_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DI31_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIP0_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIP1_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIP2_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIP3_WRCLK_posedge   : std_ulogic := '0';
    variable Tviol_RDEN_RDCLK_posedge     : std_ulogic := '0';
    variable Tviol_REGCE_RDCLK_posedge     : std_ulogic := '0';
    variable Tviol_SSR_RDCLK_posedge    : std_ulogic := '0';

    variable Tviol_WRADDR0_WRCLK_posedge  : std_ulogic := '0';
    variable Tviol_WRADDR1_WRCLK_posedge  : std_ulogic := '0';
    variable Tviol_WRADDR2_WRCLK_posedge  : std_ulogic := '0';
    variable Tviol_WRADDR3_WRCLK_posedge  : std_ulogic := '0';
    variable Tviol_WRADDR4_WRCLK_posedge  : std_ulogic := '0';
    variable Tviol_WRADDR5_WRCLK_posedge  : std_ulogic := '0';
    variable Tviol_WRADDR6_WRCLK_posedge  : std_ulogic := '0';
    variable Tviol_WRADDR7_WRCLK_posedge  : std_ulogic := '0';
    variable Tviol_WRADDR8_WRCLK_posedge  : std_ulogic := '0';
    variable Tviol_WREN_WRCLK_posedge     : std_ulogic := '0';
    variable Tviol_WE0_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_WE1_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_WE2_WRCLK_posedge    : std_ulogic := '0';
    variable Tviol_WE3_WRCLK_posedge    : std_ulogic := '0';
    
    variable Tviol_RDCLK_WRCLK_all        : std_ulogic := '0';
    variable Tviol_RDCLK_WRCLK_read_first : std_ulogic := '0';
    variable Tviol_WRCLK_RDCLK_all        : std_ulogic := '0';
    variable Tviol_WRCLK_RDCLK_read_first : std_ulogic := '0';

    variable Tmkr_RDADDR0_RDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RDADDR1_RDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RDADDR2_RDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RDADDR3_RDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RDADDR4_RDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RDADDR5_RDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RDADDR6_RDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RDADDR7_RDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RDADDR8_RDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI0_WRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI1_WRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI2_WRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI3_WRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI4_WRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI5_WRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI6_WRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI7_WRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI8_WRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI9_WRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI10_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI11_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI12_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI13_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI14_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI15_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI16_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI17_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI18_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI19_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI20_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI21_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI22_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI23_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI24_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI25_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI26_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI27_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI28_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI29_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI30_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI31_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIP0_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIP1_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIP2_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIP3_WRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RDEN_RDCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_REGCE_RDCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSR_RDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WE0_WRCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WE1_WRCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WE2_WRCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WE3_WRCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
        
    variable Tmkr_WRADDR0_WRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WRADDR1_WRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WRADDR2_WRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WRADDR3_WRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WRADDR4_WRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WRADDR5_WRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WRADDR6_WRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WRADDR7_WRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WRADDR8_WRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WREN_WRCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;

    variable Tmkr_RDCLK_WRCLK_all        : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RDCLK_WRCLK_read_first : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WRCLK_RDCLK_all        : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WRCLK_RDCLK_read_first : VitalTimingDataType := VitalTimingDataInit;

    variable PViol_RDCLK, PViol_WRCLK : std_ulogic          := '0';
    variable PInfo_RDCLK, PInfo_WRCLK : VitalPeriodDataType := VitalPeriodDataInit;
    
  begin  -- process
    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation      => Tviol_RDEN_RDCLK_posedge,
        TimingData     => Tmkr_RDEN_RDCLK_posedge,
        TestSignal     => RDEN_dly,
        TestSignalName => "RDEN",
        TestDelay      => tisd_RDEN_RDCLK,
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_RDEN_RDCLK_posedge_posedge,
        SetupLow       => tsetup_RDEN_RDCLK_negedge_posedge,
        HoldLow        => thold_RDEN_RDCLK_negedge_posedge,
        HoldHigh       => thold_RDEN_RDCLK_posedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_REGCE_RDCLK_posedge,
        TimingData     => Tmkr_REGCE_RDCLK_posedge,
        TestSignal     => REGCE_dly,
        TestSignalName => "REGCE",
        TestDelay      => tisd_REGCE_RDCLK,
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_REGCE_RDCLK_posedge_posedge,
        SetupLow       => tsetup_REGCE_RDCLK_negedge_posedge,
        HoldLow        => thold_REGCE_RDCLK_negedge_posedge,
        HoldHigh       => thold_REGCE_RDCLK_posedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_SSR_RDCLK_posedge,
        TimingData     => Tmkr_SSR_RDCLK_posedge,
        TestSignal     => SSR_dly,
        TestSignalName => "SSR",
        TestDelay      => tisd_SSR_RDCLK,
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_SSR_RDCLK_posedge_posedge,
        SetupLow       => tsetup_SSR_RDCLK_negedge_posedge,
        HoldLow        => thold_SSR_RDCLK_negedge_posedge,
        HoldHigh       => thold_SSR_RDCLK_posedge_posedge,
        CheckEnabled   => TO_X01(rden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RDADDR0_RDCLK_posedge,
        TimingData     => Tmkr_RDADDR0_RDCLK_posedge,
        TestSignal     => RDADDR_dly(0),
        TestSignalName => "RDADDR(0)",
        TestDelay      => tisd_RDADDR_RDCLK(0),
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_RDADDR_RDCLK_posedge_posedge(0),
        SetupLow       => tsetup_RDADDR_RDCLK_negedge_posedge(0),
        HoldLow        => thold_RDADDR_RDCLK_negedge_posedge(0),
        HoldHigh       => thold_RDADDR_RDCLK_posedge_posedge(0),
        CheckEnabled   => TO_X01(rden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RDADDR1_RDCLK_posedge,
        TimingData     => Tmkr_RDADDR1_RDCLK_posedge,
        TestSignal     => RDADDR_dly(1),
        TestSignalName => "RDADDR(1)",
        TestDelay      => tisd_RDADDR_RDCLK(1),
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_RDADDR_RDCLK_posedge_posedge(1),
        SetupLow       => tsetup_RDADDR_RDCLK_negedge_posedge(1),
        HoldLow        => thold_RDADDR_RDCLK_negedge_posedge(1),
        HoldHigh       => thold_RDADDR_RDCLK_posedge_posedge(1),
        CheckEnabled   => TO_X01(rden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RDADDR2_RDCLK_posedge,
        TimingData     => Tmkr_RDADDR2_RDCLK_posedge,
        TestSignal     => RDADDR_dly(2),
        TestSignalName => "RDADDR(2)",
        TestDelay      => tisd_RDADDR_RDCLK(2),
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_RDADDR_RDCLK_posedge_posedge(2),
        SetupLow       => tsetup_RDADDR_RDCLK_negedge_posedge(2),
        HoldLow        => thold_RDADDR_RDCLK_negedge_posedge(2),
        HoldHigh       => thold_RDADDR_RDCLK_posedge_posedge(2),
        CheckEnabled   => TO_X01(rden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RDADDR3_RDCLK_posedge,
        TimingData     => Tmkr_RDADDR3_RDCLK_posedge,
        TestSignal     => RDADDR_dly(3),
        TestSignalName => "RDADDR(3)",
        TestDelay      => tisd_RDADDR_RDCLK(3),
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_RDADDR_RDCLK_posedge_posedge(3),
        SetupLow       => tsetup_RDADDR_RDCLK_negedge_posedge(3),
        HoldLow        => thold_RDADDR_RDCLK_negedge_posedge(3),
        HoldHigh       => thold_RDADDR_RDCLK_posedge_posedge(3),
        CheckEnabled   => TO_X01(rden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RDADDR4_RDCLK_posedge,
        TimingData     => Tmkr_RDADDR4_RDCLK_posedge,
        TestSignal     => RDADDR_dly(4),
        TestSignalName => "RDADDR(4)",
        TestDelay      => tisd_RDADDR_RDCLK(4),
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_RDADDR_RDCLK_posedge_posedge(4),
        SetupLow       => tsetup_RDADDR_RDCLK_negedge_posedge(4),
        HoldLow        => thold_RDADDR_RDCLK_negedge_posedge(4),
        HoldHigh       => thold_RDADDR_RDCLK_posedge_posedge(4),
        CheckEnabled   => TO_X01(rden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RDADDR5_RDCLK_posedge,
        TimingData     => Tmkr_RDADDR5_RDCLK_posedge,
        TestSignal     => RDADDR_dly(5),
        TestSignalName => "RDADDR(5)",
        TestDelay      => tisd_RDADDR_RDCLK(5),
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_RDADDR_RDCLK_posedge_posedge(5),
        SetupLow       => tsetup_RDADDR_RDCLK_negedge_posedge(5),
        HoldLow        => thold_RDADDR_RDCLK_negedge_posedge(5),
        HoldHigh       => thold_RDADDR_RDCLK_posedge_posedge(5),
        CheckEnabled   => TO_X01(rden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RDADDR6_RDCLK_posedge,
        TimingData     => Tmkr_RDADDR6_RDCLK_posedge,
        TestSignal     => RDADDR_dly(6),
        TestSignalName => "RDADDR(6)",
        TestDelay      => tisd_RDADDR_RDCLK(6),
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_RDADDR_RDCLK_posedge_posedge(6),
        SetupLow       => tsetup_RDADDR_RDCLK_negedge_posedge(6),
        HoldLow        => thold_RDADDR_RDCLK_negedge_posedge(6),
        HoldHigh       => thold_RDADDR_RDCLK_posedge_posedge(6),
        CheckEnabled   => TO_X01(rden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RDADDR7_RDCLK_posedge,
        TimingData     => Tmkr_RDADDR7_RDCLK_posedge,
        TestSignal     => RDADDR_dly(7),
        TestSignalName => "RDADDR(7)",
        TestDelay      => tisd_RDADDR_RDCLK(7),
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_RDADDR_RDCLK_posedge_posedge(7),
        SetupLow       => tsetup_RDADDR_RDCLK_negedge_posedge(7),
        HoldLow        => thold_RDADDR_RDCLK_negedge_posedge(7),
        HoldHigh       => thold_RDADDR_RDCLK_posedge_posedge(7),
        CheckEnabled   => TO_X01(rden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RDADDR8_RDCLK_posedge,
        TimingData     => Tmkr_RDADDR8_RDCLK_posedge,
        TestSignal     => RDADDR_dly(8),
        TestSignalName => "RDADDR(8)",
        TestDelay      => tisd_RDADDR_RDCLK(8),
        RefSignal      => RDCLK_dly,
        RefSignalName  => "RDCLK",
        RefDelay       => ticd_RDCLK,
        SetupHigh      => tsetup_RDADDR_RDCLK_posedge_posedge(8),
        SetupLow       => tsetup_RDADDR_RDCLK_negedge_posedge(8),
        HoldLow        => thold_RDADDR_RDCLK_negedge_posedge(8),
        HoldHigh       => thold_RDADDR_RDCLK_posedge_posedge(8),
        CheckEnabled   => TO_X01(rden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIP0_WRCLK_posedge,
        TimingData     => Tmkr_DIP0_WRCLK_posedge,
        TestSignal     => DIP_dly(0),
        TestSignalName => "DIP(0)",
        TestDelay      => tisd_DIP_WRCLK(0),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(0),
        SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(0),
        HoldLow        => thold_DIP_WRCLK_negedge_posedge(0),
        HoldHigh       => thold_DIP_WRCLK_posedge_posedge(0),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIP1_WRCLK_posedge,
        TimingData     => Tmkr_DIP1_WRCLK_posedge,
        TestSignal     => DIP_dly(1),
        TestSignalName => "DIP(1)",
        TestDelay      => tisd_DIP_WRCLK(1),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(1),
        SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(1),
        HoldLow        => thold_DIP_WRCLK_negedge_posedge(1),
        HoldHigh       => thold_DIP_WRCLK_posedge_posedge(1),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIP2_WRCLK_posedge,
        TimingData     => Tmkr_DIP2_WRCLK_posedge,
        TestSignal     => DIP_dly(2),
        TestSignalName => "DIP(2)",
        TestDelay      => tisd_DIP_WRCLK(2),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(2),
        SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(2),
        HoldLow        => thold_DIP_WRCLK_negedge_posedge(2),
        HoldHigh       => thold_DIP_WRCLK_posedge_posedge(2),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIP3_WRCLK_posedge,
        TimingData     => Tmkr_DIP3_WRCLK_posedge,
        TestSignal     => DIP_dly(3),
        TestSignalName => "DIP(3)",
        TestDelay      => tisd_DIP_WRCLK(3),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(3),
        SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(3),
        HoldLow        => thold_DIP_WRCLK_negedge_posedge(3),
        HoldHigh       => thold_DIP_WRCLK_posedge_posedge(3),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI0_WRCLK_posedge,
        TimingData     => Tmkr_DI0_WRCLK_posedge,
        TestSignal     => DI_dly(0),
        TestSignalName => "DI(0)",
        TestDelay      => tisd_DI_WRCLK(0),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(0),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(0),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(0),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(0),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI1_WRCLK_posedge,
        TimingData     => Tmkr_DI1_WRCLK_posedge,
        TestSignal     => DI_dly(1),
        TestSignalName => "DI(1)",
        TestDelay      => tisd_DI_WRCLK(1),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(1),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(1),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(1),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(1),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI2_WRCLK_posedge,
        TimingData     => Tmkr_DI2_WRCLK_posedge,
        TestSignal     => DI_dly(2),
        TestSignalName => "DI(2)",
        TestDelay      => tisd_DI_WRCLK(2),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(2),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(2),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(2),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(2),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI3_WRCLK_posedge,
        TimingData     => Tmkr_DI3_WRCLK_posedge,
        TestSignal     => DI_dly(3),
        TestSignalName => "DI(3)",
        TestDelay      => tisd_DI_WRCLK(3),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(3),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(3),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(3),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(3),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI4_WRCLK_posedge,
        TimingData     => Tmkr_DI4_WRCLK_posedge,
        TestSignal     => DI_dly(4),
        TestSignalName => "DI(4)",
        TestDelay      => tisd_DI_WRCLK(4),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(4),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(4),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(4),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(4),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI5_WRCLK_posedge,
        TimingData     => Tmkr_DI5_WRCLK_posedge,
        TestSignal     => DI_dly(5),
        TestSignalName => "DI(5)",
        TestDelay      => tisd_DI_WRCLK(5),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(5),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(5),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(5),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(5),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI6_WRCLK_posedge,
        TimingData     => Tmkr_DI6_WRCLK_posedge,
        TestSignal     => DI_dly(6),
        TestSignalName => "DI(6)",
        TestDelay      => tisd_DI_WRCLK(6),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(6),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(6),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(6),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(6),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI7_WRCLK_posedge,
        TimingData     => Tmkr_DI7_WRCLK_posedge,
        TestSignal     => DI_dly(7),
        TestSignalName => "DI(7)",
        TestDelay      => tisd_DI_WRCLK(7),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(7),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(7),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(7),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(7),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI8_WRCLK_posedge,
        TimingData     => Tmkr_DI8_WRCLK_posedge,
        TestSignal     => DI_dly(8),
        TestSignalName => "DI(8)",
        TestDelay      => tisd_DI_WRCLK(8),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(8),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(8),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(8),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(8),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI9_WRCLK_posedge,
        TimingData     => Tmkr_DI9_WRCLK_posedge,
        TestSignal     => DI_dly(9),
        TestSignalName => "DI(9)",
        TestDelay      => tisd_DI_WRCLK(9),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(9),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(9),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(9),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(9),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI10_WRCLK_posedge,
        TimingData     => Tmkr_DI10_WRCLK_posedge,
        TestSignal     => DI_dly(10),
        TestSignalName => "DI(10)",
        TestDelay      => tisd_DI_WRCLK(10),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(10),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(10),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(10),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(10),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI11_WRCLK_posedge,
        TimingData     => Tmkr_DI11_WRCLK_posedge,
        TestSignal     => DI_dly(11),
        TestSignalName => "DI(11)",
        TestDelay      => tisd_DI_WRCLK(11),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(11),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(11),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(11),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(11),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI12_WRCLK_posedge,
        TimingData     => Tmkr_DI12_WRCLK_posedge,
        TestSignal     => DI_dly(12),
        TestSignalName => "DI(12)",
        TestDelay      => tisd_DI_WRCLK(12),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(12),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(12),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(12),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(12),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI13_WRCLK_posedge,
        TimingData     => Tmkr_DI13_WRCLK_posedge,
        TestSignal     => DI_dly(13),
        TestSignalName => "DI(13)",
        TestDelay      => tisd_DI_WRCLK(13),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(13),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(13),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(13),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(13),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI14_WRCLK_posedge,
        TimingData     => Tmkr_DI14_WRCLK_posedge,
        TestSignal     => DI_dly(14),
        TestSignalName => "DI(14)",
        TestDelay      => tisd_DI_WRCLK(14),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(14),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(14),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(14),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(14),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI15_WRCLK_posedge,
        TimingData     => Tmkr_DI15_WRCLK_posedge,
        TestSignal     => DI_dly(15),
        TestSignalName => "DI(15)",
        TestDelay      => tisd_DI_WRCLK(15),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(15),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(15),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(15),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(15),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI16_WRCLK_posedge,
        TimingData     => Tmkr_DI16_WRCLK_posedge,
        TestSignal     => DI_dly(16),
        TestSignalName => "DI(16)",
        TestDelay      => tisd_DI_WRCLK(16),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(16),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(16),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(16),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(16),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI17_WRCLK_posedge,
        TimingData     => Tmkr_DI17_WRCLK_posedge,
        TestSignal     => DI_dly(17),
        TestSignalName => "DI(17)",
        TestDelay      => tisd_DI_WRCLK(17),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(17),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(17),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(17),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(17),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI18_WRCLK_posedge,
        TimingData     => Tmkr_DI18_WRCLK_posedge,
        TestSignal     => DI_dly(18),
        TestSignalName => "DI(18)",
        TestDelay      => tisd_DI_WRCLK(18),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(18),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(18),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(18),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(18),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI19_WRCLK_posedge,
        TimingData     => Tmkr_DI19_WRCLK_posedge,
        TestSignal     => DI_dly(19),
        TestSignalName => "DI(19)",
        TestDelay      => tisd_DI_WRCLK(19),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(19),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(19),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(19),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(19),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI20_WRCLK_posedge,
        TimingData     => Tmkr_DI20_WRCLK_posedge,
        TestSignal     => DI_dly(20),
        TestSignalName => "DI(20)",
        TestDelay      => tisd_DI_WRCLK(20),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(20),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(20),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(20),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(20),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI21_WRCLK_posedge,
        TimingData     => Tmkr_DI21_WRCLK_posedge,
        TestSignal     => DI_dly(21),
        TestSignalName => "DI(21)",
        TestDelay      => tisd_DI_WRCLK(21),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(21),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(21),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(21),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(21),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI22_WRCLK_posedge,
        TimingData     => Tmkr_DI22_WRCLK_posedge,
        TestSignal     => DI_dly(22),
        TestSignalName => "DI(22)",
        TestDelay      => tisd_DI_WRCLK(22),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(22),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(22),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(22),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(22),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI23_WRCLK_posedge,
        TimingData     => Tmkr_DI23_WRCLK_posedge,
        TestSignal     => DI_dly(23),
        TestSignalName => "DI(23)",
        TestDelay      => tisd_DI_WRCLK(23),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(23),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(23),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(23),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(23),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI24_WRCLK_posedge,
        TimingData     => Tmkr_DI24_WRCLK_posedge,
        TestSignal     => DI_dly(24),
        TestSignalName => "DI(24)",
        TestDelay      => tisd_DI_WRCLK(24),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(24),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(24),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(24),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(24),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI25_WRCLK_posedge,
        TimingData     => Tmkr_DI25_WRCLK_posedge,
        TestSignal     => DI_dly(25),
        TestSignalName => "DI(25)",
        TestDelay      => tisd_DI_WRCLK(25),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(25),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(25),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(25),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(25),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI26_WRCLK_posedge,
        TimingData     => Tmkr_DI26_WRCLK_posedge,
        TestSignal     => DI_dly(26),
        TestSignalName => "DI(26)",
        TestDelay      => tisd_DI_WRCLK(26),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(26),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(26),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(26),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(26),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI27_WRCLK_posedge,
        TimingData     => Tmkr_DI27_WRCLK_posedge,
        TestSignal     => DI_dly(27),
        TestSignalName => "DI(27)",
        TestDelay      => tisd_DI_WRCLK(27),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(27),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(27),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(27),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(27),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI28_WRCLK_posedge,
        TimingData     => Tmkr_DI28_WRCLK_posedge,
        TestSignal     => DI_dly(28),
        TestSignalName => "DI(28)",
        TestDelay      => tisd_DI_WRCLK(28),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(28),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(28),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(28),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(28),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI29_WRCLK_posedge,
        TimingData     => Tmkr_DI29_WRCLK_posedge,
        TestSignal     => DI_dly(29),
        TestSignalName => "DI(29)",
        TestDelay      => tisd_DI_WRCLK(29),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(29),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(29),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(29),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(29),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI30_WRCLK_posedge,
        TimingData     => Tmkr_DI30_WRCLK_posedge,
        TestSignal     => DI_dly(30),
        TestSignalName => "DI(30)",
        TestDelay      => tisd_DI_WRCLK(30),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(30),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(30),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(30),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(30),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI31_WRCLK_posedge,
        TimingData     => Tmkr_DI31_WRCLK_posedge,
        TestSignal     => DI_dly(31),
        TestSignalName => "DI(31)",
        TestDelay      => tisd_DI_WRCLK(31),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(31),
        SetupLow       => tsetup_DI_WRCLK_negedge_posedge(31),
        HoldLow        => thold_DI_WRCLK_negedge_posedge(31),
        HoldHigh       => thold_DI_WRCLK_posedge_posedge(31),
        CheckEnabled   => (TO_X01(wren_dly)    = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WREN_WRCLK_posedge,
        TimingData     => Tmkr_WREN_WRCLK_posedge,
        TestSignal     => WREN_dly,
        TestSignalName => "WREN",
        TestDelay      => tisd_WREN_WRCLK,
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WREN_WRCLK_posedge_posedge,
        SetupLow       => tsetup_WREN_WRCLK_negedge_posedge,
        HoldLow        => thold_WREN_WRCLK_negedge_posedge,
        HoldHigh       => thold_WREN_WRCLK_posedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WE0_WRCLK_posedge,
        TimingData     => Tmkr_WE0_WRCLK_posedge,
        TestSignal     => WE_dly(0),
        TestSignalName => "WE(0)",
        TestDelay      => tisd_WE_WRCLK(0),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WE_WRCLK_posedge_posedge(0),
        SetupLow       => tsetup_WE_WRCLK_negedge_posedge(0),
        HoldLow        => thold_WE_WRCLK_negedge_posedge(0),
        HoldHigh       => thold_WE_WRCLK_posedge_posedge(0),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WE1_WRCLK_posedge,
        TimingData     => Tmkr_WE1_WRCLK_posedge,
        TestSignal     => WE_dly(1),
        TestSignalName => "WE(1)",
        TestDelay      => tisd_WE_WRCLK(1),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WE_WRCLK_posedge_posedge(1),
        SetupLow       => tsetup_WE_WRCLK_negedge_posedge(1),
        HoldLow        => thold_WE_WRCLK_negedge_posedge(1),
        HoldHigh       => thold_WE_WRCLK_posedge_posedge(1),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WE2_WRCLK_posedge,
        TimingData     => Tmkr_WE2_WRCLK_posedge,
        TestSignal     => WE_dly(2),
        TestSignalName => "WE(2)",
        TestDelay      => tisd_WE_WRCLK(2),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WE_WRCLK_posedge_posedge(2),
        SetupLow       => tsetup_WE_WRCLK_negedge_posedge(2),
        HoldLow        => thold_WE_WRCLK_negedge_posedge(2),
        HoldHigh       => thold_WE_WRCLK_posedge_posedge(2),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WE3_WRCLK_posedge,
        TimingData     => Tmkr_WE3_WRCLK_posedge,
        TestSignal     => WE_dly(3),
        TestSignalName => "WE(3)",
        TestDelay      => tisd_WE_WRCLK(3),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WE_WRCLK_posedge_posedge(3),
        SetupLow       => tsetup_WE_WRCLK_negedge_posedge(3),
        HoldLow        => thold_WE_WRCLK_negedge_posedge(3),
        HoldHigh       => thold_WE_WRCLK_posedge_posedge(3),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WRADDR0_WRCLK_posedge,
        TimingData     => Tmkr_WRADDR0_WRCLK_posedge,
        TestSignal     => WRADDR_dly(0),
        TestSignalName => "WRADDR(0)",
        TestDelay      => tisd_WRADDR_WRCLK(0),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WRADDR_WRCLK_posedge_posedge(0),
        SetupLow       => tsetup_WRADDR_WRCLK_negedge_posedge(0),
        HoldLow        => thold_WRADDR_WRCLK_negedge_posedge(0),
        HoldHigh       => thold_WRADDR_WRCLK_posedge_posedge(0),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WRADDR1_WRCLK_posedge,
        TimingData     => Tmkr_WRADDR1_WRCLK_posedge,
        TestSignal     => WRADDR_dly(1),
        TestSignalName => "WRADDR(1)",
        TestDelay      => tisd_WRADDR_WRCLK(1),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WRADDR_WRCLK_posedge_posedge(1),
        SetupLow       => tsetup_WRADDR_WRCLK_negedge_posedge(1),
        HoldLow        => thold_WRADDR_WRCLK_negedge_posedge(1),
        HoldHigh       => thold_WRADDR_WRCLK_posedge_posedge(1),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WRADDR2_WRCLK_posedge,
        TimingData     => Tmkr_WRADDR2_WRCLK_posedge,
        TestSignal     => WRADDR_dly(2),
        TestSignalName => "WRADDR(2)",
        TestDelay      => tisd_WRADDR_WRCLK(2),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WRADDR_WRCLK_posedge_posedge(2),
        SetupLow       => tsetup_WRADDR_WRCLK_negedge_posedge(2),
        HoldLow        => thold_WRADDR_WRCLK_negedge_posedge(2),
        HoldHigh       => thold_WRADDR_WRCLK_posedge_posedge(2),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WRADDR3_WRCLK_posedge,
        TimingData     => Tmkr_WRADDR3_WRCLK_posedge,
        TestSignal     => WRADDR_dly(3),
        TestSignalName => "WRADDR(3)",
        TestDelay      => tisd_WRADDR_WRCLK(3),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WRADDR_WRCLK_posedge_posedge(3),
        SetupLow       => tsetup_WRADDR_WRCLK_negedge_posedge(3),
        HoldLow        => thold_WRADDR_WRCLK_negedge_posedge(3),
        HoldHigh       => thold_WRADDR_WRCLK_posedge_posedge(3),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WRADDR4_WRCLK_posedge,
        TimingData     => Tmkr_WRADDR4_WRCLK_posedge,
        TestSignal     => WRADDR_dly(4),
        TestSignalName => "WRADDR(4)",
        TestDelay      => tisd_WRADDR_WRCLK(4),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WRADDR_WRCLK_posedge_posedge(4),
        SetupLow       => tsetup_WRADDR_WRCLK_negedge_posedge(4),
        HoldLow        => thold_WRADDR_WRCLK_negedge_posedge(4),
        HoldHigh       => thold_WRADDR_WRCLK_posedge_posedge(4),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WRADDR5_WRCLK_posedge,
        TimingData     => Tmkr_WRADDR5_WRCLK_posedge,
        TestSignal     => WRADDR_dly(5),
        TestSignalName => "WRADDR(5)",
        TestDelay      => tisd_WRADDR_WRCLK(5),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WRADDR_WRCLK_posedge_posedge(5),
        SetupLow       => tsetup_WRADDR_WRCLK_negedge_posedge(5),
        HoldLow        => thold_WRADDR_WRCLK_negedge_posedge(5),
        HoldHigh       => thold_WRADDR_WRCLK_posedge_posedge(5),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WRADDR6_WRCLK_posedge,
        TimingData     => Tmkr_WRADDR6_WRCLK_posedge,
        TestSignal     => WRADDR_dly(6),
        TestSignalName => "WRADDR(6)",
        TestDelay      => tisd_WRADDR_WRCLK(6),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WRADDR_WRCLK_posedge_posedge(6),
        SetupLow       => tsetup_WRADDR_WRCLK_negedge_posedge(6),
        HoldLow        => thold_WRADDR_WRCLK_negedge_posedge(6),
        HoldHigh       => thold_WRADDR_WRCLK_posedge_posedge(6),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WRADDR7_WRCLK_posedge,
        TimingData     => Tmkr_WRADDR7_WRCLK_posedge,
        TestSignal     => WRADDR_dly(7),
        TestSignalName => "WRADDR(7)",
        TestDelay      => tisd_WRADDR_WRCLK(7),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WRADDR_WRCLK_posedge_posedge(7),
        SetupLow       => tsetup_WRADDR_WRCLK_negedge_posedge(7),
        HoldLow        => thold_WRADDR_WRCLK_negedge_posedge(7),
        HoldHigh       => thold_WRADDR_WRCLK_posedge_posedge(7),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WRADDR8_WRCLK_posedge,
        TimingData     => Tmkr_WRADDR8_WRCLK_posedge,
        TestSignal     => WRADDR_dly(8),
        TestSignalName => "WRADDR(8)",
        TestDelay      => tisd_WRADDR_WRCLK(8),
        RefSignal      => WRCLK_dly,
        RefSignalName  => "WRCLK",
        RefDelay       => ticd_WRCLK,
        SetupHigh      => tsetup_WRADDR_WRCLK_posedge_posedge(8),
        SetupLow       => tsetup_WRADDR_WRCLK_negedge_posedge(8),
        HoldLow        => thold_WRADDR_WRCLK_negedge_posedge(8),
        HoldHigh       => thold_WRADDR_WRCLK_posedge_posedge(8),
        CheckEnabled   => TO_X01(wren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_RDCLK,
        PeriodData     => PInfo_RDCLK,
        TestSignal     => RDCLK_dly,
        TestSignalName => "RDCLK",
        TestDelay      => 0 ps,
        Period         => tperiod_rdclk_posedge,
        PulseWidthHigh => tpw_RDCLK_posedge,
        PulseWidthLow  => tpw_RDCLK_negedge,
        CheckEnabled   => TO_X01(rden_dly) = '1',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_WRCLK,
        PeriodData     => PInfo_WRCLK,
        TestSignal     => WRCLK_dly,
        TestSignalName => "WRCLK",
        TestDelay      => 0 ps,
        Period         => tperiod_wrclk_posedge,
        PulseWidthHigh => tpw_WRCLK_posedge,
        PulseWidthLow  => tpw_WRCLK_negedge,
        CheckEnabled   => TO_X01(wren_dly) = '1',
        HeaderMsg      => "/X_RAMB18SDP",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
    end if;

    Violation         <=
      Tviol_RDADDR0_RDCLK_posedge or
      Tviol_RDADDR1_RDCLK_posedge or
      Tviol_RDADDR2_RDCLK_posedge or
      Tviol_RDADDR3_RDCLK_posedge or
      Tviol_RDADDR4_RDCLK_posedge or
      Tviol_RDADDR5_RDCLK_posedge or
      Tviol_RDADDR6_RDCLK_posedge or
      Tviol_RDADDR7_RDCLK_posedge or
      Tviol_RDADDR8_RDCLK_posedge or
      Tviol_RDEN_RDCLK_posedge or
      Tviol_REGCE_RDCLK_posedge or
      Tviol_SSR_RDCLK_posedge or
      Pviol_RDCLK or
      Tviol_WRADDR0_WRCLK_posedge or
      Tviol_WRADDR1_WRCLK_posedge or
      Tviol_WRADDR2_WRCLK_posedge or
      Tviol_WRADDR3_WRCLK_posedge or
      Tviol_WRADDR4_WRCLK_posedge or
      Tviol_WRADDR5_WRCLK_posedge or
      Tviol_WRADDR6_WRCLK_posedge or
      Tviol_WRADDR7_WRCLK_posedge or
      Tviol_WRADDR8_WRCLK_posedge or
      Tviol_DI0_WRCLK_posedge or
      Tviol_DI1_WRCLK_posedge or
      Tviol_DI2_WRCLK_posedge or
      Tviol_DI3_WRCLK_posedge or
      Tviol_DI4_WRCLK_posedge or
      Tviol_DI5_WRCLK_posedge or
      Tviol_DI6_WRCLK_posedge or
      Tviol_DI7_WRCLK_posedge or
      Tviol_DI8_WRCLK_posedge or
      Tviol_DI9_WRCLK_posedge or
      Tviol_DI10_WRCLK_posedge or
      Tviol_DI11_WRCLK_posedge or
      Tviol_DI12_WRCLK_posedge or
      Tviol_DI13_WRCLK_posedge or
      Tviol_DI14_WRCLK_posedge or
      Tviol_DI15_WRCLK_posedge or
      Tviol_DI16_WRCLK_posedge or
      Tviol_DI17_WRCLK_posedge or
      Tviol_DI18_WRCLK_posedge or
      Tviol_DI19_WRCLK_posedge or
      Tviol_DI20_WRCLK_posedge or
      Tviol_DI21_WRCLK_posedge or
      Tviol_DI22_WRCLK_posedge or
      Tviol_DI23_WRCLK_posedge or
      Tviol_DI24_WRCLK_posedge or
      Tviol_DI25_WRCLK_posedge or
      Tviol_DI26_WRCLK_posedge or
      Tviol_DI27_WRCLK_posedge or
      Tviol_DI28_WRCLK_posedge or
      Tviol_DI29_WRCLK_posedge or
      Tviol_DI30_WRCLK_posedge or
      Tviol_DI31_WRCLK_posedge or
      Tviol_DIP0_WRCLK_posedge or
      Tviol_DIP1_WRCLK_posedge or
      Tviol_DIP2_WRCLK_posedge or
      Tviol_DIP3_WRCLK_posedge or
      Tviol_WREN_WRCLK_posedge or
      Tviol_WE0_WRCLK_posedge or
      Tviol_WE1_WRCLK_posedge or
      Tviol_WE2_WRCLK_posedge or
      Tviol_WE3_WRCLK_posedge or
      Pviol_WRCLK;

    
    if (Tviol_RDADDR0_RDCLK_posedge = 'X') then
      	prcd_warn_msg ("RDADDR(0)", "RDCLK");
    end if;

    if (Tviol_RDADDR1_RDCLK_posedge = 'X') then
      	prcd_warn_msg ("RDADDR(1)", "RDCLK");
    end if;

    if (Tviol_RDADDR2_RDCLK_posedge = 'X') then
      	prcd_warn_msg ("RDADDR(2)", "RDCLK");
    end if;

    if (Tviol_RDADDR3_RDCLK_posedge = 'X') then
      	prcd_warn_msg ("RDADDR(3)", "RDCLK");
    end if;

    if (Tviol_RDADDR4_RDCLK_posedge = 'X') then
      	prcd_warn_msg ("RDADDR(4)", "RDCLK");
    end if;

    if (Tviol_RDADDR5_RDCLK_posedge = 'X') then
      	prcd_warn_msg ("RDADDR(5)", "RDCLK");
    end if;

    if (Tviol_RDADDR6_RDCLK_posedge = 'X') then
      	prcd_warn_msg ("RDADDR(6)", "RDCLK");
    end if;

    if (Tviol_RDADDR7_RDCLK_posedge = 'X') then
      	prcd_warn_msg ("RDADDR(7)", "RDCLK");
    end if;

    if (Tviol_RDADDR8_RDCLK_posedge = 'X') then
      	prcd_warn_msg ("RDADDR(8)", "RDCLK");
    end if;


    if (Tviol_WRADDR0_WRCLK_posedge = 'X') then
      	prcd_warn_msg ("WRADDR(0)", "WRCLK");
    end if;

    if (Tviol_WRADDR1_WRCLK_posedge = 'X') then
      	prcd_warn_msg ("WRADDR(1)", "WRCLK");
    end if;

    if (Tviol_WRADDR2_WRCLK_posedge = 'X') then
      	prcd_warn_msg ("WRADDR(2)", "WRCLK");
    end if;

    if (Tviol_WRADDR3_WRCLK_posedge = 'X') then
      	prcd_warn_msg ("WRADDR(3)", "WRCLK");
    end if;

    if (Tviol_WRADDR4_WRCLK_posedge = 'X') then
      	prcd_warn_msg ("WRADDR(4)", "WRCLK");
    end if;

    if (Tviol_WRADDR5_WRCLK_posedge = 'X') then
      	prcd_warn_msg ("WRADDR(5)", "WRCLK");
    end if;

    if (Tviol_WRADDR6_WRCLK_posedge = 'X') then
      	prcd_warn_msg ("WRADDR(6)", "WRCLK");
    end if;

    if (Tviol_WRADDR7_WRCLK_posedge = 'X') then
      	prcd_warn_msg ("WRADDR(7)", "WRCLK");
    end if;

    if (Tviol_WRADDR8_WRCLK_posedge = 'X') then
      	prcd_warn_msg ("WRADDR(8)", "WRCLK");
    end if;

    
      wait on RDADDR_dly, WRADDR_dly, RDCLK_dly, WRCLK_dly, DI_dly, DIP_dly, RDEN_dly, WREN_dly, SSR_dly, WE_dly;
      
  end process;

-------------------------------------------------------------------------------
-- End Timing check
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Path delay
-------------------------------------------------------------------------------
   prcs_output:process (DO_zd, DOP_zd)

    variable rden_dly   : std_ulogic                      := 'X';

    variable DO_GlitchData0  : VitalGlitchDataType;
    variable DO_GlitchData1  : VitalGlitchDataType;
    variable DO_GlitchData2  : VitalGlitchDataType;
    variable DO_GlitchData3  : VitalGlitchDataType;
    variable DO_GlitchData4  : VitalGlitchDataType;
    variable DO_GlitchData5  : VitalGlitchDataType;
    variable DO_GlitchData6  : VitalGlitchDataType;
    variable DO_GlitchData7  : VitalGlitchDataType;
    variable DO_GlitchData8  : VitalGlitchDataType;
    variable DO_GlitchData9  : VitalGlitchDataType;
    variable DO_GlitchData10  : VitalGlitchDataType;
    variable DO_GlitchData11  : VitalGlitchDataType;
    variable DO_GlitchData12  : VitalGlitchDataType;
    variable DO_GlitchData13  : VitalGlitchDataType;
    variable DO_GlitchData14  : VitalGlitchDataType;
    variable DO_GlitchData15  : VitalGlitchDataType;
    variable DO_GlitchData16  : VitalGlitchDataType;
    variable DO_GlitchData17  : VitalGlitchDataType;
    variable DO_GlitchData18  : VitalGlitchDataType;
    variable DO_GlitchData19  : VitalGlitchDataType;
    variable DO_GlitchData20  : VitalGlitchDataType;
    variable DO_GlitchData21  : VitalGlitchDataType;
    variable DO_GlitchData22  : VitalGlitchDataType;
    variable DO_GlitchData23  : VitalGlitchDataType;
    variable DO_GlitchData24  : VitalGlitchDataType;
    variable DO_GlitchData25  : VitalGlitchDataType;
    variable DO_GlitchData26  : VitalGlitchDataType;
    variable DO_GlitchData27  : VitalGlitchDataType;
    variable DO_GlitchData28  : VitalGlitchDataType;
    variable DO_GlitchData29  : VitalGlitchDataType;
    variable DO_GlitchData30  : VitalGlitchDataType;
    variable DO_GlitchData31  : VitalGlitchDataType;
    variable DOP_GlitchData0 : VitalGlitchDataType;
    variable DOP_GlitchData1 : VitalGlitchDataType;
    variable DOP_GlitchData2 : VitalGlitchDataType;
    variable DOP_GlitchData3 : VitalGlitchDataType;
    variable DO_viol     : std_logic_vector(MAX_DI downto 0);
    variable DOP_viol    : std_logic_vector(MAX_DIP downto 0);
    
 begin

    DO_viol(0)  := Violation xor DO_zd(0);
    DO_viol(1)  := Violation xor DO_zd(1);
    DO_viol(2)  := Violation xor DO_zd(2);
    DO_viol(3)  := Violation xor DO_zd(3);
    DO_viol(4)  := Violation xor DO_zd(4);
    DO_viol(5)  := Violation xor DO_zd(5);
    DO_viol(6)  := Violation xor DO_zd(6);
    DO_viol(7)  := Violation xor DO_zd(7);
    DO_viol(8)  := Violation xor DO_zd(8);
    DO_viol(9)  := Violation xor DO_zd(9);
    DO_viol(10) := Violation xor DO_zd(10);
    DO_viol(11) := Violation xor DO_zd(11);
    DO_viol(12) := Violation xor DO_zd(12);
    DO_viol(13) := Violation xor DO_zd(13);
    DO_viol(14) := Violation xor DO_zd(14);
    DO_viol(15) := Violation xor DO_zd(15);
    DO_viol(16) := Violation xor DO_zd(16);
    DO_viol(17) := Violation xor DO_zd(17);
    DO_viol(18) := Violation xor DO_zd(18);
    DO_viol(19) := Violation xor DO_zd(19);
    DO_viol(20) := Violation xor DO_zd(20);
    DO_viol(21) := Violation xor DO_zd(21);
    DO_viol(22) := Violation xor DO_zd(22);
    DO_viol(23) := Violation xor DO_zd(23);
    DO_viol(24) := Violation xor DO_zd(24);
    DO_viol(25) := Violation xor DO_zd(25);
    DO_viol(26) := Violation xor DO_zd(26);
    DO_viol(27) := Violation xor DO_zd(27);
    DO_viol(28) := Violation xor DO_zd(28);
    DO_viol(29) := Violation xor DO_zd(29);
    DO_viol(30) := Violation xor DO_zd(30);
    DO_viol(31) := Violation xor DO_zd(31);
    
    DOP_viol(0) := Violation xor DOP_zd(0);
    DOP_viol(1) := Violation xor DOP_zd(1);
    DOP_viol(2) := Violation xor DOP_zd(2);
    DOP_viol(3) := Violation xor DOP_zd(3);

    rden_dly   := RDEN_dly;

    VitalPathDelay01 (
      OutSignal     => DO(0),
      GlitchData    => DO_GlitchData0,
      OutSignalName => "DO(0)",
      OutTemp       => DO_viol(0),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(0), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(1),
      GlitchData    => DO_GlitchData1,
      OutSignalName => "DO(1)",
      OutTemp       => DO_viol(1),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(1), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(2),
      GlitchData    => DO_GlitchData2,
      OutSignalName => "DO(2)",
      OutTemp       => DO_viol(2),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(2), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(3),
      GlitchData    => DO_GlitchData3,
      OutSignalName => "DO(3)",
      OutTemp       => DO_viol(3),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(3), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(4),
      GlitchData    => DO_GlitchData4,
      OutSignalName => "DO(4)",
      OutTemp       => DO_viol(4),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(4), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(5),
      GlitchData    => DO_GlitchData5,
      OutSignalName => "DO(5)",
      OutTemp       => DO_viol(5),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(5), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(6),
      GlitchData    => DO_GlitchData6,
      OutSignalName => "DO(6)",
      OutTemp       => DO_viol(6),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(6), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(7),
      GlitchData    => DO_GlitchData7,
      OutSignalName => "DO(7)",
      OutTemp       => DO_viol(7),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(7), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(8),
      GlitchData    => DO_GlitchData8,
      OutSignalName => "DO(8)",
      OutTemp       => DO_viol(8),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(8), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(9),
      GlitchData    => DO_GlitchData9,
      OutSignalName => "DO(9)",
      OutTemp       => DO_viol(9),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(9), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(10),
      GlitchData    => DO_GlitchData10,
      OutSignalName => "DO(10)",
      OutTemp       => DO_viol(10),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(10), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(11),
      GlitchData    => DO_GlitchData11,
      OutSignalName => "DO(11)",
      OutTemp       => DO_viol(11),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(11), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(12),
      GlitchData    => DO_GlitchData12,
      OutSignalName => "DO(12)",
      OutTemp       => DO_viol(12),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(12), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(13),
      GlitchData    => DO_GlitchData13,
      OutSignalName => "DO(13)",
      OutTemp       => DO_viol(13),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(13), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(14),
      GlitchData    => DO_GlitchData14,
      OutSignalName => "DO(14)",
      OutTemp       => DO_viol(14),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(14), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(15),
      GlitchData    => DO_GlitchData15,
      OutSignalName => "DO(15)",
      OutTemp       => DO_viol(15),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(15), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(16),
      GlitchData    => DO_GlitchData16,
      OutSignalName => "DO(16)",
      OutTemp       => DO_viol(16),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(16), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(17),
      GlitchData    => DO_GlitchData17,
      OutSignalName => "DO(17)",
      OutTemp       => DO_viol(17),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(17), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(18),
      GlitchData    => DO_GlitchData18,
      OutSignalName => "DO(18)",
      OutTemp       => DO_viol(18),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(18), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(19),
      GlitchData    => DO_GlitchData19,
      OutSignalName => "DO(19)",
      OutTemp       => DO_viol(19),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(19), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(20),
      GlitchData    => DO_GlitchData20,
      OutSignalName => "DO(20)",
      OutTemp       => DO_viol(20),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(20), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(21),
      GlitchData    => DO_GlitchData21,
      OutSignalName => "DO(21)",
      OutTemp       => DO_viol(21),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(21), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(22),
      GlitchData    => DO_GlitchData22,
      OutSignalName => "DO(22)",
      OutTemp       => DO_viol(22),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(22), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(23),
      GlitchData    => DO_GlitchData23,
      OutSignalName => "DO(23)",
      OutTemp       => DO_viol(23),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(23), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(24),
      GlitchData    => DO_GlitchData24,
      OutSignalName => "DO(24)",
      OutTemp       => DO_viol(24),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(24), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(25),
      GlitchData    => DO_GlitchData25,
      OutSignalName => "DO(25)",
      OutTemp       => DO_viol(25),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(25), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(26),
      GlitchData    => DO_GlitchData26,
      OutSignalName => "DO(26)",
      OutTemp       => DO_viol(26),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(26), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(27),
      GlitchData    => DO_GlitchData27,
      OutSignalName => "DO(27)",
      OutTemp       => DO_viol(27),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(27), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(28),
      GlitchData    => DO_GlitchData28,
      OutSignalName => "DO(28)",
      OutTemp       => DO_viol(28),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(28), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(29),
      GlitchData    => DO_GlitchData29,
      OutSignalName => "DO(29)",
      OutTemp       => DO_viol(29),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(29), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(30),
      GlitchData    => DO_GlitchData30,
      OutSignalName => "DO(30)",
      OutTemp       => DO_viol(30),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(30), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(31),
      GlitchData    => DO_GlitchData31,
      OutSignalName => "DO(31)",
      OutTemp       => DO_viol(31),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(31), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOP(0),
      GlitchData    => DOP_GlitchData0,
      OutSignalName => "DOP(0)",
      OutTemp       => DOP_viol(0),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(0), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOP(1),
      GlitchData    => DOP_GlitchData1,
      OutSignalName => "DOP(1)",
      OutTemp       => DOP_viol(1),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(1), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOP(2),
      GlitchData    => DOP_GlitchData2,
      OutSignalName => "DOP(2)",
      OutTemp       => DOP_viol(2),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(2), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOP(3),
      GlitchData    => DOP_GlitchData3,
      OutSignalName => "DOP(3)",
      OutTemp       => DOP_viol(3),
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(3), (rden_dly /= '0' and GSR_RDCLK_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

 end process prcs_output;
---------------------------------------------------------------------------
-- End Path delay
---------------------------------------------------------------------------

end X_RAMB18SDP_V;
