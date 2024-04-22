LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_motor_ctrl_spi IS
END tb_motor_ctrl_spi;
 
ARCHITECTURE behavior OF tb_motor_ctrl_spi IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT motor_ctrl_spi
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         enable : IN  std_logic;
         centroid : IN  std_logic_vector(7 downto 0);
         new_centroid : IN  std_logic;
         proximity : IN  std_logic_vector(2 downto 0);
         motor_dps_left_o : OUT  std_logic_vector(15 downto 0);
         motor_dps_rght_o : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';
   signal centroid : std_logic_vector(7 downto 0) := (others => '0');
   signal new_centroid : std_logic := '0';
   signal proximity : unsigned(2 downto 0) := (others => '0');
   signal proximity_std : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal motor_dps_left_o : std_logic_vector(15 downto 0);
   signal motor_dps_rght_o : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns; -- 50MHz clock
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: motor_ctrl_spi PORT MAP (
          rst => rst,
          clk => clk,
          enable => enable,
          centroid => centroid,
          new_centroid => new_centroid,
          proximity => proximity_std,
          motor_dps_left_o => motor_dps_left_o,
          motor_dps_rght_o => motor_dps_rght_o
        );

   proximity_std <= std_logic_vector(proximity);

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   rst_en_proc: process
   begin		
      rst    <= '1';
      enable <= '0';
      wait for 95 ns;	
      rst <= '0';
      wait for 99 ns;
      enable <= '1';
      wait;
   end process;


   centr_proc: process
   begin		
      wait until clk'event and clk='1';
      centroid  <= "00000000";
      proximity <= proximity + 1;
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	

      wait until clk'event and clk='1';
      centroid  <= "10000000";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	

      wait until clk'event and clk='1';
      centroid  <= "01000000";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	

      wait until clk'event and clk='1';
      centroid  <= "00100000";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	

      wait until clk'event and clk='1';
      centroid  <= "00010000";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	

      wait until clk'event and clk='1';
      centroid  <= "00011000";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	

      wait until clk'event and clk='1';
      centroid  <= "00001000";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	

      wait until clk'event and clk='1';
      centroid  <= "00000100";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	

      wait until clk'event and clk='1';
      centroid  <= "00000010";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	

      wait until clk'event and clk='1';
      centroid  <= "00000010";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	

      wait until clk'event and clk='1';
      centroid  <= "00000000";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	


      wait until clk'event and clk='1';
      centroid  <= "00000000";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	


      wait until clk'event and clk='1';
      centroid  <= "00000000";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 500 ns;	

   end process;

END;
