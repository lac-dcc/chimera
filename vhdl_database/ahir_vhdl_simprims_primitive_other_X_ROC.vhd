-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_ROC.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Reset On Configuration
-- /___/   /\     Filename : X_ROC.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:19 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_ROC -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Primitives.all;

library IEEE;
use IEEE.VITAL_Timing.all;

-- entity declaration --
entity X_ROC is
  generic(
    LOC : string  := "UNPLACED";
    ROC_WIDTH : TIME := 100 ns;
    InstancePath: STRING := "*"
    );
  port(
    O : out STD_ULOGIC
    );
  attribute VITAL_LEVEL0 of X_ROC : entity is TRUE;
end X_ROC;

-- architecture body --



architecture X_ROC_V of X_ROC is
  attribute VITAL_LEVEL0 of X_ROC_V : architecture is TRUE;

begin

  --------------------
  --  BEHAVIOR SECTION
  --------------------
  ONE_SHOT : process
  begin

    if (ROC_WIDTH <= 0 ns) then
       assert FALSE report
       "*** Error: a positive value of WIDTH must be specified ***"
       severity failure;
    else
      O <= '1',
           '0' after ROC_WIDTH;
    end if;
    wait;

  end process ONE_SHOT;

end X_ROC_V;

