library ieee;
use ieee.std_logic_1164.all;
use work.defines.all;
use ieee.numeric_std.all;


entity sp_block is
    Port ( clock                : in  std_logic
         ; read_reg_1_in        : in  register_address_t
         ; read_reg_2_in        : in  register_address_t
         ; write_reg_in         : in  register_address_t
         ; immediate_in         : in  immediate_value_t
         ; immediate_enable_in  : in  std_logic
         ; shamt_in             : in  std_logic_vector(4 downto 0)
         ; reg_write_enable_in  : in  std_logic
         ; mask_enable_in       : in  std_logic
         ; alu_function_in      : in  alu_funct_t
         ; id_data_in           : in thread_id_t
         ; id_write_enable_in   : in  std_logic
         ; barrel_select_in     : in  barrel_row_t
         ; return_write_enable_in : in  std_logic
         ; return_barrel_select_in : in  barrel_row_t
         ; return_data_in       : in sp_sram_datas_t
         ; lsu_write_data_out   : out  sp_sram_datas_t
         ; lsu_address_out      : out  sp_sram_addresses_t
         ; constant_write_enable_in : in std_logic
         ; constant_value_in    : in word_t
      );
end sp_block;

architecture Behavioral of sp_block is
  type sp_ids_t is array(0 to NUMBER_OF_STREAMING_PROCESSORS - 1) of  thread_id_t;
  signal sp_ids : sp_ids_t;
begin

  gen_sp:
  for i in 0 to NUMBER_OF_STREAMING_PROCESSORS - 1 generate

    sp_ids(i) <= thread_id_t(signed(id_data_in) + i);

    streaming_processor :
    entity work.streaming_processor
      port map(
              clock => clock,
              read_reg_1_in => read_reg_1_in,
              read_reg_2_in => read_reg_2_in,
              write_reg_in  => write_reg_in,
              immediate_in => immediate_in,
              immediate_enable_in => immediate_enable_in,
              shamt_in => shamt_in,
              reg_write_enable_in => reg_write_enable_in,
              mask_enable_in => mask_enable_in,
              alu_function_in => alu_function_in,
              id_data_in => sp_ids(i),
              id_write_enable_in => id_write_enable_in,
              barrel_select_in =>  barrel_select_in,
              return_write_enable_in => return_write_enable_in,
              return_barrel_select_in => return_barrel_select_in,
              return_data_in => return_data_in(i),
              lsu_write_data_out => lsu_write_data_out(i),
              lsu_address_out     => lsu_address_out(i),
              constant_write_enable_in => constant_write_enable_in,
              constant_value_in => constant_value_in
             );
  end generate gen_sp;
end Behavioral;

