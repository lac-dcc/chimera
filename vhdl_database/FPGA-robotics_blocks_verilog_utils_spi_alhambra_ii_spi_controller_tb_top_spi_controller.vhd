--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:29:12 06/13/2021
-- Design Name:   
-- Module Name:   F:/urjc/proyectos/jderobot/fpga-robot/Blocks/General_Blocks/spi/alhambra_ii/spi_controller/tb_top_spi_controller.vhd
-- Project Name:  spi_controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_spi_controller
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
 
ENTITY tb_top_spi_controller IS
END tb_top_spi_controller;
 
ARCHITECTURE behavior OF tb_top_spi_controller IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_spi_controller
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         motor_pwm_left_i : IN  std_logic_vector(7 downto 0);
         motor_pwm_rght_i : IN  std_logic_vector(7 downto 0);
         motor_dps_limit_i : IN  std_logic_vector(15 downto 0);
         motor_dps_left_i : IN  std_logic_vector(15 downto 0);
         motor_dps_rght_i : IN  std_logic_vector(15 downto 0);
         led_eye_left_rgb_i : IN  std_logic_vector(23 downto 0);
         led_eye_rght_rgb_i : IN  std_logic_vector(23 downto 0);
         led_blink_left_rgb_i : IN  std_logic_vector(23 downto 0);
         led_blink_rght_rgb_i : IN  std_logic_vector(23 downto 0);

         servo_spi_1_i : IN  std_logic_vector(16-1 downto 0);
         servo_spi_2_i : IN  std_logic_vector(16-1 downto 0);

         get_motor_ticks_left_i : in std_logic;  -- get left motor ticks 
         get_motor_ticks_rght_i : in std_logic;  -- get right motor ticks
         -- left motor ticks are ready (one clk)
         motor_ticks_left_rdy_o : out std_logic;
         -- right motor ticks are ready (one clk)
         motor_ticks_rght_rdy_o : out std_logic;
         -- motor ticks value are 32 bits in 2's complement
         motor_ticks_left_o : out std_logic_vector(31 downto 0);-- left motor
         motor_ticks_rght_o : out std_logic_vector(31 downto 0);-- right motor

         leds : OUT  std_logic_vector(7 downto 0);
         sclk_o : OUT  std_logic;
         miso_i : IN  std_logic;
         mosi_o : OUT  std_logic;
         spi_ss_n : OUT  std_logic;
         rpi_running : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal motor_pwm_left_i : std_logic_vector(7 downto 0) := (others => '0');
   signal motor_pwm_rght_i : std_logic_vector(7 downto 0) := (others => '0');
   signal motor_dps_limit_i : std_logic_vector(15 downto 0) := (others => '0');
   signal motor_dps_left_i : std_logic_vector(15 downto 0) := (others => '0');
   signal motor_dps_rght_i : std_logic_vector(15 downto 0) := (others => '0');
   signal led_eye_left_rgb_i : std_logic_vector(23 downto 0) := (others => '0');
   signal led_eye_rght_rgb_i : std_logic_vector(23 downto 0) := (others => '0');
   signal led_blink_left_rgb_i:std_logic_vector(23 downto 0) := (others => '0');
   signal led_blink_rght_rgb_i:std_logic_vector(23 downto 0) := (others => '0');

   signal servo_spi_1_i:std_logic_vector(16-1 downto 0) := (others => '0');
   signal servo_spi_2_i:std_logic_vector(16-1 downto 0) := (others => '0');

   signal get_motor_ticks_left_i : std_logic := '0';-- get left motor ticks 
   signal get_motor_ticks_rght_i : std_logic := '0';-- get right motor ticks

   signal miso_i : std_logic := '0';

 	--Outputs
   -- left motor ticks are ready (one clk)
   signal motor_ticks_left_rdy_o : std_logic;
   -- right motor ticks are ready (one clk)
   signal motor_ticks_rght_rdy_o : std_logic;
   -- motor ticks value are 32 bits in 2's complement
   signal motor_ticks_left_o : std_logic_vector(31 downto 0);-- left motor
   signal motor_ticks_rght_o : std_logic_vector(31 downto 0);-- right motor

   signal leds : std_logic_vector(7 downto 0);
   signal sclk_o : std_logic;
   signal mosi_o : std_logic;
   signal spi_ss_n : std_logic;
   signal rpi_running : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_spi_controller PORT MAP (
          clk => clk,
          rst => rst,
          motor_pwm_left_i => motor_pwm_left_i,
          motor_pwm_rght_i => motor_pwm_rght_i,
          motor_dps_limit_i => motor_dps_limit_i,
          motor_dps_left_i => motor_dps_left_i,
          motor_dps_rght_i => motor_dps_rght_i,
          led_eye_left_rgb_i => led_eye_left_rgb_i,
          led_eye_rght_rgb_i => led_eye_rght_rgb_i,
          led_blink_left_rgb_i => led_blink_left_rgb_i,
          led_blink_rght_rgb_i => led_blink_rght_rgb_i,

          servo_spi_1_i        => servo_spi_1_i,
          servo_spi_2_i        => servo_spi_2_i,

          get_motor_ticks_left_i => get_motor_ticks_left_i,
          get_motor_ticks_rght_i => get_motor_ticks_rght_i,
          motor_ticks_left_rdy_o => motor_ticks_left_rdy_o,
          motor_ticks_rght_rdy_o => motor_ticks_rght_rdy_o,
          motor_ticks_left_o     => motor_ticks_left_o,
          motor_ticks_rght_o     => motor_ticks_rght_o,

          leds => leds,
          sclk_o => sclk_o,

          miso_i => miso_i,
          mosi_o => mosi_o,
          spi_ss_n => spi_ss_n,
          rpi_running => rpi_running
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
      rst <='1';
      wait for 34 ns;	
      rst <= '0';
      wait for clk_period*1000;
      led_eye_left_rgb_i <= x"FFAACC"; --"11111111_10101010_11001100";
      wait for clk_period*1000;
      led_eye_rght_rgb_i <= x"00AAFF"; --"00000000_10101010_11111111";
      wait for clk_period*10000;
      led_eye_left_rgb_i <= x"7FAACC"; -- "01111111_10101010_11001100";
      wait for clk_period*10000;
      motor_pwm_left_i <= x"55"; -- "01010101";
      wait for clk_period*10000;
      motor_pwm_rght_i <= x"D5"; --"11010101";
      wait for clk_period*10000;
      motor_dps_limit_i <= x"012C"; --"00000001_00101100";
      wait for clk_period*10000;
      led_eye_left_rgb_i <= x"1132CC"; -- "00010001_00110010_11001100";
      wait for clk_period*10000;
      wait until clk'event and clk= '1';
      get_motor_ticks_left_i <= '1';   -- get left motor ticks
      wait until clk'event and clk= '1';
      get_motor_ticks_left_i <= '0';
      wait for clk_period*10000;
      wait until clk'event and clk= '1';
      get_motor_ticks_rght_i <= '1';  -- get right motor ticks
      wait until clk'event and clk= '1';
      get_motor_ticks_rght_i <= '0';

      wait for clk_period*10000;  -- servos
      wait until clk'event and clk= '1';
      servo_spi_1_i <= x"03E8"; -- 1000 us -> -90 degrees
      servo_spi_2_i <= x"07D0"; -- 2000 us -> +90 degrees
      wait for clk_period*10000;

      wait for clk_period*10000;  -- servos
      wait until clk'event and clk= '1';
      servo_spi_1_i <= x"05DC"; -- 1500 us ->   0 degrees
      servo_spi_2_i <= x"06D6"; -- 1750 us -> +45 degrees
      wait for clk_period*10000;
      wait;

      wait;
   end process;

   -- simulates the gopigo MISO
   gopigo_sim: process(spi_ss_n, sclk_o)
     -- indicates which spi byte is being sent
     variable spi_byte : integer range 0 to 15;
     variable clk_up_cnt   : integer range 0 to 7;
     variable clk_down_cnt : integer range 0 to 7;
   begin
     miso_i <= '0';
     if spi_ss_n = '1' then
       spi_byte := 0; -- not enabled, count to zero
     else  -- enabled
       if sclk_o'event and sclk_o='1' then -- rising edge
         if clk_up_cnt = 7 then
           clk_up_cnt := 0;
         else
           clk_up_cnt := clk_up_cnt + 1;
         end if;
       elsif sclk_o'event and sclk_o='0' then -- falling edge
         if clk_down_cnt = 7 then
           clk_down_cnt := 0;
           spi_byte := spi_byte + 1;
         else
           clk_down_cnt := clk_down_cnt + 1;
         end if;
       end if;
       if spi_byte = 3 then -- send gopigo acknowledgement 0xA5 1010_0101 
         case clk_down_cnt is
           when 0 | 2 | 5 | 7 =>
             miso_i <= '1';
           when others =>
             miso_i <= '0';
         end case;
       -- this is to test receiving data from the slave
       elsif spi_byte = 4 then -- byte 3: 0001_0101: 0x15 (for example)
         case clk_down_cnt is
           when 3 | 5 | 7 =>
             miso_i <= '1';
           when others =>
             miso_i <= '0';
         end case;
       elsif spi_byte = 5 then -- byte 2: 1000_1001: 0x89 (for example)
         case clk_down_cnt is
           when 0 | 4 | 7 =>
             miso_i <= '1';
           when others =>
             miso_i <= '0';
         end case;
       elsif spi_byte = 6 then -- byte 1: 1100_0010: 0xC2 (for example)
         case clk_down_cnt is
           when 0 | 1 | 6 =>
             miso_i <= '1';
           when others =>
             miso_i <= '0';
         end case;
       elsif spi_byte = 7 then -- byte 0: 1111_1101: 0xFD (for example)
         case clk_down_cnt is
           when 0 | 1 | 2 | 3 | 4 | 5| 7 =>
             miso_i <= '1';
           when others =>
             miso_i <= '0';
         end case;
       end if;
     end if;
   end process;

     

END;
