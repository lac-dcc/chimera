library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.test_utils.all;
use work.defines.all;

entity tb_constant_storage is
  end tb_constant_storage;

architecture behavior of tb_constant_storage is 

  signal clk : std_logic;

  signal write_constant_in: word_t;
  signal write_enable_in : std_logic;
  signal write_address_in: std_logic_vector(2 downto 0);
  signal constant_value_out: word_t;
  signal constant_select_in: immediate_value_t;

  constant clk_period: time := 10 ns;

begin

  -- component instantiation
  uut: entity work.constant_storage
  generic map(
               DEPTH => 8,
               LOG_DEPTH => 3
             )
  port map(
            clk => clk,
            write_constant_in => write_constant_in,
            write_enable_in => write_enable_in,
            write_address_in => write_address_in,
            constant_value_out => constant_value_out,
            constant_select_in => constant_select_in
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
    write_constant_in <= x"0001";
    write_address_in  <= "010";
    constant_select_in <= x"0002";
    write_enable_in <= '1';
    wait for clk_period;

    assert_equals(x"0001", constant_value_out, "Memory should contain 01 at address 10");
    write_constant_in <= x"0003";
    write_address_in  <= "011";
    constant_select_in <= x"0003";
    wait for clk_period;

    assert_equals(x"0003", constant_value_out, "Memory should contain 11 at address 11");
    write_enable_in <= '0';
    write_constant_in <= x"0002";
    wait for clk_period;
    assert_equals(x"0003", constant_value_out, "Memory should only write when write enable is high");

    wait for 1 ns;
    constant_select_in <= x"0002";
    wait for 1 ns;
    assert_equals(x"0001", constant_value_out, "Output should not require a clock cycle to change");

    wait;
  end process tb; --  end test bench

end;
