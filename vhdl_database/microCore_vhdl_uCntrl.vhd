-- ---------------------------------------------------------------------
-- @file : uCntrl.vhd
-- ---------------------------------------------------------------------
--
-- Last change: KS 12.07.2023 20:17:24
-- @project: microCore
-- @language: VHDL-93
-- @copyright (c): Klaus Schleisiek, All Rights Reserved.
-- @contributors:
--
-- @license: Do not use this file except in compliance with the License.
-- You may obtain a copy of the Public License at
-- https://github.com/microCore-VHDL/microCore/tree/master/documents
-- Software distributed under the License is distributed on an "AS IS"
-- basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
-- See the License for the specific language governing rights and
-- limitations under the License.
--
-- @brief: The microCore engine and instruction decoder.
--
-- Version Author   Date       Changes
--   210     ks    8-Jun-2020  initial version
--   2300    ks    8-Mar-2021  compiler switch WITH_PROG_RW eliminated
--                             Converted to NUMERIC_STD
--                             uAdd.vhd and uMult.vhd merged into uArithmetic.vhd
--   2400    ks   31-Jul-2022  Both signed and unsigned division fully tested
--                             in ca. 4h on a 10bit data_width Instantiation.
--                             See load_division.fs.
-- ---------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.functions_pkg.ALL;
USE work.architecture_pkg.ALL;

ENTITY microcontrol IS PORT
(  uBus        : IN  uBus_port;
   deb_reset   : IN  STD_LOGIC;    -- reset issued by debugger
   deb_pause   : IN  STD_LOGIC;    -- pause issued by debugger
   deb_penable : IN  STD_LOGIC;    -- program memory ready for write by debugger
   uCtrl       : OUT core_signals;
   progmem     : OUT progmem_port;
   prog_rdata  : IN  inst_bus;     -- program memory read data
   datamem     : OUT datamem_port;
   mem_rdata   : IN  data_bus      -- data memory read data
); END microcontrol;

ARCHITECTURE rtl OF microcontrol IS

ALIAS  clk           : STD_LOGIC    IS uBus.clk;
ALIAS  clk_en        : STD_LOGIC    IS uBus.clk_en;
ALIAS  sources       : data_sources IS uBus.sources;
ALIAS  flags         : flag_bus     IS uBus.sources(FLAG_REG)(flag_width-1 DOWNTO 0);

SIGNAL reset         : STD_LOGIC;
SIGNAL pause         : STD_LOGIC;
SIGNAL core_en       : STD_LOGIC;
SIGNAL deb_penable_d : STD_LOGIC; -- second cycle of a program memory access

TYPE  uCore_registers  IS RECORD
   tos      : data_bus;
   nos      : data_bus;
   tor      : data_bus;
   status   : status_bus;
   dsp      : dstacks_addr;
   rsp      : rstacks_addr;
   pc       : program_addr;
   inst     : inst_bus;
   chain    : STD_LOGIC;
   data     : data_bus;     -- intermediate storage for +! in external memory
END RECORD;

SIGNAL r             : uCore_registers;
SIGNAL r_in          : uCore_registers;
SIGNAL instruction   : inst_bus;

-- status register
TYPE  status_register  IS RECORD
   c     : STD_LOGIC; -- carry
   ovfl  : STD_LOGIC; -- integer and float overflow
   ie    : STD_LOGIC; -- interrupt enable
   iis   : STD_LOGIC; -- interrupt in service
   lit   : STD_LOGIC; -- previous instruction was lit_instruction
   neg   : STD_LOGIC; -- sign
   zero  : STD_LOGIC; -- zero
   div   : STD_LOGIC; -- sign of division
   den   : STD_LOGIC; -- sign of DividENd
   unfl  : STD_LOGIC; -- float underflow
END RECORD;

SIGNAL s            : status_register;

-- data memory bus signals
SIGNAL mem_en       : STD_LOGIC;     -- select synchronous internal blockRAM
SIGNAL ext_en       : STD_LOGIC;     -- select asynchronous external RAM
SIGNAL reg_en       : STD_LOGIC;     -- select memory mapped register
SIGNAL bytes        : byte_type;     -- 0 => cell, 1 => byte, 2 => word
SIGNAL bytes_d      : byte_type;     -- bytes delayed by one cycle
SIGNAL mem_wr       : STD_LOGIC;     -- output to memory
SIGNAL mem_addr     : data_addr;     -- output to memory
SIGNAL mem_wdata    : data_bus;      -- output to memory

-- program memory
SIGNAL paddr        : program_addr; -- address for program memory
SIGNAL prog_addr    : program_addr; -- latched program memory address
SIGNAL pwrite       : STD_LOGIC;
SIGNAL pread        : STD_LOGIC;    -- read program memory as data

-- data stack
CONSTANT dsp_ini    : NATURAL := exp2(dsp_width) - 1;
SIGNAL ds_rdata     : data_bus;
SIGNAL ds_wdata     : data_bus;
SIGNAL ds_wr        : STD_LOGIC;
SIGNAL ds_addr      : dstacks_addr;
SIGNAL stack_addr   : dstacks_addr; -- for simulation only

-- return stack
CONSTANT rsp_ini    : NATURAL := exp2(rsp_width) - bytes_per_cell;

-- add & multiply
COMPONENT uArithmetic PORT (
-- add
   cin          : IN  STD_LOGIC;
   ladd_x       : IN  UNSIGNED(data_width   DOWNTO 0);
   ladd_y       : IN  UNSIGNED(data_width   DOWNTO 0);
   ladd_out     : OUT UNSIGNED(data_width+1 DOWNTO 0);
-- multiply
   multiplicand : IN  UNSIGNED(data_width DOWNTO 0);
   multiplier   : IN  UNSIGNED(data_width DOWNTO 0);
   product      : OUT UNSIGNED(data_width*2+1 DOWNTO 0)
); END COMPONENT uArithmetic;

SIGNAL cin          : STD_LOGIC;
SIGNAL ladd_x       : UNSIGNED(data_width   DOWNTO 0);
SIGNAL ladd_y       : UNSIGNED(data_width   DOWNTO 0);
SIGNAL ladd_out     : UNSIGNED(data_width+1 DOWNTO 0);
SIGNAL add_x        : data_bus;
SIGNAL add_y        : data_bus;
SIGNAL sum          : data_bus;

SIGNAL multiplier   : UNSIGNED(data_width DOWNTO 0);
SIGNAL multiplicand : UNSIGNED(data_width DOWNTO 0);
SIGNAL product      : UNSIGNED(data_width*2+1 DOWNTO 0);

-- interrupts
SIGNAL ienable      : int_flags; -- enable bit register
SIGNAL pending      : int_flags; -- register of triggered interrupts
SIGNAL interrupt    : STD_LOGIC;

-- timer
CONSTANT time_cnt   : NATURAL := (clk_frequency / (1000 * ticks_per_ms)) - 1;
SIGNAL time_ctr     : NATURAL RANGE 0 TO time_cnt; -- divides system clock
SIGNAL time         : data_bus;
SIGNAL tick         : STD_LOGIC;

BEGIN

datamem.enable    <= mem_en;
datamem.write     <= mem_wr;
datamem.addr      <= mem_addr;
datamem.wdata     <= mem_wdata;
datamem.bytes     <= bytes;

progmem.enable    <= clk_en;
progmem.write     <= pwrite;
progmem.read      <= pread;
progmem.addr      <= paddr;
progmem.wdata     <= r.nos(inst_width-1 DOWNTO 0);

uCtrl.mem_en      <= mem_en;
uCtrl.reg_en      <= reg_en;
uCtrl.ext_en      <= ext_en;
uCtrl.tick        <= tick;
uCtrl.chain       <= r.chain;
uCtrl.status      <= r.status;
uCtrl.dsp         <= r.dsp;
uCtrl.rsp         <= r.rsp;
uCtrl.int         <= pending;
uCtrl.time        <= time;
uCtrl.debug       <= (OTHERS => '0'); -- unused in uCtrl.vhd

-- pragma translate off
s.c      <= r.status(s_c);
s.ovfl   <= r.status(s_ovfl);
s.ie     <= r.status(s_ie);
s.iis    <= r.status(s_iis);
s.lit    <= r.status(s_lit);
s.neg    <= r.status(s_neg);
s.zero   <= r.status(s_zero);
s.div    <= r.status(s_div);
s.den    <= r.status(s_den);
s.unfl   <= r.status(s_unfl);
-- pragma translate on

reset <= uBus.reset OR deb_reset;

pause <= uBus.pause OR deb_pause;

core_en <= clk_en AND NOT (deb_penable OR deb_penable_d);

-- ---------------------------------------------------------------------
-- internal registers and data stack
-- ---------------------------------------------------------------------

uReg_proc: PROCESS(clk, reset)
BEGIN

   IF  reset = '1' AND ASYNC_RESET  THEN
      IF  SIMULATION  THEN
         r.tos <= to_unsigned(16#80#, r.tos'length);
         r.nos <= to_unsigned(16#40#, r.tos'length);
      END IF;
      r.dsp <= to_unsigned(dsp_ini, r.dsp'length);
      r.rsp <= to_unsigned(rsp_ini, r.rsp'length);
      r.pc <= (OTHERS => '0');
      r.inst <= op_NOOP;
      r.chain <= '1';
      r.status <= (OTHERS => '0');
      deb_penable_d <= '0';
      prog_addr <= (OTHERS => '0');
      IF  SIMULATION  THEN
         r.tor <= (OTHERS => '0');
      END IF;

   ELSIF  rising_edge(clk)  THEN

      IF  clk_en = '1'  THEN
         deb_penable_d <= deb_penable;
         prog_addr <= paddr;
         bytes_d <= bytes;
         IF  pause = '1'  THEN
            r.pc <= prog_addr;          -- set back PC
            r.inst <= op_PAUSE;         -- and insert
            r.chain <= '1';             -- op_PAUSE instruction
         ELSIF  deb_penable = '1'  THEN -- while reading or writing program memory
            r.pc <= prog_addr;          -- program memory,
            r.inst <= op_NOOP;          -- an extra NOOP cycle
            r.chain <= '1';             -- must be inserted.
         ELSE
            r <= r_in;
            IF  deb_penable_d = '1'  THEN
               r.status <= r.status;
            END IF;
         END IF;
      END IF;

      IF  reset = '1' AND NOT ASYNC_RESET  THEN
         IF  SIMULATION  THEN
            r.tos <= to_unsigned(16#80#, r.tos'length);
            r.nos <= to_unsigned(16#40#, r.tos'length);
         END IF;
         r.dsp <= to_unsigned(dsp_ini, r.dsp'length);
         r.rsp <= to_unsigned(rsp_ini, r.rsp'length);
         r.pc  <= (OTHERS => '0');
         r.inst <= op_NOOP;
         r.chain <= '1';
         r.status <= (OTHERS => '0');
         deb_penable_d <= '0';
         prog_addr <= (OTHERS => '0');
         IF  SIMULATION  THEN
            r.tor <= (OTHERS => '0');
         END IF;
      END IF;

   END IF;
END PROCESS uReg_proc;

data_stack: internal_ram
GENERIC MAP (data_width, 2**dsp_width, "no_rw_check")
PORT MAP (
   clk   => clk,
   en    => core_en,
   we    => ds_wr,
   addr  => ds_addr,
   di    => ds_wdata,
   do    => ds_rdata
);

-- pragma translate_off
stack_addr_proc : PROCESS (clk)
BEGIN
   IF  rising_edge(clk)  THEN
      IF  core_en = '1'  THEN
         stack_addr <= ds_addr; -- for simulation
      END IF;
   END IF;
END PROCESS stack_addr_proc;
-- pragma translate_on
-- ---------------------------------------------------------------------
-- interrupt management
-- ---------------------------------------------------------------------

interrupt_services: IF  interrupts /= 0  GENERATE

   interrupt_proc: PROCESS (reset, clk)
   BEGIN
      IF  reset = '1' AND ASYNC_RESET  THEN
         ienable <= (OTHERS => '0');
         pending <= (OTHERS => '0');
      ELSIF  rising_edge(clk)  THEN
         IF  clk_en = '1'  THEN
            pending <= flags(pending'high DOWNTO 0) AND ienable; -- synchronized twice, flags first time
            IF  uReg_write(uBus, INT_REG)  THEN
               IF  r.nos(r.nos'high) = '0'  THEN
                  ienable <= ienable OR  r.nos(ienable'high DOWNTO 0);
               ELSE
                  ienable <= ienable AND r.nos(ienable'high DOWNTO 0);
               END IF;
            END IF;
         END IF;
         IF  reset = '1' AND NOT ASYNC_RESET  THEN
            ienable <= (OTHERS => '0');
            pending <= (OTHERS => '0');
         END IF;
      END IF;
   END PROCESS interrupt_proc;

   interrupt <= '1' WHEN  (r.status(s_ie) AND NOT r.status(s_iis)) = '1' AND pending /= 0  ELSE  '0';

END GENERATE interrupt_services; no_interrupt_services: IF  interrupts = 0  GENERATE

   interrupt <= '0';

END GENERATE no_interrupt_services;

-- ---------------------------------------------------------------------
-- time
-- ---------------------------------------------------------------------

timer_proc : PROCESS (clk, reset)
BEGIN
   IF  reset = '1' AND ASYNC_RESET  THEN
      time <= (OTHERS => '0');
   ELSIF  rising_edge(clk)  THEN
      tick <= '0';
      IF  time_ctr = 0  THEN
         IF  SIMULATION  THEN  time_ctr <= time_cnt/10;  ELSE  time_ctr <= time_cnt;  END IF;
         time <= time + 1;
         tick <= '1';
      ELSE
         time_ctr <= time_ctr - 1;
      END IF;
      IF  reset = '1' AND NOT ASYNC_RESET  THEN
         time <= (OTHERS => '0');
      END IF;
   END IF;
END PROCESS timer_proc;

-- ---------------------------------------------------------------------
-- Adder and Multiplier
-- ---------------------------------------------------------------------

uCntrl_arith: uArithmetic PORT MAP (
-- add
   cin           => cin,
   ladd_x        => ladd_x,
   ladd_y        => ladd_y,
   ladd_out      => ladd_out,
-- multiply
   multiplicand  => multiplicand,
   multiplier    => multiplier,
   product       => product
);

sum <= ladd_out(sum'high DOWNTO 0);

-- ---------------------------------------------------------------------
-- instruction decoder
-- ---------------------------------------------------------------------

instruction <= prog_rdata WHEN  r.chain = '0'  ELSE r.inst;

uCore_control: PROCESS
   (uBus, r, r_in, time,
    ladd_x, ladd_y, cin, ladd_out, add_x, add_y, sum,
    multiplicand, multiplier, product,
    mem_wr, mem_addr, mem_rdata, bytes, bytes_d,
    paddr, prog_addr, prog_rdata, instruction,
    ds_rdata, ds_wdata, interrupt, core_en
   )

   VARIABLE rsp_pop      : rstacks_addr;
   VARIABLE rsp_push     : rstacks_addr;
   VARIABLE rstack_addr  : UNSIGNED(data_width-1 DOWNTO rs_addr_width);
   VARIABLE rsp_addr     : data_addr; -- memory address rsp points to
   VARIABLE dsp_push     : dstacks_addr;
   VARIABLE dsp_pop      : dstacks_addr;
   VARIABLE nos_dspush   : dstacks_addr;
   VARIABLE tos_power2   : data_bus;
   VARIABLE temp         : data_bus;
   VARIABLE reg_addr     : INTEGER;
   VARIABLE add_ovfl     : STD_LOGIC;
   VARIABLE tos_zero     : STD_LOGIC;
   VARIABLE nos_zero     : STD_LOGIC;
   VARIABLE registers    : BOOLEAN;
   VARIABLE dcache       : BOOLEAN;
   VARIABLE ext_RAM      : BOOLEAN; -- external asynchronous RAM
-- floating point
   VARIABLE fexp         : exponent;
   VARIABLE mantissa     : data_bus;
   CONSTANT exp_min      : data_bus := (slice('1', data_width - exp_width + 1) & slice('0', exp_width-1));
   CONSTANT fmax_pos     : data_bus := ('0' & slice('1', data_width-1 - exp_width) & slice('1', exp_width));
   CONSTANT fmax_neg     : data_bus := ('1' & slice('0', data_width-1 - exp_width) & slice('1', exp_width));
   CONSTANT zero_pos     : data_bus := ('0' & slice('0', data_width-1));
   CONSTANT zero_neg     : data_bus := ('1' & slice('0', data_width-1));

   ALIAS lit_bit         : STD_LOGIC            IS instruction(7);
   ALIAS i_lit           : UNSIGNED(6 DOWNTO 0) IS instruction(6 DOWNTO 0);
   ALIAS i_usr           : UNSIGNED(4 DOWNTO 0) IS instruction(4 DOWNTO 0);

   ALIAS add_sign        : STD_LOGIC IS ladd_out(data_width-1);
   ALIAS add_carry       : STD_LOGIC IS ladd_out(data_width  );
   ALIAS div_sign        : STD_LOGIC IS ladd_out(data_width  );
   ALIAS div_carry       : STD_LOGIC IS ladd_out(data_width+1);

   PROCEDURE set_opcode (i : IN byte) IS
   BEGIN
      r_in.inst <= i;
      r_in.chain <= '1';
      r_in.pc <= paddr;
   END set_opcode;

   PROCEDURE push_stack IS
   BEGIN
      ds_wr <= '1';
      r_in.nos <= r.tos;
      ds_wdata <= r.nos;
      ds_addr <= dsp_push;
      r_in.dsp <= dsp_push;
   END push_stack;

   PROCEDURE pop_stack IS
   BEGIN
      ds_wr <= '0';
      r_in.tos <= r.nos;
      r_in.nos <= ds_rdata;
      ds_addr <= dsp_pop;
      r_in.dsp <= dsp_pop;
   END pop_stack;

   PROCEDURE push_rstack IS
   BEGIN
      mem_wr <= '1';
      mem_wdata <= r.tor;
      mem_addr <= rstack_addr(mem_addr'high DOWNTO rsp_width) & rsp_push;
      r_in.rsp <= rsp_push;
      IF  addr_rstack < addr_extern  THEN
         mem_en <= '1';
      ELSE
         ext_en <= '1';
      END IF;
   END push_rstack;

   PROCEDURE pop_rstack IS
   BEGIN
      r_in.rsp <= rsp_pop;
      IF  addr_rstack < addr_extern  THEN
         mem_en <= '1';
         set_opcode(op_MEM2TOR);
      ELSE
         ext_en <= '1';
         r_in.tor <= mem_rdata;
      END IF;
   END pop_rstack;

   PROCEDURE call_trap IS
   BEGIN
      push_rstack;
      r_in.tor <= resize(r.pc, r.tor'length);
      paddr <= resize(i_usr & to_unsigned(0, trap_width), paddr'length);
   END call_trap;

   PROCEDURE branch IS
   BEGIN
      IF  r.status(s_lit) = '0'  THEN
         paddr <= r.tos(paddr'range);
      ELSE
         add_x <= r.tos;
         add_y <= resize(r.pc, add_y'length);
         paddr <= sum(paddr'range);
        END IF;
   END branch;

BEGIN

   IF  tasks_addr_width = 0  THEN
      rstack_addr := addr_rstack_v(data_width-1 DOWNTO rs_addr_width);
      dsp_push    := r.dsp + 1;
      nos_dspush  := r.nos(r.dsp'range) + 1;
      dsp_pop     := r.dsp - 1;
      rsp_pop     := r.rsp + bytes_per_cell;
      rsp_push    := r.rsp - bytes_per_cell;
   ELSE
      rstack_addr := addr_rstack_v(data_width-1 DOWNTO rsp_width) & r.rsp(rsp_width-1 DOWNTO rs_addr_width);
      dsp_push    := r.dsp(r.dsp'high DOWNTO ds_addr_width) & (r.dsp(ds_addr_width-1 DOWNTO 0) + 1);
      nos_dspush  := r.nos(r.dsp'high DOWNTO ds_addr_width) & (r.nos(ds_addr_width-1 DOWNTO 0) + 1);
      dsp_pop     := r.dsp(r.dsp'high DOWNTO ds_addr_width) & (r.dsp(ds_addr_width-1 DOWNTO 0) - 1);
      rsp_pop     := r.rsp(r.rsp'high DOWNTO rs_addr_width) & (r.rsp(rs_addr_width-1 DOWNTO 0) + bytes_per_cell);
      rsp_push    := r.rsp(r.rsp'high DOWNTO rs_addr_width) & (r.rsp(rs_addr_width-1 DOWNTO 0) - bytes_per_cell);
   END IF;

-- tos_power2 is used to barrel shift using the multiplier
   FOR  i IN 0 TO data_width-1  LOOP
      IF  r.tos(r.tos'high) = '0'  THEN     -- r.tos is positive
         IF  i = to_integer(r.tos)  THEN
            tos_power2(i) := '1';
         ELSE
            tos_power2(i) := '0';
         END IF;
      ELSE                                  -- r.tos is negative
         IF  (i - data_width) = to_integer(signed(r.tos))  THEN
            tos_power2(i) := '1';
         ELSE
            tos_power2(i) := '0';
         END IF;
      END IF;
   END LOOP;

   tos_zero := '0';  IF  r.tos = 0  THEN  tos_zero := '1';  END IF;
   nos_zero := '0';  IF  r.nos = 0  THEN  nos_zero := '1';  END IF;

-- uCore registers
   r_in <= r;
   IF  r.status(s_lit) = '0'  THEN
      r_in.status(s_neg) <= r.tos(r.tos'high);
      r_in.status(s_zero) <= tos_zero;
   END IF;
   r_in.status(s_lit) <= '0';

-- data stack memory
   ds_wr <= '0';
   ds_addr <= r.dsp;
   ds_wdata <= r.nos;

-- arithmetic
   cin <= '0';
   add_x <= r.tos;
   add_y <= resize(r.pc, add_y'length);
   ladd_x <= '0' & add_x;
   ladd_y <= '0' & add_y;
   add_ovfl := (add_carry XOR add_sign) AND NOT(ladd_x(r.tos'high) XOR ladd_y(r.tos'high)) AND NOT nos_zero;

   multiplicand <= '0' & r.nos;
   multiplier <= '0' & r.tos;

-- floating point
   fexp := NOT r.tos(exp_width-1) & r.tos(exp_width-2 DOWNTO 0);

-- register
   reg_en <= '0';
   reg_addr := to_integer(signed(r.tos(reg_addr_width DOWNTO 0)));

-- return stack
   rsp_addr := rstack_addr(rsp_addr'high DOWNTO rsp_width) & r.rsp;

-- data memory
   registers := false; IF  signed(r.tos(r.tos'high DOWNTO reg_addr_width)) = -1  THEN  registers := true;  END IF;
   dcache    := false; IF  r.tos(data_addr_width-1 DOWNTO cache_addr_width) = 0
                           OR NOT WITH_EXTMEM                                    THEN     dcache := true;  END IF;
   ext_RAM   := false; IF  WITH_EXTMEM AND mem_addr >= addr_extern               THEN    ext_RAM := true;  END IF;

   mem_en <= '0';
   ext_en <= '0';
   bytes <= 0;
   mem_wr <= '0';
   mem_addr <= rsp_addr;
   mem_wdata <= r.nos;

-- program memory
   r_in.chain <= '0';
   paddr <= r.pc;
   r_in.pc <= paddr + 1;
   pwrite <= '0';
   pread <= '0';

-- ---------------------------------------------------------------------
-- interrupt
-- ---------------------------------------------------------------------

   IF  interrupt = '1' AND r.chain = '0'  THEN -- multicycle instructions are indivisible
      push_rstack;
      r_in.tor <= resize(prog_addr, r.tor'length);
      paddr <= to_unsigned(1 * exp2(trap_width), paddr'length);
      push_stack;
      r_in.tos <= resize(r.status, data_width);
      r_in.status(s_iis) <= '1';

-- ---------------------------------------------------------------------
-- literal instructions
-- ---------------------------------------------------------------------

   ELSIF  lit_bit = '1'  THEN
      r_in.status(s_lit) <= '1';
      IF  r.status(s_lit) = '0'  THEN
         push_stack;
         r_in.tos <= unsigned(resize(signed(i_lit), data_width));
      ELSE
         r_in.tos <= r.tos(data_width-8 DOWNTO 0) & i_lit;
      END IF;

   ELSE
-- ---------------------------------------------------------------------
-- opcodes
-- ---------------------------------------------------------------------

      CASE instruction IS

      WHEN op_NOOP  => NULL;

-- ---------------------------------------------------------------------
-- data stack manipulation
-- ---------------------------------------------------------------------

      WHEN op_DROP  =>
         pop_stack;

      WHEN op_DUP   =>
         push_stack;


      WHEN op_QDUP  =>
         IF  r.tos /= 0  THEN -- ?DUP
            push_stack;
         END IF;

      WHEN op_SWAP  =>
         r_in.nos <= r.tos;
         r_in.tos <= r.nos;

      WHEN op_OVER  =>
         push_stack;
         r_in.tos <= r.nos;

      WHEN op_ROT   =>
         r_in.tos <= ds_rdata;
         r_in.nos <= r.tos;
         ds_wdata <= r.nos; -- default
         ds_wr <= '1';

-- ---------------------------------------------------------------------
-- return stack manipulation
-- ---------------------------------------------------------------------

      WHEN op_RPUSH =>
         pop_stack;
         push_rstack;
         r_in.tor <= r.tos;

      WHEN op_RPOP  =>
         push_stack;
         pop_rstack;
         r_in.tos <= r.tor;

      WHEN op_RTOR  =>
         push_stack;
         r_in.tos <= r.tor;

      WHEN op_SUM2TOS =>
      IF  with_INDEX AND addr_rstack < addr_extern  THEN
      -- needed for op_INDEX
         add_x <= mem_rdata;
         add_y <= NOT r.tor;
         cin <= '1';
         r_in.tos <= sum;
      END IF;

      WHEN op_INDEX =>
      IF  with_INDEX  THEN
      -- DO ... LOOP index computed from top two items on return stack
         push_stack;
         IF  addr_rstack < addr_extern  THEN
            mem_en <= '1';
            set_opcode(op_SUM2TOS);
         ELSE
            ext_en <= '1';
            add_x <= mem_rdata;
            add_y <= NOT r.tor;
            cin <= '1';
            r_in.tos <= sum;
         END IF;
      END IF;

-- ---------------------------------------------------------------------
-- data memory access
-- ---------------------------------------------------------------------

      WHEN op_MEM2TOR =>
      IF  addr_rstack < addr_extern  THEN
      -- needed for procedure pop_rstack
         r_in.tor <= mem_rdata;
         r_in.status(s_lit) <= r.status(s_lit); -- I have no recollection why this is necessary - ks
      END IF;

      WHEN op_MEM2NOS =>
         mem_addr <= r.tos(mem_addr'range);
         bytes <= bytes_d;
         r_in.nos <= mem_rdata;

      WHEN op_LOAD  =>
         push_stack;
         r_in.tos <= r.tos;
         mem_addr <= r.tos(mem_addr'range);
         IF  registers  THEN
            reg_en <= '1';
            r_in.nos <= sources(reg_addr);

            IF  STATUS_REG = reg_addr  THEN
               r_in.nos(s_lit) <= '0';
            END IF;

         ELSIF  ext_RAM  THEN -- external memory
            ext_en <= '1';
            r_in.nos <= mem_rdata;
         ELSIF  dcache  THEN   -- internal data memory
            mem_en <= '1';
            set_opcode(op_MEM2NOS);
         END IF;

      WHEN op_CLOAD =>
      IF  byte_addr_width /= 0  THEN
         push_stack;
         r_in.tos <= r.tos;
         mem_addr <= r.tos(mem_addr'range);
         bytes <= 1;
         IF  ext_RAM  THEN     -- external byte addressable RAM
            ext_en <= '1';
            r_in.nos <= mem_rdata;
         ELSIF  dcache  THEN   -- internal data memory
            mem_en <= '1';
            set_opcode(op_MEM2NOS);
         END IF;
      END IF;

      WHEN op_WLOAD =>
      IF  byte_addr_width = 2  THEN
         push_stack;
         r_in.tos <= r.tos;
         mem_addr <= r.tos(mem_addr'range);
         bytes <= 2;
         IF  ext_RAM  THEN     -- external byte addressable RAM
            ext_en <= '1';
            r_in.nos <= mem_rdata;
         ELSIF  dcache  THEN   -- internal data memory
            mem_en <= '1';
            set_opcode(op_MEM2NOS);
         END IF;
      END IF;

      WHEN op_STORE =>
         pop_stack;
         r_in.tos <= r.tos;
         mem_wr <= '1';
         mem_addr <= r.tos(mem_addr'range);
         IF  registers  THEN
            reg_en <= '1';

            IF  STATUS_REG = reg_addr  THEN
               r_in.status <= r.nos(r.status'range);

            ELSIF  DSP_REG = reg_addr  THEN
               r_in.dsp <= r.nos(r.dsp'range);
               ds_addr  <= r.nos(ds_addr'range);

            ELSIF  RSP_REG = reg_addr  THEN
               r_in.rsp <= r.nos(r.rsp'range);
            END IF;

         ELSIF  ext_RAM  THEN  -- external memory
            ext_en <= '1';
         ELSIF  dcache  THEN   -- internal data memory
            mem_en <= '1';
         END IF;

      WHEN op_CSTORE =>
      IF  byte_addr_width /= 0  THEN
         pop_stack;
         r_in.tos <= r.tos;
         mem_wr <= '1';
         mem_addr <= r.tos(mem_addr'range);
         bytes <= 1;
         IF  ext_RAM  THEN     -- external memory
            ext_en <= '1';
         ELSIF  dcache  THEN   -- internal data memory
            mem_en <= '1';
         END IF;
      END IF;

      WHEN op_WSTORE =>
      IF  byte_addr_width = 2  THEN
         pop_stack;
         r_in.tos <= r.tos;
         mem_wr <= '1';
         mem_addr <= r.tos(mem_addr'range);
         bytes <= 2;
         IF  ext_RAM  THEN     -- external memory
            ext_en <= '1';
         ELSIF  dcache  THEN   -- internal data memory
            mem_en <= '1';
         END IF;
      END IF;

      WHEN op_MEM2TOS =>
      IF  with_FETCH OR with_CFETCH  THEN
         mem_addr <= r.tos(mem_addr'range);
         bytes <= bytes_d;
         r_in.tos <= mem_rdata;
      END IF;

      WHEN op_FETCH =>
      IF  with_FETCH  THEN
         mem_addr <= r.tos(mem_addr'range);
         IF  registers  THEN
            reg_en <= '1';
            r_in.tos <= sources(reg_addr);

            IF  STATUS_REG = reg_addr  THEN
               r_in.tos(s_lit) <= '0';
            END IF;

         ELSIF  ext_RAM  THEN
            ext_en <= '1';
            r_in.tos <= mem_rdata;
         ELSIF  dcache  THEN   -- internal data memory
            mem_en <= '1';
            set_opcode(op_MEM2TOS);
         END IF;
      END IF;

      WHEN op_CFETCH =>
      IF  with_CFETCH AND byte_addr_width /= 0  THEN
         mem_addr <= r.tos(mem_addr'range);
         bytes <= 1;
         IF  ext_RAM  THEN   -- external memory
            ext_en <= '1';
         ELSIF  dcache  THEN   -- internal data memory
            mem_en <= '1';
            set_opcode(op_MEM2TOS);
         END IF;
      END IF;

      WHEN op_LOCAL =>
         -- wraps around inside rstack area
         add_x <= r.tos - bytes_per_cell;
         add_y <= resize(rsp_addr(rs_addr_width-1 DOWNTO 0), add_y'length);
         r_in.tos <= rstack_addr & sum(rs_addr_width-1 DOWNTO 0);
       
      WHEN op_PLUSST =>
      IF  with_PLUSST  THEN
      -- indivisible read-modify-write +! instruction
         mem_addr <= r.tos(mem_addr'range);
         IF  registers  THEN
            reg_en <= '1';
            add_x <= sources(reg_addr);
            add_y <= r.nos;
            mem_wdata <= sum;
            cin <= '0';
            mem_wr <= '1';
         ELSE
            IF  ext_RAM  THEN
               ext_en <= '1';
               r_in.data <= mem_rdata;
            ELSIF  dcache  THEN   -- internal data memory
               mem_en <= '1';
            END IF;
            set_opcode(op_PLUSST2);
         END IF;
      END IF;

      WHEN op_PLUSST2 =>
      IF  with_PLUSST  THEN
         pop_stack;
         r_in.tos <= r.tos;
         add_x <= mem_rdata;
         add_y <= r.nos;
         cin <= '0';
         mem_addr <= r.tos(mem_addr'range);
         mem_wdata <= sum;
         mem_wr <= '1';
         IF  ext_RAM  THEN
            ext_en <= '1';
            add_x <= r.data;
         ELSIF  dcache  THEN   -- internal data memory
            mem_en <= '1';
         END IF;
         r_in.status(s_c) <= add_carry;
         r_in.status(s_ovfl) <= add_ovfl;
      END IF;

-- ---------------------------------------------------------------------
-- internal registers
-- ---------------------------------------------------------------------

      WHEN op_STSET  =>
         pop_stack;
         IF  r.tos(r.tos'high) = '1'  THEN
            -- reset bits
            r_in.status(s_c)    <= r.status(s_c)    AND r.tos(s_c);
            r_in.status(s_ovfl) <= r.status(s_ovfl) AND r.tos(s_ovfl);
            r_in.status(s_ie)   <= r.status(s_ie)   AND r.tos(s_ie);
            r_in.status(s_iis)  <= r.status(s_iis)  AND r.tos(s_iis);
         ELSE
            -- set bits
            r_in.status(s_c)    <= r.status(s_c)    OR r.tos(s_c);
            r_in.status(s_ovfl) <= r.status(s_ovfl) OR r.tos(s_ovfl);
            r_in.status(s_ie)   <= r.status(s_ie)   OR r.tos(s_ie);
            r_in.status(s_iis)  <= r.status(s_iis)  OR r.tos(s_iis);
         END IF;

      WHEN op_DIPUSH =>
         push_rstack;
         r_in.tor <= resize(r.status, data_width);
         r_in.status(s_iis) <= '1';

      WHEN op_DIPOP =>
         pop_rstack;
         r_in.status(s_iis) <= r.tor(s_iis);

-- ---------------------------------------------------------------------
-- program memory access
-- ---------------------------------------------------------------------

      WHEN op_PRG2NOS =>
         r_in.nos <= resize(prog_rdata, data_width);

      WHEN op_PLOAD  =>
         push_stack;
         r_in.tos <= r.tos;
         pread <= '1';
         paddr <= r.tos(paddr'range);
         set_opcode(op_PRG2NOS);
         r_in.pc <= r.pc;

      WHEN op_PSTORE =>
         pop_stack;
         r_in.tos <= r.tos;
         pwrite <= '1';
         paddr <= r.tos(paddr'range);
         set_opcode(op_NOOP);
         r_in.pc <= r.pc;

-- ---------------------------------------------------------------------
-- branches, call & exit
-- ---------------------------------------------------------------------

      WHEN op_BRANCH =>
         pop_stack;
         branch;

      WHEN op_QBRANCH =>
         pop_stack;
         IF  nos_zero = '1'  THEN
            branch;
         END IF;
         set_opcode(op_DROP);

      WHEN op_NEXT   =>
         pop_stack;
         IF  r.tor = 0  THEN
            pop_rstack;
         ELSE
            r_in.tor <= r.tor - 1;
            branch;
         END IF;

--   : (+loop  ( n -- ) ( R: i -- i' )
--      1- dup 0< swap  r> r> rot - rot carry? xor and >r BRANCH ;
      WHEN op_PLOOP =>
         IF  with_PLOOP  THEN
            pop_stack;
            temp := r.tos - 1;
            add_x <= r.tor;
            add_y <= NOT temp;
            cin <= '1';
            r_in.tor <= sum;
            IF  (temp(signbit) XOR add_carry) = '0'  THEN
               r_in.tor <= (OTHERS => '0');
            END IF;
         END IF;

      WHEN op_CALL   =>
         pop_stack;
         push_rstack;
         r_in.tor <= resize(r.pc, r.tor'length);
         branch;

      WHEN op_EXIT   =>
         paddr <= r.tor(paddr'range);
         pop_rstack;

      WHEN op_IRET   =>
         paddr <= r.tor(paddr'range);
         pop_rstack;
         pop_stack;
         r_in.status <= r.tos(r.status'range);
         r_in.status(s_ie) <= r.status(s_ie); -- this way interrupts can be permanently disabled by an interrupt
         IF  r.tos(s_lit) = '1'  THEN
            r_in.status(s_neg)  <= r.tos(s_neg);
            r_in.status(s_zero) <= r.tos(s_zero);
         END IF;

      WHEN op_PAUSE => call_trap;

      WHEN op_BREAK => call_trap;

      WHEN op_DOES  => call_trap;

      WHEN op_DATA  => call_trap;

      WHEN op_NZEXIT =>
      IF  with_NZEXIT  THEN
         pop_stack;
         IF  tos_zero = '0'  THEN
            paddr <= r.tor(paddr'range);
            pop_rstack;
         END IF;
      END IF;

-- ---------------------------------------------------------------------
-- unary arithmetic
-- ---------------------------------------------------------------------

      WHEN op_NOT   => r_in.tos <= NOT r.tos;

      WHEN op_ZEQU  => r_in.tos <= (OTHERS => tos_zero);

      WHEN op_ZLESS => r_in.tos <= (OTHERS => r.tos(r.tos'high));

      WHEN op_SRC   =>
      IF  NOT WITH_MULT  THEN
      -- shift right through carry
         r_in.tos <= r.status(s_c) & r.tos(r.tos'high DOWNTO 1);
         r_in.status(s_c) <= r.tos(0);
      END IF;

      WHEN op_SLC   =>
      IF  NOT WITH_MULT  THEN
      -- shift left through carry
         r_in.tos <= r.tos(r.tos'high-1 DOWNTO 0) & r.status(s_c);
         r_in.status(s_c) <= r.tos(r.tos'high);
      END IF;

      WHEN op_MSHIFT =>
      IF  WITH_MULT  THEN
         multiplicand <= '0' & r.nos;
         multiplier   <= '0' & tos_power2;
         IF  r.tos(r.tos'high) = '0'  THEN
            -- shift left
            r_in.tos <= product(data_width*2-1 DOWNTO data_width);
            r_in.nos <= product(r.nos'range);
            r_in.status(s_c) <= product(data_width);
            IF  r.tos = data_width  THEN
               r_in.tos <= r.nos;
               r_in.nos <= (OTHERS => '0');
               r_in.status(s_c) <= r.nos(0);
            END IF;
         ELSE
            -- shift right
            r_in.tos <= product(r.tos'range);
            r_in.nos <= product(data_width*2-1 DOWNTO data_width);
            r_in.status(s_c) <= product(data_width-1);
            IF  signed(r.tos) = -data_width  THEN
               r_in.tos <= r.nos;
               r_in.nos <= (OTHERS => '0');
               r_in.status(s_c) <= r.nos(r.nos'high);
            END IF;
         END IF;
      -- without_mult: code for shift
      ELSIF  tos_zero = '1'  THEN
         pop_stack;
         r_in.tos <= r.nos;
         r_in.status(s_c) <= '0';
      ELSE -- r.tos /= 0
         IF  r.tos(r.tos'high) = '0'  THEN
            -- shift left
            IF  r.tos = 1  THEN
               pop_stack;
               r_in.tos <= r.nos(r.nos'high-1 DOWNTO 0) & '0';
               r_in.status(s_c) <= r.nos(r.nos'high);
            ELSE
               r_in.nos <= r.nos(r.nos'high-1 DOWNTO 0) & '0';
               r_in.tos <= r.tos - 1;
               paddr <= prog_addr;
            END IF;
         ELSE
            -- shift right
            IF  signed(r.tos) = -1  THEN
               pop_stack;
               r_in.tos <= '0' & r.nos(r.nos'high DOWNTO 1);
               r_in.status(s_c) <= r.nos(0);
            ELSE
               r_in.nos <= '0' & r.nos(r.nos'high DOWNTO 1);
               r_in.tos <= r.tos + 1;
               paddr <= prog_addr;
            END IF;
         END IF;
      END IF;

      WHEN op_MASHIFT =>
      IF  WITH_MULT  THEN
         multiplicand <= r.nos(r.nos'high) & r.nos;
         multiplier   <= '0' & tos_power2;
         IF  r.tos(r.tos'high) = '0'  THEN
         -- shift left
            r_in.tos <= product(data_width*2-1 DOWNTO data_width);
            r_in.nos <= product(r.nos'range);
            r_in.status(s_c) <= product(data_width);
            IF  r.tos = data_width  THEN
               r_in.tos <= r.nos;
               r_in.nos <= (OTHERS => '0');
               r_in.status(s_c) <= r.nos(0);
            END IF;
         ELSE -- shift right
            r_in.tos <= product(r.tos'range);
            r_in.nos <= product(data_width*2-1 DOWNTO data_width);
            r_in.status(s_c) <= product(data_width-1);
            IF  signed(r.tos) = -data_width  THEN
               r_in.tos <= r.nos;
               r_in.nos <= (OTHERS => '0');
               r_in.status(s_c) <= r.nos(r.nos'high);
            END IF;
         END IF;
      -- without_mult: code for ashift
      ELSIF  tos_zero = '1'  THEN
         pop_stack;
         r_in.tos <= r.nos;
         r_in.status(s_c) <= '0';
      ELSE -- r.tos /= 0
         IF  r.tos(r.tos'high) = '0'  THEN
            -- shift left
            IF  r.tos = 1  THEN
               pop_stack;
               r_in.tos <= r.nos(r.nos'high-1 DOWNTO 0) & '0';
               r_in.status(s_c) <= r.nos(r.nos'high);
            ELSE
               r_in.nos <= r.nos(r.nos'high-1 DOWNTO 0) & '0';
               r_in.tos <= r.tos - 1;
               paddr <= prog_addr;
            END IF;
         ELSE
            -- shift right
            IF  signed(r.tos) = -1  THEN
               pop_stack;
               r_in.tos <= r.nos(r.nos'high) & r.nos(r.nos'high DOWNTO 1);
               r_in.status(s_c) <= r.nos(0);
            ELSE
               r_in.nos <= r.nos(r.nos'high) & r.nos(r.nos'high DOWNTO 1);
               r_in.tos <= r.tos + 1;
               paddr <= prog_addr;
            END IF;
         END IF;
      END IF;

-- ---------------------------------------------------------------------
-- binary arithmetic
-- ---------------------------------------------------------------------

      WHEN op_ADD  =>
         pop_stack;
         add_x <= r.tos;
         add_y <= r.nos;
         cin <= '0';
         r_in.tos <= sum;
         r_in.status(s_c) <= add_carry;
         r_in.status(s_ovfl) <= add_ovfl;

      WHEN op_ADC  =>
         pop_stack;
         add_x <= r.tos;
         add_y <= r.nos;
         cin <= r.status(s_c);
         r_in.tos <= sum;
         r_in.status(s_c) <= add_carry;
         r_in.status(s_ovfl) <= add_ovfl;

      WHEN op_SUB  =>
         pop_stack;
         add_x <= NOT r.tos;
         cin <= '1';
         add_y <= r.nos;
         r_in.tos <= sum;
         r_in.status(s_c) <= add_carry;
         r_in.status(s_ovfl) <= add_ovfl;

      WHEN op_SSUB =>
         pop_stack;
         add_x <= r.tos;
         add_y <= NOT r.nos;
         cin <= '1';
         r_in.tos <= sum;
         r_in.status(s_c) <= add_carry;
         r_in.status(s_ovfl) <= (add_carry XOR add_sign) AND NOT(ladd_x(r.tos'high) XOR ladd_y(r.tos'high)) AND NOT tos_zero;

      WHEN op_AND  =>
         pop_stack;
         r_in.tos <= r.tos AND r.nos;

      WHEN op_OR   =>
         pop_stack;
         r_in.tos <= r.tos OR  r.nos;

      WHEN op_XOR  =>
         pop_stack;
         r_in.tos <= r.tos XOR r.nos;

      WHEN op_ADDSAT =>
      IF  with_ADDSAT  THEN
         pop_stack;
         add_x <= r.tos;
         add_y <= r.nos;
         cin <= '0';
         r_in.status(s_c) <= add_carry;
         r_in.status(s_ovfl) <= add_ovfl;
         IF  add_ovfl = '1'  THEN
            r_in.tos <= NOT sum(sum'high) & slice(sum(sum'high), data_width-1);
         ELSE
            r_in.tos <= sum;
         END IF;
      END IF;

      WHEN op_PADD =>
      IF  with_PADD THEN
         push_stack;
         add_x <= r.tos;
         add_y <= r.nos;
         cin <= '0';
         r_in.tos <= sum;
         r_in.status(s_c) <= add_carry;
         r_in.status(s_ovfl) <= add_ovfl;
      END IF;

      WHEN op_PADC =>
      IF  with_PADC  THEN
         push_stack;
         add_x <= r.tos;
         add_y <= r.nos;
         cin <= r.status(s_c);
         r_in.tos <= sum;
         r_in.status(s_c) <= add_carry;
         r_in.status(s_ovfl) <= add_ovfl;
      END IF;

      WHEN op_PSUB =>
      IF  with_PSUB  THEN
         push_stack;
         add_x <= NOT r.tos;
         add_y <= r.nos;
         r_in.tos <= sum;
         cin <= '1';
         r_in.status(s_c) <= add_carry;
         r_in.status(s_ovfl) <= add_ovfl;
      END IF;

      WHEN op_PSSUB=>
      IF  with_PSUB  THEN
         push_stack;
         add_x <= r.tos;
         add_y <= NOT r.nos;
         cin <= '1';
         r_in.tos <= sum;
         r_in.status(s_c) <= add_carry;
         r_in.status(s_ovfl) <= (add_carry XOR add_sign) AND NOT(ladd_x(r.tos'high) XOR ladd_y(r.tos'high)) AND NOT tos_zero;
      END IF;

      WHEN op_PAND =>
      IF  with_PAND  THEN
         push_stack;
         r_in.tos <= r.tos AND r.nos;
      END IF;

      WHEN op_POR  =>
      IF  with_POR  THEN
         push_stack;
         r_in.tos <= r.tos OR  r.nos;
      END IF;

      WHEN op_PXOR =>
      IF  with_PXOR  THEN
         push_stack;
         r_in.tos <= r.tos XOR r.nos;
      END IF;

-- ---------------------------------------------------------------------
-- complex arithmetic
-- ---------------------------------------------------------------------

      WHEN op_UMULT =>
      IF  WITH_MULT  THEN
      -- unsigned multiply, step instruction when mult-hardware not available
         multiplicand <= '0' & r.nos;
         multiplier   <= '0' & r.tos;
         r_in.tos <= product(data_width*2-1 DOWNTO data_width);
         r_in.nos <= product(r.nos'range);
      ELSE                                 -- multiply step instruction
         add_x <= r.tos(r.tos'high-1 DOWNTO 0) & '0';
         add_y <= ds_rdata;
         IF  add_carry = '1' AND r.nos(r.nos'high) = '1'  THEN
            r_in.nos <= (r.nos(r.nos'high-1 DOWNTO 0) & r.tos(r.tos'high)) + 1;
         ELSE
            r_in.nos <=  r.nos(r.nos'high-1 DOWNTO 0) & r.tos(r.tos'high);
         END IF;
         IF  r.nos(r.nos'high) = '0'  THEN
            r_in.tos <= r.tos(r.tos'high-1 DOWNTO 0) & '0';
         ELSE
            r_in.tos <= sum;
         END IF;
      END IF;

      WHEN op_MULTL =>
      -- half precision final multiply step setting overflow
         pop_stack;
         IF    (tos_zero = '1' AND r.nos(r.nos'high) = '0')
            OR (signed(r.tos) = -1 AND r.nos(r.nos'high) = '1')
         THEN
            r_in.status(s_ovfl) <= '0';
         ELSE
            r_in.status(s_ovfl) <= '1';
         END IF;

      WHEN op_SMULT =>
      IF  WITH_MULT  THEN
      -- signed multiply when mult-hardware available
         multiplicand <= r.nos(r.nos'high) & r.nos;
         multiplier <= r.tos(r.tos'high) & r.tos;
         r_in.tos <= product(data_width*2-1 DOWNTO data_width);
         r_in.nos <= product(r.nos'range);
      END IF;

      WHEN op_DIV   =>
      -- signed and unsigned division step, once for every bit
         ladd_x <= r.status(s_c) & r.tos;
         ladd_y <= NOT('0' & ds_rdata);
         cin <= '1';  -- sum = remainder - divisor
         r_in.nos <= r.nos(r.nos'high-1 DOWNTO 0) & div_carry;
         IF  div_carry = '1'  THEN
            r_in.tos <= sum(r.tos'high-1 DOWNTO 0) & r.nos(r.nos'high);
            r_in.status(s_c) <= sum(r.tos'high);
         ELSE
            r_in.tos <= r.tos(r.tos'high-1 DOWNTO 0) & r.nos(r.nos'high);
            r_in.status(s_c) <= r.tos(r.tos'high);
         END IF;
         r_in.status(s_ovfl) <= NOT (div_carry XOR div_sign) OR r.status(s_ovfl);

      WHEN op_UDIVS =>
      -- first unsigned division step
         r_in.tos <= r.nos;    -- dividend_high -> tos
         r_in.nos <= ds_rdata; -- dividend_low -> nos
         ds_wdata <= r.tos;    -- divisor -> ds_rdata
         ds_wr <= '1';
         r_in.status(s_ovfl) <= '0';
         r_in.status(s_c) <= '0';
         IF  tos_zero = '1'  THEN
            IF  ds_rdata = 0 AND nos_zero = '1'  THEN  -- special case: 0 / 0 = zero, no overflow
               ds_wdata(0) <= '1';
            ELSE
               r_in.status(s_ovfl) <= '1';
            END IF;
         END IF;

      WHEN op_UDIVL =>
      -- last unsigned division step
         pop_stack;
         ladd_x <= r.status(s_c) & r.tos;
         ladd_y <= NOT('0' & ds_rdata);
         cin <= '1';  -- sum = remainder - divisor
         IF  div_carry = '1'  THEN
            r_in.nos <= sum;
         ELSE
            r_in.nos <= r.tos;
         END IF;
         r_in.tos <= r.nos(r.nos'high-1 DOWNTO 0) & div_carry;
         r_in.status(s_ovfl) <= r.nos(r.nos'high) OR r.status(s_ovfl);

      WHEN op_SDIVS => IF  with_SDIV  THEN
      -- first signed division step with signed divisor
      -- ( dividend.low dividend.high divisor -- divisor dividend.low dividend.high )
      -- dup >r   abs >r   dup 0< IF  r@ +  THEN  r> um/mod    \ 'r@ +' is wrong if the sum produces a div_sign bit
      -- r@ 0< IF  negate over IF  swap r@ + swap 1-  THEN THEN  rdrop
         add_x <= unsigned(abs(signed(r.tos)));
         add_y <= r.nos;
         cin <= '0';
         IF  r.nos(r.nos'high) = '0'  THEN          -- positive dividend?
            r_in.tos <= r.nos;                      -- dividend_high -> TOS
         ELSE
            r_in.tos <= sum;                        -- dividend_high with pre-distortion on negative
         END IF;                                    --    divisor to produce a sign bit in the result
         r_in.nos <= ds_rdata;                      -- dividend_low -> NOS
         ds_wdata <= unsigned(abs(signed(r.tos)));  -- |divisor| -> ds_wdata
         ds_wr <= '1';
         r_in.status(s_c) <= '0';
         r_in.status(s_ovfl) <= '0';
         r_in.status(s_div) <= r.tos(r.tos'high);
         r_in.status(s_den) <= r.nos(r.nos'high);
      END IF;

      WHEN op_SDIVL =>
      IF  with_SDIV  THEN
      -- last signed division step with signed divisor
      -- dup >r   abs >r   dup 0< IF  r@ +  THEN  r> um/mod
      -- r@ 0< IF  negate over IF  swap r@ + swap 1-  THEN THEN  rdrop
      -- IN  TOS: remainder NOS: quotient 3rd: abs(divisor)
      -- OUT TOS: quotient  NOS: remainder
         pop_stack;
         ladd_x <= r.status(s_c) & r.tos;
         ladd_y <= NOT('0' & ds_rdata);
         cin <= '1';                                -- 2's complement's '+1'
         IF  div_carry = '1'  THEN
            temp := sum;                            -- sum = remainder - divisor
         ELSE
            temp := r.tos;                          -- dividend_high, now remainder
         END IF;
         r_in.nos <= temp;
         r_in.tos <= r.nos(r.nos'high-1 DOWNTO 0) & div_carry;
         IF  r.status(s_div) = '1'  THEN
            r_in.tos <= NOT (r.nos(r.nos'high-1 DOWNTO 0) & div_carry) + 1; -- 2s complement
            IF  temp /= 0  THEN
               r_in.tos <= NOT (r.nos(r.tos'high-1 DOWNTO 0) & div_carry);
               r_in.nos <= temp - ds_rdata;
            END IF;
         END IF;
         -- evaluate overflow status flag
         IF    ((r_in.tos(r.tos'high) XOR r.status(s_div) XOR r.status(s_den)) = '1'
                AND (tos_zero = '0' OR nos_zero = '0')
               )
            OR (r.status(s_den) = '1' AND tos_zero = '1' AND nos_zero = '1')
            OR (r.nos(r.nos'high) = '1')
            OR (r.status(s_ovfl) = '1')
         THEN
            r_in.status(s_ovfl) <= '1';
         END IF;
      END IF;

-- : sqrt    ( u -- urem uroot )
--    0 tuck   data_width 2/
--    ?FOR  d2* d2* swap >r   swap 2* 2* 1+
--          2dup - 0< 0= IF  tuck - swap 2 +  THEN
--          u2/ swap r> swap
--    NEXT  nip swap
-- ;
-- op_SQRTS       Op: sqrts   ( complex )        don't
--             Macro: uroot   ( u -- rem root )   ?comp 0 lit, T tuck H data_width 2/ 0 DO T sqrts H LOOP T nip swap H ;
      WHEN op_SQRTS =>
      IF  with_SQRT  THEN
      -- square root 2bits step
      -- root accumulated in ds_wdata
      -- square decimated in NOS
      -- remainder in TOS
         add_x <= r.tos(data_width-3 DOWNTO 0) & r.nos(data_width-1 DOWNTO data_width-2);
         add_y <= NOT (ds_rdata(data_width-3 DOWNTO 0) & "01"); -- 2s complement subtract
         cin <= '1';
         IF  sum(data_width-1) = '1'  THEN
            r_in.tos <= r.tos(data_width-3 DOWNTO 0) & r.nos(data_width-1 DOWNTO data_width-2);
            ds_wdata <= ds_rdata(data_width-2 DOWNTO 0) & '0';
         ELSE
            r_in.tos <= sum;
            ds_wdata <= ds_rdata(data_width-2 DOWNTO 0) & '1';
         END IF;
         r_in.nos <= r.nos(data_width-3 DOWNTO 0) & "00";
         ds_wr <= core_en;
      END IF;

      WHEN op_SQRT0 =>
      IF  with_SQRT AND to_unsigned(data_width, 8)(0) = '1' THEN
      -- square root step for the first step of odd data_width designs
      -- root accumulated in ds_wdata
      -- square decimated in NOS
      -- remainder in TOS
         add_x <= r.tos(data_width-2 DOWNTO 0) & r.nos(data_width-1);
         add_y <= NOT (ds_rdata(data_width-2 DOWNTO 0) & "1"); -- 2s complement subtract
         cin <= '1';
         IF  sum(data_width-1) = '1'  THEN
            r_in.tos <= r.tos(data_width-2 DOWNTO 0) & r.nos(data_width-1);
            ds_wdata <= ds_rdata(data_width-2 DOWNTO 0) & '0';
         ELSE
            r_in.tos <= sum;
            ds_wdata <= ds_rdata(data_width-2 DOWNTO 0) & '1';
         END IF;
         r_in.nos <= r.nos(data_width-2 DOWNTO 0) & '0';
         ds_wr <= core_en;
      END IF;

-- ---------------------------------------------------------------------
-- status and user defined flags
-- ---------------------------------------------------------------------

      WHEN op_OVFLQ  =>
         push_stack;
         r_in.tos <= (OTHERS => r.status(s_ovfl));

      WHEN op_CARRYQ =>
         push_stack;
         r_in.tos <= (OTHERS => r.status(s_c));

      WHEN op_TIMEQ =>
         add_x <= r.tos;
         add_y <= NOT time;
         cin <= '0';
         r_in.tos <= (OTHERS => add_sign);

      WHEN op_LESS  =>
      -- the primitive for <
         pop_stack;
         add_x <= NOT r.tos;
         add_y <= r.nos;
         r_in.tos <= sum;
         cin <= '1';
         r_in.status(s_c) <= add_carry;
         r_in.status(s_ovfl) <= add_ovfl;
         r_in.tos <= (OTHERS => (add_ovfl XOR sum(sum'high)));

      WHEN op_FLAGQ  =>
      IF  with_FLAGQ  THEN
         IF  (flags AND r.tos(flag_width-1 DOWNTO 0)) = 0  THEN
            r_in.tos <= (OTHERS => '0');
         ELSE
            r_in.tos <= (OTHERS => '1');
         END IF;
      END IF;

-- ---------------------------------------------------------------------
-- floating point
-- ---------------------------------------------------------------------

-- : round   ( dm -- m' )
--    over 0< 0= IF  nip  EXIT THEN   \ < 0.5
--    swap 2*    IF  1+   EXIT THEN   \ > 0.5
--    dup 1 and +                     \ = 0.5, round to even
-- ;
      WHEN op_FMULT =>
      IF  WITH_MULT AND (WITH_fmult OR WITH_FLOAT)  THEN
      -- fractional signed multiply with standard rounding towards even for .5
         pop_stack;
         multiplicand <= r.nos(r.nos'high) & r.nos;
         multiplier <= '0' & r.tos;
         r_in.tos <= product(data_width*2-1 DOWNTO data_width);
         IF  product(data_width-1) = '1' AND (product(data_width-2 DOWNTO 0) /= 0  OR  product(data_width) = '1')  THEN  -- round 0.5 to even
            r_in.tos <= product(data_width*2-1 DOWNTO data_width) + 1;
         END IF;
      END IF;

-- : log2 ( frac -- log2[frac] )   \ Bit-wise Logarithm (K.Schleisiek/U.Lange)
--    #delta_width 0 ?DO  2*  LOOP
--    0   data_width 0
--    DO  2* >r   dup um*
--       dup 0< IF  r> 1+ >r  ELSE  d2*  THEN     \ correction of 'B(i)' and 'A(i)'
--       round   r>                               \ A(i+1):=A(i)*2^(B(i)-1)
--    LOOP  nip
-- ;
-- op_LOGS        Op: log2s   ( u  0  -- u' ld ) don't
--             Macro: ulog    ( u -- ld )        ?comp 0 lit, data_width 0 DO T log2s H LOOP T nip H ;
      WHEN op_LOGS  =>
      IF  WITH_MULT AND (with_LOGS OR WITH_FLOAT)  THEN
      -- log2 bit step
         multiplicand <= '0' & r.nos;
         multiplier   <= '0' & r.nos;              -- nos ** 2
         IF  product(data_width*2-1) = '0'  THEN   -- then shift nos left
            temp := product(data_width*2-2 DOWNTO data_width-1);
            r_in.nos <= temp;
            IF  product(data_width-2) = '1'  THEN  -- >= 0.5?
               IF  product(data_width-3 DOWNTO 0) /= 0 OR product(data_width-1) = '1'  THEN
                  r_in.nos <= temp + 1;            -- round towards even
               END IF;
            END IF;
         ELSE -- product(data_width*2-1) = '1'     -- don't shift nos
            temp := product(data_width*2-1 DOWNTO data_width);
            r_in.nos <= temp;
            IF  product(data_width-1) = '1'  THEN  -- >= 0.5?
               IF  product(data_width-2 DOWNTO 0) /= 0 OR product(data_width) = '1'  THEN
                  r_in.nos <= temp + 1;            -- round towards even
               END IF;
            END IF;
         END IF;
         r_in.tos <= r.tos(data_width-2 DOWNTO 0) & product(data_width*2-1);
      END IF;

-- : normalized?  ( m -- f )   dup #signbit and swap #signbit u2/ and 2* xor ;
-- : normalize    ( m e -- m' e' )
--    over normalized? ?EXIT
--    over 0= IF  drop   #exp_min  EXIT THEN
--    BEGIN  dup #exp_min = ?EXIT
--           1 - swap 2* swap  over normalized?
--    UNTIL
-- ;
-- op_NORM is an interruptible, multi-cycle instruction. The number of cycles depends on the mantissa argument
      WHEN op_NORM  =>
      IF  WITH_FLOAT  THEN
      -- normalize a 2s-complement matissa (NOS)/exponent(TOS) number pair on the stack
         IF  nos_zero = '1'  THEN
            r_in.tos <= exp_min; -- minimal exponent
         ELSIF  r.nos(data_width-1) /= r.nos(data_width-2) OR r.tos = exp_min  THEN     -- already properly formatted or minimum exponent reached
            NULL;
         ELSE
            r_in.tos <= r.tos - 1;
            r_in.nos <= r.nos(r.nos'high-1 DOWNTO 0) & '0';
            IF  r.nos(data_width-1) /= r.nos(data_width-3)
               OR (r.tos - 1) = exp_min  THEN -- finished?
               NULL;
            ELSE
               paddr <= prog_addr; -- repeat instruction
            END IF;
         END IF;
      END IF;

-- : >float  ( m e -- r )   overflow off   underflow off
--    normalize   swap #man_mask and swap
--    2dup #exp_min =   swap #fzero_neg =   and >r
--    over #fzero_pos =   r> or
--    IF  drop  #exp_mask not and  EXIT THEN             \ leave floating +/-zero. For +zero irrespective of exponent
--    dup #man_mask 2/ and
--    dup 0< IF  #man_mask 2/ xor  THEN                     \ exponent over/underflow?
--    IF  0< IF  underflow on   0< IF  #fzero_neg  EXIT THEN  #fzero_pos  EXIT THEN
--        overflow on   0< IF  #fmax_neg  EXIT THEN  #fmax_pos  EXIT
--    THEN
--    dup #exp_min = IF  drop #man_mask and  EXIT THEN      \ smallest exponent => denormalized
--    #exp_mask and   #exp_sign xor   swap                  \ flip sign of exponent => bias = #exp_min
--    dup 2* [ #signbit not #exp_mask not and ] Literal and
--    swap 0< IF  #signbit or  THEN  or
-- ;
      WHEN op_FLOAT =>
      IF  WITH_FLOAT  THEN
      -- convert 2s-complement mantissa(NOS)/exponent(TOS) pair to floating point number
         r_in.status(s_ovfl) <= '0';
         r_in.status(s_unfl) <= '0';
         pop_stack;
         IF  r.nos = zero_pos OR (r.nos = zero_neg AND r.tos = exp_min)  THEN
            r_in.tos <= r.nos(data_width-1 DOWNTO exp_width) & slice('0', exp_width);             -- leave floating +/-zero. For +zero irrespective of exponent
         -- exponent within range?
         ELSIF  signed(r.tos(data_width-1 DOWNTO exp_width-1)) = -1
               OR r.tos(data_width-1 DOWNTO exp_width-1) = 0
            THEN
            IF  r.tos = exp_min   THEN                                                            -- minimum exponent?
               r_in.tos <= r.nos(data_width-1 DOWNTO exp_width) & slice('0', exp_width);          -- denormalized number
            ELSE
               r_in.tos <= r.nos(data_width-1) & r.nos(data_width-3 DOWNTO exp_width-1) & fexp;   -- normalized number
            END IF;
         -- exponent out of range
         ELSIF  r.tos(data_width-1) = '0'  THEN  -- positiv exponent?
            r_in.status(s_ovfl) <= '1';
            IF  r.nos(data_width-1) = '0'  THEN  -- positiv mantissa?
               r_in.tos <= fmax_pos;
            ELSE
               r_in.tos <= fmax_neg;
            END IF;
         ELSE                                    -- negative exponent
            r_in.status(s_unfl) <= '1';
            IF  r.nos(data_width-1) = '0'  THEN  -- positiv mantissa?
               r_in.tos <= zero_pos;
            ELSE
               r_in.tos <= zero_neg;
            END IF;
         END IF;
      END IF;

-- : float>  ( r -- m e )
--    dup #exp_mask and   ?dup 0= IF  #exp_min  EXIT THEN                                \ de-normalized
--    dup #exp_sign and IF  #exp_mask 2/ and  ELSE  #exp_mask 2/ not or  THEN  swap      \ flip sign and extend
--    dup 0< IF  #exp_mask 2/ or  2/ [ #signbit #exp_sign or u2/ not     ] Literal and   \ add 0.5 for better rounding
--         ELSE  #man_mask   and u2/ [ #signbit #exp_sign or u2/         ] Literal or    \ add 0.5 for better rounding
--         THEN  swap
-- ;
      WHEN op_INTEG =>
      IF  WITH_FLOAT  THEN
      -- convert floating point number to 2s-complement mantissa(NOS)/exponent(TOS) pair
         push_stack;
         r_in.tos <= slice(fexp(fexp'high), data_width - exp_width) & fexp;
         IF  r.tos(exp_width-1 DOWNTO 0) = 0  THEN  -- de-normalized or zero
            r_in.nos <= r.tos;
         ELSIF  r.tos(data_width-1) = '0'  THEN
            r_in.nos <= "01" & r.tos(data_width-2 DOWNTO exp_width) & '1' & slice('0', exp_width-2);  -- add 0.5 for rounding
         ELSE
            r_in.nos <= "10" & r.tos(data_width-2 DOWNTO exp_width) & '0' & slice('1', exp_width-2);  -- add 0.5 for rounding
         END IF;
      END IF;

-- ---------------------------------------------------------------------
-- user trap instructions of otherwise unused opcodes
-- ---------------------------------------------------------------------

      WHEN OTHERS   =>
         IF  instruction(6 DOWNTO 5) = op_USR(6 DOWNTO 5)  THEN
            call_trap;
         END IF;

      END CASE;

   END IF;

END PROCESS uCore_control;

END rtl;
