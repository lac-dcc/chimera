---------------------------------------------------------------------------------------------------------------------
--                                                                                                                 --
--  Author(s): Abdallah Cheikh abdallah.cheikh@uniroma1.it (abdallah93.as@gmail.com)                               --
--                                                                                                                 --
--  Date Modified: 07-04-2020                                                                                      --
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
--  Klessydra-T13 core v.5.0:                                                                                      --
--  RISCY core pinout, RISC-V core, RV32IMA support plus the RISC-VEmbedded E-extension and custom                 --
--  K-extension. T13 has 4 pipeline stages F/RD/E/W, in order execution. With the execute stage being superscalar  --
--  Supports interleaved multithreading (IMT), with maximum configurable thread pool size = 16 threads.            --
--  Pure RISCV exception and interrupt handling. Only thread 0 can be interrupted extenranlly. inter-thread ints   --
--  are allowed, and used for thread synchronization. Pulpino irq/exception table fully supported by SW            --
--  runtime system.                                                                                                --
--  Contributors to the Klessydra Project: Abdallah Cheikh, Francesco Vigli, Luigi Blasi,                          --
--                Stefano Sordillo, Gianmarco Cerutti, Simone Ponzio, Ivan Matraxia, Mauro Olivieri.               --
--  last update: 17-11-2019                                                                                        --
---------------------------------------------------------------------------------------------------------------------

--package riscv_kless is new work.riscv_klessydra
--  generic map (RV32E => 0);

-- ieee packages ------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use std.textio.all;

-- local packages ------------
use work.riscv_klessydra.all;
--  use work.riscv_kless.all;

-------------------------------------------------------------------------------------------------------------
--  ██╗  ██╗██╗     ███████╗███████╗███████╗██╗   ██╗██████╗ ██████╗  █████╗        ████████╗ ██╗██████╗   --
--  ██║ ██╔╝██║     ██╔════╝██╔════╝██╔════╝╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗       ╚══██╔══╝███║╚════██╗  --
--  █████╔╝ ██║     █████╗  ███████╗███████╗ ╚████╔╝ ██║  ██║██████╔╝███████║ █████╗   ██║   ╚██║ █████╔╝  --
--  ██╔═██╗ ██║     ██╔══╝  ╚════██║╚════██║  ╚██╔╝  ██║  ██║██╔══██╗██╔══██║ ╚════╝   ██║    ██║ ╚═══██╗  --
--  ██║  ██╗███████╗███████╗███████║███████║   ██║   ██████╔╝██║  ██║██║  ██║          ██║    ██║██████╔╝  --
--  ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝          ╚═╝    ╚═╝╚═════╝   --
-------------------------------------------------------------------------------------------------------------

-- core entity declaration --
entity klessydra_t1_3th_core is
  generic (
    THREAD_POOL_SIZE      : integer := 3;   -- Changing the TPS to less than "number of pipeline stages-1" is not allowed. And making it bigger than "pipeline stages-1" is okay but not recommended
    LUTRAM_RF             : natural := 1;   -- Changes the regfile from flip-flop type into BRAM type
    RV32E                 : natural := 0;   -- Regfile size, Can be set to 32 for RV32E being 0 else 16 for RV32E being set to 1
    RV32M                 : natural := 1;   -- Enable the M-extension of the risc-v instruction set
    superscalar_exec_en   : natural := 1;   -- Enables superscalar execution when set to 1, else the stall of the pipeline will depend on tha latency of the instruction
    accl_en               : natural := 1;   -- Enable the generation of the special purpose accelerator
    replicate_accl_en     : natural := 0;   -- Set to 1 to replicate the accelerator for every thread
    multithreaded_accl_en : natural := 0;   -- Set to 1 to let the replicated accelerator share the functional units (note: replicate_accl_en must be set to '1')
    SPM_NUM               : natural := 4;   -- The number of scratchpads available "Minimum allowed is two"
    Addr_Width            : natural := 14;  -- This address is for scratchpads. Setting this will make the size of the spm to be: "2^Addr_Width -1"
    SPM_STRT_ADDR         : std_logic_vector(31 downto 0) := x"1000_0000";  -- This is starting address of the spms, it shouldn't overlap any sections in the memory map
    SIMD                  : natural := 1;   -- Changing the SIMD, would change the number of the functional units in the dsp, and the number of banks in the spms (can be power of 2 only e.g. 1,2,4,8)
    MCYCLE_EN             : natural := 0;   -- Can be set to 1 or 0 only. Setting to zero will disable MCYCLE and MCYCLEH
    MINSTRET_EN           : natural := 0;   -- Can be set to 1 or 0 only. Setting to zero will disable MINSTRET and MINSTRETH
    MHPMCOUNTER_EN        : natural := 0;   -- Can be set to 1 or 0 only. Setting to zero will disable all performance counters except "MCYCLE/H" and "MINSTRET/H"
    count_all             : natural := 1;   -- Perfomance counters count for all the harts instead of there own hart
    debug_en              : natural := 0;   -- Generates the debug unit
    tracer_en             : natural := 0;   -- Enables the generation of the instruction tracer disable in extremely long simulations in order to save storage space
     ----------------------------------------------------------------------------------------
    N_EXT_PERF_COUNTERS : integer := 0;   -- ignored in Klessydra
    INSTR_RDATA_WIDTH   : integer := 32;  -- ignored in Klessydra
    N_HWLP              : integer := 2;   -- ignored in Klessydra
    N_HWLP_BITS         : integer := 4    -- ignored in Klessydra
    );
  port (
    -- clock, reset active low, test enable
    clk_i               : in  std_logic;
    clock_en_i          : in  std_logic;
    rst_ni              : in  std_logic;
    test_en_i           : in  std_logic;
    -- initialization signals 
    boot_addr_i         : in  std_logic_vector(31 downto 0);
    core_id_i           : in  std_logic_vector(3 downto 0);
    cluster_id_i        : in  std_logic_vector(5 downto 0);
    -- program memory interface
    instr_req_o         : out std_logic;
    instr_gnt_i         : in  std_logic;
    instr_rvalid_i      : in  std_logic;
    instr_addr_o        : out std_logic_vector(31 downto 0);
    instr_rdata_i       : in  std_logic_vector(31 downto 0);
    -- data memory interface
    data_req_o          : out std_logic;
    data_gnt_i          : in  std_logic;
    data_rvalid_i       : in  std_logic;
    data_we_o           : out std_logic;
    data_be_o           : out std_logic_vector(3 downto 0);
    data_addr_o         : out std_logic_vector(31 downto 0);
    data_wdata_o        : out std_logic_vector(31 downto 0);
    data_rdata_i        : in  std_logic_vector(31 downto 0);
    data_err_i          : in  std_logic;
    -- interrupt request interface
    irq_i               : in  std_logic;
    irq_id_i            : in  std_logic_vector(4 downto 0);
    irq_ack_o           : out std_logic;
    irq_id_o            : out std_logic_vector(4 downto 0);
    irq_sec_i           : in  std_logic;  -- unused in Pulpino
    sec_lvl_o           : out std_logic;  -- unused in Pulpino
    -- debug interface
    debug_req_i         : in  std_logic;
    debug_gnt_o         : out std_logic;
    debug_rvalid_o      : out std_logic;
    debug_addr_i        : in  std_logic_vector(14 downto 0);
    debug_we_i          : in  std_logic;
    debug_wdata_i       : in  std_logic_vector(31 downto 0);
    debug_rdata_o       : out std_logic_vector(31 downto 0);
    debug_halted_o      : out std_logic;
    debug_halt_i        : in  std_logic;
    debug_resume_i      : in  std_logic;
    -- miscellanous control signals
    fetch_enable_i      : in  std_logic;
    core_busy_o         : out std_logic;
    ext_perf_counters_i : in  std_logic_vector(N_EXT_PERF_COUNTERS to 1)
    );

end entity klessydra_t1_3th_core;

architecture Klessydra_T1 of klessydra_t1_3th_core is

  constant RF_SIZE           : natural := 32-16*RV32E;
  constant RF_CEIL           : natural := integer(ceil(log2(real(RF_SIZE))));
  constant TPS_CEIL          : natural := integer(ceil(log2(real(THREAD_POOL_SIZE))));
  constant TPS_BUF_CEIL      : natural := integer(ceil(log2(real(THREAD_POOL_SIZE-1))));
  constant SPM_ADDR_WID      : natural := integer(ceil(log2(real(SPM_NUM+1)))); 
  constant SIMD_BITS         : natural := integer(ceil(log2(real(SIMD))));
  constant Data_Width        : natural := 32;
  constant SIMD_Width        : natural := SIMD*Data_Width;

  subtype harc_range is integer range THREAD_POOL_SIZE - 1 downto 0;  -- will be used replicated units in the core

  constant ACCL_NUM : natural := (THREAD_POOL_SIZE - (THREAD_POOL_SIZE-1)*(1-replicate_accl_en));
  constant FU_NUM   : natural := (ACCL_NUM - (ACCL_NUM-1)*(multithreaded_accl_en));

  subtype accl_range is integer range ACCL_NUM - 1 downto 0;  -- will be used replicated accelerators in the core 
  subtype fu_range   is integer range FU_NUM - 1 downto 0; -- will be used replicated accelerators in the core 

  signal reset_state            : std_logic;

  -- Control Status Register (CSR) signals
  signal MVSIZE      : array_2d(harc_range)(Addr_Width downto 0);
  signal MVTYPE      : array_2d(harc_range)(3 downto 0);
  signal MPSCLFAC    : array_2d(harc_range)(4 downto 0);
  signal MSTATUS     : array_2d(harc_range)(1 downto 0);
  signal MEPC        : array_2d(harc_range)(31 downto 0);
  signal MCAUSE      : array_2d(harc_range)(31 downto 0);
  signal MIP         : array_2d(harc_range)(31 downto 0);
  signal MTVEC       : array_2d(harc_range)(31 downto 0);
  signal PCER        : array_2d(harc_range)(31 downto 0);

  signal irq_pending     : std_logic_vector(harc_range);
  signal WFI_Instr       : std_logic;
  signal except_pc_vec_o : std_logic_vector(31 downto 0);

  -- Memory fault signals
  signal load_err, store_err : std_logic;

  -- Interface signals from EXEC unit to CSR management unit
  signal csr_instr_req       : std_logic;
  signal csr_instr_done      : std_logic;
  signal csr_access_denied_o : std_logic;
  signal csr_wdata_i         : std_logic_vector(31 downto 0);
  signal csr_op_i            : std_logic_vector(2 downto 0);
  signal csr_rdata_o         : std_logic_vector(31 downto 0);
  signal csr_addr_i          : std_logic_vector (11 downto 0);

  -- CSR management unit internal signal
  signal csr_instr_req_replicated       : std_logic_vector(harc_range);
  signal csr_instr_done_replicated      : std_logic_vector(harc_range);
  signal csr_access_denied_o_replicated : std_logic_vector(harc_range);
  signal csr_rdata_o_replicated         : array_2d(harc_range)(31 downto 0);

  -- program counters --
  signal pc        : array_2d(harc_range)(31 downto 0);
  signal pc_IF     : std_logic_vector(31 downto 0);  -- pc_IF is the actual pc
  signal pc_ID     : std_logic_vector(31 downto 0);  -- pc_ID is the orogram counter of the Decode stage
  signal pc_IE     : std_logic_vector(31 downto 0);  -- pc_IE is pc entering stage IE

  -- instruction register and instr. propagation registers --
  signal instr_word_IE          : std_logic_vector(31 downto 0);
  signal instr_rvalid_IE        : std_logic;  -- validity bit at IE input

  -- pc updater signals
  signal pc_update_enable                : std_logic_vector(harc_range);
  signal wfi_condition_pending           : std_logic_vector(harc_range);
  signal served_ie_except_condition      : std_logic_vector(harc_range);
  signal served_ls_except_condition      : std_logic_vector(harc_range);
  signal served_dsp_except_condition     : std_logic_vector(harc_range);
  signal served_except_condition         : std_logic_vector(harc_range);
  signal served_mret_condition           : std_logic_vector(harc_range);
  signal served_irq                      : std_logic_vector(harc_range);
  signal taken_branch_pending            : std_logic_vector(harc_range);
  signal ie_except_data                  : std_logic_vector(31 downto 0);
  signal ls_except_data                  : std_logic_vector(31 downto 0);
  signal dsp_except_data                 : array_2d(accl_range)(31 downto 0);
  signal taken_branch                    : std_logic;
  signal ie_taken_branch                 : std_logic;
  signal ls_taken_branch                 : std_logic;
  signal dsp_taken_branch                : std_logic_vector(accl_range);
  signal set_branch_condition            : std_logic;
  signal ie_except_condition             : std_logic;
  signal ls_except_condition             : std_logic;
  signal dsp_except_condition            : std_logic_vector(accl_range);
  signal set_except_condition            : std_logic;
  signal set_mret_condition              : std_logic;
  signal PC_offset                       : array_2d(harc_range)(31 downto 0);
  signal pc_except_value                 : array_2d(harc_range)(31 downto 0);
  signal pc_except_value_wire            : array_2d(harc_range)(31 downto 0);
  signal taken_branch_pc_lat             : array_2d(harc_range)(31 downto 0);
  signal incremented_pc                  : array_2d(harc_range)(31 downto 0);
  signal mepc_incremented_pc             : array_2d(harc_range)(31 downto 0) := (others => (others => '0'));
  signal mepc_interrupt_pc               : array_2d(harc_range)(31 downto 0) := (others => (others => '0'));
  signal relative_to_PC                  : array_2d(harc_range)(31 downto 0);
  signal absolute_jump                   : std_logic;
  signal data_we_o_lat                   : std_logic;
  signal misaligned_err                  : std_logic;

  --//parte probabilmente da eliminare
  -- signals for counting intructions
  --signal clock_cycle         : std_logic_vector(63 downto 0);  -- RDCYCLE
  --signal external_counter    : std_logic_vector(63 downto 0);  -- RDTIME
  --signal instruction_counter : std_logic_vector(63 downto 0);  -- RDINSTRET

  -- regfile replicated array
  signal regfile            : array_3d(harc_range)(RF_SIZE-1 downto 0)(31 downto 0);

  --signal used by counters
  signal set_wfi_condition          : std_logic;
  signal harc_to_csr                : harc_range;
  signal jump_instr                 : std_logic;
  signal jump_instr_lat             : std_logic;
  signal branch_instr               : std_logic;
  signal branch_instr_lat           : std_logic;

  -- auxiliary data memory interface signals
  signal data_addr_internal     : std_logic_vector(31 downto 0);
  signal data_be_internal       : std_logic_vector(3 downto 0);

  --DeBug Unit signal and state
  signal dbg_req_o       : std_logic;
  signal dbg_ack_i       : std_logic;
  signal ebreak_instr    : std_logic;

  -- hardware context id at fetch, and propagated hardware context ids
  --signal harc_count            : harc_min_range;
  signal harc_IF         : harc_range;
  signal harc_ID         : harc_range;
  signal harc_EXEC       : harc_range;

  component Program_Counter
  generic (
    THREAD_POOL_SIZE      : integer;
    ACCL_NUM              : natural
  );
  port (
    absolute_jump                     : in  std_logic;
    data_we_o_lat                     : in  std_logic;
    PC_offset                         : in  array_2d(harc_range)(31 downto 0);
    taken_branch                      : in  std_logic;
    ie_taken_branch                   : in  std_logic;
    ls_taken_branch                   : in  std_logic;
    dsp_taken_branch                  : in  std_logic_vector(accl_range);
    set_branch_condition              : in  std_logic;
    ie_except_condition               : in  std_logic;
    ls_except_condition               : in  std_logic;
    dsp_except_condition              : in  std_logic_vector(accl_range);
    set_except_condition              : in  std_logic;
    set_mret_condition                : in  std_logic;
    set_wfi_condition                 : in  std_logic;
    harc_ID                           : in  harc_range;
    harc_EXEC                         : in  harc_range;
    instr_rvalid_IE                   : in  std_logic;
    pc_IE                             : in  std_logic_vector(31 downto 0);
    MSTATUS                           : in  array_2d(harc_range)(1 downto 0);
    MIP, MEPC, MCAUSE, MTVEC          : in  array_2d(harc_range)(31 downto 0);
    instr_word_IE                     : in  std_logic_vector(31 downto 0);
    reset_state                       : in  std_logic;
    pc_IF                             : out std_logic_vector(31 downto 0);
    harc_IF                           : out harc_range;
    served_ie_except_condition        : out std_logic_vector(harc_range);
    served_ls_except_condition        : out std_logic_vector(harc_range);
    served_dsp_except_condition       : out std_logic_vector(harc_range);
    served_except_condition           : out std_logic_vector(harc_range);
    served_mret_condition             : out std_logic_vector(harc_range);
    served_irq                        : in  std_logic_vector(harc_range);
    taken_branch_pending              : out std_logic_vector(harc_range);
    taken_branch_pc_lat               : out array_2d(harc_range)(31 downto 0);
    incremented_pc                    : out array_2d(harc_range)(31 downto 0);
    mepc_incremented_pc               : out array_2d(harc_range)(31 downto 0);
    mepc_interrupt_pc                 : out array_2d(harc_range)(31 downto 0);
    irq_pending                       : out std_logic_vector(harc_range);
    clk_i                             : in  std_logic;
    rst_ni                            : in  std_logic;
    irq_i                             : in  std_logic;
    fetch_enable_i                    : in  std_logic;
    boot_addr_i                       : in  std_logic_vector(31 downto 0);
    instr_gnt_i                       : in  std_logic
    );
  end component;

  component CSR_Unit
  generic (
    THREAD_POOL_SIZE            : integer;
    ACCL_NUM                    : natural;
    Addr_Width                  : natural;
    replicate_accl_en           : natural;
    accl_en                     : natural;
    MCYCLE_EN                   : natural;
    MINSTRET_EN                 : natural;
    MHPMCOUNTER_EN              : natural;
    RF_CEIL                     : natural;
    count_all                   : natural
  );
  port (
    pc_IE                       : in  std_logic_vector(31 downto 0);
    ie_except_data              : in  std_logic_vector(31 downto 0);
    ls_except_data              : in  std_logic_vector(31 downto 0);
    dsp_except_data             : in  array_2d(accl_range)(31 downto 0);
    served_ie_except_condition  : in  std_logic_vector(harc_range);
    served_ls_except_condition  : in  std_logic_vector(harc_range);
    served_dsp_except_condition : in  std_logic_vector(harc_range);
    harc_EXEC                   : in  harc_range;
    harc_to_csr                 : in  harc_range;
    instr_word_IE               : in  std_logic_vector(31 downto 0);
    served_except_condition     : in  std_logic_vector(harc_range);
    served_mret_condition       : in  std_logic_vector(harc_range);
    served_irq                  : in  std_logic_vector(harc_range);
    pc_except_value_wire        : in  array_2d(harc_range)(31 downto 0);
    dbg_req_o                   : in  std_logic;
    data_addr_internal          : in  std_logic_vector(31 downto 0);
    jump_instr                  : in  std_logic;
    branch_instr                : in  std_logic;
    set_branch_condition        : in  std_logic;
    csr_instr_req               : in  std_logic;
    misaligned_err              : in  std_logic;
    WFI_Instr                   : in  std_logic;
    csr_wdata_i                 : in  std_logic_vector(31 downto 0);
    csr_op_i                    : in  std_logic_vector(2 downto 0);
    csr_addr_i                  : in  std_logic_vector(11 downto 0);
    csr_instr_done              : out std_logic;
    csr_access_denied_o         : out std_logic;
    csr_rdata_o                 : out std_logic_vector (31 downto 0);
    MVSIZE                      : out array_2d(harc_range)(Addr_Width downto 0);
    MVTYPE                      : out array_2d(harc_range)(3 downto 0);
    MPSCLFAC                    : out array_2d(harc_range)(4 downto 0);
    MSTATUS                     : out array_2d(harc_range)(1 downto 0);
    MEPC                        : out array_2d(harc_range)(31 downto 0);
    MCAUSE                      : out array_2d(harc_range)(31 downto 0);
    MIP                         : out array_2d(harc_range)(31 downto 0);
    MTVEC                       : out array_2d(harc_range)(31 downto 0);
    PCER                        : out array_2d(harc_range)(31 downto 0);
    fetch_enable_i              : in  std_logic;
    clk_i                       : in  std_logic;
    rst_ni                      : in  std_logic;
    cluster_id_i                : in  std_logic_vector(5 downto 0);
    instr_rvalid_i              : in  std_logic;
    instr_rvalid_IE             : in  std_logic;
    data_we_o                   : in  std_logic;
    data_req_o                  : in  std_logic;
    data_gnt_i                  : in  std_logic;
    irq_i                       : in  std_logic;
    irq_id_i                    : in  std_logic_vector(4 downto 0);
    irq_id_o                    : out std_logic_vector(4 downto 0);
    irq_ack_o                   : out std_logic
    );
  end component;

  component Debug_Unit
  generic(
      THREAD_POOL_SIZE         : integer;
      LUTRAM_RF                : natural;
      ACCL_NUM                 : natural;
      RF_SIZE                  : natural
      );
  port(
      set_branch_condition     : in  std_logic;
      ie_except_condition      : in  std_logic;
      ls_except_condition      : in  std_logic;
      dsp_except_condition     : in  std_logic_vector(accl_range);
      set_except_condition     : in  std_logic;
      set_mret_condition       : in  std_logic;
      served_irq               : in  std_logic_vector(harc_range);
      irq_pending              : in  std_logic_vector(harc_range);
      taken_branch_pc_lat      : in  array_2d(harc_range)(31 downto 0);
      incremented_pc           : in  array_2d(harc_range)(31 downto 0);
      MTVEC                    : in  array_2d(harc_range)(31 downto 0);
      MIP                      : in  array_2d(harc_range)(31 downto 0);
      MSTATUS                  : in  array_2d(harc_range)(1 downto 0);
      MCAUSE                   : in  array_2d(harc_range)(31 downto 0);
      mepc_incremented_pc      : in  array_2d(harc_range)(31 downto 0) := (others => (others => '0'));
      mepc_interrupt_pc        : in  array_2d(harc_range)(31 downto 0) := (others => (others => '0'));
      regfile                  : in  array_3d(harc_range)(RF_SIZE-1 downto 0)(31 downto 0);
      pc_ID                    : in  std_logic_vector (31 downto 0);
      pc_IE                    : in  std_logic_vector (31 downto 0);
      harc_ID                  : in  harc_range;
      ebreak_instr             : in  std_logic;
      dbg_ack_i                : in  std_logic;
      taken_branch             : in  std_logic;
      taken_branch_pending     : in  std_logic_vector(harc_range);
      dbg_req_o                : out std_logic;
      clk_i                    : in  std_logic;
      rst_ni                   : in  std_logic;
      debug_req_i              : in  std_logic;
      debug_gnt_o              : out std_logic;
      debug_rvalid_o           : out std_logic;
      debug_addr_i             : in  std_logic_vector(14 downto 0);
      debug_we_i               : in  std_logic;
      debug_wdata_i            : in  std_logic_vector(31 downto 0);
      debug_rdata_o            : out std_logic_vector(31 downto 0);
      debug_halted_o           : out std_logic;
      debug_halt_i             : in  std_logic;
      debug_resume_i           : in  std_logic
      );
  end component;

  component Pipeline
  generic(
    THREAD_POOL_SIZE           : integer;
    LUTRAM_RF                  : natural;
    RV32E                      : natural;
    RV32M                      : natural;
    superscalar_exec_en        : natural;
    accl_en                    : natural;
    replicate_accl_en          : natural;
    multithreaded_accl_en      : natural;
    SPM_NUM                    : natural;  
    Addr_Width                 : natural;
    SPM_STRT_ADDR              : std_logic_vector(31 downto 0);
    SIMD                       : natural;
    MCYCLE_EN                  : natural;
    MINSTRET_EN                : natural;
    MHPMCOUNTER_EN             : natural;
    count_all                  : natural;
    debug_en                   : natural;
    tracer_en                  : natural;
    -------------------------------------
    ACCL_NUM                   : natural;
    FU_NUM                     : natural;
    RF_SIZE                    : natural;
    RF_CEIL                    : natural;
    TPS_CEIL                   : natural;
    TPS_BUF_CEIL               : natural;
    SPM_ADDR_WID               : natural;
    SIMD_BITS                  : natural;
    Data_Width                 : natural;
    SIMD_Width                 : natural
    );
  port (
    pc_IF                      : in  std_logic_vector(31 downto 0);
    harc_IF                    : in  harc_range;
    irq_pending                : in  std_logic_vector(harc_range);
    csr_instr_done             : in  std_logic;
    csr_access_denied_o        : in  std_logic;
    csr_rdata_o                : in  std_logic_vector (31 downto 0);
    dbg_req_o                  : in  std_logic;
    MVSIZE                     : in  array_2d(harc_range)(Addr_Width downto 0);
    MVTYPE                     : in  array_2d(harc_range)(3 downto 0);
    MPSCLFAC                   : in  array_2d(harc_range)(4 downto 0);
    MSTATUS                    : in  array_2d(harc_range)(1 downto 0);
    PCER                       : in  array_2d(harc_range)(31 downto 0);
    served_irq     	           : out std_logic_vector(harc_range);
    WFI_Instr                  : out std_logic;
    reset_state                : out std_logic;
    misaligned_err             : out std_logic;
    pc_ID                      : out std_logic_vector(31 downto 0);
    pc_IE                      : out std_logic_vector(31 downto 0);
    ie_except_data             : out std_logic_vector(31 downto 0);
    ls_except_data             : out std_logic_vector(31 downto 0);
    dsp_except_data            : out array_2d(accl_range)(31 downto 0);
    taken_branch               : out std_logic;
    ie_taken_branch            : out std_logic;
    ls_taken_branch            : out std_logic;
    dsp_taken_branch           : out std_logic_vector(accl_range);
    set_branch_condition       : out std_logic;
    ie_except_condition        : out std_logic;
    ls_except_condition        : out std_logic;
    dsp_except_condition       : out std_logic_vector(accl_range);
    set_mret_condition         : out std_logic;
    set_wfi_condition          : out std_logic;
    csr_instr_req              : out std_logic;
    instr_rvalid_IE            : out std_logic;  -- validity bit at IE input
    csr_addr_i                 : out std_logic_vector (11 downto 0);
    csr_wdata_i                : out std_logic_vector (31 downto 0);
    csr_op_i                   : out std_logic_vector (2 downto 0);
    jump_instr                 : out std_logic;
    jump_instr_lat             : out std_logic;
    branch_instr               : out std_logic;
    branch_instr_lat           : out std_logic;
    harc_ID                    : out harc_range;
    harc_EXEC                  : out harc_range;
    harc_to_csr                : out harc_range;
    instr_word_IE              : out std_logic_vector(31 downto 0);
    PC_offset                  : out array_2d(harc_range)(31 downto 0);
    dbg_ack_i                  : out std_logic;
    ebreak_instr               : out std_logic;
    data_addr_internal         : out std_logic_vector(31 downto 0);
    absolute_jump              : out std_logic;
    regfile                    : out array_3d(harc_range)(RF_SIZE-1 downto 0)(31 downto 0);
    -- clock, reset active low, test enable
    clk_i                      : in  std_logic;
    rst_ni                     : in  std_logic;
    -- program memory interface
    instr_req_o                : out std_logic;
    instr_gnt_i                : in  std_logic;
    instr_rvalid_i             : in  std_logic;
    instr_rdata_i              : in  std_logic_vector(31 downto 0);
    -- data memory interface
    data_req_o                 : out std_logic;
    data_gnt_i                 : in  std_logic;
    data_rvalid_i              : in  std_logic;
    data_we_o                  : out std_logic;
    data_be_o                  : out std_logic_vector(3 downto 0);
    data_addr_o                : out std_logic_vector(31 downto 0);
    data_wdata_o               : out std_logic_vector(31 downto 0);
    data_rdata_i               : in  std_logic_vector(31 downto 0);
    data_err_i                 : in  std_logic;
    -- interrupt request interface
	irq_i               	   : in  std_logic;
    -- miscellanous control signals
    fetch_enable_i             : in  std_logic;
    core_busy_o                : out std_logic
  );
  end component;

--------------------------------------------------------------------------------------------------
----------------------- ARCHITECTURE BEGIN -------------------------------------------------------              
begin

  assert (LUTRAM_RF /= debug_en and LUTRAM_RF /= 1) report "Debug-Unit cannot read from a LUTRAM regfile." severity WARNING;

  instr_addr_o <= pc_IF;

  set_except_condition <= '1' when (IE_except_condition = '1' or LS_except_condition = '1' or DSP_except_condition /= (accl_range => '0')) else '0';

  process(all)
  begin
  pc_except_value_wire <= pc_except_value;
    if set_except_condition  = '1' then
      pc_except_value_wire(harc_EXEC) <=  pc_IE;    
    end if;
  end process;

  process(clk_i, rst_ni)
  begin
    if rst_ni = '0' then
    elsif rising_edge(clk_i) then
      pc_except_value <= pc_except_value_wire;  -- AAA verify if it is working for DSP and LSU (not verified yet)
    end if;
  end process;

  Prg_Ctr : Program_Counter
    generic map (
      THREAD_POOL_SIZE            => THREAD_POOL_SIZE,
      ACCL_NUM                    => ACCL_NUM
      )
    port map(
      absolute_jump               => absolute_jump,
      data_we_o_lat               => data_we_o_lat,
      PC_offset                   => PC_offset,
      taken_branch                => taken_branch,
      ie_taken_branch             => ie_taken_branch,
      ls_taken_branch             => ls_taken_branch,
      dsp_taken_branch            => dsp_taken_branch,
      set_branch_condition        => set_branch_condition,
      ie_except_condition         => ie_except_condition,
      ls_except_condition         => ls_except_condition,
      dsp_except_condition        => dsp_except_condition, 
      set_except_condition        => set_except_condition,
      set_mret_condition          => set_mret_condition,
      set_wfi_condition           => set_wfi_condition,
      harc_ID                     => harc_ID,
      harc_EXEC                   => harc_EXEC,
      instr_rvalid_IE             => instr_rvalid_IE,
      pc_IE                       => pc_IE,
      MIP                         => MIP,
      MEPC                        => MEPC,
      MSTATUS                     => MSTATUS,
      MCAUSE                      => MCAUSE,
      MTVEC                       => MTVEC,
      instr_word_IE               => instr_word_IE,
      reset_state                 => reset_state,
      pc_IF                       => pc_IF,
      harc_IF                     => harc_IF,
      served_ie_except_condition  => served_ie_except_condition,
      served_ls_except_condition  => served_ls_except_condition,
      served_dsp_except_condition => served_dsp_except_condition,
      served_except_condition     => served_except_condition,
      served_mret_condition       => served_mret_condition,
      served_irq                  => served_irq,
      taken_branch_pending        => taken_branch_pending,
      taken_branch_pc_lat         => taken_branch_pc_lat,
      incremented_pc              => incremented_pc,
      mepc_incremented_pc         => mepc_incremented_pc,
      mepc_interrupt_pc           => mepc_interrupt_pc,
      irq_pending                 => irq_pending,
      clk_i                       => clk_i,
      rst_ni                      => rst_ni,
      irq_i                       => irq_i,
      fetch_enable_i              => fetch_enable_i,
      boot_addr_i                 => boot_addr_i,
      instr_gnt_i                 => instr_gnt_i
      );

  CSR : CSR_Unit
    generic map (
      THREAD_POOL_SIZE            =>  THREAD_POOL_SIZE,
      ACCL_NUM                    =>  ACCL_NUM,
      Addr_Width                  =>  Addr_Width,
      replicate_accl_en           =>  replicate_accl_en,
      accl_en                     =>  accl_en,
      MCYCLE_EN                   =>  MCYCLE_EN,
      MINSTRET_EN                 =>  MINSTRET_EN,
      MHPMCOUNTER_EN              =>  MHPMCOUNTER_EN,
      RF_CEIL                     =>  RF_CEIL,
      count_all                   =>  count_all
    )
    port map(
      pc_IE                       => pc_IE,
      ie_except_data              => ie_except_data,
      ls_except_data              => ls_except_data,
      dsp_except_data             => dsp_except_data,
      served_ie_except_condition  => served_ie_except_condition,
      served_ls_except_condition  => served_ls_except_condition,
      served_dsp_except_condition => served_dsp_except_condition,
      harc_EXEC                   => harc_EXEC,
      harc_to_csr                 => harc_to_csr,
      instr_word_IE               => instr_word_IE,
      served_except_condition     => served_except_condition,
      served_mret_condition       => served_mret_condition,
      served_irq                  => served_irq,
      pc_except_value_wire        => pc_except_value_wire,
      dbg_req_o                   => dbg_req_o,
      data_addr_internal          => data_addr_internal,
      jump_instr                  => jump_instr,
      branch_instr                => branch_instr,
      set_branch_condition        => set_branch_condition,
      csr_instr_req               => csr_instr_req,
      misaligned_err              => misaligned_err,
      WFI_Instr                   => WFI_Instr,
      csr_wdata_i                 => csr_wdata_i,
      csr_op_i                    => csr_op_i,
      csr_addr_i                  => csr_addr_i,
      csr_instr_done              => csr_instr_done,
      csr_access_denied_o         => csr_access_denied_o,
      csr_rdata_o                 => csr_rdata_o,
      MVSIZE                      => MVSIZE,
      MVTYPE                      => MVTYPE,
      MPSCLFAC                    => MPSCLFAC,
      MSTATUS                     => MSTATUS,
      MEPC                        => MEPC,
      MCAUSE                      => MCAUSE,
      MIP                         => MIP,
      MTVEC                       => MTVEC,
      PCER                        => PCER,
      fetch_enable_i              => fetch_enable_i,
      clk_i                       => clk_i,
      rst_ni                      => rst_ni,
      cluster_id_i                => cluster_id_i,
      instr_rvalid_i              => instr_rvalid_i,
      instr_rvalid_IE             => instr_rvalid_IE,
      data_we_o                   => data_we_o,
      data_req_o                  => data_req_o,
      data_gnt_i                  => data_gnt_i,
      irq_i                       => irq_i,
      irq_id_i                    => irq_id_i,
      irq_id_o                    => irq_id_o,
      irq_ack_o                   => irq_ack_o
      );

  DEBUG_generate : if debug_en = 1 generate

  DBG : Debug_Unit
    generic map(
      THREAD_POOL_SIZE         => THREAD_POOL_SIZE,
      LUTRAM_RF                => LUTRAM_RF,
      ACCL_NUM                 => ACCL_NUM,
      RF_SIZE                  => RF_SIZE
      )
    port map(
      set_branch_condition     => set_branch_condition,
      ie_except_condition      => ie_except_condition,
      ls_except_condition      => ls_except_condition,
      dsp_except_condition     => dsp_except_condition,
      set_except_condition     => set_except_condition,
      set_mret_condition       => set_mret_condition,
      served_irq               => served_irq,
      irq_pending              => irq_pending,
      taken_branch_pc_lat      => taken_branch_pc_lat,
      incremented_pc           => incremented_pc,
      MTVEC                    => MTVEC,
      MIP                      => MIP,
      MSTATUS                  => MSTATUS,
      MCAUSE                   => MCAUSE,
      mepc_incremented_pc      => mepc_incremented_pc,
      mepc_interrupt_pc        => mepc_interrupt_pc,
      regfile                  => regfile,
      pc_ID                    => pc_ID,
      pc_IE                    => pc_IE,
      harc_ID                  => harc_ID,
      ebreak_instr             => ebreak_instr,
      dbg_ack_i                => dbg_ack_i,
      taken_branch	           => taken_branch,
      taken_branch_pending     => taken_branch_pending,
      dbg_req_o                => dbg_req_o,
      clk_i                    => clk_i,
      rst_ni                   => rst_ni,
      debug_req_i              => debug_req_i,
      debug_gnt_o              => debug_gnt_o,
      debug_rvalid_o           => debug_rvalid_o,
      debug_addr_i             => debug_addr_i,
      debug_we_i               => debug_we_i,
      debug_wdata_i            => debug_wdata_i,
      debug_rdata_o            => debug_rdata_o,
      debug_halted_o           => debug_halted_o,
      debug_halt_i             => debug_halt_i,
      debug_resume_i           => debug_resume_i
      );

  end generate;

  Pipe : Pipeline
    generic map(
      THREAD_POOL_SIZE      => THREAD_POOL_SIZE,
      LUTRAM_RF             => LUTRAM_RF,
      RV32E                 => RV32E,
      RV32M                 => RV32M,
      superscalar_exec_en   => superscalar_exec_en,
      accl_en               => accl_en,
      replicate_accl_en     => replicate_accl_en,
      multithreaded_accl_en => multithreaded_accl_en,
      SPM_NUM               => SPM_NUM,  
      Addr_Width            => Addr_Width,
      SPM_STRT_ADDR         => SPM_STRT_ADDR,
      SIMD                  => SIMD,
      MCYCLE_EN             => MCYCLE_EN,
      MINSTRET_EN           => MINSTRET_EN,
      MHPMCOUNTER_EN        => MHPMCOUNTER_EN,
      count_all             => count_all,
      debug_en              => debug_en,
      tracer_en             => tracer_en,
      -----------------------------------
      ACCL_NUM              => ACCL_NUM,
      FU_NUM                => FU_NUM,
      RF_SIZE               => RF_SIZE,
      RF_CEIL               => RF_CEIL,
      TPS_CEIL              => TPS_CEIL,
      TPS_BUF_CEIL          => TPS_BUF_CEIL,
      SPM_ADDR_WID          => SPM_ADDR_WID,
      SIMD_BITS             => SIMD_BITS,
      Data_Width            => Data_Width,
      SIMD_Width            => SIMD_Width
      )
    port map(
      pc_IF                      => pc_IF,
      harc_IF                    => harc_IF,
      irq_pending                => irq_pending,
      csr_instr_done             => csr_instr_done,
      csr_access_denied_o        => csr_access_denied_o,
      csr_rdata_o                => csr_rdata_o,
      dbg_req_o                  => dbg_req_o,
      pc_ID                      => pc_ID,
      pc_IE                      => pc_IE,
      ie_except_data             => ie_except_data,
      ls_except_data             => ls_except_data,
      dsp_except_data            => dsp_except_data,
      MVSIZE                     => MVSIZE,
      MVTYPE                     => MVTYPE,
      MPSCLFAC                   => MPSCLFAC,
      MSTATUS                    => MSTATUS,
      PCER                       => PCER,
      served_irq                 => served_irq,
      WFI_Instr                  => WFI_Instr,
      reset_state                => reset_state,
      misaligned_err             => misaligned_err,
      taken_branch               => taken_branch,
      ie_taken_branch            => ie_taken_branch,
      ls_taken_branch            => ls_taken_branch,
      dsp_taken_branch           => dsp_taken_branch,
      set_branch_condition       => set_branch_condition,
      ie_except_condition        => ie_except_condition,
      ls_except_condition        => ls_except_condition,
      dsp_except_condition       => dsp_except_condition,
      set_mret_condition         => set_mret_condition,
      set_wfi_condition          => set_wfi_condition,
      csr_instr_req              => csr_instr_req,
      instr_rvalid_IE            => instr_rvalid_IE,
      csr_addr_i                 => csr_addr_i,
      csr_wdata_i                => csr_wdata_i,
      csr_op_i                   => csr_op_i,
      jump_instr                 => jump_instr,
      jump_instr_lat             => jump_instr_lat,
      branch_instr               => branch_instr,
      branch_instr_lat           => branch_instr_lat,
      harc_ID                    => harc_ID,
      harc_EXEC                  => harc_EXEC,
      harc_to_csr                => harc_to_csr,
      instr_word_IE              => instr_word_IE,
      PC_offset                  => PC_offset,
      dbg_ack_i                  => dbg_ack_i,
      ebreak_instr               => ebreak_instr,
      data_addr_internal         => data_addr_internal,
      absolute_jump              => absolute_jump,
      regfile                    => regfile,
      clk_i                      => clk_i,
      rst_ni                     => rst_ni,
      instr_req_o                => instr_req_o,
      instr_gnt_i                => instr_gnt_i,
      instr_rvalid_i             => instr_rvalid_i,
      instr_rdata_i              => instr_rdata_i,
      data_req_o                 => data_req_o,
      data_gnt_i                 => data_gnt_i,
      data_rvalid_i              => data_rvalid_i,
      data_we_o                  => data_we_o,
      data_be_o                  => data_be_o,
      data_addr_o                => data_addr_o,
      data_wdata_o               => data_wdata_o,
      data_rdata_i               => data_rdata_i,
      data_err_i                 => data_err_i,
      irq_i                      => irq_i,
      fetch_enable_i             => fetch_enable_i,
      core_busy_o                => core_busy_o
      );

end Klessydra_T1;
--------------------------------------------------------------------------------------------------
-- END of Klessydra T13 core architecture --------------------------------------------------------
--------------------------------------------------------------------------------------------------