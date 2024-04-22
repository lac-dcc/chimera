-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  16K-Bit Data and 2K-Bit Parity Dual Port Block RAM
-- /___/   /\     Filename : X_RAMB16_S2_S9.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:56:56 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision

----- CELL x_ramb16_s2_s9 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.VCOMPONENTS.all;

entity X_RAMB16_S2_S9 is
  generic (
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;

    LOC            : string  := "UNPLACED";

    tipd_ADDRA : VitalDelayArrayType01(12 downto 0)  := (others => (0 ps, 0 ps));
    tipd_CLKA  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIA   : VitalDelayArrayType01(1 downto 0) := (others => (0 ps, 0 ps));
    tipd_ENA   : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_SSRA  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEA   : VitalDelayType01                   := ( 0 ps, 0 ps);

    tipd_ADDRB : VitalDelayArrayType01(10 downto 0)  := (others => (0 ps, 0 ps));
    tipd_CLKB  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_DIB   : VitalDelayArrayType01(7 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIPB  : VitalDelayArrayType01(0 downto 0)  := (others => (0 ps, 0 ps));
    tipd_ENB   : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_SSRB  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WEB   : VitalDelayType01                   := ( 0 ps, 0 ps);



    tpd_CLKA_DOA  : VitalDelayArrayType01(1 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKB_DOB  : VitalDelayArrayType01(7 downto 0) := (others => (100 ps, 100 ps));
    tpd_CLKB_DOPB : VitalDelayArrayType01(0 downto 0)  := (others => (100 ps, 100 ps));

    tsetup_ADDRA_CLKA_negedge_posedge  : VitalDelayArrayType(12 downto 0)  := (others => 0 ps);
    tsetup_ADDRA_CLKA_posedge_posedge  : VitalDelayArrayType(12 downto 0)  := (others => 0 ps);
    tsetup_DIA_CLKA_negedge_posedge    : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_DIA_CLKA_posedge_posedge    : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    tsetup_ENA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_SSRA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEA_CLKA_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_WEA_CLKA_posedge_posedge    : VitalDelayType                   := 0 ps;

    tsetup_ADDRB_CLKB_negedge_posedge  : VitalDelayArrayType(10 downto 0)  := (others => 0 ps);
    tsetup_ADDRB_CLKB_posedge_posedge  : VitalDelayArrayType(10 downto 0)  := (others => 0 ps);
    tsetup_DIB_CLKB_negedge_posedge    : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    tsetup_DIB_CLKB_posedge_posedge    : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    tsetup_DIPB_CLKB_negedge_posedge   : VitalDelayArrayType(0 downto 0)  := (others => 0 ps);
    tsetup_DIPB_CLKB_posedge_posedge   : VitalDelayArrayType(0 downto 0)  := (others => 0 ps);
    tsetup_ENB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_ENB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_SSRB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_SSRB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;
    tsetup_WEB_CLKB_negedge_posedge    : VitalDelayType                   := 0 ps;
    tsetup_WEB_CLKB_posedge_posedge    : VitalDelayType                   := 0 ps;

    thold_ADDRA_CLKA_negedge_posedge : VitalDelayArrayType(12 downto 0)  := (others => 0 ps);
    thold_ADDRA_CLKA_posedge_posedge : VitalDelayArrayType(12 downto 0)  := (others => 0 ps);
    thold_DIA_CLKA_negedge_posedge   : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_DIA_CLKA_posedge_posedge   : VitalDelayArrayType(1 downto 0) := (others => 0 ps);
    thold_ENA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_ENA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRA_CLKA_negedge_posedge  : VitalDelayType                   := 0 ps;
    thold_SSRA_CLKA_posedge_posedge  : VitalDelayType                   := 0 ps;
    thold_WEA_CLKA_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEA_CLKA_posedge_posedge   : VitalDelayType                   := 0 ps;

    thold_ADDRB_CLKB_negedge_posedge : VitalDelayArrayType(10 downto 0)  := (others => 0 ps);
    thold_ADDRB_CLKB_posedge_posedge : VitalDelayArrayType(10 downto 0)  := (others => 0 ps);
    thold_DIB_CLKB_negedge_posedge   : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    thold_DIB_CLKB_posedge_posedge   : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    thold_DIPB_CLKB_negedge_posedge  : VitalDelayArrayType(0 downto 0)  := (others => 0 ps);
    thold_DIPB_CLKB_posedge_posedge  : VitalDelayArrayType(0 downto 0)  := (others => 0 ps);
    thold_ENB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_ENB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;
    thold_SSRB_CLKB_negedge_posedge  : VitalDelayType                   := 0 ps;
    thold_SSRB_CLKB_posedge_posedge  : VitalDelayType                   := 0 ps;
    thold_WEB_CLKB_negedge_posedge   : VitalDelayType                   := 0 ps;
    thold_WEB_CLKB_posedge_posedge   : VitalDelayType                   := 0 ps;

    ticd_CLKA          : VitalDelayType                     := 0 ps;
    tisd_ADDRA_CLKA    : VitalDelayArrayType(12 downto 0)    := (others => 0 ps);
    tisd_DIA_CLKA      : VitalDelayArrayType(1 downto 0)   := (others => 0 ps);
    tisd_ENA_CLKA      : VitalDelayType                     := 0 ps;
    tisd_SSRA_CLKA     : VitalDelayType                     := 0 ps;
    tisd_WEA_CLKA      : VitalDelayType                     := 0 ps;

    ticd_CLKB          : VitalDelayType                     := 0 ps;
    tisd_ADDRB_CLKB    : VitalDelayArrayType(10 downto 0)    := (others => 0 ps);
    tisd_DIB_CLKB      : VitalDelayArrayType(7 downto 0)   := (others => 0 ps);
    tisd_DIPB_CLKB     : VitalDelayArrayType(0 downto 0)    := (others => 0 ps);
    tisd_ENB_CLKB      : VitalDelayType                     := 0 ps;
    tisd_SSRB_CLKB     : VitalDelayType                     := 0 ps;
    tisd_WEB_CLKB      : VitalDelayType                     := 0 ps;

    tpw_CLKA_negedge : VitalDelayType := 0 ps;
    tpw_CLKA_posedge : VitalDelayType := 0 ps;
    tpw_CLKB_negedge : VitalDelayType := 0 ps;
    tpw_CLKB_posedge : VitalDelayType := 0 ps;

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
    INIT_3F  : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_A : bit_vector := X"0";
    INIT_B : bit_vector := X"000";

    SRVAL_A : bit_vector := X"0";
    SRVAL_B : bit_vector := X"000";

    SETUP_ALL        : VitalDelayType := 1000 ps;
    SETUP_READ_FIRST : VitalDelayType := 3000 ps;

    SIM_COLLISION_CHECK : string := "ALL";

    WRITE_MODE_A : string := "WRITE_FIRST";
    WRITE_MODE_B : string := "WRITE_FIRST"

    );

  port(
    DOA   : out std_logic_vector (1 downto 0);
    DOB   : out std_logic_vector (7 downto 0);
    DOPB  : out std_logic_vector (0 downto 0);

    ADDRA : in  std_logic_vector (12 downto 0);
    ADDRB : in  std_logic_vector (10 downto 0);
    CLKA  : in  std_ulogic;
    CLKB  : in  std_ulogic;
    DIA   : in  std_logic_vector (1 downto 0);
    DIB   : in  std_logic_vector (7 downto 0);
    DIPB  : in  std_logic_vector (0 downto 0);
    ENA   : in  std_ulogic;
    ENB   : in  std_ulogic;
    SSRA  : in  std_ulogic;
    SSRB  : in  std_ulogic;
    WEA   : in  std_ulogic;
    WEB   : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_RAMB16_S2_S9 : entity is true;
end x_ramb16_s2_s9;

architecture X_RAMB16_S2_S9_V of X_RAMB16_S2_S9 is

  attribute VITAL_LEVEL0 of
    X_RAMB16_S2_S9_V : architecture is true;

  signal ADDRA_ipd : std_logic_vector(12 downto 0)  := (others => 'X');
  signal CLKA_ipd  : std_ulogic                    := 'X';
  signal DIA_ipd   : std_logic_vector(1 downto 0) := (others => 'X');
  signal ENA_ipd   : std_ulogic                    := 'X';
  signal SSRA_ipd  : std_ulogic                    := 'X';
  signal WEA_ipd   : std_ulogic                    := 'X';

  signal ADDRB_ipd : std_logic_vector(10 downto 0)  := (others => 'X');
  signal CLKB_ipd  : std_ulogic                    := 'X';
  signal DIB_ipd   : std_logic_vector(7 downto 0) := (others => 'X');
  signal DIPB_ipd  : std_logic_vector(0 downto 0)  := (others => 'X');
  signal ENB_ipd   : std_ulogic                    := 'X';
  signal SSRB_ipd  : std_ulogic                    := 'X';
  signal WEB_ipd   : std_ulogic                    := 'X';

  signal GSR_ipd : std_ulogic := 'X';

  signal ADDRA_dly    : std_logic_vector(12 downto 0)  := (others => 'X');
  signal CLKA_dly     : std_ulogic                    := 'X';
  signal DIA_dly      : std_logic_vector(1 downto 0) := (others => 'X');
  signal ENA_dly      : std_ulogic                    := 'X';
  signal GSR_CLKA_dly : std_ulogic                    := '0';
  signal SSRA_dly     : std_ulogic                    := 'X';
  signal WEA_dly      : std_ulogic                    := 'X';

  signal ADDRB_dly    : std_logic_vector(10 downto 0)  := (others => 'X');
  signal CLKB_dly     : std_ulogic                    := 'X';
  signal DIB_dly      : std_logic_vector(7 downto 0) := (others => 'X');
  signal DIPB_dly     : std_logic_vector(0 downto 0)  := (others => 'X');
  signal ENB_dly      : std_ulogic                    := 'X';
  signal GSR_CLKB_dly : std_ulogic                    := '0';
  signal SSRB_dly     : std_ulogic                    := 'X';
  signal WEB_dly      : std_ulogic                    := 'X';
  constant length_a : integer := 8192;
  constant length_b : integer := 2048;  
  constant width_a : integer := 2;
  constant width_b : integer := 8;  

  constant parity_width_a : integer := 0;
  constant parity_width_b : integer := 1;
  
  type Two_D_array_type is array ((length_b -  1) downto 0) of std_logic_vector((width_b - 1) downto 0);
  type Two_D_parity_array_type is array ((length_b - 1) downto 0) of std_logic_vector((parity_width_b - 1)downto 0);    

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

  GSR_CLKA_dly <= GSR;
  GSR_CLKB_dly <= GSR;

  WireDelay     : block
  begin
    ADDRA_DELAY : for i in 12 downto 0 generate
      VitalWireDelay (ADDRA_ipd(i), ADDRA(i), tipd_ADDRA(i));
    end generate ADDRA_DELAY;
    VitalWireDelay (CLKA_ipd, CLKA, tipd_CLKA);
    DIA_DELAY   : for i in 1 downto 0 generate
      VitalWireDelay (DIA_ipd(i), DIA(i), tipd_DIA(i));
    end generate DIA_DELAY;
    VitalWireDelay (ENA_ipd, ENA, tipd_ENA);
    VitalWireDelay (SSRA_ipd, SSRA, tipd_SSRA);
    VitalWireDelay (WEA_ipd, WEA, tipd_WEA);
    ADDRB_DELAY : for i in 10 downto 0 generate
      VitalWireDelay (ADDRB_ipd(i), ADDRB(i), tipd_ADDRB(i));
    end generate ADDRB_DELAY;
    VitalWireDelay (CLKB_ipd, CLKB, tipd_CLKB);
    DIB_DELAY   : for i in 7 downto 0 generate
      VitalWireDelay (DIB_ipd(i), DIB(i), tipd_DIB(i));
    end generate DIB_DELAY;
    DIPB_DELAY  : for i in 0 downto 0 generate
      VitalWireDelay (DIPB_ipd(i), DIPB(i), tipd_DIPB(i));
    end generate DIPB_DELAY;
    VitalWireDelay (ENB_ipd, ENB, tipd_ENB);
    VitalWireDelay (SSRB_ipd, SSRB, tipd_SSRB);
    VitalWireDelay (WEB_ipd, WEB, tipd_WEB);
  end block;

  SignalDelay   : block
  begin
    ADDRA_DELAY : for i in 12 downto 0 generate
      VitalSignalDelay (ADDRA_dly(i), ADDRA_ipd(i), tisd_ADDRA_CLKA(i));
    end generate ADDRA_DELAY;
    VitalSignalDelay (CLKA_dly, CLKA_ipd, ticd_CLKA);
    DIA_DELAY   : for i in 1 downto 0 generate
      VitalSignalDelay (DIA_dly(i), DIA_ipd(i), tisd_DIA_CLKA(i));
    end generate DIA_DELAY;
    VitalSignalDelay (ENA_dly, ENA_ipd, tisd_ENA_CLKA);
    VitalSignalDelay (SSRA_dly, SSRA_ipd, tisd_SSRA_CLKA);
    VitalSignalDelay (WEA_dly, WEA_ipd, tisd_WEA_CLKA);

    ADDRB_DELAY : for i in 10 downto 0 generate
      VitalSignalDelay (ADDRB_dly(i), ADDRB_ipd(i), tisd_ADDRB_CLKB(i));
    end generate ADDRB_DELAY;
    VitalSignalDelay (CLKB_dly, CLKB_ipd, ticd_CLKB);
    DIB_DELAY   : for i in 7 downto 0 generate
      VitalSignalDelay (DIB_dly(i), DIB_ipd(i), tisd_DIB_CLKB(i));
    end generate DIB_DELAY;
    DIPB_DELAY  : for i in 0 downto 0 generate
      VitalSignalDelay (DIPB_dly(i), DIPB_ipd(i), tisd_DIPB_CLKB(i));
    end generate DIPB_DELAY;
    VitalSignalDelay (ENB_dly, ENB_ipd, tisd_ENB_CLKB);
    VitalSignalDelay (SSRB_dly, SSRB_ipd, tisd_SSRB_CLKB);
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
    variable Tviol_ADDRA12_CLKA_posedge : std_ulogic := '0';
    variable Tviol_DIA0_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_DIA1_CLKA_posedge   : std_ulogic := '0';
    variable Tviol_ENA_CLKA_posedge    : std_ulogic := '0';
    variable Tviol_SSRA_CLKA_posedge   : std_ulogic := '0';
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
    variable Tviol_ADDRB9_CLKB_posedge : std_ulogic := '0';
    variable Tviol_ADDRB10_CLKB_posedge : std_ulogic := '0';
    variable Tviol_DIB0_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB1_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB2_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB3_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB4_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB5_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB6_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIB7_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_DIPB0_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_ENB_CLKB_posedge    : std_ulogic := '0';
    variable Tviol_SSRB_CLKB_posedge   : std_ulogic := '0';
    variable Tviol_WEB_CLKB_posedge    : std_ulogic := '0';

    variable Tviol_CLKA_CLKB_all        : std_ulogic := '0';
    variable Tviol_CLKA_CLKB_read_first : std_ulogic := '0';
    variable Tviol_CLKB_CLKA_all        : std_ulogic := '0';
    variable Tviol_CLKB_CLKA_read_first : std_ulogic := '0';

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
    variable Tmkr_ADDRA12_CLKA_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA0_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIA1_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENA_CLKA_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSRA_CLKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
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
    variable Tmkr_ADDRB9_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB10_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB0_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB1_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB2_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB3_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB4_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB5_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB6_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB7_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIPB0_CLKB_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ENB_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSRB_CLKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WEB_CLKB_posedge    : VitalTimingDataType := VitalTimingDataInit;

    variable Tmkr_CLKA_CLKB_all        : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKA_CLKB_read_first : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKB_CLKA_all        : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLKB_CLKA_read_first : VitalTimingDataType := VitalTimingDataInit;


    variable PViol_CLKA, PViol_CLKB : std_ulogic          := '0';
    variable PInfo_CLKA, PInfo_CLKB : VitalPeriodDataType := VitalPeriodDataInit;

    variable DOA_GlitchData0  : VitalGlitchDataType;
    variable DOA_GlitchData1  : VitalGlitchDataType;

    variable DOB_GlitchData0  : VitalGlitchDataType;
    variable DOB_GlitchData1  : VitalGlitchDataType;
    variable DOB_GlitchData2  : VitalGlitchDataType;
    variable DOB_GlitchData3  : VitalGlitchDataType;
    variable DOB_GlitchData4  : VitalGlitchDataType;
    variable DOB_GlitchData5  : VitalGlitchDataType;
    variable DOB_GlitchData6  : VitalGlitchDataType;
    variable DOB_GlitchData7  : VitalGlitchDataType;
    variable DOPB_GlitchData0 : VitalGlitchDataType;

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
    variable mem : Two_D_array_type := slv_to_two_D_array(length_b, width_b, mem_slv);
    variable memp : Two_D_parity_array_type := slv_to_two_D_parity_array(length_b, parity_width_b, memp_slv);
    variable INIT_A_reg         : std_logic_vector (1 downto 0) := "00";
    variable INIT_B_reg         : std_logic_vector (8 downto 0) := "000000000";
    variable ADDRA_dly_sampled : std_logic_vector(12 downto 0)   := (others => 'X');
    variable ADDRB_dly_sampled : std_logic_vector(10 downto 0)   := (others => 'X');
    variable ADDRESS_A         : integer;
    variable ADDRESS_B         : integer;
    variable DOA_OV_LSB        : integer;
    variable DOA_OV_MSB        : integer;
    variable DOA_zd            : std_logic_vector(1 downto 0);
    variable DOB_OV_LSB        : integer;
    variable DOB_OV_MSB        : integer;
    variable DOB_zd            : std_logic_vector(7 downto 0);
    variable DOPA_OV_LSB       : integer;
    variable DOPA_OV_MSB       : integer;
    variable DOPB_OV_LSB       : integer;
    variable DOPB_OV_MSB       : integer;
    variable DOPB_zd           : std_logic_vector(0 downto 0);
    variable ENA_dly_sampled   : std_ulogic                      := 'X';
    variable ENB_dly_sampled   : std_ulogic                      := 'X';
    variable FIRST_TIME        : boolean                        := true;
    variable HAS_OVERLAP       : boolean                        := false;
    variable HAS_OVERLAP_P     : boolean                        := false;
    variable OLPP_LSB          : integer;
    variable OLPP_MSB          : integer;
    variable OLP_LSB           : integer;
    variable OLP_MSB           : integer;
    variable SRVAL_A_reg            : std_logic_vector (1 downto 0) := "00";
    variable SRVAL_B_reg            : std_logic_vector (8 downto 0) := "000000000";
    variable SSRA_dly_sampled  : std_ulogic                      := 'X';
    variable SSRB_dly_sampled  : std_ulogic                      := 'X';
    variable VALID_ADDRA       : boolean                        := false;
    variable VALID_ADDRB       : boolean                        := false;
    variable WR_A_LATER        : boolean                        := false;
    variable WR_B_LATER        : boolean                        := false;
    variable ViolationA        : std_ulogic                     := '0';
    variable ViolationB        : std_ulogic                     := '0';
    variable ViolationCLKAB    : std_ulogic                     := '0';
    variable ViolationCLKAB_S0 : boolean                        := false;
    variable Violation_S1      : boolean                        := false;
    variable Violation_S3      : boolean                        := false;
    variable WEA_dly_sampled   : std_ulogic                      := 'X';
    variable WEB_dly_sampled   : std_ulogic                      := 'X';
    variable wr_mode_a         : integer                        := 0;
    variable wr_mode_b         : integer                        := 0;
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
           EntityName => "X_RAMB16_S2_S9",
           GenericValue => SIM_COLLISION_CHECK,
           Unit => "",
           ExpectedValueMsg => "Legal Values for this attribute are ALL, NONE, WARNING_ONLY or GENERATE_X_ONLY",
           ExpectedGenericValue => "",
           TailMsg => "",
           MsgSeverity => error
           );
      end if;
      if (INIT_A'length > 2) then
        INIT_A_reg(1 downto 0)        := To_StdLogicVector(INIT_A)(1 downto 0);
      else
        INIT_A_reg(INIT_A'length-1 downto 0)         := To_StdLogicVector(INIT_A);
      end if;
      DOA_zd(1 downto 0)                       := INIT_A_reg(1 downto 0);
      DOA  <= DOA_zd;

      if (INIT_B'length > 9) then
        INIT_B_reg(8 downto 0)        := To_StdLogicVector(INIT_B)(8 downto 0);
      else
        INIT_B_reg(INIT_B'length-1 downto 0)         := To_StdLogicVector(INIT_B);
      end if;
      DOB_zd(7 downto 0)                       := INIT_B_reg(7 downto 0);
      DOPB_zd(0 downto 0)                       := INIT_B_reg(8 downto 8);
      DOB  <= DOB_zd;
      DOPB <= DOPB_zd;

      if (SRVAL_A'length > 2) then
        SRVAL_A_reg(1 downto 0)        := To_StdLogicVector(SRVAL_A)(1 downto 0);
      else
        SRVAL_A_reg(SRVAL_A'length-1 downto 0)         := To_StdLogicVector(SRVAL_A);
      end if;
      if (SRVAL_B'length > 9) then
        SRVAL_B_reg(8 downto 0)        := To_StdLogicVector(SRVAL_B)(8 downto 0);
      else
        SRVAL_B_reg(SRVAL_B'length-1 downto 0)         := To_StdLogicVector(SRVAL_B);
      end if;
      if ((WRITE_MODE_A = "write_first") or (WRITE_MODE_A = "WRITE_FIRST")) then
        wr_mode_a := 0;
      elsif ((WRITE_MODE_A = "read_first") or (WRITE_MODE_A = "READ_FIRST")) then
        wr_mode_a := 1;
      elsif ((WRITE_MODE_A = "no_change") or (WRITE_MODE_A = "NO_CHANGE")) then
        wr_mode_a := 2;
      else
        GenericValueCheckMessage
          ( HeaderMsg            => " Attribute Syntax Error ",
            GenericName          => " WRITE_MODE_A ",
            EntityName           => "/X_RAMB16_S2_S9",
            GenericValue         => WRITE_MODE_A,
            Unit                 => "",
            ExpectedValueMsg     => " The Legal values for this attribute are ",
            ExpectedGenericValue => " WRITE_FIRST, READ_FIRST or NO_CHANGE ",
            TailMsg              => "",
            MsgSeverity          => error
            );
      end if;

      if ((WRITE_MODE_B = "write_first") or (WRITE_MODE_B = "WRITE_FIRST")) then
        wr_mode_b := 0;
      elsif ((WRITE_MODE_B = "read_first") or (WRITE_MODE_B = "READ_FIRST")) then
        wr_mode_b := 1;
      elsif ((WRITE_MODE_B = "no_change") or (WRITE_MODE_B = "NO_CHANGE")) then
        wr_mode_b := 2;
      else
        GenericValueCheckMessage
          ( HeaderMsg            => " Attribute Syntax Error ",
            GenericName          => " WRITE_MODE_B ",
            EntityName           => "/X_RAMB16_S2_S9",
            GenericValue         => WRITE_MODE_B,
            Unit                 => "",
            ExpectedValueMsg     => " The Legal values for this attribute are ",
            ExpectedGenericValue => " WRITE_FIRST, READ_FIRST or NO_CHANGE ",
            TailMsg              => "",
            MsgSeverity          => error
            );
      end if;
      FIRST_TIME  := false;
    end if;

    if (CLKA_dly'event) then
      ENA_dly_sampled   := ENA_dly;
      SSRA_dly_sampled  := SSRA_dly;
      WEA_dly_sampled   := WEA_dly;
      ADDRA_dly_sampled := ADDRA_dly;
    end if;

    if (CLKB_dly'event) then
      ENB_dly_sampled   := ENB_dly;
      SSRB_dly_sampled  := SSRB_dly;
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
        HoldLow        => thold_ENA_CLKA_negedge_posedge,
        HoldHigh       => thold_ENA_CLKA_posedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HoldLow        => thold_WEA_CLKA_negedge_posedge,
        HoldHigh       => thold_WEA_CLKA_posedge_posedge,
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => (TO_X01(ena_dly_sampled) = '1' and TO_X01(wea_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => (TO_X01(ena_dly_sampled) = '1' and TO_X01(wea_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HoldLow        => thold_WEB_CLKB_negedge_posedge,
        HoldHigh       => thold_WEB_CLKB_posedge_posedge,
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => (TO_X01(enb_dly_sampled) = '1' and TO_X01(web_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => (TO_X01(enb_dly_sampled) = '1' and TO_X01(web_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => (TO_X01(enb_dly_sampled) = '1' and TO_X01(web_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => (TO_X01(enb_dly_sampled) = '1' and TO_X01(web_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => (TO_X01(enb_dly_sampled) = '1' and TO_X01(web_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => (TO_X01(enb_dly_sampled) = '1' and TO_X01(web_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => (TO_X01(enb_dly_sampled) = '1' and TO_X01(web_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => (TO_X01(enb_dly_sampled) = '1' and TO_X01(web_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => (TO_X01(enb_dly_sampled) = '1' and TO_X01(web_dly_sampled) = '1'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => TO_X01(ena_dly_sampled) = '1',
        HeaderMsg      => "/X_RAMB16_S2_S9",
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
        CheckEnabled   => TO_X01(enb_dly_sampled) = '1',
        HeaderMsg      => "/X_RAMB16_S2_S9",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => warning);
    end if;
    ViolationA          :=
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
      Tviol_DIA0_CLKA_posedge or
      Tviol_DIA1_CLKA_posedge or
      Tviol_ENA_CLKA_posedge or
      Tviol_SSRA_CLKA_posedge or
      Tviol_WEA_CLKA_posedge or
      Pviol_CLKA ;
    ViolationB          :=
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
      Tviol_DIB0_CLKB_posedge or
      Tviol_DIB1_CLKB_posedge or
      Tviol_DIB2_CLKB_posedge or
      Tviol_DIB3_CLKB_posedge or
      Tviol_DIB4_CLKB_posedge or
      Tviol_DIB5_CLKB_posedge or
      Tviol_DIB6_CLKB_posedge or
      Tviol_DIB7_CLKB_posedge or
      Tviol_DIPB0_CLKB_posedge or
      Tviol_ENB_CLKB_posedge or
      Tviol_SSRB_CLKB_posedge or
      Tviol_WEB_CLKB_posedge or
      Pviol_CLKB ;

    VALID_ADDRA           := ADDR_IS_VALID(addra_dly_sampled);
    if (VALID_ADDRA) then
      ADDRESS_A           := SLV_TO_INT(addra_dly_sampled);
    end if;
    VALID_ADDRB           := ADDR_IS_VALID(addrb_dly_sampled);
    if (VALID_ADDRB) then
      ADDRESS_B           := SLV_TO_INT(addrb_dly_sampled);
    end if;
    if (VALID_ADDRA and VALID_ADDRB) then
      ADDR_OVERLAP (ADDRESS_A, ADDRESS_B, WIDTH_A, WIDTH_B, HAS_OVERLAP, OLP_LSB, OLP_MSB, DOA_OV_LSB, DOA_OV_MSB, DOB_OV_LSB, DOB_OV_MSB);
    end if;
    ViolationCLKAB        := '0';
    ViolationCLKAB_S0     := false;
    Violation_S1          := false;
    Violation_S3          := false;
    if ((collision_type = 1) or (collision_type = 2) or (collision_type = 3)) then    
      VitalRecoveryRemovalCheck (
        Violation      => Tviol_CLKB_CLKA_all,
        TimingData     => Tmkr_CLKB_CLKA_all,
        TestSignal     => CLKB_dly,
        TestSignalName => "CLKB",
        TestDelay      => 0 ps,
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => 0 ps,
        Recovery       => SETUP_ALL,
        Removal       => 1 ps,
        ActiveLow      => true,
        CheckEnabled   => (HAS_OVERLAP = true and ena_dly_sampled = '1' and enb_dly_sampled = '1' and ((web_dly_sampled = '1' and wr_mode_b /= 1) or (wea_dly_sampled = '1' and wr_mode_a /= 1 and web_dly_sampled = '0'))),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
        Xon            => true,
        MsgOn          => false,
        MsgSeverity    => warning);

      VitalRecoveryRemovalCheck (
        Violation      => Tviol_CLKA_CLKB_all,
        TimingData     => Tmkr_CLKA_CLKB_all,
        TestSignal     => CLKA_dly,
        TestSignalName => "CLKA",
        TestDelay      => 0 ps,
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => 0 ps,
        Recovery       => SETUP_ALL,
        Removal       => 1 ps,
        ActiveLow      => true,
        CheckEnabled   => (HAS_OVERLAP = true and ena_dly_sampled = '1' and enb_dly_sampled = '1' and ((wea_dly_sampled = '1' and wr_mode_a /= 1) or (web_dly_sampled = '1' and wea_dly_sampled = '0' and wr_mode_b /= 1))),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
        Xon            => true,
        MsgOn          => false,
        MsgSeverity    => warning);

      VitalRecoveryRemovalCheck (
        Violation      => Tviol_CLKB_CLKA_read_first,
        TimingData     => Tmkr_CLKB_CLKA_read_first,
        TestSignal     => CLKB_dly,
        TestSignalName => "CLKB",
        TestDelay      => 0 ps,
        RefSignal      => CLKA_dly,
        RefSignalName  => "CLKA",
        RefDelay       => 0 ps,
        Recovery       => SETUP_READ_FIRST,
        Removal       => 1 ps,
        ActiveLow      => true,
        CheckEnabled   => (HAS_OVERLAP = true and ena_dly_sampled = '1' and enb_dly_sampled = '1' and web_dly_sampled = '1' and wr_mode_b = 1 and (CLKA_dly'last_event /= CLKB_dly'last_event)),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
        Xon            => true,
        MsgOn          => false,
        MsgSeverity    => warning);

      VitalRecoveryRemovalCheck (
        Violation      => Tviol_CLKA_CLKB_read_first,
        TimingData     => Tmkr_CLKA_CLKB_read_first,
        TestSignal     => CLKA_dly,
        TestSignalName => "CLKA",
        TestDelay      => 0 ps,
        RefSignal      => CLKB_dly,
        RefSignalName  => "CLKB",
        RefDelay       => 0 ps,
        Recovery       => SETUP_READ_FIRST,
        Removal       => 1 ps,
        ActiveLow      => true,
        CheckEnabled   => (HAS_OVERLAP = true and ena_dly_sampled = '1' and enb_dly_sampled = '1' and wea_dly_sampled = '1' and wr_mode_a = 1 and (CLKA_dly'last_event /= CLKB_dly'last_event)),
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S2_S9",
        Xon            => true,
        MsgOn          => false,
        MsgSeverity    => warning);        
    end if;
    ViolationCLKAB := Tviol_CLKB_CLKA_all or Tviol_CLKA_CLKB_all or Tviol_CLKB_CLKA_read_first or Tviol_CLKA_CLKB_read_first;        



    WR_A_LATER := false;
    WR_B_LATER := false;

    if (GSR_CLKA_dly = '1') then
      DOA_zd  := INIT_A_reg ( 1 downto 0);

    elsif (GSR_CLKA_dly = '0') then
      if (ena_dly_sampled = '1') then
        if (rising_edge(CLKA_dly)) then
          if (wea_dly_sampled = '1') then
            case wr_mode_a is
              when 0 =>
                DOA_zd  := DIA_dly;

                if (ViolationCLKAB = 'X') then
                  if (web_dly_sampled /= '0') then
                    if ((collision_type = 1) or (collision_type = 3)) then
                      Memory_Collision_Msg
                        (collision_type => Write_A_Write_B,
                         EntityName => "/X_RAMB16_S2_S9",
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    if ((collision_type = 2) or (collision_type = 3)) then
                      MEM(ADDRESS_A/(length_a/length_b))(DOB_OV_MSB downto DOB_OV_LSB) := (others => 'X');
                      DOA_zd := (others => 'X');
                      if (wr_mode_b /= 2 ) then
                        DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)    := (others => 'X');
                      end if;
                    end if;
                  else

                    if ((collision_type = 1) or (collision_type = 3)) then                
                      Memory_Collision_Msg
                        (collision_type => Read_B_Write_A,
                         EntityName => "/X_RAMB16_S2_S9",
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    MEM(ADDRESS_A/(length_a/length_b))(((((address_a)rem(length_a/length_b))*(width_a)) + (width_a - 1)) downto (((address_a)rem(length_a/length_b))*(width_a))):= DIA_dly;
                    if ((collision_type = 2) or (collision_type = 3)) then                
                      DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)                      := (others => 'X');
                    end if;
                  end if;
                else

                  if (VALID_ADDRA) then
                    MEM(ADDRESS_A/(length_a/length_b))(((((address_a)rem(length_a/length_b))*(width_a)) + (width_a - 1)) downto (((address_a)rem(length_a/length_b))*(width_a))):= DIA_dly;
                  end if;
                end if;
              when 1 =>

                if (VALID_ADDRA) then
                  DOA_zd  := MEM(ADDRESS_A/(length_a/length_b))(((((address_a)rem(length_a/length_b))*(width_a)) + (width_a - 1)) downto (((address_a)rem(length_a/length_b))*(width_a)));
                  WR_A_LATER := true;
                end if;

                if (ViolationCLKAB = 'X') then

                  if (web_dly_sampled /= '0') then
                    if ((collision_type = 1) or (collision_type = 3)) then
                      Memory_Collision_Msg
                        (collision_type => Write_A_Write_B,
                         EntityName => "/X_RAMB16_S2_S9",
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    if ((collision_type = 2) or (collision_type = 3)) then
                      MEM(ADDRESS_A/(length_a/length_b))(DOB_OV_MSB downto DOB_OV_LSB) := (others => 'X');
                      DOA_zd := (others => 'X');
                      if (wr_mode_b /= 2 ) then
                        DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)    := (others => 'X');
                      end if;
                    end if;
                  else

                    if ((collision_type = 1) or (collision_type = 3)) then                
                      Memory_Collision_Msg
                        (collision_type => Read_B_Write_A,
                         EntityName => "/X_RAMB16_S2_S9",
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    MEM(ADDRESS_A/(length_a/length_b))(((((address_a)rem(length_a/length_b))*(width_a)) + (width_a - 1)) downto (((address_a)rem(length_a/length_b))*(width_a))):= DIA_dly;
                    if ((collision_type = 2) or (collision_type = 3)) then
                      DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)                      := (others => 'X');
                    end if;
                  end if;
                end if;
              when 2 =>
                if (ViolationCLKAB = 'X') then

                  if (web_dly_sampled /= '0') then
                    if ((collision_type = 1) or (collision_type = 3)) then
                      Memory_Collision_Msg
                        (collision_type => Write_A_Write_B,
                         EntityName => "/X_RAMB16_S2_S9",
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    if ((collision_type = 2) or (collision_type = 3)) then
                      MEM(ADDRESS_A/(length_a/length_b))(DOB_OV_MSB downto DOB_OV_LSB) := (others => 'X');
                      if (wr_mode_b /= 2 ) then

                        DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)    := (others => 'X');
                      end if;
                    end if;
                  else

                    if ((collision_type = 1) or (collision_type = 3)) then                
                      Memory_Collision_Msg
                        (collision_type => Read_B_Write_A,
                         EntityName => "/X_RAMB16_S2_S9",
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    if ((collision_type = 2) or (collision_type = 3)) then                
                      DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)                      := (others => 'X');
                    end if;
                    MEM(ADDRESS_A/(length_a/length_b))(((((address_a)rem(length_a/length_b))*(width_a)) + (width_a - 1)) downto (((address_a)rem(length_a/length_b))*(width_a))):= DIA_dly;
                  end if;
                else

                  if (VALID_ADDRA) then
                    MEM(ADDRESS_A/(length_a/length_b))(((((address_a)rem(length_a/length_b))*(width_a)) + (width_a - 1)) downto (((address_a)rem(length_a/length_b))*(width_a))):= DIA_dly;
                  end if;
                end if;
              when others => null;
            end case;
          else

            if (VALID_ADDRA) then
                  DOA_zd  := MEM(ADDRESS_A/(length_a/length_b))(((((address_a)rem(length_a/length_b))*(width_a)) + (width_a - 1)) downto (((address_a)rem(length_a/length_b))*(width_a)));
            end if;
            if (ViolationCLKAB = 'X') then

              if ((collision_type = 1) or (collision_type = 3)) then                
                Memory_Collision_Msg
                  (collision_type => Read_A_Write_B,
                   EntityName => "/X_RAMB16_S2_S9",
                   address_a => addra_dly_sampled,
                   address_b => addrb_dly_sampled
                   );
              end if;
              if ((collision_type = 2) or (collision_type = 3)) then                
                DOA_zd := (others => 'X');
              end if;
            end if;
          end if;
          if (ssra_dly_sampled = '1') then

            DOA_zd  := SRVAL_A_reg(1 downto 0);
          end if;
        end if;
      end if;
    end if;

    if (GSR_CLKB_dly = '1') then

      DOB_zd  := INIT_B_reg(7 downto 0);
      DOPB_zd := INIT_B_reg(8 downto 8);
    elsif (GSR_CLKB_dly = '0') then
      if (enb_dly_sampled = '1') then
        if (rising_edge(CLKB_dly)) then
          if (web_dly_sampled = '1') then
            case wr_mode_b is
              when 0 =>

                DOB_zd  := DIB_dly;
                DOPB_zd := DIPB_dly;
                if (VALID_ADDRB) then
                  MEM(ADDRESS_B)     := DIB_dly;
                  MEMP(ADDRESS_B) := DIPB_dly;
                end if;
                if (ViolationCLKAB = 'X') then
                  if (wea_dly_sampled /= '0') then

                    if ((collision_type = 1) or (collision_type = 3)) then
                      Memory_Collision_Msg
                        (collision_type => Write_A_Write_B,
                         EntityName => "X_RAMB16_S2_S9",
                         InstanceName => x_ramb16_s2_s9'path_name,
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    if ((collision_type = 2) or (collision_type = 3)) then
                      MEM(ADDRESS_B)(DOB_OV_MSB downto DOB_OV_LSB) := (others => 'X');

                      DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)    := (others => 'X');
                      if (wr_mode_a /= 2 ) then

                        DOA_zd := (others => 'X');
                      end if;
                    end if;
                  else
                    if ((collision_type = 1) or (collision_type = 3)) then
                      Memory_Collision_Msg
                        (collision_type => Read_A_Write_B,
                         EntityName => "X_RAMB16_S2_S9",
                         InstanceName => x_ramb16_s2_s9'path_name,
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    if ((collision_type = 2) or (collision_type = 3)) then
                      DOA_zd := (others => 'X');
                    end if;
                  end if;
                end if;
              when 1 =>

                if (VALID_ADDRB) then
                  DOB_zd  := MEM(ADDRESS_B);
                  DOPB_zd := MEMP(ADDRESS_B);
                  WR_B_LATER := true;
                  MEM(ADDRESS_B)     := DIB_dly ;
                  MEMP(ADDRESS_B) := DIPB_dly;
                end if;
                if (ViolationCLKAB = 'X') then
                  if (wea_dly_sampled /= '0') then

                    if ((collision_type = 1) or (collision_type = 3)) then
                      Memory_Collision_Msg
                        (collision_type => Write_A_Write_B,
                         EntityName => "X_RAMB16_S2_S9",
                         InstanceName => x_ramb16_s2_s9'path_name,
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    if ((collision_type = 2) or (collision_type = 3)) then
                      MEM(ADDRESS_B)(DOB_OV_MSB downto DOB_OV_LSB) := (others => 'X');

                      DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)    := (others => 'X');
                      if (wr_mode_a /= 2 ) then
                        DOA_zd := (others => 'X');
                      end if;
                    end if;
                  else

                    if ((collision_type = 1) or (collision_type = 3)) then
                      Memory_Collision_Msg
                        (collision_type => Read_A_Write_B,
                         EntityName => "X_RAMB16_S2_S9",
                         InstanceName => x_ramb16_s2_s9'path_name,
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    if ((collision_type = 2) or (collision_type = 3)) then
                      DOA_zd := (others => 'X');
                    end if;
                  end if;
                end if;
              when 2 =>
                if (VALID_ADDRB) then
                  MEM(ADDRESS_B) := DIB_dly;
                  MEMP(ADDRESS_B) := DIPB_dly;
                end if;
                if (ViolationCLKAB = 'X') then
                  if (wea_dly_sampled /= '0') then

                    if ((collision_type = 1) or (collision_type = 3)) then
                      Memory_Collision_Msg
                        (collision_type => Write_A_Write_B,
                         EntityName => "X_RAMB16_S2_S9",
                         InstanceName => x_ramb16_s2_s9'path_name,
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    if ((collision_type = 2) or (collision_type = 3)) then
                      MEM(ADDRESS_B)(DOB_OV_MSB downto DOB_OV_LSB) := (others => 'X');
                      if (wr_mode_a /= 2 ) then

                        DOA_zd := (others => 'X');
                      end if;
                    end if;
                  else

                    if ((collision_type = 1) or (collision_type = 3)) then
                      Memory_Collision_Msg
                        (collision_type => Read_A_Write_B,
                         EntityName => "X_RAMB16_S2_S9",
                         InstanceName => x_ramb16_s2_s9'path_name,
                         address_a => addra_dly_sampled,
                         address_b => addrb_dly_sampled
                         );
                    end if;
                    if ((collision_type = 2) or (collision_type = 3)) then
                      DOA_zd := (others => 'X');
                    end if;
                  end if;
                end if;
              when others => null;
            end case;
          else

            if (VALID_ADDRB) then
              DOB_zd  := MEM(ADDRESS_B);
              DOPB_zd := MEMP(ADDRESS_B);
            end if;
            if (ViolationCLKAB = 'X') then

              if ((collision_type = 1) or (collision_type = 3)) then                
                Memory_Collision_Msg
                  (collision_type => Read_B_Write_A,
                   EntityName => "X_RAMB16_S2_S9",
                   InstanceName => x_ramb16_s2_s9'path_name,
                   address_a => addra_dly_sampled,
                   address_b => addrb_dly_sampled
                   );
              end if;
              if ((collision_type = 2) or (collision_type = 3)) then                
                DOB_zd (DOB_OV_MSB downto DOB_OV_LSB)    := (others => 'X');
              end if;
            end if;
          end if;
          if (ssrb_dly_sampled = '1') then

            DOB_zd  := SRVAL_B_reg(7 downto 0);
            DOPB_zd := SRVAL_B_reg(8 downto 8);
          end if;
        end if;
      end if;
    end if;

    if ((WR_A_LATER = true ) and (VALID_ADDRA)) then
      MEM(ADDRESS_A/(length_a/length_b))(((((address_a)rem(length_a/length_b))*(width_a)) + (width_a - 1)) downto (((address_a)rem(length_a/length_b))*(width_a))):= DIA_dly;                    
    end if;

    if ((WR_B_LATER = true ) and (VALID_ADDRB)) then
        MEM(ADDRESS_B) := DIB_dly;
        MEMP(ADDRESS_B) := DIPB_dly;
    end if;

    DOA_zd(0)  := ViolationA xor DOA_zd(0);
    DOA_zd(1)  := ViolationA xor DOA_zd(1);
    DOB_zd(0)  := ViolationB xor DOB_zd(0);
    DOB_zd(1)  := ViolationB xor DOB_zd(1);
    DOB_zd(2)  := ViolationB xor DOB_zd(2);
    DOB_zd(3)  := ViolationB xor DOB_zd(3);
    DOB_zd(4)  := ViolationB xor DOB_zd(4);
    DOB_zd(5)  := ViolationB xor DOB_zd(5);
    DOB_zd(6)  := ViolationB xor DOB_zd(6);
    DOB_zd(7)  := ViolationB xor DOB_zd(7);
    DOPB_zd(0) := ViolationB xor DOPB_zd(0);

    VitalPathDelay01 (
      OutSignal     => DOA(0),
      GlitchData    => DOA_GlitchData0,
      OutSignalName => "DOA(0)",
      OutTemp       => DOA_zd(0),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(0), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOA(1),
      GlitchData    => DOA_GlitchData1,
      OutSignalName => "DOA(1)",
      OutTemp       => DOA_zd(1),
      Paths         => (0 => (CLKA_dly'last_event, tpd_CLKA_DOA(1), (ena_dly_sampled /= '0' and GSR_CLKA_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(0),
      GlitchData    => DOB_GlitchData0,
      OutSignalName => "DOB(0)",
      OutTemp       => DOB_zd(0),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(0), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(1),
      GlitchData    => DOB_GlitchData1,
      OutSignalName => "DOB(1)",
      OutTemp       => DOB_zd(1),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(1), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(2),
      GlitchData    => DOB_GlitchData2,
      OutSignalName => "DOB(2)",
      OutTemp       => DOB_zd(2),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(2), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(3),
      GlitchData    => DOB_GlitchData3,
      OutSignalName => "DOB(3)",
      OutTemp       => DOB_zd(3),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(3), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(4),
      GlitchData    => DOB_GlitchData4,
      OutSignalName => "DOB(4)",
      OutTemp       => DOB_zd(4),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(4), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(5),
      GlitchData    => DOB_GlitchData5,
      OutSignalName => "DOB(5)",
      OutTemp       => DOB_zd(5),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(5), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(6),
      GlitchData    => DOB_GlitchData6,
      OutSignalName => "DOB(6)",
      OutTemp       => DOB_zd(6),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(6), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOB(7),
      GlitchData    => DOB_GlitchData7,
      OutSignalName => "DOB(7)",
      OutTemp       => DOB_zd(7),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOB(7), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DOPB(0),
      GlitchData    => DOPB_GlitchData0,
      OutSignalName => "DOPB(0)",
      OutTemp       => DOPB_zd(0),
      Paths         => (0 => (CLKB_dly'last_event, tpd_CLKB_DOPB(0), (enb_dly_sampled /= '0' and GSR_CLKB_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    wait on ADDRA_dly, ADDRB_dly, CLKA_dly, CLKB_dly, DIA_dly, DIB_dly, DIPB_dly, ENA_dly, ENB_dly, GSR_ipd, GSR_CLKA_dly, GSR_CLKB_dly, SSRA_dly, SSRB_dly, WEA_dly, WEB_dly;
  end process VITALBehavior;
end X_RAMB16_S2_S9_V;
