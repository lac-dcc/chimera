--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:06:49 03/22/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/async_serial_tb.vhd
-- Project Name:  test_ugv
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: async_serial
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
library work ;
use work.logi_utils_pack.all ; 
 
 
ENTITY async_serial_tb IS
END async_serial_tb;
 
ARCHITECTURE behavior OF async_serial_tb IS 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT async_serial
	 generic(CLK_FREQ : positive := 100_000_000; BAUDRATE : positive := 115_200) ;
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         rx : IN  std_logic;
         tx : OUT  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0);
         data_in : IN  std_logic_vector(7 downto 0);
         data_ready : OUT  std_logic;
         data_send : IN  std_logic;
			available : out std_logic 
        );
    END COMPONENT;
	 
	component nmea_frame_extractor is
	generic(nmea_header : string := "$GPRMC");
		port(
		clk, reset : in std_logic ;
		nmea_byte_in : in std_logic_vector(7 downto 0);
		new_byte_in : in std_logic ;
		nmea_byte_out : out std_logic_vector(7 downto 0);
		new_byte_out : out std_logic;
		frame_size : out std_logic_vector(7 downto 0);
		end_of_frame : out std_logic 
		);
	end component;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal rx : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal data_send : std_logic := '0';

 	--Outputs
   signal tx : std_logic;
   signal data_out : std_logic_vector(7 downto 0);
   signal data_ready : std_logic;
	signal available : std_logic ;
	signal new_byte_out : std_logic ;
	signal nmea_byte_out : std_logic_vector(7 downto 0) ;
	signal frame_size : std_logic_vector(7 downto 0) ;
	signal end_of_frame : std_logic ;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant baud_period : time := 8680 ns;
	
	constant data_serial : std_logic_vector(7 downto 0) := X"5A";
	constant gps_string : STRING (1 to 27):="$GPRMC,0,0,0,1,0,0,0,0,0*56";
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: async_serial 
		GENERIC MAP(CLK_FREQ => 100_000_000)
		PORT MAP (
          clk => clk,
          reset => reset,
          rx => rx,
          tx => tx,
          data_out => data_out,
          data_in => data_in,
          data_ready => data_ready,
          data_send => data_send, 
			 available => available
        );

	 nmea_filter : nmea_frame_extractor 
		generic map(nmea_header => "$GPRMC")
		port map(
		   clk => clk,
		   reset => reset,
			nmea_byte_in => data_out,
			new_byte_in  => data_ready,
			nmea_byte_out => nmea_byte_out,
			new_byte_out => new_byte_out,
			frame_size => frame_size,
			end_of_frame => end_of_frame
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
      -- hold reset state for 100 ns.
		reset <= '1' ;
--		rx <= '1' ;
      wait for 100 ns;	
		reset <= '0' ;
--      wait for clk_period*10;
--		rx <= '1' ;
--		wait for baud_period*10;
--		rx <= '0' ; -- start
--		wait for baud_period;
--		loop_0 : for i in 0 to 7 loop
--			rx <= data_serial(i) ; -- start
--			wait for baud_period;
--		end loop ;
--		rx <= '1' ;
--		wait for baud_period*10;
--		
--		rx <= '0' ; -- start
--		wait for baud_period;
--		loop_1 : for i in 0 to 7 loop
--			rx <= data_serial(i) ; -- start
--			wait for baud_period;
--		end loop ;
--		rx <= '0' ;
--		wait for baud_period;
--		rx <= '1' ;
--		wait for baud_period*10;
--      -- insert stimulus here 
--		rx <= '0' ; -- start
--		wait for baud_period;
--		loop_2 : for i in 0 to 7 loop
--			rx <= data_serial(i) ; -- start
--			wait for baud_period;
--		end loop ;
--		rx <= '1' ;
--		wait for baud_period*10 ;
--		rx <= tx ;
		for i in 1 to gps_string'length loop
				data_in <= std_logic_vector(to_unsigned(character'pos(gps_string(i)), 8));
				data_send <= '1' ;
				wait until available = '0' ;
				data_send <= '0' ;
				wait until data_ready = '1' ;
		end loop ;
		
		for i in 0 to 8 loop
			data_in <= X"0D";
			data_send <= '1' ;
			wait until available = '0' ;
			data_send <= '0' ;
			wait until data_ready = '1' ;
		end loop ;
	
		wait;
   end process;
	rx <= tx ;
	
END;
