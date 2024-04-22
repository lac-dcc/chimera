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

package peripheral_pack is
type reg16_array is array(natural range<>) of std_logic_vector(15 downto 0);


component fifo_peripheral is
generic(ADDR_WIDTH : positive := 8;
		  WIDTH	: positive := 16; 
		  SIZE	: positive	:= 128 ; 
		  BURST_SIZE : positive := 4;
		  SYNC_LOGIC_INTERFACE : boolean := false );
port(
	clk, resetn : in std_logic ;
	addr_bus : in std_logic_vector((ADDR_WIDTH - 1) downto 0);
	wr_bus, rd_bus, cs_bus : in std_logic ;
	wrB, rdA : in std_logic ;
	data_bus_in	: in std_logic_vector((WIDTH - 1) downto 0); -- bus interface
	data_bus_out	: out std_logic_vector((WIDTH - 1) downto 0); -- bus interface
	inputB: in std_logic_vector((WIDTH - 1) downto 0); -- logic interface
	outputA	: out std_logic_vector((WIDTH - 1) downto 0); -- logic interface
	emptyA, fullA, emptyB, fullB, burst_available_B :	out std_logic;
	fifoA_reset, fifoB_reset : out std_logic
);
end component;

component latch_peripheral is
generic(ADDR_WIDTH : positive := 8; WIDTH	: positive := 16);
port(
	clk, resetn : in std_logic ;
	addr_bus : in std_logic_vector((ADDR_WIDTH - 1) downto 0);
	wr_bus, rd_bus, cs_bus : in std_logic ;
	data_bus_in	: in std_logic_vector((WIDTH - 1) downto 0); -- bus interface
	data_bus_out	: out std_logic_vector((WIDTH - 1) downto 0); -- bus interface
	latch_default : in  std_logic_vector((WIDTH - 1) downto 0); 
	latch_input : in  std_logic_vector((WIDTH - 1) downto 0);
	latch_output :out  std_logic_vector((WIDTH - 1) downto 0)
);
end component;

component addr_latches_peripheral is
generic(ADDR_WIDTH : positive := 16;  WIDTH : positive := 16; NB : positive := 4);
port(
	clk, resetn : in std_logic ;
	addr_bus : in std_logic_vector((ADDR_WIDTH - 1) downto 0);
	wr_bus, rd_bus, cs_bus : in std_logic ;
	data_bus_in	: in std_logic_vector((WIDTH - 1) downto 0); -- bus interface
	data_bus_out	: out std_logic_vector((WIDTH - 1) downto 0); -- bus interface
	latch_default : in  reg16_array(0 to (NB-1)) := (others =>(others => '0')) ;
	latch_input : in  reg16_array(0 to (NB-1));
	latch_output :out  reg16_array(0 to (NB-1))
);
end component;

component shared_mem_peripheral is
generic(SIZE : positive := 128; 
			DATA_WIDTH : positive := 16; 
			ADDR_WIDTH : positive := 16;
			LOGIC_PRIORITY : boolean := false);
port(clk, resetn : in std_logic;
	  addr_bus : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	  data_in_bus : in std_logic_vector(DATA_WIDTH-1 downto 0);
	  data_out_bus : out std_logic_vector(DATA_WIDTH-1 downto 0);
	  wr_bus, rd_bus, cs_bus : in std_logic ;
	  wait_bus : out std_logic ;
	  addr_logic : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	  data_in_logic : in std_logic_vector(DATA_WIDTH-1 downto 0);
	  data_out_logic : out std_logic_vector(DATA_WIDTH-1 downto 0);
	  wr_logic, rd_logic, cs_logic : in std_logic;
	  wait_logic : out std_logic 
	);
end component;


component interrupt_manager_peripheral is
generic(NB_INTERRUPT_LINES : positive := 3; 
		  NB_INTERRUPTS : positive := 1; 
		  ADDR_WIDTH : positive := 16;
		  DATA_WIDTH : positive := 16);
port(clk, resetn : in std_logic ; --! system clock and asynchronous reset
	addr_bus : in std_logic_vector((ADDR_WIDTH - 1) downto 0); --! address bus
	wr_bus, rd_bus, cs_bus : in std_logic ; --! bus control signals
	data_bus_in	: in std_logic_vector((DATA_WIDTH - 1) downto 0); --! input data bus
	data_bus_out	: out std_logic_vector((DATA_WIDTH - 1) downto 0);
	
	interrupt_lines : out std_logic_vector(0 to NB_INTERRUPT_LINES-1);
	interrupts_req : in std_logic_vector(0 to NB_INTERRUPTS-1)
	
	);
end component;

end peripheral_pack;

package body peripheral_pack is

 
end peripheral_pack;
