-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_LUT5.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  5-input Look-Up-Table with General Output
-- /___/   /\     Filename : X_LUT5.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:10 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    03/15/05 - Modified to handle the address unknown case.
--    03/10/06 - replace TO_INTEGER to SLV_TO_INT. (CR 226842)
-- End Revision

----- CELL X_LUT5 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.VCOMPONENTS.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_LUT5 is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_ADR0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR2 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR3 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR4 : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_ADR0_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR1_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR2_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR3_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR4_O : VitalDelayType01 := (0.000 ns, 0.000 ns);

    INIT : bit_vector := X"00000000"
    );

  port(
    O    : out std_ulogic;
    ADR0 : in  std_ulogic;
    ADR1 : in  std_ulogic;
    ADR2 : in  std_ulogic;
    ADR3 : in  std_ulogic;
    ADR4 : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_LUT5 : entity is true;
end X_LUT5;

architecture X_LUT5_V of X_LUT5 is

function lut6_mux8 (d :  std_logic_vector(7 downto 0); s : std_logic_vector(2 downto 0))
                    return std_logic is

       variable lut6_mux8_o : std_logic;
       function lut4_mux4f (df : std_logic_vector(3 downto 0); sf : std_logic_vector(1 downto 0) )
                    return std_logic is

            variable lut4_mux4_f : std_logic;
       begin

            if (((sf(1) xor sf(0)) = '1')  or  ((sf(1) xor sf(0)) = '0')) then
                lut4_mux4_f := df(SLV_TO_INT(sf));
            elsif ((df(0) xor df(1)) = '0' and (df(2) xor df(3)) = '0'
                    and (df(0) xor df(2)) = '0') then
                lut4_mux4_f := df(0);
            elsif ((sf(1) = '0') and (df(0) = df(1))) then
                lut4_mux4_f := df(0);
            elsif ((sf(1) = '1') and (df(2) = df(3))) then
                lut4_mux4_f := df(2);
            elsif ((sf(0) = '0') and (df(0) = df(2))) then
                lut4_mux4_f := df(0);
            elsif ((sf(0) = '1') and (df(1) = df(3))) then
                lut4_mux4_f := df(1);
            else
                lut4_mux4_f := 'X';
           end if;

           return (lut4_mux4_f);
    
       end function lut4_mux4f;
  begin
       
    if ((s(2) xor s(1) xor s(0)) = '1' or (s(2) xor s(1) xor s(0)) = '0') then
       lut6_mux8_o := d(SLV_TO_INT(s));
    else
       lut6_mux8_o := lut4_mux4f(('0' & '0' & lut4_mux4f(d(7 downto 4), s(1 downto 0)) &
            lut4_mux4f(d(3 downto 0), s(1 downto 0))), ('0' & s(2)));
    end if;

      return (lut6_mux8_o);
     
  end function lut6_mux8;

function lut4_mux4 (d :  std_logic_vector(3 downto 0); s : std_logic_vector(1 downto 0) )
                    return std_logic is

       variable lut4_mux4_o : std_logic;
  begin
       
       if (((s(1) xor s(0)) = '1')  or  ((s(1) xor s(0)) = '0')) then
           lut4_mux4_o := d(SLV_TO_INT(s));
       elsif ((d(0) xor d(1)) = '0' and (d(2) xor d(3)) = '0'
                    and (d(0) xor d(2)) = '0') then
           lut4_mux4_o := d(0);
       elsif ((s(1) = '0') and (d(0) = d(1))) then
           lut4_mux4_o := d(0);
       elsif ((s(1) = '1') and (d(2) = d(3))) then
           lut4_mux4_o := d(2);
       elsif ((s(0) = '0') and (d(0) = d(2))) then
           lut4_mux4_o := d(0);
       elsif ((s(0) = '1') and (d(1) = d(3))) then
           lut4_mux4_o := d(1);
       else
           lut4_mux4_o := 'X';
      end if;

      return (lut4_mux4_o);
     
  end function lut4_mux4;
     
  signal ADR0_ipd : std_ulogic := 'X';
  signal ADR1_ipd : std_ulogic := 'X';
  signal ADR2_ipd : std_ulogic := 'X';
  signal ADR3_ipd : std_ulogic := 'X';
  signal ADR4_ipd : std_ulogic := 'X';
  signal O_zd     : std_ulogic;
    constant INIT_reg : std_logic_vector(31 downto 0) := To_StdLogicVector(INIT);    

begin

  WireDelay       : block
  begin
    VitalWireDelay (ADR0_ipd, ADR0, tipd_ADR0);
    VitalWireDelay (ADR1_ipd, ADR1, tipd_ADR1);
    VitalWireDelay (ADR2_ipd, ADR2, tipd_ADR2);
    VitalWireDelay (ADR3_ipd, ADR3, tipd_ADR3);
    VitalWireDelay (ADR4_ipd, ADR4, tipd_ADR4);
  end block;


  X_LUT5P   : process (ADR4_ipd, ADR3_ipd, ADR2_ipd, ADR1_ipd, ADR0_ipd)
    variable I_reg : std_logic_vector(4 downto 0);
  begin

    I_reg := TO_STDLOGICVECTOR(ADR4_ipd & ADR3_ipd & ADR2_ipd & ADR1_ipd & ADR0_ipd);

    if ((ADR4_ipd xor ADR3_ipd xor ADR2_ipd xor ADR1_ipd xor ADR0_ipd) = '1' or 
        (ADR4_ipd xor ADR3_ipd xor ADR2_ipd xor ADR1_ipd xor ADR0_ipd) = '0') then

       O_zd <= INIT_reg(SLV_TO_INT( I_reg));
    else 

       O_zd <=  lut4_mux4(
               (lut6_mux8(INIT_reg(31 downto 24), I_reg(2 downto 0)) &
                lut6_mux8 ( INIT_reg(23 downto 16), I_reg(2 downto 0)) &
                lut6_mux8 ( INIT_reg(15 downto 8), I_reg(2 downto 0)) &
                lut6_mux8 ( INIT_reg(7 downto 0), I_reg(2 downto 0))),
                 I_reg(4 downto 3));
 
    end if;
  end process;


  VITALTIMING           : process (ADR0_ipd, ADR1_ipd, ADR2_ipd, ADR3_ipd, ADR4_ipd, O_zd)
    variable O_GlitchData : VitalGlitchDataType;
  begin

    VitalPathDelay01 (
      OutSignal           => O,
      GlitchData          => O_GlitchData,
      OutSignalName       => "O",
      OutTemp             => O_zd,
      Paths               => (0 => (ADR0_ipd'last_event, tpd_ADR0_O, true),
                              1 => (ADR1_ipd'last_event, tpd_ADR1_O, true),
                              2 => (ADR2_ipd'last_event, tpd_ADR2_O, true),
                              3 => (ADR3_ipd'last_event, tpd_ADR3_O, true),
                              4 => (ADR4_ipd'last_event, tpd_ADR4_O, true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);
  end process;

end X_LUT5_V;
