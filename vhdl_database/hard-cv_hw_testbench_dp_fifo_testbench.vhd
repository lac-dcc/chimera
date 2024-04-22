--------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com>
--
-- Create Date:   16:03:53 06/18/2012
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/projects/fpga-cam/hdl/test_benches/dp_fifo_testbench.vhd
-- Project Name:  SPARTCAM
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dp_fifo
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
 
library work ;
use work.utils_pack.all ; 
 
ENTITY dp_fifo_testbench IS
END dp_fifo_testbench;
 
ARCHITECTURE behavior OF dp_fifo_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dp_fifo
		generic(N : natural := 128 ; 
				W : positive := 16;
				SYNC_WR : boolean := false;
				SYNC_RD : boolean := false);
		port(
			clk, resetn, sraz : in std_logic; 
			wr, rd : in std_logic; 
			empty, full : out std_logic ;
			data_out : out std_logic_vector((W - 1) downto 0 ); 
			data_in : in std_logic_vector((W - 1) downto 0 );
			nb_available : out unsigned(nbit(N) downto 0 )
		); 
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal sraz : std_logic := '0';
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal empty : std_logic;
   signal full : std_logic;
   signal data_rdy : std_logic;
   signal data_out : std_logic_vector(15 downto 0);
   signal nb_available : unsigned(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dp_fifo 
			GENERIC MAP(N => 10 ,  W => 16, SYNC_WR => false, SYNC_RD => true)
			PORT MAP (
          clk => clk,
          resetn => resetn,
          sraz => sraz,
          wr => wr,
          rd => rd,
          empty => empty,
          full => full,
          data_out => data_out,
          data_in => data_in,
          nb_available => nb_available
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      resetn <= '0' ;
		rd <= '0' ;
		data_in <= (others => '0') ;
      wait for 100 ns;	
		resetn <= '1' ;
      wait for clk_period*10;
		loop1: FOR a IN 1 TO 9 LOOP -- la variable de boucle est a de 1 à 10
					wr <= '1' ;
					WAIT FOR clk_period; -- attend la valeur de pulse_time
					wr <= '0' ;
					data_in <= data_in + 1;
					WAIT FOR clk_period;
				END LOOP loop1;
				
		rd <= '1' ;	
		WAIT FOR 10 * clk_period;
--		loop2: FOR a IN 1 TO 10 LOOP -- la variable de boucle est a de 1 à 10
--				rd <= '1' ;
--				WAIT FOR clk_period; -- attend la valeur de pulse_time
--				rd <= '0' ;
--				WAIT FOR clk_period;
--			END LOOP loop2;
      -- insert stimulus here 
		rd <= '0' ;
      wait;
   end process;

END;
