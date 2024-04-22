
--
-- Copyright (c) 2008-2015 Sytse van Slooten
--
-- Permission is hereby granted to any person obtaining a copy of these VHDL source files and
-- other language source files and associated documentation files ("the materials") to use
-- these materials solely for personal, non-commercial purposes.
-- You are also granted permission to make changes to the materials, on the condition that this
-- copyright notice is retained unchanged.
--
-- The materials are distributed in the hope that they will be useful, but WITHOUT ANY WARRANTY;
-- without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--

-- $Revision: 1.424 $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pdp2011_cpu is
   port(
      addr_v : out std_logic_vector(15 downto 0);                    -- the virtual address that the cpu drives out to the bus for the current read or write
      datain : in std_logic_vector(15 downto 0);                     -- when doing a read, the data input to the cpu
      dataout : out std_logic_vector(15 downto 0);                   -- when doing a write, the data output from the cpu
      wr : out std_logic;                                            -- if '1', the cpu is doing a write to the bus and drives addr_v and dataout
      rd : out std_logic;                                            -- if '1', the cpu is doing a read from the bus, drives addr_v and reads datain
      dw8 : out std_logic;                                           -- if '1', the read or write initiated by the cpu is 8 bits wide
      cp : out std_logic;                                            -- if '1', the read or write should use the previous cpu mode
      ifetch : out std_logic;                                        -- if '1', this read is for an instruction fetch
      id : out std_logic;                                            -- if '1', the read or write should use data space
      init : out std_logic;                                          -- if '1', the devices on the bus should reset

      iwait : out std_logic;                                         -- if '1', the cpu is waiting for an interrupt

      br7 : in std_logic;                                            -- interrupt request, 7
      bg7 : out std_logic;                                           -- interrupt grant, 7
      int_vector7 : in std_logic_vector(8 downto 0);                 -- interrupt vector, 7
      br6 : in std_logic;
      bg6 : out std_logic;
      int_vector6 : in std_logic_vector(8 downto 0);
      br5 : in std_logic;
      bg5 : out std_logic;
      int_vector5 : in std_logic_vector(8 downto 0);
      bg4 : out std_logic;                                           -- interrupt request, 4
      br4 : in std_logic;                                            -- interrupt grant, 4
      int_vector4 : in std_logic_vector(8 downto 0);                 -- interrupt vector, 4

      mmutrap : in std_logic;                                        -- if '1', the mmu requests a trap to be serviced after the current instruction completes
      ack_mmutrap : out std_logic;                                   -- if '1', the mmu trap request is being acknowledged
      mmuabort : in std_logic;                                       -- if '1', the mmu requests that the current instruction is aborted because of a mmu fault
      ack_mmuabort : out std_logic;                                  -- if '1', the mmu abort request is being acknowledged

      npr : in std_logic;                                            -- non-processor request
      npg : out std_logic;                                           -- non-processor grant

      nxmabort : in std_logic;                                       -- nxm abort - a memory access cycle by the cpu refers to an address that does not exist
      oddabort : in std_logic;                                       -- odd abort - a memory access cycle by the cpu is for a full word, but uses an odd address
      illhalt : out std_logic;                                       -- a halt instruction was not executed because it was illegal in the current mode; for use in the cer cpu error register
      ysv : out std_logic;                                           -- a yellow stack trap is in progress - for use in the cer cpu error register
      rsv : out std_logic;                                           -- a red stack trap is in progress - for use in the cer cpu error register

      cpu_stack_limit : in std_logic_vector(15 downto 0);            -- the cpu stack limit control register value
      cpu_kmillhalt : in std_logic;                                  -- the control register setting for kernel mode illegal halt

      sr0_ic : out std_logic;                                        -- sr0/mmr0 instruction complete flag
      sr1 : out std_logic_vector(15 downto 0);                       -- sr1/mmr1, address of the current instruction
      sr2 : out std_logic_vector(15 downto 0);                       -- sr2, register autoincrement/autodecrement information for instruction restart
      dstfreference : out std_logic;                                 -- if '1', the destination reference is the final reference for this addressing mode
      sr3csmenable : in std_logic;                                   -- if '1', the enable csm instruction flag in sr3/mmr3 is set

      psw_in : in std_logic_vector(15 downto 0);                     -- psw input from the control register address @ 177776
      psw_in_we_even : in std_logic;                                 -- psw input from the control register address @ 177776, write enable for the even address part
      psw_in_we_odd : in std_logic;                                  -- psw input from the control register address @ 177776, write enable for the odd address part
      psw_out : out std_logic_vector(15 downto 0);                   -- psw output, current psw that the cpu uses

      pir_in : in std_logic_vector(15 downto 0);                     -- pirq value input from the control register

      modelcode : in integer range 0 to 255;                         -- cpu model code
      have_fp : in integer range 0 to 2 := 2;                        -- floating point; 0=force disable; 1=force enable; 2=follow default for cpu model
      have_fpa : in integer range 0 to 1 := 0;                       -- floating point accelerator present with J11 cpu
      init_r7 : in std_logic_vector(15 downto 0) := x"f600";         -- start address after reset = o'173000' = m9312 hi rom
      init_psw : in std_logic_vector(15 downto 0) := x"00e0";        -- initial psw for kernel mode, primary register set, priority 7

      run : in std_logic := '0';                                     -- if '1', continue when the cpu is in halt state
      clk : in std_logic;                                            -- input clock
      reset : in std_logic                                           -- reset cpu, also causes init signal to devices on the bus to be asserted
   );
end pdp2011_cpu;

architecture implementation of pdp2011_cpu is

component cpuregs is
   port(
      raddr : in std_logic_vector(5 downto 0);
      waddr : in std_logic_vector(5 downto 0);
      d : in std_logic_vector(15 downto 0);
      o : out std_logic_vector(15 downto 0);
      we : in std_logic;
      clk : in std_logic
   );
end component;

component fpuregs is
   port(
      raddr : in std_logic_vector(2 downto 0);
      waddr : in std_logic_vector(2 downto 0);
      d : in std_logic_vector(63 downto 0);
      o : out std_logic_vector(63 downto 0);
      fpmode : in std_logic;
      we : in std_logic;
      clk : in std_logic
   );
end component;

type state_type is (
   state_init, state_ifetch, state_idecode,
   state_src0,
   state_src1,
   state_src2, state_src2w,
   state_src3, state_src3a,
   state_src4, state_src4w,
   state_src5, state_src5a,
   state_src6, state_src6a,
   state_src7, state_src7a, state_src7b,
   state_dst0,
   state_dst1,
   state_dst2,
   state_dst3, state_dst3a,
   state_dst4,
   state_dst5, state_dst5a,
   state_dst6, state_dst6a,
   state_dst7, state_dst7a, state_dst7b,
   state_sob,
   state_jmp,
   state_jsr, state_jsra, state_jsrb, state_jsrc,
   state_rts, state_rtsa,
   state_mark, state_marka, state_markb,
   state_csm, state_csma, state_csmb, state_csmc, state_csmd, state_csme, state_csmf, state_csmg, state_csmh, state_csmi,
   state_mfp, state_mfpa,
   state_mtp, state_mtpa,
   state_mtps,
   state_dopr, state_dopra, state_doprb,
   state_mul, state_mula, state_mulb,
   state_div, state_diva, state_divb,
   state_ash, state_ashb,
   state_ashc, state_ashd, state_ashe,
   state_xor,
   state_ldfps,
   state_stststore,
   state_fptrap,
   state_fpao,
   state_fpso2,
   state_fpwr, state_fpwr1, state_fpwr2,
   state_fpd0,
   state_fpir1, state_fpir2,
   state_fpiwr, state_fpiww, state_fpiw1, state_fpiw2,
   state_fpr1, state_fpr2, state_fpr3, state_fpr4,
   state_fpww, state_fpw1, state_fpw2, state_fpw3, state_fpw4,
   state_fprun,
   state_fprunao,
   state_tstset, state_wrtlck, state_wrtlcka,
   state_rsv,
   state_trap, state_trapa, state_trapb, state_trapc, state_trapw, state_trapd, state_trape, state_trapf,
   state_rti, state_rtia, state_rtib,
   state_illegalop,
   state_mmuabort, state_mmutrap,
   state_br7, state_br6, state_br5, state_br4,
   state_store_alu_p, state_store_alu_w, state_store_alu_r,
   state_npg
);

signal state : state_type := state_init;
signal pdststate : state_type := state_store_alu_r;             -- initialize to a valid value, to enable optimizing
signal psrcstate : state_type := state_store_alu_r;             -- initialize to a valid value, to enable optimizing

signal ir : std_logic_vector(15 downto 0);
signal ir_addr : std_logic_vector(15 downto 0);
signal ir_dop : std_logic;
signal ir_sop : std_logic;
signal ir_jmp : std_logic;
signal ir_jsr : std_logic;
signal ir_csm : std_logic;
signal ir_mfpi : std_logic;
signal ir_mfpd : std_logic;
signal ir_mf : std_logic;
signal ir_mtpi : std_logic;
signal ir_mtpd : std_logic;
signal ir_mt : std_logic;
signal ir_mtps : std_logic;
signal ir_mfps : std_logic;
signal ir_dopr : std_logic;
signal ir_fpsop1 : std_logic;
signal ir_fpsop2 : std_logic;
signal ir_fpao : std_logic;
signal ir_facdst : std_logic;
signal ir_facsrc : std_logic;
signal ir_facfdst : std_logic;
signal ir_facfsrc : std_logic;
signal ir_fpma48 : std_logic;
signal ir_fpmai : std_logic;
signal ir_fpmaf : std_logic;
signal ir_mpr : std_logic;
signal ir_rtt : std_logic;
signal ir_wait : std_logic;
signal ir_halt : std_logic;
signal ir_byte : std_logic;
signal ir_store : std_logic;
signal ir_srcr7 : std_logic;
signal ir_dstr7 : std_logic;
signal ir_dstm2r7 : std_logic;

signal temp_psw : std_logic_vector(15 downto 0);
signal trap_vector : std_logic_vector(8 downto 0);
signal trap_vectorp2 : std_logic_vector(8 downto 0);

-- addr
signal addr : std_logic_vector(15 downto 0);

-- psw
signal psw : std_logic_vector(15 downto 0) := init_psw;
signal pswmf : std_logic_vector(15 downto 8);
signal psw_delayedupdate : std_logic_vector(15 downto 0);
signal psw_delayedupdate_even : std_logic;
signal psw_delayedupdate_odd : std_logic;

-- pc
signal r7 : std_logic_vector(15 downto 0) := init_r7;
signal r7p2 : std_logic_vector(15 downto 0);

-- alu signals
signal alu_input : std_logic_vector(15 downto 0);
signal alus_input : std_logic_vector(15 downto 0);
signal alut_input : std_logic_vector(15 downto 0);
signal alu_output : std_logic_vector(15 downto 0);
signal alu_output_signext : std_logic_vector(15 downto 0);
signal alu_psw : std_logic_vector(3 downto 0);


-- register bus
signal rbus_raddr : std_logic_vector(5 downto 0);
signal rbus_waddr : std_logic_vector(5 downto 0);
signal rbus_d : std_logic_vector(15 downto 0);
signal rbus_o : std_logic_vector(15 downto 0);
signal rbus_we : std_logic;

signal rbus_ix : std_logic_vector(2 downto 0);
signal rbus_cpu_mode : std_logic_vector(1 downto 0);
signal rbus_data : std_logic_vector(15 downto 0);
signal rbus_data_m8 : std_logic_vector(15 downto 0);
signal rbus_data_m4 : std_logic_vector(15 downto 0);
signal rbus_data_m2 : std_logic_vector(15 downto 0);
signal rbus_data_m1 : std_logic_vector(15 downto 0);
signal rbus_data_p8 : std_logic_vector(15 downto 0);
signal rbus_data_p4 : std_logic_vector(15 downto 0);
signal rbus_data_p2 : std_logic_vector(15 downto 0);
signal rbus_data_p1 : std_logic_vector(15 downto 0);
signal rbus_data_mv : std_logic_vector(15 downto 0);
signal rbus_data_pv : std_logic_vector(15 downto 0);

-- sr1/mmr1
signal sr1_dst : std_logic_vector(7 downto 0);
signal sr1_src : std_logic_vector(7 downto 0);
signal sr1_dstd : std_logic_vector(4 downto 0);
signal sr1_srcd : std_logic_vector(4 downto 0);
signal sr1_p2 : std_logic_vector(4 downto 0);
signal sr1_pv : std_logic_vector(4 downto 0);
signal sr1_m2 : std_logic_vector(4 downto 0);
signal sr1_mv : std_logic_vector(4 downto 0);

-- current/previous mode flags
signal cp_req : std_logic;
signal cp_mf : std_logic;
signal cp_mt : std_logic;

-- id selector output based on state
signal id_select : std_logic;

-- rd output based on state
signal rd_select : std_logic;
signal rs_mt : std_logic;
signal rs_jj : std_logic;

-- address buffers
signal dest_addr : std_logic_vector(15 downto 0);
signal addr_indirect : std_logic_vector(15 downto 0);
signal finalreference : std_logic;


-- signals for eis operations (div, mul, ash, ashc)
signal eis_output : std_logic_vector(15 downto 0);
signal eis_output32 : std_logic_vector(15 downto 0);
signal eis_temp : std_logic_vector(15 downto 0);
signal eis_temp1 : std_logic_vector(31 downto 0);
signal eis_temp2 : std_logic_vector(31 downto 0);
signal eis_sequencer : std_logic_vector(4 downto 0);
signal eis_psw : std_logic_vector(3 downto 0);
signal eis_flag1 : std_logic;
signal eis_flag2 : std_logic;


-- counter for number of cycles to remain in init state
signal initcycles : integer range 0 to 7;


-- signals for yellow stack trap recognition
signal yellow_stack_trap : std_logic;
signal yellow_stack_trap_trigger : std_logic;
signal yellow_stack_trap_relevant_state : std_logic;
signal yellow_stack_trap_inhibit : std_logic;


-- signals for red stack trap recognition
signal red_stack_trap : std_logic;
signal red_stack_trap_trigger : std_logic;
signal red_stack_trap_relevant_state : std_logic;


-- floating point stuff
signal fps : std_logic_vector(15 downto 0);
signal fec : std_logic_vector(3 downto 0);
signal fea : std_logic_vector(15 downto 0);


-- floating point alu
signal falu_input : std_logic_vector(63 downto 0);
signal falus_input : std_logic_vector(63 downto 0);
signal falu_output : std_logic_vector(63 downto 0);
signal falu_output2 : std_logic_vector(63 downto 0);
signal falu_fps : std_logic_vector(3 downto 0);
signal falu_load : std_logic;
signal falu_done : std_logic;
signal falu_flag1 : std_logic;
type falu_fsm_type is (
   falu_idle,
   falu_align,
   falu_mult,
   falu_div,
   falu_addsub,
   falu_shift, falu_shift2, falu_shifte,
   falu_norm,
   falu_rt, falu_rtc,
   falu_sep, falu_sep2, falu_sep3,
   falu_zres,
   falu_res
);
signal falu_fsm : falu_fsm_type := falu_idle;
signal falu_ccw : std_logic_vector(9 downto 0);
signal falu_state : integer range 0 to 163;
signal falu_work1 : std_logic_vector(58 downto 0);
signal falu_work2 : std_logic_vector(58 downto 0);
signal falu_pending_clear : std_logic;
signal falu_pending_fic : std_logic;
signal falu_pending_fiu : std_logic;
signal falu_pending_fiv : std_logic;
signal falu_pending_divz : std_logic;

-- floating point registers
signal fbus_raddr : std_logic_vector(2 downto 0);
signal fbus_waddr : std_logic_vector(2 downto 0);
signal fbus_d : std_logic_vector(63 downto 0);
signal fbus_o : std_logic_vector(63 downto 0);
signal fbus_we : std_logic;
signal fbus_fd : std_logic;


-- sob slowdown
signal sob_slowdown: integer range 0 to 255;


-- configuration stuff
signal have_sob_zkdjbug : integer range 0 to 1;
signal have_sob : integer range 0 to 1;
signal have_sxt : integer range 0 to 1;
signal have_rtt : integer range 0 to 1;
signal have_mark : integer range 0 to 1;
signal have_xor : integer range 0 to 1;
signal have_eis : integer range 0 to 1;
signal have_fpu_default : integer range 0 to 1;
signal have_fpu : integer range 0 to 1;
signal have_mtps : integer range 0 to 1;
signal have_mfp : integer range 0 to 1;
signal have_mpr : integer range 0 to 1;
signal have_spl : integer range 0 to 1;
signal have_csm : integer range 0 to 1;
signal have_red : integer range 0 to 1;
signal have_pswimmediateupdate : integer range 0 to 1;
signal have_mmuimmediateabort : integer range 0 to 1;
signal have_oddimmediateabort : integer range 0 to 1;

signal have_psw1512 : integer range 0 to 1;
signal have_psw11 : integer range 0 to 1;
signal have_psw8 : integer range 0 to 1;


begin
   cpuregs0: cpuregs port map(
      raddr => rbus_raddr,
      waddr => rbus_waddr,
      d => rbus_d,
      o => rbus_o,
      we => rbus_we,
      clk => clk
   );

   fpuregs0: fpuregs port map(
      raddr => fbus_raddr,
      waddr => fbus_waddr,
      d => fbus_d,
      o => fbus_o,
      fpmode => fbus_fd,
      we => fbus_we,
      clk => clk
   );

   r7p2 <= r7 + 2;
   trap_vectorp2 <= trap_vector + 2;

   alu_output_signext <= alu_output(7) & alu_output(7) & alu_output(7) & alu_output(7) & alu_output(7) & alu_output(7) & alu_output(7) & alu_output(7) & alu_output(7 downto 0);


-- generate bus stuff

   iwait <= ir_wait;

-- finalreference : this bit signals states that access the final operand
-- this is needed for a) byte accesses; b) m[f|t]p[i|d]; so several other access types can be omitted here

   with state select finalreference <=
      '1' when state_dst1,
      '1' when state_dst2,
      '1' when state_dst3a,
      '1' when state_dst4,
      '1' when state_dst5a,
      '1' when state_dst6a,
      '1' when state_dst7b,
      '1' when state_src1,
      '1' when state_src2,
      '1' when state_src3a,
      '1' when state_src4,
      '1' when state_src5a,
      '1' when state_src6a,
      '1' when state_src7b,
      '1' when state_store_alu_w,
      '0' when others;

-- dstfreference : this bit signals states that access the final operand in dest mode only
-- this is needed for maintenance mode in the mmu, and then most likely only to be able
-- to pass diagnostics without error messages

   with state select dstfreference <=
      '1' when state_dst1,
      '1' when state_dst2,
      '1' when state_dst3a,
      '1' when state_dst4,
      '1' when state_dst5a,
      '1' when state_dst6a,
      '1' when state_dst7b,
      '1' when state_store_alu_w,
      '0' when others;


-- generate signals for yellow stack trap

   with state select yellow_stack_trap_relevant_state <=
      '1' when state_dst4,
      '1' when state_dst5a,
      '1' when state_src4,
      '1' when state_src5a,
      '1' when state_trapc,
      '1' when state_trapd,
      '1' when state_csmc,
      '1' when state_csme,
      '1' when state_csmg,
      '0' when others;

   yellow_stack_trap_trigger <= '1'
      when yellow_stack_trap_relevant_state = '1'
      and rbus_ix = "110"
      and psw(15 downto 14) = "00"
      and yellow_stack_trap_inhibit = '0'
      and red_stack_trap = '0'
      and unsigned(cpu_stack_limit) > unsigned(rbus_data_m2)
      else '0';

   ysv <= yellow_stack_trap_trigger;


-- generate signals for red stack trap

   with state select red_stack_trap_relevant_state <=
      '1' when state_trapc,
      '1' when state_trapd,
      '0' when others;

   red_stack_trap_trigger <= '1'
      when red_stack_trap_relevant_state = '1'
--      and (mmuabort = '1' or oddabort = '1' or nxmabort = '1')
      and (oddabort = '1' or nxmabort = '1')
      else '0';

   rsv <= red_stack_trap_trigger;


-- dw8 : data width 8, signals that a byte is accessed

   dw8 <= '1' when (finalreference = '1' and ir_byte = '1') else '0';


-- cp : this address refers to current or previous mode

   cp_mf <= '1' when finalreference = '1' and state /= state_store_alu_w and (ir_mfpi = '1' or ir_mfpd = '1') else '0';
   cp_mt <= '1' when state = state_store_alu_w and (ir_mtpi = '1' or ir_mtpd = '1') else '0';
   cp_req <= '1' when cp_mf = '1' or cp_mt = '1' else '0';
   cp <= cp_req;


-- rd : cpu needs read transaction

   with state select rd_select <=
      '1' when state_idecode,
      '1' when state_dst1,
      '1' when state_dst2,
      '1' when state_dst3 | state_dst3a,
      '1' when state_dst4,
      '1' when state_dst5 | state_dst5a,
      '1' when state_dst6 | state_dst6a,
      '1' when state_dst7 | state_dst7a | state_dst7b,
      '1' when state_src1,
      '1' when state_src2,
      '1' when state_src3 | state_src3a,
      '1' when state_src4,
      '1' when state_src5 | state_src5a,
      '1' when state_src6 | state_src6a,
      '1' when state_src7 | state_src7a | state_src7b,
      '1' when state_mfpa,
      '1' when state_mtpa,
      '1' when state_fpir1 | state_fpir2,
      '1' when state_fpr1 | state_fpr2 | state_fpr3 | state_fpr4,
      '1' when state_trapa | state_trapf,
      '1' when state_csmi,
      '1' when state_rtsa,
      '1' when state_markb,
      '1' when state_rtia | state_rtib,
      '0' when others;

-- rs signals - read suppression for specific cases, because raising the read line would cause a wrong memory access - potentially a trap
   rs_mt <= '1' when (ir_mtpi = '1' or ir_mtpd = '1') and finalreference = '1' and state /= state_store_alu_w else '0';
   rs_jj <= '1' when (ir_jmp = '1' or ir_jsr = '1') and finalreference = '1' else '0';

   rd <= '0' when rs_mt = '1' or rs_jj = '1' or ir_wait = '1' else rd_select;

-- wr : cpu needs write transaction

   with state select wr <=
      ir_store when state_store_alu_w,
      '1' when state_stststore,
      '1' when state_fpiw1 | state_fpiw2,
      '1' when state_fpw1 | state_fpw2 | state_fpw3 | state_fpw4,
      '1' when state_jsrb,
      '1' when state_trapc | state_trapd,
      '1' when state_csmc | state_csme | state_csmg,
      '0' when others;


-- select data to write

   with state select dataout <=
      alu_output when state_store_alu_w,
      fea when state_stststore,
      falu_output(63 downto 48) when state_fpw1,
      falu_output(47 downto 32) when state_fpw2,
      falu_output(31 downto 16) when state_fpw3,
      falu_output(15 downto 0) when state_fpw4,
      falu_output(63 downto 48) when state_fpiw1,
      falu_output(47 downto 32) when state_fpiw2,
      rbus_data when state_jsrb,
      temp_psw when state_trapc,
      r7 when state_trapd,
      temp_psw when state_csmc,
      r7 when state_csme,
      alu_output when state_csmg,
      "0000000000000000" when others;


-- addr : select address to drive

   with state select addr <=
      r7 when state_ifetch,                  -- r7 is driven out during wait or halt states - only used for debugging, not to drive actual logic
      r7 when state_idecode,
      rbus_data when state_dst1,
      rbus_data when state_dst2,
      rbus_data when state_dst3,
      addr_indirect when state_dst3a,
      rbus_data_mv when state_dst4,
      rbus_data_m2 when state_dst5,
      addr_indirect when state_dst5a,
      r7 when state_dst6,
      addr_indirect when state_dst6a,
      r7 when state_dst7,
      addr_indirect when state_dst7a,
      addr_indirect when state_dst7b,
      rbus_data when state_src1,
      rbus_data when state_src2,
      rbus_data when state_src3,
      addr_indirect when state_src3a,
      rbus_data_mv when state_src4,
      rbus_data_m2 when state_src5,
      addr_indirect when state_src5a,
      r7 when state_src6,
      addr_indirect when state_src6a,
      r7 when state_src7,
      addr_indirect when state_src7a,
      addr_indirect when state_src7b,
      rbus_data_m2 when state_mfpa,
      rbus_data when state_mtpa,
      addr_indirect when state_fpir1,
      addr_indirect when state_fpir2,
      addr_indirect when state_fpr1,
      addr_indirect when state_fpr2,
      addr_indirect when state_fpr3,
      addr_indirect when state_fpr4,
      addr_indirect when state_fpiw1,
      addr_indirect when state_fpiw2,
      addr_indirect when state_fpw1,
      addr_indirect when state_fpw2,
      addr_indirect when state_fpw3,
      addr_indirect when state_fpw4,
      "0000000" & trap_vectorp2 when state_trapa,
      "0000000" & trap_vector when state_trapb,
      rbus_data_m2 when state_trapc,
      rbus_data_m2 when state_trapd,
      "0000000" & trap_vector when state_trapf,
      addr_indirect when state_jsrb,
      addr_indirect when state_rtsa,
      rbus_data when state_markb,
      rbus_data when state_rtia,
      rbus_data when state_rtib,
      rbus_data_m2 when state_csmc,
      rbus_data_m2 when state_csme,
      rbus_data_m2 when state_csmg,
      "0000000" & trap_vector when state_csmi,
      dest_addr when state_store_alu_w,
      dest_addr when state_stststore,
      "0000000000000000" when others;

   addr_v <= addr;


-- id : map states onto instruction or data access

   ir_dstm2r7 <= '0' when ir(5 downto 0) = "010111" else '1';
   ir_srcr7 <= '0' when ir(8 downto 6) = "111" else '1';
   ir_dstr7 <= '0' when ir(2 downto 0) = "111" else '1';

   with state select id_select <=
      '0' when state_idecode,
      ir_dstr7 when state_dst1,
      ir_dstr7 when state_dst2,
      ir_dstr7 when state_dst3,
      '1' when state_dst3a,
      ir_dstr7 when state_dst4,
      ir_dstr7 when state_dst5,
      '1' when state_dst5a,
      '0' when state_dst6,
      '1' when state_dst6a,
      '0' when state_dst7,
      '1' when state_dst7a,
      '1' when state_dst7b,
      ir_srcr7 when state_src1,
      ir_srcr7 when state_src2,
      ir_srcr7 when state_src3,
      '1' when state_src3a,
      ir_srcr7 when state_src4,
      ir_srcr7 when state_src5,
      '1' when state_src5a,
      '0' when state_src6,
      '1' when state_src6a,
      '0' when state_src7,
      '1' when state_src7a,
      '1' when state_src7b,
      ir_dstm2r7 when state_fpir1,
      '1' when state_fpir2,
      ir_dstm2r7 when state_fpiw1,
      '1' when state_fpiw2,
      ir_dstm2r7 when state_fpr1,
      '1' when state_fpr2 | state_fpr3 | state_fpr4,
      ir_dstm2r7 when state_fpw1,
      '1' when state_fpw2 | state_fpw3 | state_fpw4,
      '1' when state_stststore,        -- always in d-space, this is the second store - first is handled by store_alu_w
      '1' when state_mfpa,             -- move from previous, stack push is to current d-space
      '1' when state_mtpa,              -- move to previous, stack pop is from current d-space
      '1' when state_trapa,            -- d-mapping for loading the trap psw from kernel d-space
      '1' when state_trapb,            -- to enable debugging output via addr - d-mapping should be 1 to 1, i-mapping likely is not
      '1' when state_trapc,            -- stack is in d-space
      '1' when state_trapd,            -- stack is in d-space
      '1' when state_trapf,            -- d-mapping for loading the trap vector from kernel d-space
      '1' when state_jsrb,
      '1' when state_rtsa,
      '0' when state_mark,
      '0' when state_marka,
      '1' when state_rtia,             -- stack is in d-space
      '1' when state_rtib,             -- stack is in d-space
      '1' when state_csmc | state_csme | state_csmg,
      '0' when state_csmi,         -- apparently; this at least is suggested by 0174_CKKTBD0_1144mmgmt.pdf
      ir_dstm2r7 when state_store_alu_w,
      '0' when others;

   id <=
      '1' when ir_mfpi = '1' and psw(15 downto 12) = "1111" and cp_req = '1'
      else '0' when ir_mfpi = '1' and cp_req = '1'
      else '1' when ir_mfpd = '1' and cp_req = '1'
      else '0' when ir_mtpi = '1' and cp_req = '1'
      else '1' when ir_mtpd = '1' and cp_req = '1'
      else id_select;


-- psw that is output to the mmu

   psw_out <= rbus_cpu_mode & pswmf(13 downto 8) & psw(7 downto 0);

-- psw filtered by cpu modelcode

   pswmf(15 downto 12) <= psw(15 downto 12) when have_psw1512 = 1 else "0000";
   pswmf(11) <= psw(11) when have_psw11 = 1 else '0';
   pswmf(10 downto 9) <= "00";
   pswmf(8) <= psw(8) when have_psw8 = 1 else '0';
--   pswmf(7 downto 0) <= psw(7 downto 0);

-- registers

   rbus_raddr <= rbus_cpu_mode & pswmf(11) & rbus_ix;
   with rbus_ix select rbus_data <=
      r7 when "111",
      rbus_o when others;

-- calculate amount of autoincrement or autodecrement
   ir_fpma48 <= '1' when (fps(7) = '1' and ir(11 downto 8) /= "1111") or (fps(7) = '0' and ir(11 downto 8) = "1111") else '0';

   rbus_data_m8 <= rbus_data - 8;
   rbus_data_m4 <= rbus_data - 4;
   rbus_data_m2 <= rbus_data - 2;
   rbus_data_m1 <= rbus_data - 1;
   rbus_data_p8 <= rbus_data + 8;
   rbus_data_p4 <= rbus_data + 4;
   rbus_data_p2 <= rbus_data + 2;
   rbus_data_p1 <= rbus_data + 1;
   rbus_data_mv <= rbus_data_m8 when (ir_fpmaf = '1' and ir_fpma48 = '1' and rbus_ix /= "111")
      else rbus_data_m4 when (ir_fpmaf = '1' and ir_fpma48 = '0' and rbus_ix /= "111")
      else rbus_data_m4 when (ir_fpmai = '1' and fps(6) = '1' and rbus_ix /= "111")
      else rbus_data_m1 when (ir_byte = '1' and rbus_ix(2 downto 1) /= "11")
      else rbus_data_m2;
   rbus_data_pv <= rbus_data_p8 when (ir_fpmaf = '1' and ir_fpma48 = '1' and rbus_ix /= "111")
      else rbus_data_p4 when (ir_fpmaf = '1' and ir_fpma48 = '0' and rbus_ix /= "111")
      else rbus_data_p4 when (ir_fpmai = '1' and fps(6) = '1' and rbus_ix /= "111")
      else rbus_data_p1 when (ir_byte = '1' and rbus_ix(2 downto 1) /= "11")
      else rbus_data_p2;


-- sr1 cq. mmr1 construction

   ir_mf <= '1' when ir_mfpi = '1' or ir_mfpd = '1' else '0';
   ir_mt <= '1' when ir_mtpi = '1' or ir_mtpd = '1' else '0';
   sr1_dst <= sr1_dstd & ir(2 downto 0) when sr1_dstd /= "00000" and ir(2 downto 0) /= "111"
      else "00000000";
   sr1_src <= sr1_srcd & "110" when (ir_mt = '1' or ir_mf = '1' or ir_jsr = '1') and sr1_srcd /= "00000"
      else sr1_srcd & ir(8 downto 6) when sr1_srcd /= "00000" and ir(8 downto 6) /= "111" and ir_dop = '1'
      else "00000000";

   sr1 <= sr1_dst & sr1_src when (ir_dop = '1' or ir_jsr = '1') and sr1_srcd /= "00000"
      else sr1_dst & sr1_src when sr1_dstd = "00000"
      else sr1_src & sr1_dst;

--    sr1 <= sr1_src & sr1_dst when sr1_dstd /= "00000" and sr1_src(2 downto 0) /= sr1_dst(2 downto 0)
--       else "00000000" & (sr1_src(7 downto 3) + sr1_dst(7 downto 3)) & sr1_dst(2 downto 0) when sr1_src(2 downto 0) = sr1_dst(2 downto 0)
--       else "00000000" & sr1_src;

   sr1_p2 <= "00010";
   sr1_pv <= "01000" when (ir_fpmaf = '1' and ir_fpma48 = '1' and rbus_ix /= "111")
      else "00100" when (ir_fpmaf = '1' and ir_fpma48 = '0' and rbus_ix /= "111")
      else "00100" when (ir_fpmai = '1' and fps(6) = '1' and rbus_ix /= "111")
      else "00001" when (ir_byte = '1' and rbus_ix(2 downto 1) /= "11")
      else "00010";
   sr1_m2 <= "11110";
   sr1_mv <= "11000" when (ir_fpmaf = '1' and ir_fpma48 = '1' and rbus_ix /= "111")
      else "11100" when (ir_fpmaf = '1' and ir_fpma48 = '0' and rbus_ix /= "111")
      else "11100" when (ir_fpmai = '1' and fps(6) = '1' and rbus_ix /= "111")
      else "11111" when (ir_byte = '1' and rbus_ix(2 downto 1) /= "11")
      else "11110";


-- cpu model configuration

   have_sob_zkdjbug <= 0;              -- set flag to enable bugfix for zkdj maindec
   with modelcode select have_sob <=
      1 when 3,
      1 when 23 | 24,                  -- kdf11
      1 when 34,
      1 when 35 | 40,
      1 when 44,
      1 when 45 | 50 | 55,
      1 when 60,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_sxt <=
      1 when 3,
      1 when 23 | 24,                  -- kdf11
      1 when 34,
      1 when 35 | 40,
      1 when 44,
      1 when 45 | 50 | 55,
      1 when 60,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_rtt <=
      1 when 3,
      1 when 23 | 24,                  -- kdf11
      1 when 34,
      1 when 35 | 40,
      1 when 44,
      1 when 45 | 50 | 55,
      1 when 60,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_mark <=
      1 when 3,
      1 when 23 | 24,                  -- kdf11
      1 when 34,
      1 when 35 | 40,
      1 when 44,
      1 when 45 | 50 | 55,
      1 when 60,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_xor <=
      1 when 3,
      1 when 23 | 24,                  -- kdf11
      1 when 34,
      1 when 35 | 40,
      1 when 44,
      1 when 45 | 50 | 55,
      1 when 60,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_eis <=
      1 when 23 | 24,                  -- kdf11
      1 when 34,
      1 when 35 | 40,
      1 when 44,
      1 when 45 | 50 | 55,
      1 when 60,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_fpu_default <=
      1 when 23 | 24,                  -- kdf11
      1 when 34,
      1 when 44,
      1 when 45 | 50 | 55,
      1 when 60,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;
   have_fpu <= have_fpu_default when have_fp = 2 else have_fp;

   with modelcode select have_mtps <=
      1 when 3,
      1 when 4,
      1 when 23 | 24,                  -- kdf11
      1 when 34 | 35 | 40,             -- kt11d!
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_mfp <=
      1 when 23 | 24,                  -- kdf11
      1 when 34 | 35 | 40,             -- kt11d!
      1 when 44,
      1 when 45 | 50 | 55,
      1 when 60,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_mpr <=
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_spl <=
      1 when 44,
      1 when 45 | 50 | 55,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_csm <=
      1 when 44,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_red <=
      1 when 35 | 40,
      1 when 45 | 50 | 55,
      1 when 60,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_pswimmediateupdate <=
      0 when 44,                                                     -- observed behaviour, at least from kkab
      0 when 4,
--       0 when 5 | 10,      FIXME FIXME FIXME
--       0 when 15 | 20,
      1 when others;

   with modelcode select have_mmuimmediateabort <=
--      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11                      -- as understood from 2.11BSD, trap.c
      0 when others;

   with modelcode select have_oddimmediateabort <=
      1 when others;                                                 -- found no evidence that this is not actually what all pdps do

   with modelcode select have_psw1512 <=                             -- curr/prev mode bits
      1 when 23 | 24,                  -- kdf11
      1 when 34 | 35 | 40,             -- kt11d!
      1 when 44,
      1 when 45 | 50 | 55,
      1 when 60,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_psw11 <=                               -- general purpose reg set bit
      1 when 45 | 50 | 55,
      1 when 70,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

   with modelcode select have_psw8 <=                                -- FIXME, what is this? 11/44 handbook has this as CIS insn suspension
      1 when 23 | 24,                  -- kdf11
      1 when 44,
      1 when 73 | 83 | 84 | 93 | 94,   -- kdj11
      0 when others;

-- state sequencer
   process(clk)
      variable v_sop : std_logic;
      variable v_dop : std_logic;
      variable v_jmp : std_logic;
      variable v_jsr : std_logic;
      variable v_csm : std_logic;
      variable v_mfpi : std_logic;
      variable v_mfpd : std_logic;
      variable v_mtpi : std_logic;
      variable v_mtpd : std_logic;
      variable v_mtps : std_logic;
      variable v_mfps : std_logic;
      variable v_dopr : std_logic;
      variable v_mpr : std_logic;
      variable v_fpsop1 : std_logic;
      variable v_fpsop2 : std_logic;
      variable v_fpao : std_logic;
   begin
      if clk='1' and clk'event then

--
-- synchronous reset; setup some signals that must have a known value after a reset signal to the cpu
--

         if reset='1' then
            r7 <= init_r7;                                 -- start address
            psw <= init_psw;                               -- initial psw
            rbus_cpu_mode <= "00";                         -- initial rbus access for kernel mode sp
            ir_rtt <= '0';                                 -- no rtt
            ir_wait <= '0';                                -- not in wait state
            ir_halt <= '0';                                -- not halted

            bg7 <= '0';                                    -- no bg7 active
            bg6 <= '0';                                    -- no bg6 active
            bg5 <= '0';                                    -- no bg5 active
            bg4 <= '0';                                    -- no bg4 active
            npg <= '0';                                    -- not granting bus
            if have_red = 1 then
               red_stack_trap <= '0';                      -- not doing a red stack trap
            end if;
            yellow_stack_trap <= '0';                      -- not doing a yellow stack trap

            fps <= x"0000";                                -- initial fp11 status register
            fea <= x"0000";                                -- initial fp11 error address register
            fec <= "0000";                                 -- initial fp11 error code register
            falu_load <= '0';                              -- not doing a load of the fp11 fpao alu

            psw_delayedupdate_even <= '0';                 -- not updating psw after the fact - even address byte part
            psw_delayedupdate_odd <= '0';                  -- not updating psw after the fact - odd address byte

            state <= state_init;                           -- first state in the major state machine after reset
            initcycles <= 7;                               -- setup to stay this many cycles in state_init
            init <= '1';                                   -- send reset signal to outside

            rbus_waddr <= "000000";                        -- select r0 in set 0
            rbus_d <= conv_std_logic_vector(modelcode, 16);          -- set modelcode on rbus
            rbus_we <= '1';                                -- pulse write
         else

--
-- main state machine; setup some default values for signals that are applicable in each state
--

            rbus_we <= '0';                                -- default is not writing to the register file
            fbus_we <= '0';                                -- default is not writing to the fp11 register file
            ifetch <= '0';                                 -- default is not an instruction fetch
            ack_mmuabort <= '0';                           -- default not acknowledging an mmu abort
            ack_mmutrap <= '0';                            -- default not acknowledging an mmu trap
            illhalt <= '0';                                -- no illegal halt
            falu_pending_clear <= '0';                     -- not clearing any pending fp11 interrupt flags

            if yellow_stack_trap_trigger = '1' then        -- do we have a pending yellow stack trap?
               yellow_stack_trap <= '1';                   -- signal to deal with it on the next pass through state_ifetch
            end if;

--
-- aborts; these conditions abort the execution of instructions, no matter in which state the state machine is
--

-- the ir_csm check in here is really a dirty hack - it's to prevent state_csmi from changing r7 when an abort occurs in
-- the final memory reference. It's needed to pass zkdk - but, probably a more generic case exists for anything that changes
-- r7. The problem lies in what happens if r7 is changed, and subsequently an abort occurs - then r7 will be pushed, but
-- with the changed value, which most likely is incorrect - because the memory access was aborted.
-- It may make more sense to generically enable have_mmuimmediateabort, but, then 2.11BSD will not run - it needs the
-- decrement of a stack push to be reflected in the r6, because otherwise it will not grow a stack. Re. the ls -als problem.

            if have_red = 1 and red_stack_trap_trigger = '1' then    -- if the conditions for a red stack trap have tripped
               red_stack_trap <= '1';                      -- set flag
               state <= state_rsv;                         -- start red trap sequence
            elsif mmuabort = '1' and (have_mmuimmediateabort = 1 or ir_csm = '1') then   -- signal from mmu that an access caused an abort. dealing with the abort here suppresses any actions taken by the state itself, re. code at end of state machine
               state <= state_mmuabort;                                                  -- precursor state for mmu abort
               ack_mmuabort <= '1';                                                      -- set acknowledge flag to mmu core
            elsif oddabort = '1' and (have_oddimmediateabort = 1 or ir_csm = '1') then   -- odd abort signal, and need to deal with it and suppress the state machine actions?
               trap_vector <= o"004";                                                    -- set vector
               state <= state_trap;                                                      -- do trap
            else

--
-- state_init; this is the first state after a reset, both the hardware signal as well as the insn. This state will
-- set the init signal towards the 'bus', and stretch it a bit, to give slower things on the bus a bit of extra time
-- to reset in their turn. Since there are not really 'slower' things on the bus, this may not be necessary, but at
-- some point it did help in debugging.
--

               case state is
                  when state_init =>
                     if initcycles = 0 then
                        state <= state_ifetch;
                        init <= '0';
                     else
                        init <= '1';
                        initcycles <= initcycles - 1;
                     end if;

--
-- state_ifetch; all things that need to happen before starting to decode a new instruction. Actually, this state
-- just sets up the memory to produce a new instruction; besides however there is a lot of logic that deduces
-- whether other things, such as handling interrupts need to be serviced before a new instruction can start.
--
-- the if-elsif statement is a priority encoder that determines the relative priority of interrupts.
--

                  when state_ifetch =>
                     rbus_cpu_mode <= pswmf(15 downto 14);                         -- set rbus to the current cpu mode
                     ir_wait <= '0';
                     if have_red = 1 then
                        red_stack_trap <= '0';
                     end if;
                     yellow_stack_trap_inhibit <= '0';
                     if ir_halt = '1' then
                        if run = '1' then                                                -- mostly just to allow passing a halt in a test program
                           state <= state_ifetch;
                           ir_halt <= '0';
                        end if;
                     elsif npr = '1' then                                                -- bus master request
                        state <= state_npg;
                        npg <= '1';
                     elsif mmutrap = '1' then                                            -- mmu trap vector = 250
                        state <= state_mmutrap;
                        ack_mmutrap <= '1';
                     elsif yellow_stack_trap = '1' then
                        yellow_stack_trap <= '0';
                        yellow_stack_trap_inhibit <= '1';
                        trap_vector <= o"004";                                           -- yellow stack trap, vector = 004
                        state <= state_trap;
                     elsif falu_pending_fic = '1' then                                   -- pending fic trap from fp11
                        state <= state_fptrap;
                     elsif falu_pending_fiu = '1' then                                   -- pending fiu trap from fp11
                        state <= state_fptrap;
                     elsif falu_pending_fiv = '1' then                                   -- pending fiv trap from fp11
                        state <= state_fptrap;
                     elsif falu_pending_divz = '1' then                                  -- pending div by zero trap from fp11
                        state <= state_fptrap;
                     elsif pir_in(15) = '1' and unsigned(psw(7 downto 5)) < unsigned'("111") then
                        trap_vector <= o"240";                                           -- pirq, vector = 240
                        state <= state_trap;
                     elsif br7 = '1' and unsigned(psw(7 downto 5)) < unsigned'("111") then
                        state <= state_br7;                                              -- external, level 7, vector determined by device
                        bg7 <= '1';
                     elsif pir_in(14) = '1' and unsigned(psw(7 downto 5)) < unsigned'("110") then
                        trap_vector <= o"240";                                           -- pirq, vector = 240
                        state <= state_trap;
                     elsif br6 = '1' and unsigned(psw(7 downto 5)) < unsigned'("110") then
                        state <= state_br6;                                              -- external, level 6, vector determined by device
                        bg6 <= '1';
                     elsif pir_in(13) = '1' and unsigned(psw(7 downto 5)) < unsigned'("101") then
                        trap_vector <= o"240";                                           -- pirq, vector = 240
                        state <= state_trap;
                     elsif br5 = '1' and unsigned(psw(7 downto 5)) < unsigned'("101") then
                        state <= state_br5;                                              -- external, level 5, vector determined by device
                        bg5 <= '1';
                     elsif pir_in(12) = '1' and unsigned(psw(7 downto 5)) < unsigned'("100") then
                        trap_vector <= o"240";                                           -- pirq, vector = 240
                        state <= state_trap;
                     elsif br4 = '1' and unsigned(psw(7 downto 5)) < unsigned'("100") then
                        state <= state_br4;                                              -- external, level 4, vector determined by device
                        bg4 <= '1';
                     elsif pir_in(11) = '1' and unsigned(psw(7 downto 5)) < unsigned'("011") then
                        trap_vector <= o"240";                                           -- pirq, vector = 240
                        state <= state_trap;
                     elsif pir_in(10) = '1' and unsigned(psw(7 downto 5)) < unsigned'("010") then
                        trap_vector <= o"240";                                           -- pirq, vector = 240
                        state <= state_trap;
                     elsif pir_in(9) = '1' and unsigned(psw(7 downto 5)) < unsigned'("001") then
                        trap_vector <= o"240";                                           -- pirq, vector = 240
                        state <= state_trap;
                     elsif psw(4) = '1' and ir_rtt = '0' then
                        trap_vector <= o"014";                                           -- trace bit, vector = 014
                        state <= state_trap;
                     else
                        if ir_wait = '0' then                                            -- if not in wait mode
                           state <= state_idecode;                                       -- go process an instruction
                           ifetch <= '1';                                                -- set ifetch flag to signal instruction fetch to the outside world
                        else
                           ir_wait <= '1';                                               -- go into wait mode
                        end if;
                        sr1_srcd <= "00000";                                             -- setup mmu sr1 source part
                        sr1_dstd <= "00000";                                             -- setup mmu sr1 destination part
                        sr0_ic <= '1';                                                   -- set mmu sr0 instruction complete flag
                        if modelcode = 44                                                -- fairly sure about this list, see kktb. Seems likely that at least 70 and J11 would also do this variant. However, not sure about F11 or other models
                        or modelcode = 45 or modelcode = 50 or modelcode = 55            -- and least sure of all about 45... but gamble is on this variant, seems 70 is most likely similar
                        or modelcode = 70
                        or modelcode = 73
                        or modelcode = 83
                        or modelcode = 84
                        or modelcode = 93
                        or modelcode = 94
                        then
                           sr2 <= r7;                                                    -- store address of instruction for mmu, sr2/mmr2
                        end if;
                     end if;

                     if have_pswimmediateupdate = 0 then                                 -- some cpu models only effectuate the result of updates to the psw after the insn fetch following the update
                        if psw_delayedupdate_even = '1' then
                           psw(7 downto 5) <= psw_delayedupdate(7 downto 5);             -- T bit can only be set with RTI/RTT instruction
                           if modelcode = 04                                             -- except for 11/04 etc
                           or modelcode = 05 or modelcode = 10
                           or modelcode = 15 or modelcode = 20
                           then
                              psw(4) <= psw_delayedupdate(4);
                           end if;
                           psw(3 downto 0) <= psw_delayedupdate(3 downto 0);
                        end if;
                        if psw_delayedupdate_odd = '1' then
                           psw(15 downto 8) <= psw_delayedupdate(15 downto 8);
                           rbus_cpu_mode <= psw_delayedupdate(15 downto 14);                        -- set rbus to the current cpu mode
                        end if;
                        psw_delayedupdate_even <= '0';
                        psw_delayedupdate_odd <= '0';
                     end if;

--
-- state_idecode; decode the instruction word and determine which path through the states will have to be initiated
--

--
-- first, set defaults for several status flags
--

                  when state_idecode =>
                     r7 <= r7p2;                                     -- increment pc after instruction fetch
                     ir <= datain;                                   -- store instruction word
                     ir_addr <= r7;                                  -- store address of instruction
                     sr0_ic <= '0';                                  -- set instruction not complete in our part of sr0/mmr0
                     if modelcode = 34
                     or modelcode = 23 or modelcode = 24             -- fixme, verify this, but how?
                     then
                        sr2 <= r7;                                   -- store address of instruction for mmu, sr2/mmr2
                     end if;
                     ir_fpmaf <= '0';                                -- not a fp 4- or 8-byte memory access
                     ir_fpmai <= '0';                                -- not a fp integer mode memory access

                     ir_sop <= '0';                                  -- current instruction is not single operand
                     ir_dop <= '0';                                  -- current instruction is not dual operand
                     ir_jmp <= '0';                                  -- current instruction is not jmp
                     ir_jsr <= '0';                                  -- current instruction is not jsr
                     ir_csm <= '0';                                  -- current instruction is not csm
                     ir_mfpi <= '0';                                 -- current instruction is not mfpi
                     ir_mfpd <= '0';                                 -- current instruction is not mfpd
                     ir_mtpi <= '0';                                 -- current instruction is not mtpi
                     ir_mtpd <= '0';                                 -- current instruction is not mtpd
                     ir_mtps <= '0';                                 -- current instruction is not mtps
                     ir_mfps <= '0';                                 -- current instruction is not mfps
                     ir_dopr <= '0';                                 -- current instruction is not dual operand register
                     ir_fpsop1 <= '0';                               -- current instruction is not an fp single operand group 1 insn
                     ir_fpsop2 <= '0';                               -- current instruction is not an fp single operand group 2 insn
                     ir_fpao <= '0';                                 -- current instruction is not an fp accumulator and operand insn
                     ir_facdst <= '0';                               -- current instruction is not an fp accumulator and operand insn in cpu dst format
                     ir_facsrc <= '0';                               -- current instruction is not an fp accumulator and operand insn in cpu src format
                     ir_facfdst <= '0';                              -- current instruction is not an fp accumulator and operand insn in fp11 dst format
                     ir_facfsrc <= '0';                              -- current instruction is not an fp accumulator and operand insn in fp11 src format
                     ir_mpr <= '0';                                  -- current instruction is not a multiprocessor instruction
                     ir_rtt <= '0';                                  -- current instruction is not rtt and no trace trap is being suppressed
                     fbus_fd <= fps(7);                              -- start on the assumption that access to the fp register set follows the fps fd flag
                     falu_pending_clear <= '1';                      -- clear any leftover pending interrupt flags

                     state <= state_illegalop;                       -- set catch value in case we don't decode an insn

--
-- setup variables to classify which of several instruction groups the current instruction is, to make the decode logic easier to follow
--


-- sop - single operand insn

                     if datain(14 downto 9) = "0000101"              -- single operand, word or byte (x05xxx)
                     or datain(14 downto 8) = "00001100"             -- single operand, word or byte (x06xxx), first half of range
                     or datain(15 downto 6) = "0000000011"           -- swab
                     or (datain(15 downto 6) = "0000110111" and have_sxt = 1)            -- sxt
                     then
                        v_sop := '1';
                     else
                        v_sop := '0';
                     end if;


-- dop - double operand insn

                     if datain(14 downto 12) /= "000" and datain(14 downto 12) /= "111" then                 -- dop
                        v_dop := '1';
                     else
                        v_dop := '0';
                     end if;


-- jmp
                     if datain(15 downto 6) = "0000000001" then      -- jmp
                        v_jmp := '1';
                     else
                        v_jmp := '0';
                     end if;


-- jsr

                     if datain(15 downto 9) = "0000100" then         -- jsr
                        v_jsr := '1';
                     else
                        v_jsr := '0';
                     end if;


-- csm

                     if have_csm = 1 and datain(15 downto 6) = "0000111000" then         -- csm
                        v_csm := '1';
                     else
                        v_csm := '0';
                     end if;


-- mfpi/mfpd/mtpi/mtpd

                     if have_mfp = 1 and datain(15 downto 6) = "0000110101" then         -- mfpi
                        v_mfpi := '1';
                     else
                        v_mfpi := '0';
                     end if;
                     if have_mfp = 1 and datain(15 downto 6) = "1000110101" then         -- mfpd
                        v_mfpd := '1';
                     else
                        v_mfpd := '0';
                     end if;
                     if have_mfp = 1 and datain(15 downto 6) = "0000110110" then         -- mtpi
                        v_mtpi := '1';
                     else
                        v_mtpi := '0';
                     end if;
                     if have_mfp = 1 and datain(15 downto 6) = "1000110110" then         -- mtpd
                        v_mtpd := '1';
                     else
                        v_mtpd := '0';
                     end if;


-- mtps/mfps

                     if have_mtps = 1 and datain(15 downto 6) = "1000110100" then        -- mtps
                        v_mtps := '1';
                     else
                        v_mtps := '0';
                     end if;
                     if have_mtps = 1 and datain(15 downto 6) = "1000110111" then        -- mfps
                        v_mfps := '1';
                     else
                        v_mfps := '0';
                     end if;


-- double operand, register - eis/xor

                     if (have_eis = 1 and datain(15 downto 11) = "01110")                -- mul, div, ash, ashc
                     or (have_xor = 1 and datain(15 downto 9) = "0111100") then          -- xor
                        v_dopr := '1';
                     else
                        v_dopr := '0';
                     end if;


-- multiprocessor insns - mpr

                     if have_mpr = 1 and datain(15 downto 7) = "000011101" then          -- tstset/wrtlck
                        v_mpr := '1';
                     else
                        v_mpr := '0';
                     end if;


-- floating point insns - fpu, single op group 1 - those that dont have an ac as operand

                     if datain(15 downto 8) = "11110000"
                     and datain(7 downto 6) /= "00"
                     and have_fpu = 1
                     then                                            -- fp11 single operand group 1: ldfps, stfps, stst
                        v_fpsop1 := '1';
                     else
                        v_fpsop1 := '0';
                     end if;


-- floating point insns - fpu, single op group 2 - those that have an ac as operand

                     if datain(15 downto 8) = "11110001"
                     and have_fpu = 1
                     then                                            -- fp11 single operand group 2: clr(f/d), tst(f/d), abs(f/d), neg(f/d)
                        v_fpsop2 := '1';
                     else
                        v_fpsop2 := '0';
                     end if;


-- floating point insns - fpu, ac and operand group

                     if datain(15 downto 12) = "1111"
                     and datain(11 downto 9) /= "000"
                     and have_fpu = 1
                     then                                            -- fp11 ac and operand group
                        v_fpao := '1';
                     else
                        v_fpao := '0';
                     end if;

--
-- setup signal copies of the variables just set, to be used in other states following idecode
--

                     if v_sop = '1' then
                        ir_sop <= '1';
                     end if;
                     if v_dop = '1' then
                        ir_dop <= '1';
                     end if;
                     if v_jmp = '1' then
                        ir_jmp <= '1';
                     end if;
                     if v_jsr = '1' then
                        ir_jsr <= '1';
                     end if;
                     if v_csm = '1' then
                        ir_csm <= '1';
                     end if;
                     if v_mfpi = '1' then
                        ir_mfpi <= '1';
                     end if;
                     if v_mfpd = '1' then
                        ir_mfpd <= '1';
                     end if;
                     if v_mtpi = '1' then
                        ir_mtpi <= '1';
                     end if;
                     if v_mtpd = '1' then
                        ir_mtpd <= '1';
                     end if;
                     if v_mtps = '1' then
                        ir_mtps <= '1';
                     end if;
                     if v_mfps = '1' then
                        ir_mfps <= '1';
                     end if;
                     if v_dopr = '1' then
                        ir_dopr <= '1';
                     end if;
                     if v_mpr = '1' then
                        ir_mpr <= '1';
                     end if;


-- with the floating point insns, here we also set flags that determine whether 2 or 4 (integer), or  4 or 8 (float/double) byte memory access is needed

                     if v_fpsop1 = '1' then
                        ir_fpsop1 <= '1';
                     end if;
                     if v_fpsop2 = '1' then
                        ir_fpsop2 <= '1';
                        ir_fpmaf <= '1';
                     end if;
                     if v_fpao = '1' then
                        ir_fpao <= '1';
                        ir_facdst <= '0';
                        ir_facsrc <= '0';
                        ir_facfdst <= '0';
                        ir_facfsrc <= '0';
                        if datain(11 downto 9) = "101" then          -- stexp, stc(f|d)(i|l)
                           ir_facdst <= '1';
                           if datain(8) = '1' then                   -- stc(f|d)(i|l)
                              ir_fpmai <= '1';                       -- needs 2 or 4 byte memory access
                           end if;
                        elsif datain(11 downto 8) = "1101" then      -- ldexp
                           ir_facsrc <= '1';
                        elsif datain(11 downto 8) = "1110" then      -- ldc(i|l)(f|d)
                           ir_facsrc <= '1';
                           ir_fpmai <= '1';                          -- needs 2 or 4 byte memory access
                        elsif datain(11 downto 8) = "1000" then      -- st(f|d)
                           ir_facfdst <= '1';
                           ir_fpmaf <= '1';                          -- needs 4 or 8 byte memory access
                        elsif datain(11 downto 8) = "1100" then      -- stc(f|d)
                           ir_facfdst <= '1';
                           ir_fpmaf <= '1';                          -- needs 4 or 8 byte memory access
                        else                                         -- if not any of the other special cases,
                           ir_facfsrc <= '1';                        -- then it should be an fsrc format insn
                           ir_fpmaf <= '1';                          -- needs 4 or 8 byte memory access
                        end if;
                     end if;


-- instruction decoder proper

                     if
                        v_sop = '1'
                        or v_dop = '1'
                        or v_jmp = '1'
                        or v_jsr = '1'
                        or v_csm = '1'
                        or v_mfpi = '1'
                        or v_mfpd = '1'
                        or v_mtpi = '1'
                        or v_mtpd = '1'
                        or v_mtps = '1'
                        or v_mfps = '1'
                        or v_dopr = '1'
                        or v_mpr = '1'
                        or v_fpsop1 = '1'
                        or v_fpsop2 = '1'
                        or v_fpao = '1'
                     then

                        case datain(5 downto 3) is
                           when "000" =>
                              psrcstate <= state_dst0;
                           when "001" =>
                              psrcstate <= state_dst1;
                           when "010" =>
                              psrcstate <= state_dst2;
                           when "011" =>
                              psrcstate <= state_dst3;
                           when "100" =>
                              psrcstate <= state_dst4;
                           when "101" =>
                              psrcstate <= state_dst5;
                           when "110" =>
                              psrcstate <= state_dst6;
                           when "111" =>
                              psrcstate <= state_dst7;
                           when others =>
                              null;
                        end case;

                        if datain(5 downto 3) = "000" then
                           pdststate <= state_store_alu_r;
                        else
                           pdststate <= state_store_alu_p;
                        end if;

                        if v_dop = '1' then
                           case datain(11 downto 9) is
                              when "000" =>
                                 rbus_ix <= datain(8 downto 6);
                                 state <= state_src0;

                              when "001" =>
                                 rbus_ix <= datain(8 downto 6);
                                 state <= state_src1;

                              when "010" =>
                                 rbus_ix <= datain(8 downto 6);
                                 state <= state_src2;

                              when "011" =>
                                 rbus_ix <= datain(8 downto 6);
                                 state <= state_src3;

                              when "100" =>
                                 rbus_ix <= datain(8 downto 6);
                                 state <= state_src4;

                              when "101" =>
                                 rbus_ix <= datain(8 downto 6);
                                 state <= state_src5;

                              when "110" =>
                                 rbus_ix <= datain(8 downto 6);
                                 state <= state_src6;

                              when "111" =>
                                 rbus_ix <= datain(8 downto 6);
                                 state <= state_src7;

                              when others =>
                                 null;
                           end case;
                        else

                           case datain(5 downto 3) is
                              when "000" =>
                                 if v_jmp = '1' then
                                    state <= state_illegalop;                  -- jmp with mode 0 is illegal
                                 elsif v_jsr = '1' then
                                    state <= state_illegalop;                  -- jsr with mode 0 is illegal
                                 elsif have_mfp = 1 and (v_mfpi = '1' or v_mfpd = '1') then
                                    if datain(2 downto 0) = "110" then
                                       rbus_cpu_mode <= psw(13 downto 12);
                                    end if;
                                    rbus_ix <= datain(2 downto 0);
                                    state <= state_dst0;
                                 elsif have_mfp = 1 and (v_mtpi = '1' or v_mtpd = '1') then       -- if mode is 0, it's not very interesting to try and read the register
                                    rbus_ix <= "110";
                                    state <= state_mtp;
                                 elsif have_mpr = 1 and v_mpr = '1' then
                                    state <= state_illegalop;                  -- tstset/wrtlck mode 0 are illegal
                                 elsif have_fpu = 1 and v_fpao = '1' then
                                    if datain(11 downto 9) /= "101"            -- stexp, stc(f/d)(i/l)
                                    and datain(11 downto 8) /= "1101"          -- ldexp
                                    and datain(11 downto 8) /= "1110"          -- ldc(i/l)(f/d)
                                    then
                                       if datain(2 downto 1) = "11" then       -- ac6 and ac7 do not exist
                                          fec <= "0010";
                                          state <= state_fptrap;
                                       else
                                          if datain(11) & datain(9 downto 8) = "100" then
                                             fbus_raddr <= '0' & datain(7 downto 6);               -- fdst insn, need ac
                                          else
                                             fbus_raddr <= datain(2 downto 0);                     -- fsrc insn, need mode 0 fsrc ac
                                          end if;
                                          state <= state_fpao;
                                       end if;
                                    else
                                       fbus_raddr <= '0' & datain(7 downto 6);           -- ldexp, ldc(i/l)(f/d), stexp, stc(f/d)(i/l) get ac
                                       rbus_ix <= datain(2 downto 0);
                                       state <= state_dst0;
                                    end if;
                                 elsif have_fpu = 1 and v_fpsop2 = '1' then
                                    if datain(2 downto 1) = "11" then          -- ac6 and ac7 do not exist
                                       fec <= "0010";
                                       state <= state_fptrap;
                                    else
                                       fbus_raddr <= datain(2 downto 0);                           -- fsrc insn, need mode 0 fsrc ac
                                       state <= state_fpso2;
                                    end if;
                                 else
                                    rbus_ix <= datain(2 downto 0);
                                    state <= state_dst0;
                                 end if;

                              when "001" =>
                                 state <= state_dst1;
                                 rbus_ix <= datain(2 downto 0);

                              when "010" =>
                                 state <= state_dst2;
                                 rbus_ix <= datain(2 downto 0);

                              when "011" =>
                                 state <= state_dst3;
                                 rbus_ix <= datain(2 downto 0);

                              when "100" =>
                                 state <= state_dst4;
                                 rbus_ix <= datain(2 downto 0);

                              when "101" =>
                                 state <= state_dst5;
                                 rbus_ix <= datain(2 downto 0);

                              when "110" =>
                                 state <= state_dst6;
                                 rbus_ix <= datain(2 downto 0);

                              when "111" =>
                                 state <= state_dst7;
                                 rbus_ix <= datain(2 downto 0);

                              when others =>
                                 null;

                           end case;

                           if v_sop = '1' then
                              if datain(5 downto 3) = "000" then
                                 pdststate <= state_store_alu_r;
                              else
                                 pdststate <= state_store_alu_p;
                              end if;
                           elsif v_jmp = '1' then
                              pdststate <= state_jmp;
                           elsif v_jsr = '1' then
                              pdststate <= state_jsr;
                           elsif v_csm = '1' then
                              pdststate <= state_csm;
                           elsif v_mfpi = '1' or v_mfpd = '1' then
                              pdststate <= state_mfp;
                           elsif v_mtpi = '1' or v_mtpd = '1' then
                              rbus_ix <= "110";
                              state <= state_mtp;
                           elsif have_mtps = 1 and v_mtps = '1' then
                              pdststate <= state_mtps;
                           elsif have_mtps = 1 and v_mfps = '1' then
                              if datain(5 downto 3) = "000" then
                                 pdststate <= state_store_alu_r;
                              else
                                 pdststate <= state_store_alu_p;
                              end if;
                           elsif v_dopr = '1' then
                              pdststate <= state_dopr;
                           elsif v_mpr = '1' then
                              if datain(6) = '0' then
                                 pdststate <= state_tstset;
                              else
                                 pdststate <= state_wrtlck;
                              end if;
                           elsif have_fpu = 1 and v_fpsop1 = '1' then
                              case datain(7 downto 6) is
                                 when "01" =>                                            -- ldfps
                                    pdststate <= state_ldfps;

                                 when "10" =>                                            -- stfps
                                    if datain(5 downto 3) = "000" then
                                       pdststate <= state_store_alu_r;
                                    else
                                       pdststate <= state_store_alu_p;
                                    end if;

                                 when "11" =>                                            -- stst
                                    if datain(5 downto 3) = "000" then
                                       pdststate <= state_store_alu_r;
                                    else
                                       pdststate <= state_store_alu_p;
                                    end if;

                                 when others =>
                                    null;
                              end case;
                           elsif have_fpu = 1 and v_fpsop2 = '1' then
                              pdststate <= state_fpso2;                                  -- clr(f|d),tst(f|d),abs(f|d),neg(f|d)
                           elsif have_fpu = 1 and v_fpao = '1' then
                              pdststate <= state_fpao;
                              if datain(11 downto 8) = "1101"                            -- ldexp
                              or datain(11 downto 8) = "1010"                            -- stexp
                              or datain(11) & datain(9 downto 8) = "100"                 -- st(f|d), stc(f|d)(d|f)
                              or datain(11 downto 8) = "1011"                            -- stc(f|d)(i|l)
                              then
                                 fbus_raddr <= '0' & datain(7 downto 6);                 -- needed for st(f|d), stc(f|d)(d|f), ldexp, stexp
                              end if;
                           else
                              pdststate <= state_illegalop;
                           end if;
                        end if;
                     end if;

                     if datain(14 downto 11) = "0000" then                               -- pc and ps change, excl. jsr, emt, trap

                        if datain(15) = '0' and datain(10 downto 8) = "000" then         -- halt group, jmp


-- halt is a complicated case - it is handled differently by most models - it traps either to 4, 10, or to the console, or plainly halts
-- don't have a console yet - so the last two are simple. Still, the mode bit for the J11 came as a surprise - thought I had seen all variants.

                           if datain(7 downto 0) = "00000000" then                       -- halt
                              if pswmf(15 downto 14) /= "00"
                              and (modelcode = 73 or modelcode = 44 or modelcode = 45 or modelcode = 50 or modelcode = 55 or modelcode = 70 or modelcode = 84 or modelcode = 83 or modelcode = 93 or modelcode = 94)
                              then
                                 illhalt <= '1';
                                 trap_vector <= o"004";
                                 state <= state_trap;
                              elsif pswmf(15 downto 14) /= "00"
                              and (modelcode = 23 or modelcode = 24 or modelcode = 34 or modelcode = 35 or modelcode = 40 or modelcode = 60)
                              then
                                 illhalt <= '1';
                                 trap_vector <= o"010";
                                 state <= state_trap;
                              elsif modelcode = 3 or modelcode = 21 or modelcode = 4 or modelcode = 5 or modelcode = 10 or modelcode = 15 or modelcode = 20
                              then
                                 ir_halt <= '1';
                                 state <= state_ifetch;
                              elsif pswmf(15 downto 14) = "00" and cpu_kmillhalt = '1'
                              then
                                 illhalt <= '1';
                                 trap_vector <= o"004";
                                 state <= state_trap;
                              elsif pswmf(15 downto 14) = "00"
                              then
                                 ir_halt <= '1';
                                 state <= state_ifetch;
                              else                                                       -- the default, if we do not know the model of the cpu, is to follow the rule of J11
                                 illhalt <= '1';
                                 trap_vector <= o"004";
                                 state <= state_trap;
                              end if;
                           end if;

                           if datain(7 downto 0) = "00000001" then                       -- wait
                              if pswmf(15 downto 14) = "00" then                                   -- if not in kernel mode, this insn is a noop
                                 ir_wait <= '1';                                                   -- setting this flag will cause ifetch not to switch into idecode until an interrupt has occurred
                              end if;
                              state <= state_ifetch;                                               -- next state is ifetch
                           end if;

                           if datain(7 downto 0) = "00000010" then                       -- rti
                              state <= state_rti;
                              rbus_ix <= "110";
                              if modelcode = 4                                                     -- these models do not have rtt, but allow rti to set the t bit
                              or modelcode = 5 or modelcode = 10
                              or modelcode = 15 or modelcode = 20
                              then
                                 if psw(4) = '0' then
                                    ir_rtt <= '1';
                                 end if;
                              end if;
                           end if;

                           if datain(7 downto 0) = "00000011" then                       -- bpt
                              trap_vector <= o"014";                                               -- bpt, vector = 014
                              state <= state_trap;
                           end if;

                           if datain(7 downto 0) = "00000100" then                       -- iot
                              trap_vector <= o"020";                                               -- iot, vector = 020
                              state <= state_trap;
                           end if;

                           if datain(7 downto 0) = "00000101" then                       -- reset
                              if pswmf(15 downto 14) = "00" then
                                 initcycles <= 7;                                                  -- not as long as the original specs say, but just a bit more than a single cycle
                                 state <= state_init;
                              else
                                 state <= state_ifetch;                                            -- reset is a no-op when not in kernel mode
                              end if;
                           end if;

                           if have_rtt = 1 and datain(7 downto 0) = "00000110" then                -- rtt
                              state <= state_rti;
                              rbus_ix <= "110";
                              ir_rtt <= '1';
                           end if;

--
-- mfpt : the opcode 000007 is used by some diagnostics, including at least fkaa, 11/34 basic inst tst, to trigger an illegal instruction trap
-- also, obviously it should work differently for the appropriate models
--

                           if datain(7 downto 0) = "00000111" then                          -- mfpt
                              if modelcode = 21 then
                                 state <= state_ifetch;
                                 rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & "000";
                                 rbus_d <= '0' & o"00004";                                  -- 4 = T-11
                                 rbus_we <= '1';
                              end if;
                              if modelcode = 23 or modelcode = 24 then
                                 state <= state_ifetch;
                                 rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & "000";
                                 rbus_d <= '0' & o"00003";                                  -- 3 = F-11
                                 rbus_we <= '1';
                              end if;
                              if modelcode = 44 then
                                 state <= state_ifetch;
                                 rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & "000";
                                 rbus_d <= '0' & o"00001";                                  -- 1 = 11/44
                                 rbus_we <= '1';
                              end if;
                              if modelcode = 73
                              or modelcode = 53
                              or modelcode = 83
                              or modelcode = 84
                              or modelcode = 93
                              or modelcode = 94
                              then
                                 state <= state_ifetch;
                                 rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & "000";
                                 rbus_d <= '0' & o"00005";                                  -- 5 = J11
                                 rbus_we <= '1';
                              end if;
                           end if;

                           if datain(7 downto 3) = "10000" then                          -- rts
                              state <= state_rts;
                              rbus_ix <= "110";
                           end if;

                           if have_spl = 1 and datain(7 downto 3) = "10011" then         -- spl
                              if pswmf(15 downto 14) = "00" then
                                 psw(7 downto 5) <= datain(2 downto 0);
                              end if;
                              state <= state_ifetch;
                           end if;

                           if datain(7 downto 4) = "1010" then                           -- clear cc
                              psw(3 downto 0) <= psw(3 downto 0) and (not datain(3 downto 0));
                              state <= state_ifetch;
                           end if;

                           if datain(7 downto 4) = "1011" then                           -- set cc
                              psw(3 downto 0) <= psw(3 downto 0) or datain(3 downto 0);
                              state <= state_ifetch;
                           end if;

                        else                                                             -- branch group


-- the branch insns used to have a separate state to actually do the branch, including calculating the effective address
-- this variant, however notationally inelegant, uses less logic, and less cycles as well.

                           state <= state_ifetch;
                           case datain(15) & datain(10 downto 8) is
                              when "0001" =>                                                       -- br
                                 r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');

                              when "0010" =>                                                       -- bne
                                 if psw(2) = '0' then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "0011" =>                                                       -- beq
                                 if psw(2) = '1' then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "0100" =>                                                       -- bge
                                 if psw(3) = psw(1) then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "0101" =>                                                       -- blt
                                 if psw(3) /= psw(1) then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "0110" =>                                                       -- bgt
                                 if psw(2) = '0' and psw(3) = psw(1) then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "0111" =>                                                       -- ble
                                 if psw(2) = '1' or psw(3) /= psw(1) then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "1000" =>                                                       -- bpl
                                 if psw(3) = '0' then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "1001" =>                                                       -- bmi
                                 if psw(3) = '1' then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "1010" =>                                                       -- bhi
                                 if psw(2) = '0' and psw(0) = '0' then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "1011" =>                                                       -- blos
                                 if psw(2) = '1' or psw(0) = '1' then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "1100" =>                                                       -- bvc
                                 if psw(1) = '0' then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "1101" =>                                                       -- bvs
                                 if psw(1) = '1' then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "1110" =>                                                       -- bhis
                                 if psw(0) = '0' then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when "1111" =>                                                       -- blo
                                 if psw(0) = '1' then
                                    r7 <= r7p2 + (datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7) & datain(7 downto 0) & '0');
                                 end if;

                              when others =>
                                 null;
                           end case;
                        end if;
                     end if;

                     if datain(15 downto 9) = "1000100" then                             -- trap, emt etc
                        if datain(8) = '0' then
                           trap_vector <= o"030";                                                  -- emt, vector = 030
                        else
                           trap_vector <= o"034";                                                  -- trap, vector = 034
                        end if;
                        state <= state_trap;
                     end if;

                     if have_sob = 1 and datain(15 downto 9) = "0111111" then            -- sob
                        rbus_ix <= datain(8 downto 6);
                        state <= state_sob;
                        if have_sob_zkdjbug = 1 and (modelcode = 73 or modelcode = 83 or modelcode = 84 or modelcode = 93 or modelcode = 94) then
                           sob_slowdown <= 255;
                        end if;
                     end if;

                     if have_mark = 1 and datain(15 downto 6) = "0000110100" then        -- mark
                        rbus_waddr <= pswmf(15 downto 14) & "0110";
                        rbus_d <= unsigned(r7p2) + unsigned(datain(5 downto 0) & '0');
                        rbus_we <= '1';
                        rbus_ix <= "101";
                        state <= state_mark;
                     end if;

                     if have_fpu = 1 and datain(15 downto 6) = "1111000000" then                   -- fp11 operate group
                        case datain(5 downto 0) is
                           when "000000" =>                                                        -- cfcc
                              psw(3 downto 0) <= fps(3 downto 0);
                              state <= state_ifetch;

                           when "000001" =>                                                        -- setf
                              fps(7) <= '0';
                              state <= state_ifetch;

                           when "000010" =>                                                        -- seti
                              fps(6) <= '0';
                              state <= state_ifetch;

                           when "001001" =>                                                        -- setd
                              fps(7) <= '1';
                              state <= state_ifetch;

                           when "001010" =>                                                        -- setl
                              fps(6) <= '1';
                              state <= state_ifetch;

                           when others =>
                              if modelcode = 45 or modelcode = 50 or modelcode = 55 or modelcode = 70 then
                                 if datain(5 downto 3) = "000" then
                                    state <= state_ifetch;                                         -- allow 45/55/70 specific insns ldub, ldsc, stao, mrs, stq0 not to cause a trap
                                 else
                                    fec <= "0010";                                                 -- unknown insn, start trap seq
                                    state <= state_fptrap;
                                 end if;
                              else
                                 fec <= "0010";                                                    -- unknown insn, start trap seq
                                 state <= state_fptrap;
                              end if;

                        end case;
                     end if;


--
-- illegal op : used for both catching unknown opcodes and for illegal operands to jmp and jsr, also tstset/wrtlck
--

                  when state_illegalop =>
--
-- vector for illegal operand, register mode jmp or jsr
-- manuals seem to incorrectly list what vector should be used; systems use either 004 or 010.
-- for instance, EK-DCJ11-UG-PRE_J11ug_Oct83.pdf pg. C-7 item 5
-- however, diagnostics reveal the following:
-- 11/34 - 004, source AC-8045D-MC_CFKABD0-1134-Traps-Tst_Apr77.pdf
-- 11/44 - 010, confirmed by running kkab
-- 11/45 - 010, source PDP1145_Handbook_1973.pdf, pg. 230
-- J11 - 010, source 0095_CZKDJB0_KDJ11.pdf, seq 166/K13
--

                     if have_fpu = 1 and ir(15 downto 12) = "1111" then
                        fec <= "0010";
                        state <= state_fptrap;
                     elsif ir_jmp = '1' or ir_jsr = '1' then
                        if modelcode = 34
                        or modelcode = 4                                                 -- verified 04 behaviour by running gkab
                        then
                           trap_vector <= o"004";
                        else
                           trap_vector <= o"010";
                        end if;
                        state <= state_trap;
                     else
                        trap_vector <= o"010";                                       -- illegal op, vector = 010
                        state <= state_trap;
                     end if;


--
-- jmp : move dest addr as computed into r7
--

                  when state_jmp =>
                     r7 <= dest_addr;
                     state <= state_ifetch;

--
-- npg : non-processor grant, ie. allow the bus to another bus master while the npr signal is active
--

                  when state_npg =>
                     if npr = '0' then
                        state <= state_ifetch;
                        npg <= '0';
                     else
                        npg <= '1';
                     end if;

--
-- mmuabort : the mmu requests an abort of the current instruction, potentially halfway trough an instruction
--

                  when state_mmuabort =>
                     if have_psw1512 = 1 and mmuabort = '0' then
                        ack_mmuabort <= '0';
                        trap_vector <= o"250";                                 -- mmu, vector = 250
                        state <= state_trap;
                     end if;

--
-- mmutrap : the mmu has requested a trap after the current instruction has finished; this trap will now be initiated
--

                  when state_mmutrap =>
                     if have_psw1512 = 1 and mmutrap = '0' then
                        ack_mmutrap <= '0';
                        trap_vector <= o"250";                                 -- mmu, vector = 250
                        state <= state_trap;
                     end if;


-- bus request aka interrupt, prio level 7; handle br7/bg7 signals and initiate trap

                  when state_br7 =>
                     if br7 = '0' then
                        bg7 <= '0';
                        trap_vector <= int_vector7;
                        state <= state_trap;
                        if modelcode = 45 or modelcode = 50 or modelcode = 55
                        or modelcode = 70 then
                           sr2 <= "0000000" & int_vector7;                     -- set trap vector in sr2
                           sr0_ic <= '0';                                      -- make sure to flag instruction not complete
                        end if;
                     end if;


-- bus request, prio level 6; handle br6/bg6 signals and initiate trap

                  when state_br6 =>
                     if br6 = '0' then
                        bg6 <= '0';
                        trap_vector <= int_vector6;
                        state <= state_trap;
                        if modelcode = 45 or modelcode = 50 or modelcode = 55
                        or modelcode = 70 then
                           sr2 <= "0000000" & int_vector6;                     -- set trap vector in sr2
                           sr0_ic <= '0';                                      -- make sure to flag instruction not complete
                        end if;
                     end if;


-- bus request, prio level 5; handle br5/bg5 signals and initiate trap

                  when state_br5 =>
                     if br5 = '0' then
                        bg5 <= '0';
                        trap_vector <= int_vector5;
                        state <= state_trap;
                        if modelcode = 45 or modelcode = 50 or modelcode = 55
                        or modelcode = 70 then
                           sr2 <= "0000000" & int_vector5;                     -- set trap vector in sr2
                           sr0_ic <= '0';                                      -- make sure to flag instruction not complete
                        end if;
                     end if;


-- bus request, prio level 4; handle br4/bg4 signals and initiate trap

                  when state_br4 =>
                     if br4 = '0' then
                        bg4 <= '0';
                        trap_vector <= int_vector4;
                        state <= state_trap;
                        if modelcode = 45 or modelcode = 50 or modelcode = 55
                        or modelcode = 70 then
                           sr2 <= "0000000" & int_vector4;                     -- set trap vector in sr2
                           sr0_ic <= '0';                                      -- make sure to flag instruction not complete
                        end if;
                     end if;


-- floating point error trap : precursor state handles fid bit in fps and contents of fea, and pending conditions signalled by the floating point alu

                  when state_fptrap =>
                     if falu_pending_fic = '1' then                            -- note the order... if more than one bit is set, the order of precedence is v, u, c
                        fec <= "0110";
                     end if;
                     if falu_pending_fiu = '1' then
                        fec <= "1010";
                     end if;
                     if falu_pending_fiv = '1' then
                        fec <= "1000";
                     end if;
                     if falu_pending_divz = '1' then
                        fec <= "0100";
                     end if;
                     fea <= ir_addr;
                     fps(15) <= '1';
                     if fps(14) = '0' then
                        trap_vector <= o"244";                                 -- floating point trap, vector = 244
                        state <= state_trap;
                     else                                                      -- wait for pending interrupt flags to clear before continuing
                        if falu_pending_fic = '0' and falu_pending_fiu = '0' and falu_pending_fiv = '0' and falu_pending_divz = '0' then
                           state <= state_ifetch;
                        end if;
                     end if;
                     falu_pending_clear <= '1';

--
-- rsv: red stack trap
-- implemented by setting the kernel sp to 4, and then starting a trap
-- the trap states will then decrement the sp, and save psw and r7 in
-- the right locations.
-- this approach is not necessarily correct, but passes czkdjb0
-- and it is also as described in EK-KDJ1B-UG_KDJ11-B_Nov86.pdf
-- in chapter 1.3.2, page 1-10
-- this takes some extra attention when sequencing through the
-- trap code to select kernel sp, though. Need to ignore whatever
-- is set in loc. 6
--
-- some extra explanation is probably needed for the copying of
-- psw from temp_psw. The reason is as follows: a red trap by
-- definition is a result from an earlier trap gone wrong. In the
-- first step of a normal trap, the psw is copied into temp_psw.
-- State_rsv restores that original psw into the real psw - then
-- starts a new trap.
--

                  when state_rsv =>
                     if have_red = 1 then
                        psw <= temp_psw;
                        rbus_waddr <= "00" & "0110";
                        rbus_d <= x"0004";
                        rbus_we <= '1';
                        trap_vector <= o"004";                                              -- red stack trap, vector = 004
                        state <= state_trap;
                     end if;


-- trap: start a trap sequence, trap through trapf

                  when state_trap =>
                     temp_psw <= psw;
                     psw(15 downto 14) <= "00";                      -- initial, we'll load the real mode to select the correct stack by in the next step
                     psw(13 downto 12) <= pswmf(15 downto 14);
                     rbus_cpu_mode <= "00";                          -- force rbus cpu mode to 00 - this is output to the mmu to select the par/pdr set
                     state <= state_trapa;

                  when state_trapa =>
                     rbus_ix <= "110";
                     if have_red = 1 and red_stack_trap = '1' then
                        rbus_cpu_mode <= "00";
                     else
                        rbus_cpu_mode <= datain(15 downto 14);
                     end if;
                     psw(15 downto 14) <= datain(15 downto 14);
                     psw(11 downto 0) <= datain(11 downto 0);
                     state <= state_trapb;

                  when state_trapb =>
                     state <= state_trapc;

                  when state_trapc =>
                     if have_red = 1 and red_stack_trap = '1' then
                        rbus_waddr <= "00" & "0110";
                     else
                        rbus_waddr <= pswmf(15 downto 14) & "0110";
                     end if;
                     rbus_d <= rbus_data_m2;
                     rbus_we <= '1';
                     state <= state_trapw;

                  when state_trapw =>
                     state <= state_trapd;

                  when state_trapd =>
                     if have_red = 1 and red_stack_trap = '1' then
                        rbus_waddr <= "00" & "0110";
                     else
                        rbus_waddr <= pswmf(15 downto 14) & "0110";
                     end if;
                     rbus_d <= rbus_data_m2;
                     rbus_we <= '1';
                     state <= state_trape;

                  when state_trape =>
                     rbus_cpu_mode <= "00";                          -- force rbus cpu mode to 00 - this is output to the mmu to select the par/pdr set
                     state <= state_trapf;

                  when state_trapf =>
                     r7 <= datain;
                     state <= state_ifetch;


-- rti: start a rti sequence, rti through rtib

                  when state_rti =>
                     state <= state_rtia;
                     rbus_waddr <= pswmf(15 downto 14) & "0110";
                     rbus_d <= rbus_data_p2;
                     rbus_we <= '1';

                  when state_rtia =>
                     state <= state_rtib;
                     r7 <= datain;

                  when state_rtib =>
                     state <= state_ifetch;
                     rbus_waddr <= pswmf(15 downto 14) & "0110";
                     rbus_d <= rbus_data_p2;
                     rbus_we <= '1';
                     if modelcode = 4 then                          -- FIXME, probably other models as well - 5, 10, 15, 20? 04 behaviour tested with gkab
                        psw_delayedupdate <= datain;
                        psw_delayedupdate_even <= '1';
                        psw_delayedupdate_odd <= '1';
                     else
                        psw(4 downto 0) <= datain(4 downto 0);
                        if pswmf(15 downto 14) = "00" then
                           psw(7 downto 5) <= datain(7 downto 5);
                        end if;
                        psw(10 downto 8) <= datain(10 downto 8);
                        if pswmf(15 downto 14) = "00" then
                           psw(15 downto 11) <= datain(15 downto 11);
                        else
                           psw(15 downto 11) <= datain(15 downto 11) or pswmf(15 downto 11);
                        end if;
                     end if;


-- csm : process csm insn

                  when state_csm =>
                     if have_csm = 1 and sr3csmenable = '1' and psw(15 downto 14) /= "00" then
                        temp_psw(15 downto 4) <= psw(15 downto 4);
                        temp_psw(3 downto 0) <= "0000";
                        psw(15 downto 14) <= "01";
                        psw(13 downto 12) <= psw(15 downto 14);
                        psw(4) <= '0';
                        rbus_ix <= "110";
                        rbus_cpu_mode <= psw(15 downto 14);
                        state <= state_csma;
                     else
                        state <= state_illegalop;
                     end if;

                  when state_csma =>
                     rbus_waddr <= "01" & "0110";                              -- address super sp
                     rbus_d <= rbus_data;
                     rbus_we <= '1';
                     state <= state_csmb;

                  when state_csmb =>
                     rbus_cpu_mode <= "01";
                     state <= state_csmc;

                  when state_csmc =>                                           -- push temp_psw
                     rbus_waddr <= "01" & "0110";
                     rbus_d <= rbus_data_m2;
                     rbus_we <= '1';
                     state <= state_csmd;

                  when state_csmd =>
                     state <= state_csme;

                  when state_csme =>                                           -- push pc
                     rbus_waddr <= "01" & "0110";
                     rbus_d <= rbus_data_m2;
                     rbus_we <= '1';
                     state <= state_csmf;

                  when state_csmf =>
                     state <= state_csmg;

                  when state_csmg =>                                           -- push alu_output
                     rbus_waddr <= "01" & "0110";
                     rbus_d <= rbus_data_m2;
                     rbus_we <= '1';
                     state <= state_csmh;

                  when state_csmh =>
                     trap_vector <= o"010";                                    -- csm loads r7 from vector = 010, but from supervisor I-space
                     state <= state_csmi;

                  when state_csmi =>
                     r7 <= datain;
                     state <= state_ifetch;


-- sob: deal with sob instruction

                  when state_sob =>
                     if have_sob_zkdjbug = 1 and (modelcode = 73 or modelcode = 83 or modelcode = 84 or modelcode = 93 or modelcode = 94) then
                        if sob_slowdown = 0 then
                           rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 6);
                           rbus_d <= rbus_data_m1;
                           rbus_we <= '1';
                           if rbus_data_m1 = "0000000000000000" then
                              state <= state_ifetch;
                           else
                              r7 <= r7 - (ir(5 downto 0) & '0');
                              state <= state_ifetch;
                           end if;
                        else
                           sob_slowdown <= sob_slowdown - 1;
                        end if;
                     else
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 6);
                        rbus_d <= rbus_data_m1;
                        rbus_we <= '1';
                        if rbus_data_m1 = "0000000000000000" then
                           state <= state_ifetch;
                        else
                           r7 <= r7 - (ir(5 downto 0) & '0');
                           state <= state_ifetch;
                        end if;
                     end if;


-- move from previous i/d

                  when state_mfp =>
                     rbus_ix <= "110";
                     state <= state_mfpa;

                  when state_mfpa =>
                     dest_addr <= addr;
                     state <= state_store_alu_p;
                     sr1_srcd <= sr1_m2;                                       -- it is the dest, actually - but that field is already used
                     rbus_waddr <= psw(15 downto 14) & '0' & "110";
                     rbus_d <= rbus_data_m2;
                     rbus_we <= '1';


-- move to previous i/d

                  when state_mtp =>
                     sr1_srcd <= sr1_p2;
                     rbus_waddr <= psw(15 downto 14) & '0' & "110";
                     rbus_d <= rbus_data_p2;
                     rbus_we <= '1';
                     state <= state_mtpa;

                  when state_mtpa =>
                     alus_input <= datain;
                     rbus_ix <= ir(2 downto 0);
                     state <= psrcstate;


-- mtps insn - move to ps

                  when state_mtps =>
                     if have_mtps = 1 then
                        if psw(15 downto 14) = "00" then
                           psw(7 downto 5) <= alu_output(7 downto 5);
                           psw(3 downto 0) <= alu_output(3 downto 0);
                        else
                           psw(3 downto 0) <= alu_output(3 downto 0);
                        end if;
                        state <= state_ifetch;
                     end if;


-- double operand,register instruction states dopr through doprb
-- these are for the EIS instruction set, ie mul, div, ash, ashc, xor
-- dopr is a precursor state, used to pick up the second operand from
-- the register file

                  when state_dopr =>
                     rbus_ix <= ir(8 downto 6);
                     state <= state_dopra;


-- dopra: setup the eis_sequencer to handle microstates for the eis alu
-- and dispatch to the states needed for each insn; also setup to read
-- ternary operand from the register file

                  when state_dopra =>
                     alus_input <= rbus_data;
                     rbus_ix <= ir(8 downto 7) & '1';
                     if ir(11 downto 9) = "000" then
                        eis_sequencer <= "11111";
                        state <= state_mul;
                     elsif ir(11 downto 9) = "010" then
                        eis_sequencer <= "11111";
                        state <= state_ash;
                     elsif ir(11 downto 9) = "100" then
                        state <= state_xor;
                     else
                        state <= state_doprb;
                     end if;


-- doprb: read ternary operand from the rbus, setup the
-- eis_sequencer for div and ashc

                  when state_doprb =>
                     alut_input <= rbus_data;
                     if ir (11 downto 9) = "001" then
                        if ir(6) = '1' then                   -- illegal, R must be even acc. EK-KDJ1B-UG_KDJ11-B_Nov86.pdf, pg. 9-31, and PDP1145_Handbook_1973.pdf, pg. 71
                           state <= state_ifetch;             -- FIXME, does it make sense to go back to ifetch from here if the ir was illegal?
                           psw(3 downto 0) <= "0010";         -- not sure if this makes sense, but CZKDJB0 won't pass without
                        else
                           eis_sequencer <= "10000";
                           state <= state_div;
                        end if;
                     elsif ir(11 downto 9) = "011" then
                        eis_sequencer <= "11111";
                        state <= state_ashc;
                     else
                        state <= state_illegalop;             -- should not be possible
                     end if;


-- mul through mulb: handle mul insn

                  when state_mul =>
                     if eis_sequencer = "00001" then
                        state <= state_mula;
                     end if;
                     eis_sequencer <= eis_sequencer + 1;

                  when state_mula =>
                     if ir(8 downto 6) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 6);
                        rbus_d <= eis_output;
                        rbus_we <= '1';
                     else
                        r7 <= eis_output;
                     end if;
                     state <= state_mulb;

                  when state_mulb =>
                     if ir(8 downto 7) /= "11" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 7) & '1';
                        rbus_d <= eis_output32;
                        rbus_we <= '1';
                     else
                        r7 <= eis_output32;
                     end if;
                     psw(3 downto 0) <= eis_psw;
                     state <= state_ifetch;


-- div through divb: handle div insn

                  when state_div =>
                     if eis_sequencer = "11111" then
                        state <= state_diva;
                     end if;
                     eis_sequencer <= eis_sequencer - 1;

                  when state_diva =>
                     if eis_psw(1 downto 0) = "00" then
                        if ir(8 downto 6) /= "111" then
                           rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 6);
                           rbus_d <= eis_output;
                           rbus_we <= '1';
                        else
                           r7 <= eis_output;
                        end if;
                     end if;
                     state <= state_divb;

                  when state_divb =>
                     if eis_psw(1 downto 0) = "00" then
                        if ir(8 downto 7) /= "11" then
                           rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 7) & '1';
                           rbus_d <= eis_output32;
                           rbus_we <= '1';
                        else
                           r7 <= eis_output32;
                        end if;
                     end if;
                     psw(3 downto 0) <= eis_psw;
                     state <= state_ifetch;


-- ash through ashb: handle ash insn

                  when state_ash =>
                     if eis_sequencer = "11111" then
                        eis_sequencer <= eis_sequencer + 1;
                     else
                        if eis_flag2 = '1' then
                           state <= state_ashb;
                        end if;
                     end if;

                  when state_ashb =>
                     if ir(8 downto 6) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 6);
                        rbus_d <= eis_output;
                        rbus_we <= '1';
                     else
                        r7 <= eis_output;
                     end if;
                     psw(3 downto 0) <= eis_psw;
                     state <= state_ifetch;


-- ashc through ashe: handle ashc insn

                  when state_ashc =>
                     if eis_sequencer = "11111" then
                        eis_sequencer <= eis_sequencer + 1;
                     else
                        if eis_flag2 = '1' then
                           state <= state_ashd;
                        end if;
                     end if;

                  when state_ashd =>
                     if ir(8 downto 6) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 6);
                        rbus_d <= eis_output;
                        rbus_we <= '1';
                     else
                        r7 <= eis_output;
                     end if;
                     state <= state_ashe;

                  when state_ashe =>
                     if ir(8 downto 7) /= "11" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 7) & '1';
                        rbus_d <= eis_output32;
                        rbus_we <= '1';
                     else
                        r7 <= eis_output32;
                     end if;
                     psw(3 downto 0) <= eis_psw;
                     state <= state_ifetch;


-- xor: dispatch to state that stores result

                  when state_xor =>
                     if ir(5 downto 3) = "000" then
                        state <= state_store_alu_r;
                     else
                        state <= state_store_alu_p;
                     end if;


-- ldfps - load fpu state

                  when state_ldfps =>
                     fps <= alu_output;
                     state <= state_ifetch;


-- stst - store fpu fec and fea

                  when state_stststore =>
                     state <= state_ifetch;


-- dispatch insn in the fpso2 group - unless the insn is a clr(f|d), go into the
-- states that read an fp src operand

                  when state_fpso2 =>
                     addr_indirect <= dest_addr;
                     if ir(5 downto 3) /= "000" then
                        if ir(7 downto 6) = "00" then                  -- clr(f|d)
                           state <= state_fprun;                       -- don't need to read for clear
                        else
                           state <= state_fpr1;
                        end if;
                     else
                        falu_input <= fbus_o;                          -- fbus read already done in ifetch for mode 0
                        state <= state_fprun;
                     end if;


-- dispatch insn groups for the fp acc and operand format, in
-- all forms - fsrc, fsdt, src, dst, as signalled by the main
-- state machine - and cycle into the appropriate state to
-- handle the core accesses that are required to load the
-- operands, either in f|d, or i|l format.

                  when state_fpao =>
                     if ir(5 downto 3) /= "000" then
                        addr_indirect <= dest_addr;
                        if ir_facfsrc = '1' then
                           fbus_raddr <= '0' & ir(7 downto 6);
                           state <= state_fpr1;
                        elsif ir_facfdst = '1' then
                           falu_input <= fbus_o;
                           state <= state_fprun;
                        elsif ir_facdst = '1' then
                           falu_input <= fbus_o;
                           state <= state_fprun;
                        elsif ir_facsrc = '1' then
                           falu_input <= fbus_o;
                           state <= state_fpir1;
                        else
                           -- FIXME, go into some cpu error state?
                        end if;
                     else                                         -- mode 0, so input from register!!!
                        if ir_facfsrc = '1' then
                           falu_input <= fbus_o;
                           fbus_raddr <= '0' & ir(7 downto 6);
                           state <= state_fprun;
                        elsif ir_facfdst = '1' then
                           falu_input <= fbus_o;
                           state <= state_fprun;
                        elsif ir_facdst = '1' then
                           falu_input <= fbus_o;
                           state <= state_fprun;
                        elsif ir_facsrc = '1' then
                           if ir(8) = '1' then                      -- ldexp
                              falu_input <= fbus_o;
                              falus_input(55 downto 40) <= rbus_data;
                           else                                     -- ldc(i|l)(f|d)
                              falu_input(55 downto 40) <= "0000000000000000";
                              falu_input(39 downto 24) <= rbus_data;
                              falu_input(23 downto 0) <= "000000000000000000000000";
                           end if;
                           state <= state_fprun;                  -- FIXME, what about long data?
                        end if;
                     end if;

                  when state_fpir1 =>
                     if ir(8) = '1' then                            -- state is reachable only for ldexp and ldc(i|l)(f|d); ir(8) = 1 means ldexp
                        state <= state_fprun;                       -- ldexp
                        falus_input(55 downto 40) <= datain;        -- FIXME, it does not really make sense to put the input value here?
                     else
                        falu_input(23 downto 0) <= "000000000000000000000000";
                        if fps(6) = '1' and ir(5 downto 0) /= "010111" then                -- ldc(i|l)(f|d) mode 2, reg 7 : then only 1 word to be read
                           falu_input(55 downto 40) <= datain;
                           addr_indirect <= addr_indirect + 2;
                           state <= state_fpir2;
                        else
                           falu_input(55 downto 40) <= "0000000000000000";
                           falu_input(39 downto 24) <= datain;
                           state <= state_fprun;
                        end if;
                     end if;

                  when state_fpir2 =>
                     falu_input(39 downto 24) <= datain;
                     state <= state_fprun;

                  when state_fpr1 =>
                     if datain(15 downto 7) = "100000000" and fps(11) = '1' and fps(14) = '0' then        -- do we need to trigger the fiuv trap for -0, undefined variable?
                        state <= state_fptrap;                       -- cause trap
                        fps(15) <= '1';                              -- set error flag
                        fec <= "1100";                               -- fiuv code
                     else
                        if datain(15 downto 7) = "100000000" and fps(11) = '1' then                       -- if interrupts are disabled, we still signal the error... FIXME, is this required at all?
                           fps(15) <= '1';                              -- set error flag
                           fec <= "1100";                               -- fiuv code
                        end if;
                        falu_input(63 downto 48) <= datain;
                        addr_indirect <= addr_indirect + 2;
                        if ir(5 downto 0) = "010111" then            -- mode 2, reg 7 : then only 1 word to be loaded
                           falu_input(47 downto 0) <= "000000000000000000000000000000000000000000000000";
                           state <= state_fprun;
                        else
                           state <= state_fpr2;
                        end if;
                     end if;

                  when state_fpr2 =>
                     falu_input(47 downto 32) <= datain;
                     if fps(7) = '1'                                           -- if mode is d
                     or (fps(7) = '0' and ir(11 downto 8) = "1111")            -- or if mode is f, and the insn is ldcfd
                     then                                                      -- then we need to read the next two words
                        state <= state_fpr3;
                        addr_indirect <= addr_indirect + 2;
                     else
                        falu_input(31 downto 0) <= "00000000000000000000000000000000";   -- if mode is f, insn is not ldcfd, zero out the low 32 bits of the input
                        state <= state_fprun;
                     end if;

                  when state_fpr3 =>
                     falu_input(31 downto 16) <= datain;
                     addr_indirect <= addr_indirect + 2;
                     state <= state_fpr4;

                  when state_fpr4 =>
                     falu_input(15 downto 0) <= datain;
                     state <= state_fprun;

                  when state_fpwr =>
                     fbus_d <= falu_output;
                     fps(4) <= '0';                                            -- this appears to be needed to pass zkdl; always setting the bit to zero makes one of the other tests complain.
                     fps(3 downto 0) <= falu_fps;
                     fbus_waddr <= '0' & ir(7 downto 6);
                     fbus_we <= '1';
                     state <= state_ifetch;
                     if ir(11 downto 8) = "0011" and ir(6) = '0' then          -- mod with even ac, need to store ac+1
                        state <= state_fpwr1;
                     end if;

                  when state_fpwr1 =>
                     state <= state_fpwr2;

                  when state_fpwr2 =>
                     fbus_d <= falu_output2;
                     fbus_waddr <= '0' & ir(7) & '1';
                     fbus_we <= '1';
                     state <= state_ifetch;

                  when state_fpd0 =>
                     fps(4) <= '0';                                            -- this appears to be needed to pass zkdl; always setting the bit to zero makes one of the other tests complain.
                     fps(3 downto 0) <= falu_fps;
                     if ir_fpsop2 = '1' and ir(7 downto 6) = "01" then                             -- tst(f/d)
                        state <= state_ifetch;
                     elsif ir(2 downto 1) /= "11" then
                        fbus_d <= falu_output;
                        fbus_waddr <= ir(2 downto 0);
                        fbus_we <= '1';
                     end if;
                     state <= state_ifetch;

                  when state_fpiwr =>
                     if ir(2 downto 0) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(2 downto 0);
                        rbus_d <= falu_output(63 downto 48);
                        rbus_we <= '1';
                     else
                        r7 <= falu_output(63 downto 48);       -- FIXME, check what real pdp's do?
                     end if;
                     fps(4) <= '0';                                            -- this appears to be needed to pass zkdl; always setting the bit to zero makes one of the other tests complain.
                     fps(3 downto 0) <= falu_fps;
                     psw(3 downto 0) <= falu_fps;
                     state <= state_ifetch;

                  when state_fpiww =>
                     addr_indirect <= dest_addr;
                     fps(4) <= '0';                                            -- this appears to be needed to pass zkdl; always setting the bit to zero makes one of the other tests complain.
                     fps(3 downto 0) <= falu_fps;
                     psw(3 downto 0) <= falu_fps;
                     state <= state_fpiw1;

                  when state_fpiw1 =>
                     if ir(5 downto 0) = "010111"                    -- stc(f|d)(i|l) mode 2, reg 7 : then only 1 word to be written
                     or fps(6) = '0'                                 -- stc(f|d)(i|l), short integer mode
                     or ir(11 downto 8) = "1010"                     -- stexp insn
                     then
                        state <= state_ifetch;
                     else
                        addr_indirect <= addr_indirect + 2;
                        state <= state_fpiw2;
                     end if;

                  when state_fpiw2 =>
                     state <= state_ifetch;

                  when state_fpww =>
                     addr_indirect <= dest_addr;
                     fps(4) <= '0';                                            -- this appears to be needed to pass zkdl; always setting the bit to zero makes one of the other tests complain.
                     fps(3 downto 0) <= falu_fps;
                     if ir_fpsop2 = '1' and ir(7 downto 6) = "01" then                             -- tst(f/d)
                        state <= state_ifetch;
                     else
                        state <= state_fpw1;
                     end if;

                  when state_fpw1 =>
                     if ir(5 downto 0) = "010111" then               -- mode 2, reg 7 : then only 1 word to be written
                        state <= state_ifetch;
                     else
                        addr_indirect <= addr_indirect + 2;
                        state <= state_fpw2;
                     end if;

                  when state_fpw2 =>
                     if (fps(7) = '1' and ir(11 downto 8) /= "1100")         -- reverse sense of fps D bit when insn is stc(f|d)(d|f)
                     or (fps(7) = '0' and ir(11 downto 8) = "1100")
                     then
                        state <= state_fpw3;
                        addr_indirect <= addr_indirect + 2;
                     else
                        state <= state_ifetch;
                     end if;

                  when state_fpw3 =>
                     addr_indirect <= addr_indirect + 2;
                     state <= state_fpw4;

                  when state_fpw4 =>
                     state <= state_ifetch;

                  when state_fprun =>
                     if ir_fpao = '1' then
                        if ir_facfsrc = '1' then
                           falus_input <= fbus_o;
                        end if;
                        state <= state_fprunao;
                        falu_load <= '1';
                        falu_state <= 0;
                     elsif ir_fpsop2 = '1' then
                        if ir(5 downto 3) = "000" then
                           state <= state_fpd0;
                        else
                           state <= state_fpww;
                        end if;
                     else
                        state <= state_ifetch;            -- FIXME, needed?
                     end if;

                  when state_fprunao =>
                     falu_state <= falu_state + 1;
                     falu_load <= '0';
                     if falu_state > 160 then              -- FIXME, this may prevent hangs. Why?
                        state <= state_ifetch;             -- FIXME, error!
                     end if;
                     if falu_done = '1' then
                        falu_state <= 0;
                        case ir(11 downto 8) is

                           when "1000" =>                                      -- st(f|d)
                              if ir(5 downto 3) = "000" then
                                 state <= state_fpd0;
                              else
                                 state <= state_fpww;
                              end if;

                           when "1010" =>                                      -- stexp
                              if ir(5 downto 3) = "000" then
                                 state <= state_fpiwr;
                              else
                                 state <= state_fpiww;
                              end if;

                           when "1011" =>                                      -- stc(f|d)(i|l)
                              if ir(5 downto 3) = "000" then
                                 state <= state_fpiwr;
                              else
                                 state <= state_fpiww;
                              end if;

                           when "1100" =>                                      -- stc(f|d)(d|f)
                              fbus_fd <= '1';                                            -- enable full access to fp register bank
                              if ir(5 downto 3) = "000" then
                                 state <= state_fpd0;
                              else
                                 state <= state_fpww;
                              end if;

                           when "1111" =>                                      -- ldc(d|f)(f|d)
                              fbus_fd <= '1';                                            -- enable full access to fp register bank
                              state <= state_fpwr;

                           when others =>
                              state <= state_fpwr;

                        end case;

                     end if;

                  when state_tstset =>
                     rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & "000";
                     rbus_d <= alu_input;
                     rbus_we <= '1';
                     state <= state_store_alu_p;

                  when state_wrtlck =>
                     rbus_ix <= "000";
                     state <= state_wrtlcka;

                  when state_wrtlcka =>
                     alu_input <= rbus_data;
                     state <= state_store_alu_p;

                  when state_mark =>
                     r7 <= rbus_data;
                     rbus_ix <= "110";
                     state <= state_marka;

                  when state_marka =>
                     rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & "110";
                     rbus_d <= rbus_data_p2;
                     rbus_we <= '1';
                     state <= state_markb;

                  when state_markb =>
                     rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & "101";
                     rbus_d <= datain;
                     rbus_we <= '1';
                     state <= state_ifetch;

                  when state_jsr =>
                     rbus_ix <= "110";
                     state <= state_jsra;

                  when state_jsra =>
                     addr_indirect <= rbus_data_m2;
                     rbus_waddr <= pswmf(15 downto 14) & "0110";
                     rbus_d <= rbus_data_m2;
                     rbus_we <= '1';
                     sr1_srcd <= sr1_m2;
                     rbus_ix <= ir(8 downto 6);
                     state <= state_jsrb;

                  when state_jsrb =>
                     state <= state_jsrc;

                  when state_jsrc =>
                     if ir(8 downto 6) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 6);
                        rbus_d <= r7;
                        rbus_we <= '1';
                     end if;
                     r7 <= dest_addr;
                     state <= state_ifetch;

                  when state_rts =>
                     addr_indirect <= rbus_data;
                     if ir(2 downto 0) /= "110" then                           -- the r6 special case; it is not really necessary to increment sp here, since it will be loaded in the next step. Does not harm either.
                        rbus_waddr <= pswmf(15 downto 14) & "0110";
                        rbus_d <= rbus_data_p2;
                        rbus_we <= '1';
--                        sr1_dstd <= sr1_p2;                                    -- simh doesn't
                     end if;
                     rbus_ix <= ir(2 downto 0);
                     state <= state_rtsa;

                  when state_rtsa =>
                     if ir(2 downto 0) /= "111" then
                        r7 <= rbus_data;
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(2 downto 0);
                        rbus_d <= datain;
                        rbus_we <= '1';
                     else
                        r7 <= datain;
                     end if;
                     state <= state_ifetch;

                  when state_dst0 =>
                     alu_input <= rbus_data;
                     state <= pdststate;
                     rbus_cpu_mode <= pswmf(15 downto 14);    -- may have been set temporarily to handle mode 0 r6 for mfp(i|d)

                  when state_src0 =>

-- handle issue 3 in programming differences list
                     if ir_dop = '1' and ir(8 downto 6) = "111"
                     and (ir(5 downto 4) = "11")
                     and (
                        modelcode = 15 or modelcode = 20 or modelcode = 35 or modelcode = 40
                        or modelcode = 53
                        or modelcode = 73 or modelcode = 83 or modelcode = 84 or modelcode = 93 or modelcode = 94
                     )
                     then
                        alus_input <= rbus_data_p2;
                        state <= psrcstate;
                        rbus_ix <= ir(2 downto 0);
                     else
                        alus_input <= rbus_data;
                        state <= psrcstate;
                        rbus_ix <= ir(2 downto 0);
                     end if;

                  when state_dst1 =>
                     dest_addr <= addr;
                     alu_input <= datain;
                     state <= pdststate;

                  when state_src1 =>
                     alus_input <= datain;
                     state <= psrcstate;
                     rbus_ix <= ir(2 downto 0);

                  when state_dst2 =>
                     dest_addr <= addr;
                     alu_input <= datain;
                     state <= pdststate;
                     sr1_dstd <= sr1_pv;
                     if ir(2 downto 0) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(2 downto 0);
                        rbus_d <= rbus_data_pv;
                        rbus_we <= '1';
                     else
                        r7 <= rbus_data_p2;
                     end if;

                  when state_src2 =>
                     alus_input <= datain;
                     if ir_dop = '1' and ir(8 downto 6) = ir(2 downto 0) and ir(2 downto 0) /= "111" then
                        state <= state_src2w;
                     else
                        state <= psrcstate;
                     end if;
                     rbus_ix <= ir(2 downto 0);
                     sr1_srcd <= sr1_pv;
                     if ir(8 downto 6) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 6);
                        rbus_d <= rbus_data_pv;
                        rbus_we <= '1';
                     else
                        r7 <= rbus_data_p2;
                     end if;

                  when state_src2w =>
                     state <= psrcstate;

                  when state_dst3 =>
                     addr_indirect <= datain;
                     sr1_dstd <= sr1_p2;
                     if ir(2 downto 0) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(2 downto 0);
                        rbus_d <= rbus_data_p2;
                        rbus_we <= '1';
                     else
                        r7 <= rbus_data_p2;
                     end if;
                     state <= state_dst3a;

                  when state_dst3a =>
                     dest_addr <= addr;
                     alu_input <= datain;
                     state <= pdststate;

                  when state_src3 =>
                     addr_indirect <= datain;
                     rbus_ix <= ir(2 downto 0);
                     sr1_srcd <= sr1_p2;
                     if ir(8 downto 6) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 6);
                        rbus_d <= rbus_data_p2;
                        rbus_we <= '1';
                     else
                        r7 <= rbus_data_p2;
                     end if;
                     state <= state_src3a;

                  when state_src3a =>
                     alus_input <= datain;
                     state <= psrcstate;

                  when state_dst4 =>
                     dest_addr <= addr;
                     alu_input <= datain;
                     state <= pdststate;
                     sr1_dstd <= sr1_mv;
                     if ir(2 downto 0) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(2 downto 0);
                        rbus_d <= rbus_data_mv;
                        rbus_we <= '1';
                     else
                        r7 <= rbus_data_m2;                  -- FIXME, where does this even begin to make sense - it would effectively jump to the same insn?
                     end if;

                  when state_src4 =>
                     alus_input <= datain;
                     if ir_dop = '1' and ir(8 downto 6) = ir(2 downto 0) and ir(2 downto 0) /= "111" then
                        state <= state_src4w;
                     else
                        state <= psrcstate;
                     end if;
                     rbus_ix <= ir(2 downto 0);
                     sr1_srcd <= sr1_mv;
                     if ir(8 downto 6) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 6);
                        rbus_d <= rbus_data_mv;
                        rbus_we <= '1';
                     else
                        r7 <= rbus_data_m2;
                     end if;

                  when state_src4w =>
                     state <= psrcstate;

                  when state_dst5 =>
                     addr_indirect <= datain;
                     sr1_dstd <= sr1_m2;
                     if ir(2 downto 0) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(2 downto 0);
                        rbus_d <= rbus_data_m2;
                        rbus_we <= '1';
                     else
                        r7 <= rbus_data_m2;
                     end if;
                     state <= state_dst5a;

                  when state_dst5a =>
                     dest_addr <= addr;
                     alu_input <= datain;
                     state <= pdststate;

                  when state_src5 =>
                     addr_indirect <= datain;
                     rbus_ix <= ir(2 downto 0);
                     sr1_srcd <= sr1_m2;
                     if ir(8 downto 6) /= "111" then
                        rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(8 downto 6);
                        rbus_d <= rbus_data_m2;
                        rbus_we <= '1';
                     else
                        r7 <= rbus_data_m2;
                     end if;
                     state <= state_src5a;

                  when state_src5a =>
                     alus_input <= datain;
                     state <= psrcstate;

                  when state_dst6 =>
                     r7 <= r7p2;
                     if ir(2 downto 0) = "111" then
                        addr_indirect <= unsigned(datain) + unsigned(rbus_data_p2);
                     else
                        addr_indirect <= unsigned(datain) + unsigned(rbus_data);
                     end if;
                     state <= state_dst6a;

                  when state_dst6a =>
                     dest_addr <= addr;
                     alu_input <= datain;
                     state <= pdststate;

                  when state_src6 =>
                     r7 <= r7p2;
                     if ir(8 downto 6) = "111" then
                        addr_indirect <= unsigned(datain) + unsigned(rbus_data_p2);
                     else
                        addr_indirect <= unsigned(datain) + unsigned(rbus_data);
                     end if;
                     state <= state_src6a;

                  when state_src6a =>
                     alus_input <= datain;
                     state <= psrcstate;
                     rbus_ix <= ir(2 downto 0);

                  when state_dst7 =>
                     r7 <= r7p2;
                     if ir(2 downto 0) = "111" then
                        addr_indirect <= unsigned(datain) + unsigned(rbus_data_p2);
                     else
                        addr_indirect <= unsigned(datain) + unsigned(rbus_data);
                     end if;
                     state <= state_dst7a;

                  when state_dst7a =>
                     addr_indirect <= datain;
                     state <= state_dst7b;

                  when state_dst7b =>
                     dest_addr <= addr;
                     alu_input <= datain;
                     state <= pdststate;
                     rbus_ix <= "110";

                  when state_src7 =>
                     r7 <= r7p2;
                     if ir(8 downto 6) = "111" then
                        addr_indirect <= unsigned(datain) + unsigned(rbus_data_p2);
                     else
                        addr_indirect <= unsigned(datain) + unsigned(rbus_data);
                     end if;
                     state <= state_src7a;

                  when state_src7a =>
                     addr_indirect <= datain;
                     state <= state_src7b;

                  when state_src7b =>
                     alus_input <= datain;
                     state <= psrcstate;
                     rbus_ix <= ir(2 downto 0);

                  when state_store_alu_p =>
                     state <= state_store_alu_w;

                  when state_store_alu_w =>
                     psw(3 downto 0) <= alu_psw;
                     if psw_in_we_even = '1' then                   -- direct write into 777776 overrides psw setting from alu
                        if have_pswimmediateupdate = 1 then
                           psw(7 downto 5) <= psw_in(7 downto 5);   -- T bit can only be set with RTI/RTT instruction
                           psw(3 downto 0) <= psw_in(3 downto 0);
                        else
                           psw_delayedupdate_even <= '1';
                           psw_delayedupdate(7 downto 0) <= psw_in(7 downto 0);
                        end if;
                     end if;
                     if psw_in_we_odd = '1' then
                        if have_pswimmediateupdate = 1 then
                           psw(15 downto 8) <= psw_in(15 downto 8);
                        else
                           psw_delayedupdate_odd <= '1';
                           psw_delayedupdate(15 downto 8) <= psw_in(15 downto 8);
                        end if;
                     end if;
                     state <= state_ifetch;
                     if ir(15 downto 6) = "1111000011" then         -- stst?
                        if ir(5 downto 0) /= "010111" then          -- not if mode 2, r7 -- immediate
                           state <= state_stststore;
                           dest_addr <= dest_addr + 2;
                        end if;
                     end if;

                  when state_store_alu_r =>
                     if ir_store = '1' then
                        if ir(2 downto 0) /= "111" then
                           if ir_mtpi = '1' or ir_mtpd = '1' then
                              rbus_waddr <= pswmf(13 downto 12) & pswmf(11) & ir(2 downto 0);
                           else
                              rbus_waddr <= pswmf(15 downto 14) & pswmf(11) & ir(2 downto 0);
                           end if;
                           if ir(15 downto 12) = "1001" then                             -- movb? movb needs to sign extend if the result is moved to a register
                              rbus_d <= alu_output_signext;
                           elsif have_mtps = 1 and ir_mfps = '1' then                    -- mfps needs sign extend if the result is moved to a register
                              rbus_d <= alu_output_signext;
                           elsif ir_byte = '1' then
                              rbus_d <= alu_input(15 downto 8) & alu_output(7 downto 0);
                           else
                              rbus_d <= alu_output;
                           end if;
                           rbus_we <= '1';
                        else
                           r7 <= alu_output;
                        end if;
                     end if;
                     psw(3 downto 0) <= alu_psw;
                     state <= state_ifetch;

                  when others =>
                     null;

               end case;
            end if;

            if nxmabort = '1' then
               if modelcode = 34                                                         -- FIXME, if this is disabled for these models, FKAB, KKAB will fail. However, if enabled for 45, unix v7 will fail during /etc/rc processing.
               or modelcode = 44
               or modelcode = 04
               then
                  if state = state_src2 or state = state_src3 then
                     rbus_we <= '0';
                     sr1_srcd <= "00000";
                  end if;
                  if state = state_dst2 or state = state_dst3 then
                     rbus_we <= '0';
                     sr1_dstd <= "00000";
                  end if;
               end if;
               trap_vector <= o"004";
               state <= state_trap;
            end if;

            if mmuabort = '1' and have_mmuimmediateabort = 0 then                        -- signal from mmu that an access caused an abort.
               state <= state_mmuabort;                                                  -- precursor state for mmu abort
               ack_mmuabort <= '1';                                                      -- set acknowledge flag to mmu core
            elsif oddabort = '1' and have_oddimmediateabort = 0 then                     -- odd abort signal
               trap_vector <= o"004";                                                    -- set vector
               state <= state_trap;                                                      -- do trap
            end if;

         end if;
      end if;
   end process;


-- base instruction set alu

   process(alu_input, alus_input, ir, psw(3 downto 0),
      ir_sop, ir_dop, ir_mfpi, ir_csm, ir_mfpd, ir_mtpi, ir_mtpd, ir_mtps, ir_mfps, ir_dopr, ir_mpr, ir_fpsop1,
      have_csm, have_mfp, have_mtps, have_xor, have_mpr, fps, fec,
      modelcode)
      variable result : std_logic_vector(15 downto 0);
      variable result8 : std_logic_vector(7 downto 0);
   begin
      ir_byte <= '0';
      ir_store <= '1';
      if ir_sop = '1' then
         case ir(15 downto 6) is
            when "0000000011" =>                                     -- swab
               result(15 downto 8) := alu_input(7 downto 0);
               result(7 downto 0) := alu_input(15 downto 8);
               alu_output <= result;
               alu_psw(3) <= alu_input(15);
               if alu_input(15 downto 8) = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if modelcode = 15 or modelcode = 20 then
                  alu_psw(1) <= psw(1);
               else
                  alu_psw(1) <= '0';
               end if;
               alu_psw(0) <= '0';

            when "0000101000" =>                                     -- clr
               result := "0000000000000000";
               alu_output <= result;
               alu_psw(3 downto 0) <= "0100";

            when "1000101000" =>                                     -- clrb
               ir_byte <= '1';
               result := "0000000000000000";
               alu_output <= result;
               alu_psw(3 downto 0) <= "0100";

            when "0000101001" =>                                     -- com
               result := not alu_input;
               alu_output <= result;
               alu_psw(3) <= not alu_input(15);
               if not alu_input = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1 downto 0) <= "01";

            when "1000101001" =>                                     -- comb
               ir_byte <= '1';
               result := not alu_input;
               alu_output <= result;
               alu_psw(3) <= not alu_input(7);
               if not alu_input(7 downto 0) = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1 downto 0) <= "01";

            when "0000101010" =>                                     -- inc
               result := alu_input + 1;
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if alu_input = "0111111111111111" then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               alu_psw(0) <= psw(0);

            when "1000101010" =>                                     -- incb
               ir_byte <= '1';
               result := alu_input + 1;
               alu_output <= result;
               alu_psw(3) <= result(7);
               if result(7 downto 0) = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if alu_input(7 downto 0) = "01111111" then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               alu_psw(0) <= psw(0);

            when "0000101011" =>                                     -- dec
               result := alu_input - 1;
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if alu_input = "1000000000000000" then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               alu_psw(0) <= psw(0);

            when "1000101011" =>                                     -- decb
               ir_byte <= '1';
               result := alu_input - 1;
               alu_output <= result;
               alu_psw(3) <= result(7);
               if result(7 downto 0) = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if alu_input(7 downto 0) = "10000000" then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               alu_psw(0) <= psw(0);

            when "0000101100" =>                                     -- neg
               result := (not alu_input) + 1;
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
                  alu_psw(0) <= '0';
               else
                  alu_psw(2) <= '0';
                  alu_psw(0) <= '1';
               end if;
               if result = "1000000000000000" then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;

            when "1000101100" =>                                     -- negb
               ir_byte <= '1';
               result := (not alu_input) + 1;
               alu_output <= result;
               alu_psw(3) <= result(7);
               if result(7 downto 0) = "00000000" then
                  alu_psw(2) <= '1';
                  alu_psw(0) <= '0';
               else
                  alu_psw(2) <= '0';
                  alu_psw(0) <= '1';
               end if;
               if result(7 downto 0) = "10000000" then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;

            when "0000101101" =>                                     -- adc
               result := alu_input + psw(0);
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if alu_input = "0111111111111111" and psw(0) = '1' then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               if alu_input = "1111111111111111" and psw(0) = '1' then
                  alu_psw(0) <= '1';
               else
                  alu_psw(0) <= '0';
               end if;

            when "1000101101" =>                                     -- adcb
               ir_byte <= '1';
               result := alu_input + psw(0);
               alu_output <= result;
               alu_psw(3) <= result(7);
               if result(7 downto 0) = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if alu_input(7 downto 0) = "01111111" and psw(0) = '1' then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               if alu_input(7 downto 0) = "11111111" and psw(0) = '1' then
                  alu_psw(0) <= '1';
               else
                  alu_psw(0) <= '0';
               end if;

            when "0000101110" =>                                     -- sbc
               result := alu_input - psw(0);
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if alu_input = "1000000000000000" and psw(0) = '1' then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               if alu_input = "0000000000000000" and psw(0) = '1' then
                  alu_psw(0) <= '1';
               else
                  alu_psw(0) <= '0';
               end if;

            when "1000101110" =>                                     -- sbcb
               ir_byte <= '1';
               result := alu_input - psw(0);
               alu_output <= result;
               alu_psw(3) <= result(7);
               if result(7 downto 0) = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if alu_input(7 downto 0) = "10000000" and psw(0) = '1' then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               if alu_input(7 downto 0) = "00000000" and psw(0) = '1' then
                  alu_psw(0) <= '1';
               else
                  alu_psw(0) <= '0';
               end if;

            when "0000101111" =>                                     -- tst
               result := alu_input;
               alu_output <= result;
               ir_store <= '0';
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1 downto 0) <= "00";

            when "1000101111" =>                                     -- tstb
               ir_byte <= '1';
               result := alu_input;
               alu_output <= result;
               ir_store <= '0';
               alu_psw(3) <= result(7);
               if result(7 downto 0) = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1 downto 0) <= "00";

            when "0000110000" =>                                     -- ror
               result := psw(0) & alu_input(15 downto 1);
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= alu_input(0) xor result(15);
               alu_psw(0) <= alu_input(0);

            when "1000110000" =>                                     -- rorb
               ir_byte <= '1';
               result8 := psw(0) & alu_input(7 downto 1);
               alu_output(7 downto 0) <= result8;
               alu_output(15 downto 8) <= "XXXXXXXX";
               alu_psw(3) <= result8(7);
               if result8 = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= alu_input(0) xor result8(7);
               alu_psw(0) <= alu_input(0);

            when "0000110001" =>                                     -- rol
               result := alu_input(14 downto 0) & psw(0);
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= alu_input(15) xor result(15);
               alu_psw(0) <= alu_input(15);

            when "1000110001" =>                                     -- rolb
               ir_byte <= '1';
               result8 := alu_input(6 downto 0) & psw(0);
               alu_output(7 downto 0) <= result8;
               alu_output(15 downto 8) <= "XXXXXXXX";
               alu_psw(3) <= result8(7);
               if result8 = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= alu_input(7) xor result8(7);
               alu_psw(0) <= alu_input(7);

            when "0000110010" =>                                     -- asr
               result := alu_input(15) & alu_input(15 downto 1);
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= alu_input(0) xor result(15);
               alu_psw(0) <= alu_input(0);

            when "1000110010" =>                                     -- asrb
               ir_byte <= '1';
               result8 := alu_input(7) & alu_input(7 downto 1);
               alu_output(7 downto 0) <= result8;
               alu_output(15 downto 8) <= "XXXXXXXX";
               alu_psw(3) <= result8(7);
               if result8 = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= alu_input(0) xor result8(7);
               alu_psw(0) <= alu_input(0);

            when "0000110011" =>                                     -- asl
               result := alu_input(14 downto 0) & '0';
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= alu_input(15) xor result(15);
               alu_psw(0) <= alu_input(15);

            when "1000110011" =>                                     -- aslb
               ir_byte <= '1';
               result8 := alu_input(6 downto 0) & '0';
               alu_output(7 downto 0) <= result8;
               alu_output(15 downto 8) <= "XXXXXXXX";
               alu_psw(3) <= result8(7);
               if result8 = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= alu_input(7) xor result8(7);
               alu_psw(0) <= alu_input(7);

            when "0000110111" =>                                     -- sxt
               if psw(3) = '0' then
                  result := "0000000000000000";
                  alu_psw(2) <= '1';
               else
                  result := "1111111111111111";
                  alu_psw(2) <= '0';
               end if;
               alu_output <= result;
               alu_psw(3) <= psw(3);
               alu_psw(1) <= '0';
               alu_psw(0) <= psw(0);

            when others =>
               alu_output <= "XXXXXXXXXXXXXXXX";
               alu_psw <= "XXXX";

         end case;

      elsif ir_dop = '1' then
         case ir(15 downto 12) is
            when "0001" =>                                           -- mov
               result := alus_input;
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= '0';
               alu_psw(0) <= psw(0);

            when "1001" =>                                           -- movb
               ir_byte <= '1';
               result := alus_input;
               alu_output <= result;
               alu_psw(3) <= result(7);
               if result(7 downto 0) = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= '0';
               alu_psw(0) <= psw(0);

            when "0010" =>                                           -- cmp
               result := alus_input - alu_input;
               alu_output <= alu_input;
               ir_store <= '0';
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if (alu_input(15) /= alus_input(15)) and (alus_input(15) /= result(15)) then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               alu_psw(0) <= ((not alus_input(15)) and alu_input(15)) or ((not alus_input(15)) and result(15)) or (alu_input(15) and result(15));

            when "1010" =>                                           -- cmpb
               ir_byte <= '1';
               result8 := alus_input(7 downto 0) - alu_input(7 downto 0);
               alu_output <= alu_input;
               ir_store <= '0';
               alu_psw(3) <= result8(7);
               if result8 = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if (alu_input(7) /= alus_input(7)) and (alus_input(7) /= result8(7)) then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               alu_psw(0) <= ((not alus_input(7)) and alu_input(7)) or ((not alus_input(7)) and result8(7)) or (alu_input(7) and result8(7));

            when "0011" =>                                           -- bit
               result := alus_input and alu_input;
               alu_output <= alu_input;
               ir_store <= '0';
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= '0';
               alu_psw(0) <= psw(0);

            when "1011" =>                                           -- bitb
               ir_byte <= '1';
               result := alus_input and alu_input;
               alu_output <= alu_input;
               ir_store <= '0';
               alu_psw(3) <= result(7);
               if result(7 downto 0) = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= '0';
               alu_psw(0) <= psw(0);

            when "0100" =>                                           -- bic
               result := (not alus_input) and alu_input;
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= '0';
               alu_psw(0) <= psw(0);

            when "1100" =>                                           -- bicb
               ir_byte <= '1';
               result := (not alus_input) and alu_input;
               alu_output <= result;
               alu_psw(3) <= result(7);
               if result(7 downto 0) = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= '0';
               alu_psw(0) <= psw(0);

            when "0101" =>                                           -- bis
               result := alus_input or alu_input;
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= '0';
               alu_psw(0) <= psw(0);

            when "1101" =>                                           -- bisb
               ir_byte <= '1';
               result := alus_input or alu_input;
               alu_output <= result;
               alu_psw(3) <= result(7);
               if result(7 downto 0) = "00000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= '0';
               alu_psw(0) <= psw(0);

            when "0110" =>                                           -- add
               result := alu_input + alus_input;
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if (alu_input(15) = alus_input(15)) and (alus_input(15) /= result(15)) then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               alu_psw(0) <= (alu_input(15) and alus_input(15)) or (alu_input(15) and not result(15)) or (alus_input(15) and not result(15));

            when "1110" =>                                           -- sub
               result := alu_input - alus_input;
               alu_output <= result;
               alu_psw(3) <= result(15);
               if result = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               if (alu_input(15) /= alus_input(15)) and (alu_input(15) /= result(15)) then
                  alu_psw(1) <= '1';
               else
                  alu_psw(1) <= '0';
               end if;
               alu_psw(0) <= ((not alu_input(15)) and alus_input(15)) or ((not alu_input(15)) and result(15)) or (alus_input(15) and result(15));

            when others =>
               alu_output <= "XXXXXXXXXXXXXXXX";
               alu_psw <= "XXXX";

         end case;


-- misc insns

      elsif have_csm = 1 and ir_csm = '1' then                       -- csm

         alu_output <= alu_input;
         alu_psw <= psw(3 downto 0);

      elsif have_mfp = 1 and (ir_mfpi = '1' or ir_mfpd = '1') then         -- mfpi, mfpd, mtpi, mtpd

         alu_output <= alu_input;
         alu_psw(3) <= alu_input(15);
         if alu_input = "0000000000000000" then
            alu_psw(2) <= '1';
         else
            alu_psw(2) <= '0';
         end if;
         alu_psw(1) <= '0';
         alu_psw(0) <= psw(0);

      elsif have_mfp = 1 and (ir_mtpi = '1' or ir_mtpd = '1') then         -- mfpi, mfpd, mtpi, mtpd

         alu_output <= alus_input;
         alu_psw(3) <= alus_input(15);
         if alus_input = "0000000000000000" then
            alu_psw(2) <= '1';
         else
            alu_psw(2) <= '0';
         end if;
         alu_psw(1) <= '0';
         alu_psw(0) <= psw(0);

      elsif have_mtps = 1 and ir_mtps = '1' then                     -- mtps

         ir_byte <= '1';
         alu_output <= alu_input;
         alu_psw <= psw(3 downto 0);

      elsif have_mtps = 1 and ir_mfps = '1' then                     -- mfps

         ir_byte <= '1';
         alu_output <= psw;
         alu_psw(3) <= psw(7);
         if psw(7 downto 0) = "0000000" then
            alu_psw(2) <= '1';
         else
            alu_psw(2) <= '0';
         end if;
         alu_psw(1) <= '0';
         alu_psw(0) <= psw(0);

      elsif have_xor = 1 and ir_dopr = '1' and ir(11 downto 9) = "100" then              -- xor

         result := alu_input xor alus_input;                                             -- xor is handled here, not in the eis alu
         alu_output <= result;
         alu_psw(3) <= result(15);
         if result = "0000000000000000" then
            alu_psw(2) <= '1';
         else
            alu_psw(2) <= '0';
         end if;
         alu_psw(1) <= '0';
         alu_psw(0) <= psw(0);

      elsif have_mpr = 1 and ir_mpr = '1' then

         case ir(6) is
            when '0' =>                                              -- tstset
               result := alu_input(15 downto 1) & '1';
               alu_output <= result;
               alu_psw(3) <= alu_input(15);
               if alu_input = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= '0';
               alu_psw(0) <= alu_input(0);

            when '1' =>                                              -- wrtlck
               result := alu_input;
               alu_output <= result;
               alu_psw(3) <= alu_input(15);
               if alu_input = "0000000000000000" then
                  alu_psw(2) <= '1';
               else
                  alu_psw(2) <= '0';
               end if;
               alu_psw(1) <= '0';
               alu_psw(0) <= psw(0);

            when others =>
               null;
         end case;


-- fp11 insns with simple integer result

      elsif ir_fpsop1 = '1' then

         alu_psw(3 downto 0) <= psw(3 downto 0);

         case ir(7 downto 6) is
            when "01" =>                                               -- ldfps
               result := alu_input;
               alu_output <= result;

            when "10" =>                                               -- stfps
               result(15 downto 14) := fps(15 downto 14);
               result(13 downto 12) := "00";                           -- set these unused bits to zero to stop the tests complaining
               result(11 downto 0) := fps(11 downto 0);
               alu_output <= result;

            when "11" =>                                               -- stst
               result := "000000000000" & fec;
               alu_output <= result;

            when others =>
               alu_output <= "XXXXXXXXXXXXXXXX";
               alu_psw <= "XXXX";

         end case;

      else
         alu_output <= "XXXXXXXXXXXXXXXX";
         alu_psw <= "XXXX";
      end if;
   end process;


--
-- eis alu: mul, div, ash, ashc insns
--

   process(clk)
   begin
      if clk = '1' and clk'event then
         if have_eis = 1 and ir_dopr = '1' and ir(11) = '0' then
            case ir(10 downto 9) is

               when "00" =>                                          -- mul

                  if eis_sequencer = "11111" then                              -- load seq. code
                     eis_temp1 <= signed(alu_input) * signed(alus_input);      -- mul is easy, just use the hw multipliers
                  elsif eis_sequencer = "00000" then                           -- done seq. code
                     eis_output <= eis_temp1(31 downto 16);                    -- high part
                     eis_output32 <= eis_temp1(15 downto 0);                   -- low part
                     eis_psw(3) <= eis_temp1(31);                              -- set n
                     if eis_temp1 = "00000000000000000000000000000000" then    -- set z
                        eis_psw(2) <= '1';
                     else
                        eis_psw(2) <= '0';
                     end if;
                     eis_psw(1) <= '0';                                        -- set v - always 0, 15bits*15bits into 31 cannot overflow
                     if (eis_temp1(31) = '1' and eis_temp1(30 downto 15) /= "1111111111111111")
                     or (eis_temp1(31) = '0' and eis_temp1(30 downto 15) /= "0000000000000000") then
                        eis_psw(0) <= '1';
                     else
                        eis_psw(0) <= '0';
                     end if;
                  end if;

               when "01" =>                                          -- div
                  if eis_sequencer = "10000" then                              -- load seq. code
                     if alu_input(15) = '1' then                               -- if input negative
                        eis_temp1 <= '0' & ((not alu_input) + 1) & (14 downto 0 => '0');    -- take two's complement
                        eis_flag1 <= '1';
                     else
                        eis_temp1 <= '0' & alu_input & (14 downto 0 => '0');
                        eis_flag1 <= '0';
                     end if;
                     if alus_input(15) = '1' then
                        eis_temp2 <= (not (alus_input & alut_input)) + 1;
                        eis_flag2 <= '1';
                     else
                        eis_temp2 <= alus_input & alut_input;
                        eis_flag2 <= '0';
                     end if;
                     eis_psw <= "0000";

-- main div loop

                  elsif eis_sequencer(4) = '0' then
                     if unsigned(eis_temp1) <= unsigned(eis_temp2) then
                        if eis_sequencer(3 downto 0) = "1111" then
                           if unsigned(eis_temp1) <= unsigned(eis_temp2) then
                              eis_psw(1) <= '1';
                           end if;
                        end if;
                        eis_temp(conv_integer(eis_sequencer(3 downto 0))) <= '1';
                        eis_temp2 <= eis_temp2 - eis_temp1;
                     else
                        eis_temp(conv_integer(eis_sequencer(3 downto 0))) <= '0';
                     end if;
                     eis_temp1(30 downto 0) <= eis_temp1(31 downto 1);
                  else

-- post processing

-- setting the flags after the div instruction is the tricky part. A division by zero causes
-- the result not to be stored - which is handled by the state machine, results are only
-- stored if the v and c flags are 00. Still a very tricky thing considering all the
-- border cases. I believe the current model is correct - and also, it passes all the tests
-- I can find. Specifically, fkac, and zkdj - and the results make sense as well.

                     if eis_flag2 = '1' then                                   -- if 2nd op was negative
                        eis_output32 <= (not eis_temp2(15 downto 0)) + 1;      -- sign adjust remainder
                     else
                        eis_output32 <= eis_temp2(15 downto 0);                -- or just the positive
                     end if;

                     if eis_flag1 /= eis_flag2 then                            -- if signs were different
                        eis_psw(3) <= '1';                                     -- set N
                        eis_output <= (not eis_temp) + 1;                      -- sign adjust result
                     else
                        eis_psw(3) <= '0';                                     -- clear n
                        eis_output <= eis_temp;                                -- copy result
                     end if;

-- special cases : result is zero

                     if eis_temp(14 downto 0) = (14 downto 0 => '0') then
                        if eis_temp(15) = '0' then
                           eis_psw(3) <= '0';
                           eis_psw(2) <= '1';
                           eis_output(15) <= '0';
                        else
                           eis_psw(2) <= '0';
                        end if;
                        if eis_temp(15) = '1' and eis_flag1 /= eis_flag2 then
                           eis_psw(1) <= '0';                                  -- special case: quotient is negative maxint - that isn't an overflow
                        end if;
                     else
                        eis_psw(2) <= '0';
                     end if;

-- set c and v if divisor was zero

                     if alu_input = (15 downto 0 => '0') then
                        if modelcode = 73 or modelcode = 83 or modelcode = 84 or modelcode = 93 or modelcode = 94 or modelcode = 53 then
                           eis_psw(2) <= psw(2);                               -- observed behaviour and needed to pass zkdj FIXME
                        end if;
                        eis_psw(1) <= '1';
                        eis_psw(0) <= '1';
                     end if;

                  end if;


               when "10" =>                                  -- ash

                  if eis_sequencer = "11111" then
                     eis_output <= alus_input;
                     eis_flag2 <= '0';
                     eis_psw(1) <= '0';
                     eis_psw(0) <= '0';
                     eis_temp(15 downto 6) <= "0000000000";        -- for easier debugging
                     eis_flag1 <= alu_input(5);
                     if alu_input(4 downto 0) = "11111" then       -- see EK-1184E-TM-001_Dec87.pdf, page B-17
                        if modelcode = 73
                        or modelcode = 53
                        or modelcode = 83
                        or modelcode = 84
                        or modelcode = 93
                        or modelcode = 94
                        then
                           if have_fpa = 0 then                    -- Speculative - see ashc case
                              eis_flag1 <= '1';
                           end if;
                        end if;
                     end if;
                     if alu_input(5) = '1' then
                        eis_temp(5 downto 0) <= (not alu_input(5 downto 0)) + 1;
                     else
                        eis_temp(5 downto 0) <= alu_input(5 downto 0);
                     end if;
                  else
                     if eis_temp(5 downto 0) /= "000000" then
                        if eis_flag1 = '1' then
                           eis_output <= eis_output(15) & eis_output(15 downto 1);
                           eis_psw(0) <= eis_output(0);
                        else
                           eis_output <= eis_output(14 downto 0) & '0';
                           if eis_output(15 downto 14) = "10" or eis_output(15 downto 14) = "01" then
                              eis_psw(1) <= '1';
                           end if;
                           eis_psw(0) <= eis_output(15);
                        end if;
                        eis_temp(5 downto 0) <= eis_temp(5 downto 0) - 1;
                     else
                        eis_flag2 <= '1';
                        eis_psw(3) <= eis_output(15);
                        if eis_output = "0000000000000000" then
                           eis_psw(2) <= '1';
                        else
                           eis_psw(2) <= '0';
                        end if;
                     end if;
                  end if;


               when "11" =>                                  -- ashc

                  if eis_sequencer = "11111" then
                     eis_temp1 <= alus_input & alut_input;
                     eis_flag2 <= '0';
                     eis_psw(1) <= '0';
                     eis_psw(0) <= '0';
                     eis_temp(15 downto 6) <= "0000000000";        -- for easier debugging
                     eis_flag1 <= alu_input(5);
                     if alu_input(4 downto 0) = "11111" then       -- see EK-1184E-TM-001_Dec87.pdf, page B-17
                        if modelcode = 73
                        or modelcode = 53
                        or modelcode = 83
                        or modelcode = 84
                        or modelcode = 93
                        or modelcode = 94
                        then
                           if have_fpa = 0 then                    -- As evidenced from the test code in RSTS V10.1L
                              eis_flag1 <= '1';
                           end if;
                        end if;
                     end if;
                     if alu_input(5) = '1' then
                        eis_temp(5 downto 0) <= ('0' & (not alu_input(4 downto 0))) + 1;
                     else
                        eis_temp(4 downto 0) <= alu_input(4 downto 0);
                        eis_temp(5) <= '0';
                     end if;
                  else
                     if eis_temp(5 downto 0) /= "000000" then
                        if eis_flag1 = '1' then
                           eis_temp1 <= eis_temp1(31) & eis_temp1(31 downto 1);
                           eis_psw(0) <= eis_temp1(0);
                        else
                           eis_temp1 <= eis_temp1(30 downto 0) & '0';
                           if eis_temp1(31 downto 30) = "10" or eis_temp1(31 downto 30) = "01" then
                              eis_psw(1) <= '1';
                           end if;
                           eis_psw(0) <= eis_temp1(31);
                        end if;
                        eis_temp(5 downto 0) <= eis_temp(5 downto 0) - 1;
                     else
                        eis_flag2 <= '1';
                        eis_output <= eis_temp1(31 downto 16);
                        eis_output32 <= eis_temp1(15 downto 0);
                        eis_psw(3) <= eis_temp1(31);
                        if eis_temp1 = "00000000000000000000000000000000" then
                           eis_psw(2) <= '1';
                        else
                           eis_psw(2) <= '0';
                        end if;
                     end if;
                  end if;

               when others =>
                  null;

            end case;
         end if;
      end if;
   end process;


-- floating point alu

   process(clk, reset, falu_pending_clear, ir_fpao, falu_load, falu_input, falus_input, ir_wait)
      variable v_caseworkaround : std_logic_vector(3 downto 0);
   begin
      if clk = '1' and clk'event then

         if have_fpu = 1 and reset = '1' then
            falu_done <= '0';
            falu_fsm <= falu_idle;
            falu_fps <= "0000";
            falu_flag1 <= '0';
            falu_pending_fiu <= '0';
            falu_pending_fiv <= '0';
            falu_pending_fic <= '0';
            falu_pending_divz <= '0';
         elsif have_fpu = 1 and ir_wait = '0' then

            if falu_pending_clear = '1' then
               falu_pending_fiu <= '0';
               falu_pending_fiv <= '0';
               falu_pending_fic <= '0';
               falu_pending_divz <= '0';
            end if;

            if ir_fpao = '1' then


-- if the falu_load bit is one, load the work registers and the initial state for the falu state machine.
-- both of which are dependent on exactly which instruction we need to process - the sequence in the
-- state machine needs to be started at a specific point, which is not the same for all insn - and
-- definitely all insn have their own initialization requirements and special cases.
--
-- also, the main cpu state machine includes

               if falu_load = '1' then
                  falu_done <= '0';
                  falu_fps <= "0000";

                  case ir(11 downto 8) is

                     when "0010" | "0011" =>                                             -- mul(f|d), mod(f|d)
                        if falu_input(63) = falus_input(63) then                         -- set sign - positive if both operands are same sign, negative otherwise
                           falu_fps(3) <= '0';
                        else
                           falu_fps(3) <= '1';
                        end if;
                        falu_fps(2 downto 0) <= "000";                                   -- set default for fps bits
                        falu_fsm <= falu_mult;
                        falu_work1 <= (others => '0');
                        falu_work2 <= '0' & '1' & falus_input(54 downto 0) & '0' & '0';
                        if falu_input(62 downto 55) = "00000000" or falus_input(62 downto 55) = "00000000" then        -- if either input exponent is zero, we don't need to multiply at all
                           falu_output <= (others => '0');
                           falu_output2 <= (others => '0');
                           falu_fps <= "0100";
                           falu_fsm <= falu_idle;
                           falu_done <= '1';
                        end if;
                        falu_ccw <= ("00" & falu_input(62 downto 55)) + ("00" & falus_input(62 downto 55)) - "0010000001";


                     when "0100" | "0110" =>                                             -- add(f|d), sub(f|d)
                        falu_fsm <= falu_align;

                        falu_work1 <= '0' & '1' & falu_input(54 downto 0) & '0' & '0';
                        falu_work2 <= '0' & '1' & falus_input(54 downto 0) & '0' & '0';
                        falu_fps(3 downto 0) <= "0000";                                  -- set default for fps bits
                        if falu_input(62 downto 55) = "00000000" then                    -- if the primary input exponent is zero, we don't need to add (or subtract) at all
                           falu_output <= falus_input;
                           falu_fps(3) <= falus_input(63);
                           if falus_input(62 downto 55) = "00000000" then
                              falu_fps(2) <= '1';
                           else
                              falu_fps(2) <= '0';
                           end if;
                           falu_fsm <= falu_idle;
                           falu_done <= '1';
                        elsif falus_input(62 downto 55) = "00000000" then                -- if the secondary input exponent is zero, we don't need to add (or subtract) at all
                           falu_output(62 downto 0) <= falu_input(62 downto 0);
                           if ir(9) = '0' then
                              falu_fps(3) <= falu_input(63);
                              falu_output(63) <= falu_input(63);
                           else
                              falu_fps(3) <= not falu_input(63);
                              falu_output(63) <= not falu_input(63);
                           end if;
                           falu_fsm <= falu_idle;
                           falu_done <= '1';
                        elsif unsigned(falu_input(62 downto 55)) < unsigned(falus_input(62 downto 55)) then
                           falu_ccw <= "00" & (unsigned(falus_input(62 downto 55)) - unsigned(falu_input(62 downto 55)));
                           falu_flag1 <= '1';
                        elsif unsigned(falu_input(62 downto 55)) = unsigned(falus_input(62 downto 55)) then
                           falu_ccw <= (others => '0');
                           if unsigned(falu_input(54 downto 0)) < unsigned(falus_input(54 downto 0)) then
                              falu_flag1 <= '1';
                           else
                              falu_flag1 <= '0';
                           end if;
                        else
                           falu_ccw <= "00" & (unsigned(falu_input(62 downto 55)) - unsigned(falus_input(62 downto 55)));
                           falu_flag1 <= '0';
                        end if;

                     when "0101" =>                                               -- ld(f|d)
                        falu_output <= falu_input;
                        falu_fps(3) <= falu_input(63);
                        if falu_input(62 downto 55) = "00000000" then
                           falu_fps(2) <= '1';
                        else
                           falu_fps(2) <= '0';
                        end if;
                        falu_fps(1 downto 0) <= "00";                             -- set default for fps bits
                        falu_fsm <= falu_idle;
                        falu_done <= '1';

                     when "0111" =>                                               -- cmp(f|d)
                        falu_output <= falus_input;
                        falu_fps(3 downto 0) <= "0000";                           -- set default for fps bits
                        if falu_input(63) = '1' and falus_input(63) = '0' then
                           falu_fps(3) <= '1';
                        elsif falu_input(63) = '0' and falus_input(63) = '0' then
                           if unsigned(falu_input(62 downto 55)) < unsigned(falus_input(62 downto 55)) then
                              falu_fps(3) <= '1';
                           elsif unsigned(falu_input(62 downto 55)) = unsigned(falus_input(62 downto 55)) then
                              if unsigned(falu_input(54 downto 0)) < unsigned(falus_input(54 downto 0)) then
                                 falu_fps(3) <= '1';
                              elsif unsigned(falu_input(54 downto 0)) = unsigned(falus_input(54 downto 0)) then
                                 falu_fps(2) <= '1';
                              else
                                 -- n=0, z=0
                              end if;
                           else
                              -- n=0, z=0
                           end if;
                        elsif falu_input(63) = '1' and falus_input(63) = '1' then
                           if unsigned(falus_input(62 downto 55)) < unsigned(falu_input(62 downto 55)) then
                              falu_fps(3) <= '1';
                           elsif unsigned(falus_input(62 downto 55)) = unsigned(falu_input(62 downto 55)) then
                              if unsigned(falus_input(54 downto 0)) < unsigned(falu_input(54 downto 0)) then
                                 falu_fps(3) <= '1';
                              elsif unsigned(falus_input(54 downto 0)) = unsigned(falu_input(54 downto 0)) then
                                 falu_fps(2) <= '1';
                              else
                                 -- n=0, z=0
                              end if;
                           else
                              -- n=0, z=0
                           end if;
                        end if;

                        if falu_input(62 downto 55) = "00000000" and falus_input(62 downto 55) = "00000000" then
                           falu_fps <= "0100";
                           falu_output <= (others => '0');
                        end if;

                        falu_fsm <= falu_idle;
                        falu_done <= '1';

                     when "1000" =>                                               -- st(f|d)
                        falu_output <= falu_input;
                        falu_fps <= fps(3 downto 0);
                        falu_fsm <= falu_idle;
                        falu_done <= '1';

                     when "1001" =>                                               -- div(f|d)
                        if falu_input(63) = falus_input(63) then                         -- set sign - positive if both operands are same sign, negative otherwise
                           falu_fps(3) <= '0';
                        else
                           falu_fps(3) <= '1';
                        end if;
                        falu_fps(2 downto 0) <= "000";                                   -- set default for other fps bits
                        falu_fsm <= falu_div;
                        falu_work1 <= (others => '0');
                        falu_work2 <= '0' & '1' & falus_input(54 downto 0) & '0' & '0';
                        if falus_input(62 downto 55) = "00000000" then                   -- check ac operand first, then if fsrc is zero, those settings will take precedence over these
                           falu_output <= (others => '0');
                           falu_fps <= "0100";
                           falu_fsm <= falu_idle;
                           falu_done <= '1';
                        end if;
                        if falu_input(62 downto 55) = "00000000" then
                           falu_pending_divz <= '1';
                           falu_output <= falus_input;
                           falu_fps <= fps(3 downto 0);                                  -- the doc is unspecific... but xxdp jfpa seems to expect no updates to fps
                           falu_fsm <= falu_idle;
                           falu_done <= '1';
                        end if;
                        falu_ccw <= "0000111010";

                     when "1010" =>                                               -- stexp
                        falu_output(55 downto 48) <= falu_input(62 downto 55) - "10000000";
                        if unsigned(falu_input(62 downto 55)) < unsigned'("10000000") then
                           falu_fps(3) <= '1';
                           falu_output(63 downto 56) <= (others => '1');
                        else
                           falu_fps(3) <= '0';
                           falu_output(63 downto 56) <= (others => '0');
                        end if;
                        if falu_input(62 downto 55) = "10000000" then
                           falu_fps(2) <= '1';
                        else
                           falu_fps(2) <= '0';
                        end if;
                        falu_fps(1) <= '0';
                        falu_fps(0) <= '0';
                        falu_fsm <= falu_idle;
                        falu_done <= '1';

                     when "1011" =>                                            -- stc(f|d)(i|l)
                        falu_fsm <= falu_shift;
                        falu_fps(3) <= falu_input(63);                         -- n is set from input
                        falu_fps(2 downto 0) <= "000";                         -- set default for other fps bits
                        falu_work1 <= (others => '0');                         -- the idea to use work1 here is that synthesis may reuse the shifter we already have for it
                        if fps(6) = '0' then                                   -- if short integer mode
                           falu_work1(58 downto 43) <= '1' & falu_input(54 downto 40);
                           falu_ccw <= unsigned'("0010010000") - unsigned("00" & falu_input(62 downto 55));   -- exponent minus the bias
                        else
                           if fps(7) = '0' then                                -- if in long integer mode, we need to check if we're in float mode, because then we can only copy 23 bits of fraction
                              falu_work1(58 downto 35) <= '1' & falu_input(54 downto 32);
                           else
                              falu_work1(58 downto 26) <= '1' & falu_input(54 downto 23);
                           end if;
                           if ir(5 downto 3) = "000" or ir(5 downto 0) = "010111" then                           -- reg or mode 2, reg 7
                              falu_ccw <= unsigned'("0010010000") - unsigned("00" & falu_input(62 downto 55));   -- exponent minus the bias
                           else
                              falu_ccw <= unsigned'("0010100000") - unsigned("00" & falu_input(62 downto 55));   -- exponent minus the bias
                           end if;
                        end if;
                        if unsigned(falu_input(62 downto 55)) < unsigned'("10000001") then         -- it is not entirely clear in the manuals, but if the input is less than 1, the output is zero, and only the Z flag is set. It is not a conversion error!
                           falu_output <= (others => '0');
                           falu_fps(3) <= '0';
                           falu_fps(2) <= '1';
                           falu_fps(1) <= '0';
                           falu_fps(0) <= '0';
                           falu_fsm <= falu_idle;
                           falu_done <= '1';
                        end if;

                     when "1100" | "1111" =>                                   -- stc(f|d)(d|f), ldc(d|f)(f|d)
                        falu_fps(3) <= falu_input(63);                                             -- n bit is in most cases a direct copy of the input
                        falu_output(63 downto 55) <= falu_input(63 downto 55);                     -- right in most cases
                        falu_fps(2 downto 0) <= "000";                                             -- set default for other fps bits
                        if falu_input(62 downto 55) = "00000000" then                              -- if the input exponent is zero, then the z bit in fps must be set
                           falu_fps(2) <= '1';
                           falu_fps(3) <= '0';                                                     -- negative zero exp is ignored
                           falu_output <= (others => '0');
                        else
                           falu_fps(2) <= '0';
                           if (fps(7) = '0' and ir(11 downto 8) = "1100") or (fps(7) = '1' and ir(11 downto 8) = "1111") then          -- convert to a double, or to a float?
                              falu_output(54 downto 32) <= falu_input(54 downto 32);               -- just copy the high part if converting f to d
                              falu_output(31 downto 0) <= "00000000000000000000000000000000";      -- and set the low part to zeroes
                           else
                              if fps(5) = '1' then                                                 -- on d to f conversion, if round/trunc is trunc
                                 falu_output(54 downto 32) <= falu_input(54 downto 32);            -- just copy the high part
                                 falu_output(31 downto 0) <= "00000000000000000000000000000000";   -- and set the low part to zeroes
                              else
                                 if falu_input(62 downto 31) = "11111111111111111111111111111111" then       -- this bit pattern causes overflow to occur
                                    falu_output(62 downto 32) <= "0000000000000000000000000000000";          -- result after overflow is zeroes
                                    falu_fps(2) <= '1';                                                      -- set z bit, because of zeroes we just set!
                                    falu_fps(1) <= '1';                                                      -- set v bit to signal overflow
                                    if fps(9) = '1' then                                           -- if fiv enabled
                                       falu_pending_fiv <= '1';                                    -- then signal the pending interrupt
                                    end if;
                                 else
                                    falu_output(62 downto 31) <= falu_input(62 downto 31) + "1";   -- normal case, round bit added. Note that I count on normal arithmetic to handle increasing the exponent, if that is necessary to handle an overflow of the fraction part
                                 end if;
                                 falu_output(31 downto 0) <= "00000000000000000000000000000000";   -- in all cases, the low part is cleared
                              end if;
                           end if;
                        end if;
                        falu_fsm <= falu_idle;
                        falu_done <= '1';

                     when "1101" =>                                               -- ldexp
                        falu_output(63) <= falu_input(63);                                  -- setup sign, in all cases a copy of the input
                        falu_output(54 downto 0) <= falu_input(54 downto 0);                -- fraction is in all cases same as input
                        falu_fps(3) <= falu_input(63);                                      -- setup n bit
                        falu_fps(2 downto 0) <= "000";                                      -- set default for other fps bits
                        if falus_input(55) = '1' then                                       -- sign bit on, ie. is this a negative 2-complement integer
                           if falus_input(54 downto 47) = "11111111"                        -- if yes, then the next 8 bits need to be ones too, else it is an overflow
                           and falus_input(47 downto 40) /= "10000000" then                 -- would produce an overflow as well - special case
                              falu_output(62 downto 55) <= falus_input(47 downto 40) + "10000000";    -- not an overflow --> assign the new exponent, biased w. 200 oct
                           else
                              if fps(10) = '1' then                                                   -- if fiu enabled
                                 falu_output(62 downto 55) <= falus_input(47 downto 40) + "10000000";
                                 if falus_input(47 downto 40) + "10000000" = "00000000" then
                                    falu_fps(2) <= '1';
                                 end if;
                                 falu_pending_fiu <= '1';
                              else
                                 falu_output <= (others => '0');                                      -- if fiu disabled, just set the output to zeroes
                                 falu_fps(2) <= '1';                                                  -- and dont forget to set the z bit either
                                 falu_fps(3) <= '0';                                                  -- and also dont forget zero is not negative
                              end if;
                           end if;
                        else                                                                -- positive exponent
                           if falus_input(54 downto 47) = "00000000" then                   -- for a positive exponent, the high 8 bits must be clear, otherwise it is an overflow
                              falu_output(62 downto 55) <= falus_input(47 downto 40) + "10000000";    -- not overflow - assign new exponent biased w. 200 oct
                           else
                              falu_fps(1) <= '1';                                           -- v bit is set only when exponent > 177
                              if fps(9) = '1' then                                          -- if fiv is enabled
                                 falu_output(62 downto 55) <= falus_input(47 downto 40) + "10000000";
                                 if falus_input(47 downto 40) + "10000000" = "00000000" then
                                    falu_fps(2) <= '1';
                                 end if;
                                 falu_pending_fiv <= '1';
                              else                                                          -- if fiv is disabled
                                 falu_output <= (others => '0');                            -- set the output to all zeroes
                                 falu_fps(2) <= '1';                                        -- set z bit as well
                                 falu_fps(3) <= '0';
                              end if;
                           end if;
                        end if;
                        falu_fsm <= falu_idle;
                        falu_done <= '1';


                  when "1110" =>                                               -- ldc(i|l)(f|d)
                     falu_fsm <= falu_norm;
                     falu_fps(2 downto 0) <= "000";                            -- set default for fps bits
                     if fps(6) = '0'
                     or ir(5 downto 3) = "000"
                     or ir(5 downto 0) = "010111"                              -- mode 2, reg 7 only
                     then
                        if fps(6) = '1' then                                   -- if fl is set ie long mode, mode must be 0 or mode 2, reg 7, and the strange exception to use the single 16bit word as the upper applies.
                           falu_ccw <= "0010011111";                           -- 37(8) or 31(10), max number of shifts for long mode; special case
                        else
                           falu_ccw <= "0010001111";                           -- 17(8) or 15(10), max number of shifts for integer mode
                        end if;
                        falu_work1 <= (others => '0');
                        if falu_input(39) = '1' then
                           falu_fps(3) <= '1';
                           falu_work1(58 downto 43) <= (not falu_input(39 downto 24)) + 1;
                        else
                           falu_fps(3) <= '0';
                           falu_work1(58 downto 43) <= falu_input(39 downto 24);
                        end if;
                     else
                        falu_ccw <= "0010011111";                              -- 37(8) or 31(10), max number of shifts for long mode
                        falu_work1 <= (others => '0');
                        if falu_input(55) = '1' then
                           falu_fps(3) <= '1';
                           falu_work1(58 downto 27) <= (not falu_input(55 downto 24)) + 1;
                        else
                           falu_fps(3) <= '0';
                           falu_work1(58 downto 27) <= falu_input(55 downto 24);
                        end if;
                     end if;

                     when others =>
                        null;

                  end case;

               else

                  case falu_fsm is


-- multiply, ie. shifting and adding
-- this does not deal with the fd bit - all mult operations are full precision, regardless of the bit. The core
-- would be significantly faster for single prec if we would deal with the fd bit. FIXME!

                     when falu_mult =>
                        if falu_work2(57 downto 2) /= "00000000000000000000000000000000000000000000000000000000" then
                           if falu_work2(2) = '1' then                                                                           -- if lowest order bit is a one
                              falu_work1 <= ('0' & falu_work1(58 downto 1) + ('0' & '1' & falu_input(54 downto 0) & "00"));      -- then shift right and add
                           else
                              falu_work1 <= '0' & falu_work1(58 downto 1);                                                       -- if not set, then only shift right
                           end if;
                           falu_work2 <= '0' & falu_work2(58 downto 1);                                                          -- shift right for next round
                        else
                           falu_fsm <= falu_norm;                                                                                -- if all bits done, then go into normalize state
                        end if;


-- align the operands for addition or subtraction
-- flag1 has which one of the operands needs to be shifted - and also, check the fd bit to see what the maximum value of the shift should be
-- falu_ccw has the difference - if it is 0, or shift- and decrement to 0, the addition/subtraction state is next up

                     when falu_align =>
                        if falu_ccw /= "0000000000" then
                           if falu_flag1 = '1' then
                              falu_work1 <= '0' & falu_work1(58 downto 1);
                           else
                              falu_work2 <= '0' & falu_work2(58 downto 1);
                           end if;

                           if fps(7) = '1' and unsigned(falu_ccw) > unsigned'("0000111001") then           -- > 57 ??
                              falu_ccw <= "0000000000";
                              if falu_flag1 = '1' then
                                 falu_work1 <= (others => '0');
                              else
                                 falu_work2 <= (others => '0');
                              end if;
                              falu_fsm <= falu_addsub;
                           elsif fps(7) = '0' and unsigned(falu_ccw) > unsigned'("0000011001") then        -- > 25 ??
                              falu_ccw <= "0000000000";
                              if falu_flag1 = '1' then
                                 falu_work1 <= (others => '0');
                              else
                                 falu_work2 <= (others => '0');
                              end if;
                              falu_fsm <= falu_addsub;
                           else
                              falu_ccw <= falu_ccw - 1;
                           end if;
                        else
                           falu_fsm <= falu_addsub;
                        end if;


                     when falu_addsub =>

-- this statement:
--                     case ir(9) & falu_input(63) & falus_input(63) & falu_flag1  is
-- would be a nice and elegant way to express what I would like
-- alas, ISE cannot translate it. See:
-- AR #22098 - 8.2i XST-"ERROR:HDLParsers:818 - Cannot determine the type of the selector &"

                        v_caseworkaround := ir(9) & falu_input(63) & falus_input(63) & falu_flag1;
                        case v_caseworkaround is
                           when "0000" | "0001" =>                       -- add, +|+
                              falu_work1 <= falu_work1 + falu_work2;
                              falu_fps(3) <= '0';

                           when "0100" =>                                -- add, !work1<work2, -|+
                              falu_work1 <= falu_work1 - falu_work2;
                              falu_fps(3) <= '1';

                           when "0101" =>                                -- add, work1<work2, -|+
                              falu_work1 <= falu_work2 - falu_work1;
                              falu_fps(3) <= '0';

                           when "0010" =>                                -- add, !work1<work2, +|-
                              falu_work1 <= falu_work1 - falu_work2;
                              falu_fps(3) <= '0';

                           when "0011" =>                                -- add, work1<work2, +|-
                              falu_work1 <= falu_work2 - falu_work1;
                              falu_fps(3) <= '1';

                           when "0110" | "0111" =>                       -- add, -|-
                              falu_work1 <= falu_work1 + falu_work2;
                              falu_fps(3) <= '1';

                           when "1000" =>                                -- sub, !work1<work2, +|+
                              falu_work1 <= falu_work1 - falu_work2;
                              falu_fps(3) <= '1';

                           when "1001" =>                                -- sub, work1<work2, +|+
                              falu_work1 <= falu_work2 - falu_work1;
                              falu_fps(3) <= '0';

                           when "1100" | "1101" =>                       -- sub, -|+
                              falu_work1 <= falu_work2 + falu_work1;
                              falu_fps(3) <= '0';

                           when "1010" | "1011" =>                       -- sub, +|-
                              falu_work1 <= falu_work2 + falu_work1;
                              falu_fps(3) <= '1';

                           when "1110" =>                                -- sub, !work1<work2, -|-
                              falu_work1 <= falu_work1 - falu_work2;
                              falu_fps(3) <= '0';

                           when "1111" =>                                -- sub, work1<work2, -|-
                              falu_work1 <= falu_work2 - falu_work1;
                              falu_fps(3) <= '1';

                           when others =>
                              null;
                        end case;

                        if falu_flag1 = '1' then
                           falu_ccw <= "00" & falus_input(62 downto 55);
                        else
                           falu_ccw <= "00" & falu_input(62 downto 55);
                        end if;
                        falu_fsm <= falu_norm;


                     when falu_div =>
                        if unsigned(falu_work2) >= unsigned('0' & '1' & falu_input(54 downto 0) & "00") then
                           falu_work1 <= falu_work1(57 downto 0) & '1';
                           falu_work2 <= unsigned(falu_work2(57 downto 0) & '0') - unsigned('1' & falu_input(54 downto 0) & "000");
                        else
                           falu_work1 <= falu_work1(57 downto 0) & '0';
                           falu_work2 <= falu_work2(57 downto 0) & '0';
                        end if;
                        if falu_ccw /= "0000000000" then
                           falu_ccw <= falu_ccw - 1;
                        else
                           falu_fsm <= falu_norm;
                           falu_ccw <= unsigned("00" & falus_input(62 downto 55)) - unsigned("00" & falu_input(62 downto 55)) + unsigned'("0010000000");
                        end if;


                     when falu_shift =>
                        if falu_ccw /= "0000000000" then
                           falu_work1 <= '0' & falu_work1(58 downto 1);
                           falu_ccw <= falu_ccw - 1;
                        else
                           falu_output <= (others => '0');
                           if falu_input(63) = '1' then
                              falu_output(63 downto 32) <= (not falu_work1(58 downto 27)) + 1;
                           else
                              falu_output(63 downto 32) <= falu_work1(58 downto 27);
                           end if;
                           falu_fsm <= falu_shift2;
                        end if;

                        if fps(6) = '0' then
                           if unsigned(falu_ccw) > unsigned'("0000001111") then
                              falu_fsm <= falu_shifte;
                           end if;
                        else
                           if unsigned(falu_ccw) > unsigned'("0000011111") then
                              falu_fsm <= falu_shifte;
                           end if;
                        end if;

                     when falu_shift2 =>
                        if falu_output(63 downto 48) = "0000000000000000" then
                           if fps(6) = '0' then
                              falu_fps(3) <= '0';
                              falu_fps(2) <= '1';
                           else
                              if falu_output(47 downto 32) = "0000000000000000" then
                                 falu_fps(3) <= '0';
                                 falu_fps(2) <= '1';
                              end if;
                           end if;
                        end if;
                        if falu_output(63) /= falu_input(63) then
                           falu_fsm <= falu_shifte;
                        else
                           falu_fsm <= falu_idle;
                           falu_done <= '1';
                        end if;

                     when falu_shifte =>
                        falu_fps(3) <= '0';                              -- on error, result is not negative
                        falu_fps(2) <= '1';
                        falu_fps(1) <= '0';                              -- V bit is not used
                        falu_fps(0) <= '1';
                        falu_output <= (others => '0');
                        if fps(8) = '1' then
                           falu_pending_fic <= '1';
                        end if;
                        falu_fsm <= falu_idle;
                        falu_done <= '1';


                     when falu_norm =>
                        if falu_work1(58 downto 57) = "01" then                    -- hidden bit in the right place, overflow bit clear?
                           if ir(11 downto 8) = "0011" then
                              falu_fsm <= falu_sep;
                           else
                              falu_fsm <= falu_rt;
                           end if;
                        elsif falu_work1(58) = '1' then                            -- is the overflow bit set?
                           falu_work1 <= '0' & falu_work1(58 downto 1);            -- shift right
                           falu_ccw <= falu_ccw + 1;                               -- increase exponent
                           if ir(11 downto 8) = "0011" then
                              falu_fsm <= falu_sep;
                           else
                              falu_fsm <= falu_rt;
                           end if;
                        else
--                                                        76543210987654321098765432109876543210987654321098765432
                           if falu_work1(57 downto 2) /= "00000000000000000000000000000000000000000000000000000000" then
                              falu_work1 <= falu_work1(57 downto 0) & '0';         -- shift left
                              falu_ccw <= falu_ccw - 1;                            -- decrease exponent
                           else                                                    -- coming here, we have lost all ones from the fraction; the output is zero
                              falu_fps(3) <= '0';                                  -- make sure that the n bit is cleared
                              falu_fsm <= falu_zres;                               -- result is zero
                           end if;
                        end if;


                     when falu_sep =>
                        if signed(falu_ccw) <= signed'("0010000000") then
                           falu_output2 <= (others => '0');
                           falu_fsm <= falu_rt;
                        elsif (signed(falu_ccw) > signed'("0010011000") and fps(7) = '0') or (signed(falu_ccw) > signed'("0010111000") and fps(7) = '1') then
                           falu_fsm <= falu_sep3;
                        else
                           falu_output2(63) <= falu_fps(3);
                           falu_output2(62 downto 55) <= falu_ccw(7 downto 0);
                           falu_output2(54 downto 0) <= falu_work1(56 downto 2);
                           falu_fsm <= falu_sep2;
                           falu_work2 <= (others => '0');
                           falu_work2(58 downto 57) <= "10";
                        end if;


                     when falu_sep2 =>
                        if signed(falu_ccw) > signed'("0010000000") then
                           falu_work1 <= falu_work1(57 downto 0) & '0';        -- shift left
                           falu_work2 <= '1' & falu_work2(58 downto 1);        -- shift right
                           falu_ccw <= falu_ccw - 1;
                        elsif falu_work1(57) /= '1' and falu_ccw /= "0000000000" then
                           falu_work1 <= falu_work1(57 downto 0) & '0';        -- shift left
                           falu_ccw <= falu_ccw - 1;
                           if falu_work1(57 downto 2) = "00000000000000000000000000000000000000000000000000000000" then
                              falu_ccw <= "0000000000";
                           end if;
                        else
                           falu_output2(54 downto 0) <= falu_output2(54 downto 0) and falu_work2(56 downto 2);
                           falu_fsm <= falu_res;
                           if falu_ccw = "0000000000" then
                              falu_fsm <= falu_zres;                           -- zero result handled directly, because res would wrongly raise an underflow
                           end if;
                        end if;


                     when falu_sep3 =>
                        falu_output <= (others => '0');                                  -- set fraction output to zero
                        falu_fps(3) <= '0';                                              -- if the fraction is zero, so is its sign
                        falu_fps(2) <= '1';                                              -- set z for fraction
                        falu_output2(63) <= falu_fps(3);
                        falu_output2(62 downto 55) <= falu_ccw(7 downto 0);
                        falu_output2(54 downto 0) <= falu_work1(56 downto 2);
                        if falu_ccw(8) = '1' and falu_ccw(9) /= '1' then                 -- overflow?
                           falu_fps(1) <= '1';                                           -- set the flag
                           if fps(9) = '1' then                                          -- are overflow traps enabled?
                              falu_pending_fiv <= '1';                                   -- yes, set flag
                           else
                              falu_output2 <= (others => '0');
                           end if;
                        end if;
                        falu_done <= '1';
                        falu_fsm <= falu_idle;


                     when falu_rt =>
                        if fps(5) = '0' then
                           if fps(7) = '0' then
--                                                                                           87654321098765432109876543       210987654321098765432109876543210
                              falu_work1 <= (unsigned(falu_work1(58 downto 33)) + unsigned'("00000000000000000000000001")) & "000000000000000000000000000000000";
                           else
                              falu_work1 <= falu_work1 + "10";
                           end if;
                        end if;
                        falu_fsm <= falu_rtc;


                     when falu_rtc =>
                        if falu_work1(58) = '1' then
                           falu_work1 <= '0' & falu_work1(58 downto 1);
                           falu_ccw <= falu_ccw + 1;
                        end if;
                        falu_fsm <= falu_res;


                     when falu_res =>
                        falu_output(63) <= falu_fps(3);
                        falu_output(62 downto 55) <= falu_ccw(7 downto 0);
                        falu_output(54 downto 0) <= falu_work1(56 downto 2);
                        falu_done <= '1';
                        falu_fsm <= falu_idle;
                        if falu_ccw(7 downto 0) = "00000000" then
                           falu_fps(2) <= '1';
                        else
                           falu_fps(2) <= '0';
                        end if;
                        if falu_ccw(9) = '1' or falu_ccw(9 downto 0) = "0000000000" then
                           if fps(10) = '1' then                                         -- are underflow traps enabled?
                              falu_pending_fiu <= '1';                                   -- yes, set flag
                           else
                              falu_fsm <= falu_zres;                                     -- traps are not enabled, output is zero
                           end if;
                        elsif falu_ccw(8) = '1' then
                           falu_fps(1) <= '1';                                           -- set the flag
                           if fps(9) = '1' then                                          -- are overflow traps enabled?
                              falu_pending_fiv <= '1';                                   -- yes, set flag
                           else
                              falu_fsm <= falu_zres;                                     -- traps are not enabled, output is zero
                           end if;
                        end if;


                     when falu_zres =>
                        falu_output <= (others => '0');
                        falu_fps(3) <= '0';
                        falu_fps(2) <= '1';
                        falu_fps(0) <= '0';
                        falu_done <= '1';
                        falu_fsm <= falu_idle;


                     when falu_idle =>
                        falu_done <= '0';
                        falu_ccw <= (others => '0');
                        falu_work1 <= (others => '0');
                        falu_work2 <= (others => '0');
                        falu_flag1 <= '0';

                     when others =>
                        null;

                  end case;
               end if;


            elsif ir_fpsop2 = '1' then
               case ir(7 downto 6) is

                  when "00" =>                                                 -- clr(f/d)
                     falu_output <= (others => '0');
                     falu_fps(3 downto 0) <= "0100";

                  when "01" =>                                                 -- tst(f/d)
                     falu_output <= falu_input;
                     if falu_input(62 downto 55) = "00000000" then
                        falu_fps(2) <= '1';
                        falu_output <= (others => '0');
                     else
                        falu_fps(2) <= '0';
                     end if;
                     falu_fps(3) <= falu_input(63);
                     falu_fps(1) <= '0';
                     falu_fps(0) <= '0';

                  when "10" =>                                                 -- abs(f/d)
                     falu_output <= '0' & falu_input(62 downto 0);
                     if falu_input(62 downto 55) = "00000000" then
                        falu_fps(2) <= '1';
                        falu_output <= (others => '0');
                     else
                        falu_fps(2) <= '0';
                     end if;
                     falu_fps(3) <= '0';
                     falu_fps(1) <= '0';
                     falu_fps(0) <= '0';

                  when "11" =>                                                 -- neg(f/d)
                     if falu_input(63) = '0' then
                        falu_output <= '1' & falu_input(62 downto 0);
                        falu_fps(3) <= '1';
                     else
                        falu_output <= '0' & falu_input(62 downto 0);
                        falu_fps(3) <= '0';
                     end if;
                     if falu_input(62 downto 55) = "00000000" then
                        falu_output <= (others => '0');
                        falu_fps(2) <= '1';
                        falu_fps(3) <= '0';
                     else
                        falu_fps(2) <= '0';
                     end if;
                     falu_fps(1) <= '0';
                     falu_fps(0) <= '0';

                  when others =>
                     falu_output <= (others => 'X');
                     falu_fps(3 downto 0) <= "XXXX";

               end case;
               falu_output2 <= (others => 'X');
            else
               falu_output <= (others => 'X');
               falu_output2 <= (others => 'X');
               falu_fps(3 downto 0) <= "XXXX";
            end if;
         end if;

      end if;

   end process;

end implementation;

