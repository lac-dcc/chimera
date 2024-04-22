-- libraries --------------------------------------------------------------------------------- {{{
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_textio.all;
use std.textio.all;
------------------------------------------------------------------------------------------------- }}}
package FGPU_definitions is
  constant N_CU_W                         : natural := 3; --0 to 3
    -- Bitwidth of # of CUs
  constant LMEM_ADDR_W                    : natural := 10;
      -- bitwidth of local memory address for a single PE
  constant N_AXI_W                        : natural := 0;
    -- Bitwidth of # of AXI data ports
  constant SUB_INTEGER_IMPLEMENT          : natural := 0;
    -- implement sub-integer store operations
  constant N_STATIONS_ALU                 : natural := 4;
    -- # stations to store memory requests sourced by a single ALU
  constant ATOMIC_IMPLEMENT               : natural := 0;
    -- implement global atomic operations
  constant LMEM_IMPLEMENT                 : natural := 0;
    -- implement local scratchpad
  constant N_TAG_MANAGERS_W               : natural := N_CU_W+0; -- 0 to 1
    -- Bitwidth of # tag controllers per CU
  constant RD_CACHE_N_WORDS_W             : natural := 0;
  constant RD_CACHE_FIFO_PORTB_ADDR_W     : natural := 6;

  constant FLOAT_IMPLEMENT                : natural := 1;
  constant FADD_IMPLEMENT                 : integer := 1;
  constant FMUL_IMPLEMENT                 : integer := 0;
  constant FDIV_IMPLEMENT                 : integer := 0;
  constant FSQRT_IMPLEMENT                : integer := 0;
  constant UITOFP_IMPLEMENT               : integer := 0;
  constant FSLT_IMPLEMENT                 : integer := 0;
  constant FRSQRT_IMPLEMENT               : integer := 0;
  constant FADD_DELAY                     : integer := 11;
  constant UITOFP_DELAY                   : integer := 5;
  constant FMUL_DELAY                     : integer := 8;
  constant FDIV_DELAY                     : integer := 28;
  constant FSQRT_DELAY                    : integer := 28;
  constant FRSQRT_DELAY                   : integer := 28;
  constant FSLT_DELAY                     : integer := 2;
  constant MAX_FPU_DELAY                  : integer := FADD_DELAY;
  
  
  constant CACHE_N_BANKS_W                : natural := 3;
    -- Bitwidth of # words within a cache line. Minimum is 2
  constant N_RECEIVERS_CU_W               : natural := 6-N_CU_W;
    -- Bitwidth of # of receivers inside the global memory controller per CU. (6-N_CU_W) will lead to 64 receivers whatever the # of CU is.
  constant BURST_WORDS_W                  : natural := 5;
    -- Bitwidth # of words within a single AXI burst
  constant ENABLE_READ_PRIORIRY_PIPE      : boolean := false;
  constant FIFO_ADDR_W                    : natural := 3;
    -- Bitwidth of the fifo size to store outgoing memory requests from a CU
  constant N_RD_FIFOS_TAG_MANAGER_W       : natural := 0;
  constant FINISH_FIFO_ADDR_W             : natural := 3;
    -- Bitwidth of the fifo depth to mark dirty cache lines to be cleared at the end
  -- constant CRAM_BLOCKS                    : natural := 1;
    -- # of CRAM replicates. Each replicate will serve some CUs (1 or 2 supported only)
  constant CV_W                           : natural := 3;
      -- bitwidth of # of PEs within a CV
  constant CV_TO_CACHE_SLICE              : natural := 3;
  constant INSTR_READ_SLICE               : boolean := true;
  constant RTM_WRITE_SLICE                : boolean := true;
  constant WRITE_PHASE_W                  : natural := 1;
    -- # of MSBs of the receiver index in the global memory controller which will be selected to write. These bits increments always.
    -- This incrmenetation should help to balance serving the receivers
  constant RCV_PRIORITY_W                 : natural := 3;

  constant N_WF_CU_W                      : natural := 3;
      -- bitwidth of # of WFs that can be simultaneously managed within a CU
  constant AADD_ATOMIC                    : natural := 1;
  constant AMAX_ATOMIC                    : natural := 1;



  constant GMEM_N_BANK_W                  : natural := 1;
  constant ID_WIDTH                       : natural := 6;
  constant PHASE_W                        : natural := 3;

  constant CV_SIZE                        : natural := 2**CV_W;


  constant RD_CACHE_N_WORDS               : natural := 2**RD_CACHE_N_WORDS_W;
  constant WF_SIZE_W                      : natural  := PHASE_W + CV_W;
      -- A WF will be executed on the PEs of a single CV withen PAHSE_LEN cycels
  constant WG_SIZE_W                      : natural  := WF_SIZE_W + N_WF_CU_W;
      -- A WG must be executed on a single CV. It contains a number of WFs which is at maximum the amount that can be managed within a CV
  constant RTM_ADDR_W                     : natural   := 1+2+N_WF_CU_W+PHASE_W; -- 1+2+3+3 = 9bit
      -- The MSB if select between local indcs or other information
      -- The lower 2 MSBs for d0, d1 or d2. The middle N_WF_CU_W are for the WF index with the CV. The lower LSBs are for the phase index
  constant RTM_DATA_W                     : natural := CV_SIZE*WG_SIZE_W; -- Bitwidth of RTM data ports

  constant BURST_W                        : natural := BURST_WORDS_W - GMEM_N_BANK_W; -- burst width in number of transfers on the axi bus
  constant RD_FIFO_N_BURSTS_W             : natural := 1;
  constant RD_FIFO_W                      : natural := BURST_W + RD_FIFO_N_BURSTS_W;
  constant N_TAG_MANAGERS                 : natural := 2**N_TAG_MANAGERS_W;
  constant N_AXI                          : natural := 2**N_AXI_W;
  constant N_WR_FIFOS_AXI_W               : natural := N_TAG_MANAGERS_W-N_AXI_W;
  constant INTERFCE_W_ADDR_W              : natural := 14;
  constant CRAM_ADDR_W                    : natural := 12; -- TODO
  constant DATA_W                         : natural := 32;
  constant BRAM18kb32b_ADDR_W             : natural := 9;
  constant BRAM36kb64b_ADDR_W             : natural := 9;
  constant BRAM36kb_ADDR_W                : natural := 10;
  constant INST_FIFO_PRE_LEN              : natural := 8;
  constant CV_INST_FIFO_W                 : natural := 3;
  constant LOC_MEM_W                      : natural := BRAM18kb32b_ADDR_W;  
  constant N_PARAMS_W                     : natural := 4;
  constant GMEM_ADDR_W                    : natural := 32;
  constant WI_REG_ADDR_W                  : natural := 5;
  constant N_REG_BLOCKS_W                 : natural := 2;
  constant REG_FILE_BLOCK_W               : natural := PHASE_W+WI_REG_ADDR_W+N_WF_CU_W-N_REG_BLOCKS_W; -- default=3+5+3-2=9
  constant N_WR_FIFOS_W                   : natural := N_WR_FIFOS_AXI_W + N_AXI_W;
  constant N_WR_FIFOS_AXI                 : natural := 2**N_WR_FIFOS_AXI_W;
  constant N_WR_FIFOS                     : natural := 2**N_WR_FIFOS_W;
  constant STAT                           : natural := 1;
  constant STAT_LOAD                      : natural := 0;
  
  -- cache & gmem controller constants
  constant BRMEM_ADDR_W                   : natural := BRAM36kb_ADDR_W; -- default=10
  constant N_RD_PORTS                     : natural := 4;
  constant N                              : natural := CACHE_N_BANKS_W; -- max. 3
  constant L                              : natural := BURST_WORDS_W-N; -- min. 2
  constant M                              : natural := BRMEM_ADDR_W - L; -- max. 8
    -- L+M = BMEM_ADDR_W = 10 = #address bits of a BRAM
    -- cache size = 2^(N+L+M) words; max.=8*4KB=32KB
  constant N_RECEIVERS_CU                 : natural := 2**N_RECEIVERS_CU_W;
  constant N_RECEIVERS_W                  : natural := N_CU_W + N_RECEIVERS_CU_W;
  constant N_RECEIVERS                    : natural := 2**N_RECEIVERS_W;
  constant N_CU_STATIONS_W                : natural := 6;



  constant GMEM_WORD_ADDR_W               : natural := GMEM_ADDR_W - 2;
  constant TAG_W                          : natural := GMEM_WORD_ADDR_W -M -L -N;
  constant GMEM_N_BANK                    : natural := 2**GMEM_N_BANK_W;
  constant CACHE_N_BANKS                  : natural := 2**CACHE_N_BANKS_W;
  constant REG_FILE_W                     : natural := N_REG_BLOCKS_W+REG_FILE_BLOCK_W;
  constant N_REG_BLOCKS                   : natural := 2**N_REG_BLOCKS_W;
  constant REG_ADDR_W                     : natural := BRAM18kb32b_ADDR_W+BRAM18kb32b_ADDR_W;
  constant REG_FILE_SIZE                  : natural := 2**REG_ADDR_W;
  constant REG_FILE_BLOCK_SIZE            : natural := 2**REG_FILE_BLOCK_W;
  constant GMEM_DATA_W                    : natural := GMEM_N_BANK * DATA_W;
  constant N_PARAMS                       : natural := 2**N_PARAMS_W;
  constant LOC_MEM_SIZE                   : natural := 2**LOC_MEM_W;
  constant PHASE_LEN                      : natural := 2**PHASE_W;
  constant CV_INST_FIFO_SIZE              : natural := 2**CV_INST_FIFO_W;
  constant N_CU                           : natural := 2**N_CU_W;
  constant N_WF_CU                        : natural := 2**N_WF_CU_W;
  constant WF_SIZE                        : natural := 2**WF_SIZE_W;
  constant CRAM_SIZE                      : natural := 2**CRAM_ADDR_W;
  constant RTM_SIZE                       : natural := 2**RTM_ADDR_W; 
  constant BRAM18kb_SIZE                  : natural := 2**BRAM18kb32b_ADDR_W;
  

  constant regFile_addr                   : natural := 2**(INTERFCE_W_ADDR_W-1); -- "10" of the address msbs to choose the register file
  constant Rstat_addr                     : natural := regFile_addr + 0; --address of status register in the register file
  constant Rstart_addr                    : natural := regFile_addr + 1; --address of stat register in the register file
  constant RcleanCache_addr               : natural := regFile_addr + 2; --address of cleanCache register in the register file
  constant RInitiate_addr                 : natural := regFile_addr + 3; --address of cleanCache register in the register file
  constant Rstat_regFile_addr             : natural := 0; --address of status register in the register file
  constant Rstart_regFile_addr            : natural := 1; --address of stat register in the register file
  constant RcleanCache_regFile_addr       : natural := 2; --address of cleanCache register in the register file
  constant RInitiate_regFile_addr         : natural := 3; --address of initiate register in the register file
  constant N_REG_W                        : natural := 2;
  constant PARAMS_ADDR_LOC_MEM_OFFSET     : natural  := LOC_MEM_SIZE - N_PARAMS;

  -- constant GMEM_RQST_BUS_W      : natural  := GMEM_DATA_W;

  -- new kernel descriptor ----------------------------------------------------------------
  
  constant NEW_KRNL_DESC_W                : natural   := 5;  -- length of the kernel's descripto
  constant NEW_KRNL_INDX_W                : natural   := 4;  -- bitwidth of number of kernels that can be started
  
  constant NEW_KRNL_DESC_LEN              : natural   := 12;
  
  constant WG_MAX_SIZE                    : natural   := 2**WG_SIZE_W;
  constant NEW_KRNL_DESC_MAX_LEN          : natural   := 2**NEW_KRNL_DESC_W;
  constant NEW_KRNL_MAX_INDX              : natural   := 2**NEW_KRNL_INDX_W;
  constant KRNL_SCH_ADDR_W                : natural  := NEW_KRNL_DESC_W + NEW_KRNL_INDX_W;
  
  constant NEW_KRNL_DESC_N_WF             : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 0;
  constant NEW_KRNL_DESC_ID0_SIZE         : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 1;
  constant NEW_KRNL_DESC_ID1_SIZE         : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 2;
  constant NEW_KRNL_DESC_ID2_SIZE         : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 3;
  constant NEW_KRNL_DESC_ID0_OFFSET       : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 4;
  constant NEW_KRNL_DESC_ID1_OFFSET       : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 5;
  constant NEW_KRNL_DESC_ID2_OFFSET       : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 6;
  constant NEW_KRNL_DESC_WG_SIZE          : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 7;
  constant NEW_KRNL_DESC_N_WG_0           : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 8;
  constant NEW_KRNL_DESC_N_WG_1           : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 9;
  constant NEW_KRNL_DESC_N_WG_2           : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 10;
  constant NEW_KRNL_DESC_N_PARAMS         : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 11;
  constant PARAMS_OFFSET                  : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 16;
    
  constant WG_SIZE_0_OFFSET               : natural := 0;
  constant WG_SIZE_1_OFFSET               : natural := 10;
  constant WG_SIZE_2_OFFSET               : natural := 20;
  constant N_DIM_OFFSET                   : natural := 30;
  constant ADDR_FIRST_INST_OFFSET         : natural := 0;
  constant ADDR_LAST_INST_OFFSET          : natural := 14;
  constant N_WF_OFFSET                    : natural := 28;
  constant N_WG_0_OFFSET                  : natural := 16;
  constant N_WG_1_OFFSET                  : natural := 0;
  constant N_WG_2_OFFSET                  : natural := 16;
  constant WG_SIZE_OFFSET                 : natural := 0;
  constant N_PARAMS_OFFSET                : natural := 28;



  type cram_type is array (2**CRAM_ADDR_W-1 downto 0) of std_logic_vector (DATA_W-1 downto 0);
  type slv32_array is array (natural range<>) of std_logic_vector(DATA_W-1 downto 0);
  type krnl_scheduler_ram_TYPE is array (2**KRNL_SCH_ADDR_W-1 downto 0) of std_logic_vector (DATA_W-1 downto 0);
  type cram_addr_array is array (natural range <>) of unsigned(CRAM_ADDR_W-1 downto 0); -- range 0 to CRAM_SIZE-1;
  type rtm_ram_type is array (natural range <>) of unsigned(RTM_DATA_W-1 downto 0);
  type gmem_addr_array is array (natural range<>) of unsigned(GMEM_ADDR_W-1 downto 0);
  type op_arith_shift_type is (op_add, op_lw, op_mult, op_bra, op_shift, op_slt, op_mov, op_ato, op_lmem);
  type op_logical_type is (op_andi, op_and, op_ori, op_or, op_xor, op_xori, op_nor);
  type be_array is array(natural range <>) of std_logic_vector(DATA_W/8-1 downto 0);
  type gmem_be_array is array(natural range <>) of std_logic_vector(GMEM_N_BANK*DATA_W/8-1 downto 0);
  type sl_array is array(natural range <>) of std_logic;
  type nat_array is array(natural range <>) of natural;
  type nat_2d_array is array(natural range <>, natural range <>) of natural;
  type reg_addr_array is array (natural range <>) of unsigned(REG_FILE_W-1 downto 0);
  type gmem_word_addr_array is array(natural range <>) of unsigned(GMEM_WORD_ADDR_W-1 downto 0);
  type gmem_addr_array_no_bank is array (natural range <>) of unsigned(GMEM_WORD_ADDR_W-CACHE_N_BANKS_W-1 downto 0);
  type alu_en_vec_type is array(natural range <>) of std_logic_vector(CV_SIZE-1 downto 0);
  type alu_en_rdAddr_type is array(natural range <>) of unsigned(PHASE_W+N_WF_CU_W-1 downto 0);
  type tag_array is array (natural range <>) of unsigned(TAG_W-1 downto 0);
  type gmem_word_array is array (natural range <>) of std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0);
  type wf_active_array is array (natural range <>) of std_logic_vector(N_WF_CU-1 downto 0);
  type cache_addr_array is array(natural range <>) of unsigned(M+L-1 downto 0);
  type cache_word_array is array(natural range <>) of std_logic_vector(CACHE_N_BANKS*DATA_W-1 downto 0);
  type tag_addr_array is array(natural range <>) of unsigned(M-1 downto 0);
  type reg_file_block_array is array(natural range<>) of  unsigned(REG_FILE_BLOCK_W-1 downto 0);
  type id_array is array(natural range<>) of std_logic_vector(ID_WIDTH-1 downto 0);
  type real_array is array (natural range <>) of real;
  type atomic_sgntr_array is array (natural range <>) of std_logic_vector(N_CU_STATIONS_W-1 downto 0);
  
  
  attribute max_fanout: integer;
  attribute keep: string;
  attribute mark_debug : string;

  impure function init_krnl_ram(file_name : in string) return KRNL_SCHEDULER_RAM_type;
  impure function init_SLV32_ARRAY_from_file(file_name : in string; len: in natural; file_len: in natural) return SLV32_ARRAY;
  impure function init_CRAM(file_name : in string; file_len: in natural) return cram_type;
  function pri_enc(datain: in std_logic_vector) return integer;
  function max (LEFT, RIGHT: integer) return integer; 
  function min_int (LEFT, RIGHT: integer) return integer; 
  function clogb2 (bit_depth : integer) return integer;


  ---  ISA --------------------------------------------------------------------------------------
  constant FAMILY_W         : natural := 4;
  constant CODE_W           : natural := 4;
  constant IMM_ARITH_W      : natural := 14;
  constant IMM_W            : natural := 16;
  constant BRANCH_ADDR_W    : natural := 14;


  constant FAMILY_POS       : natural := 28;
  constant CODE_POS         : natural := 24;
  constant RD_POS           : natural := 0;
  constant RS_POS           : natural := 5;
  constant RT_POS           : natural := 10;
  constant IMM_POS          : natural := 10;
  constant DIM_POS          : natural := 5;
  constant PARAM_POS        : natural := 5;
  constant BRANCH_ADDR_POS  : natural := 10;
  

  ---------------     families
  constant ADD_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"1";
  constant SHF_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"2";
  constant LGK_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"3";
  constant MOV_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"4";
  constant MUL_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"5";
  constant BRA_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"6";
  constant GLS_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"7";
  constant ATO_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"8";
  constant CTL_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"9";
  constant RTM_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"A";
  constant CND_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"B";
  constant FLT_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"C";
  constant LSI_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"D";
  ---------------     codes
  --RTM
  constant LID              : std_logic_vector(CODE_W-1 downto 0) := X"0"; --upper two MSBs indicate if the operation is localdx or offsetdx
  constant WGOFF            : std_logic_vector(CODE_W-1 downto 0) := X"1";
  constant SIZE             : std_logic_vector(CODE_W-1 downto 0) := X"2";
  constant WGID             : std_logic_vector(CODE_W-1 downto 0) := X"3";
  constant WGSIZE           : std_logic_vector(CODE_W-1 downto 0) := X"4";
  constant LP               : std_logic_vector(CODE_W-1 downto 0) := X"8";
  --ADD  
  constant ADD              : std_logic_vector(CODE_W-1 downto 0) := "0000";
  constant SUB              : std_logic_vector(CODE_W-1 downto 0) := "0010";
  constant ADDI             : std_logic_vector(CODE_W-1 downto 0) := "0001";
  constant LI               : std_logic_vector(CODE_W-1 downto 0) := "1001";
  constant LUI              : std_logic_vector(CODE_W-1 downto 0) := "1101";
  --MUL
  constant MACC             : std_logic_vector(CODE_W-1 downto 0) := "1000";
  --BRA
  constant BEQ              : std_logic_vector(CODE_W-1 downto 0) := "0010";
  constant BNE              : std_logic_vector(CODE_W-1 downto 0) := "0011";
  constant JSUB             : std_logic_vector(CODE_W-1 downto 0) := "0100";
  --GLS
  constant LW               : std_logic_vector(CODE_W-1 downto 0) := "0100";  
  constant SW               : std_logic_vector(CODE_W-1 downto 0) := "1100";  
  --CTL
  constant RET              : std_logic_vector(CODE_W-1 downto 0) := "0010";
  --SHF
  constant SLLI             : std_logic_vector(CODE_W-1 downto 0) := "0001";
  --LGK
  constant CODE_AND         : std_logic_vector(CODE_W-1 downto 0) := "0000";
  constant CODE_ANDI        : std_logic_vector(CODE_W-1 downto 0) := "0001";
  constant CODE_OR          : std_logic_vector(CODE_W-1 downto 0) := "0010";
  constant CODE_ORI         : std_logic_vector(CODE_W-1 downto 0) := "0011";
  constant CODE_XOR         : std_logic_vector(CODE_W-1 downto 0) := "0100";
  constant CODE_XORI        : std_logic_vector(CODE_W-1 downto 0) := "0101";
  constant CODE_NOR         : std_logic_vector(CODE_W-1 downto 0) := "1000";
  --ATO
  constant CODE_AMAX        : std_logic_vector(CODE_W-1 downto 0) := "0010";
  constant CODE_AADD        : std_logic_vector(CODE_W-1 downto 0) := "0001";

  type branch_distance_vec is array(natural range <>) of unsigned(BRANCH_ADDR_W-1 downto 0);
  type code_vec_type is array(natural range <>) of std_logic_vector(CODE_W-1 downto 0);
  type atomic_type_vec_type is array(natural range <>) of std_logic_vector(2 downto 0);

end FGPU_definitions;

package body FGPU_definitions is
  
  -- function called clogb2 that returns an integer which has the
  --value of the ceiling of the log base 2

  function clogb2 (bit_depth : integer) return integer is
    variable depth  : integer := bit_depth;
    variable count  : integer := 1;
  begin
    for clogb2 in 1 to bit_depth loop  -- Works for up to 32 bit integers
      if (bit_depth <= 2) then
        count := 1;
      else
        if(depth <= 1) then
          count := count;
        else
          depth := depth / 2;
          count := count + 1;
        end if;
      end if;
    end loop;
    return(count);
  end;


 
  impure function init_krnl_ram(file_name : in string) return KRNL_SCHEDULER_RAM_type is
    file init_file : text open read_mode is file_name;
    variable init_line : line;
    variable temp_bv : bit_vector(DATA_W-1 downto 0);
    variable temp_mem : KRNL_SCHEDULER_RAM_type;
  begin
    for i in 0 to 16*32-1 loop 
      readline(init_file, init_line);
      hread(init_line, temp_mem(i));
--      read(init_line, temp_bv);
--      temp_mem(i) := to_stdlogicvector(temp_bv);
    end loop;
    return temp_mem;
  end function;

  function max (LEFT, RIGHT: integer) return integer is
  begin
    if LEFT > RIGHT then return LEFT;
      else return RIGHT;
    end if;
  end max;
  function min_int (LEFT, RIGHT: integer) return integer is
  begin
    if LEFT > RIGHT then return RIGHT;
      else return LEFT;
    end if;
  end min_int;
  impure function init_CRAM(file_name : in string; file_len : in natural) return cram_type is

    file init_file : text open read_mode is file_name;
    variable init_line : line;
    variable cram : cram_type;
    -- variable tmp: std_logic_vector(DATA_W-1 downto 0);
  begin
    for i in 0 to file_len-1 loop
      readline(init_file, init_line);
      hread(init_line, cram(i)); -- vivado breaks when synthesizing hread(init_line, cram(0)(i)) without giving any indication about the error
      -- cram(i) := tmp;
      -- if CRAM_BLOCKS > 1 then
      --   for j in 1 to max(1,CRAM_BLOCKS-1) loop
      --     cram(j)(i) := cram(0)(i);
      --   end loop;
      -- end if;
    end loop;
    return cram;
  end function;

  impure function init_SLV32_ARRAY_from_file(file_name : in string; len : in natural; file_len : in natural) return SLV32_ARRAY is
    file init_file : text open read_mode is file_name;
    variable init_line : line;
    variable temp_mem : SLV32_ARRAY(len-1 downto 0);
  begin
    for i in 0 to file_len-1 loop
      readline(init_file, init_line);
      hread(init_line, temp_mem(i));
    end loop;
    return temp_mem;
  end function;
  function pri_enc(datain: in std_logic_vector) return integer is
    variable res : integer range 0 to datain'high;
  begin
    res := 0;
    for i in datain'high downto 1 loop
      if datain(i) = '1' then
        res := i;
      end if;
    end loop;
    return res;
  end function;
 
  
end FGPU_definitions;
