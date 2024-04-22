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
--	System Clock and Sync Generator (Atari custom chip 137419-103)
--	This SYNGEN was derived from System I SP-277 schematic

library ieee;
	use ieee.std_logic_1164.all;
--	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity SYNGEN is
	port(
		I_CK      : in  std_logic; -- 7.159MHz clock

		O_C0      : out std_logic := '0';
		O_C1      : out std_logic := '0';
		O_C2      : out std_logic := '0';
		O_LMPDn   : out std_logic := '0';
		O_VIDBn   : out std_logic; -- VIDBLANK
		O_VRESn   : out std_logic := '0';

		O_HSYNCn  : out std_logic;
		O_VSYNCn  : out std_logic;
		O_PFHSTn  : out std_logic;
		O_BUFCLRn : out std_logic := '0';

		O_HBLKn   : out std_logic;	-- HBLANK
		O_VBLKn   : out std_logic; -- VBLANK
		O_VSCK    : out std_logic := '0';
		O_CK0n    : out std_logic := '0'; -- pin  4 RCLOCK
		O_CK0     : out std_logic := '1'; -- pin 29 FCLOCK
		O_2HDLn   : out std_logic := '0';
		O_4HDLn   : out std_logic;
		O_4HDDn   : out std_logic;
		O_NXLn    : out std_logic;
		O_V       : out std_logic_vector(9 downto 0);
		O_H       : out std_logic_vector(9 downto 0)
	);
end SYNGEN;

architecture RTL of SYNGEN is
	signal
		sl_VSYNCn,
		sl_VEOLn
								: std_logic := '0';
	signal
		sl_VBLANKn,
		sl_4HDLn,
		sl_HBLANKn,
		sl_HSYNCn,
		sl_LMPDn,
		sl_NXLn,
		sl_BUFCLRn,
		sl_PFHSTn
								: std_logic := '1';
	signal
		slv_vcnt
								: std_logic_vector( 9 downto 0) := "0100000000"; --(others => '0');
	signal
		slv_hcnt
								: std_logic_vector( 9 downto 0) := (others => '0');
begin
	-- original resolution 336x240 visible, 456x261 total
	O_H        <= slv_hcnt;
	O_V        <= slv_vcnt;
	O_4HDLn    <= sl_4HDLn;
	O_HBLKn    <= sl_HBLANKn;
	O_VBLKn    <= sl_VBLANKn;
	O_VIDBn    <= sl_VBLANKn and sl_HBLANKn;
	O_NXLn     <= sl_NXLn;
	O_PFHSTn   <= sl_PFHSTn;
	O_LMPDn    <= sl_LMPDn;
	O_HSYNCn   <= sl_HSYNCn;
	O_VSYNCn   <= sl_VSYNCn;

	-- 520+104=624 by 520 visible pixels, total resolution 800x600, 4:3 aspect, 28.63636 MHz pixel clock, 35.796KHz line freq, 59.76Hz frames/s
	sl_NXLn    <= '0' when to_integer(unsigned(slv_hcnt)) = 799 else '1'; -- inits LINK register, marks start of each H line
	sl_VEOLn   <= '0' when to_integer(unsigned(slv_vcnt)) = 599 else '1'; -- resets vertical count
	sl_PFHSTn  <= '0' when to_integer(unsigned(slv_hcnt)) = 795 else '1'; -- loads PF H offset during /VSYNC and /VBLKN when 3H=1 and 4H=0 (mod 8)
	sl_LMPDn   <= '0' when to_integer(unsigned(slv_hcnt)) =   5 else '1'; -- enables /BUFCLR to clear HLB counters at start of each line when 421H =101 (mod 8)

	sl_VBLANKn <= '0' when to_integer(unsigned(slv_vcnt)) > 519 else '1'; --  V blanking
	sl_HBLANKn <= '0' when to_integer(unsigned(slv_hcnt)) <  10  or to_integer(unsigned(slv_hcnt)) > 10+(512+104)-2 else '1'; -- H blanking left/right

	sl_VSYNCn  <= '0' when to_integer(unsigned(slv_vcnt)) > 558 and to_integer(unsigned(slv_vcnt)) < 558+ 3 else '1'; -- V sync both +1 moves pic   up 1 pixel
	sl_HSYNCn  <= '0' when to_integer(unsigned(slv_hcnt)) > 697 and to_integer(unsigned(slv_hcnt)) < 697+32 else '1'; -- H sync last +1 moves pic left 1 pixel

-- pixel clock 28.636360 MHz, line freq 35.79545 KHz, frame rate 59.659 Hz
--                V stats                H stats
-- active video:   0..519  520 lines    10..624    615 pixels
--  front porch: 520..558   39 lines   625..697     73 pixels
--         sync: 559..560    2 lines   697..729     33 pixels
--   back porch: 561..599   39 lines   730..799..9  79 pixels
--        total:           600 lines               800 pixels

	-- H, V counters
	p_h_v_count : process
	begin
		wait until rising_edge(I_CK);
		sl_4HDLn <= not slv_hcnt(2); -- 4H delayed x1 inverted
		O_4HDDn  <= sl_4HDLn;        -- 4H delayed x2 inverted

		if sl_NXLn = '0' then
			slv_hcnt <= (others=>'0');
			if sl_VEOLn = '0' then
				slv_vcnt <= (others=>'0');
			else
				slv_vcnt <= slv_vcnt + 1;
			end if;
		else
			slv_hcnt <= slv_hcnt + 1;
		end if;
	end process;
end RTL;
