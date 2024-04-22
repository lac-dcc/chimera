--------------------------------------------------------------------------------
-- Engineer:		Mike Field <hamster@snap.net.nz>
-- Description:   test bench for DVI-D source interface (without PnP features!
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_dvid IS
END tb_dvid;
 
ARCHITECTURE behavior OF tb_dvid IS 
    COMPONENT dvid
    PORT(
         clk     : IN  std_logic;
         clk_n   : IN  std_logic;
         red_p   : IN  std_logic_vector(7 downto 0);
         green_p : IN  std_logic_vector(7 downto 0);
         blue_p  : IN  std_logic_vector(7 downto 0);
         blank   : IN  std_logic;
         hsync   : IN  std_logic;
         vsync   : IN  std_logic;
         red_s   : OUT  std_logic;
         green_s : OUT  std_logic;
         blue_s  : OUT  std_logic;
         clock_s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk     : std_logic := '0';
   signal clk_n   : std_logic := '0';
   signal red_p   : std_logic_vector(7 downto 0) := (others => '0');
   signal green_p : std_logic_vector(7 downto 0) := (others => '0');
   signal blue_p  : std_logic_vector(7 downto 0) := (others => '0');
   signal blank   : std_logic := '0';
   signal hsync   : std_logic := '0';
   signal vsync   : std_logic := '0';

 	--Outputs
   signal red_s   : std_logic;
   signal green_s : std_logic;
   signal blue_s  : std_logic;
   signal clock_s : std_logic;

   -- Clock period definitions
   constant clk_period  : time := 10 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dvid PORT MAP (
          clk     => clk,
          clk_n   => clk_n,
          red_p   => red_p,
          green_p => green_p,
          blue_p  => blue_p,
          blank   => blank,
          hsync   => hsync,
          vsync   => vsync,
          red_s   => red_s,
          green_s => green_s,
          blue_s  => blue_s,
          clock_s => clock_s
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk   <= '0';
		clk_n <= '1';
		wait for clk_period/2;
		
		clk   <= '1';
		clk_n <= '0';
		wait for clk_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      wait for clk_period*10;
      -- insert stimulus here 
      wait;
   end process;
END;
