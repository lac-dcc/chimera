-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/rainier/VITAL/X_LUT6_2.vhd,v 1.4 2010/01/14 19:38:17 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  6-input Look-Up-Table with Two General Outputs
-- /___/   /\     Filename : X_LUT6_2.vhd
-- \   \  /  \    Timestamp : 
--  \___\/\___\
--
-- Revision:
--    08/09/06 - Initial version.
--    06/04/09 - Set initial value to 0 (CR523812)
-- End Revision

----- CELL X_LUT6_2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.Vcomponents.all;

entity X_LUT6_2 is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_I0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I2 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I3 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I4 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I5 : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_I0_O5 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I1_O5 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I2_O5 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I3_O5 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I4_O5 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I5_O5 : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_I0_O6 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I1_O6 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I2_O6 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I3_O6 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I4_O6 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I5_O6 : VitalDelayType01 := (0.000 ns, 0.000 ns);

    INIT : bit_vector := X"0000000000000000"
    );

  port(
    O5 : out std_ulogic;
    O6 : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    I2 : in std_ulogic;
    I3 : in std_ulogic;
    I4 : in std_ulogic;
    I5 : in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_LUT6_2 : entity is true;
end X_LUT6_2;

architecture X_LUT6_2_V of X_LUT6_2 is

function lut6_mux8 (d :  std_logic_vector(7 downto 0); s : std_logic_vector(2 downto 0)) 
                    return std_logic is

       variable lut6_mux8_o : std_logic;
       function lut4_mux4f (df :  std_logic_vector(3 downto 0); sf : std_logic_vector(1 downto 0) )
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

  constant INIT_reg : std_logic_vector(63 downto 0) := To_StdLogicVector(INIT);    
  constant init_l : std_logic_vector(31 downto 0) := INIT_reg(31 downto 0);    
  constant init_h : std_logic_vector(31 downto 0) := INIT_reg(63 downto 32);    
  signal I0_ipd : std_ulogic := 'X';
  signal I1_ipd : std_ulogic := 'X';
  signal I2_ipd : std_ulogic := 'X';
  signal I3_ipd : std_ulogic := 'X';
  signal I4_ipd : std_ulogic := 'X';
  signal I5_ipd : std_ulogic := 'X';
  signal O5_zd     : std_ulogic;
  signal O6_zd     : std_ulogic;

begin

  WireDelay       : block
  begin
    VitalWireDelay (I0_ipd, I0, tipd_I0);
    VitalWireDelay (I1_ipd, I1, tipd_I1);
    VitalWireDelay (I2_ipd, I2, tipd_I2);
    VitalWireDelay (I3_ipd, I3, tipd_I3);
    VitalWireDelay (I4_ipd, I4, tipd_I4);
    VitalWireDelay (I5_ipd, I5, tipd_I5);
  end block;

  lut_p   : process (I0, I1, I2, I3, I4, I5)
    variable I_reg : std_logic_vector(4 downto 0);
    variable o_l : std_ulogic;
    variable o_h : std_ulogic;
  begin

    I_reg := TO_STDLOGICVECTOR(I4 & I3 &  I2 & I1 & I0);

    if ((I4 xor I3 xor I2 xor I1 xor I0) = '1' or (I4 xor I3 xor I2 xor I1 xor I0) = '0') then
       o_l := init_l(SLV_TO_INT(I_reg));
       o_h := init_h(SLV_TO_INT(I_reg));
    else 
       o_l :=  lut4_mux4 ( 
           (lut6_mux8 ( init_l(31 downto 24), I_reg(2 downto 0)) &
            lut6_mux8 ( init_l(23 downto 16), I_reg(2 downto 0)) &
            lut6_mux8 ( init_l(15 downto 8), I_reg(2 downto 0)) &
            lut6_mux8 ( init_l(7 downto 0), I_reg(2 downto 0))),
                        I_reg(4 downto 3));

       o_h :=  lut4_mux4 (
           (lut6_mux8 ( init_h(31 downto 24), I_reg(2 downto 0)) &
            lut6_mux8 ( init_h(23 downto 16), I_reg(2 downto 0)) &
            lut6_mux8 ( init_h(15 downto 8), I_reg(2 downto 0)) &
            lut6_mux8 ( init_h(7 downto 0), I_reg(2 downto 0))),
                        I_reg(4 downto 3));
 
    end if;

    O5_zd <= o_l;
    if (I5 = '1') then
      O6_zd <= o_h;
    elsif (I5 = '0') then
      O6_zd <= O_l;
    else 
      if (o_h = '0' and  o_l = '0') then
         O6_zd <= '0';
      elsif (o_h = '1' and o_l = '1') then
         O6_zd <= '1';
      else
         O6_zd <= 'X';
      end if;
   end if;

  end process;


  VITALTIING           : process (I0_ipd, I1_ipd, I2_ipd, I3_ipd, I4_ipd, I5_ipd, O5_zd, O6_zd)
    variable O5_GlitchData : VitalGlitchDataType;
    variable O6_GlitchData : VitalGlitchDataType;
  begin

    VitalPathDelay01 (
      OutSignal           => O5,
      GlitchData          => O5_GlitchData,
      OutSignalName       => "O5",
      OutTemp             => O5_zd,
      Paths               => (0 => (I0_ipd'last_event, tpd_I0_O5, true),
                              1 => (I1_ipd'last_event, tpd_I1_O5, true),
                              2 => (I2_ipd'last_event, tpd_I2_O5, true),
                              3 => (I3_ipd'last_event, tpd_I3_O5, true),
                              4 => (I4_ipd'last_event, tpd_I4_O5, true),
                              5 => (I5_ipd'last_event, tpd_I5_O5, true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);

    VitalPathDelay01 (
      OutSignal           => O6,
      GlitchData          => O6_GlitchData,
      OutSignalName       => "O6",
      OutTemp             => O6_zd,
      Paths               => (0 => (I0_ipd'last_event, tpd_I0_O6, true),
                              1 => (I1_ipd'last_event, tpd_I1_O6, true),
                              2 => (I2_ipd'last_event, tpd_I2_O6, true),
                              3 => (I3_ipd'last_event, tpd_I3_O6, true),
                              4 => (I4_ipd'last_event, tpd_I4_O6, true),
                              5 => (I5_ipd'last_event, tpd_I5_O6, true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);
  end process;

end X_LUT6_2_V;
