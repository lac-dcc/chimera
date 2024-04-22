-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Differential Signaling Input Buffer
-- /___/   /\     Filename : IBUFDS_IBUFDISABLE.vhd
-- \   \  /  \    Timestamp : Wed Dec  8 17:04:24 PST 2010
--  \___\/\___\
--
-- Revision:
--    12/08/10 - Initial version.
--    04/04/11 - CR 604808 fix
--    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
--    08/31/11 - CR 623170 -- added attribute USE_IBUFDISABLE
--    09/13/11 - CR 624774 -- Removed attributes IBUF_DELAY_VALUE and IFD_DELAY_VALUE
--    09/16/11 - CR 625725 -- Removed attribute CAPACITANCE
-- End Revision

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IBUFDS_IBUFDISABLE is
  generic(
      DIFF_TERM   : string  :=  "FALSE";
      IBUF_LOW_PWR : string :=  "TRUE";
      IOSTANDARD  : string  := "DEFAULT";
      USE_IBUFDISABLE : string :=  "TRUE"
    );

  port(
    O : out std_ulogic;

    I  : in std_ulogic;
    IB : in std_ulogic;
    IBUFDISABLE : in std_ulogic
    );
end IBUFDS_IBUFDISABLE;

architecture IBUFDS_IBUFDISABLE_V of IBUFDS_IBUFDISABLE is
  signal        O_zd		: std_ulogic := '0';
begin

  prcs_init : process
  variable FIRST_TIME        : boolean    := TRUE;
  begin

     If(FIRST_TIME = true) then

        if((DIFF_TERM = "TRUE") or
           (DIFF_TERM = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for DIFF_TERM are TRUE or FALSE"
           severity Failure;
        end if;

--   
        if((IBUF_LOW_PWR = "TRUE") or
           (IBUF_LOW_PWR = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for IBUF_LOW_PWR are TRUE or FALSE"
           severity Failure;
        end if;

--  
        if((USE_IBUFDISABLE = "TRUE") or
           (USE_IBUFDISABLE = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for USE_IBUFDISABLE are TRUE or FALSE"
           severity Failure;
        end if;

     end if;

     wait;
  end process prcs_init;

  VitalBehavior : process (I, IB)
  begin
    if ( (((I = '1') or (I = 'H')) and ((IB = '0') or (IB = 'L'))) or
         (((I = '0') or (I = 'L')) and ((IB = '1') or (IB = 'H'))) ) then
      O_zd <= TO_X01(I);
    elsif (I = 'Z' or I = 'X' or IB = 'Z' or IB ='X') then
      O_zd <= 'X';
    end if;

  end process;

  O <=   O_zd when ((USE_IBUFDISABLE = "FALSE") OR ((USE_IBUFDISABLE = "TRUE") AND (IBUFDISABLE = '0'))) else
        '1' when ((USE_IBUFDISABLE = "TRUE") AND (IBUFDISABLE = '1'));

end IBUFDS_IBUFDISABLE_V;
