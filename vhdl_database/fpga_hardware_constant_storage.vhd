library ieee;
use ieee.std_logic_1164.all;
use work.defines.all;
use ieee.numeric_std.all;

entity constant_storage is
  generic(
           DEPTH: integer := 8;
           LOG_DEPTH : integer := 3
         );
  port(
        clk: in std_logic;
        write_constant_in: in word_t;
        write_enable_in : in std_logic;
        write_address_in: in std_logic_vector(LOG_DEPTH -1 downto 0);
        constant_value_out: out word_t;
        constant_select_in: in immediate_value_t
      );

end constant_storage;

architecture rtl of constant_storage is

  type register_file_t is array(DEPTH - 1 downto 0) of word_t;
  signal register_file : register_file_t := (others => (others => '0'));

begin

  constant_value_out <= register_file(to_integer(unsigned(constant_select_in(LOG_DEPTH - 1 downto 0))));

  registers: process (clk) is
  begin

    if rising_edge(clk) then

      if write_enable_in = '1' then
        register_file(to_integer(unsigned(write_address_in))) <= write_constant_in;
      end if;

    end if;

  end process;

end rtl;