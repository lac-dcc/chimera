LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_top_spi_rom IS
END tb_top_spi_rom;
 
ARCHITECTURE behavior OF tb_top_spi_rom IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT top_spi_rom
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         leds : OUT  std_logic_vector(7 downto 0);
         sclk_o : OUT  std_logic;
         miso_i : IN  std_logic;
         mosi_o : OUT  std_logic;
         spi_ss_n : OUT  std_logic;
         rpi_running : OUT std_logic  -- 1 when running, to inform gopigo
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal miso_i : std_logic := '0';

   --Outputs
   signal leds : std_logic_vector(7 downto 0);
   signal sclk_o : std_logic;
   signal mosi_o : std_logic;
   signal spi_ss_n : std_logic;
   signal rpi_running : std_logic;

   -- Clock period definitions
   constant clk_period : time := 83 ns; -- Alhambra II is 12 MHz
 
BEGIN
 
   -- Instantiate the Unit Under Test (UUT)
   uut: top_spi_rom PORT MAP (
          clk => clk,
          rst => rst,
          leds => leds,
          sclk_o => sclk_o,
          miso_i => miso_i,
          mosi_o => mosi_o,
          spi_ss_n => spi_ss_n,
	  rpi_running => rpi_running
        );

   -- Clock process definitions
   clk_process : process
   begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
      wait for 100 ns;	
      rst <= '0';
      wait;
   end process;

END;
