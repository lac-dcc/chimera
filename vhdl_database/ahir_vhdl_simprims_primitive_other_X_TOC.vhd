-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_TOC.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Three-State on Configuration
-- /___/   /\     Filename : X_TOC.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:20 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_TOC -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Primitives.all;

library IEEE;
use IEEE.VITAL_Timing.all;

-- entity declaration --
entity X_TOC is
  generic(
    LOC : string  := "UNPLACED";
    TOC_WIDTH : TIME := 0 ns;
    InstancePath: STRING := "*"
    );
  port(
    O : out STD_ULOGIC
    );
  attribute VITAL_LEVEL0 of X_TOC : entity is TRUE;
end X_TOC;

-- architecture body --


architecture X_TOC_V of X_TOC is
  attribute VITAL_LEVEL0 of X_TOC_V : architecture is TRUE;

begin

  --------------------
  --  BEHAVIOR SECTION
  --------------------

  ONE_SHOT : process
  begin
    if (TOC_WIDTH <= 0 ns) then
      O <= '0';
    else
      O <= '1',
           '0' after TOC_WIDTH;
    end if;
    wait;
  end process ONE_SHOT;


end X_TOC_V;

