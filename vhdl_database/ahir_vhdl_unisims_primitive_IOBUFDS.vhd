-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/unisims/unisim/VITAL/IOBUFDS.vhd,v 1.6 2010/12/02 01:13:43 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  3-State Diffential Signaling I/O Buffer
-- /___/   /\     Filename : IOBUFDS.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:55:58 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    07/26/07 - Add else to handle x case for output (CR 424214).
--    07/16/08 - Added IBUF_LOW_PWR attribute.
--    04/22/09 - CR 519127 - Changed IBUF_LOW_PWR default to TRUE.
--    10/14/09 - CR 535630 - Added DIFF_TERM attribute.
--    05/12/10 - CR 559468 -- Added DRC warnings for LVDS_25 bus architectures.
--    12/01/10 - CR 584500 -- Added attribute SLEW
-- End Revision


----- CELL IOBUFDS -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IOBUFDS is
  generic(
    CAPACITANCE      : string  := "DONT_CARE";
    DIFF_TERM        : boolean :=  FALSE;
    IBUF_DELAY_VALUE : string  := "0";
    IBUF_LOW_PWR     : boolean :=  TRUE;
    IFD_DELAY_VALUE  : string  := "AUTO";
    IOSTANDARD       : string  := "DEFAULT";
    SLEW             : string  := "SLOW"
    );

  port(
    O : out std_ulogic;

    IO  : inout std_ulogic;
    IOB : inout std_ulogic;

    I : in std_ulogic;
    T : in std_ulogic
    );
end IOBUFDS;

architecture IOBUFDS_V of IOBUFDS is
begin

  prcs_init             : process
    variable FIRST_TIME : boolean := true;
  begin

    if(FIRST_TIME = true) then

      if((DIFF_TERM = TRUE) or
           (DIFF_TERM = FALSE)) then
           FIRST_TIME := false;
      else
           assert false
           report "Attribute Syntax Error: The Legal values for DIFF_TERM are TRUE or FALSE"
           severity Failure;
      end if;

      if((CAPACITANCE = "LOW") or
         (CAPACITANCE = "NORMAL") or
         (CAPACITANCE = "DONT_CARE")) then
        FIRST_TIME := false;
      else
        assert false
          report "Attribute Syntax Error : The allowed values for CAPACITANCE are LOW, NORMAL or DONT_CARE"
          severity failure;
      end if;

--   
        if((IBUF_DELAY_VALUE = "0") or (IBUF_DELAY_VALUE = "1") or 
          (IBUF_DELAY_VALUE = "2")  or (IBUF_DELAY_VALUE = "3") or
          (IBUF_DELAY_VALUE = "4")  or (IBUF_DELAY_VALUE = "5") or
          (IBUF_DELAY_VALUE = "6")  or (IBUF_DELAY_VALUE = "7") or
          (IBUF_DELAY_VALUE = "8")  or (IBUF_DELAY_VALUE = "9") or
          (IBUF_DELAY_VALUE = "10") or (IBUF_DELAY_VALUE = "11") or
          (IBUF_DELAY_VALUE = "12") or (IBUF_DELAY_VALUE = "13") or
          (IBUF_DELAY_VALUE = "14") or (IBUF_DELAY_VALUE = "15") or
          (IBUF_DELAY_VALUE = "16")) then 
              FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for IBUF_DELAY_VALUE are 0, 1, 2, ... , or 16. "
           severity Failure;
        end if;        

--   

        if((IBUF_LOW_PWR = TRUE) or
           (IBUF_LOW_PWR = FALSE)) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for IBUF_LOW_PWR are TRUE or FALSE"
           severity Failure;
        end if;

--   

        if((IFD_DELAY_VALUE = "AUTO") or (IFD_DELAY_VALUE = "auto") or 
          (IFD_DELAY_VALUE = "0")     or (IFD_DELAY_VALUE = "1") or 
          (IFD_DELAY_VALUE = "2")     or (IFD_DELAY_VALUE = "3") or
          (IFD_DELAY_VALUE = "4")     or (IFD_DELAY_VALUE = "5") or
          (IFD_DELAY_VALUE = "6")     or (IFD_DELAY_VALUE = "7") or
          (IFD_DELAY_VALUE = "8")) then
              FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for IFD_DELAY_VALUE are AUTO, 0, 1, ... , or 8"
           severity Failure;
        end if;        

    end if;

    if((IOSTANDARD = "LVDS_25") or (IOSTANDARD = "LVDSEXT_25")) then
       assert false
       report "DRC Warning : The IOSTANDARD attribute on IOBUFDS instance is either set to LVDS_25 or LVDSEXT_25. These are fixed impedance structure optimized to 100ohm differential. If the intended usage is a bus architecture, please use BLVDS. This is only intended to be used in point to point transmissions that do not have turn around timing requirements"
       severity Warning;
    end if;


    wait;
  end process prcs_init;

  VPKGBehavior : process (IO, IOB, I, T)
  begin

--    if (IO /= IOB ) then
--      O <= TO_X01(IO);
--    else
--      O <= 'X';
--    end if;
    
    if (IO = 'X' or IOB = 'X' ) then
       O <= 'X';  
    elsif (IO /= IOB ) then
      O <= TO_X01(IO);
    else
      O <= 'X';
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


end IOBUFDS_V;
