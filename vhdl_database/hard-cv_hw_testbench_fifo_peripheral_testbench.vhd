--------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com>
--
-- Create Date:   13:03:11 06/19/2012
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/projects/fpga-cam/hdl/test_benches/fifo_peripheral_testbench.vhd
-- Project Name:  SPARTCAM
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fifo_peripheral
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
 
ENTITY fifo_peripheral_testbench IS
END fifo_peripheral_testbench;
 
ARCHITECTURE behavior OF fifo_peripheral_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 

	component fifo_peripheral is
	generic(ADDR_WIDTH : positive := 16; --! width of the address bus
			WIDTH	: positive := 16; --! width of the data bus
			SIZE	: positive	:= 128; --! fifo depth
			BURST_SIZE : positive := 4;
			SYNC_LOGIC_INTERFACE : boolean := false 
			); 
	port(
			clk, resetn : in std_logic ;
			addr_bus : in std_logic_vector((ADDR_WIDTH - 1) downto 0);
			wr_bus, rd_bus, cs_bus : in std_logic ;
			wrB, rdA : in std_logic ;
			data_bus_in	: in std_logic_vector((WIDTH - 1) downto 0); -- bus interface
			data_bus_out	: out std_logic_vector((WIDTH - 1) downto 0); -- bus interface
			inputB: in std_logic_vector((WIDTH - 1) downto 0); -- logic interface
			outputA	: out std_logic_vector((WIDTH - 1) downto 0); -- logic interface
			emptyA, fullA, emptyB, fullB	:	out std_logic 
	);
	end component;
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal addr_bus : std_logic_vector(11 downto 0) := (others => '0');
   signal wr_bus : std_logic := '0';
   signal rd_bus : std_logic := '0';
   signal wrB : std_logic := '0';
   signal rdA : std_logic := '0';
   signal inputB : std_logic_vector(15 downto 0) := (others => '0');

	--BiDirs
   signal data_bus_in : std_logic_vector(15 downto 0);
	signal data_bus_out : std_logic_vector(15 downto 0);

 	--Outputs
   signal outputA : std_logic_vector(15 downto 0);
   signal emptyA : std_logic;
   signal fullA : std_logic;
   signal emptyB : std_logic;
   signal fullB : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fifo_peripheral 
	GENERIC MAP(ADDR_WIDTH => 12 , WIDTH	=> 16, SIZE	=> 1024, BURST_SIZE => 512, SYNC_LOGIC_INTERFACE => true)
	PORT MAP (
          clk => clk,
          resetn => resetn,
          addr_bus => addr_bus,
          wr_bus => wr_bus,
          rd_bus => rd_bus,
			 cs_bus => '1',
          wrB => wrB,
          rdA => rdA,
          data_bus_in => data_bus_in,
			 data_bus_out => data_bus_out,
          inputB => inputB,
          outputA => outputA,
          emptyA => emptyA,
          fullA => fullA,
          emptyB => emptyB,
          fullB => fullB
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- bus Stimulus process
   bus_proc: process
   begin		
      resetn <= '0' ;
		addr_bus <= (others => '0') ;
		data_bus_in <= (others => '0') ;
      wait for 100 ns;	
		resetn <= '1' ;
		addr_bus <= X"200" ;
      wait for clk_period*10;
		loop_available: FOR b IN 1 TO 10 LOOP -- la variable de boucle est a de 1 à 10
					rd_bus <= '1' ;
					WAIT FOR clk_period; -- attend la valeur de pulse_time
					rd_bus <= '0' ;
					WAIT FOR clk_period;
				END LOOP loop_available;
		addr_bus <= X"000" ;
--		loop_read: FOR b IN 1 TO 1024 LOOP -- la variable de boucle est a de 1 à 10
--					rd_bus <= '1' ;
--					WAIT FOR clk_period; -- attend la valeur de pulse_time
--					rd_bus <= '0' ;
--					WAIT FOR clk_period;
--				END LOOP loop_read;
--		data_bus_in <= (others => '0');	
		loop_write: FOR b IN 1 TO 128 LOOP -- la variable de boucle est a de 1 à 10
					wr_bus <= '1' ;
					WAIT FOR clk_period; -- attend la valeur de pulse_time
					wr_bus <= '0' ;
					WAIT FOR clk_period;
					data_bus_in <= data_bus_in + 1 ;
				END LOOP loop_write;
      -- insert stimulus here 

      wait;
   end process;
	
	
	-- logic Stimulus process
   logic_proc_wr: process
   begin		
      -- hold reset state for 100 ns.
      inputB <= (others => '0') ;
		wait for 100 ns;	
		
      wait for clk_period*10;
		loop_logic_wr: FOR a IN 1 TO 128 LOOP -- la variable de boucle est a de 1 à 10
					wrB <= '1' ;
					WAIT FOR clk_period; -- attend la valeur de pulse_time
					wrB <= '0' ;
					inputB <= inputB + 1;
					WAIT FOR clk_period;
				END LOOP loop_logic_wr;
      -- insert stimulus here 

      wait;
   end process;
	
--	logic Stimulus process
   logic_proc_rd: process
   begin		
      -- hold reset state for 100 ns.
		wait for 100 ns;	
      wait for clk_period*4000;
		rdA <= '1' ;
		loop_logic_rd: FOR c IN 1 TO 1024 LOOP -- la variable de boucle est a de 1 à 10
--					rdA <= '1' ;
--					WAIT FOR clk_period; -- attend la valeur de pulse_time
--					rdA <= '0' ;
					WAIT FOR clk_period;
				END LOOP loop_logic_rd;
      -- insert stimulus here 

      wait;
   end process;

END;
