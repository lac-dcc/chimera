--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:10:51 11/21/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/spi_wishbone_wrapper_tb.vhd
-- Project Name:  logipi_wishbone
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: spi_wishbone_wrapper
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY spi_wishbone_wrapper_tb IS
END spi_wishbone_wrapper_tb;
 
ARCHITECTURE behavior OF spi_wishbone_wrapper_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT spi_wishbone_wrapper
    PORT(
         mosi : IN  std_logic;
         ss : IN  std_logic;
         sck : IN  std_logic;
         miso : OUT  std_logic;
         gls_reset : IN  std_logic;
         gls_clk : IN  std_logic;
         wbm_address : OUT  std_logic_vector(15 downto 0);
         wbm_readdata : IN  std_logic_vector(15 downto 0);
         wbm_writedata : OUT  std_logic_vector(15 downto 0);
         wbm_strobe : OUT  std_logic;
         wbm_write : OUT  std_logic;
         wbm_ack : IN  std_logic;
         wbm_cycle : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal mosi : std_logic := '0';
   signal ss : std_logic := '0';
   signal sck : std_logic := '0';
   signal gls_reset : std_logic := '0';
   signal gls_clk : std_logic := '0';
   signal wbm_readdata : std_logic_vector(15 downto 0) := (others => '0');
   signal wbm_ack : std_logic := '0';

 	--Outputs
   signal miso : std_logic;
   signal wbm_address : std_logic_vector(15 downto 0);
   signal wbm_writedata : std_logic_vector(15 downto 0);
   signal wbm_strobe : std_logic;
   signal wbm_write : std_logic;
   signal wbm_cycle : std_logic;

   -- Clock period definitions
   constant gls_clk_period : time := 10 ns;
	constant sck_period : time := 100 ns;
	constant wr_conf : std_logic_vector(15 downto 0) := X"AA50";
	constant rd_conf : std_logic_vector(15 downto 0) := X"AA53";

	constant data_wr : std_logic_vector(15 downto 0) := X"BB57";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: spi_wishbone_wrapper PORT MAP (
          mosi => mosi,
          ss => ss,
          sck => sck,
          miso => miso,
          gls_reset => gls_reset,
          gls_clk => gls_clk,
          wbm_address => wbm_address,
          wbm_readdata => wbm_readdata,
          wbm_writedata => wbm_writedata,
          wbm_strobe => wbm_strobe,
          wbm_write => wbm_write,
          wbm_ack => wbm_ack,
          wbm_cycle => wbm_cycle
        );

   -- Clock process definitions
   gls_clk_process :process
   begin
		gls_clk <= '0';
		wait for gls_clk_period/2;
		gls_clk <= '1';
		wait for gls_clk_period/2;
   end process;
	
	process(gls_reset, gls_clk)
   begin
		if gls_reset = '1' then
			wbm_readdata <= (others => '0');
			wbm_ack <= '0' ;
		elsif gls_clk'event and gls_clk = '1' then
			if wbm_strobe = '1' and wbm_cycle = '1' then
				wbm_readdata <= wbm_address ;
				wbm_ack <= '1' ;
			else
				wbm_ack <= '0' ;
			end if ;
		end if ;
   end process;
 

  -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		gls_reset <= '1' ;
		ss <= '1' ;
		sck <= '0' ;
      wait for 100 ns;	
		gls_reset <= '0' ;
      wait for gls_clk_period*10;
		ss <= '0' ;
		wait for sck_period;
		
		loop_read_addr: FOR a IN 0 TO 15 LOOP -- la variable de boucle est a de 1 à 10
			sck <= '0' ;
			mosi <= rd_conf(15 - a) ;
			WAIT FOR sck_period/2; -- attend la valeur de pulse_time
			sck <= '1' ; -- complémente clk1
			WAIT FOR sck_period/2;
		END LOOP loop_read_addr;
		
		loop_read_data: FOR a IN 0 TO 64 LOOP -- la variable de boucle est a de 1 à 10
			sck <= '0' ;
			mosi <= '1' ;
			WAIT FOR sck_period/2; -- attend la valeur de pulse_time
			sck <= '1' ; -- complémente clk1
			WAIT FOR sck_period/2;
		END LOOP loop_read_data;
		sck <= '0' ;
		wait for sck_period;
		ss <= '1' ;

      wait;
   end process;

END;
