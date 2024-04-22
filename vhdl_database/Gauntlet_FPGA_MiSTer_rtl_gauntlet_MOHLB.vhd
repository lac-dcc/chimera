--	(c) 2020 d18c7db(a)hotmail
--
--	This program is free software; you can redistribute it and/or modify it under
--	the terms of the GNU General Public License version 3 or, at your option,
--	any later version as published by the Free Software Foundation.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- For full details, see the GNU General Public License at www.gnu.org/licenses
--
-- Motion Object Horizontal Line Buffer

library ieee;
	use ieee.std_logic_1164.all;

entity MOHLB is
	port(
		I_MCKR				: in	std_logic;
		I_LMPDn				: in	std_logic;
		I_LDABn				: in	std_logic;
		I_BUFCLRn			: in	std_logic;

		I_HPOS				: in	std_logic_vector(8 downto 0);
		I_MOSR				: in	std_logic_vector(7 downto 0);

		O_MPX					: out	std_logic_vector(7 downto 0)
	);
end MOHLB;

architecture RTL of MOHLB is
	signal
		sl_FLBAn,
		sl_FLBBn,
		sl_2_3X8
								: std_logic := '1';
	signal
		slv_MPXA,
		slv_MPXB
								: std_logic_vector( 7 downto 0) := (others=>'1');
begin
	----------------------------------------
	-- sheet 13 Motion Object Line Buffer --
	----------------------------------------

	-- 5S latch
	p_5S : process
	begin
		wait until rising_edge(I_MCKR);
		sl_FLBBn <= (not sl_FLBBn) xor I_BUFCLRn;
	end process;

	sl_FLBAn <= not sl_FLBBn;

	-- gates 2/3X
	sl_2_3X8 <= ( not I_LMPDn ) or ( I_MOSR(3) and I_MOSR(2) and I_MOSR(1) and I_MOSR(0) );

	-- Line Buffer A
	u_LBA : entity work.LINEBUF
	port map (
		I_MCKR    => I_MCKR,
		I_BUFCLRn => I_BUFCLRn,
		I_LDn     => I_LDABn,
		I_FLBn    => sl_FLBAn,
		I_CSn     => sl_2_3X8,
		I_HPOS    => I_HPOS,
		I_MOSR    => I_MOSR,
		O_MPX     => slv_MPXA
	);

	-- Line Buffer B
	u_LBB : entity work.LINEBUF
	port map (
		I_MCKR    => I_MCKR,
		I_BUFCLRn => I_BUFCLRn,
		I_LDn     => I_LDABn,
		I_FLBn    => sl_FLBBn,
		I_CSn     => sl_2_3X8,
		I_HPOS    => I_HPOS,
		I_MOSR    => I_MOSR,
		O_MPX     => slv_MPXB
	);

	-- MPX bus mux
	O_MPX <= slv_MPXA when sl_FLBBn = '0' else slv_MPXB;
end RTL;
