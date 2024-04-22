--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:50:20 01/29/2021
-- Design Name:   
-- Module Name:   /mnt/hgfs/patrick/Dropbox/University-College-London/UCL-CS/Year-3/Research-Project/cpu-fpga-nwofle/hw/dns-anomaly/test.vhd
-- Project Name:  dns-anomaly
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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

ENTITY test IS
END test;

ARCHITECTURE behavior OF test IS

  -- Component Declaration for the Unit Under Test (UUT)

  COMPONENT main
    PORT (
      clk : IN STD_LOGIC;
      E_RX_CLK : IN STD_LOGIC;
      E_RX_DV : IN STD_LOGIC;
      E_RXD : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      E_RX_ER : IN STD_LOGIC;
      E_TX_CLK : IN STD_LOGIC;
      E_TX_EN : OUT STD_LOGIC;
      E_TXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      E_TX_ER : OUT STD_LOGIC;
      LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT;
  --Inputs
  SIGNAL clk : STD_LOGIC := '0';
  SIGNAL E_RX_CLK : STD_LOGIC := '0';
  SIGNAL E_RX_DV : STD_LOGIC := '0';
  SIGNAL E_RXD : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL E_RX_ER : STD_LOGIC := '0';
  SIGNAL E_TX_CLK : STD_LOGIC := '0';

  --Outputs
  SIGNAL E_TX_EN : STD_LOGIC;
  SIGNAL E_TXD : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL E_TX_ER : STD_LOGIC;
  SIGNAL LED : STD_LOGIC_VECTOR(7 DOWNTO 0);

  -- Clock period definitions
  CONSTANT clk_period : TIME := 10 ns;
  CONSTANT E_RX_CLK_period : TIME := 20 ns;
  CONSTANT E_TX_CLK_period : TIME := 20 ns;

BEGIN

  -- Instantiate the Unit Under Test (UUT)
  uut : main PORT MAP(
    clk => clk,
    E_RX_CLK => E_RX_CLK,
    E_RX_DV => E_RX_DV,
    E_RXD => E_RXD,
    E_RX_ER => E_RX_ER,
    E_TX_CLK => E_TX_CLK,
    E_TX_EN => E_TX_EN,
    E_TXD => E_TXD,
    E_TX_ER => E_TX_ER,
    LED => LED
  );

  -- Clock process definitions
  clk_process : PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;

  E_RX_CLK_process : PROCESS
  BEGIN
    E_RX_CLK <= '0';
    WAIT FOR E_RX_CLK_period/2;
    E_RX_CLK <= '1';
    WAIT FOR E_RX_CLK_period/2;
  END PROCESS;

  E_TX_CLK_process : PROCESS
  BEGIN
    E_TX_CLK <= '0';
    WAIT FOR E_TX_CLK_period/2;
    E_TX_CLK <= '1';
    WAIT FOR E_TX_CLK_period/2;
  END PROCESS;
  -- Stimulus process
  stim_proc : PROCESS
  BEGIN
    -- hold reset state for 100 ns.
    WAIT FOR 100 ns;

    WAIT FOR clk_period * 10;

    -- insert stimulus here

    WAIT;
  END PROCESS;

END;