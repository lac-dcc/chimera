------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--------------------------------------------------------------------------------
-- Create Date:   16:53:32 12/28/2021
-- Project Name:  ov7670x3_vga160x120_spipan
-- 
-- VHDL Test Bench Created by ISE for module: servo_pan_ctrl_spi
-- 
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY tb_servo_pan_ctrl_spi IS
END tb_servo_pan_ctrl_spi;
 
ARCHITECTURE behavior OF tb_servo_pan_ctrl_spi IS 
 
    COMPONENT servo_pan_ctrl_spi
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         centroid : IN  std_logic_vector(7 downto 0);
         new_centroid : IN  std_logic;
         proximity : IN  std_logic_vector(2 downto 0);
         servo_cam_pan_o : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal centroid : std_logic_vector(7 downto 0) := (others => '0');
   signal new_centroid : std_logic := '0';
   signal proximity : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal servo_cam_pan_o : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns; -- 50MHz clock
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: servo_pan_ctrl_spi PORT MAP (
          rst => rst,
          clk => clk,
          centroid => centroid,
          new_centroid => new_centroid,
          proximity => proximity,
          servo_cam_pan_o => servo_cam_pan_o
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 
   -- reset
   rst_proc: process
   begin		
      rst <= '1';-- hold reset state for 100 ns.
      wait for 95 ns;	
      rst <= '0'; -- unreset
      wait;
   end process;

  -- Stimulus process
  stim_proc: process
  begin		
    wait for 1000*clk_period;
    wait until clk'event and clk='1';
    centroid <= "10000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "01000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "01000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "01000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "01000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "01000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "01000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00100000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00100000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00100000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00100000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00100000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00010000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00010000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00010000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00011000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00011000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00011000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00011000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00001000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00001000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00001000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00001000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000100";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000100";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000100";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000010";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000010";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000010";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000001";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000001";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000001";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    for i in 0 to 1000 loop
      wait until clk'event and clk='1';
      centroid <= "00000000";
      new_centroid <= '1';
      wait until clk'event and clk='1';
      new_centroid <= '0';
      wait for 999*clk_period;
    end loop;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000001";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000001";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000001";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "00000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "10000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "10000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "01000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait until clk'event and clk='1';
    centroid <= "01000000";
    new_centroid <= '1';
    wait until clk'event and clk='1';
    new_centroid <= '0';
    wait for 999*clk_period;
    ------------------------
    wait;
  end process;

END;
