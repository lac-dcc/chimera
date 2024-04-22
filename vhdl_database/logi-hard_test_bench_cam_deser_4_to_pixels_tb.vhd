--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:40:23 12/18/2014
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-hard/test_bench/cam_deser_4_to_pixels_tb.vhd
-- Project Name:  cam_deser
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cam_deser_4_to_pixels
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
 
ENTITY cam_deser_4_to_pixels_tb IS
END cam_deser_4_to_pixels_tb;
 
ARCHITECTURE behavior OF cam_deser_4_to_pixels_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cam_deser_4_to_pixels_v2
	 generic(INVERT_DATA : boolean := true);
    PORT(
         deser_clk : IN  std_logic;
         sys_clk : IN  std_logic;
         sys_reset : IN  std_logic;
         data_in_deser : IN  std_logic_vector(3 downto 0);
         pixel_out_clk : OUT  std_logic;
         pixel_out_hsync : OUT  std_logic;
         pixel_out_vsync : OUT  std_logic;
         pixel_out_data : OUT  std_logic_vector(7 downto 0);
         synced_out : OUT  std_logic
        );
    END COMPONENT;
    
	 
	 component deser_1_4
		generic
		 (-- width of the data for the system
		  sys_w       : integer := 1;
		  -- width of the data for the device
		  dev_w       : integer := 4);
		port
		 (
		  -- From the system into the device
		  DATA_IN_FROM_PINS_P     : in    std_logic_vector(sys_w-1 downto 0);
		  DATA_IN_FROM_PINS_N     : in    std_logic_vector(sys_w-1 downto 0);
		  DATA_IN_TO_DEVICE       : out   std_logic_vector(dev_w-1 downto 0);																							 -- User should tie it to '0' if not needed
		 
		-- Clock and reset signals
		  CLK_IN_P                : in    std_logic;                    -- Differential fast clock from IOB
		  CLK_IN_N                : in    std_logic;
		  CLK_DIV_OUT             : out   std_logic;                    -- Slow clock output
		  CLK_RESET               : in    std_logic;                    -- Reset signal for Clock circuit
		  IO_RESET                : in    std_logic);                   -- Reset signal for IO circuit
		end component;

   --Inputs
   signal deser_clk : std_logic := '0';
   signal sys_clk : std_logic := '0';
   signal sys_reset : std_logic := '0';
   signal data_in_deser : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal pixel_out_clk : std_logic;
   signal pixel_out_hsync : std_logic;
   signal pixel_out_vsync : std_logic;
   signal pixel_out_data : std_logic_vector(7 downto 0);
   signal synced_out : std_logic;
	signal CLK_IN_P, CLK_IN_N, DATA_IN_FROM_PINS_P, DATA_IN_FROM_PINS_N : std_logic ;
   
	
	-- Clock period definitions
   constant ser_clk_period : time := 3 ns;
   constant sys_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cam_deser_4_to_pixels_v2 
	generic map(INVERT_DATA => false)
	PORT MAP (
          deser_clk => deser_clk,
          sys_clk => sys_clk,
          sys_reset => sys_reset,
          data_in_deser => data_in_deser,
          pixel_out_clk => pixel_out_clk,
          pixel_out_hsync => pixel_out_hsync,
          pixel_out_vsync => pixel_out_vsync,
          pixel_out_data => pixel_out_data,
          synced_out => synced_out
        );

	uut2 : deser_1_4
  port map
   (
	  -- From the system into the device
	  DATA_IN_FROM_PINS_P(0) =>   DATA_IN_FROM_PINS_P, --Input pins
	  DATA_IN_FROM_PINS_N(0) =>   DATA_IN_FROM_PINS_N, --Input pins
	  DATA_IN_TO_DEVICE =>   data_in_deser, --Output pins
	-- Clock and reset signals
	  CLK_IN_P =>   CLK_IN_P,     -- Differential clock from IOB
	  CLK_IN_N =>   CLK_IN_N,     -- Differential clock from IOB
	  CLK_DIV_OUT =>   deser_clk,     -- Slow clock output
	  CLK_RESET =>   sys_reset,         --clocking logic reset
	  IO_RESET =>   sys_reset
	  );

   -- Clock process definitions
   ser_clk_process :process
   begin
		CLK_IN_P <= '0';
		CLK_IN_N <= '1' ;
		wait for ser_clk_period/2;
		CLK_IN_P <= '1';
		CLK_IN_N <= '0' ;
		wait for ser_clk_period/2;
   end process;
 
   sys_clk_process :process
   begin
		sys_clk <= '0';
		wait for sys_clk_period/2;
		sys_clk <= '1';
		wait for sys_clk_period/2;
   end process;

 

   -- Stimulus process
   stim_proc: process
	variable data : std_logic_vector(7 downto 0) ;
	
   begin		
      -- hold reset state for 100 ns.
		sys_reset <= '1' ;
		DATA_IN_FROM_PINS_P <= '0' ;
		DATA_IN_FROM_PINS_N <= '1' ;
      wait for 100 ns;	
		sys_reset <= '0' ;
      wait until CLK_IN_P = '0'; --sync on clock
		DATA_IN_FROM_PINS_P <= '0' ;
		DATA_IN_FROM_PINS_N <= '1' ;
		wait for ser_clk_period;
		DATA_IN_FROM_PINS_P <= '0' ;
		DATA_IN_FROM_PINS_N <= '1' ;
		wait for ser_clk_period;
		DATA_IN_FROM_PINS_P <= '0' ;
		DATA_IN_FROM_PINS_N <= '1' ;
		wait for ser_clk_period;
		
--		DATA_IN_FROM_PINS_P <= '0' ;
--		DATA_IN_FROM_PINS_N <= '1' ;
--		wait for ser_clk_period;
		for j in 0 to 100 loop
			data := std_logic_vector(to_unsigned(j, 8));
			-- now issuing start bit
			DATA_IN_FROM_PINS_P <= '1' ;
			DATA_IN_FROM_PINS_N <= '0' ;
			wait for ser_clk_period;
			for i in 0 to 9 loop
				if i < 8 then
					DATA_IN_FROM_PINS_P <= data(i) ;
					DATA_IN_FROM_PINS_N <= not data(i) ;
				else
					DATA_IN_FROM_PINS_P <= '0' ;
					DATA_IN_FROM_PINS_N <= '1' ;
				end if ;
				wait for ser_clk_period;
			end loop ;
				-- now issuing stop bit
			DATA_IN_FROM_PINS_P <= '0' ;
			DATA_IN_FROM_PINS_N <= '1' ;
			wait for ser_clk_period;
		end loop ;
		-- messing up with the sync
		DATA_IN_FROM_PINS_P <= '0' ;
		DATA_IN_FROM_PINS_N <= '1' ;
		wait for ser_clk_period;
		for j in 0 to 100 loop
			-- now issuing start bit
			DATA_IN_FROM_PINS_P <= '1' ;
			DATA_IN_FROM_PINS_N <= '0' ;
			wait for ser_clk_period;
			for i in 0 to 9 loop
				DATA_IN_FROM_PINS_P <= '0' ;
				DATA_IN_FROM_PINS_N <= '1' ;
				wait for ser_clk_period;
			end loop ;
				-- now issuing stop bit
			DATA_IN_FROM_PINS_P <= '0' ;
			DATA_IN_FROM_PINS_N <= '1' ;
			wait for ser_clk_period;
		end loop ;

      -- insert stimulus here 

      wait;
   end process;

END;
