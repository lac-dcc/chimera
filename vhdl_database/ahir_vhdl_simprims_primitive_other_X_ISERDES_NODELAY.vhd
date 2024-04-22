-------------------------------------------------------------------------------
-- Copyright (c) 2005 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Source Synchronous Input Deserializer without delay element
-- /___/   /\     Filename : X_ISERDES_NODELAY.vhd
-- \   \  /  \    Timestamp : Fri Oct 21 16:11:37 PDT 2005
--  \___\/\___\
--
-- Revision:
--    10/21/05 - Initial version.
--    05/29/06 - CR 232324 -- Added Rec/Rem RST wrt negedge CLKDIV.
--    06/16/06 - Added new port CLKB.
--    07/24/06 - Fixed VCS VITAL compile issues.
--    08/26/06 - CR 422392 -- OFB, TFB ports added. 
--    09/14/06 - CR 423526 -- Removed TFB port. 
--    09/26/06 - Added Async Vitral Path for RST
--    10/13/06 - CR 426606
--    03/02/07 - CR 435001 changed module names to bscntrl_nodelay and ice_module_nodelay
--    08/29/07 - CR 447556 Fixed attribute INTERFACE_TYPE to be case insensitive 
--    09/10/07 - CR 447760 Added Strict DRC for BITSLIP and INTERFACE_TYPE combinations
--    12/03/07 - CR 454107 Added DRC warnings for INTERFACE_TYPE, DATA_RATE and DATA_WIDTH combinations
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision

----- CELL X_ISERDES_NODELAY -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;
use simprim.vcomponents.all;

--//////////////////////////////////////////////////////////// 
--////////////////// BSCNTRL_NODELAY /////////////////////////
--//////////////////////////////////////////////////////////// 
entity bscntrl_nodelay is
  generic(
      SRTYPE        : string;
      INIT_BITSLIPCNT	: bit_vector(3 downto 0)
      );
  port(
      CLKDIV_INT	: out std_ulogic;
      MUXC		: out std_ulogic;

      BITSLIP		: in std_ulogic;
      C23		: in std_ulogic;
      C45		: in std_ulogic;
      C67		: in std_ulogic;
      CLK		: in std_ulogic;
      CLKDIV		: in std_ulogic;
      DATA_RATE		: in std_ulogic;
      R			: in std_ulogic;
      SEL		: in std_logic_vector (1 downto 0)
      );
           
end bscntrl_nodelay;

architecture bscntrl_nodelay_V of bscntrl_nodelay is
--  constant DELAY_FFBSC		: time       := 300 ns;
--  constant DELAY_MXBSC		: time       := 60  ns;
  constant DELAY_FFBSC			: time       := 300 ps;
  constant DELAY_MXBSC			: time       := 60  ps;

  signal AttrSRtype		: integer := 0;

  signal q1			: std_ulogic := 'X';
  signal q2			: std_ulogic := 'X';
  signal q3			: std_ulogic := 'X';
  signal mux			: std_ulogic := 'X';
  signal qhc1			: std_ulogic := 'X';
  signal qhc2			: std_ulogic := 'X';
  signal qlc1			: std_ulogic := 'X';
  signal qlc2			: std_ulogic := 'X';
  signal qr1			: std_ulogic := 'X';
  signal qr2			: std_ulogic := 'X';
  signal mux1			: std_ulogic := 'X';
  signal clkdiv_zd		: std_ulogic := 'X';

begin
--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process
  begin

     if((SRTYPE = "ASYNC") or (SRTYPE = "async")) then
        AttrSrtype <= 0;
     elsif((SRTYPE = "SYNC") or (SRTYPE = "sync")) then
        AttrSrtype <= 1;
     end if;

     wait;
  end process prcs_init;
--####################################################################
--#####              Divide by 2 - 8 counter                     #####
--####################################################################
  prcs_div_2_8_cntr:process(qr2, CLK, GSR)
  variable clkdiv_int_var	:  std_ulogic := TO_X01(INIT_BITSLIPCNT(0));
  variable q1_var		:  std_ulogic := TO_X01(INIT_BITSLIPCNT(1));
  variable q2_var		:  std_ulogic := TO_X01(INIT_BITSLIPCNT(2));
  variable q3_var		:  std_ulogic := TO_X01(INIT_BITSLIPCNT(3));
  begin
     if(GSR = '1') then
         clkdiv_int_var	:= TO_X01(INIT_BITSLIPCNT(0));
         q1_var		:= TO_X01(INIT_BITSLIPCNT(1));
         q2_var		:= TO_X01(INIT_BITSLIPCNT(2));
         q3_var		:= TO_X01(INIT_BITSLIPCNT(3));
     elsif(GSR = '0') then
        case AttrSRtype is
           when 0 => 
           --------------- // async SET/RESET
                   if(qr2 = '1') then
                      clkdiv_int_var := '0';
                      q1_var := '0';
                      q2_var := '0';
                      q3_var := '0';
                   elsif (qhc1 = '1') then
                      clkdiv_int_var := clkdiv_int_var;
                      q1_var := q1_var;
                      q2_var := q2_var;
                      q3_var := q3_var;
                   else
                      if(rising_edge(CLK)) then
                         q3_var := q2_var;
                         q2_var :=( NOT((NOT clkdiv_int_var) and (NOT q2_var)) and q1_var);
                         q1_var := clkdiv_int_var;
                         clkdiv_int_var := mux;
                      end if;
                   end if;

           when 1 => 
           --------------- // sync SET/RESET
                   if(rising_edge(CLK)) then
                      if(qr2 = '1') then
                         clkdiv_int_var := '0';
                         q1_var := '0';
                         q2_var := '0';
                         q3_var := '0';
                      elsif (qhc1 = '1') then
                         clkdiv_int_var := clkdiv_int_var;
                         q1_var := q1_var;
                         q2_var := q2_var;
                         q3_var := q3_var;
                      else
                         q3_var := q2_var;
                         q2_var :=( NOT((NOT clkdiv_int_var) and (NOT q2_var)) and q1_var);
                         q1_var := clkdiv_int_var;
                         clkdiv_int_var := mux;
                      end if;
                   end if;

           when others => 
                   null;
           end case;


     end if;

     q1 <= q1_var after DELAY_FFBSC;
     q2 <= q2_var after DELAY_FFBSC;
     q3 <= q3_var after DELAY_FFBSC;
     clkdiv_zd <= clkdiv_int_var after DELAY_FFBSC;

  end process prcs_div_2_8_cntr;
--####################################################################
--#####          Divider selections and 4:1 selector mux         #####
--####################################################################
  prcs_mux_sel:process(sel, c23 , c45 , c67 , clkdiv_zd , q1 , q2 , q3)
  begin
    case sel is
        when "00" =>
              mux <= NOT (clkdiv_zd or  (c23 and q1)) after DELAY_MXBSC;
        when "01" =>
              mux <= NOT (q1 or (c45 and q2)) after DELAY_MXBSC;
        when "10" =>
              mux <= NOT (q2 or (c67 and q3)) after DELAY_MXBSC;
        when "11" =>
              mux <= NOT (q3) after DELAY_MXBSC;
        when others =>
              mux <= NOT (clkdiv_zd or  (c23 and q1)) after DELAY_MXBSC;
    end case;
  end process prcs_mux_sel;
--####################################################################
--#####                  Bitslip control logic                   #####
--####################################################################
  prcs_logictrl:process(qr1, clkdiv)
  begin
      case AttrSRtype is
          when 0 => 
           --------------- // async SET/RESET
               if(qr1 = '1') then
                 qlc1        <= '0' after DELAY_FFBSC;
                 qlc2        <= '0' after DELAY_FFBSC;
               elsif(bitslip = '0') then
                 qlc1        <= qlc1 after DELAY_FFBSC;
                 qlc2        <= '0'  after DELAY_FFBSC;
               else 
                   if(rising_edge(clkdiv)) then
                      qlc1      <= NOT qlc1 after DELAY_FFBSC;
                      qlc2      <= (bitslip and mux1) after DELAY_FFBSC;
                   end if;
               end if;

          when 1 => 
           --------------- // sync SET/RESET
               if(rising_edge(clkdiv)) then
                  if(qr1 = '1') then
                    qlc1        <= '0' after DELAY_FFBSC;
                    qlc2        <= '0' after DELAY_FFBSC;
                  elsif(bitslip = '0') then
                    qlc1        <= qlc1 after DELAY_FFBSC;
                    qlc2        <= '0'  after DELAY_FFBSC;
                  else 
                    qlc1      <= NOT qlc1 after DELAY_FFBSC;
                    qlc2      <= (bitslip and mux1) after DELAY_FFBSC;
                  end if;
               end if;
          when others => 
                  null;
      end case;
  end process  prcs_logictrl;

--####################################################################
--#####        Mux to select between sdr "0" and ddr "1"         #####
--####################################################################
  prcs_sdr_ddr_mux:process(qlc1, DATA_RATE)
  begin
    case DATA_RATE is
        when '0' =>
             mux1 <= qlc1 after DELAY_MXBSC;
        when '1' =>
             mux1 <= '1' after DELAY_MXBSC;
        when others =>
             null;
    end case;
  end process  prcs_sdr_ddr_mux;

--####################################################################
--#####                       qhc1 and qhc2                      #####
--####################################################################
  prcs_qhc1_qhc2:process(qr2, CLK)
  begin
-- FP TMP -- should CLK and q2 have to be rising_edge
     case AttrSRtype is
        when 0 => 
         --------------- // async SET/RESET
             if(qr2 = '1') then
                qhc1 <= '0' after DELAY_FFBSC;
                qhc2 <= '0' after DELAY_FFBSC;
             elsif(rising_edge(CLK)) then
                qhc1 <= (qlc2 and (NOT qhc2)) after DELAY_FFBSC;
                qhc2 <= qlc2 after DELAY_FFBSC;
             end if;

        when 1 => 
         --------------- // sync SET/RESET
             if(rising_edge(CLK)) then
                if(qr2 = '1') then
                   qhc1 <= '0' after DELAY_FFBSC;
                   qhc2 <= '0' after DELAY_FFBSC;
                else
                   qhc1 <= (qlc2 and (NOT qhc2)) after DELAY_FFBSC;
                   qhc2 <= qlc2 after DELAY_FFBSC;
                end if;
             end if;

        when others =>
             null;
     end case;

  end process  prcs_qhc1_qhc2;

--####################################################################
--#####     Mux drives ctrl lines of mux in front of 2nd rnk FFs  ####
--####################################################################
  prcs_muxc:process(mux1, DATA_RATE)
  begin
    case DATA_RATE is
        when '0' =>
             muxc <= mux1 after DELAY_MXBSC;
        when '1' =>
             muxc <= '0'  after DELAY_MXBSC;
        when others =>
             null;
    end case;
  end process  prcs_muxc;

--####################################################################
--#####                       Asynchronous set flops             #####
--####################################################################
  prcs_qr1:process(R, CLKDIV)
  begin
-- FP TMP -- should CLKDIV and R have to be rising_edge
     case AttrSRtype is
        when 0 => 
         --------------- // async SET/RESET
             if(R = '1') then
                qr1        <= '1' after DELAY_FFBSC;
             elsif(rising_edge(CLKDIV)) then
                qr1        <= '0' after DELAY_FFBSC;
             end if;

        when 1 => 
         --------------- // sync SET/RESET
             if(rising_edge(CLKDIV)) then
                if(R = '1') then
                   qr1        <= '1' after DELAY_FFBSC;
                else
                   qr1        <= '0' after DELAY_FFBSC;
                end if;
             end if;

        when others => 
             null;
     end case;
  end process  prcs_qr1;
----------------------------------------------------------------------
  prcs_qr2:process(R, CLK)
  begin
-- FP TMP -- should CLK and R have to be rising_edge
     case AttrSRtype is
        when 0 => 
         --------------- // async SET/RESET
             if(R = '1') then
                qr2        <= '1' after DELAY_FFBSC;
             elsif(rising_edge(CLK)) then
                qr2        <= qr1 after DELAY_FFBSC;
             end if;

        when 1 => 
         --------------- // sync SET/RESET
             if(rising_edge(CLK)) then
                if(R = '1') then
                   qr2        <= '1' after DELAY_FFBSC;
                else
                   qr2        <= qr1 after DELAY_FFBSC;
                end if;
             end if;

        when others => 
             null;
     end case;
  end process  prcs_qr2;
--####################################################################
--#####                         OUTPUT                           #####
--####################################################################
  prcs_output:process(clkdiv_zd)
  begin
      CLKDIV_INT <= clkdiv_zd;
  end process prcs_output;
--####################################################################
end bscntrl_nodelay_V;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;
use simprim.vcomponents.all;

--//////////////////////////////////////////////////////////// 
--/////////////////// ICE_MODULE_NODELAY /////////////////////
--//////////////////////////////////////////////////////////// 

entity ice_module_nodelay is
  generic(
      SRTYPE  : string;
      INIT_CE : bit_vector(1 downto 0)
      );
  port(
      ICE		: out std_ulogic;

      CE1		: in std_ulogic;
      CE2		: in std_ulogic;
      NUM_CE		: in std_ulogic;
      CLKDIV		: in std_ulogic;
      R			: in std_ulogic
      );
end ice_module_nodelay;

architecture ice_module_nodelay_V of ice_module_nodelay is
--  constant DELAY_FFICE		: time := 300 ns;
--  constant DELAY_MXICE		: time := 60 ns;
  constant DELAY_FFICE			: time := 300 ps;
  constant DELAY_MXICE			: time := 60 ps;

  signal AttrSRtype		: integer := 0;

  signal ce1r			: std_ulogic := 'X';
  signal ce2r			: std_ulogic := 'X';
  signal cesel			: std_logic_vector(1 downto 0) := (others => 'X');

  signal ice_zd			: std_ulogic := 'X';

begin

--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process
  begin

     if((SRTYPE = "ASYNC") or (SRTYPE = "async")) then
        AttrSrtype <= 0;
     elsif((SRTYPE = "SYNC") or (SRTYPE = "sync")) then
        AttrSrtype <= 1;
     end if;

     wait;
  end process prcs_init;

--###################################################################
--#####                      update cesel                       #####
--###################################################################

  cesel  <= NUM_CE & CLKDIV; 

--####################################################################
--#####                         registers                        #####
--####################################################################
  prcs_reg:process(CLKDIV, GSR)
  variable ce1r_var		:  std_ulogic := TO_X01(INIT_CE(1));
  variable ce2r_var		:  std_ulogic := TO_X01(INIT_CE(0));
  begin
     if(GSR = '1') then
         ce1r_var		:= TO_X01(INIT_CE(1));
         ce2r_var		:= TO_X01(INIT_CE(0));
     elsif(GSR = '0') then
        case AttrSRtype is
           when 0 => 
            --------------- // async SET/RESET
                if(R = '1') then
                   ce1r_var := '0';
                   ce2r_var := '0';
                elsif(rising_edge(CLKDIV)) then
                   ce1r_var := ce1;
                   ce2r_var := ce2;
                end if;

           when 1 => 
            --------------- // sync SET/RESET
                if(rising_edge(CLKDIV)) then
                   if(R = '1') then
                      ce1r_var := '0';
                      ce2r_var := '0';
                   else
                      ce1r_var := ce1;
                      ce2r_var := ce2;
                   end if;
                end if;

           when others => 
                null;

        end case;
    end if;

   ce1r <= ce1r_var after DELAY_FFICE;
   ce2r <= ce2r_var after DELAY_FFICE;

  end process prcs_reg;
--####################################################################
--#####                        Output mux                        #####
--####################################################################
  prcs_mux:process(cesel, ce1, ce1r, ce2r)
  begin
    case cesel is
        when "00" =>
             ice_zd  <= ce1;
        when "01" =>
             ice_zd  <= ce1;
-- 426606
        when "10" =>
             ice_zd  <= ce2r;
        when "11" =>
             ice_zd  <= ce1r;
        when others =>
             null;
    end case;
  end process  prcs_mux;

--####################################################################
--#####                         OUTPUT                           #####
--####################################################################
  prcs_output:process(ice_zd)
  begin
      ICE <= ice_zd;
  end process prcs_output;
end ice_module_nodelay_V;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;
use simprim.vcomponents.all;
use simprim.vcomponents.all;

library STD;
use STD.TEXTIO.all;


----- CELL X_ISERDES_NODELAY -----
--//////////////////////////////////////////////////////////// 
--////////////////////////// ISERDES /////////////////////////
--//////////////////////////////////////////////////////////// 

entity X_ISERDES_NODELAY is

  generic(

         TimingChecksOn	: boolean := true;
         InstancePath	: string  := "*";
         Xon		: boolean := true;
         MsgOn		: boolean := true;
         LOC            : string  := "UNPLACED";

--  VITAL input Pin path delay variables

      tipd_BITSLIP	: VitalDelayType01 := (0 ps, 0 ps);
      tipd_CE1		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_CE2		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_CLK		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_CLKB		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_CLKDIV	: VitalDelayType01 := (0 ps, 0 ps);
      tipd_D		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_DDLY		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_OCLK		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_OFB		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_RST		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_SHIFTIN1	: VitalDelayType01 := (0 ps, 0 ps);
      tipd_SHIFTIN2	: VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_D_O		: VitalDelayType01 := (0 ps, 0 ps);
      tpd_DDLY_O	: VitalDelayType01 := (0 ps, 0 ps);
      tpd_CLKDIV_Q1	: VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKDIV_Q2	: VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKDIV_Q3	: VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKDIV_Q4	: VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKDIV_Q5	: VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKDIV_Q6	: VitalDelayType01 := (100 ps, 100 ps);
      tpd_OFB_O		: VitalDelayType01 := (0 ps, 0 ps);

      tbpd_D_O_CLK      : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_D_O_CLKB     : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_DDLY_O_CLK   : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_DDLY_O_CLKB  : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_OFB_O_CLK      : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_OFB_O_CLKB     : VitalDelayType01 := (0 ps, 0 ps);


--  VITAL async set-to-output path delay variables
      tpd_RST_Q1	: VitalDelayType01 := (0 ps, 0 ps);
      tpd_RST_Q2	: VitalDelayType01 := (0 ps, 0 ps);
      tpd_RST_Q3	: VitalDelayType01 := (0 ps, 0 ps);
      tpd_RST_Q4	: VitalDelayType01 := (0 ps, 0 ps);
      tpd_RST_Q5	: VitalDelayType01 := (0 ps, 0 ps);
      tpd_RST_Q6	: VitalDelayType01 := (0 ps, 0 ps);

      tbpd_RST_Q1_CLKDIV : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_RST_Q2_CLKDIV : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_RST_Q3_CLKDIV : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_RST_Q4_CLKDIV : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_RST_Q5_CLKDIV : VitalDelayType01 := (0 ps, 0 ps);
      tbpd_RST_Q6_CLKDIV : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL GSR-to-output path delay variable


--  VITAL ticd & tisd variables
      ticd_CLK			: VitalDelayType := 0.0 ps;
      ticd_CLKB			: VitalDelayType := 0.0 ps;
      ticd_CLKDIV		: VitalDelayType := 0.0 ps;
      ticd_OCLK			: VitalDelayType := 0.0 ps;

      tisd_BITSLIP_CLKDIV	: VitalDelayType := 0.0 ps;
      tisd_CE1_CLK		: VitalDelayType := 0.0 ps;
      tisd_CE1_CLKB		: VitalDelayType := 0.0 ps;
      tisd_CE2_CLK		: VitalDelayType := 0.0 ps;
      tisd_CE2_CLKB		: VitalDelayType := 0.0 ps;
      tisd_CE1_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_CE2_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_D_CLK		: VitalDelayType := 0.0 ps;
      tisd_D_CLKB		: VitalDelayType := 0.0 ps;
      tisd_DDLY_CLK		: VitalDelayType := 0.0 ps;
      tisd_DDLY_CLKB		: VitalDelayType := 0.0 ps;
      tisd_OFB_CLK		: VitalDelayType := 0.0 ps;
      tisd_OFB_CLKB		: VitalDelayType := 0.0 ps;
      tisd_RST_CLK		: VitalDelayType := 0.0 ps;
      tisd_RST_CLKB		: VitalDelayType := 0.0 ps;
      tisd_RST_CLKDIV		: VitalDelayType := 0.0 ps;
      tisd_RST_OCLK		: VitalDelayType := 0.0 ps;
      tisd_SHIFTIN1_CLK		: VitalDelayType := 0.0 ps;
      tisd_SHIFTIN2_CLK		: VitalDelayType := 0.0 ps;

--  VITAL Setup/Hold delay variables

     tsetup_D_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_D_CLK_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_D_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
     thold_D_CLK_negedge_posedge : VitalDelayType := 0.0 ps;

     tsetup_D_CLKB_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_D_CLKB_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_D_CLKB_posedge_posedge : VitalDelayType := 0.0 ps;
     thold_D_CLKB_negedge_posedge : VitalDelayType := 0.0 ps;

     tsetup_DDLY_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_DDLY_CLK_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_DDLY_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
     thold_DDLY_CLK_negedge_posedge : VitalDelayType := 0.0 ps;

     tsetup_DDLY_CLKB_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_DDLY_CLKB_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_DDLY_CLKB_posedge_posedge : VitalDelayType := 0.0 ps;
     thold_DDLY_CLKB_negedge_posedge : VitalDelayType := 0.0 ps;

     tsetup_OFB_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_OFB_CLK_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_OFB_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
     thold_OFB_CLK_negedge_posedge : VitalDelayType := 0.0 ps;

     tsetup_OFB_CLKB_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_OFB_CLKB_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_OFB_CLKB_posedge_posedge : VitalDelayType := 0.0 ps;
     thold_OFB_CLKB_negedge_posedge : VitalDelayType := 0.0 ps;


     tsetup_CE1_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_CE1_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_CE1_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
     thold_CE1_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

     tsetup_CE1_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_CE1_CLK_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_CE1_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
     thold_CE1_CLK_negedge_posedge : VitalDelayType := 0.0 ps;

     tsetup_CE1_CLKB_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_CE1_CLKB_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_CE1_CLKB_posedge_posedge : VitalDelayType := 0.0 ps;
     thold_CE1_CLKB_negedge_posedge : VitalDelayType := 0.0 ps;

     tsetup_CE2_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_CE2_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_CE2_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
     thold_CE2_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;

     tsetup_CE2_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_CE2_CLK_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_CE2_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
     thold_CE2_CLK_negedge_posedge : VitalDelayType := 0.0 ps;

     tsetup_CE2_CLKB_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_CE2_CLKB_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_CE2_CLKB_posedge_posedge : VitalDelayType := 0.0 ps;
     thold_CE2_CLKB_negedge_posedge : VitalDelayType := 0.0 ps;

     tsetup_RST_CLK_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_RST_CLK_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_RST_CLK_posedge_posedge  : VitalDelayType := 0.0 ps;
     thold_RST_CLK_negedge_posedge  : VitalDelayType := 0.0 ps;
     tsetup_RST_CLK_posedge_negedge : VitalDelayType := 0.0 ps;
     tsetup_RST_CLK_negedge_negedge : VitalDelayType := 0.0 ps;
     thold_RST_CLK_posedge_negedge  : VitalDelayType := 0.0 ps;
     thold_RST_CLK_negedge_negedge  : VitalDelayType := 0.0 ps;

     tsetup_RST_CLKB_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_RST_CLKB_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_RST_CLKB_posedge_posedge  : VitalDelayType := 0.0 ps;
     thold_RST_CLKB_negedge_posedge  : VitalDelayType := 0.0 ps;
     tsetup_RST_CLKB_posedge_negedge : VitalDelayType := 0.0 ps;
     tsetup_RST_CLKB_negedge_negedge : VitalDelayType := 0.0 ps;
     thold_RST_CLKB_posedge_negedge  : VitalDelayType := 0.0 ps;
     thold_RST_CLKB_negedge_negedge  : VitalDelayType := 0.0 ps;

     tsetup_RST_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_RST_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_RST_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
     thold_RST_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;
     tsetup_RST_CLKDIV_posedge_negedge : VitalDelayType := 0.0 ps;
     tsetup_RST_CLKDIV_negedge_negedge : VitalDelayType := 0.0 ps;
     thold_RST_CLKDIV_posedge_negedge  : VitalDelayType := 0.0 ps;
     thold_RST_CLKDIV_negedge_negedge  : VitalDelayType := 0.0 ps;

     tsetup_RST_OCLK_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_RST_OCLK_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_RST_OCLK_posedge_posedge  : VitalDelayType := 0.0 ps;
     thold_RST_OCLK_negedge_posedge  : VitalDelayType := 0.0 ps;
     tsetup_RST_OCLK_posedge_negedge : VitalDelayType := 0.0 ps;
     tsetup_RST_OCLK_negedge_negedge : VitalDelayType := 0.0 ps;
     thold_RST_OCLK_posedge_negedge  : VitalDelayType := 0.0 ps;
     thold_RST_OCLK_negedge_negedge  : VitalDelayType := 0.0 ps;

     tsetup_BITSLIP_CLKDIV_posedge_posedge : VitalDelayType := 0.0 ps;
     tsetup_BITSLIP_CLKDIV_negedge_posedge : VitalDelayType := 0.0 ps;
     thold_BITSLIP_CLKDIV_posedge_posedge  : VitalDelayType := 0.0 ps;
     thold_BITSLIP_CLKDIV_negedge_posedge  : VitalDelayType := 0.0 ps;


-- VITAL pulse width variables
      tpw_CLK_posedge	: VitalDelayType := 0 ps;
      tpw_CLK_negedge	: VitalDelayType := 0 ps;
      tpw_CLKDIV_posedge: VitalDelayType := 0 ps;
      tpw_CLKDIV_negedge: VitalDelayType := 0 ps;
      tpw_OCLK_posedge	: VitalDelayType := 0 ps;
      tpw_OCLK_negedge	: VitalDelayType := 0 ps;
      tpw_RST_posedge	: VitalDelayType := 0 ps;

-- VITAL period variables
      tperiod_CLK_posedge	: VitalDelayType := 0 ps;

-- VITAL recovery time variables
      trecovery_RST_CLK_negedge_posedge    : VitalDelayType := 0 ps;
      trecovery_RST_CLKB_negedge_posedge   : VitalDelayType := 0 ps;
      trecovery_RST_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      trecovery_RST_OCLK_negedge_posedge   : VitalDelayType := 0 ps;

-- VITAL removal time variables
      tremoval_RST_CLK_negedge_posedge    : VitalDelayType := 0 ps;
      tremoval_RST_CLKB_negedge_posedge   : VitalDelayType := 0 ps;
      tremoval_RST_CLKDIV_negedge_posedge : VitalDelayType := 0 ps;
      tremoval_RST_OCLK_negedge_posedge   : VitalDelayType := 0 ps;


      BITSLIP_ENABLE	: boolean	:= false;
      DATA_RATE		: string	:= "DDR";
      DATA_WIDTH	: integer	:= 4;
      INIT_Q1		: bit		:= '0';
      INIT_Q2		: bit		:= '0';
      INIT_Q3		: bit		:= '0';
      INIT_Q4		: bit		:= '0';
      INTERFACE_TYPE	: string	:= "MEMORY";
      IOBDELAY		: string	:= "NONE";
      NUM_CE		: integer	:= 2;
      OFB_USED		: boolean	:= false;
      SERDES_MODE	: string	:= "MASTER"
      );
  port(
      O			: out std_ulogic;
      Q1		: out std_ulogic;
      Q2		: out std_ulogic;
      Q3		: out std_ulogic;
      Q4		: out std_ulogic;
      Q5		: out std_ulogic;
      Q6		: out std_ulogic;
      SHIFTOUT1		: out std_ulogic;
      SHIFTOUT2		: out std_ulogic;

      BITSLIP		: in std_ulogic;
      CE1		: in std_ulogic;
      CE2		: in std_ulogic;
      CLK		: in std_ulogic;
      CLKB		: in std_ulogic;
      CLKDIV		: in std_ulogic;
      D			: in std_ulogic;
      DDLY		: in std_ulogic;
      OCLK		: in std_ulogic;
      OFB		: in std_ulogic;
      RST		: in std_ulogic;
      SHIFTIN1		: in std_ulogic;
      SHIFTIN2		: in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_ISERDES_NODELAY : entity is true;

end X_ISERDES_NODELAY;

architecture X_ISERDES_NODELAY_V OF X_ISERDES_NODELAY is

--  attribute VITAL_LEVEL0 of
--    X_ISERDES_NODELAY_V : architecture is true;

component bscntrl_nodelay
  generic (
      SRTYPE            : string;
      INIT_BITSLIPCNT	: bit_vector(3 downto 0)
    );
  port(
      CLKDIV_INT        : out std_ulogic;
      MUXC              : out std_ulogic;

      BITSLIP           : in std_ulogic;
      C23               : in std_ulogic;
      C45               : in std_ulogic;
      C67               : in std_ulogic;
      CLK               : in std_ulogic;
      CLKDIV            : in std_ulogic;
      DATA_RATE         : in std_ulogic;
      R                 : in std_ulogic;
      SEL               : in std_logic_vector (1 downto 0)
      );
end component;

component ice_module_nodelay
  generic(
      SRTYPE            : string;
      INIT_CE		: bit_vector(1 downto 0)
      );
  port(
      ICE		: out std_ulogic;

      CE1		: in std_ulogic;
      CE2		: in std_ulogic;
      NUM_CE		: in std_ulogic;
      CLKDIV		: in std_ulogic;
      R			: in std_ulogic
      );
end component;

  constant SRVAL_Q1             : bit := '0';
  constant SRVAL_Q2             : bit := '0';
  constant SRVAL_Q3             : bit := '0';
  constant SRVAL_Q4             : bit := '0';

  constant DDR_CLK_EDGE         : string        := "SAME_EDGE_PIPELINED";
  constant INIT_BITSLIPCNT      : bit_vector(3 downto 0) := "0000";
  constant INIT_CE              : bit_vector(1 downto 0) := "00";
  constant INIT_RANK1_PARTIAL   : bit_vector(4 downto 0) := "00000";
  constant INIT_RANK2           : bit_vector(5 downto 0) := "000000";
  constant INIT_RANK3           : bit_vector(5 downto 0) := "000000";
  constant SERDES               : boolean       := TRUE;
  constant SRTYPE               : string        := "ASYNC";

--  constant DELAY_FFINP          : time       := 300 ns; 
--  constant DELAY_MXINP1         : time       := 60  ns;
--  constant DELAY_MXINP2         : time       := 120 ns;
--  constant DELAY_OCLKDLY        : time       := 750 ns;

  constant SYNC_PATH_DELAY      : time       := 100 ps; 

  constant DELAY_FFINP          : time       := 300 ps; 
  constant DELAY_MXINP1         : time       := 60  ps;
  constant DELAY_MXINP2         : time       := 120 ps;
  constant DELAY_OCLKDLY        : time       := 750 ps;

  constant MAX_DATAWIDTH	: integer    := 4;

  signal BITSLIP_ipd	        : std_ulogic := 'X';
  signal CE1_ipd	        : std_ulogic := 'X';
  signal CE2_ipd	        : std_ulogic := 'X';
  signal CLK_ipd	        : std_ulogic := 'X';
  signal CLKB_ipd	        : std_ulogic := 'X';
  signal CLKDIV_ipd		: std_ulogic := 'X';
  signal D_ipd			: std_ulogic := 'X';
  signal DDLY_ipd		: std_ulogic := 'X';
  signal GSR_ipd		: std_ulogic := 'X';
  signal OCLK_ipd		: std_ulogic := 'X';
  signal OFB_ipd		: std_ulogic := 'X';
  signal RST_ipd		: std_ulogic := 'X';
  signal SHIFTIN1_ipd		: std_ulogic := 'X';
  signal SHIFTIN2_ipd		: std_ulogic := 'X';
  signal TFB_ipd		: std_ulogic := '0';

  signal BITSLIP_dly	        : std_ulogic := 'X';
  signal CE1_dly	        : std_ulogic := 'X';
  signal CE2_dly	        : std_ulogic := 'X';
  signal CLK_dly	        : std_ulogic := 'X';
  signal CLKB_dly	        : std_ulogic := 'X';
  signal CLKDIV_dly		: std_ulogic := 'X';
  signal D_CLK_dly		: std_ulogic := 'X';
  signal D_CLKB_dly		: std_ulogic := 'X';
  signal DDLY_CLK_dly		: std_ulogic := 'X';
  signal DDLY_CLKB_dly		: std_ulogic := 'X';
  signal GSR_dly		: std_ulogic := '0';
  signal OCLK_dly		: std_ulogic := 'X';
  signal OFB_CLK_dly		: std_ulogic := 'X';
  signal OFB_CLKB_dly		: std_ulogic := 'X';
  signal REV_dly		: std_ulogic := '0';
  signal RST_dly		: std_ulogic := 'X';
  signal SR_dly			: std_ulogic := 'X';
  signal SHIFTIN1_dly		: std_ulogic := 'X';
  signal SHIFTIN2_dly		: std_ulogic := 'X';


  signal O_zd			: std_ulogic := 'X';
  signal Q1_zd			: std_ulogic := 'X';
  signal Q2_zd			: std_ulogic := 'X';
  signal Q3_zd			: std_ulogic := 'X';
  signal Q4_zd			: std_ulogic := 'X';
  signal Q5_zd			: std_ulogic := 'X';
  signal Q6_zd			: std_ulogic := 'X';
  signal SHIFTOUT1_zd		: std_ulogic := 'X';
  signal SHIFTOUT2_zd		: std_ulogic := 'X';

  signal O_viol			: std_ulogic := 'X';
  signal Q1_viol		: std_ulogic := 'X';
  signal Q2_viol		: std_ulogic := 'X';
  signal Q3_viol		: std_ulogic := 'X';
  signal Q4_viol		: std_ulogic := 'X';
  signal Q5_viol		: std_ulogic := 'X';
  signal Q6_viol		: std_ulogic := 'X';
  signal SHIFTOUT1_viol		: std_ulogic := 'X';
  signal SHIFTOUT2_viol		: std_ulogic := 'X';

  signal AttrSerdes		: std_ulogic := 'X';
  signal AttrMode		: std_ulogic := 'X';
  signal AttrDataRate		: std_ulogic := 'X';
  signal AttrDataWidth		: std_logic_vector(3 downto 0) := (others => 'X');
  signal AttrInterfaceType	: std_ulogic := 'X';
  signal AttrBitslipEnable	: std_ulogic := 'X';
  signal AttrNumCe		: std_ulogic := 'X';
  signal AttrDdrClkEdge		: std_logic_vector(1 downto 0) := (others => 'X');
  signal AttrSRtype		: integer := 0;
  signal AttrIobDelay		: integer := 0;
  signal AttrOFB_USED		: std_ulogic := '0';
  signal AttrTFB_USED		: std_ulogic := '0';

  signal sel1			: std_logic_vector(1 downto 0) := (others => 'X');
  signal selrnk3		: std_logic_vector(3 downto 0) := (others => 'X');
  signal bsmux			: std_logic_vector(2 downto 0) := (others => 'X');
  signal cntr			: std_logic_vector(4 downto 0) := (others => 'X');
  
  signal q1rnk1			: std_ulogic := 'X';
  signal q2nrnk1		: std_ulogic := 'X';
  signal q5rnk1			: std_ulogic := 'X';
  signal q6rnk1			: std_ulogic := 'X';
  signal q6prnk1		: std_ulogic := 'X';

  signal q1prnk1		: std_ulogic := 'X';
  signal q2prnk1		: std_ulogic := 'X';
  signal q3rnk1			: std_ulogic := 'X';
  signal q4rnk1			: std_ulogic := 'X';

  signal dataq5rnk1		: std_ulogic := 'X';
  signal dataq6rnk1		: std_ulogic := 'X';

  signal dataq3rnk1		: std_ulogic := 'X';
  signal dataq4rnk1		: std_ulogic := 'X';

  signal oclkmux		: std_ulogic := '0';
  signal memmux			: std_ulogic := '0';
  signal q2pmux			: std_ulogic := '0';

  signal clkdiv_int		: std_ulogic := '0';
  signal clkdivmux		: std_ulogic := '0';

  signal q1rnk2			: std_ulogic := 'X';
  signal q2rnk2			: std_ulogic := 'X';
  signal q3rnk2			: std_ulogic := 'X';
  signal q4rnk2			: std_ulogic := 'X';
  signal q5rnk2			: std_ulogic := 'X';
  signal q6rnk2			: std_ulogic := 'X';
  signal dataq1rnk2		: std_ulogic := 'X';
  signal dataq2rnk2		: std_ulogic := 'X';
  signal dataq3rnk2		: std_ulogic := 'X';
  signal dataq4rnk2		: std_ulogic := 'X';
  signal dataq5rnk2		: std_ulogic := 'X';
  signal dataq6rnk2		: std_ulogic := 'X';

  signal muxc			: std_ulogic := 'X';

  signal q1rnk3			: std_ulogic := 'X';
  signal q2rnk3			: std_ulogic := 'X';
  signal q3rnk3			: std_ulogic := 'X';
  signal q4rnk3			: std_ulogic := 'X';
  signal q5rnk3			: std_ulogic := 'X';
  signal q6rnk3			: std_ulogic := 'X';

  signal c23			: std_ulogic := 'X';
  signal c45			: std_ulogic := 'X';
  signal c67			: std_ulogic := 'X';
  signal sel			: std_logic_vector(1 downto 0) := (others => 'X');

  signal ice			: std_ulogic := 'X';
  signal datain_CLK		: std_ulogic := 'X';
  signal datain_CLKB		: std_ulogic := 'X';
  signal idelay_out		: std_ulogic := 'X';

  signal CLKN_dly		: std_ulogic := '0';

  signal pre_fdbk_O_zd		: std_ulogic := 'X';
  signal pre_fdbk_datain_CLK	: std_ulogic := 'X';
  signal pre_fdbk_datain_CLKB	: std_ulogic := 'X';
  signal feedback	        : std_logic_vector(2 downto 0) := (others => 'X');


procedure CR454107_msg(INTERFACE_TYPE : IN string;
                         DATA_RATE  : IN string;
                         DATA_WIDTH : IN integer) is

  variable Message : line;
  begin
        Write (Message, string'("DRC  Warning : The combination of INTERFACE_TYPE, DATA_RATE and DATA_WIDTH values on X_ISERDES_NODELAY component is not recommended."));
        Write (Message, LF);
        Write (Message, string'("The current settings are: INTERFACE_TYPE = "));
        Write (Message, INTERFACE_TYPE);
        Write (Message, string'(", DATA_RATE = "));
        Write (Message, DATA_RATE );
        Write (Message, string'(" and DATA_WIDTH = "));
        Write (Message, DATA_WIDTH );
        Write (Message, LF);
        Write (Message, string'("The recommended combinations of values are :"));
        Write (Message, LF);
        Write (Message, string'("NETWORKING SDR 2, 3, 4, 5, 6, 7, 8"));
        Write (Message, LF);
        Write (Message, string'("NETWORKING DDR 4, 6, 8, 10"));
        Write (Message, LF);
        Write (Message, string'("MEMORY SDR None"));
        Write (Message, LF);
        Write (Message, string'("MEMORY DDR 4"));
        assert false report Message.all severity Warning;
        DEALLOCATE (Message);
   end CR454107_msg;

begin

  GSR_dly <= GSR;

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (BITSLIP_ipd,  BITSLIP,  tipd_BITSLIP);
    VitalWireDelay (CE1_ipd,      CE1,      tipd_CE1);
    VitalWireDelay (CE2_ipd,      CE2,      tipd_CE2);
    VitalWireDelay (CLK_ipd,      CLK,      tipd_CLK);
    VitalWireDelay (CLKB_ipd,     CLKB,      tipd_CLKB);
    VitalWireDelay (CLKDIV_ipd,   CLKDIV,   tipd_CLKDIV);
    VitalWireDelay (D_ipd,        D,        tipd_D);
    VitalWireDelay (DDLY_ipd,     DDLY,     tipd_DDLY);
    VitalWireDelay (OCLK_ipd,     OCLK,     tipd_OCLK);
    VitalWireDelay (OFB_ipd,      OFB,      tipd_OFB);
    VitalWireDelay (RST_ipd,      RST,      tipd_RST);
    VitalWireDelay (SHIFTIN1_ipd, SHIFTIN1, tipd_SHIFTIN1);
    VitalWireDelay (SHIFTIN2_ipd, SHIFTIN2, tipd_SHIFTIN2);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (BITSLIP_dly,  BITSLIP_ipd,  tisd_BITSLIP_CLKDIV);
    VitalSignalDelay (CE1_dly,      CE1_ipd,      tisd_CE1_CLKDIV);
    VitalSignalDelay (CE2_dly,      CE2_ipd,      tisd_CE2_CLKDIV);
    VitalSignalDelay (CLK_dly,      CLK_ipd,      ticd_CLK);
    VitalSignalDelay (CLKB_dly,     CLKB_ipd,     ticd_CLKB);
    VitalSignalDelay (CLKDIV_dly,   CLKDIV_ipd,   ticd_CLKDIV);
    VitalSignalDelay (D_CLK_dly,    D_ipd,        tisd_D_CLK);
    VitalSignalDelay (D_CLKB_dly,   D_ipd,        tisd_D_CLKB);
    VitalSignalDelay (DDLY_CLK_dly,   DDLY_ipd,   tisd_DDLY_CLK);
    VitalSignalDelay (DDLY_CLKB_dly,  DDLY_ipd,   tisd_DDLY_CLKB);
    VitalSignalDelay (OCLK_dly,     OCLK_ipd,     ticd_OCLK);
    VitalSignalDelay (OFB_CLK_dly,  OFB_ipd,      tisd_OFB_CLK);
    VitalSignalDelay (OFB_CLKB_dly, OFB_ipd,      tisd_OFB_CLKB);
    VitalSignalDelay (RST_dly,      RST_ipd,      tisd_RST_CLKDIV);
    VitalSignalDelay (SHIFTIN1_dly, SHIFTIN1_ipd, tisd_SHIFTIN1_CLK);
    VitalSignalDelay (SHIFTIN2_dly, SHIFTIN2_ipd, tisd_SHIFTIN2_CLK);
  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------


  SR_dly <= RST_dly;

--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process
  variable AttrSerdes_var		: std_ulogic := 'X';
  variable AttrMode_var			: std_ulogic := 'X';
  variable AttrDataRate_var		: std_ulogic := 'X';
  variable AttrDataWidth_var		: std_logic_vector(3 downto 0) := (others => 'X');
  variable AttrInterfaceType_var	: std_ulogic := 'X';
  variable AttrBitslipEnable_var	: std_ulogic := 'X';
  variable AttrDdrClkEdge_var		: std_logic_vector(1 downto 0) := (others => 'X');
  variable AttrIobDelay_var		: integer := 0;
  variable AttrOFB_USED_var		: std_ulogic := 'X';
  variable AttrTFB_USED_var		: std_ulogic := 'X';

  begin

      --------CR 454107  DRC Warning -- INTERFACE_TYPE / DATA_RATE /  DATA_WIDTH combinations  ------------------
      if (INTERFACE_TYPE = "NETWORKING") then
         if(DATA_RATE = "SDR")then
            case (DATA_WIDTH) is
                when 2|3|4|5|6|7|8  => null;
                when others       => CR454107_msg(INTERFACE_TYPE, DATA_RATE, DATA_WIDTH);
            end case;
         elsif(DATA_RATE = "DDR")then
            case (DATA_WIDTH) is
                when 4|6|8|10 => null;
                when others       => CR454107_msg(INTERFACE_TYPE, DATA_RATE, DATA_WIDTH);
            end case;
         end if;
      elsif (INTERFACE_TYPE = "MEMORY") then
         if(DATA_RATE = "DDR")then
            case (DATA_WIDTH) is
                when 4  => null;
                when others       => CR454107_msg(INTERFACE_TYPE, DATA_RATE, DATA_WIDTH);
            end case;
         elsif(DATA_RATE = "SDR")then
                CR454107_msg(INTERFACE_TYPE, DATA_RATE, DATA_WIDTH);
         end if;
      end if;


      --------CR 447760  DRC -- BITSLIP - INTERFACE_TYPE combination  ------------------

      if((INTERFACE_TYPE = "MEMORY") and (BITSLIP_ENABLE = TRUE)) then
        assert false
        report "Attribute Syntax Error: BITSLIP_ENABLE is currently set to TRUE when INTERFACE_TYPE is set to MEMORY. This is an invalid configuration."
        severity Failure;
     elsif((INTERFACE_TYPE = "NETWORKING") and (BITSLIP_ENABLE = FALSE)) then
        assert false
        report "Attribute Syntax Error: BITSLIP_ENABLE is currently set to FALSE when INTERFACE_TYPE is set to NETWORKING. If BITSLIP is not intended to be used, please set BITSLIP_ENABLE to TRUE and tie the BITSLIP port to ground."
        severity Failure;
     end if;

      -------------------- SERDES validity check --------------------
      if(SERDES = true) then
        AttrSerdes_var := '1';
      else
        AttrSerdes_var := '0';
      end if;

      ------------- SERDES_MODE validity check --------------------
      if((SERDES_MODE = "MASTER") or (SERDES_MODE = "master")) then
         AttrMode_var := '0';
      elsif((SERDES_MODE = "SLAVE") or (SERDES_MODE = "slave")) then
         AttrMode_var := '1';
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => "SERDES_MODE ",
             EntityName => "/X_ISERDES_NODELAY",
             GenericValue => SERDES_MODE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " MASTER or SLAVE.",
             TailMsg => "",
             MsgSeverity => FAILURE 
         );
      end if;

      ------------------ DATA_RATE validity check ------------------
      if((DATA_RATE = "DDR") or (DATA_RATE = "ddr")) then
         AttrDataRate_var := '0';
      elsif((DATA_RATE = "SDR") or (DATA_RATE = "sdr")) then
         AttrDataRate_var := '1';
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " DATA_RATE ",
             EntityName => "/X_ISERDES_NODELAY",
             GenericValue => DATA_RATE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
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
             EntityName => "/X_ISERDES_NODELAY",
             GenericValue => DATA_WIDTH,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " 2, 3, 4, 5, 6, 7, 8, or 10 ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;
      ------------ DATA_WIDTH /DATA_RATE combination check ------------
      if((DATA_RATE = "DDR") or (DATA_RATE = "ddr")) then
         case (DATA_WIDTH) is
             when 4|6|8|10  => null;
             when others       =>
                GenericValueCheckMessage
                (  HeaderMsg  => " Attribute Syntax Warning ",
                   GenericName => " DATA_WIDTH ",
                   EntityName => "/X_ISERDES_NODELAY",
                   GenericValue => DATA_WIDTH,
                   Unit => "",
                   ExpectedValueMsg => " The Legal values for DDR mode are ",
                   ExpectedGenericValue => " 4, 6, 8, or 10 ",
                   TailMsg => "",
                   MsgSeverity => Failure
                );
          end case;
      end if;

      if((DATA_RATE = "SDR") or (DATA_RATE = "sdr")) then
         case (DATA_WIDTH) is
             when 2|3|4|5|6|7|8  => null;
             when others       =>
                GenericValueCheckMessage
                (  HeaderMsg  => " Attribute Syntax Warning ",
                   GenericName => " DATA_WIDTH ",
                   EntityName => "/X_ISERDES_NODELAY",
                   GenericValue => DATA_WIDTH,
                   Unit => "",
                   ExpectedValueMsg => " The Legal values for SDR mode are ",
                   ExpectedGenericValue => " 2, 3, 4, 5, 6, 7 or 8",
                   TailMsg => "",
                   MsgSeverity => Failure
                );
          end case;
      end if;
      ---------------- INTERFACE_TYPE validity check ---------------
      if((INTERFACE_TYPE = "MEMORY") or (INTERFACE_TYPE = "memory")) then
         AttrInterfaceType_var := '0';
      elsif((INTERFACE_TYPE = "NETWORKING") or (INTERFACE_TYPE = "networking")) then
         AttrInterfaceType_var := '1';
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => "INTERFACE_TYPE ",
             EntityName => "/X_ISERDES_NODELAY",
             GenericValue => INTERFACE_TYPE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " MEMORY or NETWORKING.",
             TailMsg => "",
             MsgSeverity => FAILURE 
         );
      end if;

      ---------------- BITSLIP_ENABLE validity check -------------------
      if(BITSLIP_ENABLE = false) then
         AttrBitslipEnable_var := '0';
      elsif(BITSLIP_ENABLE = true) then
         AttrBitslipEnable_var := '1';
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " BITSLIP_ENABLE ",
             EntityName => "/X_ISERDES_NODELAY",
             GenericValue => BITSLIP_ENABLE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " TRUE or FALSE ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;

      ----------------     NUM_CE validity check    -------------------
      case NUM_CE is
         when 1 =>
                AttrNumCe <= '0';
         when 2 =>
                AttrNumCe <= '1';
         when others =>
                GenericValueCheckMessage
                  (  HeaderMsg  => " Attribute Syntax Warning ",
                     GenericName => " NUM_CE ",
                     EntityName => "/X_ISERDES_NODELAY",
                     GenericValue => NUM_CE,
                     Unit => "",
                     ExpectedValueMsg => " The Legal values for this attribute are ",
                     ExpectedGenericValue => " 1 or 2 ",
                     TailMsg => "",
                     MsgSeverity => Failure
                  );
      end case;
      ----------------     IOBDELAY validity check  -------------------
      if((IOBDELAY = "NONE") or (IOBDELAY = "none")) then
         AttrIobDelay_var := 0;
      elsif((IOBDELAY = "IBUF") or (IOBDELAY = "ibuf")) then
         AttrIobDelay_var := 1;
      elsif((IOBDELAY = "IFD") or (IOBDELAY = "ifd")) then
         AttrIobDelay_var := 2;
      elsif((IOBDELAY = "BOTH") or (IOBDELAY = "both")) then
         AttrIobDelay_var := 3;
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " IOBDELAY ",
             EntityName => "/X_ISERDES_NODELAY",
             GenericValue => IOBDELAY,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " NONE or IBUF or IFD or BOTH ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;
      ------------     IOBDELAY_VALUE validity check  -----------------
      ------------     IOBDELAY_TYPE validity check   -----------------
--
--
--
      ------------------ DDR_CLK_EDGE validity check ------------------
         AttrDdrClkEdge_var := "00";

--      if((DDR_CLK_EDGE = "SAME_EDGE_PIPELINED") or (DDR_CLK_EDGE = "same_edge_pipelined")) then
--         AttrDdrClkEdge_var := "00";
--      elsif((DDR_CLK_EDGE = "SAME_EDGE") or (DDR_CLK_EDGE = "same_edge")) then
--         AttrDdrClkEdge_var := "01";
--      elsif((DDR_CLK_EDGE = "OPPOSITE_EDGE") or (DDR_CLK_EDGE = "opposite_edge")) then
--         AttrDdrClkEdge_var := "10";
--      else
--        GenericValueCheckMessage
--          (  HeaderMsg  => " Attribute Syntax Warning ",
--             GenericName => " DDR_CLK_EDGE ",
--             EntityName => "/X_ISERDES_NODELAY",
--             GenericValue => DDR_CLK_EDGE,
--            Unit => "",
--             ExpectedValueMsg => " The Legal values for this attribute are ",
--             ExpectedGenericValue => " SAME_EDGE_PIPELINED or SAME_EDGE or OPPOSITE_EDGE ",
--             TailMsg => "",
--             MsgSeverity => Failure
--         );
--      end if;
      ------------------ DATA_RATE validity check ------------------
         AttrSrtype <= 0;

--      if((SRTYPE = "ASYNC") or (SRTYPE = "async")) then
--         AttrSrtype <= 0;
--      elsif((SRTYPE = "SYNC") or (SRTYPE = "sync")) then
--         AttrSrtype <= 1;
--      else
--        GenericValueCheckMessage
--          (  HeaderMsg  => " Attribute Syntax Warning ",
--             GenericName => " SRTYPE ",
--             EntityName => "/X_ISERDES_NODELAY",
--             GenericValue => SRTYPE,
--             Unit => "",
--             ExpectedValueMsg => " The Legal values for this attribute are ",
--             ExpectedGenericValue => " ASYNC or SYNC. ",
--             TailMsg => "",
--             MsgSeverity => ERROR
--         );
--      end if;
      ---------------- OFB_USED validity check -------------------
      if(OFB_USED = false) then
         AttrOFB_USED_var := '0';
      elsif(OFB_USED = true) then
         AttrOFB_USED_var := '1';
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " OFB_USED ",
             EntityName => "/X_ISERDES_NODELAY",
             GenericValue => OFB_USED,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " TRUE or FALSE ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;

      ---------------- TFB_USED validity check -------------------
--      if(TFB_USED = false) then
--         AttrTFB_USED_var := '0';
--      elsif(TFB_USED = true) then
--         AttrTFB_USED_var := '1';
--      else
--        GenericValueCheckMessage
--          (  HeaderMsg  => " Attribute Syntax Warning ",
--             GenericName => " TFB_USED ",
--             EntityName => "/X_ISERDES_NODELAY",
--             GenericValue => TFB_USED,
--             Unit => "",
--             ExpectedValueMsg => " The Legal values for this attribute are ",
--             ExpectedGenericValue => " TRUE or FALSE ",
--             TailMsg => "",
--             MsgSeverity => Failure
--         );
--      end if;

---------------------------------------------------------------------

     AttrSerdes		<= AttrSerdes_var;
     AttrMode		<= AttrMode_var;
     AttrDataRate	<= AttrDataRate_var;
     AttrDataWidth	<= AttrDataWidth_var;
     AttrInterfaceType	<= AttrInterfaceType_var;
     AttrBitslipEnable	<= AttrBitslipEnable_var;
     AttrDdrClkEdge	<= AttrDdrClkEdge_var;
     AttrIobDelay	<= AttrIobDelay_var;
     AttrOFB_USED	<= AttrOFB_USED_var;

     sel1     <= AttrMode_var & AttrDataRate_var; 
     selrnk3  <= AttrSerdes_var & AttrBitslipEnable_var & AttrDdrClkEdge_var; 
     cntr     <= AttrDataRate_var & AttrDataWidth_var;

     wait;
  end process prcs_init;

  feedback <= TFB_ipd & AttrOFB_USED & AttrTFB_USED;
--###################################################################
--#####               SHIFTOUT1 and SHIFTOUT2                   #####
--###################################################################

  SHIFTOUT2_zd <= q5rnk1;
  SHIFTOUT1_zd <= q6rnk1;

--###################################################################
--#####                     q1rnk1 reg                          #####
--###################################################################
  prcs_Q1_rnk1:process(CLK_dly, GSR_dly, REV_dly, SR_dly)
  variable q1rnk1_var         : std_ulogic := TO_X01(INIT_Q1);
  begin
     if(GSR_dly = '1') then
         q1rnk1_var  :=  TO_X01(INIT_Q1);
     elsif(GSR_dly = '0') then
        case AttrSRtype is
           when 0 => 
           --------------- // async SET/RESET
                   if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_Q1) = '1')))) then
                      q1rnk1_var := TO_X01(SRVAL_Q1);
                   elsif(REV_dly = '1') then
                      q1rnk1_var := not TO_X01(SRVAL_Q1);
                   elsif((SR_dly = '0') and (REV_dly = '0')) then
                      if(ice = '1') then
                         if(rising_edge(CLK_dly)) then
                            q1rnk1_var := datain_CLK;
                         end if;
                      end if;
                   end if;

           when 1 => 
           --------------- // sync SET/RESET
                   if(rising_edge(CLK_dly)) then
                      if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_Q1) = '1')))) then
                         q1rnk1_var := TO_X01(SRVAL_Q1);
                      Elsif(REV_dly = '1') then
                         q1rnk1_var := not TO_X01(SRVAL_Q1);
                      elsif((SR_dly = '0') and (REV_dly = '0')) then
                         if(ice = '1') then
                            q1rnk1_var := datain_CLK;
                         end if;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     q1rnk1  <= q1rnk1_var  after DELAY_FFINP;

  end process prcs_Q1_rnk1;
--###################################################################
--#####              q5rnk1, q6rnk1 and q6prnk1 reg             #####
--###################################################################
  prcs_Q5Q6Q6p_rnk1:process(CLK_dly, GSR_dly, SR_dly)
  variable q5rnk1_var         : std_ulogic := TO_X01(INIT_RANK1_PARTIAL(2));
  variable q6rnk1_var         : std_ulogic := TO_X01(INIT_RANK1_PARTIAL(1));
  variable q6prnk1_var        : std_ulogic := TO_X01(INIT_RANK1_PARTIAL(0));
  begin
     if(GSR_dly = '1') then
         q5rnk1_var  := TO_X01(INIT_RANK1_PARTIAL(2));
         q6rnk1_var  := TO_X01(INIT_RANK1_PARTIAL(1));
         q6prnk1_var := TO_X01(INIT_RANK1_PARTIAL(0));
     elsif(GSR_dly = '0') then
        case AttrSRtype is
           when 0 => 
           --------- // async SET/RESET  -- Not full featured FFs
                   if(SR_dly = '1') then
                      q5rnk1_var  := '0';
                      q6rnk1_var  := '0';
                      q6prnk1_var := '0';
                   elsif(SR_dly = '0') then
                      if(rising_edge(CLK_dly)) then
                         q5rnk1_var  := dataq5rnk1;
                         q6rnk1_var  := dataq6rnk1;
                         q6prnk1_var := q6rnk1;
                      end if;
                   end if;

           when 1 => 
           --------- // sync SET/RESET  -- Not full featured FFs
                   if(rising_edge(CLK_dly)) then
                      if(SR_dly = '1') then
                         q5rnk1_var  := '0';
                         q6rnk1_var  := '0';
                         q6prnk1_var := '0';
                      elsif(SR_dly = '0') then
                         q5rnk1_var  := dataq5rnk1;
                         q6rnk1_var  := dataq6rnk1;
                         q6prnk1_var := q6rnk1;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     q5rnk1  <= q5rnk1_var  after DELAY_FFINP;
     q6rnk1  <= q6rnk1_var  after DELAY_FFINP;
     q6prnk1 <= q6prnk1_var after DELAY_FFINP;

  end process prcs_Q5Q6Q6p_rnk1;
--###################################################################
--#####                     q2nrnk1 reg                          #####
--###################################################################
  prcs_Q2_rnk1:process(CLKB_dly, GSR_dly, SR_dly, REV_dly)
  variable q2nrnk1_var         : std_ulogic := TO_X01(INIT_Q2);
  begin
     if(GSR_dly = '1') then
         q2nrnk1_var  := TO_X01(INIT_Q2);
     elsif(GSR_dly = '0') then
        case AttrSRtype is
           when 0 => 
           --------------- // async SET/RESET
                   if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_Q2) = '1')))) then
                      q2nrnk1_var  := TO_X01(SRVAL_Q2);
                   elsif(REV_dly = '1') then
                      q2nrnk1_var  := not TO_X01(SRVAL_Q2);
                   elsif((SR_dly = '0') and (REV_dly = '0')) then
                      if(ice = '1') then
                         if(rising_edge(CLKB_dly)) then
                            q2nrnk1_var     := datain_CLKB;
                         end if;
                      end if;
                   end if;

           when 1 => 
           --------------- // sync SET/RESET
                   if(rising_edge(CLKB_dly)) then
                      if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_Q2) = '1')))) then
                         q2nrnk1_var  := TO_X01(SRVAL_Q2);
                      elsif(REV_dly = '1') then
                         q2nrnk1_var  := not TO_X01(SRVAL_Q2);
                      elsif((SR_dly = '0') and (REV_dly = '0')) then
                         if(ice = '1') then
                            q2nrnk1_var := datain_CLKB;
                         end if;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     q2nrnk1  <= q2nrnk1_var after DELAY_FFINP;

  end process prcs_Q2_rnk1;
--###################################################################
--#####                       q2prnk1 reg                       #####
--###################################################################
  prcs_Q2p_rnk1:process(q2pmux, GSR_dly, REV_dly, SR_dly)
  variable q2prnk1_var        : std_ulogic := TO_X01(INIT_Q4);
  begin
     if(GSR_dly = '1') then
         q2prnk1_var := TO_X01(INIT_Q4);
     elsif(GSR_dly = '0') then
        case AttrSRtype is
           when 0 => 
           --------------- // async SET/RESET
                   if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_Q4) = '1')))) then
                      q2prnk1_var := TO_X01(SRVAL_Q4);
                   elsif(REV_dly = '1') then
                      q2prnk1_var := not TO_X01(SRVAL_Q4);
                   elsif((SR_dly = '0') and (REV_dly = '0')) then
                      if(ice = '1') then
                         if(rising_edge(q2pmux)) then
                            q2prnk1_var := q2nrnk1;
                         end if;
                      end if;
                   end if;

           when 1 => 
           --------------- // sync SET/RESET
                   if(rising_edge(q2pmux)) then
                      if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_Q4) = '1')))) then
                         q2prnk1_var := TO_X01(SRVAL_Q4);
                      elsif(REV_dly = '1') then
                         q2prnk1_var := not TO_X01(SRVAL_Q4);
                      elsif((SR_dly = '0') and (REV_dly = '0')) then
                         if(ice = '1') then
                              q2prnk1_var := q2nrnk1;
                         end if;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     q2prnk1  <= q2prnk1_var after DELAY_FFINP;

  end process prcs_Q2p_rnk1;
--###################################################################
--#####                      q1prnk1  reg                       #####
--###################################################################
  prcs_Q1p_rnk1:process(memmux, GSR_dly, REV_dly, SR_dly)
  variable q1prnk1_var        : std_ulogic := TO_X01(INIT_Q3);
  begin
     if(GSR_dly = '1') then
         q1prnk1_var := TO_X01(INIT_Q3);
     elsif(GSR_dly = '0') then
        case AttrSRtype is
           when 0 => 
           --------------- // async SET/RESET
                   if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_Q3) = '1')))) then
                      q1prnk1_var := TO_X01(SRVAL_Q3);
                   elsif(REV_dly = '1') then
                      q1prnk1_var := not TO_X01(SRVAL_Q3);
                   elsif((SR_dly = '0') and (REV_dly = '0')) then
                      if(ice = '1') then
                         if(rising_edge(memmux)) then
                            q1prnk1_var := q1rnk1;
                         end if;
                      end if;
                   end if;


           when 1 => 
           --------------- // sync SET/RESET
                   if(rising_edge(memmux)) then
                      if((SR_dly = '1') and (not ((REV_dly = '1') and (TO_X01(SRVAL_Q3) = '1')))) then
                         q1prnk1_var := TO_X01(SRVAL_Q3);
                      elsif(REV_dly = '1') then
                         q1prnk1_var := not TO_X01(SRVAL_Q3);
                      elsif((SR_dly = '0') and (REV_dly = '0')) then
                         if(ice = '1') then
                            q1prnk1_var := q1rnk1;
                         end if;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     q1prnk1  <= q1prnk1_var after DELAY_FFINP;

  end process prcs_Q1p_rnk1;
--###################################################################
--#####                  q3rnk1 and q4rnk1 reg                  #####
--###################################################################
  prcs_Q3Q4_rnk1:process(memmux, GSR_dly, SR_dly)
  variable q3rnk1_var         : std_ulogic := TO_X01(INIT_RANK1_PARTIAL(4));
  variable q4rnk1_var         : std_ulogic := TO_X01(INIT_RANK1_PARTIAL(3));
  begin
     if(GSR_dly = '1') then
         q3rnk1_var  := TO_X01(INIT_RANK1_PARTIAL(4));
         q4rnk1_var  := TO_X01(INIT_RANK1_PARTIAL(3));
     elsif(GSR_dly = '0') then
        case AttrSRtype is
           when 0 => 
           -------- // async SET/RESET  -- not fully featured FFs
                   if(SR_dly = '1') then
                      q3rnk1_var  := '0';
                      q4rnk1_var  := '0';
                   elsif(SR_dly = '0') then
                      if(rising_edge(memmux)) then
                         q3rnk1_var  := dataq3rnk1;
                         q4rnk1_var  := dataq4rnk1;
                      end if;
                   end if;

           when 1 => 
           -------- // sync SET/RESET -- not fully featured FFs
                   if(rising_edge(memmux)) then
                      if(SR_dly = '1') then
                         q3rnk1_var  := '0';
                         q4rnk1_var  := '0';
                      elsif(SR_dly = '0') then
                         q3rnk1_var  := dataq3rnk1;
                         q4rnk1_var  := dataq4rnk1;
                      end if;
                   end if;

           when others =>
                   null;
                        
        end case;
     end if;

     q3rnk1   <= q3rnk1_var after DELAY_FFINP;
     q4rnk1   <= q4rnk1_var after DELAY_FFINP;

  end process prcs_Q3Q4_rnk1;
--###################################################################
--#####        clock mux --  oclkmux with delay element         #####
--###################################################################
--  prcs_oclkmux:process(OCLK_dly)
--  begin
--     case AttrOclkDelay is
--           when '0' => 
--                    oclkmux <= OCLK_dly after DELAY_MXINP1;
--           when '1' => 
--                    oclkmux <= OCLK_dly after DELAY_OCLKDLY;
--           when others =>
--                    oclkmux <= OCLK_dly after DELAY_MXINP1;
--     end case;
--  end process prcs_oclkmux;
--
--
--
--///////////////////////////////////////////////////////////////////
--// Mux elements for the 1st Rank
--///////////////////////////////////////////////////////////////////
--###################################################################
--#####              memmux -- 4 clock muxes in first rank      #####
--###################################################################
  prcs_memmux:process(CLK_dly, OCLK_dly)
  begin
     case AttrInterfaceType is
           when '0' => 
                    memmux <= OCLK_dly after DELAY_MXINP1;
           when '1' => 
                    memmux <= CLK_dly after DELAY_MXINP1;
           when others =>
                    memmux <= OCLK_dly after DELAY_MXINP1;
     end case;
  end process prcs_memmux;

--###################################################################
--#####      q2pmux -- Optional inverter for q2p (4th flop in rank1)
--###################################################################
  prcs_q2pmux:process(memmux)
  begin
     case AttrInterfaceType is
           when '0' => 
                    q2pmux <= not memmux after DELAY_MXINP1;
           when '1' => 
                    q2pmux <= memmux after DELAY_MXINP1;
           when others =>
                    q2pmux <= memmux after DELAY_MXINP1;
     end case;
  end process prcs_q2pmux;
--###################################################################
--#####                data input muxes for q3q4  and q5q6      #####
--###################################################################
  prcs_Q3Q4_mux:process(q1prnk1, q2prnk1, q3rnk1, SHIFTIN1_dly, SHIFTIN2_dly)
  begin
     case sel1 is
           when "00" =>
                    dataq3rnk1 <= q1prnk1 after DELAY_MXINP1;
                    dataq4rnk1 <= q2prnk1 after DELAY_MXINP1;
           when "01" =>
                    dataq3rnk1 <= q1prnk1 after DELAY_MXINP1;
                    dataq4rnk1 <= q3rnk1  after DELAY_MXINP1;
           when "10" =>
                    dataq3rnk1 <= SHIFTIN2_dly after DELAY_MXINP1;
                    dataq4rnk1 <= SHIFTIN1_dly after DELAY_MXINP1;
           when "11" =>
                    dataq3rnk1 <= SHIFTIN1_dly after DELAY_MXINP1;
                    dataq4rnk1 <= q3rnk1   after DELAY_MXINP1;
           when others =>
                    dataq3rnk1 <= q1prnk1 after DELAY_MXINP1;
                    dataq4rnk1 <= q2prnk1 after DELAY_MXINP1;
     end case;

  end process prcs_Q3Q4_mux;
----------------------------------------------------------------------
  prcs_Q5Q6_mux:process(q3rnk1, q4rnk1, q5rnk1)
  begin
     case AttrDataRate is 
           when '0' =>
                    dataq5rnk1 <= q3rnk1 after DELAY_MXINP1;
                    dataq6rnk1 <= q4rnk1 after DELAY_MXINP1;
           when '1' =>
                    dataq5rnk1 <= q4rnk1 after DELAY_MXINP1;
                    dataq6rnk1 <= q5rnk1 after DELAY_MXINP1;
           when others =>
                    dataq5rnk1 <= q4rnk1 after DELAY_MXINP1;
                    dataq6rnk1 <= q5rnk1 after DELAY_MXINP1;
     end case;
  end process prcs_Q5Q6_mux;



---////////////////////////////////////////////////////////////////////
---                       2nd rank of registors
---////////////////////////////////////////////////////////////////////

--###################################################################
--#####    clkdivmux to choose between clkdiv_int or CLKDIV     #####
--###################################################################
  prcs_clkdivmux:process(clkdiv_int, CLKDIV_dly)
  begin
     case AttrBitslipEnable is
           when '0' =>
                    clkdivmux <= CLKDIV_dly after DELAY_MXINP1;
           when '1' =>
                    clkdivmux <= clkdiv_int after DELAY_MXINP1;
           when others =>
                    clkdivmux <= CLKDIV_dly after DELAY_MXINP1;
     end case;
  end process prcs_clkdivmux;

--###################################################################
--#####  q1rnk2, q2rnk2, q3rnk2,q4rnk2 ,q5rnk2 and q6rnk2 reg   #####
--###################################################################
  prcs_Q1Q2Q3Q4Q5Q6_rnk2:process(clkdivmux, GSR_dly, SR_dly)
  variable q1rnk2_var         : std_ulogic := TO_X01(INIT_RANK2(0));
  variable q2rnk2_var         : std_ulogic := TO_X01(INIT_RANK2(1));
  variable q3rnk2_var         : std_ulogic := TO_X01(INIT_RANK2(2));
  variable q4rnk2_var         : std_ulogic := TO_X01(INIT_RANK2(3));
  variable q5rnk2_var         : std_ulogic := TO_X01(INIT_RANK2(4));
  variable q6rnk2_var         : std_ulogic := TO_X01(INIT_RANK2(5));
  begin
     if(GSR_dly = '1') then
         q1rnk2_var := TO_X01(INIT_RANK2(0));
         q2rnk2_var := TO_X01(INIT_RANK2(1));
         q3rnk2_var := TO_X01(INIT_RANK2(2));
         q4rnk2_var := TO_X01(INIT_RANK2(3));
         q5rnk2_var := TO_X01(INIT_RANK2(4));
         q6rnk2_var := TO_X01(INIT_RANK2(5));
     elsif(GSR_dly = '0') then
        case AttrSRtype is
           when 0 => 
           --------------- // async SET/RESET
                   if(SR_dly = '1') then
                      q1rnk2_var := '0';
                      q2rnk2_var := '0';
                      q3rnk2_var := '0';
                      q4rnk2_var := '0';
                      q5rnk2_var := '0';
                      q6rnk2_var := '0';
                   elsif(SR_dly = '0') then
                       if(rising_edge(clkdivmux)) then
                           q1rnk2_var := dataq1rnk2;
                           q2rnk2_var := dataq2rnk2;
                           q3rnk2_var := dataq3rnk2;
                           q4rnk2_var := dataq4rnk2;
                           q5rnk2_var := dataq5rnk2;
                           q6rnk2_var := dataq6rnk2;
                       end if;
                   end if;

           when 1 => 
           --------------- // sync SET/RESET
                   if(rising_edge(clkdivmux)) then
                      if(SR_dly = '1') then
                         q1rnk2_var := '0';
                         q2rnk2_var := '0';
                         q3rnk2_var := '0';
                         q4rnk2_var := '0';
                         q5rnk2_var := '0';
                         q6rnk2_var := '0';
                      elsif(SR_dly = '0') then
                         q1rnk2_var := dataq1rnk2;
                         q2rnk2_var := dataq2rnk2;
                         q3rnk2_var := dataq3rnk2;
                         q4rnk2_var := dataq4rnk2;
                         q5rnk2_var := dataq5rnk2;
                         q6rnk2_var := dataq6rnk2;
                      end if;
                   end if;
           when others =>
                   null;
        end case;
     end if;

     q1rnk2  <= q1rnk2_var after DELAY_FFINP;
     q2rnk2  <= q2rnk2_var after DELAY_FFINP;
     q3rnk2  <= q3rnk2_var after DELAY_FFINP;
     q4rnk2  <= q4rnk2_var after DELAY_FFINP;
     q5rnk2  <= q5rnk2_var after DELAY_FFINP;
     q6rnk2  <= q6rnk2_var after DELAY_FFINP;

  end process prcs_Q1Q2Q3Q4Q5Q6_rnk2;

--###################################################################
--#####                    update bitslip mux                   #####
--###################################################################

  bsmux  <= AttrBitslipEnable & AttrDataRate & muxc; 

--###################################################################
--#####    Data mux for 2nd rank of registers                  ######
--###################################################################
  prcs_Q1Q2Q3Q4Q5Q6_rnk2_mux:process(bsmux, q1rnk1, q1prnk1, q2prnk1, 
                           q3rnk1, q4rnk1, q5rnk1, q6rnk1, q6prnk1)
  begin
     case bsmux is
        when "000" | "001" =>
                 dataq1rnk2 <= q2prnk1 after DELAY_MXINP2;
                 dataq2rnk2 <= q1prnk1 after DELAY_MXINP2;
                 dataq3rnk2 <= q4rnk1  after DELAY_MXINP2;
                 dataq4rnk2 <= q3rnk1  after DELAY_MXINP2;
                 dataq5rnk2 <= q6rnk1  after DELAY_MXINP2;
                 dataq6rnk2 <= q5rnk1  after DELAY_MXINP2;
        when "100"  =>
                 dataq1rnk2 <= q2prnk1 after DELAY_MXINP2;
                 dataq2rnk2 <= q1prnk1 after DELAY_MXINP2;
                 dataq3rnk2 <= q4rnk1  after DELAY_MXINP2;
                 dataq4rnk2 <= q3rnk1  after DELAY_MXINP2;
                 dataq5rnk2 <= q6rnk1  after DELAY_MXINP2;
                 dataq6rnk2 <= q5rnk1  after DELAY_MXINP2;
        when "101"  =>
                 dataq1rnk2 <= q1prnk1 after DELAY_MXINP2;
                 dataq2rnk2 <= q4rnk1  after DELAY_MXINP2;
                 dataq3rnk2 <= q3rnk1  after DELAY_MXINP2;
                 dataq4rnk2 <= q6rnk1  after DELAY_MXINP2;
                 dataq5rnk2 <= q5rnk1  after DELAY_MXINP2;
                 dataq6rnk2 <= q6prnk1 after DELAY_MXINP2;
        when "010" | "011" | "110" | "111" =>
                 dataq1rnk2 <= q1rnk1  after DELAY_MXINP2;
                 dataq2rnk2 <= q1prnk1 after DELAY_MXINP2;
                 dataq3rnk2 <= q3rnk1  after DELAY_MXINP2;
                 dataq4rnk2 <= q4rnk1  after DELAY_MXINP2;
                 dataq5rnk2 <= q5rnk1  after DELAY_MXINP2;
                 dataq6rnk2 <= q6rnk1  after DELAY_MXINP2;
        when others =>
                 dataq1rnk2 <= q2prnk1 after DELAY_MXINP2;
                 dataq2rnk2 <= q1prnk1 after DELAY_MXINP2;
                 dataq3rnk2 <= q4rnk1  after DELAY_MXINP2;
                 dataq4rnk2 <= q3rnk1  after DELAY_MXINP2;
                 dataq5rnk2 <= q6rnk1  after DELAY_MXINP2;
                 dataq6rnk2 <= q5rnk1  after DELAY_MXINP2;
     end case;
  end process prcs_Q1Q2Q3Q4Q5Q6_rnk2_mux;

---////////////////////////////////////////////////////////////////////
---                       3rd rank of registors
---////////////////////////////////////////////////////////////////////

--###################################################################
--#####  q1rnk3, q2rnk3, q3rnk3, q4rnk3, q5rnk3 and q6rnk3 reg   #####
--###################################################################
  prcs_Q1Q2Q3Q4Q5Q6_rnk3:process(CLKDIV_dly, GSR_dly, SR_dly)
  variable q1rnk3_var         : std_ulogic := TO_X01(INIT_RANK3(0));
  variable q2rnk3_var         : std_ulogic := TO_X01(INIT_RANK3(1));
  variable q3rnk3_var         : std_ulogic := TO_X01(INIT_RANK3(2));
  variable q4rnk3_var         : std_ulogic := TO_X01(INIT_RANK3(3));
  variable q5rnk3_var         : std_ulogic := TO_X01(INIT_RANK3(4));
  variable q6rnk3_var         : std_ulogic := TO_X01(INIT_RANK3(5));
  begin
     if(GSR_dly = '1') then
         q1rnk3_var := TO_X01(INIT_RANK3(0));
         q2rnk3_var := TO_X01(INIT_RANK3(1));
         q3rnk3_var := TO_X01(INIT_RANK3(2));
         q4rnk3_var := TO_X01(INIT_RANK3(3));
         q5rnk3_var := TO_X01(INIT_RANK3(4));
         q6rnk3_var := TO_X01(INIT_RANK3(5));
     elsif(GSR_dly = '0') then
        case AttrSRtype is
           when 0 => 
           --------------- // async SET/RESET
                   if(SR_dly = '1') then
                      q1rnk3_var := '0';
                      q2rnk3_var := '0';
                      q3rnk3_var := '0';
                      q4rnk3_var := '0';
                      q5rnk3_var := '0';
                      q6rnk3_var := '0';
                   elsif(SR_dly = '0') then
                       if(rising_edge(CLKDIV_dly)) then
                           q1rnk3_var := q1rnk2;
                           q2rnk3_var := q2rnk2;
                           q3rnk3_var := q3rnk2;
                           q4rnk3_var := q4rnk2;
                           q5rnk3_var := q5rnk2;
                           q6rnk3_var := q6rnk2;
                        end if;
                   end if;

           when 1 => 
           --------------- // sync SET/RESET
                   if(rising_edge(CLKDIV_dly)) then
                      if(SR_dly = '1') then
                         q1rnk3_var := '0';
                         q2rnk3_var := '0';
                         q3rnk3_var := '0';
                         q4rnk3_var := '0';
                         q5rnk3_var := '0';
                         q6rnk3_var := '0';
                      elsif(SR_dly = '0') then
                         q1rnk3_var := q1rnk2;
                         q2rnk3_var := q2rnk2;
                         q3rnk3_var := q3rnk2;
                         q4rnk3_var := q4rnk2;
                         q5rnk3_var := q5rnk2;
                         q6rnk3_var := q6rnk2;
                      end if;
                   end if;
           when others =>
                   null;
        end case;
     end if;

     q1rnk3  <= q1rnk3_var after DELAY_FFINP;
     q2rnk3  <= q2rnk3_var after DELAY_FFINP;
     q3rnk3  <= q3rnk3_var after DELAY_FFINP;
     q4rnk3  <= q4rnk3_var after DELAY_FFINP;
     q5rnk3  <= q5rnk3_var after DELAY_FFINP;
     q6rnk3  <= q6rnk3_var after DELAY_FFINP;

  end process prcs_Q1Q2Q3Q4Q5Q6_rnk3;

---////////////////////////////////////////////////////////////////////
---                       Outputs
---////////////////////////////////////////////////////////////////////
  prcs_Q1Q2_rnk3_mux:process(q1rnk1, q1prnk1, q1rnk2, q1rnk3,  
                           q2nrnk1, q2prnk1, q2rnk2, q2rnk3)
  begin
     case selrnk3 is
        when "0000" | "0100" | "0X00" =>
                 Q1_zd <= q1prnk1 after DELAY_MXINP1;
                 Q2_zd <= q2prnk1 after DELAY_MXINP1;
        when "0001" | "0101" | "0X01" =>
                 Q1_zd <= q1rnk1  after DELAY_MXINP1;
                 Q2_zd <= q2prnk1 after DELAY_MXINP1;
        when "0010" | "0110" | "0X10" =>
                 Q1_zd <= q1rnk1  after DELAY_MXINP1;
                 Q2_zd <= q2nrnk1 after DELAY_MXINP1;
        when "1000" | "1001" | "1010" | "1011" | "10X0" | "10X1" |
             "100X" | "101X" | "10XX" =>
                 Q1_zd <= q1rnk2 after DELAY_MXINP1;
                 Q2_zd <= q2rnk2 after DELAY_MXINP1;
        when "1100" | "1101" | "1110" | "1111" | "11X0" | "11X1" |
             "110X" | "111X" | "11XX" =>
                 Q1_zd <= q1rnk3 after DELAY_MXINP1;
                 Q2_zd <= q2rnk3 after DELAY_MXINP1;
        when others =>
                 Q1_zd <= q1rnk2 after DELAY_MXINP1;
                 Q2_zd <= q2rnk2 after DELAY_MXINP1;
     end case;
  end process prcs_Q1Q2_rnk3_mux;
--------------------------------------------------------------------
  prcs_Q3Q4Q5Q6_rnk3_mux:process(q3rnk2, q3rnk3, q4rnk2, q4rnk3,  
                                 q5rnk2, q5rnk3, q6rnk2, q6rnk3)
  begin
     case AttrBitslipEnable is
        when '0'  =>
                 Q3_zd <= q3rnk2 after DELAY_MXINP1;
                 Q4_zd <= q4rnk2 after DELAY_MXINP1;
                 Q5_zd <= q5rnk2 after DELAY_MXINP1;
                 Q6_zd <= q6rnk2 after DELAY_MXINP1;
        when '1'  =>
                 Q3_zd <= q3rnk3 after DELAY_MXINP1;
                 Q4_zd <= q4rnk3 after DELAY_MXINP1;
                 Q5_zd <= q5rnk3 after DELAY_MXINP1;
                 Q6_zd <= q6rnk3 after DELAY_MXINP1;
        when others =>
                 Q3_zd <= q3rnk2 after DELAY_MXINP1;
                 Q4_zd <= q4rnk2 after DELAY_MXINP1;
                 Q5_zd <= q5rnk2 after DELAY_MXINP1;
                 Q6_zd <= q6rnk2 after DELAY_MXINP1;
     end case;
  end process prcs_Q3Q4Q5Q6_rnk3_mux;
----------------------------------------------------------------------
-----------    Inverted CLK  -----------------------------------------
----------------------------------------------------------------------

  CLKN_dly <= not CLK_dly;

----------------------------------------------------------------------
-----------    Instant BSCNTRL_NODELAY  ------------------------------
----------------------------------------------------------------------
  INST_BSCNTRL_NODELAY : BSCNTRL_NODELAY
  generic map (
      SRTYPE => SRTYPE,
      INIT_BITSLIPCNT => INIT_BITSLIPCNT
     )
  port map (
      CLKDIV_INT => clkdiv_int,
      MUXC       => muxc,

      BITSLIP    => BITSLIP_dly,
      C23        => c23,
      C45        => c45,
      C67        => c67,
      CLK        => CLKN_dly,
      CLKDIV     => CLKDIV_dly,
      DATA_RATE  => AttrDataRate,
      R          => SR_dly,
      SEL        => sel
      );

--###################################################################
--#####   Set value of the counter in BSCNTRL_NODELAY           ##### 
--###################################################################
  prcs_bscntrl_nodelay_cntr:process
  begin
     wait for 10 ps;
     case cntr is
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
                report "Error : DATA_WIDTH or DATA_RATE has illegal values."
                severity failure;
     end case;
     wait on cntr, c23, c45, c67, sel;

  end process prcs_bscntrl_nodelay_cntr;
         
----------------------------------------------------------------------
-----------    Instant Clock Enable Circuit  ------------------------- 
----------------------------------------------------------------------
  INST_ICE : ICE_MODULE_NODELAY 
  generic map (
      SRTYPE => SRTYPE,
      INIT_CE => INIT_CE
     )
  port map (
      ICE	=> ice,

      CE1	=> CE1_dly,
      CE2	=> CE2_dly,
      NUM_CE	=> AttrNumCe,
      CLKDIV	=> CLKDIV_dly,
      R		=> SR_dly 
      );
----------------------------------------------------------------------
-----------    Instant IDELAY  --------------------------------------- 
----------------------------------------------------------------------
--  INST_IDELAY : X_IDELAY 
--  generic map (
--      IOBDELAY_VALUE => IOBDELAY_VALUE,
--      IOBDELAY_TYPE  => IOBDELAY_TYPE,
--      SIM_TAPDELAY_VALUE => SIM_TAPDELAY_VALUE
--     )
--  port map (
--      O		=> idelay_out,
--
--      C		=> CLKDIV_dly,
--      CE	=> DLYCE_dly,
--      I		=> D_dly,
--      INC	=> DLYINC_dly,
--      RST	=> DLYRST_dly
--      );

--###################################################################
--#####           IOBDELAY -- Delay input Data                  ##### 
--###################################################################
  prcs_pre_fdbk_d_delay:process(D_ipd, DDLY_ipd, D_CLK_dly, D_CLKB_dly, DDLY_CLK_dly, DDLY_CLKB_dly)
  begin
     case AttrIobDelay is
        when 0 =>
               pre_fdbk_O_zd        <= D_ipd;
               pre_fdbk_datain_CLK  <= D_CLK_dly;
               pre_fdbk_datain_CLKB <= D_CLKB_dly;
        when 1 =>
               pre_fdbk_O_zd   <= DDLY_ipd; 
               pre_fdbk_datain_CLK  <= D_CLK_dly;
               pre_fdbk_datain_CLKB <= D_CLKB_dly;
        when 2 =>
               pre_fdbk_O_zd   <= D_ipd; 
               pre_fdbk_datain_CLK  <= DDLY_CLK_dly;
               pre_fdbk_datain_CLKB <= DDLY_CLKB_dly;
        when 3 =>
               pre_fdbk_O_zd   <= DDLY_ipd; 
               pre_fdbk_datain_CLK  <= DDLY_CLK_dly;
               pre_fdbk_datain_CLKB <= DDLY_CLKB_dly;
        when others =>
               null;
     end case;
  end process prcs_pre_fdbk_d_delay;

--CR 422392 
--###################################################################
--#####           Muxing of D, OFB and TFB  -- FEEDBACK         ##### 
--###################################################################
  prcs_d_delay:process(pre_fdbk_O_zd, pre_fdbk_datain_CLK, pre_fdbk_datain_CLKB, feedback )
  begin
     case feedback is
        when "000" | "100" | "X00" =>
                 O_zd        <= pre_fdbk_O_zd;
                 datain_CLK  <= pre_fdbk_datain_CLK;
                 datain_CLKB <= pre_fdbk_datain_CLKB;
        when "001" | "101" | "X01" =>
                 O_zd        <= pre_fdbk_O_zd;
                 datain_CLK  <= pre_fdbk_datain_CLK;
                 datain_CLKB <= pre_fdbk_datain_CLKB;
        when "010"  =>
                 O_zd        <= OFB_ipd;
                 datain_CLK  <= OFB_CLK_dly;
                 datain_CLKB <= OFB_CLKB_dly;
        when "110"  =>
                 O_zd        <= pre_fdbk_O_zd;
                 datain_CLK  <= pre_fdbk_datain_CLK;
                 datain_CLKB <= pre_fdbk_datain_CLKB;
        when "011" | "111" | "X11" =>
                 O_zd        <= OFB_ipd;
                 datain_CLK  <= OFB_CLK_dly;
                 datain_CLKB <= OFB_CLKB_dly;
        when others =>
                 O_zd        <= pre_fdbk_O_zd;
                 datain_CLK  <= pre_fdbk_datain_CLK;
                 datain_CLKB <= pre_fdbk_datain_CLKB;
     end case;
  end process prcs_d_delay;

--####################################################################

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_output:process

--  Pin Timing Violations (all input pins)
     variable Tviol_D_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_D_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_D_CLKB_posedge : STD_ULOGIC := '0';
     variable  Tmkr_D_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DDLY_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DDLY_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DDLY_CLKB_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DDLY_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_OFB_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_OFB_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_OFB_CLKB_posedge : STD_ULOGIC := '0';
     variable  Tmkr_OFB_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_CE1_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_CE1_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_CE1_CLKB_posedge : STD_ULOGIC := '0';
     variable  Tmkr_CE1_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_CE1_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_CE1_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_CE2_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_CE2_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_CE2_CLKB_posedge : STD_ULOGIC := '0';
     variable  Tmkr_CE2_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_CE2_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_CE2_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_CLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_CLK_negedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_CLK_negedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_CLKB_posedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_CLKB_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_CLKB_negedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_CLKB_negedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_CLKDIV_negedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_CLKDIV_negedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_OCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_OCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_OCLK_negedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_OCLK_negedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_BITSLIP_CLKDIV_posedge : STD_ULOGIC := '0';
     variable  Tmkr_BITSLIP_CLKDIV_posedge : VitalTimingDataType := VitalTimingDataInit;

--  Output Pin glitch declaration
     variable  O_GlitchData : VitalGlitchDataType;
     variable  Q1_GlitchData : VitalGlitchDataType;
     variable  Q2_GlitchData : VitalGlitchDataType;
     variable  Q3_GlitchData : VitalGlitchDataType;
     variable  Q4_GlitchData : VitalGlitchDataType;
     variable  Q5_GlitchData : VitalGlitchDataType;
     variable  Q6_GlitchData : VitalGlitchDataType;
     variable  SHIFTOUT1_GlitchData : VitalGlitchDataType;
     variable  SHIFTOUT2_GlitchData : VitalGlitchDataType;
begin

--  Setup/Hold Check Violations (all input pins)

     if (TimingChecksOn) then
--------------------------------------------------------
--   D  Setup/Hold 
--------------------------------------------------------
     VitalSetupHoldCheck
       (
         Violation      => Tviol_D_CLK_posedge,
         TimingData     => Tmkr_D_CLK_posedge,
         TestSignal     => D_CLK_dly,
         TestSignalName => "D",
         TestDelay      => tisd_D_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_D_CLK_posedge_posedge,
         SetupLow       => tsetup_D_CLK_negedge_posedge,
         HoldLow        => thold_D_CLK_posedge_posedge,
         HoldHigh       => thold_D_CLK_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_D_CLKB_posedge,
         TimingData     => Tmkr_D_CLKB_posedge,
         TestSignal     => D_CLKB_dly,
         TestSignalName => "D",
         TestDelay      => tisd_D_CLKB,
         RefSignal      => CLKB_dly,
         RefSignalName  => "CLKB",
         RefDelay       => ticd_CLKB,
         SetupHigh      => tsetup_D_CLKB_posedge_posedge,
         SetupLow       => tsetup_D_CLKB_negedge_posedge,
         HoldLow        => thold_D_CLKB_posedge_posedge,
         HoldHigh       => thold_D_CLKB_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
--------------------------------------------------------
--   DDLY  Setup/Hold 
--------------------------------------------------------
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DDLY_CLK_posedge,
         TimingData     => Tmkr_DDLY_CLK_posedge,
         TestSignal     => DDLY_CLK_dly,
         TestSignalName => "DDLY",
         TestDelay      => tisd_DDLY_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_DDLY_CLK_posedge_posedge,
         SetupLow       => tsetup_DDLY_CLK_negedge_posedge,
         HoldLow        => thold_DDLY_CLK_posedge_posedge,
         HoldHigh       => thold_DDLY_CLK_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DDLY_CLKB_posedge,
         TimingData     => Tmkr_DDLY_CLKB_posedge,
         TestSignal     => DDLY_CLKB_dly,
         TestSignalName => "DDLY",
         TestDelay      => tisd_DDLY_CLKB,
         RefSignal      => CLKB_dly,
         RefSignalName  => "CLKB",
         RefDelay       => ticd_CLKB,
         SetupHigh      => tsetup_DDLY_CLKB_posedge_posedge,
         SetupLow       => tsetup_DDLY_CLKB_negedge_posedge,
         HoldLow        => thold_DDLY_CLKB_posedge_posedge,
         HoldHigh       => thold_DDLY_CLKB_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
--------------------------------------------------------
--   OFB  Setup/Hold 
--------------------------------------------------------
     VitalSetupHoldCheck
       (
         Violation      => Tviol_OFB_CLK_posedge,
         TimingData     => Tmkr_OFB_CLK_posedge,
         TestSignal     => OFB_CLK_dly,
         TestSignalName => "OFB",
         TestDelay      => tisd_OFB_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_OFB_CLK_posedge_posedge,
         SetupLow       => tsetup_OFB_CLK_negedge_posedge,
         HoldLow        => thold_OFB_CLK_posedge_posedge,
         HoldHigh       => thold_OFB_CLK_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_OFB_CLKB_posedge,
         TimingData     => Tmkr_OFB_CLKB_posedge,
         TestSignal     => OFB_CLKB_dly,
         TestSignalName => "OFB",
         TestDelay      => tisd_OFB_CLKB,
         RefSignal      => CLKB_dly,
         RefSignalName  => "CLKB",
         RefDelay       => ticd_CLKB,
         SetupHigh      => tsetup_OFB_CLKB_posedge_posedge,
         SetupLow       => tsetup_OFB_CLKB_negedge_posedge,
         HoldLow        => thold_OFB_CLKB_posedge_posedge,
         HoldHigh       => thold_OFB_CLKB_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
--------------------------------------------------------
--   CE1  Setup/Hold 
--------------------------------------------------------
     VitalSetupHoldCheck
       (
         Violation      => Tviol_CE1_CLK_posedge,
         TimingData     => Tmkr_CE1_CLK_posedge,
         TestSignal     => CE1_dly,
         TestSignalName => "CE1",
         TestDelay      => tisd_CE1_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_CE1_CLK_posedge_posedge,
         SetupLow       => tsetup_CE1_CLK_negedge_posedge,
         HoldLow        => thold_CE1_CLK_posedge_posedge,
         HoldHigh       => thold_CE1_CLK_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_CE1_CLKB_posedge,
         TimingData     => Tmkr_CE1_CLKB_posedge,
         TestSignal     => CE1_dly,
         TestSignalName => "CE1",
         TestDelay      => tisd_CE1_CLKB,
         RefSignal      => CLKB_dly,
         RefSignalName  => "CLKB",
         RefDelay       => ticd_CLKB,
         SetupHigh      => tsetup_CE1_CLKB_posedge_posedge,
         SetupLow       => tsetup_CE1_CLKB_negedge_posedge,
         HoldLow        => thold_CE1_CLKB_posedge_posedge,
         HoldHigh       => thold_CE1_CLKB_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_CE1_CLKDIV_posedge,
         TimingData     => Tmkr_CE1_CLKDIV_posedge,
         TestSignal     => CE1_dly,
         TestSignalName => "CE1",
         TestDelay      => tisd_CE1_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_CE1_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_CE1_CLKDIV_negedge_posedge,
         HoldLow        => thold_CE1_CLKDIV_posedge_posedge,
         HoldHigh       => thold_CE1_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
--------------------------------------------------------
--   CE2  Setup/Hold 
--------------------------------------------------------
     VitalSetupHoldCheck
       (
         Violation      => Tviol_CE2_CLK_posedge,
         TimingData     => Tmkr_CE2_CLK_posedge,
         TestSignal     => CE2_dly,
         TestSignalName => "CE2",
         TestDelay      => tisd_CE2_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_CE2_CLK_posedge_posedge,
         SetupLow       => tsetup_CE2_CLK_negedge_posedge,
         HoldLow        => thold_CE2_CLK_posedge_posedge,
         HoldHigh       => thold_CE2_CLK_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_CE2_CLKB_posedge,
         TimingData     => Tmkr_CE2_CLKB_posedge,
         TestSignal     => CE2_dly,
         TestSignalName => "CE2",
         TestDelay      => tisd_CE2_CLKB,
         RefSignal      => CLKB_dly,
         RefSignalName  => "CLKB",
         RefDelay       => ticd_CLKB,
         SetupHigh      => tsetup_CE2_CLKB_posedge_posedge,
         SetupLow       => tsetup_CE2_CLKB_negedge_posedge,
         HoldLow        => thold_CE2_CLKB_posedge_posedge,
         HoldHigh       => thold_CE2_CLKB_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_CE2_CLKDIV_posedge,
         TimingData     => Tmkr_CE2_CLKDIV_posedge,
         TestSignal     => CE2_dly,
         TestSignalName => "CE2",
         TestDelay      => tisd_CE2_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_CE2_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_CE2_CLKDIV_negedge_posedge,
         HoldLow        => thold_CE2_CLKDIV_posedge_posedge,
         HoldHigh       => thold_CE2_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
--------------------------------------------------------
--   RST Recovery/Removal 
--------------------------------------------------------
     if(SRTYPE = "ASYNC") then
        VitalRecoveryRemovalCheck (
           Violation            => Tviol_RST_CLK_posedge,
           TimingData           => Tmkr_RST_CLK_posedge,
           TestSignal           => RST_dly,
           TestSignalName       => "RST",
           TestDelay            => 0 ps,
           RefSignal            => CLK_dly,
           RefSignalName        => "CLK",
           RefDelay             => 0 ps,
           Recovery             => trecovery_RST_CLK_negedge_posedge,
           Removal              => tremoval_RST_CLK_negedge_posedge,
           ActiveLow            => false,
           CheckEnabled         => True,
           RefTransition        => 'R',
           HeaderMsg            => "/X_ISERDES_NODELAY",
           Xon                  => Xon,
           MsgOn                => MsgOn,
           MsgSeverity          => Warning
        );
        VitalRecoveryRemovalCheck (
           Violation            => Tviol_RST_CLKB_posedge,
           TimingData           => Tmkr_RST_CLKB_posedge,
           TestSignal           => RST_dly,
           TestSignalName       => "RST",
           TestDelay            => 0 ps,
           RefSignal            => CLKB_dly,
           RefSignalName        => "CLKB",
           RefDelay             => 0 ps,
           Recovery             => trecovery_RST_CLKB_negedge_posedge,
           Removal              => tremoval_RST_CLKB_negedge_posedge,
           ActiveLow            => false,
           CheckEnabled         => True,
           RefTransition        => 'R',
           HeaderMsg            => "/X_ISERDES_NODELAY",
           Xon                  => Xon,
           MsgOn                => MsgOn,
           MsgSeverity          => Warning
        );
        VitalRecoveryRemovalCheck (
           Violation            => Tviol_RST_CLKDIV_posedge,
           TimingData           => Tmkr_RST_CLKDIV_posedge,
           TestSignal           => RST_dly,
           TestSignalName       => "RST",
           TestDelay            => 0 ps,
           RefSignal            => CLKDIV_dly,
           RefSignalName        => "CLKDIV",
           RefDelay             => 0 ps,
           Recovery             => trecovery_RST_CLKDIV_negedge_posedge,
           Removal              => tremoval_RST_CLKDIV_negedge_posedge,
           ActiveLow            => false,
           CheckEnabled         => True,
           RefTransition        => 'R',
           HeaderMsg            => "/X_ISERDES_NODELAY",
           Xon                  => Xon,
           MsgOn                => MsgOn,
           MsgSeverity          => Warning
        );
        VitalRecoveryRemovalCheck (
           Violation            => Tviol_RST_OCLK_posedge,
           TimingData           => Tmkr_RST_OCLK_posedge,
           TestSignal           => RST_dly,
           TestSignalName       => "RST",
           TestDelay            => 0 ps,
           RefSignal            => OCLK_dly,
           RefSignalName        => "OCLK",
           RefDelay             => 0 ps,
           Recovery             => trecovery_RST_OCLK_negedge_posedge,
           Removal              => tremoval_RST_OCLK_negedge_posedge,
           ActiveLow            => false,
           CheckEnabled         => True,
           RefTransition        => 'R',
           HeaderMsg            => "/X_ISERDES_NODELAY",
           Xon                  => Xon,
           MsgOn                => MsgOn,
           MsgSeverity          => Warning
        );
     else
        VitalSetupHoldCheck (
           Violation      => Tviol_RST_CLK_posedge,
           TimingData     => Tmkr_RST_CLK_posedge,
           TestSignal     => RST_dly,
           TestSignalName => "RST",
           TestDelay      => tisd_RST_CLK,
           RefSignal      => CLK_dly,
           RefSignalName  => "CLK",
           RefDelay       => ticd_CLK,
           SetupHigh      => tsetup_RST_CLK_posedge_posedge,
           SetupLow       => tsetup_RST_CLK_negedge_posedge,
           HoldLow        => thold_RST_CLK_posedge_posedge,
           HoldHigh       => thold_RST_CLK_negedge_posedge,
           CheckEnabled   => TRUE,
           RefTransition  => 'R',
           HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => Warning
        );
        VitalSetupHoldCheck (
           Violation      => Tviol_RST_CLKB_posedge,
           TimingData     => Tmkr_RST_CLKB_posedge,
           TestSignal     => RST_dly,
           TestSignalName => "RST",
           TestDelay      => tisd_RST_CLK,
           RefSignal      => CLKB_dly,
           RefSignalName  => "CLKB",
           RefDelay       => ticd_CLKB,
           SetupHigh      => tsetup_RST_CLKB_posedge_posedge,
           SetupLow       => tsetup_RST_CLKB_negedge_posedge,
           HoldLow        => thold_RST_CLKB_posedge_posedge,
           HoldHigh       => thold_RST_CLKB_negedge_posedge,
           CheckEnabled   => TRUE,
           RefTransition  => 'R',
           HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => Warning
        );
        VitalSetupHoldCheck (
           Violation      => Tviol_RST_CLKDIV_posedge,
           TimingData     => Tmkr_RST_CLKDIV_posedge,
           TestSignal     => RST_dly,
           TestSignalName => "RST",
           TestDelay      => tisd_RST_CLKDIV,
           RefSignal      => CLKDIV_dly,
           RefSignalName  => "CLKDIV",
           RefDelay       => ticd_CLKDIV,
           SetupHigh      => tsetup_RST_CLKDIV_posedge_posedge,
           SetupLow       => tsetup_RST_CLKDIV_negedge_posedge,
           HoldLow        => thold_RST_CLKDIV_posedge_posedge,
           HoldHigh       => thold_RST_CLKDIV_negedge_posedge,
           CheckEnabled   => TRUE,
           RefTransition  => 'R',
           HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => Warning
        );
--     VitalSetupHoldCheck
--       (
--         Violation      => Tviol_RST_CLKDIV_negedge,
--         TimingData     => Tmkr_RST_CLKDIV_negedge,
--         TestSignal     => RST_dly,
--         TestSignalName => "RST",
--         TestDelay      => tisd_RST_CLKDIV,
--         RefSignal      => CLKDIV_dly,
--         RefSignalName  => "CLKDIV",
--         RefDelay       => ticd_CLKDIV,
--         SetupHigh      => tsetup_RST_CLKDIV_posedge_negedge,
--         SetupLow       => tsetup_RST_CLKDIV_negedge_negedge,
--         HoldLow        => thold_RST_CLKDIV_posedge_negedge,
--         HoldHigh       => thold_RST_CLKDIV_negedge_negedge,
--         CheckEnabled   => TRUE,
--         RefTransition  => 'F',
--         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
--         Xon            => Xon,
--         MsgOn          => MsgOn,
--         MsgSeverity    => Warning
--       );
        VitalSetupHoldCheck (
           Violation      => Tviol_RST_OCLK_posedge,
           TimingData     => Tmkr_RST_OCLK_posedge,
           TestSignal     => RST_dly,
           TestSignalName => "RST",
           TestDelay      => tisd_RST_OCLK,
           RefSignal      => OCLK_dly,
           RefSignalName  => "OCLK",
           RefDelay       => ticd_OCLK,
           SetupHigh      => tsetup_RST_OCLK_posedge_posedge,
           SetupLow       => tsetup_RST_OCLK_negedge_posedge,
           HoldLow        => thold_RST_OCLK_posedge_posedge,
           HoldHigh       => thold_RST_OCLK_negedge_posedge,
           CheckEnabled   => TRUE,
           RefTransition  => 'R',
           HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => Warning
        );
        VitalSetupHoldCheck (
           Violation      => Tviol_RST_OCLK_negedge,
           TimingData     => Tmkr_RST_OCLK_negedge,
           TestSignal     => RST_dly,
           TestSignalName => "RST",
           TestDelay      => tisd_RST_OCLK,
           RefSignal      => OCLK_dly,
           RefSignalName  => "OCLK",
           RefDelay       => ticd_CLK,
           SetupHigh      => tsetup_RST_OCLK_posedge_negedge,
           SetupLow       => tsetup_RST_OCLK_negedge_negedge,
           HoldLow        => thold_RST_OCLK_posedge_negedge,
           HoldHigh       => thold_RST_OCLK_negedge_negedge,
           CheckEnabled   => TRUE,
           RefTransition  => 'F',
           HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => Warning
        );
     end if;
--------------------------------------------------------
--   BITSLIP  Setup/Hold 
--------------------------------------------------------
     VitalSetupHoldCheck
       (
         Violation      => Tviol_CE2_CLK_posedge,
         TimingData     => Tmkr_CE2_CLK_posedge,
         TestSignal     => CE2_dly,
         TestSignalName => "CE2",
         TestDelay      => tisd_CE2_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_CE2_CLK_posedge_posedge,
         SetupLow       => tsetup_CE2_CLK_negedge_posedge,
         HoldLow        => thold_CE2_CLK_posedge_posedge,
         HoldHigh       => thold_CE2_CLK_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_BITSLIP_CLKDIV_posedge,
         TimingData     => Tmkr_BITSLIP_CLKDIV_posedge,
         TestSignal     => BITSLIP_dly,
         TestSignalName => "BITSLIP",
         TestDelay      => tisd_BITSLIP_CLKDIV,
         RefSignal      => CLKDIV_dly,
         RefSignalName  => "CLKDIV",
         RefDelay       => ticd_CLKDIV,
         SetupHigh      => tsetup_BITSLIP_CLKDIV_posedge_posedge,
         SetupLow       => tsetup_BITSLIP_CLKDIV_negedge_posedge,
         HoldLow        => thold_BITSLIP_CLKDIV_posedge_posedge,
         HoldHigh       => thold_BITSLIP_CLKDIV_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_ISERDES_NODELAY",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     end if;
-- End of (TimingChecksOn)

--  Output-to-Clock path delay
     if(O_zd'event) then
        VitalPathDelay01
          (
            OutSignal     => O,
            GlitchData    => O_GlitchData,
            OutSignalName => "O",
            OutTemp       => O_zd,
            Paths         => (0 => (D_ipd'last_event, tpd_D_O,TRUE),
                              1 => (DDLY_ipd'last_event, tpd_DDLY_O,TRUE),
                              2 => (OFB_ipd'last_event, tpd_OFB_O,TRUE)),
            Mode          => VitalTransport,
            Xon           => Xon,
            MsgOn         => MsgOn,
            MsgSeverity   => WARNING
          );
     end if;
     if(Q1_zd'event) then
        VitalPathDelay01
          (
            OutSignal     => Q1,
            GlitchData    => Q1_GlitchData,
            OutSignalName => "Q1",
            OutTemp       => Q1_zd,
            Paths         => (0 => (CLKDIV_dly'last_event, tpd_CLKDIV_Q1,TRUE),
                              1 => (SR_dly'last_event, tpd_RST_Q1,TRUE)),
            Mode          => VitalTransport,
            Xon           => Xon,
            MsgOn         => MsgOn,
            MsgSeverity   => WARNING
          );
     end if;
     if(Q2_zd'event) then
        VitalPathDelay01
          (
            OutSignal     => Q2,
            GlitchData    => Q2_GlitchData,
            OutSignalName => "Q2",
            OutTemp       => Q2_zd,
            Paths         => (0 => (CLKDIV_dly'last_event, tpd_CLKDIV_Q2,TRUE),
                              1 => (SR_dly'last_event, tpd_RST_Q2,TRUE)),
            Mode          => VitalTransport,
            Xon           => Xon,
            MsgOn         => MsgOn,
            MsgSeverity   => WARNING
          );
     end if;
     if(Q3_zd'event) then
        VitalPathDelay01
          (
            OutSignal     => Q3,
            GlitchData    => Q3_GlitchData,
            OutSignalName => "Q3",
            OutTemp       => Q3_zd,
            Paths         => (0 => (CLKDIV_dly'last_event, tpd_CLKDIV_Q3,TRUE),
                              1 => (SR_dly'last_event, tpd_RST_Q3,TRUE)),
            Mode          => VitalTransport,
            Xon           => Xon,
            MsgOn         => MsgOn,
            MsgSeverity   => WARNING
          );
     end if;
     if(Q4_zd'event) then
        VitalPathDelay01
          (
            OutSignal     => Q4,
            GlitchData    => Q4_GlitchData,
            OutSignalName => "Q4",
            OutTemp       => Q4_zd,
            Paths         => (0 => (CLKDIV_dly'last_event, tpd_CLKDIV_Q4,TRUE),
                              1 => (SR_dly'last_event, tpd_RST_Q4,TRUE)),
            Mode          => VitalTransport,
            Xon           => Xon,
            MsgOn         => MsgOn,
            MsgSeverity   => WARNING
          );
     end if;
     if(Q5_zd'event) then
        VitalPathDelay01
          (
            OutSignal     => Q5,
            GlitchData    => Q5_GlitchData,
            OutSignalName => "Q5",
            OutTemp       => Q5_zd,
            Paths         => (0 => (CLKDIV_dly'last_event, tpd_CLKDIV_Q5,TRUE),
                              1 => (SR_dly'last_event, tpd_RST_Q5,TRUE)),
            Mode          => VitalTransport,
            Xon           => Xon,
            MsgOn         => MsgOn,
            MsgSeverity   => WARNING
          );
     end if;
     if(Q6_zd'event) then
        VitalPathDelay01
          (
            OutSignal     => Q6,
            GlitchData    => Q6_GlitchData,
            OutSignalName => "Q6",
            OutTemp       => Q6_zd,
            Paths         => (0 => (CLKDIV_dly'last_event, tpd_CLKDIV_Q6,TRUE),
                              1 => (SR_dly'last_event, tpd_RST_Q6,TRUE)),
            Mode          => VitalTransport,
            Xon           => Xon,
            MsgOn         => MsgOn,
            MsgSeverity   => WARNING
          );
     end if;

     if(SHIFTOUT1_zd'event) then
        SHIFTOUT1 <= SHIFTOUT1_zd;
     end if;

     if(SHIFTOUT2_zd'event) then
        SHIFTOUT2 <= SHIFTOUT2_zd;
     end if;

--  Wait signal (input/output pins)
   wait on
     D_CLK_dly,
     D_CLKB_dly,
     DDLY_CLK_dly,
     DDLY_CLKB_dly,
     CE1_dly,
     CE2_dly,
     CLK_dly,
     SR_dly,
     REV_dly,
     CLKDIV_dly,
     OCLK_dly,
     BITSLIP_dly,
     SHIFTIN1_dly,
     SHIFTIN2_dly,
     O_zd,
     Q1_zd,
     Q2_zd,
     Q3_zd,
     Q4_zd,
     Q5_zd,
     Q6_zd,
     SHIFTOUT1_zd,
     SHIFTOUT2_zd;
  end process prcs_output;


end X_ISERDES_NODELAY_V;

