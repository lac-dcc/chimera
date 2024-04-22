LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY tb_pwm IS
END tb_pwm;
 
ARCHITECTURE behavior OF tb_pwm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pwm_motor
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         new_vel_i : IN  std_logic;
         dir_i : IN  std_logic;
         vel_i : IN  std_logic_vector(2 downto 0);
         dir_o1 : OUT  std_logic;
         dir_o2 : OUT  std_logic;
         pwm : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal new_vel : std_logic := '0';
   signal dir : std_logic := '0';
   signal vel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal dir_o1 : std_logic;
   signal dir_o2 : std_logic;
   signal pwm : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1000 ns / 12;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pwm_motor PORT MAP (
          rst => rst,
          clk => clk,
          new_vel_i => new_vel,
          dir_i => dir,
          vel_i => vel,
          dir_o1 => dir_o1,
          dir_o2 => dir_o2,
          pwm => pwm
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
      wait for 100 ns;	
      rst <= '0';
      wait for clk_period*10;
      dir <= '0';
      new_vel <= '1';
      vel <= "001";
      wait for clk_period;
      dir <= '0';
      new_vel <= '0';
      vel <= "010";
      wait for 500*clk_period;
      dir <= '1';
      new_vel <= '1';
      vel <= "111";
      wait for clk_period;
      dir <= '0';
      new_vel <= '0';
      vel <= "010";
      wait;
   end process;

END;
