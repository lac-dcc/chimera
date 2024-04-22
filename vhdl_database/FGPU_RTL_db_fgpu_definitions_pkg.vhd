-- libraries --------------------------------------------------------------------------------- {{{
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_textio.all;
use std.textio.all;
------------------------------------------------------------------------------------------------- }}}
package definitions is
  -- Begin of Configurable FGPU Parameters ----------------------------------------------------------------{{{

  -------- CU
  constant N_CU_W                         : natural range 0 to 3 := 3; -- Range: [0,3]
    -- Bitwidth of # of CUs
  constant INSTR_READ_SLICE               : boolean := true;
    -- If true, insert a barrier of registers between WF Scheduler and CV

    ---- CV
    constant CV_W                           : natural range 3 to 3 := 3;
      -- Bitwidth of # of PEs within a CV (only 3 was tested, i.e. 8 PEs/CU)

    ---- Runtime Memory
	constant RTM_WRITE_SLICE                : boolean := true;                                            ------------------------------------------------- Unused constant
	  -- ..

    ---- CU Memory Controller
	constant LMEM_IMPLEMENT                 : natural := 1;
      -- Implement local scratchpad
    constant LMEM_ADDR_W                    : natural := 10;
      -- Bitwidth of local memory address for a single PE
    constant FIFO_ADDR_W                    : natural := 3;
      -- Bitwidth of the fifo size to store outgoing memory requests from a CU
    constant CV_TO_CACHE_SLICE              : natural := 3;                                               ------------------------------------------------- Add comment
      -- ..
  constant SMEM_IMPLEMENT                 : natural := 1;
    -- implement shared memory

  -------- Global Memory Controller
  constant N_RECEIVERS_CU_W               : natural := 6-N_CU_W;
    -- Bitwidth of # of receivers inside the global memory controller per CU. (6-N_CU_W) will lead to 64 receivers whatever the # of CU is.
  constant RCV_PRIORITY_W                 : natural := 3;
    -- Bitwidth of # of receivers priority classes
  constant WRITE_PHASE_W                  : natural := 1;
    -- # of MSBs of the receiver index in the global memory controller which will be selected to write. These bits increments always.
    -- This incrmenetation should help to balance serving the receivers

    ---- Cache
	constant RD_CACHE_N_WORDS_W             : natural := 0;
      -- Bitwidth of # of words the global read bus cache -> CUs
    constant RD_CACHE_FIFO_PORTB_ADDR_W     : natural := 8;
      -- Bitwidth of the fifo buffer for the data read out of the cache. A fifo is implemented in each CU.
    constant CACHE_N_BANKS_W                : natural range 2 to 32 := 2;                                 ------------------------------------------------- Check upper bound
      -- Bitwidth of # words within a cache line

    ---- Stations
    constant N_STATIONS_ALU                 : natural := 4;
      -- # stations to store memory requests sourced by a single ALU
    constant ENABLE_READ_PRIORIRY_PIPE      : boolean := false;
      -- Implements a priority pipeline for the stations of the global memory controller which prioritizes waiting stations when more time is elapsed

    ---- Tag Managers
    constant N_TAG_MANAGERS_W               : natural range 1 to 4 := N_CU_W + 1; -- Range: [1,4]
      -- Bitwidth of # tag controllers per CU (2 Tag managers per CU). Implementation with 1 Tag manager per CU is also possible.
	constant FINISH_FIFO_ADDR_W             : natural := 3;
      -- Bitwidth of the fifo depth to mark dirty cache lines to be cleared at the end


  -------- AXI
  constant N_AXI_W                        : natural range 0 to 2 := 0; -- Range: [0,2]
    -- Bitwidth of # of AXI data ports.
  constant BURST_WORDS_W                  : natural range 4 to 6 := 5;
    -- Bitwidth # of words within a single AXI burst (only 5 is tested intensively, 4 & 6 should work but needs testing)


  -------- Sub-integers operations
  constant SUB_INTEGER_IMPLEMENT          : natural := 0;
    -- Implement sub-integer store operations


  -------- Atomic operations
  constant ATOMIC_IMPLEMENT               : natural := 1;
    -- Implement global atomic operations
  constant AADD_ATOMIC                    : natural := 0;
    -- Implement atomic Add
  constant AMAX_ATOMIC                    : natural := 0;
    -- Implement atomic Max


  -------- Divisor hardware support
  constant DIV_IMPLEMENT                  : natural := 0;
	-- Implement divisor hardware
  constant DIV_DELAY                      : integer := 10;
    -- Divisor delay


  -------- Floating-point hardware support
  constant FLOAT_IMPLEMENT                : natural := 0;
    -- Implement floating-point hardware
  constant FADD_IMPLEMENT                 : integer := 0;
    -- Implement floating add
  constant FMUL_IMPLEMENT                 : integer := 0;
    -- Implement floating multiply
  constant FDIV_IMPLEMENT                 : integer := 0;
    -- Implement floating divide
  constant FSQRT_IMPLEMENT                : integer := 0;
    -- Implement floating SQRT
  constant UITOFP_IMPLEMENT               : integer := 0;
    -- Implement unsigned integer to floating-point
  constant FSLT_IMPLEMENT                 : integer := 0;
    -- Implement Floating Set Less Then
  constant FRSQRT_IMPLEMENT               : integer := 0;
    -- Implement floating RSQRT
  constant FADD_DELAY                     : integer := 11;
    -- Floating Add delay
  constant UITOFP_DELAY                   : integer := 5;
    -- Floating unsigned integer to floating-point delay
  constant FMUL_DELAY                     : integer := 8;
    -- Floating multiply delay
  constant FDIV_DELAY                     : integer := 28;
    -- Floating divide delay
  constant FSQRT_DELAY                    : integer := 28;
    -- Floating SQRT delay
  constant FRSQRT_DELAY                   : integer := 28;
    -- Floating RSQRT delay
  constant FSLT_DELAY                     : integer := 2;
    -- Floating Set Less Then delay
  constant MAX_FPU_DELAY                  : integer := FDIV_DELAY;
    -- Max floating-point operations delay

  -------- Debug hardware implement
  constant DEBUG_IMPLEMENT                : natural := 0;

  -- End of Configurable FGPU Parameters ------------------------------------------------------------------}}}



  -- Begin of Fixed FGPU Parameters ----------------------------------------------------------------{{{

  -------- BRAM constants
  constant BRAM18kb32b_ADDR_W             : natural := 9;
  constant BRAM36kb64b_ADDR_W             : natural := 9;
  constant BRAM36kb_ADDR_W                : natural := 10;
  constant BRAM18kb_SIZE                  : natural := 2**BRAM18kb32b_ADDR_W;


  -------- Control Interface
  constant INTERFCE_W_ADDR_W              : natural := 14;
    -- Bidwith of AXI slave address bus
  constant CRAM_ADDR_W                    : natural := 12; -- TODO
    -- Bidwidth of CRAM address bus
  constant CRAM_SIZE                      : natural := 2**CRAM_ADDR_W;
    -- Depth of CRAM memory
  -- constant CRAM_BLOCKS                    : natural := 1;
    -- # of CRAM replicates. Each replicate will serve some CUs (1 or 2 supported only)

  -------- CU & Work-Group (WG) Dispatcher
    constant DATA_W                         : natural := 32;
      -- Bidwidth of processed data
	constant N_CU                           : natural := 2**N_CU_W;
      -- Number of CU

    ---- CV
    constant CV_SIZE                        : natural := 2**CV_W;
	  -- Number of PEs within a CV
    constant PHASE_W                        : natural range 3 to 3 := 3;
      -- Bitwidth of # of clock cycles when executing the same instruction on the CV (only 3 is tested)
    constant PHASE_LEN                      : natural range 8 to 8 := 2**PHASE_W;
      -- # of clock cycles when executing the same instruction on the CV (only 8 is tested)
    constant CV_INST_FIFO_W                 : natural := 3;
	  -- ..                                                                                               ------------------------------------------------- Unused constant
    constant CV_INST_FIFO_SIZE              : natural := 2**CV_INST_FIFO_W;
      -- ..                                                                                               ------------------------------------------------- Unused constant

    ---- Wavefront (WF) Scheduler
    constant N_WF_CU_W                      : natural := 3;
      -- bitwidth of # of WFs that can be simultaneously managed within a CU
    constant N_WF_CU                        : natural := 2**N_WF_CU_W;
	  -- # of WFs that can be simultaneously managed within a CU
    constant WF_SIZE_W                      : natural := PHASE_W + CV_W;
      -- A WF will be executed on the PEs of a single CV within PHASE_LEN cycels
    constant WF_SIZE                        : natural := 2**WF_SIZE_W;
      -- Numer of WI within a WF

	---- Work-Group (WG) Dispatcher
    constant WG_SIZE_W                      : natural := WF_SIZE_W + N_WF_CU_W;
      -- bitwidth of # of max WI within a CU

    ---- Runtime Memories
	  constant RTM_ADDR_W                     : natural := 1+2+N_WF_CU_W+PHASE_W; -- 1+2+3+3 = 9bit
      -- The MSB if select between local indcs or other information
      -- The lower 2 MSBs for d0, d1 or d2. The middle N_WF_CU_W are for the WF index with the CV. The lower LSBs are for the phase index
    constant RTM_SIZE                       : natural := 2**RTM_ADDR_W;
	  -- Depth of the RTM
    constant RTM_DATA_W                     : natural := CV_SIZE*WG_SIZE_W;
      -- Bitwidth of RTM data ports





    ---- Shared Memories
    constant SMEM_ADDR_W                    : natural := 14;
    -- bitwidth of the address of the shared memory

    ---- Register Files
	constant regFile_addr                   : natural := 2**(INTERFCE_W_ADDR_W-1);                        ------------------------------------------------- Unused constant
	  -- "10" of the address msbs to choose the control register file
    constant Rstat_addr                     : natural := regFile_addr + 0;                                ------------------------------------------------- Unused constant
      -- address of status register in the control register file
    constant Rstart_addr                    : natural := regFile_addr + 1;                                ------------------------------------------------- Unused constant
	  -- address of stat register in the control register file
    constant RcleanCache_addr               : natural := regFile_addr + 2;                                ------------------------------------------------- Unused constant
	  -- address of cleanCache register in the control register file
    constant RInitiate_addr                 : natural := regFile_addr + 3;                                ------------------------------------------------- Unused constant
	  -- address of cleanCache register in the control register file
    constant Rstat_regFile_addr             : natural := 0;                                               ------------------------------------------------- Unused constant
	  -- address of status register in the control register file
    constant Rstart_regFile_addr            : natural := 1;
	  -- address of stat register in the control register file
    constant RcleanCache_regFile_addr       : natural := 2;
	  -- address of cleanCache register in the control register file
    constant RInitiate_regFile_addr         : natural := 3;
	  -- address of initiate register in the control register file
    constant N_REG_W                        : natural := 2;
      -- bitwidth of # of memory location for the control register file
    constant WI_REG_ADDR_W                  : natural := 5;
      -- bitwidth of # of registers within each WI register file
    constant N_REG_BLOCKS_W                 : natural := 2;
      -- bitwidth of # of register files blocks
    constant REG_FILE_BLOCK_W               : natural := PHASE_W+WI_REG_ADDR_W+N_WF_CU_W-N_REG_BLOCKS_W; -- default=3+5+3-2=9
      -- bitwidth of # of locations within each register file block
    constant REG_FILE_W                     : natural := N_REG_BLOCKS_W+REG_FILE_BLOCK_W;
      -- bitwidth of # of register file locations
    constant N_REG_BLOCKS                   : natural := 2**N_REG_BLOCKS_W;
      -- number of register files blocks
    constant REG_ADDR_W                     : natural := BRAM18kb32b_ADDR_W+BRAM18kb32b_ADDR_W;
      -- bitwidth of register file address
    constant REG_FILE_SIZE                  : natural := 2**REG_ADDR_W;
      -- register file size
    constant REG_FILE_BLOCK_SIZE            : natural := 2**REG_FILE_BLOCK_W;
      -- register file block size

  -------- Global Memory Controller
  constant GMEM_ADDR_W                    : natural := 32;
    -- Global memory controller address width (bytes)
  constant GMEM_WORD_ADDR_W               : natural := GMEM_ADDR_W - 2;
    -- Global memory controller address width (words)
  constant GMEM_N_BANK_W                  : natural := 1;
    -- Bitwidth of # of words of a single AXI data interface, i.e. the global memory bus
  constant GMEM_N_BANK                    : natural := 2**GMEM_N_BANK_W;
    -- # of words of a single AXI data interface, i.e. the global memory bus
  constant GMEM_DATA_W                    : natural := GMEM_N_BANK * DATA_W;
    -- Bitwidth of AXI masters read data port
  constant N_RECEIVERS_CU                 : natural := 2**N_RECEIVERS_CU_W;
    -- # of receivers inside the global memory controller per CU. (6-N_CU_W) will lead to 64 receivers whatever the # of CU is
  constant N_RECEIVERS_W                  : natural := N_CU_W + N_RECEIVERS_CU_W;
    -- Bitwidth of total # of receivers inside the global memory controller
  constant N_RECEIVERS                    : natural := 2**N_RECEIVERS_W;
    -- Total # of receivers inside the global memory controller
  constant N_CU_STATIONS_W                : natural := 6;
    -- Bitwidth of # of stations per CU
  constant BRMEM_ADDR_W                   : natural := BRAM36kb_ADDR_W; -- default=10
    -- Bitwidth of # of cache line within the cache
  constant N_RD_PORTS                     : natural := 4;
    -- Number of cache read ports
  constant N                              : natural range 0 to 3 := CACHE_N_BANKS_W; -- max. 3
    -- Bitwidth of # of words within a cache line
  constant L                              : natural range 2 to 6 := BURST_WORDS_W-N; -- min. 2
    -- Bitwidth of # of cache lines to manage an AXI burst
  constant M                              : natural range 0 to 8:= BRMEM_ADDR_W-L; -- max. 8
    -- Bitwidth of # AXI burst within the cache
    -- L+M = BMEM_ADDR_W = 10 = #address bits of a BRAM
    -- cache size = 2^(N+L+M) words; max.=8*4KB=32KB

    ---- Tag
	constant N_TAG_MANAGERS                 : natural := 2**N_TAG_MANAGERS_W;
	  -- Number of Tag Managers
    constant TAG_W                          : natural := GMEM_WORD_ADDR_W -M -L -N;
	  -- Bitwidth of # of tags (#TAG = #words in gmem / #words in cache)
    constant N_RD_FIFOS_TAG_MANAGER_W       : natural range 0 to 0 := 0;
      -- One fifo to store data read out of global memory for each tag manager (now, only 0 makes sense)
    constant STAT                           : natural := 1;
	  -- ..                                                                                               ------------------------------------------------- Unused constant
    constant STAT_LOAD                      : natural := 0;
      -- ..                                                                                               ------------------------------------------------- Unused constant

	---- Cache
	constant CACHE_N_BANKS                  : natural := 2**CACHE_N_BANKS_W;
	  -- # words within a cache line
    constant RD_CACHE_N_WORDS               : natural := 2**RD_CACHE_N_WORDS_W;
      -- # of words the global read bus cache -> CUs

  -------- AXI
    constant N_AXI                          : natural := 2**N_AXI_W;
      -- Number of AXI data ports
    constant ID_WIDTH                       : natural := N_TAG_MANAGERS_W;
      -- Bitwidth of the read & write id channels of AXI4
	constant BURST_W                        : natural := BURST_WORDS_W - GMEM_N_BANK_W;
	  -- Burst width in number of transfers on the axi bus                                                ------------------------------------------------- Why "- GMEM_N_BANK_W" ??
    constant RD_FIFO_N_BURSTS_W             : natural := 1;
	  -- ..                                                                                               ------------------------------------------------- Add comment
	constant RD_FIFO_W                      : natural := BURST_W + RD_FIFO_N_BURSTS_W;
      -- bitwidth of # of FIFOs instantiated in the AXI controllers
    constant N_WR_FIFOS_AXI_W               : natural := N_TAG_MANAGERS_W-N_AXI_W;
      -- bitwidth of # of FIFOs per AXI port
    constant N_WR_FIFOS_AXI                 : natural := 2**N_WR_FIFOS_AXI_W;
      -- number of write FIFOs per AXI port
    constant N_WR_FIFOS_W                   : natural := N_WR_FIFOS_AXI_W + N_AXI_W;
      -- bitwidth of # write FIFOs instantiated in the AXI controllers
    constant N_WR_FIFOS                     : natural := 2**N_WR_FIFOS_W;
      -- number of write FIFOs instantiated in the AXI controllers

  constant N_PARAMS_W                     : natural := 4;
    -- bitwidth of # of parameters within the kernel descriptor
  constant N_PARAMS                       : natural := 2**N_PARAMS_W;
    -- # of parameters within the kernel descriptor
  constant INST_FIFO_PRE_LEN              : natural := 8;
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant LOC_MEM_W                      : natural := BRAM18kb32b_ADDR_W;
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant LOC_MEM_SIZE                   : natural := 2**LOC_MEM_W;
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant PARAMS_ADDR_LOC_MEM_OFFSET     : natural  := LOC_MEM_SIZE - N_PARAMS;
    -- ..                                                                                                 ------------------------------------------------- Unused constant

  -- constant GMEM_RQST_BUS_W      : natural  := GMEM_DATA_W;


  -- new kernel descriptor ----------------------------------------------------------------

  constant NEW_KRNL_DESC_W                : natural   := 5;
    -- bitwidth of depth of the kernel descriptor
  constant NEW_KRNL_INDX_W                : natural   := 4;
    -- bitwidth of number of kernels that can be started

  constant NEW_KRNL_DESC_LEN              : natural   := 12;
    -- ..                                                                                                 ------------------------------------------------- Unused constant

  constant WG_MAX_SIZE                    : natural   := 2**WG_SIZE_W;
    -- max number of WI within a CU
  constant NEW_KRNL_DESC_MAX_LEN          : natural   := 2**NEW_KRNL_DESC_W;
    -- max depth of kernel descriptor
  constant NEW_KRNL_MAX_INDX              : natural   := 2**NEW_KRNL_INDX_W;
    -- max number of kernels that can be started
  constant KRNL_SCH_ADDR_W                : natural  := NEW_KRNL_DESC_W + NEW_KRNL_INDX_W;
    -- bitwidth of LRAM address

  -- Word number within kernel descriptor
  constant NEW_KRNL_DESC_N_WF             : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 0;
    -- (#WF-1 in WG; ...; Address of first instruction)
  constant NEW_KRNL_DESC_ID0_SIZE         : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 1;
    -- (Global size in D0)
  constant NEW_KRNL_DESC_ID1_SIZE         : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 2;
    -- (Global size in D1)
  constant NEW_KRNL_DESC_ID2_SIZE         : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 3;
    -- (Global size in D2)
  constant NEW_KRNL_DESC_ID0_OFFSET       : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 4;
    -- (Global offset in D0)
  constant NEW_KRNL_DESC_ID1_OFFSET       : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 5;
    -- (Global offset in D1)
  constant NEW_KRNL_DESC_ID2_OFFSET       : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 6;
    -- (Global offset in D2)
  constant NEW_KRNL_DESC_WG_SIZE          : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 7;
    -- (#dims-1; WG size in D2; WG size in D1; WG size in D0)
  constant NEW_KRNL_DESC_N_WG_0           : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 8;
    -- (#WG in D0)
  constant NEW_KRNL_DESC_N_WG_1           : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 9;
    -- (#WG in D1)
  constant NEW_KRNL_DESC_N_WG_2           : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 10;
    -- (#WG in D2)
  constant NEW_KRNL_DESC_N_PARAMS         : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 11;
    -- (#Parameters; ...; WG size)
  constant PARAMS_OFFSET                  : natural range 0 to NEW_KRNL_DESC_MAX_LEN-1 := 16;
    -- first parameter array

  -- Offset within kernel descriptor word
  constant WG_SIZE_0_OFFSET               : natural := 0;
    -- (Global offset in D0) offset
  constant WG_SIZE_1_OFFSET               : natural := 10;
    -- (Global offset in D1) offset
  constant WG_SIZE_2_OFFSET               : natural := 20;
    -- (Global offset in D2) offset
  constant N_DIM_OFFSET                   : natural := 30;
    -- (#dims-1) offset
  constant ADDR_FIRST_INST_OFFSET         : natural := 0;
    -- (Address of first instruction) offset
  constant ADDR_LAST_INST_OFFSET          : natural := 14;
    -- (Address of last instruction) offset
  constant N_WF_OFFSET                    : natural := 28;
    -- (#WF-1 in WG) offset
  constant N_WG_0_OFFSET                  : natural := 16;
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant N_WG_1_OFFSET                  : natural := 0;
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant N_WG_2_OFFSET                  : natural := 16;
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant WG_SIZE_OFFSET                 : natural := 0;
    -- (WG size) offset
  constant N_PARAMS_OFFSET                : natural := 28;
    -- (#Parameters) offset


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
  constant DIV_FAMILY       : std_logic_vector(FAMILY_W-1 downto 0) := X"E";
  ---------------     codes
  -- RTM
  constant CODE_LID         : std_logic_vector(CODE_W-1 downto 0) := X"0"; --upper two MSBs indicate if the operation is localdx or offsetdx
  constant CODE_WGOFF       : std_logic_vector(CODE_W-1 downto 0) := X"1";
  constant CODE_SIZE        : std_logic_vector(CODE_W-1 downto 0) := X"2";
  constant CODE_WGID        : std_logic_vector(CODE_W-1 downto 0) := X"3";
  constant CODE_WGSIZE      : std_logic_vector(CODE_W-1 downto 0) := X"4";
  constant CODE_LP          : std_logic_vector(CODE_W-1 downto 0) := X"8";
  -- ADD
  constant CODE_ADD         : std_logic_vector(CODE_W-1 downto 0) := X"0";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_ADDI        : std_logic_vector(CODE_W-1 downto 0) := X"1";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_SUB         : std_logic_vector(CODE_W-1 downto 0) := X"2";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_LI          : std_logic_vector(CODE_W-1 downto 0) := X"9";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_LUI         : std_logic_vector(CODE_W-1 downto 0) := X"D";
    -- ..                                                                                                 ------------------------------------------------- Unused constant

  -- MUL
  constant CODE_MACC        : std_logic_vector(CODE_W-1 downto 0) := X"8";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  -- DIV
  constant CODE_DIV         : std_logic_vector(CODE_W-1 downto 0) := X"2";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_UDIV        : std_logic_vector(CODE_W-1 downto 0) := X"3";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_REM         : std_logic_vector(CODE_W-1 downto 0) := X"4";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_UREM        : std_logic_vector(CODE_W-1 downto 0) := X"5";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  -- BRA
  constant CODE_BEQ         : std_logic_vector(CODE_W-1 downto 0) := X"2";
  constant CODE_BNE         : std_logic_vector(CODE_W-1 downto 0) := X"3";
  constant CODE_JSUB        : std_logic_vector(CODE_W-1 downto 0) := X"4";
  -- GLS
  constant CODE_LW          : std_logic_vector(CODE_W-1 downto 0) := X"4";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_SW          : std_logic_vector(CODE_W-1 downto 0) := X"C";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  -- CTL
  constant CODE_RET         : std_logic_vector(CODE_W-1 downto 0) := X"2";
  constant CODE_SYNC        : std_logic_vector(CODE_W-1 downto 0) := X"1";
  -- SHF
  constant CODE_SLLI        : std_logic_vector(CODE_W-1 downto 0) := X"1";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  -- LGK
  constant CODE_AND         : std_logic_vector(CODE_W-1 downto 0) := X"0";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_ANDI        : std_logic_vector(CODE_W-1 downto 0) := X"1";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_OR          : std_logic_vector(CODE_W-1 downto 0) := X"2";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_ORI         : std_logic_vector(CODE_W-1 downto 0) := X"3";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_XOR         : std_logic_vector(CODE_W-1 downto 0) := X"4";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_XORI        : std_logic_vector(CODE_W-1 downto 0) := X"5";
    -- ..                                                                                                 ------------------------------------------------- Unused constant
  constant CODE_NOR         : std_logic_vector(CODE_W-1 downto 0) := X"8";
    -- ..                                                                                                 ------------------------------------------------- Unused constant

  -- ATO
  constant CODE_AADD        : std_logic_vector(CODE_W-1 downto 0) := X"1";
  constant CODE_AMAX        : std_logic_vector(CODE_W-1 downto 0) := X"2";


  -- End of Fixed FGPU Parameters ------------------------------------------------------------------}}}


  type cram_type is array (2**CRAM_ADDR_W-1 downto 0) of std_logic_vector (DATA_W-1 downto 0);
  type slv32_array is array (natural range<>) of std_logic_vector(DATA_W-1 downto 0);
  type krnl_scheduler_ram_type is array (2**KRNL_SCH_ADDR_W-1 downto 0) of std_logic_vector (DATA_W-1 downto 0);
  type cram_addr_array is array (natural range <>) of unsigned(CRAM_ADDR_W-1 downto 0); -- range 0 to CRAM_SIZE-1;
  type rtm_ram_type is array (natural range <>) of unsigned(RTM_DATA_W-1 downto 0);
  type gmem_addr_array is array (natural range<>) of unsigned(GMEM_ADDR_W-1 downto 0);
  type op_arith_shift_type is (op_add, op_lw, op_mult, op_bra, op_shift, op_slt, op_mov, op_ato, op_lmem, op_smem);
  type op_logical_type is (op_andi, op_and, op_ori, op_or, op_xor, op_xori, op_nor);
    -- ..                                                                                                 ------------------------------------------------- Unused type
  type be_array is array(natural range <>) of std_logic_vector(DATA_W/8-1 downto 0);
  type gmem_be_array is array(natural range <>) of std_logic_vector(GMEM_N_BANK*DATA_W/8-1 downto 0);
  type sl_array is array(natural range <>) of std_logic;
    -- ..                                                                                                 ------------------------------------------------- Unused type
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
  type reg_file_block_array is array(natural range<>) of unsigned(REG_FILE_BLOCK_W-1 downto 0);
  type reg_file_block_matrix is array(natural range<>) of reg_file_block_array(N_REG_BLOCKS-1 downto 0);
  type id_array is array(natural range<>) of std_logic_vector(ID_WIDTH-1 downto 0);
  type real_array is array (natural range <>) of real;
  type wf_distribution_on_wg_type is array (natural range<>) of unsigned(N_WF_CU_W-1 downto 0);
  type wf_active_per_wg_type is array (natural range<>) of std_logic_vector(N_WF_CU-1 downto 0);
  type atomic_sgntr_array is array (natural range <>) of std_logic_vector(N_CU_STATIONS_W-1 downto 0);
  type wi_barrier_type is array (natural range <>) of std_logic_vector (PHASE_LEN*CV_SIZE-1 downto 0);
  -- ISA
  type branch_distance_vec is array(natural range <>) of unsigned(BRANCH_ADDR_W-1 downto 0);
  type code_vec_type is array(natural range <>) of std_logic_vector(CODE_W-1 downto 0);
  type atomic_type_vec_type is array(natural range <>) of std_logic_vector(2 downto 0);
    -- ..                                                                                                 ------------------------------------------------- Unused type
  type smem_addr_t is array(natural range <>) of unsigned(SMEM_ADDR_W-1 downto 0);
  type debug_counter is array (natural range<>) of unsigned(2*DATA_W-1 downto 0);

  -- XDC: attribute max_fanout: integer;
  -- XDC: attribute keep: string;
  -- XDC: attribute mark_debug : string;

  impure function init_krnl_ram(file_name : in string) return KRNL_SCHEDULER_RAM_type;
  impure function init_SLV32_ARRAY_from_file(file_name : in string; len: in natural; file_len: in natural) return SLV32_ARRAY;
  impure function init_CRAM(file_name : in string; file_len: in natural) return cram_type;
  function pri_enc(datain: in std_logic_vector) return integer;
  function max (LEFT, RIGHT: integer) return integer;
  function min_int (LEFT, RIGHT: integer) return integer;
  function clogb2 (bit_depth : integer) return integer;

end definitions;

package body definitions is

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


end definitions;
