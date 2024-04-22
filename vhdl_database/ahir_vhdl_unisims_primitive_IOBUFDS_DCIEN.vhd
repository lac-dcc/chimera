-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  3-State Diffential Signaling I/O Buffer
-- /___/   /\     Filename : IOBUFDS_DCIEN.vhd
-- \   \  /  \    Timestamp : Wed Dec  8 17:04:24 PST 2010
--  \___\/\___\
--
-- Revision:
--    12/08/10 - Initial version.
--    03/28/11 - CR 603466 fix
--    05/05/11 - CR 608892 fix
--    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
--    08/31/11 - CR 623170 -- Tristate powergating support
--    09/13/11 - CR 624774 -- Removed attributes IBUF_DELAY_VALUE and IFD_DELAY_VALUE
--    09/16/11 - CR 625725 -- Removed attribute CAPACITANCE
--    09/19/11 - CR 625564 -- Fixed Tristate powergating polarity
-- End Revision


----- CELL IOBUFDS_DCIEN -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IOBUFDS_DCIEN is
  generic(
    DIFF_TERM        : string := "FALSE";
    IBUF_LOW_PWR     : string := "TRUE";
    IOSTANDARD       : string := "DEFAULT";
    SLEW             : string := "SLOW";
    USE_IBUFDISABLE  : string := "TRUE"
    );

  port(
    O              : out std_ulogic;

    IO             : inout std_ulogic;
    IOB            : inout std_ulogic;

    DCITERMDISABLE : in std_ulogic;
    I              : in std_ulogic;
    IBUFDISABLE    : in std_ulogic;
    T              : in std_ulogic
    );
end IOBUFDS_DCIEN;

architecture IOBUFDS_DCIEN_V of IOBUFDS_DCIEN is


begin


  prcs_init             : process
    variable FIRST_TIME : boolean := true;
  begin

    if(FIRST_TIME = true) then

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

    if((IOSTANDARD = "LVDS_25") or (IOSTANDARD = "LVDSEXT_25")) then
       assert false
       report "DRC Warning : The IOSTANDARD attribute on IOBUFDS_DCIEN instance is either set to LVDS_25 or LVDSEXT_25. These are fixed impedance structure optimized to 100ohm differential. If the intended usage is a bus architecture, please use BLVDS. This is only intended to be used in point to point transmissions that do not have turn around timing requirements"
       severity Warning;
    end if;


    wait;
  end process prcs_init;

  VPKGBehavior : process (IBUFDISABLE, IO, IOB, I, T)
  variable  T_OR_IBUFDISABLE : std_ulogic := '0';
  begin
    if(USE_IBUFDISABLE = "TRUE") then

       T_OR_IBUFDISABLE := IBUFDISABLE OR (not T);

       if(T_OR_IBUFDISABLE = '1') then
          O  <= '1';
       elsif (T_OR_IBUFDISABLE = '0') then
          if (IO = 'X' or IOB = 'X' ) then
             O <= 'X';  
          elsif (IO /= IOB ) then
            O <= TO_X01(IO);
          else
            O <= 'X';
          end if;
    	end if;        
    elsif(USE_IBUFDISABLE = "FALSE") then        
          if (IO = 'X' or IOB = 'X' ) then
             O <= 'X';
          elsif (IO /= IOB ) then
            O <= TO_X01(IO);
          end if;
    end if;        

    if ((T = '1') or (T = 'H')) then
      IO <= 'Z';
    elsif ((T = '0') or (T = 'L')) then
      if ((I = '1') or (I = 'H')) then
        IO <= '1';
      elsif ((I = '0') or (I = 'L')) then
        IO <= '0';
      elsif (I = 'U') then
        IO <= 'U';
      else
        IO <= 'X';  
      end if;
    elsif (T = 'U') then
      IO <= 'U';          
    else                                      
      IO <= 'X';  
    end if;

    if ((T = '1') or (T = 'H')) then
      IOB <= 'Z';
    elsif ((T = '0') or (T = 'L')) then
      if (((not I) = '1') or ((not I) = 'H')) then
        IOB <= '1';
      elsif (((not I) = '0') or ((not I) = 'L')) then
        IOB <= '0';
      elsif ((not I) = 'U') then
        IOB <= 'U';
      else
        IOB <= 'X';  
      end if;
    elsif (T = 'U') then
      IOB <= 'U';          
    else                                      
      IOB <= 'X';  
    end if;        
  end process;

end IOBUFDS_DCIEN_V;
