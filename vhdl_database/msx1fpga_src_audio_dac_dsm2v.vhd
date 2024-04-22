-------------------------------------------------------------------------------
-- Title      : DAC_DSM2 - sigma-delta DAC converter with double loop
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dac_dsm2.vhd
-- Author     : Wojciech M. Zabolotny ( wzab[at]ise.pw.edu.pl )
-- Company    : 
-- Created    : 2009-04-28
-- Last update: 2009-04-29
-- Platform   : 
-- Standard   : VHDL'93c
-------------------------------------------------------------------------------
-- Description: Implementation with use of variables inside of process
-------------------------------------------------------------------------------
-- Copyright (c) 2009  - THIS IS PUBLIC DOMAIN CODE!!!
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009-04-28  1.0      wzab    Created
-------------------------------------------------------------------------------
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity dac_dsm2v is
	generic (
		nbits_g	: integer := 16
	);
	port (
		reset_i	: in  std_logic;
		clock_i	: in  std_logic;
		dac_i		: in  signed((nbits_g-1) downto 0);
		dac_o		: out std_logic
	);
end entity;
 
architecture beh1 of dac_dsm2v is

	signal del1_s, del2_s, d_q	: signed(nbits_g+2 downto 0) := (others => '0');
	constant c1_c					: signed(nbits_g+2 downto 0) := to_signed(1, nbits_g+3);
	constant c_1_c					: signed(nbits_g+2 downto 0) := to_signed(-1, nbits_g+3);

begin

	process (clock_i, reset_i)
		variable v1_v, v2_v : signed(nbits_g+2 downto 0) := (others => '0');
	begin
		if reset_i = '1' then
			del1_s <= (others => '0');
			del2_s <= (others => '0');
			dac_o  <= '0';
		elsif rising_edge(clock_i) then
			v1_v := dac_i - d_q + del1_s;
			v2_v := v1_v  - d_q + del2_s;
			if v2_v > 0 then
				d_q  <= shift_left(c1_c, nbits_g);
				dac_o <= '1';
			else
				d_q  <= shift_left(c_1_c, nbits_g);
				dac_o <= '0';
			end if;
			del1_s <= v1_v;
			del2_s <= v2_v;
		end if;
	end process;

end architecture;