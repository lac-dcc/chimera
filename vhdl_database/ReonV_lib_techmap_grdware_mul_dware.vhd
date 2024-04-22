------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------
-- Entity: 	misc
-- File:	mul_dware.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Dware multipliers
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library Dware;
use DWARE.DWpackages.all;
use DWARE.DW_Foundation_comp_arith.all;

entity mul_dw is
    generic ( 
         a_width       : positive := 2;                      -- multiplier word width
         b_width       : positive := 2;                      -- multiplicand word width
         num_stages    : positive := 2;                 -- number of pipeline stages
         stall_mode    : natural range 0 to 1 := 1      -- '0': non-stallable; '1': stallable
    );   
    port(a       : in std_logic_vector(a_width-1 downto 0);  
         b       : in std_logic_vector(b_width-1 downto 0);
         clk     : in std_logic;     
         en      : in std_logic;     
         sign    : in std_logic;     
         product : out std_logic_vector(a_width+b_width-1 downto 0));
end;

architecture rtl of mul_dw is
  
component DW02_mult
   generic( A_width: NATURAL;		-- multiplier wordlength
            B_width: NATURAL);		-- multiplicand wordlength
   port(A : in std_logic_vector(A_width-1 downto 0);  
        B : in std_logic_vector(B_width-1 downto 0);
        TC : in std_logic;		-- signed -> '1', unsigned -> '0'
        PRODUCT : out std_logic_vector(A_width+B_width-1 downto 0));
end component;

  signal gnd       : std_ulogic;
  
begin

  gnd <= '0';

  np : if num_stages = 1 generate
    u0 : DW02_mult
      generic map ( a_width => a_width, b_width => b_width)
      port map (a => a, b => b, TC => sign, product => product);
  end generate;

  pipe : if num_stages > 1 generate
    u0 : DW_mult_pipe
      generic map ( a_width => a_width, b_width => b_width,
	num_stages => num_stages, stall_mode => stall_mode, rst_mode => 0)
      port map (a => a, b => b, TC => sign, clk => clk, product => product,
	rst_n => gnd, en => en);
  end generate;

end;

library ieee;
use ieee.std_logic_1164.all;
library Dware;
use DWARE.DWpackages.all;
use DWARE.DW_Foundation_comp_arith.all;


entity dw_mul_61x61 is
    port(A       : in std_logic_vector(60 downto 0);  
         B       : in std_logic_vector(60 downto 0);
         CLK     : in std_logic;     
         PRODUCT : out std_logic_vector(121 downto 0));
end;

architecture rtl of dw_mul_61x61 is
  
  signal gnd       : std_ulogic;
  signal pin, p  : std_logic_vector(121 downto 0);
  
begin
  gnd <= '0';
--  u0 : DW02_mult_2_stage
--    generic map ( A_width => A'length,   B_width => B'length  )
--    port map ( A => A,   B => B,   TC => gnd,  CLK => CLK,   PRODUCT => pin );

  u0 : DW_mult_pipe
      generic map ( a_width => 61, b_width => 61,
	num_stages => 2, stall_mode => 0, rst_mode => 0)
      port map (a => a, b => b, TC => gnd, clk => clk, product => pin,
	rst_n => gnd, en => gnd);

  reg0 : process(CLK)
  begin
    if rising_edge(CLK) then
      p <= pin;
    end if;    
  end process;

  PRODUCT <= p;
  
end;

