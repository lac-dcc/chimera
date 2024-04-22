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

library vunit_lib;
context vunit_lib.vunit_context;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vid_vcpp_tb is
  generic (runner_cfg : string);
end entity;

architecture tb of vid_vcpp_tb is
  signal s_rst : std_logic;
  signal s_clk : std_logic;
  signal s_restart_frame : std_logic;
  signal s_raster_x : std_logic_vector(3 downto 0);
  signal s_raster_y : std_logic_vector(3 downto 0);
  signal s_mem_read_en : std_logic;
  signal s_mem_read_addr : std_logic_vector(23 downto 0);
  signal s_mem_data : std_logic_vector(31 downto 0);
  signal s_mem_ack : std_logic;
  signal s_reg_write_enable : std_logic;
  signal s_pal_write_enable : std_logic;
  signal s_write_addr : std_logic_vector(7 downto 0);
  signal s_write_data : std_logic_vector(31 downto 0);
begin
  vid_vcpp_0: entity work.vid_vcpp
    generic map(
      X_COORD_BITS => s_raster_x'length,
      Y_COORD_BITS => s_raster_y'length,
      VCP_START_ADDRESS => x"000000"
    )
    port map(
      i_rst => s_rst,
      i_clk => s_clk,
      i_restart_frame => s_restart_frame,
      i_raster_x =>s_raster_x,
      i_raster_y =>s_raster_y,
      o_mem_read_en => s_mem_read_en,
      o_mem_read_addr => s_mem_read_addr,
      i_mem_data => s_mem_data,
      i_mem_ack => s_mem_ack,
      o_reg_write_enable => s_reg_write_enable,
      o_pal_write_enable => s_pal_write_enable,
      o_write_addr => s_write_addr,
      o_write_data => s_write_data
    );

  main : process
    -- The VCPP program.
    type program_array is array (natural range <>) of std_logic_vector(31 downto 0);
    constant program : program_array := (
        X"30000000",  -- NOP
        X"80123456",  -- SETREG 0, 0x123456
        X"83f65432",  -- SETREG 3, 0xf65432
        X"50000003",  -- WAITY 3
        X"82999999",  -- SETREG 2, 0x999999
        X"50000005",  -- WAITY 5
        X"60000902",  -- SETPAL 9, 3
        X"12345678",  --   PAL #9:  0x12345678
        X"aabbccdd",  --   PAL #10: 0xaabbccdd
        X"77665544",  --   PAL #11: 0x77665544
        X"30000000",  -- NOP
        X"60000000",  -- SETPAL 0, 1
        X"baadbeef",  --   PAL #0:  0xbaadbeef
        X"30000000",  -- NOP
        X"10000013",  -- JSR 0x00000013
        X"8f444444",  -- SETREG 15, 0x444444
        X"10000015",  -- JSR 0x00000015
        X"85654321",  -- SETREG 5, 0x654321
        X"50007fff",  -- WAITY 32767 (end)
        X"81555555",  -- SETREG 1, 0x555555   (addr: 0x0013)
        X"20000000",  -- RTS
        X"60000400",  -- SETPAL 4, 1          (addr: 0x0015)
        X"deadcafe",  --   PAL #4:  0xdeadcafe
        X"20000000"   -- RTS
    );

    -- The patterns to apply.
    type pattern_type is record
      -- Inputs.
      restart_frame : std_logic;
      raster_x : std_logic_vector(3 downto 0);
      raster_y : std_logic_vector(3 downto 0);
      mem_ack : std_logic;

      -- Expected outputs.
      mem_read_en : std_logic;
      mem_read_addr : std_logic_vector(23 downto 0);
      reg_write_enable : std_logic;
      pal_write_enable : std_logic;
      write_addr : std_logic_vector(7 downto 0);
      write_data : std_logic_vector(31 downto 0);
    end record;
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array := (
        ( -- 2 ps
          '0', X"0", X"0", '0',
          '1', X"000000", '0', '0', X"00", X"00000000"
        ),
        ( -- 3 ps
          '1', X"0", X"0", '0',
          '0', X"000000", '0', '0', X"00", X"00000000"
        ),
        ( -- 4 ps
          '0', X"0", X"0", '0',
          '1', X"000000", '0', '0', X"00", X"00000000"
        ),
        ( -- 5 ps
          '0', X"0", X"0", '0',
          '1', X"000000", '0', '0', X"00", X"00000000"
        ),
        ( -- 6 ps
          '0', X"0", X"0", '1',
          '1', X"000001", '0', '0', X"00", X"00000000"
        ),
        ( -- 7 ps
          '0', X"0", X"0", '1',
          '1', X"000002", '0', '0', X"00", X"00000000"
        ),
        ( -- 8 ps
          '0', X"0", X"0", '1',
          '1', X"000003", '0', '0', X"00", X"00000000"
        ),
        ( -- 9 ps
          '0', X"0", X"0", '1',
          '1', X"000004", '1', '0', X"00", X"00123456"
        ),
        ( -- 10 ps
          '0', X"0", X"1", '1',
          '1', X"000005", '1', '0', X"03", X"00f65432"
        ),
        ( -- 11 ps
          '0', X"0", X"2", '0',
          '0', X"000006", '0', '0', X"00", X"00000000"
        ),
        ( -- 12 ps
          '0', X"0", X"2", '0',
          '0', X"000006", '0', '0', X"00", X"00000000"
        ),
        ( -- 13 ps
          '0', X"0", X"2", '0',
          '0', X"000006", '0', '0', X"00", X"00000000"
        ),
        ( -- 14 ps
          '0', X"0", X"3", '0',
          '0', X"000006", '0', '0', X"00", X"00000000"
        ),
        ( -- 15 ps
          '0', X"0", X"3", '0',
          '1', X"000006", '0', '0', X"00", X"00000000"
        ),
        ( -- 16 ps
          '0', X"0", X"4", '0',
          '1', X"000006", '1', '0', X"02", X"00999999"
        ),
        ( -- 17 ps
          '1', X"0", X"5", '0',
          '1', X"000007", '0', '0', X"00", X"00000000"
        ),
        ( -- 18 ps
          '0', X"0", X"5", '1',
          '1', X"000008", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"5", '1',
          '1', X"000009", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"5", '0',
          '1', X"000009", '0', '1', X"09", X"12345678"
        ),
        (
          '0', X"0", X"5", '1',
          '1', X"00000a", '0', '1', X"0a", X"aabbccdd"
        ),
        (
          '0', X"0", X"5", '1',
          '1', X"00000b", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"5", '1',
          '1', X"00000c", '0', '1', X"0b", X"77665544"
        ),
        (
          '0', X"0", X"5", '1',
          '1', X"00000d", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"5", '1',
          '1', X"00000e", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"0", '1',
          '1', X"00000f", '0', '1', X"00", X"baadbeef"
        ),
        (
          '0', X"0", X"0", '1',
          '1', X"000013", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"0", '1',
          '1', X"000014", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"0", '1',
          '1', X"000015", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"0", '1',
          '1', X"00000f", '1', '0', X"01", X"00555555"
        ),
        (
          '0', X"0", X"0", '1',
          '1', X"000010", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"0", '1',
          '1', X"000011", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"0", '1',
          '1', X"000015", '1', '0', X"0f", X"00444444"
        ),
        (
          '0', X"0", X"0", '1',
          '1', X"000016", '0', '0', X"00", X"00000000"
        ),
        (
          '1', X"0", X"0", '1',
          '1', X"000000", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"1", '1',
          '1', X"000001", '0', '0', X"00", X"00000000"
        ),
        (
          '0', X"0", X"1", '1',
          '1', X"000002", '0', '0', X"00", X"00000000"
        )
      );
    variable v_write_en : std_logic;
  begin
    test_runner_setup(runner, runner_cfg);

    -- Continue running even if we have failures (for easier debugging).
    set_stop_level(failure);

    -- Start by resetting the signals.
    s_rst <= '1';
    s_clk <= '0';
    s_restart_frame <= '0';
    s_raster_x <= (others => '0');
    s_raster_y <= (others => '0');
    s_mem_data <= (others => '1');
    s_mem_ack <= '0';

    wait for 0.5 ps;
    s_clk <= '1';
    wait for 0.5 ps;
    s_rst <= '0';
    s_clk <= '0';
    wait for 0.5 ps;
    s_clk <= '1';

    -- Test all the patterns in the pattern array.
    for i in patterns'range loop
      wait until s_clk = '1';

      --  Set the inputs.
      s_restart_frame <= patterns(i).restart_frame;
      s_raster_x <= patterns(i).raster_x;
      s_raster_y <= patterns(i).raster_y;
      s_mem_ack <= patterns(i).mem_ack;

      -- Read the memory.
      s_mem_data <= program(to_integer(unsigned(s_mem_read_addr))) when patterns(i).mem_ack = '1' else
                    X"ffffffff";

      -- Wait for the result to be produced.
      wait for 0.5 ps;

      --  Check the outputs.
      v_write_en := patterns(i).reg_write_enable or patterns(i).pal_write_enable;
      check(s_mem_read_en = patterns(i).mem_read_en, "mem_read_en is incorrect");
      check(patterns(i).mem_read_en = '0' or s_mem_read_addr = patterns(i).mem_read_addr, "mem_read_addr is incorrect");
      check(s_reg_write_enable = patterns(i).reg_write_enable, "reg_write_enable is incorrect");
      check(s_pal_write_enable = patterns(i).pal_write_enable, "pal_write_enable is incorrect");
      check(v_write_en = '0' or s_write_addr = patterns(i).write_addr, "write_addr is incorrect");
      check(v_write_en = '0' or s_write_data = patterns(i).write_data, "write_data is incorrect");

      -- Tick the clock.
      s_clk <= '0';
      wait for 0.5 ps;
      s_clk <= '1';
    end loop;

    test_runner_cleanup(runner);
  end process;
end architecture;