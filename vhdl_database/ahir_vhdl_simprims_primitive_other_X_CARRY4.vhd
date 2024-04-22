-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/rainier/VITAL/X_CARRY4.vhd,v 1.5 2012/04/25 22:22:26 robh Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Fast Carry Logic with Look Ahead
-- /___/   /\     Filename : X_CARRY4.vhd
-- \   \  /  \    
--  \___\/\___\
-- Revision:
--    04/11/05 - Initial version.
--    05/06/05 - Unused CYINT or CI pin need grounded instead of open (CR207752)
--    05/31/05 - Change pin order, remove connection check for CYINT and CI.
--    12/21/05 - Add timing path.
--    10/04/11 - Add X to CO_out to handle S=X (CR627723)
--    04/13/12 - CR655410 - add pulldown (:= 'L'), CI, CYINIT
-- End Revision

----- CELL X_CARRY4 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Timing.all;

entity X_CARRY4 is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

      tipd_CI : VitalDelayType01 := (0 ps, 0 ps);
      tipd_CYINIT : VitalDelayType01 := (0 ps, 0 ps);
      tipd_DI   : VitalDelayArrayType01(3 downto 0) := (others => (0 ps, 0 ps));
      tipd_S   : VitalDelayArrayType01(3 downto 0) := (others => (0 ps, 0 ps));

      tpd_CI_CO     :     VitalDelayArrayType01 (3 downto 0)  := (others => (0 ps, 0 ps));
      tpd_CI_O     :     VitalDelayArrayType01 (3 downto 0)  := (others => (0 ps, 0 ps));
      tpd_CYINIT_CO     :     VitalDelayArrayType01 (3 downto 0)  := (others => (0 ps, 0 ps));
      tpd_CYINIT_O     :     VitalDelayArrayType01 (3 downto 0)  := (others => (0 ps, 0 ps));
      tpd_DI_CO     :     VitalDelayArrayType01 (15 downto 0)  := (others => (0 ps, 0 ps));
      tpd_DI_O     :     VitalDelayArrayType01 (15 downto 0)  := (others => (0 ps, 0 ps));
      tpd_S_CO     :     VitalDelayArrayType01 (15 downto 0)  := (others => (0 ps, 0 ps));
      tpd_S_O     :     VitalDelayArrayType01 (15 downto 0)  := (others => (0 ps, 0 ps))

      );

  port(
      CO          : out std_logic_vector(3 downto 0);
      O           : out std_logic_vector(3 downto 0);
   
      CI          : in  std_ulogic := 'L';
      CYINIT      : in  std_ulogic := 'L';
      DI          : in std_logic_vector(3 downto 0);
      S           : in std_logic_vector(3 downto 0)
      );

  attribute VITAL_LEVEL0 of
    X_CARRY4 : entity is true;

end X_CARRY4;

architecture X_CARRY4_V OF X_CARRY4 is

  attribute VITAL_LEVEL0 of
    X_CARRY4_V : architecture is true;

  signal ci_or_cyinit : std_ulogic;
  signal CO_out : std_logic_vector(3 downto 0);

  signal CI_ipd : std_ulogic := 'X';
  signal CYINIT_ipd : std_ulogic := 'X';
  signal DI_ipd : std_logic_vector(3 downto 0) := (others => '0' );
  signal S_ipd : std_logic_vector(3 downto 0) := (others => '0' );
  signal CO_zd : std_logic_vector(3 downto 0);
  signal O_zd  : std_logic_vector(3 downto 0);

begin

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay       : block
  begin
    VitalWireDelay (CI_ipd, CI, tipd_CI);
    VitalWireDelay (CYINIT_ipd, CYINIT, tipd_CYINIT);

    DI_DELAY : for i in 3 downto 0 generate
      VitalWireDelay ( DI_ipd(i), DI(i), tipd_DI(i));
    end generate DI_DELAY;

    S_DELAY : for i in 3 downto 0 generate
      VitalWireDelay ( S_ipd(i), S(i), tipd_S(i));
    end generate S_DELAY;

  end block;

  Behaviour                 : process (CI_ipd, CYINIT_ipd, DI_ipd, S_ipd) 
    variable CO_out : std_logic_vector(3 downto 0);
    variable ci_or_cyinit : std_logic := '0';
  begin

  ci_or_cyinit := CI_ipd or CYINIT_ipd;

  if (S_ipd(0) = '1') then
     CO_out(0) := ci_or_cyinit;
  elsif (S_ipd(0) = '0') then
     CO_out(0) := DI_ipd(0);
  else
     CO_out(0) := 'X';
  end if;

  if (S_ipd(1) = '1') then
     CO_out(1) := CO_out(0);
  elsif (S_ipd(1) = '0') then
     CO_out(1) := DI_ipd(1);
  else
     CO_out(1) := 'X';
  end if;
 
  if (S_ipd(2) = '1') then
     CO_out(2) := CO_out(1);
  elsif (S_ipd(2) = '0') then
     CO_out(2) := DI_ipd(2);
  else
     CO_out(2) := 'X';
  end if;

  if (S_ipd(3) = '1') then
     CO_out(3) := CO_out(2);
  elsif (S_ipd(3) = '0') then
     CO_out(3) := DI_ipd(3);
  else
     CO_out(3) := 'X';
  end if;

  O_zd(0) <= S_ipd(0) xor ci_or_cyinit;
  O_zd(1) <= S_ipd(1) xor CO_out(0);
  O_zd(2) <= S_ipd(2) xor CO_out(1);
  O_zd(3) <= S_ipd(3) xor CO_out(2);
  CO_zd <= CO_out;
  end process Behaviour;


  VITALPathDelay_O          : process(O_zd)
    variable P_zd         : std_logic_vector(3 downto 0);
    variable P_GlitchData : VitalGlitchDataArrayType (3 downto 0);
  begin
    P_zd := O_zd;
    VitalPathDelay01 (
      OutSignal           => O(3),
      GlitchData          => P_GlitchData(3),
      OutSignalName       => "O(3)",
      OutTemp             => P_zd(3),
      Paths               => ( 0         => (DI_ipd(3)'last_event, tpd_DI_O((15-0) - 4*0), true),
                               1         => (DI_ipd(2)'last_event, tpd_DI_O((15-0) - 4*1), true),
                               2         => (DI_ipd(1)'last_event, tpd_DI_O((15-0) - 4*2), true),
                               3         => (DI_ipd(0)'last_event, tpd_DI_O((15-0) - 4*3), true),
                               4         => ( S_ipd(3)'last_event, tpd_S_O((15-0) - 4*0), true),
                               5         => ( S_ipd(2)'last_event, tpd_S_O((15-0) - 4*1), true),
                               6         => ( S_ipd(1)'last_event, tpd_S_O((15-0) - 4*2), true),
                               7         => ( S_ipd(0)'last_event, tpd_S_O((15-0) - 4*3), true),
                               8         => (CI_ipd'last_event, tpd_CI_O(3), true),
                               9         => (CYINIT_ipd'last_event, tpd_CYINIT_O(3), true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);

    VitalPathDelay01 (
      OutSignal           => O(2),
      GlitchData          => P_GlitchData(2),
      OutSignalName       => "O(2)",
      OutTemp             => P_zd(2),
      Paths               => ( 0         => (DI_ipd(3)'last_event, tpd_DI_O((15-1) - 4*0), true),
                               1         => (DI_ipd(2)'last_event, tpd_DI_O((15-1) - 4*1), true),
                               2         => (DI_ipd(1)'last_event, tpd_DI_O((15-1) - 4*2), true),
                               3         => (DI_ipd(0)'last_event, tpd_DI_O((15-1) - 4*3), true),
                               4         => ( S_ipd(3)'last_event, tpd_S_O((15-1) - 4*0), true),
                               5         => ( S_ipd(2)'last_event, tpd_S_O((15-1) - 4*1), true),
                               6         => ( S_ipd(1)'last_event, tpd_S_O((15-1) - 4*2), true),
                               7         => ( S_ipd(0)'last_event, tpd_S_O((15-1) - 4*3), true),
                               8         => (CI_ipd'last_event, tpd_CI_O(2), true),
                               9         => (CYINIT_ipd'last_event, tpd_CYINIT_O(2), true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);

    VitalPathDelay01 (
      OutSignal           => O(1),
      GlitchData          => P_GlitchData(1),
      OutSignalName       => "O(1)",
      OutTemp             => P_zd(1),
      Paths               => ( 0         => (DI_ipd(3)'last_event, tpd_DI_O((15-2) - 4*0), true),
                               1         => (DI_ipd(2)'last_event, tpd_DI_O((15-2) - 4*1), true),
                               2         => (DI_ipd(1)'last_event, tpd_DI_O((15-2) - 4*2), true),
                               3         => (DI_ipd(0)'last_event, tpd_DI_O((15-2) - 4*3), true),
                               4         => ( S_ipd(3)'last_event, tpd_S_O((15-2) - 4*0), true),
                               5         => ( S_ipd(2)'last_event, tpd_S_O((15-2) - 4*1), true),
                               6         => ( S_ipd(1)'last_event, tpd_S_O((15-2) - 4*2), true),
                               7         => ( S_ipd(0)'last_event, tpd_S_O((15-2) - 4*3), true),
                               8         => (CI_ipd'last_event, tpd_CI_O(1), true),
                               9         => (CYINIT_ipd'last_event, tpd_CYINIT_O(1), true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);

    VitalPathDelay01 (
      OutSignal           => O(0),
      GlitchData          => P_GlitchData(0),
      OutSignalName       => "O(0)",
      OutTemp             => P_zd(0),
      Paths               => ( 0         => (DI_ipd(3)'last_event, tpd_DI_O((15-3) - 4*0), true),
                               1         => (DI_ipd(2)'last_event, tpd_DI_O((15-3) - 4*1), true),
                               2         => (DI_ipd(1)'last_event, tpd_DI_O((15-3) - 4*2), true),
                               3         => (DI_ipd(0)'last_event, tpd_DI_O((15-3) - 4*3), true),
                               4         => ( S_ipd(3)'last_event, tpd_S_O((15-3) - 4*0), true),
                               5         => ( S_ipd(2)'last_event, tpd_S_O((15-3) - 4*1), true),
                               6         => ( S_ipd(1)'last_event, tpd_S_O((15-3) - 4*2), true),
                               7         => ( S_ipd(0)'last_event, tpd_S_O((15-3) - 4*3), true),
                               8         => (CI_ipd'last_event, tpd_CI_O(0), true),
                               9         => (CYINIT_ipd'last_event, tpd_CYINIT_O(0), true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);


  end process;



  VITALPathDelay_CO          : process(CO_zd)
    variable P_zd         : std_logic_vector(3 downto 0);
    variable P_GlitchData : VitalGlitchDataArrayType (3 downto 0);
  begin
    P_zd := CO_zd;
    VitalPathDelay01 (
      OutSignal           => CO(3),
      GlitchData          => P_GlitchData(3),
      OutSignalName       => "CO(3)",
      OutTemp             => P_zd(3),
      Paths               => ( 0         => (DI_ipd(3)'last_event, tpd_DI_CO((15-0) - 4*0), true),
                               1         => (DI_ipd(2)'last_event, tpd_DI_CO((15-0) - 4*1), true),
                               2         => (DI_ipd(1)'last_event, tpd_DI_CO((15-0) - 4*2), true),
                               3         => (DI_ipd(0)'last_event, tpd_DI_CO((15-0) - 4*3), true),
                               4         => ( S_ipd(3)'last_event, tpd_S_CO((15-0) - 4*0), true),
                               5         => ( S_ipd(2)'last_event, tpd_S_CO((15-0) - 4*1), true),
                               6         => ( S_ipd(1)'last_event, tpd_S_CO((15-0) - 4*2), true),
                               7         => ( S_ipd(0)'last_event, tpd_S_CO((15-0) - 4*3), true),
                               8         => (CI_ipd'last_event, tpd_CI_CO(3), true),
                               9         => (CYINIT_ipd'last_event, tpd_CYINIT_CO(3), true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);

    VitalPathDelay01 (
      OutSignal           => CO(2),
      GlitchData          => P_GlitchData(2),
      OutSignalName       => "CO(2)",
      OutTemp             => P_zd(2),
      Paths               => ( 0         => (DI_ipd(3)'last_event, tpd_DI_CO((15-1) - 4*0), true),
                               1         => (DI_ipd(2)'last_event, tpd_DI_CO((15-1) - 4*1), true),
                               2         => (DI_ipd(1)'last_event, tpd_DI_CO((15-1) - 4*2), true),
                               3         => (DI_ipd(0)'last_event, tpd_DI_CO((15-1) - 4*3), true),
                               4         => ( S_ipd(3)'last_event, tpd_S_CO((15-1) - 4*0), true),
                               5         => ( S_ipd(2)'last_event, tpd_S_CO((15-1) - 4*1), true),
                               6         => ( S_ipd(1)'last_event, tpd_S_CO((15-1) - 4*2), true),
                               7         => ( S_ipd(0)'last_event, tpd_S_CO((15-1) - 4*3), true),
                               8         => (CI_ipd'last_event, tpd_CI_CO(2), true),
                               9         => (CYINIT_ipd'last_event, tpd_CYINIT_CO(2), true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);

    VitalPathDelay01 (
      OutSignal           => CO(1),
      GlitchData          => P_GlitchData(1),
      OutSignalName       => "CO(1)",
      OutTemp             => P_zd(1),
      Paths               => ( 0         => (DI_ipd(3)'last_event, tpd_DI_CO((15-2) - 4*0), true),
                               1         => (DI_ipd(2)'last_event, tpd_DI_CO((15-2) - 4*1), true),
                               2         => (DI_ipd(1)'last_event, tpd_DI_CO((15-2) - 4*2), true),
                               3         => (DI_ipd(0)'last_event, tpd_DI_CO((15-2) - 4*3), true),
                               4         => ( S_ipd(3)'last_event, tpd_S_CO((15-2) - 4*0), true),
                               5         => ( S_ipd(2)'last_event, tpd_S_CO((15-2) - 4*1), true),
                               6         => ( S_ipd(1)'last_event, tpd_S_CO((15-2) - 4*2), true),
                               7         => ( S_ipd(0)'last_event, tpd_S_CO((15-2) - 4*3), true),
                               8         => (CI_ipd'last_event, tpd_CI_CO(1), true),
                               9         => (CYINIT_ipd'last_event, tpd_CYINIT_CO(1), true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);

    VitalPathDelay01 (
      OutSignal           => CO(0),
      GlitchData          => P_GlitchData(0),
      OutSignalName       => "CO(0)",
      OutTemp             => P_zd(0),
      Paths               => ( 0         => (DI_ipd(3)'last_event, tpd_DI_CO((15-3) - 4*0), true),
                               1         => (DI_ipd(2)'last_event, tpd_DI_CO((15-3) - 4*1), true),
                               2         => (DI_ipd(1)'last_event, tpd_DI_CO((15-3) - 4*2), true),
                               3         => (DI_ipd(0)'last_event, tpd_DI_CO((15-3) - 4*3), true),
                               4         => ( S_ipd(3)'last_event, tpd_S_CO((15-3) - 4*0), true),
                               5         => ( S_ipd(2)'last_event, tpd_S_CO((15-3) - 4*1), true),
                               6         => ( S_ipd(1)'last_event, tpd_S_CO((15-3) - 4*2), true),
                               7         => ( S_ipd(0)'last_event, tpd_S_CO((15-3) - 4*3), true),
                               8         => (CI_ipd'last_event, tpd_CI_CO(0), true),
                               9         => (CYINIT_ipd'last_event, tpd_CYINIT_CO(0), true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);


  end process;

end X_CARRY4_V;

