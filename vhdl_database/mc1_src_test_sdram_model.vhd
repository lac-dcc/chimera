----------------------------------------------------------------------------------------------------
-- Copyright (c) 2022 Marcus Geelnard
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
use ieee.math_real.all;

entity sdram_model is
  generic (
    ADDR_WIDTH : natural := 13;
    DATA_WIDTH : natural := 16;
    COL_WIDTH : natural := 9;
    ROW_WIDTH : natural := 13;
    BANK_WIDTH : natural := 2
  );
  port (
    i_rst : in std_logic;
    i_clk : in std_logic;

    i_a : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    i_ba : out std_logic_vector(BANK_WIDTH-1 downto 0);
    io_dq : inout std_logic_vector(DATA_WIDTH-1 downto 0);
    i_cke : out std_logic;
    i_cs_n : out std_logic;
    i_ras_n : out std_logic;
    i_cas_n : out std_logic;
    i_we_n : out std_logic;
    i_dqm : out std_logic_vector(DATA_WIDTH/8-1 downto 0)
  );
end sdram_model;

architecture behavioral of sdram_model is
  constant C_DQM_WIDTH : integer := DATA_WIDTH/8;

  type T_INT_ARRAY is array (positive range <>) of integer;

  -- Memory arrays.
  constant C_NUM_BANKS : integer := 2**BANK_WIDTH;
  constant C_NUM_ROWS : integer := 2**ROW_WIDTH;
  constant C_NUM_COLS : integer := 2**COL_WIDTH;

  type T_MEM_COLS is array (0 to C_NUM_COLS-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
  type T_MEM_ROWS is array (0 to C_NUM_ROWS-1) of T_MEM_COLS;
  type T_MEM_BANKS is array (0 to C_NUM_BANKS-1) of T_MEM_ROWS;

  -- SDRAM commands (CS_ & RAS_ & CAS_ & WE_).
  subtype T_CMD is std_logic_vector(3 downto 0);
  constant C_CMD_MRS : T_CMD := "0000";  -- MODE REGISTER SET
  constant C_CMD_REF : T_CMD := "0001";  -- AUTO REFRESH
  constant C_CMD_PRE : T_CMD := "0010";  -- PRECHARGE
  constant C_CMD_ACT : T_CMD := "0011";  -- ROW/BANK ACTIVE
  constant C_CMD_WR  : T_CMD := "0100";  -- WRITE BANK
  constant C_CMD_RD  : T_CMD := "0101";  -- READ BANK
  constant C_CMD_NOP : T_CMD := "0111";  -- NOP

  -- Mode register.
  type T_MODE_REG is record
    cas_latency : integer;
    burst_type : integer;
    burst_length : integer;
  end record T_MODE_REG;

  function decode_mode_reg(addr : unsigned) return T_MODE_REG is
    variable v_mode_reg : T_MODE_REG;
  begin
    v_mode_reg.cas_latency := to_integer(addr(6 downto 4));
    v_mode_reg.burst_type := to_integer(addr(3 downto 3));
    v_mode_reg.burst_length := 2**to_integer(addr(2 downto 0));
    return v_mode_reg;
  end function;

  -- Burst command queue.
  type T_BURST_CMD is (NONE, RD, WR);
  type T_BURST_QUEUE_ITEM is record
    cmd : T_BURST_CMD;
    bank : integer;
    row : integer;
    col : integer;
  end record T_BURST_QUEUE_ITEM;
  constant C_BURST_QUEUE_LEN : integer := 256;
  type T_BURST_QUEUE is array (0 to C_BURST_QUEUE_LEN-1) of T_BURST_QUEUE_ITEM;

  function decode_col(addr : std_logic_vector) return integer is
    variable v_col_addr : std_logic_vector(COL_WIDTH-1 downto 0);
  begin
    if COL_WIDTH <= 10 then
      v_col_addr := addr(COL_WIDTH-1 downto 0);
    else
      v_col_addr := addr(COL_WIDTH downto 11) & addr(9 downto 0);
    end if;
    return to_integer(unsigned(v_col_addr));
  end function;

  function combine_with_mask(dold : std_logic_vector; dnew : std_logic_vector; dqm : std_logic_vector) return std_logic_vector is
    variable v_result : std_logic_vector(DATA_WIDTH-1 downto 0);
    variable v_hi : integer;
    variable v_lo : integer;
  begin
    for i in 0 to C_DQM_WIDTH-1 loop
      v_lo := i*8;
      v_hi := v_lo + 7;
      -- Note: DQM is active low.
      if dqm(i) = '0' then
        v_result(v_hi downto v_lo) := dnew(v_hi downto v_lo);
      else
        v_result(v_hi downto v_lo) := dold(v_hi downto v_lo);
      end if;
    end loop;
    return v_result;
  end function;

  signal s_mode_reg : T_MODE_REG;
  signal s_row_of_bank : T_INT_ARRAY(0 to C_NUM_BANKS-1);
  signal s_burst_idx : integer;
begin
  -- Simple simulation of the behaviour of an SDRAM (just respond with some
  -- data for read requests).
  process(i_rst, i_clk)
    variable v_cmd : T_CMD;
    variable v_bank_no : integer;
    variable v_row_no : integer;
    variable v_col_no : integer;

    variable v_mem : T_MEM_BANKS;
    variable v_mem_data : std_logic_vector(DATA_WIDTH-1 downto 0);

    variable v_burst_queue : T_BURST_QUEUE;
    variable v_idx : integer;
  begin
    if i_rst = '1' then
      s_mode_reg <= (
          cas_latency => 2,
          burst_type => 0,
          burst_length => 2
        );
      s_row_of_bank <= (others => 0);

      -- Reset burst queue.
      for i in 0 to C_BURST_QUEUE_LEN-1 loop
        v_burst_queue(i).cmd := NONE;
        v_burst_queue(i).bank := 0;
        v_burst_queue(i).row := 0;
        v_burst_queue(i).col := 0;
      end loop;
      s_burst_idx <= 0;

      io_dq <= (others => 'Z');
    elsif rising_edge(i_clk) then
      -- Decode command.
      v_cmd := i_cs_n & i_ras_n & i_cas_n & i_we_n;
      v_bank_no := to_integer(unsigned(i_ba(BANK_WIDTH-1 downto 0)));

      if v_cmd = C_CMD_MRS then
        -- Set the mode register (configure burst mode etc).
        s_mode_reg <= decode_mode_reg(unsigned(i_a));
      elsif v_cmd = C_CMD_ACT then
        -- Activate the row of the given bank.
        s_row_of_bank(v_bank_no) <= to_integer(unsigned(i_a(ROW_WIDTH-1 downto 0)));
      elsif v_cmd = C_CMD_RD then
        -- Read burst from the given bank.
        v_row_no := s_row_of_bank(v_bank_no);
        v_col_no := decode_col(i_a);
        v_idx := (s_burst_idx + s_mode_reg.cas_latency) mod C_BURST_QUEUE_LEN;
        for i in 0 to s_mode_reg.burst_length-1 loop
          v_burst_queue(v_idx).cmd := RD;
          v_burst_queue(v_idx).bank := v_bank_no;
          v_burst_queue(v_idx).row := v_row_no;
          v_burst_queue(v_idx).col := v_col_no;
          v_col_no := v_col_no + 1;
          v_idx := (v_idx + 1) mod C_BURST_QUEUE_LEN;
        end loop;
      elsif v_cmd = C_CMD_WR then
        -- Write burst to the given bank.
        v_row_no := s_row_of_bank(v_bank_no);
        v_col_no := decode_col(i_a);
        v_idx := s_burst_idx;
        for i in 0 to s_mode_reg.burst_length-1 loop
          v_burst_queue(v_idx).cmd := WR;
          v_burst_queue(v_idx).bank := v_bank_no;
          v_burst_queue(v_idx).row := v_row_no;
          v_burst_queue(v_idx).col := v_col_no;
          v_col_no := v_col_no + 1;
          v_idx := (v_idx + 1) mod C_BURST_QUEUE_LEN;
        end loop;
      end if;

      -- Execute read/write commands from the burst queue.
      if v_burst_queue(s_burst_idx).cmd = RD then
        v_bank_no := v_burst_queue(s_burst_idx).bank;
        v_row_no := v_burst_queue(s_burst_idx).row;
        v_col_no := v_burst_queue(s_burst_idx).col;
        -- TODO(m): Honor i_dqm (output 'Z' if byte is inhibited by i_dqm).
        io_dq <= v_mem(v_bank_no)(v_row_no)(v_col_no);
      else
        if v_burst_queue(s_burst_idx).cmd = WR then
          v_bank_no := v_burst_queue(s_burst_idx).bank;
          v_row_no := v_burst_queue(s_burst_idx).row;
          v_col_no := v_burst_queue(s_burst_idx).col;

          -- Implement masked write (honor i_dqm).
          v_mem_data := v_mem(v_bank_no)(v_row_no)(v_col_no);
          v_mem_data := combine_with_mask(v_mem_data, io_dq, i_dqm);
          v_mem(v_bank_no)(v_row_no)(v_col_no) := v_mem_data;
        end if;
        io_dq <= (others => 'Z');
      end if;

      -- Clear last currently executed burst item in the queue, and advance the queue position.
      -- Because it's a circular buffer, this has the effect of popping the front of the queue
      -- and pushing an empty item at the end of the queue.
      v_burst_queue(s_burst_idx).cmd := NONE;
      s_burst_idx <= (s_burst_idx + 1) mod C_BURST_QUEUE_LEN;
    end if;
  end process;
end architecture behavioral;
