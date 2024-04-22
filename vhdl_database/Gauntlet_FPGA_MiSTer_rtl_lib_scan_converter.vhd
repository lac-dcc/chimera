--	(c) 2012 d18c7db(a)hotmail
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

--------------------------------------------------------------------------------
-- Video scan converter - works with active negative input sync signals
--

-- _____________              _____________________              ____________________
-- VIDEO (last) |____________|        VIDEO        |____________|        VIDEO (next)
-- --V----------|-F-|-S-|--B-|----------V----------|-F-|-S-|--B-|----------V---------
-- _________________|   |______________________________|   |_________________________
--  SYNC            |___|              SYNC            |___|              SYNC

------------------------------------------------------------------------------------------------------------------
-- HORIZONTAL   - Line       | Pixel      | Front     | HSYNC      | Back       | Active     | HSYNC    | Total  |
-- Resolution   - Rate       | Clock      | Porch (F) | Pulse (S)  | Porch (B)  | Video (V)  | Polarity | Pixels |
------------------------------------------------------------------------------------------------------------------
--  VGA 640x480 - 31468.75Hz | 25.175 MHz | 16 pixels |  96 pixels |  48 pixels | 640 pixels | negative | 800    |
------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------
-- VERTICAL     - Frame      | Pixel      | Front     | VSYNC      | Back       | Active     | VSYNC    | Total  |
-- Resolution   - Rate       | Clock      | Porch (F) | Pulse (S)  | Porch (B)  | Video (V)  | Polarity | Pixels |
------------------------------------------------------------------------------------------------------------------
--  VGA 640x480 - 59.94Hz    | 25.175 MHz | 10 lines  | 2 lines    | 33 lines   | 480 lines  | negative | 525    |
------------------------------------------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

--pragma translate_off
	use ieee.std_logic_textio.all;
	use std.textio.all;
--pragma translate_on

entity VGA_SCANCONV is
	generic (
		vstart		: integer range 0 to 1023 := 127;	-- start  of active video
		vlength		: integer range 0 to 1023 := 256;	-- length of active video

		hF				: integer range 0 to 1023 :=   8;	-- h front porch
		hS				: integer range 0 to 1023 :=  45;	-- h sync
		hB				: integer range 0 to 1023 :=  23;	-- h back porch
		hV				: integer range 0 to 1023 := 256;	-- visible video
		hpad			: integer range 0 to 1023 :=  26;	-- H black border

		vF				: integer range 0 to 1023 :=  35;	-- v front porch
		vS				: integer range 0 to 1023 :=   2;	-- v sync
		vB				: integer range 0 to 1023 :=  35;	-- v back porch
		vV				: integer range 0 to 1023 := 226;	-- visible video
		vpad			: integer range 0 to 1023 :=   0		-- V black border
	);
	port (
		I_VIDEO				: in  std_logic_vector(15 downto 0);
		I_HSYNC				: in  std_logic;
		I_VSYNC				: in  std_logic;
		--
		O_VIDEO				: out std_logic_vector(15 downto 0);
		O_HSYNC				: out std_logic;
		O_VSYNC				: out std_logic;
		O_CMPBLK_N			: out std_logic;
		--
		CLK					: in  std_logic;
		CLK_x2				: in  std_logic
	);
end;

architecture RTL of VGA_SCANCONV is
	signal
		ihsync,
		ivsync,
		ihsync_last,
		ivsync_last,
		cmpblk_n,
		alt,
		ovsync,
		ovsync_last,
		ohsync
								: std_logic := '1';
	signal
		hpos_i,
		hpos_o
								: std_logic_vector(8 downto 0) := (others => '0');
	signal
		RDADDR,
		WRADDR
								: std_logic_vector(9 downto 0) := (others => '0');
	signal
		ivideo,
		ovideo
								: std_logic_vector(15 downto 0) := (others => '0');

	signal vcnto			: integer range 0 to 1023 := 0;
	signal hcnto			: integer range 0 to 1023 := 0;
	signal hcnti			: integer range 0 to 1023 := 0;

	type RAM_ARRAY_1Kx16 is array (0 to 1023) of std_logic_vector(15 downto 0);
	signal DPRAM : RAM_ARRAY_1Kx16:=(others=>(others=>'0'));

	-- Ask Xilinx synthesis tools to use block RAMs if possible
	attribute ram_style : string;
	attribute ram_style of DPRAM : signal is "block";
	-- Ask Quartus synthesis tools to use block RAMs if possible
	attribute ramstyle : string;
	attribute ramstyle of DPRAM : signal is "M10K";

begin
	ivideo <= I_VIDEO;

	-- simple dual port RAM (read port)
	p_SDP_RAM_RD : process
	begin
		wait until falling_edge(CLK_x2);
		ovideo <= DPRAM(to_integer(unsigned(RDADDR)));
	end process;

	-- simple dual port RAM (write port)
	p_SDP_RAM_WR : process
	begin
		wait until rising_edge(CLK_x2);
		if CLK = '1' then
			DPRAM(to_integer(unsigned(WRADDR))) <= ivideo;
		end if;
	end process;

	O_VIDEO		<= ovideo;
	O_HSYNC		<= ohsync;
	O_VSYNC		<= ovsync;
	O_CMPBLK_N	<= cmpblk_n;
	RDADDR		<= (not alt) & hpos_o;
	WRADDR		<=      alt  & hpos_i;

	ihsync		<= I_HSYNC;
	ivsync		<= I_VSYNC;

	-- edge transition helper signals
	p_det_egdes : process
	begin
		wait until rising_edge(CLK_x2);
		ihsync_last <= ihsync;
		ivsync_last <= ivsync;
		ovsync_last <= ovsync;
	end process;

	-------------------------
	-- Input Video Section
	-------------------------

	-- horizontal master counter for input video, reset on falling edge of HSYNC
	p_hcounter : process
	begin
		wait until rising_edge(CLK_x2);
		if (ihsync_last = '1') and (ihsync = '0') then
			hcnti <= 0;
		elsif CLK = '0' then
			hcnti <= hcnti + 1;
		end if;
	end process;

	-- memory selector for double buffering, half the memory is written to while
	-- the other half is read out at double speed, then the two halves are swapped
	p_memsel : process
	begin
		wait until rising_edge(CLK_x2);
		-- start of active input video configurable for dumb misaligned HSYNC signals
		if CLK = '0' then
			if hcnti = 0 then
				alt <= not alt;
			end if;
		end if;
	end process;

	-- increment RAM write position during HSYNC active video portion only
	p_ram_in : process
	begin
		wait until rising_edge(CLK_x2);
		if CLK = '0' then
			if (hcnti > 0) and (hcnti < vstart) then
				hpos_i <= (others => '0');
			else
				hpos_i <= hpos_i + 1;
			end if;
		end if;
	end process;

	-------------------------
	-- Output Video Section
	-------------------------

	-- VGA H and V counters, synchronized to input frame V sync, then H sync
	p_out_ctrs : process
		variable trigger : boolean;
	begin
		wait until rising_edge(CLK_x2);
		if (ivsync_last = '1') and (ivsync = '0') then
			trigger := true;
		end if;

		if trigger and ihsync = '0' then
			trigger := false;
			hcnto <= 0;
			vcnto <= 0;
		else
			if hcnto = (hF+hS+hB+hV+hpad+hpad-1) then
				hcnto <= 0;
				vcnto <= vcnto + 1;
			else
				hcnto <= hcnto + 1;
			end if;
		end if;
	end process;

	-- generate output HSYNC
	p_gen_hsync : process
	begin
		wait until rising_edge(CLK_x2);
		-- H sync timing
		if (hcnto < hS) then
			ohsync <= '0';
		else
			ohsync <= '1';
		end if;
	end process;

	-- generate output VSYNC
	p_gen_vsync : process
	begin
		wait until rising_edge(CLK_x2);
		-- V sync timing
		if (vcnto >= vF) and (vcnto < vF+vS) then
			ovsync <= '0';
		else
			ovsync <= '1';
		end if;
	end process;

	-- generate active output video
	p_gen_active_vid : process
	begin
		wait until rising_edge(CLK_x2);
		-- if hcnto within the visible video area
		if ((hcnto >= (hF + hS + hB + hpad)) and (hcnto < (hF + hS + hB + hV + hpad))) then
			hpos_o <= hpos_o + 1;
		else
			hpos_o <= (others => '0');
		end if;
	end process;

	-- generate blanking signal including additional borders to pad the input signal to standard VGA resolution
	p_gen_blank : process
	begin
		wait until rising_edge(CLK_X2);
		-- active video area after padding with blank borders
		if ((hcnto >= (hS + hB)) and (hcnto < (hS + hB + hV + 2*hpad))) and ((vcnto > 2*(vS + vB)) and (vcnto <= 2*(vS + vB + vV + 2*vpad))) then
			cmpblk_n <= '1';
		else
			cmpblk_n <= '0';
		end if;
	end process;

-- this section below between pragma translate_off - translate_on is not synthesizeable
--	used for debuging during simulation to write video frames to output bitmap files
--	pragma translate_off

	-- this process dumps the input of the scan converter to a .ppm file
	p_bmp_in : entity work.bmp_out
	generic map ( FILENAME => "BI" )
	port map (
		clk_i               => CLK,
		dat_i(23 downto 20) => ivideo(11 downto 8),
		dat_i(19 downto 16) => x"0",
		dat_i(15 downto 12) => ivideo( 7 downto 4),
		dat_i(11 downto  8) => x"0",
		dat_i( 7 downto  4) => ivideo( 3 downto 0),
		dat_i( 3 downto  0) => x"0",
		hs_i            => ihsync,
		vs_i            => ivsync
	);

	-- this process dumps the output of the scan converter to a .ppm file
	-- p_bmp_out : entity work.bmp_out
	-- generic map ( FILENAME => "BO" )
	-- port map (
		-- clk_i               => CLK_x2,
		-- dat_i(23 downto 20) => ovideo(11 downto 8),
		-- dat_i(19 downto 16) => x"0",
		-- dat_i(15 downto 12) => ovideo( 7 downto 4),
		-- dat_i(11 downto  8) => x"0",
		-- dat_i( 7 downto  4) => ovideo( 3 downto 0),
		-- dat_i( 3 downto  0) => x"0",
		-- hs_i            => ohsync,
		-- vs_i            => ovsync
	-- );
--	pragma translate_on
end architecture RTL;
