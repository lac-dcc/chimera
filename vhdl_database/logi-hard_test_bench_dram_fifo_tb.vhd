--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:31:50 10/29/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/dram_fifo_tb.vhd
-- Project Name:  logibone_cam_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dram_fifo
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;

USE ieee.numeric_std.ALL;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY dram_fifo_tb IS
END dram_fifo_tb;
 
ARCHITECTURE behavior OF dram_fifo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	constant test_frequency : natural := 100_000_000 ;
	constant test_frequency_mhz : natural := test_frequency/1_000_000;
	constant low_speed_test : natural := 0 ;
	constant sdram_address_width : natural := 24;
   constant sdram_column_bits   : natural := 9;
   constant sdram_startup_cycles: natural := 10100; -- 100us, plus a little more
   constant cycles_per_refresh  : natural := (64000*test_frequency_mhz)/8192-1;
   constant test_width          : natural := sdram_address_width-1; -- each 32-bit word is two 16-bit SDRAM addresses 

 
    COMPONENT dram_fifo
	 	 
		 
	generic(CACHE_SIZE : positive := 2048;
		  FIFO_SIZE : positive := 16_777_216;
		  sdram_address_width : positive := 24;
		  SYNC_READ : boolean := true;
		  SYNC_WRITE : boolean := true;
		  CACHE_ADDRESS : std_logic_vector(31 downto 0) := (others => '0'));

    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         write_fifo : IN  std_logic;
         read_fifo : IN  std_logic;
         nb_available : OUT  std_logic_vector(31 downto 0);
         data_out : OUT  std_logic_vector(15 downto 0);
         data_in : IN  std_logic_vector(15 downto 0);
         reset_fifo : IN  std_logic;
         cmd_ready : IN  std_logic;
         cmd_enable : OUT  std_logic;
         cmd_wr : OUT  std_logic;
         cmd_address : OUT  std_logic_vector(22 downto 0);
         cmd_byte_enable : OUT  std_logic_vector(3 downto 0);
         cmd_data_in : OUT  std_logic_vector(31 downto 0);
         sdram_data_out : IN  std_logic_vector(31 downto 0);
         sdram_data_ready : IN  std_logic
        );
    END COMPONENT;
	 
	 component SDRAM_Controller is
    generic (
      sdram_address_width : natural;
      sdram_column_bits   : natural;
      sdram_startup_cycles: natural;
      cycles_per_refresh  : natural
    );
    Port ( clk           : in  STD_LOGIC;
           reset         : in  STD_LOGIC;
           
           -- Interface to issue reads or write data
           cmd_ready         : out STD_LOGIC;                     -- '1' when a new command will be acted on
           cmd_enable        : in  STD_LOGIC;                     -- Set to '1' to issue new command (only acted on when cmd_read = '1')
           cmd_wr            : in  STD_LOGIC;                     -- Is this a write?
           cmd_address       : in  STD_LOGIC_VECTOR(sdram_address_width-2 downto 0); -- address to read/write
           cmd_byte_enable   : in  STD_LOGIC_VECTOR(3 downto 0);  -- byte masks for the write command
           cmd_data_in       : in  STD_LOGIC_VECTOR(31 downto 0); -- data for the write command
           
           data_out          : out STD_LOGIC_VECTOR(31 downto 0); -- word read from SDRAM
           data_out_ready    : out STD_LOGIC;                     -- is new data ready?
           
           -- SDRAM signals
           SDRAM_CLK     : out   STD_LOGIC;
           SDRAM_CKE     : out   STD_LOGIC;
           SDRAM_CS      : out   STD_LOGIC;
           SDRAM_RAS     : out   STD_LOGIC;
           SDRAM_CAS     : out   STD_LOGIC;
           SDRAM_WE      : out   STD_LOGIC;
           SDRAM_DQM     : out   STD_LOGIC_VECTOR( 1 downto 0);
           SDRAM_ADDR    : out   STD_LOGIC_VECTOR(12 downto 0);
           SDRAM_BA      : out   STD_LOGIC_VECTOR( 1 downto 0);
           SDRAM_DATA    : inout STD_LOGIC_VECTOR(15 downto 0));
end component;
	 
	 component SDRAM_Controller_v2 is
    generic (
      sdram_address_width : natural;
      sdram_column_bits   : natural;
      sdram_startup_cycles: natural;
      cycles_per_refresh  : natural
    );
    Port ( clk           : in  STD_LOGIC;
           reset         : in  STD_LOGIC;
           
           -- Interface to issue reads or write data
           cmd_ready         : out STD_LOGIC;                     -- '1' when a new command will be acted on
           cmd_enable        : in  STD_LOGIC;                     -- Set to '1' to issue new command (only acted on when cmd_read = '1')
           cmd_wr            : in  STD_LOGIC;                     -- Is this a write?
           cmd_address       : in  STD_LOGIC_VECTOR(sdram_address_width-2 downto 0); -- address to read/write
           cmd_byte_enable   : in  STD_LOGIC_VECTOR(3 downto 0);  -- byte masks for the write command
           cmd_data_in       : in  STD_LOGIC_VECTOR(31 downto 0); -- data for the write command
           
           data_out          : out STD_LOGIC_VECTOR(31 downto 0); -- word read from SDRAM
           data_out_ready    : out STD_LOGIC;                     -- is new data ready?
           
           -- SDRAM signals
           SDRAM_CLK     : out   STD_LOGIC;
           SDRAM_CKE     : out   STD_LOGIC;
           SDRAM_CS      : out   STD_LOGIC;
           SDRAM_RAS     : out   STD_LOGIC;
           SDRAM_CAS     : out   STD_LOGIC;
           SDRAM_WE      : out   STD_LOGIC;
           SDRAM_DQM     : out   STD_LOGIC_VECTOR( 1 downto 0);
           SDRAM_ADDR    : out   STD_LOGIC_VECTOR(12 downto 0);
           SDRAM_BA      : out   STD_LOGIC_VECTOR( 1 downto 0);
           SDRAM_DATA    : inout STD_LOGIC_VECTOR(15 downto 0));
end component;	 
	 
	 component sdram_model is
    Port ( CLK     : in  STD_LOGIC;
           CKE     : in  STD_LOGIC;
           CS_N    : in  STD_LOGIC;
           RAS_N   : in  STD_LOGIC;
           CAS_N   : in  STD_LOGIC;
           WE_N    : in  STD_LOGIC;
           BA      : in  STD_LOGIC_VECTOR (1 downto 0);
           DQM     : in  STD_LOGIC_VECTOR (1 downto 0);
           ADDR    : in  STD_LOGIC_VECTOR (12 downto 0);
           DQ      : inout  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component mt48lc16m16a2 is
    Port ( Clk     : in  STD_LOGIC;
           Cke     : in  STD_LOGIC;
           Cs_n    : in  STD_LOGIC;
           Ras_n   : in  STD_LOGIC;
           Cas_n   : in  STD_LOGIC;
           We_n    : in  STD_LOGIC;
           Ba      : in  STD_LOGIC_VECTOR (1 downto 0);
           Dqm     : in  STD_LOGIC_VECTOR (1 downto 0);
           Addr    : in  STD_LOGIC_VECTOR (12 downto 0);
           Dq      : inout  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal write_fifo : std_logic := '0';
   signal read_fifo : std_logic := '0';
   signal data_in, data_out : std_logic_vector(15 downto 0) := (others => '0');
   signal reset_fifo : std_logic := '0';
   signal sdram_data_in : std_logic_vector(31 downto 0) := (others => '0');
   signal sdram_data_ready : std_logic := '0';

 	--Outputs
   signal nb_available : std_logic_vector(31 downto 0);
   signal cmd_address     : std_logic_vector(sdram_address_width-2 downto 0) := (others => '0');
   signal cmd_wr          : std_logic := '1';
   signal cmd_enable      : std_logic;
   signal cmd_byte_enable : std_logic_vector(3 downto 0);
   signal cmd_data_in     : std_logic_vector(31 downto 0);
   signal cmd_ready       : std_logic;
   signal sdram_data_out  : std_logic_vector(31 downto 0);
   signal data_out_ready  : std_logic;
	
	--SDRAM
	signal SDRAM_CLK       :    std_logic;
	signal SDRAM_CKE       :    std_logic;
	signal SDRAM_CS        :    std_logic;
	signal SDRAM_RAS       :    std_logic;
	signal SDRAM_CAS       :    std_logic;
	signal SDRAM_WE        :    std_logic;
	signal SDRAM_DQM       :    std_logic_vector(1 downto 0);
	signal SDRAM_ADDR      :    std_logic_vector(12 downto 0);
	signal SDRAM_BA        :    std_logic_vector(1 downto 0);
	signal SDRAM_DQ      :  std_logic_vector(15 downto 0)  ;  


signal sdram_ready : std_logic ;

signal clock_divider : std_logic_vector(3 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dram_fifo 
	GENERIC MAP(CACHE_ADDRESS => X"00000000", FIFO_SIZE => 8_000_000)
	PORT MAP (
          clk => clk,
          reset => reset,
          write_fifo => write_fifo,
          read_fifo => read_fifo,
          nb_available => nb_available,
          data_out => data_out,
          data_in => data_in,
          reset_fifo => reset_fifo,
          cmd_ready => cmd_ready,
          cmd_enable => cmd_enable,
          cmd_wr => cmd_wr,
          cmd_address => cmd_address,
          cmd_byte_enable => cmd_byte_enable,
          cmd_data_in => cmd_data_in,
          sdram_data_out =>  sdram_data_out,
          sdram_data_ready => sdram_data_ready
        );
		  
	ctrl_0 : SDRAM_Controller
    generic map(
      sdram_address_width => sdram_address_width,
      sdram_column_bits   => sdram_column_bits,
      sdram_startup_cycles=> sdram_startup_cycles,
      cycles_per_refresh  => cycles_per_refresh
    )
    Port map( clk     => clk,
           reset   => reset,
           
           -- Interface to issue reads or write data
           cmd_ready   => cmd_ready,               -- '1' when a new command will be acted on
           cmd_enable  => cmd_enable,                    -- Set to '1' to issue new command (only acted on when cmd_read = '1')
           cmd_wr      => cmd_wr,                   -- Is this a write?
           cmd_address => cmd_address, -- address to read/write
           cmd_byte_enable => cmd_byte_enable,  -- byte masks for the write command
           cmd_data_in    => cmd_data_in, -- data for the write command
           
           data_out       => sdram_data_out, -- word read from SDRAM
           data_out_ready  => sdram_data_ready,                     -- is new data ready?
           
           -- SDRAM signals
           SDRAM_CLK     => SDRAM_CLK,
           SDRAM_CKE     => SDRAM_CKE,
           SDRAM_CS      => SDRAM_CS,
           SDRAM_RAS     => SDRAM_RAS,
           SDRAM_CAS     => SDRAM_CAS,
           SDRAM_WE      => SDRAM_WE,
           SDRAM_DQM     => SDRAM_DQM,
           SDRAM_ADDR    => SDRAM_ADDR,
           SDRAM_BA      => SDRAM_BA,
           SDRAM_DATA    => SDRAM_DQ
		);
		  
	 sdram_0 : sdram_model
    Port map( CLK     => SDRAM_CLK,
           CKE     => SDRAM_CKE,
           CS_N    => SDRAM_CS,
           RAS_N   => SDRAM_RAS,
           CAS_N   => SDRAM_CAS,
           WE_N    => SDRAM_WE,
           BA      => SDRAM_BA,
           DQM     => SDRAM_DQM,
           ADDR   => SDRAM_ADDR,
           DQ      => SDRAM_DQ
	 );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
 
 process(clk, reset)
begin
	if reset = '1' then
			write_fifo <= '0' ;
			data_in <= (others => '0');
			clock_divider <= "0001" ;
	elsif clk'event and clk = '1' then
		clock_divider(3 downto 1) <= clock_divider(2 downto 0);
		clock_divider(0) <= clock_divider(1);
		if sdram_ready = '1' and clock_divider(0) = '1' then
			write_fifo <= '1' ;
		else
			write_fifo <= '0' ;
		end if ;
		
		if write_fifo = '1' then
			data_in <= data_in + 1 ;
		end if ;
	end if ;
end process ;


process(clk, reset)
begin
	if reset = '1' then
			sdram_ready <= '0' ;
	elsif clk'event and clk = '1' then
		if cmd_ready = '1' then
			sdram_ready <= '1' ;
		end if ;
	end if ;
end process ;
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1' ;
		read_fifo <= '0' ;
      wait for 100 ns;
		reset <= '0' ;
		wait for 200 us;
		wait until clk = '0' ;
		for i in 0 to 320*10 loop
			--data_in <= std_logic_vector(to_unsigned(i, 16));
			--write_fifo <= '1' ;
			wait until clk = '1' ;
			--write_fifo <= '0' ;
			wait for 80 ns ;
			wait until clk = '0' ;
		end loop ;
		--write_fifo <= '0' ;
		
		for i in 0 to 320*10 loop
			read_fifo <= '1' ;
			wait until clk = '1' ;
			read_fifo <= '0' ;
			wait for 30 ns ;
			wait until clk = '0' ;
		end loop ;
		read_fifo <= '0' ;
      -- insert stimulus here 

      wait;
   end process;

END;
