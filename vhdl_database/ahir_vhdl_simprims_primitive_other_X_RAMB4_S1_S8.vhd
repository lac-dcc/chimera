-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  4K-Bit Data Dual Port Block RAM
-- /___/   /\     Filename : X_RAMB4_S1_S8.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:56:56 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision

----- CELL x_ramb4_s1_s8 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.VCOMPONENTS.all;

entity X_RAMB4_S1_S8 is
  generic (
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;

    LOC            : string  := "UNPLACED";

    tipd_ADDRA : VitalDelayArrayType01(11 downto 0)  := (others => (0 ps, 0 ps));
    tipd_CLKA  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIA   : VitalDelayArrayType01(0 downto 0) := (others => (0 ps, 0 ps));
    tipd_ENA   : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_RSTA  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEA   : VitalDelayType01                   := ( 0 ps, 0 ps);

    tipd_ADDRB : VitalDelayArrayType01(8 downto 0)  := (others => (0 ps, 0 ps));
    tipd_CLKB  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIB   : VitalDelayArrayType01(7 downto 0) := (others => (0 ps, 0 ps));
    tipd_ENB   : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_RSTB  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEB   : VitalDelayType01                   := ( 0 ps, 0 ps);


    tpd_CLKA_DOA : VitalDelayArrayType01(0 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKB_DOB : VitalDelayArrayType01(7 downto 0) := (others => (100 ps, 100 ps));

    tsetup_ADDRA_CLKA_negedge_posedge  : VitalDelayArrayType(11 downto 0)  := (others => 0 ps);
    tsetup_ADDRA_CLKA_posedge_posedge  : VitalDelayArrayType(11 downto 0)  := (others => 0 ps);
    tsetup_DIA_CLKA_negedge_posedge    : VitalDelayArrayType(0 downto 0) := (others => 0 ps);
    tsetup_DIA_CLKA_posedge_posedge    : VitalDelayArrayType(0 downto 0) := (others => 0 ps);
    tsetup_ENA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_RSTA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_RSTA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_WEA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;

    tsetup_ADDRB_CLKB_negedge_posedge  : VitalDelayArrayType(8 downto 0)  := (others => 0 ps);
    tsetup_ADDRB_CLKB_posedge_posedge  : VitalDelayArrayType(8 downto 0)  := (others => 0 ps);
    tsetup_DIB_CLKB_negedge_posedge    : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    tsetup_DIB_CLKB_posedge_posedge    : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    tsetup_ENB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_RSTB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_RSTB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_WEB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;

    thold_ADDRA_CLKA_negedge_posedge : VitalDelayArrayType(11 downto 0)  := (others => 0 ps);
    thold_ADDRA_CLKA_posedge_posedge : VitalDelayArrayType(11 downto 0)  := (others => 0 ps);
    thold_DIA_CLKA_negedge_posedge   : VitalDelayArrayType(0 downto 0) := (others => 0 ps);
    thold_DIA_CLKA_posedge_posedge   : VitalDelayArrayType(0 downto 0) := (others => 0 ps);
    thold_ENA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_ENA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_RSTA_CLKA_negedge_posedge  : VitalDelayType                   := 0 ps;
    thold_RSTA_CLKA_posedge_posedge  : VitalDelayType                   := 0 ps;
    thold_WEA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;

    thold_ADDRB_CLKB_negedge_posedge : VitalDelayArrayType(8 downto 0)  := (others => 0 ps);
    thold_ADDRB_CLKB_posedge_posedge : VitalDelayArrayType(8 downto 0)  := (others => 0 ps);
    thold_DIB_CLKB_negedge_posedge   : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    thold_DIB_CLKB_posedge_posedge   : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    thold_ENB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_ENB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_RSTB_CLKB_negedge_posedge  : VitalDelayType                   := 0 ps;
    thold_RSTB_CLKB_posedge_posedge  : VitalDelayType                   := 0 ps;
    thold_WEB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;

    ticd_CLKA         : VitalDelayType                     := 0 ps;
    tisd_ADDRA_CLKA   : VitalDelayArrayType(11 downto 0)    := (others => 0 ps);
    tisd_DIA_CLKA     : VitalDelayArrayType(0 downto 0)   := (others => 0 ps);
    tisd_ENA_CLKA     : VitalDelayType                     := 0 ps;
    tisd_RSTA_CLKA    : VitalDelayType                     := 0 ps;
    tisd_WEA_CLKA     : VitalDelayType                     := 0 ps;

    ticd_CLKB         : VitalDelayType                     := 0 ps;
    tisd_ADDRB_CLKB   : VitalDelayArrayType(8 downto 0)    := (others => 0 ps);
    tisd_DIB_CLKB     : VitalDelayArrayType(7 downto 0)   := (others => 0 ps);
    tisd_ENB_CLKB     : VitalDelayType                     := 0 ps;
    tisd_RSTB_CLKB    : VitalDelayType                     := 0 ps;
    tisd_WEB_CLKB     : VitalDelayType                     := 0 ps;

    tpw_CLKA_negedge : VitalDelayType := 0 ps;
    tpw_CLKA_posedge : VitalDelayType := 0 ps;
    tpw_CLKB_negedge : VitalDelayType := 0 ps;
    tpw_CLKB_posedge : VitalDelayType := 0 ps;

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
    SETUP_ALL : VitalDelayType := 1000 ps;

    SIM_COLLISION_CHECK : string := "ALL"

    );

  port(
    DOA : out std_logic_vector(0 downto 0) := (others => '0');
    DOB : out std_logic_vector(7 downto 0) := (others => '0');

    ADDRA : in std_logic_vector(11 downto 0);
    ADDRB : in std_logic_vector(8 downto 0);
    CLKA  : in std_ulogic;
    CLKB  : in std_ulogic;
    DIA   : in std_logic_vector(0 downto 0);
    DIB   : in std_logic_vector(7 downto 0);
    ENA   : in std_ulogic;
    ENB   : in std_ulogic;
    RSTA  : in std_ulogic;
    RSTB  : in std_ulogic;
    WEA   : in std_ulogic;
    WEB   : in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_RAMB4_S1_S8 : entity is true;
end x_ramb4_s1_s8;

architecture X_RAMB4_S1_S8_V of X_RAMB4_S1_S8 is
  attribute VITAL_LEVEL0 of
    X_RAMB4_S1_S8_V : architecture is true;

  signal ADDRA_ipd : std_logic_vector(11 downto 0)  := (others => 'X');
  signal CLKA_ipd  : std_ulogic                    := 'X';
  signal DIA_ipd   : std_logic_vector(0 downto 0) := (others => 'X');
  signal ENA_ipd   : std_ulogic                    := 'X';
  signal RSTA_ipd  : std_ulogic                    := 'X';
  signal WEA_ipd   : std_ulogic                    := 'X';

  signal ADDRB_ipd : std_logic_vector(8 downto 0)  := (others => 'X');
  signal CLKB_ipd  : std_ulogic                    := 'X';
  signal DIB_ipd   : std_logic_vector(7 downto 0) := (others => 'X');
  signal ENB_ipd   : std_ulogic                    := 'X';
  signal RSTB_ipd  : std_ulogic                    := 'X';
  signal WEB_ipd   : std_ulogic                    := 'X';

  signal GSR_ipd : std_ulogic := 'X';

  signal ADDRA_dly    : std_logic_vector(11 downto 0)  := (others => 'X');
  signal CLKA_dly     : std_ulogic                    := 'X';
  signal DIA_dly      : std_logic_vector(0 downto 0) := (others => 'X');
  signal ENA_dly      : std_ulogic                    := 'X';
  signal GSR_CLKA_dly : std_ulogic                    := '0';
  signal RSTA_dly     : std_ulogic                    := 'X';
  signal WEA_dly      : std_ulogic                    := 'X';

  signal ADDRB_dly    : std_logic_vector(8 downto 0)  := (others => 'X');
  signal CLKB_dly     : std_ulogic                    := 'X';
  signal DIB_dly      : std_logic_vector(7 downto 0) := (others => 'X');
  signal ENB_dly      : std_ulogic                    := 'X';
  signal GSR_CLKB_dly : std_ulogic                    := '0';
  signal RSTB_dly     : std_ulogic                    := 'X';
  signal WEB_dly      : std_ulogic                    := 'X';

  constant length_a : integer := 4096;
  constant length_b : integer := 512;
  constant width_a : integer := 1;
  constant width_b   : integer := 8;
  type Two_D_array_type is array ((length_b -  1) downto 0) of std_logic_vector((width_b - 1) downto 0);
  function slv_to_two_D_array(
    SLV : in std_logic_vector)
    return two_D_array_type is
    variable two_D_array : two_D_array_type;
    variable intermediate : std_logic_vector((width_b - 1) downto 0);
  begin
    for i in two_D_array'low to two_D_array'high loop
      intermediate := SLV(((i*width_b) + (width_b - 1)) downto (i* width_b));
      two_D_array(i) := intermediate; 
    end loop;
    return two_D_array;
  end;
begin

  GSR_CLKA_dly <= GSR;
  GSR_CLKB_dly <= GSR;

  WireDelay : block
  begin
    ADDRA_DELAY : for i in 11 downto 0 generate
      VitalWireDelay (ADDRA_ipd(i), ADDRA(i), tipd_ADDRA(i));
    end generate ADDRA_DELAY;
    VitalWireDelay (CLKA_ipd, CLKA, tipd_CLKA);
    DIA_DELAY   : for i in 0 downto 0 generate
      VitalWireDelay (DIA_ipd(i), DIA(i), tipd_DIA(i));
    end generate DIA_DELAY;
    VitalWireDelay (ENA_ipd, ENA, tipd_ENA);
    VitalWireDelay (RSTA_ipd, RSTA, tipd_RSTA);
    VitalWireDelay (WEA_ipd, WEA, tipd_WEA);
    ADDRB_DELAY : for i in 8 downto 0 generate
      VitalWireDelay (ADDRB_ipd(i), ADDRB(i), tipd_ADDRB(i));
    end generate ADDRB_DELAY;
    VitalWireDelay (CLKB_ipd, CLKB, tipd_CLKB);
    DIB_DELAY   : for i in 7 downto 0 generate
      VitalWireDelay (DIB_ipd(i), DIB(i), tipd_DIB(i));
    end generate DIB_DELAY;
    VitalWireDelay (ENB_ipd, ENB, tipd_ENB);
    VitalWireDelay (RSTB_ipd, RSTB, tipd_RSTB);
    VitalWireDelay (WEB_ipd, WEB, tipd_WEB);
  end block;

  SignalDelay : block
  begin
    ADDRA_DELAY : for i in 11 downto 0 generate
      VitalSignalDelay (ADDRA_dly(i), ADDRA_ipd(i), tisd_ADDRA_CLKA(i));
    end generate ADDRA_DELAY;
    VitalSignalDelay (CLKA_dly, CLKA_ipd, ticd_CLKA);
    DIA_DELAY : for i in 0 downto 0 generate
      VitalSignalDelay (DIA_dly(i), DIA_ipd(i), tisd_DIA_CLKA(i));
    end generate DIA_DELAY;
    VitalSignalDelay (ENA_dly, ENA_ipd, tisd_ENA_CLKA);
    VitalSignalDelay (RSTA_dly, RSTA_ipd, tisd_RSTA_CLKA);
    VitalSignalDelay (WEA_dly, WEA_ipd, tisd_WEA_CLKA);

    ADDRB_DELAY : for i in 8 downto 0 generate
      VitalSignalDelay (ADDRB_dly(i), ADDRB_ipd(i), tisd_ADDRB_CLKB(i));
    end generate ADDRB_DELAY;
    VitalSignalDelay (CLKB_dly, CLKB_ipd, ticd_CLKB);
    DIB_DELAY   : for i in 7 downto 0 generate
      VitalSignalDelay (DIB_dly(i), DIB_ipd(i), tisd_DIB_CLKB(i));
    end generate DIB_DELAY;
    VitalSignalDelay (ENB_dly, ENB_ipd, tisd_ENB_CLKB);
    VitalSignalDelay (RSTB_dly, RSTB_ipd, tisd_RSTB_CLKB);
    VitalSignalDelay (WEB_dly, WEB_ipd, tisd_WEB_CLKB);
  end block;

  VITALBehavior                        : process
    variable Tviol_ADDRA0_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA1_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA2_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA3_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA4_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA5_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA6_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA7_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA8_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA9_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA10_CLKA_posedge : std_ulogic := '0';
    variable Tviol_ADDRA11_CLKA_posedge : std_ulogic := '0';
    variable Tviol_CLKA_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIA0_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_ENA_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_RSTA_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_WEA_CLKA_posedge    : std_ulogic := '0';

    variable Tviol_ADDRB0_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB1_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB2_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB3_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB4_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB5_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB6_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB7_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB8_CLKB_posedge : std_ulogic := '0';
    variable Tviol_CLKB_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIB0_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB1_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB2_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB3_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB4_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB5_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB6_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB7_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_ENB_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_RSTB_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_WEB_CLKB_posedge    : std_ulogic := '0';

    variable Tmkr_ADDRA0_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA1_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA2_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA3_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA4_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA5_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA6_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA7_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA8_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA9_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA10_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA11_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKA_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA0_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENA_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RSTA_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEA_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;

    variable Tmkr_ADDRB0_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB1_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB2_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB3_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB4_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB5_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB6_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB7_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB8_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKB_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB0_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB1_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB2_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB3_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB4_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB5_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB6_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB7_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENB_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RSTB_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEB_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;

    variable PInfo_CLKA : VitalPeriodDataType := VitalPeriodDataInit;
    variable PInfo_CLKB : VitalPeriodDataType := VitalPeriodDataInit;

    variable PViol_CLKA : std_ulogic := '0';
    variable PViol_CLKB : std_ulogic := '0';

    variable DOA_GlitchData0  : VitalGlitchDataType;

    variable DOB_GlitchData0  : VitalGlitchDataType;
    variable DOB_GlitchData1  : VitalGlitchDataType;
    variable DOB_GlitchData2  : VitalGlitchDataType;
    variable DOB_GlitchData3  : VitalGlitchDataType;
    variable DOB_GlitchData4  : VitalGlitchDataType;
    variable DOB_GlitchData5  : VitalGlitchDataType;
    variable DOB_GlitchData6  : VitalGlitchDataType;
    variable DOB_GlitchData7  : VitalGlitchDataType;

    variable mem_slv : std_logic_vector(4095 downto 0) := To_StdLogicVector(INIT_0F & INIT_0E & INIT_0D & INIT_0C &
                                                                            INIT_0B & INIT_0A & INIT_09 & INIT_08 &
                                                                            INIT_07 & INIT_06 & INIT_05 & INIT_04 &
                                                                            INIT_03 & INIT_02 & INIT_01 & INIT_00);     
    variable mem : Two_D_array_type := slv_to_two_D_array(mem_slv);    
    variable ADDRA_dly_sampled : std_logic_vector(11 downto 0)  := (others => 'X');
    variable ADDRB_dly_sampled : std_logic_vector(8 downto 0)  := (others => 'X');
    variable ADDRESS_A         : integer;
    variable ADDRESS_B         : integer;
    variable DOA_OV_LSB        : integer;
    variable DOA_OV_MSB        : integer;
    variable DOA_zd            : std_logic_vector(0 downto 0) := (others => '0');
    variable DOB_OV_LSB        : integer;
    variable DOB_OV_MSB        : integer;
    variable DOB_zd            : std_logic_vector(7 downto 0) := (others => '0');
    variable ENA_dly_sampled   : std_ulogic                     := 'X';
    variable ENB_dly_sampled   : std_ulogic                     := 'X';
    variable FIRST_TIME        : boolean                       := true;
    variable HAS_OVERLAP       : boolean                       := false;
    variable OLP_LSB           : integer;
    variable OLP_MSB           : integer;
    variable RSTA_dly_sampled  : std_ulogic                     := 'X';
    variable RSTB_dly_sampled  : std_ulogic                     := 'X';
    variable VALID_ADDRA       : boolean                       := false;
    variable VALID_ADDRB       : boolean                       := false;
    variable ViolationA        : std_ulogic                    := '0';
    variable ViolationB        : std_ulogic                    := '0';
    variable ViolationCLKAB    : std_ulogic                    := '0';
    variable WEA_dly_sampled   : std_ulogic                     := 'X';
    variable WEB_dly_sampled   : std_ulogic                     := 'X';
    variable collision_type : integer := 3;

  begin
    if (FIRST_TIME) then
      if ((SIM_COLLISION_CHECK = "none") or (SIM_COLLISION_CHECK = "NONE"))  then
        collision_type := 0;
      elsif ((SIM_COLLISION_CHECK = "warning_only") or (SIM_COLLISION_CHECK = "WARNING_ONLY"))  then
        collision_type := 1;
      elsif ((SIM_COLLISION_CHECK = "generate_x_only") or (SIM_COLLISION_CHECK = "GENERATE_X_ONLY"))  then
        collision_type := 2;
      elsif ((SIM_COLLISION_CHECK = "all") or (SIM_COLLISION_CHECK = "ALL"))  then        
        collision_type := 3;
      else
        GenericValueCheckMessage
          (HeaderMsg => "Attribute Syntax Error",
           GenericName => "SIM_COLLISION_CHECK",
           EntityName => "X_RAMB4_S1_S8",
           GenericValue => SIM_COLLISION_CHECK,
           Unit => "",
           ExpectedValueMsg => "Legal Values for this attribute are ALL, NONE, WARNING_ONLY or GENERATE_X_ONLY",
           ExpectedGenericValue => "",
           TailMsg => "",
           MsgSeverity => error
           );
      end if;
      DOA <= DOA_zd;
      DOB <= DOB_zd;
      FIRST_TIME := false;
    end if;

    if (CLKA_dly'event) then
      ENA_dly_sampled   := ENA_dly;
      RSTA_dly_sampled  := RSTA_dly;
      WEA_dly_sampled   := WEA_dly;
      ADDRA_dly_sampled := ADDRA_dly;
    end if;
    if (CLKB_dly'event) then
      ENB_dly_sampled   := ENB_dly;
      RSTB_dly_sampled  := RSTB_dly;
      WEB_dly_sampled   := WEB_dly;
      ADDRB_dly_sampled := ADDRB_dly;
    end if;

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
        HoldLow        => thold_ENA_CLKA_posedge_posedge,
        HoldHigh       => thold_ENA_CLKA_negedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RSTA_CLKA_posedge,
        TimingData     => Tmkr_RSTA_CLKA_posedge,
        TestSignal     => RSTA_dly,
        TestSignalName => "RSTA",
        TestDelay      => tisd_RSTA_CLKA,
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_RSTA_CLKA_posedge_posedge,
        SetupLow       => tsetup_RSTA_CLKA_negedge_posedge,
        HoldLow        => thold_RSTA_CLKA_posedge_posedge,
        HoldHigh       => thold_RSTA_CLKA_negedge_posedge,
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEA_CLKA_posedge,
        TimingData     => Tmkr_WEA_CLKA_posedge,
        TestSignal     => WEA_dly,
        TestSignalName => "WEA",
        TestDelay      => tisd_WEA_CLKA,
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => ticd_CLKA,
        SetupHigh      => tsetup_WEA_CLKA_posedge_posedge,
        SetupLow       => tsetup_WEA_CLKA_negedge_posedge,
        HoldLow        => thold_WEA_CLKA_posedge_posedge,
        HoldHigh       => thold_WEA_CLKA_negedge_posedge,
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(0),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(0),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(1),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(1),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(2),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(2),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(3),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(3),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(4),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(4),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(5),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(5),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(6),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(6),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(7),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(7),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(8),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(8),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(9),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(9),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(10),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(10),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRA_CLKA_posedge_posedge(11),
        HoldHigh       => thold_ADDRA_CLKA_negedge_posedge(11),
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_DIA_CLKA_posedge_posedge(0),
        HoldHigh       => thold_DIA_CLKA_negedge_posedge(0),
        CheckEnabled   => (TO_X01(ENA_dly_sampled) = '1' and TO_X01(WEA_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ENB_CLKB_posedge_posedge,
        HoldHigh       => thold_ENB_CLKB_negedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RSTB_CLKB_posedge,
        TimingData     => Tmkr_RSTB_CLKB_posedge,
        TestSignal     => RSTB_dly,
        TestSignalName => "RSTB",
        TestDelay      => tisd_RSTB_CLKB,
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_RSTB_CLKB_posedge_posedge,
        SetupLow       => tsetup_RSTB_CLKB_negedge_posedge,
        HoldLow        => thold_RSTB_CLKB_posedge_posedge,
        HoldHigh       => thold_RSTB_CLKB_negedge_posedge,
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WEB_CLKB_posedge,
        TimingData     => Tmkr_WEB_CLKB_posedge,
        TestSignal     => WEB_dly,
        TestSignalName => "WEB",
        TestDelay      => tisd_WEB_CLKB,
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => ticd_CLKB,
        SetupHigh      => tsetup_WEB_CLKB_posedge_posedge,
        SetupLow       => tsetup_WEB_CLKB_negedge_posedge,
        HoldLow        => thold_WEB_CLKB_posedge_posedge,
        HoldHigh       => thold_WEB_CLKB_negedge_posedge,
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_ADDRB_CLKB_posedge_posedge(0),
        HoldHigh       => thold_ADDRB_CLKB_negedge_posedge(0),
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/${CELL}",
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
        HoldLow        => thold_ADDRB_CLKB_posedge_posedge(1),
        HoldHigh       => thold_ADDRB_CLKB_negedge_posedge(1),
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/${CELL}",
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
        HoldLow        => thold_ADDRB_CLKB_posedge_posedge(2),
        HoldHigh       => thold_ADDRB_CLKB_negedge_posedge(2),
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/${CELL}",
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
        HoldLow        => thold_ADDRB_CLKB_posedge_posedge(3),
        HoldHigh       => thold_ADDRB_CLKB_negedge_posedge(3),
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/${CELL}",
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
        HoldLow        => thold_ADDRB_CLKB_posedge_posedge(4),
        HoldHigh       => thold_ADDRB_CLKB_negedge_posedge(4),
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/${CELL}",
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
        HoldLow        => thold_ADDRB_CLKB_posedge_posedge(5),
        HoldHigh       => thold_ADDRB_CLKB_negedge_posedge(5),
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/${CELL}",
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
        HoldLow        => thold_ADDRB_CLKB_posedge_posedge(6),
        HoldHigh       => thold_ADDRB_CLKB_negedge_posedge(6),
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/${CELL}",
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
        HoldLow        => thold_ADDRB_CLKB_posedge_posedge(7),
        HoldHigh       => thold_ADDRB_CLKB_negedge_posedge(7),
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/${CELL}",
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
        HoldLow        => thold_ADDRB_CLKB_posedge_posedge(8),
        HoldHigh       => thold_ADDRB_CLKB_negedge_posedge(8),
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/${CELL}",
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
        HoldLow        => thold_DIB_CLKB_posedge_posedge(0),
        HoldHigh       => thold_DIB_CLKB_negedge_posedge(0),
        CheckEnabled   => (TO_X01(ENB_dly_sampled) = '1' and TO_X01(WEB_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_DIB_CLKB_posedge_posedge(1),
        HoldHigh       => thold_DIB_CLKB_negedge_posedge(1),
        CheckEnabled   => (TO_X01(ENB_dly_sampled) = '1' and TO_X01(WEB_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_DIB_CLKB_posedge_posedge(2),
        HoldHigh       => thold_DIB_CLKB_negedge_posedge(2),
        CheckEnabled   => (TO_X01(ENB_dly_sampled) = '1' and TO_X01(WEB_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_DIB_CLKB_posedge_posedge(3),
        HoldHigh       => thold_DIB_CLKB_negedge_posedge(3),
        CheckEnabled   => (TO_X01(ENB_dly_sampled) = '1' and TO_X01(WEB_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_DIB_CLKB_posedge_posedge(4),
        HoldHigh       => thold_DIB_CLKB_negedge_posedge(4),
        CheckEnabled   => (TO_X01(ENB_dly_sampled) = '1' and TO_X01(WEB_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_DIB_CLKB_posedge_posedge(5),
        HoldHigh       => thold_DIB_CLKB_negedge_posedge(5),
        CheckEnabled   => (TO_X01(ENB_dly_sampled) = '1' and TO_X01(WEB_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_DIB_CLKB_posedge_posedge(6),
        HoldHigh       => thold_DIB_CLKB_negedge_posedge(6),
        CheckEnabled   => (TO_X01(ENB_dly_sampled) = '1' and TO_X01(WEB_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
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
        HoldLow        => thold_DIB_CLKB_posedge_posedge(7),
        HoldHigh       => thold_DIB_CLKB_negedge_posedge(7),
        CheckEnabled   => (TO_X01(ENB_dly_sampled) = '1' and TO_X01(WEB_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S1_S8",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLKA,
        PeriodData     => PInfo_CLKA,
        TestSignal     => CLKA_dly,
        TestSignalName => "CLKA",
        TestDelay      => 0 ps,
        Period         => 0 ps,
        PulseWidthHigh => tpw_CLKA_posedge,
        PulseWidthLow  => tpw_CLKA_negedge,
        CheckEnabled   => TO_X01(ENA_dly_sampled) = '1',
        HeaderMsg      => "/X_RAMB4_S1_S8",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLKB,
        PeriodData     => PInfo_CLKB,
        TestSignal     => CLKB_dly,
        TestSignalName => "CLKB",
        TestDelay      => 0 ps,
        Period         => 0 ps,
        PulseWidthHigh => tpw_CLKB_posedge,
        PulseWidthLow  => tpw_CLKB_negedge,
        CheckEnabled   => TO_X01(ENB_dly_sampled) = '1',
        HeaderMsg      => "/X_RAMB4_S1_S8",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
    end if;
    ViolationA :=
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
      Tviol_DIA0_CLKA_posedge or
      Tviol_ENA_CLKA_posedge or
      Tviol_RSTA_CLKA_posedge or
      Tviol_WEA_CLKA_posedge or
      Pviol_CLKA ;
    ViolationB :=
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
      Tviol_ENB_CLKB_posedge or
      Tviol_RSTB_CLKB_posedge or
      Tviol_WEB_CLKB_posedge or
      Pviol_CLKB;

    VALID_ADDRA    := ADDR_IS_VALID(ADDRA_dly_sampled);
    if (VALID_ADDRA) then
      ADDRESS_A    := SLV_TO_INT(ADDRA_dly_sampled);
    end if;
    VALID_ADDRB    := ADDR_IS_VALID(ADDRB_dly_sampled);
    if (VALID_ADDRB) then
      ADDRESS_B    := SLV_TO_INT(ADDRB_dly_sampled);
    end if;
    if (VALID_ADDRA and VALID_ADDRB) then
      ADDR_OVERLAP (ADDRESS_A, ADDRESS_B, WIDTH_A, WIDTH_B, HAS_OVERLAP, OLP_LSB, OLP_MSB, DOA_OV_LSB, DOA_OV_MSB, DOB_OV_LSB, DOB_OV_MSB);
    end if;
    ViolationCLKAB := '0';
     if ((collision_type = 1) or (collision_type = 2) or (collision_type = 3)) then        
       VitalRecoveryRemovalCheck (
         Violation      => Tviol_CLKB_CLKA_posedge,
         TimingData     => Tmkr_CLKB_CLKA_posedge,
         TestSignal     => CLKB_dly,
         TestSignalName => "CLKB",
         TestDelay      => 0 ps,
         RefSignal      => CLKA_dly,
         RefSignalName  => "CLKA",
         RefDelay       => 0 ps,
         Recovery       => SETUP_ALL,
         Removal       => 1 ps,
         ActiveLow      => true,
         CheckEnabled   => TO_X01(ENA_dly_sampled and ENB_dly_sampled and (WEA_dly_sampled or WEB_dly_sampled)) /= '0' and HAS_OVERLAP = true,
         RefTransition  => 'R',
         HeaderMsg      => "/X_RAMB4_S1_S8",
         Xon            => XOn,
         MsgOn          => false,
         MsgSeverity    => warning);
       VitalRecoveryRemovalCheck (
         Violation      => Tviol_CLKA_CLKB_posedge,
         TimingData     => Tmkr_CLKA_CLKB_posedge,
         TestSignal     => CLKA_dly,
         TestSignalName => "CLKA",
         TestDelay      => 0 ps,
         RefSignal      => CLKB_dly,
         RefSignalName  => "CLKB",
         RefDelay       => 0 ps,
         Recovery       => SETUP_ALL,
         Removal       => 1 ps,
         ActiveLow      => true,
         CheckEnabled   => TO_X01(ENA_dly_sampled and ENB_dly_sampled and (WEA_dly_sampled or WEB_dly_sampled)) /= '0' and HAS_OVERLAP = true,
         RefTransition  => 'R',
         HeaderMsg      => "/X_RAMB4_S1_S8",
         Xon            => XOn,
         MsgOn          => false,
         MsgSeverity    => warning);
    end if;            
    ViolationCLKAB := Tviol_CLKB_CLKA_posedge or Tviol_CLKA_CLKB_posedge;

    if (GSR_CLKA_dly = '1') then
      DOA_zd := (others => '0');
      
    elsif (GSR_CLKA_dly = '0') then
      if (ENA_dly_sampled = '1') then
        if (rising_edge(CLKA_dly)) then
          if (WEA_dly_sampled = '1') then
            if (VALID_ADDRA) then
              MEM(ADDRESS_A/(length_a/length_b))(((((address_a)rem(length_a/length_b))*(width_a)) + (width_a - 1)) downto (((address_a)rem(length_a/length_b))*(width_a))):= DIA_dly;
            end if;
            DOA_zd                                                 := DIA_dly;
            if (ViolationCLKAB = 'X') then
              if (WEB_dly_sampled /= '0') then
                if ((collision_type = 1) or (collision_type = 3)) then                
                   Memory_Collision_Msg
                     (collision_type => Write_A_Write_B,                     
                      EntityName => "X_RAMB4_S1_S8",
                      InstanceName => x_ramb4_s1_s8'path_name,
                      address_a => addra_dly_sampled,
                      address_b => addrb_dly_sampled
                      );
                end if;            
                if ((collision_type = 2) or (collision_type = 3)) then                
                  MEM(ADDRESS_A/(length_a/length_b))(DOB_OV_MSB downto DOB_OV_LSB) := (others => 'X');              
                  DOA_zd := (others => 'X');
                  if (RSTB_dly_sampled = '0' ) then
                    DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)            := (others => 'X');
                  end if;
                end if;
              else
                if (RSTB_dly_sampled = '0' ) then
                  if ((collision_type = 1) or (collision_type = 3)) then                
                     Memory_Collision_Msg
                       (collision_type => Read_B_Write_A,
                        EntityName => "X_RAMB4_S1_S8",
                        InstanceName => x_ramb4_s1_s8'path_name,
                        address_a => addra_dly_sampled,
                        address_b => addrb_dly_sampled
                        );
                  end if;            
                if ((collision_type = 2) or (collision_type = 3)) then                
                  DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)            := (others => 'X');
                end if;            
                end if;
              end if;
            end if;
          else
          if (VALID_ADDRA) then
              DOA_zd := MEM(ADDRESS_A/(length_a/length_b))(((((address_a)rem(length_a/length_b))*(width_a)) + (width_a - 1)) downto (((address_a)rem(length_a/length_b))*(width_a)));            
          end if;
             if (ViolationCLKAB = 'X') then
               if ((collision_type = 1) or (collision_type = 3)) then                
                  Memory_Collision_Msg
                    (collision_type => Read_A_Write_B,
                     EntityName => "X_RAMB4_S1_S8",
                     InstanceName => x_ramb4_s1_s8'path_name,
                     address_a => addra_dly_sampled,
                     address_b => addrb_dly_sampled
                     );
               end if;
               if ((collision_type = 2) or (collision_type = 3)) then                
                 DOA_zd                                               := (others => 'X');
               end if;
            end if;
          end if;
          if (RSTA_dly_sampled = '1') then
            DOA_zd                                                 := (others => '0');
          end if;
        end if;
      end if;
    end if;

    if (GSR_CLKB_dly = '1') then
      DOB_zd                                                       := (others => '0');
    elsif (GSR_CLKB_dly = '0') then
      if (ENB_dly_sampled = '1') then
        if (rising_edge(CLKB_dly)) then
          if (WEB_dly_sampled = '1') then
            if (VALID_ADDRB) then
              MEM(ADDRESS_B) := DIB_dly;
            end if;
            DOB_zd                                                 := DIB_dly;
            if (ViolationCLKAB = 'X') then
              if (WEA_dly_sampled /= '0') then
                if ((collision_type = 1) or (collision_type = 3)) then                
                   Memory_Collision_Msg
                     (collision_type => Write_A_Write_B,                     
                      EntityName => "X_RAMB4_S1_S8",
                      InstanceName => x_ramb4_s1_s8'path_name,
                      address_a => addra_dly_sampled,
                      address_b => addrb_dly_sampled
                      );
                end if;
                if ((collision_type = 2) or (collision_type = 3)) then                
                  MEM(ADDRESS_B)(DOB_OV_MSB downto DOB_OV_LSB) := (others => 'X');
                  DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)              := (others => 'X');
                  if (RSTA_dly_sampled = '0' ) then
                    DOA_zd := (others => 'X');
                  end if;
                end if;
              else
                if (RSTA_dly_sampled = '0' ) then
                  if ((collision_type = 1) or (collision_type = 3)) then                
                    Memory_Collision_Msg
                      (collision_type => Read_A_Write_B,
                       EntityName => "X_RAMB4_S1_S8",
                       InstanceName => x_ramb4_s1_s8'path_name,
                       address_a => addra_dly_sampled,
                       address_b => addrb_dly_sampled
                       );
                  end if;
                  if ((collision_type = 2) or (collision_type = 3)) then                
                    DOA_zd := (others => 'X');
                  end if;
                end if;
              end if;
            end if;
          else
          if (VALID_ADDRB) then
            DOB_zd := MEM(ADDRESS_B);
          end if;
            if (ViolationCLKAB = 'X') then
              if ((collision_type = 1) or (collision_type = 3)) then                
                Memory_Collision_Msg
                  (collision_type => Read_B_Write_A,
                   EntityName => "X_RAMB4_S1_S8",
                   InstanceName => x_ramb4_s1_s8'path_name,
                   address_a => addra_dly_sampled,
                   address_b => addrb_dly_sampled
                   );
              end if;
              if ((collision_type = 2) or (collision_type = 3)) then                
                DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)            := (others => 'X');
              end if;
            end if;
          end if;
          if (RSTB_dly_sampled = '1') then
            DOB_zd                                                 := (others => '0');
          end if;
        end if;
      end if;
    end if;

    DOA_zd(0)  := ViolationA xor DOA_zd(0);
    DOB_zd(0)  := ViolationB xor DOB_zd(0);
    DOB_zd(1)  := ViolationB xor DOB_zd(1);
    DOB_zd(2)  := ViolationB xor DOB_zd(2);
    DOB_zd(3)  := ViolationB xor DOB_zd(3);
    DOB_zd(4)  := ViolationB xor DOB_zd(4);
    DOB_zd(5)  := ViolationB xor DOB_zd(5);
    DOB_zd(6)  := ViolationB xor DOB_zd(6);
    DOB_zd(7)  := ViolationB xor DOB_zd(7);

    VitalPathDelay01 (
      OutSignal     => DOA(0),
      GlitchData    => DOA_GlitchData0,
      OutSignalName => "DOA(0)",
      OutTemp       => DOA_zd(0),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(0), (ENA_dly /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(0),
      GlitchData    => DOB_GlitchData0,
      OutSignalName => "DOB(0)",
      OutTemp       => DOB_zd(0),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(0), (ENB_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(1),
      GlitchData    => DOB_GlitchData1,
      OutSignalName => "DOB(1)",
      OutTemp       => DOB_zd(1),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(1), (ENB_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(2),
      GlitchData    => DOB_GlitchData2,
      OutSignalName => "DOB(2)",
      OutTemp       => DOB_zd(2),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(2), (ENB_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(3),
      GlitchData    => DOB_GlitchData3,
      OutSignalName => "DOB(3)",
      OutTemp       => DOB_zd(3),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(3), (ENB_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(4),
      GlitchData    => DOB_GlitchData4,
      OutSignalName => "DOB(4)",
      OutTemp       => DOB_zd(4),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(4), (ENB_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(5),
      GlitchData    => DOB_GlitchData5,
      OutSignalName => "DOB(5)",
      OutTemp       => DOB_zd(5),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(5), (ENB_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(6),
      GlitchData    => DOB_GlitchData6,
      OutSignalName => "DOB(6)",
      OutTemp       => DOB_zd(6),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(6), (ENB_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(7),
      GlitchData    => DOB_GlitchData7,
      OutSignalName => "DOB(7)",
      OutTemp       => DOB_zd(7),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(7), (ENB_dly /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    wait on ADDRA_dly, ADDRB_dly, CLKA_dly, CLKB_dly, DIA_dly, DIB_dly, ENA_dly, ENB_dly, GSR_CLKA_dly, GSR_CLKB_dly, GSR_ipd, RSTA_dly, RSTB_dly, WEA_dly, WEB_dly;
  end process VITALBehavior;
end X_RAMB4_S1_S8_V;
