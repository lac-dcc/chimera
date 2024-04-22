-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/stan/VITAL/X_OSERDES2.vhd,v 1.14 2010/01/14 19:51:40 fphillip Exp $
-------------------------------------------------------
--  Copyright (c) 2008 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version : 11.1
--  \   \          Description : Xilinx Timing Simulation Library Component
--  /   /                  Source Synchronous Onput Serializer for the Spartan Series
-- /___/   /\      Filename    : X_OSERDES2.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                               
-- Revision:     Date:  Comment
--      1.0: 01/16/08:  Initial version.
--      1.1: 11/13/08:  IR495203 Gate behavior with OCE, TCE.
--                      Fix specify block
--      1.2: 12/11/08:  delay internal ioce by 1 ioclk
--      1.3: 01/30/09:  CR504529 add BYPASS_GCLK_FF attribute
--      1.4: 02/11/09:  CR507848 add missing MODULE_NAME constant
--      1.5: 03/05/09:  CR511015 VHDL - VER sync
--      1.6: 03/19/09:  CR513779 I/O broken (_dly, _delay, _indly)
--      1.7: 04/02/09:  CR513901 unisim-simprim mismatch, proceedure -> when, else
--      1.8: 07/07/09:  CR524403 Add NONE to valid serdes_mode values

-- End Revision
-------------------------------------------------------

----- CELL X_OSERDES2 -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;
use simprim.VPACKAGE.all;


  entity X_OSERDES2 is
    generic (
      TimingChecksOn : boolean := TRUE;
      InstancePath   : string  := "*";
      Xon            : boolean := TRUE;
      MsgOn          : boolean := FALSE;
      LOC            : string  := "UNPLACED";
      BYPASS_GCLK_FF : boolean := FALSE;
      DATA_RATE_OQ : string := "DDR";
      DATA_RATE_OT : string := "DDR";
      DATA_WIDTH : integer := 2;
      OUTPUT_MODE : string := "SINGLE_ENDED";
      SERDES_MODE : string := "NONE";
      TRAIN_PATTERN : integer := 0;           -- {0..15}
      tipd_CLK0 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_CLK1 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_CLKDIV : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_D1 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_D2 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_D3 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_D4 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_IOCE : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_OCE : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_RST : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_SHIFTIN1 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_SHIFTIN2 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_SHIFTIN3 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_SHIFTIN4 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_T1 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_T2 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_T3 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_T4 : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_TCE : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_TRAIN : VitalDelayType01 :=  (0 ps, 0 ps);
--  VITAL clk-to-output path delay variables
      tpd_CLK0_OQ : VitalDelayType01 := (0 ps, 0 ps);
      tpd_CLK0_TQ : VitalDelayType01 := (0 ps, 0 ps);
      tpd_CLK1_OQ : VitalDelayType01 := (0 ps, 0 ps);
      tpd_CLK1_TQ : VitalDelayType01 := (0 ps, 0 ps);
--  VITAL Hold delay variables
      thold_D1_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      thold_D1_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      thold_D2_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      thold_D2_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      thold_D3_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      thold_D3_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      thold_D4_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      thold_D4_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      thold_OCE_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      thold_OCE_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      thold_RST_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      thold_RST_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      thold_T1_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      thold_T1_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      thold_T2_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      thold_T2_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      thold_T3_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      thold_T3_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      thold_T4_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      thold_T4_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      thold_TCE_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      thold_TCE_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      thold_TRAIN_CLK0_negedge_posedge : VitalDelayType := 0 ps;
      thold_TRAIN_CLK0_posedge_posedge : VitalDelayType := 0 ps;
      thold_TRAIN_CLK1_negedge_posedge : VitalDelayType := 0 ps;
      thold_TRAIN_CLK1_posedge_posedge : VitalDelayType := 0 ps;
--  VITAL Setup delay variables
      tsetup_D1_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_D1_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_D2_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_D2_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_D3_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_D3_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_D4_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_D4_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_OCE_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_OCE_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_RST_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_RST_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_T1_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_T1_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_T2_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_T2_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_T3_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_T3_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_T4_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_T4_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_TCE_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_TCE_CLKDIV_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_TRAIN_CLK0_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_TRAIN_CLK0_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_TRAIN_CLK1_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_TRAIN_CLK1_posedge_posedge : VitalDelayType := 0 ps;
--  VITAL async set-to-output path delay variables
--  VITAL tisd variables
      tisd_D1_CLKDIV : VitalDelayType := 0 ps;
      tisd_D2_CLKDIV : VitalDelayType := 0 ps;
      tisd_D3_CLKDIV : VitalDelayType := 0 ps;
      tisd_D4_CLKDIV : VitalDelayType := 0 ps;
      tisd_OCE_CLKDIV : VitalDelayType := 0 ps;
      tisd_RST_CLKDIV : VitalDelayType := 0 ps;
      tisd_T1_CLKDIV : VitalDelayType := 0 ps;
      tisd_T2_CLKDIV : VitalDelayType := 0 ps;
      tisd_T3_CLKDIV : VitalDelayType := 0 ps;
      tisd_T4_CLKDIV : VitalDelayType := 0 ps;
      tisd_TCE_CLKDIV : VitalDelayType := 0 ps;
      tisd_TRAIN_CLK0 : VitalDelayType := 0 ps;
      tisd_TRAIN_CLK1 : VitalDelayType := 0 ps;
--  VITAL input clock delay ariables
      ticd_CLK0 : VitalDelayType := 0 ps;
      ticd_CLK1 : VitalDelayType := 0 ps;
      ticd_CLKDIV : VitalDelayType := 0 ps
-- VITAL pulse width variables
-- VITAL period variables
-- VITAL recovery time variables
-- VITAL removal time variables
    );

    port (
      OQ                   : out std_ulogic;
      SHIFTOUT1            : out std_ulogic;
      SHIFTOUT2            : out std_ulogic;
      SHIFTOUT3            : out std_ulogic;
      SHIFTOUT4            : out std_ulogic;
      TQ                   : out std_ulogic;
      CLK0                 : in std_ulogic;
      CLK1                 : in std_ulogic;
      CLKDIV               : in std_ulogic;
      D1                   : in std_ulogic;
      D2                   : in std_ulogic;
      D3                   : in std_ulogic;
      D4                   : in std_ulogic;
      IOCE                 : in std_ulogic := 'H';
      OCE                  : in std_ulogic := 'H';
      RST                  : in std_ulogic;
      SHIFTIN1             : in std_ulogic;
      SHIFTIN2             : in std_ulogic;
      SHIFTIN3             : in std_ulogic;
      SHIFTIN4             : in std_ulogic;
      T1                   : in std_ulogic;
      T2                   : in std_ulogic;
      T3                   : in std_ulogic;
      T4                   : in std_ulogic;
      TCE                  : in std_ulogic;
      TRAIN                : in std_ulogic      
    );
    attribute VITAL_LEVEL0 of X_OSERDES2 :     entity is true;
  end X_OSERDES2;

  architecture X_OSERDES2_V of X_OSERDES2 is
    TYPE VitalTimingDataArrayType IS ARRAY (NATURAL RANGE <>) OF VitalTimingDataType;


    constant MODULE_NAME : string  := "X_OSERDES2";
    constant IN_DELAY : time := 1 ps;
    constant OUT_DELAY : time := 1 ps;
    constant INCLK_DELAY : time := 0 ps;
    constant OUTCLK_DELAY : time := 0 ps;

    signal BYPASS_GCLK_FF_BINARY : std_ulogic := '0';
    signal DATA_RATE_OQ_BINARY : std_logic_vector(1 downto 0);
    signal DATA_RATE_OT_BINARY : std_logic_vector(4 downto 0);
    signal DATA_WIDTH_BINARY : std_logic_vector(7 downto 0);
    signal OUTPUT_MODE_BINARY : std_ulogic;
    signal SERDES_MODE_BINARY : std_ulogic;
    signal TRAIN_PATTERN_BINARY : std_ulogic;
    
    signal OQ_out : std_ulogic := '0';
    signal SHIFTOUT1_out : std_ulogic := '0';
    signal SHIFTOUT2_out : std_ulogic := '0';
    signal SHIFTOUT3_out : std_ulogic := '0';
    signal SHIFTOUT4_out : std_ulogic := '0';
    signal TQ_out : std_ulogic := '0';
    
    signal OQ_outdelay : std_ulogic;
    signal SHIFTOUT1_outdelay : std_ulogic;
    signal SHIFTOUT2_outdelay : std_ulogic;
    signal SHIFTOUT3_outdelay : std_ulogic;
    signal SHIFTOUT4_outdelay : std_ulogic;
    signal TQ_outdelay : std_ulogic;
    
    signal CLK0_ipd : std_ulogic;
    signal CLK1_ipd : std_ulogic;
    signal CLKDIV_ipd : std_ulogic;
    signal D1_ipd : std_ulogic;
    signal D2_ipd : std_ulogic;
    signal D3_ipd : std_ulogic;
    signal D4_ipd : std_ulogic;
    signal IOCE_ipd : std_ulogic;
    signal OCE_ipd : std_ulogic;
    signal RST_ipd : std_ulogic;
    signal SHIFTIN1_ipd : std_ulogic;
    signal SHIFTIN2_ipd : std_ulogic;
    signal SHIFTIN3_ipd : std_ulogic;
    signal SHIFTIN4_ipd : std_ulogic;
    signal T1_ipd : std_ulogic;
    signal T2_ipd : std_ulogic;
    signal T3_ipd : std_ulogic;
    signal T4_ipd : std_ulogic;
    signal TCE_ipd : std_ulogic;
    signal TRAIN_ipd : std_ulogic;
    
    signal CLK0_dly : std_ulogic;
    signal CLK1_dly : std_ulogic;
    signal CLKDIV_dly : std_ulogic;
    signal D1_CLKDIV_dly : std_ulogic;
    signal D2_CLKDIV_dly : std_ulogic;
    signal D3_CLKDIV_dly : std_ulogic;
    signal D4_CLKDIV_dly : std_ulogic;
    signal IOCE_dly : std_ulogic;
    signal OCE_CLKDIV_dly : std_ulogic;
    signal RST_CLKDIV_dly : std_ulogic;
    signal SHIFTIN1_dly : std_ulogic;
    signal SHIFTIN2_dly : std_ulogic;
    signal SHIFTIN3_dly : std_ulogic;
    signal SHIFTIN4_dly : std_ulogic;
    signal T1_CLKDIV_dly : std_ulogic;
    signal T2_CLKDIV_dly : std_ulogic;
    signal T3_CLKDIV_dly : std_ulogic;
    signal T4_CLKDIV_dly : std_ulogic;
    signal TCE_CLKDIV_dly : std_ulogic;
    signal TRAIN_CLK0_dly : std_ulogic;
    signal TRAIN_CLK1_dly : std_ulogic;
    signal GSR_dly : std_ulogic := '0';
    signal CLK0_indelay : std_ulogic;
    signal CLK1_indelay : std_ulogic;
    signal CLKDIV_indelay : std_ulogic;
    signal D1_indelay : std_ulogic;
    signal D2_indelay : std_ulogic;
    signal D3_indelay : std_ulogic;
    signal D4_indelay : std_ulogic;
    signal IOCE_indelay : std_ulogic;
    signal OCE_indelay : std_ulogic;
    signal RST_indelay : std_ulogic;
    signal SHIFTIN1_indelay : std_ulogic;
    signal SHIFTIN2_indelay : std_ulogic;
    signal SHIFTIN3_indelay : std_ulogic;
    signal SHIFTIN4_indelay : std_ulogic;
    signal T1_indelay : std_ulogic;
    signal T2_indelay : std_ulogic;
    signal T3_indelay : std_ulogic;
    signal T4_indelay : std_ulogic;
    signal TCE_indelay : std_ulogic;
    signal TRAIN_indelay : std_ulogic;
    signal GSR_indelay : std_ulogic;
    signal CLK0_indly : std_ulogic;
    signal CLK1_indly : std_ulogic;
    signal CLKDIV_indly : std_ulogic;
    signal D1_indly : std_ulogic;
    signal D2_indly : std_ulogic;
    signal D3_indly : std_ulogic;
    signal D4_indly : std_ulogic;
    signal IOCE_indly : std_ulogic;
    signal OCE_indly : std_ulogic;
    signal RST_indly : std_ulogic;
    signal SHIFTIN1_indly : std_ulogic;
    signal SHIFTIN2_indly : std_ulogic;
    signal SHIFTIN3_indly : std_ulogic;
    signal SHIFTIN4_indly : std_ulogic;
    signal T1_indly : std_ulogic;
    signal T2_indly : std_ulogic;
    signal T3_indly : std_ulogic;
    signal T4_indly : std_ulogic;
    signal TCE_indly : std_ulogic;
    signal TRAIN_indly : std_ulogic;
    signal GSR_indly : std_ulogic;
    
-- FF outputs
  signal tgff            : std_logic_vector(3 downto 0) := (others => '0');
  signal toff            : std_logic_vector(3 downto 0) := (others => '0');
  signal dgff            : std_logic_vector(3 downto 0) := (others => '0');
  signal doff            : std_logic_vector(3 downto 0) := (others => '0');
  signal tdata           : std_logic_vector(3 downto 0) := (others => '0');
  signal ddata           : std_logic_vector(3 downto 0) := (others => '0');

  signal tlsb            : std_ulogic := '0';
  signal dlsb            : std_ulogic := '0';
  signal tpre            : std_ulogic := '0';
  signal dpre            : std_ulogic := '0';

  signal Tff             : std_ulogic := '0';
  signal Dff             : std_ulogic := '0';

  signal Tpf             : std_ulogic := '0';
  signal Dpf             : std_ulogic := '0';

  signal one_shot_OCE    : std_ulogic := '1';
  signal one_shot_TCE    : std_ulogic := '1';
  signal ioce_int        : std_ulogic := '0';

-- Other nodes
  signal tcasc_in        : std_ulogic := 'X';
  signal dcasc_in        : std_ulogic := 'X';
  signal tinit           : std_ulogic := '0';

  signal trainp          : std_logic_vector(3 downto 0) := (others => 'X');

-- clk doubler signals 
  signal clk0_int       : std_ulogic := '0';
  signal clk1_int       : std_ulogic := '0';
  signal clk_int        : std_ulogic := 'X';

-- Attribute settings 
  signal data_rate_int  : std_ulogic := '0';
  signal encasc     : std_ulogic := 'X'; -- 1 = enable cascade input
  signal isslave    : std_ulogic := 'X'; -- 1 = slave mode
  signal endiffop   : std_ulogic := 'X'; -- 1 = enable pseudo diff output
  signal enTCE      : std_ulogic := 'X';  --1 = enable the tristate path
  signal bypassTFF  : std_ulogic := 'X'; -- 1 = direct out

-- Other signal
  signal BYPASS_GCLK_FF_err_flag   : boolean := FALSE;
  signal data_rate_oq_err_flag     : boolean := FALSE;
  signal data_rate_tq_err_flag     : boolean := FALSE;
  signal data_width_err_flag       : boolean := FALSE;
  signal output_mode_err_flag      : boolean := FALSE;
  signal serdes_mode_err_flag      : boolean := FALSE;
  signal train_pattern_err_flag    : boolean := FALSE;
  signal attr_err_flag             : std_ulogic := '0';

    begin
    
    GSR_indly     <= GSR;
    GSR_indelay   <= GSR_indly  after IN_DELAY;
    WireDelay : block
    begin
      VitalWireDelay (CLK0_ipd,CLK0,tipd_CLK0);
      VitalWireDelay (CLK1_ipd,CLK1,tipd_CLK1);
      VitalWireDelay (CLKDIV_ipd,CLKDIV,tipd_CLKDIV);
      VitalWireDelay (D1_ipd,D1,tipd_D1);
      VitalWireDelay (D2_ipd,D2,tipd_D2);
      VitalWireDelay (D3_ipd,D3,tipd_D3);
      VitalWireDelay (D4_ipd,D4,tipd_D4);
      VitalWireDelay (IOCE_ipd,IOCE,tipd_IOCE);
      VitalWireDelay (OCE_ipd,OCE,tipd_OCE);
      VitalWireDelay (RST_ipd,RST,tipd_RST);
      VitalWireDelay (SHIFTIN1_ipd,SHIFTIN1,tipd_SHIFTIN1);
      VitalWireDelay (SHIFTIN2_ipd,SHIFTIN2,tipd_SHIFTIN2);
      VitalWireDelay (SHIFTIN3_ipd,SHIFTIN3,tipd_SHIFTIN3);
      VitalWireDelay (SHIFTIN4_ipd,SHIFTIN4,tipd_SHIFTIN4);
      VitalWireDelay (T1_ipd,T1,tipd_T1);
      VitalWireDelay (T2_ipd,T2,tipd_T2);
      VitalWireDelay (T3_ipd,T3,tipd_T3);
      VitalWireDelay (T4_ipd,T4,tipd_T4);
      VitalWireDelay (TCE_ipd,TCE,tipd_TCE);
      VitalWireDelay (TRAIN_ipd,TRAIN,tipd_TRAIN);
    end block;

    SignalDelay : block
    begin
      VitalSignalDelay (D1_CLKDIV_dly,D1_ipd,tisd_D1_CLKDIV);
      VitalSignalDelay (D2_CLKDIV_dly,D2_ipd,tisd_D2_CLKDIV);
      VitalSignalDelay (D3_CLKDIV_dly,D3_ipd,tisd_D3_CLKDIV);
      VitalSignalDelay (D4_CLKDIV_dly,D4_ipd,tisd_D4_CLKDIV);
      VitalSignalDelay (OCE_CLKDIV_dly,OCE_ipd,tisd_OCE_CLKDIV);
      VitalSignalDelay (RST_CLKDIV_dly,RST_ipd,tisd_RST_CLKDIV);
      VitalSignalDelay (T1_CLKDIV_dly,T1_ipd,tisd_T1_CLKDIV);
      VitalSignalDelay (T2_CLKDIV_dly,T2_ipd,tisd_T2_CLKDIV);
      VitalSignalDelay (T3_CLKDIV_dly,T3_ipd,tisd_T3_CLKDIV);
      VitalSignalDelay (T4_CLKDIV_dly,T4_ipd,tisd_T4_CLKDIV);
      VitalSignalDelay (TCE_CLKDIV_dly,TCE_ipd,tisd_TCE_CLKDIV);
      VitalSignalDelay (TRAIN_CLK0_dly,TRAIN_ipd,tisd_TRAIN_CLK0);
      VitalSignalDelay (TRAIN_CLK1_dly,TRAIN_ipd,tisd_TRAIN_CLK1);

      VitalSignalDelay (CLK0_dly,CLK0_ipd,ticd_CLK0);
      VitalSignalDelay (CLK1_dly,CLK1_ipd,ticd_CLK1);
      VitalSignalDelay (CLKDIV_dly,CLKDIV_ipd,ticd_CLKDIV);
    end block;
      --Input ports sensitive to two clocks
    SELECTPROC: process (
      TRAIN_CLK1_dly,
      TRAIN_CLK0_dly)
    begin
      if(abs(tisd_TRAIN_CLK1) > abs(tisd_TRAIN_CLK0)) then
        TRAIN_indly <= TRAIN_CLK1_dly;
      else
        TRAIN_indly <= TRAIN_CLK0_dly;
      end if;
      end process SELECTPROC;

      --Input ports sensitive to single or no clocks
      D1_indly <= D1_CLKDIV_dly;
      D2_indly <= D2_CLKDIV_dly;
      D3_indly <= D3_CLKDIV_dly;
      D4_indly <= D4_CLKDIV_dly;
      OCE_indly <= OCE_CLKDIV_dly;
      RST_indly <= RST_CLKDIV_dly;
      T1_indly <= T1_CLKDIV_dly;
      T2_indly <= T2_CLKDIV_dly;
      T3_indly <= T3_CLKDIV_dly;
      T4_indly <= T4_CLKDIV_dly;
      TCE_indly <= TCE_CLKDIV_dly;

      CLK0_indly <= CLK0_dly;
      CLK1_indly <= CLK1_dly;
      CLKDIV_indly <= CLKDIV_dly;
      
    --Input ports sensitive to more than two clocks
      IOCE_indly <= IOCE_ipd;
      SHIFTIN1_indly <= SHIFTIN1_ipd;
      SHIFTIN2_indly <= SHIFTIN2_ipd;
      SHIFTIN3_indly <= SHIFTIN3_ipd;
      SHIFTIN4_indly <= SHIFTIN4_ipd;
      
      OQ_out <= OQ_outdelay after OUT_DELAY;
      SHIFTOUT1_out <= SHIFTOUT1_outdelay after OUT_DELAY;
      SHIFTOUT2_out <= SHIFTOUT2_outdelay after OUT_DELAY;
      SHIFTOUT3_out <= SHIFTOUT3_outdelay after OUT_DELAY;
      SHIFTOUT4_out <= SHIFTOUT4_outdelay after OUT_DELAY;
      TQ_out <= TQ_outdelay after OUT_DELAY;
      
      CLK0_indelay <= CLK0_indly after INCLK_DELAY;
      CLK1_indelay <= CLK1_indly after INCLK_DELAY;
      CLKDIV_indelay <= CLKDIV_indly after INCLK_DELAY;
      
      D1_indelay <= D1_indly after IN_DELAY;
      D2_indelay <= D2_indly after IN_DELAY;
      D3_indelay <= D3_indly after IN_DELAY;
      D4_indelay <= D4_indly after IN_DELAY;
      IOCE_indelay <= IOCE_indly after IN_DELAY;
      OCE_indelay <= OCE_indly after IN_DELAY;
      RST_indelay <= RST_indly after IN_DELAY;
      SHIFTIN1_indelay <= SHIFTIN1_indly after IN_DELAY;
      SHIFTIN2_indelay <= SHIFTIN2_indly after IN_DELAY;
      SHIFTIN3_indelay <= SHIFTIN3_indly after IN_DELAY;
      SHIFTIN4_indelay <= SHIFTIN4_indly after IN_DELAY;
      T1_indelay <= T1_indly after IN_DELAY;
      T2_indelay <= T2_indly after IN_DELAY;
      T3_indelay <= T3_indly after IN_DELAY;
      T4_indelay <= T4_indly after IN_DELAY;
      TCE_indelay <= TCE_indly after IN_DELAY;
      TRAIN_indelay <= TRAIN_indly after IN_DELAY;
      
      
--####################################################################
--#####                     Initialize                           #####
--####################################################################


    INIPROC : process
    begin
-------------------------------------------------
------ BYPASS_GCLK_FF Check
-------------------------------------------------
      if(BYPASS_GCLK_FF = TRUE) then BYPASS_GCLK_FF_BINARY <= '1';
      elsif(BYPASS_GCLK_FF = FALSE) then BYPASS_GCLK_FF_BINARY <= '0';
      else
        wait for 1 ps;
        GenericValueCheckMessage
         (  HeaderMsg  => " Attribute Syntax Error ",
            GenericName => " BYPASS_GCLK_FF ",
            EntityName => MODULE_NAME,
            GenericValue => BYPASS_GCLK_FF,
            Unit => "",
            ExpectedValueMsg => " The Legal values for this attribute are ",
            ExpectedGenericValue => " TRUE or FALSE.",
            TailMsg => "",
            MsgSeverity => Warning 
        );
        BYPASS_GCLK_FF_err_flag <= TRUE;
      end if;

-------------------------------------------------
------ DATA_RATE_OQ Check
-------------------------------------------------
        if((DATA_RATE_OQ = "DDR") or (DATA_RATE_OQ = "ddr")) then
          DATA_RATE_OQ_BINARY <= "01";
          data_rate_int <= '0';
        elsif((DATA_RATE_OQ = "SDR") or (DATA_RATE_OQ= "sdr")) then
          DATA_RATE_OQ_BINARY <= "10";
        else
          wait for 1 ps;
          GenericValueCheckMessage
           (  HeaderMsg  => " Attribute Syntax Error ",
              GenericName => " DATA_RATE_OQ ",
              EntityName => MODULE_NAME,
              GenericValue => DATA_RATE_OQ,
              Unit => "",
              ExpectedValueMsg => " The Legal values for this attribute are ",
              ExpectedGenericValue => " DDR or SDR.",
              TailMsg => "",
              MsgSeverity => Warning 
          );
          data_rate_oq_err_flag <= TRUE;
        end if;
  
-------------------------------------------------
------ DATA_RATE_OT Check
-------------------------------------------------

        if((DATA_RATE_OT = "DDR") or (DATA_RATE_OT = "ddr")) then
          DATA_RATE_OT_BINARY <= "11010";
          tinit <= '1';
          enTCE <= '1';
          bypassTFF <= '0';
          if((DATA_RATE_OQ = "SDR") or (DATA_RATE_OT = "sdr")) then
             wait for 1 ps;
             GenericValueCheckMessage
              (  HeaderMsg  => " Attribute Conflict Error ",
                 GenericName => " DATA_RATE_OT ",
                 EntityName => MODULE_NAME,
                 GenericValue => DATA_RATE_OT,
                 Unit => "",
                 ExpectedValueMsg => " When DATA_RATE_OT is DDR ",
                 ExpectedGenericValue => " DATA_RATE_OQ must also be DDR ",
                 TailMsg => "",
                 MsgSeverity => Warning 
             );
             data_rate_tq_err_flag <= TRUE;
          end if;
        elsif((DATA_RATE_OT = "BUF") or (DATA_RATE_OT= "buf")) then
          DATA_RATE_OT_BINARY <= "00001";
          tinit <= '0';
          enTCE <= '0';
          bypassTFF <= '1';
        elsif((DATA_RATE_OT = "SDR") or (DATA_RATE_OT= "sdr")) then
          DATA_RATE_OT_BINARY <= "11100";
          tinit <= '1';
          enTCE <= '1';
          bypassTFF <= '0';
          if((DATA_RATE_OQ = "DDR") or (DATA_RATE_OQ = "ddr")) then
            wait for 1 ps;
            GenericValueCheckMessage
             (  HeaderMsg  => " Attribute Conflict Error ",
                GenericName => " DATA_RATE_OT ",
                EntityName => MODULE_NAME,
                GenericValue => DATA_RATE_OT,
                Unit => "",
                ExpectedValueMsg => " When DATA_RATE_OT is SDR ",
                ExpectedGenericValue => " DATA_RATE_OQ must also be SDR ",
                TailMsg => "",
                MsgSeverity => Warning 
            );
            data_rate_tq_err_flag <= TRUE;
          end if;
        else
          wait for 1 ps;
          GenericValueCheckMessage
           (  HeaderMsg  => " Attribute Syntax Error ",
              GenericName => " DATA_RATE_OT ",
              EntityName => MODULE_NAME,
              GenericValue => DATA_RATE_OT,
              Unit => "",
              ExpectedValueMsg => " The Legal values for this attribute are ",
              ExpectedGenericValue => " DDR, SDR or BUF.",
              TailMsg => "",
              MsgSeverity => Warning 
          );
          data_rate_tq_err_flag <= TRUE;
        end if;
  
-------------------------------------------------
------ OUTPUT_MODE Check
-------------------------------------------------
      if((OUTPUT_MODE = "DIFFERENTIAL") or (OUTPUT_MODE= "differential")) then
        OUTPUT_MODE_BINARY <= '1';
        endiffop <= '1';
      elsif((OUTPUT_MODE = "SINGLE_ENDED") or (OUTPUT_MODE = "single_ended")) then
        OUTPUT_MODE_BINARY <= '0';
        if (((SERDES_MODE = "SLAVE") or (SERDES_MODE = "slave")) or (DATA_WIDTH < 5)) then
           endiffop <= '0';
        else
           endiffop <= '1';
        end if;
      else
        wait for 1 ps;
        GenericValueCheckMessage
         (  HeaderMsg  => " Attribute Syntax Error ",
            GenericName => " OUTPUT_MODE ",
            EntityName => MODULE_NAME,
            GenericValue => OUTPUT_MODE,
            Unit => "",
            ExpectedValueMsg => " The Legal values for this attribute are ",
            ExpectedGenericValue => " DIFFERENTIAL or SINGLE_ENDED.",
            TailMsg => "",
            MsgSeverity => Warning 
        );
        output_mode_err_flag <= TRUE;
      end if;

-------------------------------------------------
------ DATA_WIDTH Check
-------------------------------------------------

      if ((DATA_WIDTH > 0) and (DATA_WIDTH <= 8)) then
        DATA_WIDTH_BINARY <= CONV_STD_LOGIC_VECTOR(DATA_WIDTH, 8);
      else
        wait for 1 ps;
        GenericValueCheckMessage
         (  HeaderMsg  => " Attribute Syntax Error ",
            GenericName => " DATA_WIDTH ",
            EntityName => MODULE_NAME,
            GenericValue => DATA_WIDTH,
            Unit => "",
            ExpectedValueMsg => " The Legal values for this attribute are ",
            ExpectedGenericValue => " 1, 2, 3, 4, 5, 6, 7, or 8.",
            TailMsg => "",
            MsgSeverity => Warning
        );
        data_width_err_flag <= TRUE;
      end if;

-------------------------------------------------
------ SERDES_MODE Check
-------------------------------------------------
      if((SERDES_MODE = "NONE") or (SERDES_MODE = "none")) then
         isslave <= '0';
         encasc <= '0';
      elsif((SERDES_MODE = "MASTER") or (SERDES_MODE = "master")) then
         isslave <= '0';
         encasc <= '0';
      elsif((SERDES_MODE = "SLAVE") or (SERDES_MODE = "slave")) then 
         isslave <= '1';
         if (DATA_WIDTH > 4) then
             encasc <= '1';
         else
             encasc <= '0';
         end if;
      else
         wait for 1 ps;
         GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Error ",
             GenericName => " SERDES_MODE ",
             EntityName => MODULE_NAME,
             GenericValue => SERDES_MODE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " NONE, MASTER or SLAVE.",
             TailMsg => "",
             MsgSeverity => Warning 
         );
         serdes_mode_err_flag <= TRUE;
      end if;


-------------------------------------------------
------ TRAIN_PATTERN Check
-------------------------------------------------

      if((TRAIN_PATTERN < 0) or (TRAIN_PATTERN > 15)) then
         wait for 1 ps;
         GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Error ",
             GenericName => " TRAIN_PATTERN ",
             EntityName => MODULE_NAME,
             GenericValue => TRAIN_PATTERN,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " 0, 1, 2, ... 13, 14, 15.",
             TailMsg => "",
             MsgSeverity => Warning
         );
         train_pattern_err_flag <= TRUE;
      else
         trainp <= CONV_STD_LOGIC_VECTOR(TRAIN_PATTERN, 4);
      end if;

-------------------------------------------------
------  Error Flag
-------------------------------------------------

      wait for 1 ps;

      if (data_rate_oq_err_flag or data_rate_tq_err_flag or
          data_width_err_flag   or output_mode_err_flag  or
          serdes_mode_err_flag or train_pattern_err_flag or
          BYPASS_GCLK_FF_err_flag) then
         attr_err_flag <= '1';
         wait for 1 ps;
         ASSERT FALSE REPORT "Attribute Errors detected, simulation cannot continue. Exiting ..." SEVERITY Failure;

      end if;

      wait;
      end process INIPROC;
--####################################################################
--#####                       DDR doubler                        #####
--####################################################################
  prcs_ddr_dblr_clk0:process(CLK0_indelay)
  begin
     if(rising_edge(CLK0_indelay)) then
        clk0_int <= '1',
                    '0' after 100 ps;
     end if;
  end process prcs_ddr_dblr_clk0;


  prcs_ddr_dblr_clk1:process(CLK1_indelay)
  begin
     if(rising_edge(CLK1_indelay) and (DATA_RATE_OQ = "DDR")) then
         clk1_int <= '1', 
                     '0' after 100 ps;
     end if;
  end process prcs_ddr_dblr_clk1;

  clk_int <= clk0_int or clk1_int;

--####################################################################
--#####                    IOCE sample                           #####
--####################################################################
  prcs_ioce_int:process(clk_int, RST_indelay)
  begin
     if(RST_indelay = '1') then
         ioce_int <= '0'; 
     elsif(rising_edge(clk_int) and (RST_indelay = '0')) then
         ioce_int <= IOCE_indelay; 
     end if;
  end process prcs_ioce_int;

--####################################################################
--#####                   GCLK Register Banks                    #####
--####################################################################
  prcs_dgff:process(CLKDIV_indelay, GSR_indelay, RST_indelay)
  begin
     if((GSR_indelay = '1') or (RST_indelay = '1'))then
         dgff(3) <= '0';
         dgff(2) <= '0';
         dgff(1) <= '0';
         dgff(0) <= '0';
     elsif(rising_edge(CLKDIV_indelay) and (GSR_indelay = '0') and (RST_indelay = '0') and (OCE_indelay = '1'))then
         dgff(3) <= D4_indelay;
         dgff(2) <= D3_indelay;
         dgff(1) <= D2_indelay;
         dgff(0) <= D1_indelay;
     end if;
  end process prcs_dgff;

  prcs_tgff:process(CLKDIV_indelay, GSR_indelay, RST_indelay)
  begin
     if((GSR_indelay = '1') or (RST_indelay = '1'))then
         tgff(3) <= '0'; -- tinit;
         tgff(2) <= '0'; -- tinit;
         tgff(1) <= '0'; -- tinit;
         tgff(0) <= '0'; -- tinit;
     elsif(rising_edge(CLKDIV_indelay) and (GSR_indelay = '0') and (RST_indelay = '0') and (TCE_indelay = '1'))then
         tgff(3) <= T4_indelay;
         tgff(2) <= T3_indelay;
         tgff(1) <= T2_indelay;
         tgff(0) <= T1_indelay;
     end if;
  end process prcs_tgff;
--####################################################################
--#####                   Bypass Muxes                           #####
--####################################################################
     ddata <= trainp when (TRAIN_indelay = '1') else
              (D4_indelay & D3_indelay & D2_indelay & D1_indelay) when (BYPASS_GCLK_FF_BINARY = '1') else
              dgff;

     tdata <= (T4_indelay & T3_indelay & T2_indelay & T1_indelay) when (BYPASS_GCLK_FF_BINARY = '1') else
              tgff;
--####################################################################
--#####             Top of Shift Registers                       #####
--####################################################################
  prcs_dcascin:process
  begin
     if(encasc = '1') then
         dcasc_in <= SHIFTIN1_indelay;
     else
         dcasc_in <= '0'; 
     end if;
     wait on SHIFTIN1_indelay, encasc;
   end process prcs_dcascin;

  prcs_tcascin:process
  begin
     if(encasc = '1') then
         tcasc_in <= SHIFTIN2_indelay;
     else
         tcasc_in <= '0'; 
     end if;
     wait on SHIFTIN2_indelay, encasc;
   end process prcs_tcascin;

--####################################################################
--#####             Output Shift Registers                       #####
--####################################################################
  prcs_dofftoff:process(clk_int, GSR_indelay, RST_indelay)
  begin
     if((GSR_indelay = '1') or (RST_indelay = '1'))then
         doff(3) <= '0';
         doff(2) <= '0';
         doff(1) <= '0';
         doff(0) <= '0';
         toff(3) <= '0'; -- tinit;
         toff(2) <= '0'; -- tinit;
         toff(1) <= '0'; -- tinit;
         toff(0) <= '0'; -- tinit;
     elsif(rising_edge(clk_int) and (GSR_indelay = '0') and (RST_indelay = '0') ) then
        if (ioce_int = '1') then
           if (OCE_indelay = '1') then doff <= ddata; end if;
           if (TCE_indelay = '1') then toff <= tdata; end if;
        else
           if (OCE_indelay = '1') then doff <= (dcasc_in & doff(3 downto 1)); end if;
           if (TCE_indelay = '1') then toff <= (tcasc_in & toff(3 downto 1)); end if;
        end if;
     end if;
  end process prcs_dofftoff;
    
--####################################################################
--#####             Bottom of Shift Registers                    #####
--####################################################################
  SHIFTOUT1_outdelay <= doff(0); -- MASTER
  SHIFTOUT2_outdelay <= toff(0); -- MASTER

  SHIFTOUT3_outdelay <= dlsb;    -- SLAVE
  SHIFTOUT4_outdelay <= tlsb;    -- SLAVE
    
  prcs_dlsb:process(ioce_int, ddata(0), doff(1))
  begin
     if(ioce_int = '1') then
         dlsb <= ddata(0);
     else
         dlsb <= doff(1);
     end if;
  end process prcs_dlsb;
    
  prcs_tlsb:process(ioce_int, tdata(0), toff(1), T1_indelay)
  begin
     if(bypassTFF = '1') then
         tlsb <= T1_indelay;
     elsif(ioce_int = '1') then
         tlsb <= tdata(0);
     else
         tlsb <= toff(1);
     end if;
  end process prcs_tlsb;
    
  prcs_dpre:process(dlsb, SHIFTIN3_indelay, endiffop, isslave)
  begin
     if(endiffop = '0') then
        dpre <= dlsb;
     elsif(isslave = '1') then
        dpre <= not dlsb;
     else
        dpre <= SHIFTIN3_indelay;
     end if;
   end process prcs_dpre;

  prcs_tpre:process(tlsb, SHIFTIN4_indelay, endiffop, isslave)
  begin
     if(endiffop = '0') then
        tpre <= tlsb;
     elsif(isslave = '1') then
        tpre <= tlsb;
     else
        tpre <= SHIFTIN4_indelay;
     end if;
   end process prcs_tpre;

--####################################################################
--#####                    Output Sampling FFs                   #####
--####################################################################
  prcs_DpfTpf:process(clk_int, GSR_indelay, RST_indelay)
  begin
     if (GSR_indelay = '1') then
         Dpf <= '0';
         Tpf <= '0'; -- should be tinit
         one_shot_OCE <= '1';
         one_shot_TCE <= '1';
     elsif(RST_indelay = '1') then
         Dpf <= isslave and endiffop; -- '0'
         Tpf <= '0'; -- should be tinit
         one_shot_OCE <= '1';
         one_shot_TCE <= '1';
     elsif(rising_edge(clk_int) and (GSR_indelay = '0') and (RST_indelay = '0') ) then
         if (OCE_indelay = '1') then Dpf <= dpre; end if;
         if (TCE_indelay = '1') then Tpf <= tpre; end if;
         if (OCE_indelay = '1') then one_shot_OCE <= '0'; end if;
         if (TCE_indelay = '1') then one_shot_TCE <= '0'; end if;
     end if;
  end process prcs_DpfTpf;
  prcs_DffTff:process(clk_int, GSR_indelay, RST_indelay)
  begin
     if(GSR_indelay = '1') then
         Dff <= '0';
         Tff <= '0';
     elsif(RST_indelay = '1') then
         Dff <= '0';
         Tff <= tinit;
     elsif(rising_edge(clk_int) and (GSR_indelay = '0') and (RST_indelay = '0') )then
         if (OCE_indelay = '1') then
            if (one_shot_OCE = '1') then
               Dff <= Dpf;
            else
               Dff <= dpre;
            end if;
         end if;
         if (TCE_indelay = '1') then
            if (one_shot_TCE = '1') then
               Tff <= Tpf;
            else
               Tff <= tpre;
            end if;
         end if;
     end if;
  end process prcs_DffTff;
--####################################################################
--#####                   Final Output Mux                       #####
--####################################################################
  prcs_oqout:process(Dff)
  begin
     OQ_outdelay <= Dff;
  end process prcs_oqout;

  prcs_tqout:process(Tff, tpre)
  begin
     if( bypassTFF = '1') then
        TQ_outdelay <= tpre;
     else
        TQ_outdelay <= Tff;
     end if;
  end process prcs_tqout;

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
      TIMING : process
        variable Tmkr_D1_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_D2_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_D3_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_D4_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_OCE_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_RST_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_T1_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_T2_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_T3_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_T4_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_TCE_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_TRAIN_CLK0_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tmkr_TRAIN_CLK1_posedge : VitalTimingDataType := VitalTimingDataInit;
        variable Tviol_D1_CLKDIV_posedge :  std_ulogic := '0';
        variable Tviol_D2_CLKDIV_posedge :  std_ulogic := '0';
        variable Tviol_D3_CLKDIV_posedge :  std_ulogic := '0';
        variable Tviol_D4_CLKDIV_posedge :  std_ulogic := '0';
        variable Tviol_OCE_CLKDIV_posedge :  std_ulogic := '0';
        variable Tviol_RST_CLKDIV_posedge :  std_ulogic := '0';
        variable Tviol_T1_CLKDIV_posedge :  std_ulogic := '0';
        variable Tviol_T2_CLKDIV_posedge :  std_ulogic := '0';
        variable Tviol_T3_CLKDIV_posedge :  std_ulogic := '0';
        variable Tviol_T4_CLKDIV_posedge :  std_ulogic := '0';
        variable Tviol_TCE_CLKDIV_posedge :  std_ulogic := '0';
        variable Tviol_TRAIN_CLK0_posedge :  std_ulogic := '0';
        variable Tviol_TRAIN_CLK1_posedge :  std_ulogic := '0';
        variable OQ_GlitchData : VitalGlitchDataType;
        variable TQ_GlitchData : VitalGlitchDataType;

        begin

        if (TimingChecksOn) then
          VitalSetupHoldCheck
          (
            Violation => Tviol_D1_CLKDIV_posedge,
            TimingData => Tmkr_D1_CLKDIV_posedge,
            TestSignal => D1_CLKDIV_dly,
            TestSignalName => "D1",
            TestDelay => tisd_D1_CLKDIV,
            RefSignal => CLKDIV_dly,
            RefSignalName => "CLKDIV",
            RefDelay => ticd_CLKDIV,
            SetupHigh => tsetup_D1_CLKDIV_posedge_posedge,
            HoldHigh => thold_D1_CLKDIV_posedge_posedge,
            SetupLow => tsetup_D1_CLKDIV_negedge_posedge,
            HoldLow => thold_D1_CLKDIV_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_D2_CLKDIV_posedge,
            TimingData => Tmkr_D2_CLKDIV_posedge,
            TestSignal => D2_CLKDIV_dly,
            TestSignalName => "D2",
            TestDelay => tisd_D2_CLKDIV,
            RefSignal => CLKDIV_dly,
            RefSignalName => "CLKDIV",
            RefDelay => ticd_CLKDIV,
            SetupHigh => tsetup_D2_CLKDIV_posedge_posedge,
            HoldHigh => thold_D2_CLKDIV_posedge_posedge,
            SetupLow => tsetup_D2_CLKDIV_negedge_posedge,
            HoldLow => thold_D2_CLKDIV_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_D3_CLKDIV_posedge,
            TimingData => Tmkr_D3_CLKDIV_posedge,
            TestSignal => D3_CLKDIV_dly,
            TestSignalName => "D3",
            TestDelay => tisd_D3_CLKDIV,
            RefSignal => CLKDIV_dly,
            RefSignalName => "CLKDIV",
            RefDelay => ticd_CLKDIV,
            SetupHigh => tsetup_D3_CLKDIV_posedge_posedge,
            HoldHigh => thold_D3_CLKDIV_posedge_posedge,
            SetupLow => tsetup_D3_CLKDIV_negedge_posedge,
            HoldLow => thold_D3_CLKDIV_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_D4_CLKDIV_posedge,
            TimingData => Tmkr_D4_CLKDIV_posedge,
            TestSignal => D4_CLKDIV_dly,
            TestSignalName => "D4",
            TestDelay => tisd_D4_CLKDIV,
            RefSignal => CLKDIV_dly,
            RefSignalName => "CLKDIV",
            RefDelay => ticd_CLKDIV,
            SetupHigh => tsetup_D4_CLKDIV_posedge_posedge,
            HoldHigh => thold_D4_CLKDIV_posedge_posedge,
            SetupLow => tsetup_D4_CLKDIV_negedge_posedge,
            HoldLow => thold_D4_CLKDIV_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_OCE_CLKDIV_posedge,
            TimingData => Tmkr_OCE_CLKDIV_posedge,
            TestSignal => OCE_CLKDIV_dly,
            TestSignalName => "OCE",
            TestDelay => tisd_OCE_CLKDIV,
            RefSignal => CLKDIV_dly,
            RefSignalName => "CLKDIV",
            RefDelay => ticd_CLKDIV,
            SetupHigh => tsetup_OCE_CLKDIV_posedge_posedge,
            HoldHigh => thold_OCE_CLKDIV_posedge_posedge,
            SetupLow => tsetup_OCE_CLKDIV_negedge_posedge,
            HoldLow => thold_OCE_CLKDIV_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_RST_CLKDIV_posedge,
            TimingData => Tmkr_RST_CLKDIV_posedge,
            TestSignal => RST_CLKDIV_dly,
            TestSignalName => "RST",
            TestDelay => tisd_RST_CLKDIV,
            RefSignal => CLKDIV_dly,
            RefSignalName => "CLKDIV",
            RefDelay => ticd_CLKDIV,
            SetupHigh => tsetup_RST_CLKDIV_posedge_posedge,
            HoldHigh => thold_RST_CLKDIV_posedge_posedge,
            SetupLow => tsetup_RST_CLKDIV_negedge_posedge,
            HoldLow => thold_RST_CLKDIV_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_T1_CLKDIV_posedge,
            TimingData => Tmkr_T1_CLKDIV_posedge,
            TestSignal => T1_CLKDIV_dly,
            TestSignalName => "T1",
            TestDelay => tisd_T1_CLKDIV,
            RefSignal => CLKDIV_dly,
            RefSignalName => "CLKDIV",
            RefDelay => ticd_CLKDIV,
            SetupHigh => tsetup_T1_CLKDIV_posedge_posedge,
            HoldHigh => thold_T1_CLKDIV_posedge_posedge,
            SetupLow => tsetup_T1_CLKDIV_negedge_posedge,
            HoldLow => thold_T1_CLKDIV_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_T2_CLKDIV_posedge,
            TimingData => Tmkr_T2_CLKDIV_posedge,
            TestSignal => T2_CLKDIV_dly,
            TestSignalName => "T2",
            TestDelay => tisd_T2_CLKDIV,
            RefSignal => CLKDIV_dly,
            RefSignalName => "CLKDIV",
            RefDelay => ticd_CLKDIV,
            SetupHigh => tsetup_T2_CLKDIV_posedge_posedge,
            HoldHigh => thold_T2_CLKDIV_posedge_posedge,
            SetupLow => tsetup_T2_CLKDIV_negedge_posedge,
            HoldLow => thold_T2_CLKDIV_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_T3_CLKDIV_posedge,
            TimingData => Tmkr_T3_CLKDIV_posedge,
            TestSignal => T3_CLKDIV_dly,
            TestSignalName => "T3",
            TestDelay => tisd_T3_CLKDIV,
            RefSignal => CLKDIV_dly,
            RefSignalName => "CLKDIV",
            RefDelay => ticd_CLKDIV,
            SetupHigh => tsetup_T3_CLKDIV_posedge_posedge,
            HoldHigh => thold_T3_CLKDIV_posedge_posedge,
            SetupLow => tsetup_T3_CLKDIV_negedge_posedge,
            HoldLow => thold_T3_CLKDIV_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_T4_CLKDIV_posedge,
            TimingData => Tmkr_T4_CLKDIV_posedge,
            TestSignal => T4_CLKDIV_dly,
            TestSignalName => "T4",
            TestDelay => tisd_T4_CLKDIV,
            RefSignal => CLKDIV_dly,
            RefSignalName => "CLKDIV",
            RefDelay => ticd_CLKDIV,
            SetupHigh => tsetup_T4_CLKDIV_posedge_posedge,
            HoldHigh => thold_T4_CLKDIV_posedge_posedge,
            SetupLow => tsetup_T4_CLKDIV_negedge_posedge,
            HoldLow => thold_T4_CLKDIV_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_TCE_CLKDIV_posedge,
            TimingData => Tmkr_TCE_CLKDIV_posedge,
            TestSignal => TCE_CLKDIV_dly,
            TestSignalName => "TCE",
            TestDelay => tisd_TCE_CLKDIV,
            RefSignal => CLKDIV_dly,
            RefSignalName => "CLKDIV",
            RefDelay => ticd_CLKDIV,
            SetupHigh => tsetup_TCE_CLKDIV_posedge_posedge,
            HoldHigh => thold_TCE_CLKDIV_posedge_posedge,
            SetupLow => tsetup_TCE_CLKDIV_negedge_posedge,
            HoldLow => thold_TCE_CLKDIV_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_TRAIN_CLK0_posedge,
            TimingData => Tmkr_TRAIN_CLK0_posedge,
            TestSignal => TRAIN_CLK0_dly,
            TestSignalName => "TRAIN",
            TestDelay => tisd_TRAIN_CLK0,
            RefSignal => CLK0_dly,
            RefSignalName => "CLK0",
            RefDelay => ticd_CLK0,
            SetupHigh => tsetup_TRAIN_CLK0_posedge_posedge,
            HoldHigh => thold_TRAIN_CLK0_posedge_posedge,
            SetupLow => tsetup_TRAIN_CLK0_negedge_posedge,
            HoldLow => thold_TRAIN_CLK0_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
          VitalSetupHoldCheck
          (
            Violation => Tviol_TRAIN_CLK1_posedge,
            TimingData => Tmkr_TRAIN_CLK1_posedge,
            TestSignal => TRAIN_CLK1_dly,
            TestSignalName => "TRAIN",
            TestDelay => tisd_TRAIN_CLK1,
            RefSignal => CLK1_dly,
            RefSignalName => "CLK1",
            RefDelay => ticd_CLK1,
            SetupHigh => tsetup_TRAIN_CLK1_posedge_posedge,
            HoldHigh => thold_TRAIN_CLK1_posedge_posedge,
            SetupLow => tsetup_TRAIN_CLK1_negedge_posedge,
            HoldLow => thold_TRAIN_CLK1_negedge_posedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'R',
            HeaderMsg      => InstancePath & "/" & MODULE_NAME,
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => WARNING
          );
        end if;
          VitalPathDelay01
          (
            OutSignal     => OQ,
            GlitchData    => OQ_GlitchData,
            OutSignalName => "OQ",
            OutTemp       => OQ_out,
            Paths       => (0 => (CLK0_dly'last_event, tpd_CLK0_OQ,TRUE)),
            Mode          => VitalTransport,
            Xon           => false,
            MsgOn          => false,
            MsgSeverity    => WARNING
          );
          VitalPathDelay01
          (
            OutSignal     => OQ,
            GlitchData    => OQ_GlitchData,
            OutSignalName => "OQ",
            OutTemp       => OQ_out,
            Paths       => (0 => (CLK1_dly'last_event, tpd_CLK1_OQ,TRUE)),
            Mode          => VitalTransport,
            Xon           => false,
            MsgOn          => false,
            MsgSeverity    => WARNING
          );
          VitalPathDelay01
          (
            OutSignal     => TQ,
            GlitchData    => TQ_GlitchData,
            OutSignalName => "TQ",
            OutTemp       => TQ_out,
            Paths       => (0 => (CLK0_dly'last_event, tpd_CLK0_TQ,TRUE)),
            Mode          => VitalTransport,
            Xon           => false,
            MsgOn          => false,
            MsgSeverity    => WARNING
          );
          VitalPathDelay01
          (
            OutSignal     => TQ,
            GlitchData    => TQ_GlitchData,
            OutSignalName => "TQ",
            OutTemp       => TQ_out,
            Paths       => (0 => (CLK1_dly'last_event, tpd_CLK1_TQ,TRUE)),
            Mode          => VitalTransport,
            Xon           => false,
            MsgOn          => false,
            MsgSeverity    => WARNING
          );
        wait on
          OQ_out,
          SHIFTOUT1_out,
          SHIFTOUT2_out,
          SHIFTOUT3_out,
          SHIFTOUT4_out,
          TQ_out,
          D1_CLKDIV_dly,
          D2_CLKDIV_dly,
          D3_CLKDIV_dly,
          D4_CLKDIV_dly,
          OCE_CLKDIV_dly,
          RST_CLKDIV_dly,
          T1_CLKDIV_dly,
          T2_CLKDIV_dly,
          T3_CLKDIV_dly,
          T4_CLKDIV_dly,
          TCE_CLKDIV_dly,
          TRAIN_CLK0_dly,
          TRAIN_CLK1_dly;
      end process TIMING;
      SHIFTOUT1 <= SHIFTOUT1_out;
      SHIFTOUT2 <= SHIFTOUT2_out;
      SHIFTOUT3 <= SHIFTOUT3_out;
      SHIFTOUT4 <= SHIFTOUT4_out;
    end X_OSERDES2_V;
