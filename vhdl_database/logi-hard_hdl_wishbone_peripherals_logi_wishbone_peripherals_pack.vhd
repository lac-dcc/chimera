

-- ----------------------------------------------------------------------
--LOGI-hard
--Copyright (c) 2013, Jonathan Piat, Michael Jones, All rights reserved.
--
--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 3.0 of the License, or (at your option) any later version.
--
--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
--Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public
--License along with this library.
-- ----------------------------------------------------------------------



--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library work;
use work.logi_utils_pack.all ;

package logi_wishbone_peripherals_pack is

type slv16_array is array(natural range <>) of std_logic_vector(15 downto 0);
type slv32_array is array(natural range <>) of std_logic_vector(31 downto 0);

component wishbone_register is
	generic(
		  wb_addr_size : natural := 16; -- Address port size for wishbone
		  wb_size : natural := 16; -- Data port size for wishbone
		  nb_regs : natural := 1 -- Data port size for wishbone
	 );
	 port 
	 (
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(wb_addr_size-1 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		  -- out signals
		  reg_out : out slv16_array(0 to nb_regs-1);
		  reg_in : in slv16_array(0 to nb_regs-1)
	 );
end component;

component wishbone_fifo is
generic( ADDR_WIDTH: positive := 16; --! width of the address bus
			WIDTH	: positive := 16; --! width of the data bus
			SIZE	: positive	:= 128; --! fifo depth;
			BURST_SIZE : positive := 4;
			B_THRESHOLD : positive := 4;
			A_THRESHOLD : positive := 4;
			SYNC_LOGIC_INTERFACE : boolean := false
			); 
port(
	-- Syscon signals
	gls_reset    : in std_logic ;
	gls_clk      : in std_logic ;
	-- Wishbone signals
	wbs_address       : in std_logic_vector(ADDR_WIDTH-1 downto 0) ;
	wbs_writedata : in std_logic_vector( WIDTH-1 downto 0);
	wbs_readdata  : out std_logic_vector( WIDTH-1 downto 0);
	wbs_strobe    : in std_logic ;
	wbs_cycle      : in std_logic ;
	wbs_write     : in std_logic ;
	wbs_ack       : out std_logic;
		  
	-- logic signals
	write_fifo, read_fifo : in std_logic ;
	fifo_input: in std_logic_vector((WIDTH - 1) downto 0); --! data input of fifo B
	fifo_output	: out std_logic_vector((WIDTH - 1) downto 0); --! data output of fifo A
	
	read_fifo_empty, read_fifo_full, read_fifo_threshold : out std_logic ;
	write_fifo_empty, write_fifo_full, write_fifo_threshold : out std_logic ;
	read_fifo_reset, write_fifo_reset : out std_logic
);
end component;

component wishbone_max7219 is
generic(NB_DEVICE : positive := 2; 
		  CLK_DIV : positive := 1024;
		  wb_size : natural := 16 -- Data port size for wishbone
		  );
port(
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;

		  -- max7219 signals
		  DOUT : out std_logic ;
		  SCLK : out std_logic ;
		  LOAD : out std_logic

);
end component;



component wishbone_servo is
generic(NB_SERVOS : positive := 2;
			wb_size : natural := 16 ; -- Data port size for wishbone
			pos_width	:	integer := 8 ;
			clock_period             : integer := 10;
			minimum_high_pulse_width : integer := 1000000;
			maximum_high_pulse_width : integer := 2000000
		  );
port(
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		  
		  failsafe : in std_logic ;
		  servos : out std_logic_vector(NB_SERVOS-1 downto 0)
		  

);
end component;

component wishbone_pwm is
generic( nb_chan : positive := 3;
			wb_addr_size : natural := 16; -- Address port size for wishbone
			wb_size : natural := 16  -- Data port size for wishbone
		  );
port(
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(wb_addr_size-1 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		  
		  pwm_out : out std_logic_vector(nb_chan-1 downto 0)
		  

);
end component;


component wishbone_interrupt_manager is
generic(NB_INTERRUPT_LINES : positive := 3; 
		  NB_INTERRUPTS : positive := 1; 
		  ADDR_WIDTH : positive := 16;
		  DATA_WIDTH : positive := 16);
port(
	-- Syscon signals
	gls_reset    : in std_logic ;
	gls_clk      : in std_logic ;
	-- Wishbone signals
	wbs_address       : in std_logic_vector(ADDR_WIDTH-1 downto 0) ;
	wbs_writedata : in std_logic_vector( DATA_WIDTH-1 downto 0);
	wbs_readdata  : out std_logic_vector( DATA_WIDTH-1 downto 0);
	wbs_strobe    : in std_logic ;
	wbs_cycle      : in std_logic ;
	wbs_write     : in std_logic ;
	wbs_ack       : out std_logic;
	
	interrupt_lines : out std_logic_vector(0 to NB_INTERRUPT_LINES-1);
	interrupts_req : in std_logic_vector(0 to NB_INTERRUPTS-1)
	
	);
end component;


component wishbone_mem is
generic( mem_size : positive := 3;
			wb_size : natural := 16 ; -- Data port size for wishbone
			wb_addr_size : natural := 16 -- addr port size for wishbone
		  );
port(
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(wb_addr_size-1 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic
		  );
end component;

component wishbone_gpio is
	generic(
		  wb_size : natural := 16
	 );
	 port 
	 (
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		  -- out signals
		  gpio: inout std_logic_vector(15 downto 0)
	 );
end component;

component wishbone_watchdog is
	generic(
		  wb_size : natural := 16; -- Data port size for wishbone
		  watchdog_timeout_ms : positive := 160;
		  clock_period_ns : positive := 10
	 );
	 port 
	 (
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		 
		  -- out signals
		  reset_out : out std_logic  
	 );
end component;


component wishbone_7seg4x is
generic(
		  wb_size : natural := 16; -- Data port size for wishbone
		  clock_freq_hz : natural := 100_000_000;
		  refresh_rate_hz : natural := 100
	 );
	 port 
	 (
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		  -- SSEG to EDU from Host
		  sseg_cathode_out : out std_logic_vector(4 downto 0); -- common cathode
		  sseg_anode_out : out std_logic_vector(7 downto 0) -- sseg anode	  
	 );
end component;

component wishbone_shared_mem is
generic( mem_size : positive := 256;
			wb_size : natural := 16 ; -- Data port size for wishbone
			wb_addr_size : natural := 16 ;  -- Data port size for wishbone
			logic_addr_size : natural := 10 ;
			logic_data_size : natural := 16
		  );
port(
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(wb_addr_size-1 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		  
		  
		  -- Logic signals
		  write_in : in std_logic ;
		  addr_in : in std_logic_vector(logic_addr_size-1 downto 0);
		  data_in : in std_logic_vector(logic_data_size-1 downto 0);
		  data_out : out std_logic_vector(logic_data_size-1 downto 0)
		  );
end component;


component wishbone_gps is
generic(
			wb_size : natural := 16 ; -- Data port size for wishbone
			baudrate : positive := 115_200
		  );
port(
-- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic ;
		  rx_in : in std_logic 
);
end component;


component wishbone_ping is
generic(	nb_ping : positive := 2;
			clock_period_ns           : integer := 10
		  );
port(
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( 15 downto 0);
		  wbs_readdata  : out std_logic_vector( 15 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
			
	     ping_io : inout std_logic_vector(nb_ping-1 downto 0 )
);
end component;

component wishbone_led_matrix_ctrl is
generic(wb_size : positive := 16;
		  clk_div : positive := 10;
		  nb_panels : positive := 1 ;
		  bits_per_color : INTEGER RANGE 1 TO 4 := 4 ;
		  expose_step_cycle : positive := 1910
		  );
port(
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		  
		  
		  SCLK_OUT : out std_logic ;
		  BLANK_OUT : out std_logic ;
		  LATCH_OUT : out std_logic ;
		  A_OUT : out std_logic_vector(3 downto 0);
		  R_out : out std_logic_vector(1 downto 0);
		  G_out : out std_logic_vector(1 downto 0);
		  B_out : out std_logic_vector(1 downto 0)

);
end component;

component wishbone_pmic is
generic(
			wb_size : natural := 16 ; -- Data port size for wishbone
			sample_rate : positive := 48_000;
			sclk_period_ns : positive := 80
		  );
port(
-- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic ;
		  ss, sck : out std_logic ;
		  miso : in std_logic 
);
end component;

component wishbone_i2c_master is
	generic(
		  wb_size : natural := 16 -- data port size for wishbone
	 );
	 port 
	 (
		  -- Syscon signals
		  gls_reset    : in std_logic ;
		  gls_clk      : in std_logic ;
		  -- Wishbone signals
		  wbs_address       : in std_logic_vector(15 downto 0) ;
		  wbs_writedata : in std_logic_vector( wb_size-1 downto 0);
		  wbs_readdata  : out std_logic_vector( wb_size-1 downto 0);
		  wbs_strobe    : in std_logic ;
		  wbs_cycle      : in std_logic ;
		  wbs_write     : in std_logic ;
		  wbs_ack       : out std_logic;
		  -- out signals
		  scl, sda : inout std_logic
	 );
end component;

component wishbone_to_xil_fifo is
generic( ADDR_WIDTH: positive := 16; --! width of the address bus
			WIDTH	: positive := 16; --! width of the data bus
			WR_FIFO_SIZE : natural := 128;
			RD_FIFO_SIZE : natural := 128
			); 
port(
	-- Syscon signals
	gls_reset    : in std_logic ;
	gls_clk      : in std_logic ;
	-- Wishbone signals
	wbs_address       : in std_logic_vector(ADDR_WIDTH-1 downto 0) ;
	wbs_writedata : in std_logic_vector( WIDTH-1 downto 0);
	wbs_readdata  : out std_logic_vector( WIDTH-1 downto 0);
	wbs_strobe    : in std_logic ;
	wbs_cycle      : in std_logic ;
	wbs_write     : in std_logic ;
	wbs_ack       : out std_logic;
			
			
	-- fifo signals
	fifo_rst : out std_logic;	  
	-- write xil_fifo signals
	wr_clk : out std_logic ;
	dout : out std_logic_vector(15 downto 0);
	wr_en : out std_logic ;
	full : in std_logic ;
	wr_data_count : in std_logic_vector(15 downto 0);
	overflow : in std_logic;
	-- read xil_fifo signals
	rd_clk : out std_logic ;
	din : in std_logic_vector(15 downto 0);
	rd_en : out std_logic ;
	empty : in std_logic ;
	rd_data_count : in std_logic_vector(15 downto 0);
	underflow : in std_logic 
);
end component;

end logi_wishbone_peripherals_pack;

package body logi_wishbone_peripherals_pack is

 
end logi_wishbone_peripherals_pack;
