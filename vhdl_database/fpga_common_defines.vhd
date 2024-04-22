library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package defines is

  ----------------
  -- Bus widths --
  ----------------
  constant INSTRUCTION_WIDTH : integer := 32;
  constant INSTRUCTION_ADDRESS_WIDTH: integer := 16;
  constant DATA_ADDRESS_WIDTH: integer := 20;
  constant ID_WIDTH: integer := 20;
  constant DATA_WIDTH: integer := 20;
  constant WORD_WIDTH: integer := 16;

  subtype word_t is std_logic_vector(WORD_WIDTH - 1 downto 0);
  subtype instruction_address_t is std_logic_vector(INSTRUCTION_ADDRESS_WIDTH - 1 downto 0);
  subtype instruction_t is std_logic_vector(INSTRUCTION_WIDTH - 1 downto 0);
  subtype memory_address_t is std_logic_vector(DATA_ADDRESS_WIDTH - 1 downto 0);
  subtype thread_id_t is std_logic_vector(ID_WIDTH - 1 downto 0);

  ---------------------------
  -- Ghettocuda parameters --
  ---------------------------
  constant NUMBER_OF_STREAMING_PROCESSORS: integer := 2;
  constant NUMBER_OF_STREAMING_PROCESSORS_BIT_WIDTH: integer := 1;

  --One block ram is 576 instructions
  constant INSTRUCTION_MEM_SIZE: integer := 576;

  --Constant mem size has a hard limit of 2^16, log_size of 16.
  constant CONSTANT_MEM_SIZE: integer := 256;
  constant CONSTANT_MEM_LOG_SIZE: integer := 8;

  type sp_sram_addresses_t is array(NUMBER_OF_STREAMING_PROCESSORS - 1 downto 0) of memory_address_t;
  type sp_sram_datas_t is array(NUMBER_OF_STREAMING_PROCESSORS - 1 downto 0) of word_t;

  ------------------------------------
  -- Streaming processor parameters --
  ------------------------------------
  constant BARREL_HEIGHT: integer := 4;
  constant BARREL_HEIGHT_BIT_WIDTH: integer := 2;

  constant REGISTER_COUNT: integer := 8; -- Actually 15
  constant REGISTER_COUNT_BIT_WIDTH: integer := 4; -- Incremented by 1 to accomodate special registers

  type register_directory_ids_t is array(BARREL_HEIGHT-1 downto 0) of  thread_id_t;
  subtype barrel_row_t is std_logic_vector(BARREL_HEIGHT_BIT_WIDTH - 1 downto 0);
  subtype register_address_t is std_logic_vector(REGISTER_COUNT_BIT_WIDTH - 1 downto 0);

  -------------------------------
  -- Instruction configuration --
  -------------------------------
  constant OPCODE_BIT_WIDTH : integer := 5;
  constant ALU_SHAMT_WIDTH : integer := 5;
  constant ALU_FUNCT_WIDTH : integer := 5;
  constant INSTRUCTION_DECODE_IMMEDIATE_BIT_WIDTH: integer := 16;

  subtype opcode_t is std_logic_vector(OPCODE_BIT_WIDTH - 1 downto 0);
  subtype shamt_t is std_logic_vector(ALU_SHAMT_WIDTH - 1 downto 0);
  subtype alu_funct_t is std_logic_vector(ALU_FUNCT_WIDTH -1 downto 0);
  subtype immediate_value_t is std_logic_vector(INSTRUCTION_DECODE_IMMEDIATE_BIT_WIDTH -1 downto 0);

  ---------------------
  -- Named registers --
  ---------------------
  constant register_zero : integer := 0;
  constant register_id_hi : integer := 1;
  constant register_id_lo : integer := 2;
  constant register_address_hi : integer := 3;
  constant register_address_lo : integer := 4;
  constant register_lsu_data : integer := 5;
  constant register_mask : integer := 6;
  constant GENERAL_REGISTERS_BASE_ADDRESS : integer := 7;
  -----------------------
  -- SRAM && EBI Buses --
  -----------------------
  subtype spi_bus_t is std_logic_vector(4 downto 0);
  subtype ebi_data_t is std_logic_vector(15 downto 0);

  type sram_bus_control_t is
    record
      address : std_logic_vector(18 downto 0);
      write_enable_n : std_logic;
    end record;

  subtype sram_bus_data_t is std_logic_vector(15 downto 0);

  type ebi_control_t is
    record
      address : std_logic_vector(DATA_ADDRESS_WIDTH - 1 downto 0);
      write_enable_n : std_logic;
      read_enable_n : std_logic;
      chip_select_fpga_n : std_logic;
      chip_select_sram_n : std_logic;
    end record;

end package defines;
