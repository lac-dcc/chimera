          library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use work.test_utils.all;
  use work.defines.all;
  
  entity tb_instruction_memory is
  end tb_instruction_memory;

  architecture behavior of tb_instruction_memory is 
    
  signal clk : std_logic;
  signal reset: std_logic;
  signal write_enable_in: std_logic;
  signal address_in: instruction_address_t;
  signal address_hi_select_in: std_logic;
  signal data_in: word_t;
  signal data_out: instruction_t;
  
  constant clk_period: time := 10 ns;
  begin

  -- component instantiation
      uut: entity work.instruction_memory port map(
            clk => clk,
            reset => reset,
            write_enable_in => write_enable_in,
            address_in => address_in,
            address_hi_select_in => address_hi_select_in,
            data_in => data_in,
            data_out => data_out
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
    reset <= '1';
    wait for 1 ns;
    reset <= '0';
    write_enable_in <= '1';

    -- Write some data to memory
    for i in 0 to 20 loop
      address_hi_select_in <= '0';
      address_in <= std_logic_vector(to_unsigned(i*20, INSTRUCTION_ADDRESS_WIDTH));

      data_in <= std_logic_vector(to_unsigned(10 + i*10, WORD_WIDTH));
      wait for clk_period;
      
      address_hi_select_in <= '1';
      address_in <= std_logic_vector(to_unsigned(i*20, INSTRUCTION_ADDRESS_WIDTH));

      data_in <= std_logic_vector(to_unsigned(100 + i*5, WORD_WIDTH));
      wait for clk_period;
    end loop;
    -- Assert memory contents
    write_enable_in <= '0';
    for i in 0 to 20 loop
      address_in <= std_logic_vector(to_unsigned(i*20, INSTRUCTION_ADDRESS_WIDTH));
      wait for clk_period;
      assert_equals(std_logic_vector(to_unsigned(100 + i*5, WORD_WIDTH)), data_out(15 downto 0), "Checking memory contents upper bits");
      assert_equals(std_logic_vector(to_unsigned(10 + i*10, WORD_WIDTH)), data_out(31 downto 16), "Checking memory contents lower bits");
    end loop;

    wait;
  end process tb;
  --  end test bench 

  end;
