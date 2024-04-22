-- This inserts a small delay into a bidirectional wire.
-- Used for simulation only.
--
-- Copyright: 2/28/01, Ben Cohen, Rev A.

library ieee;
use ieee.std_logic_1164.all;

entity wiredelay2 is
   generic (
      G_DELAY : time
   );
   port
   (
      A : inout std_logic;
      B : inout std_logic
   );
end entity WireDelay2;

architecture simulation of wiredelay2 is

begin

   p_ABC0_Lbl: process
      variable ThenTime_v : time;
   begin
      wait on A'transaction, B'transaction
      until ThenTime_v /= now;
      -- Break
      if A'active then
         wait for G_DELAY; -- wire delay
      else
         wait for G_DELAY;
      end if;
      ThenTime_v := now;
      A <= 'Z';
      B <= 'Z';
      wait for 0 ns;

      -- Make
      A <= B;
      B <= A;
   end process p_ABC0_Lbl;

end architecture simulation;

