library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.defines.all;
use ieee.numeric_std.all;

entity communication_unit is
  generic (
            CONSTANT_ADDRESS_WIDTH: integer := 4
  );
  Port ( clk : in  std_logic;

         -- Thread Spawner signals
         kernel_start_out: out std_logic;
         kernel_address_out: out instruction_address_t;
         kernel_number_of_threads_out: out thread_id_t;

         -- MC busses
         ebi_data_inout : inout ebi_data_t := (others=>'Z');
         ebi_control_in : in ebi_control_t;

         -- Instruction memory
         instruction_data_out : out word_t;
         instruction_address_out : out  std_logic_vector(INSTRUCTION_ADDRESS_WIDTH - 1 downto 0);
         instruction_write_enable_out : out  std_logic;
         instruction_address_hi_select_out : out  std_logic;

         -- SRAM
         sram_bus_data_1_inout : inout sram_bus_data_t;
         sram_bus_data_2_inout : inout sram_bus_data_t;
         sram_bus_control_1_out: out sram_bus_control_t;
         sram_bus_control_2_out: out sram_bus_control_t;
         sram_request_out      : out std_logic;

         -- Constant_storage
         constant_address_out: out std_logic_vector(CONSTANT_MEM_LOG_SIZE - 1 downto 0);
         constant_write_enable_out: out std_logic;
         constant_out: out word_t
       );
end communication_unit;

architecture Behavioral of communication_unit is
begin

  -- Instruction memory
  instruction_data_out <= ebi_data_inout;
  instruction_address_out <= ebi_control_in.address(INSTRUCTION_ADDRESS_WIDTH downto 1);
  instruction_address_hi_select_out <= ebi_control_in.address(0);
  instruction_write_enable_out <= not ebi_control_in.write_enable_n
    and not ebi_control_in.chip_select_fpga_n
    and ebi_control_in.address(17);

  -- Constant storage
  constant_out <= ebi_data_inout;
  constant_address_out <= ebi_control_in.address(CONSTANT_MEM_LOG_SIZE - 1 downto 0);
  constant_write_enable_out <= not ebi_control_in.write_enable_n
    and not ebi_control_in.chip_select_fpga_n
    and not ebi_control_in.address(17);

  -- SRAM
  sram_request_out <= not ebi_control_in.chip_select_sram_n;


  ------------------------------------------
  ----   Connect data to sram 1
  ------------------------------------------
  sram_bus_data_1_inout <= ebi_data_inout when ebi_control_in.chip_select_sram_n = '0'
                                          and ebi_control_in.write_enable_n = '0'
                                          and ebi_control_in.address(0) = '0'
                      else (others => 'Z');

  ebi_data_inout <= sram_bus_data_1_inout when ebi_control_in.chip_select_sram_n = '0'
                                          and ebi_control_in.read_enable_n = '0'
                                          and ebi_control_in.address(0) = '0'
                      else (others => 'Z');


  ------------------------------------------
  ----   Connect data to sram 2
  ------------------------------------------
  sram_bus_data_2_inout <= ebi_data_inout when ebi_control_in.chip_select_sram_n = '0'
                                          and ebi_control_in.write_enable_n = '0'
                                          and ebi_control_in.address(0) = '1'
                      else (others => 'Z');

  ebi_data_inout <= sram_bus_data_2_inout when ebi_control_in.chip_select_sram_n = '0'
                                          and ebi_control_in.read_enable_n = '0'
                                          and ebi_control_in.address(0) = '1'
                      else (others => 'Z');


  -- Least significant bit selects SRAM chip, and should not be part of the address.
  sram_bus_control_1_out.address <= ebi_control_in.address(DATA_ADDRESS_WIDTH - 1 downto 1);
  sram_bus_control_2_out.address <= ebi_control_in.address(DATA_ADDRESS_WIDTH - 1 downto 1);


  ------------------------------------------
  ----   Set SRAM write enable signals
  ------------------------------------------
  sram_bus_control_1_out.write_enable_n <= '0' when ebi_control_in.chip_select_sram_n = '0'
                                                and ebi_control_in.write_enable_n = '0'
                                                and ebi_control_in.address(0) = '0'
                                       else '1';



  sram_bus_control_2_out.write_enable_n <= '0' when ebi_control_in.chip_select_sram_n = '0'
                                                and ebi_control_in.write_enable_n = '0'
                                                and ebi_control_in.address(0) = '1'
                                       else '1';

  -- Thread spawner
  kernel_number_of_threads_out <= std_logic_vector(shift_left(
    resize(unsigned(ebi_data_inout), ID_WIDTH),
    NUMBER_OF_STREAMING_PROCESSORS_BIT_WIDTH + BARREL_HEIGHT_BIT_WIDTH
  ));
  kernel_address_out <= ebi_control_in.address(INSTRUCTION_ADDRESS_WIDTH - 1 downto 0);
  kernel_start_out <= not ebi_control_in.write_enable_n
    and not ebi_control_in.chip_select_fpga_n
    and ebi_control_in.address(18);


end Behavioral;

