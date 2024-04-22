library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.defines.all;
use ieee.numeric_std.all;

entity register_file is
  Generic(
           DEPTH: integer := 8;
           LOG_DEPTH : integer := 3
         );
  Port (  clk : in std_logic;
          -- General registers
          read_register_1_in: in register_address_t;
          read_register_2_in: in register_address_t;
          write_register_in: in register_address_t;
          write_data_in: in word_t;
          register_write_enable_in: in std_logic;
          read_data_1_out: out word_t;
          read_data_2_out: out word_t;

          -- ID registers
          id_register_write_enable_in:in std_logic;
          id_register_in: in thread_id_t;

          --LSU
          return_register_write_enable_in: in std_logic;
          lsu_address_out: out memory_address_t;
          lsu_write_data_out: out word_t;
          return_data_in: in word_t;

          -- Predicate bit
          predicate_out: out std_logic);

end register_file;

architecture rtl of register_file is

  type register_file_t is array(0 to 7 + DEPTH) of word_t;
  signal general_registers : register_file_t := (others => (others => '0'));

  signal id_register : thread_id_t;
  signal id_hi : word_t;
  signal id_lo : word_t;

  signal address_lo : word_t;
  signal address_hi : word_t;

  signal lsu_data : word_t;

  signal mask : std_logic := '0';

begin

  predicate_out <= mask;
  id_hi <= std_logic_vector(resize(unsigned(id_register(DATA_WIDTH - 1 downto WORD_WIDTH)), WORD_WIDTH));
  id_lo <= id_register(WORD_WIDTH -1 downto 0);
  lsu_address_out <= address_hi(DATA_WIDTH - WORD_WIDTH - 1 downto 0) & address_lo;
  lsu_write_data_out <= lsu_data;

  -- Wire out registers
  with to_integer(unsigned(read_register_1_in)) select
    read_data_1_out <= (others => '0') when register_zero,
                       id_hi when register_id_hi,
                       id_lo when register_id_lo,
                       address_hi when register_address_hi,
                       address_lo when register_address_lo,
                       lsu_data when register_lsu_data,
                       (0 => mask, others => '0') when register_mask,
                       general_registers(to_integer(unsigned(read_register_1_in))) when others;

  with to_integer(unsigned(read_register_2_in)) select
    read_data_2_out <= (others => '0') when register_zero,
                       id_hi when register_id_hi,
                       id_lo when register_id_lo,
                       address_hi when register_address_hi,
                       address_lo when register_address_lo,
                       lsu_data when register_lsu_data,
                       (0 => mask, others => '0') when register_mask,
                       general_registers(to_integer(unsigned(read_register_2_in))) when others;

  registers: process (clk) is
  begin

    if rising_edge(clk) then
      if return_register_write_enable_in = '1' then
        lsu_data <= return_data_in;
      end if;

      if id_register_write_enable_in = '1' then
        id_register <= id_register_in;
      end if;

      if register_write_enable_in = '1' then
        case to_integer(unsigned(write_register_in)) is
          when register_zero | register_id_hi | register_id_lo =>
            null;
          when register_address_hi =>
            address_hi <= write_data_in;
          when register_address_lo =>
            address_lo <= write_data_in;
          when register_lsu_data =>
            lsu_data <= write_data_in;
          when register_mask =>
            mask <= write_data_in(0);
          when others =>
            general_registers(to_integer(unsigned(write_register_in))) <= write_data_in;
        end case;
      end if;
    end if;

  end process;

end rtl;
