-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/stan/VITAL/X_RAMB8BWER.vhd,v 1.21 2011/08/04 18:31:51 wloo Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2005 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component 8K-Bit Data
--  /   /                       and 1K-Bit Parity Dual Port Block RAM
-- /___/   /\     Filename : X_RAMB8BWER.vhd
-- \   \  /  \    Timestamp : Thu May  1 16:42:27 PDT 2008
--  \___\/\___\
--
-- Revision:
--    05/01/08 - Initial version.
--    09/15/08 - Updated File open function to impure. (CR 478698)
--    11/19/08 - Fixed EN_RSTRAM_A/B = FALSE. (IR 497199)
--    12/10/08 - Fixed REGCE in output register (IR 499078). Fixed problem caused by IR 497199.
--    12/18/08 - Fixed write when async reset is asserted (IR 494418).
--    01/26/09 - Update reset behavior (IR 500935).
--    02/10/09 - Fixed regce behavior (IR 507042).
--    03/10/09 - X's the unused bits of outputs (CR 511363).
--    08/20/09 - Fixed address checking for collision (CR 529759).
--    02/25/10 - Added DRC of DATA_WIDTH_A/B = 36 is required for SDP mode (CR 550329).
--    03/15/10 - Updated address collision for asynchronous clocks and read first mode (CR 547447).
--             - Fixed DRC for SDP mode (CR 552920).
--    03/18/10 - Removed INIT_FILE support (CR 553511).
--    06/17/10 - Added WRITE_FIRST support in SDP mode.
--    07/13/10 - Initialized memory to zero for INIT_FILE (CR 560672).
--    09/30/10 - Updated address overlap for read first mode (CR 566026).
--    08/04/11 - Change RST_PRIORITY default to CE (CR 618583).
-- End Revision

----- CELL X_RAMB8BWER -----

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
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;


entity X_RAMB8BWER is

  generic (

    TimingChecksOn : boolean := true;
    InstancePath   : string  := "*";
    Xon            : boolean := true;
    MsgOn          : boolean := true;

    DATA_WIDTH_A : integer := 0;
    DATA_WIDTH_B : integer := 0;
    DOA_REG : integer := 0;
    DOB_REG : integer := 0;
    EN_RSTRAM_A : boolean := TRUE;
    EN_RSTRAM_B : boolean := TRUE;
    INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
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
    INIT_A : bit_vector := X"00000";
    INIT_B : bit_vector := X"00000";
    INIT_FILE : string := "NONE";
    LOC : string := "UNPLACED";
    RAM_MODE : string := "TDP";
    RSTTYPE  : string := "SYNC";
    RST_PRIORITY_A : string := "CE";
    RST_PRIORITY_B : string := "CE";
    SETUP_ALL : time := 1000 ps;
    SETUP_READ_FIRST : time := 3000 ps;
    SIM_COLLISION_CHECK : string := "ALL";
    SRVAL_A : bit_vector := X"00000";
    SRVAL_B : bit_vector := X"00000";
    WRITE_MODE_A : string := "WRITE_FIRST";
    WRITE_MODE_B : string := "WRITE_FIRST";


--- VITAL input wire delays

    tipd_ADDRAWRADDR : VitalDelayArrayType01 (12 downto 0) := (others => (0 ps, 0 ps));
    tipd_ADDRBRDADDR : VitalDelayArrayType01 (12 downto 0) := (others => (0 ps, 0 ps));
    tipd_CLKAWRCLK : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_CLKBRDCLK : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_DIADI : VitalDelayArrayType01 (15 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIBDI : VitalDelayArrayType01 (15 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIPADIP : VitalDelayArrayType01 (1 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIPBDIP : VitalDelayArrayType01 (1 downto 0) := (others => (0 ps, 0 ps));
    tipd_ENAWREN : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_ENBRDEN : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_REGCEA : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_REGCEBREGCE : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_RSTA : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_RSTBRST : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_WEAWEL : VitalDelayArrayType01 (1 downto 0) := (others => (0 ps, 0 ps));
    tipd_WEBWEU : VitalDelayArrayType01 (1 downto 0) := (others => (0 ps, 0 ps));
      

--- VITAL pin-to-pin propagation delays

    tpd_CLKAWRCLK_DOADO : VitalDelayArrayType01(15 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKAWRCLK_DOPADOP : VitalDelayArrayType01(1 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKBRDCLK_DOADO : VitalDelayArrayType01(15 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKBRDCLK_DOBDO : VitalDelayArrayType01(15 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKBRDCLK_DOPADOP : VitalDelayArrayType01(1 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKBRDCLK_DOPBDOP : VitalDelayArrayType01(1 downto 0) := (others => (100 ps, 100 ps));
    tpd_RSTA_DOADO : VitalDelayArrayType01(15 downto 0) := (others => (0 ps, 0 ps));
    tpd_RSTA_DOPADOP : VitalDelayArrayType01(1 downto 0) := (others => (0 ps, 0 ps));
    tpd_RSTBRST_DOADO : VitalDelayArrayType01(15 downto 0) := (others => (0 ps, 0 ps));
    tpd_RSTBRST_DOBDO : VitalDelayArrayType01(15 downto 0) := (others => (0 ps, 0 ps));
    tpd_RSTBRST_DOPADOP : VitalDelayArrayType01(1 downto 0) := (others => (0 ps, 0 ps));
    tpd_RSTBRST_DOPBDOP : VitalDelayArrayType01(1 downto 0) := (others => (0 ps, 0 ps));
      
--- VITAL recovery time 
    trecovery_RSTBRST_CLKBRDCLK_negedge_posedge : VitalDelayType := 0 ps;
    trecovery_RSTA_CLKAWRCLK_negedge_posedge : VitalDelayType := 0 ps;

----- VITAL removal time
    tremoval_RSTBRST_CLKBRDCLK_negedge_posedge : VitalDelayType := 0 ps;
    tremoval_RSTA_CLKAWRCLK_negedge_posedge : VitalDelayType := 0 ps;

--- VITAL setup time 

    tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ps);
    tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ps);
    tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ps);
    tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ps);
    tsetup_DIADI_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIADI_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIBDI_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIBDI_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIBDI_CLKBRDCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIBDI_CLKBRDCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tsetup_DIPADIP_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_DIPADIP_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_DIPBDIP_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_DIPBDIP_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_DIPBDIP_CLKBRDCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_DIPBDIP_CLKBRDCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_ENAWREN_CLKAWRCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_ENAWREN_CLKAWRCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_ENBRDEN_CLKBRDCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_ENBRDEN_CLKBRDCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_REGCEA_CLKAWRCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_REGCEA_CLKAWRCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_REGCEBREGCE_CLKBRDCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_REGCEBREGCE_CLKBRDCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_RSTA_CLKAWRCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_RSTA_CLKAWRCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_RSTBRST_CLKBRDCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_RSTBRST_CLKBRDCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_WEAWEL_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_WEAWEL_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_WEBWEU_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_WEBWEU_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_WEBWEU_CLKBRDCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_WEBWEU_CLKBRDCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);

    
--- VITAL hold time 

    thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ps);
    thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ps);
    thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ps);
    thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge : VitalDelayArrayType(12 downto 0) := (others => 0 ps);
    thold_DIADI_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIADI_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIBDI_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIBDI_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIBDI_CLKBRDCLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIBDI_CLKBRDCLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    thold_DIPADIP_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_DIPADIP_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_DIPBDIP_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_DIPBDIP_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_DIPBDIP_CLKBRDCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_DIPBDIP_CLKBRDCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_ENAWREN_CLKAWRCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_ENAWREN_CLKAWRCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_ENBRDEN_CLKBRDCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_ENBRDEN_CLKBRDCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_REGCEA_CLKAWRCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_REGCEA_CLKAWRCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_REGCEBREGCE_CLKBRDCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_REGCEBREGCE_CLKBRDCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_RSTA_CLKAWRCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_RSTA_CLKAWRCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_RSTBRST_CLKBRDCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_RSTBRST_CLKBRDCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_WEAWEL_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_WEAWEL_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_WEBWEU_CLKAWRCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_WEBWEU_CLKAWRCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_WEBWEU_CLKBRDCLK_negedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_WEBWEU_CLKBRDCLK_posedge_posedge : VitalDelayArrayType(1 downto 0) := (others => 0 ps);

    tisd_ADDRAWRADDR_CLKAWRCLK : VitalDelayArrayType(12 downto 0) := (others => 0 ps);
    tisd_ADDRBRDADDR_CLKBRDCLK : VitalDelayArrayType(12 downto 0) := (others => 0 ps);
    tisd_DIADI_CLKAWRCLK : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tisd_DIBDI_CLKAWRCLK : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tisd_DIBDI_CLKBRDCLK : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
    tisd_DIPADIP_CLKAWRCLK : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tisd_DIPBDIP_CLKAWRCLK : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tisd_DIPBDIP_CLKBRDCLK : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tisd_ENAWREN_CLKAWRCLK : VitalDelayType := 0 ps;
    tisd_ENBRDEN_CLKBRDCLK : VitalDelayType := 0 ps;
    tisd_REGCEA_CLKAWRCLK : VitalDelayType := 0 ps;
    tisd_REGCEBREGCE_CLKBRDCLK : VitalDelayType := 0 ps;
    tisd_RSTA_CLKAWRCLK : VitalDelayType := 0 ps;
    tisd_RSTBRST_CLKBRDCLK : VitalDelayType := 0 ps;
    tisd_WEAWEL_CLKAWRCLK : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tisd_WEBWEU_CLKAWRCLK : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tisd_WEBWEU_CLKBRDCLK : VitalDelayArrayType(1 downto 0) := (others => 0 ps);

    ticd_CLKAWRCLK : VitalDelayType := 0 ps;
    ticd_CLKBRDCLK : VitalDelayType := 0 ps;

    tperiod_CLKAWRCLK_posedge : VitalDelayType := 0 ps;
    tperiod_CLKBRDCLK_posedge : VitalDelayType := 0 ps;
    
    tpw_CLKAWRCLK_negedge : VitalDelayType := 0 ps;
    tpw_CLKAWRCLK_posedge : VitalDelayType := 0 ps;
    tpw_CLKBRDCLK_negedge : VitalDelayType := 0 ps;
    tpw_CLKBRDCLK_posedge : VitalDelayType := 0 ps
    
    );

  port (

    DOADO : out std_logic_vector(15 downto 0);
    DOBDO : out std_logic_vector(15 downto 0);
    DOPADOP : out std_logic_vector(1 downto 0);
    DOPBDOP : out std_logic_vector(1 downto 0);

    ADDRAWRADDR : in std_logic_vector(12 downto 0);
    ADDRBRDADDR : in std_logic_vector(12 downto 0);
    CLKAWRCLK : in std_ulogic;
    CLKBRDCLK : in std_ulogic;
    DIADI : in std_logic_vector(15 downto 0);
    DIBDI : in std_logic_vector(15 downto 0);
    DIPADIP : in std_logic_vector(1 downto 0);
    DIPBDIP : in std_logic_vector(1 downto 0);
    ENAWREN : in std_ulogic;
    ENBRDEN : in std_ulogic;
    REGCEA : in std_ulogic;
    REGCEBREGCE : in std_ulogic;
    RSTA : in std_ulogic;
    RSTBRST : in std_ulogic;
    WEAWEL : in std_logic_vector(1 downto 0);
    WEBWEU : in std_logic_vector(1 downto 0)

    );
  
    attribute VITAL_LEVEL0 of X_RAMB8BWER : entity is true;
  
end X_RAMB8BWER;

-- Architecture body --

architecture X_RAMB8BWER_V of X_RAMB8BWER is

  attribute VITAL_LEVEL0 of
    X_RAMB8BWER_V : architecture is true;
    
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
      when 1 => func_mem_depth := 8192;
      when 2 => func_mem_depth := 4096;
      when 4 => func_mem_depth := 2048;
      when 9 => func_mem_depth := 1024;
      when 18 => func_mem_depth := 512;
      when 36 => func_mem_depth := 256;
      when others => func_mem_depth := 8192;
    end case;
    return func_mem_depth;
  end;

  
  function GetMemoryDepthP (
    rdwr_width : in integer
    ) return integer is
    variable func_memp_depth : integer;
  begin
    case rdwr_width is
      when 9 => func_memp_depth := 1024;
      when 18 => func_memp_depth := 512;
      when 36 => func_memp_depth := 256;
      when others => func_memp_depth := 1024;
    end case;
    return func_memp_depth;
  end;

  
  function GetAddrbrdaddritLSB (
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

    
  function GetAddrbrdaddrit124 (
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

  
  function GetAddrbrdaddrit8 (
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

  
  function GetAddrbrdaddrit16 (
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

  
  function GetAddrbrdaddrit32 (
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


  function INIT_SRVAL_SDP (
    int_port : integer;
    data_width : integer;
    input_b : bit_vector(19 downto 0);
    input_a : bit_vector(19 downto 0))
    return std_logic_vector is variable out_init_srval_std : std_logic_vector(35 downto 0);
    variable out_init_srval : bit_vector(35 downto 0);
  begin

    if (RAM_MODE = "SDP" and data_width = 36) then
      out_init_srval := input_b(17 downto 16) & input_a(17 downto 16) & input_b(15 downto 0) & input_a(15 downto 0);
    else

      if (int_port = 0) then            -- 0 = port A, 1 = port B
        out_init_srval := "000000000000000000" & input_a(17 downto 0);
      else
        out_init_srval := "000000000000000000" & input_b(17 downto 0);
      end if;
        
    end if;

    out_init_srval_std := To_StdLogicVector(out_init_srval);
    
    return out_init_srval_std;  
                         
  end;

                               
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
  constant addrawraddr_lbit_124 : integer := GetAddrbrdaddritLSB(DATA_WIDTH_A);
  constant addrbrdaddr_lbit_124 : integer := GetAddrbrdaddritLSB(DATA_WIDTH_B);
  constant addrawraddr_bit_124 : integer := GetAddrbrdaddrit124(DATA_WIDTH_A, widest_width);
  constant addrbrdaddr_bit_124 : integer := GetAddrbrdaddrit124(DATA_WIDTH_B, widest_width);
  constant addrawraddr_bit_8 : integer := GetAddrbrdaddrit8(DATA_WIDTH_A, widest_width);
  constant addrbrdaddr_bit_8 : integer := GetAddrbrdaddrit8(DATA_WIDTH_B, widest_width);
  constant addrawraddr_bit_16 : integer := GetAddrbrdaddrit16(DATA_WIDTH_A, widest_width);
  constant addrbrdaddr_bit_16 : integer := GetAddrbrdaddrit16(DATA_WIDTH_B, widest_width);
  constant col_addr_lsb : integer := GetAddrbrdaddritLSB(widest_width);
  constant tmp_widthp : integer := GetWidthpTmpWidthp(widest_width);

  type Two_D_array_type_tmp_mem is array ((mem_depth -  1) downto 0) of std_logic_vector((widest_width - 1) downto 0);
    
  type Two_D_array_type is array ((mem_depth -  1) downto 0) of std_logic_vector((width - 1) downto 0);
  type Two_D_parity_array_type is array ((memp_depth - 1) downto 0) of std_logic_vector((widthp -1) downto 0);

  type Two_D_array_type_initf is array ((mem_depth -  1) downto 0) of std_logic_vector((width_initf - 1) downto 0);
  type Two_D_parity_array_type_initf is array ((memp_depth - 1) downto 0) of std_logic_vector((widthp_initf -1) downto 0);


  signal ADDRAWRADDR_dly    : std_logic_vector(15 downto 0) := (others => 'X');
  signal ADDRAWRADDR_int    : std_logic_vector(12 downto 0) := (others => 'X');
  signal CLKAWRCLK_dly     : std_ulogic                    := 'X';
  signal DIADI_dly      : std_logic_vector(63 downto 0) := (others => 'X');
  signal DIADI_int      : std_logic_vector(15 downto 0) := (others => 'X');
  signal DIPADIP_dly     : std_logic_vector(7 downto 0)  := (others => 'X');
  signal DIPADIP_int     : std_logic_vector(1 downto 0)  := (others => 'X');
  signal ENAWREN_dly      : std_ulogic                    := 'X';
  signal REGCEA_dly   : std_ulogic                    := 'X';
  signal RSTA_dly     : std_ulogic                    := 'X';
  signal WEAWEL_dly      : std_logic_vector(7 downto 0)  := (others => 'X');
  signal WEAWEL_int      : std_logic_vector(1 downto 0)  := (others => 'X');
  signal ADDRBRDADDR_dly    : std_logic_vector(15 downto 0) := (others => 'X');
  signal ADDRBRDADDR_int    : std_logic_vector(12 downto 0) := (others => 'X');
  signal CLKBRDCLK_dly     : std_ulogic                    := 'X';
  signal DIBDI_dly      : std_logic_vector(63 downto 0) := (others => 'X');
  signal DIBDI_int      : std_logic_vector(15 downto 0) := (others => 'X');
  signal DIPBDIP_dly     : std_logic_vector(7 downto 0)  := (others => 'X');
  signal DIPBDIP_int     : std_logic_vector(1 downto 0)  := (others => 'X');
  signal ENBRDEN_dly      : std_ulogic                    := 'X';
  signal REGCEBREGCE_dly   : std_ulogic                    := 'X';
  signal RSTBRST_dly     : std_ulogic                    := 'X';
  signal WEBWEU_dly      : std_logic_vector(7 downto 0)  := (others => 'X');
  signal WEBWEU_int      : std_logic_vector(1 downto 0)  := (others => 'X');
  signal ox_addra_reconstruct : std_logic_vector(12 downto 0) := (others => 'X');
  signal ox_addrb_reconstruct : std_logic_vector(12 downto 0) := (others => 'X');
  
  signal doado_out : std_logic_vector(63 downto 0) := (others => 'X');
  signal dopadop_out : std_logic_vector(7 downto 0) := (others => 'X');
  signal doado_outreg : std_logic_vector(63 downto 0) := (others => 'X');
  signal dopadop_outreg : std_logic_vector(7 downto 0) := (others => 'X');
  signal dobdo_outreg : std_logic_vector(63 downto 0) := (others => 'X');
  signal dopbdop_outreg : std_logic_vector(7 downto 0) := (others => 'X');
  signal dobdo_out : std_logic_vector(63 downto 0) := (others => 'X');
  signal dopbdop_out : std_logic_vector(7 downto 0) := (others => 'X');

  signal doado_out_out : std_logic_vector(63 downto 0) := (others => 'X');
  signal dopadop_out_out : std_logic_vector(7 downto 0) := (others => 'X');
  signal dobdo_out_out : std_logic_vector(63 downto 0) := (others => 'X');
  signal dopbdop_out_out : std_logic_vector(7 downto 0) := (others => 'X');    
  signal GSR_dly : std_ulogic := '0';
  signal di_x : std_logic_vector(63 downto 0) := (others => 'X');

  signal SRVAL_A_STD : std_logic_vector(35 downto 0) := INIT_SRVAL_SDP(0, DATA_WIDTH_A, SRVAL_B, SRVAL_A);
  signal INIT_A_STD : std_logic_vector(35 downto 0) := INIT_SRVAL_SDP(0, DATA_WIDTH_A ,INIT_B, INIT_A);
  signal SRVAL_B_STD : std_logic_vector(35 downto 0) := INIT_SRVAL_SDP(1, DATA_WIDTH_B, SRVAL_B, SRVAL_A);
  signal INIT_B_STD : std_logic_vector(35 downto 0) := INIT_SRVAL_SDP(1, DATA_WIDTH_B ,INIT_B, INIT_A);

  signal ViolationA        : std_ulogic                     := '0';
  signal ViolationB        : std_ulogic                     := '0';

  signal ADDRAWRADDR_ipd : std_logic_vector(12 downto 0);
  signal ADDRBRDADDR_ipd : std_logic_vector(12 downto 0);
  signal CLKAWRCLK_ipd : std_ulogic;
  signal CLKBRDCLK_ipd : std_ulogic;
  signal DIADI_ipd : std_logic_vector(15 downto 0);
  signal DIBDI_ipd : std_logic_vector(15 downto 0);
  signal DIPADIP_ipd : std_logic_vector(1 downto 0);
  signal DIPBDIP_ipd : std_logic_vector(1 downto 0);
  signal ENAWREN_ipd : std_ulogic;
  signal ENBRDEN_ipd : std_ulogic;
  signal REGCEA_ipd : std_ulogic;
  signal REGCEBREGCE_ipd : std_ulogic;
  signal RSTA_ipd : std_ulogic;
  signal RSTBRST_ipd : std_ulogic;
  signal WEAWEL_ipd : std_logic_vector(1 downto 0);
  signal WEBWEU_ipd : std_logic_vector(1 downto 0);

  
  function slv_to_two_D_array(
    slv_length : integer;
    slv_width : integer;
    SLV : in std_logic_vector
    )
    return two_D_array_type is
    variable two_D_array : two_D_array_type;
    variable intermediadite : std_logic_vector((slv_width - 1) downto 0);
  begin
    for i in 0 to (slv_length - 1) loop
      intermediadite := SLV(((i*slv_width) + (slv_width - 1)) downto (i* slv_width));
      two_D_array(i) := intermediadite; 
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
    variable intermediadite : std_logic_vector((slv_width - 1) downto 0);
  begin
    for i in 0 to (slv_length - 1)loop
      intermediadite := SLV(((i*slv_width) + (slv_width - 1)) downto (i* slv_width));
      two_D_parity_array(i) := intermediadite; 
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
    constant viol_time_tmp : in integer;
    constant weawel_tmp : in std_ulogic;
    constant webweu_tmp : in std_ulogic;
    constant addrawraddr_tmp : in std_logic_vector (15 downto 0);
    constant addrbrdaddr_tmp : in std_logic_vector (15 downto 0);
    variable col_wr_wr_msg : inout std_ulogic;
    variable col_wra_rdb_msg : inout std_ulogic;
    variable col_wrb_rda_msg : inout std_ulogic;
    variable chk_col_same_clk_tmp : inout integer;
    variable chk_ox_same_clk_tmp : inout integer;
    variable chk_ox_msg_tmp : inout integer
    ) is
    
    variable string_length_1 : integer;
    variable string_length_2 : integer;
    variable message : LINE;
    constant MsgSeverity : severity_level := Error;

  begin
    
    if (SIM_COLLISION_CHECK = "ALL" or SIM_COLLISION_CHECK = "WARNING_ONLY") then
    
      if ((addrawraddr_tmp'length mod 4) = 0) then
        string_length_1 := addrawraddr_tmp'length/4;
      elsif ((addrawraddr_tmp'length mod 4) > 0) then
        string_length_1 := addrawraddr_tmp'length/4 + 1;      
      end if;
      if ((addrbrdaddr_tmp'length mod 4) = 0) then
        string_length_2 := addrbrdaddr_tmp'length/4;
      elsif ((addrbrdaddr_tmp'length mod 4) > 0) then
        string_length_2 := addrbrdaddr_tmp'length/4 + 1;      
      end if;

      if (weawel_tmp = '1' and webweu_tmp = '1' and col_wr_wr_msg = '1') then

        if (chk_ox_msg_tmp = 1) then
          
          if (not(chk_ox_same_clk_tmp = 1)) then

            Write ( message, STRING'(" Address Overlap Error on X_RAMB8BWER :"));
            Write ( message, STRING'(X_RAMB8BWER'path_name));
            Write ( message, STRING'(" at simulation time "));
            Write ( message, now);
            Write ( message, STRING'("."));
            Write ( message, LF );
            Write ( message, STRING'(" A write was requested to the overlapped address simultaneously at both Port A and Port B of the RAM."));
            Write ( message, STRING'(" The contents written to the RAM at address location "));      
            Write ( message, SLV_X_TO_HEX(addrawraddr_tmp, string_length_1));
            Write ( message, STRING'(" (hex) "));            
            Write ( message, STRING'("of Port A and address location "));
            Write ( message, SLV_X_TO_HEX(addrbrdaddr_tmp, string_length_2));
            Write ( message, STRING'(" (hex) "));            
            Write ( message, STRING'("of Port B are unknown. "));
            ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
            DEALLOCATE (message);

          end if;

        else
          
          Write ( message, STRING'(" Memory Collision Error on X_RAMB8BWER :"));
          Write ( message, STRING'(X_RAMB8BWER'path_name));
          Write ( message, STRING'(" at simulation time "));
          Write ( message, now);
          Write ( message, STRING'("."));
          Write ( message, LF );
          Write ( message, STRING'(" A write was requested to the same address simultaneously at both Port A and Port B of the RAM."));
          Write ( message, STRING'(" The contents written to the RAM at address location "));      
          Write ( message, SLV_X_TO_HEX(addrawraddr_tmp, string_length_1));
          Write ( message, STRING'(" (hex) "));            
          Write ( message, STRING'("of Port A and address location "));
          Write ( message, SLV_X_TO_HEX(addrbrdaddr_tmp, string_length_2));
          Write ( message, STRING'(" (hex) "));            
          Write ( message, STRING'("of Port B are unknown. "));
          ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
          DEALLOCATE (message);

        end if;
        
        col_wr_wr_msg := '0';
        
      elsif (weawel_tmp = '1' and webweu_tmp = '0' and col_wra_rdb_msg = '1') then

        if (chk_ox_msg_tmp = 1) then

          if (not(chk_ox_same_clk_tmp = 1)) then

            Write ( message, STRING'(" Address Overlap Error on X_RAMB8BWER :"));
            Write ( message, STRING'(X_RAMB8BWER'path_name));
            Write ( message, STRING'(" at simulation time "));
            Write ( message, now);
            Write ( message, STRING'("."));
            Write ( message, LF );            
            Write ( message, STRING'(" A read was performed on address "));
            Write ( message, SLV_X_TO_HEX(addrbrdaddr_tmp, string_length_2));
            Write ( message, STRING'(" (hex) "));            
            Write ( message, STRING'("of port B while a write was requested to the overlapped address "));
            Write ( message, SLV_X_TO_HEX(addrawraddr_tmp, string_length_1));
            Write ( message, STRING'(" (hex) "));
            Write ( message, STRING'("of Port A. "));
            Write ( message, STRING'(" The write will be unsuccessful and the contents of the RAM at both address locations of port A and B became unknown. "));
            ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
            DEALLOCATE (message);

          end if;

        else

          if ((WRITE_MODE_A = "READ_FIRST" or WRITE_MODE_B = "READ_FIRST")
              and (not(chk_col_same_clk_tmp = 1))) then

            Write ( message, STRING'(" Memory Collision Error on X_RAMB8BWER :"));
            Write ( message, STRING'(X_RAMB8BWER'path_name));
            Write ( message, STRING'(" at simulation time "));
            Write ( message, now);
            Write ( message, STRING'("."));
            Write ( message, LF );            
            Write ( message, STRING'(" A read was performed on address "));
            Write ( message, SLV_X_TO_HEX(addrbrdaddr_tmp, string_length_2));
            Write ( message, STRING'(" (hex) "));            
            Write ( message, STRING'("of port B while a write was requested to the same address on Port A. "));
            Write ( message, STRING'(" The write will be unsuccessful and the contents of the RAM at both address locations of port A and B became unknown. "));
            ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
            DEALLOCATE (message);

          elsif (WRITE_MODE_A /= "READ_FIRST") then
            
            Write ( message, STRING'(" Memory Collision Error on X_RAMB8BWER :"));
            Write ( message, STRING'(X_RAMB8BWER'path_name));
            Write ( message, STRING'(" at simulation time "));
            Write ( message, now);
            Write ( message, STRING'("."));
            Write ( message, LF );            
            Write ( message, STRING'(" A read was performed on address "));
            Write ( message, SLV_X_TO_HEX(addrbrdaddr_tmp, string_length_2));
            Write ( message, STRING'(" (hex) "));            
            Write ( message, STRING'("of port B while a write was requested to the same address on Port A. "));
            Write ( message, STRING'(" The write will be successful however the read value on port B is unknown until the next CLKB cycle. "));
            ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
            DEALLOCATE (message);

          end if;

        end if;

        col_wra_rdb_msg := '0';
        
      elsif (weawel_tmp = '0' and webweu_tmp = '1' and col_wrb_rda_msg = '1') then

        if (chk_ox_msg_tmp = 1) then

          if (not(chk_ox_same_clk_tmp = 1)) then

            Write ( message, STRING'(" Address Overlap Error on X_RAMB8BWER :"));
            Write ( message, STRING'(X_RAMB8BWER'path_name));
            Write ( message, STRING'(" at simulation time "));
            Write ( message, now);
            Write ( message, STRING'("."));
            Write ( message, LF );            
            Write ( message, STRING'(" A read was performed on address "));
            Write ( message, SLV_X_TO_HEX(addrawraddr_tmp, string_length_1));
            Write ( message, STRING'(" (hex) "));            
            Write ( message, STRING'("of port A while a write was requested to the overlapped address "));
            Write ( message, SLV_X_TO_HEX(addrbrdaddr_tmp, string_length_2));
            Write ( message, STRING'(" (hex) "));
            Write ( message, STRING'("of Port B. "));
            Write ( message, STRING'(" The write will be unsuccessful and the contents of the RAM at both address locations of port A and B became unknown. "));
            ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
            DEALLOCATE (message);

          end if;

        else

          if ((WRITE_MODE_A = "READ_FIRST" or WRITE_MODE_B = "READ_FIRST")
              and (not(chk_col_same_clk_tmp = 1))) then

            Write ( message, STRING'(" Memory Collision Error on X_RAMB8BWER :"));
            Write ( message, STRING'(X_RAMB8BWER'path_name));
            Write ( message, STRING'(" at simulation time "));
            Write ( message, now);
            Write ( message, STRING'("."));
            Write ( message, LF );            
            Write ( message, STRING'(" A read was performed on address "));
            Write ( message, SLV_X_TO_HEX(addrawraddr_tmp, string_length_1));
            Write ( message, STRING'(" (hex) "));            
            Write ( message, STRING'("of port A while a write was requested to the same address on Port B. "));
            Write ( message, STRING'(" The write will be unsuccessful and the contents of the RAM at both address locations of port A and B became unknown. "));
            ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
            DEALLOCATE (message);

          elsif (WRITE_MODE_B /= "READ_FIRST") then
            
            Write ( message, STRING'(" Memory Collision Error on X_RAMB8BWER :"));
            Write ( message, STRING'(X_RAMB8BWER'path_name));
            Write ( message, STRING'(" at simulation time "));
            Write ( message, now);
            Write ( message, STRING'("."));
            Write ( message, LF );            
            Write ( message, STRING'(" A read was performed on address "));
            Write ( message, SLV_X_TO_HEX(addrawraddr_tmp, string_length_1));
            Write ( message, STRING'(" (hex) "));            
            Write ( message, STRING'("of port A while a write was requested to the same address on Port B. "));
            Write ( message, STRING'(" The write will be successful however the read value on port A is unknown until the next CLKB cycle. "));
            ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
            DEALLOCATE (message);

          end if;

        end if;

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


  procedure prcd_write_ram_ox (
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
          mem_proc_tmp(i) := di_tmp(i);
        end loop;

        if (width >= 8) then
          memp_proc := dip;
        end if;

      end if;
  end prcd_write_ram_ox;

  
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
    constant addrawraddr_tmp : in std_logic_vector (15 downto 0);
    variable doado_tmp : inout std_logic_vector (63 downto 0);
    variable dopadop_tmp : inout std_logic_vector (7 downto 0);
    constant mem : in Two_D_array_type;
    constant memp : in Two_D_parity_array_type     
    ) is
    variable prcd_tmp_addrawraddr_dly_depth : integer;
    variable prcd_tmp_addrawraddr_dly_width : integer;

  begin
    
    case a_width is

      when 1 | 2 | 4 => if (a_width >= width) then
                          prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_lbit_124));
                          doado_tmp(a_width-1 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth);
                        else
                          prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_124 + 1));
                          prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_124 downto addrawraddr_lbit_124));
                          doado_tmp(a_width-1 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * a_width) + a_width - 1 downto prcd_tmp_addrawraddr_dly_width * a_width);
                        end if;

      when 8 => if (a_width >= width) then
                  prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 3));
                  doado_tmp(7 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth);
                  dopadop_tmp(0 downto 0) := memp(prcd_tmp_addrawraddr_dly_depth);
                else
                  prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_8 + 1));
                  prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_8 downto 3));
                  doado_tmp(7 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 8) + 7 downto prcd_tmp_addrawraddr_dly_width * 8);
                  dopadop_tmp(0 downto 0) := memp(prcd_tmp_addrawraddr_dly_depth)(prcd_tmp_addrawraddr_dly_width downto prcd_tmp_addrawraddr_dly_width);
                end if;

      when 16 => if (a_width >= width) then
                  prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 4));
                  doado_tmp(15 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth);
                  dopadop_tmp(1 downto 0) := memp(prcd_tmp_addrawraddr_dly_depth);
                 else
                  prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_16 + 1));
                  prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_16 downto 4));
                  doado_tmp(15 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 16) + 15 downto prcd_tmp_addrawraddr_dly_width * 16);
                  dopadop_tmp(1 downto 0) := memp(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 2) + 1 downto prcd_tmp_addrawraddr_dly_width * 2);
                 end if;

      when 32 => if (a_width >= width) then
                  prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 5));
                  doado_tmp(31 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth);
                  dopadop_tmp(3 downto 0) := memp(prcd_tmp_addrawraddr_dly_depth);
                end if;

      when others => null;

    end case;

  end prcd_rd_ram_a;

  
  procedure prcd_rd_ram_b (
    constant addrbrdaddr_tmp : in std_logic_vector (15 downto 0);
    variable dobdo_tmp : inout std_logic_vector (63 downto 0);
    variable dopbdop_tmp : inout std_logic_vector (7 downto 0);
    constant mem : in Two_D_array_type;
    constant memp : in Two_D_parity_array_type     
    ) is
    variable prcd_tmp_addrbrdaddr_dly_depth : integer;
    variable prcd_tmp_addrbrdaddr_dly_width : integer;

  begin
    
    case b_width is

      when 1 | 2 | 4 => if (b_width >= width) then
                          prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_lbit_124));
                          dobdo_tmp(b_width-1 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth);
                        else
                          prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_124 + 1));
                          prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_124 downto addrbrdaddr_lbit_124));
                          dobdo_tmp(b_width-1 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * b_width) + b_width - 1 downto prcd_tmp_addrbrdaddr_dly_width * b_width);
                        end if;

      when 8 => if (b_width >= width) then
                  prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 3));
                  dobdo_tmp(7 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth);
                  dopbdop_tmp(0 downto 0) := memp(prcd_tmp_addrbrdaddr_dly_depth);
                else
                  prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_8 + 1));
                  prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_8 downto 3));
                  dobdo_tmp(7 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 8) + 7 downto prcd_tmp_addrbrdaddr_dly_width * 8);
                  dopbdop_tmp(0 downto 0) := memp(prcd_tmp_addrbrdaddr_dly_depth)(prcd_tmp_addrbrdaddr_dly_width downto prcd_tmp_addrbrdaddr_dly_width);
                end if;

      when 16 => if (b_width >= width) then
                  prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 4));
                  dobdo_tmp(15 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth);
                  dopbdop_tmp(1 downto 0) := memp(prcd_tmp_addrbrdaddr_dly_depth);
                 else
                  prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_16 + 1));
                  prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_16 downto 4));
                  dobdo_tmp(15 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 16) + 15 downto prcd_tmp_addrbrdaddr_dly_width * 16);
                  dopbdop_tmp(1 downto 0) := memp(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 2) + 1 downto prcd_tmp_addrbrdaddr_dly_width * 2);
                 end if;

      when 32 => if (b_width >= width) then
                  prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 5));
                  dobdo_tmp(31 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth);
                  dopbdop_tmp(3 downto 0) := memp(prcd_tmp_addrbrdaddr_dly_depth);
                end if;

      when others => null;

    end case;

  end prcd_rd_ram_b;


  procedure prcd_col_wr_ram_a (
    constant viol_time_tmp : in integer;
    constant seq : in std_logic_vector (1 downto 0);
    constant webweu_tmp : in std_logic_vector (7 downto 0);
    constant weawel_tmp : in std_logic_vector (7 downto 0);
    constant diadi_tmp : in std_logic_vector (63 downto 0);
    constant dipadip_tmp : in std_logic_vector (7 downto 0);
    constant addrbrdaddr_tmp : in std_logic_vector (15 downto 0);
    constant addrawraddr_tmp : in std_logic_vector (15 downto 0);
    variable mem : inout Two_D_array_type;
    variable memp : inout Two_D_parity_array_type;
    variable col_wr_wr_msg : inout std_ulogic;
    variable col_wra_rdb_msg : inout std_ulogic;
    variable col_wrb_rda_msg : inout std_ulogic;
    variable chk_col_same_clk_tmp : inout integer;
    variable chk_ox_same_clk_tmp : inout integer;
    variable chk_ox_msg_tmp : inout integer
    ) is
    variable prcd_tmp_addrawraddr_dly_depth : integer;
    variable prcd_tmp_addrawraddr_dly_width : integer;
    variable junk : std_ulogic;

  begin
    
    case a_width is

      when 1 | 2 | 4 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and a_width > b_width) or seq = "10") then
                          if (a_width >= width) then
                            prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_lbit_124));
                            prcd_write_ram_col (webweu_tmp(0), weawel_tmp(0), diadi_tmp(a_width-1 downto 0), '0', mem(prcd_tmp_addrawraddr_dly_depth), junk);
                          else
                            prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_124 + 1));
                            prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_124 downto addrawraddr_lbit_124));
                            prcd_write_ram_col (webweu_tmp(0), weawel_tmp(0), diadi_tmp(a_width-1 downto 0), '0', mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * a_width) + a_width - 1 downto (prcd_tmp_addrawraddr_dly_width * a_width)), junk);
                          end if;

                          if (seq = "00") then
                            prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                          end if;
                        end if;
      
      when 8 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and a_width > b_width) or seq = "10") then
                  if (a_width >= width) then
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 3));
                    prcd_write_ram_col (webweu_tmp(0), weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth), memp(prcd_tmp_addrawraddr_dly_depth)(0));
                  else
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_8 + 1));
                    prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_8 downto 3));
                    prcd_write_ram_col (webweu_tmp(0), weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 8) + 7 downto (prcd_tmp_addrawraddr_dly_width * 8)), memp(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width)));
                  end if;
  
                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if;
                end if;

      when 16 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and a_width > b_width) or seq = "10") then
                  if (a_width >= width) then
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 4));
                    prcd_write_ram_col (webweu_tmp(0), weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrawraddr_dly_depth)(0));
                  else
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_16 + 1));
                    prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_16 downto 4));
                    prcd_write_ram_col (webweu_tmp(0), weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 16) + 7 downto (prcd_tmp_addrawraddr_dly_width * 16)), memp(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 2)));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if;
                 
                  if (a_width >= width) then
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 4));
                    prcd_write_ram_col (webweu_tmp(1), weawel_tmp(1), diadi_tmp(15 downto 8), dipadip_tmp(1), mem(prcd_tmp_addrawraddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrawraddr_dly_depth)(1));
                  else
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_16 + 1));
                    prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_16 downto 4));
                    prcd_write_ram_col (webweu_tmp(1), weawel_tmp(1), diadi_tmp(15 downto 8), dipadip_tmp(1), mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 16) + 15 downto (prcd_tmp_addrawraddr_dly_width * 16) + 8), memp(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 2) + 1));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(1), webweu_tmp(1), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if;
                 
                end if;

      when 32 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and a_width > b_width) or seq = "10") then

                   prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 5));
                   prcd_write_ram_col (webweu_tmp(0), weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrawraddr_dly_depth)(0));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                   prcd_write_ram_col (webweu_tmp(1), weawel_tmp(1), diadi_tmp(15 downto 8), dipadip_tmp(1), mem(prcd_tmp_addrawraddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrawraddr_dly_depth)(1));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(1), webweu_tmp(1), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;
                   
                   prcd_write_ram_col (webweu_tmp(2), weawel_tmp(2), diadi_tmp(23 downto 16), dipadip_tmp(2), mem(prcd_tmp_addrawraddr_dly_depth)(23 downto 16), memp(prcd_tmp_addrawraddr_dly_depth)(2));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(2), webweu_tmp(2), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                   prcd_write_ram_col (webweu_tmp(3), weawel_tmp(3), diadi_tmp(31 downto 24), dipadip_tmp(3), mem(prcd_tmp_addrawraddr_dly_depth)(31 downto 24), memp(prcd_tmp_addrawraddr_dly_depth)(3));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(3), webweu_tmp(3), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                 end if;

      when others => null;

    end case;

  end prcd_col_wr_ram_a;


  procedure prcd_ox_wr_ram_a (
    constant viol_time_tmp : in integer;
    constant seq : in std_logic_vector (1 downto 0);
    constant webweu_tmp : in std_logic_vector (7 downto 0);
    constant weawel_tmp : in std_logic_vector (7 downto 0);
    constant diadi_tmp : in std_logic_vector (63 downto 0);
    constant dipadip_tmp : in std_logic_vector (7 downto 0);
    constant addrbrdaddr_tmp : in std_logic_vector (15 downto 0);
    constant addrawraddr_tmp : in std_logic_vector (15 downto 0);
    variable mem : inout Two_D_array_type;
    variable memp : inout Two_D_parity_array_type;
    variable ox_wr_wr_msg : inout std_ulogic;
    variable ox_wra_rdb_msg : inout std_ulogic;
    variable ox_wrb_rda_msg : inout std_ulogic;
    variable chk_col_same_clk_tmp : inout integer;
    variable chk_ox_same_clk_tmp : inout integer;
    variable chk_ox_msg_tmp : inout integer
    ) is
    variable prcd_tmp_addrawraddr_dly_depth : integer;
    variable prcd_tmp_addrawraddr_dly_width : integer;
    variable junk : std_ulogic;

  begin
    
    case a_width is

      when 1 | 2 | 4 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and a_width > b_width) or seq = "10") then
                          if (a_width >= width) then
                            prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_lbit_124));
                            prcd_write_ram_ox (webweu_tmp(0), weawel_tmp(0), diadi_tmp(a_width-1 downto 0), '0', mem(prcd_tmp_addrawraddr_dly_depth), junk);
                          else
                            prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_124 + 1));
                            prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_124 downto addrawraddr_lbit_124));
                            prcd_write_ram_ox (webweu_tmp(0), weawel_tmp(0), diadi_tmp(a_width-1 downto 0), '0', mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * a_width) + a_width - 1 downto (prcd_tmp_addrawraddr_dly_width * a_width)), junk);
                          end if;

                          if (seq = "00") then
                            prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                          end if;
                        end if;
      
      when 8 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and a_width > b_width) or seq = "10") then
                  if (a_width >= width) then
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 3));
                    prcd_write_ram_ox (webweu_tmp(0), weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth), memp(prcd_tmp_addrawraddr_dly_depth)(0));
                  else
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_8 + 1));
                    prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_8 downto 3));
                    prcd_write_ram_ox (webweu_tmp(0), weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 8) + 7 downto (prcd_tmp_addrawraddr_dly_width * 8)), memp(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width)));
                  end if;
  
                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if;
                end if;

      when 16 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and a_width > b_width) or seq = "10") then
                  if (a_width >= width) then
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 4));
                    prcd_write_ram_ox (webweu_tmp(0), weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrawraddr_dly_depth)(0));
                  else
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_16 + 1));
                    prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_16 downto 4));
                    prcd_write_ram_ox (webweu_tmp(0), weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 16) + 7 downto (prcd_tmp_addrawraddr_dly_width * 16)), memp(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 2)));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if;
                 
                  if (a_width >= width) then
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 4));
                    prcd_write_ram_ox (webweu_tmp(1), weawel_tmp(1), diadi_tmp(15 downto 8), dipadip_tmp(1), mem(prcd_tmp_addrawraddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrawraddr_dly_depth)(1));
                  else
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_16 + 1));
                    prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_16 downto 4));
                    prcd_write_ram_ox (webweu_tmp(1), weawel_tmp(1), diadi_tmp(15 downto 8), dipadip_tmp(1), mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 16) + 15 downto (prcd_tmp_addrawraddr_dly_width * 16) + 8), memp(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 2) + 1));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(1), webweu_tmp(1), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if;
                 
                end if;

      when 32 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and a_width > b_width) or seq = "10") then

                   prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 5));
                   prcd_write_ram_ox (webweu_tmp(0), weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrawraddr_dly_depth)(0));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                   prcd_write_ram_ox (webweu_tmp(1), weawel_tmp(1), diadi_tmp(15 downto 8), dipadip_tmp(1), mem(prcd_tmp_addrawraddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrawraddr_dly_depth)(1));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(1), webweu_tmp(1), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;
                   
                   prcd_write_ram_ox (webweu_tmp(2), weawel_tmp(2), diadi_tmp(23 downto 16), dipadip_tmp(2), mem(prcd_tmp_addrawraddr_dly_depth)(23 downto 16), memp(prcd_tmp_addrawraddr_dly_depth)(2));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(2), webweu_tmp(2), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                   prcd_write_ram_ox (webweu_tmp(3), weawel_tmp(3), diadi_tmp(31 downto 24), dipadip_tmp(3), mem(prcd_tmp_addrawraddr_dly_depth)(31 downto 24), memp(prcd_tmp_addrawraddr_dly_depth)(3));

                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(3), webweu_tmp(3), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                 end if;

      when others => null;

    end case;

  end prcd_ox_wr_ram_a;

  
  procedure prcd_col_wr_ram_b (
    constant viol_time_tmp : in integer;
    constant seq : in std_logic_vector (1 downto 0);
    constant weawel_tmp : in std_logic_vector (7 downto 0);
    constant webweu_tmp : in std_logic_vector (7 downto 0);
    constant dibdi_tmp : in std_logic_vector (63 downto 0);
    constant dipbdip_tmp : in std_logic_vector (7 downto 0);
    constant addrawraddr_tmp : in std_logic_vector (15 downto 0);
    constant addrbrdaddr_tmp : in std_logic_vector (15 downto 0);
    variable mem : inout Two_D_array_type;
    variable memp : inout Two_D_parity_array_type;
    variable col_wr_wr_msg : inout std_ulogic;
    variable col_wra_rdb_msg : inout std_ulogic;
    variable col_wrb_rda_msg : inout std_ulogic;
    variable chk_col_same_clk_tmp : inout integer;
    variable chk_ox_same_clk_tmp : inout integer;
    variable chk_ox_msg_tmp : inout integer
    ) is
    variable prcd_tmp_addrbrdaddr_dly_depth : integer;
    variable prcd_tmp_addrbrdaddr_dly_width : integer;
    variable junk : std_ulogic;

  begin
    
    case b_width is

      when 1 | 2 | 4 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and b_width > a_width) or seq = "10") then
                          if (b_width >= width) then
                            prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_lbit_124));
                            prcd_write_ram_col (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(b_width-1 downto 0), '0', mem(prcd_tmp_addrbrdaddr_dly_depth), junk);
                          else
                            prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_124 + 1));
                            prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_124 downto addrbrdaddr_lbit_124));
                            prcd_write_ram_col (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(b_width-1 downto 0), '0', mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * b_width) + b_width - 1 downto (prcd_tmp_addrbrdaddr_dly_width * b_width)), junk);
                          end if;

                          if (seq = "00") then
                            prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                          end if;
                        end if;

      when 8 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and b_width > a_width) or seq = "10") then
                  if (b_width >= width) then
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 3));
                    prcd_write_ram_col (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth), memp(prcd_tmp_addrbrdaddr_dly_depth)(0));
                  else
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_8 + 1));
                    prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_8 downto 3));
                    prcd_write_ram_col (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 8) + 7 downto (prcd_tmp_addrbrdaddr_dly_width * 8)), memp(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width)));
                  end if;
    
                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if; 
                end if;

      when 16 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and b_width > a_width) or seq = "10") then
                  if (b_width >= width) then
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 4));
                    prcd_write_ram_col (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrbrdaddr_dly_depth)(0));
                  else
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_16 + 1));
                    prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_16 downto 4));
                    prcd_write_ram_col (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 16) + 7 downto (prcd_tmp_addrbrdaddr_dly_width * 16)), memp(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 2)));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if;

                  if (b_width >= width) then
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 4));
                    prcd_write_ram_col (weawel_tmp(1), webweu_tmp(1), dibdi_tmp(15 downto 8), dipbdip_tmp(1), mem(prcd_tmp_addrbrdaddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrbrdaddr_dly_depth)(1));
                  else
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_16 + 1));
                    prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_16 downto 4));
                    prcd_write_ram_col (weawel_tmp(1), webweu_tmp(1), dibdi_tmp(15 downto 8), dipbdip_tmp(1), mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 16) + 15 downto (prcd_tmp_addrbrdaddr_dly_width * 16) + 8), memp(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 2) + 1));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(1), webweu_tmp(1), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if;

                end if;
      when 32 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and b_width > a_width) or seq = "10") then

                   prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 5));
                   prcd_write_ram_col (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrbrdaddr_dly_depth)(0));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                   prcd_write_ram_col (weawel_tmp(1), webweu_tmp(1), dibdi_tmp(15 downto 8), dipbdip_tmp(1), mem(prcd_tmp_addrbrdaddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrbrdaddr_dly_depth)(1));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(1), webweu_tmp(1), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;
                   
                   prcd_write_ram_col (weawel_tmp(2), webweu_tmp(2), dibdi_tmp(23 downto 16), dipbdip_tmp(2), mem(prcd_tmp_addrbrdaddr_dly_depth)(23 downto 16), memp(prcd_tmp_addrbrdaddr_dly_depth)(2));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(2), webweu_tmp(2), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                   prcd_write_ram_col (weawel_tmp(3), webweu_tmp(3), dibdi_tmp(31 downto 24), dipbdip_tmp(3), mem(prcd_tmp_addrbrdaddr_dly_depth)(31 downto 24), memp(prcd_tmp_addrbrdaddr_dly_depth)(3));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(3), webweu_tmp(3), addrawraddr_tmp, addrbrdaddr_tmp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                 end if;

      when others => null;

    end case;

  end prcd_col_wr_ram_b;


  procedure prcd_ox_wr_ram_b (
    constant viol_time_tmp : in integer;
    constant seq : in std_logic_vector (1 downto 0);
    constant weawel_tmp : in std_logic_vector (7 downto 0);
    constant webweu_tmp : in std_logic_vector (7 downto 0);
    constant dibdi_tmp : in std_logic_vector (63 downto 0);
    constant dipbdip_tmp : in std_logic_vector (7 downto 0);
    constant addrawraddr_tmp : in std_logic_vector (15 downto 0);
    constant addrbrdaddr_tmp : in std_logic_vector (15 downto 0);
    variable mem : inout Two_D_array_type;
    variable memp : inout Two_D_parity_array_type;
    variable ox_wr_wr_msg : inout std_ulogic;
    variable ox_wra_rdb_msg : inout std_ulogic;
    variable ox_wrb_rda_msg : inout std_ulogic;
    variable chk_col_same_clk_tmp : inout integer;
    variable chk_ox_same_clk_tmp : inout integer;
    variable chk_ox_msg_tmp : inout integer
    ) is
    variable prcd_tmp_addrbrdaddr_dly_depth : integer;
    variable prcd_tmp_addrbrdaddr_dly_width : integer;
    variable junk : std_ulogic;

  begin
    
    case b_width is

      when 1 | 2 | 4 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and b_width > a_width) or seq = "10") then
                          if (b_width >= width) then
                            prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_lbit_124));
                            prcd_write_ram_ox (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(b_width-1 downto 0), '0', mem(prcd_tmp_addrbrdaddr_dly_depth), junk);
                          else
                            prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_124 + 1));
                            prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_124 downto addrbrdaddr_lbit_124));
                            prcd_write_ram_ox (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(b_width-1 downto 0), '0', mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * b_width) + b_width - 1 downto (prcd_tmp_addrbrdaddr_dly_width * b_width)), junk);
                          end if;

                          if (seq = "00") then
                            prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                          end if;
                        end if;

      when 8 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and b_width > a_width) or seq = "10") then
                  if (b_width >= width) then
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 3));
                    prcd_write_ram_ox (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth), memp(prcd_tmp_addrbrdaddr_dly_depth)(0));
                  else
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_8 + 1));
                    prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_8 downto 3));
                    prcd_write_ram_ox (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 8) + 7 downto (prcd_tmp_addrbrdaddr_dly_width * 8)), memp(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width)));
                  end if;
    
                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if; 
                end if;

      when 16 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and b_width > a_width) or seq = "10") then
                  if (b_width >= width) then
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 4));
                    prcd_write_ram_ox (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrbrdaddr_dly_depth)(0));
                  else
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_16 + 1));
                    prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_16 downto 4));
                    prcd_write_ram_ox (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 16) + 7 downto (prcd_tmp_addrbrdaddr_dly_width * 16)), memp(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 2)));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if;

                  if (b_width >= width) then
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 4));
                    prcd_write_ram_ox (weawel_tmp(1), webweu_tmp(1), dibdi_tmp(15 downto 8), dipbdip_tmp(1), mem(prcd_tmp_addrbrdaddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrbrdaddr_dly_depth)(1));
                  else
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_16 + 1));
                    prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_16 downto 4));
                    prcd_write_ram_ox (weawel_tmp(1), webweu_tmp(1), dibdi_tmp(15 downto 8), dipbdip_tmp(1), mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 16) + 15 downto (prcd_tmp_addrbrdaddr_dly_width * 16) + 8), memp(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 2) + 1));
                  end if;

                  if (seq = "00") then
                    prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(1), webweu_tmp(1), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                  end if;

                end if;
      when 32 => if (not(weawel_tmp(0) = '1' and webweu_tmp(0) = '1' and b_width > a_width) or seq = "10") then

                   prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 5));
                   prcd_write_ram_ox (weawel_tmp(0), webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrbrdaddr_dly_depth)(0));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(0), webweu_tmp(0), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                   prcd_write_ram_ox (weawel_tmp(1), webweu_tmp(1), dibdi_tmp(15 downto 8), dipbdip_tmp(1), mem(prcd_tmp_addrbrdaddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrbrdaddr_dly_depth)(1));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(1), webweu_tmp(1), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;
                   
                   prcd_write_ram_ox (weawel_tmp(2), webweu_tmp(2), dibdi_tmp(23 downto 16), dipbdip_tmp(2), mem(prcd_tmp_addrbrdaddr_dly_depth)(23 downto 16), memp(prcd_tmp_addrbrdaddr_dly_depth)(2));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(2), webweu_tmp(2), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                   prcd_write_ram_ox (weawel_tmp(3), webweu_tmp(3), dibdi_tmp(31 downto 24), dipbdip_tmp(3), mem(prcd_tmp_addrbrdaddr_dly_depth)(31 downto 24), memp(prcd_tmp_addrbrdaddr_dly_depth)(3));
                   if (seq = "00") then
                     prcd_chk_for_col_msg (viol_time_tmp, weawel_tmp(3), webweu_tmp(3), addrawraddr_tmp, addrbrdaddr_tmp, ox_wr_wr_msg, ox_wra_rdb_msg, ox_wrb_rda_msg, chk_col_same_clk_tmp, chk_ox_same_clk_tmp, chk_ox_msg_tmp);
                   end if;

                 end if;

      when others => null;

    end case;

  end prcd_ox_wr_ram_b;


  procedure prcd_col_rd_ram_a (
    constant viol_type_tmp : in std_logic_vector (1 downto 0);
    constant seq : in std_logic_vector (1 downto 0);
    constant webweu_tmp : in std_logic_vector (7 downto 0);
    constant weawel_tmp : in std_logic_vector (7 downto 0);
    constant addrawraddr_tmp : in std_logic_vector (15 downto 0);
    variable doado_tmp : inout std_logic_vector (63 downto 0);
    variable dopadop_tmp : inout std_logic_vector (7 downto 0);
    constant mem : in Two_D_array_type;
    constant memp : in Two_D_parity_array_type;
    constant wr_mode_a_tmp : in std_logic_vector (1 downto 0)

    ) is
    variable prcd_tmp_addrawraddr_dly_depth : integer;
    variable prcd_tmp_addrawraddr_dly_width : integer;
    variable junk : std_ulogic;
    variable doado_ltmp : std_logic_vector (63 downto 0);
    variable dopadop_ltmp : std_logic_vector (7 downto 0);
    
  begin

    doado_ltmp := (others => '0');
    dopadop_ltmp := (others => '0');
    
    case a_width is
      
      when 1 | 2 | 4 => if ((webweu_tmp(0) = '1' and weawel_tmp(0) = '1') or (seq = "01" and webweu_tmp(0) = '1' and weawel_tmp(0) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and webweu_tmp(0) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and webweu_tmp(0) /= '1')) then

                          if (a_width >= width) then
                            prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_lbit_124));
                            doado_ltmp(a_width-1 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth);
                          else
                            prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_124 + 1));
                            prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_124 downto addrawraddr_lbit_124));
                            doado_ltmp(a_width-1 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth)(((prcd_tmp_addrawraddr_dly_width * a_width) + a_width - 1) downto (prcd_tmp_addrawraddr_dly_width * a_width));

                          end if;
                          prcd_x_buf (wr_mode_a_tmp, 3, 0, 0, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);
                        end if;

      when 8 => if ((webweu_tmp(0) = '1' and weawel_tmp(0) = '1') or (seq = "01" and webweu_tmp(0) = '1' and weawel_tmp(0) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and webweu_tmp(0) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and webweu_tmp(0) /= '1')) then

                  if (a_width >= width) then
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 3));
                    doado_ltmp(7 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth);
                    dopadop_ltmp(0) := memp(prcd_tmp_addrawraddr_dly_depth)(0);
                  else
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_8 + 1));
                    prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_8 downto 3));
                    doado_ltmp(7 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth)(((prcd_tmp_addrawraddr_dly_width * 8) + 7) downto (prcd_tmp_addrawraddr_dly_width * 8));
                    dopadop_ltmp(0) := memp(prcd_tmp_addrawraddr_dly_depth)(prcd_tmp_addrawraddr_dly_width);
                  end if;
                  prcd_x_buf (wr_mode_a_tmp, 7, 0, 0, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                end if;

      when 16 => if ((webweu_tmp(0) = '1' and weawel_tmp(0) = '1') or (seq = "01" and webweu_tmp(0) = '1' and weawel_tmp(0) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and webweu_tmp(0) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and webweu_tmp(0) /= '1')) then

                  if (a_width >= width) then
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 4));
                    doado_ltmp(7 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth)(7 downto 0);
                    dopadop_ltmp(0) := memp(prcd_tmp_addrawraddr_dly_depth)(0);
                  else
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_16 + 1));
                    prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_16 downto 4));

                    doado_ltmp(7 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth)(((prcd_tmp_addrawraddr_dly_width * 16) + 7) downto (prcd_tmp_addrawraddr_dly_width * 16));                    
                    dopadop_ltmp(0) := memp(prcd_tmp_addrawraddr_dly_depth)(prcd_tmp_addrawraddr_dly_width * 2);
                  end if;
                  prcd_x_buf (wr_mode_a_tmp, 7, 0, 0, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                end if;

                if ((webweu_tmp(1) = '1' and weawel_tmp(1) = '1') or (seq = "01" and webweu_tmp(1) = '1' and weawel_tmp(1) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and webweu_tmp(1) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and webweu_tmp(1) /= '1')) then

                  if (a_width >= width) then
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 4));
                    doado_ltmp(15 downto 8) := mem(prcd_tmp_addrawraddr_dly_depth)(15 downto 8);
                    dopadop_ltmp(1) := memp(prcd_tmp_addrawraddr_dly_depth)(1);
                  else
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_16 + 1));
                    prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_16 downto 4));

                    doado_ltmp(15 downto 8) := mem(prcd_tmp_addrawraddr_dly_depth)(((prcd_tmp_addrawraddr_dly_width * 16) + 15) downto ((prcd_tmp_addrawraddr_dly_width * 16) + 8));
                    dopadop_ltmp(1) := memp(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 2) + 1);
                  end if;
                  prcd_x_buf (wr_mode_a_tmp, 15, 8, 1, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);
                  
                end if;

      when 32 => if (a_width >= width) then

                   prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 5));

                   if ((webweu_tmp(0) = '1' and weawel_tmp(0) = '1') or (seq = "01" and webweu_tmp(0) = '1' and weawel_tmp(0) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and webweu_tmp(0) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and webweu_tmp(0) /= '1')) then

                     doado_ltmp(7 downto 0) := mem(prcd_tmp_addrawraddr_dly_depth)(7 downto 0);
                     dopadop_ltmp(0) := memp(prcd_tmp_addrawraddr_dly_depth)(0);
                     prcd_x_buf (wr_mode_a_tmp, 7, 0, 0, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                   end if;

                   if ((webweu_tmp(1) = '1' and weawel_tmp(1) = '1') or (seq = "01" and webweu_tmp(1) = '1' and weawel_tmp(1) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and webweu_tmp(1) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and webweu_tmp(1) /= '1')) then

                     doado_ltmp(15 downto 8) := mem(prcd_tmp_addrawraddr_dly_depth)(15 downto 8);
                     dopadop_ltmp(1) := memp(prcd_tmp_addrawraddr_dly_depth)(1);
                     prcd_x_buf (wr_mode_a_tmp, 15, 8, 1, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                   end if;

                   if ((webweu_tmp(2) = '1' and weawel_tmp(2) = '1') or (seq = "01" and webweu_tmp(2) = '1' and weawel_tmp(2) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and webweu_tmp(2) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and webweu_tmp(2) /= '1')) then

                     doado_ltmp(23 downto 16) := mem(prcd_tmp_addrawraddr_dly_depth)(23 downto 16);
                     dopadop_ltmp(2) := memp(prcd_tmp_addrawraddr_dly_depth)(2);
                     prcd_x_buf (wr_mode_a_tmp, 23, 16, 2, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                   end if;

                   if ((webweu_tmp(3) = '1' and weawel_tmp(3) = '1') or (seq = "01" and webweu_tmp(3) = '1' and weawel_tmp(3) = '0' and viol_type_tmp = "10") or (seq = "01" and WRITE_MODE_A /= "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST") or (seq = "01" and WRITE_MODE_A = "READ_FIRST" and WRITE_MODE_B /= "READ_FIRST" and webweu_tmp(3) = '1') or (seq = "11" and WRITE_MODE_A = "WRITE_FIRST" and webweu_tmp(3) /= '1')) then

                     doado_ltmp(31 downto 24) := mem(prcd_tmp_addrawraddr_dly_depth)(31 downto 24);
                     dopadop_ltmp(3) := memp(prcd_tmp_addrawraddr_dly_depth)(3);
                     prcd_x_buf (wr_mode_a_tmp, 31, 24, 3, doado_ltmp, doado_tmp, dopadop_ltmp, dopadop_tmp);

                   end if;
  
                end if;
  
      when others => null;

    end case;

  end prcd_col_rd_ram_a;


  procedure prcd_col_rd_ram_b (
    constant viol_type_tmp : in std_logic_vector (1 downto 0);
    constant seq : in std_logic_vector (1 downto 0);
    constant weawel_tmp : in std_logic_vector (7 downto 0);
    constant webweu_tmp : in std_logic_vector (7 downto 0);
    constant addrbrdaddr_tmp : in std_logic_vector (15 downto 0);
    variable dobdo_tmp : inout std_logic_vector (63 downto 0);
    variable dopbdop_tmp : inout std_logic_vector (7 downto 0);
    constant mem : in Two_D_array_type;
    constant memp : in Two_D_parity_array_type;
    constant wr_mode_b_tmp : in std_logic_vector (1 downto 0)

    ) is
    variable prcd_tmp_addrbrdaddr_dly_depth : integer;
    variable prcd_tmp_addrbrdaddr_dly_width : integer;
    variable junk : std_ulogic;
    variable dobdo_ltmp : std_logic_vector (63 downto 0);
    variable dopbdop_ltmp : std_logic_vector (7 downto 0);
    
  begin

    dobdo_ltmp := (others => '0');
    dopbdop_ltmp := (others => '0');
    
    case b_width is
      
      when 1 | 2 | 4 => if ((webweu_tmp(0) = '1' and weawel_tmp(0) = '1') or (seq = "01" and weawel_tmp(0) = '1' and webweu_tmp(0) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and weawel_tmp(0) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and weawel_tmp(0) /= '1')) then

                          if (b_width >= width) then
                            prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_lbit_124));
                            dobdo_ltmp(b_width-1 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth);
                          else
                            prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_124 + 1));
                            prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_124 downto addrbrdaddr_lbit_124));
                            dobdo_ltmp(b_width-1 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth)(((prcd_tmp_addrbrdaddr_dly_width * b_width) + b_width - 1) downto (prcd_tmp_addrbrdaddr_dly_width * b_width));
                          end if;
                          prcd_x_buf (wr_mode_b_tmp, 3, 0, 0, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                        end if;

      when 8 => if ((webweu_tmp(0) = '1' and weawel_tmp(0) = '1') or (seq = "01" and weawel_tmp(0) = '1' and webweu_tmp(0) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and weawel_tmp(0) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and weawel_tmp(0) /= '1')) then

                  if (b_width >= width) then
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 3));
                    dobdo_ltmp(7 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth);
                    dopbdop_ltmp(0) := memp(prcd_tmp_addrbrdaddr_dly_depth)(0);
                  else
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_8 + 1));
                    prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_8 downto 3));
                    dobdo_ltmp(7 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth)(((prcd_tmp_addrbrdaddr_dly_width * 8) + 7) downto (prcd_tmp_addrbrdaddr_dly_width * 8));
                    dopbdop_ltmp(0) := memp(prcd_tmp_addrbrdaddr_dly_depth)(prcd_tmp_addrbrdaddr_dly_width);
                  end if;
                  prcd_x_buf (wr_mode_b_tmp, 7, 0, 0, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                end if;

      when 16 => if ((webweu_tmp(0) = '1' and weawel_tmp(0) = '1') or (seq = "01" and weawel_tmp(0) = '1' and webweu_tmp(0) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and weawel_tmp(0) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and weawel_tmp(0) /= '1')) then

                  if (b_width >= width) then
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 4));
                    dobdo_ltmp(7 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth)(7 downto 0);
                    dopbdop_ltmp(0) := memp(prcd_tmp_addrbrdaddr_dly_depth)(0);
                  else
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_16 + 1));
                    prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_16 downto 4));

                    dobdo_ltmp(7 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth)(((prcd_tmp_addrbrdaddr_dly_width * 16) + 7) downto (prcd_tmp_addrbrdaddr_dly_width * 16));
                    dopbdop_ltmp(0) := memp(prcd_tmp_addrbrdaddr_dly_depth)(prcd_tmp_addrbrdaddr_dly_width * 2);
                  end if;
                  prcd_x_buf (wr_mode_b_tmp, 7, 0, 0, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                end if;


                if ((webweu_tmp(1) = '1' and weawel_tmp(1) = '1') or (seq = "01" and weawel_tmp(1) = '1' and webweu_tmp(1) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and weawel_tmp(1) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and weawel_tmp(1) /= '1')) then

                  if (b_width >= width) then
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 4));
                    dobdo_ltmp(15 downto 8) := mem(prcd_tmp_addrbrdaddr_dly_depth)(15 downto 8);
                    dopbdop_ltmp(1) := memp(prcd_tmp_addrbrdaddr_dly_depth)(1);
                  else
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_16 + 1));
                    prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_16 downto 4));

                    dobdo_ltmp(15 downto 8) := mem(prcd_tmp_addrbrdaddr_dly_depth)(((prcd_tmp_addrbrdaddr_dly_width * 16) + 15) downto ((prcd_tmp_addrbrdaddr_dly_width * 16) + 8));
                    dopbdop_ltmp(1) := memp(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 2) + 1);
                  end if;
                  prcd_x_buf (wr_mode_b_tmp, 15, 8, 1, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                end if;

      when 32 => if (b_width >= width) then

                   prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 5));

                   if ((webweu_tmp(0) = '1' and weawel_tmp(0) = '1') or (seq = "01" and weawel_tmp(0) = '1' and webweu_tmp(0) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and weawel_tmp(0) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and weawel_tmp(0) /= '1')) then

                     dobdo_ltmp(7 downto 0) := mem(prcd_tmp_addrbrdaddr_dly_depth)(7 downto 0);
                     dopbdop_ltmp(0) := memp(prcd_tmp_addrbrdaddr_dly_depth)(0);
                     prcd_x_buf (wr_mode_b_tmp, 7, 0, 0, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                   end if;

                   if ((webweu_tmp(1) = '1' and weawel_tmp(1) = '1') or (seq = "01" and weawel_tmp(1) = '1' and webweu_tmp(1) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and weawel_tmp(1) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and weawel_tmp(1) /= '1')) then

                     dobdo_ltmp(15 downto 8) := mem(prcd_tmp_addrbrdaddr_dly_depth)(15 downto 8);
                     dopbdop_ltmp(1) := memp(prcd_tmp_addrbrdaddr_dly_depth)(1);
                     prcd_x_buf (wr_mode_b_tmp, 15, 8, 1, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                   end if;

                   if ((webweu_tmp(2) = '1' and weawel_tmp(2) = '1') or (seq = "01" and weawel_tmp(2) = '1' and webweu_tmp(2) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and weawel_tmp(2) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and weawel_tmp(2) /= '1')) then

                     dobdo_ltmp(23 downto 16) := mem(prcd_tmp_addrbrdaddr_dly_depth)(23 downto 16);
                     dopbdop_ltmp(2) := memp(prcd_tmp_addrbrdaddr_dly_depth)(2);
                     prcd_x_buf (wr_mode_b_tmp, 23, 16, 2, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                   end if;
  
                   if ((webweu_tmp(3) = '1' and weawel_tmp(3) = '1') or (seq = "01" and weawel_tmp(3) = '1' and webweu_tmp(3) = '0' and viol_type_tmp = "11") or (seq = "01" and WRITE_MODE_B /= "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST") or (seq = "01" and WRITE_MODE_B = "READ_FIRST" and WRITE_MODE_A /= "READ_FIRST" and weawel_tmp(3) = '1') or (seq = "11" and WRITE_MODE_B = "WRITE_FIRST" and weawel_tmp(3) /= '1')) then

                     dobdo_ltmp(31 downto 24) := mem(prcd_tmp_addrbrdaddr_dly_depth)(31 downto 24);
                     dopbdop_ltmp(3) := memp(prcd_tmp_addrbrdaddr_dly_depth)(3);
                     prcd_x_buf (wr_mode_b_tmp, 31, 24, 3, dobdo_ltmp, dobdo_tmp, dopbdop_ltmp, dopbdop_tmp);

                   end if;
  
                end if;
  
      when others => null;

    end case;

  end prcd_col_rd_ram_b;


  procedure prcd_wr_ram_a (
    constant weawel_tmp : in std_logic_vector (7 downto 0);
    constant diadi_tmp : in std_logic_vector (63 downto 0);
    constant dipadip_tmp : in std_logic_vector (7 downto 0);
    constant addrawraddr_tmp : in std_logic_vector (15 downto 0);
    variable mem : inout Two_D_array_type;
    variable memp : inout Two_D_parity_array_type
    ) is
    variable prcd_tmp_addrawraddr_dly_depth : integer;
    variable prcd_tmp_addrawraddr_dly_width : integer;
    variable junk : std_ulogic;

  begin
    
    case a_width is

      when 1 | 2 | 4 =>
                          if (a_width >= width) then
                            prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_lbit_124));
                            prcd_write_ram (weawel_tmp(0), diadi_tmp(a_width-1 downto 0), '0', mem(prcd_tmp_addrawraddr_dly_depth), junk);
                          else
                            prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_124 + 1));
                            prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_124 downto addrawraddr_lbit_124));
                            prcd_write_ram (weawel_tmp(0), diadi_tmp(a_width-1 downto 0), '0', mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * a_width) + a_width - 1 downto (prcd_tmp_addrawraddr_dly_width * a_width)), junk);
                          end if;

      when 8 =>
                  if (a_width >= width) then
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 3));
                    prcd_write_ram (weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth), memp(prcd_tmp_addrawraddr_dly_depth)(0));
                  else
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_8 + 1));
                    prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_8 downto 3));
                    prcd_write_ram (weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 8) + 7 downto (prcd_tmp_addrawraddr_dly_width * 8)), memp(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width)));
                  end if;
  
      when 16 =>
                  if (a_width >= width) then
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 4));
                    prcd_write_ram (weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrawraddr_dly_depth)(0));
                    prcd_write_ram (weawel_tmp(1), diadi_tmp(15 downto 8), dipadip_tmp(1), mem(prcd_tmp_addrawraddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrawraddr_dly_depth)(1));
                  else
                    prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto addrawraddr_bit_16 + 1));
                    prcd_tmp_addrawraddr_dly_width := SLV_TO_INT(addrawraddr_tmp(addrawraddr_bit_16 downto 4));
                    prcd_write_ram (weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 16) + 7 downto (prcd_tmp_addrawraddr_dly_width * 16)), memp(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 2)));
                    prcd_write_ram (weawel_tmp(1), diadi_tmp(15 downto 8), dipadip_tmp(1), mem(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 16) + 15 downto (prcd_tmp_addrawraddr_dly_width * 16) + 8), memp(prcd_tmp_addrawraddr_dly_depth)((prcd_tmp_addrawraddr_dly_width * 2) + 1));
                  end if;

      when 32 =>
                   prcd_tmp_addrawraddr_dly_depth := SLV_TO_INT(addrawraddr_tmp(14 downto 5));

                   prcd_write_ram (weawel_tmp(0), diadi_tmp(7 downto 0), dipadip_tmp(0), mem(prcd_tmp_addrawraddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrawraddr_dly_depth)(0));
                   prcd_write_ram (weawel_tmp(1), diadi_tmp(15 downto 8), dipadip_tmp(1), mem(prcd_tmp_addrawraddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrawraddr_dly_depth)(1));
                   prcd_write_ram (weawel_tmp(2), diadi_tmp(23 downto 16), dipadip_tmp(2), mem(prcd_tmp_addrawraddr_dly_depth)(23 downto 16), memp(prcd_tmp_addrawraddr_dly_depth)(2));
                   prcd_write_ram (weawel_tmp(3), diadi_tmp(31 downto 24), dipadip_tmp(3), mem(prcd_tmp_addrawraddr_dly_depth)(31 downto 24), memp(prcd_tmp_addrawraddr_dly_depth)(3));

      when others => null;

    end case;

  end prcd_wr_ram_a;


  procedure prcd_wr_ram_b (
    constant webweu_tmp : in std_logic_vector (7 downto 0);
    constant dibdi_tmp : in std_logic_vector (63 downto 0);
    constant dipbdip_tmp : in std_logic_vector (7 downto 0);
    constant addrbrdaddr_tmp : in std_logic_vector (15 downto 0);
    variable mem : inout Two_D_array_type;
    variable memp : inout Two_D_parity_array_type     
    ) is
    variable prcd_tmp_addrbrdaddr_dly_depth : integer;
    variable prcd_tmp_addrbrdaddr_dly_width : integer;
    variable junk : std_ulogic;

  begin
    
    case b_width is

      when 1 | 2 | 4 =>
                          if (b_width >= width) then
                            prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_lbit_124));
                            prcd_write_ram (webweu_tmp(0), dibdi_tmp(b_width-1 downto 0), '0', mem(prcd_tmp_addrbrdaddr_dly_depth), junk);
                          else
                            prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_124 + 1));
                            prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_124 downto addrbrdaddr_lbit_124));
                            prcd_write_ram (webweu_tmp(0), dibdi_tmp(b_width-1 downto 0), '0', mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * b_width) + b_width - 1 downto (prcd_tmp_addrbrdaddr_dly_width * b_width)), junk);
                          end if;

      when 8 => 
                  if (b_width >= width) then
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 3));
                    prcd_write_ram (webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth), memp(prcd_tmp_addrbrdaddr_dly_depth)(0));
                  else
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_8 + 1));
                    prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_8 downto 3));
                    prcd_write_ram (webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 8) + 7 downto (prcd_tmp_addrbrdaddr_dly_width * 8)), memp(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width)));
                  end if;
  
      when 16 =>
                  if (b_width >= width) then
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 4));
                    prcd_write_ram (webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrbrdaddr_dly_depth)(0));
                    prcd_write_ram (webweu_tmp(1), dibdi_tmp(15 downto 8), dipbdip_tmp(1), mem(prcd_tmp_addrbrdaddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrbrdaddr_dly_depth)(1));
                  else
                    prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto addrbrdaddr_bit_16 + 1));
                    prcd_tmp_addrbrdaddr_dly_width := SLV_TO_INT(addrbrdaddr_tmp(addrbrdaddr_bit_16 downto 4));
                    prcd_write_ram (webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 16) + 7 downto (prcd_tmp_addrbrdaddr_dly_width * 16)), memp(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 2)));
                    prcd_write_ram (webweu_tmp(1), dibdi_tmp(15 downto 8), dipbdip_tmp(1), mem(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 16) + 15 downto (prcd_tmp_addrbrdaddr_dly_width * 16) + 8), memp(prcd_tmp_addrbrdaddr_dly_depth)((prcd_tmp_addrbrdaddr_dly_width * 2) + 1));
                  end if;

      when 32 =>
                   prcd_tmp_addrbrdaddr_dly_depth := SLV_TO_INT(addrbrdaddr_tmp(14 downto 5));
                   prcd_write_ram (webweu_tmp(0), dibdi_tmp(7 downto 0), dipbdip_tmp(0), mem(prcd_tmp_addrbrdaddr_dly_depth)(7 downto 0), memp(prcd_tmp_addrbrdaddr_dly_depth)(0));
                   prcd_write_ram (webweu_tmp(1), dibdi_tmp(15 downto 8), dipbdip_tmp(1), mem(prcd_tmp_addrbrdaddr_dly_depth)(15 downto 8), memp(prcd_tmp_addrbrdaddr_dly_depth)(1));
                   prcd_write_ram (webweu_tmp(2), dibdi_tmp(23 downto 16), dipbdip_tmp(2), mem(prcd_tmp_addrbrdaddr_dly_depth)(23 downto 16), memp(prcd_tmp_addrbrdaddr_dly_depth)(2));
                   prcd_write_ram (webweu_tmp(3), dibdi_tmp(31 downto 24), dipbdip_tmp(3), mem(prcd_tmp_addrbrdaddr_dly_depth)(31 downto 24), memp(prcd_tmp_addrbrdaddr_dly_depth)(3));

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
    
    ADDRAWRADDR_DELAY : for i in 0 to 12 generate
      VitalWireDelay (ADDRAWRADDR_ipd(i),ADDRAWRADDR(i),tipd_ADDRAWRADDR(i));
    end generate ADDRAWRADDR_DELAY;

    ADDRBRDADDR_DELAY : for i in 0 to 12 generate
      VitalWireDelay (ADDRBRDADDR_ipd(i),ADDRBRDADDR(i),tipd_ADDRBRDADDR(i));
    end generate ADDRBRDADDR_DELAY;

    DIADI_DELAY : for i in 0 to 15 generate
      VitalWireDelay (DIADI_ipd(i),DIADI(i),tipd_DIADI(i));
    end generate DIADI_DELAY;

    DIBDI_DELAY : for i in 0 to 15 generate
      VitalWireDelay (DIBDI_ipd(i),DIBDI(i),tipd_DIBDI(i));
    end generate DIBDI_DELAY;

    DIPADIP_DELAY : for i in 0 to 1 generate
      VitalWireDelay (DIPADIP_ipd(i),DIPADIP(i),tipd_DIPADIP(i));
    end generate DIPADIP_DELAY;

    DIPBDIP_DELAY : for i in 0 to 1 generate
      VitalWireDelay (DIPBDIP_ipd(i),DIPBDIP(i),tipd_DIPBDIP(i));
    end generate DIPBDIP_DELAY;

    WEAWEL_DELAY : for i in 0 to 1 generate
      VitalWireDelay (WEAWEL_ipd(i),WEAWEL(i),tipd_WEAWEL(i));
    end generate WEAWEL_DELAY;

    WEBWEU_DELAY : for i in 0 to 1 generate
      VitalWireDelay (WEBWEU_ipd(i),WEBWEU(i),tipd_WEBWEU(i));
    end generate WEBWEU_DELAY;

    VitalWireDelay (CLKAWRCLK_ipd,CLKAWRCLK,tipd_CLKAWRCLK);
    VitalWireDelay (CLKBRDCLK_ipd,CLKBRDCLK,tipd_CLKBRDCLK);
    VitalWireDelay (ENAWREN_ipd,ENAWREN,tipd_ENAWREN);
    VitalWireDelay (ENBRDEN_ipd,ENBRDEN,tipd_ENBRDEN);
    VitalWireDelay (REGCEA_ipd,REGCEA,tipd_REGCEA);
    VitalWireDelay (REGCEBREGCE_ipd,REGCEBREGCE,tipd_REGCEBREGCE);
    VitalWireDelay (RSTA_ipd,RSTA,tipd_RSTA);
    VitalWireDelay (RSTBRST_ipd,RSTBRST,tipd_RSTBRST);

  end block;

  
  SignalDelay   : block
  begin

    ADDRAWRADDR_DELAY : for i in 0 to 12 generate
      VitalSignalDelay (ADDRAWRADDR_int(i), ADDRAWRADDR_ipd(i), tisd_ADDRAWRADDR_CLKAWRCLK(i));
    end generate ADDRAWRADDR_DELAY;

    DIADI_DELAY : for i in 0 to 15 generate
      VitalSignalDelay (DIADI_int(i), DIADI_ipd(i), tisd_DIADI_CLKAWRCLK(i));
    end generate DIADI_DELAY;

    DIPADIP_DELAY : for i in 0 to 1 generate
      VitalSignalDelay (DIPADIP_int(i), DIPADIP_ipd(i), tisd_DIPADIP_CLKAWRCLK(i));
    end generate DIPADIP_DELAY;

    WEAWEL_DELAY : for i in 0 to 1 generate
      VitalSignalDelay (WEAWEL_int(i), WEAWEL_ipd(i), tisd_WEAWEL_CLKAWRCLK(i));
    end generate WEAWEL_DELAY;

    ADDRBRDADDR_DELAY : for i in 0 to 12 generate
      VitalSignalDelay (ADDRBRDADDR_int(i), ADDRBRDADDR_ipd(i), tisd_ADDRBRDADDR_CLKBRDCLK(i));
    end generate ADDRBRDADDR_DELAY;

    DIBDI_DELAY : for i in 0 to 15 generate
      VitalSignalDelay (DIBDI_int(i), DIBDI_ipd(i), tisd_DIBDI_CLKAWRCLK(i));
    end generate DIBDI_DELAY;

    DIPBDIP_DELAY : for i in 0 to 1 generate
      VitalSignalDelay (DIPBDIP_int(i), DIPBDIP_ipd(i), tisd_DIPBDIP_CLKAWRCLK(i));
    end generate DIPBDIP_DELAY;

    WEBWEU_DELAY : for i in 0 to 1 generate
      VitalSignalDelay (WEBWEU_int(i), WEBWEU_ipd(i), tisd_WEBWEU_CLKAWRCLK(i));
    end generate WEBWEU_DELAY;

    VitalSignalDelay (ENAWREN_dly,ENAWREN_ipd,tisd_ENAWREN_CLKAWRCLK);
    VitalSignalDelay (ENBRDEN_dly,ENBRDEN_ipd,tisd_ENBRDEN_CLKBRDCLK);
    VitalSignalDelay (REGCEA_dly,REGCEA_ipd,tisd_REGCEA_CLKAWRCLK);
    VitalSignalDelay (REGCEBREGCE_dly,REGCEBREGCE_ipd,tisd_REGCEBREGCE_CLKBRDCLK);
    VitalSignalDelay (RSTA_dly,RSTA_ipd,tisd_RSTA_CLKAWRCLK);
    VitalSignalDelay (RSTBRST_dly,RSTBRST_ipd,tisd_RSTBRST_CLKBRDCLK);
    VitalSignalDelay (CLKAWRCLK_dly,CLKAWRCLK_ipd,ticd_CLKAWRCLK);
    VitalSignalDelay (CLKBRDCLK_dly,CLKBRDCLK_ipd,ticd_CLKBRDCLK);

  end block;



    
    addrawraddr_dly <= "000" & ADDRAWRADDR_int;
    addrbrdaddr_dly <= "000" & ADDRBRDADDR_int;
    gsr_dly <= GSR;


    TDP: if (RAM_MODE = "TDP") generate

      diadi_dly <= X"000000000000" & DIADI_int;
      dibdi_dly <= X"000000000000" &DIBDI_int;
      dipadip_dly <= "000000" &DIPADIP_int;
      dipbdip_dly <= "000000" &DIPBDIP_int;
      weawel_dly <= "000000" & WEAWEL_int;
      webweu_dly <= "000000" & WEBWEU_int;

    end generate TDP;


    SDP: if (RAM_MODE = "SDP") generate

      diadi_dly <= X"00000000" & DIBDI_int & DIADI_int;
      dibdi_dly <= (others => '0');
      dipadip_dly <= "0000" & DIPBDIP_int & DIPADIP_int;
      dipbdip_dly <= (others => '0');
      weawel_dly <= "0000" & WEBWEU_int & WEAWEL_int;
      webweu_dly <= (others => '0');

    end generate SDP;


    ox_addra_reconstruct(12 downto 0) <= (addrawraddr_dly(12 downto 6) & '0' & addrawraddr_dly(4) & "0000") when
                                          (WRITE_MODE_A = "READ_FIRST" or WRITE_MODE_B = "READ_FIRST")
                                          else
                                          addrawraddr_dly(12 downto 0);


    ox_addrb_reconstruct(12 downto 0) <= (addrbrdaddr_dly(12 downto 6) & '0' & addrbrdaddr_dly(4) & "0000") when
                                          (WRITE_MODE_A = "READ_FIRST" or WRITE_MODE_B = "READ_FIRST")
                                          else
                                          addrbrdaddr_dly(12 downto 0);
  
  --------------------
  --  BEHAVIOR SECTION
  --------------------

    prcs_clk: process (clkawrclk_dly, clkbrdclk_dly, gsr_dly, rsta_dly, rstbrst_dly, enawren_dly, enbrden_dly)

      variable mem_slv : std_logic_vector(8191 downto 0) := To_StdLogicVector(INIT_1F) &
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

    variable memp_slv : std_logic_vector(1023 downto 0) := To_StdLogicVector(INITP_03) &
                                                       To_StdLogicVector(INITP_02) &
                                                       To_StdLogicVector(INITP_01) &
                                                       To_StdLogicVector(INITP_00);

    variable tmp_mem : Two_D_array_type_tmp_mem := two_D_mem_initf(widest_width);
    variable mem : Two_D_array_type := two_D_mem_init(mem_depth, width, mem_slv, tmp_mem);
    variable memp : Two_D_parity_array_type := two_D_mem_initp(memp_depth, widthp, memp_slv, tmp_mem, width);
    variable tmp_addrawraddr_dly_depth : integer;
    variable tmp_addrawraddr_dly_width : integer;
    variable tmp_addrbrdaddr_dly_depth : integer;
    variable tmp_addrbrdaddr_dly_width : integer;
    variable junk1 : std_logic;
    variable wr_mode_a : std_logic_vector(1 downto 0) := "00";
    variable wr_mode_b : std_logic_vector(1 downto 0) := "00";
    variable tmp_syndrome_int : integer;    
    variable doado_buf : std_logic_vector(63 downto 0) := (others => '0');
    variable dobdo_buf : std_logic_vector(63 downto 0) := (others => '0');
    variable dopadop_buf : std_logic_vector(7 downto 0) := (others => '0');
    variable dopbdop_buf : std_logic_vector(7 downto 0) := (others => '0');    
    variable syndrome : std_logic_vector(7 downto 0) := (others => '0');
    variable addrawraddr_dly_15_reg_var : std_logic := '0';
    variable addrbrdaddr_dly_15_reg_var : std_logic := '0';
    variable addrawraddr_dly_15_reg_bram_var : std_logic := '0';
    variable addrbrdaddr_dly_15_reg_bram_var : std_logic := '0';
    variable FIRST_TIME : boolean := true;

    variable time_port_a : time := 0 ps;
    variable time_port_b : time := 0 ps;
    variable viol_time : integer := 0;
    variable viol_type : std_logic_vector(1 downto 0) := (others => '0');
    variable message : line;

    variable diadi_reg_dly : std_logic_vector(63 downto 0) := (others => '0');
    variable dipadip_reg_dly : std_logic_vector(7 downto 0) := (others => '0');
    variable weawel_reg_dly : std_logic_vector(7 downto 0) := (others => '0');
    variable addrawraddr_reg_dly : std_logic_vector(15 downto 0) := (others => '0');
    variable dibdi_reg_dly : std_logic_vector(63 downto 0) := (others => '0');
    variable dipbdip_reg_dly : std_logic_vector(7 downto 0) := (others => '0');
    variable webweu_reg_dly : std_logic_vector(7 downto 0) := (others => '0');
    variable addrbrdaddr_reg_dly : std_logic_vector(15 downto 0) := (others => '0');
    variable col_wr_wr_msg : std_ulogic := '1';
    variable col_wra_rdb_msg : std_ulogic := '1';
    variable col_wrb_rda_msg : std_ulogic := '1';
    variable addr_col : std_logic := '0';
    variable ox_addra_reconstruct_reg : std_logic_vector(12 downto 0) := (others => '0');
    variable ox_addrb_reconstruct_reg : std_logic_vector(12 downto 0) := (others => '0');
    variable chk_ox_msg : integer := 0;
    variable chk_ox_same_clk : integer := 0;
    variable chk_col_same_clk : integer := 0;
      
  begin  -- process prcs_clkawrclk    

    if (FIRST_TIME) then


      if (INIT_FILE /= "NONE") then
       assert false
         report "DRC Error : The INIT_FILE attribute on X_RAMB8BWER instance must be set to NONE.  Currently, initializing memory contents of this component via an external file is not supported.  Please set this attribute to the default value of NONE and specify any initialization of this component via the INIT_xx attributes."
            severity failure;
     end if;

  
      case DATA_WIDTH_A is
        when 0 | 1 | 2 | 4 | 9 | 18 => null;
        when 36 => if (RAM_MODE /= "SDP") then
                     assert false
                       report "DRC error : The attribute DATA_WIDTH_A = 36 requires RAM_MODE set to SDP on X_RAMB8BWER."
                       severity failure;
                   end if;                                    
        when others => GenericValueCheckMessage
                         (  HeaderMsg            => " Attribute Syntax Error : ",
                            GenericName          => " DATA_WIDTH_A ",
                            EntityName           => "X_RAMB8BWER",
                            GenericValue         => DATA_WIDTH_A,
                            Unit                 => "",
                            ExpectedValueMsg     => " The Legal values for this attribute are ",
                            ExpectedGenericValue => " 0, 1, 2, 4, 9, 18 or 36.",
                            TailMsg              => "",
                            MsgSeverity          => failure
                            );
      end case;


      case DATA_WIDTH_B is
        when 0 | 1 | 2 | 4 | 9 | 18 => null;
        when 36 => if (RAM_MODE /= "SDP") then
                     assert false
                       report "DRC error : The attribute DATA_WIDTH_B = 36 requires RAM_MODE set to SDP on X_RAMB8BWER."
                       severity failure;
                   end if;
        when others => GenericValueCheckMessage
                         (  HeaderMsg            => " Attribute Syntax Error : ",
                            GenericName          => " DATA_WIDTH_B ",
                            EntityName           => "X_RAMB8BWER",
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
        report "Attribute Syntax Error : Attributes DATA_WIDTH_A and DATA_WIDTH_B on X_RAMB8BWER instance, both can not be 0."
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
            EntityName           => "X_RAMB8BWER",
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
            EntityName           => "X_RAMB8BWER",
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
           EntityName => "X_RAMB8BWER",
           GenericValue => SIM_COLLISION_CHECK,
           Unit => "",
           ExpectedValueMsg => "Legal Values for this attribute are ALL, NONE, WARNING_ONLY or GENERATE_X_ONLY",
           ExpectedGenericValue => "",
           TailMsg => "",
           MsgSeverity => error
           );
      end if;

      
      if (RAM_MODE = "SDP") then

        if ((WRITE_MODE_A /= WRITE_MODE_B) or WRITE_MODE_A = "NO_CHANGE" or WRITE_MODE_A = "NO_CHANGE") then
          assert false
            report "DRC Error : Both attributes WRITE_MODE_A and WRITE_MODE_B must be set to READ_FIRST or both attributes must be set to WRITE_FIRST when RAM_MODE = SDP on X_RAMB8BWER instance."
            severity failure;
        end if;

        
        if (DATA_WIDTH_A /= 36 or DATA_WIDTH_B /= 36) then
          assert false
            report "DRC Error : DATA_WIDTH_A and DATA_WIDTH_B are required to be set to 36 in simple dual port (SDP) mode on X_RAMB8BWER instance."
            severity failure;
        end if;

      end if;

      
      if (RAM_MODE /= "TDP" and RAM_MODE /= "SDP") then 
        GenericValueCheckMessage
          ( HeaderMsg            => " Attribute Syntax Error : ",
            GenericName          => " RAM_MODE ",
            EntityName           => "X_RAMB8BWER",
            GenericValue         => RAM_MODE,
            Unit                 => "",
            ExpectedValueMsg     => " The Legal values for this attribute are ",
            ExpectedGenericValue => " TDP or SDP ",
            TailMsg              => "",
            MsgSeverity          => failure
            );
      end if;


    end if;
    -- end of FIRST_TIME
    

    if (rising_edge(clkawrclk_dly)) then

      if (enawren_dly = '1') then      
        time_port_a := now;
        addrawraddr_reg_dly := addrawraddr_dly;
        weawel_reg_dly := weawel_dly;
        diadi_reg_dly := diadi_dly;
        dipadip_reg_dly := dipadip_dly;
        ox_addra_reconstruct_reg := ox_addra_reconstruct;
      end if;
      
    end if;
    
    if (rising_edge(clkbrdclk_dly)) then

      if (enbrden_dly = '1') then
        time_port_b := now;
        addrbrdaddr_reg_dly := addrbrdaddr_dly;
        webweu_reg_dly := webweu_dly;
        dibdi_reg_dly := dibdi_dly;
        dipbdip_reg_dly := dipbdip_dly;
        ox_addrb_reconstruct_reg := ox_addrb_reconstruct;
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

     if (rising_edge(clkawrclk_dly) or rising_edge(clkbrdclk_dly)) then


-------------------------------------------------------------------------------
-- Collision starts
-------------------------------------------------------------------------------

       if (SIM_COLLISION_CHECK /= "NONE") then

         if (time_port_a > time_port_b) then
           
           if (time_port_a - time_port_b <= 100 ps) then
             viol_time := 1;
           elsif (time_port_a - time_port_b <= SETUP_READ_FIRST) then
             viol_time := 2;
           end if;

         else
  
           if (time_port_b - time_port_a <= 100 ps) then
             viol_time := 1;
           elsif (time_port_b - time_port_a <= SETUP_READ_FIRST) then
             viol_time := 2;
           end if;

         end if;

           
        if (enawren_dly = '0' or enbrden_dly = '0') then
          viol_time := 0;
        end if;

        
        if ((DATA_WIDTH_A <= 9 and weawel_dly(0) = '0') or (DATA_WIDTH_A = 18 and weawel_dly(1 downto 0) = "00") or (DATA_WIDTH_A = 36 and weawel_dly(3 downto 0) = "0000")) then
          if ((DATA_WIDTH_B <= 9 and webweu_dly(0) = '0') or (DATA_WIDTH_B = 18 and webweu_dly(1 downto 0) = "00") or (DATA_WIDTH_B = 36 and webweu_dly(3 downto 0) = "0000")) then
            viol_time := 0;
          end if;
        end if;

        
        if (viol_time /= 0) then
          
          if ((rising_edge(clkawrclk_dly) and rising_edge(clkbrdclk_dly)) or  viol_time = 1) then
            
            if (addrawraddr_dly(12 downto col_addr_lsb) = addrbrdaddr_dly(12 downto col_addr_lsb)) then
              
              viol_type := "01";
              chk_col_same_clk := 1;
              
              prcd_rd_ram_a (addrawraddr_dly, doado_buf, dopadop_buf, mem, memp);
              prcd_rd_ram_b (addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp);
              
              prcd_col_wr_ram_a (viol_time, "00", webweu_dly, weawel_dly, di_x, di_x(7 downto 0), addrbrdaddr_dly, addrawraddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              prcd_col_wr_ram_b (viol_time, "00", weawel_dly, webweu_dly, di_x, di_x(7 downto 0), addrawraddr_dly, addrbrdaddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              chk_col_same_clk := 0;
              
              prcd_col_rd_ram_a (viol_type, "01", webweu_dly, weawel_dly, addrawraddr_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              prcd_col_rd_ram_b (viol_type, "01", weawel_dly, webweu_dly, addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);

              prcd_col_wr_ram_a (viol_time, "10", webweu_dly, weawel_dly, diadi_dly, dipadip_dly, addrbrdaddr_dly, addrawraddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              prcd_col_wr_ram_b (viol_time, "10", weawel_dly, webweu_dly, dibdi_dly, dipbdip_dly, addrawraddr_dly, addrbrdaddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              if (wr_mode_a /= "01") then
                prcd_col_rd_ram_a (viol_type, "11", webweu_dly, weawel_dly, addrawraddr_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              end if;

              if (wr_mode_b /= "01") then
                prcd_col_rd_ram_b (viol_type, "11", weawel_dly, webweu_dly, addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);
              end if;

            elsif ((wr_mode_a = "01" or wr_mode_b = "01") and (ox_addra_reconstruct(12 downto col_addr_lsb) = ox_addrb_reconstruct(12 downto col_addr_lsb))) then
              
              viol_type := "01";
              chk_ox_msg := 1;
              chk_ox_same_clk := 1;
              
              prcd_rd_ram_a (addrawraddr_dly, doado_buf, dopadop_buf, mem, memp);
              prcd_rd_ram_b (addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp);
              
              prcd_col_wr_ram_a (viol_time, "00", webweu_dly, weawel_dly, di_x, di_x(7 downto 0), addrbrdaddr_dly, addrawraddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              prcd_col_wr_ram_b (viol_time, "00", weawel_dly, webweu_dly, di_x, di_x(7 downto 0), addrawraddr_dly, addrbrdaddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              chk_ox_msg := 0;
              chk_ox_same_clk := 0;
              
              prcd_ox_wr_ram_a (viol_time, "10", webweu_dly, weawel_dly, diadi_dly, dipadip_dly, addrbrdaddr_dly, addrawraddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              prcd_ox_wr_ram_b (viol_time, "10", weawel_dly, webweu_dly, dibdi_dly, dipbdip_dly, addrawraddr_dly, addrbrdaddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              
              if (wr_mode_a /= "01") then
                prcd_col_rd_ram_a (viol_type, "11", webweu_dly, weawel_dly, addrawraddr_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              end if;

              if (wr_mode_b /= "01") then
                prcd_col_rd_ram_b (viol_type, "11", weawel_dly, webweu_dly, addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);
              end if;

            else
              viol_time := 0;
              
            end if;


          elsif (rising_edge(clkawrclk_dly) and  (not(rising_edge(clkbrdclk_dly)))) then
            
            if (addrawraddr_dly(12 downto col_addr_lsb) = addrbrdaddr_reg_dly(12 downto col_addr_lsb)) then
              
              viol_type := "10";

              prcd_rd_ram_a (addrawraddr_dly, doado_buf, dopadop_buf, mem, memp);

              prcd_col_wr_ram_a (viol_time, "00", webweu_reg_dly, weawel_dly, di_x, di_x(7 downto 0), addrbrdaddr_reg_dly, addrawraddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              prcd_col_wr_ram_b (viol_time, "00", weawel_dly, webweu_reg_dly, di_x, di_x(7 downto 0), addrawraddr_dly, addrbrdaddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              prcd_col_rd_ram_a (viol_type, "01", webweu_reg_dly, weawel_dly, addrawraddr_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              prcd_col_rd_ram_b (viol_type, "01", weawel_dly, webweu_reg_dly, addrbrdaddr_reg_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);

              prcd_col_wr_ram_a (viol_time, "10", webweu_reg_dly, weawel_dly, diadi_dly, dipadip_dly, addrbrdaddr_reg_dly, addrawraddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              prcd_col_wr_ram_b (viol_time, "10", weawel_dly, webweu_reg_dly, dibdi_reg_dly, dipbdip_reg_dly, addrawraddr_dly, addrbrdaddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

			    
              if (wr_mode_a /= "01") then
                prcd_col_rd_ram_a (viol_type, "11", webweu_reg_dly, weawel_dly, addrawraddr_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              end if;

              if (wr_mode_b /= "01") then
                prcd_col_rd_ram_b (viol_type, "11", weawel_dly, webweu_reg_dly, addrbrdaddr_reg_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);
              end if;
              
              if (wr_mode_a = "01" or wr_mode_b = "01") then 
                prcd_col_wr_ram_a (viol_time, "10", webweu_reg_dly, weawel_dly, di_x, di_x(7 downto 0), addrbrdaddr_reg_dly, addrawraddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
                prcd_col_wr_ram_b (viol_time, "10", weawel_dly, webweu_reg_dly, di_x, di_x(7 downto 0), addrawraddr_dly, addrbrdaddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              end if;

              
            elsif ((wr_mode_a = "01" or wr_mode_b = "01") and (ox_addra_reconstruct(12 downto col_addr_lsb) = ox_addrb_reconstruct_reg(12 downto col_addr_lsb))) then

              viol_type := "10";
              chk_ox_msg := 1;
              
              prcd_rd_ram_a (addrawraddr_dly, doado_buf, dopadop_buf, mem, memp);

              prcd_col_wr_ram_a (viol_time, "00", webweu_reg_dly, weawel_dly, di_x, di_x(7 downto 0), addrbrdaddr_reg_dly, addrawraddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              prcd_col_wr_ram_b (viol_time, "00", weawel_dly, webweu_reg_dly, di_x, di_x(7 downto 0), addrawraddr_dly, addrbrdaddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              
              chk_ox_msg := 0;

              prcd_ox_wr_ram_a (viol_time, "10", webweu_reg_dly, weawel_dly, diadi_dly, dipadip_dly, addrbrdaddr_reg_dly, addrawraddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              prcd_ox_wr_ram_b (viol_time, "10", weawel_dly, webweu_reg_dly, dibdi_reg_dly, dipbdip_reg_dly, addrawraddr_dly, addrbrdaddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

			    
              if (wr_mode_a /= "01") then
                prcd_col_rd_ram_a (viol_type, "11", webweu_reg_dly, weawel_dly, addrawraddr_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              end if;

              if (wr_mode_b /= "01") then
                prcd_col_rd_ram_b (viol_type, "11", weawel_dly, webweu_reg_dly, addrbrdaddr_reg_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);
              end if;
              

              prcd_col_wr_ram_a (viol_time, "10", webweu_reg_dly, "11111111", di_x, di_x(7 downto 0), addrbrdaddr_reg_dly, addrawraddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              prcd_col_wr_ram_b (viol_time, "10", weawel_dly, "11111111", di_x, di_x(7 downto 0), addrawraddr_dly, addrbrdaddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              
            else
              viol_time := 0;
              
            end if;

          elsif ((not(rising_edge(clkawrclk_dly))) and rising_edge(clkbrdclk_dly)) then

            if (addrawraddr_reg_dly(12 downto col_addr_lsb) = addrbrdaddr_dly(12 downto col_addr_lsb)) then
                              
              viol_type := "11";

              prcd_rd_ram_b (addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp);

              prcd_col_wr_ram_a (viol_time, "00", webweu_dly, weawel_reg_dly, di_x, di_x(7 downto 0), addrbrdaddr_dly, addrawraddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              prcd_col_wr_ram_b (viol_time, "00", weawel_reg_dly, webweu_dly, di_x, di_x(7 downto 0), addrawraddr_reg_dly, addrbrdaddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              prcd_col_rd_ram_a (viol_type, "01", webweu_dly, weawel_reg_dly, addrawraddr_reg_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              prcd_col_rd_ram_b (viol_type, "01", weawel_reg_dly, webweu_dly, addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);

              prcd_col_wr_ram_a (viol_time, "10", webweu_dly, weawel_reg_dly, diadi_reg_dly, dipadip_reg_dly, addrbrdaddr_dly, addrawraddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              prcd_col_wr_ram_b (viol_time, "10", weawel_reg_dly, webweu_dly, dibdi_dly, dipbdip_dly, addrawraddr_reg_dly, addrbrdaddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

			    
              if (wr_mode_a /= "01") then
                prcd_col_rd_ram_a (viol_type, "11", webweu_dly, weawel_reg_dly, addrawraddr_reg_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              end if;

              if (wr_mode_b /= "01") then
                prcd_col_rd_ram_b (viol_type, "11", weawel_reg_dly, webweu_dly, addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);
              end if;

              if (wr_mode_a = "01" or wr_mode_b = "01") then
                prcd_col_wr_ram_a (viol_time, "10", webweu_dly, weawel_reg_dly, di_x, di_x(7 downto 0), addrbrdaddr_dly, addrawraddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
                prcd_col_wr_ram_b (viol_time, "10", weawel_reg_dly, webweu_dly, di_x, di_x(7 downto 0), addrawraddr_reg_dly, addrbrdaddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              end if;

            elsif ((wr_mode_a = "01" or wr_mode_b = "01") and (ox_addra_reconstruct_reg(12 downto col_addr_lsb) = ox_addrb_reconstruct(12 downto col_addr_lsb))) then

              viol_type := "11";
              chk_ox_msg := 1;
              
              prcd_rd_ram_b (addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp);

              prcd_col_wr_ram_a (viol_time, "00", webweu_dly, weawel_reg_dly, di_x, di_x(7 downto 0), addrbrdaddr_dly, addrawraddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              prcd_col_wr_ram_b (viol_time, "00", weawel_reg_dly, webweu_dly, di_x, di_x(7 downto 0), addrawraddr_reg_dly, addrbrdaddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              chk_ox_msg := 0;

              prcd_ox_wr_ram_a (viol_time, "10", webweu_dly, weawel_reg_dly, diadi_reg_dly, dipadip_reg_dly, addrbrdaddr_dly, addrawraddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

              prcd_ox_wr_ram_b (viol_time, "10", weawel_reg_dly, webweu_dly, dibdi_dly, dipbdip_dly, addrawraddr_reg_dly, addrbrdaddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);

			    
              if (wr_mode_a /= "01") then
                prcd_col_rd_ram_a (viol_type, "11", webweu_dly, weawel_reg_dly, addrawraddr_reg_dly, doado_buf, dopadop_buf, mem, memp, wr_mode_a);
              end if;

              if (wr_mode_b /= "01") then
                prcd_col_rd_ram_b (viol_type, "11", weawel_reg_dly, webweu_dly, addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp, wr_mode_b);
              end if;

              prcd_col_wr_ram_a (viol_time, "10", webweu_dly, "11111111", di_x, di_x(7 downto 0), addrbrdaddr_dly, addrawraddr_reg_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);
              prcd_col_wr_ram_b (viol_time, "10", weawel_reg_dly, "11111111", di_x, di_x(7 downto 0), addrawraddr_reg_dly, addrbrdaddr_dly, mem, memp, col_wr_wr_msg, col_wra_rdb_msg, col_wrb_rda_msg, chk_col_same_clk, chk_ox_same_clk, chk_ox_msg);


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
    if (rising_edge(clkawrclk_dly) or ((rising_edge(rsta_dly) or rising_edge(enawren_dly)) and RSTTYPE = "ASYNC")) then

      if (gsr_dly = '0' and ((enawren_dly = '1' and RST_PRIORITY_A = "CE") or RST_PRIORITY_A = "SR")) then

        if (rsta_dly = '1' and EN_RSTRAM_A = TRUE) then

          doado_buf(a_width-1 downto 0) := SRVAL_A_STD(a_width-1 downto 0);
          doado_out(a_width-1 downto 0) <= SRVAL_A_STD(a_width-1 downto 0);          

          if (a_width >= 8) then
            dopadop_buf(a_widthp-1 downto 0) := SRVAL_A_STD((a_width+a_widthp)-1 downto a_width);
            dopadop_out(a_widthp-1 downto 0) <= SRVAL_A_STD((a_width+a_widthp)-1 downto a_width);            
          end if;

        end if;

        if (viol_time = 0 and rising_edge(clkawrclk_dly)) then
          -- read for rf
          if (wr_mode_a = "01" and (rsta_dly = '0' or EN_RSTRAM_A = FALSE)) then
            prcd_rd_ram_a (addrawraddr_dly, doado_buf, dopadop_buf, mem, memp);
          end if;

          if (enawren_dly = '1') then
            prcd_wr_ram_a (weawel_dly, diadi_dly, dipadip_dly, addrawraddr_dly, mem, memp);    
          end if;
          
          if (wr_mode_a /= "01" and (rsta_dly = '0' or EN_RSTRAM_A = FALSE)) then
            prcd_rd_ram_a (addrawraddr_dly, doado_buf, dopadop_buf, mem, memp);
          end if;

        
        end if;
      end if;
    end if;
    
-------------------------------------------------------------------------------
-- Port B
-------------------------------------------------------------------------------

    if (rising_edge(clkbrdclk_dly) or ((rising_edge(rstbrst_dly) or rising_edge(enbrden_dly)) and RSTTYPE = "ASYNC")) then


      if (gsr_dly = '0' and ((enbrden_dly = '1' and RST_PRIORITY_B = "CE") or RST_PRIORITY_B = "SR")) then

        if (rstbrst_dly = '1' and EN_RSTRAM_B = TRUE) then

          dobdo_buf(b_width-1 downto 0) := SRVAL_B_STD(b_width-1 downto 0);
          dobdo_out(b_width-1 downto 0) <= SRVAL_B_STD(b_width-1 downto 0);          

          if (b_width >= 8) then
            dopbdop_buf(b_widthp-1 downto 0) := SRVAL_B_STD((b_width+b_widthp)-1 downto b_width);
            dopbdop_out(b_widthp-1 downto 0) <= SRVAL_B_STD((b_width+b_widthp)-1 downto b_width);            
          end if;

        end if;


        if (viol_time = 0 and rising_edge(clkbrdclk_dly)) then
          
          if (wr_mode_b = "01" and (rstbrst_dly = '0' or EN_RSTRAM_B = FALSE)) then
            prcd_rd_ram_b (addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp);            
          end if;

          if (enbrden_dly = '1') then
            prcd_wr_ram_b (webweu_dly, dibdi_dly, dipbdip_dly, addrbrdaddr_dly, mem, memp);
          end if;
          
          if (wr_mode_b /= "01" and (rstbrst_dly = '0' or EN_RSTRAM_B = FALSE)) then
            prcd_rd_ram_b (addrbrdaddr_dly, dobdo_buf, dopbdop_buf, mem, memp);
          end if;
          
        end if;
      end if;
    end if;
    

    if (enawren_dly = '1' and (rising_edge(clkawrclk_dly) or viol_time /= 0)) then
      if ((rsta_dly = '0' or EN_RSTRAM_A = FALSE) and (wr_mode_a /= "10" or (DATA_WIDTH_A <= 9 and weawel_dly(0) = '0') or (DATA_WIDTH_A = 18 and weawel_dly(1 downto 0) = "00") or (DATA_WIDTH_A = 36 and weawel_dly(3 downto 0) = "0000"))) then

        doado_out <= doado_buf;
        dopadop_out <= dopadop_buf;

      end if;
    end if;

    
    if (enbrden_dly = '1' and (rising_edge(clkbrdclk_dly) or viol_time /= 0)) then

      if ((rstbrst_dly = '0' or EN_RSTRAM_B = FALSE) and (wr_mode_b /= "10" or (DATA_WIDTH_B <= 9 and webweu_dly(0) = '0') or (DATA_WIDTH_B = 18 and webweu_dly(1 downto 0) = "00") or (DATA_WIDTH_B = 36 and webweu_dly(3 downto 0) = "0000"))) then

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


  outreg_clkawrclk: process (clkawrclk_dly, gsr_dly, rsta_dly, regcea_dly)
    variable FIRST_TIME : boolean := true;
    
  begin  -- process outreg_clkawrclk

    if (rising_edge(clkawrclk_dly) or rising_edge(gsr_dly) or FIRST_TIME or ((rising_edge(rsta_dly) or (rsta_dly = '1' and rising_edge(regcea_dly))) and RSTTYPE = "ASYNC")) then
          
      if (DOA_REG = 1) then
        
        if (gsr_dly = '1' or FIRST_TIME) then

          doado_outreg(a_width-1 downto 0) <= INIT_A_STD(a_width-1 downto 0);

          if (a_width >= 8) then
            dopadop_outreg(a_widthp-1 downto 0) <= INIT_A_STD((a_width+a_widthp)-1 downto a_width);
          end if;

          FIRST_TIME := false;
          
        elsif (gsr_dly = '0') then

          if (RST_PRIORITY_A = "CE") then

            if (regcea_dly = '1') then
              if (rsta_dly = '1') then

                doado_outreg(a_width-1 downto 0) <= SRVAL_A_STD(a_width-1 downto 0);

                if (a_width >= 8) then
                  dopadop_outreg(a_widthp-1 downto 0) <= SRVAL_A_STD((a_width+a_widthp)-1 downto a_width);
                end if;

              elsif (rsta_dly = '0') then
                doado_outreg <= doado_out;
                dopadop_outreg <= dopadop_out;

              end if;     
            end if;

          else
          
            if (rsta_dly = '1') then

              doado_outreg(a_width-1 downto 0) <= SRVAL_A_STD(a_width-1 downto 0);

              if (a_width >= 8) then
                dopadop_outreg(a_widthp-1 downto 0) <= SRVAL_A_STD((a_width+a_widthp)-1 downto a_width);
              end if;

            elsif (rsta_dly = '0') then
              
              if (regcea_dly = '1') then

                doado_outreg <= doado_out;
                dopadop_outreg <= dopadop_out;

              end if;     
            end if;
          end if;
        end if;
      end if;

    end if;
  end process outreg_clkawrclk;
  

  outmux_clkawrclk: process (doado_out, dopadop_out, doado_outreg, dopadop_outreg)
  begin  -- process outmux_clkawrclk

      case DOA_REG is

        when 0 =>
                  doado_out_out(a_width-1 downto 0) <= doado_out(a_width-1 downto 0);
                  dopadop_out_out(a_widthp-1 downto 0) <= dopadop_out(a_widthp-1 downto 0);
        when 1 =>
                  doado_out_out(a_width-1 downto 0) <= doado_outreg(a_width-1 downto 0);
                  dopadop_out_out(a_widthp-1 downto 0) <= dopadop_outreg(a_widthp-1 downto 0);

        when others => assert false
                       report "Attribute Syntax Error: The allowed integer values for DOA_REG are 0 or 1."
                       severity Failure;
      end case;

  end process outmux_clkawrclk;
  

  outreg_clkbrdclk: process (clkbrdclk_dly, gsr_dly, rstbrst_dly, regcebregce_dly)
    variable FIRST_TIME : boolean := true;

  begin  -- process outreg_clkbrdclk

    if (rising_edge(clkbrdclk_dly) or rising_edge(gsr_dly) or FIRST_TIME or ((rising_edge(rstbrst_dly) or (rstbrst_dly = '1' and rising_edge(regcebregce_dly))) and RSTTYPE = "ASYNC")) then

      if (DOB_REG = 1) then
        
        if (gsr_dly = '1' or FIRST_TIME) then
          dobdo_outreg(b_width-1 downto 0) <= INIT_B_STD(b_width-1 downto 0);

          if (b_width >= 8) then
            dopbdop_outreg(b_widthp-1 downto 0) <= INIT_B_STD((b_width+b_widthp)-1 downto b_width);
          end if;

          FIRST_TIME := false;
          
        elsif (gsr_dly = '0') then

          if (RST_PRIORITY_B = "CE") then

            if (regcebregce_dly = '1') then
              if (rstbrst_dly = '1') then

                dobdo_outreg(b_width-1 downto 0) <= SRVAL_B_STD(b_width-1 downto 0);

                if (b_width >= 8) then
                  dopbdop_outreg(b_widthp-1 downto 0) <= SRVAL_B_STD((b_width+b_widthp)-1 downto b_width);
                end if;

              elsif (rstbrst_dly = '0') then

                dobdo_outreg <= dobdo_out;
                dopbdop_outreg <= dopbdop_out;

              end if;     
            end if;

          else
          
            if (rstbrst_dly = '1') then

              dobdo_outreg(b_width-1 downto 0) <= SRVAL_B_STD(b_width-1 downto 0);

              if (b_width >= 8) then
                dopbdop_outreg(b_widthp-1 downto 0) <= SRVAL_B_STD((b_width+b_widthp)-1 downto b_width);
              end if;

            elsif (rstbrst_dly = '0') then

              if (regcebregce_dly = '1') then

                dobdo_outreg <= dobdo_out;
                dopbdop_outreg <= dopbdop_out;

              end if;
            end if;
          end if;
        end if;
      end if;
      
    end if;
  end process outreg_clkbrdclk;

  
  outmux_clkbrdclk: process (dobdo_out, dopbdop_out, dobdo_outreg, dopbdop_outreg)
  begin  -- process outmux_clkbrdclk

      case DOB_REG is

        when 0 =>
                  dobdo_out_out(b_width-1 downto 0) <= dobdo_out(b_width-1 downto 0);
                  dopbdop_out_out(b_widthp-1 downto 0) <= dopbdop_out(b_widthp-1 downto 0);
        when 1 =>
                  dobdo_out_out(b_width-1 downto 0) <= dobdo_outreg(b_width-1 downto 0);
                  dopbdop_out_out(b_widthp-1 downto 0) <= dopbdop_outreg(b_widthp-1 downto 0);

        when others => assert false
                       report "Attribute Syntax Error: The allowed integer values for DOB_REG are 0 or 1."
                       severity Failure;
      end case;

  end process outmux_clkbrdclk;


-------------------------------------------------------------------------------
-- Timing check
-------------------------------------------------------------------------------
  process

    variable Tviol_ADDRAWRADDR0_CLKAWRCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR1_CLKAWRCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR2_CLKAWRCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR3_CLKAWRCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR4_CLKAWRCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR5_CLKAWRCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR6_CLKAWRCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR7_CLKAWRCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR8_CLKAWRCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR9_CLKAWRCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR10_CLKAWRCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR11_CLKAWRCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRAWRADDR12_CLKAWRCLK_posedge : std_ulogic := '0';
    variable Tviol_DIADI0_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIADI1_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIADI2_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIADI3_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIADI4_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIADI5_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIADI6_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIADI7_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIADI8_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIADI9_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIADI10_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIADI11_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIADI12_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIADI13_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIADI14_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIADI15_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIPADIP0_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIPADIP1_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIBDI0_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI1_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI2_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI3_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI4_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI5_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI6_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI7_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI8_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI9_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI10_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIBDI11_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIBDI12_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIBDI13_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIBDI14_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIBDI15_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIPBDIP0_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIPBDIP1_CLKAWRCLK_posedge   : std_ulogic := '0';
    variable Tviol_ENAWREN_CLKAWRCLK_posedge     : std_ulogic := '0';
    variable Tviol_RSTA_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_WEAWEL0_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_WEAWEL1_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_WEBWEU0_CLKAWRCLK_posedge    : std_ulogic := '0';
    variable Tviol_WEBWEU1_CLKAWRCLK_posedge    : std_ulogic := '0';
    
    variable Tviol_ADDRBRDADDR0_CLKBRDCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR1_CLKBRDCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR2_CLKBRDCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR3_CLKBRDCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR4_CLKBRDCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR5_CLKBRDCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR6_CLKBRDCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR7_CLKBRDCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR8_CLKBRDCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR9_CLKBRDCLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR10_CLKBRDCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR11_CLKBRDCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRBRDADDR12_CLKBRDCLK_posedge : std_ulogic := '0';
    variable Tviol_DIBDI0_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI1_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI2_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI3_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI4_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI5_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI6_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI7_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI8_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI9_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIBDI10_CLKBRDCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIBDI11_CLKBRDCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIBDI12_CLKBRDCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIBDI13_CLKBRDCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIBDI14_CLKBRDCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIBDI15_CLKBRDCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIPBDIP0_CLKBRDCLK_posedge   : std_ulogic := '0';
    variable Tviol_DIPBDIP1_CLKBRDCLK_posedge   : std_ulogic := '0';
    variable Tviol_ENBRDEN_CLKBRDCLK_posedge     : std_ulogic := '0';
    variable Tviol_RSTBRST_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_WEBWEU0_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_WEBWEU1_CLKBRDCLK_posedge    : std_ulogic := '0';
    variable Tviol_RSTA_CLKAWRCLK_negedge    : std_ulogic := '0';
    variable Tviol_RSTBRST_CLKBRDCLK_negedge    : std_ulogic := '0';

    variable Tmkr_RSTA_CLKAWRCLK_negedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RSTBRST_CLKBRDCLK_negedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR0_CLKAWRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR1_CLKAWRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR2_CLKAWRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR3_CLKAWRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR4_CLKAWRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR5_CLKAWRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR6_CLKAWRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR7_CLKAWRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR8_CLKAWRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR9_CLKAWRCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR10_CLKAWRCLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR11_CLKAWRCLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRAWRADDR12_CLKAWRCLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI0_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI1_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI2_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI3_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI4_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI5_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI6_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI7_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI8_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI9_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI10_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI11_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI12_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI13_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI14_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIADI15_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPADIP0_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPADIP1_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI0_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI1_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI2_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI3_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI4_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI5_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI6_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI7_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI8_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI9_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI10_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI11_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI12_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI13_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI14_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI15_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPBDIP0_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPBDIP1_CLKAWRCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENAWREN_CLKAWRCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RSTA_CLKAWRCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEAWEL0_CLKAWRCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEAWEL1_CLKAWRCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEBWEU0_CLKAWRCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEBWEU1_CLKAWRCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    
    variable Tmkr_ADDRBRDADDR0_CLKBRDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR1_CLKBRDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR2_CLKBRDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR3_CLKBRDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR4_CLKBRDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR5_CLKBRDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR6_CLKBRDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR7_CLKBRDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR8_CLKBRDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR9_CLKBRDCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR10_CLKBRDCLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR11_CLKBRDCLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRBRDADDR12_CLKBRDCLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI0_CLKBRDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI1_CLKBRDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI2_CLKBRDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI3_CLKBRDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI4_CLKBRDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI5_CLKBRDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI6_CLKBRDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI7_CLKBRDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI8_CLKBRDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI9_CLKBRDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI10_CLKBRDCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI11_CLKBRDCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI12_CLKBRDCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI13_CLKBRDCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI14_CLKBRDCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIBDI15_CLKBRDCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPBDIP0_CLKBRDCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPBDIP1_CLKBRDCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENBRDEN_CLKBRDCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RSTBRST_CLKBRDCLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEBWEU0_CLKBRDCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEBWEU1_CLKBRDCLK_posedge      : VitalTimingDataType := VitalTimingDataInit;

    variable PViol_CLKAWRCLK, PViol_CLKBRDCLK : std_ulogic          := '0';
    variable PInfo_CLKAWRCLK, PInfo_CLKBRDCLK : VitalPeriodDataType := VitalPeriodDataInit;
    
  begin  -- process
    if (TimingChecksOn) then

      VitalSetupHoldCheck (
        Violation      => Tviol_ENAWREN_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ENAWREN_CLKAWRCLK_posedge,
        TestSignal     => ENAWREN_dly,
        TestSignalName => "ENAWREN",
        TestDelay      => tisd_ENAWREN_CLKAWRCLK,
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ENAWREN_CLKAWRCLK_posedge_posedge,
        HoldHigh       => thold_ENAWREN_CLKAWRCLK_posedge_posedge,
        SetupLow       => tsetup_ENAWREN_CLKAWRCLK_negedge_posedge,
        HoldLow        => thold_ENAWREN_CLKAWRCLK_negedge_posedge,
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING);              
      VitalSetupHoldCheck (
        Violation      => Tviol_RSTA_CLKAWRCLK_posedge,
        TimingData     => Tmkr_RSTA_CLKAWRCLK_posedge,
        TestSignal     => RSTA_dly,
        TestSignalName => "RSTA",
        TestDelay      => tisd_RSTA_CLKAWRCLK,
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_RSTA_CLKAWRCLK_posedge_posedge,
        SetupLow       => tsetup_RSTA_CLKAWRCLK_negedge_posedge,
        HoldLow        => thold_RSTA_CLKAWRCLK_negedge_posedge,
        HoldHigh       => thold_RSTA_CLKAWRCLK_posedge_posedge,
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEAWEL0_CLKAWRCLK_posedge,
        TimingData     => Tmkr_WEAWEL0_CLKAWRCLK_posedge,
        TestSignal     => WEAWEL_dly(0),
        TestSignalName => "WEAWEL(0)",
        TestDelay      => tisd_WEAWEL_CLKAWRCLK(0),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_WEAWEL_CLKAWRCLK_posedge_posedge(0),
        SetupLow       => tsetup_WEAWEL_CLKAWRCLK_negedge_posedge(0),
        HoldLow        => thold_WEAWEL_CLKAWRCLK_negedge_posedge(0),
        HoldHigh       => thold_WEAWEL_CLKAWRCLK_posedge_posedge(0),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEAWEL1_CLKAWRCLK_posedge,
        TimingData     => Tmkr_WEAWEL1_CLKAWRCLK_posedge,
        TestSignal     => WEAWEL_dly(1),
        TestSignalName => "WEAWEL(1)",
        TestDelay      => tisd_WEAWEL_CLKAWRCLK(1),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_WEAWEL_CLKAWRCLK_posedge_posedge(1),
        SetupLow       => tsetup_WEAWEL_CLKAWRCLK_negedge_posedge(1),
        HoldLow        => thold_WEAWEL_CLKAWRCLK_negedge_posedge(1),
        HoldHigh       => thold_WEAWEL_CLKAWRCLK_posedge_posedge(1),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEBWEU0_CLKAWRCLK_posedge,
        TimingData     => Tmkr_WEBWEU0_CLKAWRCLK_posedge,
        TestSignal     => WEBWEU_dly(0),
        TestSignalName => "WEBWEU(0)",
        TestDelay      => tisd_WEBWEU_CLKAWRCLK(0),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_WEBWEU_CLKAWRCLK_posedge_posedge(0),
        SetupLow       => tsetup_WEBWEU_CLKAWRCLK_negedge_posedge(0),
        HoldLow        => thold_WEBWEU_CLKAWRCLK_negedge_posedge(0),
        HoldHigh       => thold_WEBWEU_CLKAWRCLK_posedge_posedge(0),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEBWEU1_CLKAWRCLK_posedge,
        TimingData     => Tmkr_WEBWEU1_CLKAWRCLK_posedge,
        TestSignal     => WEBWEU_dly(1),
        TestSignalName => "WEBWEU(1)",
        TestDelay      => tisd_WEBWEU_CLKAWRCLK(1),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_WEBWEU_CLKAWRCLK_posedge_posedge(1),
        SetupLow       => tsetup_WEBWEU_CLKAWRCLK_negedge_posedge(1),
        HoldLow        => thold_WEBWEU_CLKAWRCLK_negedge_posedge(1),
        HoldHigh       => thold_WEBWEU_CLKAWRCLK_posedge_posedge(1),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR0_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR0_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(0),
        TestSignalName => "ADDRAWRADDR(0)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(0),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(0),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(0),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(0),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR1_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR1_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(1),
        TestSignalName => "ADDRAWRADDR(1)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(1),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(1),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(1),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(1),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR2_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR2_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(2),
        TestSignalName => "ADDRAWRADDR(2)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(2),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(2),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(2),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(2),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR3_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR3_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(3),
        TestSignalName => "ADDRAWRADDR(3)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(3),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(3),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(3),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(3),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR4_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR4_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(4),
        TestSignalName => "ADDRAWRADDR(4)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(4),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(4),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(4),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(4),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR5_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR5_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(5),
        TestSignalName => "ADDRAWRADDR(5)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(5),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(5),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(5),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(5),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(5),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR6_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR6_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(6),
        TestSignalName => "ADDRAWRADDR(6)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(6),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(6),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(6),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(6),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(6),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR7_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR7_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(7),
        TestSignalName => "ADDRAWRADDR(7)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(7),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(7),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(7),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(7),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(7),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR8_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR8_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(8),
        TestSignalName => "ADDRAWRADDR(8)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(8),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(8),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(8),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(8),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(8),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR9_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR9_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(9),
        TestSignalName => "ADDRAWRADDR(9)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(9),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(9),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(9),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(9),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(9),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR10_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR10_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(10),
        TestSignalName => "ADDRAWRADDR(10)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(10),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(10),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(10),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(10),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(10),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR11_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR11_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(11),
        TestSignalName => "ADDRAWRADDR(11)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(11),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(11),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(11),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(11),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(11),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRAWRADDR12_CLKAWRCLK_posedge,
        TimingData     => Tmkr_ADDRAWRADDR12_CLKAWRCLK_posedge,
        TestSignal     => ADDRAWRADDR_dly(12),
        TestSignalName => "ADDRAWRADDR(12)",
        TestDelay      => tisd_ADDRAWRADDR_CLKAWRCLK(12),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(12),
        SetupLow       => tsetup_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(12),
        HoldLow        => thold_ADDRAWRADDR_CLKAWRCLK_negedge_posedge(12),
        HoldHigh       => thold_ADDRAWRADDR_CLKAWRCLK_posedge_posedge(12),
        checkEnabled   => TO_X01(enawren_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPADIP0_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIPADIP0_CLKAWRCLK_posedge,
        TestSignal     => DIPADIP_dly(0),
        TestSignalName => "DIPADIP(0)",
        TestDelay      => tisd_DIPADIP_CLKAWRCLK(0),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIPADIP_CLKAWRCLK_posedge_posedge(0),
        SetupLow       => tsetup_DIPADIP_CLKAWRCLK_negedge_posedge(0),
        HoldLow        => thold_DIPADIP_CLKAWRCLK_negedge_posedge(0),
        HoldHigh       => thold_DIPADIP_CLKAWRCLK_posedge_posedge(0),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPADIP1_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIPADIP1_CLKAWRCLK_posedge,
        TestSignal     => DIPADIP_dly(1),
        TestSignalName => "DIPADIP(1)",
        TestDelay      => tisd_DIPADIP_CLKAWRCLK(1),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIPADIP_CLKAWRCLK_posedge_posedge(1),
        SetupLow       => tsetup_DIPADIP_CLKAWRCLK_negedge_posedge(1),
        HoldLow        => thold_DIPADIP_CLKAWRCLK_negedge_posedge(1),
        HoldHigh       => thold_DIPADIP_CLKAWRCLK_posedge_posedge(1),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI0_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI0_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(0),
        TestSignalName => "DIADI(0)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(0),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(0),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(0),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(0),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(0),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI1_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI1_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(1),
        TestSignalName => "DIADI(1)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(1),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(1),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(1),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(1),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(1),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI2_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI2_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(2),
        TestSignalName => "DIADI(2)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(2),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(2),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(2),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(2),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(2),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI3_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI3_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(3),
        TestSignalName => "DIADI(3)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(3),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(3),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(3),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(3),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(3),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI4_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI4_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(4),
        TestSignalName => "DIADI(4)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(4),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(4),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(4),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(4),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(4),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI5_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI5_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(5),
        TestSignalName => "DIADI(5)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(5),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(5),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(5),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(5),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(5),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI6_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI6_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(6),
        TestSignalName => "DIADI(6)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(6),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(6),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(6),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(6),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(6),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI7_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI7_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(7),
        TestSignalName => "DIADI(7)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(7),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(7),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(7),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(7),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(7),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI8_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI8_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(8),
        TestSignalName => "DIADI(8)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(8),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(8),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(8),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(8),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(8),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI9_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI9_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(9),
        TestSignalName => "DIADI(9)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(9),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(9),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(9),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(9),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(9),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI10_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI10_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(10),
        TestSignalName => "DIADI(10)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(10),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(10),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(10),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(10),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(10),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI11_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI11_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(11),
        TestSignalName => "DIADI(11)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(11),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(11),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(11),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(11),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(11),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI12_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI12_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(12),
        TestSignalName => "DIADI(12)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(12),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(12),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(12),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(12),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(12),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI13_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI13_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(13),
        TestSignalName => "DIADI(13)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(13),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(13),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(13),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(13),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(13),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI14_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI14_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(14),
        TestSignalName => "DIADI(14)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(14),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(14),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(14),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(14),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(14),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIADI15_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIADI15_CLKAWRCLK_posedge,
        TestSignal     => DIADI_dly(15),
        TestSignalName => "DIADI(15)",
        TestDelay      => tisd_DIADI_CLKAWRCLK(15),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIADI_CLKAWRCLK_posedge_posedge(15),
        SetupLow       => tsetup_DIADI_CLKAWRCLK_negedge_posedge(15),
        HoldLow        => thold_DIADI_CLKAWRCLK_negedge_posedge(15),
        HoldHigh       => thold_DIADI_CLKAWRCLK_posedge_posedge(15),
        checkEnabled   => (TO_X01(enawren_dly) = '1' and TO_X01(weawel_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPBDIP0_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIPBDIP0_CLKAWRCLK_posedge,
        TestSignal     => DIPBDIP_dly(0),
        TestSignalName => "DIPBDIP(0)",
        TestDelay      => tisd_DIPBDIP_CLKAWRCLK(0),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIPBDIP_CLKAWRCLK_posedge_posedge(0),
        SetupLow       => tsetup_DIPBDIP_CLKAWRCLK_negedge_posedge(0),
        HoldLow        => thold_DIPBDIP_CLKAWRCLK_negedge_posedge(0),
        HoldHigh       => thold_DIPBDIP_CLKAWRCLK_posedge_posedge(0),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPBDIP1_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIPBDIP1_CLKAWRCLK_posedge,
        TestSignal     => DIPBDIP_dly(1),
        TestSignalName => "DIPBDIP(1)",
        TestDelay      => tisd_DIPBDIP_CLKAWRCLK(1),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIPBDIP_CLKAWRCLK_posedge_posedge(1),
        SetupLow       => tsetup_DIPBDIP_CLKAWRCLK_negedge_posedge(1),
        HoldLow        => thold_DIPBDIP_CLKAWRCLK_negedge_posedge(1),
        HoldHigh       => thold_DIPBDIP_CLKAWRCLK_posedge_posedge(1),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI0_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI0_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(0),
        TestSignalName => "DIBDI(0)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(0),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(0),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(0),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(0),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(0),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI1_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI1_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(1),
        TestSignalName => "DIBDI(1)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(1),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(1),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(1),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(1),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(1),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI2_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI2_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(2),
        TestSignalName => "DIBDI(2)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(2),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(2),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(2),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(2),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(2),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI3_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI3_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(3),
        TestSignalName => "DIBDI(3)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(3),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(3),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(3),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(3),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(3),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI4_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI4_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(4),
        TestSignalName => "DIBDI(4)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(4),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(4),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(4),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(4),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(4),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI5_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI5_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(5),
        TestSignalName => "DIBDI(5)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(5),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(5),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(5),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(5),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(5),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI6_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI6_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(6),
        TestSignalName => "DIBDI(6)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(6),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(6),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(6),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(6),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(6),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI7_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI7_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(7),
        TestSignalName => "DIBDI(7)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(7),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(7),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(7),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(7),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(7),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI8_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI8_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(8),
        TestSignalName => "DIBDI(8)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(8),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(8),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(8),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(8),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(8),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI9_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI9_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(9),
        TestSignalName => "DIBDI(9)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(9),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(9),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(9),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(9),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(9),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI10_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI10_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(10),
        TestSignalName => "DIBDI(10)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(10),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(10),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(10),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(10),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(10),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI11_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI11_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(11),
        TestSignalName => "DIBDI(11)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(11),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(11),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(11),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(11),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(11),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI12_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI12_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(12),
        TestSignalName => "DIBDI(12)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(12),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(12),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(12),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(12),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(12),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI13_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI13_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(13),
        TestSignalName => "DIBDI(13)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(13),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(13),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(13),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(13),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(13),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI14_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI14_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(14),
        TestSignalName => "DIBDI(14)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(14),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(14),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(14),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(14),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(14),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI15_CLKAWRCLK_posedge,
        TimingData     => Tmkr_DIBDI15_CLKAWRCLK_posedge,
        TestSignal     => DIBDI_dly(15),
        TestSignalName => "DIBDI(15)",
        TestDelay      => tisd_DIBDI_CLKAWRCLK(15),
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        SetupHigh      => tsetup_DIBDI_CLKAWRCLK_posedge_posedge(15),
        SetupLow       => tsetup_DIBDI_CLKAWRCLK_negedge_posedge(15),
        HoldLow        => thold_DIBDI_CLKAWRCLK_negedge_posedge(15),
        HoldHigh       => thold_DIBDI_CLKAWRCLK_posedge_posedge(15),
        checkEnabled   => (RAM_MODE = "SDP" and TO_X01(enawren_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ENBRDEN_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ENBRDEN_CLKBRDCLK_posedge,
        TestSignal     => ENBRDEN_dly,
        TestSignalName => "ENBRDEN",
        TestDelay      => tisd_ENBRDEN_CLKBRDCLK,
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ENBRDEN_CLKBRDCLK_posedge_posedge,
        SetupLow       => tsetup_ENBRDEN_CLKBRDCLK_negedge_posedge,
        HoldLow        => thold_ENBRDEN_CLKBRDCLK_negedge_posedge,
        HoldHigh       => thold_ENBRDEN_CLKBRDCLK_posedge_posedge,
        checkEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RSTBRST_CLKBRDCLK_posedge,
        TimingData     => Tmkr_RSTBRST_CLKBRDCLK_posedge,
        TestSignal     => RSTBRST_dly,
        TestSignalName => "RSTBRST",
        TestDelay      => tisd_RSTBRST_CLKBRDCLK,
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_RSTBRST_CLKBRDCLK_posedge_posedge,
        SetupLow       => tsetup_RSTBRST_CLKBRDCLK_negedge_posedge,
        HoldLow        => thold_RSTBRST_CLKBRDCLK_negedge_posedge,
        HoldHigh       => thold_RSTBRST_CLKBRDCLK_posedge_posedge,
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEBWEU0_CLKBRDCLK_posedge,
        TimingData     => Tmkr_WEBWEU0_CLKBRDCLK_posedge,
        TestSignal     => WEBWEU_dly(0),
        TestSignalName => "WEBWEU(0)",
        TestDelay      => tisd_WEBWEU_CLKBRDCLK(0),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_WEBWEU_CLKBRDCLK_posedge_posedge(0),
        SetupLow       => tsetup_WEBWEU_CLKBRDCLK_negedge_posedge(0),
        HoldLow        => thold_WEBWEU_CLKBRDCLK_negedge_posedge(0),
        HoldHigh       => thold_WEBWEU_CLKBRDCLK_posedge_posedge(0),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEBWEU1_CLKBRDCLK_posedge,
        TimingData     => Tmkr_WEBWEU1_CLKBRDCLK_posedge,
        TestSignal     => WEBWEU_dly(1),
        TestSignalName => "WEBWEU(1)",
        TestDelay      => tisd_WEBWEU_CLKBRDCLK(1),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_WEBWEU_CLKBRDCLK_posedge_posedge(1),
        SetupLow       => tsetup_WEBWEU_CLKBRDCLK_negedge_posedge(1),
        HoldLow        => thold_WEBWEU_CLKBRDCLK_negedge_posedge(1),
        HoldHigh       => thold_WEBWEU_CLKBRDCLK_posedge_posedge(1),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR0_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR0_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(0),
        TestSignalName => "ADDRBRDADDR(0)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(0),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(0),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(0),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(0),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR1_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR1_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(1),
        TestSignalName => "ADDRBRDADDR(1)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(1),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(1),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(1),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(1),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR2_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR2_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(2),
        TestSignalName => "ADDRBRDADDR(2)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(2),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(2),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(2),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(2),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR3_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR3_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(3),
        TestSignalName => "ADDRBRDADDR(3)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(3),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(3),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(3),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(3),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR4_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR4_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(4),
        TestSignalName => "ADDRBRDADDR(4)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(4),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(4),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(4),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(4),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR5_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR5_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(5),
        TestSignalName => "ADDRBRDADDR(5)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(5),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(5),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(5),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(5),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(5),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR6_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR6_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(6),
        TestSignalName => "ADDRBRDADDR(6)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(6),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(6),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(6),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(6),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(6),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR7_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR7_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(7),
        TestSignalName => "ADDRBRDADDR(7)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(7),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(7),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(7),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(7),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(7),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR8_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR8_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(8),
        TestSignalName => "ADDRBRDADDR(8)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(8),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(8),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(8),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(8),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(8),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR9_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR9_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(9),
        TestSignalName => "ADDRBRDADDR(9)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(9),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(9),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(9),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(9),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(9),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR10_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR10_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(10),
        TestSignalName => "ADDRBRDADDR(10)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(10),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(10),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(10),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(10),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(10),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR11_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR11_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(11),
        TestSignalName => "ADDRBRDADDR(11)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(11),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(11),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(11),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(11),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(11),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRBRDADDR12_CLKBRDCLK_posedge,
        TimingData     => Tmkr_ADDRBRDADDR12_CLKBRDCLK_posedge,
        TestSignal     => ADDRBRDADDR_dly(12),
        TestSignalName => "ADDRBRDADDR(12)",
        TestDelay      => tisd_ADDRBRDADDR_CLKBRDCLK(12),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(12),
        SetupLow       => tsetup_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(12),
        HoldLow        => thold_ADDRBRDADDR_CLKBRDCLK_negedge_posedge(12),
        HoldHigh       => thold_ADDRBRDADDR_CLKBRDCLK_posedge_posedge(12),
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPBDIP0_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIPBDIP0_CLKBRDCLK_posedge,
        TestSignal     => DIPBDIP_dly(0),
        TestSignalName => "DIPBDIP(0)",
        TestDelay      => tisd_DIPBDIP_CLKBRDCLK(0),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIPBDIP_CLKBRDCLK_posedge_posedge(0),
        SetupLow       => tsetup_DIPBDIP_CLKBRDCLK_negedge_posedge(0),
        HoldLow        => thold_DIPBDIP_CLKBRDCLK_negedge_posedge(0),
        HoldHigh       => thold_DIPBDIP_CLKBRDCLK_posedge_posedge(0),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIPBDIP1_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIPBDIP1_CLKBRDCLK_posedge,
        TestSignal     => DIPBDIP_dly(1),
        TestSignalName => "DIPBDIP(1)",
        TestDelay      => tisd_DIPBDIP_CLKBRDCLK(1),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIPBDIP_CLKBRDCLK_posedge_posedge(1),
        SetupLow       => tsetup_DIPBDIP_CLKBRDCLK_negedge_posedge(1),
        HoldLow        => thold_DIPBDIP_CLKBRDCLK_negedge_posedge(1),
        HoldHigh       => thold_DIPBDIP_CLKBRDCLK_posedge_posedge(1),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI0_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI0_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(0),
        TestSignalName => "DIBDI(0)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(0),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(0),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(0),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(0),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(0),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI1_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI1_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(1),
        TestSignalName => "DIBDI(1)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(1),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(1),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(1),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(1),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(1),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI2_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI2_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(2),
        TestSignalName => "DIBDI(2)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(2),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(2),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(2),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(2),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(2),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI3_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI3_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(3),
        TestSignalName => "DIBDI(3)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(3),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(3),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(3),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(3),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(3),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI4_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI4_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(4),
        TestSignalName => "DIBDI(4)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(4),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(4),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(4),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(4),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(4),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI5_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI5_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(5),
        TestSignalName => "DIBDI(5)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(5),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(5),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(5),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(5),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(5),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI6_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI6_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(6),
        TestSignalName => "DIBDI(6)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(6),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(6),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(6),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(6),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(6),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI7_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI7_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(7),
        TestSignalName => "DIBDI(7)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(7),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(7),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(7),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(7),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(7),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(0)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI8_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI8_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(8),
        TestSignalName => "DIBDI(8)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(8),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(8),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(8),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(8),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(8),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI9_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI9_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(9),
        TestSignalName => "DIBDI(9)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(9),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(9),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(9),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(9),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(9),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI10_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI10_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(10),
        TestSignalName => "DIBDI(10)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(10),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(10),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(10),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(10),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(10),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI11_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI11_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(11),
        TestSignalName => "DIBDI(11)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(11),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(11),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(11),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(11),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(11),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI12_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI12_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(12),
        TestSignalName => "DIBDI(12)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(12),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(12),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(12),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(12),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(12),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI13_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI13_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(13),
        TestSignalName => "DIBDI(13)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(13),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(13),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(13),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(13),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(13),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI14_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI14_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(14),
        TestSignalName => "DIBDI(14)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(14),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(14),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(14),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(14),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(14),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIBDI15_CLKBRDCLK_posedge,
        TimingData     => Tmkr_DIBDI15_CLKBRDCLK_posedge,
        TestSignal     => DIBDI_dly(15),
        TestSignalName => "DIBDI(15)",
        TestDelay      => tisd_DIBDI_CLKBRDCLK(15),
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        SetupHigh      => tsetup_DIBDI_CLKBRDCLK_posedge_posedge(15),
        SetupLow       => tsetup_DIBDI_CLKBRDCLK_negedge_posedge(15),
        HoldLow        => thold_DIBDI_CLKBRDCLK_negedge_posedge(15),
        HoldHigh       => thold_DIBDI_CLKBRDCLK_posedge_posedge(15),
        checkEnabled   => (RAM_MODE = "TDP" and TO_X01(enbrden_dly) = '1' and TO_X01(webweu_dly(1)) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLKAWRCLK,
        PeriodData     => PInfo_CLKAWRCLK,
        TestSignal     => CLKAWRCLK_dly,
        TestSignalName => "CLKAWRCLK",
        TestDelay      => 0 ps,
        Period         => tperiod_clkawrclk_posedge,
        PulseWidthHigh => tpw_CLKAWRCLK_posedge,
        PulseWidthLow  => tpw_CLKAWRCLK_negedge,
        checkEnabled   => TO_X01(enawren_dly) = '1',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLKBRDCLK,
        PeriodData     => PInfo_CLKBRDCLK,
        TestSignal     => CLKBRDCLK_dly,
        TestSignalName => "CLKBRDCLK",
        TestDelay      => 0 ps,
        Period         => tperiod_clkbrdclk_posedge,
        PulseWidthHigh => tpw_CLKBRDCLK_posedge,
        PulseWidthLow  => tpw_CLKBRDCLK_negedge,
        checkEnabled   => TO_X01(enbrden_dly) = '1',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalRecoveryRemovalCheck (
        Violation      => Tviol_RSTBRST_CLKBRDCLK_negedge,
        TimingData     => Tmkr_RSTBRST_CLKBRDCLK_negedge,
        TestSignal     => RSTBRST_dly,
        TestSignalName => "RSTBRST",
        TestDelay      => tisd_RSTBRST_CLKBRDCLK,
        RefSignal      => CLKBRDCLK_dly,
        RefSignalName  => "CLKBRDCLK",
        RefDelay       => ticd_CLKBRDCLK,
        Recovery       => trecovery_RSTBRST_CLKBRDCLK_negedge_posedge,
        Removal        => tremoval_RSTBRST_CLKBRDCLK_negedge_posedge,
        ActiveLow      => false,
        CheckEnabled   => (TO_X01(GSR_dly) = '0'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalRecoveryRemovalCheck (
        Violation      => Tviol_RSTA_CLKAWRCLK_negedge,
        TimingData     => Tmkr_RSTA_CLKAWRCLK_negedge,
        TestSignal     => RSTA_dly,
        TestSignalName => "RSTA",
        TestDelay      => tisd_RSTA_CLKAWRCLK,
        RefSignal      => CLKAWRCLK_dly,
        RefSignalName  => "CLKAWRCLK",
        RefDelay       => ticd_CLKAWRCLK,
        Recovery       => trecovery_RSTA_CLKAWRCLK_negedge_posedge,
        Removal        => tremoval_RSTA_CLKAWRCLK_negedge_posedge,
        ActiveLow      => false,
        CheckEnabled   => (TO_X01(GSR_dly) = '0'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB8BWER",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      
    end if;
    
    ViolationA          <=
      Tviol_ADDRAWRADDR0_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR1_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR2_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR3_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR4_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR5_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR6_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR7_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR8_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR9_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR10_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR11_CLKAWRCLK_posedge or
      Tviol_ADDRAWRADDR12_CLKAWRCLK_posedge or
      Tviol_DIADI0_CLKAWRCLK_posedge or
      Tviol_DIADI1_CLKAWRCLK_posedge or
      Tviol_DIADI2_CLKAWRCLK_posedge or
      Tviol_DIADI3_CLKAWRCLK_posedge or
      Tviol_DIADI4_CLKAWRCLK_posedge or
      Tviol_DIADI5_CLKAWRCLK_posedge or
      Tviol_DIADI6_CLKAWRCLK_posedge or
      Tviol_DIADI7_CLKAWRCLK_posedge or
      Tviol_DIADI8_CLKAWRCLK_posedge or
      Tviol_DIADI9_CLKAWRCLK_posedge or
      Tviol_DIADI10_CLKAWRCLK_posedge or
      Tviol_DIADI11_CLKAWRCLK_posedge or
      Tviol_DIADI12_CLKAWRCLK_posedge or
      Tviol_DIADI13_CLKAWRCLK_posedge or
      Tviol_DIADI14_CLKAWRCLK_posedge or
      Tviol_DIADI15_CLKAWRCLK_posedge or
      Tviol_DIPADIP0_CLKAWRCLK_posedge or
      Tviol_DIPADIP1_CLKAWRCLK_posedge or
      Tviol_ENAWREN_CLKAWRCLK_posedge or
      Tviol_RSTA_CLKAWRCLK_posedge or
      Tviol_WEAWEL0_CLKAWRCLK_posedge or
      Tviol_WEAWEL1_CLKAWRCLK_posedge or
      Pviol_CLKAWRCLK;
    ViolationB          <=
      Tviol_ADDRBRDADDR0_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR1_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR2_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR3_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR4_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR5_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR6_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR7_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR8_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR9_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR10_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR11_CLKBRDCLK_posedge or
      Tviol_ADDRBRDADDR12_CLKBRDCLK_posedge or
      Tviol_DIBDI0_CLKBRDCLK_posedge or
      Tviol_DIBDI1_CLKBRDCLK_posedge or
      Tviol_DIBDI2_CLKBRDCLK_posedge or
      Tviol_DIBDI3_CLKBRDCLK_posedge or
      Tviol_DIBDI4_CLKBRDCLK_posedge or
      Tviol_DIBDI5_CLKBRDCLK_posedge or
      Tviol_DIBDI6_CLKBRDCLK_posedge or
      Tviol_DIBDI7_CLKBRDCLK_posedge or
      Tviol_DIBDI8_CLKBRDCLK_posedge or
      Tviol_DIBDI9_CLKBRDCLK_posedge or
      Tviol_DIBDI10_CLKBRDCLK_posedge or
      Tviol_DIBDI11_CLKBRDCLK_posedge or
      Tviol_DIBDI12_CLKBRDCLK_posedge or
      Tviol_DIBDI13_CLKBRDCLK_posedge or
      Tviol_DIBDI14_CLKBRDCLK_posedge or
      Tviol_DIBDI15_CLKBRDCLK_posedge or
      Tviol_DIPBDIP0_CLKBRDCLK_posedge or
      Tviol_DIPBDIP1_CLKBRDCLK_posedge or
      Tviol_ENBRDEN_CLKBRDCLK_posedge or
      Tviol_RSTBRST_CLKBRDCLK_posedge or
      Tviol_WEBWEU0_CLKBRDCLK_posedge or
      Tviol_WEBWEU1_CLKBRDCLK_posedge or
      Pviol_CLKBRDCLK;

    
    if (Tviol_ADDRAWRADDR0_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(0)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR1_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(1)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR2_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(2)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR3_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(3)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR4_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(4)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR5_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(5)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR6_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(6)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR7_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(7)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR8_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(8)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR9_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(9)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR10_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(10)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR11_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(11)", "CLKAWRCLK");
    end if;

    if (Tviol_ADDRAWRADDR12_CLKAWRCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRAWRADDR(12)", "CLKAWRCLK");
    end if;


    if (Tviol_ADDRBRDADDR0_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(0)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR1_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(1)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR2_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(2)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR3_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(3)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR4_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(4)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR5_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(5)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR6_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(6)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR7_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(7)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR8_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(8)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR9_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(9)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR10_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(10)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR11_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(11)", "CLKBRDCLK");
    end if;

    if (Tviol_ADDRBRDADDR12_CLKBRDCLK_posedge = 'X') then
      	prcd_warn_msg ("ADDRBRDADDR(12)", "CLKBRDCLK");
    end if;


      wait on ADDRAWRADDR_dly, ADDRBRDADDR_dly, CLKAWRCLK_dly, CLKBRDCLK_dly, DIADI_dly, DIBDI_dly, DIPADIP_dly, DIPBDIP_dly, ENAWREN_dly, ENBRDEN_dly, RSTA_dly, RSTBRST_dly, WEAWEL_dly, WEBWEU_dly;
      
  end process;

-------------------------------------------------------------------------------
-- End Timing check
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Path delay
-------------------------------------------------------------------------------
   prcs_output:process (doado_out_out, dopadop_out_out, dobdo_out_out, dopbdop_out_out)

    variable DOADO_GlitchData0  : VitalGlitchDataType;
    variable DOADO_GlitchData1  : VitalGlitchDataType;
    variable DOADO_GlitchData2  : VitalGlitchDataType;
    variable DOADO_GlitchData3  : VitalGlitchDataType;
    variable DOADO_GlitchData4  : VitalGlitchDataType;
    variable DOADO_GlitchData5  : VitalGlitchDataType;
    variable DOADO_GlitchData6  : VitalGlitchDataType;
    variable DOADO_GlitchData7  : VitalGlitchDataType;
    variable DOADO_GlitchData8  : VitalGlitchDataType;
    variable DOADO_GlitchData9  : VitalGlitchDataType;
    variable DOADO_GlitchData10  : VitalGlitchDataType;
    variable DOADO_GlitchData11  : VitalGlitchDataType;
    variable DOADO_GlitchData12  : VitalGlitchDataType;
    variable DOADO_GlitchData13  : VitalGlitchDataType;
    variable DOADO_GlitchData14  : VitalGlitchDataType;
    variable DOADO_GlitchData15  : VitalGlitchDataType;
    variable DOPADOP_GlitchData0 : VitalGlitchDataType;
    variable DOPADOP_GlitchData1 : VitalGlitchDataType;
    variable DOBDO_GlitchData0  : VitalGlitchDataType;
    variable DOBDO_GlitchData1  : VitalGlitchDataType;
    variable DOBDO_GlitchData2  : VitalGlitchDataType;
    variable DOBDO_GlitchData3  : VitalGlitchDataType;
    variable DOBDO_GlitchData4  : VitalGlitchDataType;
    variable DOBDO_GlitchData5  : VitalGlitchDataType;
    variable DOBDO_GlitchData6  : VitalGlitchDataType;
    variable DOBDO_GlitchData7  : VitalGlitchDataType;
    variable DOBDO_GlitchData8  : VitalGlitchDataType;
    variable DOBDO_GlitchData9  : VitalGlitchDataType;
    variable DOBDO_GlitchData10  : VitalGlitchDataType;
    variable DOBDO_GlitchData11  : VitalGlitchDataType;
    variable DOBDO_GlitchData12  : VitalGlitchDataType;
    variable DOBDO_GlitchData13  : VitalGlitchDataType;
    variable DOBDO_GlitchData14  : VitalGlitchDataType;
    variable DOBDO_GlitchData15  : VitalGlitchDataType;
    variable DOPBDOP_GlitchData0 : VitalGlitchDataType;
    variable DOPBDOP_GlitchData1 : VitalGlitchDataType;
    variable DOADO_viol     : std_logic_vector(15 downto 0);
    variable DOPADOP_viol    : std_logic_vector(1 downto 0);
    variable DOBDO_viol     : std_logic_vector(15 downto 0);
    variable DOPBDOP_viol    : std_logic_vector(1 downto 0);
    
   begin
     
    if (RAM_MODE = "TDP") then
      
      DOADO_viol(0)  := ViolationA xor doado_out_out(0);
      DOADO_viol(1)  := ViolationA xor doado_out_out(1);
      DOADO_viol(2)  := ViolationA xor doado_out_out(2);
      DOADO_viol(3)  := ViolationA xor doado_out_out(3);
      DOADO_viol(4)  := ViolationA xor doado_out_out(4);
      DOADO_viol(5)  := ViolationA xor doado_out_out(5);
      DOADO_viol(6)  := ViolationA xor doado_out_out(6);
      DOADO_viol(7)  := ViolationA xor doado_out_out(7);
      DOADO_viol(8)  := ViolationA xor doado_out_out(8);
      DOADO_viol(9)  := ViolationA xor doado_out_out(9);
      DOADO_viol(10) := ViolationA xor doado_out_out(10);
      DOADO_viol(11) := ViolationA xor doado_out_out(11);
      DOADO_viol(12) := ViolationA xor doado_out_out(12);
      DOADO_viol(13) := ViolationA xor doado_out_out(13);
      DOADO_viol(14) := ViolationA xor doado_out_out(14);
      DOADO_viol(15) := ViolationA xor doado_out_out(15);
      DOPADOP_viol(0) := ViolationA xor dopadop_out_out(0);
      DOPADOP_viol(1) := ViolationA xor dopadop_out_out(1);

      DOBDO_viol(0)  := ViolationB xor dobdo_out_out(0);
      DOBDO_viol(1)  := ViolationB xor dobdo_out_out(1);
      DOBDO_viol(2)  := ViolationB xor dobdo_out_out(2);
      DOBDO_viol(3)  := ViolationB xor dobdo_out_out(3);
      DOBDO_viol(4)  := ViolationB xor dobdo_out_out(4);
      DOBDO_viol(5)  := ViolationB xor dobdo_out_out(5);
      DOBDO_viol(6)  := ViolationB xor dobdo_out_out(6);
      DOBDO_viol(7)  := ViolationB xor dobdo_out_out(7);
      DOBDO_viol(8)  := ViolationB xor dobdo_out_out(8);
      DOBDO_viol(9)  := ViolationB xor dobdo_out_out(9);
      DOBDO_viol(10) := ViolationB xor dobdo_out_out(10);
      DOBDO_viol(11) := ViolationB xor dobdo_out_out(11);
      DOBDO_viol(12) := ViolationB xor dobdo_out_out(12);
      DOBDO_viol(13) := ViolationB xor dobdo_out_out(13);
      DOBDO_viol(14) := ViolationB xor dobdo_out_out(14);
      DOBDO_viol(15) := ViolationB xor dobdo_out_out(15);
      DOPBDOP_viol(0) := ViolationB xor dopbdop_out_out(0);
      DOPBDOP_viol(1) := ViolationB xor dopbdop_out_out(1);

    elsif (RAM_MODE = "SDP") then

      DOBDO_viol(0)  := ViolationA xor dobdo_out_out(16);
      DOBDO_viol(1)  := ViolationA xor dobdo_out_out(17);
      DOBDO_viol(2)  := ViolationA xor dobdo_out_out(18);
      DOBDO_viol(3)  := ViolationA xor dobdo_out_out(19);
      DOBDO_viol(4)  := ViolationA xor dobdo_out_out(20);
      DOBDO_viol(5)  := ViolationA xor dobdo_out_out(21);
      DOBDO_viol(6)  := ViolationA xor dobdo_out_out(22);
      DOBDO_viol(7)  := ViolationA xor dobdo_out_out(23);
      DOBDO_viol(8)  := ViolationA xor dobdo_out_out(24);
      DOBDO_viol(9)  := ViolationA xor dobdo_out_out(25);
      DOBDO_viol(10) := ViolationA xor dobdo_out_out(26);
      DOBDO_viol(11) := ViolationA xor dobdo_out_out(27);
      DOBDO_viol(12) := ViolationA xor dobdo_out_out(28);
      DOBDO_viol(13) := ViolationA xor dobdo_out_out(29);
      DOBDO_viol(14) := ViolationA xor dobdo_out_out(30);
      DOBDO_viol(15) := ViolationA xor dobdo_out_out(31);
      DOPBDOP_viol(0) := ViolationA xor dopbdop_out_out(2);
      DOPBDOP_viol(1) := ViolationA xor dopbdop_out_out(3);

      DOADO_viol(0)  := ViolationB xor dobdo_out_out(0);
      DOADO_viol(1)  := ViolationB xor dobdo_out_out(1);
      DOADO_viol(2)  := ViolationB xor dobdo_out_out(2);
      DOADO_viol(3)  := ViolationB xor dobdo_out_out(3);
      DOADO_viol(4)  := ViolationB xor dobdo_out_out(4);
      DOADO_viol(5)  := ViolationB xor dobdo_out_out(5);
      DOADO_viol(6)  := ViolationB xor dobdo_out_out(6);
      DOADO_viol(7)  := ViolationB xor dobdo_out_out(7);
      DOADO_viol(8)  := ViolationB xor dobdo_out_out(8);
      DOADO_viol(9)  := ViolationB xor dobdo_out_out(9);
      DOADO_viol(10) := ViolationB xor dobdo_out_out(10);
      DOADO_viol(11) := ViolationB xor dobdo_out_out(11);
      DOADO_viol(12) := ViolationB xor dobdo_out_out(12);
      DOADO_viol(13) := ViolationB xor dobdo_out_out(13);
      DOADO_viol(14) := ViolationB xor dobdo_out_out(14);
      DOADO_viol(15) := ViolationB xor dobdo_out_out(15);
      DOPADOP_viol(0) := ViolationB xor dopbdop_out_out(0);
      DOPADOP_viol(1) := ViolationB xor dopbdop_out_out(1);

    end if;
    
      
---- Port A
    VitalPathDelay01 (
      OutSignal     => DOADO(0),
      GlitchData    => DOADO_GlitchData0,
      OutSignalName => "DOADO(0)",
      OutTemp       => DOADO_viol(0),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(0), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(0), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(0), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(0), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(1),
      GlitchData    => DOADO_GlitchData1,
      OutSignalName => "DOADO(1)",
      OutTemp       => DOADO_viol(1),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(1), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(1), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(1), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(1), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(2),
      GlitchData    => DOADO_GlitchData2,
      OutSignalName => "DOADO(2)",
      OutTemp       => DOADO_viol(2),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(2), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(2), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(2), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(2), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(3),
      GlitchData    => DOADO_GlitchData3,
      OutSignalName => "DOADO(3)",
      OutTemp       => DOADO_viol(3),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(3), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(3), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(3), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(3), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(4),
      GlitchData    => DOADO_GlitchData4,
      OutSignalName => "DOADO(4)",
      OutTemp       => DOADO_viol(4),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(4), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(4), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(4), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(4), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(5),
      GlitchData    => DOADO_GlitchData5,
      OutSignalName => "DOADO(5)",
      OutTemp       => DOADO_viol(5),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(5), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(5), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(5), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(5), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(6),
      GlitchData    => DOADO_GlitchData6,
      OutSignalName => "DOADO(6)",
      OutTemp       => DOADO_viol(6),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(6), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(6), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(6), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(6), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(7),
      GlitchData    => DOADO_GlitchData7,
      OutSignalName => "DOADO(7)",
      OutTemp       => DOADO_viol(7),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(7), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(7), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(7), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(7), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(8),
      GlitchData    => DOADO_GlitchData8,
      OutSignalName => "DOADO(8)",
      OutTemp       => DOADO_viol(8),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(8), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(8), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(8), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(8), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(9),
      GlitchData    => DOADO_GlitchData9,
      OutSignalName => "DOADO(9)",
      OutTemp       => DOADO_viol(9),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(9), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(9), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(9), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(9), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(10),
      GlitchData    => DOADO_GlitchData10,
      OutSignalName => "DOADO(10)",
      OutTemp       => DOADO_viol(10),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(10), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(10), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(10), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(10), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(11),
      GlitchData    => DOADO_GlitchData11,
      OutSignalName => "DOADO(11)",
      OutTemp       => DOADO_viol(11),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(11), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(11), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(11), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(11), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(12),
      GlitchData    => DOADO_GlitchData12,
      OutSignalName => "DOADO(12)",
      OutTemp       => DOADO_viol(12),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(12), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(12), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(12), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(12), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(13),
      GlitchData    => DOADO_GlitchData13,
      OutSignalName => "DOADO(13)",
      OutTemp       => DOADO_viol(13),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(13), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(13), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(13), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(13), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(14),
      GlitchData    => DOADO_GlitchData14,
      OutSignalName => "DOADO(14)",
      OutTemp       => DOADO_viol(14),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(14), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(14), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(14), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(14), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOADO(15),
      GlitchData    => DOADO_GlitchData15,
      OutSignalName => "DOADO(15)",
      OutTemp       => DOADO_viol(15),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOADO(15), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOADO(15), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOADO(15), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOADO(15), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPADOP(0),
      GlitchData    => DOPADOP_GlitchData0,
      OutSignalName => "DOPADOP(0)",
      OutTemp       => DOPADOP_viol(0),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOPADOP(0), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOPADOP(0), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOPADOP(0), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOPADOP(0), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPADOP(1),
      GlitchData    => DOPADOP_GlitchData1,
      OutSignalName => "DOPADOP(1)",
      OutTemp       => DOPADOP_viol(1),
      Paths         => (0 => (CLKAWRCLK_dly'last_event, tpd_CLKAWRCLK_DOPADOP(1), (RAM_MODE = "TDP" and enawren_dly /= '0' and GSR_dly /= '1')),
                        1 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOPADOP(1), (RAM_MODE = "SDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        2 => (RSTA_dly'last_event, tpd_RSTA_DOPADOP(1), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1')),
                        3 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOPADOP(1), (RSTTYPE = "ASYNC" and RAM_MODE = "SDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);


----- Port B
    VitalPathDelay01 (
      OutSignal     => DOBDO(0),
      GlitchData    => DOBDO_GlitchData0,
      OutSignalName => "DOBDO(0)",
      OutTemp       => DOBDO_viol(0),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(0), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(0), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(1),
      GlitchData    => DOBDO_GlitchData1,
      OutSignalName => "DOBDO(1)",
      OutTemp       => DOBDO_viol(1),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(1), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(1), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(2),
      GlitchData    => DOBDO_GlitchData2,
      OutSignalName => "DOBDO(2)",
      OutTemp       => DOBDO_viol(2),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(2), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(2), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(3),
      GlitchData    => DOBDO_GlitchData3,
      OutSignalName => "DOBDO(3)",
      OutTemp       => DOBDO_viol(3),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(3), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(3), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(4),
      GlitchData    => DOBDO_GlitchData4,
      OutSignalName => "DOBDO(4)",
      OutTemp       => DOBDO_viol(4),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(4), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(4), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(5),
      GlitchData    => DOBDO_GlitchData5,
      OutSignalName => "DOBDO(5)",
      OutTemp       => DOBDO_viol(5),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(5), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(5), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(6),
      GlitchData    => DOBDO_GlitchData6,
      OutSignalName => "DOBDO(6)",
      OutTemp       => DOBDO_viol(6),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(6), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(6), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(7),
      GlitchData    => DOBDO_GlitchData7,
      OutSignalName => "DOBDO(7)",
      OutTemp       => DOBDO_viol(7),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(7), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(7), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(8),
      GlitchData    => DOBDO_GlitchData8,
      OutSignalName => "DOBDO(8)",
      OutTemp       => DOBDO_viol(8),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(8), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(8), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(9),
      GlitchData    => DOBDO_GlitchData9,
      OutSignalName => "DOBDO(9)",
      OutTemp       => DOBDO_viol(9),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(9), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(9), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(10),
      GlitchData    => DOBDO_GlitchData10,
      OutSignalName => "DOBDO(10)",
      OutTemp       => DOBDO_viol(10),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(10), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(10), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(11),
      GlitchData    => DOBDO_GlitchData11,
      OutSignalName => "DOBDO(11)",
      OutTemp       => DOBDO_viol(11),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(11), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(11), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(12),
      GlitchData    => DOBDO_GlitchData12,
      OutSignalName => "DOBDO(12)",
      OutTemp       => DOBDO_viol(12),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(12), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(12), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(13),
      GlitchData    => DOBDO_GlitchData13,
      OutSignalName => "DOBDO(13)",
      OutTemp       => DOBDO_viol(13),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(13), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(13), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(14),
      GlitchData    => DOBDO_GlitchData14,
      OutSignalName => "DOBDO(14)",
      OutTemp       => DOBDO_viol(14),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(14), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(14), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOBDO(15),
      GlitchData    => DOBDO_GlitchData15,
      OutSignalName => "DOBDO(15)",
      OutTemp       => DOBDO_viol(15),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOBDO(15), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOBDO(15), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPBDOP(0),
      GlitchData    => DOPBDOP_GlitchData0,
      OutSignalName => "DOPBDOP(0)",
      OutTemp       => DOPBDOP_viol(0),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOPBDOP(0), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOPBDOP(0), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPBDOP(1),
      GlitchData    => DOPBDOP_GlitchData1,
      OutSignalName => "DOPBDOP(1)",
      OutTemp       => DOPBDOP_viol(1),
      Paths         => (0 => (CLKBRDCLK_dly'last_event, tpd_CLKBRDCLK_DOPBDOP(1), (RAM_MODE = "TDP" and enbrden_dly /= '0' and GSR_dly /= '1')),
                        1 => (RSTBRST_dly'last_event, tpd_RSTBRST_DOPBDOP(1), (RSTTYPE = "ASYNC" and RAM_MODE = "TDP" and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);


   end process prcs_output;
---------------------------------------------------------------------------
-- End Path delay
---------------------------------------------------------------------------

end X_RAMB8BWER_V;
