-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/stan/VITAL/X_ICAP_SPARTAN6.vhd,v 1.17 2011/11/10 19:57:48 yanx Exp $
-------------------------------------------------------
--  Copyright (c) 2009 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version : 11.1
--  \   \          Description : 
--  /   /                      
-- /___/   /\      Filename    : X_ICAP_SPARTAN6.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
--  Revision: 
--  10/09/09 - Add initialzion message and check (CR525847)
--  12/08/09 - Support no rbt file case readback (CR537437)
--  03/02/10 - Support desync when icap initial done (CR551856)
--  03/17/10 - Create internal clock for icap initializtion to
--             reduce initializtion time (CR554252)
--  01/31/11 - Fix for init_tri (CR590958)
--  11/10/11 - Update DEVICE_ID (CR611789)
--  End Revision
-------------------------------------------------------

----- CELL X_ICAP_SPARTAN6 -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library STD;
use STD.TEXTIO.all;
library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;

use simprim.VPACKAGE.all;

  entity X_ICAP_SPARTAN6 is
    generic (

      TimingChecksOn : boolean := TRUE;
      InstancePath   : string  := "*";
      Xon            : boolean := TRUE;
      MsgOn          : boolean := FALSE;
      LOC            : string  := "UNPLACED";
      tipd_CE : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_CLK : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_I : VitalDelayArrayType01 (15 downto 0) := (others => (0 ps, 0 ps));
      tipd_WRITE : VitalDelayType01 :=  (0 ps, 0 ps);
      tpd_CLK_BUSY : VitalDelayType01 := (0 ps, 0 ps);
      tpd_CLK_O : VitalDelayArrayType01(15 downto 0) := (others => (0 ps, 0 ps));
      thold_CE_CLK_negedge_posedge : VitalDelayType := 0 ps;
      thold_CE_CLK_posedge_posedge : VitalDelayType := 0 ps;
      thold_I_CLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
      thold_I_CLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
      thold_WRITE_CLK_negedge_posedge : VitalDelayType := 0 ps;
      thold_WRITE_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE_CLK_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_I_CLK_negedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
      tsetup_I_CLK_posedge_posedge : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
      tsetup_WRITE_CLK_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_WRITE_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tisd_CE_CLK : VitalDelayType := 0 ps;
      tisd_I_CLK : VitalDelayArrayType(15 downto 0) := (others => 0 ps);
      tisd_WRITE_CLK : VitalDelayType := 0 ps;
      ticd_CLK : VitalDelayType := 0 ps;
      tperiod_CLK_posedge : VitalDelayType := 0 ps;

      DEVICE_ID : bit_vector := X"04000093";
      SIM_CFG_FILE_NAME : string := "NONE"
    );

    port (
      BUSY                 : out std_ulogic := '1';
      O                    : out std_logic_vector(15 downto 0);
      CE                   : in std_ulogic;
      CLK                  : in std_ulogic;
      I                    : in std_logic_vector(15 downto 0);
      WRITE                : in std_ulogic      
    );
    attribute VITAL_LEVEL0 of X_ICAP_SPARTAN6 :     entity is true;
  end X_ICAP_SPARTAN6;

  architecture X_ICAP_SPARTAN6_V of X_ICAP_SPARTAN6 is

component X_SIM_CONFIG_S6
  generic (

     InstancePath : string := "*";
     LOC : string := "UNPLACED";
     MsgOn : boolean := false;
     TimingChecksOn : boolean := true;
     Xon : boolean := true;

     DEVICE_ID : bit_vector := X"00000000";
     ICAP_SUPPORT : boolean := false
  );
  port (
     BUSY : out std_ulogic := '0';
     CSOB : out std_ulogic := '1';
     D : inout std_logic_vector(15 downto 0);
     DONE : inout std_logic;
     INITB : inout std_logic := 'H';
     CCLK : in std_ulogic := '0';
     CSIB : in std_ulogic := '0';
     M : in std_logic_vector(1 downto 0) := "10";
     PROGB : in std_ulogic := 'H';
     RDWRB : in std_ulogic := '0'
  );
end component;

function bit_revers8 ( din8 : in std_logic_vector(7 downto 0))
                   return  std_logic_vector is
  variable bit_rev8 : std_logic_vector(7 downto 0);
  begin
      bit_rev8(0) := din8(7);
      bit_rev8(1) := din8(6);
      bit_rev8(2) := din8(5);
      bit_rev8(3) := din8(4);
      bit_rev8(4) := din8(3);
      bit_rev8(5) := din8(2);
      bit_rev8(6) := din8(1);
      bit_rev8(7) := din8(0);

     return bit_rev8;
  end bit_revers8;

    TYPE VitalTimingDataArrayType IS ARRAY (NATURAL RANGE <>) OF VitalTimingDataType;
    
  signal BUSY_out : std_ulogic := '1';
  signal O_out : std_logic_vector(15 downto 0);
    
  signal CE_ipd : std_ulogic;
  signal CLK_ipd : std_ulogic;
  signal I_ipd : std_logic_vector(15 downto 0);
  signal WRITE_ipd : std_ulogic;
  signal WRITE_CLK_dly : std_ulogic;
  signal I_CLK_dly : std_logic_vector(15 downto 0);
  signal CE_CLK_dly : std_ulogic;
  signal CLK_dly : std_ulogic;

  signal cso_b : std_ulogic;
  signal  prog_b : std_ulogic := '1';
  signal  init_b : std_logic := '0';
  signal  init_tri : std_logic := 'H';
  signal  cs_bi : std_ulogic := '0';
  signal  rdwr_bi : std_ulogic := '0';
  signal cs_b_t : std_ulogic;
  signal clk_in : std_ulogic;
  signal rdwr_b_t : std_ulogic;
  signal dix  : std_logic_vector (15 downto 0) ; 
  signal di  : std_logic_vector (15 downto 0) ; 
  signal icap_idone : std_ulogic := '0';
  signal csi_b_in : std_ulogic;
  signal done_o : std_logic;
  signal busy_o : std_ulogic;
  signal di_t : std_logic_vector (15 downto 0) ;
  signal clk_osc : std_ulogic := '0';
    begin


    WireDelay : block
    begin
      I_DELAY : for j in 0 to 15 generate
        VitalWireDelay (I_ipd(j),I(j),tipd_I(j));
      end generate I_DELAY;
      VitalWireDelay (CE_ipd,CE,tipd_CE);
      VitalWireDelay (CLK_ipd,CLK,tipd_CLK);
      VitalWireDelay (WRITE_ipd,WRITE,tipd_WRITE);
    end block;


    SignalDelay : block
    begin
      I_CLK_DELAY : for k in 15 downto 0 generate
        VitalSignalDelay (I_CLK_dly(k),I_ipd(k),tisd_I_CLK(k));
      end generate I_CLK_DELAY;
      VitalSignalDelay (CE_CLK_dly,CE_ipd,tisd_CE_CLK);
      VitalSignalDelay (WRITE_CLK_dly,WRITE_ipd,tisd_WRITE_CLK);

      VitalSignalDelay (CLK_dly,CLK_ipd,ticd_CLK);
    end block;


   init_tri <=  init_b;
   done_o <= 'H';
   di_t <= "ZZZZZZZZZZZZZZZZ" when (icap_idone = '1' and WRITE_CLK_dly = '1') else dix;
   csi_b_in <= CE_CLK_dly;
   dix <= I_CLK_DLY when (icap_idone  =  '1') else di;
   BUSY_out <= busy_o when (icap_idone   =  '1') else '1';
   cs_b_t <= csi_b_in when (icap_idone  =  '1') else cs_bi;
   clk_in <= CLK_dly when (icap_idone  =  '1') else clk_osc;
   rdwr_b_t <= WRITE_CLK_dly when (icap_idone   =  '1') else rdwr_bi;
   O_out <= di_t when (icap_idone = '1' and WRITE_CLK_dly = '1') else "0000000000000000";

   process (CE_CLK_dly, WRITE_CLK_dly)
   begin
     if (NOW > 1 ps and icap_idone = '0') then
      assert FALSE report " Warning :  X_ICAP_SPARTAN6 has not finished initialization. A message will be printed after the initialization. User need start read/write operation after that." severity warning;
     end if;
   end process;

 process  begin
   wait for 1 ns;
   clk_osc <=  '1';
   wait for 1 ns;
   clk_osc <=  '0';
 end process;



  X_SIM_CONFIG_S6_INST : X_SIM_CONFIG_S6
  generic map (
      DEVICE_ID => DEVICE_ID,
      ICAP_SUPPORT => TRUE
    )
  port map (
      BUSY => busy_o, 
      CSOB => cso_b,
      DONE => done_o,
      CCLK => clk_in,
      CSIB => cs_b_t,
      D => di_t,
      INITB => init_tri,
      M => "10",
      PROGB => prog_b,
      RDWRB => rdwr_b_t
  );

  process 
    file icap_fd : text;
    variable open_status : file_open_status;
    variable in_buf    : line;
    variable data_rbt_tmp : bit_vector(15 downto 0);
    variable data_rbt : std_logic_vector(15 downto 0);
    variable read_ok : boolean := false;
    variable tmp_byte0  : std_logic_vector (7 downto 0) ; 
    variable tmp_byte1  : std_logic_vector (7 downto 0) ; 
    variable tmp_byte  : std_logic_vector (7 downto 0) ; 
    variable sim_file_flag : std_ulogic := '0';
  begin
    if (SIM_CFG_FILE_NAME  =  "NONE") then
--       assert FALSE report "Error : The configure rbt data file for X_ICAP_SPARTAN6 was not found. Use the SIM_CFG_FILE_NAME generic to pass the file name." severity error;
       sim_file_flag := '1';
    else 
      file_open(open_status, icap_fd, SIM_CFG_FILE_NAME, read_mode);
      if (open_status /= open_ok) then
         assert false report " Error: The configure rbt data file %s for X_ICAP_SPARTAN6 was not found. Use the SIM_CFG_FILE_NAME generic to pass the file name." severity error;
         sim_file_flag := '1';
      end if;
    end if;

      init_b <= '1';
      prog_b <= '1';
      rdwr_bi <= '0';
      cs_bi <= '1';
      wait for 600000 ps;
      wait until rising_edge(clk_in);
      prog_b <= '0';
      wait until falling_edge(clk_in);
      init_b <= '0';
      wait for 600000 ps;
      wait until rising_edge(clk_in);
      prog_b <= '1';
      wait for 100000 ps;
      wait until falling_edge(clk_in);
      init_b <= '1';
      cs_bi <= '0';
    if (sim_file_flag  =  '0') then
      while (not endfile(icap_fd)) loop
         readline(icap_fd, in_buf);
         read(in_buf, data_rbt_tmp, read_ok);
         data_rbt := TO_STDLOGICVECTOR(data_rbt_tmp);
         if (done_o  =  '0') then
          tmp_byte(7 downto 0) := data_rbt(15 downto 8);
          tmp_byte1(7 downto 0) := bit_revers8(tmp_byte);
          tmp_byte(7 downto 0) := data_rbt(7 downto 0);
          tmp_byte0(7 downto 0) := bit_revers8(tmp_byte);
          wait until falling_edge(clk_in);
          di <= (tmp_byte1 & tmp_byte0);
         else 
          if (icap_idone = '0') then
          wait until falling_edge(clk_in);
          di <= X"FFFF";
          wait until falling_edge(clk_in);
          wait until falling_edge(clk_in);
          wait until falling_edge(clk_in);
          wait until falling_edge(clk_in);
          wait until falling_edge(clk_in);
          wait until falling_edge(clk_in);
          icap_idone <= '1';
      assert FALSE report " Message :  X_ICAP_SPARTAN6 has finished initialization. User can start read/write operation." severity note;
         end if;
        end if;
      end loop;
      file_close(icap_fd);
    else
      wait until falling_edge(clk_in);
          di <= X"FFFF";
      wait until falling_edge(clk_in);
          di <= X"FFFF";
      wait until falling_edge(clk_in);
          di <= X"FFFF";
      wait until falling_edge(clk_in);
          di <= X"FFFF";
      wait until falling_edge(clk_in);
          di <= X"FFFF";
      wait until falling_edge(clk_in);
          di <= X"5599"; -- AA99
      wait until falling_edge(clk_in);
          di <= X"AA66"; -- 5566
      wait until falling_edge(clk_in);
          di <= X"FFFF";
      wait until falling_edge(clk_in);
          di <= X"FFFF";
      wait until falling_edge(clk_in);
          di <= X"0C85";
      wait until falling_edge(clk_in);
          di <= X"00A0";
      wait until falling_edge(clk_in);
      wait until falling_edge(clk_in);
      wait until falling_edge(clk_in);
      wait until falling_edge(clk_in);
      wait until falling_edge(clk_in);
      wait until falling_edge(clk_in);
      if (icap_idone = '0') then
          icap_idone <= '1';
      assert FALSE report " Message :  X_ICAP_SPARTAN6 has finished initialization. User can start read/write operation." severity note;
      end if;
    end if;
      wait; 
  
  end process;


  TIMING : process
    variable Tmkr_CE_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_I_CLK_posedge : VitalTimingDataArrayType(15 downto 0);
    variable Tmkr_WRITE_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_CE_CLK_posedge :  std_ulogic := '0';
    variable Tviol_I_CLK_posedge : std_logic_vector(15 downto 0) := (others => '0');
    variable Tviol_WRITE_CLK_posedge :  std_ulogic := '0';
    variable BUSY_GlitchData : VitalGlitchDataType;
    variable O0_GlitchData : VitalGlitchDataType;
    variable O10_GlitchData : VitalGlitchDataType;
    variable O11_GlitchData : VitalGlitchDataType;
    variable O12_GlitchData : VitalGlitchDataType;
    variable O13_GlitchData : VitalGlitchDataType;
    variable O14_GlitchData : VitalGlitchDataType;
    variable O15_GlitchData : VitalGlitchDataType;
    variable O1_GlitchData : VitalGlitchDataType;
    variable O2_GlitchData : VitalGlitchDataType;
    variable O3_GlitchData : VitalGlitchDataType;
    variable O4_GlitchData : VitalGlitchDataType;
    variable O5_GlitchData : VitalGlitchDataType;
    variable O6_GlitchData : VitalGlitchDataType;
    variable O7_GlitchData : VitalGlitchDataType;
    variable O8_GlitchData : VitalGlitchDataType;
    variable O9_GlitchData : VitalGlitchDataType;
    variable Pviol_CLK : STD_ULOGIC := '0';
    variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;

    begin

    if (TimingChecksOn) then
      VitalSetupHoldCheck
      (
        Violation => Tviol_CE_CLK_posedge,
        TimingData => Tmkr_CE_CLK_posedge,
        TestSignal => CE_CLK_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_CE_CLK_posedge_posedge,
        HoldHigh => thold_CE_CLK_posedge_posedge,
        SetupLow => tsetup_CE_CLK_negedge_posedge,
        HoldLow => thold_CE_CLK_negedge_posedge,
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(0),
        TimingData => Tmkr_I_CLK_posedge(0),
        TestSignal => I_CLK_dly(0),
        TestSignalName => "I(0)",
        TestDelay => tisd_I_CLK(0),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(0),
        HoldHigh => thold_I_CLK_posedge_posedge(0),
        SetupLow => tsetup_I_CLK_negedge_posedge(0),
        HoldLow => thold_I_CLK_negedge_posedge(0),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(1),
        TimingData => Tmkr_I_CLK_posedge(1),
        TestSignal => I_CLK_dly(1),
        TestSignalName => "I(1)",
        TestDelay => tisd_I_CLK(1),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(1),
        HoldHigh => thold_I_CLK_posedge_posedge(1),
        SetupLow => tsetup_I_CLK_negedge_posedge(1),
        HoldLow => thold_I_CLK_negedge_posedge(1),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(10),
        TimingData => Tmkr_I_CLK_posedge(10),
        TestSignal => I_CLK_dly(10),
        TestSignalName => "I(10)",
        TestDelay => tisd_I_CLK(10),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(10),
        HoldHigh => thold_I_CLK_posedge_posedge(10),
        SetupLow => tsetup_I_CLK_negedge_posedge(10),
        HoldLow => thold_I_CLK_negedge_posedge(10),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(11),
        TimingData => Tmkr_I_CLK_posedge(11),
        TestSignal => I_CLK_dly(11),
        TestSignalName => "I(11)",
        TestDelay => tisd_I_CLK(11),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(11),
        HoldHigh => thold_I_CLK_posedge_posedge(11),
        SetupLow => tsetup_I_CLK_negedge_posedge(11),
        HoldLow => thold_I_CLK_negedge_posedge(11),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(12),
        TimingData => Tmkr_I_CLK_posedge(12),
        TestSignal => I_CLK_dly(12),
        TestSignalName => "I(12)",
        TestDelay => tisd_I_CLK(12),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(12),
        HoldHigh => thold_I_CLK_posedge_posedge(12),
        SetupLow => tsetup_I_CLK_negedge_posedge(12),
        HoldLow => thold_I_CLK_negedge_posedge(12),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(13),
        TimingData => Tmkr_I_CLK_posedge(13),
        TestSignal => I_CLK_dly(13),
        TestSignalName => "I(13)",
        TestDelay => tisd_I_CLK(13),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(13),
        HoldHigh => thold_I_CLK_posedge_posedge(13),
        SetupLow => tsetup_I_CLK_negedge_posedge(13),
        HoldLow => thold_I_CLK_negedge_posedge(13),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(14),
        TimingData => Tmkr_I_CLK_posedge(14),
        TestSignal => I_CLK_dly(14),
        TestSignalName => "I(14)",
        TestDelay => tisd_I_CLK(14),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(14),
        HoldHigh => thold_I_CLK_posedge_posedge(14),
        SetupLow => tsetup_I_CLK_negedge_posedge(14),
        HoldLow => thold_I_CLK_negedge_posedge(14),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(15),
        TimingData => Tmkr_I_CLK_posedge(15),
        TestSignal => I_CLK_dly(15),
        TestSignalName => "I(15)",
        TestDelay => tisd_I_CLK(15),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(15),
        HoldHigh => thold_I_CLK_posedge_posedge(15),
        SetupLow => tsetup_I_CLK_negedge_posedge(15),
        HoldLow => thold_I_CLK_negedge_posedge(15),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(2),
        TimingData => Tmkr_I_CLK_posedge(2),
        TestSignal => I_CLK_dly(2),
        TestSignalName => "I(2)",
        TestDelay => tisd_I_CLK(2),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(2),
        HoldHigh => thold_I_CLK_posedge_posedge(2),
        SetupLow => tsetup_I_CLK_negedge_posedge(2),
        HoldLow => thold_I_CLK_negedge_posedge(2),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(3),
        TimingData => Tmkr_I_CLK_posedge(3),
        TestSignal => I_CLK_dly(3),
        TestSignalName => "I(3)",
        TestDelay => tisd_I_CLK(3),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(3),
        HoldHigh => thold_I_CLK_posedge_posedge(3),
        SetupLow => tsetup_I_CLK_negedge_posedge(3),
        HoldLow => thold_I_CLK_negedge_posedge(3),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(4),
        TimingData => Tmkr_I_CLK_posedge(4),
        TestSignal => I_CLK_dly(4),
        TestSignalName => "I(4)",
        TestDelay => tisd_I_CLK(4),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(4),
        HoldHigh => thold_I_CLK_posedge_posedge(4),
        SetupLow => tsetup_I_CLK_negedge_posedge(4),
        HoldLow => thold_I_CLK_negedge_posedge(4),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(5),
        TimingData => Tmkr_I_CLK_posedge(5),
        TestSignal => I_CLK_dly(5),
        TestSignalName => "I(5)",
        TestDelay => tisd_I_CLK(5),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(5),
        HoldHigh => thold_I_CLK_posedge_posedge(5),
        SetupLow => tsetup_I_CLK_negedge_posedge(5),
        HoldLow => thold_I_CLK_negedge_posedge(5),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(6),
        TimingData => Tmkr_I_CLK_posedge(6),
        TestSignal => I_CLK_dly(6),
        TestSignalName => "I(6)",
        TestDelay => tisd_I_CLK(6),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(6),
        HoldHigh => thold_I_CLK_posedge_posedge(6),
        SetupLow => tsetup_I_CLK_negedge_posedge(6),
        HoldLow => thold_I_CLK_negedge_posedge(6),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(7),
        TimingData => Tmkr_I_CLK_posedge(7),
        TestSignal => I_CLK_dly(7),
        TestSignalName => "I(7)",
        TestDelay => tisd_I_CLK(7),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(7),
        HoldHigh => thold_I_CLK_posedge_posedge(7),
        SetupLow => tsetup_I_CLK_negedge_posedge(7),
        HoldLow => thold_I_CLK_negedge_posedge(7),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(8),
        TimingData => Tmkr_I_CLK_posedge(8),
        TestSignal => I_CLK_dly(8),
        TestSignalName => "I(8)",
        TestDelay => tisd_I_CLK(8),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(8),
        HoldHigh => thold_I_CLK_posedge_posedge(8),
        SetupLow => tsetup_I_CLK_negedge_posedge(8),
        HoldLow => thold_I_CLK_negedge_posedge(8),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(9),
        TimingData => Tmkr_I_CLK_posedge(9),
        TestSignal => I_CLK_dly(9),
        TestSignalName => "I(9)",
        TestDelay => tisd_I_CLK(9),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(9),
        HoldHigh => thold_I_CLK_posedge_posedge(9),
        SetupLow => tsetup_I_CLK_negedge_posedge(9),
        HoldLow => thold_I_CLK_negedge_posedge(9),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_WRITE_CLK_posedge,
        TimingData => Tmkr_WRITE_CLK_posedge,
        TestSignal => WRITE_CLK_dly,
        TestSignalName => "WRITE",
        TestDelay => tisd_WRITE_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_WRITE_CLK_posedge_posedge,
        HoldHigh => thold_WRITE_CLK_posedge_posedge,
        SetupLow => tsetup_WRITE_CLK_negedge_posedge,
        HoldLow => thold_WRITE_CLK_negedge_posedge,
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
    end if;
      VitalPathDelay01
      (
        OutSignal     => BUSY,
        GlitchData    => BUSY_GlitchData,
        OutSignalName => "BUSY",
        OutTemp       => BUSY_out,
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_BUSY,TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(0),
        GlitchData    => O0_GlitchData,
        OutSignalName => "O(0)",
        OutTemp       => O_out(0),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(0),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(1),
        GlitchData    => O1_GlitchData,
        OutSignalName => "O(1)",
        OutTemp       => O_out(1),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(1),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(10),
        GlitchData    => O10_GlitchData,
        OutSignalName => "O(10)",
        OutTemp       => O_out(10),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(10),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(11),
        GlitchData    => O11_GlitchData,
        OutSignalName => "O(11)",
        OutTemp       => O_out(11),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(11),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(12),
        GlitchData    => O12_GlitchData,
        OutSignalName => "O(12)",
        OutTemp       => O_out(12),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(12),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(13),
        GlitchData    => O13_GlitchData,
        OutSignalName => "O(13)",
        OutTemp       => O_out(13),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(13),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(14),
        GlitchData    => O14_GlitchData,
        OutSignalName => "O(14)",
        OutTemp       => O_out(14),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(14),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(15),
        GlitchData    => O15_GlitchData,
        OutSignalName => "O(15)",
        OutTemp       => O_out(15),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(15),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(2),
        GlitchData    => O2_GlitchData,
        OutSignalName => "O(2)",
        OutTemp       => O_out(2),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(2),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(3),
        GlitchData    => O3_GlitchData,
        OutSignalName => "O(3)",
        OutTemp       => O_out(3),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(3),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(4),
        GlitchData    => O4_GlitchData,
        OutSignalName => "O(4)",
        OutTemp       => O_out(4),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(4),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(5),
        GlitchData    => O5_GlitchData,
        OutSignalName => "O(5)",
        OutTemp       => O_out(5),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(5),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(6),
        GlitchData    => O6_GlitchData,
        OutSignalName => "O(6)",
        OutTemp       => O_out(6),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(6),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(7),
        GlitchData    => O7_GlitchData,
        OutSignalName => "O(7)",
        OutTemp       => O_out(7),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(7),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(8),
        GlitchData    => O8_GlitchData,
        OutSignalName => "O(8)",
        OutTemp       => O_out(8),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(8),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(9),
        GlitchData    => O9_GlitchData,
        OutSignalName => "O(9)",
        OutTemp       => O_out(9),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(9),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPeriodPulseCheck
      (
        Violation      => Pviol_CLK,
        PeriodData     => PInfo_CLK,
        TestSignal     => CLK_dly,
        TestSignalName => "CLK",
        TestDelay      => 0 ps,
        Period         => tperiod_CLK_posedge,
        PulseWidthHigh => 0 ps,
        PulseWidthLow  => 0 ps,
        CheckEnabled   => TRUE,
        HeaderMsg      => InstancePath & "/X_ICAP_SPARTAN6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
    wait on
      BUSY_out,
      O_out,
      CE_CLK_dly,
      I_CLK_dly,
      CLK_dly,
      WRITE_CLK_dly;
      
  end process TIMING;
 

end X_ICAP_SPARTAN6_V;
