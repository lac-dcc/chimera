--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:36:20 05/12/2013
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/logi-family/logi-projects/AVC2013/avc_platform/pid_controller_tb.vhd
-- Project Name:  avc_platform
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pid_controller
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
 
ENTITY pid_controller_tb IS
END pid_controller_tb;
 
ARCHITECTURE behavior OF pid_controller_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pid_controller
    PORT(
         clk : IN  std_logic;
         resetn : IN  std_logic;
         en : IN  std_logic;
         reset : IN  std_logic;
         speed_input : IN  signed(15 downto 0);
         P : IN  signed(15 downto 0);
         I : IN  signed(15 downto 0);
         D : IN  signed(15 downto 0);
         ENC_A : IN  std_logic;
         ENC_B : IN  std_logic;
         encoder_count : OUT  signed(15 downto 0);
         command : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	 
	component pid_filter is
		generic(clk_period_ns : integer := 8;
		  pid_period_ns : integer := 20000000); -- 50Hz PID for RC based ESC
		port(
		clk, resetn : in std_logic ;
		en : in std_logic ;
		K, AK : in std_logic_vector(15 downto 0);
		B : in std_logic_vector(15 downto 0);
		setpoint : in signed(15 downto 0);
		ENC_A : in std_logic ;
		ENC_B : in std_logic ;
		cmd : out std_logic_vector(15 downto 0);
		dir : out std_logic 
		);
	end component;
	 
	component dc_motor_model is
		port(
		pwm_duty : in std_logic_vector(7 downto 0) ;
		encoder_output : out std_logic 
		);
	end component;
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal en : std_logic := '0';
   signal reset : std_logic := '0';
   signal speed_input : signed(15 downto 0) := (others => '0');
   signal P : signed(15 downto 0) := (others => '0');
   signal I : signed(15 downto 0) := (others => '0');
   signal D : signed(15 downto 0) := (others => '0');
   signal ENC_A : std_logic := '0';
   signal ENC_B : std_logic := '0';

 	--Outputs
   signal encoder_count : signed(15 downto 0);
   signal command : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
--   uut: pid_controller PORT MAP (
--          clk => clk,
--          resetn => resetn,
--          en => en,
--          reset => reset,
--          speed_input => speed_input,
--          P => P,
--          I => I,
--          D => D,
--          ENC_A => ENC_A,
--          ENC_B => ENC_B,
--          encoder_count => encoder_count,
--          command => command
--        );
		  
pif_filter0 : pid_filter
		generic map(clk_period_ns => 10,
		  pid_period_ns => 1000000)
		port map(
		clk => clk, 
		resetn => resetn, 
		en => en, 
		K => X"0400", 
		AK => X"0200",
		B => X"0200",
		setpoint => speed_input,
		ENC_A => ENC_A,
		ENC_B => ENC_B,
		cmd => command ,
		dir => open 
		);  
		  
		  
	motor_inst : dc_motor_model
		port map(
		pwm_duty => command(7 downto 0) ,
		encoder_output => ENC_A
		);  
	 ENC_B <= '1' ;	  
		  
	en <= '1' ;
	P <= SHIFT_LEFT (to_signed(10, 16), 8);
	I <= SHIFT_LEFT (to_signed(5, 16), 8);
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0' ;
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		resetn <= '0';
		speed_input <= to_signed(1000, 16);
      wait for 100 ns;	
		resetn <= '1';
      wait for clk_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;
