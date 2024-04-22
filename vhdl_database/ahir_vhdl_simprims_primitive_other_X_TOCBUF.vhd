-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_TOCBUF.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Three-State on Configuration Buffer
-- /___/   /\     Filename : X_TOCBUF.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:20 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_TOCBUF -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Primitives.all;

library IEEE;
use IEEE.VITAL_Timing.all;

-- entity declaration --
entity X_TOCBUF is
  generic(
    LOC : string  := "UNPLACED";
    TOC_WIDTH : TIME := 0 ns;
    InstancePath: STRING := "*"
    );
  port(
    I : in STD_ULOGIC;
    O : out STD_ULOGIC
    );
  attribute VITAL_LEVEL0 of X_TOCBUF : entity is TRUE;
end X_TOCBUF;

-- architecture body --



architecture X_TOCBUF_V of X_TOCBUF is
  attribute VITAL_LEVEL0 of X_TOCBUF_V : architecture is TRUE;

  signal O_int : std_ulogic;

begin

  --signal O_int : std_ulogic;
  --------------------
  --  BEHAVIOR SECTION
  --------------------
  process (I)
  begin

    if (TOC_WIDTH <= 0 ns) then
      O_int <= 'L';
    end if;

    if (I'event) then
      O_int <= I;
    elsif (now < TOC_WIDTH) then
      O_int <= 'H',
               'L' after TOC_WIDTH;
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

end X_TOCBUF_V;
