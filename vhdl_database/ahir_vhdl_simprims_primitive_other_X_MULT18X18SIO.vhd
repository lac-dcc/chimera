-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  18X18 Signed Multiplier 
-- /___/   /\     Filename : X_MULT18X18SIO.vhd
-- \   \  /  \    Timestamp : Fri Mar 26 08:18:19 PST 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    07/25/05 - Added CLK_dly to the sensitivity list
--    08/29/05 - Added rest of the signals to the sensitivity list to avoid false
--             - Setup/Hold violations at initial stages
--    11/22/05 - CR 221818, tpw CLK
--    04/07/08 - CR 469973 -- Header Description fix
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision

----- CELL X_MULT18X18SIO -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_MULT18X18SIO is

  generic (

	AREG            : integer       := 1;
	BREG            : integer       := 1;
	B_INPUT         : string        := "DIRECT";

	PREG            : integer       := 1;

	TimingChecksOn  : boolean       := true;
	InstancePath    : string        := "*";
	Xon             : boolean       := true;
	MsgOn           : boolean       := false;
        LOC             : string        := "UNPLACED";

----- VITAL input wire delays

	tipd_A		: VitalDelayArrayType01 (17 downto 0 ) := (others => (0 ps, 0 ps));
	tipd_B		: VitalDelayArrayType01 (17 downto 0 ) := (others => (0 ps, 0 ps));
	tipd_BCIN	: VitalDelayArrayType01 (17 downto 0 ) := (others => (0 ps, 0 ps));
	tipd_CEA	: VitalDelayType01 := (0 ps, 0 ps);
	tipd_CEB	: VitalDelayType01 := (0 ps, 0 ps);
	tipd_CEP	: VitalDelayType01 := (0 ps, 0 ps);
	tipd_CLK	: VitalDelayType01 := (0 ps, 0 ps);
	tipd_RSTA	: VitalDelayType01 := (0 ps, 0 ps);
	tipd_RSTB	: VitalDelayType01 := (0 ps, 0 ps);
	tipd_RSTP	: VitalDelayType01 := (0 ps, 0 ps);

----- VITAL pin-to-pin propagation delays
           
	tpd_A_P		: VitalDelayArrayType01 (647 downto 0 ) := (others => (0 ps, 0 ps));
	tpd_B_P		: VitalDelayArrayType01 (647 downto 0 ) := (others => (0 ps, 0 ps));
	tpd_B_BCOUT	: VitalDelayArrayType01 (323 downto 0 ) := (others => (0 ps, 0 ps));
	tpd_BCIN_P	: VitalDelayArrayType01 (647 downto 0 ) := (others => (0 ps, 0 ps));
	tpd_BCIN_BCOUT	: VitalDelayArrayType01 (323 downto 0 ) := (others => (0 ps, 0 ps));

	tpd_CLK_P	: VitalDelayArrayType01 (35 downto 0) := (others => (0 ps, 0 ps));
	tpd_CLK_BCOUT	: VitalDelayArrayType01 (17 downto 0) := (others => (0 ps, 0 ps));

----- VITAL clock ticd delays
           
	ticd_CLK	: VitalDelayType := 0 ps;

----- VITAL clock-to-pin tisd delays

        tisd_A_CLK	: VitalDelayArrayType(17 downto 0) := (others => 0 ps);
        tisd_B_CLK	: VitalDelayArrayType(17 downto 0) := (others => 0 ps);
        tisd_BCIN_CLK	: VitalDelayArrayType(17 downto 0) := (others => 0 ps);
        tisd_CEA_CLK	: VitalDelayType := 0 ps;
        tisd_CEB_CLK	: VitalDelayType := 0 ps;
        tisd_CEP_CLK	: VitalDelayType := 0 ps;
        tisd_RSTA_CLK	: VitalDelayType := 0 ps;
        tisd_RSTB_CLK	: VitalDelayType := 0 ps;
        tisd_RSTP_CLK	: VitalDelayType := 0 ps;

----- VITAL setup and hold times

        tsetup_A_CLK_posedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);
        tsetup_A_CLK_negedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);

        tsetup_B_CLK_posedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);
        tsetup_B_CLK_negedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);

        tsetup_BCIN_CLK_posedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);
        tsetup_BCIN_CLK_negedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);

        tsetup_CEA_CLK_posedge_posedge : VitalDelayType := 0 ps;
        tsetup_CEA_CLK_negedge_posedge : VitalDelayType := 0 ps;

        tsetup_CEB_CLK_posedge_posedge : VitalDelayType := 0 ps;
        tsetup_CEB_CLK_negedge_posedge : VitalDelayType := 0 ps;

        tsetup_CEP_CLK_posedge_posedge : VitalDelayType := 0 ps;
        tsetup_CEP_CLK_negedge_posedge : VitalDelayType := 0 ps;

        tsetup_RSTA_CLK_posedge_posedge : VitalDelayType := 0 ps;
        tsetup_RSTA_CLK_negedge_posedge : VitalDelayType := 0 ps;

        tsetup_RSTB_CLK_posedge_posedge : VitalDelayType := 0 ps;
        tsetup_RSTB_CLK_negedge_posedge : VitalDelayType := 0 ps;

        tsetup_RSTP_CLK_posedge_posedge : VitalDelayType := 0 ps;
        tsetup_RSTP_CLK_negedge_posedge : VitalDelayType := 0 ps;

        thold_A_CLK_posedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);
        thold_A_CLK_negedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);

        thold_B_CLK_posedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);
        thold_B_CLK_negedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);

        thold_BCIN_CLK_posedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);
        thold_BCIN_CLK_negedge_posedge : VitalDelayArrayType(17 downto 0) := (others => 0 ps);

        thold_CEA_CLK_posedge_posedge : VitalDelayType := 0 ps;
        thold_CEA_CLK_negedge_posedge : VitalDelayType := 0 ps;

        thold_CEB_CLK_posedge_posedge : VitalDelayType := 0 ps;
        thold_CEB_CLK_negedge_posedge : VitalDelayType := 0 ps;

        thold_CEP_CLK_posedge_posedge : VitalDelayType := 0 ps;
        thold_CEP_CLK_negedge_posedge : VitalDelayType := 0 ps;

        thold_RSTA_CLK_posedge_posedge : VitalDelayType := 0 ps;
        thold_RSTA_CLK_negedge_posedge : VitalDelayType := 0 ps;

        thold_RSTB_CLK_posedge_posedge : VitalDelayType := 0 ps;
        thold_RSTB_CLK_negedge_posedge : VitalDelayType := 0 ps;

        thold_RSTP_CLK_posedge_posedge : VitalDelayType := 0 ps;
        thold_RSTP_CLK_negedge_posedge : VitalDelayType := 0 ps;

----- VITAL period check
        tperiod_CLK_posedge     : VitalDelayType := 0 ps;

----- VITAL pulse width
	tpw_CLK_posedge	: VitalDelayType := 0 ps;
	tpw_CLK_negedge	: VitalDelayType := 0 ps

----- VITAL Recovery

	);

  port (
	BCOUT	: out std_logic_vector (17 downto 0);
	P	: out std_logic_vector (35 downto 0);

	A	: in  std_logic_vector (17 downto 0);
	B	: in  std_logic_vector (17 downto 0);
	BCIN	: in  std_logic_vector (17 downto 0);
	CEA	: in  std_ulogic;
	CEB	: in  std_ulogic;
	CEP	: in  std_ulogic;
	CLK	: in  std_ulogic;
	RSTA	: in  std_ulogic;
	RSTB	: in  std_ulogic;
	RSTP	: in  std_ulogic
	);

  attribute VITAL_LEVEL0 of
    X_MULT18X18SIO : entity is true;

end X_MULT18X18SIO;


architecture X_MULT18X18SIO_V of X_MULT18X18SIO is

  attribute VITAL_LEVEL0 of
    X_MULT18X18SIO_V : architecture is true;

  TYPE VitalTimingDataArrayType IS ARRAY (NATURAL RANGE <>)
       OF VitalTimingDataType;

  constant MAX_P          : integer    := 36;
  constant MAX_BCOUT      : integer    := 36;
  constant MAX_BCIN       : integer    := 18;
  constant MAX_B          : integer    := 18;
  constant MAX_A          : integer    := 18;

  constant MSB_P          : integer    := 35;
  constant MSB_BCOUT      : integer    := 17;
  constant MSB_BCIN       : integer    := 17;
  constant MSB_B          : integer    := 17;
  constant MSB_A          : integer    := 17;

  signal A_ipd    : std_logic_vector(MSB_A downto 0) := (others => '0' );
  signal B_ipd    : std_logic_vector(MSB_B downto 0) := (others => '0' );
  signal BCIN_ipd : std_logic_vector(MSB_BCIN downto 0) := (others => '0' );
  signal CEA_ipd  : std_ulogic := 'X';
  signal CEB_ipd  : std_ulogic := 'X';
  signal CEP_ipd  : std_ulogic := 'X';
  signal CLK_ipd  : std_ulogic := 'X';
  signal GSR_ipd  : std_ulogic := 'X';
  signal RSTA_ipd : std_ulogic := 'X';
  signal RSTB_ipd : std_ulogic := 'X';
  signal RSTP_ipd : std_ulogic := 'X';

  signal A_dly    : std_logic_vector(MSB_A downto 0) := (others => '0' );
  signal B_dly    : std_logic_vector(MSB_B downto 0) := (others => '0' );
  signal BCIN_dly : std_logic_vector(MSB_BCIN downto 0) := (others => '0' );
  signal CEA_dly  : std_ulogic := 'X';
  signal CEB_dly  : std_ulogic := 'X';
  signal CEP_dly  : std_ulogic := 'X';
  signal CLK_dly  : std_ulogic := 'X';
  signal GSR_dly  : std_ulogic := '0';
  signal RSTA_dly : std_ulogic := 'X';
  signal RSTB_dly : std_ulogic := 'X';
  signal RSTP_dly : std_ulogic := 'X';


  --- Internal Signal Declarations

  signal qa_o_reg1 : std_logic_vector(MSB_A downto 0) := (others => '0');
  signal qa_o_mux  : std_logic_vector(MSB_A downto 0) := (others => '0');

  signal b_o_mux   : std_logic_vector(MSB_B downto 0) := (others => '0');
  signal qb_o_reg1 : std_logic_vector(MSB_B downto 0) := (others => '0');
  signal qb_o_mux  : std_logic_vector(MSB_B downto 0) := (others => '0');

  signal mult_o_int : std_logic_vector((MSB_A + MSB_B + 1) downto 0) := (others => '0');

  signal qp_o_reg : std_logic_vector(MSB_P downto 0) := (others => '0');
  signal qp_o_mux : std_logic_vector(MSB_P downto 0) := (others => '0');

  signal BCOUT_zd : std_logic_vector(MSB_BCOUT downto 0) := (others => '0');
  signal P_zd : std_logic_vector(MSB_P downto 0) := (others => '0');

begin

  GSR_dly <= GSR;   


  WireDelay : block
  begin
    A_Delay : for i in MSB_A downto 0 generate
        VitalWireDelay (A_ipd(i),    A(i),        tipd_A(i));
    end generate A_Delay;

    B_Delay : for i in MSB_B downto 0 generate
        VitalWireDelay (B_ipd(i),    B(i),        tipd_B(i));
    end generate B_Delay;

    BCIN_Delay : for i in MSB_BCIN downto 0 generate
        VitalWireDelay (BCIN_ipd(i),  BCIN(i),      tipd_BCIN(i));
    end generate BCIN_Delay;

    VitalWireDelay (CEA_ipd,	CEA,	tipd_CEA);
    VitalWireDelay (CEB_ipd,	CEB,	tipd_CEB);
    VitalWireDelay (CEP_ipd,	CEP,	tipd_CEP);
    VitalWireDelay (CLK_ipd,	CLK,	tipd_CLK);
    VitalWireDelay (RSTA_ipd,	RSTA,	tipd_RSTA);
    VitalWireDelay (RSTB_ipd,	RSTB,	tipd_RSTB);
    VitalWireDelay (RSTP_ipd,	RSTP,	tipd_RSTP);
  end block;
  


  SignalDelay : block
  begin
    A_Delay : for i in MSB_A downto 0 generate
        VitalSignalDelay (A_dly(i),     A_ipd(i),    tisd_A_CLK(i));
    end generate A_Delay;

    B_Delay : for i in MSB_B downto 0 generate
        VitalSignalDelay (B_dly(i),     B_ipd(i),    tisd_B_CLK(i));
    end generate B_Delay;

    BCIN_Delay : for i in MSB_BCIN downto 0 generate
        VitalSignalDelay (BCIN_dly(i),     BCIN_ipd(i),    tisd_BCIN_CLK(i));
    end generate BCIN_Delay;

    VitalSignalDelay (CEA_dly,        CEA_ipd,        tisd_CEA_CLK);
    VitalSignalDelay (CEB_dly,        CEB_ipd,        tisd_CEB_CLK);
    VitalSignalDelay (CEP_dly,        CEP_ipd,        tisd_CEP_CLK);

    VitalSignalDelay (CLK_dly,        CLK_ipd,        ticd_CLK);

    VitalSignalDelay (RSTA_dly,       RSTA_ipd,       tisd_RSTA_CLK);
    VitalSignalDelay (RSTB_dly,       RSTB_ipd,       tisd_RSTB_CLK);
    VitalSignalDelay (RSTP_dly,       RSTP_ipd,       tisd_RSTP_CLK);

  end block;



--####################################################################
--#####    Input Register A with 1 level of registers and a mux  #####
--####################################################################
  prcs_qa_1lvl:process(CLK_dly, GSR_dly)
  begin
      if(GSR_dly = '1') then
          qa_o_reg1 <= ( others => '0');
      elsif (GSR_dly = '0') then
         if(rising_edge(CLK_dly)) then
            if(RSTA_dly = '1') then
               qa_o_reg1 <= ( others => '0');
            elsif ((RSTA_dly = '0') and  (CEA_dly = '1')) then
               qa_o_reg1 <= A_dly;
            end if;
         end if;
      end if;
  end process prcs_qa_1lvl;

----------------------------------------------------------------------

  prcs_qa_o_mux:process(A_dly, qa_o_reg1)
  begin
     case AREG is
       when 0 => qa_o_mux <= A_dly;
       when 1 => qa_o_mux <= qa_o_reg1;
       when others =>
            assert false
            report "Attribute Syntax Error: The allowed values for AREG are 0 or 1"
            severity Failure;
     end case;
  end process prcs_qa_o_mux;

--####################################################################
--#####    Input Register B with two levels of registers and a mux ###
--####################################################################
  prcs_b_in:process(B_dly, BCIN_dly)
  begin
     if(B_INPUT ="DIRECT") then
        b_o_mux <= B_dly;
     elsif(B_INPUT ="CASCADE") then
        b_o_mux <= BCIN_dly;
     else
        assert false
        report "Attribute Syntax Error: The allowed values for B_INPUT are DIRECT or CASCADE."
        severity Failure;
     end if;
  end process prcs_b_in;
------------------------------------------------------------------
 prcs_qb_1lvl:process(CLK_dly, GSR_dly)
  begin
      if(GSR_dly = '1') then
          qb_o_reg1 <= ( others => '0');
      elsif (GSR_dly = '0') then
         if(rising_edge(CLK_dly)) then
            if(RSTB_dly = '1') then
               qb_o_reg1 <= ( others => '0');
            elsif ((RSTB_dly = '0') and  (CEB_dly = '1')) then
               qb_o_reg1 <= b_o_mux;
            end if;
         end if;
      end if;
  end process prcs_qb_1lvl;
------------------------------------------------------------------
  prcs_qb_o_mux:process(b_o_mux, qb_o_reg1)
  begin
     case BREG is
       when 0 => qb_o_mux <= b_o_mux;
       when 1 => qb_o_mux <= qb_o_reg1;
       when others =>
            assert false
            report "Attribute Syntax Error: The allowed values for BREG are 0 or 1 "
            severity Failure;
     end case;

  end process prcs_qb_o_mux;
--####################################################################
--#####                     Multiply                             #####
--####################################################################
  prcs_mult:process(qa_o_mux, qb_o_mux)
  begin
     mult_o_int <=  qa_o_mux * qb_o_mux;
  end process prcs_mult;
--####################################################################
--#####                    Output  P                             #####
--####################################################################
  prcs_qp_reg:process(CLK_dly, GSR_dly)
  begin
      if(GSR_dly = '1') then
         qp_o_reg <=  ( others => '0');
      elsif (GSR_dly = '0') then
         if(rising_edge(CLK_dly)) then
            if(RSTP_dly = '1') then
               qp_o_reg <= ( others => '0');
            elsif ((RSTP_dly = '0') and (CEP_dly = '1')) then
               qp_o_reg <= mult_o_int;
            end if;
         end if;
      end if;
  end process prcs_qp_reg;
------------------------------------------------------------------
  prcs_qp_mux:process(mult_o_int, qp_o_reg)
  begin
     case PREG is
       when 0 => qp_o_mux <= mult_o_int;
       when 1 => qp_o_mux <= qp_o_reg;
       when others =>
           assert false
           report "Attribute Syntax Error: The allowed values for PREG are 0 or 1"
           severity Failure;
     end case;

  end process prcs_qp_mux;
--####################################################################
--#####                   ZERO_DELAY_OUTPUTS                     #####
--####################################################################
  prcs_zero_delay_outputs:process(qb_o_mux, qp_o_mux)
  begin
    BCOUT_zd <= qb_o_mux;
    P_zd     <= qp_o_mux;
  end process prcs_zero_delay_outputs;


--####################################################################
--#####                   TIMING CHECKS                          #####
--####################################################################
  prcs_Timing : process

  variable P_GlitchData                 : VitalGlitchDataArrayType (35 downto 0 );
  variable BCOUT_GlitchData             : VitalGlitchDataArrayType (17 downto 0 );

--  Pin Timing Violations (all input pins)

  variable Tmkr_A_CLK_posedge     : VitalTimingDataArrayType(17 downto 0 );
  variable Tviol_A_CLK_posedge    : std_logic_vector(17 downto 0 ) := (others => '0');

  variable Tmkr_B_CLK_posedge     : VitalTimingDataArrayType(17 downto 0 );
  variable Tviol_B_CLK_posedge    : std_logic_vector(17 downto 0 ) := (others => '0');

  variable Tmkr_BCIN_CLK_posedge  : VitalTimingDataArrayType(17 downto 0 );
  variable Tviol_BCIN_CLK_posedge : std_logic_vector(17 downto 0 ) := (others => '0');

  variable Tmkr_CEA_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_CEA_CLK_posedge  : std_ulogic := '0';
 
  variable Tmkr_CEB_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_CEB_CLK_posedge  : std_ulogic := '0'; 

  variable Tmkr_CEP_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_CEP_CLK_posedge  : std_ulogic := '0'; 

  variable Tmkr_RSTA_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_RSTA_CLK_posedge : std_ulogic := '0'; 

  variable Tmkr_RSTB_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_RSTB_CLK_posedge : std_ulogic := '0'; 

  variable Tmkr_RSTP_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_RSTP_CLK_posedge : std_ulogic := '0'; 

  variable PInfo_CLK             : VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_CLK             : std_ulogic          := '0';

  begin 

    if (TimingChecksOn) then
--=====  Vital SetupHold Checks for Bus signal A =====
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(0),
         TimingData           => Tmkr_A_CLK_posedge(0),
         TestSignal           => A_dly(0),
         TestSignalName       => "A(0)",
         TestDelay            => tisd_A_CLK(0),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(0),
         SetupLow             => tsetup_A_CLK_negedge_posedge(0),
         HoldHigh             => thold_A_CLK_posedge_posedge(0),
         HoldLow              => thold_A_CLK_negedge_posedge(0),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(1),
         TimingData           => Tmkr_A_CLK_posedge(1),
         TestSignal           => A_dly(1),
         TestSignalName       => "A(1)",
         TestDelay            => tisd_A_CLK(1),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(1),
         SetupLow             => tsetup_A_CLK_negedge_posedge(1),
         HoldHigh             => thold_A_CLK_posedge_posedge(1),
         HoldLow              => thold_A_CLK_negedge_posedge(1),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(2),
         TimingData           => Tmkr_A_CLK_posedge(2),
         TestSignal           => A_dly(2),
         TestSignalName       => "A(2)",
         TestDelay            => tisd_A_CLK(2),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(2),
         SetupLow             => tsetup_A_CLK_negedge_posedge(2),
         HoldHigh             => thold_A_CLK_posedge_posedge(2),
         HoldLow              => thold_A_CLK_negedge_posedge(2),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(3),
         TimingData           => Tmkr_A_CLK_posedge(3),
         TestSignal           => A_dly(3),
         TestSignalName       => "A(3)",
         TestDelay            => tisd_A_CLK(3),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(3),
         SetupLow             => tsetup_A_CLK_negedge_posedge(3),
         HoldHigh             => thold_A_CLK_posedge_posedge(3),
         HoldLow              => thold_A_CLK_negedge_posedge(3),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(4),
         TimingData           => Tmkr_A_CLK_posedge(4),
         TestSignal           => A_dly(4),
         TestSignalName       => "A(4)",
         TestDelay            => tisd_A_CLK(4),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(4),
         SetupLow             => tsetup_A_CLK_negedge_posedge(4),
         HoldHigh             => thold_A_CLK_posedge_posedge(4),
         HoldLow              => thold_A_CLK_negedge_posedge(4),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(5),
         TimingData           => Tmkr_A_CLK_posedge(5),
         TestSignal           => A_dly(5),
         TestSignalName       => "A(5)",
         TestDelay            => tisd_A_CLK(5),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(5),
         SetupLow             => tsetup_A_CLK_negedge_posedge(5),
         HoldHigh             => thold_A_CLK_posedge_posedge(5),
         HoldLow              => thold_A_CLK_negedge_posedge(5),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(6),
         TimingData           => Tmkr_A_CLK_posedge(6),
         TestSignal           => A_dly(6),
         TestSignalName       => "A(6)",
         TestDelay            => tisd_A_CLK(6),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(6),
         SetupLow             => tsetup_A_CLK_negedge_posedge(6),
         HoldHigh             => thold_A_CLK_posedge_posedge(6),
         HoldLow              => thold_A_CLK_negedge_posedge(6),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(7),
         TimingData           => Tmkr_A_CLK_posedge(7),
         TestSignal           => A_dly(7),
         TestSignalName       => "A(7)",
         TestDelay            => tisd_A_CLK(7),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(7),
         SetupLow             => tsetup_A_CLK_negedge_posedge(7),
         HoldHigh             => thold_A_CLK_posedge_posedge(7),
         HoldLow              => thold_A_CLK_negedge_posedge(7),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(8),
         TimingData           => Tmkr_A_CLK_posedge(8),
         TestSignal           => A_dly(8),
         TestSignalName       => "A(8)",
         TestDelay            => tisd_A_CLK(8),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(8),
         SetupLow             => tsetup_A_CLK_negedge_posedge(8),
         HoldHigh             => thold_A_CLK_posedge_posedge(8),
         HoldLow              => thold_A_CLK_negedge_posedge(8),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(9),
         TimingData           => Tmkr_A_CLK_posedge(9),
         TestSignal           => A_dly(9),
         TestSignalName       => "A(9)",
         TestDelay            => tisd_A_CLK(9),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(9),
         SetupLow             => tsetup_A_CLK_negedge_posedge(9),
         HoldHigh             => thold_A_CLK_posedge_posedge(9),
         HoldLow              => thold_A_CLK_negedge_posedge(9),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(10),
         TimingData           => Tmkr_A_CLK_posedge(10),
         TestSignal           => A_dly(10),
         TestSignalName       => "A(10)",
         TestDelay            => tisd_A_CLK(10),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(10),
         SetupLow             => tsetup_A_CLK_negedge_posedge(10),
         HoldHigh             => thold_A_CLK_posedge_posedge(10),
         HoldLow              => thold_A_CLK_negedge_posedge(10),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(11),
         TimingData           => Tmkr_A_CLK_posedge(11),
         TestSignal           => A_dly(11),
         TestSignalName       => "A(11)",
         TestDelay            => tisd_A_CLK(11),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(11),
         SetupLow             => tsetup_A_CLK_negedge_posedge(11),
         HoldHigh             => thold_A_CLK_posedge_posedge(11),
         HoldLow              => thold_A_CLK_negedge_posedge(11),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(12),
         TimingData           => Tmkr_A_CLK_posedge(12),
         TestSignal           => A_dly(12),
         TestSignalName       => "A(12)",
         TestDelay            => tisd_A_CLK(12),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(12),
         SetupLow             => tsetup_A_CLK_negedge_posedge(12),
         HoldHigh             => thold_A_CLK_posedge_posedge(12),
         HoldLow              => thold_A_CLK_negedge_posedge(12),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(13),
         TimingData           => Tmkr_A_CLK_posedge(13),
         TestSignal           => A_dly(13),
         TestSignalName       => "A(13)",
         TestDelay            => tisd_A_CLK(13),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(13),
         SetupLow             => tsetup_A_CLK_negedge_posedge(13),
         HoldHigh             => thold_A_CLK_posedge_posedge(13),
         HoldLow              => thold_A_CLK_negedge_posedge(13),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(14),
         TimingData           => Tmkr_A_CLK_posedge(14),
         TestSignal           => A_dly(14),
         TestSignalName       => "A(14)",
         TestDelay            => tisd_A_CLK(14),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(14),
         SetupLow             => tsetup_A_CLK_negedge_posedge(14),
         HoldHigh             => thold_A_CLK_posedge_posedge(14),
         HoldLow              => thold_A_CLK_negedge_posedge(14),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(15),
         TimingData           => Tmkr_A_CLK_posedge(15),
         TestSignal           => A_dly(15),
         TestSignalName       => "A(15)",
         TestDelay            => tisd_A_CLK(15),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(15),
         SetupLow             => tsetup_A_CLK_negedge_posedge(15),
         HoldHigh             => thold_A_CLK_posedge_posedge(15),
         HoldLow              => thold_A_CLK_negedge_posedge(15),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(16),
         TimingData           => Tmkr_A_CLK_posedge(16),
         TestSignal           => A_dly(16),
         TestSignalName       => "A(16)",
         TestDelay            => tisd_A_CLK(16),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(16),
         SetupLow             => tsetup_A_CLK_negedge_posedge(16),
         HoldHigh             => thold_A_CLK_posedge_posedge(16),
         HoldLow              => thold_A_CLK_negedge_posedge(16),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_A_CLK_posedge(17),
         TimingData           => Tmkr_A_CLK_posedge(17),
         TestSignal           => A_dly(17),
         TestSignalName       => "A(17)",
         TestDelay            => tisd_A_CLK(17),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_A_CLK_posedge_posedge(17),
         SetupLow             => tsetup_A_CLK_negedge_posedge(17),
         HoldHigh             => thold_A_CLK_posedge_posedge(17),
         HoldLow              => thold_A_CLK_negedge_posedge(17),
         CheckEnabled         => (TO_X01((not RSTA_dly) and (CEA_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
--=====  Vital SetupHold Checks for Bus signal B =====
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(0),
         TimingData           => Tmkr_B_CLK_posedge(0),
         TestSignal           => B_dly(0),
         TestSignalName       => "B(0)",
         TestDelay            => tisd_B_CLK(0),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(0),
         SetupLow             => tsetup_B_CLK_negedge_posedge(0),
         HoldHigh             => thold_B_CLK_posedge_posedge(0),
         HoldLow              => thold_B_CLK_negedge_posedge(0),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(1),
         TimingData           => Tmkr_B_CLK_posedge(1),
         TestSignal           => B_dly(1),
         TestSignalName       => "B(1)",
         TestDelay            => tisd_B_CLK(1),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(1),
         SetupLow             => tsetup_B_CLK_negedge_posedge(1),
         HoldHigh             => thold_B_CLK_posedge_posedge(1),
         HoldLow              => thold_B_CLK_negedge_posedge(1),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(2),
         TimingData           => Tmkr_B_CLK_posedge(2),
         TestSignal           => B_dly(2),
         TestSignalName       => "B(2)",
         TestDelay            => tisd_B_CLK(2),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(2),
         SetupLow             => tsetup_B_CLK_negedge_posedge(2),
         HoldHigh             => thold_B_CLK_posedge_posedge(2),
         HoldLow              => thold_B_CLK_negedge_posedge(2),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(3),
         TimingData           => Tmkr_B_CLK_posedge(3),
         TestSignal           => B_dly(3),
         TestSignalName       => "B(3)",
         TestDelay            => tisd_B_CLK(3),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(3),
         SetupLow             => tsetup_B_CLK_negedge_posedge(3),
         HoldHigh             => thold_B_CLK_posedge_posedge(3),
         HoldLow              => thold_B_CLK_negedge_posedge(3),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(4),
         TimingData           => Tmkr_B_CLK_posedge(4),
         TestSignal           => B_dly(4),
         TestSignalName       => "B(4)",
         TestDelay            => tisd_B_CLK(4),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(4),
         SetupLow             => tsetup_B_CLK_negedge_posedge(4),
         HoldHigh             => thold_B_CLK_posedge_posedge(4),
         HoldLow              => thold_B_CLK_negedge_posedge(4),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(5),
         TimingData           => Tmkr_B_CLK_posedge(5),
         TestSignal           => B_dly(5),
         TestSignalName       => "B(5)",
         TestDelay            => tisd_B_CLK(5),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(5),
         SetupLow             => tsetup_B_CLK_negedge_posedge(5),
         HoldHigh             => thold_B_CLK_posedge_posedge(5),
         HoldLow              => thold_B_CLK_negedge_posedge(5),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(6),
         TimingData           => Tmkr_B_CLK_posedge(6),
         TestSignal           => B_dly(6),
         TestSignalName       => "B(6)",
         TestDelay            => tisd_B_CLK(6),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(6),
         SetupLow             => tsetup_B_CLK_negedge_posedge(6),
         HoldHigh             => thold_B_CLK_posedge_posedge(6),
         HoldLow              => thold_B_CLK_negedge_posedge(6),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(7),
         TimingData           => Tmkr_B_CLK_posedge(7),
         TestSignal           => B_dly(7),
         TestSignalName       => "B(7)",
         TestDelay            => tisd_B_CLK(7),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(7),
         SetupLow             => tsetup_B_CLK_negedge_posedge(7),
         HoldHigh             => thold_B_CLK_posedge_posedge(7),
         HoldLow              => thold_B_CLK_negedge_posedge(7),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(8),
         TimingData           => Tmkr_B_CLK_posedge(8),
         TestSignal           => B_dly(8),
         TestSignalName       => "B(8)",
         TestDelay            => tisd_B_CLK(8),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(8),
         SetupLow             => tsetup_B_CLK_negedge_posedge(8),
         HoldHigh             => thold_B_CLK_posedge_posedge(8),
         HoldLow              => thold_B_CLK_negedge_posedge(8),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(9),
         TimingData           => Tmkr_B_CLK_posedge(9),
         TestSignal           => B_dly(9),
         TestSignalName       => "B(9)",
         TestDelay            => tisd_B_CLK(9),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(9),
         SetupLow             => tsetup_B_CLK_negedge_posedge(9),
         HoldHigh             => thold_B_CLK_posedge_posedge(9),
         HoldLow              => thold_B_CLK_negedge_posedge(9),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(10),
         TimingData           => Tmkr_B_CLK_posedge(10),
         TestSignal           => B_dly(10),
         TestSignalName       => "B(10)",
         TestDelay            => tisd_B_CLK(10),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(10),
         SetupLow             => tsetup_B_CLK_negedge_posedge(10),
         HoldHigh             => thold_B_CLK_posedge_posedge(10),
         HoldLow              => thold_B_CLK_negedge_posedge(10),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(11),
         TimingData           => Tmkr_B_CLK_posedge(11),
         TestSignal           => B_dly(11),
         TestSignalName       => "B(11)",
         TestDelay            => tisd_B_CLK(11),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(11),
         SetupLow             => tsetup_B_CLK_negedge_posedge(11),
         HoldHigh             => thold_B_CLK_posedge_posedge(11),
         HoldLow              => thold_B_CLK_negedge_posedge(11),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(12),
         TimingData           => Tmkr_B_CLK_posedge(12),
         TestSignal           => B_dly(12),
         TestSignalName       => "B(12)",
         TestDelay            => tisd_B_CLK(12),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(12),
         SetupLow             => tsetup_B_CLK_negedge_posedge(12),
         HoldHigh             => thold_B_CLK_posedge_posedge(12),
         HoldLow              => thold_B_CLK_negedge_posedge(12),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(13),
         TimingData           => Tmkr_B_CLK_posedge(13),
         TestSignal           => B_dly(13),
         TestSignalName       => "B(13)",
         TestDelay            => tisd_B_CLK(13),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(13),
         SetupLow             => tsetup_B_CLK_negedge_posedge(13),
         HoldHigh             => thold_B_CLK_posedge_posedge(13),
         HoldLow              => thold_B_CLK_negedge_posedge(13),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(14),
         TimingData           => Tmkr_B_CLK_posedge(14),
         TestSignal           => B_dly(14),
         TestSignalName       => "B(14)",
         TestDelay            => tisd_B_CLK(14),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(14),
         SetupLow             => tsetup_B_CLK_negedge_posedge(14),
         HoldHigh             => thold_B_CLK_posedge_posedge(14),
         HoldLow              => thold_B_CLK_negedge_posedge(14),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(15),
         TimingData           => Tmkr_B_CLK_posedge(15),
         TestSignal           => B_dly(15),
         TestSignalName       => "B(15)",
         TestDelay            => tisd_B_CLK(15),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(15),
         SetupLow             => tsetup_B_CLK_negedge_posedge(15),
         HoldHigh             => thold_B_CLK_posedge_posedge(15),
         HoldLow              => thold_B_CLK_negedge_posedge(15),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(16),
         TimingData           => Tmkr_B_CLK_posedge(16),
         TestSignal           => B_dly(16),
         TestSignalName       => "B(16)",
         TestDelay            => tisd_B_CLK(16),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(16),
         SetupLow             => tsetup_B_CLK_negedge_posedge(16),
         HoldHigh             => thold_B_CLK_posedge_posedge(16),
         HoldLow              => thold_B_CLK_negedge_posedge(16),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_B_CLK_posedge(17),
         TimingData           => Tmkr_B_CLK_posedge(17),
         TestSignal           => B_dly(17),
         TestSignalName       => "B(17)",
         TestDelay            => tisd_B_CLK(17),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_B_CLK_posedge_posedge(17),
         SetupLow             => tsetup_B_CLK_negedge_posedge(17),
         HoldHigh             => thold_B_CLK_posedge_posedge(17),
         HoldLow              => thold_B_CLK_negedge_posedge(17),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
--=====  Vital SetupHold Checks for Bus signal BCIN =====
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(0),
         TimingData           => Tmkr_BCIN_CLK_posedge(0),
         TestSignal           => BCIN_dly(0),
         TestSignalName       => "BCIN(0)",
         TestDelay            => tisd_BCIN_CLK(0),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(0),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(0),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(0),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(0),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(1),
         TimingData           => Tmkr_BCIN_CLK_posedge(1),
         TestSignal           => BCIN_dly(1),
         TestSignalName       => "BCIN(1)",
         TestDelay            => tisd_BCIN_CLK(1),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(1),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(1),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(1),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(1),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(2),
         TimingData           => Tmkr_BCIN_CLK_posedge(2),
         TestSignal           => BCIN_dly(2),
         TestSignalName       => "BCIN(2)",
         TestDelay            => tisd_BCIN_CLK(2),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(2),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(2),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(2),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(2),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(3),
         TimingData           => Tmkr_BCIN_CLK_posedge(3),
         TestSignal           => BCIN_dly(3),
         TestSignalName       => "BCIN(3)",
         TestDelay            => tisd_BCIN_CLK(3),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(3),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(3),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(3),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(3),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(4),
         TimingData           => Tmkr_BCIN_CLK_posedge(4),
         TestSignal           => BCIN_dly(4),
         TestSignalName       => "BCIN(4)",
         TestDelay            => tisd_BCIN_CLK(4),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(4),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(4),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(4),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(4),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(5),
         TimingData           => Tmkr_BCIN_CLK_posedge(5),
         TestSignal           => BCIN_dly(5),
         TestSignalName       => "BCIN(5)",
         TestDelay            => tisd_BCIN_CLK(5),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(5),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(5),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(5),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(5),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(6),
         TimingData           => Tmkr_BCIN_CLK_posedge(6),
         TestSignal           => BCIN_dly(6),
         TestSignalName       => "BCIN(6)",
         TestDelay            => tisd_BCIN_CLK(6),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(6),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(6),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(6),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(6),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(7),
         TimingData           => Tmkr_BCIN_CLK_posedge(7),
         TestSignal           => BCIN_dly(7),
         TestSignalName       => "BCIN(7)",
         TestDelay            => tisd_BCIN_CLK(7),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(7),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(7),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(7),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(7),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(8),
         TimingData           => Tmkr_BCIN_CLK_posedge(8),
         TestSignal           => BCIN_dly(8),
         TestSignalName       => "BCIN(8)",
         TestDelay            => tisd_BCIN_CLK(8),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(8),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(8),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(8),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(8),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(9),
         TimingData           => Tmkr_BCIN_CLK_posedge(9),
         TestSignal           => BCIN_dly(9),
         TestSignalName       => "BCIN(9)",
         TestDelay            => tisd_BCIN_CLK(9),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(9),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(9),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(9),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(9),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(10),
         TimingData           => Tmkr_BCIN_CLK_posedge(10),
         TestSignal           => BCIN_dly(10),
         TestSignalName       => "BCIN(10)",
         TestDelay            => tisd_BCIN_CLK(10),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(10),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(10),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(10),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(10),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(11),
         TimingData           => Tmkr_BCIN_CLK_posedge(11),
         TestSignal           => BCIN_dly(11),
         TestSignalName       => "BCIN(11)",
         TestDelay            => tisd_BCIN_CLK(11),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(11),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(11),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(11),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(11),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(12),
         TimingData           => Tmkr_BCIN_CLK_posedge(12),
         TestSignal           => BCIN_dly(12),
         TestSignalName       => "BCIN(12)",
         TestDelay            => tisd_BCIN_CLK(12),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(12),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(12),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(12),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(12),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(13),
         TimingData           => Tmkr_BCIN_CLK_posedge(13),
         TestSignal           => BCIN_dly(13),
         TestSignalName       => "BCIN(13)",
         TestDelay            => tisd_BCIN_CLK(13),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(13),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(13),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(13),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(13),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(14),
         TimingData           => Tmkr_BCIN_CLK_posedge(14),
         TestSignal           => BCIN_dly(14),
         TestSignalName       => "BCIN(14)",
         TestDelay            => tisd_BCIN_CLK(14),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(14),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(14),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(14),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(14),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(15),
         TimingData           => Tmkr_BCIN_CLK_posedge(15),
         TestSignal           => BCIN_dly(15),
         TestSignalName       => "BCIN(15)",
         TestDelay            => tisd_BCIN_CLK(15),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(15),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(15),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(15),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(15),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(16),
         TimingData           => Tmkr_BCIN_CLK_posedge(16),
         TestSignal           => BCIN_dly(16),
         TestSignalName       => "BCIN(16)",
         TestDelay            => tisd_BCIN_CLK(16),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(16),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(16),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(16),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(16),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
       VitalSetupHoldCheck (
         Violation            => Tviol_BCIN_CLK_posedge(17),
         TimingData           => Tmkr_BCIN_CLK_posedge(17),
         TestSignal           => BCIN_dly(17),
         TestSignalName       => "BCIN(17)",
         TestDelay            => tisd_BCIN_CLK(17),
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_BCIN_CLK_posedge_posedge(17),
         SetupLow             => tsetup_BCIN_CLK_negedge_posedge(17),
         HoldHigh             => thold_BCIN_CLK_posedge_posedge(17),
         HoldLow              => thold_BCIN_CLK_negedge_posedge(17),
         CheckEnabled         => (TO_X01((not RSTB_dly) and (CEB_dly)) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => True,
         MsgSeverity          => Error);
--=====  Vital SetupHold Checks signal CEA =====
       VitalSetupHoldCheck (
         Violation            => Tviol_CEA_CLK_posedge,
         TimingData           => Tmkr_CEA_CLK_posedge,
         TestSignal           => CEA_dly,
         TestSignalName       => "CEA",
         TestDelay            => tisd_CEA_CLK,
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_CEA_CLK_posedge_posedge,
         SetupLow             => tsetup_CEA_CLK_negedge_posedge,
         HoldHigh             => thold_CEA_CLK_posedge_posedge,
         HoldLow              => thold_CEA_CLK_negedge_posedge,
         CheckEnabled         => (TO_X01(not RSTA_dly) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Checks signal CEB =====
       VitalSetupHoldCheck (
         Violation            => Tviol_CEB_CLK_posedge,
         TimingData           => Tmkr_CEB_CLK_posedge,
         TestSignal           => CEB_dly,
         TestSignalName       => "CEB",
         TestDelay            => tisd_CEB_CLK,
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_CEB_CLK_posedge_posedge,
         SetupLow             => tsetup_CEB_CLK_negedge_posedge,
         HoldHigh             => thold_CEB_CLK_posedge_posedge,
         HoldLow              => thold_CEB_CLK_negedge_posedge,
         CheckEnabled         => (TO_X01(not RSTB_dly) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Checks signal CEP =====
       VitalSetupHoldCheck (
         Violation            => Tviol_CEP_CLK_posedge,
         TimingData           => Tmkr_CEP_CLK_posedge,
         TestSignal           => CEP_dly,
         TestSignalName       => "CEP",
         TestDelay            => tisd_CEP_CLK,
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_CEP_CLK_posedge_posedge,
         SetupLow             => tsetup_CEP_CLK_negedge_posedge,
         HoldHigh             => thold_CEP_CLK_posedge_posedge,
         HoldLow              => thold_CEP_CLK_negedge_posedge,
         CheckEnabled         => (TO_X01(not RSTP_dly) /= '0') and (TO_X01(GSR_dly) /= '1'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Checks signal RSTA =====
       VitalSetupHoldCheck (
         Violation            => Tviol_RSTA_CLK_posedge,
         TimingData           => Tmkr_RSTA_CLK_posedge,
         TestSignal           => RSTA_dly,
         TestSignalName       => "RSTA",
         TestDelay            => tisd_RSTA_CLK,
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_RSTA_CLK_posedge_posedge,
         SetupLow             => tsetup_RSTA_CLK_negedge_posedge,
         HoldHigh             => thold_RSTA_CLK_posedge_posedge,
         HoldLow              => thold_RSTA_CLK_negedge_posedge,
         CheckEnabled         => (TO_X01(GSR_dly) = '0'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Checks signal RSTB =====
       VitalSetupHoldCheck (
         Violation            => Tviol_RSTB_CLK_posedge,
         TimingData           => Tmkr_RSTB_CLK_posedge,
         TestSignal           => RSTB_dly,
         TestSignalName       => "RSTB",
         TestDelay            => tisd_RSTB_CLK,
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_RSTB_CLK_posedge_posedge,
         SetupLow             => tsetup_RSTB_CLK_negedge_posedge,
         HoldHigh             => thold_RSTB_CLK_posedge_posedge,
         HoldLow              => thold_RSTB_CLK_negedge_posedge,
         CheckEnabled         => (TO_X01(GSR_dly) = '0'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Checks signal RSTP =====
       VitalSetupHoldCheck (
         Violation            => Tviol_RSTP_CLK_posedge,
         TimingData           => Tmkr_RSTP_CLK_posedge,
         TestSignal           => RSTP_dly,
         TestSignalName       => "RSTP",
         TestDelay            => tisd_RSTP_CLK,
         RefSignal            => CLK_dly,
         RefSignalName        => "CLK",
         RefDelay             => ticd_CLK,
         SetupHigh            => tsetup_RSTP_CLK_posedge_posedge,
         SetupLow             => tsetup_RSTP_CLK_negedge_posedge,
         HoldHigh             => thold_RSTP_CLK_posedge_posedge,
         HoldLow              => thold_RSTP_CLK_negedge_posedge,
         CheckEnabled         => (TO_X01(GSR_dly) = '0'),
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);

       VitalPeriodPulseCheck (
         Violation            => Pviol_CLK,
         PeriodData           => PInfo_CLK,
         TestSignal           => CLK_dly,
         TestSignalName       => "CLK",
         TestDelay            => 0 ps,
         Period               => tperiod_CLK_posedge,
         PulseWidthHigh       => tpw_CLK_posedge,
         PulseWidthLow        => tpw_CLK_negedge,
         CheckEnabled         => (TO_X01(GSR_dly) = '0'),
         HeaderMsg            => InstancePath & "/X_MULT18X18SIO",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);

    end if;
--======================  Path Delays  ======================
       VitalPathDelay01 (
         OutSignal	=> P(35),
         GlitchData	=> P_GlitchData(35),
         OutSignalName	=> "P(35)",
         OutTemp	=> P_zd(35),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 0)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 0)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 0)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 0)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 0)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 0)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 0)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 0)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 0)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 0)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 0)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 0)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 0)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 0)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 0)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 0)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 0)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 0)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 0)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 0)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 0)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 0)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 0)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 0)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 0)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 0)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 0)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 0)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 0)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 0)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 0)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 0)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 0)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 0)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 0)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 0)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 0)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 0)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 0)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 0)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 0)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 0)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 0)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 0)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 0)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 0)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 0)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 0)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 0)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 0)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 0)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 0)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 0)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 0)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(35), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(34),
         GlitchData	=> P_GlitchData(34),
         OutSignalName	=> "P(34)",
         OutTemp	=> P_zd(34),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 1)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 1)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 1)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 1)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 1)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 1)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 1)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 1)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 1)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 1)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 1)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 1)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 1)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 1)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 1)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 1)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 1)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 1)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 1)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 1)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 1)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 1)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 1)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 1)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 1)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 1)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 1)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 1)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 1)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 1)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 1)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 1)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 1)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 1)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 1)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 1)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 1)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 1)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 1)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 1)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 1)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 1)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 1)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 1)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 1)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 1)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 1)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 1)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 1)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 1)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 1)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 1)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 1)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 1)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(34), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(33),
         GlitchData	=> P_GlitchData(33),
         OutSignalName	=> "P(33)",
         OutTemp	=> P_zd(33),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 2)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 2)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 2)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 2)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 2)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 2)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 2)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 2)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 2)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 2)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 2)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 2)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 2)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 2)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 2)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 2)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 2)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 2)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 2)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 2)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 2)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 2)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 2)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 2)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 2)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 2)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 2)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 2)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 2)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 2)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 2)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 2)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 2)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 2)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 2)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 2)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 2)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 2)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 2)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 2)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 2)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 2)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 2)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 2)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 2)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 2)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 2)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 2)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 2)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 2)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 2)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 2)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 2)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 2)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(33), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(32),
         GlitchData	=> P_GlitchData(32),
         OutSignalName	=> "P(32)",
         OutTemp	=> P_zd(32),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 3)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 3)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 3)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 3)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 3)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 3)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 3)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 3)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 3)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 3)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 3)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 3)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 3)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 3)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 3)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 3)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 3)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 3)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 3)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 3)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 3)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 3)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 3)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 3)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 3)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 3)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 3)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 3)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 3)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 3)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 3)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 3)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 3)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 3)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 3)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 3)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 3)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 3)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 3)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 3)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 3)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 3)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 3)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 3)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 3)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 3)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 3)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 3)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 3)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 3)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 3)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 3)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 3)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 3)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(32), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(31),
         GlitchData	=> P_GlitchData(31),
         OutSignalName	=> "P(31)",
         OutTemp	=> P_zd(31),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 4)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 4)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 4)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 4)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 4)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 4)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 4)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 4)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 4)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 4)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 4)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 4)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 4)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 4)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 4)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 4)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 4)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 4)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 4)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 4)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 4)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 4)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 4)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 4)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 4)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 4)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 4)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 4)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 4)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 4)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 4)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 4)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 4)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 4)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 4)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 4)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 4)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 4)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 4)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 4)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 4)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 4)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 4)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 4)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 4)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 4)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 4)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 4)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 4)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 4)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 4)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 4)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 4)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 4)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(31), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(30),
         GlitchData	=> P_GlitchData(30),
         OutSignalName	=> "P(30)",
         OutTemp	=> P_zd(30),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 5)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 5)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 5)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 5)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 5)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 5)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 5)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 5)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 5)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 5)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 5)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 5)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 5)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 5)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 5)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 5)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 5)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 5)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 5)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 5)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 5)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 5)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 5)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 5)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 5)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 5)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 5)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 5)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 5)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 5)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 5)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 5)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 5)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 5)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 5)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 5)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 5)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 5)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 5)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 5)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 5)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 5)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 5)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 5)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 5)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 5)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 5)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 5)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 5)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 5)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 5)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 5)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 5)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 5)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(30), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(29),
         GlitchData	=> P_GlitchData(29),
         OutSignalName	=> "P(29)",
         OutTemp	=> P_zd(29),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 6)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 6)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 6)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 6)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 6)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 6)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 6)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 6)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 6)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 6)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 6)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 6)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 6)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 6)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 6)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 6)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 6)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 6)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 6)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 6)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 6)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 6)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 6)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 6)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 6)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 6)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 6)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 6)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 6)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 6)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 6)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 6)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 6)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 6)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 6)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 6)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 6)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 6)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 6)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 6)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 6)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 6)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 6)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 6)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 6)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 6)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 6)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 6)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 6)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 6)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 6)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 6)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 6)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 6)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(29), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(28),
         GlitchData	=> P_GlitchData(28),
         OutSignalName	=> "P(28)",
         OutTemp	=> P_zd(28),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 7)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 7)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 7)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 7)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 7)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 7)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 7)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 7)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 7)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 7)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 7)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 7)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 7)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 7)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 7)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 7)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 7)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 7)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 7)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 7)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 7)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 7)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 7)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 7)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 7)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 7)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 7)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 7)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 7)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 7)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 7)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 7)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 7)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 7)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 7)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 7)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 7)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 7)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 7)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 7)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 7)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 7)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 7)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 7)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 7)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 7)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 7)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 7)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 7)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 7)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 7)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 7)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 7)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 7)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(28), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(27),
         GlitchData	=> P_GlitchData(27),
         OutSignalName	=> "P(27)",
         OutTemp	=> P_zd(27),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 8)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 8)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 8)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 8)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 8)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 8)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 8)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 8)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 8)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 8)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 8)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 8)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 8)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 8)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 8)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 8)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 8)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 8)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 8)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 8)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 8)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 8)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 8)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 8)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 8)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 8)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 8)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 8)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 8)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 8)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 8)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 8)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 8)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 8)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 8)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 8)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 8)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 8)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 8)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 8)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 8)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 8)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 8)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 8)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 8)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 8)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 8)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 8)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 8)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 8)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 8)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 8)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 8)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 8)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(27), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(26),
         GlitchData	=> P_GlitchData(26),
         OutSignalName	=> "P(26)",
         OutTemp	=> P_zd(26),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 9)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 9)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 9)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 9)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 9)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 9)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 9)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 9)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 9)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 9)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 9)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 9)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 9)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 9)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 9)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 9)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 9)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 9)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 9)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 9)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 9)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 9)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 9)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 9)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 9)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 9)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 9)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 9)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 9)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 9)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 9)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 9)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 9)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 9)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 9)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 9)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 9)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 9)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 9)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 9)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 9)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 9)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 9)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 9)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 9)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 9)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 9)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 9)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 9)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 9)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 9)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 9)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 9)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 9)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(26), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(25),
         GlitchData	=> P_GlitchData(25),
         OutSignalName	=> "P(25)",
         OutTemp	=> P_zd(25),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 10)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 10)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 10)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 10)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 10)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 10)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 10)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 10)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 10)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 10)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 10)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 10)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 10)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 10)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 10)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 10)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 10)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 10)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 10)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 10)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 10)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 10)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 10)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 10)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 10)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 10)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 10)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 10)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 10)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 10)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 10)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 10)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 10)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 10)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 10)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 10)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 10)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 10)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 10)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 10)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 10)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 10)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 10)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 10)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 10)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 10)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 10)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 10)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 10)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 10)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 10)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 10)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 10)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 10)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(25), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(24),
         GlitchData	=> P_GlitchData(24),
         OutSignalName	=> "P(24)",
         OutTemp	=> P_zd(24),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 11)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 11)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 11)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 11)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 11)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 11)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 11)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 11)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 11)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 11)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 11)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 11)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 11)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 11)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 11)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 11)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 11)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 11)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 11)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 11)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 11)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 11)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 11)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 11)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 11)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 11)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 11)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 11)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 11)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 11)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 11)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 11)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 11)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 11)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 11)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 11)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 11)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 11)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 11)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 11)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 11)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 11)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 11)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 11)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 11)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 11)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 11)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 11)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 11)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 11)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 11)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 11)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 11)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 11)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(24), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(23),
         GlitchData	=> P_GlitchData(23),
         OutSignalName	=> "P(23)",
         OutTemp	=> P_zd(23),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 12)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 12)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 12)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 12)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 12)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 12)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 12)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 12)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 12)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 12)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 12)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 12)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 12)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 12)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 12)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 12)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 12)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 12)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 12)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 12)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 12)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 12)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 12)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 12)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 12)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 12)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 12)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 12)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 12)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 12)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 12)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 12)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 12)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 12)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 12)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 12)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 12)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 12)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 12)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 12)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 12)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 12)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 12)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 12)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 12)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 12)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 12)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 12)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 12)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 12)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 12)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 12)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 12)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 12)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(23), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(22),
         GlitchData	=> P_GlitchData(22),
         OutSignalName	=> "P(22)",
         OutTemp	=> P_zd(22),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 13)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 13)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 13)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 13)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 13)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 13)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 13)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 13)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 13)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 13)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 13)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 13)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 13)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 13)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 13)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 13)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 13)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 13)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 13)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 13)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 13)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 13)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 13)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 13)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 13)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 13)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 13)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 13)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 13)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 13)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 13)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 13)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 13)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 13)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 13)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 13)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 13)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 13)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 13)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 13)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 13)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 13)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 13)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 13)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 13)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 13)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 13)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 13)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 13)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 13)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 13)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 13)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 13)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 13)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(22), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(21),
         GlitchData	=> P_GlitchData(21),
         OutSignalName	=> "P(21)",
         OutTemp	=> P_zd(21),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 14)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 14)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 14)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 14)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 14)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 14)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 14)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 14)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 14)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 14)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 14)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 14)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 14)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 14)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 14)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 14)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 14)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 14)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 14)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 14)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 14)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 14)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 14)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 14)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 14)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 14)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 14)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 14)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 14)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 14)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 14)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 14)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 14)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 14)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 14)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 14)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 14)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 14)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 14)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 14)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 14)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 14)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 14)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 14)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 14)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 14)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 14)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 14)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 14)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 14)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 14)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 14)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 14)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 14)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(21), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(20),
         GlitchData	=> P_GlitchData(20),
         OutSignalName	=> "P(20)",
         OutTemp	=> P_zd(20),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 15)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 15)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 15)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 15)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 15)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 15)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 15)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 15)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 15)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 15)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 15)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 15)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 15)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 15)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 15)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 15)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 15)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 15)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 15)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 15)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 15)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 15)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 15)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 15)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 15)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 15)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 15)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 15)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 15)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 15)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 15)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 15)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 15)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 15)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 15)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 15)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 15)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 15)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 15)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 15)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 15)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 15)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 15)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 15)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 15)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 15)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 15)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 15)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 15)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 15)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 15)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 15)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 15)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 15)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(20), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(19),
         GlitchData	=> P_GlitchData(19),
         OutSignalName	=> "P(19)",
         OutTemp	=> P_zd(19),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 16)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 16)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 16)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 16)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 16)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 16)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 16)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 16)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 16)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 16)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 16)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 16)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 16)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 16)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 16)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 16)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 16)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 16)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 16)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 16)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 16)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 16)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 16)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 16)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 16)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 16)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 16)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 16)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 16)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 16)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 16)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 16)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 16)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 16)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 16)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 16)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 16)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 16)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 16)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 16)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 16)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 16)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 16)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 16)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 16)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 16)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 16)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 16)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 16)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 16)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 16)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 16)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 16)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 16)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(19), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(18),
         GlitchData	=> P_GlitchData(18),
         OutSignalName	=> "P(18)",
         OutTemp	=> P_zd(18),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 17)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 17)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 17)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 17)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 17)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 17)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 17)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 17)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 17)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 17)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 17)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 17)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 17)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 17)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 17)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 17)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 17)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 17)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 17)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 17)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 17)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 17)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 17)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 17)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 17)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 17)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 17)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 17)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 17)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 17)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 17)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 17)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 17)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 17)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 17)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 17)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 17)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 17)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 17)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 17)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 17)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 17)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 17)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 17)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 17)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 17)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 17)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 17)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 17)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 17)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 17)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 17)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 17)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 17)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(18), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(17),
         GlitchData	=> P_GlitchData(17),
         OutSignalName	=> "P(17)",
         OutTemp	=> P_zd(17),
         Paths		=> (
			0 => (A_dly(17)'last_event, tpd_A_P((647 - 18)- 36*0), true),
			1 => (A_dly(16)'last_event, tpd_A_P((647 - 18)- 36*1), true),
			2 => (A_dly(15)'last_event, tpd_A_P((647 - 18)- 36*2), true),
			3 => (A_dly(14)'last_event, tpd_A_P((647 - 18)- 36*3), true),
			4 => (A_dly(13)'last_event, tpd_A_P((647 - 18)- 36*4), true),
			5 => (A_dly(12)'last_event, tpd_A_P((647 - 18)- 36*5), true),
			6 => (A_dly(11)'last_event, tpd_A_P((647 - 18)- 36*6), true),
			7 => (A_dly(10)'last_event, tpd_A_P((647 - 18)- 36*7), true),
			8 => (A_dly(9)'last_event, tpd_A_P((647 - 18)- 36*8), true),
			9 => (A_dly(8)'last_event, tpd_A_P((647 - 18)- 36*9), true),
			10 => (A_dly(7)'last_event, tpd_A_P((647 - 18)- 36*10), true),
			11 => (A_dly(6)'last_event, tpd_A_P((647 - 18)- 36*11), true),
			12 => (A_dly(5)'last_event, tpd_A_P((647 - 18)- 36*12), true),
			13 => (A_dly(4)'last_event, tpd_A_P((647 - 18)- 36*13), true),
			14 => (A_dly(3)'last_event, tpd_A_P((647 - 18)- 36*14), true),
			15 => (A_dly(2)'last_event, tpd_A_P((647 - 18)- 36*15), true),
			16 => (A_dly(1)'last_event, tpd_A_P((647 - 18)- 36*16), true),
			17 => (A_dly(0)'last_event, tpd_A_P((647 - 18)- 36*17), true),
			18 => (B_dly(17)'last_event, tpd_B_P((647 - 18)- 36*0), true),
			19 => (B_dly(16)'last_event, tpd_B_P((647 - 18)- 36*1), true),
			20 => (B_dly(15)'last_event, tpd_B_P((647 - 18)- 36*2), true),
			21 => (B_dly(14)'last_event, tpd_B_P((647 - 18)- 36*3), true),
			22 => (B_dly(13)'last_event, tpd_B_P((647 - 18)- 36*4), true),
			23 => (B_dly(12)'last_event, tpd_B_P((647 - 18)- 36*5), true),
			24 => (B_dly(11)'last_event, tpd_B_P((647 - 18)- 36*6), true),
			25 => (B_dly(10)'last_event, tpd_B_P((647 - 18)- 36*7), true),
			26 => (B_dly(9)'last_event, tpd_B_P((647 - 18)- 36*8), true),
			27 => (B_dly(8)'last_event, tpd_B_P((647 - 18)- 36*9), true),
			28 => (B_dly(7)'last_event, tpd_B_P((647 - 18)- 36*10), true),
			29 => (B_dly(6)'last_event, tpd_B_P((647 - 18)- 36*11), true),
			30 => (B_dly(5)'last_event, tpd_B_P((647 - 18)- 36*12), true),
			31 => (B_dly(4)'last_event, tpd_B_P((647 - 18)- 36*13), true),
			32 => (B_dly(3)'last_event, tpd_B_P((647 - 18)- 36*14), true),
			33 => (B_dly(2)'last_event, tpd_B_P((647 - 18)- 36*15), true),
			34 => (B_dly(1)'last_event, tpd_B_P((647 - 18)- 36*16), true),
			35 => (B_dly(0)'last_event, tpd_B_P((647 - 18)- 36*17), true),
			36 => (BCIN_dly(17)'last_event, tpd_BCIN_P((647 - 18)- 36*0), true),
			37 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 18)- 36*1), true),
			38 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 18)- 36*2), true),
			39 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 18)- 36*3), true),
			40 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 18)- 36*4), true),
			41 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 18)- 36*5), true),
			42 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 18)- 36*6), true),
			43 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 18)- 36*7), true),
			44 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 18)- 36*8), true),
			45 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 18)- 36*9), true),
			46 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 18)- 36*10), true),
			47 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 18)- 36*11), true),
			48 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 18)- 36*12), true),
			49 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 18)- 36*13), true),
			50 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 18)- 36*14), true),
			51 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 18)- 36*15), true),
			52 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 18)- 36*16), true),
			53 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 18)- 36*17), true),
			54 => (CLK_dly'last_event, tpd_CLK_P(17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(16),
         GlitchData	=> P_GlitchData(16),
         OutSignalName	=> "P(16)",
         OutTemp	=> P_zd(16),
         Paths		=> (
			0 => (A_dly(16)'last_event, tpd_A_P((647 - 19)- 36*1), true),
			1 => (A_dly(15)'last_event, tpd_A_P((647 - 19)- 36*2), true),
			2 => (A_dly(14)'last_event, tpd_A_P((647 - 19)- 36*3), true),
			3 => (A_dly(13)'last_event, tpd_A_P((647 - 19)- 36*4), true),
			4 => (A_dly(12)'last_event, tpd_A_P((647 - 19)- 36*5), true),
			5 => (A_dly(11)'last_event, tpd_A_P((647 - 19)- 36*6), true),
			6 => (A_dly(10)'last_event, tpd_A_P((647 - 19)- 36*7), true),
			7 => (A_dly(9)'last_event, tpd_A_P((647 - 19)- 36*8), true),
			8 => (A_dly(8)'last_event, tpd_A_P((647 - 19)- 36*9), true),
			9 => (A_dly(7)'last_event, tpd_A_P((647 - 19)- 36*10), true),
			10 => (A_dly(6)'last_event, tpd_A_P((647 - 19)- 36*11), true),
			11 => (A_dly(5)'last_event, tpd_A_P((647 - 19)- 36*12), true),
			12 => (A_dly(4)'last_event, tpd_A_P((647 - 19)- 36*13), true),
			13 => (A_dly(3)'last_event, tpd_A_P((647 - 19)- 36*14), true),
			14 => (A_dly(2)'last_event, tpd_A_P((647 - 19)- 36*15), true),
			15 => (A_dly(1)'last_event, tpd_A_P((647 - 19)- 36*16), true),
			16 => (A_dly(0)'last_event, tpd_A_P((647 - 19)- 36*17), true),
			17 => (B_dly(16)'last_event, tpd_B_P((647 - 19)- 36*1), true),
			18 => (B_dly(15)'last_event, tpd_B_P((647 - 19)- 36*2), true),
			19 => (B_dly(14)'last_event, tpd_B_P((647 - 19)- 36*3), true),
			20 => (B_dly(13)'last_event, tpd_B_P((647 - 19)- 36*4), true),
			21 => (B_dly(12)'last_event, tpd_B_P((647 - 19)- 36*5), true),
			22 => (B_dly(11)'last_event, tpd_B_P((647 - 19)- 36*6), true),
			23 => (B_dly(10)'last_event, tpd_B_P((647 - 19)- 36*7), true),
			24 => (B_dly(9)'last_event, tpd_B_P((647 - 19)- 36*8), true),
			25 => (B_dly(8)'last_event, tpd_B_P((647 - 19)- 36*9), true),
			26 => (B_dly(7)'last_event, tpd_B_P((647 - 19)- 36*10), true),
			27 => (B_dly(6)'last_event, tpd_B_P((647 - 19)- 36*11), true),
			28 => (B_dly(5)'last_event, tpd_B_P((647 - 19)- 36*12), true),
			29 => (B_dly(4)'last_event, tpd_B_P((647 - 19)- 36*13), true),
			30 => (B_dly(3)'last_event, tpd_B_P((647 - 19)- 36*14), true),
			31 => (B_dly(2)'last_event, tpd_B_P((647 - 19)- 36*15), true),
			32 => (B_dly(1)'last_event, tpd_B_P((647 - 19)- 36*16), true),
			33 => (B_dly(0)'last_event, tpd_B_P((647 - 19)- 36*17), true),
			34 => (BCIN_dly(16)'last_event, tpd_BCIN_P((647 - 19)- 36*1), true),
			35 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 19)- 36*2), true),
			36 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 19)- 36*3), true),
			37 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 19)- 36*4), true),
			38 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 19)- 36*5), true),
			39 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 19)- 36*6), true),
			40 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 19)- 36*7), true),
			41 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 19)- 36*8), true),
			42 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 19)- 36*9), true),
			43 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 19)- 36*10), true),
			44 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 19)- 36*11), true),
			45 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 19)- 36*12), true),
			46 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 19)- 36*13), true),
			47 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 19)- 36*14), true),
			48 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 19)- 36*15), true),
			49 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 19)- 36*16), true),
			50 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 19)- 36*17), true),
			51 => (CLK_dly'last_event, tpd_CLK_P(16), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(15),
         GlitchData	=> P_GlitchData(15),
         OutSignalName	=> "P(15)",
         OutTemp	=> P_zd(15),
         Paths		=> (
			0 => (A_dly(15)'last_event, tpd_A_P((647 - 20)- 36*2), true),
			1 => (A_dly(14)'last_event, tpd_A_P((647 - 20)- 36*3), true),
			2 => (A_dly(13)'last_event, tpd_A_P((647 - 20)- 36*4), true),
			3 => (A_dly(12)'last_event, tpd_A_P((647 - 20)- 36*5), true),
			4 => (A_dly(11)'last_event, tpd_A_P((647 - 20)- 36*6), true),
			5 => (A_dly(10)'last_event, tpd_A_P((647 - 20)- 36*7), true),
			6 => (A_dly(9)'last_event, tpd_A_P((647 - 20)- 36*8), true),
			7 => (A_dly(8)'last_event, tpd_A_P((647 - 20)- 36*9), true),
			8 => (A_dly(7)'last_event, tpd_A_P((647 - 20)- 36*10), true),
			9 => (A_dly(6)'last_event, tpd_A_P((647 - 20)- 36*11), true),
			10 => (A_dly(5)'last_event, tpd_A_P((647 - 20)- 36*12), true),
			11 => (A_dly(4)'last_event, tpd_A_P((647 - 20)- 36*13), true),
			12 => (A_dly(3)'last_event, tpd_A_P((647 - 20)- 36*14), true),
			13 => (A_dly(2)'last_event, tpd_A_P((647 - 20)- 36*15), true),
			14 => (A_dly(1)'last_event, tpd_A_P((647 - 20)- 36*16), true),
			15 => (A_dly(0)'last_event, tpd_A_P((647 - 20)- 36*17), true),
			16 => (B_dly(15)'last_event, tpd_B_P((647 - 20)- 36*2), true),
			17 => (B_dly(14)'last_event, tpd_B_P((647 - 20)- 36*3), true),
			18 => (B_dly(13)'last_event, tpd_B_P((647 - 20)- 36*4), true),
			19 => (B_dly(12)'last_event, tpd_B_P((647 - 20)- 36*5), true),
			20 => (B_dly(11)'last_event, tpd_B_P((647 - 20)- 36*6), true),
			21 => (B_dly(10)'last_event, tpd_B_P((647 - 20)- 36*7), true),
			22 => (B_dly(9)'last_event, tpd_B_P((647 - 20)- 36*8), true),
			23 => (B_dly(8)'last_event, tpd_B_P((647 - 20)- 36*9), true),
			24 => (B_dly(7)'last_event, tpd_B_P((647 - 20)- 36*10), true),
			25 => (B_dly(6)'last_event, tpd_B_P((647 - 20)- 36*11), true),
			26 => (B_dly(5)'last_event, tpd_B_P((647 - 20)- 36*12), true),
			27 => (B_dly(4)'last_event, tpd_B_P((647 - 20)- 36*13), true),
			28 => (B_dly(3)'last_event, tpd_B_P((647 - 20)- 36*14), true),
			29 => (B_dly(2)'last_event, tpd_B_P((647 - 20)- 36*15), true),
			30 => (B_dly(1)'last_event, tpd_B_P((647 - 20)- 36*16), true),
			31 => (B_dly(0)'last_event, tpd_B_P((647 - 20)- 36*17), true),
			32 => (BCIN_dly(15)'last_event, tpd_BCIN_P((647 - 20)- 36*2), true),
			33 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 20)- 36*3), true),
			34 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 20)- 36*4), true),
			35 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 20)- 36*5), true),
			36 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 20)- 36*6), true),
			37 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 20)- 36*7), true),
			38 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 20)- 36*8), true),
			39 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 20)- 36*9), true),
			40 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 20)- 36*10), true),
			41 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 20)- 36*11), true),
			42 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 20)- 36*12), true),
			43 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 20)- 36*13), true),
			44 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 20)- 36*14), true),
			45 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 20)- 36*15), true),
			46 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 20)- 36*16), true),
			47 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 20)- 36*17), true),
			48 => (CLK_dly'last_event, tpd_CLK_P(15), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(14),
         GlitchData	=> P_GlitchData(14),
         OutSignalName	=> "P(14)",
         OutTemp	=> P_zd(14),
         Paths		=> (
			0 => (A_dly(14)'last_event, tpd_A_P((647 - 21)- 36*3), true),
			1 => (A_dly(13)'last_event, tpd_A_P((647 - 21)- 36*4), true),
			2 => (A_dly(12)'last_event, tpd_A_P((647 - 21)- 36*5), true),
			3 => (A_dly(11)'last_event, tpd_A_P((647 - 21)- 36*6), true),
			4 => (A_dly(10)'last_event, tpd_A_P((647 - 21)- 36*7), true),
			5 => (A_dly(9)'last_event, tpd_A_P((647 - 21)- 36*8), true),
			6 => (A_dly(8)'last_event, tpd_A_P((647 - 21)- 36*9), true),
			7 => (A_dly(7)'last_event, tpd_A_P((647 - 21)- 36*10), true),
			8 => (A_dly(6)'last_event, tpd_A_P((647 - 21)- 36*11), true),
			9 => (A_dly(5)'last_event, tpd_A_P((647 - 21)- 36*12), true),
			10 => (A_dly(4)'last_event, tpd_A_P((647 - 21)- 36*13), true),
			11 => (A_dly(3)'last_event, tpd_A_P((647 - 21)- 36*14), true),
			12 => (A_dly(2)'last_event, tpd_A_P((647 - 21)- 36*15), true),
			13 => (A_dly(1)'last_event, tpd_A_P((647 - 21)- 36*16), true),
			14 => (A_dly(0)'last_event, tpd_A_P((647 - 21)- 36*17), true),
			15 => (B_dly(14)'last_event, tpd_B_P((647 - 21)- 36*3), true),
			16 => (B_dly(13)'last_event, tpd_B_P((647 - 21)- 36*4), true),
			17 => (B_dly(12)'last_event, tpd_B_P((647 - 21)- 36*5), true),
			18 => (B_dly(11)'last_event, tpd_B_P((647 - 21)- 36*6), true),
			19 => (B_dly(10)'last_event, tpd_B_P((647 - 21)- 36*7), true),
			20 => (B_dly(9)'last_event, tpd_B_P((647 - 21)- 36*8), true),
			21 => (B_dly(8)'last_event, tpd_B_P((647 - 21)- 36*9), true),
			22 => (B_dly(7)'last_event, tpd_B_P((647 - 21)- 36*10), true),
			23 => (B_dly(6)'last_event, tpd_B_P((647 - 21)- 36*11), true),
			24 => (B_dly(5)'last_event, tpd_B_P((647 - 21)- 36*12), true),
			25 => (B_dly(4)'last_event, tpd_B_P((647 - 21)- 36*13), true),
			26 => (B_dly(3)'last_event, tpd_B_P((647 - 21)- 36*14), true),
			27 => (B_dly(2)'last_event, tpd_B_P((647 - 21)- 36*15), true),
			28 => (B_dly(1)'last_event, tpd_B_P((647 - 21)- 36*16), true),
			29 => (B_dly(0)'last_event, tpd_B_P((647 - 21)- 36*17), true),
			30 => (BCIN_dly(14)'last_event, tpd_BCIN_P((647 - 21)- 36*3), true),
			31 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 21)- 36*4), true),
			32 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 21)- 36*5), true),
			33 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 21)- 36*6), true),
			34 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 21)- 36*7), true),
			35 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 21)- 36*8), true),
			36 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 21)- 36*9), true),
			37 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 21)- 36*10), true),
			38 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 21)- 36*11), true),
			39 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 21)- 36*12), true),
			40 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 21)- 36*13), true),
			41 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 21)- 36*14), true),
			42 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 21)- 36*15), true),
			43 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 21)- 36*16), true),
			44 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 21)- 36*17), true),
			45 => (CLK_dly'last_event, tpd_CLK_P(14), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(13),
         GlitchData	=> P_GlitchData(13),
         OutSignalName	=> "P(13)",
         OutTemp	=> P_zd(13),
         Paths		=> (
			0 => (A_dly(13)'last_event, tpd_A_P((647 - 22)- 36*4), true),
			1 => (A_dly(12)'last_event, tpd_A_P((647 - 22)- 36*5), true),
			2 => (A_dly(11)'last_event, tpd_A_P((647 - 22)- 36*6), true),
			3 => (A_dly(10)'last_event, tpd_A_P((647 - 22)- 36*7), true),
			4 => (A_dly(9)'last_event, tpd_A_P((647 - 22)- 36*8), true),
			5 => (A_dly(8)'last_event, tpd_A_P((647 - 22)- 36*9), true),
			6 => (A_dly(7)'last_event, tpd_A_P((647 - 22)- 36*10), true),
			7 => (A_dly(6)'last_event, tpd_A_P((647 - 22)- 36*11), true),
			8 => (A_dly(5)'last_event, tpd_A_P((647 - 22)- 36*12), true),
			9 => (A_dly(4)'last_event, tpd_A_P((647 - 22)- 36*13), true),
			10 => (A_dly(3)'last_event, tpd_A_P((647 - 22)- 36*14), true),
			11 => (A_dly(2)'last_event, tpd_A_P((647 - 22)- 36*15), true),
			12 => (A_dly(1)'last_event, tpd_A_P((647 - 22)- 36*16), true),
			13 => (A_dly(0)'last_event, tpd_A_P((647 - 22)- 36*17), true),
			14 => (B_dly(13)'last_event, tpd_B_P((647 - 22)- 36*4), true),
			15 => (B_dly(12)'last_event, tpd_B_P((647 - 22)- 36*5), true),
			16 => (B_dly(11)'last_event, tpd_B_P((647 - 22)- 36*6), true),
			17 => (B_dly(10)'last_event, tpd_B_P((647 - 22)- 36*7), true),
			18 => (B_dly(9)'last_event, tpd_B_P((647 - 22)- 36*8), true),
			19 => (B_dly(8)'last_event, tpd_B_P((647 - 22)- 36*9), true),
			20 => (B_dly(7)'last_event, tpd_B_P((647 - 22)- 36*10), true),
			21 => (B_dly(6)'last_event, tpd_B_P((647 - 22)- 36*11), true),
			22 => (B_dly(5)'last_event, tpd_B_P((647 - 22)- 36*12), true),
			23 => (B_dly(4)'last_event, tpd_B_P((647 - 22)- 36*13), true),
			24 => (B_dly(3)'last_event, tpd_B_P((647 - 22)- 36*14), true),
			25 => (B_dly(2)'last_event, tpd_B_P((647 - 22)- 36*15), true),
			26 => (B_dly(1)'last_event, tpd_B_P((647 - 22)- 36*16), true),
			27 => (B_dly(0)'last_event, tpd_B_P((647 - 22)- 36*17), true),
			28 => (BCIN_dly(13)'last_event, tpd_BCIN_P((647 - 22)- 36*4), true),
			29 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 22)- 36*5), true),
			30 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 22)- 36*6), true),
			31 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 22)- 36*7), true),
			32 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 22)- 36*8), true),
			33 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 22)- 36*9), true),
			34 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 22)- 36*10), true),
			35 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 22)- 36*11), true),
			36 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 22)- 36*12), true),
			37 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 22)- 36*13), true),
			38 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 22)- 36*14), true),
			39 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 22)- 36*15), true),
			40 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 22)- 36*16), true),
			41 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 22)- 36*17), true),
			42 => (CLK_dly'last_event, tpd_CLK_P(13), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(12),
         GlitchData	=> P_GlitchData(12),
         OutSignalName	=> "P(12)",
         OutTemp	=> P_zd(12),
         Paths		=> (
			0 => (A_dly(12)'last_event, tpd_A_P((647 - 23)- 36*5), true),
			1 => (A_dly(11)'last_event, tpd_A_P((647 - 23)- 36*6), true),
			2 => (A_dly(10)'last_event, tpd_A_P((647 - 23)- 36*7), true),
			3 => (A_dly(9)'last_event, tpd_A_P((647 - 23)- 36*8), true),
			4 => (A_dly(8)'last_event, tpd_A_P((647 - 23)- 36*9), true),
			5 => (A_dly(7)'last_event, tpd_A_P((647 - 23)- 36*10), true),
			6 => (A_dly(6)'last_event, tpd_A_P((647 - 23)- 36*11), true),
			7 => (A_dly(5)'last_event, tpd_A_P((647 - 23)- 36*12), true),
			8 => (A_dly(4)'last_event, tpd_A_P((647 - 23)- 36*13), true),
			9 => (A_dly(3)'last_event, tpd_A_P((647 - 23)- 36*14), true),
			10 => (A_dly(2)'last_event, tpd_A_P((647 - 23)- 36*15), true),
			11 => (A_dly(1)'last_event, tpd_A_P((647 - 23)- 36*16), true),
			12 => (A_dly(0)'last_event, tpd_A_P((647 - 23)- 36*17), true),
			13 => (B_dly(12)'last_event, tpd_B_P((647 - 23)- 36*5), true),
			14 => (B_dly(11)'last_event, tpd_B_P((647 - 23)- 36*6), true),
			15 => (B_dly(10)'last_event, tpd_B_P((647 - 23)- 36*7), true),
			16 => (B_dly(9)'last_event, tpd_B_P((647 - 23)- 36*8), true),
			17 => (B_dly(8)'last_event, tpd_B_P((647 - 23)- 36*9), true),
			18 => (B_dly(7)'last_event, tpd_B_P((647 - 23)- 36*10), true),
			19 => (B_dly(6)'last_event, tpd_B_P((647 - 23)- 36*11), true),
			20 => (B_dly(5)'last_event, tpd_B_P((647 - 23)- 36*12), true),
			21 => (B_dly(4)'last_event, tpd_B_P((647 - 23)- 36*13), true),
			22 => (B_dly(3)'last_event, tpd_B_P((647 - 23)- 36*14), true),
			23 => (B_dly(2)'last_event, tpd_B_P((647 - 23)- 36*15), true),
			24 => (B_dly(1)'last_event, tpd_B_P((647 - 23)- 36*16), true),
			25 => (B_dly(0)'last_event, tpd_B_P((647 - 23)- 36*17), true),
			26 => (BCIN_dly(12)'last_event, tpd_BCIN_P((647 - 23)- 36*5), true),
			27 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 23)- 36*6), true),
			28 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 23)- 36*7), true),
			29 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 23)- 36*8), true),
			30 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 23)- 36*9), true),
			31 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 23)- 36*10), true),
			32 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 23)- 36*11), true),
			33 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 23)- 36*12), true),
			34 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 23)- 36*13), true),
			35 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 23)- 36*14), true),
			36 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 23)- 36*15), true),
			37 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 23)- 36*16), true),
			38 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 23)- 36*17), true),
			39 => (CLK_dly'last_event, tpd_CLK_P(12), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(11),
         GlitchData	=> P_GlitchData(11),
         OutSignalName	=> "P(11)",
         OutTemp	=> P_zd(11),
         Paths		=> (
			0 => (A_dly(11)'last_event, tpd_A_P((647 - 24)- 36*6), true),
			1 => (A_dly(10)'last_event, tpd_A_P((647 - 24)- 36*7), true),
			2 => (A_dly(9)'last_event, tpd_A_P((647 - 24)- 36*8), true),
			3 => (A_dly(8)'last_event, tpd_A_P((647 - 24)- 36*9), true),
			4 => (A_dly(7)'last_event, tpd_A_P((647 - 24)- 36*10), true),
			5 => (A_dly(6)'last_event, tpd_A_P((647 - 24)- 36*11), true),
			6 => (A_dly(5)'last_event, tpd_A_P((647 - 24)- 36*12), true),
			7 => (A_dly(4)'last_event, tpd_A_P((647 - 24)- 36*13), true),
			8 => (A_dly(3)'last_event, tpd_A_P((647 - 24)- 36*14), true),
			9 => (A_dly(2)'last_event, tpd_A_P((647 - 24)- 36*15), true),
			10 => (A_dly(1)'last_event, tpd_A_P((647 - 24)- 36*16), true),
			11 => (A_dly(0)'last_event, tpd_A_P((647 - 24)- 36*17), true),
			12 => (B_dly(11)'last_event, tpd_B_P((647 - 24)- 36*6), true),
			13 => (B_dly(10)'last_event, tpd_B_P((647 - 24)- 36*7), true),
			14 => (B_dly(9)'last_event, tpd_B_P((647 - 24)- 36*8), true),
			15 => (B_dly(8)'last_event, tpd_B_P((647 - 24)- 36*9), true),
			16 => (B_dly(7)'last_event, tpd_B_P((647 - 24)- 36*10), true),
			17 => (B_dly(6)'last_event, tpd_B_P((647 - 24)- 36*11), true),
			18 => (B_dly(5)'last_event, tpd_B_P((647 - 24)- 36*12), true),
			19 => (B_dly(4)'last_event, tpd_B_P((647 - 24)- 36*13), true),
			20 => (B_dly(3)'last_event, tpd_B_P((647 - 24)- 36*14), true),
			21 => (B_dly(2)'last_event, tpd_B_P((647 - 24)- 36*15), true),
			22 => (B_dly(1)'last_event, tpd_B_P((647 - 24)- 36*16), true),
			23 => (B_dly(0)'last_event, tpd_B_P((647 - 24)- 36*17), true),
			24 => (BCIN_dly(11)'last_event, tpd_BCIN_P((647 - 24)- 36*6), true),
			25 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 24)- 36*7), true),
			26 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 24)- 36*8), true),
			27 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 24)- 36*9), true),
			28 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 24)- 36*10), true),
			29 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 24)- 36*11), true),
			30 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 24)- 36*12), true),
			31 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 24)- 36*13), true),
			32 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 24)- 36*14), true),
			33 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 24)- 36*15), true),
			34 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 24)- 36*16), true),
			35 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 24)- 36*17), true),
			36 => (CLK_dly'last_event, tpd_CLK_P(11), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(10),
         GlitchData	=> P_GlitchData(10),
         OutSignalName	=> "P(10)",
         OutTemp	=> P_zd(10),
         Paths		=> (
			0 => (A_dly(10)'last_event, tpd_A_P((647 - 25)- 36*7), true),
			1 => (A_dly(9)'last_event, tpd_A_P((647 - 25)- 36*8), true),
			2 => (A_dly(8)'last_event, tpd_A_P((647 - 25)- 36*9), true),
			3 => (A_dly(7)'last_event, tpd_A_P((647 - 25)- 36*10), true),
			4 => (A_dly(6)'last_event, tpd_A_P((647 - 25)- 36*11), true),
			5 => (A_dly(5)'last_event, tpd_A_P((647 - 25)- 36*12), true),
			6 => (A_dly(4)'last_event, tpd_A_P((647 - 25)- 36*13), true),
			7 => (A_dly(3)'last_event, tpd_A_P((647 - 25)- 36*14), true),
			8 => (A_dly(2)'last_event, tpd_A_P((647 - 25)- 36*15), true),
			9 => (A_dly(1)'last_event, tpd_A_P((647 - 25)- 36*16), true),
			10 => (A_dly(0)'last_event, tpd_A_P((647 - 25)- 36*17), true),
			11 => (B_dly(10)'last_event, tpd_B_P((647 - 25)- 36*7), true),
			12 => (B_dly(9)'last_event, tpd_B_P((647 - 25)- 36*8), true),
			13 => (B_dly(8)'last_event, tpd_B_P((647 - 25)- 36*9), true),
			14 => (B_dly(7)'last_event, tpd_B_P((647 - 25)- 36*10), true),
			15 => (B_dly(6)'last_event, tpd_B_P((647 - 25)- 36*11), true),
			16 => (B_dly(5)'last_event, tpd_B_P((647 - 25)- 36*12), true),
			17 => (B_dly(4)'last_event, tpd_B_P((647 - 25)- 36*13), true),
			18 => (B_dly(3)'last_event, tpd_B_P((647 - 25)- 36*14), true),
			19 => (B_dly(2)'last_event, tpd_B_P((647 - 25)- 36*15), true),
			20 => (B_dly(1)'last_event, tpd_B_P((647 - 25)- 36*16), true),
			21 => (B_dly(0)'last_event, tpd_B_P((647 - 25)- 36*17), true),
			22 => (BCIN_dly(10)'last_event, tpd_BCIN_P((647 - 25)- 36*7), true),
			23 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 25)- 36*8), true),
			24 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 25)- 36*9), true),
			25 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 25)- 36*10), true),
			26 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 25)- 36*11), true),
			27 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 25)- 36*12), true),
			28 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 25)- 36*13), true),
			29 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 25)- 36*14), true),
			30 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 25)- 36*15), true),
			31 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 25)- 36*16), true),
			32 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 25)- 36*17), true),
			33 => (CLK_dly'last_event, tpd_CLK_P(10), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(9),
         GlitchData	=> P_GlitchData(9),
         OutSignalName	=> "P(9)",
         OutTemp	=> P_zd(9),
         Paths		=> (
			0 => (A_dly(9)'last_event, tpd_A_P((647 - 26)- 36*8), true),
			1 => (A_dly(8)'last_event, tpd_A_P((647 - 26)- 36*9), true),
			2 => (A_dly(7)'last_event, tpd_A_P((647 - 26)- 36*10), true),
			3 => (A_dly(6)'last_event, tpd_A_P((647 - 26)- 36*11), true),
			4 => (A_dly(5)'last_event, tpd_A_P((647 - 26)- 36*12), true),
			5 => (A_dly(4)'last_event, tpd_A_P((647 - 26)- 36*13), true),
			6 => (A_dly(3)'last_event, tpd_A_P((647 - 26)- 36*14), true),
			7 => (A_dly(2)'last_event, tpd_A_P((647 - 26)- 36*15), true),
			8 => (A_dly(1)'last_event, tpd_A_P((647 - 26)- 36*16), true),
			9 => (A_dly(0)'last_event, tpd_A_P((647 - 26)- 36*17), true),
			10 => (B_dly(9)'last_event, tpd_B_P((647 - 26)- 36*8), true),
			11 => (B_dly(8)'last_event, tpd_B_P((647 - 26)- 36*9), true),
			12 => (B_dly(7)'last_event, tpd_B_P((647 - 26)- 36*10), true),
			13 => (B_dly(6)'last_event, tpd_B_P((647 - 26)- 36*11), true),
			14 => (B_dly(5)'last_event, tpd_B_P((647 - 26)- 36*12), true),
			15 => (B_dly(4)'last_event, tpd_B_P((647 - 26)- 36*13), true),
			16 => (B_dly(3)'last_event, tpd_B_P((647 - 26)- 36*14), true),
			17 => (B_dly(2)'last_event, tpd_B_P((647 - 26)- 36*15), true),
			18 => (B_dly(1)'last_event, tpd_B_P((647 - 26)- 36*16), true),
			19 => (B_dly(0)'last_event, tpd_B_P((647 - 26)- 36*17), true),
			20 => (BCIN_dly(9)'last_event, tpd_BCIN_P((647 - 26)- 36*8), true),
			21 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 26)- 36*9), true),
			22 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 26)- 36*10), true),
			23 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 26)- 36*11), true),
			24 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 26)- 36*12), true),
			25 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 26)- 36*13), true),
			26 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 26)- 36*14), true),
			27 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 26)- 36*15), true),
			28 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 26)- 36*16), true),
			29 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 26)- 36*17), true),
			30 => (CLK_dly'last_event, tpd_CLK_P(9), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(8),
         GlitchData	=> P_GlitchData(8),
         OutSignalName	=> "P(8)",
         OutTemp	=> P_zd(8),
         Paths		=> (
			0 => (A_dly(8)'last_event, tpd_A_P((647 - 27)- 36*9), true),
			1 => (A_dly(7)'last_event, tpd_A_P((647 - 27)- 36*10), true),
			2 => (A_dly(6)'last_event, tpd_A_P((647 - 27)- 36*11), true),
			3 => (A_dly(5)'last_event, tpd_A_P((647 - 27)- 36*12), true),
			4 => (A_dly(4)'last_event, tpd_A_P((647 - 27)- 36*13), true),
			5 => (A_dly(3)'last_event, tpd_A_P((647 - 27)- 36*14), true),
			6 => (A_dly(2)'last_event, tpd_A_P((647 - 27)- 36*15), true),
			7 => (A_dly(1)'last_event, tpd_A_P((647 - 27)- 36*16), true),
			8 => (A_dly(0)'last_event, tpd_A_P((647 - 27)- 36*17), true),
			9 => (B_dly(8)'last_event, tpd_B_P((647 - 27)- 36*9), true),
			10 => (B_dly(7)'last_event, tpd_B_P((647 - 27)- 36*10), true),
			11 => (B_dly(6)'last_event, tpd_B_P((647 - 27)- 36*11), true),
			12 => (B_dly(5)'last_event, tpd_B_P((647 - 27)- 36*12), true),
			13 => (B_dly(4)'last_event, tpd_B_P((647 - 27)- 36*13), true),
			14 => (B_dly(3)'last_event, tpd_B_P((647 - 27)- 36*14), true),
			15 => (B_dly(2)'last_event, tpd_B_P((647 - 27)- 36*15), true),
			16 => (B_dly(1)'last_event, tpd_B_P((647 - 27)- 36*16), true),
			17 => (B_dly(0)'last_event, tpd_B_P((647 - 27)- 36*17), true),
			18 => (BCIN_dly(8)'last_event, tpd_BCIN_P((647 - 27)- 36*9), true),
			19 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 27)- 36*10), true),
			20 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 27)- 36*11), true),
			21 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 27)- 36*12), true),
			22 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 27)- 36*13), true),
			23 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 27)- 36*14), true),
			24 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 27)- 36*15), true),
			25 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 27)- 36*16), true),
			26 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 27)- 36*17), true),
			27 => (CLK_dly'last_event, tpd_CLK_P(8), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(7),
         GlitchData	=> P_GlitchData(7),
         OutSignalName	=> "P(7)",
         OutTemp	=> P_zd(7),
         Paths		=> (
			0 => (A_dly(7)'last_event, tpd_A_P((647 - 28)- 36*10), true),
			1 => (A_dly(6)'last_event, tpd_A_P((647 - 28)- 36*11), true),
			2 => (A_dly(5)'last_event, tpd_A_P((647 - 28)- 36*12), true),
			3 => (A_dly(4)'last_event, tpd_A_P((647 - 28)- 36*13), true),
			4 => (A_dly(3)'last_event, tpd_A_P((647 - 28)- 36*14), true),
			5 => (A_dly(2)'last_event, tpd_A_P((647 - 28)- 36*15), true),
			6 => (A_dly(1)'last_event, tpd_A_P((647 - 28)- 36*16), true),
			7 => (A_dly(0)'last_event, tpd_A_P((647 - 28)- 36*17), true),
			8 => (B_dly(7)'last_event, tpd_B_P((647 - 28)- 36*10), true),
			9 => (B_dly(6)'last_event, tpd_B_P((647 - 28)- 36*11), true),
			10 => (B_dly(5)'last_event, tpd_B_P((647 - 28)- 36*12), true),
			11 => (B_dly(4)'last_event, tpd_B_P((647 - 28)- 36*13), true),
			12 => (B_dly(3)'last_event, tpd_B_P((647 - 28)- 36*14), true),
			13 => (B_dly(2)'last_event, tpd_B_P((647 - 28)- 36*15), true),
			14 => (B_dly(1)'last_event, tpd_B_P((647 - 28)- 36*16), true),
			15 => (B_dly(0)'last_event, tpd_B_P((647 - 28)- 36*17), true),
			16 => (BCIN_dly(7)'last_event, tpd_BCIN_P((647 - 28)- 36*10), true),
			17 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 28)- 36*11), true),
			18 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 28)- 36*12), true),
			19 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 28)- 36*13), true),
			20 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 28)- 36*14), true),
			21 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 28)- 36*15), true),
			22 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 28)- 36*16), true),
			23 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 28)- 36*17), true),
			24 => (CLK_dly'last_event, tpd_CLK_P(7), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(6),
         GlitchData	=> P_GlitchData(6),
         OutSignalName	=> "P(6)",
         OutTemp	=> P_zd(6),
         Paths		=> (
			0 => (A_dly(6)'last_event, tpd_A_P((647 - 29)- 36*11), true),
			1 => (A_dly(5)'last_event, tpd_A_P((647 - 29)- 36*12), true),
			2 => (A_dly(4)'last_event, tpd_A_P((647 - 29)- 36*13), true),
			3 => (A_dly(3)'last_event, tpd_A_P((647 - 29)- 36*14), true),
			4 => (A_dly(2)'last_event, tpd_A_P((647 - 29)- 36*15), true),
			5 => (A_dly(1)'last_event, tpd_A_P((647 - 29)- 36*16), true),
			6 => (A_dly(0)'last_event, tpd_A_P((647 - 29)- 36*17), true),
			7 => (B_dly(6)'last_event, tpd_B_P((647 - 29)- 36*11), true),
			8 => (B_dly(5)'last_event, tpd_B_P((647 - 29)- 36*12), true),
			9 => (B_dly(4)'last_event, tpd_B_P((647 - 29)- 36*13), true),
			10 => (B_dly(3)'last_event, tpd_B_P((647 - 29)- 36*14), true),
			11 => (B_dly(2)'last_event, tpd_B_P((647 - 29)- 36*15), true),
			12 => (B_dly(1)'last_event, tpd_B_P((647 - 29)- 36*16), true),
			13 => (B_dly(0)'last_event, tpd_B_P((647 - 29)- 36*17), true),
			14 => (BCIN_dly(6)'last_event, tpd_BCIN_P((647 - 29)- 36*11), true),
			15 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 29)- 36*12), true),
			16 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 29)- 36*13), true),
			17 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 29)- 36*14), true),
			18 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 29)- 36*15), true),
			19 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 29)- 36*16), true),
			20 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 29)- 36*17), true),
			21 => (CLK_dly'last_event, tpd_CLK_P(6), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(5),
         GlitchData	=> P_GlitchData(5),
         OutSignalName	=> "P(5)",
         OutTemp	=> P_zd(5),
         Paths		=> (
			0 => (A_dly(5)'last_event, tpd_A_P((647 - 30)- 36*12), true),
			1 => (A_dly(4)'last_event, tpd_A_P((647 - 30)- 36*13), true),
			2 => (A_dly(3)'last_event, tpd_A_P((647 - 30)- 36*14), true),
			3 => (A_dly(2)'last_event, tpd_A_P((647 - 30)- 36*15), true),
			4 => (A_dly(1)'last_event, tpd_A_P((647 - 30)- 36*16), true),
			5 => (A_dly(0)'last_event, tpd_A_P((647 - 30)- 36*17), true),
			6 => (B_dly(5)'last_event, tpd_B_P((647 - 30)- 36*12), true),
			7 => (B_dly(4)'last_event, tpd_B_P((647 - 30)- 36*13), true),
			8 => (B_dly(3)'last_event, tpd_B_P((647 - 30)- 36*14), true),
			9 => (B_dly(2)'last_event, tpd_B_P((647 - 30)- 36*15), true),
			10 => (B_dly(1)'last_event, tpd_B_P((647 - 30)- 36*16), true),
			11 => (B_dly(0)'last_event, tpd_B_P((647 - 30)- 36*17), true),
			12 => (BCIN_dly(5)'last_event, tpd_BCIN_P((647 - 30)- 36*12), true),
			13 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 30)- 36*13), true),
			14 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 30)- 36*14), true),
			15 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 30)- 36*15), true),
			16 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 30)- 36*16), true),
			17 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 30)- 36*17), true),
			18 => (CLK_dly'last_event, tpd_CLK_P(5), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(4),
         GlitchData	=> P_GlitchData(4),
         OutSignalName	=> "P(4)",
         OutTemp	=> P_zd(4),
         Paths		=> (
			0 => (A_dly(4)'last_event, tpd_A_P((647 - 31)- 36*13), true),
			1 => (A_dly(3)'last_event, tpd_A_P((647 - 31)- 36*14), true),
			2 => (A_dly(2)'last_event, tpd_A_P((647 - 31)- 36*15), true),
			3 => (A_dly(1)'last_event, tpd_A_P((647 - 31)- 36*16), true),
			4 => (A_dly(0)'last_event, tpd_A_P((647 - 31)- 36*17), true),
			5 => (B_dly(4)'last_event, tpd_B_P((647 - 31)- 36*13), true),
			6 => (B_dly(3)'last_event, tpd_B_P((647 - 31)- 36*14), true),
			7 => (B_dly(2)'last_event, tpd_B_P((647 - 31)- 36*15), true),
			8 => (B_dly(1)'last_event, tpd_B_P((647 - 31)- 36*16), true),
			9 => (B_dly(0)'last_event, tpd_B_P((647 - 31)- 36*17), true),
			10 => (BCIN_dly(4)'last_event, tpd_BCIN_P((647 - 31)- 36*13), true),
			11 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 31)- 36*14), true),
			12 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 31)- 36*15), true),
			13 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 31)- 36*16), true),
			14 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 31)- 36*17), true),
			15 => (CLK_dly'last_event, tpd_CLK_P(4), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(3),
         GlitchData	=> P_GlitchData(3),
         OutSignalName	=> "P(3)",
         OutTemp	=> P_zd(3),
         Paths		=> (
			0 => (A_dly(3)'last_event, tpd_A_P((647 - 32)- 36*14), true),
			1 => (A_dly(2)'last_event, tpd_A_P((647 - 32)- 36*15), true),
			2 => (A_dly(1)'last_event, tpd_A_P((647 - 32)- 36*16), true),
			3 => (A_dly(0)'last_event, tpd_A_P((647 - 32)- 36*17), true),
			4 => (B_dly(3)'last_event, tpd_B_P((647 - 32)- 36*14), true),
			5 => (B_dly(2)'last_event, tpd_B_P((647 - 32)- 36*15), true),
			6 => (B_dly(1)'last_event, tpd_B_P((647 - 32)- 36*16), true),
			7 => (B_dly(0)'last_event, tpd_B_P((647 - 32)- 36*17), true),
			8 => (BCIN_dly(3)'last_event, tpd_BCIN_P((647 - 32)- 36*14), true),
			9 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 32)- 36*15), true),
			10 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 32)- 36*16), true),
			11 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 32)- 36*17), true),
			12 => (CLK_dly'last_event, tpd_CLK_P(3), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(2),
         GlitchData	=> P_GlitchData(2),
         OutSignalName	=> "P(2)",
         OutTemp	=> P_zd(2),
         Paths		=> (
			0 => (A_dly(2)'last_event, tpd_A_P((647 - 33)- 36*15), true),
			1 => (A_dly(1)'last_event, tpd_A_P((647 - 33)- 36*16), true),
			2 => (A_dly(0)'last_event, tpd_A_P((647 - 33)- 36*17), true),
			3 => (B_dly(2)'last_event, tpd_B_P((647 - 33)- 36*15), true),
			4 => (B_dly(1)'last_event, tpd_B_P((647 - 33)- 36*16), true),
			5 => (B_dly(0)'last_event, tpd_B_P((647 - 33)- 36*17), true),
			6 => (BCIN_dly(2)'last_event, tpd_BCIN_P((647 - 33)- 36*15), true),
			7 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 33)- 36*16), true),
			8 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 33)- 36*17), true),
			9 => (CLK_dly'last_event, tpd_CLK_P(2), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(1),
         GlitchData	=> P_GlitchData(1),
         OutSignalName	=> "P(1)",
         OutTemp	=> P_zd(1),
         Paths		=> (
			0 => (A_dly(1)'last_event, tpd_A_P((647 - 34)- 36*16), true),
			1 => (A_dly(0)'last_event, tpd_A_P((647 - 34)- 36*17), true),
			2 => (B_dly(1)'last_event, tpd_B_P((647 - 34)- 36*16), true),
			3 => (B_dly(0)'last_event, tpd_B_P((647 - 34)- 36*17), true),
			4 => (BCIN_dly(1)'last_event, tpd_BCIN_P((647 - 34)- 36*16), true),
			5 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 34)- 36*17), true),
			6 => (CLK_dly'last_event, tpd_CLK_P(1), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> P(0),
         GlitchData	=> P_GlitchData(0),
         OutSignalName	=> "P(0)",
         OutTemp	=> P_zd(0),
         Paths		=> (
			0 => (A_dly(0)'last_event, tpd_A_P((647 - 35)- 36*17), true),
			1 => (B_dly(0)'last_event, tpd_B_P((647 - 35)- 36*17), true),
			2 => (BCIN_dly(0)'last_event, tpd_BCIN_P((647 - 35)- 36*17), true),
			3 => (CLK_dly'last_event, tpd_CLK_P(0), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(17),
         GlitchData	=> BCOUT_GlitchData(17),
         OutSignalName	=> "BCOUT(17)",
         OutTemp	=> BCOUT_zd(17),
         Paths		=> (
			0 => (B_dly(17)'last_event, tpd_B_BCOUT((323 - 0)- 18*0), true),
			1 => (BCIN_dly(17)'last_event, tpd_BCIN_BCOUT((323 - 0)- 18*0), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(17), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(16),
         GlitchData	=> BCOUT_GlitchData(16),
         OutSignalName	=> "BCOUT(16)",
         OutTemp	=> BCOUT_zd(16),
         Paths		=> (
			0 => (B_dly(16)'last_event, tpd_B_BCOUT((323 - 1)- 18*1), true),
			1 => (BCIN_dly(16)'last_event, tpd_BCIN_BCOUT((323 - 1)- 18*1), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(16), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(15),
         GlitchData	=> BCOUT_GlitchData(15),
         OutSignalName	=> "BCOUT(15)",
         OutTemp	=> BCOUT_zd(15),
         Paths		=> (
			0 => (B_dly(15)'last_event, tpd_B_BCOUT((323 - 2)- 18*2), true),
			1 => (BCIN_dly(15)'last_event, tpd_BCIN_BCOUT((323 - 2)- 18*2), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(15), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(14),
         GlitchData	=> BCOUT_GlitchData(14),
         OutSignalName	=> "BCOUT(14)",
         OutTemp	=> BCOUT_zd(14),
         Paths		=> (
			0 => (B_dly(14)'last_event, tpd_B_BCOUT((323 - 3)- 18*3), true),
			1 => (BCIN_dly(14)'last_event, tpd_BCIN_BCOUT((323 - 3)- 18*3), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(14), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(13),
         GlitchData	=> BCOUT_GlitchData(13),
         OutSignalName	=> "BCOUT(13)",
         OutTemp	=> BCOUT_zd(13),
         Paths		=> (
			0 => (B_dly(13)'last_event, tpd_B_BCOUT((323 - 4)- 18*4), true),
			1 => (BCIN_dly(13)'last_event, tpd_BCIN_BCOUT((323 - 4)- 18*4), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(13), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(12),
         GlitchData	=> BCOUT_GlitchData(12),
         OutSignalName	=> "BCOUT(12)",
         OutTemp	=> BCOUT_zd(12),
         Paths		=> (
			0 => (B_dly(12)'last_event, tpd_B_BCOUT((323 - 5)- 18*5), true),
			1 => (BCIN_dly(12)'last_event, tpd_BCIN_BCOUT((323 - 5)- 18*5), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(12), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(11),
         GlitchData	=> BCOUT_GlitchData(11),
         OutSignalName	=> "BCOUT(11)",
         OutTemp	=> BCOUT_zd(11),
         Paths		=> (
			0 => (B_dly(11)'last_event, tpd_B_BCOUT((323 - 6)- 18*6), true),
			1 => (BCIN_dly(11)'last_event, tpd_BCIN_BCOUT((323 - 6)- 18*6), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(11), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(10),
         GlitchData	=> BCOUT_GlitchData(10),
         OutSignalName	=> "BCOUT(10)",
         OutTemp	=> BCOUT_zd(10),
         Paths		=> (
			0 => (B_dly(10)'last_event, tpd_B_BCOUT((323 - 7)- 18*7), true),
			1 => (BCIN_dly(10)'last_event, tpd_BCIN_BCOUT((323 - 7)- 18*7), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(10), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(9),
         GlitchData	=> BCOUT_GlitchData(9),
         OutSignalName	=> "BCOUT(9)",
         OutTemp	=> BCOUT_zd(9),
         Paths		=> (
			0 => (B_dly(9)'last_event, tpd_B_BCOUT((323 - 8)- 18*8), true),
			1 => (BCIN_dly(9)'last_event, tpd_BCIN_BCOUT((323 - 8)- 18*8), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(9), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(8),
         GlitchData	=> BCOUT_GlitchData(8),
         OutSignalName	=> "BCOUT(8)",
         OutTemp	=> BCOUT_zd(8),
         Paths		=> (
			0 => (B_dly(8)'last_event, tpd_B_BCOUT((323 - 9)- 18*9), true),
			1 => (BCIN_dly(8)'last_event, tpd_BCIN_BCOUT((323 - 9)- 18*9), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(8), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(7),
         GlitchData	=> BCOUT_GlitchData(7),
         OutSignalName	=> "BCOUT(7)",
         OutTemp	=> BCOUT_zd(7),
         Paths		=> (
			0 => (B_dly(7)'last_event, tpd_B_BCOUT((323 - 10)- 18*10), true),
			1 => (BCIN_dly(7)'last_event, tpd_BCIN_BCOUT((323 - 10)- 18*10), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(7), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(6),
         GlitchData	=> BCOUT_GlitchData(6),
         OutSignalName	=> "BCOUT(6)",
         OutTemp	=> BCOUT_zd(6),
         Paths		=> (
			0 => (B_dly(6)'last_event, tpd_B_BCOUT((323 - 11)- 18*11), true),
			1 => (BCIN_dly(6)'last_event, tpd_BCIN_BCOUT((323 - 11)- 18*11), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(6), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(5),
         GlitchData	=> BCOUT_GlitchData(5),
         OutSignalName	=> "BCOUT(5)",
         OutTemp	=> BCOUT_zd(5),
         Paths		=> (
			0 => (B_dly(5)'last_event, tpd_B_BCOUT((323 - 12)- 18*12), true),
			1 => (BCIN_dly(5)'last_event, tpd_BCIN_BCOUT((323 - 12)- 18*12), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(5), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(4),
         GlitchData	=> BCOUT_GlitchData(4),
         OutSignalName	=> "BCOUT(4)",
         OutTemp	=> BCOUT_zd(4),
         Paths		=> (
			0 => (B_dly(4)'last_event, tpd_B_BCOUT((323 - 13)- 18*13), true),
			1 => (BCIN_dly(4)'last_event, tpd_BCIN_BCOUT((323 - 13)- 18*13), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(4), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(3),
         GlitchData	=> BCOUT_GlitchData(3),
         OutSignalName	=> "BCOUT(3)",
         OutTemp	=> BCOUT_zd(3),
         Paths		=> (
			0 => (B_dly(3)'last_event, tpd_B_BCOUT((323 - 14)- 18*14), true),
			1 => (BCIN_dly(3)'last_event, tpd_BCIN_BCOUT((323 - 14)- 18*14), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(3), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(2),
         GlitchData	=> BCOUT_GlitchData(2),
         OutSignalName	=> "BCOUT(2)",
         OutTemp	=> BCOUT_zd(2),
         Paths		=> (
			0 => (B_dly(2)'last_event, tpd_B_BCOUT((323 - 15)- 18*15), true),
			1 => (BCIN_dly(2)'last_event, tpd_BCIN_BCOUT((323 - 15)- 18*15), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(2), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(1),
         GlitchData	=> BCOUT_GlitchData(1),
         OutSignalName	=> "BCOUT(1)",
         OutTemp	=> BCOUT_zd(1),
         Paths		=> (
			0 => (B_dly(1)'last_event, tpd_B_BCOUT((323 - 16)- 18*16), true),
			1 => (BCIN_dly(1)'last_event, tpd_BCIN_BCOUT((323 - 16)- 18*16), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(1), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

       VitalPathDelay01 (
         OutSignal	=> BCOUT(0),
         GlitchData	=> BCOUT_GlitchData(0),
         OutSignalName	=> "BCOUT(0)",
         OutTemp	=> BCOUT_zd(0),
         Paths		=> (
			0 => (B_dly(0)'last_event, tpd_B_BCOUT((323 - 17)- 18*17), true),
			1 => (BCIN_dly(0)'last_event, tpd_BCIN_BCOUT((323 - 17)- 18*17), true),
			2 => (CLK_dly'last_event, tpd_CLK_BCOUT(0), true)),
         Mode		=> VitalTransport,
         Xon		=> Xon,
         MsgOn		=> MsgOn,
         MsgSeverity	=> warning);

-- 07/25/05 -- CR 212535 Added CLK_dly to the sensitivity list
-- 08/29/05 -- CR 213754 Added rest of the signals to the sensitivity list
    wait on A_dly, B_dly, BCIN_dly, CEA_dly, CEB_dly, CEP_dly, CLK_dly, RSTA_dly, RSTB_dly, 
            P_zd, BCOUT_zd;
  end process prcs_Timing;

end X_MULT18X18SIO_V ;

