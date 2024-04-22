-- $Id: cpu09new.vhd,v 1.1 2007-12-09 16:06:03 dilbert57 Exp $
--===========================================================================----
--
--  S Y N T H E S I Z A B L E    CPU09 - 6809 compatible CPU Core
--
--  www.OpenCores.Org - September 2003
--  This core adheres to the GNU public license
--
-- File name      : cpu09.vhd
--
-- Purpose        : 6809 CPU core
--
-- Dependencies   : ieee.Std_Logic_1164
--                  ieee.std_logic_unsigned
--
-- Uses           : None
--
-- Author         : John E. Kent
--                  dilbert57@opencores.org
--
--===========================================================================----
--
-- Revision History:
--===========================================================================--
--
-- Version 0.1 - 26 June 2003 - John Kent
-- Added extra level in state stack
-- fixed some calls to the extended addressing state
--
-- Version 0.2 - 5 Sept 2003 - John Kent
-- Fixed 16 bit indexed offset (was doing read rather than fetch)
-- Added/Fixed STY and STS instructions.
-- ORCC_STATE ANDed CC state rather than ORed it - Now fixed
-- CMPX Loaded ACCA and ACCB - Now fixed
--
-- Version 1.0 - 6 Sep 2003 - John Kent
-- Initial release to Open Cores
-- reversed clock edge
--
-- Version 1.1 - 29 November 2003 John kent
--      ACCA and ACCB indexed offsets are 2's complement.
-- ALU Right Mux now sign extends ACCA & ACCB offsets
-- Absolute Indirect addressing performed a read on the
-- second byte of the address rather than a fetch
-- so it formed an incorrect address. Now fixed.
--
-- Version 1.2 - 29 November 2003 John Kent
-- LEAX and LEAY affect the Z bit only
--      LEAS and LEAU do not affect any condition codes
-- added an extra ALU control for LEA.
--
-- Version 1.3 - 12 December 2003 John Kent
-- CWAI did not work, was missed a PUSH_ST on calling
-- the ANDCC_STATE. Thanks go to Ghassan Kraidy for
-- finding this fault.
--
-- Version 1.4 - 12 December 2003 John Kent
-- Missing cc_ctrl assignment in otherwise case of
-- lea_state resulted in cc_ctrl being latched in
-- that state.
-- The otherwise statement should never be reached,
-- and has been fixed simply to resolve synthesis warnings.
--
-- Version 1.5 - 17 january 2004 John kent
-- The clear instruction used "alu_ld8" to control the ALU
-- rather than "alu_clr". This mean the Carry was not being
-- cleared correctly.
--
-- Version 1.6 - 24 January 2004 John Kent
-- Fixed problems in PSHU instruction
--
-- Version 1.7 - 25 January 2004 John Kent
-- removed redundant "alu_inx" and "alu_dex'
-- Removed "test_alu" and "test_cc"
-- STD instruction did not set condition codes
-- JMP direct was not decoded properly
-- CLR direct performed an unwanted read cycle
-- Bogus "latch_md" in Page2 indexed addressing
--
-- Version 1.8 - 27 January 2004 John Kent
-- CWAI in decode1_state should increment the PC.
-- ABX is supposed to be an unsigned addition.
-- Added extra ALU function
-- ASR8 slightly changed in the ALU.
--
--      Version 1.9 - 20 August 2005
-- LSR8 is now handled in ASR8 and ROR8 case in the ALU,
-- rather than LSR16. There was a problem with single
-- operand instructions using the MD register which is
-- sign extended on the first 8 bit fetch.
--
-- Version 1.10 - 13 September 2005
-- TFR & EXG instructions did not work for the Condition Code Register
-- An extra case has been added to the ALU for the alu_tfr control
-- to assign the left ALU input (alu_left) to the condition code
-- outputs (cc_out).
--
-- Version 1.11 - 16 September 2005
-- JSR ,X should not predecrement S before calculating the jump address.
-- The reason is that JSR [0,S] needs S to point to the top of the stack
-- to fetch a valid vector address. The solution is to have the addressing
-- mode microcode called before decrementing S and then decrementing S in
-- JSR_STATE. JSR_STATE in turn calls PUSH_RETURN_LO_STATE rather than
-- PUSH_RETURN_HI_STATE so that both the High & Low halves of the PC are
-- pushed on the stack. This adds one extra bus cycle, but resolves the
-- addressing conflict. I've also removed the pre-decement S in
-- JSR EXTENDED as it also calls JSR_STATE.
--
-- Version 1.12 - 6th June 2006
-- 6809 Programming reference manual says V is not affected by ASR, LSR and ROR
-- This is different to the 6800. CLR should reset the V bit.
--
-- Version 1.13 - 7th July 2006
-- Disable NMI on reset until S Stack pointer has been loaded.
-- Added nmi_enable signal in sp_reg process and nmi_handler process.
--
-- Version 1.4 - 11th July 2006
-- 1. Added new state to RTI called rti_entire_state.
-- This state tests the CC register after it has been loaded
-- from the stack. Previously the current CC was tested which
-- was incorrect. The Entire Flag should be set before the
-- interrupt stacks the CC.
-- 2. On bogus Interrupts, int_cc_state went to rti_state,
-- which was an enumerated state, but not defined anywhere.
-- rti_state has been changed to rti_cc_state so that bogus interrupt
-- will perform an RTI after entering that state.
-- 3. Sync should generate an interrupt if the interrupt masks
-- are cleared. If the interrupt masks are set, then an interrupt
-- will cause the the PC to advance to the next instruction.
-- Note that I don't wait for an interrupt to be asserted for
-- three clock cycles.
-- 4. Added new ALU control state "alu_mul". "alu_mul" is used in
-- the Multiply instruction replacing "alu_add16". This is similar
-- to "alu_add16" except it sets the Carry bit to B7 of the result
-- in ACCB, sets the Zero bit if the 16 bit result is zero, but
-- does not affect The Half carry (H), Negative (N) or Overflow (V)
-- flags. The logic was re-arranged so that it adds md or zero so
-- that the Carry condition code is set on zero multiplicands.
-- 5. DAA (Decimal Adjust Accumulator) should set the Negative (N)
-- and Zero Flags. It will also affect the Overflow (V) flag although
-- the operation is undefined. It's anyones guess what DAA does to V.
--
--
-- Version 1.5  Jan 2007 - B. Cuzeau
--  * all rising_edge !
--  * code style,
--  * sensitivity lists
--  * cosmetic changes
--  * Added PC_OUT for debug purpose
--  * if halt <='1' line 9618 fixed

Library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_unsigned.all;

entity cpu09 is
  port (  clk      : in  std_logic;
          rst      : in  std_logic;
          rw       : out std_logic;
          vma      : out std_logic;
          address  : out std_logic_vector(15 downto 0);
          data_in  : in  std_logic_vector(7 downto 0);
          data_out : out std_logic_vector(7 downto 0);
          halt     : in  std_logic;
          hold     : in  std_logic;
          irq      : in  std_logic;
          firq     : in  std_logic;
          nmi      : in  std_logic;
          pc_out   : out std_logic_vector(15 downto 0)  -- For debug purpose
      );
end;

architecture CPU_ARCH of cpu09 is

  constant EBIT : integer := 7;
  constant FBIT : integer := 6;
  constant HBIT : integer := 5;
  constant IBIT : integer := 4;
  constant NBIT : integer := 3;
  constant ZBIT : integer := 2;
  constant VBIT : integer := 1;
  constant CBIT : integer := 0;

  --
  -- Interrupt vector modifiers
  --
  constant RST_VEC  : std_logic_vector(2 downto 0) := "111";
  constant NMI_VEC  : std_logic_vector(2 downto 0) := "110";
  constant SWI_VEC  : std_logic_vector(2 downto 0) := "101";
  constant IRQ_VEC  : std_logic_vector(2 downto 0) := "100";
  constant FIRQ_VEC : std_logic_vector(2 downto 0) := "011";
  constant SWI2_VEC : std_logic_vector(2 downto 0) := "010";
  constant SWI3_VEC : std_logic_vector(2 downto 0) := "001";
  constant RESV_VEC : std_logic_vector(2 downto 0) := "000";

  type state_type is (
    -- Start off in Reset
    reset_state,
    -- Fetch Interrupt Vectors (including reset)
    vect_lo_state, vect_hi_state,
    -- Fetch Instruction Cycle
    fetch_state,
    -- Decode Instruction Cycles
    decode1_state, decode2_state, decode3_state,
    -- Calculate Effective Address
    imm16_state,
    indexed_state, index8_state, index16_state, index16_2_state,
    pcrel8_state, pcrel16_state, pcrel16_2_state,
    indexaddr_state, indexaddr2_state,
    postincr1_state, postincr2_state,
    indirect_state, indirect2_state, indirect3_state,
    extended_state,
    -- single ops
    single_op_read_state,
    single_op_exec_state,
    single_op_write_state,
    -- Dual op states
    dual_op_read8_state, dual_op_read16_state, dual_op_read16_2_state,
    dual_op_write8_state, dual_op_write16_state,
    --
    sync_state, halt_state, error_state,
    --
    andcc_state, orcc_state,
    tfr_state, exg_state, exg1_state,
    lea_state,
    -- Multiplication
    mul_state, mulea_state, muld_state,
    mul0_state, mul1_state, mul2_state, mul3_state,
    mul4_state, mul5_state, mul6_state, mul7_state,
    --  Branches
    lbranch_state, sbranch_state,
    -- Jumps, Subroutine Calls and Returns
    jsr_state, jmp_state,
    push_return_hi_state, push_return_lo_state,
    pull_return_hi_state, pull_return_lo_state,
    -- Interrupt cycles
    int_decr_state,
    int_entire_state,
    int_pcl_state, int_pch_state,
    int_upl_state, int_uph_state,
    int_iyl_state, int_iyh_state,
    int_ixl_state, int_ixh_state,
    int_cc_state,
    int_acca_state, int_accb_state,
    int_dp_state,
    int_cwai_state, int_mask_state,
    -- Return From Interrupt
    rti_cc_state, rti_entire_state,
    rti_acca_state, rti_accb_state,
    rti_dp_state,
    rti_ixl_state, rti_ixh_state,
    rti_iyl_state, rti_iyh_state,
    rti_upl_state, rti_uph_state,
    rti_pcl_state, rti_pch_state,
    -- Push Registers using SP
    pshs_state,
    pshs_pcl_state, pshs_pch_state,
    pshs_upl_state, pshs_uph_state,
    pshs_iyl_state, pshs_iyh_state,
    pshs_ixl_state, pshs_ixh_state,
    pshs_dp_state,
    pshs_acca_state, pshs_accb_state,
    pshs_cc_state,
    -- Pull Registers using SP
    puls_state,
    puls_cc_state,
    puls_acca_state, puls_accb_state,
    puls_dp_state,
    puls_ixl_state, puls_ixh_state,
    puls_iyl_state, puls_iyh_state,
    puls_upl_state, puls_uph_state,
    puls_pcl_state, puls_pch_state,
    -- Push Registers using UP
    pshu_state,
    pshu_pcl_state, pshu_pch_state,
    pshu_spl_state, pshu_sph_state,
    pshu_iyl_state, pshu_iyh_state,
    pshu_ixl_state, pshu_ixh_state,
    pshu_dp_state,
    pshu_acca_state, pshu_accb_state,
    pshu_cc_state,
    -- Pull Registers using UP
    pulu_state,
    pulu_cc_state,
    pulu_acca_state, pulu_accb_state,
    pulu_dp_state,
    pulu_ixl_state, pulu_ixh_state,
    pulu_iyl_state, pulu_iyh_state,
    pulu_spl_state, pulu_sph_state,
    pulu_pcl_state, pulu_pch_state);

  type stack_type is array(2 downto 0) of state_type;
  type st_type    is (idle_st, push_st, pull_st);
  type addr_type  is (idle_ad, fetch_ad, read_ad, write_ad, pushu_ad, pullu_ad, pushs_ad, pulls_ad, int_hi_ad, int_lo_ad);
  type dout_type  is (cc_dout, acca_dout, accb_dout, dp_dout,
                      ix_lo_dout, ix_hi_dout, iy_lo_dout, iy_hi_dout,
                      up_lo_dout, up_hi_dout, sp_lo_dout, sp_hi_dout,
                      pc_lo_dout, pc_hi_dout, md_lo_dout, md_hi_dout);
  type op_type    is (reset_op, fetch_op, latch_op);
  type pre_type   is (reset_pre, fetch_pre, latch_pre);
  type cc_type    is (reset_cc, load_cc, pull_cc, latch_cc);
  type acca_type  is (reset_acca, load_acca, load_hi_acca, pull_acca, latch_acca);
  type accb_type  is (reset_accb, load_accb, pull_accb, latch_accb);
  type dp_type    is (reset_dp, load_dp, pull_dp, latch_dp);
  type ix_type    is (reset_ix, load_ix, pull_lo_ix, pull_hi_ix, latch_ix);
  type iy_type    is (reset_iy, load_iy, pull_lo_iy, pull_hi_iy, latch_iy);
  type sp_type    is (reset_sp, latch_sp, load_sp, pull_hi_sp, pull_lo_sp);
  type up_type    is (reset_up, latch_up, load_up, pull_hi_up, pull_lo_up);
  type pc_type    is (reset_pc, latch_pc, load_pc, pull_lo_pc, pull_hi_pc, incr_pc);
  type md_type    is (reset_md, latch_md, load_md, fetch_first_md, fetch_next_md, shiftl_md);
  type ea_type    is (reset_ea, latch_ea, load_ea, fetch_first_ea, fetch_next_ea);
  type iv_type    is (reset_iv, latch_iv, nmi_iv, irq_iv, firq_iv, swi_iv, swi2_iv, swi3_iv, resv_iv);
  type nmi_type   is (reset_nmi, set_nmi, latch_nmi);
  type left_type  is (cc_left, acca_left, accb_left, dp_left,
                      ix_left, iy_left, up_left, sp_left,
                      accd_left, md_left, pc_left, ea_left);
  type right_type is (ea_right, zero_right, one_right, two_right,
                      acca_right, accb_right, accd_right,
                      md_right, md_sign5_right, md_sign8_right);
  type alu_type   is (alu_add8, alu_sub8, alu_add16, alu_sub16, alu_adc, alu_sbc,
                      alu_and, alu_ora, alu_eor,
                      alu_tst, alu_inc, alu_dec, alu_clr, alu_neg, alu_com,
                      alu_lsr16, alu_lsl16,
                      alu_ror8, alu_rol8, alu_mul,
                      alu_asr8, alu_asl8, alu_lsr8,
                      alu_andcc, alu_orcc, alu_sex, alu_tfr, alu_abx,
                      alu_seif, alu_sei, alu_see, alu_cle,
                      alu_ld8, alu_st8, alu_ld16, alu_st16, alu_lea, alu_nop, alu_daa);

  signal op_code      : std_logic_vector(7 downto 0);
  signal pre_code     : std_logic_vector(7 downto 0);
  signal acca         : std_logic_vector(7 downto 0);
  signal accb         : std_logic_vector(7 downto 0);
  signal cc           : std_logic_vector(7 downto 0);
  signal cc_out       : std_logic_vector(7 downto 0);
  signal dp           : std_logic_vector(7 downto 0);
  signal xreg         : std_logic_vector(15 downto 0);
  signal yreg         : std_logic_vector(15 downto 0);
  signal sp           : std_logic_vector(15 downto 0);
  signal up           : std_logic_vector(15 downto 0);
  signal ea           : std_logic_vector(15 downto 0);
  signal pc           : std_logic_vector(15 downto 0);
  signal md           : std_logic_vector(15 downto 0);
  signal left         : std_logic_vector(15 downto 0);
  signal right        : std_logic_vector(15 downto 0);
  signal out_alu      : std_logic_vector(15 downto 0);
  signal iv           : std_logic_vector(2 downto 0);
  signal nmi_req      : std_logic;
  signal nmi_ack      : std_logic;
  signal nmi_enable   : std_logic;

  signal state        : state_type;
  signal next_state   : state_type;
  signal saved_state  : state_type;
  signal return_state : state_type;
  signal state_stack  : stack_type;
  signal st_ctrl      : st_type;
  signal pc_ctrl      : pc_type;
  signal ea_ctrl      : ea_type;
  signal op_ctrl      : op_type;
  signal pre_ctrl     : pre_type;
  signal md_ctrl      : md_type;
  signal acca_ctrl    : acca_type;
  signal accb_ctrl    : accb_type;
  signal ix_ctrl      : ix_type;
  signal iy_ctrl      : iy_type;
  signal cc_ctrl      : cc_type;
  signal dp_ctrl      : dp_type;
  signal sp_ctrl      : sp_type;
  signal up_ctrl      : up_type;
  signal iv_ctrl      : iv_type;
  signal left_ctrl    : left_type;
  signal right_ctrl   : right_type;
  signal alu_ctrl     : alu_type;
  signal addr_ctrl    : addr_type;
  signal dout_ctrl    : dout_type;
  signal nmi_ctrl     : nmi_type;


------
BEGIN
------

pc_out <= pc when rising_edge(clk); -- register to avoid timing path issues

----------------------------------
--
-- State machine stack
--
----------------------------------
  state_stack_proc : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case st_ctrl is
          when push_st =>
            state_stack(0) <= return_state;
            state_stack(1) <= state_stack(0);
            state_stack(2) <= state_stack(1);
          when pull_st =>
            state_stack(0) <= state_stack(1);
            state_stack(1) <= state_stack(2);
            state_stack(2) <= fetch_state;
          when others =>  -- including idle_st
            null;
        end case;
      end if;
    end if;
  end process;

  saved_state <= state_stack(0);

----------------------------------
--
-- Program Counter Control
--
----------------------------------

  pc_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case pc_ctrl is
          when reset_pc =>
            pc <=  (others=>'0');
          when load_pc =>
            pc <= out_alu(15 downto 0);
          when pull_lo_pc =>
            pc(7 downto 0) <= data_in;
          when pull_hi_pc =>
            pc(15 downto 8) <= data_in;
          when incr_pc =>
            pc <= pc + 1;
          when others =>   --  including when latch_pc =>
            null;
        end case;
      end if;
    end if;
  end process;

----------------------------------
--
-- Effective Address  Control
--
----------------------------------

  ea_reg : process(clk)
  begin

    if rising_edge(clk) then
      if hold = '0' then
        case ea_ctrl is
          when reset_ea =>
            ea <=  (others=>'0');
          when fetch_first_ea =>
            ea(7 downto 0)  <= data_in;
            ea(15 downto 8) <= dp;
          when fetch_next_ea =>
            ea(15 downto 8) <= ea(7 downto 0);
            ea(7 downto 0)  <= data_in;
          when load_ea =>
            ea <= out_alu(15 downto 0);
          when others => -- when latch_ea =>
            null;
        end case;
      end if;
    end if;
  end process;

--------------------------------
--
-- Accumulator A
--
--------------------------------
  acca_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case acca_ctrl is
          when reset_acca =>
            acca <=  x"00";
          when load_acca =>
            acca <= out_alu(7 downto 0);
          when load_hi_acca =>
            acca <= out_alu(15 downto 8);
          when pull_acca =>
            acca <= data_in;
          when others =>  --  when latch_acca =>
            null;
        end case;
      end if;
    end if;
  end process;

--------------------------------
--
-- Accumulator B
--
--------------------------------
  accb_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case accb_ctrl is
          when reset_accb =>
            accb <= x"00";
          when load_accb =>
            accb <= out_alu(7 downto 0);
          when pull_accb =>
            accb <= data_in;
          when others =>  -- when latch_accb =>
            null;
        end case;
      end if;
    end if;
  end process;

--------------------------------
--
-- X Index register
--
--------------------------------
  ix_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case ix_ctrl is
          when reset_ix =>
            xreg <= (others=>'0');
          when load_ix =>
            xreg <= out_alu(15 downto 0);
          when pull_hi_ix =>
            xreg(15 downto 8) <= data_in;
          when pull_lo_ix =>
            xreg(7 downto 0) <= data_in;
          when others => -- when latch_ix =>
            null;
        end case;
      end if;
    end if;
  end process;

--------------------------------
--
-- Y Index register
--
--------------------------------
  iy_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case iy_ctrl is
          when reset_iy =>
            yreg <= (others=>'0');
          when load_iy =>
            yreg <= out_alu(15 downto 0);
          when pull_hi_iy =>
            yreg(15 downto 8) <= data_in;
          when pull_lo_iy =>
            yreg(7 downto 0) <= data_in;
          when others =>  -- when latch_iy =>
            null;
        end case;
      end if;
    end if;
  end process;

--------------------------------
--
-- S stack pointer
--
--------------------------------
  sp_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case sp_ctrl is
          when reset_sp =>
            sp         <=  (others=>'0');
            nmi_enable <= '0';
          when load_sp =>
            sp         <= out_alu(15 downto 0);
            nmi_enable <= '1';
          when pull_hi_sp =>
            sp(15 downto 8) <= data_in;
          when pull_lo_sp =>
            sp(7 downto 0) <= data_in;
            nmi_enable     <= '1';
          when others =>   -- when latch_sp =>
            null;
        end case;
      end if;
    end if;
  end process;

--------------------------------
--
-- U stack pointer
--
--------------------------------
  up_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case up_ctrl is
          when reset_up =>
            up <= (others=>'0');
          when load_up =>
            up <= out_alu(15 downto 0);
          when pull_hi_up =>
            up(15 downto 8) <= data_in;
          when pull_lo_up =>
            up(7 downto 0) <= data_in;
          when others =>  -- when latch_up =>
            null;
        end case;
      end if;
    end if;
  end process;

--------------------------------
--
-- Memory Data
--
--------------------------------
  md_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case md_ctrl is
          when reset_md =>
            md <=  (others=>'0');
          when load_md =>
            md <= out_alu(15 downto 0);
          when fetch_first_md =>        -- sign extend md for branches
            md(15 downto 8) <= data_in(7) & data_in(7) & data_in(7) & data_in(7) &
                               data_in(7) & data_in(7) & data_in(7) & data_in(7);
            md(7 downto 0) <= data_in;
          when fetch_next_md =>
            md(15 downto 8) <= md(7 downto 0);
            md(7 downto 0)  <= data_in;
          when shiftl_md =>
            md(15 downto 1) <= md(14 downto 0);
            md(0)           <= '0';
          when others =>   -- when latch_md =>
            null;
        end case;
      end if;
    end if;
  end process;


----------------------------------
--
-- Condition Codes
--
----------------------------------

  cc_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case cc_ctrl is
          when reset_cc =>
            cc <= "11010000";           -- set EBIT, FBIT & IBIT
          when load_cc =>
            cc <= cc_out;
          when pull_cc =>
            cc <= data_in;
          when others =>   -- when latch_cc =>
            null;
        end case;
      end if;
    end if;
  end process;

----------------------------------
--
-- Direct Page register
--
----------------------------------

  dp_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case dp_ctrl is
          when reset_dp =>
            dp <=  (others=>'0');
          when load_dp =>
            dp <= out_alu(7 downto 0);
          when pull_dp =>
            dp <= data_in;
          when others =>   -- when latch_dp =>
            null;
        end case;
      end if;
    end if;
  end process;

----------------------------------
--
-- interrupt vector
--
----------------------------------

  iv_mux : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case iv_ctrl is
          when reset_iv =>
            iv <= RST_VEC;
          when nmi_iv =>
            iv <= NMI_VEC;
          when swi_iv =>
            iv <= SWI_VEC;
          when irq_iv =>
            iv <= IRQ_VEC;
          when firq_iv =>
            iv <= FIRQ_VEC;
          when swi2_iv =>
            iv <= SWI2_VEC;
          when swi3_iv =>
            iv <= SWI3_VEC;
          when resv_iv =>
            iv <= RESV_VEC;
          when others =>
            iv <= iv;
        end case;
      end if;
    end if;
  end process;


----------------------------------
--
-- op code register
--
----------------------------------

  op_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case op_ctrl is
          when reset_op =>
            op_code <= "00010010";
          when fetch_op =>
            op_code <= data_in;
          when others =>   -- when latch_op =>
            null;
        end case;
      end if;
    end if;
  end process;


----------------------------------
--
-- pre byte op code register
--
----------------------------------

  pre_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case pre_ctrl is
          when reset_pre =>
            pre_code <= x"00";
          when fetch_pre =>
            pre_code <= data_in;
          when others =>   -- when latch_pre =>
            null;
        end case;
      end if;
    end if;
  end process;

--------------------------------
--
-- state machine
--
--------------------------------

  change_state : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        state <= reset_state;
      else
        if hold = '0' then
          state <= next_state;
        end if;
      end if;
    end if;
  end process;
  -- output

------------------------------------
--
-- Nmi register
--
------------------------------------

  nmi_reg : process(clk)
  begin
    if rising_edge(clk) then
      if hold = '0' then
        case nmi_ctrl is
          when set_nmi =>
            nmi_ack <= '1';
          when reset_nmi =>
            nmi_ack <= '0';
          when others =>  --  when latch_nmi =>
            null;
        end case;
      end if;
    end if;
  end process;

------------------------------------
--
-- Detect Edge of NMI interrupt
--
------------------------------------

  nmi_handler : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        nmi_req <= '0';
      else
        if (nmi = '1') and (nmi_ack = '0') and (nmi_enable = '1') then
          nmi_req <= '1';
        else
          if (nmi = '0') and (nmi_ack = '1') then
            nmi_req <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;


----------------------------------
--
-- Address output multiplexer
--
----------------------------------

  addr_mux : process(addr_ctrl, pc, ea, up, sp, iv)
  begin
    case addr_ctrl is
      when idle_ad =>
        address <= "1111111111111111";
        vma     <= '0';
        rw      <= '1';
      when fetch_ad =>
        address <= pc;
        vma     <= '1';
        rw      <= '1';
      when read_ad =>
        address <= ea;
        vma     <= '1';
        rw      <= '1';
      when write_ad =>
        address <= ea;
        vma     <= '1';
        rw      <= '0';
      when pushs_ad =>
        address <= sp;
        vma     <= '1';
        rw      <= '0';
      when pulls_ad =>
        address <= sp;
        vma     <= '1';
        rw      <= '1';
      when pushu_ad =>
        address <= up;
        vma     <= '1';
        rw      <= '0';
      when pullu_ad =>
        address <= up;
        vma     <= '1';
        rw      <= '1';
      when int_hi_ad =>
        address <= "111111111111" & iv & "0";
        vma     <= '1';
        rw      <= '1';
      when int_lo_ad =>
        address <= "111111111111" & iv & "1";
        vma     <= '1';
        rw      <= '1';
      when others =>
        address <= "1111111111111111";
        vma     <= '0';
        rw      <= '1';
    end case;
  end process;

--------------------------------
--
-- Data Bus output
--
--------------------------------
  dout_mux : process(dout_ctrl, md, acca, accb, dp, xreg, yreg, sp, up, pc, cc)
  begin
    case dout_ctrl is
      when md_hi_dout =>                -- alu output
        data_out <= md(15 downto 8);
      when md_lo_dout =>                -- alu output
        data_out <= md(7 downto 0);
      when acca_dout =>                 -- accumulator a
        data_out <= acca;
      when accb_dout =>                 -- accumulator b
        data_out <= accb;
      when ix_lo_dout =>                -- index reg
        data_out <= xreg(7 downto 0);
      when ix_hi_dout =>                -- index reg
        data_out <= xreg(15 downto 8);
      when iy_lo_dout =>                -- index reg
        data_out <= yreg(7 downto 0);
      when iy_hi_dout =>                -- index reg
        data_out <= yreg(15 downto 8);
      when sp_lo_dout =>                -- s stack pointer
        data_out <= sp(7 downto 0);
      when sp_hi_dout =>                -- s stack pointer
        data_out <= sp(15 downto 8);
      when up_lo_dout =>                -- u stack pointer
        data_out <= up(7 downto 0);
      when up_hi_dout =>                -- u stack pointer
        data_out <= up(15 downto 8);
      when cc_dout =>                   -- condition code register
        data_out <= cc;
      when dp_dout =>                   -- direct page register
        data_out <= dp;
      when pc_lo_dout =>                -- low order pc
        data_out <= pc(7 downto 0);
      when pc_hi_dout =>                -- high order pc
        data_out <= pc(15 downto 8);
      when others =>
        data_out <= "00000000";
    end case;
  end process;

----------------------------------
--
-- Left Mux
--
----------------------------------

  left_mux : process(left_ctrl, acca, accb, cc, dp, xreg, yreg, up, sp, pc, ea, md)
  begin
    case left_ctrl is
      when cc_left =>
        left(15 downto 8) <= "00000000";
        left(7 downto 0)  <= cc;
      when acca_left =>
        left(15 downto 8) <= "00000000";
        left(7 downto 0)  <= acca;
      when accb_left =>
        left(15 downto 8) <= "00000000";
        left(7 downto 0)  <= accb;
      when dp_left =>
        left(15 downto 8) <= "00000000";
        left(7 downto 0)  <= dp;
      when accd_left =>
        left(15 downto 8) <= acca;
        left(7 downto 0)  <= accb;
      when md_left =>
        left <= md;
      when ix_left =>
        left <= xreg;
      when iy_left =>
        left <= yreg;
      when sp_left =>
        left <= sp;
      when up_left =>
        left <= up;
      when pc_left =>
        left <= pc;
      when others => -- when ea_left =>
        left <= ea;
    end case;
  end process;

----------------------------------
--
-- Right Mux
--
----------------------------------

  right_mux : process(right_ctrl, md, acca, accb, ea)
  begin
    case right_ctrl is
      when ea_right =>
        right <= ea;
      when zero_right =>
        right <= x"0000"; -- "0000000000000000";
      when one_right =>
        right <= x"0001";
      when two_right =>
        right <= x"0002";
      when acca_right =>
        if acca(7) = '0' then
          right <= x"00" & acca(7 downto 0);
        else
          right <= x"FF" & acca(7 downto 0);
        end if;
      when accb_right =>
        if accb(7) = '0' then
          right <= x"00" & accb(7 downto 0);
        else
          right <= x"FF" & accb(7 downto 0);
        end if;
      when accd_right =>
        right <= acca & accb;
      when md_sign5_right =>
        if md(4) = '0' then
          right <= "00000000000" & md(4 downto 0);
        else
          right <= "11111111111" & md(4 downto 0);
        end if;
      when md_sign8_right =>
        if md(7) = '0' then
          right <= x"00" & md(7 downto 0);
        else
          right <= x"FF" & md(7 downto 0);
        end if;
      when others =>  --  when md_right =>
        right <= md;
    end case;
  end process;

----------------------------------
--
-- Arithmetic Logic Unit
--
----------------------------------

ALU: process(alu_ctrl, cc, left, right, out_alu, cc_out)
  variable valid_lo, valid_hi : boolean;
  variable carry_in           : std_logic;
  variable daa_reg            : std_logic_vector(7 downto 0);
  begin

    case alu_ctrl is
      when alu_adc  | alu_sbc | alu_rol8 | alu_ror8 =>
        carry_in := cc(CBIT);
      when alu_asr8 =>
        carry_in := left(7);
      when others =>
        carry_in := '0';
    end case;

    valid_lo := left(3 downto 0) <= 9;
    valid_hi := left(7 downto 4) <= 9;

    if (cc(CBIT) = '0') then
      if(cc(HBIT) = '1') then
        if valid_hi then
          daa_reg := "00000110";
        else
          daa_reg := "01100110";
        end if;
      else
        if valid_lo then
          if valid_hi then
            daa_reg := "00000000";
          else
            daa_reg := "01100000";
          end if;
        else
          if(left(7 downto 4) <= 8) then
            daa_reg := "00000110";
          else
            daa_reg := "01100110";
          end if;
        end if;
      end if;
    else
      if (cc(HBIT) = '1')then
        daa_reg := "01100110";
      else
        if valid_lo then
          daa_reg := "01100000";
        else
          daa_reg := "01100110";
        end if;
      end if;
    end if;

    case alu_ctrl is
      when alu_add8 | alu_inc |
        alu_add16 | alu_adc | alu_mul =>
        out_alu <= left + right + ("000000000000000" & carry_in);
      when alu_sub8 | alu_dec |
        alu_sub16 | alu_sbc =>
        out_alu <= left - right - ("000000000000000" & carry_in);
      when alu_abx =>
        out_alu <= left + ("00000000" & right(7 downto 0));
      when alu_and =>
        out_alu <= left and right;      -- and/bit
      when alu_ora =>
        out_alu <= left or right;       -- or
      when alu_eor =>
        out_alu <= left xor right;      -- eor/xor
      when alu_lsl16 | alu_asl8 | alu_rol8 =>
        out_alu <= left(14 downto 0) & carry_in;  -- rol8/asl8/lsl16
      when alu_lsr16 =>
        out_alu <= carry_in & left(15 downto 1);  -- lsr16
      when alu_lsr8 | alu_asr8 | alu_ror8 =>
        out_alu <= "00000000" & carry_in & left(7 downto 1);  -- ror8/asr8/lsr8
      when alu_neg =>
        out_alu <= right - left;        -- neg (right=0)
      when alu_com =>
        out_alu <= not left;
      when alu_clr | alu_ld8 | alu_ld16 | alu_lea =>
        out_alu <= right;               -- clr, ld
      when alu_st8 | alu_st16 | alu_andcc | alu_orcc | alu_tfr =>
        out_alu <= left;
      when alu_daa =>
        out_alu <= left + ("00000000" & daa_reg);
      when alu_sex =>
        if left(7) = '0' then
          out_alu <= "00000000" & left(7 downto 0);
        else
          out_alu <= "11111111" & left(7 downto 0);
        end if;
      when others =>
        out_alu <= left;                -- nop
    end case;

    --
    -- carry bit
    --
    case alu_ctrl is
      when alu_add8 | alu_adc =>
        cc_out(CBIT) <= (left(7) and right(7)) or
                        (left(7) and not out_alu(7)) or
                        (right(7) and not out_alu(7));
      when alu_sub8 | alu_sbc =>
        cc_out(CBIT) <= ((not left(7)) and right(7)) or
                        ((not left(7)) and out_alu(7)) or
                        (right(7) and out_alu(7));
      when alu_add16 =>
        cc_out(CBIT) <= (left(15) and right(15)) or
                        (left(15) and not out_alu(15)) or
                        (right(15) and not out_alu(15));
      when alu_sub16 =>
        cc_out(CBIT) <= ((not left(15)) and right(15)) or
                        ((not left(15)) and out_alu(15)) or
                        (right(15) and out_alu(15));
      when alu_ror8 | alu_lsr16 | alu_lsr8 | alu_asr8 =>
        cc_out(CBIT) <= left(0);
      when alu_rol8 | alu_asl8 =>
        cc_out(CBIT) <= left(7);
      when alu_lsl16 =>
        cc_out(CBIT) <= left(15);
      when alu_com =>
        cc_out(CBIT) <= '1';
      when alu_neg | alu_clr =>
        cc_out(CBIT) <= out_alu(7) or out_alu(6) or out_alu(5) or out_alu(4) or
                        out_alu(3) or out_alu(2) or out_alu(1) or out_alu(0);
      when alu_mul =>
        cc_out(CBIT) <= out_alu(7);
      when alu_daa =>
        if (daa_reg(7 downto 4) = "0110") then
          cc_out(CBIT) <= '1';
        else
          cc_out(CBIT) <= '0';
        end if;
      when alu_andcc =>
        cc_out(CBIT) <= left(CBIT) and cc(CBIT);
      when alu_orcc =>
        cc_out(CBIT) <= left(CBIT) or cc(CBIT);
      when alu_tfr =>
        cc_out(CBIT) <= left(CBIT);
      when others =>
        cc_out(CBIT) <= cc(CBIT);
    end case;
    --
    -- Zero flag
    --
    case alu_ctrl is
      when alu_add8 | alu_sub8 |
        alu_adc | alu_sbc |
        alu_and | alu_ora | alu_eor |
        alu_inc | alu_dec |
        alu_neg | alu_com | alu_clr |
        alu_rol8 | alu_ror8 | alu_asr8 | alu_asl8 | alu_lsr8 |
        alu_ld8 | alu_st8 | alu_sex | alu_daa =>
        cc_out(ZBIT) <= not(out_alu(7) or out_alu(6) or out_alu(5) or out_alu(4) or
                             out_alu(3) or out_alu(2) or out_alu(1) or out_alu(0));
      when alu_add16 | alu_sub16 | alu_mul |
        alu_lsl16 | alu_lsr16 |
        alu_ld16 | alu_st16 | alu_lea =>
        cc_out(ZBIT) <= not(out_alu(15) or out_alu(14) or out_alu(13) or out_alu(12) or
                             out_alu(11) or out_alu(10) or out_alu(9) or out_alu(8) or
                             out_alu(7) or out_alu(6) or out_alu(5) or out_alu(4) or
                             out_alu(3) or out_alu(2) or out_alu(1) or out_alu(0));
      when alu_andcc =>
        cc_out(ZBIT) <= left(ZBIT) and cc(ZBIT);
      when alu_orcc =>
        cc_out(ZBIT) <= left(ZBIT) or cc(ZBIT);
      when alu_tfr =>
        cc_out(ZBIT) <= left(ZBIT);
      when others =>
        cc_out(ZBIT) <= cc(ZBIT);
    end case;

    --
    -- negative flag
    --
    case alu_ctrl is
      when alu_add8 | alu_sub8 |
        alu_adc | alu_sbc |
        alu_and | alu_ora | alu_eor |
        alu_rol8 | alu_ror8 | alu_asr8 | alu_asl8 | alu_lsr8 |
        alu_inc | alu_dec | alu_neg | alu_com | alu_clr |
        alu_ld8 | alu_st8 | alu_sex | alu_daa =>
        cc_out(NBIT) <= out_alu(7);
      when alu_add16 | alu_sub16 |
        alu_lsl16 | alu_lsr16 |
        alu_ld16 | alu_st16 =>
        cc_out(NBIT) <= out_alu(15);
      when alu_andcc =>
        cc_out(NBIT) <= left(NBIT) and cc(NBIT);
      when alu_orcc =>
        cc_out(NBIT) <= left(NBIT) or cc(NBIT);
      when alu_tfr =>
        cc_out(NBIT) <= left(NBIT);
      when others =>
        cc_out(NBIT) <= cc(NBIT);
    end case;

    --
    -- Interrupt mask flag
    --
    case alu_ctrl is
      when alu_andcc =>
        cc_out(IBIT) <= left(IBIT) and cc(IBIT);
      when alu_orcc =>
        cc_out(IBIT) <= left(IBIT) or cc(IBIT);
      when alu_tfr =>
        cc_out(IBIT) <= left(IBIT);
      when alu_seif | alu_sei =>
        cc_out(IBIT) <= '1';
      when others =>
        cc_out(IBIT) <= cc(IBIT);       -- interrupt mask
    end case;

    --
    -- Half Carry flag
    --
    case alu_ctrl is
      when alu_add8 | alu_adc =>
        cc_out(HBIT) <= (left(3) and right(3)) or
                        (right(3) and not out_alu(3)) or
                        (left(3) and not out_alu(3));
      when alu_andcc =>
        cc_out(HBIT) <= left(HBIT) and cc(HBIT);
      when alu_orcc =>
        cc_out(HBIT) <= left(HBIT) or cc(HBIT);
      when alu_tfr =>
        cc_out(HBIT) <= left(HBIT);
      when others =>
        cc_out(HBIT) <= cc(HBIT);
    end case;

    --
    -- Overflow flag
    --
    case alu_ctrl is
      when alu_add8 | alu_adc =>
        cc_out(VBIT) <= (left(7) and right(7) and (not out_alu(7))) or
                        ((not left(7)) and (not right(7)) and out_alu(7));
      when alu_sub8 | alu_sbc =>
        cc_out(VBIT) <= (left(7) and (not right(7)) and (not out_alu(7))) or
                        ((not left(7)) and right(7) and out_alu(7));
      when alu_add16 =>
        cc_out(VBIT) <= (left(15) and right(15) and (not out_alu(15))) or
                        ((not left(15)) and (not right(15)) and out_alu(15));
      when alu_sub16 =>
        cc_out(VBIT) <= (left(15) and (not right(15)) and (not out_alu(15))) or
                        ((not left(15)) and right(15) and out_alu(15));
      when alu_inc =>
        cc_out(VBIT) <= ((not left(7)) and left(6) and left(5) and left(4) and
                         left(3) and left(2) and left(1) and left(0));
      when alu_dec | alu_neg =>
        cc_out(VBIT) <= (left(7) and (not left(6)) and (not left(5)) and (not left(4)) and
                         (not left(3)) and (not left(2)) and (not left(1)) and (not left(0)));
-- 6809 Programming reference manual says
-- V not affected by ASR, LSR and ROR
-- This is different to the 6800
-- John Kent 6th June 2006
--       when alu_asr8 =>
--         cc_out(VBIT) <= left(0) xor left(7);
--       when alu_lsr8 | alu_lsr16 =>
--         cc_out(VBIT) <= left(0);
--       when alu_ror8 =>
--      cc_out(VBIT) <= left(0) xor cc(CBIT);
      when alu_lsl16 =>
        cc_out(VBIT) <= left(15) xor left(14);
      when alu_rol8 | alu_asl8 =>
        cc_out(VBIT) <= left(7) xor left(6);
--
-- 11th July 2006 - John Kent
-- What DAA does with V is anyones guess
-- It is undefined in the 6809 programming manual
--
      when alu_daa =>
        cc_out(VBIT) <= left(7) xor out_alu(7) xor cc(CBIT);
-- CLR resets V Bit
-- John Kent 6th June 2006
      when alu_and | alu_ora | alu_eor | alu_com | alu_clr |
        alu_st8 | alu_st16 | alu_ld8 | alu_ld16 | alu_sex =>
        cc_out(VBIT) <= '0';
      when alu_andcc =>
        cc_out(VBIT) <= left(VBIT) and cc(VBIT);
      when alu_orcc =>
        cc_out(VBIT) <= left(VBIT) or cc(VBIT);
      when alu_tfr =>
        cc_out(VBIT) <= left(VBIT);
      when others =>
        cc_out(VBIT) <= cc(VBIT);
    end case;

    case alu_ctrl is
      when alu_andcc =>
        cc_out(FBIT) <= left(FBIT) and cc(FBIT);
      when alu_orcc =>
        cc_out(FBIT) <= left(FBIT) or cc(FBIT);
      when alu_tfr =>
        cc_out(FBIT) <= left(FBIT);
      when alu_seif =>
        cc_out(FBIT) <= '1';
      when others =>
        cc_out(FBIT) <= cc(FBIT);
    end case;

    case alu_ctrl is
      when alu_andcc =>
        cc_out(EBIT) <= left(EBIT) and cc(EBIT);
      when alu_orcc =>
        cc_out(EBIT) <= left(EBIT) or cc(EBIT);
      when alu_tfr =>
        cc_out(EBIT) <= left(EBIT);
      when alu_see =>
        cc_out(EBIT) <= '1';
      when alu_cle =>
        cc_out(EBIT) <= '0';
      when others =>
        cc_out(EBIT) <= cc(EBIT);
    end case;
  end process;

------------------------------------
--
-- state sequencer
--
------------------------------------
  process(state, saved_state,
           op_code, pre_code,
           cc, ea, md, iv,
           irq, firq, nmi_req, nmi_ack, halt)
    variable cond_true : boolean;  -- variable used to evaluate coditional branches
  begin
    case state is
      when reset_state =>               --  released from reset
        -- reset the registers
        op_ctrl      <= reset_op;
        pre_ctrl     <= reset_pre;
        acca_ctrl    <= reset_acca;
        accb_ctrl    <= reset_accb;
        ix_ctrl      <= reset_ix;
        iy_ctrl      <= reset_iy;
        sp_ctrl      <= reset_sp;
        up_ctrl      <= reset_up;
        pc_ctrl      <= reset_pc;
        ea_ctrl      <= reset_ea;
        md_ctrl      <= reset_md;
        iv_ctrl      <= reset_iv;
        nmi_ctrl     <= reset_nmi;
        -- idle the ALU
        left_ctrl    <= pc_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        cc_ctrl      <= reset_cc;
        dp_ctrl      <= reset_dp;
        -- idle the bus
        dout_ctrl    <= md_lo_dout;
        addr_ctrl    <= idle_ad;
        st_ctrl      <= idle_st;
        return_state <= vect_hi_state;
        next_state   <= vect_hi_state;

      --
      -- Jump via interrupt vector
      -- iv holds interrupt type
      -- fetch PC hi from vector location
      --
      when vect_hi_state =>
        -- default the registers
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        up_ctrl      <= latch_up;
        md_ctrl      <= latch_md;
        ea_ctrl      <= latch_ea;
        iv_ctrl      <= latch_iv;
        -- idle the ALU
        left_ctrl    <= pc_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        -- fetch pc low interrupt vector
        pc_ctrl      <= pull_hi_pc;
        addr_ctrl    <= int_hi_ad;
        dout_ctrl    <= pc_hi_dout;
        st_ctrl      <= idle_st;
        return_state <= vect_lo_state;
        next_state   <= vect_lo_state;
        --
        -- jump via interrupt vector
        -- iv holds vector type
        -- fetch PC lo from vector location
        --
      when vect_lo_state =>
        -- default the registers
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        up_ctrl      <= latch_up;
        md_ctrl      <= latch_md;
        ea_ctrl      <= latch_ea;
        iv_ctrl      <= latch_iv;
        -- idle the ALU
        left_ctrl    <= pc_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        -- fetch the vector low byte
        pc_ctrl      <= pull_lo_pc;
        addr_ctrl    <= int_lo_ad;
        dout_ctrl    <= pc_lo_dout;
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;
        --
        -- Here to fetch an instruction
        -- PC points to opcode
        -- Should service interrupt requests at this point
        -- either from the timer
        -- or from the external input.
        --
      when fetch_state =>
        -- fetch the op code
        op_ctrl   <= fetch_op;
        pre_ctrl  <= fetch_pre;
        ea_ctrl   <= reset_ea;
        md_ctrl   <= latch_md;
        -- Fetch op code
        addr_ctrl <= fetch_ad;
        dout_ctrl <= md_lo_dout;
        dp_ctrl   <= latch_dp;
        --
        case op_code(7 downto 6) is
          when "10" =>                  -- acca
            case op_code(3 downto 0) is
              when "0000" =>            -- suba
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_sub8;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= load_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0001" =>            -- cmpa
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_sub8;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0010" =>            -- sbca
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_sbc;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= load_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0011" =>
                case pre_code is
                  when "00010000" =>  -- page 2 -- cmpd
                    left_ctrl  <= accd_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_sub16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                  when "00010001" =>  -- page 3 -- cmpu
                    left_ctrl  <= up_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_sub16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                  when others =>  -- page 1 -- subd
                    left_ctrl  <= accd_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_sub16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= load_hi_acca;
                    accb_ctrl  <= load_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                end case;
              when "0100" =>            -- anda
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_and;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= load_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0101" =>            -- bita
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_and;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0110" =>            -- ldaa
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_ld8;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= load_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0111" =>            -- staa
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_st8;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1000" =>            -- eora
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_eor;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= load_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1001" =>            -- adca
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_adc;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= load_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1010" =>            -- oraa
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_ora;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= load_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1011" =>            -- adda
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_add8;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= load_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1100" =>
                case pre_code is
                  when "00010000" =>  -- page 2 -- cmpy
                    left_ctrl  <= iy_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_sub16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                  when "00010001" =>  -- page 3 -- cmps
                    left_ctrl  <= sp_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_sub16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                  when others =>  -- page 1 -- cmpx
                    left_ctrl  <= ix_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_sub16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                end case;
              when "1101" =>            -- bsr / jsr
                left_ctrl  <= pc_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_nop;
                cc_ctrl    <= latch_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1110" =>            -- ldx
                case pre_code is
                  when "00010000" =>  -- page 2 -- ldy
                    left_ctrl  <= iy_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_ld16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= load_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                  when others =>  -- page 1 -- ldx
                    left_ctrl  <= ix_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_ld16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= load_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                end case;
              when "1111" =>            -- stx
                case pre_code is
                  when "00010000" =>  -- page 2 -- sty
                    left_ctrl  <= iy_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_st16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                  when others =>  -- page 1 -- stx
                    left_ctrl  <= ix_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_st16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                end case;
              when others =>
                left_ctrl  <= acca_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_nop;
                cc_ctrl    <= latch_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
            end case;
          when "11" =>                  -- accb dual op
            case op_code(3 downto 0) is
              when "0000" =>            -- subb
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_sub8;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= load_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0001" =>            -- cmpb
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_sub8;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0010" =>            -- sbcb
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_sbc;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= load_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0011" =>            -- addd
                left_ctrl  <= accd_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_add16;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= load_hi_acca;
                accb_ctrl  <= load_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0100" =>            -- andb
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_and;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= load_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0101" =>            -- bitb
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_and;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0110" =>            -- ldab
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_ld8;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= load_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "0111" =>            -- stab
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_st8;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1000" =>            -- eorb
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_eor;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= load_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1001" =>            -- adcb
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_adc;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= load_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1010" =>            -- orab
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_ora;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= load_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1011" =>            -- addb
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_add8;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= load_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1100" =>            -- ldd
                left_ctrl  <= accd_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_ld16;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= load_hi_acca;
                accb_ctrl  <= load_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1101" =>            -- std
                left_ctrl  <= accd_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_st16;
                cc_ctrl    <= load_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
              when "1110" =>            -- ldu
                case pre_code is
                  when "00010000" =>  -- page 2 -- lds
                    left_ctrl  <= sp_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_ld16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= load_sp;
                  when others =>  -- page 1 -- ldu
                    left_ctrl  <= up_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_ld16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= load_up;
                    sp_ctrl    <= latch_sp;
                end case;
              when "1111" =>
                case pre_code is
                  when "00010000" =>  -- page 2 -- sts
                    left_ctrl  <= sp_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_st16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                  when others =>  -- page 1 -- stu
                    left_ctrl  <= up_left;
                    right_ctrl <= md_right;
                    alu_ctrl   <= alu_st16;
                    cc_ctrl    <= load_cc;
                    acca_ctrl  <= latch_acca;
                    accb_ctrl  <= latch_accb;
                    ix_ctrl    <= latch_ix;
                    iy_ctrl    <= latch_iy;
                    up_ctrl    <= latch_up;
                    sp_ctrl    <= latch_sp;
                end case;
              when others =>
                left_ctrl  <= accb_left;
                right_ctrl <= md_right;
                alu_ctrl   <= alu_nop;
                cc_ctrl    <= latch_cc;
                acca_ctrl  <= latch_acca;
                accb_ctrl  <= latch_accb;
                ix_ctrl    <= latch_ix;
                iy_ctrl    <= latch_iy;
                up_ctrl    <= latch_up;
                sp_ctrl    <= latch_sp;
            end case;
          when others =>
            left_ctrl  <= acca_left;
            right_ctrl <= md_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
        end case;
        if halt = '1' then
          iv_ctrl      <= reset_iv;
          pc_ctrl      <= latch_pc;
          nmi_ctrl     <= latch_nmi;
          st_ctrl      <= push_st;
          return_state <= fetch_state;
          next_state   <= halt_state;
          -- service non maskable interrupts
        elsif (nmi_req = '1') and (nmi_ack = '0') then
          iv_ctrl      <= nmi_iv;
          pc_ctrl      <= latch_pc;
          nmi_ctrl     <= set_nmi;
          st_ctrl      <= idle_st;
          return_state <= fetch_state;
          next_state   <= int_decr_state;
          -- service maskable interrupts
        else
          --
          -- nmi request is not cleared until nmi input goes low
                              --
          if(nmi_req = '0') and (nmi_ack = '1') then
            nmi_ctrl <= reset_nmi;
          else
            nmi_ctrl <= latch_nmi;
          end if;
                                        --
                                        -- IRQ is level sensitive
                                        --
          if (irq = '1') and (cc(IBIT) = '0') then
            iv_ctrl      <= irq_iv;
            pc_ctrl      <= latch_pc;
            st_ctrl      <= idle_st;
            return_state <= fetch_state;
            next_state   <= int_decr_state;
          elsif (firq = '1') and (cc(FBIT) = '0') then
            iv_ctrl      <= firq_iv;
            pc_ctrl      <= latch_pc;
            st_ctrl      <= idle_st;
            return_state <= fetch_state;
            next_state   <= int_decr_state;
          else
            -- Advance the PC to fetch next instruction byte
            iv_ctrl      <= reset_iv;   -- default to reset
            pc_ctrl      <= incr_pc;
            st_ctrl      <= idle_st;
            return_state <= fetch_state;
            next_state   <= decode1_state;
          end if;
        end if;
        --
        -- Here to decode instruction
        -- and fetch next byte of intruction
        -- whether it be necessary or not
        --
      when decode1_state =>
        pre_ctrl  <= latch_pre;
        -- fetch first byte of address or immediate data
        ea_ctrl   <= fetch_first_ea;
        md_ctrl   <= fetch_first_md;
        addr_ctrl <= fetch_ad;
        dout_ctrl <= md_lo_dout;
        nmi_ctrl  <= latch_nmi;
        dp_ctrl   <= latch_dp;
        case op_code(7 downto 4) is
          --
          -- direct single op (2 bytes)
          -- 6809 => 6 cycles
          -- cpu09 => 5 cycles
          -- 1 op=(pc) / pc=pc+1
          -- 2 ea_hi=dp / ea_lo=(pc) / pc=pc+1
          -- 3 md_lo=(ea) / pc=pc
          -- 4 alu_left=md / md=alu_out / pc=pc
          -- 5 (ea)=md_lo / pc=pc
          --
          -- Exception is JMP
          -- 6809 => 3 cycles
          -- cpu09 => 3 cycles
          -- 1 op=(pc) / pc=pc+1
          -- 2 ea_hi=dp / ea_lo=(pc) / pc=pc+1
          -- 3 pc=ea
          --
          when "0000" =>
            op_ctrl      <= latch_op;
            acca_ctrl    <= latch_acca;
            accb_ctrl    <= latch_accb;
            ix_ctrl      <= latch_ix;
            iy_ctrl      <= latch_iy;
            sp_ctrl      <= latch_sp;
            up_ctrl      <= latch_up;
            iv_ctrl      <= latch_iv;
                                        -- idle ALU
            left_ctrl    <= pc_left;
            right_ctrl   <= one_right;
            alu_ctrl     <= alu_add16;
            cc_ctrl      <= latch_cc;
                                        -- advance the PC
            pc_ctrl      <= incr_pc;
                                        --
            st_ctrl      <= idle_st;
            return_state <= fetch_state;
            case op_code(3 downto 0) is
              when "1110" =>            -- jmp
                next_state <= jmp_state;
              when "1111" =>            -- clr
                next_state <= single_op_exec_state;
              when others =>
                next_state <= single_op_read_state;
            end case;

            -- acca / accb inherent instructions
          when "0001" =>
            accb_ctrl <= latch_accb;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            iv_ctrl   <= latch_iv;
            case op_code(3 downto 0) is
              --
              -- Page2 pre byte
              -- pre=(pc) / pc=pc+1
              -- op=(pc) / pc=pc+1
              --
              when "0000" =>            -- page2
                op_ctrl      <= fetch_op;
                acca_ctrl    <= latch_acca;
                                        --
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        -- advance pc
                pc_ctrl      <= incr_pc;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= decode2_state;

              --
              -- Page3 pre byte
              -- pre=(pc) / pc=pc+1
              -- op=(pc) / pc=pc+1
              --
              when "0001" =>            -- page3
                op_ctrl      <= fetch_op;
                acca_ctrl    <= latch_acca;
                                        -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        -- advance pc
                pc_ctrl      <= incr_pc;
                                        -- Next state
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= decode3_state;

              --
              -- nop - No operation ( 1 byte )
              -- 6809 => 2 cycles
              -- cpu09 => 2 cycles
              -- 1 op=(pc) / pc=pc+1
              -- 2 decode
              --
              when "0010" =>            -- nop
                op_ctrl      <= latch_op;
                acca_ctrl    <= latch_acca;
                                        --
                left_ctrl    <= acca_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                pc_ctrl      <= latch_pc;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

              --
              -- sync - halt execution until an interrupt is received
              -- interrupt may be NMI, IRQ or FIRQ
              -- program execution continues if the
              -- interrupt is asserted for 3 clock cycles
              -- note that registers are not pushed onto the stack
              -- CPU09 => Interrupts need only be asserted for one clock cycle
              --
              when "0011" =>            -- sync
                op_ctrl      <= latch_op;
                acca_ctrl    <= latch_acca;
                                        --
                left_ctrl    <= acca_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                pc_ctrl      <= latch_pc;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= sync_state;

                                        --
                                        -- lbra -- long branch (3 bytes)
                                        -- 6809 => 5 cycles
                                        -- cpu09 => 4 cycles
                                        -- 1 op=(pc) / pc=pc+1
                                        -- 2 md_hi=sign(pc) / md_lo=(pc) / pc=pc+1
                                        -- 3 md_hi=md_lo / md_lo=(pc) / pc=pc+1
                                        -- 4 pc=pc+md
                                        --
              when "0110" =>
                op_ctrl      <= latch_op;
                acca_ctrl    <= latch_acca;
                                        -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        -- increment the pc
                pc_ctrl      <= incr_pc;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= lbranch_state;

                                        --
                                        -- lbsr - long branch to subroutine (3 bytes)
                                        -- 6809 => 9 cycles
                                        -- cpu09 => 6 cycles
                                        -- 1 op=(pc) /pc=pc+1
                                        -- 2 md_hi=sign(pc) / md_lo=(pc) / pc=pc+1 / sp=sp-1
                                        -- 3 md_hi=md_lo / md_lo=(pc) / pc=pc+1
                                        -- 4 (sp)= pc_lo / sp=sp-1 / pc=pc
                                        -- 5 (sp)=pc_hi / pc=pc
                                        -- 6 pc=pc+md
                                        --
              when "0111" =>
                op_ctrl      <= latch_op;
                acca_ctrl    <= latch_acca;
                                        -- pre decrement sp
                left_ctrl    <= sp_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_sub16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= load_sp;
                                        -- increment the pc
                pc_ctrl      <= incr_pc;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= lbranch_state;

              when "1001" =>            -- daa
                op_ctrl      <= latch_op;
                                        --
                left_ctrl    <= acca_left;
                right_ctrl   <= accb_right;
                alu_ctrl     <= alu_daa;
                cc_ctrl      <= load_cc;
                acca_ctrl    <= load_acca;
                sp_ctrl      <= latch_sp;
                                        -- idle pc
                pc_ctrl      <= latch_pc;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

              when "1010" =>            -- orcc
                op_ctrl      <= latch_op;
                acca_ctrl    <= latch_acca;
                                        -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        -- increment the pc
                pc_ctrl      <= incr_pc;
                                        -- next state
                st_ctrl      <= push_st;
                return_state <= fetch_state;
                next_state   <= orcc_state;

              when "1100" =>            -- andcc
                op_ctrl      <= latch_op;
                acca_ctrl    <= latch_acca;
                                        -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        -- increment the pc
                pc_ctrl      <= incr_pc;
                                        --
                st_ctrl      <= push_st;
                return_state <= fetch_state;
                next_state   <= andcc_state;

              when "1101" =>            -- sex
                op_ctrl      <= latch_op;
                                        -- have sex
                left_ctrl    <= accb_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_sex;
                cc_ctrl      <= load_cc;
                acca_ctrl    <= load_hi_acca;
                sp_ctrl      <= latch_sp;
                                        -- idle PC
                pc_ctrl      <= latch_pc;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

              when "1110" =>            -- exg
                op_ctrl      <= latch_op;
                acca_ctrl    <= latch_acca;
                                        -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        -- increment the pc
                pc_ctrl      <= incr_pc;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= exg_state;

              when "1111" =>            -- tfr
                op_ctrl      <= latch_op;
                acca_ctrl    <= latch_acca;
                                        -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        -- increment the pc
                pc_ctrl      <= incr_pc;
                                        -- call transfer as a subroutine
                st_ctrl      <= push_st;
                return_state <= fetch_state;
                next_state   <= tfr_state;

              when others =>
                op_ctrl      <= latch_op;
                acca_ctrl    <= latch_acca;
                                                     -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                                     -- increment the pc
                pc_ctrl      <= incr_pc;
                                                     --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;
            end case;
            --
            -- Short branch conditional
            -- 6809 => always 3 cycles
            -- cpu09 => always = 3 cycles
            -- 1 op=(pc) / pc=pc+1
            -- 2 md_hi=sign(pc) / md_lo=(pc) / pc=pc+1 / test cc
            -- 3 if cc tru pc=pc+md else pc=pc
            --
          when "0010" =>                             -- branch conditional
            op_ctrl      <= latch_op;
            acca_ctrl    <= latch_acca;
            accb_ctrl    <= latch_accb;
            ix_ctrl      <= latch_ix;
            iy_ctrl      <= latch_iy;
            sp_ctrl      <= latch_sp;
            up_ctrl      <= latch_up;
            iv_ctrl      <= latch_iv;
                                                     -- idle ALU
            left_ctrl    <= pc_left;
            right_ctrl   <= one_right;
            alu_ctrl     <= alu_add16;
            cc_ctrl      <= latch_cc;
                                                     -- increment the pc
            pc_ctrl      <= incr_pc;
                                                     --
            st_ctrl      <= idle_st;
            return_state <= fetch_state;
            next_state   <= sbranch_state;
            --
            -- Single byte stack operators
            -- Do not advance PC
            --
          when "0011" =>
            op_ctrl   <= latch_op;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
             --
             -- lea - load effective address (2+ bytes)
             -- 6809 => 4 cycles + addressing mode
             -- cpu09 => 4 cycles + addressing mode
             -- 1 op=(pc) / pc=pc+1
             -- 2 md_lo=(pc) / pc=pc+1
             -- 3 calculate ea
             -- 4 ix/iy/sp/up = ea
             --
            case op_code(3 downto 0) is
              when     "0000" |   -- leax
                       "0001" |   -- leay
                       "0010" |   -- leas
                       "0011" =>  -- leau
                left_ctrl    <= pc_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_add16;
                cc_ctrl      <= latch_cc;
                                                     -- advance PC
                pc_ctrl      <= incr_pc;
                                                     --
                ix_ctrl      <= latch_ix;
                iy_ctrl      <= latch_iy;
                sp_ctrl      <= latch_sp;
                up_ctrl      <= latch_up;
                iv_ctrl      <= latch_iv;
                                                     --
                st_ctrl      <= push_st;
                return_state <= lea_state;
                next_state   <= indexed_state;

              --
              -- pshs - push registers onto sp stack
              -- 6809 => 5 cycles + registers
              -- cpu09 => 3 cycles + registers
              --  1 op=(pc) / pc=pc+1
              --  2 ea_lo=(pc) / pc=pc+1
              --  3 if ea(7 downto 0) != "00000000" then sp=sp-1
              --  4 if ea(7) = 1 (sp)=pcl, sp=sp-1
              --  5 if ea(7) = 1 (sp)=pch
              --    if ea(6 downto 0) != "0000000" then sp=sp-1
              --  6 if ea(6) = 1 (sp)=upl, sp=sp-1
              --  7 if ea(6) = 1 (sp)=uph
              --    if ea(5 downto 0) != "000000" then sp=sp-1
              --  8 if ea(5) = 1 (sp)=iyl, sp=sp-1
              --  9 if ea(5) = 1 (sp)=iyh
              --    if ea(4 downto 0) != "00000" then sp=sp-1
              -- 10 if ea(4) = 1 (sp)=ixl, sp=sp-1
              -- 11 if ea(4) = 1 (sp)=ixh
              --    if ea(3 downto 0) != "0000" then sp=sp-1
              -- 12 if ea(3) = 1 (sp)=dp
              --    if ea(2 downto 0) != "000" then sp=sp-1
              -- 13 if ea(2) = 1 (sp)=accb
              --    if ea(1 downto 0) != "00" then sp=sp-1
              -- 14 if ea(1) = 1 (sp)=acca
              --    if ea(0 downto 0) != "0" then sp=sp-1
              -- 15 if ea(0) = 1 (sp)=cc
              --
              when "0100" =>            -- pshs
                                        --
                left_ctrl    <= sp_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                                        -- advance PC
                pc_ctrl      <= incr_pc;
                                        --
                ix_ctrl      <= latch_ix;
                iy_ctrl      <= latch_iy;
                sp_ctrl      <= latch_sp;
                up_ctrl      <= latch_up;
                iv_ctrl      <= latch_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= pshs_state;

              --
              -- puls - pull registers of sp stack
              -- 6809 => 5 cycles + registers
              -- cpu09 => 3 cycles + registers
              --
              when "0101" =>            -- puls
                left_ctrl    <= pc_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_add16;
                cc_ctrl      <= latch_cc;
                                        -- advance PC
                pc_ctrl      <= incr_pc;
                                        --
                ix_ctrl      <= latch_ix;
                iy_ctrl      <= latch_iy;
                sp_ctrl      <= latch_sp;
                up_ctrl      <= latch_up;
                iv_ctrl      <= latch_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= puls_state;

              --
              -- pshu - push registers onto up stack
              -- 6809 => 5 cycles + registers
              -- cpu09 => 3 cycles + registers
              --
              when "0110" =>            -- pshu
                                        -- idle UP
                left_ctrl    <= up_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                                        -- advance PC
                pc_ctrl      <= incr_pc;
                                        --
                ix_ctrl      <= latch_ix;
                iy_ctrl      <= latch_iy;
                sp_ctrl      <= latch_sp;
                up_ctrl      <= latch_up;
                iv_ctrl      <= latch_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= pshu_state;

              --
              -- pulu - pull registers of up stack
              -- 6809 => 5 cycles + registers
              -- cpu09 => 3 cycles + registers
              --
              when "0111" =>     -- pulu
                left_ctrl    <= pc_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_add16;
                cc_ctrl      <= latch_cc;
                                        -- advance PC
                pc_ctrl      <= incr_pc;
                                        --
                ix_ctrl      <= latch_ix;
                iy_ctrl      <= latch_iy;
                sp_ctrl      <= latch_sp;
                up_ctrl      <= latch_up;
                iv_ctrl      <= latch_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= pulu_state;

              --
              -- rts - return from subroutine
              -- 6809 => 5 cycles
              -- cpu09 => 4 cycles
              -- 1 op=(pc) / pc=pc+1
              -- 2 decode op
              -- 3 pc_hi = (sp) / sp=sp+1
              -- 4 pc_lo = (sp) / sp=sp+1
              --
              when "1001" =>
                left_ctrl    <= sp_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                                        -- idle PC
                pc_ctrl      <= latch_pc;
                                        --
                ix_ctrl      <= latch_ix;
                iy_ctrl      <= latch_iy;
                sp_ctrl      <= latch_sp;
                up_ctrl      <= latch_up;
                iv_ctrl      <= latch_iv;
                                        --
                st_ctrl      <= push_st;
                return_state <= fetch_state;
                next_state   <= pull_return_hi_state;

              --
              -- add accb to index register
              -- *** Note: this is an unsigned addition.
              --           does not affect any condition codes
              -- 6809 => 3 cycles
              -- cpu09 => 2 cycles
              -- 1 op=(pc) / pc=pc+1
              -- 2 alu_left=ix / alu_right=accb / ix=alu_out / pc=pc
              --
              when "1010" =>            -- abx
                left_ctrl    <= ix_left;
                right_ctrl   <= accb_right;
                alu_ctrl     <= alu_abx;
                cc_ctrl      <= latch_cc;
                ix_ctrl      <= load_ix;
                                        --
                pc_ctrl      <= latch_pc;
                iy_ctrl      <= latch_iy;
                sp_ctrl      <= latch_sp;
                up_ctrl      <= latch_up;
                iv_ctrl      <= latch_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

              when "1011" =>            -- rti
                                        -- idle ALU
                left_ctrl    <= sp_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                                        --
                pc_ctrl      <= latch_pc;
                ix_ctrl      <= latch_ix;
                iy_ctrl      <= latch_iy;
                sp_ctrl      <= latch_sp;
                up_ctrl      <= latch_up;
                iv_ctrl      <= latch_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= rti_cc_state;

              when "1100" =>                       -- cwai #$<cc_mask>
                                                   -- pre decrement sp
                left_ctrl    <= sp_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_sub16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= load_sp;
                                                   --
                pc_ctrl      <= incr_pc;
                ix_ctrl      <= latch_ix;
                iy_ctrl      <= latch_iy;
                up_ctrl      <= latch_up;
                iv_ctrl      <= latch_iv;
                                                   --
                st_ctrl      <= push_st;
                return_state <= int_entire_state;  -- set entire flag
                next_state   <= andcc_state;

              when "1101" =>            -- mul
                left_ctrl    <= acca_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                                        --
                pc_ctrl      <= latch_pc;
                ix_ctrl      <= latch_ix;
                iy_ctrl      <= latch_iy;
                sp_ctrl      <= latch_sp;
                up_ctrl      <= latch_up;
                iv_ctrl      <= latch_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= mul_state;

              when "1111" =>            -- swi
                                        -- predecrement SP
                left_ctrl    <= sp_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_sub16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= load_sp;
                                        --
                pc_ctrl      <= latch_pc;
                ix_ctrl      <= latch_ix;
                iy_ctrl      <= latch_iy;
                up_ctrl      <= latch_up;
                iv_ctrl      <= swi_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= int_entire_state;

              when others =>
                                        -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                                        -- idle PC
                pc_ctrl      <= latch_pc;
                                        --
                ix_ctrl      <= latch_ix;
                iy_ctrl      <= latch_iy;
                sp_ctrl      <= latch_sp;
                up_ctrl      <= latch_up;
                iv_ctrl      <= latch_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

            end case;
          --
          -- Accumulator A Single operand
          -- source = acca, dest = acca
          -- Do not advance PC
          -- Typically 2 cycles 1 bytes
          -- 1 opcode fetch
          -- 2 post byte fetch / instruction decode
          -- Note that there is no post byte
          -- so do not advance PC in decode cycle
          -- Re-run opcode fetch cycle after decode
          --
          when "0100" =>                -- acca single op
            op_ctrl   <= latch_op;
            accb_ctrl <= latch_accb;
            pc_ctrl   <= latch_pc;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            iv_ctrl   <= latch_iv;
            left_ctrl <= acca_left;
            case op_code(3 downto 0) is
              when "0000" =>            -- neg
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_neg;
                acca_ctrl  <= load_acca;
                cc_ctrl    <= load_cc;
              when "0011" =>            -- com
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_com;
                acca_ctrl  <= load_acca;
                cc_ctrl    <= load_cc;
              when "0100" =>            -- lsr
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_lsr8;
                acca_ctrl  <= load_acca;
                cc_ctrl    <= load_cc;
              when "0110" =>            -- ror
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_ror8;
                acca_ctrl  <= load_acca;
                cc_ctrl    <= load_cc;
              when "0111" =>            -- asr
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_asr8;
                acca_ctrl  <= load_acca;
                cc_ctrl    <= load_cc;
              when "1000" =>            -- asl
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_asl8;
                acca_ctrl  <= load_acca;
                cc_ctrl    <= load_cc;
              when "1001" =>            -- rol
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_rol8;
                acca_ctrl  <= load_acca;
                cc_ctrl    <= load_cc;
              when "1010" =>            -- dec
                right_ctrl <= one_right;
                alu_ctrl   <= alu_dec;
                acca_ctrl  <= load_acca;
                cc_ctrl    <= load_cc;
              when "1011" =>            -- undefined
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_nop;
                acca_ctrl  <= latch_acca;
                cc_ctrl    <= latch_cc;
              when "1100" =>            -- inc
                right_ctrl <= one_right;
                alu_ctrl   <= alu_inc;
                acca_ctrl  <= load_acca;
                cc_ctrl    <= load_cc;
              when "1101" =>            -- tst
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_st8;
                acca_ctrl  <= latch_acca;
                cc_ctrl    <= load_cc;
              when "1110" =>            -- jmp (not defined)
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_nop;
                acca_ctrl  <= latch_acca;
                cc_ctrl    <= latch_cc;
              when "1111" =>            -- clr
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_clr;
                acca_ctrl  <= load_acca;
                cc_ctrl    <= load_cc;
              when others =>
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_nop;
                acca_ctrl  <= latch_acca;
                cc_ctrl    <= latch_cc;
            end case;
            st_ctrl      <= idle_st;
            return_state <= fetch_state;
            next_state   <= fetch_state;
          --
          -- Single Operand accb
          -- source = accb, dest = accb
          -- Typically 2 cycles 1 bytes
          -- 1 opcode fetch
          -- 2 post byte fetch / instruction decode
          -- Note that there is no post byte
          -- so do not advance PC in decode cycle
          -- Re-run opcode fetch cycle after decode
          --
          when "0101" =>
            op_ctrl   <= latch_op;
            acca_ctrl <= latch_acca;
            pc_ctrl   <= latch_pc;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            iv_ctrl   <= latch_iv;
            left_ctrl <= accb_left;
            case op_code(3 downto 0) is
              when "0000" =>            -- neg
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_neg;
                accb_ctrl  <= load_accb;
                cc_ctrl    <= load_cc;
              when "0011" =>            -- com
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_com;
                accb_ctrl  <= load_accb;
                cc_ctrl    <= load_cc;
              when "0100" =>            -- lsr
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_lsr8;
                accb_ctrl  <= load_accb;
                cc_ctrl    <= load_cc;
              when "0110" =>            -- ror
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_ror8;
                accb_ctrl  <= load_accb;
                cc_ctrl    <= load_cc;
              when "0111" =>            -- asr
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_asr8;
                accb_ctrl  <= load_accb;
                cc_ctrl    <= load_cc;
              when "1000" =>            -- asl
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_asl8;
                accb_ctrl  <= load_accb;
                cc_ctrl    <= load_cc;
              when "1001" =>            -- rol
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_rol8;
                accb_ctrl  <= load_accb;
                cc_ctrl    <= load_cc;
              when "1010" =>            -- dec
                right_ctrl <= one_right;
                alu_ctrl   <= alu_dec;
                accb_ctrl  <= load_accb;
                cc_ctrl    <= load_cc;
              when "1011" =>            -- undefined
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_nop;
                accb_ctrl  <= latch_accb;
                cc_ctrl    <= latch_cc;
              when "1100" =>            -- inc
                right_ctrl <= one_right;
                alu_ctrl   <= alu_inc;
                accb_ctrl  <= load_accb;
                cc_ctrl    <= load_cc;
              when "1101" =>            -- tst
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_st8;
                accb_ctrl  <= latch_accb;
                cc_ctrl    <= load_cc;
              when "1110" =>            -- jmp (undefined)
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_nop;
                accb_ctrl  <= latch_accb;
                cc_ctrl    <= latch_cc;
              when "1111" =>            -- clr
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_clr;
                accb_ctrl  <= load_accb;
                cc_ctrl    <= load_cc;
              when others =>
                right_ctrl <= zero_right;
                alu_ctrl   <= alu_nop;
                accb_ctrl  <= latch_accb;
                cc_ctrl    <= latch_cc;
            end case;
            st_ctrl      <= idle_st;
            return_state <= fetch_state;
            next_state   <= fetch_state;
          --
          -- Single operand indexed
          -- Two byte instruction so advance PC
          -- EA should hold index offset
          --
          when "0110" =>                -- indexed single op
            op_ctrl    <= latch_op;
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                        -- idle ALU
            left_ctrl  <= pc_left;
            right_ctrl <= one_right;
            alu_ctrl   <= alu_add16;
            cc_ctrl    <= latch_cc;
                                        -- increment the pc
            pc_ctrl    <= incr_pc;
                                        -- next state
            case op_code(3 downto 0) is
              when "1110" =>            -- jmp
                return_state <= jmp_state;
              when "1111" =>            -- clr
                return_state <= single_op_exec_state;
              when others =>
                return_state <= single_op_read_state;
            end case;
            st_ctrl    <= push_st;
            next_state <= indexed_state;
          --
          -- Single operand extended addressing
          -- three byte instruction so advance the PC
          -- Low order EA holds high order address
          --
          when "0111" =>                -- extended single op
            op_ctrl    <= latch_op;
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                        -- idle ALU
            left_ctrl  <= pc_left;
            right_ctrl <= one_right;
            alu_ctrl   <= alu_add16;
            cc_ctrl    <= latch_cc;
                                        -- increment PC
            pc_ctrl    <= incr_pc;
                                        --
            case op_code(3 downto 0) is
              when "1110" =>            -- jmp
                return_state <= jmp_state;
              when "1111" =>            -- clr
                return_state <= single_op_exec_state;
              when others =>
                return_state <= single_op_read_state;
            end case;
            st_ctrl    <= push_st;
            next_state <= extended_state;

          when "1000" =>                  -- acca immediate
            op_ctrl   <= latch_op;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            iv_ctrl   <= latch_iv;
            -- increment the pc
            pc_ctrl   <= incr_pc;
            case op_code(3 downto 0) is
              when   "0011" |   -- subd #
                     "1100" |   -- cmpx #
                     "1110" =>  -- ldx #
                                -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_add16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                          --
                st_ctrl      <= push_st;
                return_state <= fetch_state;
                next_state   <= imm16_state;

              --
              -- bsr offset - Branch to subroutine (2 bytes)
              -- 6809 => 7 cycles
              -- cpu09 => 5 cycles
              -- 1 op=(pc) / pc=pc+1
              -- 2 md_hi=sign(pc) / md_lo=(pc) / sp=sp-1 / pc=pc+1
              -- 3 (sp)=pc_lo / sp=sp-1
              -- 4 (sp)=pc_hi
              -- 5 pc=pc+md
              --
              when "1101" =>            -- bsr
                                        -- pre decrement SP
                left_ctrl    <= sp_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_sub16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= load_sp;
                                        --
                st_ctrl      <= push_st;
                return_state <= sbranch_state;
                next_state   <= push_return_lo_state;

              when others =>
                                        -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_add16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;
            end case;

          when "1001" =>                  -- acca direct
            op_ctrl   <= latch_op;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            iv_ctrl   <= latch_iv;
                                          -- increment the pc
            pc_ctrl   <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |               -- subd
                               "1100" |   -- cmpx
                               "1110" =>  -- ldx
                                          -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_add16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                          --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_read16_state;

              when "0111" =>            -- sta direct
                                        -- idle ALU
                left_ctrl    <= acca_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_write8_state;

              when "1111" =>            -- stx direct
                                        -- idle ALU
                left_ctrl    <= ix_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_write16_state;

              --
              -- jsr direct - Jump to subroutine in direct page (2 bytes)
              -- 6809 => 7 cycles
              -- cpu09 => 5 cycles
              -- 1 op=(pc) / pc=pc+1
              -- 2 ea_hi=0 / ea_lo=(pc) / sp=sp-1 / pc=pc+1
              -- 3 (sp)=pc_lo / sp=sp-1
              -- 4 (sp)=pc_hi
              -- 5 pc=ea
              --
              when "1101" =>            -- jsr direct
                                        -- pre decrement sp
                left_ctrl    <= sp_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_sub16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= load_sp;
                                        --
                st_ctrl      <= push_st;
                return_state <= jmp_state;
                next_state   <= push_return_lo_state;

              when others =>
                                        -- idle ALU
                left_ctrl    <= acca_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_read8_state;
            end case;

          when "1010" =>                  -- acca indexed
            op_ctrl   <= latch_op;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            iv_ctrl   <= latch_iv;
                                          -- increment the pc
            pc_ctrl   <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |               -- subd
                               "1100" |   -- cmpx
                               "1110" =>  -- ldx
                                          -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_add16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                          --
                st_ctrl      <= push_st;
                return_state <= dual_op_read16_state;
                next_state   <= indexed_state;

              when "0111" =>            -- staa ,x
                                        -- idle ALU
                left_ctrl    <= acca_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= push_st;
                return_state <= dual_op_write8_state;
                next_state   <= indexed_state;

              when "1111" =>            -- stx ,x
                                        -- idle ALU
                left_ctrl    <= ix_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= push_st;
                return_state <= dual_op_write16_state;
                next_state   <= indexed_state;

              when "1101" =>            -- jsr ,x
                                        -- DO NOT pre decrement SP
                left_ctrl    <= sp_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_sub16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= push_st;
                return_state <= jsr_state;
                next_state   <= indexed_state;

              when others =>
                                        -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_add16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= push_st;
                return_state <= dual_op_read8_state;
                next_state   <= indexed_state;
            end case;

          when "1011" =>                  -- acca extended
            op_ctrl   <= latch_op;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            iv_ctrl   <= latch_iv;
                                          -- increment the pc
            pc_ctrl   <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |               -- subd
                               "1100" |   -- cmpx
                               "1110" =>  -- ldx
                                          -- idle ALU
                left_ctrl    <= pc_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_add16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                          --
                st_ctrl      <= push_st;
                return_state <= dual_op_read16_state;
                next_state   <= extended_state;

              when "0111" =>            -- staa >
                                        -- idle ALU
                left_ctrl    <= acca_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= push_st;
                return_state <= dual_op_write8_state;
                next_state   <= extended_state;

              when "1111" =>            -- stx >
                                        -- idle ALU
                left_ctrl    <= ix_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= push_st;
                return_state <= dual_op_write16_state;
                next_state   <= extended_state;

              when "1101" =>            -- jsr >extended
                                        -- DO NOT pre decrement sp
                left_ctrl    <= sp_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_sub16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= push_st;
                return_state <= jsr_state;
                next_state   <= extended_state;

              when others =>
                                        -- idle ALU
                left_ctrl    <= acca_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_st8;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                                        --
                st_ctrl      <= push_st;
                return_state <= dual_op_read8_state;
                next_state   <= extended_state;
            end case;

          when "1100" =>                   -- accb immediate
            op_ctrl    <= latch_op;
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
            --
            left_ctrl  <= pc_left;
            right_ctrl <= one_right;
            alu_ctrl   <= alu_add16;
            cc_ctrl    <= latch_cc;
            -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |                -- addd #
                   "1100" |   -- ldd #
                   "1110" =>  -- ldu #
                st_ctrl      <= push_st;
                return_state <= fetch_state;
                next_state   <= imm16_state;

              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

            end case;


          when "1101" =>                   -- accb direct
            op_ctrl    <= latch_op;
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                           -- increment the pc
            pc_ctrl    <= incr_pc;

            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;

            case op_code(3 downto 0) is
              when "0011" |   -- addd
                   "1100" |   -- ldd
                   "1110" =>  -- ldu
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_read16_state;

              when "0111" =>            -- stab direct
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_write8_state;

              when "1101" =>            -- std direct
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_write16_state;

              when "1111" =>            -- stu direct
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_write16_state;

              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_read8_state;
            end case;

          when "1110" =>                 -- accb indexed
            op_ctrl    <= latch_op;
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                         -- increment the pc
            pc_ctrl    <= incr_pc;

            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;

            case op_code(3 downto 0) is
              when "0011" |   -- addd
                   "1100" |   -- ldd
                   "1110" =>  -- ldu
                st_ctrl      <= push_st;
                return_state <= dual_op_read16_state;
                next_state   <= indexed_state;

              when "0111" =>            -- stab indexed
                st_ctrl      <= push_st;
                return_state <= dual_op_write8_state;
                next_state   <= indexed_state;

              when "1101" =>            -- std indexed
                st_ctrl      <= push_st;
                return_state <= dual_op_write16_state;
                next_state   <= indexed_state;

              when "1111" =>            -- stu indexed
                st_ctrl      <= push_st;
                return_state <= dual_op_write16_state;
                next_state   <= indexed_state;

              when others =>
                st_ctrl      <= push_st;
                return_state <= dual_op_read8_state;
                next_state   <= indexed_state;
            end case;

          when "1111" =>                -- accb extended
            op_ctrl    <= latch_op;
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                        -- increment the pc
            pc_ctrl    <= incr_pc;
                                        --
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
                                        --
            case op_code(3 downto 0) is
              when "0011" |   -- addd
                   "1100" |   -- ldd
                   "1110" =>  -- ldu
                st_ctrl      <= push_st;
                return_state <= dual_op_read16_state;
                next_state   <= extended_state;

              when "0111" =>            -- stab extended
                st_ctrl      <= push_st;
                return_state <= dual_op_write8_state;
                next_state   <= extended_state;

              when "1101" =>            -- std extended
                st_ctrl      <= push_st;
                return_state <= dual_op_write16_state;
                next_state   <= extended_state;

              when "1111" =>            -- stu  extended
                st_ctrl      <= push_st;
                return_state <= dual_op_write16_state;
                next_state   <= extended_state;

              when others =>
                st_ctrl      <= push_st;
                return_state <= dual_op_read8_state;
                next_state   <= extended_state;
            end case;

          when others =>
            op_ctrl      <= latch_op;
            acca_ctrl    <= latch_acca;
            accb_ctrl    <= latch_accb;
            ix_ctrl      <= latch_ix;
            iy_ctrl      <= latch_iy;
            up_ctrl      <= latch_up;
            sp_ctrl      <= latch_sp;
            iv_ctrl      <= latch_iv;
                                        -- idle the ALU
            left_ctrl    <= pc_left;
            right_ctrl   <= zero_right;
            alu_ctrl     <= alu_nop;
            cc_ctrl      <= latch_cc;
                                        -- idle the pc
            pc_ctrl      <= latch_pc;
                                        --
            st_ctrl      <= idle_st;
            return_state <= fetch_state;
            next_state   <= fetch_state;
        end case;

        --
        -- Here to decode prefix 2 instruction
        -- and fetch next byte of intruction
        -- whether it be necessary or not
        --
      when decode2_state =>
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        -- fetch first byte of address or immediate data
        ea_ctrl   <= fetch_first_ea;
        md_ctrl   <= fetch_first_md;
        addr_ctrl <= fetch_ad;
        dout_ctrl <= md_lo_dout;
        nmi_ctrl  <= latch_nmi;
        dp_ctrl   <= latch_dp;
        case op_code(7 downto 4) is
          --
          -- lbcc -- long branch conditional
          -- 6809 => branch 6 cycles, no branch 5 cycles
          -- cpu09 => always 5 cycles
          -- 1 pre=(pc) / pc=pc+1
          -- 2 op=(pc) / pc=pc+1
          -- 3 md_hi=sign(pc) / md_lo=(pc) / pc=pc+1
          -- 4 md_hi=md_lo / md_lo=(pc) / pc=pc+1
          -- 5 if cond pc=pc+md else pc=pc
          --
          when "0010" =>
            acca_ctrl    <= latch_acca;
            accb_ctrl    <= latch_accb;
            ix_ctrl      <= latch_ix;
            iy_ctrl      <= latch_iy;
            sp_ctrl      <= latch_sp;
            up_ctrl      <= latch_up;
            iv_ctrl      <= latch_iv;
                                        -- increment the pc
            left_ctrl    <= pc_left;
            right_ctrl   <= zero_right;
            alu_ctrl     <= alu_nop;
            cc_ctrl      <= latch_cc;
            pc_ctrl      <= incr_pc;
                                        --
            st_ctrl      <= idle_st;
            return_state <= fetch_state;
            next_state   <= lbranch_state;

          --
          -- Single byte stack operators
          -- Do not advance PC
          --
          when "0011" =>
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            pc_ctrl   <= latch_pc;
            case op_code(3 downto 0) is
              when "1111" =>            -- swi 2
                                        -- predecrement sp
                left_ctrl    <= sp_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_sub16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= load_sp;
                iv_ctrl      <= swi2_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= int_entire_state;

              when others =>
                left_ctrl    <= sp_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                iv_ctrl      <= latch_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;
            end case;

          when "1000" =>                -- acca immediate
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
            -- Idle the ALU
            left_ctrl  <= pc_left;
            right_ctrl <= one_right;
            alu_ctrl   <= alu_add16;
            cc_ctrl    <= latch_cc;
            -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |   -- cmpd #
                   "1100" |   -- cmpy #
                   "1110" =>  -- ldy #
                st_ctrl      <= push_st;
                return_state <= fetch_state;
                next_state   <= imm16_state;

              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

            end case;

          when "1001" =>                    -- acca direct
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
            -- idle the ALU
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
            -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when   "0011" |     -- cmpd <
                     "1100" |     -- cmpy <
                     "1110"   =>  -- ldy <
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_read16_state;

              when "1111" =>            -- sty <
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_write16_state;

              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

            end case;

          when "1010" =>                  -- acca indexed
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                          -- idle the ALU
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
                                          -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |   -- cmpd ,ind
                   "1100" |   -- cmpy ,ind
                   "1110" =>  -- ldy ,ind
                st_ctrl      <= push_st;
                return_state <= dual_op_read16_state;
                next_state   <= indexed_state;

              when "1111" =>            -- sty ,ind
                st_ctrl      <= push_st;
                return_state <= dual_op_write16_state;
                next_state   <= indexed_state;

              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;
            end case;

          when "1011" =>                -- acca extended
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                        -- idle the ALU
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
                                        -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |   -- cmpd <
                   "1100" |   -- cmpy <
                   "1110" =>  -- ldy <
                st_ctrl      <= push_st;
                return_state <= dual_op_read16_state;
                next_state   <= extended_state;

              when "1111" =>            -- sty >
                st_ctrl      <= push_st;
                return_state <= dual_op_write16_state;
                next_state   <= extended_state;

              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

            end case;

          when "1100" =>                -- accb immediate
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                        -- idle the alu
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
                                        -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |   -- undef #
                   "1100" |   -- undef #
                   "1110" =>  -- lds #
                st_ctrl      <= push_st;
                return_state <= fetch_state;
                next_state   <= imm16_state;

              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

            end case;

          when "1101" =>                                        -- accb direct
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                                                -- idle the alu
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
                                                                -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |     -- undef <
                   "1100" |     -- undef <
                   "1110"   =>  -- lds <
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_read16_state;

              when "1111" =>            -- sts <
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_write16_state;

              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

            end case;

          when "1110" =>                                        -- accb indexed
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                                                -- idle the alu
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
                                                                -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |                                     -- undef ,ind
                   "1100" |   -- undef ,ind
                   "1110" =>  -- lds ,ind
                st_ctrl      <= push_st;
                return_state <= dual_op_read16_state;
                next_state   <= indexed_state;

              when "1111" =>            -- sts ,ind
                st_ctrl      <= push_st;
                return_state <= dual_op_write16_state;
                next_state   <= indexed_state;

              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

            end case;

          when "1111" =>                -- accb extended
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                        -- idle the alu
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
                                        -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |             -- undef >
                   "1100" |   -- undef >
                   "1110" =>  -- lds >
                                     st_ctrl <= push_st;
              return_state <= dual_op_read16_state;
              next_state   <= extended_state;

              when "1111" =>            -- sts >
              st_ctrl      <= push_st;
              return_state <= dual_op_write16_state;
              next_state   <= extended_state;

              when others =>
              st_ctrl      <= idle_st;
              return_state <= fetch_state;
              next_state   <= fetch_state;

            end case;

          when others =>
            acca_ctrl    <= latch_acca;
            accb_ctrl    <= latch_accb;
            ix_ctrl      <= latch_ix;
            iy_ctrl      <= latch_iy;
            up_ctrl      <= latch_up;
            sp_ctrl      <= latch_sp;
            iv_ctrl      <= latch_iv;
                                        -- idle the alu
            left_ctrl    <= pc_left;
            right_ctrl   <= zero_right;
            alu_ctrl     <= alu_nop;
            cc_ctrl      <= latch_cc;
                                        -- idle the pc
            pc_ctrl      <= latch_pc;
            st_ctrl      <= idle_st;
            return_state <= fetch_state;
            next_state   <= fetch_state;
        end case;
      --
      -- Here to decode instruction
      -- and fetch next byte of intruction
      -- whether it be necessary or not
      --
      when decode3_state =>
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        ea_ctrl   <= fetch_first_ea;
        md_ctrl   <= fetch_first_md;
        addr_ctrl <= fetch_ad;
        dout_ctrl <= md_lo_dout;
        nmi_ctrl  <= latch_nmi;
        dp_ctrl   <= latch_dp;
        case op_code(7 downto 4) is
          --
          -- Single byte stack operators
          -- Do not advance PC
          --
          when "0011" =>
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            pc_ctrl   <= latch_pc;
                                        --
            case op_code(3 downto 0) is
              when "1111" =>            -- swi3
                                        -- predecrement sp
                left_ctrl    <= sp_left;
                right_ctrl   <= one_right;
                alu_ctrl     <= alu_sub16;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= load_sp;
                iv_ctrl      <= swi3_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= int_entire_state;
              when others =>
                left_ctrl    <= sp_left;
                right_ctrl   <= zero_right;
                alu_ctrl     <= alu_nop;
                cc_ctrl      <= latch_cc;
                sp_ctrl      <= latch_sp;
                iv_ctrl      <= latch_iv;
                                        --
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;
            end case;

          when "1000" =>                -- acca immediate
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
            -- idle the alu
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
            -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |      -- cmpu #
                   "1100" |      -- cmps #
                   "1110"    =>  -- undef #
                st_ctrl      <= push_st;
                return_state <= fetch_state;
                next_state   <= imm16_state;
              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;
            end case;

          when "1001" =>                                        -- acca direct
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                                                -- idle the alu
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
                                                                -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |                                     -- cmpu <
                   "1100" |   -- cmps <
                   "1110" =>  -- undef <
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= dual_op_read16_state;

              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

            end case;

          when "1010" =>                                        -- acca indexed
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                                                -- idle the alu
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
                                                                -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |                                     -- cmpu ,X
                   "1100" |   -- cmps ,X
                   "1110" =>  -- undef ,X
                st_ctrl      <= push_st;
                return_state <= dual_op_read16_state;
                next_state   <= indexed_state;

              when others =>
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= fetch_state;

            end case;

          when "1011" =>                -- acca extended
            acca_ctrl  <= latch_acca;
            accb_ctrl  <= latch_accb;
            ix_ctrl    <= latch_ix;
            iy_ctrl    <= latch_iy;
            up_ctrl    <= latch_up;
            sp_ctrl    <= latch_sp;
            iv_ctrl    <= latch_iv;
                                        -- idle the alu
            left_ctrl  <= pc_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
                                        -- increment the pc
            pc_ctrl    <= incr_pc;
            case op_code(3 downto 0) is
              when "0011" |   -- cmpu >
                   "1100" |   -- cmps >
                   "1110" =>  -- undef >
                  st_ctrl <= push_st;
                  return_state <= dual_op_read16_state;
                  next_state   <= extended_state;
              when others =>
                  st_ctrl      <= idle_st;
                  return_state <= fetch_state;
                  next_state   <= fetch_state;
            end case;

          when others =>
            acca_ctrl    <= latch_acca;
            accb_ctrl    <= latch_accb;
            ix_ctrl      <= latch_ix;
            iy_ctrl      <= latch_iy;
            up_ctrl      <= latch_up;
            sp_ctrl      <= latch_sp;
            iv_ctrl      <= latch_iv;
                                        -- idle the alu
            left_ctrl    <= pc_left;
            right_ctrl   <= zero_right;
            alu_ctrl     <= alu_nop;
            cc_ctrl      <= latch_cc;
                                        -- idle the pc
            pc_ctrl      <= latch_pc;
            st_ctrl      <= idle_st;
            return_state <= fetch_state;
            next_state   <= fetch_state;
        end case;

        --
      -- here if ea holds low byte
      -- Direct
      -- Extended
      -- Indexed
      -- read memory location
      --
      when single_op_read_state =>
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        nmi_ctrl     <= latch_nmi;
                                        -- idle ALU
        left_ctrl    <= ea_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        cc_ctrl      <= latch_cc;
        ea_ctrl      <= latch_ea;
                                        -- read memory into md
        md_ctrl      <= fetch_first_md;
        addr_ctrl    <= read_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= single_op_exec_state;

      when single_op_exec_state =>
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        dp_ctrl      <= latch_dp;
        nmi_ctrl     <= latch_nmi;
        iv_ctrl      <= latch_iv;
        ea_ctrl      <= latch_ea;
                                        -- idle the bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        case op_code(3 downto 0) is
          when "0000" =>                -- neg
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_neg;
            cc_ctrl    <= load_cc;
            md_ctrl    <= load_md;
            pc_ctrl    <= latch_pc;
            next_state <= single_op_write_state;
          when "0011" =>                -- com
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_com;
            cc_ctrl    <= load_cc;
            md_ctrl    <= load_md;
            pc_ctrl    <= latch_pc;
            next_state <= single_op_write_state;
          when "0100" =>                -- lsr
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_lsr8;
            cc_ctrl    <= load_cc;
            md_ctrl    <= load_md;
            pc_ctrl    <= latch_pc;
            next_state <= single_op_write_state;
          when "0110" =>                -- ror
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_ror8;
            cc_ctrl    <= load_cc;
            md_ctrl    <= load_md;
            pc_ctrl    <= latch_pc;
            next_state <= single_op_write_state;
          when "0111" =>                -- asr
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_asr8;
            cc_ctrl    <= load_cc;
            md_ctrl    <= load_md;
            pc_ctrl    <= latch_pc;
            next_state <= single_op_write_state;
          when "1000" =>                -- asl
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_asl8;
            cc_ctrl    <= load_cc;
            md_ctrl    <= load_md;
            pc_ctrl    <= latch_pc;
            next_state <= single_op_write_state;
          when "1001" =>                -- rol
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_rol8;
            cc_ctrl    <= load_cc;
            md_ctrl    <= load_md;
            pc_ctrl    <= latch_pc;
            next_state <= single_op_write_state;
          when "1010" =>                -- dec
            left_ctrl  <= md_left;
            right_ctrl <= one_right;
            alu_ctrl   <= alu_dec;
            cc_ctrl    <= load_cc;
            md_ctrl    <= load_md;
            pc_ctrl    <= latch_pc;
            next_state <= single_op_write_state;
          when "1011" =>                -- undefined
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
            md_ctrl    <= latch_md;
            pc_ctrl    <= latch_pc;
            next_state <= fetch_state;
          when "1100" =>                -- inc
            left_ctrl  <= md_left;
            right_ctrl <= one_right;
            alu_ctrl   <= alu_inc;
            cc_ctrl    <= load_cc;
            md_ctrl    <= load_md;
            pc_ctrl    <= latch_pc;
            next_state <= single_op_write_state;
          when "1101" =>                -- tst
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_st8;
            cc_ctrl    <= load_cc;
            md_ctrl    <= latch_md;
            pc_ctrl    <= latch_pc;
            next_state <= fetch_state;
          when "1110" =>                -- jmp
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_ld16;
            cc_ctrl    <= latch_cc;
            md_ctrl    <= latch_md;
            pc_ctrl    <= load_pc;
            next_state <= fetch_state;
          when "1111" =>                -- clr
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_clr;
            cc_ctrl    <= load_cc;
            md_ctrl    <= load_md;
            pc_ctrl    <= latch_pc;
            next_state <= single_op_write_state;
          when others =>
            left_ctrl  <= md_left;
            right_ctrl <= zero_right;
            alu_ctrl   <= alu_nop;
            cc_ctrl    <= latch_cc;
            md_ctrl    <= latch_md;
            pc_ctrl    <= latch_pc;
            next_state <= fetch_state;
        end case;
      --
      -- single operand 8 bit write
      -- Write low 8 bits of ALU output
      -- EA holds address
      -- MD holds data
      --
      when single_op_write_state =>
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- idle the ALU
        left_ctrl    <= acca_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        cc_ctrl      <= latch_cc;
        -- write ALU low byte output
        addr_ctrl    <= write_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

      --
      -- here if ea holds address of low byte
      -- read memory location
      --
      when dual_op_read8_state =>
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        nmi_ctrl     <= latch_nmi;
        left_ctrl    <= ea_left;
                                        -- Leave the ea alone
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        cc_ctrl      <= latch_cc;
        ea_ctrl      <= latch_ea;
        -- read first data byte from ea
        md_ctrl      <= fetch_first_md;
        addr_ctrl    <= read_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

      --
      -- Here to read a 16 bit value into MD
      -- pointed to by the EA register
      -- The first byte is read
      -- and the EA is incremented
      --
      when dual_op_read16_state =>
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        iv_ctrl      <= latch_iv;
        nmi_ctrl     <= latch_nmi;
                                        -- increment the effective address
        left_ctrl    <= ea_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        ea_ctrl      <= load_ea;
                                        -- read the low byte of the 16 bit data
        md_ctrl      <= fetch_first_md;
        addr_ctrl    <= read_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= dual_op_read16_2_state;

      --
      -- here to read the second byte
      -- pointed to by EA into MD
      --
      when dual_op_read16_2_state =>
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        iv_ctrl      <= latch_iv;
        nmi_ctrl     <= latch_nmi;
                                        -- idle the effective address
        left_ctrl    <= ea_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_nop;
        ea_ctrl      <= latch_ea;
                                        -- read the low byte of the 16 bit data
        md_ctrl      <= fetch_next_md;
        addr_ctrl    <= read_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

      --
      -- 16 bit Write state
      -- EA hold address of memory to write to
      -- Advance the effective address in ALU
      -- decode op_code to determine which
      -- register to write
      --
      when dual_op_write16_state =>
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        sp_ctrl    <= latch_sp;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        dp_ctrl    <= latch_dp;
        nmi_ctrl   <= latch_nmi;
        -- increment the effective address
        left_ctrl  <= ea_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_add16;
        cc_ctrl    <= latch_cc;
        ea_ctrl    <= load_ea;
        -- write the ALU hi byte at ea
        addr_ctrl  <= write_ad;
        if op_code(6) = '0' then
          case op_code(3 downto 0) is
            when "1111" =>              -- stx / sty
              case pre_code is
                when "00010000" =>  -- page 2 -- sty
                  dout_ctrl <= iy_hi_dout;
                when others =>  -- page 1 -- stx
                  dout_ctrl <= ix_hi_dout;
              end case;
            when others =>
              dout_ctrl <= md_hi_dout;
          end case;
        else
          case op_code(3 downto 0) is
            when "1101" =>              -- std
              dout_ctrl <= acca_dout;   -- acca is high byte of ACCD
            when "1111" =>              -- stu / sts
              case pre_code is
                when "00010000" =>  -- page 2 -- sts
                  dout_ctrl <= sp_hi_dout;
                when others =>  -- page 1 -- stu
                  dout_ctrl <= up_hi_dout;
              end case;
            when others =>
              dout_ctrl <= md_hi_dout;
          end case;
        end if;
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= dual_op_write8_state;

      --
      -- Dual operand 8 bit write
      -- Write 8 bit accumulator
      -- or low byte of 16 bit register
      -- EA holds address
      -- decode opcode to determine
      -- which register to apply to the bus
      -- Also set the condition codes here
      --
      when dual_op_write8_state =>
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        sp_ctrl    <= latch_sp;
        pc_ctrl    <= latch_pc;
        iv_ctrl    <= latch_iv;
        dp_ctrl    <= latch_dp;
        nmi_ctrl   <= latch_nmi;
        md_ctrl    <= latch_md;
        -- idle ALU
        left_ctrl  <= ea_left;
        right_ctrl <= zero_right;
        alu_ctrl   <= alu_nop;
        cc_ctrl    <= latch_cc;
        ea_ctrl    <= latch_ea;
        --
        if op_code(6) = '0' then        -- '0' = acca line
          case op_code(3 downto 0) is
            when "0111" =>              -- sta
              dout_ctrl <= acca_dout;
            when "1111" =>              -- stx / sty
              case pre_code is
                when "00010000" =>  -- page 2 -- sty
                  dout_ctrl <= iy_lo_dout;
                when others =>  -- page 1 -- stx
                  dout_ctrl <= ix_lo_dout;
              end case;
            when others =>
              dout_ctrl <= md_lo_dout;
          end case;
        else                            -- '1' = accb line
          case op_code(3 downto 0) is
            when "0111" =>              -- stb
              dout_ctrl <= accb_dout;
            when "1101" =>              -- std
              dout_ctrl <= accb_dout;   -- accb is low byte of accd
            when "1111" =>              -- stu / sts
              case pre_code is
                when "00010000" =>  -- page 2 -- sts
                  dout_ctrl <= sp_lo_dout;
                when others =>  -- page 1 -- stu
                  dout_ctrl <= up_lo_dout;
              end case;
            when others =>
              dout_ctrl <= md_lo_dout;
          end case;
        end if;
        -- write ALU low byte output
        addr_ctrl    <= write_ad;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

      --
      -- 16 bit immediate addressing mode
      --
      when imm16_state =>
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
                                        --
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
                                        --
        iv_ctrl      <= latch_iv;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment pc
        left_ctrl    <= pc_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        pc_ctrl      <= incr_pc;
        -- fetch next immediate byte
        md_ctrl      <= fetch_next_md;
        addr_ctrl    <= fetch_ad;
        dout_ctrl    <= md_lo_dout;
        -- return to caller
        st_ctrl      <= pull_st;
        return_state <= fetch_state;
        next_state   <= saved_state;

      --
      -- md & ea holds 8 bit index offset
      -- calculate the effective memory address
      -- using the alu
      --
      when indexed_state =>
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        acca_ctrl <= latch_acca;
        accb_ctrl <= latch_accb;
        iv_ctrl   <= latch_iv;
        dp_ctrl   <= latch_dp;
        nmi_ctrl  <= latch_nmi;
        dout_ctrl <= md_lo_dout;
        --
        -- decode indexing mode
        --
        if md(7) = '0' then
          ix_ctrl <= latch_ix;
          iy_ctrl <= latch_iy;
          up_ctrl <= latch_up;
          sp_ctrl <= latch_sp;
          case md(6 downto 5) is
            when "00" =>
              left_ctrl <= ix_left;
            when "01" =>
              left_ctrl <= iy_left;
            when "10" =>
              left_ctrl <= up_left;
            when others =>
                                        -- when "11" =>
              left_ctrl <= sp_left;
          end case;
          right_ctrl   <= md_sign5_right;
          alu_ctrl     <= alu_add16;
          cc_ctrl      <= latch_cc;
          ea_ctrl      <= load_ea;
                                        --
          md_ctrl      <= latch_md;
          addr_ctrl    <= idle_ad;
          pc_ctrl      <= latch_pc;
                                        --
          st_ctrl      <= pull_st;
          return_state <= fetch_state;
          next_state   <= saved_state;

        else
          case md(3 downto 0) is
            when "0000" =>              -- ,R+
              ix_ctrl <= latch_ix;
              iy_ctrl <= latch_iy;
              up_ctrl <= latch_up;
              sp_ctrl <= latch_sp;
              case md(6 downto 5) is
                when "00" =>
                  left_ctrl <= ix_left;
                when "01" =>
                  left_ctrl <= iy_left;
                when "10" =>
                  left_ctrl <= up_left;
                when others =>
                  left_ctrl <= sp_left;
              end case;
                                        --
              right_ctrl   <= zero_right;
              alu_ctrl     <= alu_st16;
              cc_ctrl      <= latch_cc;
              ea_ctrl      <= load_ea;
                                        --
              md_ctrl      <= latch_md;
              addr_ctrl    <= idle_ad;
              pc_ctrl      <= latch_pc;
                                        --
              st_ctrl      <= idle_st;
              return_state <= fetch_state;
              next_state   <= postincr1_state;

            when "0001" =>              -- ,R++
              ix_ctrl <= latch_ix;
              iy_ctrl <= latch_iy;
              up_ctrl <= latch_up;
              sp_ctrl <= latch_sp;
              case md(6 downto 5) is
                when "00" =>
                  left_ctrl <= ix_left;
                when "01" =>
                  left_ctrl <= iy_left;
                when "10" =>
                  left_ctrl <= up_left;
                when others =>
                                        -- when "11" =>
                  left_ctrl <= sp_left;
              end case;
              right_ctrl   <= zero_right;
              alu_ctrl     <= alu_st16;
              cc_ctrl      <= latch_cc;
              ea_ctrl      <= load_ea;
                                        --
              md_ctrl      <= latch_md;
              addr_ctrl    <= idle_ad;
              pc_ctrl      <= latch_pc;
                                        --
              st_ctrl      <= idle_st;
              return_state <= fetch_state;
              next_state   <= postincr2_state;

            when "0010" =>              -- ,-R
              case md(6 downto 5) is
                when "00" =>
                  left_ctrl <= ix_left;
                  ix_ctrl   <= load_ix;
                  iy_ctrl   <= latch_iy;
                  up_ctrl   <= latch_up;
                  sp_ctrl   <= latch_sp;
                when "01" =>
                  left_ctrl <= iy_left;
                  ix_ctrl   <= latch_ix;
                  iy_ctrl   <= load_iy;
                  up_ctrl   <= latch_up;
                  sp_ctrl   <= latch_sp;
                when "10" =>
                  left_ctrl <= up_left;
                  ix_ctrl   <= latch_ix;
                  iy_ctrl   <= latch_iy;
                  up_ctrl   <= load_up;
                  sp_ctrl   <= latch_sp;
                when others =>
                                        -- when "11" =>
                  left_ctrl <= sp_left;
                  ix_ctrl   <= latch_ix;
                  iy_ctrl   <= latch_iy;
                  up_ctrl   <= latch_up;
                  sp_ctrl   <= load_sp;
              end case;
              right_ctrl   <= one_right;
              alu_ctrl     <= alu_sub16;
              cc_ctrl      <= latch_cc;
              ea_ctrl      <= load_ea;
                                        --
              md_ctrl      <= latch_md;
              addr_ctrl    <= idle_ad;
              pc_ctrl      <= latch_pc;
                                        --
              st_ctrl      <= pull_st;
              return_state <= fetch_state;
              next_state   <= saved_state;

            when "0011" =>  -- ,--R
              case md(6 downto 5) is
                when "00" =>
                  left_ctrl <= ix_left;
                  ix_ctrl   <= load_ix;
                  iy_ctrl   <= latch_iy;
                  up_ctrl   <= latch_up;
                  sp_ctrl   <= latch_sp;
                when "01" =>
                  left_ctrl <= iy_left;
                  ix_ctrl   <= latch_ix;
                  iy_ctrl   <= load_iy;
                  up_ctrl   <= latch_up;
                  sp_ctrl   <= latch_sp;
                when "10" =>
                  left_ctrl <= up_left;
                  ix_ctrl   <= latch_ix;
                  iy_ctrl   <= latch_iy;
                  up_ctrl   <= load_up;
                  sp_ctrl   <= latch_sp;
                when others =>
                                        -- when "11" =>
                  left_ctrl <= sp_left;
                  ix_ctrl   <= latch_ix;
                  iy_ctrl   <= latch_iy;
                  up_ctrl   <= latch_up;
                  sp_ctrl   <= load_sp;
              end case;
              right_ctrl <= two_right;
              alu_ctrl   <= alu_sub16;
              cc_ctrl    <= latch_cc;
              ea_ctrl    <= load_ea;
                                        --
              md_ctrl    <= latch_md;
              addr_ctrl  <= idle_ad;
              pc_ctrl    <= latch_pc;
                                        --
              if md(4) = '0' then
                st_ctrl      <= pull_st;
                return_state <= fetch_state;
                next_state   <= saved_state;
              else
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= indirect_state;
              end if;

            when "0100" =>              -- ,R (zero offset)
              ix_ctrl <= latch_ix;
              iy_ctrl <= latch_iy;
              up_ctrl <= latch_up;
              sp_ctrl <= latch_sp;
              case md(6 downto 5) is
                when "00" =>
                  left_ctrl <= ix_left;
                when "01" =>
                  left_ctrl <= iy_left;
                when "10" =>
                  left_ctrl <= up_left;
                when others =>
                                        -- when "11" =>
                  left_ctrl <= sp_left;
              end case;
              right_ctrl <= zero_right;
              alu_ctrl   <= alu_st16;
              cc_ctrl    <= latch_cc;
              ea_ctrl    <= load_ea;
                                        --
              md_ctrl    <= latch_md;
              addr_ctrl  <= idle_ad;
              pc_ctrl    <= latch_pc;
                                        --
              if md(4) = '0' then
                st_ctrl      <= pull_st;
                return_state <= fetch_state;
                next_state   <= saved_state;
              else
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= indirect_state;
              end if;

            when "0101" =>              -- ACCB,R
              ix_ctrl <= latch_ix;
              iy_ctrl <= latch_iy;
              up_ctrl <= latch_up;
              sp_ctrl <= latch_sp;
              case md(6 downto 5) is
                when "00" =>
                  left_ctrl <= ix_left;
                when "01" =>
                  left_ctrl <= iy_left;
                when "10" =>
                  left_ctrl <= up_left;
                when others =>
                                        -- when "11" =>
                  left_ctrl <= sp_left;
              end case;
              right_ctrl <= accb_right;
              alu_ctrl   <= alu_add16;
              cc_ctrl    <= latch_cc;
              ea_ctrl    <= load_ea;
                                        --
              md_ctrl    <= latch_md;
              addr_ctrl  <= idle_ad;
              pc_ctrl    <= latch_pc;
                                        --
              if md(4) = '0' then
                st_ctrl      <= pull_st;
                return_state <= fetch_state;
                next_state   <= saved_state;
              else
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= indirect_state;
              end if;

            when "0110" =>              -- ACCA,R
              ix_ctrl <= latch_ix;
              iy_ctrl <= latch_iy;
              up_ctrl <= latch_up;
              sp_ctrl <= latch_sp;
              case md(6 downto 5) is
                when "00" =>
                  left_ctrl <= ix_left;
                when "01" =>
                  left_ctrl <= iy_left;
                when "10" =>
                  left_ctrl <= up_left;
                when others =>
                                        -- when "11" =>
                  left_ctrl <= sp_left;
              end case;
              right_ctrl <= acca_right;
              alu_ctrl   <= alu_add16;
              cc_ctrl    <= latch_cc;
              ea_ctrl    <= load_ea;
                                        --
              md_ctrl    <= latch_md;
              addr_ctrl  <= idle_ad;
              pc_ctrl    <= latch_pc;
                                        --
              if md(4) = '0' then
                st_ctrl      <= pull_st;
                return_state <= fetch_state;
                next_state   <= saved_state;
              else
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= indirect_state;
              end if;

            when "0111" =>              -- undefined
              ix_ctrl <= latch_ix;
              iy_ctrl <= latch_iy;
              up_ctrl <= latch_up;
              sp_ctrl <= latch_sp;
              case md(6 downto 5) is
                when "00" =>
                  left_ctrl <= ix_left;
                when "01" =>
                  left_ctrl <= iy_left;
                when "10" =>
                  left_ctrl <= up_left;
                when others =>
                                        -- when "11" =>
                  left_ctrl <= sp_left;
              end case;
              right_ctrl <= zero_right;
              alu_ctrl   <= alu_nop;
              cc_ctrl    <= latch_cc;
              ea_ctrl    <= latch_ea;
                                        --
              md_ctrl    <= latch_md;
              addr_ctrl  <= idle_ad;
              pc_ctrl    <= latch_pc;
                                        --
              if md(4) = '0' then
                st_ctrl      <= pull_st;
                return_state <= fetch_state;
                next_state   <= saved_state;
              else
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= indirect_state;
              end if;

            when "1000" =>                     -- offset8,R
              ix_ctrl      <= latch_ix;
              iy_ctrl      <= latch_iy;
              up_ctrl      <= latch_up;
              sp_ctrl      <= latch_sp;
                                               --
              left_ctrl    <= pc_left;
              right_ctrl   <= zero_right;
              alu_ctrl     <= alu_nop;
              cc_ctrl      <= latch_cc;
              ea_ctrl      <= latch_ea;
                                               --
              md_ctrl      <= fetch_first_md;  -- pick up 8 bit offset
              addr_ctrl    <= fetch_ad;
              pc_ctrl      <= incr_pc;
                                               --
              st_ctrl      <= idle_st;
              return_state <= fetch_state;
              next_state   <= index8_state;

            when "1001" =>              -- offset16,R
              ix_ctrl      <= latch_ix;
              iy_ctrl      <= latch_iy;
              up_ctrl      <= latch_up;
              sp_ctrl      <= latch_sp;
                                        --
              left_ctrl    <= pc_left;
              right_ctrl   <= zero_right;
              alu_ctrl     <= alu_nop;
              cc_ctrl      <= latch_cc;
              ea_ctrl      <= latch_ea;
                                        --
              md_ctrl      <= fetch_first_md;  -- pick up first byte of 16 bit offset
              addr_ctrl    <= fetch_ad;
              pc_ctrl      <= incr_pc;
                                        --
              st_ctrl      <= idle_st;
              return_state <= fetch_state;
              next_state   <= index16_state;

            when "1010" =>              -- undefined
              ix_ctrl <= latch_ix;
              iy_ctrl <= latch_iy;
              up_ctrl <= latch_up;
              sp_ctrl <= latch_sp;
              case md(6 downto 5) is
                when "00" =>
                  left_ctrl <= ix_left;
                when "01" =>
                  left_ctrl <= iy_left;
                when "10" =>
                  left_ctrl <= up_left;
                when others =>
                                        -- when "11" =>
                  left_ctrl <= sp_left;
              end case;
              right_ctrl <= zero_right;
              alu_ctrl   <= alu_nop;
              cc_ctrl    <= latch_cc;
              ea_ctrl    <= latch_ea;
                                        --
              md_ctrl    <= latch_md;
              addr_ctrl  <= idle_ad;
              pc_ctrl    <= latch_pc;
                                        --
              if md(4) = '0' then
                st_ctrl      <= pull_st;
                return_state <= fetch_state;
                next_state   <= saved_state;
              else
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= indirect_state;
              end if;

            when "1011" =>              -- ACCD,R
              ix_ctrl <= latch_ix;
              iy_ctrl <= latch_iy;
              up_ctrl <= latch_up;
              sp_ctrl <= latch_sp;
              case md(6 downto 5) is
                when "00" =>
                  left_ctrl <= ix_left;
                when "01" =>
                  left_ctrl <= iy_left;
                when "10" =>
                  left_ctrl <= up_left;
                when others =>
                                        -- when "11" =>
                  left_ctrl <= sp_left;
              end case;
              right_ctrl <= accd_right;
              alu_ctrl   <= alu_add16;
              cc_ctrl    <= latch_cc;
              ea_ctrl    <= load_ea;
                                        --
              md_ctrl    <= latch_md;
              addr_ctrl  <= idle_ad;
              pc_ctrl    <= latch_pc;
                                        --
              if md(4) = '0' then
                st_ctrl      <= pull_st;
                return_state <= fetch_state;
                next_state   <= saved_state;
              else
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= indirect_state;
              end if;

            when "1100" =>              -- offset8,PC
              ix_ctrl      <= latch_ix;
              iy_ctrl      <= latch_iy;
              up_ctrl      <= latch_up;
              sp_ctrl      <= latch_sp;
                                        --
              left_ctrl    <= pc_left;
              right_ctrl   <= zero_right;
              alu_ctrl     <= alu_nop;
              cc_ctrl      <= latch_cc;
              ea_ctrl      <= latch_ea;
                                        -- fetch 8 bit offset
              md_ctrl      <= fetch_first_md;
              addr_ctrl    <= fetch_ad;
              pc_ctrl      <= incr_pc;
                                        --
              st_ctrl      <= idle_st;
              return_state <= fetch_state;
              next_state   <= pcrel8_state;

            when "1101" =>              -- offset16,PC
              ix_ctrl      <= latch_ix;
              iy_ctrl      <= latch_iy;
              up_ctrl      <= latch_up;
              sp_ctrl      <= latch_sp;
                                        --
              left_ctrl    <= pc_left;
              right_ctrl   <= zero_right;
              alu_ctrl     <= alu_nop;
              cc_ctrl      <= latch_cc;
              ea_ctrl      <= latch_ea;
                                        -- fetch offset
              md_ctrl      <= fetch_first_md;
              addr_ctrl    <= fetch_ad;
              pc_ctrl      <= incr_pc;
                                        --
              st_ctrl      <= idle_st;
              return_state <= fetch_state;
              next_state   <= pcrel16_state;

            when "1110" =>              -- undefined
              ix_ctrl <= latch_ix;
              iy_ctrl <= latch_iy;
              up_ctrl <= latch_up;
              sp_ctrl <= latch_sp;
              case md(6 downto 5) is
                when "00" =>
                  left_ctrl <= ix_left;
                when "01" =>
                  left_ctrl <= iy_left;
                when "10" =>
                  left_ctrl <= up_left;
                when others =>
                                        -- when "11" =>
                  left_ctrl <= sp_left;
              end case;
              right_ctrl <= zero_right;
              alu_ctrl   <= alu_nop;
              cc_ctrl    <= latch_cc;
              ea_ctrl    <= load_ea;
                                        --
              md_ctrl    <= latch_md;
              addr_ctrl  <= idle_ad;
              pc_ctrl    <= latch_pc;
                                        --
              if md(4) = '0' then
                st_ctrl      <= pull_st;
                return_state <= fetch_state;
                next_state   <= saved_state;
              else
                st_ctrl      <= idle_st;
                return_state <= fetch_state;
                next_state   <= indirect_state;
              end if;

            when others =>  -- when "1111" =>     -- [,address]
              ix_ctrl      <= latch_ix;
              iy_ctrl      <= latch_iy;
              up_ctrl      <= latch_up;
              sp_ctrl      <= latch_sp;
                                        -- idle ALU
              left_ctrl    <= pc_left;
              right_ctrl   <= zero_right;
              alu_ctrl     <= alu_nop;
              cc_ctrl      <= latch_cc;
              ea_ctrl      <= latch_ea;
                                        -- advance PC to pick up address
              md_ctrl      <= fetch_first_md;
              addr_ctrl    <= fetch_ad;
              pc_ctrl      <= incr_pc;
                                        --
              st_ctrl      <= idle_st;
              return_state <= fetch_state;
              next_state   <= indexaddr_state;
          end case;
        end if;

        -- load index register with ea plus one
      when postincr1_state =>
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        cc_ctrl    <= latch_cc;
        dp_ctrl    <= latch_dp;
        iv_ctrl    <= latch_iv;
        nmi_ctrl   <= latch_nmi;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        ea_ctrl    <= latch_ea;
        --
        left_ctrl  <= ea_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_add16;
        case md(6 downto 5) is
          when "00" =>
            ix_ctrl <= load_ix;
            iy_ctrl <= latch_iy;
            up_ctrl <= latch_up;
            sp_ctrl <= latch_sp;
          when "01" =>
            ix_ctrl <= latch_ix;
            iy_ctrl <= load_iy;
            up_ctrl <= latch_up;
            sp_ctrl <= latch_sp;
          when "10" =>
            ix_ctrl <= latch_ix;
            iy_ctrl <= latch_iy;
            up_ctrl <= load_up;
            sp_ctrl <= latch_sp;
          when others =>         -- when "11" =>
            ix_ctrl <= latch_ix;
            iy_ctrl <= latch_iy;
            up_ctrl <= latch_up;
            sp_ctrl <= load_sp;
        end case;
        addr_ctrl <= idle_ad;
        dout_ctrl <= md_lo_dout;
        -- return to previous state
        if md(4) = '0' then
          st_ctrl      <= pull_st;
          return_state <= fetch_state;
          next_state   <= saved_state;
        else
          st_ctrl      <= idle_st;
          return_state <= fetch_state;
          next_state   <= indirect_state;
        end if;

        -- load index register with ea plus two
      when postincr2_state =>
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        cc_ctrl    <= latch_cc;
        dp_ctrl    <= latch_dp;
        iv_ctrl    <= latch_iv;
        nmi_ctrl   <= latch_nmi;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        ea_ctrl    <= latch_ea;
        -- increment register by two (address)
        left_ctrl  <= ea_left;
        right_ctrl <= two_right;
        alu_ctrl   <= alu_add16;
        case md(6 downto 5) is
          when "00" =>
            ix_ctrl <= load_ix;
            iy_ctrl <= latch_iy;
            up_ctrl <= latch_up;
            sp_ctrl <= latch_sp;
          when "01" =>
            ix_ctrl <= latch_ix;
            iy_ctrl <= load_iy;
            up_ctrl <= latch_up;
            sp_ctrl <= latch_sp;
          when "10" =>
            ix_ctrl <= latch_ix;
            iy_ctrl <= latch_iy;
            up_ctrl <= load_up;
            sp_ctrl <= latch_sp;
          when others =>
            -- when "11" =>
            ix_ctrl <= latch_ix;
            iy_ctrl <= latch_iy;
            up_ctrl <= latch_up;
            sp_ctrl <= load_sp;
        end case;
        addr_ctrl <= idle_ad;
        dout_ctrl <= md_lo_dout;
        -- return to previous state
        if md(4) = '0' then
          st_ctrl      <= pull_st;
          return_state <= fetch_state;
          next_state   <= saved_state;
        else
          st_ctrl      <= idle_st;
          return_state <= fetch_state;
          next_state   <= indirect_state;
        end if;
      --
      -- ea = index register + md (8 bit signed offset)
      -- ea holds post byte
      --
      when index8_state =>
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        acca_ctrl <= latch_acca;
        accb_ctrl <= latch_accb;
        cc_ctrl   <= latch_cc;
        dp_ctrl   <= latch_dp;
        ix_ctrl   <= latch_ix;
        iy_ctrl   <= latch_iy;
        up_ctrl   <= latch_up;
        sp_ctrl   <= latch_sp;
        iv_ctrl   <= latch_iv;
        nmi_ctrl  <= latch_nmi;
        pc_ctrl   <= latch_pc;
        md_ctrl   <= latch_md;
        case ea(6 downto 5) is
          when "00" =>
            left_ctrl <= ix_left;
          when "01" =>
            left_ctrl <= iy_left;
          when "10" =>
            left_ctrl <= up_left;
          when others =>
            -- when "11" =>
            left_ctrl <= sp_left;
        end case;
        -- ea = index reg + md
        right_ctrl <= md_sign8_right;
        alu_ctrl   <= alu_add16;
        ea_ctrl    <= load_ea;
        -- idle bus
        addr_ctrl  <= idle_ad;
        dout_ctrl  <= md_lo_dout;
        -- return to previous state
        if ea(4) = '0' then
          st_ctrl      <= pull_st;
          return_state <= fetch_state;
          next_state   <= saved_state;
        else
          st_ctrl      <= idle_st;
          return_state <= fetch_state;
          next_state   <= indirect_state;
        end if;

        -- fetch low byte of 16 bit indexed offset
      when index16_state =>
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        iv_ctrl      <= latch_iv;
        nmi_ctrl     <= latch_nmi;
        -- advance pc
        left_ctrl    <= pc_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        pc_ctrl      <= incr_pc;
        -- fetch low byte
        ea_ctrl      <= latch_ea;
        md_ctrl      <= fetch_next_md;
        addr_ctrl    <= fetch_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= index16_2_state;

      -- ea = index register + md (16 bit offset)
      -- ea holds post byte
      when index16_2_state =>
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        acca_ctrl <= latch_acca;
        accb_ctrl <= latch_accb;
        cc_ctrl   <= latch_cc;
        dp_ctrl   <= latch_dp;
        ix_ctrl   <= latch_ix;
        iy_ctrl   <= latch_iy;
        up_ctrl   <= latch_up;
        sp_ctrl   <= latch_sp;
        iv_ctrl   <= latch_iv;
        nmi_ctrl  <= latch_nmi;
        pc_ctrl   <= latch_pc;
        md_ctrl   <= latch_md;
        case ea(6 downto 5) is
          when "00" =>
            left_ctrl <= ix_left;
          when "01" =>
            left_ctrl <= iy_left;
          when "10" =>
            left_ctrl <= up_left;
          when others =>
            -- when "11" =>
            left_ctrl <= sp_left;
        end case;
        -- ea = index reg + md
        right_ctrl <= md_right;
        alu_ctrl   <= alu_add16;
        ea_ctrl    <= load_ea;
        -- idle bus
        addr_ctrl  <= idle_ad;
        dout_ctrl  <= md_lo_dout;
        -- return to previous state
        if ea(4) = '0' then
          st_ctrl      <= pull_st;
          return_state <= fetch_state;
          next_state   <= saved_state;
        else
          st_ctrl      <= idle_st;
          return_state <= fetch_state;
          next_state   <= indirect_state;
        end if;
      --
      -- pc relative with 8 bit signed offest
      -- md holds signed offset
      --
      when pcrel8_state =>
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        cc_ctrl    <= latch_cc;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        sp_ctrl    <= latch_sp;
        iv_ctrl    <= latch_iv;
        nmi_ctrl   <= latch_nmi;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        -- ea = pc + signed md
        left_ctrl  <= pc_left;
        right_ctrl <= md_sign8_right;
        alu_ctrl   <= alu_add16;
        ea_ctrl    <= load_ea;
        -- idle bus
        addr_ctrl  <= idle_ad;
        dout_ctrl  <= md_lo_dout;
        -- return to previous state
        if ea(4) = '0' then
          st_ctrl      <= pull_st;
          return_state <= fetch_state;
          next_state   <= saved_state;
        else
          st_ctrl      <= idle_st;
          return_state <= fetch_state;
          next_state   <= indirect_state;
        end if;

      -- pc relative addressing with 16 bit offset
      -- pick up the low byte of the offset in md
      -- advance the pc
      when pcrel16_state =>
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        iv_ctrl      <= latch_iv;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- advance pc
        left_ctrl    <= pc_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        pc_ctrl      <= incr_pc;
        -- fetch low byte
        ea_ctrl      <= latch_ea;
        md_ctrl      <= fetch_next_md;
        addr_ctrl    <= fetch_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pcrel16_2_state;

      -- pc relative with16 bit signed offest
      -- md holds signed offset
      when pcrel16_2_state =>
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        cc_ctrl    <= latch_cc;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        sp_ctrl    <= latch_sp;
        iv_ctrl    <= latch_iv;
        nmi_ctrl   <= latch_nmi;
        pc_ctrl    <= latch_pc;
        -- ea = pc +  md
        left_ctrl  <= pc_left;
        right_ctrl <= md_right;
        alu_ctrl   <= alu_add16;
        ea_ctrl    <= load_ea;
        md_ctrl    <= latch_md;
        -- idle bus
        addr_ctrl  <= idle_ad;
        dout_ctrl  <= md_lo_dout;
        -- return to previous state
        if ea(4) = '0' then
          st_ctrl      <= pull_st;
          return_state <= fetch_state;
          next_state   <= saved_state;
        else
          st_ctrl      <= idle_st;
          return_state <= fetch_state;
          next_state   <= indirect_state;
        end if;

      -- indexed to address
      -- pick up the low byte of the address
      -- advance the pc
      when indexaddr_state =>
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        -- advance pc
        left_ctrl    <= pc_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        pc_ctrl      <= incr_pc;
        -- fetch low byte
        ea_ctrl      <= latch_ea;
        md_ctrl      <= fetch_next_md;
        addr_ctrl    <= fetch_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= indexaddr2_state;

        -- indexed to absolute address
        -- md holds address
        -- ea hold indexing mode byte
      when indexaddr2_state =>
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        cc_ctrl    <= latch_cc;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        sp_ctrl    <= latch_sp;
        iv_ctrl    <= latch_iv;
        nmi_ctrl   <= latch_nmi;
        pc_ctrl    <= latch_pc;
        -- ea = md
        left_ctrl  <= pc_left;
        right_ctrl <= md_right;
        alu_ctrl   <= alu_ld16;
        ea_ctrl    <= load_ea;
        md_ctrl    <= latch_md;
        -- idle bus
        addr_ctrl  <= idle_ad;
        dout_ctrl  <= md_lo_dout;
        -- return to previous state
        if ea(4) = '0' then
          st_ctrl      <= pull_st;
          return_state <= fetch_state;
          next_state   <= saved_state;
        else
          st_ctrl      <= idle_st;
          return_state <= fetch_state;
          next_state   <= indirect_state;
        end if;

      --
      -- load md with high byte of indirect address
      -- pointed to by ea
      -- increment ea
      --
      when indirect_state =>
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        pc_ctrl      <= latch_pc;
        -- increment ea
        left_ctrl    <= ea_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        ea_ctrl      <= load_ea;
        -- fetch high byte
        md_ctrl      <= fetch_first_md;
        addr_ctrl    <= read_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= indirect2_state;
      --
      -- load md with low byte of indirect address
      -- pointed to by ea
      -- ea has previously been incremented
      --
      when indirect2_state =>
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        pc_ctrl      <= latch_pc;
        -- idle ea
        left_ctrl    <= ea_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        ea_ctrl      <= latch_ea;
        -- fetch high byte
        md_ctrl      <= fetch_next_md;
        addr_ctrl    <= read_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= indirect3_state;
      --
      -- complete idirect addressing
      -- by loading ea with md
      --
      when indirect3_state =>
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        pc_ctrl      <= latch_pc;
        -- load ea with md
        left_ctrl    <= ea_left;
        right_ctrl   <= md_right;
        alu_ctrl     <= alu_ld16;
        ea_ctrl      <= load_ea;
        -- idle cycle
        md_ctrl      <= latch_md;
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
        -- return to previous state
        st_ctrl      <= pull_st;
        return_state <= fetch_state;
        next_state   <= saved_state;

      --
      -- ea holds the low byte of the absolute address
      -- Move ea low byte into ea high byte
      -- load new ea low byte to for absolute 16 bit address
      -- advance the program counter
      --
      when extended_state =>            -- fetch ea low byte
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
                                        -- increment pc
        left_ctrl    <= pc_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        cc_ctrl      <= latch_cc;
        pc_ctrl      <= incr_pc;
                                        -- fetch next effective address bytes
        ea_ctrl      <= fetch_next_ea;
        addr_ctrl    <= fetch_ad;
        dout_ctrl    <= md_lo_dout;
        -- return to previous state
        st_ctrl      <= pull_st;
        return_state <= fetch_state;
        next_state   <= saved_state;

      when lea_state =>                 -- here on load effective address
        op_ctrl    <= latch_op;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        iv_ctrl    <= latch_iv;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        md_ctrl    <= latch_md;
        ea_ctrl    <= latch_ea;
        pc_ctrl    <= latch_pc;
                                        -- load index register with effective address
        left_ctrl  <= pc_left;
        right_ctrl <= ea_right;
        alu_ctrl   <= alu_lea;
        case op_code(3 downto 0) is
          when "0000" =>                -- leax
            cc_ctrl <= load_cc;
            ix_ctrl <= load_ix;
            iy_ctrl <= latch_iy;
            up_ctrl <= latch_up;
            sp_ctrl <= latch_sp;
          when "0001" =>                -- leay
            cc_ctrl <= load_cc;
            ix_ctrl <= latch_ix;
            iy_ctrl <= load_iy;
            up_ctrl <= latch_up;
            sp_ctrl <= latch_sp;
          when "0010" =>                -- leas
            cc_ctrl <= latch_cc;
            ix_ctrl <= latch_ix;
            iy_ctrl <= latch_iy;
            up_ctrl <= latch_up;
            sp_ctrl <= load_sp;
          when "0011" =>                -- leau
            cc_ctrl <= latch_cc;
            ix_ctrl <= latch_ix;
            iy_ctrl <= latch_iy;
            up_ctrl <= load_up;
            sp_ctrl <= latch_sp;
          when others =>
            cc_ctrl <= latch_cc;
            ix_ctrl <= latch_ix;
            iy_ctrl <= latch_iy;
            up_ctrl <= latch_up;
            sp_ctrl <= latch_sp;
        end case;
                                        -- idle the bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

      --
      -- jump to subroutine
      -- sp=sp-1
      -- call push_return_lo_state to save pc
      -- return to jmp_state
      --
      when jsr_state =>
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        md_ctrl      <= latch_md;
        ea_ctrl      <= latch_ea;
        pc_ctrl      <= latch_pc;
                                        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= pc_lo_dout;
                                        -- call push_return_state
        st_ctrl      <= push_st;
        return_state <= jmp_state;
        next_state   <= push_return_lo_state;

      --
      -- Load pc with ea
      -- (JMP)
      --
      when jmp_state =>
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        md_ctrl      <= latch_md;
        ea_ctrl      <= latch_ea;
                                        -- load PC with effective address
        left_ctrl    <= pc_left;
        right_ctrl   <= ea_right;
        alu_ctrl     <= alu_ld16;
        pc_ctrl      <= load_pc;
                                        -- idle the bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

      --
      -- long branch or branch to subroutine
      -- pick up next md byte
      -- md_hi = md_lo
      -- md_lo = (pc)
      -- pc=pc+1
      -- if a lbsr push return address
      -- continue to sbranch_state
      -- to evaluate conditional branches
      --
      when lbranch_state =>
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        cc_ctrl    <= latch_cc;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        sp_ctrl    <= latch_sp;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
                                        --
        left_ctrl  <= pc_left;
        right_ctrl <= ea_right;
        alu_ctrl   <= alu_ld16;
        pc_ctrl    <= incr_pc;
                                        -- fetch the next byte into md_lo
        md_ctrl    <= fetch_next_md;
        addr_ctrl  <= fetch_ad;
        dout_ctrl  <= md_lo_dout;
                                        -- if lbsr - push return address
                                        -- then continue on to short branch
        if op_code = "00010111" then
          st_ctrl      <= push_st;
          return_state <= sbranch_state;
          next_state   <= push_return_lo_state;
        else
          st_ctrl      <= idle_st;
          return_state <= fetch_state;
          next_state   <= sbranch_state;
        end if;

      --
      -- here to execute conditional branch
      -- short conditional branch md = signed 8 bit offset
      -- long branch md = 16 bit offset
      --
      when sbranch_state =>
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        md_ctrl      <= latch_md;
                                              --
        left_ctrl    <= pc_left;
        right_ctrl   <= md_right;
        alu_ctrl     <= alu_add16;
                                              --
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                              --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;
        if op_code(7 downto 4) = "0010" then  -- conditional branch
          case op_code(3 downto 0) is
            when "0000" =>                    -- bra
              cond_true := (1 = 1);
            when "0001" =>                    -- brn
              cond_true := (1 = 0);
            when "0010" =>                    -- bhi
              cond_true := ((cc(CBIT) or cc(ZBIT)) = '0');
            when "0011" =>                    -- bls
              cond_true := ((cc(CBIT) or cc(ZBIT)) = '1');
            when "0100" =>                    -- bcc/bhs
              cond_true := (cc(CBIT) = '0');
            when "0101" =>                    -- bcs/blo
              cond_true := (cc(CBIT) = '1');
            when "0110" =>                    -- bne
              cond_true := (cc(ZBIT) = '0');
            when "0111" =>                    -- beq
              cond_true := (cc(ZBIT) = '1');
            when "1000" =>                    -- bvc
              cond_true := (cc(VBIT) = '0');
            when "1001" =>                    -- bvs
              cond_true := (cc(VBIT) = '1');
            when "1010" =>                    -- bpl
              cond_true := (cc(NBIT) = '0');
            when "1011" =>                    -- bmi
              cond_true := (cc(NBIT) = '1');
            when "1100" =>                    -- bge
              cond_true := ((cc(NBIT) xor cc(VBIT)) = '0');
            when "1101" =>                    -- blt
              cond_true := ((cc(NBIT) xor cc(VBIT)) = '1');
            when "1110" =>                    -- bgt
              cond_true := ((cc(ZBIT) or (cc(NBIT) xor cc(VBIT))) = '0');
            when "1111" =>                    -- ble
              cond_true := ((cc(ZBIT) or (cc(NBIT) xor cc(VBIT))) = '1');
            when others =>
              cond_true := (1 = 1);
          end case;
        else
          cond_true := (1 = 1);               -- lbra, lbsr, bsr
        end if;
        if cond_true then
          pc_ctrl <= load_pc;
        else
          pc_ctrl <= latch_pc;
        end if;

      --
      -- push return address onto the S stack
      --
      -- (sp) = pc_lo
      -- sp = sp - 1
      --
      when push_return_lo_state =>
        -- default
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
                                        -- decrement the sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        cc_ctrl      <= latch_cc;
        sp_ctrl      <= load_sp;
        -- write PC low
        pc_ctrl      <= latch_pc;
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= pc_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= push_return_hi_state;

      --
      -- push program counter hi byte onto the stack
      -- (sp) = pc_hi
      -- sp = sp
      -- return to originating state
      --
      when push_return_hi_state =>
        -- default
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
                                        -- idle the SP
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        cc_ctrl      <= latch_cc;
        sp_ctrl      <= latch_sp;
                                        -- write pc hi bytes
        pc_ctrl      <= latch_pc;
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= pc_hi_dout;
                                        --
        st_ctrl      <= pull_st;
        return_state <= fetch_state;
        next_state   <= saved_state;

      when pull_return_hi_state =>
        -- default
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
                                        -- increment the sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        cc_ctrl      <= latch_cc;
        sp_ctrl      <= load_sp;
        -- read pc hi
        pc_ctrl      <= pull_hi_pc;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= pc_hi_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pull_return_lo_state;

      when pull_return_lo_state =>
        -- default
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
                                        -- increment the SP
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        cc_ctrl      <= latch_cc;
        sp_ctrl      <= load_sp;
                                        -- read pc low
        pc_ctrl      <= pull_lo_pc;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= pc_lo_dout;
                                        --
        st_ctrl      <= pull_st;
        return_state <= fetch_state;
        next_state   <= saved_state;

      when andcc_state =>
        -- default
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        md_ctrl      <= latch_md;
                                        -- AND CC with md
        left_ctrl    <= md_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_andcc;
        cc_ctrl      <= load_cc;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= pull_st;
        return_state <= fetch_state;
        next_state   <= saved_state;

      when orcc_state =>
        -- default
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        md_ctrl      <= latch_md;
                                        -- OR CC with md
        left_ctrl    <= md_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_orcc;
        cc_ctrl      <= load_cc;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= pull_st;
        return_state <= fetch_state;
        next_state   <= saved_state;

      when tfr_state =>
        -- default
        iv_ctrl  <= latch_iv;
        op_ctrl  <= latch_op;
        pre_ctrl <= latch_pre;
        nmi_ctrl <= latch_nmi;
        ea_ctrl  <= latch_ea;
        md_ctrl  <= latch_md;
                                        -- select source register
        case md(7 downto 4) is
          when "0000" =>
            left_ctrl <= accd_left;
          when "0001" =>
            left_ctrl <= ix_left;
          when "0010" =>
            left_ctrl <= iy_left;
          when "0011" =>
            left_ctrl <= up_left;
          when "0100" =>
            left_ctrl <= sp_left;
          when "0101" =>
            left_ctrl <= pc_left;
          when "1000" =>
            left_ctrl <= acca_left;
          when "1001" =>
            left_ctrl <= accb_left;
          when "1010" =>
            left_ctrl <= cc_left;
          when "1011" =>
            left_ctrl <= dp_left;
          when others =>
            left_ctrl <= md_left;
        end case;
        right_ctrl <= zero_right;
        alu_ctrl   <= alu_tfr;
                                        -- select destination register
        case md(3 downto 0) is
          when "0000" =>                -- accd
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= load_hi_acca;
            accb_ctrl <= load_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "0001" =>                -- ix
            ix_ctrl   <= load_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "0010" =>                -- iy
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= load_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "0011" =>                -- up
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= load_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "0100" =>                -- sp
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= load_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "0101" =>                -- pc
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= load_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "1000" =>                -- acca
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= load_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "1001" =>                -- accb
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= load_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "1010" =>                -- cc
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= load_cc;
            dp_ctrl   <= latch_dp;
          when "1011" =>                --dp
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= load_dp;
          when others =>
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
        end case;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= pull_st;
        return_state <= fetch_state;
        next_state   <= saved_state;

      when exg_state =>
        -- default
        iv_ctrl  <= latch_iv;
        op_ctrl  <= latch_op;
        pre_ctrl <= latch_pre;
        nmi_ctrl <= latch_nmi;
        md_ctrl  <= latch_md;
                                        -- save destination register
        case md(3 downto 0) is
          when "0000" =>
            left_ctrl <= accd_left;
          when "0001" =>
            left_ctrl <= ix_left;
          when "0010" =>
            left_ctrl <= iy_left;
          when "0011" =>
            left_ctrl <= up_left;
          when "0100" =>
            left_ctrl <= sp_left;
          when "0101" =>
            left_ctrl <= pc_left;
          when "1000" =>
            left_ctrl <= acca_left;
          when "1001" =>
            left_ctrl <= accb_left;
          when "1010" =>
            left_ctrl <= cc_left;
          when "1011" =>
            left_ctrl <= dp_left;
          when others =>
            left_ctrl <= md_left;
        end case;
        right_ctrl <= zero_right;
        alu_ctrl   <= alu_tfr;
        ea_ctrl    <= load_ea;

        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        cc_ctrl      <= latch_cc;
        dp_ctrl      <= latch_dp;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        -- call tranfer microcode
        st_ctrl      <= push_st;
        return_state <= exg1_state;
        next_state   <= tfr_state;

      when exg1_state =>
        -- default
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        md_ctrl    <= latch_md;
                                        -- restore destination
        left_ctrl  <= ea_left;
        right_ctrl <= zero_right;
        alu_ctrl   <= alu_tfr;
                                        -- save as source register
        case md(7 downto 4) is
          when "0000" =>                -- accd
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= load_hi_acca;
            accb_ctrl <= load_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "0001" =>                -- ix
            ix_ctrl   <= load_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "0010" =>                -- iy
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= load_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "0011" =>                -- up
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= load_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "0100" =>                -- sp
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= load_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "0101" =>                -- pc
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= load_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "1000" =>                -- acca
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= load_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "1001" =>                -- accb
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= load_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
          when "1010" =>                -- cc
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= load_cc;
            dp_ctrl   <= latch_dp;
          when "1011" =>                --dp
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= load_dp;
          when others =>
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            ix_ctrl   <= latch_ix;
            iy_ctrl   <= latch_iy;
            up_ctrl   <= latch_up;
            sp_ctrl   <= latch_sp;
            pc_ctrl   <= latch_pc;
            acca_ctrl <= latch_acca;
            accb_ctrl <= latch_accb;
            cc_ctrl   <= latch_cc;
            dp_ctrl   <= latch_dp;
        end case;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

      when mul_state =>
        -- default
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
                                        -- move acca to md
        left_ctrl    <= acca_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_st16;
        cc_ctrl      <= latch_cc;
        md_ctrl      <= load_md;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= mulea_state;

      when mulea_state =>
        -- default
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        md_ctrl      <= latch_md;
                                        -- move accb to ea
        left_ctrl    <= accb_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_st16;
        cc_ctrl      <= latch_cc;
        ea_ctrl      <= load_ea;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= muld_state;

      when muld_state =>
        -- default
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        md_ctrl      <= latch_md;
                                        -- clear accd
        left_ctrl    <= acca_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_ld8;
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= load_hi_acca;
        accb_ctrl    <= load_accb;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= mul0_state;

      when mul0_state =>
        -- default
        ix_ctrl   <= latch_ix;
        iy_ctrl   <= latch_iy;
        up_ctrl   <= latch_up;
        sp_ctrl   <= latch_sp;
        pc_ctrl   <= latch_pc;
        iv_ctrl   <= latch_iv;
        dp_ctrl   <= latch_dp;
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        nmi_ctrl  <= latch_nmi;
        ea_ctrl   <= latch_ea;
                                        -- if bit 0 of ea set, add accd to md
        left_ctrl <= accd_left;
        if ea(0) = '1' then
          right_ctrl <= md_right;
        else
          right_ctrl <= zero_right;
        end if;
        alu_ctrl     <= alu_mul;
        cc_ctrl      <= load_cc;
        acca_ctrl    <= load_hi_acca;
        accb_ctrl    <= load_accb;
        md_ctrl      <= shiftl_md;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= mul1_state;

      when mul1_state =>
        -- default
        ix_ctrl   <= latch_ix;
        iy_ctrl   <= latch_iy;
        up_ctrl   <= latch_up;
        sp_ctrl   <= latch_sp;
        pc_ctrl   <= latch_pc;
        iv_ctrl   <= latch_iv;
        dp_ctrl   <= latch_dp;
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        nmi_ctrl  <= latch_nmi;
        ea_ctrl   <= latch_ea;
                                        -- if bit 1 of ea set, add accd to md
        left_ctrl <= accd_left;
        if ea(1) = '1' then
          right_ctrl <= md_right;
        else
          right_ctrl <= zero_right;
        end if;
        alu_ctrl     <= alu_mul;
        cc_ctrl      <= load_cc;
        acca_ctrl    <= load_hi_acca;
        accb_ctrl    <= load_accb;
        md_ctrl      <= shiftl_md;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= mul2_state;

      when mul2_state =>
        -- default
        ix_ctrl   <= latch_ix;
        iy_ctrl   <= latch_iy;
        up_ctrl   <= latch_up;
        sp_ctrl   <= latch_sp;
        pc_ctrl   <= latch_pc;
        iv_ctrl   <= latch_iv;
        dp_ctrl   <= latch_dp;
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        nmi_ctrl  <= latch_nmi;
        ea_ctrl   <= latch_ea;
                                        -- if bit 2 of ea set, add accd to md
        left_ctrl <= accd_left;
        if ea(2) = '1' then
          right_ctrl <= md_right;
        else
          right_ctrl <= zero_right;
        end if;
        alu_ctrl     <= alu_mul;
        cc_ctrl      <= load_cc;
        acca_ctrl    <= load_hi_acca;
        accb_ctrl    <= load_accb;
        md_ctrl      <= shiftl_md;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= mul3_state;

      when mul3_state =>
        -- default
        ix_ctrl   <= latch_ix;
        iy_ctrl   <= latch_iy;
        up_ctrl   <= latch_up;
        sp_ctrl   <= latch_sp;
        pc_ctrl   <= latch_pc;
        iv_ctrl   <= latch_iv;
        dp_ctrl   <= latch_dp;
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        nmi_ctrl  <= latch_nmi;
        ea_ctrl   <= latch_ea;
                                        -- if bit 3 of ea set, add accd to md
        left_ctrl <= accd_left;
        if ea(3) = '1' then
          right_ctrl <= md_right;
        else
          right_ctrl <= zero_right;
        end if;
        alu_ctrl     <= alu_mul;
        cc_ctrl      <= load_cc;
        acca_ctrl    <= load_hi_acca;
        accb_ctrl    <= load_accb;
        md_ctrl      <= shiftl_md;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= mul4_state;

      when mul4_state =>
        -- default
        ix_ctrl   <= latch_ix;
        iy_ctrl   <= latch_iy;
        up_ctrl   <= latch_up;
        sp_ctrl   <= latch_sp;
        pc_ctrl   <= latch_pc;
        iv_ctrl   <= latch_iv;
        dp_ctrl   <= latch_dp;
        op_ctrl   <= latch_op;
        nmi_ctrl  <= latch_nmi;
        pre_ctrl  <= latch_pre;
        ea_ctrl   <= latch_ea;
                                        -- if bit 4 of ea set, add accd to md
        left_ctrl <= accd_left;
        if ea(4) = '1' then
          right_ctrl <= md_right;
        else
          right_ctrl <= zero_right;
        end if;
        alu_ctrl     <= alu_mul;
        cc_ctrl      <= load_cc;
        acca_ctrl    <= load_hi_acca;
        accb_ctrl    <= load_accb;
        md_ctrl      <= shiftl_md;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= mul5_state;

      when mul5_state =>
        -- default
        ix_ctrl   <= latch_ix;
        iy_ctrl   <= latch_iy;
        up_ctrl   <= latch_up;
        sp_ctrl   <= latch_sp;
        pc_ctrl   <= latch_pc;
        iv_ctrl   <= latch_iv;
        dp_ctrl   <= latch_dp;
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        nmi_ctrl  <= latch_nmi;
        ea_ctrl   <= latch_ea;
                                        -- if bit 5 of ea set, add accd to md
        left_ctrl <= accd_left;
        if ea(5) = '1' then
          right_ctrl <= md_right;
        else
          right_ctrl <= zero_right;
        end if;
        alu_ctrl     <= alu_mul;
        cc_ctrl      <= load_cc;
        acca_ctrl    <= load_hi_acca;
        accb_ctrl    <= load_accb;
        md_ctrl      <= shiftl_md;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= mul6_state;

      when mul6_state =>
        -- default
        ix_ctrl   <= latch_ix;
        iy_ctrl   <= latch_iy;
        up_ctrl   <= latch_up;
        sp_ctrl   <= latch_sp;
        pc_ctrl   <= latch_pc;
        iv_ctrl   <= latch_iv;
        dp_ctrl   <= latch_dp;
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        nmi_ctrl  <= latch_nmi;
        ea_ctrl   <= latch_ea;
                                        -- if bit 6 of ea set, add accd to md
        left_ctrl <= accd_left;
        if ea(6) = '1' then
          right_ctrl <= md_right;
        else
          right_ctrl <= zero_right;
        end if;
        alu_ctrl     <= alu_mul;
        cc_ctrl      <= load_cc;
        acca_ctrl    <= load_hi_acca;
        accb_ctrl    <= load_accb;
        md_ctrl      <= shiftl_md;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= mul7_state;

      when mul7_state =>
        -- default
        ix_ctrl   <= latch_ix;
        iy_ctrl   <= latch_iy;
        up_ctrl   <= latch_up;
        sp_ctrl   <= latch_sp;
        pc_ctrl   <= latch_pc;
        iv_ctrl   <= latch_iv;
        dp_ctrl   <= latch_dp;
        op_ctrl   <= latch_op;
        pre_ctrl  <= latch_pre;
        nmi_ctrl  <= latch_nmi;
        ea_ctrl   <= latch_ea;
                                        -- if bit 7 of ea set, add accd to md
        left_ctrl <= accd_left;
        if ea(7) = '1' then
          right_ctrl <= md_right;
        else
          right_ctrl <= zero_right;
        end if;
        alu_ctrl     <= alu_mul;
        cc_ctrl      <= load_cc;
        acca_ctrl    <= load_hi_acca;
        accb_ctrl    <= load_accb;
        md_ctrl      <= shiftl_md;
                                        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
                                        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

        --
        -- Enter here on pushs
        -- ea holds post byte
        --
      when pshs_state =>
        -- default
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        dp_ctrl    <= latch_dp;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp if any registers to be pushed
        left_ctrl  <= sp_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(7 downto 0) = "00000000" then
          sp_ctrl <= latch_sp;
        else
          sp_ctrl <= load_sp;
        end if;
        -- write idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(7) = '1' then
          next_state <= pshs_pcl_state;
        elsif ea(6) = '1' then
          next_state <= pshs_upl_state;
        elsif ea(5) = '1' then
          next_state <= pshs_iyl_state;
        elsif ea(4) = '1' then
          next_state <= pshs_ixl_state;
        elsif ea(3) = '1' then
          next_state <= pshs_dp_state;
        elsif ea(2) = '1' then
          next_state <= pshs_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshs_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshs_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshs_pcl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        dp_ctrl      <= latch_dp;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write pc low
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= pc_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pshs_pch_state;

      when pshs_pch_state =>
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        dp_ctrl    <= latch_dp;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= sp_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(6 downto 0) = "0000000" then
          sp_ctrl <= latch_sp;
        else
          sp_ctrl <= load_sp;
        end if;
        -- write pc hi
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= pc_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(6) = '1' then
          next_state <= pshs_upl_state;
        elsif ea(5) = '1' then
          next_state <= pshs_iyl_state;
        elsif ea(4) = '1' then
          next_state <= pshs_ixl_state;
        elsif ea(3) = '1' then
          next_state <= pshs_dp_state;
        elsif ea(2) = '1' then
          next_state <= pshs_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshs_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshs_cc_state;
        else
          next_state <= fetch_state;
        end if;


      when pshs_upl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write pc low
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= up_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pshs_uph_state;

      when pshs_uph_state =>
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= sp_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(5 downto 0) = "000000" then
          sp_ctrl <= latch_sp;
        else
          sp_ctrl <= load_sp;
        end if;
        -- write pc hi
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= up_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(5) = '1' then
          next_state <= pshs_iyl_state;
        elsif ea(4) = '1' then
          next_state <= pshs_ixl_state;
        elsif ea(3) = '1' then
          next_state <= pshs_dp_state;
        elsif ea(2) = '1' then
          next_state <= pshs_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshs_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshs_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshs_iyl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write iy low
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= iy_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pshs_iyh_state;

      when pshs_iyh_state =>
        -- default registers
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= sp_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(4 downto 0) = "00000" then
          sp_ctrl <= latch_sp;
        else
          sp_ctrl <= load_sp;
        end if;
        -- write iy hi
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= iy_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(4) = '1' then
          next_state <= pshs_ixl_state;
        elsif ea(3) = '1' then
          next_state <= pshs_dp_state;
        elsif ea(2) = '1' then
          next_state <= pshs_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshs_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshs_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshs_ixl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write ix low
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= ix_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pshs_ixh_state;

      when pshs_ixh_state =>
        -- default registers
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= sp_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(3 downto 0) = "0000" then
          sp_ctrl <= latch_sp;
        else
          sp_ctrl <= load_sp;
        end if;
        -- write ix hi
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= ix_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(3) = '1' then
          next_state <= pshs_dp_state;
        elsif ea(2) = '1' then
          next_state <= pshs_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshs_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshs_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshs_dp_state =>
        -- default registers
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= sp_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(2 downto 0) = "000" then
          sp_ctrl <= latch_sp;
        else
          sp_ctrl <= load_sp;
        end if;
        -- write dp
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= dp_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(2) = '1' then
          next_state <= pshs_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshs_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshs_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshs_accb_state =>
        -- default registers
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= sp_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(1 downto 0) = "00" then
          sp_ctrl <= latch_sp;
        else
          sp_ctrl <= load_sp;
        end if;
        -- write accb
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= accb_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(1) = '1' then
          next_state <= pshs_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshs_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshs_acca_state =>
        -- default registers
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= sp_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(0) = '1' then
          sp_ctrl <= load_sp;
        else
          sp_ctrl <= latch_sp;
        end if;
        -- write acca
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= acca_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(0) = '1' then
          next_state <= pshs_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshs_cc_state =>
        -- default registers
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- idle sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_nop;
        sp_ctrl      <= latch_sp;
        -- write cc
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= cc_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

        --
        -- enter here on PULS
        -- ea hold register mask
        --
      when puls_state =>
        -- default registers
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- idle SP
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= latch_sp;
        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(0) = '1' then
          next_state <= puls_cc_state;
        elsif ea(1) = '1' then
          next_state <= puls_acca_state;
        elsif ea(2) = '1' then
          next_state <= puls_accb_state;
        elsif ea(3) = '1' then
          next_state <= puls_dp_state;
        elsif ea(4) = '1' then
          next_state <= puls_ixh_state;
        elsif ea(5) = '1' then
          next_state <= puls_iyh_state;
        elsif ea(6) = '1' then
          next_state <= puls_uph_state;
        elsif ea(7) = '1' then
          next_state <= puls_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when puls_cc_state =>
        -- default registers
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- Increment SP
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read cc
        cc_ctrl      <= pull_cc;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= cc_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(1) = '1' then
          next_state <= puls_acca_state;
        elsif ea(2) = '1' then
          next_state <= puls_accb_state;
        elsif ea(3) = '1' then
          next_state <= puls_dp_state;
        elsif ea(4) = '1' then
          next_state <= puls_ixh_state;
        elsif ea(5) = '1' then
          next_state <= puls_iyh_state;
        elsif ea(6) = '1' then
          next_state <= puls_uph_state;
        elsif ea(7) = '1' then
          next_state <= puls_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when puls_acca_state =>
        -- default registers
        cc_ctrl      <= latch_cc;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- Increment SP
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read acca
        acca_ctrl    <= pull_acca;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= acca_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(2) = '1' then
          next_state <= puls_accb_state;
        elsif ea(3) = '1' then
          next_state <= puls_dp_state;
        elsif ea(4) = '1' then
          next_state <= puls_ixh_state;
        elsif ea(5) = '1' then
          next_state <= puls_iyh_state;
        elsif ea(6) = '1' then
          next_state <= puls_uph_state;
        elsif ea(7) = '1' then
          next_state <= puls_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when puls_accb_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- Increment SP
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read accb
        accb_ctrl    <= pull_accb;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= accb_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(3) = '1' then
          next_state <= puls_dp_state;
        elsif ea(4) = '1' then
          next_state <= puls_ixh_state;
        elsif ea(5) = '1' then
          next_state <= puls_iyh_state;
        elsif ea(6) = '1' then
          next_state <= puls_uph_state;
        elsif ea(7) = '1' then
          next_state <= puls_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when puls_dp_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- idle sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read dp
        dp_ctrl      <= pull_dp;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= dp_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(4) = '1' then
          next_state <= puls_ixh_state;
        elsif ea(5) = '1' then
          next_state <= puls_iyh_state;
        elsif ea(6) = '1' then
          next_state <= puls_uph_state;
        elsif ea(7) = '1' then
          next_state <= puls_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when puls_ixh_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- pull ix hi
        ix_ctrl      <= pull_hi_ix;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= ix_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= puls_ixl_state;

      when puls_ixl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- idle sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read ix low
        ix_ctrl      <= pull_lo_ix;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= ix_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(5) = '1' then
          next_state <= puls_iyh_state;
        elsif ea(6) = '1' then
          next_state <= puls_uph_state;
        elsif ea(7) = '1' then
          next_state <= puls_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when puls_iyh_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- pull iy hi
        iy_ctrl      <= pull_hi_iy;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= iy_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= puls_iyl_state;

      when puls_iyl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read iy low
        iy_ctrl      <= pull_lo_iy;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= iy_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(6) = '1' then
          next_state <= puls_uph_state;
        elsif ea(7) = '1' then
          next_state <= puls_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when puls_uph_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- pull up hi
        up_ctrl      <= pull_hi_up;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= up_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= puls_upl_state;

      when puls_upl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read up low
        up_ctrl      <= pull_lo_up;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= up_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(7) = '1' then
          next_state <= puls_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when puls_pch_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- pull pc hi
        pc_ctrl      <= pull_hi_pc;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= pc_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= puls_pcl_state;

      when puls_pcl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read pc low
        pc_ctrl      <= pull_lo_pc;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= pc_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

        --
        -- Enter here on pshu
        -- ea holds post byte
        --
      when pshu_state =>
        -- default
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        sp_ctrl    <= latch_sp;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        dp_ctrl    <= latch_dp;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement up if any registers to be pushed
        left_ctrl  <= up_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(7 downto 0) = "00000000" then
          up_ctrl <= latch_up;
        else
          up_ctrl <= load_up;
        end if;
        -- write idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(7) = '1' then
          next_state <= pshu_pcl_state;
        elsif ea(6) = '1' then
          next_state <= pshu_spl_state;
        elsif ea(5) = '1' then
          next_state <= pshu_iyl_state;
        elsif ea(4) = '1' then
          next_state <= pshu_ixl_state;
        elsif ea(3) = '1' then
          next_state <= pshu_dp_state;
        elsif ea(2) = '1' then
          next_state <= pshu_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshu_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshu_cc_state;
        else
          next_state <= fetch_state;
        end if;
        --
        -- push PC onto U stack
        --
      when pshu_pcl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        up_ctrl      <= load_up;
        -- write pc low
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= pc_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pshu_pch_state;

      when pshu_pch_state =>
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        sp_ctrl    <= latch_sp;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement up
        left_ctrl  <= up_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(6 downto 0) = "0000000" then
          up_ctrl <= latch_up;
        else
          up_ctrl <= load_up;
        end if;
        -- write pc hi
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= pc_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(6) = '1' then
          next_state <= pshu_spl_state;
        elsif ea(5) = '1' then
          next_state <= pshu_iyl_state;
        elsif ea(4) = '1' then
          next_state <= pshu_ixl_state;
        elsif ea(3) = '1' then
          next_state <= pshu_dp_state;
        elsif ea(2) = '1' then
          next_state <= pshu_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshu_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshu_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshu_spl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        up_ctrl      <= load_up;
        -- write pc low
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= sp_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pshu_sph_state;

      when pshu_sph_state =>
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        sp_ctrl    <= latch_sp;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= up_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(5 downto 0) = "000000" then
          up_ctrl <= latch_up;
        else
          up_ctrl <= load_up;
        end if;
        -- write sp hi
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= sp_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(5) = '1' then
          next_state <= pshu_iyl_state;
        elsif ea(4) = '1' then
          next_state <= pshu_ixl_state;
        elsif ea(3) = '1' then
          next_state <= pshu_dp_state;
        elsif ea(2) = '1' then
          next_state <= pshu_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshu_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshu_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshu_iyl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        up_ctrl      <= load_up;
        -- write iy low
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= iy_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pshu_iyh_state;

      when pshu_iyh_state =>
        -- default registers
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        sp_ctrl    <= latch_sp;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= up_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(4 downto 0) = "00000" then
          up_ctrl <= latch_up;
        else
          up_ctrl <= load_up;
        end if;
        -- write iy hi
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= iy_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(4) = '1' then
          next_state <= pshu_ixl_state;
        elsif ea(3) = '1' then
          next_state <= pshu_dp_state;
        elsif ea(2) = '1' then
          next_state <= pshu_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshu_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshu_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshu_ixl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        up_ctrl      <= load_up;
        -- write ix low
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= ix_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pshu_ixh_state;

      when pshu_ixh_state =>
        -- default registers
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        sp_ctrl    <= latch_sp;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= up_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(3 downto 0) = "0000" then
          up_ctrl <= latch_up;
        else
          up_ctrl <= load_up;
        end if;
        -- write ix hi
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= ix_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(3) = '1' then
          next_state <= pshu_dp_state;
        elsif ea(2) = '1' then
          next_state <= pshu_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshu_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshu_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshu_dp_state =>
        -- default registers
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        sp_ctrl    <= latch_sp;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= up_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(2 downto 0) = "000" then
          up_ctrl <= latch_up;
        else
          up_ctrl <= load_up;
        end if;
        -- write accb
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= dp_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(2) = '1' then
          next_state <= pshu_accb_state;
        elsif ea(1) = '1' then
          next_state <= pshu_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshu_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshu_accb_state =>
        -- default registers
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        sp_ctrl    <= latch_sp;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement up
        left_ctrl  <= up_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(1 downto 0) = "00" then
          up_ctrl <= latch_up;
        else
          up_ctrl <= load_up;
        end if;
        -- write accb
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= accb_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(1) = '1' then
          next_state <= pshu_acca_state;
        elsif ea(0) = '1' then
          next_state <= pshu_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshu_acca_state =>
        -- default registers
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        sp_ctrl    <= latch_sp;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- decrement sp
        left_ctrl  <= up_left;
        right_ctrl <= one_right;
        alu_ctrl   <= alu_sub16;
        if ea(0) = '0' then
          up_ctrl <= latch_up;
        else
          up_ctrl <= load_up;
        end if;
        -- write acca
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= acca_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(0) = '1' then
          next_state <= pshu_cc_state;
        else
          next_state <= fetch_state;
        end if;

      when pshu_cc_state =>
        -- default registers
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- idle up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        cc_ctrl      <= latch_cc;
        alu_ctrl     <= alu_nop;
        up_ctrl      <= latch_up;
        -- write cc
        addr_ctrl    <= pushu_ad;
        dout_ctrl    <= cc_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

        --
        -- enter here on PULU
        -- ea hold register mask
        --
      when pulu_state =>
        -- default registers
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- idle UP
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= latch_up;
        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(0) = '1' then
          next_state <= pulu_cc_state;
        elsif ea(1) = '1' then
          next_state <= pulu_acca_state;
        elsif ea(2) = '1' then
          next_state <= pulu_accb_state;
        elsif ea(3) = '1' then
          next_state <= pulu_dp_state;
        elsif ea(4) = '1' then
          next_state <= pulu_ixh_state;
        elsif ea(5) = '1' then
          next_state <= pulu_iyh_state;
        elsif ea(6) = '1' then
          next_state <= pulu_sph_state;
        elsif ea(7) = '1' then
          next_state <= pulu_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when pulu_cc_state =>
        -- default registers
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- read cc
        cc_ctrl      <= pull_cc;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= cc_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(1) = '1' then
          next_state <= pulu_acca_state;
        elsif ea(2) = '1' then
          next_state <= pulu_accb_state;
        elsif ea(3) = '1' then
          next_state <= pulu_dp_state;
        elsif ea(4) = '1' then
          next_state <= pulu_ixh_state;
        elsif ea(5) = '1' then
          next_state <= pulu_iyh_state;
        elsif ea(6) = '1' then
          next_state <= pulu_sph_state;
        elsif ea(7) = '1' then
          next_state <= pulu_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when pulu_acca_state =>
        -- default registers
        cc_ctrl      <= latch_cc;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- read acca
        acca_ctrl    <= pull_acca;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= acca_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(2) = '1' then
          next_state <= pulu_accb_state;
        elsif ea(3) = '1' then
          next_state <= pulu_dp_state;
        elsif ea(4) = '1' then
          next_state <= pulu_ixh_state;
        elsif ea(5) = '1' then
          next_state <= pulu_iyh_state;
        elsif ea(6) = '1' then
          next_state <= pulu_sph_state;
        elsif ea(7) = '1' then
          next_state <= pulu_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when pulu_accb_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- read accb
        accb_ctrl    <= pull_accb;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= accb_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(3) = '1' then
          next_state <= pulu_dp_state;
        elsif ea(4) = '1' then
          next_state <= pulu_ixh_state;
        elsif ea(5) = '1' then
          next_state <= pulu_iyh_state;
        elsif ea(6) = '1' then
          next_state <= pulu_sph_state;
        elsif ea(7) = '1' then
          next_state <= pulu_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when pulu_dp_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- read dp
        dp_ctrl      <= pull_dp;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= dp_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(4) = '1' then
          next_state <= pulu_ixh_state;
        elsif ea(5) = '1' then
          next_state <= pulu_iyh_state;
        elsif ea(6) = '1' then
          next_state <= pulu_sph_state;
        elsif ea(7) = '1' then
          next_state <= pulu_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when pulu_ixh_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- pull ix hi
        ix_ctrl      <= pull_hi_ix;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= ix_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pulu_ixl_state;

      when pulu_ixl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- read ix low
        ix_ctrl      <= pull_lo_ix;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= ix_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(5) = '1' then
          next_state <= pulu_iyh_state;
        elsif ea(6) = '1' then
          next_state <= pulu_sph_state;
        elsif ea(7) = '1' then
          next_state <= pulu_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when pulu_iyh_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- pull iy hi
        iy_ctrl      <= pull_hi_iy;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= iy_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pulu_iyl_state;

      when pulu_iyl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- read iy low
        iy_ctrl      <= pull_lo_iy;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= iy_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(6) = '1' then
          next_state <= pulu_sph_state;
        elsif ea(7) = '1' then
          next_state <= pulu_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when pulu_sph_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- pull sp hi
        sp_ctrl      <= pull_hi_sp;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= up_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pulu_spl_state;

      when pulu_spl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- read sp low
        sp_ctrl      <= pull_lo_sp;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= up_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if ea(7) = '1' then
          next_state <= pulu_pch_state;
        else
          next_state <= fetch_state;
        end if;

      when pulu_pch_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- pull pc hi
        pc_ctrl      <= pull_hi_pc;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= pc_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= pulu_pcl_state;

      when pulu_pcl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        sp_ctrl      <= latch_sp;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment up
        left_ctrl    <= up_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        up_ctrl      <= load_up;
        -- read pc low
        pc_ctrl      <= pull_lo_pc;
        addr_ctrl    <= pullu_ad;
        dout_ctrl    <= pc_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

        --
        -- pop the Condition codes
        --
      when rti_cc_state =>
        -- default registers
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read cc
        cc_ctrl      <= pull_cc;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= cc_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= rti_entire_state;

        --
        -- Added RTI cycle 11th July 2006 John Kent.
        -- test the "Entire" Flag
        -- that has just been popped off the stack
        --
      when rti_entire_state =>
        -- default registers
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- idle sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_nop;
        sp_ctrl      <= latch_sp;
        -- idle cc
        cc_ctrl      <= latch_cc;
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= cc_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        --
        -- The Entire flag must be recovered from the stack
        -- before testing.
        --
        if cc(EBIT) = '1' then
          next_state <= rti_acca_state;
        else
          next_state <= rti_pch_state;
        end if;

      when rti_acca_state =>
        -- default registers
        cc_ctrl      <= latch_cc;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read acca
        acca_ctrl    <= pull_acca;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= acca_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= rti_accb_state;

      when rti_accb_state =>
        -- default registers
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read accb
        accb_ctrl    <= pull_accb;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= accb_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= rti_dp_state;

      when rti_dp_state =>
        -- default registers
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read dp
        dp_ctrl      <= pull_dp;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= dp_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= rti_ixh_state;

      when rti_ixh_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read ix hi
        ix_ctrl      <= pull_hi_ix;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= ix_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= rti_ixl_state;

      when rti_ixl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read ix low
        ix_ctrl      <= pull_lo_ix;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= ix_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= rti_iyh_state;

      when rti_iyh_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read iy hi
        iy_ctrl      <= pull_hi_iy;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= iy_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= rti_iyl_state;

      when rti_iyl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read iy low
        iy_ctrl      <= pull_lo_iy;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= iy_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= rti_uph_state;


      when rti_uph_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read up hi
        up_ctrl      <= pull_hi_up;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= up_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= rti_upl_state;

      when rti_upl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        iy_ctrl      <= latch_iy;
        ix_ctrl      <= latch_ix;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- read up low
        up_ctrl      <= pull_lo_up;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= up_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= rti_pch_state;

      when rti_pch_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- pull pc hi
        pc_ctrl      <= pull_hi_pc;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= pc_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= rti_pcl_state;

      when rti_pcl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- increment sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_add16;
        sp_ctrl      <= load_sp;
        -- pull pc low
        pc_ctrl      <= pull_lo_pc;
        addr_ctrl    <= pulls_ad;
        dout_ctrl    <= pc_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= fetch_state;

        --
        -- here on IRQ, NMI or FIRQ interrupt
        -- pre decrement the sp
        --
      when int_decr_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= pc_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_entire_state;

      --
      -- set Entire Flag on SWI, SWI2, SWI3 and CWAI, IRQ and NMI
      -- clear Entire Flag on FIRQ
      -- before stacking all registers
      --
      when int_entire_state =>
        -- default
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        sp_ctrl    <= latch_sp;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        --
        left_ctrl  <= sp_left;
        right_ctrl <= zero_right;
        if iv = FIRQ_VEC then
          -- clear entire flag
          alu_ctrl <= alu_cle;
        else
          -- set entire flag
          alu_ctrl <= alu_see;
        end if;
        cc_ctrl      <= load_cc;
        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= pc_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_pcl_state;

      when int_pcl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write pc low
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= pc_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_pch_state;

      when int_pch_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write pc hi
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= pc_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        if cc(EBIT) = '1' then
          next_state <= int_upl_state;
        else
          next_state <= int_cc_state;
        end if;

      when int_upl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write up low
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= up_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_uph_state;

      when int_uph_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write ix hi
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= up_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_iyl_state;

      when int_iyl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write ix low
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= iy_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_iyh_state;

      when int_iyh_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write ix hi
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= iy_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_ixl_state;

      when int_ixl_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write ix low
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= ix_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_ixh_state;

      when int_ixh_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write ix hi
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= ix_hi_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_dp_state;

      when int_dp_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write accb
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= dp_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_accb_state;

      when int_accb_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write accb
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= accb_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_acca_state;

      when int_acca_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- decrement sp
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_sub16;
        sp_ctrl      <= load_sp;
        -- write acca
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= acca_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= int_cc_state;

      when int_cc_state =>
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        iv_ctrl      <= latch_iv;
        ea_ctrl      <= latch_ea;
        -- idle sp
        left_ctrl    <= sp_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        sp_ctrl      <= latch_sp;
        -- write cc
        addr_ctrl    <= pushs_ad;
        dout_ctrl    <= cc_dout;
        nmi_ctrl     <= latch_nmi;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        case iv is
          when NMI_VEC =>
            next_state <= int_mask_state;
          when SWI_VEC =>
            next_state <= int_mask_state;
          when IRQ_VEC =>
            next_state <= int_mask_state;
          when SWI2_VEC =>
            next_state <= vect_hi_state;
          when FIRQ_VEC =>
            next_state <= int_mask_state;
          when SWI3_VEC =>
            next_state <= vect_hi_state;
          when others =>
            if op_code = "00111100" then   -- CWAI
              next_state <= int_cwai_state;
            else
              next_state <= rti_cc_state;  -- spurious interrupt, do a RTI
            end if;
        end case;

        --
        -- wait here for an inteerupt
        --
      when int_cwai_state =>
        -- default
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        ea_ctrl      <= latch_ea;
        --
        left_ctrl    <= sp_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_nop;
        cc_ctrl      <= latch_cc;
        sp_ctrl      <= latch_sp;
        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= cc_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        --
        if (nmi_req = '1') and (nmi_ack = '0') then
          iv_ctrl    <= nmi_iv;
          nmi_ctrl   <= set_nmi;
          next_state <= vect_hi_state;
        else
          --
          -- nmi request is not cleared until nmi input goes low
          --
          if (nmi_req = '0') and (nmi_ack = '1') then
            nmi_ctrl <= reset_nmi;
          else
            nmi_ctrl <= latch_nmi;
          end if;
                                        --
                                        -- IRQ is level sensitive
                                        --
          if (irq = '1') and (cc(IBIT) = '0') then
            iv_ctrl    <= irq_iv;
            next_state <= int_mask_state;
          elsif (firq = '1') and (cc(FBIT) = '0') then
                                        --
                                        -- FIRQ is level sensitive
                                        --
            iv_ctrl    <= firq_iv;
            next_state <= int_mask_state;
          else
            iv_ctrl    <= latch_iv;
            next_state <= int_cwai_state;
          end if;
        end if;

      when int_mask_state =>
        -- default
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- Mask IRQ and FIRQ
        left_ctrl  <= sp_left;
        right_ctrl <= zero_right;
        --
        -- FIRQ can interrupt an IRQ service routine
        --
        if iv = IRQ_VEC then
          alu_ctrl <= alu_sei;
        else
          alu_ctrl <= alu_seif;
        end if;
        cc_ctrl      <= load_cc;
        sp_ctrl      <= latch_sp;
        -- idle bus cycle
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= vect_hi_state;

      --
      -- According to the 6809 programming manual:
      -- If an interrupt is received and is masked
      -- or lasts for less than three cycles, the PC
      -- will advance to the next instruction.
      -- If an interrupt is unmasked and lasts
      -- for more than three cycles, an interrupt
      -- will be generated.
      -- Note that I don't wait 3 clock cycles.
      -- John Kent 11th July 2006
      --
      when sync_state =>
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        ea_ctrl      <= latch_ea;
        --
        left_ctrl    <= pc_left;
        right_ctrl   <= one_right;
        alu_ctrl     <= alu_nop;
        -- idle bus
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= cc_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        --
        if (nmi_req = '1') and (nmi_ack = '0') then
          iv_ctrl    <= nmi_iv;
          nmi_ctrl   <= set_nmi;
          next_state <= int_decr_state;
        else
          --
          -- nmi request is not cleared until nmi input goes low
                              --
          if (nmi_req = '0') and (nmi_ack = '1') then
            nmi_ctrl <= reset_nmi;
          else
            nmi_ctrl <= latch_nmi;
          end if;
          --
          -- IRQ is level sensitive
          --
          if (irq = '1') then
            iv_ctrl <= irq_iv;
            if (cc(IBIT) = '0') then
              next_state <= int_decr_state;
            else
              next_state <= fetch_state;
            end if;
          elsif (firq = '1') then
            --
            -- FIRQ is level sensitive
            --
            iv_ctrl <= firq_iv;
            if (cc(FBIT) = '0') then
              next_state <= int_decr_state;
            else
              next_state <= fetch_state;
            end if;
          else
            iv_ctrl    <= latch_iv;
            next_state <= sync_state;
          end if;
        end if;


      when halt_state =>
        -- default
        cc_ctrl    <= latch_cc;
        acca_ctrl  <= latch_acca;
        accb_ctrl  <= latch_accb;
        dp_ctrl    <= latch_dp;
        ix_ctrl    <= latch_ix;
        iy_ctrl    <= latch_iy;
        up_ctrl    <= latch_up;
        pc_ctrl    <= latch_pc;
        md_ctrl    <= latch_md;
        iv_ctrl    <= latch_iv;
        op_ctrl    <= latch_op;
        pre_ctrl   <= latch_pre;
        nmi_ctrl   <= latch_nmi;
        ea_ctrl    <= latch_ea;
        -- idle ALU
        left_ctrl  <= acca_left;
        right_ctrl <= zero_right;
        alu_ctrl   <= alu_nop;
        sp_ctrl    <= latch_sp;
        -- idle bus cycle
        addr_ctrl  <= idle_ad;
        dout_ctrl  <= md_lo_dout;
        --
        if halt = '1' then   -- there was a bug there : if halt <= '1'
          st_ctrl      <= idle_st;
          return_state <= fetch_state;
          next_state   <= halt_state;
        else
          st_ctrl      <= pull_st;
          return_state <= fetch_state;
          next_state   <= saved_state;
        end if;

      when others =>                    -- halt on undefine states
        -- default
        cc_ctrl      <= latch_cc;
        acca_ctrl    <= latch_acca;
        accb_ctrl    <= latch_accb;
        dp_ctrl      <= latch_dp;
        ix_ctrl      <= latch_ix;
        iy_ctrl      <= latch_iy;
        up_ctrl      <= latch_up;
        sp_ctrl      <= latch_sp;
        pc_ctrl      <= latch_pc;
        md_ctrl      <= latch_md;
        iv_ctrl      <= latch_iv;
        op_ctrl      <= latch_op;
        pre_ctrl     <= latch_pre;
        nmi_ctrl     <= latch_nmi;
        ea_ctrl      <= latch_ea;
        -- do nothing in ALU
        left_ctrl    <= acca_left;
        right_ctrl   <= zero_right;
        alu_ctrl     <= alu_nop;
        -- idle bus cycle
        addr_ctrl    <= idle_ad;
        dout_ctrl    <= md_lo_dout;
        --
        st_ctrl      <= idle_st;
        return_state <= fetch_state;
        next_state   <= error_state;
    end case;
  end process;

end CPU_ARCH;

