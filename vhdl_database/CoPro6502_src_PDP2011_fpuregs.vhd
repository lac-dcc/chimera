
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

-- $Revision: 1.15 $

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity fpuregs is
   port(
      raddr : in std_logic_vector(2 downto 0);
      waddr : in std_logic_vector(2 downto 0);
      d : in std_logic_vector(63 downto 0);
      o : out std_logic_vector(63 downto 0);
      fpmode : in std_logic;
      we : in std_logic;
      clk : in std_logic
   );
end fpuregs;

architecture implementation of fpuregs is

subtype fp_unit is std_logic_vector(15 downto 0);
type fp_type is array(5 downto 0) of fp_unit;
signal fpreg1 : fp_type := fp_type'(
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000")
);
signal fpreg2 : fp_type := fp_type'(
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000")
);
signal fpreg3 : fp_type := fp_type'(
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000")
);
signal fpreg4 : fp_type := fp_type'(
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000"),
   fp_unit'("0000000000000000")
);

signal r_loc : std_logic_vector(2 downto 0);
signal w_loc : std_logic_vector(2 downto 0);

signal ac0 : std_logic_vector(63 downto 0);
signal ac1 : std_logic_vector(63 downto 0);
signal ac2 : std_logic_vector(63 downto 0);
signal ac3 : std_logic_vector(63 downto 0);
signal ac4 : std_logic_vector(63 downto 0);
signal ac5 : std_logic_vector(63 downto 0);


begin

   ac0 <= fpreg1(conv_integer("0")) & fpreg2(conv_integer("0")) & fpreg3(conv_integer("0")) & fpreg4(conv_integer("0"));
   ac1 <= fpreg1(conv_integer("1")) & fpreg2(conv_integer("1")) & fpreg3(conv_integer("1")) & fpreg4(conv_integer("1"));
   ac2 <= fpreg1(conv_integer("10")) & fpreg2(conv_integer("10")) & fpreg3(conv_integer("10")) & fpreg4(conv_integer("10"));
   ac3 <= fpreg1(conv_integer("11")) & fpreg2(conv_integer("11")) & fpreg3(conv_integer("11")) & fpreg4(conv_integer("11"));
   ac4 <= fpreg1(conv_integer("100")) & fpreg2(conv_integer("100")) & fpreg3(conv_integer("100")) & fpreg4(conv_integer("100"));
   ac5 <= fpreg1(conv_integer("101")) & fpreg2(conv_integer("101")) & fpreg3(conv_integer("101")) & fpreg4(conv_integer("101"));

   r_loc <= raddr;
   w_loc <= waddr;

   process(clk, we, w_loc, d, fpmode)
   begin
      if clk = '1' and clk'event then
         if we = '1' and w_loc(2 downto 1) /= "11" then
            if fpmode = '1' then
               fpreg1(conv_integer(w_loc)) <= d(63 downto 48);
               fpreg2(conv_integer(w_loc)) <= d(47 downto 32);
               fpreg3(conv_integer(w_loc)) <= d(31 downto 16);
               fpreg4(conv_integer(w_loc)) <= d(15 downto 0);
            else
               fpreg1(conv_integer(w_loc)) <= d(63 downto 48);
               fpreg2(conv_integer(w_loc)) <= d(47 downto 32);
            end if;
         end if;
      end if;
   end process;

   process(r_loc, fpreg1, fpreg2, fpreg3, fpreg4, fpmode)
   begin
      if r_loc(2 downto 1) /= "11" then
         if fpmode = '1' then
            o <= fpreg1(conv_integer(r_loc)) & fpreg2(conv_integer(r_loc)) & fpreg3(conv_integer(r_loc)) & fpreg4(conv_integer(r_loc));
         else
            o <= fpreg1(conv_integer(r_loc)) & fpreg2(conv_integer(r_loc)) & "00000000000000000000000000000000";
         end if;
      else
         o <= "0000000000000000000000000000000000000000000000000000000000000000";
      end if;
   end process;

end implementation;
