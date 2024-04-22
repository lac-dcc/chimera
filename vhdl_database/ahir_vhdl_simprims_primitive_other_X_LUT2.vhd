-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_LUT2.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  2-input Look-Up-Table with General Output
-- /___/   /\     Filename : X_LUT2.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:09 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    03/15/05 - Modified to handle the address unknown case.
--    03/10/06 - replace TO_INTEGER to SLV_TO_INT. (CR 226842)
--    04/13/06 - Add address declaration. (CR229735)
-- End Revision

----- CELL X_LUT2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.VCOMPONENTS.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_LUT2 is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_ADR0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR1 : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_ADR0_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR1_O : VitalDelayType01 := (0.000 ns, 0.000 ns);

    INIT : bit_vector := X"0"
    );

  port(
    O    : out std_ulogic;
    ADR0 : in  std_ulogic;
    ADR1 : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_LUT2 : entity is true;
end X_LUT2;

architecture X_LUT2_V of X_LUT2 is
--  attribute VITAL_LEVEL1 of
--    X_LUT2_V : architecture is true;

  signal ADR0_ipd : std_ulogic := 'X';
  signal ADR1_ipd : std_ulogic := 'X';
begin
  WireDelay       : block
  begin
    VitalWireDelay (ADR0_ipd, ADR0, tipd_ADR0);
    VitalWireDelay (ADR1_ipd, ADR1, tipd_ADR1);
  end block;

  VITALBehavior           : process (ADR0_ipd, ADR1_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
    variable INIT_reg : std_logic_vector(3 downto 0) := To_StdLogicVector(INIT);    
    variable address : std_logic_vector(1 downto 0);
    variable address_int : integer := 0;
  begin
      address := ADR1_ipd & ADR0_ipd;
      address_int := SLV_TO_INT(address(1 downto 0));
     if ((ADR1_ipd xor ADR0_ipd) = '1' or (ADR1_ipd xor ADR0_ipd) = '0') then
       O_zd := INIT_reg(address_int);
    else 
      if ((INIT_reg(0) = INIT_reg(1)) and (INIT_reg(2) = INIT_reg(3)) and 
                              (INIT_reg(0) = INIT_reg(2)))  then
        O_zd := INIT_reg(0);      
      elsif ((ADR1_ipd = '0') and (INIT_reg(0) = INIT_reg(1)))  then
        O_zd := INIT_reg(0);      
      elsif ((ADR1_ipd = '1') and (INIT_reg(2) = INIT_reg(3)))  then
        O_zd := INIT_reg(2);      
      elsif ((ADR0_ipd = '0') and (INIT_reg(0) = INIT_reg(2)))  then
        O_zd := INIT_reg(0);      
      elsif ((ADR0_ipd = '1') and (INIT_reg(1)  = INIT_reg(3)))  then
        O_zd := INIT_reg(1);      
      else
        O_zd := 'X';
      end if;
    end if;

    VitalPathDelay01 (
      OutSignal            => O,
      GlitchData           => O_GlitchData,
      OutSignalName        => "O",
      OutTemp              => O_zd,
      Paths                => (0 => (ADR0_ipd'last_event, tpd_ADR0_O, true),
                               1 => (ADR1_ipd'last_event, tpd_ADR1_O, true)),
      Mode                 => VitalTransport,
      Xon                  => Xon,
      MsgOn                => MsgOn,
      MsgSeverity          => warning);
  end process;
end X_LUT2_V;
