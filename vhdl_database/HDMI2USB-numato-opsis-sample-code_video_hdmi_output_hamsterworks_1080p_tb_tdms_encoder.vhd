LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_tdms_encoder IS
END tb_tdms_encoder;
 
ARCHITECTURE behavior OF tb_tdms_encoder IS 
    COMPONENT TDMS_encoder
    PORT(
         clk : IN  std_logic;
         data : IN  std_logic_vector(7 downto 0);
         c : IN  std_logic_vector(1 downto 0);
         blank : IN  std_logic;
         encoded : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal data : std_logic_vector(7 downto 0) := (others => '0');
   signal c : std_logic_vector(1 downto 0) := (others => '0');
   signal blank : std_logic := '0';

 	--Outputs
   signal encoded : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TDMS_encoder PORT MAP (
          clk => clk,
          data => data,
          c => c,
          blank => blank,
          encoded => encoded
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
		blank <= '0';
		c     <= "00";
      wait for 100 ns;	
		data  <= "00000000";
      wait for 100 ns;	
		data  <= "11111111";
      wait;
   end process;

END;
