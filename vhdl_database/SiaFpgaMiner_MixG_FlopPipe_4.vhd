-- Copyright (c) 2017, Pedro Rivera, all rights reserved.
--
-- === MixG_FlopPipe_4.vhd ===
--
-- This is the G mixing algorithm of Blake2b.
-- This implementation is a full pipeline, meaning that it's capable of having
-- data pushed in on every clock-cycle, therefore outputing results on every
-- tick as well. What makes it tricky to implement is that the result for every
-- one of the 4 steps is needed 2 steps later. To achieve this we need to push 
-- the result of every operation in a 2-element FIFO. This implementation uses
-- FF registers to do the job.
-- The X and Y inputs dont't need buffering since they are constant during a 
-- given block-time. Message(4) (nonce) is the only dynamic part, fed by the
-- nonce counters external to this file.

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity MixG_FlopPipe_4 is
  port(
    Clk   : in  std_logic;
    A_in  : in  unsigned(63 downto 0);
    B_in  : in  unsigned(63 downto 0);
    C_in  : in  unsigned(63 downto 0);
    D_in  : in  unsigned(63 downto 0);
    X     : in  unsigned(63 downto 0);
    Y     : in  unsigned(63 downto 0);
    A_out : out unsigned(63 downto 0);
    B_out : out unsigned(63 downto 0);
    C_out : out unsigned(63 downto 0);
    D_out : out unsigned(63 downto 0)
  );
end MixG_FlopPipe_4;

architecture rtl of MixG_FlopPipe_4 is
  signal A0, A1, A2, A3 : unsigned(63 downto 0) := (others => '0');
  signal B0, B1, B2, B0_in : unsigned(63 downto 0) := (others => '0');
  signal C0, C1, C2, C3 : unsigned(63 downto 0) := (others => '0');
  signal D0, D1, D2, D3 : unsigned(63 downto 0) := (others => '0');
begin

  Mix: process(Clk) -- No Reset per Xilinx recommendation
    variable A, C : unsigned(63 downto 0) := (others => '0');
  begin  
    if rising_edge(Clk) then
      -- B_in is the only vector that's used right away but
      -- still needs to be preserved for use 2 clocks later.
      B0_in <= B_in;
      -- Step 1
      A  := A_in + B_in + X;
      A0 <= A;
      D0 <= (D_in xor A) ror 32;
      -- Step 2
      C  := C_in + D0;
      C0 <= C;
      B0 <= (B0_in xor C) ror 24;
      -- Buffering
      A1 <= A0;
      B1 <= B0;
      D1 <= D0;
      C1 <= C0;
      -- Step 3
      A  := A1 + B0 + Y; -- Y is assumed to be fed already delayed
      A2 <= A;
      D2 <= (D1 xor A) ror 16;
      -- Step 4
      C  := C1 + D2;
      C2 <= C;
      B2 <= (B1 xor C) rol 1;

      -- These last FIFO flops could be  implemented outside for flexibility
      -- (consider last round). There is no B because it is buffered in by
      -- the next MixG on the pipeline.
      A3 <= A2;
      C3 <= C2;
      D3 <= D2;
      
    end if;
  end process;

  A_out <= A3;
  B_out <= B2; -- B2 is the last
  C_out <= C3;
  D_out <= D3;

end rtl;
