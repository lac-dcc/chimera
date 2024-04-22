library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.defines.all;
use ieee.numeric_std.all;

entity register_directory is
  Generic(
           NUMBER_OF_REGISTERS: integer := 8;
           LOG_NUMBER_OF_REGISTERS : integer := 3;
           NUMBER_OF_REGISTER_FILES: integer := 4;
           LOG_NUMBER_OF_REGISTER_FILES : integer := 2
         );
  Port (
         clk : in std_logic;

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

         --Return registers
         return_register_write_enable_in: in std_logic;
         return_register_file_in: in barrel_row_t;
         return_data_in : in word_t;

         barrel_row_select_in : in barrel_row_t;

         --LSU
         lsu_address_out: out memory_address_t;
         lsu_write_data_out: out word_t;

         --Predicate
         predicate_out: out std_logic);

end register_directory;

architecture rtl of register_directory is
  type lsu_addresses_out_t is array(0 to NUMBER_OF_REGISTER_FILES - 1) of memory_address_t;
  type barrel_words_t is array(0 to NUMBER_OF_REGISTER_FILES - 1) of word_t;

  signal register_write_enables : std_logic_vector(0 to NUMBER_OF_REGISTER_FILES - 1);
  signal return_register_write_enables : std_logic_vector(0 to NUMBER_OF_REGISTER_FILES - 1);
  signal id_register_write_enables : std_logic_vector(0 to NUMBER_OF_REGISTER_FILES - 1);
  signal predicates_out : std_logic_vector(0 to NUMBER_OF_REGISTER_FILES - 1);
  signal lsu_addresses_out : lsu_addresses_out_t;
  signal lsu_datas : barrel_words_t;

  signal read_registers_1 : barrel_words_t;
  signal read_registers_2 : barrel_words_t;
begin
  
  process (barrel_row_select_in, register_write_enable_in, return_register_file_in, return_register_write_enable_in, id_register_write_enable_in)
  begin
    register_write_enables <= (others => '0');
    return_register_write_enables <= (others => '0');
    id_register_write_enables <= (others => '0');

    if register_write_enable_in = '1' then
      register_write_enables(to_integer(unsigned(barrel_row_select_in))) <= '1';
    end if;

    if return_register_write_enable_in = '1' then
      return_register_write_enables(to_integer(unsigned(return_register_file_in))) <= '1';
    end if;

    if id_register_write_enable_in = '1' then
      id_register_write_enables(to_integer(unsigned(barrel_row_select_in))) <= '1';
    end if;
  end process;

  register_files:
  for i in 0 to NUMBER_OF_REGISTER_FILES - 1 generate

    register_file : entity work.register_file
    generic map(
                 DEPTH => NUMBER_OF_REGISTERS,
                 LOG_DEPTH => LOG_NUMBER_OF_REGISTERS
                )
    port map( -- General registers
              clk => clk,
              read_register_1_in => read_register_1_in,
              read_register_2_in => read_register_2_in,
              write_register_in => write_register_in,
              write_data_in => write_data_in,
              register_write_enable_in => register_write_enables(i),
              read_data_1_out => read_registers_1(i),
              read_data_2_out => read_registers_2(i),

              -- ID registers
              id_register_write_enable_in => id_register_write_enables(i),
              id_register_in => id_register_in,

              --LSU
              return_register_write_enable_in => return_register_write_enables(i),
              return_data_in => return_data_in,
              lsu_address_out => lsu_addresses_out(i),
              lsu_write_data_out => lsu_datas(i),

              -- Predicate bit
              predicate_out => predicates_out(i)
            );
  end generate register_files;

  read_data_1_out <= read_registers_1(to_integer(unsigned(barrel_row_select_in)));
  read_data_2_out <= read_registers_2(to_integer(unsigned(barrel_row_select_in)));

  predicate_out <= predicates_out(to_integer(unsigned(barrel_row_select_in)));
  lsu_address_out <= lsu_addresses_out(to_integer(unsigned(barrel_row_select_in)));
  lsu_write_data_out <= lsu_datas(to_integer(unsigned(barrel_row_select_in)));

end rtl;
