--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:38:40 05/18/2014
-- Design Name:   
-- Module Name:   C:/Users/Tim/Documents/Source/yafc/data_stack_tb.vhd
-- Project Name:  yafc
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: data_stack
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

use work.common.all;

ENTITY data_stack_tb IS
END data_stack_tb;

ARCHITECTURE behavior OF data_stack_tb IS 
  
  -- Component Declaration for the Unit Under Test (UUT)
  
  COMPONENT data_stack
    PORT(
      clk : IN  std_logic;
      rst_n : IN  std_logic;
      push : IN  std_logic;
      pop : IN  std_logic;
      tos_sel : IN  std_logic_vector(1 downto 0);
      tos_in : IN  std_logic_vector(15 downto 0);
      nos_sel : IN  std_logic_vector(1 downto 0);
      nos_in : IN  std_logic_vector(15 downto 0);
      stk_sel : IN  std_logic;
      tos : OUT  std_logic_vector(15 downto 0);
      nos : OUT  std_logic_vector(15 downto 0);
      ros : OUT  std_logic_vector(15 downto 0)
      );
  END COMPONENT;
  

  --Inputs
  signal clk : std_logic := '0';
  signal rst_n : std_logic := '0';
  signal push : std_logic := '0';
  signal pop : std_logic := '0';
  signal tos_sel : std_logic_vector(1 downto 0) := (others => '0');
  signal tos_in : std_logic_vector(15 downto 0) := (others => '0');
  signal nos_sel : std_logic_vector(1 downto 0) := (others => '0');
  signal nos_in : std_logic_vector(15 downto 0) := (others => '0');
  signal stk_sel : std_logic := '0';

  --Outputs
  signal tos : std_logic_vector(15 downto 0);
  signal nos : std_logic_vector(15 downto 0);
  signal ros : std_logic_vector(15 downto 0);

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
  uut: data_stack PORT MAP (
    clk => clk,
    rst_n => rst_n,
    push => push,
    pop => pop,
    tos_sel => tos_sel,
    tos_in => tos_in,
    nos_sel => nos_sel,
    nos_in => nos_in,
    stk_sel => stk_sel,
    tos => tos,
    nos => nos,
    ros => ros
    );

  -- Clock process definitions
  clk <= '0' when done else not clk after clk_period / 2; 

  -- fundamental forth stack operations:
  -- push
  -- pop
  -- swap
  -- rot
  -- nrot (-rot)
  -- nip		( a b c -- a c )
  -- tuck		( 
  -- dup		( a -- a a )
  -- over		( a b -- a b a )

  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 100 ns.
    rst_n <= '0';
    wait for 100 ns;	
    rst_n <= '1';
    wait for clk_period*10;

    -- insert stimulus here 

    -- preconditions
    assert tos = c_0 report "Invalid tos before" severity error;
    assert nos = c_0 report "Invalid nos before" severity error;
    assert ros = c_0 report "Invalid ros before" severity error;

    -- 1 push		( 1 )
    tos_in <= c_1;
    tos_sel <= "11";
    nos_sel <= "01";
    stk_sel <= '0';
    push <= '1';
    wait for clk_period;
    push <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_1 report "Invalid tos for push 1" severity error;
    assert nos = c_0 report "Invalid nos for push 1" severity error;
    assert ros = c_0 report "Invalid ros for push 1" severity error;

    -- 2 push			( 1 2 )
    tos_in <= c_2;
    tos_sel <= "11";
    nos_sel <= "01";
    stk_sel <= '0';
    push <= '1';
    wait for clk_period;
    push <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_2 report "Invalid tos for push 2" severity error;
    assert nos = c_1 report "Invalid nos for push 2" severity error;
    assert ros = c_0 report "Invalid ros for push 2" severity error;

    -- 3 push			( 1 2 3 )
    tos_in <= c_3;
    tos_sel <= "11";
    nos_sel <= "01";
    stk_sel <= '0';
    push <= '1';
    wait for clk_period;
    push <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_3 report "Invalid tos for push 3" severity error;
    assert nos = c_2 report "Invalid nos for push 3" severity error;
    assert ros = c_1 report "Invalid ros for push 3" severity error;

    -- 4 push	( 1 2 3 4 )
    tos_in <= c_4;
    tos_sel <= "11";
    nos_sel <= "01";
    stk_sel <= '0';
    push <= '1';
    wait for clk_period;
    push <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_4 report "Invalid tos for push 4" severity error;
    assert nos = c_3 report "Invalid nos for push 4" severity error;
    assert ros = c_2 report "Invalid ros for push 4" severity error;

    -- swap ( a b -- b a ) ( 1 2 4 3 )
    tos_sel <= "01";
    nos_sel <= "01";
    stk_sel <= '0';
    wait for clk_period;
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_3 report "Invalid tos after swap" severity error;
    assert nos = c_4 report "Invalid nos after swap" severity error;
    assert ros = c_2 report "Invalid ros after swap" severity error;

    -- pop (drop)	( 1 2 4 )
    tos_sel <= "01";
    nos_sel <= "10";
    pop <= '1';
    wait for clk_period;
    pop <= '0';
    tos_sel <= "00";
    nos_sel <= "00";

    assert tos = c_4 report "Invalid tos after drop" severity error;
    assert nos = c_2 report "Invalid nos after drop" severity error;
    assert ros = c_1 report "Invalid ros after drop" severity error;
    
    -- rot ( a b c -- b c a )	( 2 4 1 )
    tos_sel <= "10";
    nos_sel <= "01";
    stk_sel <= '0';
    push <= '1';
    pop <= '1';
    wait for clk_period;
    push <= '0';
    pop <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_1 report "Invalid tos after rot" severity error;
    assert nos = c_4 report "Invalid nos after rot" severity error;
    assert ros = c_2 report "Invalid ros after rot" severity error;
    
    -- nrot ( a b c -- c a b )		( 1 2 4 )
    tos_sel <= "01";
    nos_sel <= "10";
    stk_sel <= '1';
    push <= '1';
    pop <= '1';
    wait for clk_period;
    push <= '0';
    pop <= '0';
    stk_sel <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_4 report "Invalid tos after nrot" severity error;
    assert nos = c_2 report "Invalid nos after nrot" severity error;
    assert ros = c_1 report "Invalid ros after nrot" severity error;
    
    -- nip		( a b c -- a c )	( 1 4 )
    tos_sel <= "00";
    nos_sel <= "10";
    stk_sel <= '0';
    pop <= '1';
    wait for clk_period;
    pop <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_4 report "Invalid tos after nip" severity error;
    assert nos = c_1 report "Invalid nos after nip" severity error;
    assert ros = c_0 report "Invalid ros after nip" severity error;
    
    -- tuck		( a b -- b a b ) ( 4 1 4 )
    tos_sel <= "00";
    nos_sel <= "00";
    stk_sel <= '1';
    push <= '1';
    wait for clk_period;
    push <= '0';
    
    assert tos = c_4 report "Invalid tos after tuck" severity error;
    assert nos = c_1 report "Invalid nos after tuck" severity error;
    assert ros = c_4 report "Invalid ros after tuck" severity error;
    
    -- dup		( a -- a a )	( 4 1 4 4 )
    tos_sel <= "00";
    nos_sel <= "01";
    stk_sel <= '0';
    push <= '1';
    wait for clk_period;
    push <= '0';
    nos_sel <= "00";
    
    assert tos = c_4 report "Invalid tos after tuck" severity error;
    assert nos = c_4 report "Invalid nos after tuck" severity error;
    assert ros = c_1 report "Invalid ros after tuck" severity error;
    
    -- first change the stack a little so we can test that 'over' works correctly
    -- replace TOS with c_2	( 4 1 4 2 )
    tos_sel <= "11";
    tos_in <= c_2;
    nos_sel <= "00";
    wait for clk_period;
    
    assert tos = c_2 report "Invalid tos after replace" severity error;
    assert nos = c_4 report "Invalid nos after replace" severity error;
    assert ros = c_1 report "Invalid ros after replace" severity error;
    
    -- over		( a b -- a b a )	( 4 1 4 2 4 )
    tos_sel <= "01";
    nos_sel <= "01";
    stk_sel <= '0';
    push <= '1';
    wait for clk_period;
    push <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_4 report "Invalid tos after over" severity error;
    assert nos = c_2 report "Invalid nos after over" severity error;
    assert ros = c_4 report "Invalid ros after over" severity error;
    
    -- pop everything off
    
    -- pop (drop)			( 4 1 4 2 )
    tos_sel <= "01";
    nos_sel <= "10";
    pop <= '1';
    wait for clk_period;
    pop <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_2 report "Invalid tos after drop 1" severity error;
    assert nos = c_4 report "Invalid nos after drop 1" severity error;
    assert ros = c_1 report "Invalid ros after drop 1" severity error;
    
    -- pop (drop)		( 4 1 4 )
    tos_sel <= "01";
    nos_sel <= "10";
    pop <= '1';
    wait for clk_period;
    pop <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_4 report "Invalid tos after drop 2" severity error;
    assert nos = c_1 report "Invalid nos after drop 2" severity error;
    assert ros = c_4 report "Invalid ros after drop 2" severity error;
    
    -- pop (drop)		( 4 1 )
    tos_sel <= "01";	
    nos_sel <= "10";
    pop <= '1';
    wait for clk_period;
    pop <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_1 report "Invalid tos after drop 3" severity error;
    assert nos = c_4 report "Invalid nos after drop 3" severity error;
    assert ros = c_0 report "Invalid ros after drop 3" severity error;
    
    -- pop (drop)		( 4 )
    tos_sel <= "01";	
    nos_sel <= "10";
    pop <= '1';
    wait for clk_period;
    pop <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_4 report "Invalid tos after drop 4" severity error;
    assert nos = c_0 report "Invalid nos after drop 4" severity error;
    assert ros = c_0 report "Invalid ros after drop 4" severity error;
    
    -- pop (drop)		( )
    tos_sel <= "01";	
    nos_sel <= "10";
    pop <= '1';
    wait for clk_period;
    pop <= '0';
    tos_sel <= "00";
    nos_sel <= "00";
    
    assert tos = c_0 report "Invalid tos after drop 4" severity error;
    assert nos = c_0 report "Invalid nos after drop 4" severity error;
    assert ros = c_0 report "Invalid ros after drop 4" severity error;
    
    -- done
    tos_sel <= "00";
    nos_sel <= "00";
    
    --wait for clk_period * 10;
    done <= true;
    wait;
  end process;

END;
