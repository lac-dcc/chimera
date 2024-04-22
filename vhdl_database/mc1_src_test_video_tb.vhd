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
library std;
use std.textio.all;
use work.vid_types.all;

entity video_tb is
  generic (runner_cfg : string);
end entity;

architecture tb of video_tb is
  constant C_ADR_BITS : positive := 16;
  constant C_VRAM_WORDS : positive := 2**C_ADR_BITS;

  -- (640 + hblank) x (480 + vblank) = 420000 cycles
  -- (800 + hblank) x (600 + vblank) = 663168 cycles
  -- (1280 + hblank) x (720 + vblank) = 1237500 cycles
  -- (1920 + hblank) x (1080 + vblank) = 2475000 cycles
  constant C_TEST_CYCLES : integer := 2475000;

  --  25.175 MHz -> 19.8609732 ns
  --  40.000 MHz -> 12.5 ns
  --  74.375 MHz -> 6.72268908 ns
  -- 148.500 MHz -> 3.36700337 ns
  constant C_CLK_HALF_PERIOD : time := 3.36700337 ns;

  signal s_write_clk : std_logic;
  signal s_write_cyc : std_logic;
  signal s_write_stb : std_logic;
  signal s_write_adr : std_logic_vector(C_ADR_BITS-1 downto 0);
  signal s_write_dat : std_logic_vector(31 downto 0);
  signal s_write_we : std_logic;

  signal s_rst : std_logic;
  signal s_clk : std_logic;
  signal s_read_adr : std_logic_vector(C_ADR_BITS-1 downto 0);
  signal s_read_dat : std_logic_vector(31 downto 0);
  signal s_r : std_logic_vector(3 downto 0);
  signal s_g : std_logic_vector(3 downto 0);
  signal s_b : std_logic_vector(3 downto 0);
  signal s_hsync : std_logic;
  signal s_vsync : std_logic;
begin
  video_0: entity work.video
    generic map(
      COLOR_BITS_R => s_r'length,
      COLOR_BITS_G => s_g'length,
      COLOR_BITS_B => s_b'length,
      ADR_BITS => s_read_adr'length,
      NUM_LAYERS => 2,
      VIDEO_CONFIG => C_1920_1080
    )
    port map(
      i_rst => s_rst,
      i_clk => s_clk,
      o_read_adr => s_read_adr,
      i_read_dat => s_read_dat,
      o_r => s_r,
      o_g => s_g,
      o_b => s_b,
      o_hsync => s_hsync,
      o_vsync => s_vsync
    );

  vram_1: entity work.vram
    generic map (
      ADR_BITS => s_read_adr'length
    )
    port map (
      i_rst => '0',

      -- CPU interface.
      i_wb_clk => s_write_clk,
      i_wb_cyc => s_write_cyc,
      i_wb_stb => s_write_stb,
      i_wb_adr => s_write_adr,
      i_wb_dat => s_write_dat,
      i_wb_we => s_write_we,
      i_wb_sel => "1111",

      -- Video interface.
      i_read_clk => s_clk,
      i_read_adr => s_read_adr,
      o_read_dat => s_read_dat
    );

  main : process
    -- File I/O.
    type T_CHAR_FILE is file of character;
    file f_char_file : T_CHAR_FILE;

      -- Helper function for reading one word from a binary file.
    function read_word(file f : T_CHAR_FILE) return std_logic_vector is
      variable v_char : character;
      variable v_byte : std_logic_vector(7 downto 0);
      variable v_word : std_logic_vector(31 downto 0);
    begin
      for i in 0 to 3 loop
        read(f, v_char);
        v_byte := std_logic_vector(to_unsigned(character'pos(v_char), 8));
        v_word(((i+1)*8)-1 downto i*8) := v_byte;
      end loop;
      return v_word;
    end function;

    -- Helper function for writing one word to a binary file.
    procedure write_word(file f : T_CHAR_FILE; word : std_logic_vector(31 downto 0)) is
      variable v_char : character;
      variable v_byte : std_logic_vector(7 downto 0);
    begin
      for i in 0 to 3 loop
        v_byte := word(((i+1)*8)-1 downto i*8);
        v_char := character'val(to_integer(unsigned(v_byte)));
        write(f, v_char);
      end loop;
    end procedure;

    -- Memory.
    variable v_mem_idx : integer;
    variable v_read_dat : std_logic_vector(31 downto 0);

    variable v_rgb_word : std_logic_vector(31 downto 0);
  begin
    test_runner_setup(runner, runner_cfg);

    -- Continue running even if we have failures (for easier debugging).
    set_stop_level(failure);

    -- Reset write signals.
    s_write_clk <= '0';
    s_write_cyc <= '0';
    s_write_stb <= '0';
    s_write_we <= '0';
    s_write_adr <= (others => '0');
    s_write_dat <= (others => '0');
    wait for 1 ps;

    -- Load data into VRAM.
    file_open(f_char_file, "vunit_out/video_tb_ram.bin");
    v_mem_idx := 4;
    while not endfile(f_char_file) loop
      s_write_clk <= '1';
      wait for 1 ps;

      -- Read one word from the data file and write it to VRAM.
      s_write_cyc <= '1';
      s_write_stb <= '1';
      s_write_we <= '1';
      s_write_adr <= std_logic_vector(to_unsigned(v_mem_idx, C_ADR_BITS));
      s_write_dat <= read_word(f_char_file);
      v_mem_idx := v_mem_idx + 1;

      -- Tick the write clock.
      s_write_clk <= '0';
      wait for 1 ps;
    end loop;
    file_close(f_char_file);

    -- Finish the write cycle.
    s_write_cyc <= '1';
    s_write_stb <= '0';
    s_write_we <= '0';
    s_write_clk <= '1';
    wait for 1 ps;
    s_write_clk <= '0';
    wait for 1 ps;
    s_write_cyc <= '1';
    s_write_clk <= '1';
    wait for 1 ps;
    s_write_clk <= '0';
    wait for 1 ps;

    -- Reset the video logic.
    s_rst <= '1';
    s_clk <= '0';
    wait for C_CLK_HALF_PERIOD;
    s_clk <= '1';
    wait for C_CLK_HALF_PERIOD;
    s_rst <= '0';
    s_clk <= '0';
    wait for C_CLK_HALF_PERIOD;

    -- Run a lot of cycles...
    file_open(f_char_file, "vunit_out/video_tb_output.data", WRITE_MODE);
    for i in 0 to C_TEST_CYCLES-1 loop
      -- Construct a word from the generated RGB output.
      -- We inject hsync and vsync into the color channels for visualization.
      v_rgb_word(31 downto 24) := 8x"ff";
      v_rgb_word(23 downto 16) := s_b & s_b(3 downto 0);
      if s_vsync = '1' then
        v_rgb_word(15 downto 8) := 8x"ff";
      else
        v_rgb_word(15 downto 8) := s_g & s_g(3 downto 0);
      end if;
      if s_hsync = '1' then
        v_rgb_word(7 downto 0) := 8x"ff";
      else
        v_rgb_word(7 downto 0) := s_r & s_r(3 downto 0);
      end if;

      -- Write the word to the output file.
      write_word(f_char_file, v_rgb_word);

      -- Tick the clock.
      s_clk <= '1';
      wait for C_CLK_HALF_PERIOD;
      s_clk <= '0';
      wait for C_CLK_HALF_PERIOD;
    end loop;
    file_close(f_char_file);

    test_runner_cleanup(runner);
  end process;
end architecture;
