-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/blanc/VITAL/X_ICAP_VIRTEX6.vhd,v 1.13 2010/05/20 20:31:00 yanx Exp $
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
-- /___/   /\      Filename    : X_ICAP_VIRTEX6.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
--  Revision: 1.0
--  10/09/09 - Add initialzion message and check (CR525847)
--  12/17/09 - Allow ICAP use without RBT file (CR537437)
--  03/02/19 - Support desync when icap initial done (551856)
--  03/17/10 - Create internal clock for icap initializtion to
--             reduce initializtion time (CR554252)
-------------------------------------------------------

----- CELL X_ICAP_VIRTEX6 -----

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

  entity X_ICAP_VIRTEX6 is
    generic (

      TimingChecksOn : boolean := TRUE;
      InstancePath   : string  := "*";
      Xon            : boolean := TRUE;
      MsgOn          : boolean := FALSE;
      LOC            : string  := "UNPLACED";
      tipd_CLK : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_CSB : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_I : VitalDelayArrayType01 (31 downto 0) := (others => (0 ps, 0 ps));
      tipd_RDWRB : VitalDelayType01 :=  (0 ps, 0 ps);
      tpd_CLK_BUSY : VitalDelayType01 := (0 ps, 0 ps);
      tpd_CLK_O : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
      thold_CSB_CLK_negedge_posedge : VitalDelayType := 0 ps;
      thold_CSB_CLK_posedge_posedge : VitalDelayType := 0 ps;
      thold_I_CLK_negedge_posedge : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
      thold_I_CLK_posedge_posedge : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
      thold_RDWRB_CLK_negedge_posedge : VitalDelayType := 0 ps;
      thold_RDWRB_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_CSB_CLK_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_CSB_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_I_CLK_negedge_posedge : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
      tsetup_I_CLK_posedge_posedge : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
      tsetup_RDWRB_CLK_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_RDWRB_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tisd_CSB_CLK : VitalDelayType := 0 ps;
      tisd_I_CLK : VitalDelayArrayType(31 downto 0) := (others => 0 ps);
      tisd_RDWRB_CLK : VitalDelayType := 0 ps;
      ticd_CLK : VitalDelayType := 0 ps;
      tperiod_CLK_posedge : VitalDelayType := 0 ps;

      DEVICE_ID : bit_vector := X"04244093";
      ICAP_WIDTH : string := "X8";
      SIM_CFG_FILE_NAME : string := "NONE"
    );

    port (
      BUSY                 : out std_ulogic := '1';
      O                    : out std_logic_vector(31 downto 0);
      CLK                  : in std_ulogic;
      CSB                  : in std_ulogic;
      I                    : in std_logic_vector(31 downto 0);
      RDWRB                : in std_ulogic      
    );
    attribute VITAL_LEVEL0 of X_ICAP_VIRTEX6 :     entity is true;
  end X_ICAP_VIRTEX6;

  architecture X_ICAP_VIRTEX6_V of X_ICAP_VIRTEX6 is

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

component X_SIM_CONFIG_V6
  generic (

     InstancePath : string := "*";
     LOC : string := "UNPLACED";
     MsgOn : boolean := false;
     TimingChecksOn : boolean := true;
     Xon : boolean := true;

     DEVICE_ID : bit_vector := X"00000000";
     ICAP_SUPPORT : boolean := false;
     ICAP_WIDTH : string := "X8"
  );
  port (
     BUSY : out std_ulogic := '0';
     CSOB : out std_ulogic := '1';
     D : inout std_logic_vector(31 downto 0);
     DONE : inout std_logic;
     INITB : inout std_logic := 'H';
     CCLK : in std_ulogic := '0';
     CSB : in std_ulogic := '0';
     M : in std_logic_vector(2 downto 0) := "110";
     PROGB : in std_ulogic := '0';
     RDWRB : in std_ulogic := '0'
  );

end component;

  TYPE VitalTimingDataArrayType IS ARRAY (NATURAL RANGE <>) OF VitalTimingDataType;
  signal BUSY_out : std_ulogic;
  signal O_out : std_logic_vector(31 downto 0);
    
  signal CLK_ipd : std_ulogic;
  signal CSB_ipd : std_ulogic;
  signal I_ipd : std_logic_vector(31 downto 0);
  signal RDWRB_ipd : std_ulogic;
    
  signal CLK_dly : std_ulogic;
  signal CSB_CLK_dly : std_ulogic;
  signal I_CLK_dly : std_logic_vector(31 downto 0);
  signal RDWRB_CLK_dly : std_ulogic;

  signal bw : std_logic_vector (3 downto 0) := "0000";
  signal cso_b : std_ulogic;
  signal  prog_b : std_ulogic := '1';
  signal  init_b : std_logic := '0';
  signal  init_tri : std_logic := 'H';
  signal  cs_bi : std_ulogic := '0';
  signal  rdwr_bi : std_ulogic := '0';
  signal cs_b_t : std_ulogic;
  signal clk_in : std_ulogic;
  signal rdwr_b_t : std_ulogic;
  signal dix  : std_logic_vector (31 downto 0) ;
  signal tmp_byte0  : std_logic_vector (7 downto 0) ;
  signal tmp_byte1  : std_logic_vector (7 downto 0) ;
  signal tmp_byte2  : std_logic_vector (7 downto 0) ;
  signal tmp_byte3  : std_logic_vector (7 downto 0) ;
  signal tmp_byte  : std_logic_vector (7 downto 0) ;
  signal di  : std_logic_vector (31 downto 0) ;
  signal icap_idone : std_ulogic := '0';
  signal csi_b_in : std_ulogic;
  signal done_o : std_logic;
  signal busy_o : std_ulogic;
  signal di_t : std_logic_vector (31 downto 0) ;
  signal clk_osc : std_ulogic := '0';
    
    begin


    WireDelay : block
    begin
      I_DELAY : for j in 0 to 31 generate
        VitalWireDelay (I_ipd(j),I(j),tipd_I(j));
      end generate I_DELAY;
      VitalWireDelay (CLK_ipd,CLK,tipd_CLK);
      VitalWireDelay (CSB_ipd,CSB,tipd_CSB);
      VitalWireDelay (RDWRB_ipd,RDWRB,tipd_RDWRB);
    end block;
    
    SignalDelay : block
    begin
      I_CLK_DELAY : for i in 31 downto 0 generate
        VitalSignalDelay (I_CLK_dly(i),I_ipd(i),tisd_I_CLK(i));
      end generate I_CLK_DELAY;
      VitalSignalDelay (CSB_CLK_dly,CSB_ipd,tisd_CSB_CLK);
      VitalSignalDelay (RDWRB_CLK_dly,RDWRB_ipd,tisd_RDWRB_CLK);

      VitalSignalDelay (CLK_dly,CLK_ipd,ticd_CLK);
    end block;


   init_tri <=  init_b;
   done_o <= 'H';
   di_t <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" when (icap_idone = '1' and RDWRB_CLK_dly = '1') else dix;
   csi_b_in <= CSB_CLK_dly;
   dix <= I_CLK_DLY when (icap_idone  =  '1') else di;
   BUSY_out <= busy_o when (icap_idone   =  '1') else '1';
   cs_b_t <= csi_b_in when (icap_idone  =  '1') else cs_bi;
   clk_in <= CLK_dly;
   rdwr_b_t <= RDWRB_CLK_dly when (icap_idone   =  '1') else rdwr_bi;
   O_out <= di_t when (icap_idone = '1' and RDWRB_CLK_dly = '1') else "00000000000000000000000000000000";

   process (CSB_CLK_dly, RDWRB_CLK_dly)
   begin
     if (NOW > 1 ps and icap_idone = '0') then
      assert FALSE report " Warning :  X_ICAP_VIRTEX6 has not finished initialization. A message will be printed after the initialization. User need start read/write operation after that." severity warning;
     end if;
   end process;
       
 process  begin
   wait for 1 ns;
   clk_osc <=  '1';
   wait for 1 ns;
   clk_osc <=  '0';
 end process;


  X_SIM_CONFIG_V6_INST : X_SIM_CONFIG_V6
  generic map (
      DEVICE_ID => DEVICE_ID,
      ICAP_SUPPORT => TRUE,
      ICAP_WIDTH => ICAP_WIDTH
    )
  port map (
      BUSY => busy_o,
      CSOB => cso_b,
      DONE => done_o,
      CCLK => clk_in,
      CSB => cs_b_t,
      D => di_t,
      INITB => init_tri,
      M => "110",
      PROGB => prog_b,
      RDWRB => rdwr_b_t
  );

  process
    file icap_fd : text;
    variable open_status : file_open_status;
    variable in_buf    : line;
    variable data_rbt_tmp : bit_vector(31 downto 0);
    variable data_rbt : std_logic_vector(31 downto 0);
    variable read_ok : boolean := false;
    variable tmp_byte0  : std_logic_vector (7 downto 0) ;
    variable tmp_byte1  : std_logic_vector (7 downto 0) ;
    variable tmp_byte2  : std_logic_vector (7 downto 0) ;
    variable tmp_byte3  : std_logic_vector (7 downto 0) ;
    variable tmp_byte  : std_logic_vector (7 downto 0) ;
    variable sim_file_flag : std_ulogic := '0';
  begin

   if((ICAP_WIDTH = "X8") or (ICAP_WIDTH = "x8")) then
      bw <= "0000";
    elsif((ICAP_WIDTH = "X16") or (ICAP_WIDTH= "x16")) then
      bw <= "0010";
    elsif((ICAP_WIDTH = "X32") or (ICAP_WIDTH= "x32")) then
      bw <= "0011";
    else
      assert FALSE report "Attribute Syntax Error : The Attribute ICAP_WIDTH is not X8, X16, X32." severity error;
      sim_file_flag := '1';
    end if;

    if (SIM_CFG_FILE_NAME  =  "NONE") then
--       assert FALSE report "Error : The configure rbt data file for X_ICAP_VIRTEX6 was not found. Use the SIM_CFG_FILE_NAME generic to pass the file name." severity error;
       sim_file_flag := '1';
    else
      file_open(open_status, icap_fd, SIM_CFG_FILE_NAME, read_mode);
      if (open_status /= open_ok) then
         assert false report " Error: The configure rbt data file %s for X_ICAP_VIRTEX6 was not found. Use the SIM_CFG_FILE_NAME generic to pass the file name." severity error;
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
      wait until falling_edge(clk_in);
      init_b <= '1';
      cs_bi <= '0';
    if (sim_file_flag  =  '0') then
      while (not endfile(icap_fd)) loop
         readline(icap_fd, in_buf);
         read(in_buf, data_rbt_tmp, read_ok);
         data_rbt := TO_STDLOGICVECTOR(data_rbt_tmp);
         if (done_o  =  '0') then
          tmp_byte(7 downto 0) := data_rbt(31 downto 24);
          tmp_byte3(7 downto 0) := bit_revers8(tmp_byte);
          tmp_byte(7 downto 0) := data_rbt(23 downto 16);
          tmp_byte2(7 downto 0) := bit_revers8(tmp_byte);
          tmp_byte(7 downto 0) := data_rbt(15 downto 8);
          tmp_byte1(7 downto 0) := bit_revers8(tmp_byte);
          tmp_byte(7 downto 0) := data_rbt(7 downto 0);
          tmp_byte0(7 downto 0) := bit_revers8(tmp_byte);
          if (bw = "0000") then
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte3);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte2);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte1);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte0);
           elsif (bw = "0010") then
              wait until falling_edge(clk_in);
              di <= ("0000000000000000" & tmp_byte3 & tmp_byte2);
              wait until falling_edge(clk_in);
              di <= ("0000000000000000" & tmp_byte1 & tmp_byte0);
           elsif (bw = "0011") then
              wait until falling_edge(clk_in);
              di <= (tmp_byte3 & tmp_byte2 &tmp_byte1 & tmp_byte0);
           end if;
         else
          if (icap_idone = '0') then
             wait until falling_edge(clk_in);
             di <= X"FFFFFFFF";
             wait until falling_edge(clk_in);
             wait until falling_edge(clk_in);
             wait until falling_edge(clk_in);
             wait until falling_edge(clk_in);
             wait until falling_edge(clk_in);
             icap_idone <= '1';
         assert FALSE report " Message :  X_ICAP_VIRTEX6 has finished initialization. User can start read/write operation." severity Note;
          end if;
        end if;
      end loop;
      file_close(icap_fd);
    else
              wait until falling_edge(clk_in);
              di <= X"FFFFFFFF";
              wait until falling_edge(clk_in);
              di <= X"FFFFFFFF";
              wait until falling_edge(clk_in);
              di <= X"FFFFFFFF";
              wait until falling_edge(clk_in);
              di <= X"FFFFFFFF";
              wait until falling_edge(clk_in);
              di <= X"FFFFFFFF";
              wait until falling_edge(clk_in);
              di <= X"FFFFFFFF";
              wait until falling_edge(clk_in);
              di <= X"FFFFFFFF";
              wait until falling_edge(clk_in);
              di <= X"FFFFFFFF";
              wait until falling_edge(clk_in);
              di <= X"FFFFFFFF";
          tmp_byte3(7 downto 0) := "00000000";
          tmp_byte2(7 downto 0) := "00000000";
          tmp_byte1(7 downto 0) := "00000000";
          tmp_byte0(7 downto 0) := bit_revers8("10111011");
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte3);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte2);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte1);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte0);
          if (bw = "0000") then
             wait until falling_edge(clk_in);
             di <= X"00000088";
           elsif (bw = "0010") then
              wait until falling_edge(clk_in);
              di <= X"00000044";
           elsif (bw = "0011") then
              wait until falling_edge(clk_in);
              di <= X"00000022";
           end if;
             wait until falling_edge(clk_in);
             di <= X"FFFFFFFF";
             wait until falling_edge(clk_in);
             di <= X"FFFFFFFF";
             wait until falling_edge(clk_in);
             di <= X"FFFFFFFF";
             wait until falling_edge(clk_in);
             di <= X"FFFFFFFF";
             wait until falling_edge(clk_in);
             di <= X"FFFFFFFF";
             wait until falling_edge(clk_in);
             di <= X"FFFFFFFF";
             wait until falling_edge(clk_in);
             di <= X"FFFFFFFF";
             wait until falling_edge(clk_in);
             di <= X"FFFFFFFF";
          tmp_byte3(7 downto 0) := bit_revers8("10101010");
          tmp_byte2(7 downto 0) := bit_revers8("10011001");
          tmp_byte1(7 downto 0) := bit_revers8("01010101");
          tmp_byte0(7 downto 0) := bit_revers8("01100110");
          if (bw = "0000") then
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte3);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte2);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte1);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte0);
           elsif (bw = "0010") then
              wait until falling_edge(clk_in);
              di <= ("0000000000000000" & tmp_byte3 & tmp_byte2);
              wait until falling_edge(clk_in);
              di <= ("0000000000000000" & tmp_byte1 & tmp_byte0);
           elsif (bw = "0011") then
              wait until falling_edge(clk_in);
              di <= (tmp_byte3 & tmp_byte2 &tmp_byte1 & tmp_byte0);
           end if;
          tmp_byte3(7 downto 0) := bit_revers8("00110000");
          tmp_byte2(7 downto 0) := bit_revers8("00000000");
          tmp_byte1(7 downto 0) := bit_revers8("10000000");
          tmp_byte0(7 downto 0) := bit_revers8("00000001");
          if (bw = "0000") then
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte3);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte2);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte1);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte0);
           elsif (bw = "0010") then
              wait until falling_edge(clk_in);
              di <= ("0000000000000000" & tmp_byte3 & tmp_byte2);
              wait until falling_edge(clk_in);
              di <= ("0000000000000000" & tmp_byte1 & tmp_byte0);
           elsif (bw = "0011") then
              wait until falling_edge(clk_in);
              di <= (tmp_byte3 & tmp_byte2 &tmp_byte1 & tmp_byte0);
           end if;
          tmp_byte3(7 downto 0) := "00000000";
          tmp_byte2(7 downto 0) := "00000000";
          tmp_byte1(7 downto 0) := "00000000";
          tmp_byte0(7 downto 0) := bit_revers8("00000101");
          if (bw = "0000") then
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte3);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte2);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte1);
             wait until falling_edge(clk_in);
             di <= ("000000000000000000000000" & tmp_byte0);
           elsif (bw = "0010") then
              wait until falling_edge(clk_in);
              di <= ("0000000000000000" & tmp_byte3 & tmp_byte2);
              wait until falling_edge(clk_in);
              di <= ("0000000000000000" & tmp_byte1 & tmp_byte0);
           elsif (bw = "0011") then
              wait until falling_edge(clk_in);
              di <= (tmp_byte3 & tmp_byte2 &tmp_byte1 & tmp_byte0);
           end if;
      wait until falling_edge(clk_in);
      wait until falling_edge(clk_in);
      wait until falling_edge(clk_in);
      wait until falling_edge(clk_in);
      wait until falling_edge(clk_in);
      wait until falling_edge(clk_in);
       if (icap_idone = '0') then
          icap_idone <= '1';
      assert FALSE report " Message :  X_ICAP_VIRTEX6 has finished initialization. User can start read/write operation." severity warning;
       end if;
    end if;
      wait;
  end process;


  TIMING : process
    variable Tmkr_CSB_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_I_CLK_posedge : VitalTimingDataArrayType(31 downto 0);
    variable Tmkr_RDWRB_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_CSB_CLK_posedge :  std_ulogic := '0';
    variable Tviol_I_CLK_posedge : std_logic_vector(31 downto 0) := (others => '0');
    variable Tviol_RDWRB_CLK_posedge :  std_ulogic := '0';
    variable BUSY_GlitchData : VitalGlitchDataType;
    variable O0_GlitchData : VitalGlitchDataType;
    variable O10_GlitchData : VitalGlitchDataType;
    variable O11_GlitchData : VitalGlitchDataType;
    variable O12_GlitchData : VitalGlitchDataType;
    variable O13_GlitchData : VitalGlitchDataType;
    variable O14_GlitchData : VitalGlitchDataType;
    variable O15_GlitchData : VitalGlitchDataType;
    variable O16_GlitchData : VitalGlitchDataType;
    variable O17_GlitchData : VitalGlitchDataType;
    variable O18_GlitchData : VitalGlitchDataType;
    variable O19_GlitchData : VitalGlitchDataType;
    variable O1_GlitchData : VitalGlitchDataType;
    variable O20_GlitchData : VitalGlitchDataType;
    variable O21_GlitchData : VitalGlitchDataType;
    variable O22_GlitchData : VitalGlitchDataType;
    variable O23_GlitchData : VitalGlitchDataType;
    variable O24_GlitchData : VitalGlitchDataType;
    variable O25_GlitchData : VitalGlitchDataType;
    variable O26_GlitchData : VitalGlitchDataType;
    variable O27_GlitchData : VitalGlitchDataType;
    variable O28_GlitchData : VitalGlitchDataType;
    variable O29_GlitchData : VitalGlitchDataType;
    variable O2_GlitchData : VitalGlitchDataType;
    variable O30_GlitchData : VitalGlitchDataType;
    variable O31_GlitchData : VitalGlitchDataType;
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
        Violation => Tviol_CSB_CLK_posedge,
        TimingData => Tmkr_CSB_CLK_posedge,
        TestSignal => CSB_CLK_dly,
        TestSignalName => "CSB",
        TestDelay => tisd_CSB_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_CSB_CLK_posedge_posedge,
        HoldHigh => thold_CSB_CLK_posedge_posedge,
        SetupLow => tsetup_CSB_CLK_negedge_posedge,
        HoldLow => thold_CSB_CLK_negedge_posedge,
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(16),
        TimingData => Tmkr_I_CLK_posedge(16),
        TestSignal => I_CLK_dly(16),
        TestSignalName => "I(16)",
        TestDelay => tisd_I_CLK(16),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(16),
        HoldHigh => thold_I_CLK_posedge_posedge(16),
        SetupLow => tsetup_I_CLK_negedge_posedge(16),
        HoldLow => thold_I_CLK_negedge_posedge(16),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(17),
        TimingData => Tmkr_I_CLK_posedge(17),
        TestSignal => I_CLK_dly(17),
        TestSignalName => "I(17)",
        TestDelay => tisd_I_CLK(17),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(17),
        HoldHigh => thold_I_CLK_posedge_posedge(17),
        SetupLow => tsetup_I_CLK_negedge_posedge(17),
        HoldLow => thold_I_CLK_negedge_posedge(17),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(18),
        TimingData => Tmkr_I_CLK_posedge(18),
        TestSignal => I_CLK_dly(18),
        TestSignalName => "I(18)",
        TestDelay => tisd_I_CLK(18),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(18),
        HoldHigh => thold_I_CLK_posedge_posedge(18),
        SetupLow => tsetup_I_CLK_negedge_posedge(18),
        HoldLow => thold_I_CLK_negedge_posedge(18),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(19),
        TimingData => Tmkr_I_CLK_posedge(19),
        TestSignal => I_CLK_dly(19),
        TestSignalName => "I(19)",
        TestDelay => tisd_I_CLK(19),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(19),
        HoldHigh => thold_I_CLK_posedge_posedge(19),
        SetupLow => tsetup_I_CLK_negedge_posedge(19),
        HoldLow => thold_I_CLK_negedge_posedge(19),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(20),
        TimingData => Tmkr_I_CLK_posedge(20),
        TestSignal => I_CLK_dly(20),
        TestSignalName => "I(20)",
        TestDelay => tisd_I_CLK(20),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(20),
        HoldHigh => thold_I_CLK_posedge_posedge(20),
        SetupLow => tsetup_I_CLK_negedge_posedge(20),
        HoldLow => thold_I_CLK_negedge_posedge(20),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(21),
        TimingData => Tmkr_I_CLK_posedge(21),
        TestSignal => I_CLK_dly(21),
        TestSignalName => "I(21)",
        TestDelay => tisd_I_CLK(21),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(21),
        HoldHigh => thold_I_CLK_posedge_posedge(21),
        SetupLow => tsetup_I_CLK_negedge_posedge(21),
        HoldLow => thold_I_CLK_negedge_posedge(21),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(22),
        TimingData => Tmkr_I_CLK_posedge(22),
        TestSignal => I_CLK_dly(22),
        TestSignalName => "I(22)",
        TestDelay => tisd_I_CLK(22),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(22),
        HoldHigh => thold_I_CLK_posedge_posedge(22),
        SetupLow => tsetup_I_CLK_negedge_posedge(22),
        HoldLow => thold_I_CLK_negedge_posedge(22),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(23),
        TimingData => Tmkr_I_CLK_posedge(23),
        TestSignal => I_CLK_dly(23),
        TestSignalName => "I(23)",
        TestDelay => tisd_I_CLK(23),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(23),
        HoldHigh => thold_I_CLK_posedge_posedge(23),
        SetupLow => tsetup_I_CLK_negedge_posedge(23),
        HoldLow => thold_I_CLK_negedge_posedge(23),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(24),
        TimingData => Tmkr_I_CLK_posedge(24),
        TestSignal => I_CLK_dly(24),
        TestSignalName => "I(24)",
        TestDelay => tisd_I_CLK(24),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(24),
        HoldHigh => thold_I_CLK_posedge_posedge(24),
        SetupLow => tsetup_I_CLK_negedge_posedge(24),
        HoldLow => thold_I_CLK_negedge_posedge(24),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(25),
        TimingData => Tmkr_I_CLK_posedge(25),
        TestSignal => I_CLK_dly(25),
        TestSignalName => "I(25)",
        TestDelay => tisd_I_CLK(25),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(25),
        HoldHigh => thold_I_CLK_posedge_posedge(25),
        SetupLow => tsetup_I_CLK_negedge_posedge(25),
        HoldLow => thold_I_CLK_negedge_posedge(25),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(26),
        TimingData => Tmkr_I_CLK_posedge(26),
        TestSignal => I_CLK_dly(26),
        TestSignalName => "I(26)",
        TestDelay => tisd_I_CLK(26),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(26),
        HoldHigh => thold_I_CLK_posedge_posedge(26),
        SetupLow => tsetup_I_CLK_negedge_posedge(26),
        HoldLow => thold_I_CLK_negedge_posedge(26),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(27),
        TimingData => Tmkr_I_CLK_posedge(27),
        TestSignal => I_CLK_dly(27),
        TestSignalName => "I(27)",
        TestDelay => tisd_I_CLK(27),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(27),
        HoldHigh => thold_I_CLK_posedge_posedge(27),
        SetupLow => tsetup_I_CLK_negedge_posedge(27),
        HoldLow => thold_I_CLK_negedge_posedge(27),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(28),
        TimingData => Tmkr_I_CLK_posedge(28),
        TestSignal => I_CLK_dly(28),
        TestSignalName => "I(28)",
        TestDelay => tisd_I_CLK(28),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(28),
        HoldHigh => thold_I_CLK_posedge_posedge(28),
        SetupLow => tsetup_I_CLK_negedge_posedge(28),
        HoldLow => thold_I_CLK_negedge_posedge(28),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(29),
        TimingData => Tmkr_I_CLK_posedge(29),
        TestSignal => I_CLK_dly(29),
        TestSignalName => "I(29)",
        TestDelay => tisd_I_CLK(29),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(29),
        HoldHigh => thold_I_CLK_posedge_posedge(29),
        SetupLow => tsetup_I_CLK_negedge_posedge(29),
        HoldLow => thold_I_CLK_negedge_posedge(29),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(30),
        TimingData => Tmkr_I_CLK_posedge(30),
        TestSignal => I_CLK_dly(30),
        TestSignalName => "I(30)",
        TestDelay => tisd_I_CLK(30),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(30),
        HoldHigh => thold_I_CLK_posedge_posedge(30),
        SetupLow => tsetup_I_CLK_negedge_posedge(30),
        HoldLow => thold_I_CLK_negedge_posedge(30),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_I_CLK_posedge(31),
        TimingData => Tmkr_I_CLK_posedge(31),
        TestSignal => I_CLK_dly(31),
        TestSignalName => "I(31)",
        TestDelay => tisd_I_CLK(31),
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_I_CLK_posedge_posedge(31),
        HoldHigh => thold_I_CLK_posedge_posedge(31),
        SetupLow => tsetup_I_CLK_negedge_posedge(31),
        HoldLow => thold_I_CLK_negedge_posedge(31),
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
      VitalSetupHoldCheck
      (
        Violation => Tviol_RDWRB_CLK_posedge,
        TimingData => Tmkr_RDWRB_CLK_posedge,
        TestSignal => RDWRB_CLK_dly,
        TestSignalName => "RDWRB",
        TestDelay => tisd_RDWRB_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_RDWRB_CLK_posedge_posedge,
        HoldHigh => thold_RDWRB_CLK_posedge_posedge,
        SetupLow => tsetup_RDWRB_CLK_negedge_posedge,
        HoldLow => thold_RDWRB_CLK_negedge_posedge,
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
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
        OutSignal     => O(16),
        GlitchData    => O16_GlitchData,
        OutSignalName => "O(16)",
        OutTemp       => O_out(16),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(16),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(17),
        GlitchData    => O17_GlitchData,
        OutSignalName => "O(17)",
        OutTemp       => O_out(17),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(17),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(18),
        GlitchData    => O18_GlitchData,
        OutSignalName => "O(18)",
        OutTemp       => O_out(18),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(18),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(19),
        GlitchData    => O19_GlitchData,
        OutSignalName => "O(19)",
        OutTemp       => O_out(19),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(19),TRUE)),
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
        OutSignal     => O(20),
        GlitchData    => O20_GlitchData,
        OutSignalName => "O(20)",
        OutTemp       => O_out(20),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(20),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(21),
        GlitchData    => O21_GlitchData,
        OutSignalName => "O(21)",
        OutTemp       => O_out(21),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(21),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(22),
        GlitchData    => O22_GlitchData,
        OutSignalName => "O(22)",
        OutTemp       => O_out(22),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(22),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(23),
        GlitchData    => O23_GlitchData,
        OutSignalName => "O(23)",
        OutTemp       => O_out(23),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(23),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(24),
        GlitchData    => O24_GlitchData,
        OutSignalName => "O(24)",
        OutTemp       => O_out(24),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(24),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(25),
        GlitchData    => O25_GlitchData,
        OutSignalName => "O(25)",
        OutTemp       => O_out(25),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(25),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(26),
        GlitchData    => O26_GlitchData,
        OutSignalName => "O(26)",
        OutTemp       => O_out(26),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(26),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(27),
        GlitchData    => O27_GlitchData,
        OutSignalName => "O(27)",
        OutTemp       => O_out(27),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(27),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(28),
        GlitchData    => O28_GlitchData,
        OutSignalName => "O(28)",
        OutTemp       => O_out(28),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(28),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(29),
        GlitchData    => O29_GlitchData,
        OutSignalName => "O(29)",
        OutTemp       => O_out(29),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(29),TRUE)),
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
        OutSignal     => O(30),
        GlitchData    => O30_GlitchData,
        OutSignalName => "O(30)",
        OutTemp       => O_out(30),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(30),TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPathDelay01
      (
        OutSignal     => O(31),
        GlitchData    => O31_GlitchData,
        OutSignalName => "O(31)",
        OutTemp       => O_out(31),
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_O(31),TRUE)),
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
        HeaderMsg      => InstancePath & "/X_ICAP_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
    wait on
      BUSY_out,
      O_out,
      CSB_CLK_dly,
      I_CLK_dly,
      CLK_dly,
      RDWRB_CLK_dly;
  end process TIMING;

end X_ICAP_VIRTEX6_V;
