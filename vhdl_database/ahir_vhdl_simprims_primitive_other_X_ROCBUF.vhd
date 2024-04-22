-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_ROCBUF.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Reset On Configuration Buffer
-- /___/   /\     Filename : X_ROCBUF.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:19 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_ROCBUF -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Primitives.all;

library IEEE;
use IEEE.VITAL_Timing.all;

-- entity declaration --
entity X_ROCBUF is
  generic(
    LOC : string  := "UNPLACED";
    ROC_WIDTH : TIME := 100 ns;
    InstancePath: STRING := "*"
    );
  port(
    I : in STD_ULOGIC;
    O : out STD_ULOGIC
    );
  attribute VITAL_LEVEL0 of X_ROCBUF : entity is TRUE;
end X_ROCBUF;

-- architecture body --


architecture X_ROCBUF_V of X_ROCBUF is
  attribute VITAL_LEVEL0 of X_ROCBUF_V : architecture is TRUE;

  signal O_int : std_ulogic;

begin

  --------------------
  --  BEHAVIOR SECTION
  --------------------
  process (I)
  begin

    if (ROC_WIDTH <= 0 ns) then
      assert FALSE report
      "*** Error: a positive value of WIDTH must be specified ***"
      severity failure;

    elsif (I'event) then
      O_int <= I;

    elsif (now < ROC_WIDTH) then
      O_int <= 'H',
               'L' after ROC_WIDTH;

    end if;

  end process;
   
  process (O_int)
  begin

    if(O_int = 'L') then
       O <= '0';
    elsif(O_int = 'H') then
       O <= '1';
    else
       O <= O_int;
    end if;
        
  end process;

end X_ROCBUF_V;

