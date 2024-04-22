-------------------------------------------------------------------------------
-- Title      : 5-stage RISCV integer pipeline
-- Project    : Freezing Spice
-------------------------------------------------------------------------------
-- File       : pipeline.vhd
-- Author     :   Tim Wawrzynczak
-- Created    : 2015-07-07
-- Last update: 2017-01-15
-- Platform   : FPGA
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: RV32I 5-stage ("classic MIPS") pipeline:
--   Instruction Fetch
--   Instruction Decode
--   Instruction Execute
--   Memory Access
--   Register File Writeback
-------------------------------------------------------------------------------
-- Interrupts: 32-bit wide IRQ number
--   Currently when an instruction signals that an interrupt
--   needs to be taken, a "trap instruction" is immediately inserted into
--   the pipeline.  Once the trap instruction reaches the writeback stage,
--   all instructions in the pipeline are flushed, and the IF stage steers
--   the pipeline to the IRQ_VECTOR_ADDRESS.  The pipeline will have inserted
--   the IRQ number into the "MCAUSE" CSR.  The ISR can read that register
--   to determine the cause of the interrupt and can decide what to do with
--   that information.
--
--   Only one interrupt can be serviced at a time, due to this architectural
--   choice; the 'irq' and 'irq_ack' I/O ports are used to handshake with
--   an external interrupt controller.
-------------------------------------------------------------------------------
-- Copyright (c) 2017 Tim Wawrzynczak
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.common.all;
use work.if_pkg.all;
use work.id_pkg.all;
use work.ex_pkg.all;
use work.csr_pkg.all;

entity pipeline is
    generic (g_initial_pc      : unsigned(31 downto 0) := (others => '0');
             g_for_sim         : boolean               := false;
             g_regout_filename : string                := "sim/regout.vec");
    port (clk   : in std_logic;
          rst_n : in std_logic;

          -- interrupt interface
          irq_num : in  word;
          irq     : in  std_logic;
          irq_ack : out std_logic;

          -- Instruction interface
          insn_in    : in  word;
          insn_valid : in  std_logic;
          insn_addr  : out word;

          -- Data interface
          data_in       : in  word;
          data_out      : out word;
          data_addr     : out word;
          data_write_en : out std_logic;
          data_read_en  : out std_logic;
          data_in_valid : in  std_logic);
end entity pipeline;

architecture Behavioral of pipeline is

    -------------------------------------------------
    -- IF signals
    -------------------------------------------------
    signal if_d : if_in;
    signal if_q : if_out;

    -------------------------------------------------
    -- IF/ID pipeline registers
    -------------------------------------------------
    signal if_id_ir : word := (others => '0');
    signal if_id_pc : word := (others => '0');

    -------------------------------------------------
    -- ID signals
    -------------------------------------------------
    signal id_d             : word;
    signal id_q             : decoded_t;
    signal rs1_data         : word;
    signal rs2_data         : word;
    signal id_op1           : word;
    signal id_op2           : word;
    signal id_predict_taken : std_logic;
    signal id_branch_pc     : word;

    -------------------------------------------------
    -- ID/EX pipeline registers
    -------------------------------------------------
    signal id_ex_pc          : word                         := (others => '0');
    signal id_ex_rs1_addr    : std_logic_vector(4 downto 0) := (others => '0');
    signal id_ex_rs2_addr    : std_logic_vector(4 downto 0) := (others => '0');
    signal id_ex_op1         : word                         := (others => '0');
    signal id_ex_op2         : word                         := (others => '0');
    signal id_ex_ir          : word                         := NOP;
    signal id_ex_imm         : word                         := (others => '0');
    signal id_ex_insn_type   : insn_type_t                  := OP_STALL;
    signal id_ex_use_imm     : std_logic                    := '0';
    signal id_ex_alu_func    : alu_func_t                   := ALU_NONE;
    signal id_ex_branch_type : branch_type_t                := BRANCH_NONE;
    signal id_ex_rd_addr     : std_logic_vector(4 downto 0) := (others => '0');
    signal id_ex_load_type   : load_type_t                  := LOAD_NONE;
    signal id_ex_store_type  : store_type_t                 := STORE_NONE;
    signal id_ex_rf_we       : std_logic                    := '0';
    signal id_ex_taken       : std_logic                    := '0';
    signal id_ex_is_csr      : std_logic                    := '0';
    signal id_ex_csr_addr    : csr_addr_t                   := (others => '0');

    -------------------------------------------------
    -- EX signals
    -------------------------------------------------
    signal ex_d                 : ex_in;
    signal ex_q                 : ex_out;
    signal ex_rf_data           : word;
    signal ex_load_pc           : std_logic;
    signal ex_data_addr         : word;
    signal ex_branch_mispredict : std_logic;
    signal ex_csr_cycle_valid   : std_logic;
    signal ex_csr_timer_tick    : std_logic;
    signal ex_csr_instret       : std_logic;

    -------------------------------------------------
    -- EX/MEM pipeline registers
    -------------------------------------------------
    signal ex_mem_load_pc     : std_logic                    := '0';
    signal ex_mem_next_pc     : word                         := (others => '0');
    signal ex_mem_rf_data     : word                         := (others => '0');
    signal ex_mem_return_addr : word                         := (others => '0');
    signal ex_mem_load_type   : load_type_t                  := LOAD_NONE;
    signal ex_mem_store_type  : store_type_t                 := STORE_NONE;
    signal ex_mem_rd_addr     : std_logic_vector(4 downto 0) := (others => '0');
    signal ex_mem_insn_type   : insn_type_t                  := OP_STALL;
    signal ex_mem_rf_we       : std_logic                    := '0';
    signal ex_mem_data_addr   : word                         := (others => '0');
    signal ex_mem_data_out    : word                         := (others => '0');
    signal ex_mem_rs1_addr    : std_logic_vector(4 downto 0) := (others => '0');
    signal ex_mem_rs2_addr    : std_logic_vector(4 downto 0) := (others => '0');
    signal ex_mem_csr_value   : word                         := (others => '0');
    signal ex_mem_is_csr      : std_logic                    := '0';

    -------------------------------------------------
    -- MEM signals
    -------------------------------------------------
    signal mem_we           : std_logic;
    signal mem_re           : std_logic;
    signal mem_data_addr    : word;
    signal mem_data_out     : word;
    signal mem_lmd_lh       : word;
    signal mem_lmd_lb       : word;
    signal mem_lmd_lhu      : word;
    signal mem_lmd_lbu      : word;
    signal mem_lmd          : word;
    signal mem_rf_data_mux  : word;
    signal mem_data_out_mux : word;

    -------------------------------------------------
    -- MEM/WB pipeline registers
    -------------------------------------------------
    signal mem_wb_rd_addr   : std_logic_vector(4 downto 0) := (others => '0');
    signal mem_wb_rf_we     : std_logic                    := '0';
    signal mem_wb_rf_data   : word                         := (others => '0');
    signal mem_wb_insn_type : insn_type_t                  := OP_STALL;
    signal mem_wb_lmd       : word                         := (others => '0');
    signal mem_wb_is_csr    : std_logic                    := '0';

    -------------------------------------------------
    -- WB signals
    -------------------------------------------------
    signal wb_rf_wr_addr : std_logic_vector(4 downto 0);
    signal wb_rf_wr_en   : std_logic;
    signal wb_rf_wr_data : word;

    -------------------------------------------------
    -- Stalling / killing
    -------------------------------------------------
    signal branch_stall : std_logic;
    signal if_kill      : std_logic;
    signal if_stall     : std_logic;
    signal id_kill      : std_logic;
    signal id_stall     : std_logic;
    signal full_stall   : std_logic;
    signal hazard_stall : std_logic;

    -------------------------------------------------
    -- Interrupt signals
    -------------------------------------------------
    signal in_irq           : std_logic := '0';
    signal trap_in_pipeline : std_logic := '0';
    signal if_take_irq      : std_logic := '0';

    -------------------------------------------------
    -- Simulation-specific signals
    -------------------------------------------------
    file regout_file : text open write_mode is g_regout_filename;

    -- debug signals because VCD files can't contain information from VHDL records
    signal debug_rs1        : std_logic_vector(4 downto 0);
    signal debug_rs2        : std_logic_vector(4 downto 0);
    signal debug_alu_result : word;
begin  -- architecture Behavioral

    -------------------------------------------------
    -- Drive module outputs
    -------------------------------------------------

    -- instruction interface
    insn_addr <= if_q.fetch_addr;

    -- memory interface
    data_read_en  <= mem_re;
    data_write_en <= mem_we;
    data_addr     <= mem_data_addr;
    data_out      <= mem_data_out;

    -------------------------------------------------
    -- Detect when stalling / killing is necessary
    -------------------------------------------------
    if_kill  <= ex_mem_load_pc or (not insn_valid) or id_predict_taken or ex_branch_mispredict;
    if_stall <= ex_mem_load_pc or branch_stall or full_stall or hazard_stall;
    id_kill  <= (ex_mem_load_pc or ex_branch_mispredict) and not id_predict_taken;
    id_stall <= branch_stall or full_stall or hazard_stall;

    -- being lazy and stalling on reads of CSR writes
    hazard_stall <= '1' when ((id_ex_is_csr = '1' and id_ex_rd_addr = id_q.rs1 and id_q.rs1 /= "00000" and id_ex_rf_we = '1')
                              or (ex_mem_is_csr = '1' and ex_mem_rd_addr = id_q.rs1 and id_q.rs1 /= "00000" and ex_mem_rf_we = '1')
                              or (mem_wb_is_csr = '1' and mem_wb_rd_addr = id_q.rs1 and id_q.rs1 /= "00000" and mem_wb_rf_we = '1')
                              or (id_ex_is_csr = '1' and id_ex_rd_addr = id_q.rs2 and id_q.rs2 /= "00000" and id_ex_rf_we = '1')
                              or (ex_mem_is_csr = '1' and ex_mem_rd_addr = id_q.rs2 and id_q.rs2 /= "00000" and ex_mem_rf_we = '1')
                              or (mem_wb_is_csr = '1' and mem_wb_rd_addr = id_q.rs2 and id_q.rs2 /= "00000" and mem_wb_rf_we = '1'))
                    else '0';

    -- stall when a PC redirection is imminent
    branch_stall <= '1' when (id_ex_insn_type = OP_JAL or id_ex_insn_type = OP_JALR or
                              (id_ex_insn_type = OP_BRANCH and ex_q.compare_result = '1'))
                    else '0';

    -- stall on data not being available (data cache misses in the future)
    full_stall <= '1' when (ex_mem_insn_type = OP_LOAD and data_in_valid = '0')
                  else '0';

    ---------------------------------------------------
    -- Instruction fetch
    ---------------------------------------------------

    -- inputs
    if_d.stall   <= if_stall;
    if_d.load_pc <= ex_mem_load_pc or id_predict_taken or ex_branch_mispredict;
    if_d.next_pc <= ex_mem_next_pc when (ex_mem_load_pc = '1') else id_branch_pc;
    if_d.irq     <= if_take_irq;

    -- instantiation
    if_stage : entity work.instruction_fetch(Behavioral)
        port map (clk, rst_n, if_d, if_q);

    -------------------------------------------------
    -- IF/ID pipeline registers
    -------------------------------------------------

    if_id_reg_proc : process (clk, rst_n) is
    begin  -- process if_id_reg_proc
        if (rst_n = '0') then           -- asynchronous reset (active low)
            if_id_ir <= NOP;
            if_id_pc <= (others => '0');
        elsif (rising_edge(clk)) then
            if (id_stall = '0') then
                if (if_kill = '1') then
                    if_id_ir <= NOP;
                else
                    if_id_ir <= insn_in;
                end if;

                if_id_pc <= if_q.pc;
            end if;
        end if;
    end process if_id_reg_proc;

    ---------------------------------------------------
    -- Instruction decode
    ---------------------------------------------------

    -- register file
    register_file : entity work.regfile(rtl)
        port map (clk   => clk,
                  addra => id_q.rs1,
                  addrb => id_q.rs2,
                  rega  => rs1_data,
                  regb  => rs2_data,
                  addrw => wb_rf_wr_addr,
                  dataw => wb_rf_wr_data,
                  we    => wb_rf_wr_en);

    -- instantiation of decoder
    id_stage : entity work.instruction_decoder(Behavioral)
        port map (if_id_ir, id_q);

    -- debug b/c VCD files can't contain signals from VHDL records
    gen_debug1 : if g_for_sim = true generate
        debug_rs1 <= id_q.rs1;
        debug_rs2 <= id_q.rs2;
    end generate gen_debug1;

    -- forwarding to ALU input multiplexer
    id_op1 <= ex_q.alu_result when (id_q.rs1 = id_ex_rd_addr and id_q.rs1 /= "00000" and id_kill = '0') else
              ex_mem_rf_data when (id_q.rs1 = ex_mem_rd_addr and id_q.rs1 /= "00000" and id_kill = '0') else
              mem_wb_rf_data when (id_q.rs1 = mem_wb_rd_addr and id_q.rs1 /= "00000" and id_kill = '0') else
              rs1_data;

    -- forwarding to ALU input multiplexer
    id_op2 <= ex_q.alu_result when (id_q.rs2 = id_ex_rd_addr and id_q.rs2 /= "00000" and id_kill = '0') else
              ex_mem_rf_data when (id_q.rs2 = ex_mem_rd_addr and id_q.rs2 /= "00000" and id_kill = '0') else
              mem_wb_rf_data when (id_q.rs2 = mem_wb_rd_addr and id_q.rs2 /= "00000" and id_kill = '0') else
              rs2_data;

    -- branch prediction: for now, predict backward branches as TAKEN
    --   and forward as NOT TAKEN (optimized for loops)
    id_predict_taken <= '1' when (id_q.imm(31) = '1' and (id_q.insn_type = OP_BRANCH or id_q.insn_type = OP_JAL or id_q.insn_type = OP_JALR))
                        else '0';

    -- adder for branch prediction
    id_branch_pc <= word(unsigned(if_id_pc) + unsigned(id_q.imm));

    ---------------------------------------------------
    -- ID/EX pipeline registers
    ---------------------------------------------------

    -- this is where instructions get issued,
    --   controlled by id_stall, full_stall, and id_kill
    id_ex_reg_proc : process (clk, rst_n) is
    begin  -- process id_ex_reg_proc
        if (rst_n = '0') then           -- asynchronous reset (active low)
            id_ex_pc        <= (others => '0');
            id_ex_rs1_addr  <= (others => '0');
            id_ex_rs2_addr  <= (others => '0');
            id_ex_op1       <= (others => '0');
            id_ex_op2       <= (others => '0');
            id_ex_ir        <= (others => '0');
            id_ex_insn_type <= OP_ILLEGAL;
            id_ex_is_csr    <= '0';
            id_ex_csr_addr  <= (others => '0');
        elsif (rising_edge(clk)) then
            id_ex_taken <= id_predict_taken;

            if (id_stall = '0' and full_stall = '0') then
                id_ex_rs1_addr <= id_q.rs1;
                id_ex_rs2_addr <= id_q.rs2;
                id_ex_op1      <= id_op1;
                id_ex_op2      <= id_op2;
                id_ex_use_imm  <= id_q.use_imm;

                -- to kill an instruction
                if (id_kill = '1') then
                    id_ex_ir          <= NOP;
                    id_ex_rd_addr     <= (others => '0');
                    id_ex_insn_type   <= OP_STALL;
                    id_ex_rf_we       <= '0';
                    id_ex_use_imm     <= '0';
                    id_ex_imm         <= (others => '0');
                    id_ex_alu_func    <= ALU_NONE;
                    id_ex_branch_type <= BRANCH_NONE;
                    id_ex_load_type   <= LOAD_NONE;
                    id_ex_store_type  <= STORE_NONE;
                    id_ex_is_csr      <= '0';
                    id_ex_csr_addr    <= (others => '0');
                else
                    id_ex_pc          <= if_id_pc;
                    id_ex_ir          <= if_id_ir;
                    id_ex_rd_addr     <= id_q.rd;
                    id_ex_insn_type   <= id_q.insn_type;
                    id_ex_rf_we       <= id_q.rf_we;
                    id_ex_use_imm     <= id_q.use_imm;
                    id_ex_imm         <= id_q.imm;
                    id_ex_alu_func    <= id_q.alu_func;
                    id_ex_branch_type <= id_q.branch_type;
                    id_ex_load_type   <= id_q.load_type;
                    id_ex_store_type  <= id_q.store_type;
                    id_ex_is_csr      <= id_q.is_csr;
                    id_ex_csr_addr    <= id_q.csr_addr;
                end if;
            elsif (id_stall = '1' and full_stall = '0') then
                id_ex_ir          <= NOP;
                id_ex_rd_addr     <= (others => '0');
                id_ex_insn_type   <= OP_STALL;
                id_ex_rf_we       <= '0';
                id_ex_use_imm     <= '0';
                id_ex_imm         <= (others => '0');
                id_ex_alu_func    <= ALU_NONE;
                id_ex_branch_type <= BRANCH_NONE;
                id_ex_load_type   <= LOAD_NONE;
                id_ex_store_type  <= STORE_NONE;
                id_ex_is_csr      <= '0';
                id_ex_csr_addr    <= (others => '0');
            end if;
        end if;
    end process id_ex_reg_proc;

    ---------------------------------------------------
    -- print instructions as they are issued
    ---------------------------------------------------
    print_decode : if (g_for_sim = true) generate
        print_decode_proc : process (id_ex_ir, id_ex_pc, id_ex_insn_type, id_ex_taken) is
            variable l        : line;
            variable op1, op2 : word;
        begin  -- process print_decode_proc
            write(l, to_integer(unsigned(id_ex_pc)));
            write(l, string'("  : 0x"));
            write(l, hstr(id_ex_ir));
            writeline(output, l);

            -- differentiate NOPs in the simulation output
            if (id_ex_ir = NOP) then
                write(l, string'("Instruction type: NOP"));
                writeline(output, l);
            else
                print_insn(id_ex_insn_type);
            end if;

            print(id_ex_insn_type);

            if id_ex_insn_type = OP_ALU then
                if (id_ex_rs1_addr = ex_mem_rd_addr and ex_mem_insn_type = OP_LOAD) then
                    write(l, string'("op1 := mem_lmd"));
                    op1 := mem_lmd;
                elsif (id_ex_rs1_addr = mem_wb_rd_addr and mem_wb_insn_type = OP_LOAD) then
                    write(l, string'("op1 := wb_rf_wr_data"));
                    op1 := wb_rf_wr_data;
                elsif (ex_d.insn_type = OP_BRANCH or
                       ex_d.insn_type = OP_JAL or
                       ex_d.insn_type = OP_JALR or
                       ex_d.insn_type = OP_AUIPC) then
                    write(l, string'("op1 := id_ex_pc"));
                    op1 := id_ex_pc;
                else
                    write(l, string'("op1 := id_ex_op1"));
                    op1 := id_ex_op1;
                end if;
                writeline(output, l);

                if (id_ex_rs2_addr = ex_mem_rd_addr and ex_mem_insn_type = OP_LOAD) then
                    write(l, string'("op2 := mem_lmd"));
                    op2 := mem_lmd;
                elsif (id_ex_rs2_addr = mem_wb_rd_addr and mem_wb_insn_type = OP_LOAD) then
                    write(l, string'("op2 := wb_rf_wr_data"));
                    op2 := wb_rf_wr_data;
                elsif ((id_ex_insn_type = OP_ALU and id_ex_use_imm = '1') or
                       id_ex_insn_type = OP_BRANCH or
                       id_ex_insn_type = OP_JAL or
                       id_ex_insn_type = OP_JALR or
                       id_ex_insn_type = OP_LOAD or
                       id_ex_insn_type = OP_STORE or
                       id_ex_insn_type = OP_AUIPC) then
                    write(l, string'("op2 := id_ex_imm"));
                    op1 := id_ex_imm;
                else
                    write(l, string'("op2 := id_ex_op2"));
                    op2 := id_ex_op2;
                end if;
                writeline(output, l);

                write(l, string'(" Op1: "));
                write(l, hstr(op1));
                write(l, string'(", Op2: "));
                write(l, hstr(op2));
                writeline(output, l);
            end if;

            if id_ex_taken = '1' then
                write(l, string'("Predicting branch as taken, redirecting PC to "));
                writeline(output, l);
                print(id_branch_pc);
            end if;

            if (ex_branch_mispredict = '1') then
                write(l, string'("Branch incorrectly predicted, continuing . . ."));
                writeline(output, l);
                print(id_branch_pc);
            end if;

            writeline(output, l);
        end process print_decode_proc;
    end generate print_decode;

    ---------------------------------------------------
    -- Instruction execution stage
    ---------------------------------------------------

    -- inputs (includes multiplexers for ALU operands from the LMD "Load Memory
    -- Data" datapath)
    ex_d.insn_type <= id_ex_insn_type;
    ex_d.npc       <= id_ex_pc;
    ex_d.op1       <= mem_lmd when (id_ex_rs1_addr = ex_mem_rd_addr and ex_mem_insn_type = OP_LOAD)
                      else wb_rf_wr_data when (id_ex_rs1_addr = mem_wb_rd_addr and mem_wb_insn_type = OP_LOAD)
                      else id_ex_op1;
    ex_d.op2 <= mem_lmd when (id_ex_rs2_addr = ex_mem_rd_addr and ex_mem_insn_type = OP_LOAD)
                else wb_rf_wr_data when (id_ex_rs2_addr = mem_wb_rd_addr and mem_wb_insn_type = OP_LOAD)
                else id_ex_op2;
    ex_d.use_imm     <= id_ex_use_imm;
    ex_d.alu_func    <= id_ex_alu_func;
    ex_d.branch_type <= id_ex_branch_type;
    ex_d.imm         <= id_ex_imm;

    -- instantiation of execution stage
    ex_stage : entity work.instruction_executor(Behavioral)
        port map (ex_d, ex_q);

    -- inputs to CSRs
    ex_csr_cycle_valid <= '1' when rst_n = '1' else '0';
    ex_csr_timer_tick  <= '0';          -- TODO: implement
    ex_csr_instret     <= mem_we or wb_rf_wr_en;

    -- instantiation of CSRs (core specific registers)
    inst_csrs : entity work.csr(behavioral)
        port map (clk     => clk,
                  en      => id_ex_is_csr,
                  addr    => id_ex_csr_addr,
                  valid   => ex_csr_cycle_valid,
                  tick    => ex_csr_timer_tick,
                  instret => ex_csr_instret,
                  value   => ex_mem_csr_value);

    -- simulation-specific signal
    gen_debug2 : if g_for_sim = true generate
        debug_alu_result <= ex_q.alu_result;
    end generate gen_debug2;

    -- multiplexer for Register File write data
    ex_rf_data <= ex_q.return_addr when (id_ex_insn_type = OP_JAL or id_ex_insn_type = OP_JALR) else
                  id_ex_imm when (id_ex_insn_type = OP_LUI) else
                  ex_q.alu_result;

    -- selecter for loading the PC with a new value
    ex_load_pc <= '1' when (id_ex_taken = '0' and (id_ex_insn_type = OP_JAL or id_ex_insn_type = OP_JALR or
                                                   (id_ex_insn_type = OP_BRANCH and ex_q.compare_result = '1'))) else '0';

    -- check for misprediction
    ex_branch_mispredict <= '1' when (id_ex_insn_type = OP_BRANCH and ex_q.compare_result = '0' and id_ex_taken = '1') else '0';

    -- multiplexer for data memory address
    ex_data_addr <= ex_q.alu_result when (id_ex_insn_type = OP_LOAD or id_ex_insn_type = OP_STORE) else ex_mem_data_addr;

    ---------------------------------------------------
    -- EX/MEM pipeline registers
    ---------------------------------------------------

    -- purpose: Pipeline data between EX and MEM stages
    ex_mem_regs_proc : process (clk, rst_n) is
    begin  -- process ex_mem_regs_proc
        if (rst_n = '0') then                         -- asynchronous reset (active low)
            ex_mem_load_pc     <= '0';
            ex_mem_next_pc     <= (others => '0');
            ex_mem_rf_data     <= (others => '0');
            ex_mem_return_addr <= (others => '0');
            ex_mem_load_type   <= LOAD_NONE;
            ex_mem_store_type  <= STORE_NONE;
            ex_mem_rd_addr     <= (others => '0');
            ex_mem_insn_type   <= OP_STALL;
            ex_mem_rf_we       <= '0';
            ex_mem_is_csr      <= '0';
        elsif (rising_edge(clk)) then
            if (full_stall = '0') then
                ex_mem_next_pc    <= ex_q.alu_result;
                ex_mem_load_pc    <= ex_load_pc;
                ex_mem_rf_data    <= ex_rf_data;
                ex_mem_data_addr  <= ex_data_addr;
                ex_mem_data_out   <= id_ex_op2;
                ex_mem_load_type  <= id_ex_load_type;
                ex_mem_store_type <= id_ex_store_type;
                ex_mem_rd_addr    <= id_ex_rd_addr;
                ex_mem_insn_type  <= id_ex_insn_type;
                ex_mem_rf_we      <= id_ex_rf_we;
                ex_mem_rs1_addr   <= id_ex_rs1_addr;  -- only needed for forwarding
                ex_mem_rs2_addr   <= id_ex_rs2_addr;  -- only needed for forwarding
                ex_mem_is_csr     <= id_ex_is_csr;
            end if;
        end if;
    end process ex_mem_regs_proc;

    ---------------------------------------------------
    -- Memory stage
    ---------------------------------------------------

    -- memory access logic
    mem_we <= '1' when ex_mem_insn_type = OP_STORE else '0';
    mem_re <= '1' when ex_mem_insn_type = OP_LOAD  else '0';

    -- first level of data memory output muxing
    mem_data_out_mux <= mem_wb_lmd when (mem_wb_insn_type = OP_LOAD) else ex_mem_data_out;

    -- data memory interface multiplexers
    mem_data_addr <= ex_mem_data_addr;
    mem_data_out  <= X"0000" & mem_data_out_mux(15 downto 0) when ex_mem_store_type = SH else
                     X"000000" & mem_data_out_mux(7 downto 0) when ex_mem_store_type = SB else
                     mem_data_out_mux;

    -- load halfword (signed)
    mem_lmd_lh <= word(resize(signed(data_in(15 downto 0)), word'length));

    -- load byte (signed)
    mem_lmd_lb <= word(resize(signed(data_in(7 downto 0)), word'length));

    -- load halfword unsigned
    mem_lmd_lhu <= word(resize(unsigned(data_in(15 downto 0)), word'length));

    -- load byte unsigned
    mem_lmd_lbu <= word(resize(unsigned(data_in(7 downto 0)), word'length));

    -- Load Memory Data register input
    with ex_mem_load_type select
        mem_lmd <=
        mem_lmd_lhu when LHU,
        mem_lmd_lbu when LBU,
        mem_lmd_lh  when LH,
        mem_lmd_lb  when LB,
        data_in     when others;

    -- mux for register-file writeback data
    mem_rf_data_mux <= ex_mem_csr_value when ex_mem_is_csr = '1'
                       else mem_lmd when ex_mem_insn_type = OP_LOAD
                       else ex_mem_rf_data;

    ---------------------------------------------------
    -- MEM/WB pipeline registers
    ---------------------------------------------------

    -- purpose: Create the MEM/WB pipeline registers
    mem_wb_regs : process (clk, rst_n) is
    begin  -- process mem_wb_regs
        if (rst_n = '0') then           -- asynchronous reset (active low)
            mem_wb_rd_addr   <= (others => '0');
            mem_wb_rf_we     <= '0';
            mem_wb_rf_data   <= (others => '0');
            mem_wb_insn_type <= OP_STALL;
        elsif (rising_edge(clk)) then
            if (full_stall = '0') then
                mem_wb_rd_addr   <= ex_mem_rd_addr;
                mem_wb_rf_we     <= ex_mem_rf_we;
                mem_wb_insn_type <= ex_mem_insn_type;
                mem_wb_rf_data   <= mem_rf_data_mux;
                mem_wb_is_csr    <= ex_mem_is_csr;

                if (data_in_valid = '1') then
                    mem_wb_lmd <= mem_lmd;
                end if;
            else
                mem_wb_rf_we  <= '0';
                mem_wb_is_csr <= '0';
            end if;
        end if;
    end process mem_wb_regs;

    ---------------------------------------------------
    -- Writeback stage
    ---------------------------------------------------
    wb_rf_wr_addr <= mem_wb_rd_addr;
    wb_rf_wr_en   <= mem_wb_rf_we;
    wb_rf_wr_data <= mem_wb_rf_data;

    ---------------------------------------------------
    -- print register file writebacks
    ---------------------------------------------------
    log_regs : if (g_for_sim = true) generate
        log_regs_proc : process (wb_rf_wr_addr, wb_rf_wr_en, wb_rf_wr_data) is
            variable l : line;
        begin  -- process print_decode_proc
            if wb_rf_wr_en = '1' then
                write(l, hstr(wb_rf_wr_addr));
                write(l, string'(", "));
                write(l, hstr(wb_rf_wr_data));
                writeline(regout_file, l);
            end if;
        end process log_regs_proc;
    end generate log_regs;
    
end architecture Behavioral;
