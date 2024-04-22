
--
-- Copyright (c) 2008-2015 Sytse van Slooten
--
-- Permission is hereby granted to any person obtaining a copy of these VHDL source files and
-- other language source files and associated documentation files ("the materials") to use
-- these materials solely for personal, non-commercial purposes.
-- You are also granted permission to make changes to the materials, on the condition that this
-- copyright notice is retained unchanged.
--
-- The materials are distributed in the hope that they will be useful, but WITHOUT ANY WARRANTY;
-- without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--

-- $Revision: 1.17 $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cpuregs is
   port(
      raddr : in std_logic_vector(5 downto 0);
      waddr : in std_logic_vector(5 downto 0);
      d : in std_logic_vector(15 downto 0);
      o : out std_logic_vector(15 downto 0);
      we : in std_logic;
      clk : in std_logic
   );
end cpuregs;

architecture implementation of cpuregs is

subtype mem_unit is std_logic_vector(15 downto 0);
type mem_type is array(15 downto 0) of mem_unit;
signal regs : mem_type := mem_type'(
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000"),
   mem_unit'("0000000000000000")
);

signal r_loc : std_logic_vector(3 downto 0);
signal w_loc : std_logic_vector(3 downto 0);

signal r0k : std_logic_vector(15 downto 0);
signal r1k : std_logic_vector(15 downto 0);
signal r2k : std_logic_vector(15 downto 0);
signal r3k : std_logic_vector(15 downto 0);
signal r4k : std_logic_vector(15 downto 0);
signal r5k : std_logic_vector(15 downto 0);
signal r6k : std_logic_vector(15 downto 0);
signal r6s : std_logic_vector(15 downto 0);
signal r6u : std_logic_vector(15 downto 0);

begin

   r0k <= regs(conv_integer(0));
   r1k <= regs(conv_integer(1));
   r2k <= regs(conv_integer(2));
   r3k <= regs(conv_integer(3));
   r4k <= regs(conv_integer(4));
   r5k <= regs(conv_integer(5));
   r6k <= regs(conv_integer(6));
   r6s <= regs(conv_integer(14));
   r6u <= regs(conv_integer(15));

   r_loc <=
      raddr(3 downto 0) when raddr(2 downto 1) /= "11" else                           -- kernel 0-5 loc 0-5, u 0-5 loc 8-13
      "0110" when raddr(2 downto 0) = "110" and raddr(5 downto 4) = "00" else         -- kernel sp loc 6
      "1110" when raddr(2 downto 0) = "110" and raddr(5 downto 4) = "01" else         -- super sp loc 14
      "1111" when raddr(2 downto 0) = "110" and raddr(5 downto 4) = "11" else         -- user sp loc 15
      "0111";                                                                         -- invalid

   w_loc <=
      waddr(3 downto 0) when waddr(2 downto 1) /= "11" else                           -- kernel 0-5 loc 0-5, u 0-5 loc 8-13
      "0110" when waddr(2 downto 0) = "110" and waddr(5 downto 4) = "00" else         -- kernel sp loc 6
      "1110" when waddr(2 downto 0) = "110" and waddr(5 downto 4) = "01" else         -- super sp loc 14
      "1111" when waddr(2 downto 0) = "110" and waddr(5 downto 4) = "11" else         -- user sp loc 15
      "0111";                                                                         -- invalid

   process(clk, we, w_loc, d)
   begin
      if clk = '1' and clk'event then
         if we = '1' and w_loc /= "0111" then
            regs(conv_integer(w_loc)) <= d;
         end if;
      end if;
   end process;

   process(r_loc, regs, raddr)
   begin
      if r_loc /= "0111" then
         o <= regs(conv_integer(r_loc));
      else
         o <= (others => '0');
      end if;
   end process;

end implementation;
