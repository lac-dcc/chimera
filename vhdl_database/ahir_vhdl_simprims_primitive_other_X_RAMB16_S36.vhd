-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_RAMB16_S36.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  16K-Bit Data and 2K-Bit Parity Single Port Block RAM
-- /___/   /\     Filename : X_RAMB16_S36.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:15 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    CR#208761 - Removed GSR port.
--    07/09/07 - Changed generic write_mode to uppercase (CR 441954).
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision

----- CELL X_RAMB16_S36 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.VCOMPONENTS.all;

entity X_RAMB16_S36 is
  generic (
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;
    LOC            : string  := "UNPLACED";

    tipd_ADDR : VitalDelayArrayType01(8 downto 0)  := (others => (0 ps, 0 ps));
    tipd_CLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_DI   : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIP  : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));
    tipd_EN : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_SSR : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_WE : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tpd_CLK_DO  : VitalDelayArrayType01(31 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLK_DOP : VitalDelayArrayType01(3 downto 0)  := (others => (100 ps, 100 ps));

    tsetup_ADDR_CLK_negedge_posedge : VitalDelayArrayType(8 downto 0)  := (others => 0 ps);
    tsetup_ADDR_CLK_posedge_posedge : VitalDelayArrayType(8 downto 0)  := (others => 0 ps);
    tsetup_DIP_CLK_negedge_posedge  : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_DIP_CLK_posedge_posedge  : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_DI_CLK_negedge_posedge   : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_DI_CLK_posedge_posedge   : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tsetup_EN_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_EN_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_SSR_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_SSR_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_WE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_WE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

    thold_ADDR_CLK_negedge_posedge : VitalDelayArrayType(8 downto 0)  := (others => 0 ps);
    thold_ADDR_CLK_posedge_posedge : VitalDelayArrayType(8 downto 0)  := (others => 0 ps);
    thold_DIP_CLK_negedge_posedge  : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_DIP_CLK_posedge_posedge  : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_DI_CLK_negedge_posedge   : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_DI_CLK_posedge_posedge   : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    thold_EN_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_EN_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_SSR_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_SSR_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_WE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_WE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

    ticd_CLK : VitalDelayType := 0.000 ns;
    tisd_ADDR_CLK : VitalDelayArrayType(8 downto 0)  := (others => 0 ps);
    tisd_DI_CLK  : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
    tisd_DIP_CLK : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tisd_EN_CLK : VitalDelayType := 0.000 ns;
    tisd_SSR_CLK : VitalDelayType := 0.000 ns;
    tisd_WE_CLK : VitalDelayType := 0.000 ns;

    tpw_CLK_negedge : VitalDelayType := 0.000 ns;
    tpw_CLK_posedge : VitalDelayType := 0.000 ns;
    
    INIT       : bit_vector := X"000000000";
    SRVAL      : bit_vector := X"000000000";
    WRITE_MODE : string     := "WRITE_FIRST";

    INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_00  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_01  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_02  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_03  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_04  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_05  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_06  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_07  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_08  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_09  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0A  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0B  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0C  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0D  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0E  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0F  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_10  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_11  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_12  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_13  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_14  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_15  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_16  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_17  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_18  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_19  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1A  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1B  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1C  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1D  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1E  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1F  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_20  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_21  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_22  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_23  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_24  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_25  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_26  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_27  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_28  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_29  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2A  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2B  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2C  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2D  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2E  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2F  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_30  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_31  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_32  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_33  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_34  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_35  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_36  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_37  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_38  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_39  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3A  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3B  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3C  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3D  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3E  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3F  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
    );

  port (
    DO                                   : out std_logic_vector(31 downto 0);
    DOP                                  : out std_logic_vector(3 downto 0);
    
    ADDR                                 : in  std_logic_vector(8 downto 0);
    CLK                                  : in  std_ulogic;
    DI                                   : in  std_logic_vector(31 downto 0);
    DIP                                  : in  std_logic_vector(3 downto 0);
    EN                                   : in  std_ulogic;
    SSR                                  : in  std_ulogic;
    WE                                   : in  std_ulogic
    );
  
  attribute VITAL_LEVEL0 of
    X_RAMB16_S36 :     entity is true;
end X_RAMB16_S36;

architecture X_RAMB16_S36_V of X_RAMB16_S36 is
  attribute VITAL_LEVEL0 of
    X_RAMB16_S36_V : architecture is true;

  signal ADDR_ipd : std_logic_vector(8 downto 0)  := (others => 'X');
  signal CLK_ipd : std_ulogic := 'X';
  signal DIP_ipd  : std_logic_vector(3 downto 0)  := (others => 'X');
  signal DI_ipd   : std_logic_vector(31 downto 0) := (others => 'X');
  signal EN_ipd  : std_ulogic := 'X';
  signal GSR_ipd : std_ulogic := 'X';
  signal SSR_ipd : std_ulogic := 'X';
  signal WE_ipd  : std_ulogic := 'X';

  signal ADDR_dly : std_logic_vector(8 downto 0)  := (others => 'X');
  signal CLK_dly : std_ulogic := 'X';
  signal DIP_dly  : std_logic_vector(3 downto 0)  := (others => 'X');
  signal DI_dly   : std_logic_vector(31 downto 0) := (others => 'X');
  signal EN_dly  : std_ulogic := 'X';
  signal GSR_dly  : std_ulogic := '0';
  signal SSR_dly : std_ulogic := 'X';
  signal WE_dly  : std_ulogic := 'X';

  constant length : integer := 512;
  constant width : integer := 32;

  constant parity_width : integer := 4;
  
  type Two_D_array_type is array ((length -  1) downto 0) of std_logic_vector((width - 1) downto 0);
  type Two_D_parity_array_type is array ((length -  1) downto 0) of std_logic_vector((parity_width - 1) downto 0);    

  function slv_to_two_D_array(
    slv_length : integer;
    slv_width : integer;
    SLV : in std_logic_vector
    )
    return two_D_array_type is
    variable two_D_array : two_D_array_type;
    variable intermediate : std_logic_vector((slv_width - 1) downto 0);
  begin
    for i in 0 to (slv_length - 1)loop
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

begin

  GSR_dly <= GSR;

  WireDelay : block
  begin
    ADDR_DELAY       : for i in 8 downto 0 generate
      VitalWireDelay (ADDR_ipd(i), ADDR(i), tipd_ADDR(i));
    end generate ADDR_DELAY;
    VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
    DI_DELAY       : for i in 31 downto 0 generate    
      VitalWireDelay (DI_ipd(i), DI(i), tipd_DI(i));
    end generate DI_DELAY;
    DIP_DELAY       : for i in 3 downto 0 generate    
      VitalWireDelay (DIP_ipd(i), DIP(i), tipd_DIP(i));
    end generate DIP_DELAY;    
    VitalWireDelay (EN_ipd, EN, tipd_EN);
    VitalWireDelay (SSR_ipd, SSR, tipd_SSR);
    VitalWireDelay (WE_ipd, WE, tipd_WE);
  end block;

  SignalDelay : block
  begin
    ADDR_DELAY       : for i in 8 downto 0 generate
    VitalSignalDelay (ADDR_dly(i), ADDR_ipd(i), tisd_ADDR_CLK(i));
    end generate ADDR_DELAY;    
    VitalSignalDelay (CLK_dly, CLK_ipd, ticd_CLK);
    DI_DELAY       : for i in 31 downto 0 generate    
    VitalSignalDelay (DI_dly(i), DI_ipd(i), tisd_DI_CLK(i));
    end generate DI_DELAY;
    DIP_DELAY       : for i in 3 downto 0 generate    
    VitalSignalDelay (DIP_dly(i), DIP_ipd(i), tisd_DIP_CLK(i));
    end generate DIP_DELAY;        
    VitalSignalDelay (EN_dly, EN_ipd, tisd_EN_CLK);
    VitalSignalDelay (SSR_dly, SSR_ipd, tisd_SSR_CLK);
    VitalSignalDelay (WE_dly, WE_ipd, tisd_WE_CLK);
  end block;

  VITALBehavior : process
    variable Tviol_ADDR0_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR1_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR2_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR3_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR4_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR5_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR6_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR7_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR8_CLK_posedge : std_ulogic := '0';
    variable Tviol_DI0_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI10_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI11_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI12_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI13_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI14_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI15_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI16_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI17_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI18_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI19_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI1_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI20_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI21_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI22_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI23_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI24_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI25_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI26_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI27_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI28_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI29_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI2_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI30_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI31_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI3_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI4_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI5_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI6_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI7_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI8_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI9_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DIP0_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DIP1_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DIP2_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DIP3_CLK_posedge  : std_ulogic := '0';
    variable Tviol_EN_CLK_posedge    : std_ulogic := '0';
    variable Tviol_SSR_CLK_posedge   : std_ulogic := '0';
    variable Tviol_WE_CLK_posedge    : std_ulogic := '0';

    variable Tmkr_ADDR0_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR1_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR2_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR3_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR4_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR5_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR6_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR7_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR8_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI0_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI10_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI11_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI12_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI13_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI14_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI15_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI16_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI17_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI18_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI19_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI1_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI20_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI21_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI22_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI23_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI24_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI25_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI26_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI27_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI28_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI29_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI2_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI30_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI31_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI3_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI4_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI5_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI6_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI7_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI8_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI9_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIP0_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIP1_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIP2_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIP3_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_EN_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSR_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WE_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;

    variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;
    
    variable PViol_CLK : std_ulogic          := '0';

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
    variable DO_GlitchData10 : VitalGlitchDataType;
    variable DO_GlitchData11 : VitalGlitchDataType;
    variable DO_GlitchData12 : VitalGlitchDataType;
    variable DO_GlitchData13 : VitalGlitchDataType;
    variable DO_GlitchData14 : VitalGlitchDataType;
    variable DO_GlitchData15 : VitalGlitchDataType;
    variable DO_GlitchData16 : VitalGlitchDataType;
    variable DO_GlitchData17 : VitalGlitchDataType;
    variable DO_GlitchData18 : VitalGlitchDataType;
    variable DO_GlitchData19 : VitalGlitchDataType;
    variable DO_GlitchData20 : VitalGlitchDataType;
    variable DO_GlitchData21 : VitalGlitchDataType;
    variable DO_GlitchData22 : VitalGlitchDataType;
    variable DO_GlitchData23 : VitalGlitchDataType;
    variable DO_GlitchData24 : VitalGlitchDataType;
    variable DO_GlitchData25 : VitalGlitchDataType;
    variable DO_GlitchData26 : VitalGlitchDataType;
    variable DO_GlitchData27 : VitalGlitchDataType;
    variable DO_GlitchData28 : VitalGlitchDataType;
    variable DO_GlitchData29 : VitalGlitchDataType;
    variable DO_GlitchData30 : VitalGlitchDataType;
    variable DO_GlitchData31 : VitalGlitchDataType;
    variable DOP_GlitchData0 : VitalGlitchDataType;
    variable DOP_GlitchData1 : VitalGlitchDataType;
    variable DOP_GlitchData2 : VitalGlitchDataType;
    variable DOP_GlitchData3 : VitalGlitchDataType;

    variable address : integer;
    variable valid_addr : boolean := FALSE;
    variable mem_slv : std_logic_vector(16383 downto 0) := To_StdLogicVector(INIT_3F & INIT_3E & INIT_3D & INIT_3C &
                                                                             INIT_3B & INIT_3A & INIT_39 & INIT_38 &
                                                                             INIT_37 & INIT_36 & INIT_35 & INIT_34 &
                                                                             INIT_33 & INIT_32 & INIT_31 & INIT_30 &
                                                                             INIT_2F & INIT_2E & INIT_2D & INIT_2C &
                                                                             INIT_2B & INIT_2A & INIT_29 & INIT_28 &
                                                                             INIT_27 & INIT_26 & INIT_25 & INIT_24 &
                                                                             INIT_23 & INIT_22 & INIT_21 & INIT_20 &
                                                                             INIT_1F & INIT_1E & INIT_1D & INIT_1C &
                                                                             INIT_1B & INIT_1A & INIT_19 & INIT_18 &
                                                                             INIT_17 & INIT_16 & INIT_15 & INIT_14 &
                                                                             INIT_13 & INIT_12 & INIT_11 & INIT_10 &
                                                                             INIT_0F & INIT_0E & INIT_0D & INIT_0C &
                                                                             INIT_0B & INIT_0A & INIT_09 & INIT_08 &
                                                                             INIT_07 & INIT_06 & INIT_05 & INIT_04 &
                                                                             INIT_03 & INIT_02 & INIT_01 & INIT_00);

    variable memp_slv : std_logic_vector(2047 downto 0) := To_StdLogicVector(INITP_07 & INITP_06 & INITP_05 & INITP_04 &
                                                                              INITP_03 & INITP_02 & INITP_01 & INITP_00);    
    variable mem : Two_D_array_type := slv_to_two_D_array(length, width, mem_slv);
    variable memp : Two_D_parity_array_type := slv_to_two_D_parity_array(length, parity_width, memp_slv);
    variable wr_mode : integer := 0;                
    

    variable FIRST_TIME      : boolean                                    := true;
    variable INI             : std_logic_vector (INIT'length-1 downto 0)  := TO_StdLogicVector(INIT);
    variable SRVA            : std_logic_vector (SRVAL'length-1 downto 0) := TO_StdLogicVector(SRVAL );
    variable Violation : std_ulogic                      := '0';

    variable DOP_zd          : std_logic_vector(3 downto 0)               := INI(35 downto 32 );
    variable DO_zd           : std_logic_vector(31 downto 0)              := INI(31 downto 0 );    

  begin
    if (FIRST_TIME) then
      if ((WRITE_MODE = "write_first") or (WRITE_MODE = "WRITE_FIRST")) then
        wr_mode := 0;
      elsif ((WRITE_MODE = "read_first") or (WRITE_MODE = "READ_FIRST")) then
        wr_mode := 1;
      elsif ((WRITE_MODE = "no_change") or (WRITE_MODE = "NO_CHANGE")) then
        wr_mode := 2;
      else
        GenericValueCheckMessage
          (HeaderMsg            => " Attribute Syntax Error ",
           GenericName          => " WRITE_MODE ",
           EntityName           => "/X_RAMB16_S36",
           GenericValue         => WRITE_MODE,
           Unit                 => "",
           ExpectedValueMsg     => " The Legal values for this attribute are ",
           ExpectedGenericValue => " WRITE_FIRST, READ_FIRST or NO_CHANGE ",
           TailMsg              => "",
           MsgSeverity          => error
           );
      end if;      
      DO  <= DO_zd;
      DOP <= DOP_zd;
      wait until (GSR_dly = '1' or CLK_dly'last_value = '0' or CLK_dly'last_value = '1');
      FIRST_TIME := false;
    end if;

    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation      => Tviol_DI31_CLK_posedge,
        TimingData     => Tmkr_DI31_CLK_posedge,
        TestSignal     => DI_dly(31),
        TestSignalName => "DI(31)",
        TestDelay      => tisd_DI_CLK(31),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(31),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(31),
        HoldLow        => thold_DI_CLK_posedge_posedge(31),
        HoldHigh       => thold_DI_CLK_negedge_posedge(31),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI30_CLK_posedge,
        TimingData     => Tmkr_DI30_CLK_posedge,
        TestSignal     => DI_dly(30),
        TestSignalName => "DI(30)",
        TestDelay      => tisd_DI_CLK(30),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(30),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(30),
        HoldLow        => thold_DI_CLK_posedge_posedge(30),
        HoldHigh       => thold_DI_CLK_negedge_posedge(30),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI29_CLK_posedge,
        TimingData     => Tmkr_DI29_CLK_posedge,
        TestSignal     => DI_dly(29),
        TestSignalName => "DI(29)",
        TestDelay      => tisd_DI_CLK(29),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(29),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(29),
        HoldLow        => thold_DI_CLK_posedge_posedge(29),
        HoldHigh       => thold_DI_CLK_negedge_posedge(29),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI28_CLK_posedge,
        TimingData     => Tmkr_DI28_CLK_posedge,
        TestSignal     => DI_dly(28),
        TestSignalName => "DI(28)",
        TestDelay      => tisd_DI_CLK(28),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(28),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(28),
        HoldLow        => thold_DI_CLK_posedge_posedge(28),
        HoldHigh       => thold_DI_CLK_negedge_posedge(28),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI27_CLK_posedge,
        TimingData     => Tmkr_DI27_CLK_posedge,
        TestSignal     => DI_dly(27),
        TestSignalName => "DI(27)",
        TestDelay      => tisd_DI_CLK(27),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(27),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(27),
        HoldLow        => thold_DI_CLK_posedge_posedge(27),
        HoldHigh       => thold_DI_CLK_negedge_posedge(27),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI26_CLK_posedge,
        TimingData     => Tmkr_DI26_CLK_posedge,
        TestSignal     => DI_dly(26),
        TestSignalName => "DI(26)",
        TestDelay      => tisd_DI_CLK(26),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(26),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(26),
        HoldLow        => thold_DI_CLK_posedge_posedge(26),
        HoldHigh       => thold_DI_CLK_negedge_posedge(26),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI25_CLK_posedge,
        TimingData     => Tmkr_DI25_CLK_posedge,
        TestSignal     => DI_dly(25),
        TestSignalName => "DI(25)",
        TestDelay      => tisd_DI_CLK(25),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(25),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(25),
        HoldLow        => thold_DI_CLK_posedge_posedge(25),
        HoldHigh       => thold_DI_CLK_negedge_posedge(25),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI24_CLK_posedge,
        TimingData     => Tmkr_DI24_CLK_posedge,
        TestSignal     => DI_dly(24),
        TestSignalName => "DI(24)",
        TestDelay      => tisd_DI_CLK(24),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(24),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(24),
        HoldLow        => thold_DI_CLK_posedge_posedge(24),
        HoldHigh       => thold_DI_CLK_negedge_posedge(24),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI23_CLK_posedge,
        TimingData     => Tmkr_DI23_CLK_posedge,
        TestSignal     => DI_dly(23),
        TestSignalName => "DI(23)",
        TestDelay      => tisd_DI_CLK(23),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(23),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(23),
        HoldLow        => thold_DI_CLK_posedge_posedge(23),
        HoldHigh       => thold_DI_CLK_negedge_posedge(23),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI22_CLK_posedge,
        TimingData     => Tmkr_DI22_CLK_posedge,
        TestSignal     => DI_dly(22),
        TestSignalName => "DI(22)",
        TestDelay      => tisd_DI_CLK(22),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(22),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(22),
        HoldLow        => thold_DI_CLK_posedge_posedge(22),
        HoldHigh       => thold_DI_CLK_negedge_posedge(22),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI21_CLK_posedge,
        TimingData     => Tmkr_DI21_CLK_posedge,
        TestSignal     => DI_dly(21),
        TestSignalName => "DI(21)",
        TestDelay      => tisd_DI_CLK(21),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(21),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(21),
        HoldLow        => thold_DI_CLK_posedge_posedge(21),
        HoldHigh       => thold_DI_CLK_negedge_posedge(21),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI20_CLK_posedge,
        TimingData     => Tmkr_DI20_CLK_posedge,
        TestSignal     => DI_dly(20),
        TestSignalName => "DI(20)",
        TestDelay      => tisd_DI_CLK(20),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(20),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(20),
        HoldLow        => thold_DI_CLK_posedge_posedge(20),
        HoldHigh       => thold_DI_CLK_negedge_posedge(20),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI19_CLK_posedge,
        TimingData     => Tmkr_DI19_CLK_posedge,
        TestSignal     => DI_dly(19),
        TestSignalName => "DI(19)",
        TestDelay      => tisd_DI_CLK(19),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(19),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(19),
        HoldLow        => thold_DI_CLK_posedge_posedge(19),
        HoldHigh       => thold_DI_CLK_negedge_posedge(19),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI18_CLK_posedge,
        TimingData     => Tmkr_DI18_CLK_posedge,
        TestSignal     => DI_dly(18),
        TestSignalName => "DI(18)",
        TestDelay      => tisd_DI_CLK(18),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(18),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(18),
        HoldLow        => thold_DI_CLK_posedge_posedge(18),
        HoldHigh       => thold_DI_CLK_negedge_posedge(18),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI17_CLK_posedge,
        TimingData     => Tmkr_DI17_CLK_posedge,
        TestSignal     => DI_dly(17),
        TestSignalName => "DI(17)",
        TestDelay      => tisd_DI_CLK(17),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(17),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(17),
        HoldLow        => thold_DI_CLK_posedge_posedge(17),
        HoldHigh       => thold_DI_CLK_negedge_posedge(17),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI16_CLK_posedge,
        TimingData     => Tmkr_DI16_CLK_posedge,
        TestSignal     => DI_dly(16),
        TestSignalName => "DI(16)",
        TestDelay      => tisd_DI_CLK(16),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(16),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(16),
        HoldLow        => thold_DI_CLK_posedge_posedge(16),
        HoldHigh       => thold_DI_CLK_negedge_posedge(16),
        CheckEnabled   => TO_X01(EN_dly and WE_dly ) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI15_CLK_posedge,
        TimingData     => Tmkr_DI15_CLK_posedge,
        TestSignal     => DI_dly(15),
        TestSignalName => "DI(15)",
        TestDelay      => tisd_DI_CLK(15),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(15),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(15),
        HoldLow        => thold_DI_CLK_posedge_posedge(15),
        HoldHigh       => thold_DI_CLK_negedge_posedge(15),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI14_CLK_posedge,
        TimingData     => Tmkr_DI14_CLK_posedge,
        TestSignal     => DI_dly(14),
        TestSignalName => "DI(14)",
        TestDelay      => tisd_DI_CLK(14),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(14),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(14),
        HoldLow        => thold_DI_CLK_posedge_posedge(14),
        HoldHigh       => thold_DI_CLK_negedge_posedge(14),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI13_CLK_posedge,
        TimingData     => Tmkr_DI13_CLK_posedge,
        TestSignal     => DI_dly(13),
        TestSignalName => "DI(13)",
        TestDelay      => tisd_DI_CLK(13),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(13),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(13),
        HoldLow        => thold_DI_CLK_posedge_posedge(13),
        HoldHigh       => thold_DI_CLK_negedge_posedge(13),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI12_CLK_posedge,
        TimingData     => Tmkr_DI12_CLK_posedge,
        TestSignal     => DI_dly(12),
        TestSignalName => "DI(12)",
        TestDelay      => tisd_DI_CLK(12),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(12),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(12),
        HoldLow        => thold_DI_CLK_posedge_posedge(12),
        HoldHigh       => thold_DI_CLK_negedge_posedge(12),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI11_CLK_posedge,
        TimingData     => Tmkr_DI11_CLK_posedge,
        TestSignal     => DI_dly(11),
        TestSignalName => "DI(11)",
        TestDelay      => tisd_DI_CLK(11),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(11),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(11),
        HoldLow        => thold_DI_CLK_posedge_posedge(11),
        HoldHigh       => thold_DI_CLK_negedge_posedge(11),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI10_CLK_posedge,
        TimingData     => Tmkr_DI10_CLK_posedge,
        TestSignal     => DI_dly(10),
        TestSignalName => "DI(10)",
        TestDelay      => tisd_DI_CLK(10),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(10),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(10),
        HoldLow        => thold_DI_CLK_posedge_posedge(10),
        HoldHigh       => thold_DI_CLK_negedge_posedge(10),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI9_CLK_posedge,
        TimingData     => Tmkr_DI9_CLK_posedge,
        TestSignal     => DI_dly(9),
        TestSignalName => "DI(9)",
        TestDelay      => tisd_DI_CLK(9),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(9),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(9),
        HoldLow        => thold_DI_CLK_posedge_posedge(9),
        HoldHigh       => thold_DI_CLK_negedge_posedge(9),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI8_CLK_posedge,
        TimingData     => Tmkr_DI8_CLK_posedge,
        TestSignal     => DI_dly(8),
        TestSignalName => "DI(8)",
        TestDelay      => tisd_DI_CLK(8),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(8),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(8),
        HoldLow        => thold_DI_CLK_posedge_posedge(8),
        HoldHigh       => thold_DI_CLK_negedge_posedge(8),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI7_CLK_posedge,
        TimingData     => Tmkr_DI7_CLK_posedge,
        TestSignal     => DI_dly(7),
        TestSignalName => "DI(7)",
        TestDelay      => tisd_DI_CLK(7),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(7),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(7),
        HoldLow        => thold_DI_CLK_posedge_posedge(7),
        HoldHigh       => thold_DI_CLK_negedge_posedge(7),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI6_CLK_posedge,
        TimingData     => Tmkr_DI6_CLK_posedge,
        TestSignal     => DI_dly(6),
        TestSignalName => "DI(6)",
        TestDelay      => tisd_DI_CLK(6),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(6),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(6),
        HoldLow        => thold_DI_CLK_posedge_posedge(6),
        HoldHigh       => thold_DI_CLK_negedge_posedge(6),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI5_CLK_posedge,
        TimingData     => Tmkr_DI5_CLK_posedge,
        TestSignal     => DI_dly(5),
        TestSignalName => "DI(5)",
        TestDelay      => tisd_DI_CLK(5),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(5),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(5),
        HoldLow        => thold_DI_CLK_posedge_posedge(5),
        HoldHigh       => thold_DI_CLK_negedge_posedge(5),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI4_CLK_posedge,
        TimingData     => Tmkr_DI4_CLK_posedge,
        TestSignal     => DI_dly(4),
        TestSignalName => "DI(4)",
        TestDelay      => tisd_DI_CLK(4),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(4),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(4),
        HoldLow        => thold_DI_CLK_posedge_posedge(4),
        HoldHigh       => thold_DI_CLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI3_CLK_posedge,
        TimingData     => Tmkr_DI3_CLK_posedge,
        TestSignal     => DI_dly(3),
        TestSignalName => "DI(3)",
        TestDelay      => tisd_DI_CLK(3),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(3),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(3),
        HoldLow        => thold_DI_CLK_posedge_posedge(3),
        HoldHigh       => thold_DI_CLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI2_CLK_posedge,
        TimingData     => Tmkr_DI2_CLK_posedge,
        TestSignal     => DI_dly(2),
        TestSignalName => "DI(2)",
        TestDelay      => tisd_DI_CLK(2),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(2),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(2),
        HoldLow        => thold_DI_CLK_posedge_posedge(2),
        HoldHigh       => thold_DI_CLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI1_CLK_posedge,
        TimingData     => Tmkr_DI1_CLK_posedge,
        TestSignal     => DI_dly(1),
        TestSignalName => "DI(1)",
        TestDelay      => tisd_DI_CLK(1),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(1),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(1),
        HoldLow        => thold_DI_CLK_posedge_posedge(1),
        HoldHigh       => thold_DI_CLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI0_CLK_posedge,
        TimingData     => Tmkr_DI0_CLK_posedge,
        TestSignal     => DI_dly(0),
        TestSignalName => "DI(0)",
        TestDelay      => tisd_DI_CLK(0),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(0),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(0),
        HoldLow        => thold_DI_CLK_posedge_posedge(0),
        HoldHigh       => thold_DI_CLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIP3_CLK_posedge,
        TimingData     => Tmkr_DIP3_CLK_posedge,
        TestSignal     => DIP_dly(3),
        TestSignalName => "DIP(3)",
        TestDelay      => tisd_DIP_CLK(3),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DIP_CLK_posedge_posedge(3),
        SetupLow       => tsetup_DIP_CLK_negedge_posedge(3),
        HoldLow        => thold_DIP_CLK_posedge_posedge(3),
        HoldHigh       => thold_DIP_CLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIP2_CLK_posedge,
        TimingData     => Tmkr_DIP2_CLK_posedge,
        TestSignal     => DIP_dly(2),
        TestSignalName => "DIP(2)",
        TestDelay      => tisd_DIP_CLK(2),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DIP_CLK_posedge_posedge(2),
        SetupLow       => tsetup_DIP_CLK_negedge_posedge(2),
        HoldLow        => thold_DIP_CLK_posedge_posedge(2),
        HoldHigh       => thold_DIP_CLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIP1_CLK_posedge,
        TimingData     => Tmkr_DIP1_CLK_posedge,
        TestSignal     => DIP_dly(1),
        TestSignalName => "DIP(1)",
        TestDelay      => tisd_DIP_CLK(1),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DIP_CLK_posedge_posedge(1),
        SetupLow       => tsetup_DIP_CLK_negedge_posedge(1),
        HoldLow        => thold_DIP_CLK_posedge_posedge(1),
        HoldHigh       => thold_DIP_CLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DIP0_CLK_posedge,
        TimingData     => Tmkr_DIP0_CLK_posedge,
        TestSignal     => DIP_dly(0),
        TestSignalName => "DIP(0)",
        TestDelay      => tisd_DIP_CLK(0),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => 0 ps,
        SetupHigh      => tsetup_DIP_CLK_posedge_posedge(0),
        SetupLow       => tsetup_DIP_CLK_negedge_posedge(0),
        HoldLow        => thold_DIP_CLK_posedge_posedge(0),
        HoldHigh       => thold_DIP_CLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WE_CLK_posedge,
        TimingData     => Tmkr_WE_CLK_posedge,
        TestSignal     => WE_dly,
        TestSignalName => "WE",
        TestDelay      => tisd_WE_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_WE_CLK_posedge_posedge,
        SetupLow       => tsetup_WE_CLK_negedge_posedge,
        HoldLow        => thold_WE_CLK_posedge_posedge,
        HoldHigh       => thold_WE_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_EN_CLK_posedge,
        TimingData     => Tmkr_EN_CLK_posedge,
        TestSignal     => EN_dly,
        TestSignalName => "EN",
        TestDelay      => tisd_EN_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_EN_CLK_posedge_posedge,
        SetupLow       => tsetup_EN_CLK_negedge_posedge,
        HoldLow        => thold_EN_CLK_posedge_posedge,
        HoldHigh       => thold_EN_CLK_negedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_SSR_CLK_posedge,
        TimingData     => Tmkr_SSR_CLK_posedge,
        TestSignal     => SSR_dly,
        TestSignalName => "SSR",
        TestDelay      => tisd_SSR_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_SSR_CLK_posedge_posedge,
        SetupLow       => tsetup_SSR_CLK_negedge_posedge,
        HoldLow        => thold_SSR_CLK_posedge_posedge,
        HoldHigh       => thold_SSR_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR8_CLK_posedge,
        TimingData     => Tmkr_ADDR8_CLK_posedge,
        TestSignal     => ADDR_dly(8),
        TestSignalName => "ADDR(8)",
        TestDelay      => tisd_ADDR_CLK(8),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(8),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(8),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(8),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(8),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR7_CLK_posedge,
        TimingData     => Tmkr_ADDR7_CLK_posedge,
        TestSignal     => ADDR_dly(7),
        TestSignalName => "ADDR(7)",
        TestDelay      => tisd_ADDR_CLK(7),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(7),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(7),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(7),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(7),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR6_CLK_posedge,
        TimingData     => Tmkr_ADDR6_CLK_posedge,
        TestSignal     => ADDR_dly(6),
        TestSignalName => "ADDR(6)",
        TestDelay      => tisd_ADDR_CLK(6),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(6),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(6),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(6),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(6),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR5_CLK_posedge,
        TimingData     => Tmkr_ADDR5_CLK_posedge,
        TestSignal     => ADDR_dly(5),
        TestSignalName => "ADDR(5)",
        TestDelay      => tisd_ADDR_CLK(5),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(5),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(5),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(5),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(5),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR4_CLK_posedge,
        TimingData     => Tmkr_ADDR4_CLK_posedge,
        TestSignal     => ADDR_dly(4),
        TestSignalName => "ADDR(4)",
        TestDelay      => tisd_ADDR_CLK(4),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(4),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(4),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR3_CLK_posedge,
        TimingData     => Tmkr_ADDR3_CLK_posedge,
        TestSignal     => ADDR_dly(3),
        TestSignalName => "ADDR(3)",
        TestDelay      => tisd_ADDR_CLK(3),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(3),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(3),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR2_CLK_posedge,
        TimingData     => Tmkr_ADDR2_CLK_posedge,
        TestSignal     => ADDR_dly(2),
        TestSignalName => "ADDR(2)",
        TestDelay      => tisd_ADDR_CLK(2),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(2),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(2),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR1_CLK_posedge,
        TimingData     => Tmkr_ADDR1_CLK_posedge,
        TestSignal     => ADDR_dly(1),
        TestSignalName => "ADDR(1)",
        TestDelay      => tisd_ADDR_CLK(1),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(1),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(1),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR0_CLK_posedge,
        TimingData     => Tmkr_ADDR0_CLK_posedge,
        TestSignal     => ADDR_dly(0),
        TestSignalName => "ADDR(0)",
        TestDelay      => tisd_ADDR_CLK(0),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(0),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(0),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLK,
        PeriodData     => PInfo_CLK,
        TestSignal     => CLK_dly,
        TestSignalName => "CLK",
        TestDelay      => 0 ps,
        Period         => 0 ps,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow  => tpw_CLK_negedge,
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        HeaderMsg      => "/X_RAMB16_S36",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
    end if;

    Violation :=
      Pviol_CLK or
      Tviol_ADDR0_CLK_posedge or
      Tviol_ADDR1_CLK_posedge or
      Tviol_ADDR2_CLK_posedge or
      Tviol_ADDR3_CLK_posedge or
      Tviol_ADDR4_CLK_posedge or
      Tviol_ADDR5_CLK_posedge or
      Tviol_ADDR6_CLK_posedge or
      Tviol_ADDR7_CLK_posedge or
      Tviol_ADDR8_CLK_posedge or
      Tviol_DI0_CLK_posedge or
      Tviol_DI10_CLK_posedge or
      Tviol_DI11_CLK_posedge or
      Tviol_DI12_CLK_posedge or
      Tviol_DI13_CLK_posedge or
      Tviol_DI14_CLK_posedge or
      Tviol_DI15_CLK_posedge or
      Tviol_DI16_CLK_posedge or
      Tviol_DI17_CLK_posedge or
      Tviol_DI18_CLK_posedge or
      Tviol_DI19_CLK_posedge or
      Tviol_DI1_CLK_posedge or
      Tviol_DI20_CLK_posedge or
      Tviol_DI21_CLK_posedge or
      Tviol_DI22_CLK_posedge or
      Tviol_DI23_CLK_posedge or
      Tviol_DI24_CLK_posedge or
      Tviol_DI25_CLK_posedge or
      Tviol_DI26_CLK_posedge or
      Tviol_DI27_CLK_posedge or
      Tviol_DI28_CLK_posedge or
      Tviol_DI29_CLK_posedge or
      Tviol_DI2_CLK_posedge or
      Tviol_DI30_CLK_posedge or
      Tviol_DI31_CLK_posedge or
      Tviol_DI3_CLK_posedge or
      Tviol_DI4_CLK_posedge or
      Tviol_DI5_CLK_posedge or
      Tviol_DI6_CLK_posedge or
      Tviol_DI7_CLK_posedge or
      Tviol_DI8_CLK_posedge or
      Tviol_DI9_CLK_posedge or
      Tviol_DIP0_CLK_posedge or
      Tviol_DIP1_CLK_posedge or
      Tviol_DIP2_CLK_posedge or
      Tviol_DIP3_CLK_posedge or
      Tviol_EN_CLK_posedge or
      Tviol_SSR_CLK_posedge or
      Tviol_WE_CLK_posedge;

    VALID_ADDR := ADDR_IS_VALID(ADDR_dly);

    if (VALID_ADDR) then
      ADDRESS := SLV_TO_INT(ADDR_dly);
    end if;

    if (GSR_dly = '1') then
      DO_zd                                                         := INI(31 downto 0 );
      DOP_zd                                                        := INI (35 downto 32 );
      
    elsif (GSR_dly = '0') then
      if (rising_edge(CLK_dly)) then
        if (EN_dly = '1') then
          if (SSR_dly = '1') then
            DO_zd := To_StdLogicVector(SRVAL)(31 downto 0);
            DOP_zd := To_StdLogicVector(SRVAL)(35 downto 32);          
          else    
            if (WE_dly = '1') then
              if (wr_mode = 0) then
                DO_zd := DI_dly;
                DOP_zd := DIP_dly;              
              elsif (wr_mode = 1) then
                DO_zd := mem(address);
                DOP_zd := memp(address);                
              end if;
            else 
              if (valid_addr) then
                DO_zd := mem(address);
                DOP_zd := memp(address);              
              end if;
            end if;
          end if;
          if (WE_dly = '1') then
            if (valid_addr) then
              mem(address) := DI_dly;
              memp(address) := DIP_dly;            
            end if;
          end if;  
        end if;
      end if;
    end if;

    DO_zd(31) := Violation xor DO_zd(31);
    DO_zd(30) := Violation xor DO_zd(30);
    DO_zd(29) := Violation xor DO_zd(29);
    DO_zd(28) := Violation xor DO_zd(28);
    DO_zd(27) := Violation xor DO_zd(27);
    DO_zd(26) := Violation xor DO_zd(26);
    DO_zd(25) := Violation xor DO_zd(25);
    DO_zd(24) := Violation xor DO_zd(24);
    DO_zd(23) := Violation xor DO_zd(23);
    DO_zd(22) := Violation xor DO_zd(22);
    DO_zd(21) := Violation xor DO_zd(21);
    DO_zd(20) := Violation xor DO_zd(20);
    DO_zd(19) := Violation xor DO_zd(19);
    DO_zd(18) := Violation xor DO_zd(18);
    DO_zd(17) := Violation xor DO_zd(17);
    DO_zd(16) := Violation xor DO_zd(16);
    DO_zd(15) := Violation xor DO_zd(15);
    DO_zd(14) := Violation xor DO_zd(14);
    DO_zd(13) := Violation xor DO_zd(13);
    DO_zd(12) := Violation xor DO_zd(12);
    DO_zd(11) := Violation xor DO_zd(11);
    DO_zd(10) := Violation xor DO_zd(10);
    DO_zd(9)  := Violation xor DO_zd(9);
    DO_zd(8)  := Violation xor DO_zd(8);
    DO_zd(7)  := Violation xor DO_zd(7);
    DO_zd(6)  := Violation xor DO_zd(6);
    DO_zd(5)  := Violation xor DO_zd(5);
    DO_zd(4)  := Violation xor DO_zd(4);
    DO_zd(3)  := Violation xor DO_zd(3);
    DO_zd(2)  := Violation xor DO_zd(2);
    DO_zd(1)  := Violation xor DO_zd(1);
    DO_zd(0)  := Violation xor DO_zd(0);
    DOP_zd(3) := Violation xor DOP_zd(3);
    DOP_zd(2) := Violation xor DOP_zd(2);
    DOP_zd(1) := Violation xor DOP_zd(1);
    DOP_zd(0) := Violation xor DOP_zd(0);

    VitalPathDelay01 (
      OutSignal     => DOP(3),
      GlitchData    => DOP_GlitchData3,
      OutSignalName => "DOP(3)",
      OutTemp       => DOP_zd(3),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DOP(3), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOP(2),
      GlitchData    => DOP_GlitchData2,
      OutSignalName => "DOP(2)",
      OutTemp       => DOP_zd(2),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DOP(2), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOP(1),
      GlitchData    => DOP_GlitchData1,
      OutSignalName => "DOP(1)",
      OutTemp       => DOP_zd(1),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DOP(1), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOP(0),
      GlitchData    => DOP_GlitchData0,
      OutSignalName => "DOP(0)",
      OutTemp       => DOP_zd(0),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DOP(0), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(31),
      GlitchData    => DO_GlitchData31,
      OutSignalName => "DO(31)",
      OutTemp       => DO_zd(31),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(31), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(30),
      GlitchData    => DO_GlitchData30,
      OutSignalName => "DO(30)",
      OutTemp       => DO_zd(30),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(30), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(29),
      GlitchData    => DO_GlitchData29,
      OutSignalName => "DO(29)",
      OutTemp       => DO_zd(29),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(29), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(28),
      GlitchData    => DO_GlitchData28,
      OutSignalName => "DO(28)",
      OutTemp       => DO_zd(28),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(28), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(27),
      GlitchData    => DO_GlitchData27,
      OutSignalName => "DO(27)",
      OutTemp       => DO_zd(27),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(27), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(26),
      GlitchData    => DO_GlitchData26,
      OutSignalName => "DO(26)",
      OutTemp       => DO_zd(26),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(26), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(25),
      GlitchData    => DO_GlitchData25,
      OutSignalName => "DO(25)",
      OutTemp       => DO_zd(25),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(25), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(24),
      GlitchData    => DO_GlitchData24,
      OutSignalName => "DO(24)",
      OutTemp       => DO_zd(24),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(24), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(23),
      GlitchData    => DO_GlitchData23,
      OutSignalName => "DO(23)",
      OutTemp       => DO_zd(23),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(23), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(22),
      GlitchData    => DO_GlitchData22,
      OutSignalName => "DO(22)",
      OutTemp       => DO_zd(22),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(22), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(21),
      GlitchData    => DO_GlitchData21,
      OutSignalName => "DO(21)",
      OutTemp       => DO_zd(21),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(21), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(20),
      GlitchData    => DO_GlitchData20,
      OutSignalName => "DO(20)",
      OutTemp       => DO_zd(20),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(20), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(19),
      GlitchData    => DO_GlitchData19,
      OutSignalName => "DO(19)",
      OutTemp       => DO_zd(19),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(19), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(18),
      GlitchData    => DO_GlitchData18,
      OutSignalName => "DO(18)",
      OutTemp       => DO_zd(18),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(18), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(17),
      GlitchData    => DO_GlitchData17,
      OutSignalName => "DO(17)",
      OutTemp       => DO_zd(17),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(17), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(16),
      GlitchData    => DO_GlitchData16,
      OutSignalName => "DO(16)",
      OutTemp       => DO_zd(16),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(16), (EN_dly /= '0' and GSR_dly
                                                             /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(15),
      GlitchData    => DO_GlitchData15,
      OutSignalName => "DO(15)",
      OutTemp       => DO_zd(15),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(15), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(14),
      GlitchData    => DO_GlitchData14,
      OutSignalName => "DO(14)",
      OutTemp       => DO_zd(14),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(14), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(13),
      GlitchData    => DO_GlitchData13,
      OutSignalName => "DO(13)",
      OutTemp       => DO_zd(13),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(13), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(12),
      GlitchData    => DO_GlitchData12,
      OutSignalName => "DO(12)",
      OutTemp       => DO_zd(12),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(12), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(11),
      GlitchData    => DO_GlitchData11,
      OutSignalName => "DO(11)",
      OutTemp       => DO_zd(11),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(11), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(10),
      GlitchData    => DO_GlitchData10,
      OutSignalName => "DO(10)",
      OutTemp       => DO_zd(10),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(10), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(9),
      GlitchData    => DO_GlitchData9,
      OutSignalName => "DO(9)",
      OutTemp       => DO_zd(9),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(9), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(8),
      GlitchData    => DO_GlitchData8,
      OutSignalName => "DO(8)",
      OutTemp       => DO_zd(8),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(8), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(7),
      GlitchData    => DO_GlitchData7,
      OutSignalName => "DO(7)",
      OutTemp       => DO_zd(7),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(7), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(6),
      GlitchData    => DO_GlitchData6,
      OutSignalName => "DO(6)",
      OutTemp       => DO_zd(6),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(6), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(5),
      GlitchData    => DO_GlitchData5,
      OutSignalName => "DO(5)",
      OutTemp       => DO_zd(5),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(5), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(4),
      GlitchData    => DO_GlitchData4,
      OutSignalName => "DO(4)",
      OutTemp       => DO_zd(4),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(4), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(3),
      GlitchData    => DO_GlitchData3,
      OutSignalName => "DO(3)",
      OutTemp       => DO_zd(3),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(3), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(2),
      GlitchData    => DO_GlitchData2,
      OutSignalName => "DO(2)",
      OutTemp       => DO_zd(2),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(2), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(1),
      GlitchData    => DO_GlitchData1,
      OutSignalName => "DO(1)",
      OutTemp       => DO_zd(1),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(1), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(0),
      GlitchData    => DO_GlitchData0,
      OutSignalName => "DO(0)",
      OutTemp       => DO_zd(0),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(0), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    wait on ADDR_dly, CLK_dly, DI_dly, DIP_dly, EN_dly, GSR_dly, SSR_dly, WE_dly;
  end process VITALBehavior;
end X_RAMB16_S36_V;
