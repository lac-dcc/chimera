--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:35:16 07/07/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-projects/logi-matrix/hw/logipi/hdl/matrix_ctrl_tb.vhd
-- Project Name:  logipi_matrix
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: wishbone_led_matrix_ctrl
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
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY matrix_ctrl_tb IS
END matrix_ctrl_tb;
 
ARCHITECTURE behavior OF matrix_ctrl_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wishbone_led_matrix_ctrl
	 generic(
		  clk_div : positive := 10;
		  -- TODO: nb_panels is untested, still need to be validated
		  nb_panels : positive := 1 ;
		  bits_per_color : INTEGER RANGE 1 TO 4 := 4 ;
		  expose_step_cycle : positive := 191 
	 );
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
         SCLK_OUT : OUT  std_logic;
         BLANK_OUT : OUT  std_logic;
         LATCH_OUT : OUT  std_logic;
         A_OUT : OUT  std_logic_vector(3 downto 0);
         R_out : OUT  std_logic_vector(1 downto 0);
         G_out : OUT  std_logic_vector(1 downto 0);
         B_out : OUT  std_logic_vector(1 downto 0)
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

 	--Outputs
   signal wbs_readdata : std_logic_vector(15 downto 0);
   signal wbs_ack : std_logic;
   signal SCLK_OUT : std_logic;
   signal BLANK_OUT : std_logic;
   signal LATCH_OUT : std_logic;
   signal A_OUT : std_logic_vector(3 downto 0);
   signal R_out : std_logic_vector(1 downto 0);
   signal G_out : std_logic_vector(1 downto 0);
   signal B_out : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant gls_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wishbone_led_matrix_ctrl 
	generic map(
		  clk_div => 10,
		  nb_panels => 1,
		  bits_per_color => 4,
		  expose_step_cycle => 3000 
	 )
	PORT MAP (
          gls_reset => gls_reset,
          gls_clk => gls_clk,
          wbs_address => wbs_address,
          wbs_writedata => wbs_writedata,
          wbs_readdata => wbs_readdata,
          wbs_strobe => wbs_strobe,
          wbs_cycle => wbs_cycle,
          wbs_write => wbs_write,
          wbs_ack => wbs_ack,
          SCLK_OUT => SCLK_OUT,
          BLANK_OUT => BLANK_OUT,
          LATCH_OUT => LATCH_OUT,
          A_OUT => A_OUT,
          R_out => R_out,
          G_out => G_out,
          B_out => B_out
        );

   -- Clock process definitions
   gls_clk_process :process
   begin
		gls_clk <= '0';
		wait for gls_clk_period/2;
		gls_clk <= '1';
		wait for gls_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	variable addr : integer := 0 ;
   begin		
      -- hold reset state for 100 ns.
		gls_reset <= '1' ;
      wait for 100 ns;	
		gls_reset <= '0' ;
      wait for gls_clk_period*10;
		for addr in 0 to ((32*32)-1) loop
			wbs_strobe <= '0'; 
			wbs_cycle <= '0'; 
			wbs_write <= '0' ;
			wbs_address <= std_logic_vector(to_unsigned(addr, 16));
			if addr < 512 then
				wbs_writedata <= (others => '0') ;
			else
				wbs_writedata <= (others => '1') ;
			end if ;
			wait for gls_clk_period ;
			wbs_strobe <= '1'; 
			wbs_cycle <= '1'; 
			wbs_write <= '1' ;
			wait for gls_clk_period ;
		end loop ;
		wbs_strobe <= '0'; 
		wbs_cycle <= '0'; 
		wbs_write <= '0' ;
      -- insert stimulus here 

      wait;
   end process;

END;
