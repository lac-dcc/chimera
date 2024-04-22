--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_uno IS
END tb_uno;
 
ARCHITECTURE behavior OF tb_uno IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_colorcentroid
      PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         rgbfilter : IN  std_logic_vector(2 downto 0);
         proc_we   : OUT  std_logic;
         proc_pxl  : OUT  std_logic_vector(11 downto 0);
         proc_addr : OUT  std_logic_vector(12 downto 0);
         centroid  : OUT  std_logic_vector(8-1 downto 0)
      );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal rgbfilter : std_logic_vector(2 downto 0) := (others => '0');

   --Outputs
   signal proc_we : std_logic;
   signal proc_pxl : std_logic_vector(11 downto 0);
   signal proc_addr : std_logic_vector(12 downto 0);
   signal centroid : std_logic_vector(8-1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
  -- Instantiate the Unit Under Test (UUT)
   uut: top_colorcentroid
     PORT MAP (
       clk => clk,
       rst => rst,
       rgbfilter => rgbfilter,
       proc_we => proc_we,
       proc_pxl  => proc_pxl,
       proc_addr => proc_addr,
       centroid  => centroid
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
     rst <= '1';
     rgbfilter <= "100";
     wait for 40 ns;
     rst <= '0';
     wait;
   end process;

END;
