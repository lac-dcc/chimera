LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
--USE ieee.numeric_std.ALL;
 
ENTITY tb_top_uart_pwm IS
END tb_top_uart_pwm;
 
ARCHITECTURE behavior OF tb_top_uart_pwm IS 
 
    COMPONENT top_uart_rx
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         uart_rx_i : IN  std_logic;
         motor1_dir1 : OUT  std_logic;
         motor1_dir2 : OUT  std_logic;
         motor1_pwm : OUT  std_logic;
         motor2_dir1 : OUT  std_logic;
         motor2_dir2 : OUT  std_logic;
         motor2_pwm : OUT  std_logic;
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal uart_rx_d : std_logic := '0';

 	--Outputs
   signal motor1_dir1 : std_logic;
   signal motor1_dir2 : std_logic;
   signal motor1_pwm : std_logic;
   signal motor2_dir1 : std_logic;
   signal motor2_dir2 : std_logic;
   signal motor2_pwm : std_logic;
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1000 ns / 12.0;
   --constant clk_period : time := 10 ns; -- for Nexys 4

   -- baud rate: 115200
   constant baud_period : time := 8680 ns;  -- 8680.55556
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_uart_rx PORT MAP (
          rst => rst,
          clk => clk,
          uart_rx_i => uart_rx_d,
          motor1_dir1 => motor1_dir1,
          motor1_dir2 => motor1_dir2,
          motor1_pwm => motor1_pwm,
          motor2_dir1 => motor2_dir1,
          motor2_dir2 => motor2_dir2,
          motor2_pwm => motor2_pwm,
          led => led
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   stim_proc: process
   begin		
      rst <='1';
      uart_rx_d <= '1';
      wait for 100 ns;	
      rst <='0';
      wait for 354 ns;
      -- init bit
      uart_rx_d <= '0';
      wait for baud_period;
      -- bit 0
      uart_rx_d <= '1';
      wait for baud_period + 1 ns; -- since it is .5 on even bits add one
      -- bit 1
      uart_rx_d <= '0';
      wait for baud_period;
      -- bit 2
      uart_rx_d <= '1';
      wait for baud_period + 1 ns;
      -- bit 3
      uart_rx_d <= '0';
      wait for baud_period;
      -- bit 4
      uart_rx_d <= '1';
      wait for baud_period + 1 ns;
      -- bit 5
      uart_rx_d <= '0';
      wait for baud_period;
      -- bit 6
      uart_rx_d <= '1';
      wait for baud_period + 1 ns;
      -- bit 7
      uart_rx_d <= '0';
      wait for baud_period;
      -- end bit
      uart_rx_d <= '1';
      wait for baud_period + 1 ns;
      wait;
   end process;



END;
