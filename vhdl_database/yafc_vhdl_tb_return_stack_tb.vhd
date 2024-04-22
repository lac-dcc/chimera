--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:13:33 05/22/2014
-- Design Name:   
-- Module Name:   C:/Users/twawrzy/Documents/vhdl/yafc/return_stack_tb.vhd
-- Project Name:  yafc
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: return_stack
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

ENTITY return_stack_tb IS
END return_stack_tb;

ARCHITECTURE behavior OF return_stack_tb IS 
  
  -- Component Declaration for the Unit Under Test (UUT)
  
  COMPONENT return_stack
    PORT(
      clk : IN  std_logic;
      rst_n : IN  std_logic;
      push : IN  std_logic;
      pop : IN  std_logic;
      tos_in : IN  std_logic_vector(15 downto 0);
      tos_sel : IN  std_logic;
      tos : OUT  std_logic_vector(15 downto 0)
      );
  END COMPONENT;
  

  --Inputs
  signal clk : std_logic := '0';
  signal rst_n : std_logic := '0';
  signal push : std_logic := '0';
  signal pop : std_logic := '0';
  signal tos_in : std_logic_vector(15 downto 0) := (others => '0');
  signal tos_sel : std_logic := '0';

  --Outputs
  signal tos : std_logic_vector(15 downto 0);

  -- Clock period definitions
  constant clk_period : time := 10 ns;

  signal done : boolean := false;

  constant c_0 : word := "0000000000000000";
  constant c_1 : word := "0000000000001111";
  constant c_2 : word := "0000000011110000";
  constant c_3 : word := "0000111100000000";
  constant c_4 : word := "1111000000000000";

BEGIN
  
  -- Instantiate the Unit Under Test (UUT)
  uut: return_stack PORT MAP (
    clk => clk,
    rst_n => rst_n,
    push => push,
    pop => pop,
    tos_in => tos_in,
    tos_sel => tos_sel,
    tos => tos
    );

  -- Clock process definitions
  clk <= '0' when done else not clk after clk_period / 2; 

  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 100 ns.
    rst_n <= '0';
    wait for 100 ns;	
    rst_n <= '1';
    wait for clk_period*10;

    -- insert stimulus here 

    -- fundamental Forth return stack operations
    -- R		-- push onto return stack
    -- R@		-- copy TOS of R stack to D stack
    -- R>		-- pop TOS of R stack, push onto D stack

    

    -- done
    done <= true;
    wait;
  end process;

END;
