----------------------------------------------------------------------------------------------------
-- Copyright (c) 2019 Marcus Geelnard
--
-- This software is provided 'as-is', without any express or implied warranty. In no event will the
-- authors be held liable for any damages arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose, including commercial
-- applications, and to alter it and redistribute it freely, subject to the following restrictions:
--
--  1. The origin of this software must not be misrepresented; you must not claim that you wrote
--     the original software. If you use this software in a product, an acknowledgment in the
--     product documentation would be appreciated but is not required.
--
--  2. Altered source versions must be plainly marked as such, and must not be misrepresented as
--     being the original software.
--
--  3. This notice may not be removed or altered from any source distribution.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------------------------------------------------------------
-- Video control program processor.
--
-- The VCPP is a high-performance program execution pipeline:
--
--   PC -> IF1 -> IF2 -> EX -> WR
--
-- PC:
--   Calculate the next PC (instruction read address).
--
-- IF1:
--   Request a memory read from the PC address.
--
-- IF2:
--   Fetch the instruction word (may stall).
--
-- EX:
--   Decode instruction.
--   Execute WAIT & JUMP instructions.
--   Prepare SET operations.
--
-- WR:
--   Execute the SET operation.
--
-- The program is restarted on a fixed memory address every time i_restart_frame goes high.
----------------------------------------------------------------------------------------------------

entity vid_vcpp is
  generic(
    X_COORD_BITS : positive;
    Y_COORD_BITS : positive;
    VCP_START_ADDRESS : std_logic_vector(23 downto 0)
  );
  port(
    i_rst : in std_logic;
    i_clk : in std_logic;

    i_restart_frame : in std_logic;
    i_raster_x : in std_logic_vector(X_COORD_BITS-1 downto 0);
    i_raster_y : in std_logic_vector(Y_COORD_BITS-1 downto 0);

    o_mem_read_en : out std_logic;
    o_mem_read_addr : out std_logic_vector(23 downto 0);
    i_mem_data : in std_logic_vector(31 downto 0);
    i_mem_ack : in std_logic;

    o_reg_write_enable : out std_logic;
    o_pal_write_enable : out std_logic;
    o_write_addr : out std_logic_vector(7 downto 0);
    o_write_data : out std_logic_vector(31 downto 0)
  );
end vid_vcpp;

architecture rtl of vid_vcpp is
  constant C_ADDR_BITS : positive := 24;
  subtype T_ADDR is std_logic_vector(C_ADDR_BITS-1 downto 0);

  subtype T_INSTR is std_logic_vector(3 downto 0);
  constant C_INSTR_JMP    : T_INSTR := 4x"0";
  constant C_INSTR_JSR    : T_INSTR := 4x"1";
  constant C_INSTR_RTS    : T_INSTR := 4x"2";
  constant C_INSTR_NOP    : T_INSTR := 4x"3";
  constant C_INSTR_WAITX  : T_INSTR := 4x"4";
  constant C_INSTR_WAITY  : T_INSTR := 4x"5";
  constant C_INSTR_SETPAL : T_INSTR := 4x"6";
  constant C_INSTR_SETREG : T_INSTR := 4x"8";

  type T_DECODE_STATE is (
    NEW_INSTR,
    PALETTE,
    WAITX,
    WAITY
  );

  -- Control logic.
  signal s_cancel : std_logic;
  signal s_retry_mem_request : std_logic;
  signal s_retry_mem_adr : T_ADDR;

  -- Signals relating to the PC stage.
  signal s_stall_pc : std_logic;
  signal s_pc_read_adr : T_ADDR;

  -- Signals relating to the IF1 stage.
  signal s_mem_read_addr : T_ADDR;
  signal s_mem_read_en : std_logic;
  signal s_if1_read_adr : T_ADDR;
  signal s_if1_read_en : std_logic;

  -- Signals relating to the IF2 stage.
  signal s_if2_cached_data : std_logic_vector(31 downto 0);
  signal s_if2_cached_data_ready : std_logic;
  signal s_if2_data : std_logic_vector(31 downto 0);
  signal s_if2_mem_data_ready : std_logic;
  signal s_if2_data_ready : std_logic;
  signal s_if2_pc_plus_1 : T_ADDR;

  -- Stack signals.
  signal s_return_addr_from_stack : T_ADDR;

  -- Asynchronous EX stage signals.
  signal s_instr : T_INSTR;
  signal s_is_new_instr : std_logic;
  signal s_is_jmp_instr : std_logic;
  signal s_is_jsr_instr : std_logic;
  signal s_is_rts_instr : std_logic;
  signal s_is_waitx_instr : std_logic;
  signal s_is_waity_instr : std_logic;
  signal s_is_setpal_instr : std_logic;
  signal s_is_setreg_instr : std_logic;

  signal s_ex_is_waiting : std_logic;
  signal s_ex_do_jump : std_logic;
  signal s_ex_jump_target : T_ADDR;
  signal s_ex_do_stack_push : std_logic;
  signal s_ex_do_stack_pop : std_logic;
  signal s_ex_stack_push_adr : T_ADDR;

  -- Synchronous EX stage signals.
  signal s_ex_expect_new_instr : std_logic;
  signal s_ex_state : T_DECODE_STATE;
  signal s_ex_instr_arg : std_logic_vector(15 downto 0);
  signal s_ex_palette_cnt : unsigned(7 downto 0);
  signal s_ex_reg_write_enable : std_logic;
  signal s_ex_pal_write_enable : std_logic;
  signal s_ex_write_addr : std_logic_vector(7 downto 0);
  signal s_ex_write_data : std_logic_vector(31 downto 0);

  function xcoord_to_signed16(x: std_logic_vector) return std_logic_vector is
    variable v_result : std_logic_vector(15 downto 0);
  begin
    v_result(15 downto X_COORD_BITS) := (others => x(X_COORD_BITS-1));
    v_result(X_COORD_BITS-1 downto 0) := x;
    return v_result;
  end;

  function ycoord_to_signed16(y: std_logic_vector) return std_logic_vector is
    variable v_result : std_logic_vector(15 downto 0);
  begin
    v_result(15 downto Y_COORD_BITS) := (others => y(Y_COORD_BITS-1));
    v_result(Y_COORD_BITS-1 downto 0) := y;
    return v_result;
  end;
begin
  -----------------------------------------------------------------------------
  -- Control logic.
  -----------------------------------------------------------------------------

  -- Cancel IF1/IF2?
  s_cancel <= i_restart_frame or s_ex_do_jump;


  -----------------------------------------------------------------------------
  -- PC
  -----------------------------------------------------------------------------

  s_stall_pc <= s_retry_mem_request or s_ex_is_waiting;

  process(i_clk, i_rst)
    variable v_read_adr : std_logic_vector(C_ADDR_BITS-1 downto 0);
  begin
    if i_rst = '1' then
      s_pc_read_adr <= VCP_START_ADDRESS;
    elsif rising_edge(i_clk) then
      if i_restart_frame = '1' then
        s_pc_read_adr <= VCP_START_ADDRESS;
      elsif s_stall_pc = '0' then
        if s_ex_do_jump = '1' then
          s_pc_read_adr <= s_ex_jump_target;
        else
          s_pc_read_adr <= std_logic_vector(unsigned(s_pc_read_adr) + 1);
        end if;
      end if;
    end if;
  end process;


  -----------------------------------------------------------------------------
  -- IF1
  -----------------------------------------------------------------------------

  -- Define the memory read operation.
  s_mem_read_addr <= s_retry_mem_adr when s_retry_mem_request = '1' else
                     s_pc_read_adr;
  s_mem_read_en <= (s_retry_mem_request or not s_ex_is_waiting) and not s_cancel;

  o_mem_read_addr <= s_mem_read_addr;
  o_mem_read_en <= s_mem_read_en;

  process(i_clk, i_rst)
  begin
    if i_rst = '1' then
      s_if1_read_adr <= (others => '0');
      s_if1_read_en <= '0';
    elsif rising_edge(i_clk) then
      -- TODO(m): Figure this out!
      if s_ex_is_waiting = '0' then
        s_if1_read_adr <= s_mem_read_addr;
      end if;
      s_if1_read_en <= s_mem_read_en;
    end if;
  end process;


  -----------------------------------------------------------------------------
  -- IF2
  -----------------------------------------------------------------------------

  -- Are we missing a response from the memory system during this clock cycle?
  s_retry_mem_request <= s_if1_read_en and
                         (not i_mem_ack) and
                         (not s_if2_cached_data_ready) and
                         (not s_cancel);
  s_retry_mem_adr <= s_if1_read_adr;

  process(i_clk, i_rst)
  begin
    if i_rst = '1' then
      s_if2_cached_data <= (others => '0');
      s_if2_cached_data_ready <= '0';
      s_if2_data <= (others => '0');
      s_if2_mem_data_ready <= '0';
      s_if2_pc_plus_1 <= (others => '0');
    elsif rising_edge(i_clk) then
      if s_cancel = '1' then
        s_if2_cached_data_ready <= '0';
        s_if2_mem_data_ready <= '0';
      else
        -- Update the word-cache. This is used for caching read requests during
        -- wait cycles.
        if s_ex_is_waiting = '0' then
          s_if2_cached_data_ready <= '0';
        elsif s_if1_read_en = '1' and i_mem_ack = '1' then
          s_if2_cached_data <= i_mem_data;
          s_if2_cached_data_ready <= '1';
        end if;

        -- Propagate read results to the EX stage.
        if i_mem_ack = '1' then
          s_if2_data <= i_mem_data;
        else
          s_if2_data <= s_if2_cached_data;
        end if;
        s_if2_mem_data_ready <= s_if1_read_en and i_mem_ack;
        s_if2_pc_plus_1 <= std_logic_vector(unsigned(s_if1_read_adr) + 1);
      end if;
    end if;
  end process;

  -- TODO(m): Prepare this signal synchronously instead of asynchronously.
  s_if2_data_ready <= s_if2_mem_data_ready or s_if2_cached_data_ready;


  -----------------------------------------------------------------------------
  -- EX
  -----------------------------------------------------------------------------

  -- Extract instruction opcode.
  s_instr <= s_if2_data(31 downto 28);
  s_is_new_instr <= s_ex_expect_new_instr and s_if2_data_ready;

  -- Should we jump?
  s_is_jmp_instr <= s_is_new_instr when s_instr = C_INSTR_JMP else '0';
  s_is_jsr_instr <= s_is_new_instr when s_instr = C_INSTR_JSR else '0';
  s_is_rts_instr <= s_is_new_instr when s_instr = C_INSTR_RTS else '0';
  s_ex_do_jump <= s_is_jmp_instr or s_is_jsr_instr or s_is_rts_instr;
  s_ex_jump_target <= s_return_addr_from_stack when s_instr = C_INSTR_RTS else
                      s_if2_data(23 downto 0);  -- C_INSTR_JMP | C_INSTR_JSR
  s_ex_do_stack_push <= s_is_jsr_instr;
  s_ex_do_stack_pop <= s_is_rts_instr;
  s_ex_stack_push_adr <= s_if2_pc_plus_1;

  -- Should we wait?
  s_is_waitx_instr <= s_is_new_instr when s_instr = C_INSTR_WAITX else '0';
  s_is_waity_instr <= s_is_new_instr when s_instr = C_INSTR_WAITY else '0';
  s_ex_is_waiting <= '1' when s_is_waitx_instr = '1' or
                              s_is_waity_instr = '1' or
                              s_ex_state = WAITX or
                              s_ex_state = WAITY
                      else '0';

  -- Should we set the palette?
  s_is_setpal_instr <= s_is_new_instr when s_instr = C_INSTR_SETPAL else '0';

  -- Should we set a VCR?
  s_is_setreg_instr <= s_is_new_instr when s_instr = C_INSTR_SETREG else '0';

  process(i_clk, i_rst)
    variable v_next_state : T_DECODE_STATE;
    variable v_pal_base_idx : unsigned(7 downto 0);
    variable v_pal_write_enable : std_logic;
    variable v_reg_write_enable : std_logic;
    variable v_write_addr : std_logic_vector(7 downto 0);
    variable v_write_data : std_logic_vector(31 downto 0);
  begin
    if i_rst = '1' then
      s_ex_expect_new_instr <= '1';
      s_ex_state <= NEW_INSTR;
      s_ex_instr_arg <= (others => '0');
      s_ex_palette_cnt <= (others => '0');
      s_ex_reg_write_enable <= '0';
      s_ex_pal_write_enable <= '0';
      s_ex_write_addr <= (others => '0');
      s_ex_write_data <= (others => '0');
    elsif rising_edge(i_clk) then
      v_next_state := s_ex_state;
      v_pal_write_enable := '0';
      v_reg_write_enable := '0';
      v_write_addr := x"00";
      v_write_data := x"00000000";

      if i_restart_frame = '1' then
        v_next_state := NEW_INSTR;
      elsif s_is_waitx_instr = '1' then
        -- New WAITX?
        v_next_state := WAITX;
        s_ex_instr_arg <= s_if2_data(15 downto 0);
      elsif s_ex_state = WAITX then
        -- Finished WAITX?
        if xcoord_to_signed16(i_raster_x) = s_ex_instr_arg then
          v_next_state := NEW_INSTR;
        end if;
      elsif s_is_waity_instr = '1' then
        -- New WAITY?
        v_next_state := WAITY;
        s_ex_instr_arg <= s_if2_data(15 downto 0);
      elsif s_ex_state = WAITY then
        -- Finished WAITY?
        if ycoord_to_signed16(i_raster_y) = s_ex_instr_arg then
          v_next_state := NEW_INSTR;
        end if;
      elsif s_is_setpal_instr = '1' then
        -- New SETPAL?
        v_next_state := PALETTE;
        s_ex_instr_arg <= s_if2_data(15 downto 0);
        s_ex_palette_cnt <= x"00";
      elsif s_ex_state = PALETTE then
        if s_if2_data_ready = '1' then
          if s_ex_palette_cnt = unsigned(s_ex_instr_arg(7 downto 0)) then
            v_next_state := NEW_INSTR;
          end if;
          v_pal_write_enable := '1';
          v_write_data := s_if2_data;
          v_pal_base_idx := unsigned(s_ex_instr_arg(15 downto 8));
          v_write_addr := std_logic_vector(v_pal_base_idx + s_ex_palette_cnt);
          s_ex_palette_cnt <= s_ex_palette_cnt + 1;
        end if;
      elsif s_is_setreg_instr = '1' then
        -- SETREG?
        v_reg_write_enable := '1';
        v_write_data := x"00" & s_if2_data(23 downto 0);
        v_write_addr := "0000" & s_if2_data(27 downto 24);
      end if;

      -- This is an optimization for the asynchronous instruction decoding
      -- logic: Only use a single bit to determine whether or not we're in
      -- the NEW_INSTR state.
      if v_next_state = NEW_INSTR then
        s_ex_expect_new_instr <= '1';
      else
        s_ex_expect_new_instr <= '0';
      end if;

      s_ex_state <= v_next_state;
      s_ex_reg_write_enable <= v_reg_write_enable;
      s_ex_pal_write_enable <= v_pal_write_enable;
      s_ex_write_addr <= v_write_addr;
      s_ex_write_data <= v_write_data;
    end if;
  end process;

  -- Instantiate the VCPP call stack.
  stack: entity work.vid_vcpp_stack
    port map(
      i_rst => i_rst,
      i_clk => i_clk,
      i_push => s_ex_do_stack_push,
      i_pop => s_ex_do_stack_pop,
      i_data => s_ex_stack_push_adr,
      o_data => s_return_addr_from_stack
    );


  -----------------------------------------------------------------------------
  -- WR - Write data to the video registers or the palette.
  -----------------------------------------------------------------------------

  -- Outputs.
  o_reg_write_enable <= s_ex_reg_write_enable;
  o_pal_write_enable <= s_ex_pal_write_enable;
  o_write_addr <= s_ex_write_addr;
  o_write_data <= s_ex_write_data;
end rtl;
