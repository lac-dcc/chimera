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
use work.vid_types.all;

entity vid_raster is
  generic(
    VIDEO_CONFIG : T_VIDEO_CONFIG;

    X_COORD_BITS : positive := 12;  -- Number of bits required for representing an x coordinate.
    Y_COORD_BITS : positive := 11   -- Number of bits required for representing a y coordinate.
  );
  port(
    i_rst : in std_logic;
    i_clk : in std_logic;

    o_x_pos : out std_logic_vector(X_COORD_BITS-1 downto 0);
    o_y_pos : out std_logic_vector(Y_COORD_BITS-1 downto 0);

    o_hsync : out std_logic;
    o_vsync : out std_logic;
    o_restart_frame : out std_logic
  );
end vid_raster;

architecture rtl of vid_raster is
  constant C_WIDTH : positive := VIDEO_CONFIG.width;
  constant C_HEIGHT : positive := VIDEO_CONFIG.height;
  constant C_FRONT_PORCH_H : positive := VIDEO_CONFIG.front_porch_h;
  constant C_SYNC_WIDTH_H : positive := VIDEO_CONFIG.sync_width_h;
  constant C_BACK_PORCH_H : positive := VIDEO_CONFIG.back_porch_h;
  constant C_FRONT_PORCH_V : positive := VIDEO_CONFIG.front_porch_v;
  constant C_SYNC_WIDTH_V : positive := VIDEO_CONFIG.sync_width_v;
  constant C_BACK_PORCH_V : positive := VIDEO_CONFIG.back_porch_v;
  constant C_POLARITY_H : std_logic := VIDEO_CONFIG.polarity_h;
  constant C_POLARITY_V : std_logic := VIDEO_CONFIG.polarity_v;

  --  ----+------------+-----------------------+-------------+------------+----
  --  ... | Back porch |  Video                | Front porch | Sync pulse | ...
  --  ----+------------+-----------------------+-------------+------------+----

  constant C_X_START : integer := -(C_FRONT_PORCH_H + C_SYNC_WIDTH_H + C_BACK_PORCH_H);
  constant C_X_SYNC_START : integer := -(C_SYNC_WIDTH_H + C_BACK_PORCH_H);
  constant C_X_SYNC_END : integer := -C_BACK_PORCH_H;
  constant C_X_END : integer := C_WIDTH;

  constant C_Y_START : integer := -(C_FRONT_PORCH_V + C_SYNC_WIDTH_V + C_BACK_PORCH_V);
  constant C_Y_SYNC_START : integer := -(C_SYNC_WIDTH_V + C_BACK_PORCH_V);
  constant C_Y_SYNC_END : integer := -C_BACK_PORCH_V;
  constant C_Y_END : integer := C_HEIGHT;

  signal s_x_pos_plus_1 : signed(X_COORD_BITS-1 downto 0);
  signal s_y_pos_plus_1 : signed(Y_COORD_BITS-1 downto 0);
  signal s_next_restart_line : std_logic;
  signal s_next_restart_frame : std_logic;
  signal s_next_x_pos : signed(X_COORD_BITS-1 downto 0);
  signal s_next_y_pos : signed(Y_COORD_BITS-1 downto 0);
  signal s_next_hsync : std_logic;
  signal s_next_vsync : std_logic;

  signal s_x_pos : signed(X_COORD_BITS-1 downto 0);
  signal s_y_pos : signed(Y_COORD_BITS-1 downto 0);
  signal s_hsync : std_logic;
  signal s_vsync : std_logic;
  signal s_restart_frame : std_logic;
begin
  -- End of line and/or frame?
  s_next_restart_line <= '1' when s_x_pos = to_signed(C_X_END-1, X_COORD_BITS) else '0';
  s_next_restart_frame <= s_next_restart_line when s_y_pos = to_signed(C_Y_END-1, Y_COORD_BITS) else '0';

  -- Calculate the next x and y coordinates.
  s_x_pos_plus_1 <= s_x_pos + to_signed(1, X_COORD_BITS);
  s_y_pos_plus_1 <= s_y_pos + to_signed(1, Y_COORD_BITS);
  s_next_x_pos <= to_signed(C_X_START, X_COORD_BITS) when s_next_restart_line = '1' else s_x_pos_plus_1;
  s_next_y_pos <= to_signed(C_Y_START, Y_COORD_BITS) when s_next_restart_frame = '1' else
                  s_y_pos_plus_1 when s_next_restart_line = '1' else
                  s_y_pos;

  -- Are we within the horizontal and/or vertical sync periods?
  s_next_hsync <= C_POLARITY_H when s_x_pos >= to_signed(C_X_SYNC_START-1, X_COORD_BITS) and
                                    s_x_pos < to_signed(C_X_SYNC_END-1, X_COORD_BITS) else not C_POLARITY_H;
  s_next_vsync <= C_POLARITY_V when s_y_pos >= to_signed(C_Y_SYNC_START-1, Y_COORD_BITS) and
                                    s_y_pos < to_signed(C_Y_SYNC_END-1, Y_COORD_BITS) else not C_POLARITY_V;

  process(i_clk, i_rst)
  begin
    if i_rst = '1' then
      s_x_pos <= to_signed(C_X_START, X_COORD_BITS);
      s_y_pos <= to_signed(C_Y_START, Y_COORD_BITS);
      s_hsync <= not C_POLARITY_H;
      s_vsync <= not C_POLARITY_V;
      s_restart_frame <= '1';
    elsif rising_edge(i_clk) then
      s_x_pos <= s_next_x_pos;
      s_y_pos <= s_next_y_pos;
      s_hsync <= s_next_hsync;
      s_vsync <= s_next_vsync;
      s_restart_frame <= s_next_restart_frame;
    end if;
  end process;

  -- Outputs.
  o_x_pos <= std_logic_vector(s_x_pos);
  o_y_pos <= std_logic_vector(s_y_pos);
  o_hsync <= s_hsync;
  o_vsync <= s_vsync;
  o_restart_frame <= s_restart_frame;
end rtl;
