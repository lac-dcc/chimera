--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:09:44 05/16/2014
-- Design Name:   
-- Module Name:   C:/Users/Tim/Documents/Source/yafc/stack_tb.vhd
-- Project Name:  yafc
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: stack
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
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

use std.textio.all;

use work.common.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY stack_tb IS
END stack_tb;

ARCHITECTURE behavior OF stack_tb IS 
  
  -- Component Declaration for the Unit Under Test (UUT)
  
  COMPONENT stack
    PORT(
      clk : IN  std_logic;
      rst_n : IN  std_logic;
      push : IN  std_logic;
      pop : IN  std_logic;
      din : IN  std_logic_vector(15 downto 0);
      dout : OUT  std_logic_vector(15 downto 0);
      full : OUT  std_logic;
      empty : OUT  std_logic
      );
  END COMPONENT;
  

  --Inputs
  signal clk : std_logic := '0';
  signal rst_n : std_logic := '0';
  signal push : std_logic := '0';
  signal pop : std_logic := '0';
  signal din : std_logic_vector(15 downto 0) := (others => '0');

  --Outputs
  signal dout : std_logic_vector(15 downto 0);
  signal full : std_logic;
  signal empty : std_logic;

  -- Clock period definitions
  constant clk_period : time := 10 ns;

  signal done : boolean := false;
  
BEGIN
  
  -- Instantiate the Unit Under Test (UUT)
  uut: stack PORT MAP (
    clk => clk,
    rst_n => rst_n,
    push => push,
    pop => pop,
    din => din,
    dout => dout,
    full => full,
    empty => empty
    );

  clk <= '0' when done else not clk after clk_period / 2;

  -- Stimulus process
  stim_proc: process
    variable l : line;
  begin		
    -- hold reset state for 100 ns.
    rst_n <= '0';
    wait for 100 ns;	
    rst_n <= '1';
    wait for clk_period*10;

    -- insert stimulus here 
    
    -----------------
    -- single push --
    -----------------

    -- precondition
    assert full = '0' report "Invalid full" severity error;
    assert empty = '1' report "Invalid empty" severity error;
    -- test push
    push <= '1';
    din <= "1111111100000000";
    wait for clk_period;
    push <= '0';
    -- postcondition
    assert full = '0' report "Invalid full" severity error;
    assert empty = '0' report "Invalid empty" severity error;

    ----------------
    -- single pop --
    ----------------
    
    -- test pop
    pop <= '1';
    wait for clk_period;
    pop <= '0';
    -- postcondition
    assert full = '0' report "Invalid full" severity error;
    assert empty = '1' report "Invalid empty" severity error;
    assert dout = "1111111100000000" report "Invalid dout" severity error;
    
    -----------------------
    -- fill up the stack --
    -----------------------
    for i in 0 to c_stack_size-1 loop
      -- test push
      push <= '1';
      din <= std_logic_vector( to_unsigned( i, c_word_width ) );
      wait for clk_period;
      push <= '0';
      
      write( l, string'( "push loop  " ) );
      write( l, integer'image( i ) );
      write( l, string'( "   " ) );
      write( l, dout );
      writeline( output, l );
      
      assert dout = std_logic_vector( to_unsigned( i, c_word_width ) ) report "Invalid dout in push loop" severity error;
    end loop;
    
    -- postcondition
    assert full = '1' report "Invalid full" severity error;
    assert empty = '0' report "Invalid empty" severity error;
    
    -----------------------------------
    -- test popping off all the data --
    -----------------------------------
    for i in c_stack_size-1 downto 0 loop
      pop <= '1';
      wait for clk_period;
      pop <= '0';
      
      write( l, string'( "pop loop  " ) );
      write( l, integer'image( i ) );
      write( l, string'( "   " ) );
      write( l, dout );
      writeline( output, l );
      
      assert dout <= std_logic_vector( to_unsigned( i, c_word_width ) ) report "Invalid dout in pop loop" severity error;
    end loop;
    
    assert dout <= "0000000000000000" report "Invalid dout after popping" severity error;
    
    -- postcondition
    assert full = '0' report "Invalid full" severity error;
    assert empty = '1' report "Invalid empty" severity error;
    
    
    -- test pushing and popping at the same time (just overwrites the top element)
    
    -- first push 3 items
    push <= '1';
    din <= "0000000000001111";
    wait for clk_period;
    din <= "0000000011110000";
    wait for clk_period;
    din <= "0000111100000000";
    wait for clk_period;
    push <= '0';
    
    assert dout <= "0000111100000000" report "wtf pushing?!" severity error;
    
    -- ok, now try the push/pop combo
    push <= '1';
    pop <= '1';
    din <= "1111000000000000";
    wait for clk_period;
    push <= '0';
    pop <= '0';
    
    assert dout <= "1111000000000000" report "invalid TOS after push/pop" severity error;
    pop <= '1';
    wait for clk_period;
    pop <= '0';
    assert dout <= "1111000000000000" report "Invalid 1st pop" severity error;
    
    pop <= '1';
    wait for clk_period;
    pop <= '0';
    assert dout <= "0000000011110000" report "Invalid 1st pop" severity error;
    
    pop <= '1';
    wait for clk_period;
    pop <= '0';
    assert dout <= "0000000000001111" report "Invalid 1st pop" severity error;
    
    
    ----------
    -- done --
    ----------
    done <= true;
    wait;
  end process;

END;
