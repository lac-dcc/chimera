-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  User Interface to Global Clock, Reset and 3-State Controls for SPARTAN3E
-- /___/   /\     Filename : X_STARTUP_SPARTAN3E.vhd
-- \   \  /  \    Timestamp : Thu Jul 31 15:22:22 PDT 2008
--  \___\/\___\
--
-- Revision:
--    07/31/08 - Initial version -- CR 448436.
-- End Revision

----- CELL X_STARTUP_SPARTAN3E -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity X_STARTUP_SPARTAN3E is
  port(
    CLK : in std_ulogic := 'X';
    GSR : in std_ulogic := 'X';
    GTS : in std_ulogic := 'X';
    MBT : in std_ulogic := 'X'
    );
end X_STARTUP_SPARTAN3E;

architecture X_STARTUP_SPARTAN3E_V of X_STARTUP_SPARTAN3E is
constant MINIMUM_PULSE_LOW : time := 300 ns;
begin
   prcs_mbt:process(MBT)
   variable disable_mbt : boolean := false;
   variable init_time, min_time : time := 0 ps;
   begin
       if(not disable_mbt) then
          if(MBT = '0') then
             if(now /= 0 ns ) then
                init_time := now;
             end if;
          elsif(MBT = '1') then
             min_time := now - init_time;
             if(min_time >= MINIMUM_PULSE_LOW) then
                assert false
                report "Soft Boot has been initiated."
                severity note;
                
                disable_mbt := true;
             end if;
          end if;
       end if;   -- if (not disable_mbt)
   end process prcs_mbt; 
end X_STARTUP_SPARTAN3E_V;
