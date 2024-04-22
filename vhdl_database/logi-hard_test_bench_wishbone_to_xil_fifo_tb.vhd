--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:55:00 11/25/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/wishbone_to_xil_fifo_tb.vhd
-- Project Name:  test_fifo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: wishbone_to_xil_fifo
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
USE ieee.numeric_std.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY wishbone_to_xil_fifo_tb IS
END wishbone_to_xil_fifo_tb;
 
ARCHITECTURE behavior OF wishbone_to_xil_fifo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wishbone_to_xil_fifo
    PORT(
         gls_reset : IN  std_logic;
         gls_clk : IN  std_logic;
         wbs_address : IN  std_logic_vector(15 downto 0);
         wbs_writedata : IN  std_logic_vector(15 downto 0);
         wbs_readdata : OUT  std_logic_vector(15 downto 0);
         wbs_strobe : IN  std_logic;
         wbs_cycle : IN  std_logic;
         wbs_write : IN  std_logic;
         wbs_ack : OUT  std_logic;
         fifo_rst : OUT  std_logic;
         wr_clk : OUT  std_logic;
         dout : OUT  std_logic_vector(15 downto 0);
         wr_en : OUT  std_logic;
         full : IN  std_logic;
         wr_data_count : IN  std_logic_vector(15 downto 0);
         overflow : IN  std_logic;
         rd_clk : OUT  std_logic;
         din : IN  std_logic_vector(15 downto 0);
         rd_en : OUT  std_logic;
         empty : IN  std_logic;
         rd_data_count : IN  std_logic_vector(15 downto 0);
         underflow : IN  std_logic
        );
    END COMPONENT;
	 
	  COMPONENT xil_fifo
    PORT(
         rst : IN  std_logic;
         wr_clk : IN  std_logic;
         rd_clk : IN  std_logic;
         din : IN  std_logic_vector(127 downto 0);
         wr_en : IN  std_logic;
         rd_en : IN  std_logic;
         dout : OUT  std_logic_vector(15 downto 0);
         full : OUT  std_logic;
         overflow : OUT  std_logic;
         empty : OUT  std_logic;
         underflow : OUT  std_logic;
         rd_data_count : OUT  std_logic_vector(9 downto 0);
         wr_data_count : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal gls_reset : std_logic := '0';
   signal gls_clk : std_logic := '0';
   signal wbs_address : std_logic_vector(15 downto 0) := (others => '0');
   signal wbs_writedata : std_logic_vector(15 downto 0) := (others => '0');
   signal wbs_strobe : std_logic := '0';
   signal wbs_cycle : std_logic := '0';
   signal wbs_write : std_logic := '0';
   signal full : std_logic := '0';
   signal wr_data_count : std_logic_vector(15 downto 0) := (others => '0');
   signal overflow : std_logic := '0';
   signal din : std_logic_vector(15 downto 0) := (others => '0');
	signal fifo_din : std_logic_vector(127 downto 0) := (others => '0');

   signal empty : std_logic := '0';
   signal rd_data_count : std_logic_vector(15 downto 0) := (others => '0');
   signal underflow : std_logic := '0';

 	--Outputs
   signal wbs_readdata : std_logic_vector(15 downto 0);
   signal wbs_ack : std_logic;
   signal fifo_rst : std_logic;
   signal wr_clk : std_logic;
   signal dout : std_logic_vector(15 downto 0);
   signal wr_en : std_logic;
   signal rd_clk : std_logic;
   signal rd_en : std_logic;

   -- Clock period definitions
   constant gls_clk_period : time := 10 ns;
   constant wr_clk_period : time := 10 ns;
   constant rd_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wishbone_to_xil_fifo PORT MAP (
          gls_reset => gls_reset,
          gls_clk => gls_clk,
          wbs_address => wbs_address,
          wbs_writedata => wbs_writedata,
          wbs_readdata => wbs_readdata,
          wbs_strobe => wbs_strobe,
          wbs_cycle => wbs_cycle,
          wbs_write => wbs_write,
          wbs_ack => wbs_ack,
          fifo_rst => fifo_rst,
          wr_clk => wr_clk,
          dout => open,
          wr_en => open,
          full => full,
          wr_data_count => wr_data_count,
          overflow => overflow,
          rd_clk => rd_clk,
          din => din,
          rd_en => rd_en,
          empty => empty,
          rd_data_count => rd_data_count,
          underflow => underflow
        );
		  
		  
		  uut2: xil_fifo PORT MAP (
          rst => fifo_rst,
          wr_clk => wr_clk,
          rd_clk => rd_clk,
          din => fifo_din,
          wr_en => wr_en,
          rd_en => rd_en,
          dout => din,
          full => full,
          overflow => overflow,
          empty => empty,
          underflow => underflow,
          rd_data_count => rd_data_count(9 downto 0),
          wr_data_count => wr_data_count(9 downto 0)
        ); 
	rd_data_count(15 downto 10) <= (others => '0');
	wr_data_count(15 downto 10) <= (others => '0');
   -- Clock process definitions
   gls_clk_process :process
   begin
		gls_clk <= '0';
		wait for gls_clk_period/2;
		gls_clk <= '1';
		wait for gls_clk_period/2;
   end process;
 
   wr_clk_process :process
   begin
		wr_clk <= '0';
		wait for wr_clk_period/2;
		wr_clk <= '1';
		wait for wr_clk_period/2;
   end process;
 
   rd_clk_process :process
   begin
		rd_clk <= '0';
		wait for rd_clk_period/2;
		rd_clk <= '1';
		wait for rd_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wr_en <= '0' ;
		wait until gls_reset = '0' ;
      wait for wr_clk_period*10;
		for i in 0 to 7 loop
			wr_en <= '1' ;
			fifo_din <= std_logic_vector(to_unsigned(i, 128));
			wait for wr_clk_period;
		end loop ;
		wr_en <= '0' ;
		wait for wr_clk_period*10;

      -- insert stimulus here 

      wait;
   end process;
	
 wish_stim_proc: process
   begin		
		gls_reset <= '1' ;
		 wbs_address <= std_logic_vector(to_unsigned(0, 16));
		 wbs_writedata <= std_logic_vector(to_unsigned(0, 16));
		 wbs_strobe <= '0';
		 wbs_cycle  <= '0';
		 wbs_write  <= '0';
      wait for wr_clk_period*10;
		gls_reset <= '0' ;
		wait for wr_clk_period*500;
		for i in 0 to 100 loop
			 wbs_address <= std_logic_vector(to_unsigned(130, 16));
			 wbs_strobe <= '1';
			 wbs_cycle  <= '1';
			 wait for wr_clk_period*4;
			 wbs_strobe <= '0';
			 wbs_cycle  <= '0';
			 
			 wait for wr_clk_period*10;
			 
			 wbs_address <= std_logic_vector(to_unsigned(0, 16));
			 wbs_strobe <= '1';
			 wbs_cycle  <= '1';
			 wait for wr_clk_period*4;
			 wbs_strobe <= '0';
			 wbs_cycle  <= '0';
			 wait for wr_clk_period*10;
			
		end loop ;
		wait for wr_clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
