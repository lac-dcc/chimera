-- ZPU
--
-- Copyright 2004-2008 oharboe - Øyvind Harboe - oyvind.harboe@zylin.com
-- Copyright 2010-2012 Alvaro Lopes - alvieboy@alvie.com
-- 
-- The FreeBSD license
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimer in the documentation and/or other materials
--    provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE ZPU PROJECT ``AS IS'' AND ANY
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-- ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
-- INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
-- STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
-- The views and conclusions contained in the software and documentation
-- are those of the authors and should not be interpreted as representing
-- official policies, either expressed or implied, of the ZPU Project.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.wishbonepkg.all;

--library UNISIM;
--use UNISIM.vcomponents.all;

entity zpu_core_extreme_icache is
  port (
    wb_clk_i:       in std_logic;
    wb_rst_i:       in std_logic;

    -- Master wishbone interface

    wb_ack_i:       in std_logic;
    wb_dat_i:       in std_logic_vector(wordSize-1 downto 0);
    wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    wb_adr_o:       out std_logic_vector(maxAddrBitIncIO downto 0);
    wb_cyc_o:       out std_logic;
    wb_stb_o:       out std_logic;
    wb_sel_o:       out std_logic_vector(3 downto 0);
    wb_we_o:        out std_logic;

    wb_inta_i:      in std_logic;
    poppc_inst:     out std_logic;
    break:          out std_logic;

    -- STACK

    stack_a_read:         in std_logic_vector(wordSize-1 downto 0);
    stack_b_read:         in std_logic_vector(wordSize-1 downto 0);
    stack_a_write:        out std_logic_vector(wordSize-1 downto 0);
    stack_b_write:        out std_logic_vector(wordSize-1 downto 0);
    stack_a_writeenable:  out std_logic_vector(3 downto 0);
    stack_a_enable:       out std_logic;
    stack_b_writeenable:  out std_logic_vector(3 downto 0);
    stack_b_enable:       out std_logic;
    stack_a_addr:         out std_logic_vector(stackSize_bits-1 downto 2);
    stack_b_addr:         out std_logic_vector(stackSize_bits-1 downto 2);
    stack_clk:            out std_logic;

    -- ROM wb interface

    rom_wb_ack_i:       in std_logic;
    rom_wb_dat_i:       in std_logic_vector(wordSize-1 downto 0);
    rom_wb_adr_o:       out std_logic_vector(maxAddrBit downto 0);
    rom_wb_cyc_o:       out std_logic;
    rom_wb_stb_o:       out std_logic;
    rom_wb_cti_o:       out std_logic_vector(2 downto 0);
    rom_wb_stall_i:     in std_logic;

    cache_flush:        in std_logic;
    memory_enable:      in std_logic;
    -- Debug interface

    dbg_out:            out zpu_dbg_out_type;
    dbg_in:             in zpu_dbg_in_type
  );
end zpu_core_extreme_icache;

architecture behave of zpu_core_extreme_icache is

component lshifter is
  port (
    clk: in std_logic;
    rst: in std_logic;
    enable:  in std_logic;
    done: out std_logic;
    inputA:  in std_logic_vector(31 downto 0);
    inputB: in std_logic_vector(31 downto 0);
    output: out std_logic_vector(63 downto 0);
    multorshift: in std_logic
  );
end component;

component zpuino_icache is
  generic (
      ADDRESS_HIGH: integer := 26
  );
  port (
    wb_clk_i:       in std_logic;
    wb_rst_i:       in std_logic;

    valid:          out std_logic;
    data:           out std_logic_vector(wordSize-1 downto 0);
    address:        in std_logic_vector(maxAddrBit downto 0);
    strobe:         in std_logic;
    enable:         in std_logic;
    stall:          out std_logic;
    flush:          in std_logic;
    -- Master wishbone interface

    m_wb_ack_i:       in std_logic;
    m_wb_dat_i:       in std_logic_vector(wordSize-1 downto 0);
    m_wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    m_wb_adr_o:       out std_logic_vector(maxAddrBit downto 0);
    m_wb_cyc_o:       out std_logic;
    m_wb_stb_o:       out std_logic;
    m_wb_stall_i:     in std_logic;
    m_wb_we_o:        out std_logic
  );
end component;

component zpuino_lsu is
  port (
    wb_clk_i:       in std_logic;
    wb_rst_i:       in std_logic;

    wb_ack_i:       in std_logic;
    wb_dat_i:       in std_logic_vector(wordSize-1 downto 0);
    wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    wb_adr_o:       out std_logic_vector(maxAddrBitIncIO downto 2);
    wb_cyc_o:       out std_logic;
    wb_stb_o:       out std_logic;
    wb_sel_o:       out std_logic_vector(3 downto 0);
    wb_we_o:        out std_logic;


    -- Connection to cpu
    req:            in std_logic;
    we:             in std_logic;
    busy:           out std_logic;

    data_read:      out std_logic_vector(wordSize-1 downto 0);
    data_write:     in std_logic_vector(wordSize-1 downto 0);
    data_sel:       in std_logic_vector(3 downto 0);
    address:        in std_logic_vector(maxAddrBitIncIO downto 0)
  );
end component;


signal cache_valid:          std_logic;
signal cache_data:           std_logic_vector(wordSize-1 downto 0);
signal cache_address:        std_logic_vector(maxAddrBit downto 0);
signal cache_strobe:         std_logic;
signal cache_enable:         std_logic;
signal cache_stall:          std_logic;

signal lshifter_enable: std_logic;
signal lshifter_done: std_logic;
signal lshifter_input: std_logic_vector(31 downto 0);
signal lshifter_amount: std_logic_vector(31 downto 0);
signal lshifter_output: std_logic_vector(63 downto 0);
signal lshifter_multorshift: std_logic;

signal begin_inst:          std_logic;
signal trace_opcode:        std_logic_vector(7 downto 0);
signal trace_pc:            std_logic_vector(maxAddrBitIncIO downto 0);
signal trace_sp:            std_logic_vector(maxAddrBitIncIO downto minAddrBit);
signal trace_topOfStack:    std_logic_vector(wordSize-1 downto 0);
signal trace_topOfStackB:   std_logic_vector(wordSize-1 downto 0);

-- state machine.

type State_Type is
(
State_Execute,
State_LoadStack,
State_Loadb,
State_Loadh,
State_Resync2,
State_WaitSPB,
State_ResyncFromStoreStack,
State_Neqbranch,
State_Ashiftleft,
State_Mult,
State_MultF16
);

type DecodedOpcodeType is
(
Decoded_Nop,
Decoded_Idle,
Decoded_Im0,
Decoded_ImN,
Decoded_LoadSP,
Decoded_Dup,
Decoded_DupStackB,
Decoded_StoreSP,
Decoded_Pop,
Decoded_PopDown,
Decoded_AddSP,
Decoded_AddStackB,
Decoded_Shift,
Decoded_Emulate,
Decoded_Break,
Decoded_PushSP,
Decoded_PopPC,
Decoded_Add,
Decoded_Or,
Decoded_And,
Decoded_Load,
Decoded_Not,
Decoded_Flip,
Decoded_Store,
Decoded_PopSP,
Decoded_Interrupt,
Decoded_Neqbranch,
Decoded_Eq,
Decoded_Storeb,
Decoded_Storeh,
Decoded_Ulessthan,
Decoded_Lessthan,
Decoded_Ashiftleft,
Decoded_Ashiftright,
Decoded_Loadb,
Decoded_Loadh,
Decoded_Call,
Decoded_Mult,
Decoded_MultF16
);

constant spMaxBit: integer := stackSize_bits-1;
constant minimal_implementation: boolean := false;

subtype index is integer range 0 to 3;
signal tOpcode_sel : index;

function pc_to_cpuword(pc: unsigned) return unsigned is
  variable r: unsigned(wordSize-1 downto 0);
begin
  r := (others => DontCareValue);
  r(maxAddrBit downto 0) := pc;
  return r;
end pc_to_cpuword;

function pc_to_memaddr(pc: unsigned) return unsigned is
  variable r: unsigned(maxAddrBit downto 0);
begin
  r := (others => '0');
  r(maxAddrBit downto minAddrBit) := pc(maxAddrBit downto minAddrBit);
  return r;
end pc_to_memaddr;

-- Prefetch stage registers

type stackChangeType is (
  Stack_Same,
  Stack_Push,
  Stack_Pop,
  Stack_DualPop
);

type tosSourceType is
(
  Tos_Source_PC,
  Tos_Source_FetchPC,
  Tos_Source_Idim0,
  Tos_Source_IdimN,
  Tos_Source_StackB,
  Tos_Source_SP,
  Tos_Source_Add,
  Tos_Source_And,
  Tos_Source_Or,
  Tos_Source_Eq,
  Tos_Source_Not,
  Tos_Source_Flip,
  Tos_Source_LoadSP,
  Tos_Source_AddSP,
  Tos_Source_AddStackB,
  Tos_Source_Shift,
  Tos_Source_Ulessthan,
  Tos_Source_Lessthan,
  Tos_Source_LSU,
  Tos_Source_None
);

type decoderstate_type is (
  State_Run,
  State_Jump,
  State_Inject,
  State_InjectJump
);

type decoderegs_type is record

  valid:          std_logic;
  decodedOpcode:  DecodedOpcodeType;
  tosSource:      tosSourceType;
  opWillFreeze:   std_logic; -- '1' if we know in advance this opcode will freeze pipeline
  opcode:         std_logic_vector(OpCode_Size-1 downto 0);
  pc:             unsigned(maxAddrBit downto 0);
  fetchpc:        unsigned(maxAddrBit downto 0);
  pcint:          unsigned(maxAddrBit downto 0);
  idim:           std_logic;
  im:             std_logic;
  stackOperation: stackChangeType;
  spOffset:       unsigned(4 downto 0);
  im_emu:         std_logic;
  --emumode:        std_logic;
  break:          std_logic;
  state:          decoderstate_type;
end record;

type prefetchregs_type is record
  sp:             unsigned(spMaxBit downto 2);
  spnext:         unsigned(spMaxBit downto 2);
  valid:          std_logic;
  decodedOpcode:  DecodedOpcodeType;
  tosSource:      tosSourceType;
  opcode:         std_logic_vector(OpCode_Size-1 downto 0);
  pc:             unsigned(maxAddrBit downto 0);
  fetchpc:        unsigned(maxAddrBit downto 0);
  idim:           std_logic;
  break:          std_logic;
  load:           std_logic;
  opWillFreeze:   std_logic;
  recompute_sp:   std_logic;
end record;

type exuregs_type is record
  idim:       std_logic;
  break:      std_logic;
  inInterrupt:std_logic;
  tos:        unsigned(wordSize-1 downto 0);
  tos_save:   unsigned(wordSize-1 downto 0);
  nos_save:   unsigned(wordSize-1 downto 0);
  state:      State_Type;
  -- Wishbone control signals (registered)
  wb_cyc:     std_logic;
  wb_stb:     std_logic;
  wb_we:      std_logic;
end record;

-- Registers for each stage
signal exr:     exuregs_type;
signal prefr:   prefetchregs_type;
signal decr:    decoderegs_type;

signal pcnext:          unsigned(maxAddrBit downto 0);  -- Helper only. TODO: move into variable
signal sp_load:         unsigned(spMaxBit downto 2);    -- SP value to load, coming from EXU into PFU
signal decode_load_sp:  std_logic;                      -- Load SP signal from EXU to PFU
signal exu_busy:        std_logic;                      -- EXU busy ( stalls PFU )
signal pfu_busy:        std_logic;                      -- PFU busy ( stalls DFU )
signal decode_jump:     std_logic;                      -- Jump signal from EXU to DFU
signal jump_address:    unsigned(maxAddrBit downto 0);  -- Jump address from EXU to DFU
signal do_interrupt:    std_logic;                      -- Helper.


-- Sampled signals from the opcode. Left as signals
-- in order to simulate design.
signal sampledOpcode:         std_logic_vector(OpCode_Size-1 downto 0);
signal sampledDecodedOpcode:  DecodedOpcodeType;
signal sampledOpWillFreeze:   std_logic;
signal sampledStackOperation: stackChangeType;
signal sampledspOffset:       unsigned(4 downto 0);
signal sampledTosSource:      tosSourceType;

signal nos:                   unsigned(wordSize-1 downto 0); -- This is only a helper
signal wroteback_q:           std_logic; -- TODO: get rid of this here, move to EXU regs

-- Test debug signals

signal freeze_all: std_logic := '0';
signal single_step: std_logic := '0';
-- LSU
signal lsu_req:   std_logic;
signal lsu_we:    std_logic;
signal lsu_busy:  std_logic;
signal lsu_data_read:      std_logic_vector(wordSize-1 downto 0);
signal lsu_data_write:     std_logic_vector(wordSize-1 downto 0);
signal lsu_data_sel:       std_logic_vector(3 downto 0);
signal lsu_address:        std_logic_vector(maxAddrBitIncIO downto 0);

begin

  -- Debug interface

  dbg_out.pc <= std_logic_vector(prefr.pc);
  dbg_out.opcode <= prefr.opcode;
  --dbg_out.sp <= std_logic_vector(prefr.sp);
  dbg_out.brk <= exr.break;
  --dbg_out.stacka <= std_logic_vector(exr.tos);
  --dbg_out.stackb <= std_logic_vector(nos);
  dbg_out.idim <= prefr.idim;

  shl: lshifter
  port map (
    clk     => wb_clk_i,
    rst     => wb_rst_i,
    enable  => lshifter_enable,
    done    => lshifter_done,
    inputA   => lshifter_input,
    inputB  => lshifter_amount,
    output  => lshifter_output,
    multorshift => lshifter_multorshift
  );

  stack_clk <= wb_clk_i;

  -- synopsys translate_off

  traceFileGenerate:
   if Generate_Trace generate
      trace_file: trace
        port map (
          clk         => wb_clk_i,
          begin_inst  => begin_inst,
          pc          => trace_pc,
          opcode      => trace_opcode,
          sp          => trace_sp,
          memA        => trace_topOfStack,
          memB        => trace_topOfStackB,
          busy        => '0',--busy,
          intsp       => (others => 'U')
        );
  end generate;

  -- synopsys translate_on

  cache: zpuino_icache
  generic map (
    ADDRESS_HIGH => maxAddrBitBRAM
  )
  port map (
    wb_clk_i    => wb_clk_i,
    wb_rst_i    => wb_rst_i,

    valid       => cache_valid,
    data        => cache_data,
    address     => cache_address,
    strobe      => cache_strobe,
    stall       => cache_stall,
    enable      => cache_enable,
    flush       => cache_flush,
    -- Master wishbone interface

    m_wb_ack_i  => rom_wb_ack_i,
    m_wb_dat_i  => rom_wb_dat_i,
    m_wb_adr_o  => rom_wb_adr_o,
    m_wb_cyc_o  => rom_wb_cyc_o,
    m_wb_stb_o  => rom_wb_stb_o,
    m_wb_stall_i => rom_wb_stall_i
  );

  lsu: zpuino_lsu
  port map (
    wb_clk_i        => wb_clk_i,
    wb_rst_i        => wb_rst_i,

    wb_ack_i        => wb_ack_i,
    wb_dat_i        => wb_dat_i,
    wb_dat_o        => wb_dat_o,
    wb_adr_o        => wb_adr_o(maxAddrBitIncIO downto 2),
    wb_cyc_o        => wb_cyc_o,
    wb_stb_o        => wb_stb_o,
    wb_sel_o        => wb_sel_o,
    wb_we_o         => wb_we_o,
    req             => lsu_req,
    we              => lsu_we,
    busy            => lsu_busy,
    data_read       => lsu_data_read,
    data_write      => lsu_data_write,
    data_sel        => lsu_data_sel,
    address         => lsu_address
  );

  tOpcode_sel <= to_integer(decr.pcint(minAddrBit-1 downto 0));

  do_interrupt <= '1' when wb_inta_i='1'
    and exr.inInterrupt='0'
    else '0';

  decodeControl:
  process(cache_data, tOpcode_sel, sp_load, decr,
    do_interrupt, dbg_in.inject, dbg_in.opcode)
    variable tOpcode : std_logic_vector(OpCode_Size-1 downto 0);
    variable localspOffset: unsigned(4 downto 0);
  begin
    if dbg_in.inject='1' then
      tOpcode := dbg_in.opcode;
    else
      case (tOpcode_sel) is

            when 0 => tOpcode := std_logic_vector(cache_data(31 downto 24));

            when 1 => tOpcode := std_logic_vector(cache_data(23 downto 16));

            when 2 => tOpcode := std_logic_vector(cache_data(15 downto 8));

            when 3 => tOpcode := std_logic_vector(cache_data(7 downto 0));

            when others =>
              null;
       end case;
    end if;

    sampledOpcode <= tOpcode;
    sampledStackOperation <= Stack_Same;
    sampledTosSource <= Tos_Source_None;
    sampledOpWillFreeze <= '0';

    localspOffset(4):=not tOpcode(4);
    localspOffset(3 downto 0) := unsigned(tOpcode(3 downto 0));

    if do_interrupt='1' and decr.im='0' then
      sampledDecodedOpcode <= Decoded_Interrupt;
      sampledStackOperation <= Stack_Push;
      sampledTosSource <= Tos_Source_PC;
    else
    if (tOpcode(7 downto 7)=OpCode_Im) then
      if decr.im='0' then
        sampledStackOperation <= Stack_Push;
        sampledTosSource <= Tos_Source_Idim0;
        sampledDecodedOpcode<=Decoded_Im0;
      else
        sampledTosSource <= Tos_Source_IdimN;
        sampledDecodedOpcode<=Decoded_ImN;
      end if;
      
    elsif (tOpcode(7 downto 5)=OpCode_StoreSP) then

      sampledStackOperation <= Stack_Pop;
      sampledTosSource <= Tos_Source_StackB;
      if localspOffset=0 then
        sampledDecodedOpcode<=Decoded_Pop;
        sampledTosSource <= Tos_Source_StackB;
      elsif localspOffset=1 then
        sampledDecodedOpcode<=Decoded_PopDown;
        sampledTosSource <= Tos_Source_None;
      else
        sampledDecodedOpcode<=Decoded_StoreSP;
        sampledOpWillFreeze<='1';
        sampledTosSource <= Tos_Source_StackB;
      end if;
    elsif (tOpcode(7 downto 5)=OpCode_LoadSP) then

      sampledStackOperation <= Stack_Push;

      if localspOffset=0 then
        sampledDecodedOpcode<=Decoded_Dup;
      elsif localspOffset=1 then
        sampledDecodedOpcode<=Decoded_DupStackB;
        sampledTosSource <= Tos_Source_StackB;
      else
        sampledDecodedOpcode<=Decoded_LoadSP;
        sampledTosSource <= Tos_Source_LoadSP;
      end if;


    elsif (tOpcode(7 downto 5)=OpCode_Emulate) then

      -- Emulated instructions implemented in hardware
      if minimal_implementation then
        sampledDecodedOpcode<=Decoded_Emulate;
        sampledStackOperation<=Stack_Push; -- will push PC
        sampledTosSource <= Tos_Source_FetchPC;
      else

        if (tOpcode(5 downto 0)=OpCode_Loadb) then
          sampledStackOperation<=Stack_Same;
          sampledDecodedOpcode<=Decoded_Loadb;
          sampledTosSource <= Tos_Source_LSU;
        elsif (tOpcode(5 downto 0)=OpCode_Loadh) then
          sampledStackOperation<=Stack_Same;
          sampledDecodedOpcode<=Decoded_Loadh;
          sampledTosSource <= Tos_Source_LSU;
        elsif (tOpcode(5 downto 0)=OpCode_Neqbranch) then
          sampledStackOperation<=Stack_DualPop;
          sampledDecodedOpcode<=Decoded_Neqbranch;
          sampledOpWillFreeze <= '1';
        elsif (tOpcode(5 downto 0)=OpCode_Call) then
          sampledDecodedOpcode<=Decoded_Call;
          sampledStackOperation<=Stack_Same;
          sampledTosSource<=Tos_Source_FetchPC;

        elsif (tOpcode(5 downto 0)=OpCode_Eq) then
          sampledDecodedOpcode<=Decoded_Eq;
          sampledStackOperation<=Stack_Pop;
          sampledTosSource<=Tos_Source_Eq;
        elsif (tOpcode(5 downto 0)=OpCode_Ulessthan) then
          sampledDecodedOpcode<=Decoded_Ulessthan;
          sampledStackOperation<=Stack_Pop;
          sampledTosSource<=Tos_Source_Ulessthan;

        elsif (tOpcode(5 downto 0)=OpCode_Lessthan) then
          sampledDecodedOpcode<=Decoded_Lessthan;
          sampledStackOperation<=Stack_Pop;
          sampledTosSource<=Tos_Source_Lessthan;

        elsif (tOpcode(5 downto 0)=OpCode_StoreB) then
          sampledDecodedOpcode<=Decoded_StoreB;
          sampledStackOperation<=Stack_DualPop;
          sampledOpWillFreeze<='1';
        elsif (tOpcode(5 downto 0)=OpCode_StoreH) then
          sampledDecodedOpcode<=Decoded_StoreH;
          sampledStackOperation<=Stack_DualPop;
          sampledOpWillFreeze<='1';
        elsif (tOpcode(5 downto 0)=OpCode_Mult) then
          sampledDecodedOpcode<=Decoded_Mult;
          sampledStackOperation<=Stack_Pop;
          sampledOpWillFreeze<='1';
        elsif (tOpcode(5 downto 0)=OpCode_Ashiftleft) then
          sampledDecodedOpcode<=Decoded_Ashiftleft;
          sampledStackOperation<=Stack_Pop;
          sampledOpWillFreeze<='1';
        else
          sampledDecodedOpcode<=Decoded_Emulate;
          sampledStackOperation<=Stack_Push; -- will push PC
          sampledTosSource <= Tos_Source_FetchPC;
        end if;
      end if;
    elsif (tOpcode(7 downto 4)=OpCode_AddSP) then
      if localspOffset=0 then
        sampledDecodedOpcode<=Decoded_Shift;
        sampledTosSource <= Tos_Source_Shift;
      elsif localspOffset=1 then
        sampledDecodedOpcode<=Decoded_AddStackB;
        sampledTosSource <= Tos_Source_AddStackB;
      else
        sampledDecodedOpcode<=Decoded_AddSP;
        sampledTosSource <= Tos_Source_AddSP;
      end if;
    else
      case tOpcode(3 downto 0) is
        when OpCode_Break =>
          sampledDecodedOpcode<=Decoded_Break;
          sampledOpWillFreeze <= '1';
        when OpCode_PushSP =>
          sampledStackOperation <= Stack_Push;
          sampledDecodedOpcode<=Decoded_PushSP;
          sampledTosSource <= Tos_Source_SP;
        when OpCode_PopPC =>
          sampledStackOperation <= Stack_Pop;
          sampledDecodedOpcode<=Decoded_PopPC;
          sampledTosSource <= Tos_Source_StackB;
        when OpCode_Add =>
          sampledStackOperation <= Stack_Pop;
          sampledDecodedOpcode<=Decoded_Add;
          sampledTosSource <= Tos_Source_Add;
        when OpCode_Or =>
          sampledStackOperation <= Stack_Pop;
          sampledDecodedOpcode<=Decoded_Or;
          sampledTosSource <= Tos_Source_Or;
        when OpCode_And =>
          sampledStackOperation <= Stack_Pop;
          sampledDecodedOpcode<=Decoded_And;
          sampledTosSource <= Tos_Source_And;
        when OpCode_Load =>
          sampledDecodedOpcode<=Decoded_Load;
          --sampledOpWillFreeze<='1';
          sampledTosSource <= Tos_Source_LSU;
        when OpCode_Not =>
          sampledDecodedOpcode<=Decoded_Not;
          sampledTosSource <= Tos_Source_Not;
        when OpCode_Flip =>
          sampledDecodedOpcode<=Decoded_Flip;
          sampledTosSource <= Tos_Source_Flip;
        when OpCode_Store =>
          sampledStackOperation <= Stack_DualPop;
          sampledDecodedOpcode<=Decoded_Store;
          sampledOpWillFreeze<='1';
        when OpCode_PopSP =>
          sampledDecodedOpcode<=Decoded_PopSP;
          sampledOpWillFreeze<='1';
        when OpCode_NA4 =>
          if enable_fmul16 then
            sampledDecodedOpcode<=Decoded_MultF16;
            sampledStackOperation<=Stack_Pop;
            sampledOpWillFreeze<='1';
          else
            sampledDecodedOpcode<=Decoded_Nop;
          end if;
        when others =>
          sampledDecodedOpcode<=Decoded_Nop;
          

      end case;
    end if;

    end if;
    sampledspOffset <= localspOffset;

  end process;

  -- Decode/Fetch unit

  cache_enable <= not exu_busy;

  process(decr, jump_address, decode_jump, wb_clk_i, sp_load,
          sampledDecodedOpcode,sampledOpcode,decode_load_sp,
          exu_busy, pfu_busy,
          pcnext, cache_valid, wb_rst_i, sampledStackOperation, sampledspOffset,
          sampledTosSource, prefr.recompute_sp, sampledOpWillFreeze,
          dbg_in.flush, dbg_in.inject,dbg_in.injectmode,
          prefr.valid, prefr.break, cache_stall
          )
    variable w: decoderegs_type;
  begin

    w := decr;

    pcnext <= decr.fetchpc + 1;

    cache_address(maxAddrBit downto 0) <= std_logic_vector(decr.fetchpc(maxAddrBit downto 0));

    if wb_rst_i='1' then
      w.pc     := (others => '0');
      w.pcint  := (others => '0');
      w.valid  := '0';
      w.fetchpc := (others => '0');
      w.im:='0';
      w.im_emu:='0';
      w.state := State_Run;
      w.break := '0';
      cache_strobe <= DontCareValue;
    else
      cache_strobe <= '1';

      case decr.state is
        when State_Run =>

          if pfu_busy='0' then
            if dbg_in.injectmode='0' and decr.break='0' and cache_stall='0' then
              w.fetchpc := pcnext;
            end if;

            -- Jump request
            if decode_jump='1' then
              w.valid := '0';
              w.im := '0';
              w.break := '0'; -- Invalidate eventual break after branch instruction
              --rom_wb_cyc_o<='0';
              cache_strobe<='0';
              --if rom_wb_stall_i='0' then
              w.fetchpc := jump_address;
              --else
              w.state := State_Jump;
              --end if;
            else
              if dbg_in.injectmode='1' then --or decr.break='1' then
                -- At this point we ought to push a new op into the pipeline.
                -- Since we're entering inject mode, invalidate next operation,
                -- but save the current IM flag.
                w.im_emu := decr.im;
                w.valid := '0';
                --rom_wb_cti_o <= CTI_CYCLE_ENDOFBURST;
                --rom_wb_cyc_o <='0';
                cache_strobe <= '0';
                -- Wait until no work is to be done
                if prefr.valid='0' and decr.valid='0' and exu_busy='0' then
                  w.state := State_Inject;
                  w.im:='0';
                end if;

                if decr.break='0' then
                  w.pc := decr.pcint;
                end if;

              else
                if decr.break='1' then
                  w.valid := '0';
                else
                  --if exu_busy='0' then
                    w.valid := cache_valid;
                  --end if;
                end if;

                if cache_valid='1' then
                  --if exu_busy='0' then
                    w.im := sampledOpcode(7);
                  --end if;
                  if sampledDecodedOpcode=Decoded_Break then
                    w.break:='1';
                  end if;
                end if;

                if prefr.break='0' and cache_stall='0' then
                  w.pcint := decr.fetchpc;
                  w.pc := decr.pcint;
                end if;
                --if cache_stall='0' then
                if exu_busy='0' then
                  w.opcode := sampledOpcode;
                end if;
                --end if;
              end if;

            end if;

            w.opWillFreeze := sampledOpWillFreeze;
            w.decodedOpcode := sampledDecodedOpcode;
            w.stackOperation := sampledStackOperation;
            w.spOffset := sampledspOffset;
            w.tosSource := sampledTosSource;
            w.idim := decr.im;
          end if;

        when State_Jump =>
          w.valid := '0';
          if cache_stall='0' then
            w.pcint := decr.fetchpc;
            w.fetchpc := pcnext;
            w.state := State_Run;
          end if;

        when State_InjectJump =>
          w.valid := '0';
          w.pcint := decr.fetchpc;
          w.fetchpc := pcnext;
          w.state := State_Inject;

        when State_Inject =>
          -- NOTE: disable ROM
          --rom_wb_cyc_o <= '0';

          if dbg_in.injectmode='0' then
            w.im := decr.im_emu;
            w.fetchpc := decr.pcint;
            w.state := State_Run;
            w.break := '0';
          else
            -- Handle opcode injection
            -- TODO: merge this with main decode.

            -- NOTE: we don't check busy here, it's up to debug unit to do it
            --if pfu_busy='0' then
              --w.fetchpc := pcnext;

            -- Jump request
              if decode_jump='1' then
                w.fetchpc := jump_address;
                w.valid := '0';
                w.im := '0';
                w.state := State_InjectJump;
              else
                w.valid := dbg_in.inject;

                if dbg_in.inject='1' then
                  w.im := sampledOpcode(7);
                  --w.break := '0';
                  --w.pcint := decr.fetchpc;
                  w.opcode := sampledOpcode;
                  --w.pc := decr.pcint;
                end if;
              end if;

              w.opWillFreeze := sampledOpWillFreeze;
              w.decodedOpcode := sampledDecodedOpcode;
              w.stackOperation := sampledStackOperation;
              w.spOffset := sampledspOffset;
              w.tosSource := sampledTosSource;
              w.idim := decr.im;

            end if;
          --end if;
      end case;
    end if; -- rst

    if rising_edge(wb_clk_i) then
      decr <= w;
    end if;

  end process;

  -- Prefetch/Load unit.

  sp_load <= exr.tos(spMaxBit downto 2); -- Will be delayed one clock cycle

  process(wb_clk_i, wb_rst_i, decr, prefr, exu_busy, decode_jump, sp_load,
          decode_load_sp, dbg_in.flush)
    variable w: prefetchregs_type;
    variable i_op_freeze: std_logic;
  begin

    w := prefr;

    pfu_busy<='0';
    stack_b_addr <= std_logic_vector(prefr.spnext + 1);
    w.recompute_sp:='0';

    -- Stack
    w.load := decode_load_sp;

    if decode_load_sp='1' then
      pfu_busy <= '1';
      w.spnext := sp_load;
      w.recompute_sp := '1';
    else
      pfu_busy <= exu_busy;

      if decr.valid='1' then
        if (exu_busy='0' and decode_jump='0') or prefr.recompute_sp='1' then
          case decr.stackOperation is
              when Stack_Push =>
                w.spnext := prefr.spnext - 1;
              when Stack_Pop =>
                w.spnext := prefr.spnext + 1;
              when Stack_DualPop =>
                w.spnext := prefr.spnext + 2;
              when others =>
          end case;
          w.sp := prefr.spnext;
        end if;
      end if;
    end if;

    case decr.decodedOpcode is
      when Decoded_LoadSP | decoded_AddSP =>
          stack_b_addr <= std_logic_vector(prefr.spnext + decr.spOffset);
      when others =>
    end case;

    if decode_jump='1' then     -- this is a pipeline "invalidate" flag.
      w.valid := '0';
    else
      if dbg_in.flush='1' then
        w.valid := '0';
      else
        if exu_busy='0' then
          w.valid := decr.valid;
        end if;
      end if;
    end if;

    -- Moved op_will_freeze from decoder to here
    case decr.decodedOpcode is
      when Decoded_StoreSP
          | Decoded_LoadB
          | Decoded_Neqbranch
          | Decoded_StoreB
          | Decoded_Mult
          | Decoded_Ashiftleft
          | Decoded_Break
          --| Decoded_Load
          | Decoded_LoadH
          | Decoded_Store
          | Decoded_StoreH
          | Decoded_PopSP
          | Decoded_MultF16 =>

        i_op_freeze := '1';

      when others =>
        i_op_freeze := '0';
    end case;

    if exu_busy='0' then
      w.decodedOpcode := decr.decodedOpcode;
      w.tosSource     := decr.tosSource;
      w.opcode        := decr.opcode;
      w.opWillFreeze  := i_op_freeze;
      w.pc            := decr.pc;
      w.fetchpc       := decr.pcint;
      w.idim          := decr.idim;
      w.break         := decr.break;
    end if;

    if wb_rst_i='1' then
      w.spnext := unsigned(spStart(spMaxBit downto 2));
      --w.sp := unsigned(spStart(10 downto 2));
      w.valid := '0';
      w.idim := '0';
      w.recompute_sp:='0';
    end if;

    if rising_edge(wb_clk_i) then
      prefr <= w;
    end if;
   
  end process;

  process(prefr,exr,nos)
  begin
        trace_pc <= (others => '0');
        trace_pc(maxAddrBit downto 0) <= std_logic_vector(prefr.pc);
        trace_opcode <= prefr.opcode;
        trace_sp <= (others => '0');
        trace_sp(spMaxBit downto 2) <= std_logic_vector(prefr.sp);
        trace_topOfStack <= std_logic_vector( exr.tos );
        trace_topOfStackB <= std_logic_vector( nos );
  end process;

  -- IO/Memory Accesses

  lsu_address    <= std_logic_vector(exr.tos(maxAddrBitIncIO downto 0));
  --wb_cyc_o    <= exr.wb_cyc;
  --wb_stb_o    <= exr.wb_stb;
  --wb_we_o     <= exr.wb_we;
  --lsu_data_write <= std_logic_vector( nos );

  freeze_all  <= dbg_in.freeze;

  process(exr, wb_inta_i, wb_clk_i, wb_rst_i, pcnext, stack_a_read,stack_b_read,
          wb_ack_i, wb_dat_i, do_interrupt,exr, prefr, nos,
          single_step, freeze_all, dbg_in.step, wroteback_q,lshifter_done,lshifter_output,
          lsu_busy, lsu_data_read
          )

    variable spOffset: unsigned(4 downto 0);
    variable w: exuregs_type;
    variable instruction_executed: std_logic;
    variable wroteback: std_logic;
    variable datawrite: std_logic_vector(wordSize-1 downto 0);
    variable sel: std_logic_vector(3 downto 0);
  begin

    w := exr;

    instruction_executed := '0'; -- used for single stepping

    stack_b_writeenable <= (others => '0');
    stack_a_enable <= '1';
    stack_b_enable <= '1';

    exu_busy <= '0';
    decode_jump <= '0';

    jump_address <= (others => DontCareValue);

    lshifter_enable <= '0';
    lshifter_amount <= std_logic_vector(exr.tos_save);
    lshifter_input <= std_logic_vector(exr.nos_save);
    lshifter_multorshift <= '0';

    poppc_inst <= '0';
    begin_inst<='0';

    stack_a_addr <= std_logic_vector( prefr.sp );

    stack_a_writeenable <= (others => '0');
    wroteback := wroteback_q;

    stack_a_write <= std_logic_vector(exr.tos);

    spOffset(4):=not prefr.opcode(4);
    spOffset(3 downto 0) := unsigned(prefr.opcode(3 downto 0));

    if wb_inta_i='0' then
      w.inInterrupt := '0';
    end if;

    stack_b_write<=(others => DontCareValue);

    if wroteback_q='1' then
      nos <= unsigned(stack_a_read);
    else
      nos <= unsigned(stack_b_read);
    end if;

    decode_load_sp <= '0';

    lsu_req <= '0';
    lsu_we <= DontCareValue;
    lsu_data_sel <= (others => DontCareValue);
    lsu_data_write <= (others => DontCareValue);
    case exr.state is

      when State_ResyncFromStoreStack =>
        exu_busy <= '1';
        stack_a_addr <= std_logic_vector(prefr.spnext);
        stack_a_enable<='1';
        w.state := State_Resync2;
        wroteback := '0';

      when State_Resync2 =>

        w.tos := unsigned(stack_a_read);
        instruction_executed := '1';
        exu_busy <= '0';
        wroteback := '0';
        stack_b_enable <= '1';
        w.state := State_Execute;

      when State_Execute =>
       instruction_executed:='0';

       if prefr.valid='1' then

        exu_busy <= prefr.opWillFreeze;

        if freeze_all='0' or single_step='1' then

        wroteback := '0';
        w.nos_save := nos;
        w.tos_save := exr.tos;
        w.idim := prefr.idim;
        w.break:= prefr.break;

        begin_inst<='1';

        instruction_executed := '1';

        -- TOS big muxer

        case prefr.tosSource is
          when Tos_Source_PC =>
            w.tos := (others => '0');
            w.tos(maxAddrBit downto 0) := prefr.pc;

          when Tos_Source_FetchPC =>
            w.tos := (others => '0');
            w.tos(maxAddrBit downto 0) := prefr.fetchpc;

          when Tos_Source_Idim0 =>
            for i in wordSize-1 downto 7 loop
              w.tos(i) := prefr.opcode(6);
            end loop;
            w.tos(6 downto 0) := unsigned(prefr.opcode(6 downto 0));

          when Tos_Source_IdimN =>
            w.tos(wordSize-1 downto 7) := exr.tos(wordSize-8 downto 0);
            w.tos(6 downto 0) := unsigned(prefr.opcode(6 downto 0));

          when Tos_Source_StackB =>
            w.tos := nos;

          when Tos_Source_SP =>
            w.tos := (others => '0');
            w.tos(31) := '1'; -- Stack address
            w.tos(spMaxBit downto 2) := prefr.sp;

          when Tos_Source_Add =>
            w.tos := exr.tos + nos;

          when Tos_Source_And =>
            w.tos := exr.tos and nos;

          when Tos_Source_Or =>
            w.tos := exr.tos or nos;

          when Tos_Source_Eq =>
            w.tos := (others => '0');
            if nos = exr.tos then
              w.tos(0) := '1';
            end if;

          when Tos_Source_Ulessthan =>
            w.tos := (others => '0');
            if exr.tos < nos then
              w.tos(0) := '1';
            end if;

          when Tos_Source_Lessthan =>
            w.tos := (others => '0');
            if signed(exr.tos) < signed(nos) then
              w.tos(0) := '1';
            end if;

          when Tos_Source_Not =>
            w.tos := not exr.tos;

          when Tos_Source_Flip =>
            for i in 0 to wordSize-1 loop
              w.tos(i) := exr.tos(wordSize-1-i);
            end loop;

          when Tos_Source_LoadSP =>
            w.tos := unsigned(stack_b_read);

          when Tos_Source_AddSP =>
            w.tos := w.tos + unsigned(stack_b_read);

          when Tos_Source_AddStackB =>
            w.tos := w.tos + nos;

          when Tos_Source_Shift =>
            w.tos := exr.tos + exr.tos;

          when Tos_Source_LSU =>
            if lsu_busy='0' then
              w.tos := unsigned(lsu_data_read);
            end if;
          when others =>

        end case;

        case prefr.decodedOpcode is

          when Decoded_Interrupt =>

           w.inInterrupt := '1';
           jump_address <= to_unsigned(32, maxAddrBit+1);
           decode_jump <= '1';
           stack_a_writeenable<=(others =>'1');
           wroteback:='1';
           stack_b_enable<= '0';
           instruction_executed := '0';
           w.state := State_WaitSPB;

          when Decoded_Im0 =>

            stack_a_writeenable<= (others =>'1');
            wroteback:='1';

          when Decoded_ImN =>

          when Decoded_Nop =>

          when Decoded_PopPC | Decoded_Call =>

            decode_jump <= '1';
            jump_address <= exr.tos(maxAddrBit downto 0);
            poppc_inst <= '1';

            stack_b_enable<='0';

            -- Delay
            instruction_executed := '0';

            w.state := State_WaitSPB;

          when Decoded_Emulate =>

            decode_jump <= '1';
            jump_address <= (others => '0');
            jump_address(9 downto 5) <= unsigned(prefr.opcode(4 downto 0));

            stack_a_writeenable<=(others =>'1');
            wroteback:='1';

          when Decoded_PushSP =>

            stack_a_writeenable<=(others =>'1');
            wroteback:='1';

          when Decoded_LoadSP =>

            stack_a_writeenable <= (others =>'1');
            wroteback:='1';

          when Decoded_DupStackB =>

            stack_a_writeenable <= (others => '1');
            wroteback:='1';

          when Decoded_Dup =>

            stack_a_writeenable<= (others =>'1');
            wroteback:='1';

          when Decoded_AddSP =>

            stack_a_writeenable <= (others =>'1');

          when Decoded_StoreSP =>

            stack_a_writeenable <= (others =>'1');
            wroteback:='1';
            stack_a_addr <= std_logic_vector(prefr.sp + spOffset);
            instruction_executed := '0';
            w.state := State_WaitSPB;

          when Decoded_PopDown =>

            stack_a_writeenable<=(others =>'1');

          when Decoded_Pop =>

          when Decoded_Ashiftleft =>
            w.state := State_Ashiftleft;

          when Decoded_Mult  =>
            w.state := State_Mult;

          when Decoded_MultF16  =>
            w.state := State_MultF16;

          when Decoded_Store | Decoded_StoreB | Decoded_StoreH =>

              if prefr.decodedOpcode=Decoded_Store then
                datawrite := std_logic_vector(nos);
                sel := "1111";

              elsif prefr.decodedOpcode=Decoded_StoreH then
                datawrite := (others => DontCareValue);
                if exr.tos(1)='1' then
                  datawrite(15 downto 0) := std_logic_vector(nos(15 downto 0))  ;
                  sel := "0011";
                else
                  datawrite(31 downto 16) := std_logic_vector(nos(15 downto 0))  ;
                  sel := "1100";
                end if;
              else
                datawrite := (others => DontCareValue);
                case exr.tos(1 downto 0) is
                  when "11" =>
                    datawrite(7 downto 0) := std_logic_vector(nos(7 downto 0))  ;
                    sel := "0001";
                  when "10" =>
                    datawrite(15 downto 8) := std_logic_vector(nos(7 downto 0))  ;
                    sel := "0010";
                  when "01" =>
                    datawrite(23 downto 16) := std_logic_vector(nos(7 downto 0))  ;
                    sel := "0100";
                  when "00" =>
                    datawrite(31 downto 24) := std_logic_vector(nos(7 downto 0))  ;
                    sel := "1000";
                  when others =>
                end case;
              end if;


            stack_a_writeenable <=sel;
            lsu_data_sel <= sel;

            if exr.tos(31)='1' then
              stack_a_addr <= std_logic_vector(exr.tos(spMaxBit downto 2));
              stack_a_write <= datawrite;
              stack_a_writeenable <= sel;
              w.state := State_ResyncFromStoreStack;
            else

              --w.wb_we  := '1';
              --w.wb_cyc := '1';
              --w.wb_stb := '1';

              wroteback := wroteback_q; -- Keep WB
      --        stack_a_enable<='0';
              stack_a_enable<=not lsu_busy;
              stack_a_writeenable <= (others => '0');
    --          stack_a_addr  <= (others => DontCareValue);
              stack_a_write <= (others => DontCareValue);
              stack_a_addr <= std_logic_vector(prefr.spnext);
              stack_b_enable<= not lsu_busy;
              lsu_data_write <= datawrite;

              instruction_executed := '0';

              exu_busy <= '1';
              lsu_req <= '1';
              lsu_we  <= '1';

              if lsu_busy='0' then
              
                wroteback := '0';
                w.state := State_Resync2;
              end if;

            end if;

          when Decoded_Load | Decoded_Loadb | Decoded_Loadh =>

            --w.tos_save := exr.tos; -- Byte select

            instruction_executed := '0';
            wroteback := wroteback_q; -- Keep WB

            if exr.tos(wordSize-1)='1' then
              stack_a_addr<=std_logic_vector(exr.tos(spMaxBit downto 2));
              stack_a_enable<='1';
              exu_busy <= '1';
              w.state := State_LoadStack;
            else
              exu_busy <= lsu_busy;
              lsu_req <= '1';
              lsu_we  <= '0';
              stack_a_enable <= '0';
              stack_a_addr  <= (others => DontCareValue);
              stack_a_write <= (others => DontCareValue);
              stack_b_enable <= not lsu_busy;

              if lsu_busy='0' then
                if prefr.decodedOpcode=Decoded_Loadb then
                  exu_busy<='1';
                  w.state:=State_Loadb;
                elsif prefr.decodedOpcode=Decoded_Loadh then
                  exu_busy<='1';
                  w.state:=State_Loadh;
                end if;
              else
                wroteback := '0';
              end if;
            end if;

          when Decoded_PopSP =>

            decode_load_sp <= '1';
            instruction_executed := '0';
            stack_a_addr <= std_logic_vector(exr.tos(spMaxBit downto 2));
            w.state := State_Resync2;

          --when Decoded_Break =>

          --  w.break := '1';

          when Decoded_Neqbranch =>
            
            instruction_executed := '0';
            w.state := State_NeqBranch;

          when others =>

        end case;
      else -- freeze_all
        --
        -- Freeze the entire pipeline.
        --
        exu_busy<='1';
        stack_a_enable<='0';
        stack_b_enable<='0';
        stack_a_addr  <= (others => DontCareValue);
        stack_a_write <= (others => DontCareValue);

       end if;
       end if; -- valid

      when State_Ashiftleft =>
        exu_busy <= '1';
        lshifter_enable <= '1';
        w.tos := unsigned(lshifter_output(31 downto 0));

        if lshifter_done='1' then
          exu_busy<='0';
          w.state := State_Execute;
        end if;

      when State_Mult =>
        exu_busy <= '1';
        lshifter_enable <= '1';
        lshifter_multorshift <='1';
        w.tos := unsigned(lshifter_output(31 downto 0));

        if lshifter_done='1' then
          exu_busy<='0';
          w.state := State_Execute;
        end if;

      when State_MultF16 =>
        exu_busy <= '1';
        lshifter_enable <= '1';
        lshifter_multorshift <='1';
        w.tos := unsigned(lshifter_output(47 downto 16));

        if lshifter_done='1' then
          exu_busy<='0';
          w.state := State_Execute;
        end if;

      when State_WaitSPB =>

        instruction_executed:='1';
        wroteback := '0';
        w.state := State_Execute;
  
      when State_Loadb =>
        w.tos(wordSize-1 downto 8) := (others => '0');
        case exr.tos_save(1 downto 0) is
          when "11" =>
            w.tos(7 downto 0) := unsigned(exr.tos(7 downto 0));
          when "10" =>
            w.tos(7 downto 0) := unsigned(exr.tos(15 downto 8));
          when "01" =>
            w.tos(7 downto 0) := unsigned(exr.tos(23 downto 16));
          when "00" =>
            w.tos(7 downto 0) := unsigned(exr.tos(31 downto 24));
          when others =>
            null;
        end case;
        instruction_executed:='1';
        wroteback := '0';
        w.state := State_Execute;

      when State_Loadh =>
        w.tos(wordSize-1 downto 8) := (others => '0');

        case exr.tos_save(1) is
          when '1' =>
            w.tos(15 downto 0) := unsigned(exr.tos(15 downto 0));
          when '0' =>
            w.tos(15 downto 0) := unsigned(exr.tos(31 downto 16));
          when others =>
            null;
        end case;
        instruction_executed:='1';
        wroteback := '0';
        w.state := State_Execute;

      when State_LoadStack =>
        w.tos := unsigned(stack_a_read);

        if prefr.decodedOpcode=Decoded_Loadb then
          exu_busy<='1';
          w.state:=State_Loadb;
        elsif prefr.decodedOpcode=Decoded_Loadh then
          exu_busy<='1';
          w.state:=State_Loadh;
        else
          instruction_executed:='1';
          wroteback := '0';
          w.state := State_Execute;
        end if;

      when State_NeqBranch =>
        if exr.nos_save/=0 then
          decode_jump <= '1';
          jump_address <= exr.tos(maxAddrBit downto 0) + prefr.pc;
          poppc_inst <= '1';
          exu_busy <= '0';
        else
          exu_busy <='1';
        end if;

        instruction_executed := '0';

        stack_a_addr <= std_logic_vector(prefr.spnext);
        wroteback:='0';
        w.state := State_Resync2;

      when others =>
         null;

    end case;


    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        exr.state <= State_Execute;
        exr.idim <= DontCareValue;
        exr.inInterrupt <= '0';
        exr.break <= '0';
        exr.wb_cyc <= '0';
        exr.wb_stb <= '1';
        wroteback_q <= '0';
      else
        exr <= w;
        -- TODO: move wroteback_q into EXU regs
        wroteback_q <= wroteback;

        if exr.break='1' then
          report "BREAK" severity failure;
        end if;

        -- Some sanity checks, to be caught in simulation
        if prefr.valid='1' then
          if prefr.tosSource=Tos_Source_Idim0 and prefr.idim='1' then
            report "Invalid IDIM flag 0" severity error;
          end if;
  
          if prefr.tosSource=Tos_Source_IdimN and prefr.idim='0' then
            report "Invalid IDIM flag 1" severity error;
          end if;
        end if;

      end if;
    end if;

  end process;

  single_step <= dbg_in.step;
  dbg_out.valid <= '1' when prefr.valid='1' else '0';

  -- Let pipeline finish

  dbg_out.ready <= '1' when exr.state=state_execute
    and decode_load_sp='0'
    and decode_jump='0'
    and decr.state = State_Inject
    --and jump_q='0'
      else '0';

end behave;

