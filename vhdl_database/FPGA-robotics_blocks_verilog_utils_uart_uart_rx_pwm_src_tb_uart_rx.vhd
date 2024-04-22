LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
--USE ieee.numeric_std.ALL;
 
ENTITY tb_uart_rx IS
END tb_uart_rx;
 
ARCHITECTURE behavior OF tb_uart_rx IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart_rx
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         uart_rx_i : IN  std_logic;
         receiving : OUT  std_logic;
         dat_ready : OUT  std_logic;
         dat_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal uart_rx_d : std_logic := '0';

 	--Outputs
   signal receiving : std_logic;
   signal dat_ready : std_logic;
   signal dat_o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   -- Clock period definitions
   constant clk_period : time := 1000 ns / 12.0;
   --constant clk_period : time := 10 ns; -- for Nexys 4

   -- baud rate: 115200
   constant baud_period : time := 8680 ns;  -- 8680.55556
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart_rx PORT MAP (
          rst => rst,
          clk => clk,
          uart_rx_i => uart_rx_d,
          receiving => receiving,
          dat_ready => dat_ready,
          dat_o => dat_o
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
