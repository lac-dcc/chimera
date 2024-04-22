-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Source Synchronous Output Serializer
-- /___/   /\     Filename : X_OSERDES.vhd
-- \   \  /  \    Timestamp : Fri Mar 26 08:18:21 PST 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    01/23/06 - 223369 fixed Vital delays from CLK to OQ
--    05/29/06 - CR 232324 -- Added timing checks for REV/SR wrt negedge CLKDIV
--    08/08/06 - CR 225414 -- Added 100 ps delay to data inputs to resolve
--               race condition when data/clk change at the same time.
--    08/21/06 - CR 210819 -- Updated Timing
--    01/08/08 - CR 458156 -- enabled TRISTATE_WIDTH to be 1 in DDR mode. 
--    04/07/08 - CR 469973 -- Header Description fix
--    08/04/08 - CR 472154 Removed Vital GSR constructs
--    04/23/09 - CR 516748 simprim only fix
--    06/01/09 - CR 523601 simprim only (timing) fix for Tristate Output
-- End Revision

----- CELL X_OSERDES -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_PLG is

  generic(

         SRTYPE			: string;

         INIT_LOADCNT		: bit_vector(3 downto 0);

         TimingChecksOn		: boolean	:= true;
         InstancePath		: string	:= "*";
         Xon			: boolean	:= true;
         MsgOn			: boolean	:= false;

--  VITAL input Pin path delay variables

      tipd_CLK		: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_CLKDIV	: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_C23		: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_C45		: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_C67		: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_RST		: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_SEL		: VitalDelayArrayType01(1 downto 0)  := (others => (0.0 ns, 0.0 ns));

--  VITAL clk-to-output path delay variables

--  VITAL async rest-to-output path delay variables

--  VITAL async set-to-output path delay variables

--  VITAL GSR-to-output path delay variable


--  VITAL ticd & tisd variables
      ticd_CLKDIV	: VitalDelayType := 0.000 ns;
      ticd_CLK		: VitalDelayType := 0.000 ns;

      tisd_C23_CLK	: VitalDelayType := 0.000 ns;
      tisd_C45_CLK	: VitalDelayType := 0.000 ns;
      tisd_C67_CLK	: VitalDelayType := 0.000 ns;
      tisd_RST_CLK	: VitalDelayType := 0.000 ns;
      tisd_SEL_CLK	: VitalDelayArrayType(1 downto 0) :=  (others => 0.000 ns);

--  VITAL Setup/Hold delay variables
--      thold_CE_C_posedge_posedge  : VitalDelayType := 0.000 ns;
--      thold_CE_C_negedge_posedge  : VitalDelayType := 0.000 ns;

-- VITAL pulse width variables
      tpw_CLK_posedge	: VitalDelayType := 0.0 ns;
      tpw_RST_posedge	: VitalDelayType := 0.0 ns;

-- VITAL period variables
      tperiod_CLK_posedge	: VitalDelayType := 0.0 ns;

-- VITAL recovery time variables
      trecovery_RST_CLK_negedge_posedge   : VitalDelayType := 0.0 ns;

-- VITAL removal time variables
      tremoval_RST_CLK_negedge_posedge    : VitalDelayType := 0.0 ns
      );

  port(
      LOAD		: out std_ulogic;

      C23		: in std_ulogic;
      C45		: in std_ulogic;
      C67		: in std_ulogic;
      CLK		: in std_ulogic;
      CLKDIV		: in std_ulogic;
      GSR		: in std_ulogic;
      RST		: in std_ulogic;
      SEL		: in std_logic_vector (1 downto 0)
    );

  attribute VITAL_LEVEL0 of
    X_PLG : entity is true;

end X_PLG;

architecture X_PLG_V OF X_PLG is

--  attribute VITAL_LEVEL0 of
--    X_PLG_V : architecture is true;


  constant DELAY_FFDCNT		: time       := 1 ps;
  constant DELAY_MXDCNT		: time       := 1 ps;
-- CR 516748
-- constant DELAY_FFRST		: time       := 145 ps;
  constant DELAY_FFRST		: time       := 45 ps;

  constant MSB_SEL		: integer    := 1;

  signal CLK_ipd                : std_ulogic := 'X';
  signal CLKDIV_ipd             : std_ulogic := 'X';
  signal C23_ipd                : std_ulogic := 'X';
  signal C45_ipd                : std_ulogic := 'X';
  signal C67_ipd                : std_ulogic := 'X';
  signal GSR_ipd                : std_ulogic := 'X';
  signal RST_ipd                : std_ulogic := 'X';
  signal SEL_ipd                : std_logic_vector(1 downto 0) := (others => 'X');

  signal CLK_dly                : std_ulogic := 'X';
  signal CLKDIV_dly             : std_ulogic := 'X';
  signal C23_dly                : std_ulogic := 'X';
  signal C45_dly                : std_ulogic := 'X';
  signal C67_dly                : std_ulogic := 'X';
  signal GSR_dly                : std_ulogic := '0';
  signal RST_dly                : std_ulogic := 'X';
  signal SEL_dly                : std_logic_vector(1 downto 0) := (others => 'X');

  signal q0			: std_ulogic := 'X';
  signal q1			: std_ulogic := 'X';
  signal q2			: std_ulogic := 'X';
  signal q3			: std_ulogic := 'X';

  signal qhr			: std_ulogic := 'X';
  signal qlr			: std_ulogic := 'X';

  signal mux			: std_ulogic := 'X';

  signal load_zd		: std_ulogic := 'X';

  signal AttrSRtype		: std_ulogic := 'X';

begin

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin

    VitalWireDelay (CLK_ipd,      CLK,      tipd_CLK);
    VitalWireDelay (CLKDIV_ipd,   CLKDIV,   tipd_CLKDIV);
    VitalWireDelay (C23_ipd,      C23,      tipd_C23);
    VitalWireDelay (C45_ipd,      C45,      tipd_C45);
    VitalWireDelay (C67_ipd,      C67,      tipd_C67);
    VitalWireDelay (RST_ipd,      RST,      tipd_RST);
    
    SEL_DELAY: for i in MSB_SEL downto 0 generate
       VitalWireDelay (SEL_ipd(i), SEL(i),      tipd_SEL(i));
    end generate SEL_DELAY;

  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CLKDIV_dly,   CLKDIV_ipd,   ticd_CLKDIV);
    VitalSignalDelay (CLK_dly,      CLK_ipd,      ticd_CLK);
    VitalSignalDelay (C23_dly,      C23_ipd,      tisd_C23_CLK);
    VitalSignalDelay (C45_dly,      C45_ipd,      tisd_C45_CLK);
    VitalSignalDelay (C67_dly,      C67_ipd,      tisd_C67_CLK);
    VitalSignalDelay (RST_dly,      RST_ipd,      tisd_RST_CLK);

    SEL_DELAY: for i in MSB_SEL downto 0 generate
       VitalSignalDelay (SEL_dly(i),      SEL_ipd(i),      tisd_SEL_CLK(i));
    end generate SEL_DELAY;

  end block;

  GSR_dly <= GSR;


  --------------------
  --  BEHAVIOR SECTION
  --------------------



--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process
  begin
     if((SRTYPE = "ASYNC") or (SRTYPE = "async")) then
        AttrSRtype <= '1';
     elsif((SRTYPE = "SYNC") or (SRTYPE = "sync")) then
        AttrSRtype <= '0';
     end if;

     wait;
  end process prcs_init;
--####################################################################
--#####                          Counter                         #####
--####################################################################
  prcs_ff_cntr:process(qhr, CLK, GSR)
  variable q3_var		:  std_ulogic := TO_X01(INIT_LOADCNT(3));
  variable q2_var		:  std_ulogic := TO_X01(INIT_LOADCNT(2));
  variable q1_var		:  std_ulogic := TO_X01(INIT_LOADCNT(1));
  variable q0_var		:  std_ulogic := TO_X01(INIT_LOADCNT(0));
  begin
     if(GSR = '1') then
         q3_var		:= TO_X01(INIT_LOADCNT(3));
         q2_var		:= TO_X01(INIT_LOADCNT(2));
         q1_var		:= TO_X01(INIT_LOADCNT(1));
         q0_var		:= TO_X01(INIT_LOADCNT(0));
     elsif(GSR = '0') then
        case AttrSRtype is
           when '1' => 
           --------------- // async SET/RESET
                   if(qhr = '1') then
                      q0_var := '0';
                      q1_var := '0';
                      q2_var := '0';
                      q3_var := '0';
                   else
                      if(rising_edge(CLK)) then
                         q3_var := q2_var;
                         q2_var :=( NOT((NOT q0_var) and (NOT q2_var)) and q1_var);
                         q1_var := q0_var;
                         q0_var := mux;
                      end if;
                   end if;

           when '0' => 
           --------------- // sync SET/RESET
                   if(rising_edge(CLK)) then
                      if(qhr = '1') then
                         q0_var := '0';
                         q1_var := '0';
                         q2_var := '0';
                         q3_var := '0';
                      else
                         q3_var := q2_var;
                         q2_var :=( NOT((NOT q0_var) and (NOT q2_var)) and q1_var);
                         q1_var := q0_var;
                         q0_var := mux;
                      end if;
                   end if;

           when others => 
                   null;
           end case;

           q0 <= q0_var after DELAY_FFDCNT;
           q1 <= q1_var after DELAY_FFDCNT;
           q2 <= q2_var after DELAY_FFDCNT;
           q3 <= q3_var after DELAY_FFDCNT;

     end if;
  end process prcs_ff_cntr;
--####################################################################
--#####                     mux signal                           #####
--####################################################################
  prcs_mux_sel:process(sel, c23, c45, c67, q0, q1, q2, q3)
  begin
    case sel is
        when "00" =>
              mux <=  ((not q0) and  (not(c23 and q1))) after DELAY_MXDCNT;
        when "01" =>
              mux <=  ((not q1) and  (not(c45 and q2))) after DELAY_MXDCNT;
        when "10" =>
              mux <=  ((not q2) and  (not(c67 and q3))) after DELAY_MXDCNT;
        when "11" =>
              mux <=  (not (q3)) after DELAY_MXDCNT;
        when others =>
              mux <=  '0' after DELAY_MXDCNT;
    end case;
  end process prcs_mux_sel;
--####################################################################
--#####                    load signal                           #####
--####################################################################
  prcs_load_sel:process(sel, c23, c45, c67, q0, q1, q2, q3)
  begin
    case sel is
        when "00" =>
              load_zd <=  q0 after DELAY_MXDCNT;
        when "01" =>
              load_zd <=  (q0 and q1) after DELAY_MXDCNT;
        when "10" =>
              load_zd <=  (q0 and q2) after DELAY_MXDCNT;
        when "11" =>
              load_zd <=  (q0 and q3) after DELAY_MXDCNT;
        when others =>
              load_zd <=  '0' after DELAY_MXDCNT;
    end case;
  end process prcs_load_sel;
--####################################################################
--#####                 Low/High speed  FFs                      #####
--####################################################################
  prcs_lowspeed:process(clkdiv, rst)
  begin
      case AttrSRtype is
          when '1' => 
           --------------- // async SET/RESET
               if(rst = '1') then
                  qlr        <= '1' after DELAY_FFRST;
               else 
                  if(rising_edge(clkdiv)) then
                     qlr      <= '0' after DELAY_FFRST;
                  end if;
               end if;

          when '0' => 
           --------------- // sync SET/RESET
               if(rising_edge(clkdiv)) then
                  if(rst = '1') then
                     qlr      <= '1' after DELAY_FFRST;
                  else 
                     qlr      <= '0' after DELAY_FFRST;
                  end if;
               end if;
          when others => 
                  null;
      end case;
  end process  prcs_lowspeed;
----------------------------------------------------------------------
  prcs_highspeed:process(clk, rst)
  begin
      case AttrSRtype is
          when '1' => 
           --------------- // async SET/RESET
               if(rst = '1') then
                  qhr <= '1' after DELAY_FFDCNT;
               else 
                  if(rising_edge(clk)) then
                     qhr <= qlr after DELAY_FFDCNT;
                  end if;
               end if;

          when '0' => 
           --------------- // sync SET/RESET
               if(rising_edge(clk)) then
                  if(rst = '1') then
                     qhr <= '1' after DELAY_FFDCNT;
                  else 
                     qhr <= qlr after DELAY_FFDCNT;
                  end if;
               end if;
          when others => 
                  null;
      end case;
  end process  prcs_highspeed;


--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_output:process(load_zd)
  begin
      load <= load_zd;
  end process prcs_output;



end X_PLG_V;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.vcomponents.all;

entity X_IOOUT is

  generic(

         SERDES			: boolean	:= TRUE;
         SERDES_MODE		: string	:= "MASTER";
         DATA_RATE_OQ		: string	:= "DDR";
         DATA_WIDTH		: integer	:= 4;
         DDR_CLK_EDGE		: string	:= "SAME_EDGE";
         INIT_OQ		: bit		:= '0';
         SRVAL_OQ		: bit		:= '1';
         INIT_ORANK1		: bit_vector(5 downto 0) := "000000";
         INIT_ORANK2_PARTIAL	: bit_vector(3 downto 0) := "0000";
         INIT_LOADCNT		: bit_vector(3 downto 0) := "0000";

         SRTYPE			: string	:= "ASYNC";

         TimingChecksOn		: boolean	:= true;
         InstancePath		: string	:= "*";
         Xon			: boolean	:= true;
         MsgOn			: boolean	:= false;

--  VITAL input Pin path delay variables
      tipd_C			: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_CLKDIV		: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_D1			: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_D2			: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_D3			: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_D4			: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_D5			: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_D6			: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_OCE			: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_REV			: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_SR			: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_SHIFTIN1		: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_SHIFTIN2		: VitalDelayType01 := (0.0 ns, 0.0 ns);

--  VITAL clk-to-output path delay variables
      tpd_C_OQ			: VitalDelayType01 := (0.0 ns, 0.0 ns);
      tpd_CLKDIV_OQ		: VitalDelayType01 := (0.0 ns, 0.0 ns);

--  VITAL async rest-to-output path delay variables
      tpd_REV_OQ		: VitalDelayType01 := (0.0 ns, 0.0 ns);

--  VITAL async set-to-output path delay variables
      tpd_SR_OQ			: VitalDelayType01 := (0.0 ns, 0.0 ns);



--  VITAL ticd & tisd variables
      ticd_CLKDIV		: VitalDelayType := 0.000 ns;
      ticd_C			: VitalDelayType := 0.000 ns;

      tisd_D1_CLKDIV		: VitalDelayType := 0.000 ns;
      tisd_D2_CLKDIV		: VitalDelayType := 0.000 ns;
      tisd_D3_CLKDIV		: VitalDelayType := 0.000 ns;
      tisd_D4_CLKDIV		: VitalDelayType := 0.000 ns;
      tisd_D5_CLKDIV		: VitalDelayType := 0.000 ns;
      tisd_D6_CLKDIV		: VitalDelayType := 0.000 ns;
      tisd_OCE_CLKDIV		: VitalDelayType := 0.000 ns;
      tisd_REV_CLKDIV		: VitalDelayType := 0.000 ns;
      tisd_SR_CLKDIV		: VitalDelayType := 0.000 ns;
      tisd_SHIFTIN1_CLKDIV	: VitalDelayType := 0.000 ns;
      tisd_SHIFTIN2_CLKDIV	: VitalDelayType := 0.000 ns;

--  VITAL Setup/Hold delay variables
--      thold_CE_C_posedge_posedge  : VitalDelayType := 0.000 ns;
--      thold_CE_C_negedge_posedge  : VitalDelayType := 0.000 ns;

-- VITAL pulse width variables
      tpw_C_posedge	: VitalDelayType := 0.0 ns;
      tpw_REV_posedge	: VitalDelayType := 0.0 ns;
      tpw_SR_posedge	: VitalDelayType := 0.0 ns;

-- VITAL period variables
      tperiod_C_posedge	: VitalDelayType := 0.0 ns;

-- VITAL recovery time variables
      trecovery_REV_C_negedge_posedge : VitalDelayType := 0.0 ns;
      trecovery_SR_C_negedge_posedge  : VitalDelayType := 0.0 ns;

-- VITAL removal time variables
      tremoval_REV_C_negedge_posedge  : VitalDelayType := 0.0 ns;
      tremoval_SR_C_negedge_posedge   : VitalDelayType := 0.0 ns
      );

  port(
      OQ		: out std_ulogic;
      LOAD		: out std_ulogic;
      SHIFTOUT1		: out std_ulogic;
      SHIFTOUT2		: out std_ulogic;

      C			: in std_ulogic;
      CLKDIV		: in std_ulogic;
      D1		: in std_ulogic;
      D2		: in std_ulogic;
      D3		: in std_ulogic;
      D4		: in std_ulogic;
      D5		: in std_ulogic;
      D6		: in std_ulogic;
      GSR		: in std_ulogic;
      OCE		: in std_ulogic;
      REV	        : in std_ulogic;
      SR	        : in std_ulogic;
      SHIFTIN1		: in std_ulogic;
      SHIFTIN2		: in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_IOOUT : entity is true;

end X_IOOUT;

architecture X_IOOUT_V OF X_IOOUT is

--  attribute VITAL_LEVEL0 of
--    X_IOOUT_V : architecture is true;

component X_PLG
  generic(
      SRTYPE            : string;
      INIT_LOADCNT      : bit_vector(3 downto 0)
      );
  port(
      LOAD              : out std_ulogic;

      C23               : in std_ulogic;
      C45               : in std_ulogic;
      C67               : in std_ulogic;
      CLK               : in std_ulogic;
      CLKDIV            : in std_ulogic;
      GSR               : in std_ulogic;
      RST               : in std_ulogic;
      SEL               : in std_logic_vector (1 downto 0)
      );

end component;

  constant DELAY_FFD            : time       := 1 ps; 
  constant DELAY_FFCD           : time       := 1 ps; 
  constant DELAY_MXD	        : time       := 1 ps;
  constant DELAY_MXR1	        : time       := 1 ps;

  constant SWALLOW_PULSE        : time       := 2 ps;

  constant MAX_DATAWIDTH	: integer    := 4;

  signal C_ipd		        : std_ulogic := 'X';
  signal CLKDIV_ipd		: std_ulogic := 'X';
  signal D1_ipd			: std_ulogic := 'X';
  signal D2_ipd			: std_ulogic := 'X';
  signal D3_ipd			: std_ulogic := 'X';
  signal D4_ipd			: std_ulogic := 'X';
  signal D5_ipd			: std_ulogic := 'X';
  signal D6_ipd			: std_ulogic := 'X';
  signal GSR_ipd		: std_ulogic := 'X';
  signal OCE_ipd	        : std_ulogic := 'X';
  signal REV_ipd	        : std_ulogic := 'X';
  signal SR_ipd		        : std_ulogic := 'X';
  signal SHIFTIN1_ipd		: std_ulogic := 'X';
  signal SHIFTIN2_ipd		: std_ulogic := 'X';

  signal C_dly	                : std_ulogic := 'X';
  signal CLKDIV_dly		: std_ulogic := 'X';
  signal D1_dly			: std_ulogic := 'X';
  signal D2_dly			: std_ulogic := 'X';
  signal D3_dly			: std_ulogic := 'X';
  signal D4_dly			: std_ulogic := 'X';
  signal D5_dly			: std_ulogic := 'X';
  signal D6_dly			: std_ulogic := 'X';
  signal GSR_dly		: std_ulogic := '0';
  signal OCE_dly	        : std_ulogic := 'X';
  signal REV_dly	        : std_ulogic := 'X';
  signal SR_dly		        : std_ulogic := 'X';
  signal SHIFTIN1_dly		: std_ulogic := 'X';
  signal SHIFTIN2_dly		: std_ulogic := 'X';

  signal OQ_zd			: std_ulogic := TO_X01(INIT_OQ);
  signal LOAD_zd		: std_ulogic := 'X';
  signal SHIFTOUT1_zd		: std_ulogic := 'X';
  signal SHIFTOUT2_zd		: std_ulogic := 'X';

  signal AttrDataRateOQ		: std_ulogic := 'X';
  signal AttrDataRateTQ		: std_logic_vector(1 downto 0) := (others => 'X');
  signal AttrDataWidth		: std_logic_vector(3 downto 0) := (others => 'X');
  signal AttrTriStateWidth	: std_logic_vector(1 downto 0) := (others => 'X');
  signal AttrMode		: std_ulogic := 'X';
  signal AttrDdrClkEdge		: std_ulogic := 'X';

  signal AttrSRtype		: std_logic_vector(5 downto 0) := (others => '1');

  signal AttrSerdes		: std_ulogic := 'X';

  signal d1r			: std_ulogic := 'X';
  signal d2r			: std_ulogic := 'X';
  signal d3r			: std_ulogic := 'X';
  signal d4r			: std_ulogic := 'X';
  signal d5r			: std_ulogic := 'X';
  signal d6r			: std_ulogic := 'X';

  signal d1rnk2			: std_ulogic := 'X';
  signal d2rnk2			: std_ulogic := 'X';
  signal d2nrnk2		: std_ulogic := 'X';
  signal d3rnk2			: std_ulogic := 'X';
  signal d4rnk2			: std_ulogic := 'X';
  signal d5rnk2			: std_ulogic := 'X';
  signal d6rnk2			: std_ulogic := 'X';

  signal data1			: std_ulogic := 'X';
  signal data2			: std_ulogic := 'X';
  signal data3			: std_ulogic := 'X';
  signal data4			: std_ulogic := 'X';
  signal data5			: std_ulogic := 'X';
  signal data6			: std_ulogic := 'X';

  signal ddr_data		: std_ulogic := 'X';
  signal odata_edge		: std_ulogic := 'X';
  signal sdata_edge		: std_ulogic := 'X';

  signal c23			: std_ulogic := 'X';
  signal c45			: std_ulogic := 'X';
  signal c67			: std_ulogic := 'X';

  signal sel			: std_logic_vector(1 downto 0) := (others => 'X');

  signal C2p			: std_ulogic := 'X';
  signal C3			: std_ulogic := 'X';

  signal loadint		: std_ulogic := 'X';

  signal seloq			: std_logic_vector(3 downto 0) := (others => 'X');

  signal oqsr			: std_ulogic := 'X';

  signal oqrev			: std_ulogic := 'X';

  signal sel1_4			: std_logic_vector(2 downto 0) := (others => 'X');
  signal sel5_6			: std_logic_vector(3 downto 0) := (others => 'X');

  signal plgcnt			: std_logic_vector(4 downto 0) := (others => 'X');

begin

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (C_ipd,        C,        tipd_C);
    VitalWireDelay (CLKDIV_ipd,   CLKDIV,   tipd_CLKDIV);
    VitalWireDelay (D1_ipd,       D1,       tipd_D1);
    VitalWireDelay (D2_ipd,       D2,       tipd_D2);
    VitalWireDelay (D3_ipd,       D3,       tipd_D3);
    VitalWireDelay (D4_ipd,       D4,       tipd_D4);
    VitalWireDelay (D5_ipd,       D5,       tipd_D5);
    VitalWireDelay (D6_ipd,       D6,       tipd_D6);
    VitalWireDelay (OCE_ipd,      OCE,      tipd_OCE);
    VitalWireDelay (REV_ipd,      REV,      tipd_REV);
    VitalWireDelay (SR_ipd,       SR,       tipd_SR);
    VitalWireDelay (SHIFTIN1_ipd, SHIFTIN1, tipd_SHIFTIN1);
    VitalWireDelay (SHIFTIN2_ipd, SHIFTIN2, tipd_SHIFTIN2);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CLKDIV_dly,   CLKDIV_ipd,   ticd_CLKDIV);
    VitalSignalDelay (C_dly,       C_ipd,      ticd_C);
    VitalSignalDelay (D1_dly,       D1_ipd,       tisd_D1_CLKDIV);
    VitalSignalDelay (D2_dly,       D2_ipd,       tisd_D2_CLKDIV);
    VitalSignalDelay (D3_dly,       D3_ipd,       tisd_D3_CLKDIV);
    VitalSignalDelay (D4_dly,       D4_ipd,       tisd_D4_CLKDIV);
    VitalSignalDelay (D5_dly,       D5_ipd,       tisd_D5_CLKDIV);
    VitalSignalDelay (D6_dly,       D6_ipd,       tisd_D6_CLKDIV);
    VitalSignalDelay (OCE_dly,      OCE_ipd,      tisd_OCE_CLKDIV);
    VitalSignalDelay (REV_dly,      REV_ipd,      tisd_REV_CLKDIV);
    VitalSignalDelay (SR_dly,       SR_ipd,       tisd_SR_CLKDIV);
    VitalSignalDelay (SHIFTIN1_dly, SHIFTIN1_ipd, tisd_SHIFTIN1_CLKDIV);
    VitalSignalDelay (SHIFTIN2_dly, SHIFTIN2_ipd, tisd_SHIFTIN2_CLKDIV);
  end block;

  GSR_dly <= GSR;
  

  --------------------
  --  BEHAVIOR SECTION
  --------------------


--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process
  variable AttrDataRateOQ_var		: std_ulogic := 'X';
  variable AttrDataWidth_var		: std_logic_vector(3 downto 0) := (others => 'X');
  variable AttrMode_var			: std_ulogic := 'X';
  variable AttrDdrClkEdge_var		: std_ulogic := 'X';
  variable AttrSerdes_var		: std_ulogic := 'X';

  begin
      -------------------- SERDES validity check --------------------
      if(SERDES = true) then
        AttrSerdes_var := '1';
      else
        AttrSerdes_var := '0';
      end if;

      ------------ SERDES_MODE validity check --------------------
      if((SERDES_MODE = "MASTER") or (SERDES_MODE = "master")) then
         AttrMode_var := '0';
      elsif((SERDES_MODE = "SLAVE") or (SERDES_MODE = "slave")) then
         AttrMode_var := '1';
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => "SERDES_MODE ",
             EntityName => "/X_IOOUT",
             GenericValue => SERDES_MODE,
             Unit => "",
             ExpectedValueMsg => " The legal values for this attribute are ",
             ExpectedGenericValue => " MASTER or SLAVE.",
             TailMsg => "",
             MsgSeverity => FAILURE 
         );
      end if;

      ------------------ DATA_RATE validity check ------------------

      if((DATA_RATE_OQ = "DDR") or (DATA_RATE_OQ = "ddr")) then
         AttrDataRateOQ_var := '0';
      elsif((DATA_RATE_OQ = "SDR") or (DATA_RATE_OQ = "sdr")) then
         AttrDataRateOQ_var := '1';
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " DATA_RATE_OQ ",
             EntityName => "/X_IOOUT",
             GenericValue => DATA_RATE_OQ,
             Unit => "",
             ExpectedValueMsg => " The legal values for this attribute are ",
             ExpectedGenericValue => " DDR or SDR. ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;

      ------------------ DATA_WIDTH validity check ------------------
      if((DATA_WIDTH = 2) or (DATA_WIDTH = 3) or  (DATA_WIDTH = 4) or
         (DATA_WIDTH = 5) or (DATA_WIDTH = 6) or  (DATA_WIDTH = 7) or
         (DATA_WIDTH = 8) or (DATA_WIDTH = 10)) then
         AttrDataWidth_var := CONV_STD_LOGIC_VECTOR(DATA_WIDTH, MAX_DATAWIDTH); 
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " DATA_WIDTH ",
             EntityName => "/X_IOOUT",
             GenericValue => DATA_WIDTH,
             Unit => "",
             ExpectedValueMsg => " The legal values for this attribute are ",
             ExpectedGenericValue => " 2, 3, 4, 5, 6, 7, 8, or 10 ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;
      ------------ DATA_WIDTH /DATA_RATE combination check ------------
      if((DATA_RATE_OQ = "DDR") or (DATA_RATE_OQ = "ddr")) then
         case (DATA_WIDTH) is
             when 4|6|8|10  => null;
             when others       =>
                GenericValueCheckMessage
                (  HeaderMsg  => " Attribute Syntax Warning ",
                   GenericName => " DATA_WIDTH ",
                   EntityName => "/X_IOOUT",
                   GenericValue => DATA_WIDTH,
                   Unit => "",
                   ExpectedValueMsg => " The legal values for this attribute in DDR mode are ",
                   ExpectedGenericValue => " 4, 6, 8, or 10 ",
                   TailMsg => "",
                   MsgSeverity => Failure
                );
          end case;
      end if;

      if((DATA_RATE_OQ = "SDR") or (DATA_RATE_OQ = "sdr")) then
         case (DATA_WIDTH) is
             when 2|3|4|5|6|7|8  => null;
             when others       =>
                GenericValueCheckMessage
                (  HeaderMsg  => " Attribute Syntax Warning ",
                   GenericName => " DATA_WIDTH ",
                   EntityName => "/X_IOOUT",
                   GenericValue => DATA_WIDTH,
                   Unit => "",
                   ExpectedValueMsg => " The legal values for this attribute in SDR mode are ",
                   ExpectedGenericValue => " 2, 3, 4, 5, 6, 7 or 8.",
                   TailMsg => "",
                   MsgSeverity => Failure
                );
          end case;
      end if;

      ------------------ DDR_CLK_EDGE validity check ------------------

      if((DDR_CLK_EDGE = "SAME_EDGE") or (DDR_CLK_EDGE = "same_edge")) then
         AttrDdrClkEdge_var := '1';
      elsif((DDR_CLK_EDGE = "OPPOSITE_EDGE") or (DDR_CLK_EDGE = "opposite_edge")) then
         AttrDdrClkEdge_var := '0';
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " DDR_CLK_EDGE ",
             EntityName => "/X_IOOUT",
             GenericValue => DDR_CLK_EDGE,
             Unit => "",
             ExpectedValueMsg => " The legal values for this attribute are ",
             ExpectedGenericValue => " SAME_EDGE or OPPOSITE_EDGE ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;
      ------------------ DATA_RATE validity check ------------------
      if((SRTYPE = "ASYNC") or (SRTYPE = "async")) then
         AttrSRtype  <= (others => '1');
      elsif((SRTYPE = "SYNC") or (SRTYPE = "sync")) then
         AttrSRtype  <= (others => '0');
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " SRTYPE ",
             EntityName => "/X_IOOUT",
             GenericValue => SRTYPE,
             Unit => "",
             ExpectedValueMsg => " The legal values for this attribute are ",
             ExpectedGenericValue => " ASYNC or SYNC. ",
             TailMsg => "",
             MsgSeverity => ERROR
         );
      end if;

      AttrSerdes		<= AttrSerdes_var;
      AttrMode		<= AttrMode_var;
      AttrDataRateOQ	<= AttrDataRateOQ_var;
      AttrDataWidth	<= AttrDataWidth_var;
      AttrDdrClkEdge	<= AttrDdrClkEdge_var;

      plgcnt     <= AttrDataRateOQ_var & AttrDataWidth_var; 

      wait;
  end process prcs_init;
--###################################################################
--#####                   Concurrent exe                        #####
--###################################################################
   C2p    <= (C_dly and AttrDdrClkEdge) or 
             ((not C_dly) and (not AttrDdrClkEdge)); 
   C3     <= not C2p;
   sel1_4 <= AttrSerdes & loadint & AttrDataRateOQ;
   sel5_6 <= AttrSerdes & AttrMode & loadint & AttrDataRateOQ;
   LOAD_zd <= loadint;
   seloq   <= OCE_dly & AttrDataRateOQ & oqsr & oqrev;
   
   oqsr    <= ((AttrSRtype(1) and SR_dly and not (TO_X01(SRVAL_OQ)))
                               or
                (AttrSRtype(1) and REV_dly and (TO_X01(SRVAL_OQ))));

   oqrev   <= ((AttrSRtype(1) and SR_dly and (TO_X01(SRVAL_OQ)))
                               or
                (AttrSRtype(1) and REV_dly and not (TO_X01(SRVAL_OQ))));

   SHIFTOUT1_zd <= d3rnk2 and AttrMode;
   SHIFTOUT2_zd <= d4rnk2 and AttrMode;
--###################################################################
--#####                     q1rnk2 reg                          #####
--###################################################################
  prcs_D1_rnk2:process(C_dly, GSR_dly, REV_dly, SR_dly)
  variable d1rnk2_var         : std_ulogic := TO_X01(INIT_OQ);
  variable FIRST_TIME         : boolean    := true;
  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
         d1rnk2_var  :=  TO_X01(INIT_OQ);
         FIRST_TIME  := false;
     elsif(GSR_dly = '0') then
        case AttrSRtype(1) is
           when '1' => 
           --------------- // async SET/RESET
                   if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_OQ) = '1')))) then
                      d1rnk2_var := TO_X01(SRVAL_OQ);
                   elsif(REV_dly = '1') then
                      d1rnk2_var := not TO_X01(SRVAL_OQ);
                   elsif((SR_dly = '0') and (REV_dly = '0')) then
                      if(OCE = '1') then
                         if(rising_edge(C_dly)) then
                            d1rnk2_var := data1;
                         end if;
                      elsif(OCE = '0') then
                         if(rising_edge(C_dly)) then
                            d1rnk2_var := OQ_zd;
                         end if;
                      end if;
                   end if;

           when '0' => 
           --------------- // sync SET/RESET
                   if(rising_edge(C_dly)) then
                      if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_OQ) = '1')))) then
                         d1rnk2_var := TO_X01(SRVAL_OQ);
                      elsif(REV_dly = '1') then
                         d1rnk2_var := not TO_X01(SRVAL_OQ);
                      elsif((SR_dly = '0') and (REV_dly = '0')) then
                         if(OCE = '1') then
                            d1rnk2_var := data1;
                         elsif(OCE = '0') then
                            d1rnk2_var := OQ_zd;
                         end if;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     d1rnk2  <= d1rnk2_var  after DELAY_FFD;

  end process prcs_D1_rnk2;
--###################################################################
--#####                     d2rnk2 reg                          #####
--###################################################################
  prcs_D2_rnk2:process(C2p, GSR_dly, REV_dly, SR_dly)
  variable d2rnk2_var         : std_ulogic := TO_X01(INIT_OQ);
  variable FIRST_TIME         : boolean    := true;
  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
         d2rnk2_var  :=  TO_X01(INIT_OQ);
         FIRST_TIME  := false;
     elsif(GSR_dly = '0') then
        case AttrSRtype(1) is
           when '1' => 
           --------------- // async SET/RESET
                   if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_OQ) = '1')))) then
                      d2rnk2_var :=  TO_X01(SRVAL_OQ);
                   elsif(REV_dly = '1') then
                      d2rnk2_var :=  not TO_X01(SRVAL_OQ);
                   elsif((SR_dly = '0') and (REV_dly = '0')) then
                      if(OCE = '1') then
                         if(rising_edge(C2p)) then
                            d2rnk2_var := data2;
                         end if;
                      elsif(OCE = '0') then
                         if(rising_edge(C2p)) then
                            d2rnk2_var := OQ_zd;
                         end if;
                      end if;
                   end if;

           when '0' => 
           --------------- // sync SET/RESET
                   if(rising_edge(C2p)) then
                      if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_OQ) = '1')))) then
                         d2rnk2_var :=  TO_X01(SRVAL_OQ);
                      elsif(REV_dly = '1') then
                         d2rnk2_var :=  not TO_X01(SRVAL_OQ);
                      elsif((SR_dly = '0') and (REV_dly = '0')) then
                         if(OCE = '1') then
                            d2rnk2_var := data2;
                         elsif(OCE = '0') then
                            d2rnk2_var := OQ_zd;
                         end if;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     d2rnk2  <= d2rnk2_var  after DELAY_FFD;

  end process prcs_D2_rnk2;
--###################################################################
--#####                     d2nrnk2 reg                          #####
--###################################################################
  prcs_D2_nrnk2:process(C3, GSR_dly, REV_dly, SR_dly)
  variable d2nrnk2_var         : std_ulogic := TO_X01(INIT_OQ);
  variable FIRST_TIME          : boolean    := true;
  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
         d2nrnk2_var  := TO_X01(INIT_OQ);
         FIRST_TIME  := false;
     elsif(GSR_dly = '0') then
        case AttrSRtype(1) is
           when '1' => 
           --------------- // async SET/RESET
                   if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_OQ) = '1')))) then
                      d2nrnk2_var :=  TO_X01(SRVAL_OQ);
                   elsif(REV_dly = '1') then
                      d2nrnk2_var :=  not TO_X01(SRVAL_OQ);
                   elsif((SR_dly = '0') and (REV_dly = '0')) then
                      if(OCE = '1') then
                         if(rising_edge(C3)) then
                            d2nrnk2_var := d2rnk2;
                         end if;
                      elsif(OCE = '0') then
                         if(rising_edge(C3)) then
                            d2nrnk2_var := OQ_zd;
                         end if;
                      end if;
                   end if;

           when '0' => 
           --------------- // sync SET/RESET
                   if(rising_edge(C3)) then
                      if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_OQ) = '1')))) then
                         d2nrnk2_var :=  TO_X01(SRVAL_OQ);
                      elsif(REV_dly = '1') then
                         d2nrnk2_var :=  not TO_X01(SRVAL_OQ);
                      elsif((SR_dly = '0') and (REV_dly = '0')) then
                         if(OCE = '1') then
                            d2nrnk2_var := d2rnk2;
                         elsif(OCE = '0') then
                            d2nrnk2_var := OQ_zd;
                         end if;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     d2nrnk2  <= d2nrnk2_var  after DELAY_FFD;

  end process prcs_D2_nrnk2;
--###################################################################
--#####              d3rnk2, d4rnk2, d5rnk2 and d6rnk2          #####
--###################################################################
  prcs_D3D4D5D6_rnk2:process(C_dly, GSR_dly, SR_dly)
  variable d6rnk2_var         : std_ulogic := TO_X01(INIT_ORANK2_PARTIAL(3));
  variable d5rnk2_var         : std_ulogic := TO_X01(INIT_ORANK2_PARTIAL(2));
  variable d4rnk2_var         : std_ulogic := TO_X01(INIT_ORANK2_PARTIAL(1));
  variable d3rnk2_var         : std_ulogic := TO_X01(INIT_ORANK2_PARTIAL(0));
  variable FIRST_TIME         : boolean    := true;

  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
         d6rnk2_var  := TO_X01(INIT_ORANK2_PARTIAL(3));
         d5rnk2_var  := TO_X01(INIT_ORANK2_PARTIAL(2));
         d4rnk2_var  := TO_X01(INIT_ORANK2_PARTIAL(1));
         d3rnk2_var  := TO_X01(INIT_ORANK2_PARTIAL(0));
         FIRST_TIME  := false;
     elsif(GSR_dly = '0') then
        case AttrSRtype(2) is
           when '1' => 
           --------- // async SET/RESET  -- Not full featured FFs
                   if(SR_dly = '1') then
                      d6rnk2_var  := '0';
                      d5rnk2_var  := '0';
                      d4rnk2_var  := '0';
                      d3rnk2_var  := '0';
                   elsif(SR_dly = '0') then
                      if(rising_edge(C_dly)) then
                         d6rnk2_var  := data6;
                         d5rnk2_var  := data5;
                         d4rnk2_var  := data4;
                         d3rnk2_var  := data3;
                      end if;
                   end if;

           when '0' => 
           --------- // sync SET/RESET  -- Not full featured FFs
                   if(rising_edge(C_dly)) then
                      if(SR_dly = '1') then
                         d6rnk2_var  := '0';
                         d5rnk2_var  := '0';
                         d4rnk2_var  := '0';
                         d3rnk2_var  := '0';
                      elsif(SR_dly = '0') then
                         d6rnk2_var  := data6;
                         d5rnk2_var  := data5;
                         d4rnk2_var  := data4;
                         d3rnk2_var  := data3;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     d6rnk2  <= d6rnk2_var  after DELAY_FFD;
     d5rnk2  <= d5rnk2_var  after DELAY_FFD;
     d4rnk2  <= d4rnk2_var  after DELAY_FFD;
     d3rnk2  <= d3rnk2_var  after DELAY_FFD;

  end process prcs_D3D4D5D6_rnk2;

--//////////////////////////////////////////////////////////////////
--//                   First rank of FF for input data            //
--//////////////////////////////////////////////////////////////////

--###################################################################
--#####              d1r, d2r, d3r, d4r, d5r and d6r            #####
--###################################################################
  prcs_D1D2D3D4D5D6_r:process(CLKDIV_dly, GSR_dly, SR_dly)
  variable d6r_var            : std_ulogic := TO_X01(INIT_ORANK1(5));
  variable d5r_var            : std_ulogic := TO_X01(INIT_ORANK1(4));
  variable d4r_var            : std_ulogic := TO_X01(INIT_ORANK1(3));
  variable d3r_var            : std_ulogic := TO_X01(INIT_ORANK1(2));
  variable d2r_var            : std_ulogic := TO_X01(INIT_ORANK1(1));
  variable d1r_var            : std_ulogic := TO_X01(INIT_ORANK1(0));
  variable FIRST_TIME         : boolean    := true;

  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
         d6r_var     := TO_X01(INIT_ORANK1(5));
         d5r_var     := TO_X01(INIT_ORANK1(4));
         d4r_var     := TO_X01(INIT_ORANK1(3));
         d3r_var     := TO_X01(INIT_ORANK1(2));
         d2r_var     := TO_X01(INIT_ORANK1(1));
         d1r_var     := TO_X01(INIT_ORANK1(0));
         FIRST_TIME  := false;
     elsif(GSR_dly = '0') then
        case AttrSRtype(3) is
           when '1' => 
           --------- // async SET/RESET  -- Not full featured FFs
                   if(SR_dly = '1') then
                      d6r_var  := '0';
                      d5r_var  := '0';
                      d4r_var  := '0';
                      d3r_var  := '0';
                      d2r_var  := '0';
                      d1r_var  := '0';
                   elsif(SR_dly = '0') then
                      if(rising_edge(CLKDIV_dly)) then
                         d6r_var  := D6_dly;
                         d5r_var  := D5_dly;
                         d4r_var  := D4_dly;
                         d3r_var  := D3_dly;
                         d2r_var  := D2_dly;
                         d1r_var  := D1_dly;
                      end if;
                   end if;

           when '0' => 
           --------- // sync SET/RESET  -- Not full featured FFs
                   if(rising_edge(CLKDIV_dly)) then
                      if(SR_dly = '1') then
                         d6r_var  := '0';
                         d5r_var  := '0';
                         d4r_var  := '0';
                         d3r_var  := '0';
                         d2r_var  := '0';
                         d1r_var  := '0';
                      elsif(SR_dly = '0') then
                         d6r_var  := D6_dly;
                         d5r_var  := D5_dly;
                         d4r_var  := D4_dly;
                         d3r_var  := D3_dly;
                         d2r_var  := D2_dly;
                         d1r_var  := D1_dly;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     d6r  <= d6r_var  after DELAY_FFCD;
     d5r  <= d5r_var  after DELAY_FFCD;
     d4r  <= d4r_var  after DELAY_FFCD;
     d3r  <= d3r_var  after DELAY_FFCD;
     d2r  <= d2r_var  after DELAY_FFCD;
     d1r  <= d1r_var  after DELAY_FFCD;

  end process prcs_D1D2D3D4D5D6_r;

--###################################################################
--#####                Muxes for 2nd rank of FFS                #####
--###################################################################
  prcs_data1234_mux:process(sel1_4, d1r, d2r, d3r, d4r, d2rnk2,
                                d3rnk2, d4rnk2, d5rnk2, d6rnk2)

  begin
     case sel1_4 is
           when "100" =>
                    data1 <= d3rnk2 after DELAY_MXR1;
                    data2 <= d4rnk2 after DELAY_MXR1;
                    data3 <= d5rnk2 after DELAY_MXR1;
                    data4 <= d6rnk2 after DELAY_MXR1;
           when "110" =>
                    data1 <= d1r    after DELAY_MXR1;
                    data2 <= d2r    after DELAY_MXR1;
                    data3 <= d3r    after DELAY_MXR1;
                    data4 <= d4r    after DELAY_MXR1;
           when "101" =>
                    data1 <= d2rnk2 after DELAY_MXR1;
                    data2 <= d3rnk2 after DELAY_MXR1;
                    data3 <= d4rnk2 after DELAY_MXR1;
                    data4 <= d5rnk2 after DELAY_MXR1;
           when "111" =>
                    data1 <= d1r    after DELAY_MXR1;
                    data2 <= d2r    after DELAY_MXR1;
                    data3 <= d3r    after DELAY_MXR1;
                    data4 <= d4r    after DELAY_MXR1;
           when others =>
                    data1 <= d3rnk2 after DELAY_MXR1;
                    data2 <= d4rnk2 after DELAY_MXR1;
                    data3 <= d5rnk2 after DELAY_MXR1;
                    data4 <= d6rnk2 after DELAY_MXR1;
     end case;

  end process prcs_data1234_mux;

----------------------------------------------------------------------

  prcs_data56_mux:process(sel5_6, d5r, d6r, d6rnk2, SHIFTIN1_dly,
                                                    SHIFTIN2_dly )

  begin
     case sel5_6 is
           when "1000" =>
                    data5 <=  SHIFTIN1_dly after DELAY_MXR1;
                    data6 <=  SHIFTIN2_dly after DELAY_MXR1;
           when "1010" =>
                    data5 <=  d5r after DELAY_MXR1;
                    data6 <=  d6r after DELAY_MXR1;
           when "1001" =>
                    data5 <=  d6rnk2 after DELAY_MXR1;
                    data6 <=  SHIFTIN1_dly after DELAY_MXR1;
           when "1011" =>
                    data5 <=  d5r after DELAY_MXR1;
                    data6 <=  d6r after DELAY_MXR1;
           when "1100" =>
                    data5 <=  '0' after DELAY_MXR1;
                    data6 <=  '0' after DELAY_MXR1;
           when "1110" =>
                    data5 <=  d5r after DELAY_MXR1;
                    data6 <=  d6r after DELAY_MXR1;
           when "1101" =>
                    data5 <=  d6rnk2 after DELAY_MXR1;
                    data6 <=  '0' after DELAY_MXR1;
           when "1111" =>
                    data5 <=  d5r after DELAY_MXR1;
                    data6 <=  d6r after DELAY_MXR1;

           when others =>
                    data5 <=  SHIFTIN1_dly after DELAY_MXR1;
                    data6 <=  SHIFTIN2_dly after DELAY_MXR1;
     end case;

  end process prcs_data56_mux;
--###################################################################
--#####        sdata_edge                                      ######
--###################################################################
  prcs_sdata:process(C_dly, C3, d1rnk2, d2nrnk2)
  begin
     sdata_edge <= ((d1rnk2 and C_dly) or (d2nrnk2 and C3)) after DELAY_MXD;
  end process prcs_sdata;

--###################################################################
--#####             odata_edge                                  #####
--###################################################################
  prcs_odata:process(C_dly, d1rnk2, d2rnk2)
  begin
     case C_dly is
           when '0' => 
                    odata_edge <= d2rnk2 after DELAY_MXD;
           when '1' => 
                    odata_edge <= d1rnk2 after DELAY_MXD;
           when others =>
                    odata_edge <= d2rnk2 after DELAY_MXD;
     end case;
  end process prcs_odata;
--###################################################################
--#####                 ddr_data                               ######
--###################################################################
  prcs_ddrdata:process(ddr_data, sdata_edge, odata_edge, AttrDdrClkEdge)
  begin
     ddr_data <= ((odata_edge and (not AttrDdrClkEdge)) or 
                    (sdata_edge and AttrDdrClkEdge)) after DELAY_MXD;
  end process prcs_ddrdata;

---////////////////////////////////////////////////////////////////////
---                       Outputs
---////////////////////////////////////////////////////////////////////
  prcs_OQ_mux:process(seloq, d1rnk2, ddr_data, OQ_zd, GSR_dly)

  variable FIRST_TIME : boolean := true;

  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
       OQ_zd    <=  TO_X01(INIT_OQ);
       FIRST_TIME := false;
     elsif(GSR_dly = '0') then
        case seloq is
           when "0001" | "0101"| "1001" | "1101" |
                "0X01" | "1X01"| "XX01" | "X001" |
                "X101" 
                       => 
                       OQ_zd <= '1' after DELAY_MXD;

           when "0010" | "0110"| "1010" | "1110" |
                "0X10" | "1X10"| "XX10" | "X010" |
                "X110" 
                       => 
                       OQ_zd <= '0' after DELAY_MXD;
   
           when "0011" | "0111"| "1011" | "1111" |
                "0X11" | "1X11"| "XX11" | "X011" |
                "X111" 
                       => 
                       OQ_zd <= '0' after DELAY_MXD;
   
           when "0000" =>
                       OQ_zd <= OQ_zd after DELAY_MXD;
   
           when "0100" =>
                       OQ_zd <= OQ_zd after DELAY_MXD;
   
           when "1000" =>
                       OQ_zd <= ddr_data after DELAY_MXD;
   
           when "1100" =>
                       OQ_zd <= d1rnk2 after DELAY_MXD;
   
           when others =>
-- CR 192533 the below "now > DEALY_MXD" is added since 
-- the INIT value of OQ_zd is getting wiped off by ddr_data=X at time 0.
-- At time 0, seloq is XXXX
                       if(now > DELAY_MXD) then
                         OQ_zd <= ddr_data after DELAY_MXD;
                       end if;
   
        end case;

     end if; 

  end process prcs_OQ_mux;
----------------------------------------------------------------------
-----------    Instant X_PLG  --------------------------------------
----------------------------------------------------------------------
  INST_X_PLG : X_PLG
  generic map (
      SRTYPE => SRTYPE,
      INIT_LOADCNT => INIT_LOADCNT
     )
  port map (
      LOAD       => loadint,

      C23        => c23,
      C45        => c45,
      C67        => c67,
      CLK        => C_dly,
      CLKDIV     => CLKDIV_dly,
      GSR        => GSR_dly,
      RST        => SR_dly,
      SEL        => sel
      );

--###################################################################
--#####           Set value of the counter in X_PLG             ##### 
--###################################################################
  prcs_plg_plgcnt:process
  begin
     wait for 10 ps;
     case plgcnt is
        when "00100" =>
                 c23<='0'; c45<='0'; c67<='0'; sel<="00";
        when "00110" =>
                 c23<='1'; c45<='0'; c67<='0'; sel<="00";
        when "01000" =>
                 c23<='0'; c45<='0'; c67<='0'; sel<="01";
        when "01010" =>
                 c23<='0'; c45<='1'; c67<='0'; sel<="01";
        when "10010" =>
                 c23<='0'; c45<='0'; c67<='0'; sel<="00";
        when "10011" =>
                 c23<='1'; c45<='0'; c67<='0'; sel<="00";
        when "10100" =>
                 c23<='0'; c45<='0'; c67<='0'; sel<="01";
        when "10101" =>
                 c23<='0'; c45<='1'; c67<='0'; sel<="01";
        when "10110" =>
                 c23<='0'; c45<='0'; c67<='0'; sel<="10";
        when "10111" =>
                 c23<='0'; c45<='0'; c67<='1'; sel<="10";
        when "11000" =>
                 c23<='0'; c45<='0'; c67<='0'; sel<="11";
        when others =>
                assert FALSE 
                report "WARNING : DATA_WIDTH or DATA_RATE has illegal values."
                severity Warning;
     end case;
    wait;
  end process prcs_plg_plgcnt;
         

--####################################################################

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_output:process(OQ_zd, LOAD_zd, SHIFTOUT1_zd, SHIFTOUT2_zd)
  begin
      OQ   <= OQ_zd after SWALLOW_PULSE;
      LOAD <= LOAD_zd;
      SHIFTOUT1 <= SHIFTOUT1_zd;
      SHIFTOUT2 <= SHIFTOUT2_zd;
  end process prcs_output;


end X_IOOUT_V;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.vcomponents.all;

entity X_IOT is

  generic(

         DATA_RATE_TQ		: string;
         TRISTATE_WIDTH		: integer	:= 1;
         DDR_CLK_EDGE		: string	:= "SAME_EDGE";
         INIT_TQ		: bit		:= '0';
         INIT_TRANK1		: bit_vector(3 downto 0) := "0000";
         SRVAL_TQ		: bit		:= '1';

         SRTYPE			: string	:= "ASYNC";

         TimingChecksOn		: boolean	:= true;
         InstancePath		: string	:= "*";
         Xon			: boolean	:= true;
         MsgOn			: boolean	:= false;


      tipd_C                    : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_CLKDIV               : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_LOAD                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_REV                  : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_SR                   : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_T1                   : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_T2                   : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_T3                   : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_T4                   : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_TCE                  : VitalDelayType01 := (0.0 ns, 0.0 ns);

--  VITAL input Pin path delay variables


--  VITAL clk-to-output path delay variables

--  VITAL async rest-to-output path delay variables

--  VITAL async set-to-output path delay variables

--  VITAL GSR-to-output path delay variable


--  VITAL ticd & tisd variables

      ticd_C                    : VitalDelayType := 0.000 ns;
      ticd_CLKDIV               : VitalDelayType := 0.000 ns;
      tisd_LOAD_CLKDIV          : VitalDelayType := 0.000 ns;
      tisd_REV_CLKDIV           : VitalDelayType := 0.000 ns;
      tisd_SR_CLKDIV            : VitalDelayType := 0.000 ns;
      tisd_T1_CLKDIV            : VitalDelayType := 0.000 ns;
      tisd_T2_CLKDIV            : VitalDelayType := 0.000 ns;
      tisd_T3_CLKDIV            : VitalDelayType := 0.000 ns;
      tisd_T4_CLKDIV            : VitalDelayType := 0.000 ns;
      tisd_TCE_CLKDIV           : VitalDelayType := 0.000 ns;

--  VITAL Setup/Hold delay variables

-- VITAL pulse width variables
      tpw_C_posedge	: VitalDelayType := 0.0 ns;
      tpw_REV_posedge	: VitalDelayType := 0.0 ns;
      tpw_SR_posedge	: VitalDelayType := 0.0 ns;

-- VITAL period variables
      tperiod_C_posedge	: VitalDelayType := 0.0 ns;

-- VITAL recovery time variables
      trecovery_REV_C_negedge_posedge   : VitalDelayType := 0.0 ns;
      trecovery_SR_C_negedge_posedge   : VitalDelayType := 0.0 ns;

-- VITAL removal time variables
      tremoval_REV_C_negedge_posedge    : VitalDelayType := 0.0 ns;
      tremoval_SR_C_negedge_posedge    : VitalDelayType := 0.0 ns
      );

  port(
      TQ		: out std_ulogic;

      C			: in std_ulogic;
      CLKDIV		: in std_ulogic;
      GSR		: in std_ulogic; -- main
      LOAD		: in std_ulogic;
      REV	        : in std_ulogic;
      SR	        : in std_ulogic;
      T1		: in std_ulogic;
      T2		: in std_ulogic;
      T3		: in std_ulogic;
      T4		: in std_ulogic;
      TCE		: in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_IOT : entity is true;

end X_IOT;

architecture X_IOT_V OF X_IOT is

--  attribute VITAL_LEVEL0 of
--    X_IOT_V : architecture is true;


  constant GSR_PULSE_TIME       : time       := 1 ns; 

  constant DELAY_FFD            : time       := 1 ps; 

-- CR 523601
-- constant DELAY_MXD	        : time       := 1  ps;
  constant DELAY_MXD	        : time       := 20  ps;
  constant DELAY_ZERO	        : time       := 0  ps;
  constant DELAY_ONE	        : time       := 1  ps;
  constant SWALLOW_PULSE	: time       := 2  ps;

  constant MAX_DATAWIDTH	: integer    := 4;

  signal C_ipd			: std_ulogic := 'X';
  signal CLKDIV_ipd		: std_ulogic := 'X';
  signal GSR_ipd		: std_ulogic := 'X';
  signal LOAD_ipd		: std_ulogic := 'X';
  signal T1_ipd			: std_ulogic := 'X';
  signal T2_ipd			: std_ulogic := 'X';
  signal T3_ipd			: std_ulogic := 'X';
  signal T4_ipd			: std_ulogic := 'X';
  signal TCE_ipd	        : std_ulogic := 'X';
  signal REV_ipd	        : std_ulogic := 'X';
  signal SR_ipd		        : std_ulogic := 'X';

  signal C_dly			: std_ulogic := 'X';
  signal CLKDIV_dly		: std_ulogic := 'X';
  signal GSR_dly		: std_ulogic := '0';
  signal LOAD_dly		: std_ulogic := 'X';
  signal T1_dly			: std_ulogic := 'X';
  signal T2_dly			: std_ulogic := 'X';
  signal T3_dly			: std_ulogic := 'X';
  signal T4_dly			: std_ulogic := 'X';
  signal TCE_dly	        : std_ulogic := 'X';
  signal REV_dly	        : std_ulogic := 'X';
  signal SR_dly		        : std_ulogic := 'X';

  signal TQ_zd			: std_ulogic := TO_X01(INIT_TQ);

  signal AttrDataRateTQ		: std_logic_vector(1 downto 0) := (others => 'X');
  signal AttrTriStateWidth	: std_logic_vector(1 downto 0) := (others => 'X');
  signal AttrDdrClkEdge		: std_ulogic := 'X';

  signal AttrSRtype		: std_logic_vector(1 downto 0) := (others => '1');

  signal t1r			: std_ulogic := 'X';
  signal t2r			: std_ulogic := 'X';
  signal t3r			: std_ulogic := 'X';
  signal t4r			: std_ulogic := 'X';

  signal qt1			: std_ulogic := 'X';
  signal qt2			: std_ulogic := 'X';
  signal qt2n			: std_ulogic := 'X';

  signal data1			: std_ulogic := 'X';
  signal data2			: std_ulogic := 'X';

  signal sdata_edge		: std_ulogic := 'X';
  signal odata_edge		: std_ulogic := 'X';
  signal ddr_data		: std_ulogic := 'X';

  signal C2p			: std_ulogic := 'X';
  signal C3			: std_ulogic := 'X';

  signal tqsel			: std_logic_vector(6 downto 0) := (others => 'X');
  signal tqsr			: std_ulogic := 'X';
  signal tqrev			: std_ulogic := 'X';

  signal sel			: std_logic_vector(4 downto 0) := (others => 'X');

begin

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (C_ipd,        C,        tipd_C);
    VitalWireDelay (CLKDIV_ipd,   CLKDIV,   tipd_CLKDIV);
    VitalWireDelay (LOAD_ipd,     LOAD,     tipd_LOAD);
    VitalWireDelay (T1_ipd,       T1,       tipd_T1);
    VitalWireDelay (T2_ipd,       T2,       tipd_T2);
    VitalWireDelay (T3_ipd,       T3,       tipd_T3);
    VitalWireDelay (T4_ipd,       T4,       tipd_T4);
    VitalWireDelay (TCE_ipd,      TCE,      tipd_TCE);
    VitalWireDelay (REV_ipd,      REV,      tipd_REV);
    VitalWireDelay (SR_ipd,       SR,       tipd_SR);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (C_dly,        C_ipd,        ticd_C);
    VitalSignalDelay (CLKDIV_dly,   CLKDIV_ipd,   ticd_CLKDIV);
    VitalSignalDelay (LOAD_dly,     LOAD_ipd,     tisd_LOAD_CLKDIV);
    VitalSignalDelay (T1_dly,       T1_ipd,       tisd_T1_CLKDIV);
    VitalSignalDelay (T2_dly,       T2_ipd,       tisd_T2_CLKDIV);
    VitalSignalDelay (T3_dly,       T3_ipd,       tisd_T3_CLKDIV);
    VitalSignalDelay (T4_dly,       T4_ipd,       tisd_T4_CLKDIV);
    VitalSignalDelay (TCE_dly,      TCE_ipd,      tisd_TCE_CLKDIV);
    VitalSignalDelay (SR_dly,       SR_ipd,       tisd_SR_CLKDIV);
    VitalSignalDelay (REV_dly,      REV_ipd,      tisd_REV_CLKDIV);
  end block;

  GSR_dly <= GSR;


  --------------------
  --  BEHAVIOR SECTION
  --------------------


--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process
  variable AttrDataRateTQ_var		: std_logic_vector(1 downto 0) := (others => 'X');
  variable AttrTriStateWidth_var	: std_logic_vector(1 downto 0) := (others => 'X');
  variable AttrDdrClkEdge_var		: std_ulogic := 'X';

  begin

      ------------------ DATA_RATE_TQ validity check ------------------
-- FP check with Paul
      if((DATA_RATE_TQ = "BUF") or (DATA_RATE_TQ = "buf")) then
         AttrDataRateTQ_var := "00";
      elsif((DATA_RATE_TQ = "SDR") or (DATA_RATE_TQ = "sdr")) then
         AttrDataRateTQ_var := "01";
      elsif((DATA_RATE_TQ = "DDR") or (DATA_RATE_TQ = "ddr")) then
         AttrDataRateTQ_var := "10";
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " DATA_RATE_TQ ",
             EntityName => "/X_IOOUT",
             GenericValue => DATA_RATE_TQ,
             Unit => "",
             ExpectedValueMsg => " The legal values for this attribute are ",
             ExpectedGenericValue => " BUF, SDR or DDR. ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;


      ------------------ TRISTATE_WIDTH validity check ------------------
      if((TRISTATE_WIDTH = 1) or (TRISTATE_WIDTH = 2) or  (TRISTATE_WIDTH = 4)) then
         case TRISTATE_WIDTH is
            when   1  =>  AttrTriStateWidth_var := "00";
            when   2  =>  AttrTriStateWidth_var := "01";
            when   4  =>  AttrTriStateWidth_var := "10";
            when others  =>
                   null;
         end case;
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " TRISTATE_WIDTH ",
             EntityName => "/X_IOT",
             GenericValue => TRISTATE_WIDTH,
             Unit => "",
             ExpectedValueMsg => " The legal values for this attribute are ",
             ExpectedGenericValue => " 1, 2 or 4 ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;

      ------------ TRISTATE_WIDTH /DATA_RATE combination check ------------
-- CR 458156 -- enabled TRISTATE_WIDTH to be 1 in DDR mode.
      if((DATA_RATE_TQ = "DDR") or (DATA_RATE_TQ = "ddr")) then
         case (TRISTATE_WIDTH) is
             when 1|2|4  => null;
             when others       =>
                GenericValueCheckMessage
                (  HeaderMsg  => " Attribute Syntax Warning ",
                   GenericName => " TRISTATE_WIDTH ",
                   EntityName => "/X_IOT",
                   GenericValue => TRISTATE_WIDTH,
                   Unit => "",
                   ExpectedValueMsg => " The legal values for this attribute in DDR mode are ",
                   ExpectedGenericValue => "1, 2 or 4",
                   TailMsg => "",
                   MsgSeverity => Failure
                );
          end case;
      end if;

      if((DATA_RATE_TQ = "SDR") or (DATA_RATE_TQ = "sdr")) then
         case (TRISTATE_WIDTH) is
             when 1  => null;
             when others       =>
                GenericValueCheckMessage
                (  HeaderMsg  => " Attribute Syntax Warning ",
                   GenericName => " TRISTATE_WIDTH ",
                   EntityName => "/X_IOT",
                   GenericValue => TRISTATE_WIDTH,
                   Unit => "",
                   ExpectedValueMsg => " The legal value for this attribute in SDR mode is",
                   ExpectedGenericValue => " 1. ",
                   TailMsg => "",
                   MsgSeverity => Failure
                );
          end case;
      end if;

      if((DATA_RATE_TQ = "BUF") or (DATA_RATE_TQ = "buf")) then
         case (TRISTATE_WIDTH) is
             when 1  => null;
             when others       =>
                GenericValueCheckMessage
                (  HeaderMsg  => " Attribute Syntax Warning ",
                   GenericName => " TRISTATE_WIDTH ",
                   EntityName => "/X_IOT",
                   GenericValue => TRISTATE_WIDTH,
                   Unit => "",
                   ExpectedValueMsg => " The legal value for this attribute in BUF mode is",
                   ExpectedGenericValue => " 1. ",
                   TailMsg => "",
                   MsgSeverity => Failure
                );
          end case;
      end if;

      ------------------ DDR_CLK_EDGE validity check ------------------

      if((DDR_CLK_EDGE = "SAME_EDGE") or (DDR_CLK_EDGE = "same_edge")) then
         AttrDdrClkEdge_var := '1';
      elsif((DDR_CLK_EDGE = "OPPOSITE_EDGE") or (DDR_CLK_EDGE = "opposite_edge")) then
         AttrDdrClkEdge_var := '0';
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " DDR_CLK_EDGE ",
             EntityName => "/X_IOT",
             GenericValue => DDR_CLK_EDGE,
             Unit => "",
             ExpectedValueMsg => " The legal values for this attribute are ",
             ExpectedGenericValue => " SAME_EDGE or OPPOSITE_EDGE ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;
      ------------------ DATA_RATE validity check ------------------
      if((SRTYPE = "ASYNC") or (SRTYPE = "async")) then
         AttrSRtype  <= (others => '1');
      elsif((SRTYPE = "SYNC") or (SRTYPE = "sync")) then
         AttrSRtype  <= (others => '0');
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " SRTYPE ",
             EntityName => "/X_IOT",
             GenericValue => SRTYPE,
             Unit => "",
             ExpectedValueMsg => " The legal values for this attribute are ",
             ExpectedGenericValue => " ASYNC or SYNC. ",
             TailMsg => "",
             MsgSeverity => ERROR
         );
      end if;
---------------------------------------------------------------------
     AttrDataRateTQ	<= AttrDataRateTQ_var;
     AttrTriStateWidth	<= AttrTriStateWidth_var;
     AttrDdrClkEdge	<= AttrDdrClkEdge_var;
     wait;
  end process prcs_init;
--###################################################################
--#####                   Concurrent exe                        #####
--###################################################################
   C2p    <= (C_dly and AttrDdrClkEdge) or 
             ((not C_dly) and (not AttrDdrClkEdge)); 
   C3     <= not C2p;

   tqsel  <= TCE & AttrDataRateTQ & AttrTriStateWidth & tqsr & tqrev;

   sel    <= load &  AttrDataRateTQ & AttrTriStateWidth;

   tqsr    <= ((AttrSRtype(1) and SR_dly and not (TO_X01(SRVAL_TQ)))
                               or
                (AttrSRtype(1) and REV_dly and (TO_X01(SRVAL_TQ))));

   tqrev   <= ((AttrSRtype(1) and SR_dly and (TO_X01(SRVAL_TQ)))
                               or
                (AttrSRtype(1) and REV_dly and not (TO_X01(SRVAL_TQ))));

--###################################################################
--#####                        qt1 reg                          #####
--###################################################################
  prcs_qt1_reg:process(C_dly, GSR_dly, REV_dly, SR_dly)
  variable qt1_var    : std_ulogic := TO_X01(INIT_TQ);
  variable FIRST_TIME : boolean    := true;
  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
         qt1_var    :=  TO_X01(INIT_TQ);
         FIRST_TIME := false;
     elsif(GSR_dly = '0') then
        case AttrSRtype(1) is
           when '1' => 
           --------------- // async SET/RESET
                   if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_TQ) = '1')))) then
                      qt1_var  :=  TO_X01(SRVAL_TQ);
                   elsif(REV_dly = '1') then
                      qt1_var  :=  not TO_X01(SRVAL_TQ);
                   elsif((SR_dly = '0') and (REV_dly = '0')) then
                      if(TCE_dly = '1') then
                         if(rising_edge(C_dly)) then
                            qt1_var := data1;
                         end if;
                      end if;
                   end if;

           when '0' => 
           --------------- // sync SET/RESET
                   if(rising_edge(C_dly)) then
                      if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_TQ) = '1')))) then
                         qt1_var  :=  TO_X01(SRVAL_TQ);
                      elsif(REV_dly = '1') then
                         qt1_var  :=  not TO_X01(SRVAL_TQ);
                      elsif((SR_dly = '0') and (REV_dly = '0')) then
                         if(TCE_dly = '1') then
                            qt1_var := data1;
                         end if;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     qt1  <= qt1_var  after DELAY_FFD;

  end process prcs_qt1_reg;
--###################################################################
--#####                        qt2 reg                          #####
--###################################################################
  prcs_qt2_reg:process(C2p, GSR_dly, REV_dly, SR_dly)
  variable qt2_var    : std_ulogic := TO_X01(INIT_TQ);
  variable FIRST_TIME : boolean    := true;
  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
         qt2_var    :=  TO_X01(INIT_TQ);
         FIRST_TIME := false;
     elsif(GSR_dly = '0') then
        case AttrSRtype(1) is
           when '1' => 
           --------------- // async SET/RESET
                   if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_TQ) = '1')))) then
                      qt2_var  :=  TO_X01(SRVAL_TQ);
                   elsif(REV_dly = '1') then
                      qt2_var  :=  not TO_X01(SRVAL_TQ);
                   elsif((SR_dly = '0') and (REV_dly = '0')) then
                      if(TCE_dly = '1') then
                         if(rising_edge(C2p)) then
                            qt2_var := data2;
                         end if;
                      end if;
                   end if;

           when '0' => 
           --------------- // sync SET/RESET
                   if(rising_edge(C2p)) then
                      if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_TQ) = '1')))) then
                         qt2_var  :=  TO_X01(SRVAL_TQ);
                      elsif(REV_dly = '1') then
                         qt2_var  :=  not TO_X01(SRVAL_TQ);
                      elsif((SR_dly = '0') and (REV_dly = '0')) then
                         if(TCE_dly = '1') then
                            qt2_var := data2;
                         end if;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     qt2  <= qt2_var  after DELAY_FFD;

  end process prcs_qt2_reg;

--###################################################################
--#####                        qt2n reg                          #####
--###################################################################
  prcs_qt2n_reg:process(C3, GSR_dly, REV_dly, SR_dly)
  variable qt2n_var   : std_ulogic := TO_X01(INIT_TQ);
  variable FIRST_TIME : boolean    := true;
  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
         qt2n_var    :=  TO_X01(INIT_TQ);
         FIRST_TIME := false;
     elsif(GSR_dly = '0') then
        case AttrSRtype(1) is
           when '1' => 
           --------------- // async SET/RESET
                   if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_TQ) = '1')))) then
                      qt2n_var  :=  TO_X01(SRVAL_TQ);
                   elsif(REV_dly = '1') then
                      qt2n_var  :=  not TO_X01(SRVAL_TQ);
                   elsif((SR_dly = '0') and (REV_dly = '0')) then
                      if(TCE_dly = '1') then
                         if(rising_edge(C3)) then
                            qt2n_var := qt2;
                         end if;
                      end if;
                   end if;

           when '0' => 
           --------------- // sync SET/RESET
                   if(rising_edge(C3)) then
                      if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_TQ) = '1')))) then
                         qt2n_var  :=  TO_X01(SRVAL_TQ);
                      elsif(REV_dly = '1') then
                         qt2n_var  :=  not TO_X01(SRVAL_TQ);
                      elsif((SR_dly = '0') and (REV_dly = '0')) then
                         if(TCE_dly = '1') then
                            qt2n_var := qt2;
                         end if;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     qt2n  <= qt2n_var  after DELAY_FFD;

  end process prcs_qt2n_reg;

--###################################################################
--#####               t1r, t2r, t3r and tr4                     #####
--###################################################################
  prcs_t1rt2rt3rt4r_rnk1:process(CLKDIV_dly, GSR_dly, SR_dly)
  variable t1r_var    : std_ulogic := TO_X01(INIT_TRANK1(0));
  variable t2r_var    : std_ulogic := TO_X01(INIT_TRANK1(1));
  variable t3r_var    : std_ulogic := TO_X01(INIT_TRANK1(2));
  variable t4r_var    : std_ulogic := TO_X01(INIT_TRANK1(3));
  variable FIRST_TIME : boolean    := true;

  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
         t1r_var    := TO_X01(INIT_TRANK1(0));
         t2r_var    := TO_X01(INIT_TRANK1(1));
         t3r_var    := TO_X01(INIT_TRANK1(2));
         t4r_var    := TO_X01(INIT_TRANK1(3));
         FIRST_TIME := false;
     elsif(GSR_dly = '0') then
        case AttrSRtype(1) is
           when '1' => 
           --------- // async SET/RESET  -- Not full featured FFs
                   if(SR_dly = '1') then
                      t1r_var  := '0';
                      t2r_var  := '0';
                      t3r_var  := '0';
                      t4r_var  := '0';
                   elsif(SR_dly = '0') then
                      if(rising_edge(CLKDIV_dly)) then
                         t1r_var  := T1_dly;
                         t2r_var  := T2_dly;
                         t3r_var  := T3_dly;
                         t4r_var  := T4_dly;
                      end if;
                   end if;

           when '0' => 
           --------- // sync SET/RESET  -- Not full featured FFs
                   if(rising_edge(C_dly)) then
                      if(SR_dly = '1') then
                         t1r_var  := '0';
                         t2r_var  := '0';
                         t3r_var  := '0';
                         t4r_var  := '0';
                      elsif(SR_dly = '0') then
                         t1r_var  := T1_dly;
                         t2r_var  := T2_dly;
                         t3r_var  := T3_dly;
                         t4r_var  := T4_dly;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     t1r  <= t1r_var  after DELAY_FFD;
     t2r  <= t2r_var  after DELAY_FFD;
     t3r  <= t3r_var  after DELAY_FFD;
     t4r  <= t4r_var  after DELAY_FFD;

  end process prcs_t1rt2rt3rt4r_rnk1;

--###################################################################
--#####                Muxes for tristate outputs               ##### 
--###################################################################
  prcs_data1_mux:process(sel, T1_dly, t1r, t3r)
  begin
    if (now > GSR_PULSE_TIME) then
       case sel is
          when "00000" | "10000" | "X0000" |
               "00100" | "10100" | "X0100" |
               "01001" | "11001" =>
                   data1 <= T1_dly after DELAY_MXD;
          when "01010" =>
                   data1 <= t3r after DELAY_MXD;
          when "11010" =>
                   data1 <= t1r after DELAY_MXD;
-- CR 458156 -- allow/enabled TRISTATE_WIDTH to be 1 in DDR mode. No func change, but removed warnings,
          when "01000" | "11000" | "X1000" => 
          when others =>
                  assert FALSE 
                  report "WARNING : DATA_RATE_TQ and/or  TRISTATE_WIDTH have illegal values."
                  severity Warning;
       end case;
    end if;
  end process prcs_data1_mux;
---------------------------------------------------------------
  prcs_data2_mux:process(sel, T2_dly, t2r, t4r)
  begin
    if (now > GSR_PULSE_TIME) then
       case sel is
          when "00000" | "00100" | "10000" |
               "10100" | "X0000" | "X0100" |
               "00X00" | "10X00" | "X0X00" |
               "01001" | "11001"  | "X1001"  =>
                   data2 <= T2_dly after DELAY_MXD;
          when "01010" =>
                   data2 <= t4r after DELAY_MXD;
          when "11010" =>
                   data2 <= t2r after DELAY_MXD;
-- CR 458156 -- allow/enabled TRISTATE_WIDTH to be 1 in DDR mode. No func change, but removed warnings,
          when "01000" | "11000" | "X1000" => 
          when others =>
                  assert FALSE 
                  report "WARNING : DATA_RATE_TQ and/or  TRISTATE_WIDTH have illegal values."
                  severity Warning;
       end case;
    end if;
  end process prcs_data2_mux;

--###################################################################
--#####        sdata_edge                                      ######
--###################################################################
  prcs_sdata:process(C_dly, C3, qt1, qt2n)
  begin
     sdata_edge <= ((qt1 and C_dly) or (qt2n and C3)) after DELAY_MXD;
  end process prcs_sdata;

--###################################################################
--#####             odata_edge                                  #####
--###################################################################
  prcs_odata:process(C_dly, qt1, qt2)
  begin
     case C_dly is
           when '0' => 
                    odata_edge <= qt2 after DELAY_MXD;
           when '1' => 
                    odata_edge <= qt1 after DELAY_MXD;
           when others =>
                    odata_edge <= '0' after DELAY_ZERO;
     end case;
  end process prcs_odata;
--###################################################################
--#####                 ddr_data                               ######
--###################################################################
  prcs_ddrdata:process(ddr_data, sdata_edge, odata_edge, AttrDdrClkEdge)
  begin
     ddr_data <= ((odata_edge and (not AttrDdrClkEdge)) or 
                    (sdata_edge and AttrDdrClkEdge)) after DELAY_ONE;
  end process prcs_ddrdata;

---////////////////////////////////////////////////////////////////////
---                       Outputs
---////////////////////////////////////////////////////////////////////
  prcs_TQ_mux:process(tqsel, data1, ddr_data, qt1, GSR_dly)

  variable FIRST_TIME : boolean := true;

  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
       TQ_zd    <=  TO_X01(INIT_TQ);
       FIRST_TIME := false;
     elsif(GSR_dly = '0') then
        if((tqsel(5 downto 4) = "01") and (tqsel(1 downto 0) = "01")) then
           TQ_zd <= '1' after DELAY_ONE;
        elsif((tqsel(5 downto 4) = "10") and (tqsel(1 downto 0) = "01")) then
           TQ_zd <= '1' after DELAY_ONE;
        elsif((tqsel(5 downto 4) = "01") and (tqsel(1 downto 0) = "10")) then
           TQ_zd <= '0' after DELAY_ONE;
        elsif((tqsel(5 downto 4) = "10") and (tqsel(1 downto 0) = "10")) then
           TQ_zd <= '0' after DELAY_ONE;
        elsif((tqsel(5 downto 4) = "01") and (tqsel(1 downto 0) = "11")) then
           TQ_zd <= '0' after DELAY_ONE;
        elsif((tqsel(5 downto 4) = "10") and (tqsel(1 downto 0) = "11")) then
           TQ_zd <= '0' after DELAY_ONE;
        elsif(tqsel(5 downto 2) = "0000") then
           TQ_zd <= data1 after DELAY_ONE;
        else

           case tqsel is
--              when "-01--01" | "-10--01" =>
--                    TQ_zd <= '1' after DELAY_ONE;
--              when "-01--10" | "-10--10" | "-01--11" | "-10--11" =>
--                    TQ_zd <= '0' after DELAY_ONE;
--              when "-----11" =>
--                    TQ_zd <= '0' after DELAY_ONE;
--              when "-0000--" =>
--                    TQ_zd <= data1 after DELAY_ONE;
              when "0010000" |  "0100100" |  "0101000" =>
                    TQ_zd <= TQ_zd after DELAY_ONE;
              when "1010000" =>
                    TQ_zd <= qt1 after DELAY_ONE;
              when "1100100" | "1101000" =>
                    TQ_zd <= ddr_data after DELAY_ONE;
              when others =>
                    TQ_zd <= ddr_data after DELAY_ONE;
           end case;
        end if;
     end if;
  end process prcs_TQ_mux;
--####################################################################

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_output:process(TQ_zd)
  begin
      TQ <= TQ_zd;
  end process prcs_output;


end X_IOT_V;


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.vcomponents.all;

----- CELL X_OSERDES -----
-- //////////////////////////////////////////////////////////// 
-- //////////////////////// X_OSERDES /////////////////////////
-- //////////////////////////////////////////////////////////// 

entity X_OSERDES is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

      tipd_CLK			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_CLKDIV		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_D1			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_D2			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_D3			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_D4			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_D5			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_D6			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_REV			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_SR			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_SHIFTIN1		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_SHIFTIN2		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_OCE			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_T1			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_T2			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_T3			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_T4			: VitalDelayType01 := (0 ps, 0 ps);
      tipd_TCE			: VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_CLK_OQ		: VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLK_SHIFTOUT1		: VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLK_SHIFTOUT2		: VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLK_TQ		: VitalDelayType01 := (100 ps, 100 ps);
      tpd_T1_TQ		        : VitalDelayType01 := (100 ps, 100 ps);
      tbpd_T1_TQ_CLK	        : VitalDelayType01 := (100 ps, 100 ps);

--  VITAL async rest-to-output path delay variables
      tpd_REV_OQ		: VitalDelayType01 := (0 ps, 0 ps);
      tpd_REV_TQ		: VitalDelayType01 := (0 ps, 0 ps);
      tbpd_REV_TQ_CLKDIV        : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_REV_OQ_CLKDIV        : VitalDelayType01 := (0 ps, 0 ps);


--  VITAL async set-to-output path delay variables
      tpd_SR_OQ			: VitalDelayType01 := (0 ps, 0 ps);
      tpd_SR_TQ			: VitalDelayType01 := (0 ps, 0 ps);
      tbpd_SR_TQ_CLKDIV        : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_SR_OQ_CLKDIV        : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL ticd & tisd variables

      ticd_CLK			: VitalDelayType := 0.0 ps;
      ticd_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_D1_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_D2_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_D3_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_D4_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_D5_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_D6_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_OCE_CLK		: VitalDelayType := 0.0 ps;
      tisd_REV_CLK		: VitalDelayType := 0.0 ps;
      tisd_REV_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_SHIFTIN1_CLKDIV	: VitalDelayType := 0.0 ps;
      tisd_SHIFTIN2_CLKDIV	: VitalDelayType := 0.0 ps;
      tisd_SR_CLK		: VitalDelayType := 0.0 ps;
      tisd_SR_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_T1_CLK		: VitalDelayType := 0.0 ps;
      tisd_T2_CLK		: VitalDelayType := 0.0 ps;
      tisd_T1_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_T2_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_T3_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_T4_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_TCE_CLK		: VitalDelayType := 0.0 ps;

--  VITAL Setup/Hold delay variables

      tsetup_D1_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_D1_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_D1_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_D1_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_D2_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_D2_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_D2_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_D2_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_D3_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_D3_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_D3_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_D3_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_D4_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_D4_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_D4_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_D4_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_D5_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_D5_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_D5_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_D5_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_D6_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_D6_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_D6_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_D6_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_T1_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_T1_CLK_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_T1_CLK_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_T1_CLK_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_T1_CLK_posedge_negedge : VitalDelayType := 0.0 ps;
      tsetup_T1_CLK_negedge_negedge : VitalDelayType := 0.0 ps;
      thold_T1_CLK_posedge_negedge  : VitalDelayType := 0.0 ps;
      thold_T1_CLK_negedge_negedge  : VitalDelayType := 0.0 ps;

      tsetup_T1_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_T1_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_T1_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_T1_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_T2_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_T2_CLK_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_T2_CLK_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_T2_CLK_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_T2_CLK_posedge_negedge : VitalDelayType := 0.0 ps;
      tsetup_T2_CLK_negedge_negedge : VitalDelayType := 0.0 ps;
      thold_T2_CLK_posedge_negedge  : VitalDelayType := 0.0 ps;
      thold_T2_CLK_negedge_negedge  : VitalDelayType := 0.0 ps;

      tsetup_T2_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_T2_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_T2_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_T2_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_T3_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_T3_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_T3_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_T3_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_T4_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_T4_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_T4_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_T4_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_OCE_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_OCE_CLK_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_OCE_CLK_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_OCE_CLK_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_TCE_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_TCE_CLK_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_TCE_CLK_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_TCE_CLK_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_REV_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_REV_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_REV_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_REV_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_REV_CLKDIV_posedge_negedge : VitalDelayType := 0.0 ps;
      tsetup_REV_CLKDIV_negedge_negedge : VitalDelayType := 0.0 ps;
      thold_REV_CLKDIV_posedge_negedge  : VitalDelayType := 0.0 ps;
      thold_REV_CLKDIV_negedge_negedge  : VitalDelayType := 0.0 ps;

      tsetup_SR_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_SR_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_SR_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_SR_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_SR_CLKDIV_posedge_negedge : VitalDelayType := 0.0 ps;
      tsetup_SR_CLKDIV_negedge_negedge : VitalDelayType := 0.0 ps;
      thold_SR_CLKDIV_posedge_negedge  : VitalDelayType := 0.0 ps;
      thold_SR_CLKDIV_negedge_negedge  : VitalDelayType := 0.0 ps;

-- VITAL pulse width variables
      tpw_CLK_posedge		: VitalDelayType := 0 ps;
      tpw_CLK_negedge		: VitalDelayType := 0 ps;
      tpw_CLKDIV_posedge	: VitalDelayType := 0 ps;
      tpw_CLKDIV_negedge	: VitalDelayType := 0 ps;
      tpw_REV_posedge		: VitalDelayType := 0 ps;
      tpw_SR_posedge		: VitalDelayType := 0 ps;

-- VITAL period variables
      tperiod_CLK_posedge	: VitalDelayType := 0 ps;
      tperiod_CLKDIV_posedge	: VitalDelayType := 0 ps;

-- VITAL recovery time variables
      trecovery_REV_CLK_negedge_posedge		: VitalDelayType := 0 ps;
      trecovery_REV_CLK_negedge_negedge		: VitalDelayType := 0 ps;
      trecovery_SR_CLK_negedge_posedge		: VitalDelayType := 0 ps;
      trecovery_SR_CLK_negedge_negedge		: VitalDelayType := 0 ps;
      trecovery_SR_CLKDIV_negedge_posedge	: VitalDelayType := 0 ps;

-- VITAL removal time variables
      tremoval_REV_CLK_negedge_posedge		: VitalDelayType := 0 ps;
      tremoval_REV_CLK_negedge_negedge		: VitalDelayType := 0 ps;
      tremoval_SR_CLK_negedge_posedge		: VitalDelayType := 0 ps;
      tremoval_SR_CLK_negedge_negedge		: VitalDelayType := 0 ps;
      tremoval_SR_CLKDIV_negedge_posedge	: VitalDelayType := 0 ps;

      DDR_CLK_EDGE		: string	:= "SAME_EDGE";
      INIT_LOADCNT		: bit_vector(3 downto 0) := "0000";
      INIT_ORANK1		: bit_vector(5 downto 0) := "000000";
      INIT_ORANK2_PARTIAL	: bit_vector(3 downto 0) := "0000";
      INIT_TRANK1		: bit_vector(3 downto 0) := "0000";
      SERDES			: boolean	:= TRUE;
      SRTYPE			: string	:= "ASYNC";

      DATA_RATE_OQ	: string	:= "DDR";
      DATA_RATE_TQ	: string	:= "DDR";
      DATA_WIDTH	: integer	:= 4;
      INIT_OQ		: bit		:= '0';
      INIT_TQ		: bit		:= '0';
      SERDES_MODE	: string	:= "MASTER";
      SRVAL_OQ		: bit		:= '0';
      SRVAL_TQ		: bit		:= '0';
      TRISTATE_WIDTH	: integer	:= 4
      );

  port(
      OQ		: out std_ulogic;
      SHIFTOUT1		: out std_ulogic;
      SHIFTOUT2		: out std_ulogic;
      TQ		: out std_ulogic;

      CLK		: in std_ulogic;
      CLKDIV		: in std_ulogic;
      D1		: in std_ulogic;
      D2		: in std_ulogic;
      D3		: in std_ulogic;
      D4		: in std_ulogic;
      D5		: in std_ulogic;
      D6		: in std_ulogic;
      OCE		: in std_ulogic;
      REV	        : in std_ulogic;
      SHIFTIN1		: in std_ulogic;
      SHIFTIN2		: in std_ulogic;
      SR	        : in std_ulogic;
      T1		: in std_ulogic;
      T2		: in std_ulogic;
      T3		: in std_ulogic;
      T4		: in std_ulogic;
      TCE		: in std_ulogic
      );

  attribute VITAL_LEVEL0 of
    X_OSERDES : entity is true;

end X_OSERDES;

architecture X_OSERDES_V OF X_OSERDES is

--  attribute VITAL_LEVEL0 of
--    X_OSERDES_V : architecture is true;


component X_IOOUT
  generic(
         SERDES                 : boolean;
         SERDES_MODE            : string;
         DATA_RATE_OQ           : string;
         DATA_WIDTH             : integer;
         DDR_CLK_EDGE           : string;
         INIT_OQ                : bit;
         SRVAL_OQ               : bit;
         INIT_ORANK1            : bit_vector(5 downto 0);
         INIT_ORANK2_PARTIAL    : bit_vector(3 downto 0);
         INIT_LOADCNT           : bit_vector(3 downto 0);
         SRTYPE                 : string

    );
  port(
      OQ                : out std_ulogic;
      LOAD              : out std_ulogic;
      SHIFTOUT1         : out std_ulogic;
      SHIFTOUT2         : out std_ulogic;

      C                 : in std_ulogic;
      CLKDIV            : in std_ulogic;
      GSR               : in std_ulogic;
      D1                : in std_ulogic;
      D2                : in std_ulogic;
      D3                : in std_ulogic;
      D4                : in std_ulogic;
      D5                : in std_ulogic;
      D6                : in std_ulogic;
      OCE               : in std_ulogic;
      REV               : in std_ulogic;
      SR                : in std_ulogic;
      SHIFTIN1          : in std_ulogic;
      SHIFTIN2          : in std_ulogic
    );

end component;

component X_IOT
  generic(
      DATA_RATE_TQ           : string;
      TRISTATE_WIDTH         : integer;
      DDR_CLK_EDGE           : string;
      INIT_TQ                : bit;
      INIT_TRANK1            : bit_vector(3 downto 0);
      SRVAL_TQ               : bit;
      SRTYPE                 : string
    );
  port(
      TQ                : out std_ulogic;

      C                 : in std_ulogic;
      CLKDIV            : in std_ulogic;
      GSR               : in std_ulogic;
      LOAD              : in std_ulogic;
      REV               : in std_ulogic;
      SR                 : in std_ulogic;
      T1                : in std_ulogic;
      T2                : in std_ulogic;
      T3                : in std_ulogic;
      T4                : in std_ulogic;
      TCE               : in std_ulogic
    );

end component;

  constant SYNC_PATH_DELAY	: time := 100 ps;

  signal load_int		: std_ulogic := 'X';

  signal CLK_ipd                : std_ulogic := 'X';
  signal CLKDIV_ipd             : std_ulogic := 'X';
  signal D1_ipd                 : std_ulogic := 'X';
  signal D2_ipd                 : std_ulogic := 'X';
  signal D3_ipd                 : std_ulogic := 'X';
  signal D4_ipd                 : std_ulogic := 'X';
  signal D5_ipd                 : std_ulogic := 'X';
  signal D6_ipd                 : std_ulogic := 'X';
  signal GSR_ipd                : std_ulogic := 'X';
  signal OCE_ipd                : std_ulogic := 'X';
  signal REV_ipd                : std_ulogic := 'X';
  signal SR_ipd                  : std_ulogic := 'X';
  signal SHIFTIN1_ipd           : std_ulogic := 'X';
  signal SHIFTIN2_ipd           : std_ulogic := 'X';
  signal TCE_ipd                : std_ulogic := 'X';
  signal T1_ipd                 : std_ulogic := 'X';
  signal T2_ipd                 : std_ulogic := 'X';
  signal T3_ipd                 : std_ulogic := 'X';
  signal T4_ipd                 : std_ulogic := 'X';

  signal CLK_dly                : std_ulogic := 'X';
  signal CLKDIV_dly             : std_ulogic := 'X';
  signal D1_dly                 : std_ulogic := 'X';
  signal D2_dly                 : std_ulogic := 'X';
  signal D3_dly                 : std_ulogic := 'X';
  signal D4_dly                 : std_ulogic := 'X';
  signal D5_dly                 : std_ulogic := 'X';
  signal D6_dly                 : std_ulogic := 'X';
  signal GSR_dly                : std_ulogic := '0';
  signal OCE_dly                : std_ulogic := 'X';
  signal REV_dly                : std_ulogic := 'X';
  signal SR_dly                  : std_ulogic := 'X';
  signal SHIFTIN1_dly           : std_ulogic := 'X';
  signal SHIFTIN2_dly           : std_ulogic := 'X';
  signal TCE_dly                : std_ulogic := 'X';
  signal T1_dly                 : std_ulogic := 'X';
  signal T2_dly                 : std_ulogic := 'X';
  signal T3_dly                 : std_ulogic := 'X';
  signal T4_dly                 : std_ulogic := 'X';

  signal CLKD                   : std_ulogic := 'X';
  signal CLKDIVD                : std_ulogic := 'X';

  signal OQ_zd                  : std_ulogic := 'X';
  signal SHIFTOUT1_zd           : std_ulogic := 'X';
  signal SHIFTOUT2_zd           : std_ulogic := 'X';
  signal TQ_zd                  : std_ulogic := 'X';

begin

  GSR_dly <= GSR;

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (CLK_ipd,      CLK,      tipd_CLK);
    VitalWireDelay (CLKDIV_ipd,   CLKDIV,   tipd_CLKDIV);
    VitalWireDelay (D1_ipd,       D1,       tipd_D1);
    VitalWireDelay (D2_ipd,       D2,       tipd_D2);
    VitalWireDelay (D3_ipd,       D3,       tipd_D3);
    VitalWireDelay (D4_ipd,       D4,       tipd_D4);
    VitalWireDelay (D5_ipd,       D5,       tipd_D5);
    VitalWireDelay (D6_ipd,       D6,       tipd_D6);
    VitalWireDelay (OCE_ipd,      OCE,      tipd_OCE);
    VitalWireDelay (REV_ipd,      REV,      tipd_REV);
    VitalWireDelay (SR_ipd,       SR,       tipd_SR);
    VitalWireDelay (SHIFTIN1_ipd, SHIFTIN1, tipd_SHIFTIN1);
    VitalWireDelay (SHIFTIN2_ipd, SHIFTIN2, tipd_SHIFTIN2);
    VitalWireDelay (T1_ipd,       T1,       tipd_T1);
    VitalWireDelay (T2_ipd,       T2,       tipd_T2);
    VitalWireDelay (T3_ipd,       T3,       tipd_T3);
    VitalWireDelay (T4_ipd,       T4,       tipd_T4);
    VitalWireDelay (TCE_ipd,      TCE,      tipd_TCE);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CLKDIV_dly,   CLKDIV_ipd,   ticd_CLKDIV);
    VitalSignalDelay (CLK_dly,      CLK_ipd,      ticd_CLK);
    VitalSignalDelay (D1_dly,       D1_ipd,       tisd_D1_CLKDIV);
    VitalSignalDelay (D2_dly,       D2_ipd,       tisd_D2_CLKDIV);
    VitalSignalDelay (D3_dly,       D3_ipd,       tisd_D3_CLKDIV);
    VitalSignalDelay (D4_dly,       D4_ipd,       tisd_D4_CLKDIV);
    VitalSignalDelay (D5_dly,       D5_ipd,       tisd_D5_CLKDIV);
    VitalSignalDelay (D6_dly,       D6_ipd,       tisd_D6_CLKDIV);
    VitalSignalDelay (OCE_dly,      OCE_ipd,      tisd_OCE_CLK);
    VitalSignalDelay (REV_dly,      REV_ipd,      tisd_REV_CLKDIV);
    VitalSignalDelay (SR_dly,       SR_ipd,       tisd_SR_CLKDIV);
    VitalSignalDelay (SHIFTIN1_dly, SHIFTIN1_ipd, tisd_SHIFTIN1_CLKDIV);
    VitalSignalDelay (SHIFTIN2_dly, SHIFTIN2_ipd, tisd_SHIFTIN2_CLKDIV);
    VitalSignalDelay (T1_dly,       T1_ipd,       tisd_T1_CLKDIV);
    VitalSignalDelay (T2_dly,       T2_ipd,       tisd_T2_CLKDIV);
    VitalSignalDelay (T3_dly,       T3_ipd,       tisd_T3_CLKDIV);
    VitalSignalDelay (T4_dly,       T4_ipd,       tisd_T4_CLKDIV);
    VitalSignalDelay (TCE_dly,      TCE_ipd,      tisd_TCE_CLK);
  end block;




--  Delay the clock 100 ps to match the HW
  CLKD    <= CLK_dly after 0 ps;
  CLKDIVD <= CLKDIV_dly after 0 ps;
------------------------------------------------------------------
-----------    Instant X_IOOUT  -----------------------------------
------------------------------------------------------------------
  INST_X_IOOUT: X_IOOUT
  generic map (
      SERDES			=> SERDES,
      SERDES_MODE		=> SERDES_MODE,
      DATA_RATE_OQ		=> DATA_RATE_OQ,
      DATA_WIDTH                => DATA_WIDTH,
      DDR_CLK_EDGE		=> DDR_CLK_EDGE,
      INIT_OQ			=> INIT_OQ,
      SRVAL_OQ			=> SRVAL_OQ,
      INIT_ORANK1		=> INIT_ORANK1,
      INIT_ORANK2_PARTIAL	=> INIT_ORANK2_PARTIAL,
      INIT_LOADCNT		=> INIT_LOADCNT,
      SRTYPE			=> SRTYPE
     )
  port map (
      OQ			=> OQ_zd,
      LOAD			=> LOAD_int,
      SHIFTOUT1			=> SHIFTOUT1_zd,
      SHIFTOUT2			=> SHIFTOUT2_zd,
      C				=> CLKD,
      CLKDIV			=> CLKDIVD,
      GSR			=> GSR_dly,
      D1			=> D1_dly,
      D2			=> D2_dly,
      D3			=> D3_dly,
      D4			=> D4_dly,
      D5			=> D5_dly,
      D6			=> D6_dly,
      OCE			=> OCE_dly,
      REV			=> REV_dly,
      SR			=> SR_dly,
      SHIFTIN1			=> SHIFTIN1_dly,
      SHIFTIN2			=> SHIFTIN2_dly
      );
------------------------------------------------------------------
-----------    Instant TRI_OUT  ----------------------------------
------------------------------------------------------------------
  INST_X_IOT: X_IOT
  generic map (
      DATA_RATE_TQ		=> DATA_RATE_TQ,
      TRISTATE_WIDTH		=> TRISTATE_WIDTH,
      DDR_CLK_EDGE		=> DDR_CLK_EDGE,
      INIT_TQ			=> INIT_TQ,
      INIT_TRANK1		=> INIT_TRANK1,
      SRVAL_TQ			=> SRVAL_TQ,
      SRTYPE			=> SRTYPE
     )
  port map (
      TQ			=> TQ_zd,

      C				=> CLKD,
      CLKDIV			=> CLKDIVD,
      GSR			=> GSR_dly,
      LOAD			=> LOAD_int,
      REV			=> REV_dly,
      SR			=> SR_dly,
      T1			=> T1_dly,
      T2			=> T2_dly,
      T3			=> T3_dly,
      T4			=> T4_dly,
      TCE			=> TCE_dly
      );

--####################################################################

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################

  prcs_output:process
--  Pin Timing Violations (all input pins)
     variable Tviol_D1_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_D1_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_D2_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_D2_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_D3_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_D3_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_D4_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_D4_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_D5_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_D5_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_D6_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_D6_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_T1_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_T1_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_T1_CLK_negedge : STD_ULOGIC := '0';
     variable  Tmkr_T1_CLK_negedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_T2_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_T2_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_T2_CLK_negedge : STD_ULOGIC := '0';
     variable  Tmkr_T2_CLK_negedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_T1_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_T1_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_T2_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_T2_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_T3_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_T3_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_T4_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_T4_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_OCE_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_OCE_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_TCE_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_TCE_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_REV_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_REV_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_REV_CLK_negedge : STD_ULOGIC := '0';
     variable  Tmkr_REV_CLK_negedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_REV_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_REV_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_REV_CLKDIV_negedge : STD_ULOGIC := '0';
     variable  Tmkr_REV_CLKDIV_negedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_SR_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_SR_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_SR_CLK_negedge : STD_ULOGIC := '0';
     variable  Tmkr_SR_CLK_negedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_SR_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_SR_CLKDIV_negedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_SR_CLKDIV_negedge : STD_ULOGIC := '0';
     variable  Tmkr_SR_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;

--  Output Pin glitch declaration
     variable  OQ_GlitchData : VitalGlitchDataType;
     variable  SHIFTOUT1_GlitchData : VitalGlitchDataType;
     variable  SHIFTOUT2_GlitchData : VitalGlitchDataType;
     variable  TQ_GlitchData : VitalGlitchDataType;
begin

--  Setup/Hold Check Violations (all input pins)

     if (TimingChecksOn) then
     VitalSetupHoldCheck
       (
         Violation      => Tviol_D1_CLKDIV_posedge,
         TimingData     => Tmkr_D1_CLKDIV_posedge,
         TestSignal     => D1_dly,
         TestSignalName => "D1",
         TestDelay      => tisd_D1_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_D1_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_D1_CLKDIV_negedge_posedge,
         HoldLow        => thold_D1_CLKDIV_posedge_posedge,
         HoldHigh       => thold_D1_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_D2_CLKDIV_posedge,
         TimingData     => Tmkr_D2_CLKDIV_posedge,
         TestSignal     => D2_dly,
         TestSignalName => "D2",
         TestDelay      => tisd_D2_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_D2_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_D2_CLKDIV_negedge_posedge,
         HoldLow        => thold_D2_CLKDIV_posedge_posedge,
         HoldHigh       => thold_D2_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_D3_CLKDIV_posedge,
         TimingData     => Tmkr_D3_CLKDIV_posedge,
         TestSignal     => D3_dly,
         TestSignalName => "D3",
         TestDelay      => tisd_D3_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_D3_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_D3_CLKDIV_negedge_posedge,
         HoldLow        => thold_D3_CLKDIV_posedge_posedge,
         HoldHigh       => thold_D3_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_D4_CLKDIV_posedge,
         TimingData     => Tmkr_D4_CLKDIV_posedge,
         TestSignal     => D4_dly,
         TestSignalName => "D4",
         TestDelay      => tisd_D4_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_D4_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_D4_CLKDIV_negedge_posedge,
         HoldLow        => thold_D4_CLKDIV_posedge_posedge,
         HoldHigh       => thold_D4_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_D5_CLKDIV_posedge,
         TimingData     => Tmkr_D5_CLKDIV_posedge,
         TestSignal     => D5_dly,
         TestSignalName => "D5",
         TestDelay      => tisd_D5_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_D5_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_D5_CLKDIV_negedge_posedge,
         HoldLow        => thold_D5_CLKDIV_posedge_posedge,
         HoldHigh       => thold_D5_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_D6_CLKDIV_posedge,
         TimingData     => Tmkr_D6_CLKDIV_posedge,
         TestSignal     => D6_dly,
         TestSignalName => "D6",
         TestDelay      => tisd_D6_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_D6_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_D6_CLKDIV_negedge_posedge,
         HoldLow        => thold_D6_CLKDIV_posedge_posedge,
         HoldHigh       => thold_D6_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_T1_CLK_posedge,
         TimingData     => Tmkr_T1_CLK_posedge,
         TestSignal     => T1_dly,
         TestSignalName => "T1",
         TestDelay      => tisd_T1_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_T1_CLK_posedge_posedge,
         SetupLow       => tsetup_T1_CLK_negedge_posedge,
         HoldLow        => thold_T1_CLK_posedge_posedge,
         HoldHigh       => thold_T1_CLK_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_T2_CLK_posedge,
         TimingData     => Tmkr_T2_CLK_posedge,
         TestSignal     => T2_dly,
         TestSignalName => "T2",
         TestDelay      => tisd_T2_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_T2_CLK_posedge_posedge,
         SetupLow       => tsetup_T2_CLK_negedge_posedge,
         HoldLow        => thold_T2_CLK_posedge_posedge,
         HoldHigh       => thold_T2_CLK_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
-- CR 210819 ---------------------
     if(DATA_RATE_TQ = "DDR") then
        VitalSetupHoldCheck
          (
            Violation      => Tviol_T1_CLK_negedge,
            TimingData     => Tmkr_T1_CLK_negedge,
            TestSignal     => T1_dly,
            TestSignalName => "T1",
            TestDelay      => tisd_T1_CLK,
            RefSignal      => CLK_dly,
            RefSignalName  => "CLK",
            RefDelay       => ticd_CLK,
            SetupHigh      => tsetup_T1_CLK_posedge_negedge,
            SetupLow       => tsetup_T1_CLK_negedge_negedge,
            HoldLow        => thold_T1_CLK_posedge_negedge,
            HoldHigh       => thold_T1_CLK_negedge_negedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'F',
            HeaderMsg      => InstancePath & "/X_OSERDES",
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => Error
          );
        VitalSetupHoldCheck
          (
            Violation      => Tviol_T2_CLK_negedge,
            TimingData     => Tmkr_T2_CLK_negedge,
            TestSignal     => T2_dly,
            TestSignalName => "T2",
            TestDelay      => tisd_T2_CLK,
            RefSignal      => CLK_dly,
            RefSignalName  => "CLK",
            RefDelay       => ticd_CLK,
            SetupHigh      => tsetup_T2_CLK_posedge_negedge,
            SetupLow       => tsetup_T2_CLK_negedge_negedge,
            HoldLow        => thold_T2_CLK_posedge_negedge,
            HoldHigh       => thold_T2_CLK_negedge_negedge,
            CheckEnabled   => TRUE,
            RefTransition  => 'F',
            HeaderMsg      => InstancePath & "/X_OSERDES",
            Xon            => Xon,
            MsgOn          => MsgOn,
            MsgSeverity    => Error
          );

     end if;

     VitalRecoveryRemovalCheck (
       Violation      => Tviol_REV_CLK_posedge,
       TimingData     => Tmkr_REV_CLK_posedge,
       TestSignal     => REV_dly,
       TestSignalName => "REV",
       TestDelay      => tisd_REV_CLK,
       RefSignal      => CLK_dly,
       RefSignalName  => "CLK",
       RefDelay       => ticd_CLK,
       Recovery       => trecovery_REV_CLK_negedge_posedge,
       Removal        => tremoval_REV_CLK_negedge_posedge,
       ActiveLow      => false,
       CheckEnabled   => TO_X01(GSR_dly) /= '1',
       RefTransition  => 'R',
       HeaderMsg      => InstancePath & "/X_OSERDES",
       Xon            => Xon,
       MsgOn          => true,
       MsgSeverity    => Warning
     );

     VitalRecoveryRemovalCheck (
       Violation      => Tviol_SR_CLK_posedge,
       TimingData     => Tmkr_SR_CLK_posedge,
       TestSignal     => SR_dly,
       TestSignalName => "SR",
       TestDelay      => tisd_SR_CLK,
       RefSignal      => CLK_dly,
       RefSignalName  => "CLK",
       RefDelay       => ticd_CLK,
       Recovery       => trecovery_SR_CLK_negedge_posedge,
       Removal        => tremoval_SR_CLK_negedge_posedge,
       ActiveLow      => false,
       CheckEnabled   => TO_X01(GSR_dly) /= '1',
       RefTransition  => 'R',
       HeaderMsg      => InstancePath & "/X_OSERDES",
       Xon            => Xon,
       MsgOn          => true,
       MsgSeverity    => Warning
     );
     if(DATA_RATE_TQ = "DDR") then
        VitalRecoveryRemovalCheck (
          Violation      => Tviol_REV_CLK_negedge,
          TimingData     => Tmkr_REV_CLK_negedge,
          TestSignal     => REV_dly,
          TestSignalName => "REV",
          TestDelay      => tisd_REV_CLK,
          RefSignal      => CLK_dly,
          RefSignalName  => "CLK",
          RefDelay       => ticd_CLK,
          Recovery       => trecovery_REV_CLK_negedge_negedge,
          Removal        => tremoval_REV_CLK_negedge_negedge,
          ActiveLow      => false,
          CheckEnabled   => TO_X01(GSR_dly) /= '1',
          RefTransition  => 'F',
          HeaderMsg      => InstancePath & "/X_OSERDES",
          Xon            => Xon,
          MsgOn          => true,
          MsgSeverity    => Warning
        );
        VitalRecoveryRemovalCheck (
          Violation      => Tviol_SR_CLK_negedge,
          TimingData     => Tmkr_SR_CLK_negedge,
          TestSignal     => SR_dly,
          TestSignalName => "SR",
          TestDelay      => tisd_SR_CLK,
          RefSignal      => CLK_dly,
          RefSignalName  => "CLK",
          RefDelay       => ticd_CLK,
          Recovery       => trecovery_SR_CLK_negedge_negedge,
          Removal        => tremoval_SR_CLK_negedge_negedge,
          ActiveLow      => false,
          CheckEnabled   => TO_X01(GSR_dly) /= '1',
          RefTransition  => 'F',
          HeaderMsg      => InstancePath & "/X_OSERDES",
          Xon            => Xon,
          MsgOn          => true,
          MsgSeverity    => Warning
        );
     end if;
---------------------------
     VitalSetupHoldCheck
       (
         Violation      => Tviol_T1_CLKDIV_posedge,
         TimingData     => Tmkr_T1_CLKDIV_posedge,
         TestSignal     => T1_dly,
         TestSignalName => "T1",
         TestDelay      => tisd_T1_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_T1_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_T1_CLKDIV_negedge_posedge,
         HoldLow        => thold_T1_CLKDIV_posedge_posedge,
         HoldHigh       => thold_T1_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_T2_CLKDIV_posedge,
         TimingData     => Tmkr_T2_CLKDIV_posedge,
         TestSignal     => T2_dly,
         TestSignalName => "T2",
         TestDelay      => tisd_T2_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_T2_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_T2_CLKDIV_negedge_posedge,
         HoldLow        => thold_T2_CLKDIV_posedge_posedge,
         HoldHigh       => thold_T2_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_T3_CLKDIV_posedge,
         TimingData     => Tmkr_T3_CLKDIV_posedge,
         TestSignal     => T3_dly,
         TestSignalName => "T3",
         TestDelay      => tisd_T3_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_T3_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_T3_CLKDIV_negedge_posedge,
         HoldLow        => thold_T3_CLKDIV_posedge_posedge,
         HoldHigh       => thold_T3_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_T4_CLKDIV_posedge,
         TimingData     => Tmkr_T4_CLKDIV_posedge,
         TestSignal     => T4_dly,
         TestSignalName => "T4",
         TestDelay      => tisd_T4_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_T4_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_T4_CLKDIV_negedge_posedge,
         HoldLow        => thold_T4_CLKDIV_posedge_posedge,
         HoldHigh       => thold_T4_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_OCE_CLK_posedge,
         TimingData     => Tmkr_OCE_CLK_posedge,
         TestSignal     => OCE_dly,
         TestSignalName => "OCE",
         TestDelay      => tisd_OCE_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_OCE_CLK_posedge_posedge,
         SetupLow       => tsetup_OCE_CLK_negedge_posedge,
         HoldLow        => thold_OCE_CLK_posedge_posedge,
         HoldHigh       => thold_OCE_CLK_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_TCE_CLK_posedge,
         TimingData     => Tmkr_TCE_CLK_posedge,
         TestSignal     => TCE_dly,
         TestSignalName => "TCE",
         TestDelay      => tisd_TCE_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_TCE_CLK_posedge_posedge,
         SetupLow       => tsetup_TCE_CLK_negedge_posedge,
         HoldLow        => thold_TCE_CLK_posedge_posedge,
         HoldHigh       => thold_TCE_CLK_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_SR_CLKDIV_posedge,
         TimingData     => Tmkr_SR_CLKDIV_posedge,
         TestSignal     => SR_dly,
         TestSignalName => "SR",
         TestDelay      => tisd_SR_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_SR_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_SR_CLKDIV_negedge_posedge,
         HoldLow        => thold_SR_CLKDIV_posedge_posedge,
         HoldHigh       => thold_SR_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_SR_CLKDIV_negedge,
         TimingData     => Tmkr_SR_CLKDIV_negedge,
         TestSignal     => SR_dly,
         TestSignalName => "SR",
         TestDelay      => tisd_SR_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_SR_CLKDIV_posedge_negedge,
         SetupLow       => tsetup_SR_CLKDIV_negedge_negedge,
         HoldLow        => thold_SR_CLKDIV_posedge_negedge,
         HoldHigh       => thold_SR_CLKDIV_negedge_negedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'F',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_REV_CLKDIV_posedge,
         TimingData     => Tmkr_REV_CLKDIV_posedge,
         TestSignal     => REV_dly,
         TestSignalName => "REV",
         TestDelay      => tisd_REV_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_REV_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_REV_CLKDIV_negedge_posedge,
         HoldLow        => thold_REV_CLKDIV_posedge_posedge,
         HoldHigh       => thold_REV_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_REV_CLKDIV_negedge,
         TimingData     => Tmkr_REV_CLKDIV_negedge,
         TestSignal     => REV_dly,
         TestSignalName => "REV",
         TestDelay      => tisd_REV_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_REV_CLKDIV_posedge_negedge,
         SetupLow       => tsetup_REV_CLKDIV_negedge_negedge,
         HoldLow        => thold_REV_CLKDIV_posedge_negedge,
         HoldHigh       => thold_REV_CLKDIV_negedge_negedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'F',
         HeaderMsg      => InstancePath & "/X_OSERDES",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     end if;
-- End of (TimingChecksOn)

--  Output-to-Clock path delay
     VitalPathDelay01
       (
         OutSignal     => OQ,
         GlitchData    => OQ_GlitchData,
         OutSignalName => "OQ",
         OutTemp       => OQ_zd,
         Paths         => (0 => (CLK_dly'last_event, tpd_CLK_OQ,TRUE),
                           1 => (REV_dly'last_event, tpd_REV_OQ,TRUE),
                           2 => (SR_dly'last_event, tpd_SR_OQ,TRUE)),
         Mode          => VitalTransport,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => TQ,
         GlitchData    => TQ_GlitchData,
         OutSignalName => "TQ",
         OutTemp       => TQ_zd,
         Paths         => (0 => (CLK_dly'last_event, tpd_CLK_TQ,TRUE),
                           1 => (REV_dly'last_event, tpd_REV_TQ,TRUE),
                           2 => (SR_dly'last_event, tpd_SR_TQ,TRUE),
                           3 => (T1_dly'last_event, tpd_T1_TQ,TRUE)),
         Mode          => VitalTransport,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );

--     VitalPathDelay01
--       (
--         OutSignal     => OQ,
--         GlitchData    => OQ_GlitchData,
--         OutSignalName => "OQ",
--         OutTemp       => OQ_zd,
--         Paths         => (0 => (SR_dly'last_event, tpd_SR_OQ,TRUE)),
--         Mode          => VitalTransport,
--         Xon           => Xon,
--         MsgOn         => MsgOn,
--         MsgSeverity   => WARNING
--       );
--     VitalPathDelay01
--       (
--         OutSignal     => TQ,
--         GlitchData    => TQ_GlitchData,
--         OutSignalName => "TQ",
--         OutTemp       => TQ_zd,
--         Paths         => (0 => (SR_dly'last_event, tpd_SR_TQ,TRUE)),
--         Mode          => VitalTransport,
--         Xon           => Xon,
--         MsgOn         => MsgOn,
--         MsgSeverity   => WARNING
--       );

     if(SHIFTOUT1_zd'event) then
        VitalPathDelay01
          (
            OutSignal     => SHIFTOUT1,
            GlitchData    => SHIFTOUT1_GlitchData,
            OutSignalName => "SHIFTOUT1",
            OutTemp       => SHIFTOUT1_zd,
            Paths         => (0 => (CLK_dly'last_event, tpd_CLK_SHIFTOUT1,TRUE)),
            Mode          => VitalTransport,
            Xon           => Xon,
            MsgOn         => MsgOn,
            MsgSeverity   => WARNING
          );
     end if;
     if(SHIFTOUT2_zd'event) then
        VitalPathDelay01
          (
            OutSignal     => SHIFTOUT2,
            GlitchData    => SHIFTOUT2_GlitchData,
            OutSignalName => "SHIFTOUT2",
            OutTemp       => SHIFTOUT2_zd,
            Paths         => (0 => (CLK_dly'last_event, tpd_CLK_SHIFTOUT2,TRUE)),
            Mode          => VitalTransport,
            Xon           => Xon,
            MsgOn         => MsgOn,
            MsgSeverity   => WARNING
          );
     end if;
--  Wait signal (input/output pins)
   wait on
     D1_dly,
     D2_dly,
     D3_dly,
     D4_dly,
     D5_dly,
     D6_dly,
     T1_dly,
     T2_dly,
     T3_dly,
     T4_dly,
     CLK_dly,
     OCE_dly,
     TCE_dly,
     SR_dly,
     REV_dly,
     CLKDIV_dly,
     SHIFTIN1_dly,
     SHIFTIN2_dly,
     OQ_zd,
     TQ_zd,
     SHIFTOUT1_zd,
     SHIFTOUT2_zd;
  end process prcs_output;

end X_OSERDES_V;

