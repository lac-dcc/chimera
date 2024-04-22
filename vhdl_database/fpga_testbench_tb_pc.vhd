  library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use work.test_utils.all;
  use work.defines.all;
  
  entity pc_tb is
  end pc_tb;

  architecture behavior of pc_tb is 
    
  signal clk : std_logic;
  signal reset: std_logic;
  signal write_enable_in : std_logic;
  signal pc_in : instruction_address_t;
  signal pc_input_select_in: std_logic;
  signal pc_out : instruction_address_t;
  constant clk_period: time := 10 ns;
  begin

  -- component instantiation
      uut: entity work.pc port map(
            clk => clk,
            reset => reset,
            write_enable => write_enable_in,
            pc_in => pc_in,
            pc_input_select_in => pc_input_select_in,
            pc_out => pc_out
      );


   -- Clock process definitions
      
      clk_process :process
      begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
      end process;
   
  --  test bench statements
       tb : process
       begin
          pc_in <= (others => '0');
          reset <= '1';
          wait for 100 ns; 
          reset <= '0';
          
          -- Select the internal adder circuit as the input
          pc_input_select_in <= '0';
          -- Write it.
          write_enable_in <= '1';
          wait for clk_period;
          assert_equals("1", pc_out(0 downto 0), "Internal increment failed");
          
          -- Make sure the register only writes, when enabled
          write_enable_in <= '0';
          wait for clk_period;
          assert_equals("1", pc_out(0 downto 0), "PC should only changw when write enable is high");
          
          -- Test external writes( will be from thread spawner ).
          pc_in(1 downto 0) <= "11";
          write_enable_in <= '1';
          pc_input_select_in <= '1';
          wait for clk_period;
          assert_equals("11", pc_out(1 downto 0), "PC value should write input when enabled");
          
          
          wait;
       end process tb;
  --  end test bench 

  end;
