-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_KEEPER.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Weak Keeper
-- /___/   /\     Filename : X_KEEPER.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:09 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_KEEPER -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_KEEPER is
  generic(
    LOC : string  := "UNPLACED";
    tipd_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
    );

  port(
    O : inout std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_KEEPER : entity is true;
end X_KEEPER;

architecture X_KEEPER_V of X_KEEPER is
  attribute VITAL_LEVEL0 of
    X_KEEPER_V : architecture is true;

  signal O_ipd : std_ulogic := 'W';
begin
  process (O)
  begin
    if (O'event) then
      if (O = '1') then
        O_ipd <= transport 'H' after tipd_O(tr01);
      elsif (O = '0') then
        O_ipd <= transport 'L' after tipd_O(tr10);
      elsif (O = 'X') then
        O_ipd <= transport 'W' after tipd_O(tr10);        
      end if;
    end if;
  end process;

  O <= O_ipd;
end X_KEEPER_V;
