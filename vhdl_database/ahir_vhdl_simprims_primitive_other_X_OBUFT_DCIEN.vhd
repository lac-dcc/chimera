-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  3-State Output Buffer
-- /___/   /\     Filename : X_OBUFT_DCIEN.vhd
-- \   \  /  \    Timestamp : Thu Apr 29 15:33:49 PDT 2010
--  \___\/\___\
--
-- Revision:
--    04/29/10 - Initial version.
--    12/20/10 - CR 587760 -- For backend support only, no corresponding unisim
--    09/16/11 - CR 625725 -- Removed attribute CAPACITANCE
-- End Revision

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_OBUFT_DCIEN is
  generic(
      DRIVE       : integer    := 12;
      IOSTANDARD  : string     := "DEFAULT";
      SLEW        : string     := "SLOW";

      Xon   : boolean := true;
      MsgOn : boolean := true;
      LOC            : string  := "UNPLACED";

      tipd_DCITERMDISABLE : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_DCITERMDISABLE_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_T : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_T_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      PATHPULSE : time := 0 ps
    );

  port(
    O : out std_ulogic;

    DCITERMDISABLE : in  std_ulogic;
    I        : in  std_ulogic;
    T        : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_OBUFT_DCIEN : entity is true;

end X_OBUFT_DCIEN;

architecture X_OBUFT_DCIEN_V of X_OBUFT_DCIEN is

  attribute VITAL_LEVEL0 of
    X_OBUFT_DCIEN_V : architecture is true;

  signal DCITERMDISABLE_ipd : std_ulogic := 'X';
  signal I_ipd              : std_ulogic := 'X';
  signal T_ipd              : std_ulogic := 'X';

begin

  WireDelay    : block
  begin
    VitalWireDelay (DCITERMDISABLE_ipd, DCITERMDISABLE, tipd_DCITERMDISABLE);
    VitalWireDelay (I_ipd,              I,              tipd_I);
    VitalWireDelay (T_ipd,              T,              tipd_T);
  end block;

  VITALBehavior   : process (I, T)
  begin
    if ((T = '1') or (T = 'H')) then
      O <= 'Z';
    elsif ((T = '0') or (T = 'L')) then
      if ((I = '1') or (I = 'H')) then
        O <= '1';
      elsif ((I = '0') or (I = 'L')) then
        O <= '0';
      elsif (I = 'U') then
        O <= 'U';
      else
        O <= 'X';  
      end if;
    elsif (T = 'U') then
      O <= 'U';          
    else                                      
      O <= 'X';  
    end if;
  end process;
end X_OBUFT_DCIEN_V;
