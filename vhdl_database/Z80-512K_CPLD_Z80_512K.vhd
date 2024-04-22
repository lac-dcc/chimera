--------------------------------------------------------------------------
-- Z80_512K.vhd - Top-level design file for Z80-512K project
--		Zeta SBC V2 compatible memory mapper
--		Clock divider
--		Watchdog control
--		I/O address decode logic
--------------------------------------------------------------------------
-- Compiles with Quartus II 13.0sp1
--
-- Copyright (C) 2020 - 2021 Sergey Kiselev.
-- Provided for hobbyist use on the Z80-512K and Tiny Z80 modules.
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity z80_512k is
	port(
		a 			: in std_logic_vector(7 downto 0);		-- A[7..0] - address input for I/O decode
		a_hi		: in std_logic_vector(15 downto 14);	-- A[15..14] - address input for memory page select
		d			: inout std_logic_vector(5 downto 0);	-- D[5..0] - data input/output
		m1_n		: in std_logic;								-- M1 - machine cycle 1 signal from Z80 (active low)
		iorq_n	: in std_logic;								-- IORQ - I/O request signal from Z80 (active low)
		mreq_n	: in std_logic;								-- MREQ - memory request signal from Z80 (active low)
		wr_n		: in std_logic;								-- WR - write signal from Z80 (active low)
		rd_n		: in std_logic;								-- RD - read signal from Z80 (active low)
		wdog_led	: out std_logic;								-- WDOG - output for resetting the watchdog and driving the LED
 		rst_n		: in std_logic;								-- RESET - reset input, disables memory paging, watchdog
																		-- and sets divisor value to '1' (active low)
		rom_cs_n	: out std_logic;								-- ROM_CS - ROM chip select output (active low)
		ram_cs_n	: out std_logic;								-- RAM_CS - RAM chip select output (active low)
		cpu_clk	: in std_logic;								-- CPU_CLK - clock input for the frequency divider
		uart_clk	: buffer std_logic;							-- UART_CLK - clock output for the frequency divider
		ma			: out std_logic_vector(18 downto 14)	-- MA[18..14] - address output from memory page register
	);
	-- Page Registers addresses are 0x78-0x7B = 011110xx
	constant page_reg_addr : std_logic_vector(7 downto 2) := "011110";
	-- Paging Enable register address is 0x7C = 01111100
	constant page_ena_addr : std_logic_vector(7 downto 0) := "01111100";
	-- Watchdog address is 0x6F = 01101111
	constant watchdog_addr : std_logic_vector(7 downto 0) := "01101111";
	-- LED address is 0x6E = 01101110
	constant led_addr : std_logic_vector(7 downto 0) := "01101110";
	-- Configuration register address is 0x6D = 01101101
	constant config_reg_addr : std_logic_vector(7 downto 0) := "01101101";
end z80_512k;

architecture behavioral of z80_512k is
	signal io_wr 			: std_logic;							-- I/O write request (M1 = '1' and IORQ = '0' and WR = '0')
	signal io_rd 			: std_logic;							-- I/O read request (M1 = '1' and IORQ = '0' and RD = '0')
	signal page_ena_wr	: std_logic;							-- Enable write to paging enable register
	signal page_ena		: std_logic;							-- Page enable register output (1 - paging enabled)
	signal page_reg_wr	: std_logic;							-- Enable write to page registers
	signal watchdog_wr	: std_logic;							-- Enable write to watchdog
	signal watchdog		: std_logic;							-- Watchdog output
	signal led_wr			: std_logic;							-- Enable write to LED register
	signal led				: std_logic;							-- LED register output
	signal config_sel		: std_logic;							-- Select signal for the configuration register
	signal config_wr		: std_logic;							-- Enable write to the configuration register
	signal config_rd		: std_logic;							-- Enable read from the configuration register
	signal config			: std_logic_vector(5 downto 0);	-- Configuration register
	signal pa				: std_logic_vector(19 downto 14);-- Internal memory page register output
	signal m1_divide_1_out	: std_logic;
	signal m1_divide_2_out	: std_logic;
	-- D flip-flop with reset
	component d_ff_rst
		port(
			d			: in std_logic;
			clk		: in std_logic;
			rst_n		: in std_logic;
			q			: out std_logic
		);
	end component;
	-- 6-bit D flip-flop register with reset
	component register_6
		port(
			d			: in std_logic_vector (5 downto 0);
			clk		: in std_logic;
			rst_n		: in std_logic;
			q			: out std_logic_vector (5 downto 0)
		);
	end component;
	-- Frequency divider
	component uart_freq_divider
		port(
			divisor	: in std_logic_vector(4 downto 0);
			clk_in	: in std_logic;
			clk_out	: out std_logic
		);
	end component;
	-- 4x6 memory page register with read enable (q is "000000" when rden = '0')
	component page_reg_4x6
		port(
			data			: in std_logic_vector (5 downto 0);
			rdaddress	: in std_logic_vector (1 downto 0);
			wraddress	: in std_logic_vector (1 downto 0);
			wren			: in std_logic  := '0';
			rden			: in std_logic  := '0';
			q				: out std_logic_vector (5 downto 0)
		);
	end component;
	component divide_by_2
		port(
			carry_in		: in std_logic;
			clk			: in std_logic;
			carry_out	: out std_logic;
			q				: out std_logic
		);	
	end component;
begin
	-- I/O address decode - generate I/O read and write signals
	io_wr <= '1' when m1_n = '1' and iorq_n = '0' and wr_n = '0' else '0';
	io_rd <= '1' when m1_n = '1' and iorq_n = '0' and rd_n = '0' else '0';
	page_reg_wr <= '1' when io_wr = '1' and a(7 downto 2) = page_reg_addr else '0';
	page_ena_wr <= '1' when io_wr = '1' and a = page_ena_addr else '0';
	watchdog_wr <= '1' when io_wr = '1' and a = watchdog_addr else '0';
	led_wr <= '1' when io_wr = '1' and a = led_addr else '0';
	config_sel <= '1' when a = config_reg_addr else '0';
	config_wr <= '1' when io_wr = '1' and config_sel = '1' else '0';
	config_rd <= '1' when io_rd = '1' and config_sel = '1' else '0';
	
	-- Configuration register
	config_reg : register_6 port
		map(
			d => d,
			clk => config_wr,
			rst_n => rst_n,
			q => config
		);

	-- Configuration register read
	d <= config when config_rd = '1' else "ZZZZZZ";

	-- Freqency divider
	freq_divider : uart_freq_divider port
		map(
			divisor => config(4 downto 0),
			clk_in => cpu_clk,
			clk_out => uart_clk
		);

	-- Paging enable register
	page_ena_ff : d_ff_rst port
		map(
			d => d(0),
			clk => page_ena_wr,
			rst_n => rst_n,
			q => page_ena
		);
	
	-- LED register
	led_ff : d_ff_rst port
		map(
			d => d(0),
			clk => led_wr,
			rst_n => rst_n,
			q => led
		);

	-- Watchdog
	
	-- Divide M1 frequency, otherwise the LED will be too bright
	m1_divide_1: divide_by_2 port
		map(
			carry_in => not m1_n,
			clk => cpu_clk,
			carry_out => m1_divide_1_out
		);

	m1_divide_2: divide_by_2 port
		map(
			carry_in => m1_divide_1_out,
			clk => cpu_clk,
			carry_out => m1_divide_2_out
		);
	
	-- Output M1 if watchdog is disable, otherwise pulse watchdog on watchdog write
	watchdog <= m1_divide_2_out when config(5) = '0' else
					'1' when config(5) = '1' and watchdog_wr = '1' else
					'0';


	-- Watchdog / LED output pin
	wdog_led <= watchdog xor led;

	-- Page register
	page_reg : page_reg_4x6 port
		map(
			data => d,
			rdaddress => a_hi,
			wraddress => a(1 downto 0),
			wren => page_reg_wr,
			rden => page_ena,
			q => pa
		);

	-- Output page register address bits 18-14 to MA[18..14]
	ma <= pa(18 downto 14);

	-- Memory chip select
	-- select either ROM or RAM depending on the PA[19] value 
	rom_cs_n <= '0' when pa(19) = '0' and mreq_n = '0' else '1';
	ram_cs_n <= '0' when pa(19) = '1' and mreq_n = '0' else '1';

end behavioral;
