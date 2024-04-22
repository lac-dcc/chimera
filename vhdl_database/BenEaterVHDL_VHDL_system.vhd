--
-- Based on Ben Eater's build of the SAP breadboard computer and his excellent videos.
-- https://eater.net/
--
-- Copyright (c) 2017 Ken Jordan
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY system IS
	generic
	(
		C_SYSTEM_HZ	:	integer := 12_000_000;	-- master clock (in Hz)
		C_BPS		:	integer := 9600;
		C_AUTOBAUD	:	boolean := false;		-- use RX bit interval to set baud rate
		C_TRACE		:	boolean := true
	);
	PORT(
		clk_i		: IN	STD_LOGIC;
		clk_en_i	: IN	STD_LOGIC;
		rst_i		: IN	STD_LOGIC;
		out_o		: OUT	STD_LOGIC_VECTOR(7 downto 0);
		halt_o		: OUT	STD_LOGIC;
		tx_o		: OUT	STD_LOGIC;
		rx_i		: IN	STD_LOGIC
	);
END system;

ARCHITECTURE RTL OF system IS

	SIGNAL	rst		: STD_LOGIC := '0';				-- asynchronous reset
	SIGNAL	clk		: STD_LOGIC := '0';				-- CPU clock
	SIGNAL	clk_en	: STD_LOGIC := '0';				-- CPU clock enable (clock ignored if 0)

	SIGNAL	ram_we			: STD_LOGIC := '0';
	SIGNAL	ram_addr		: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	SIGNAL	data_ram_to_cpu : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	SIGNAL	data_cpu_to_ram : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	SIGNAL	halt			: STD_LOGIC := '0';
	
	SIGNAL	cpu_debug_sel	: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	SIGNAL	cpu_debug_out	: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

	SIGNAL	tx_busy			: STD_LOGIC := '0';
	SIGNAL	tx_write		: STD_LOGIC := '0';
	SIGNAL	tx_data			: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

	SIGNAL	trace_busy		: STD_LOGIC := '0';
BEGIN

	-- internal signals
	rst		<= rst_i;
	clk		<= clk_i;
	clk_en	<= clk_en_i AND (NOT trace_busy);
	
	-- instantiate CPU
	CPU: entity work.cpu
	port map(
		clk_i		=> clk, 
		clk_en_i	=> clk_en,
		rst_i		=> rst,
		ram_data_i	=> data_ram_to_cpu,
		ram_data_o	=> data_cpu_to_ram,
		ram_addr_o	=> ram_addr,
		ram_write_o => ram_we,
		hlt_o		=> halt,
		out_val_o	=> out_o,
		debug_sel_i => cpu_debug_sel,	-- CPU debug register select
		debug_out_o => cpu_debug_out	-- CPU debug register data
	);
	halt_o		<= halt;

	-- instantiate RAM
	-- NOTE: FPGA BRAM is clocked, not asynchronous.  So we clock it on falling edge (so data will be ready for CPU on next rising edge).
	bram: entity work.ram
	generic map(
		addrwidth	=>	4,
		datawidth	=>	8
	)
	port map(
		clk_i		=> clk, 
		we_i		=> ram_we,	
		addr_i		=> ram_addr,
		write_i		=> data_cpu_to_ram,
		read_o		=> data_ram_to_cpu
	);

	-- simple "command processor" to print CPU state trace as text via serial
	DOTRACE: if (C_TRACE) generate
	TRACE: entity work.cpu_trace
	port map (
		clk_i		=> clk,
		clk_en_i	=> clk_en,	
		rst_i		=> rst,
		halt_i		=> halt,
		busy_o		=> trace_busy,
		tx_busy_i	=> tx_busy,
		tx_write_o	=> tx_write,
		tx_data_o	=> tx_data,
		debug_sel_o => cpu_debug_sel,	-- CPU debug register select
		debug_val_i => cpu_debug_out	-- CPU debug register data
	);

	-- simple transmit only serial UART for CPU trace output
	UART: entity work.tx_uart
	generic map(
		C_SYSTEM_HZ => C_SYSTEM_HZ,
		C_BPS		=> C_BPS,			-- baud rate (8-bit, no parity, 1 stop bit)
		C_AUTOBAUD	=> C_AUTOBAUD
	)
	port map(
		rst_i	=>	rst,				-- reset
		clk_i	=>	clk,				-- FPGA clock
		tx_o	=>	tx_o,				-- TX out
		rx_i	=>	rx_i,				-- RX in
		busy_o	=>	tx_busy,			-- high when UART busy transmitting
		data_i	=>	tx_data,			-- data to send
		we_i	=>	tx_write			-- set high to send byte (when busy_o is low)
	);
	end generate DOTRACE;

END ARCHITECTURE RTL;
