--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:42:59 10/10/2017
-- Design Name:   
-- Module Name:   U:/AppleIISd/VHDL/IO_Test.vhd
-- Project Name:  AppleIISd
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IO
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
 
ENTITY AppleIISd_Test IS
END AppleIISd_Test;
 
ARCHITECTURE behavior OF AppleIISd_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AppleIISd
    PORT(
         ADD_HIGH : IN  std_logic_vector(11 downto 8);
         ADD_LOW : IN  std_logic_vector(1 downto 0);
         B : OUT  std_logic_vector(10 downto 8);
         CARD : IN  std_logic;
         DATA : INOUT  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         LED : OUT  std_logic;
         NDEV_SEL : IN  std_logic;
         NG : OUT  std_logic;
         NIO_SEL : IN  std_logic;
         NIO_STB : IN  std_logic;
         NOE : OUT  std_logic;
         PHI0 : IN  std_logic;
         NRESET : IN  std_logic;
         RNW : IN  std_logic;
         MISO : IN  std_logic;
         MOSI : OUT  std_logic;
         NSEL : OUT  std_logic;
         SCLK : OUT  std_logic;
         WP : IN  std_logic;
         
         data_dbg : out std_logic_vector (7 downto 0);
         add_dbg : out std_logic_vector (1 downto 0);
         data_en_dbg : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ADD_HIGH : std_logic_vector(11 downto 8) := (others => '0');
   signal ADD_LOW : std_logic_vector(1 downto 0) := (others => 'U');
   signal CARD : std_logic := '0';
   signal CLK : std_logic := '0';
   signal NDEV_SEL : std_logic := '1';
   signal NIO_SEL : std_logic := '1';
   signal NIO_STB : std_logic := '1';
   signal PHI0 : std_logic := '1';
   signal NRESET : std_logic := '1';
   signal RNW : std_logic := '1';
   signal MISO : std_logic := '1';
   signal WP : std_logic := '0';

	--BiDirs
   signal DATA : std_logic_vector(7 downto 0) := (others => 'Z');

 	--Outputs
   signal B : std_logic_vector(10 downto 8);
   signal LED : std_logic;
   signal NG : std_logic;
   signal NOE : std_logic;
   signal MOSI : std_logic;
   signal NSEL : std_logic;
   signal SCLK : std_logic;
   
   signal data_dbg : std_logic_vector (7 downto 0);
   signal add_dbg : std_logic_vector (1 downto 0);
   signal data_en_dbg : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 142 ns;
   
   -- Bus timings
   -- worst case
   constant ADD_valid : time := 300 ns;     -- II+
   constant DATA_valid : time := 200 ns;    -- II+
   constant ADD_hold : time := 15 ns;       -- IIgs
   --best case
   --constant ADD_valid : time := 100 ns;     -- IIgs
   --constant DATA_valid : time := 30 ns;     -- IIgs
   --constant ADD_hold : time := 15 ns;       -- IIgs
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AppleIISd PORT MAP (
          ADD_HIGH => ADD_HIGH,
          ADD_LOW => ADD_LOW,
          B => B,
          CARD => CARD,
          DATA => DATA,
          CLK => CLK,
          LED => LED,
          NDEV_SEL => NDEV_SEL,
          NG => NG,
          NIO_SEL => NIO_SEL,
          NIO_STB => NIO_STB,
          NOE => NOE,
          PHI0 => PHI0,
          NRESET => NRESET,
          RNW => RNW,
          MISO => MISO,
          MOSI => MOSI,
          NSEL => NSEL,
          SCLK => SCLK,
          WP => WP,
          
          data_dbg => data_dbg,
          add_dbg => add_dbg,
          data_en_dbg => data_en_dbg
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   PHI0_process :process(CLK)
   variable counter : integer range 0 to 7;
   begin
        if rising_edge(CLK) or falling_edge(CLK) then
            counter := counter + 1;
            if counter = 7 then
                PHI0 <= not PHI0;
                counter := 0;
            end if;
        end if;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state.
      wait for CLK_period * 10;	
      NRESET <= '0';
      wait for CLK_period * 20;
      NRESET <= '1';
      wait for CLK_period * 10;
      DATA <= (others => 'Z');
      ADD_LOW <= (others => 'U');
      
      -- read reg 3
      wait until falling_edge(PHI0);
      wait for ADD_valid;
      ADD_LOW <= (others => '1');
      RNW <= '1';
      DATA <= (others => 'U');
      wait until rising_edge(PHI0);
      NDEV_SEL <= '0';
      DATA <= (others => 'Z');
      wait until falling_edge(PHI0);
      NDEV_SEL <= '1';
      wait for ADD_hold;
      ADD_LOW <= (others => 'U');
      
      -- select card
      wait until falling_edge(PHI0);
      wait for ADD_valid;
      ADD_LOW <= (others => '1');
      RNW <= '0';
      DATA <= (others => 'U');
      wait until rising_edge(PHI0);
      NDEV_SEL <= '0';
      DATA <= (others => 'Z');
      wait for DATA_valid;
      DATA <= X"00";
      wait until falling_edge(PHI0);
      NDEV_SEL <= '1';
      wait for ADD_hold;
      --wait for CLK_period;
      ADD_LOW <= (others => 'U');
      RNW <= '1';
      DATA <= (others => 'Z');
      
      -- send data
      wait until falling_edge(PHI0);
      wait for ADD_valid;
      ADD_LOW <= (others => '0');
      RNW <= '0';
      DATA <= (others => 'U');
      wait until rising_edge(PHI0);
      NDEV_SEL <= '0';
      DATA <= (others => 'Z');
      wait for DATA_valid;
      DATA <= X"AA";
      wait until falling_edge(PHI0);
      NDEV_SEL <= '1';
      wait for ADD_hold;
      --wait for CLK_period;
      ADD_LOW <= (others => 'U');
      RNW <= '1';
      DATA <= (others => 'Z');
      wait for 20 us;
      
      -- deselect card
      wait until falling_edge(PHI0);
      wait for ADD_valid;
      ADD_LOW <= (others => '1');
      RNW <= '0';
      DATA <= (others => 'U');
      wait until rising_edge(PHI0);
      NDEV_SEL <= '0';
      DATA <= (others => 'Z');
      wait for DATA_valid;
      DATA <= X"01";
      wait until falling_edge(PHI0);
      NDEV_SEL <= '1';
      wait for ADD_hold;
      --wait for CLK_period;
      ADD_LOW <= (others => 'U');
      RNW <= '1';
      DATA <= (others => 'Z');
      
      -- write ece
      wait until falling_edge(PHI0);
      wait for ADD_valid;
      ADD_LOW <= "01";
      RNW <= '0';
      DATA <= (others => 'U');
      wait until rising_edge(PHI0);
      NDEV_SEL <= '0';
      DATA <= (others => 'Z');
      wait for DATA_valid;
      DATA <= x"04";
      wait until falling_edge(PHI0);
      NDEV_SEL <= '1';
      wait for ADD_hold;
      --wait for CLK_period;
      ADD_LOW <= (others => 'U');
      RNW <= '1';
      DATA <= (others => 'Z');
      
      -- send data
      wait until falling_edge(PHI0);
      wait for ADD_valid;
      ADD_LOW <= (others => '0');
      RNW <= '0';
      DATA <= (others => 'U');
      wait until rising_edge(PHI0);
      NDEV_SEL <= '0';
      DATA <= (others => 'Z');
      wait for DATA_valid;
      DATA <= X"AA";
      wait until falling_edge(PHI0);
      NDEV_SEL <= '1';
      wait for ADD_hold;
      --wait for CLK_period;
      ADD_LOW <= (others => 'U');
      RNW <= '1';
      DATA <= (others => 'Z');
      
      -- read eprom low
      wait for 3 us;
      wait until falling_edge(PHI0);
      wait for ADD_valid;
      ADD_LOW <= (others => '0');
      ADD_HIGH <= "0100";   -- must become "111"
      RNW <= '1';
      DATA <= (others => 'U');
      wait until rising_edge(PHI0);
      NIO_SEL <= '0';
      DATA <= (others => 'Z');
      wait until falling_edge(PHI0);
      NIO_SEL <= '1';
      wait for ADD_hold;
      ADD_LOW <= (others => 'U');
      ADD_HIGH <= (others => 'U');
      
      -- read eprom high, selected
      wait until falling_edge(PHI0);
      wait for ADD_valid;
      ADD_LOW <= (others => '0');
      ADD_HIGH <= "1001";   -- must become "001"
      RNW <= '1';
      DATA <= (others => 'U');
      wait until rising_edge(PHI0);
      NIO_STB <= '0';
      DATA <= (others => 'Z');
      wait until falling_edge(PHI0);
      NIO_STB <= '1';
      wait for ADD_hold;
      ADD_LOW <= (others => 'U');
      ADD_HIGH <= (others => 'U');
      
      -- read $CFFF
      wait until falling_edge(PHI0);
      wait for ADD_valid;
      ADD_LOW <= (others => '1');
      ADD_HIGH <= "1111";
      RNW <= '1';
      DATA <= (others => 'U');
      wait until rising_edge(PHI0);
      NIO_STB <= '0';
      DATA <= (others => 'Z');
      wait until falling_edge(PHI0);
      NIO_STB <= '1';
      wait for ADD_hold;
      ADD_LOW <= (others => 'U');
      ADD_HIGH <= (others => 'U');
      
      -- read eprom high, deselected
      wait until falling_edge(PHI0);
      wait for ADD_valid;
      ADD_LOW <= (others => '0');
      ADD_HIGH <= "1101";   -- must become "101"
      RNW <= '1';
      DATA <= (others => 'U');
      wait until rising_edge(PHI0);
      NIO_STB <= '0';
      DATA <= (others => 'Z');
      wait until falling_edge(PHI0);
      NIO_STB <= '1';
      wait for ADD_hold;
      ADD_LOW <= (others => 'U');
      ADD_HIGH <= (others => 'U');
      
      wait;
   end process;

END;
