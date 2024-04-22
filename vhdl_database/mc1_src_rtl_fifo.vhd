----------------------------------------------------------------------------------------------------
-- Copyright (c) 2023 Marcus Geelnard
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

----------------------------------------------------------------------------------------------------
-- Based on "Register based FIFO" by nandland: https://nandland.com/register-based-fifo/
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo is
  generic (
    G_WIDTH : integer := 32;
    G_DEPTH : integer := 16
  );
  port (
    -- Control signals.
    i_rst : in std_logic;
    i_clk : in std_logic;

    -- FIFO Write Interface.
    i_wr_en : in  std_logic;
    i_wr_data : in  std_logic_vector(G_WIDTH-1 downto 0);
    o_full : out std_logic;

    -- FIFO Read Interface.
    i_rd_en : in  std_logic;
    o_rd_data : out std_logic_vector(G_WIDTH-1 downto 0);
    o_empty : out std_logic
  );
end fifo;

architecture rtl of fifo is
  type T_FIFO_DATA is array (0 to G_DEPTH-1) of std_logic_vector(G_WIDTH-1 downto 0);
  signal s_fifo_data : T_FIFO_DATA := (others => (others => '0'));

  -- Ensure that the FIFO data is using registers, not BRAM.
  attribute RAMSTYLE : string;
  attribute RAMSTYLE of s_fifo_data : signal is "MLAB";  -- Intel/Altera
  attribute RAM_STYLE : string;
  attribute RAM_STYLE of s_fifo_data : signal is "distributed";  -- Xilinx

  signal s_wr_idx : integer range 0 to G_DEPTH-1 := 0;
  signal s_rd_idx : integer range 0 to G_DEPTH-1 := 0;
  signal s_fifo_count : integer range 0 to G_DEPTH := 0;

  signal s_full : std_logic;
  signal s_empty : std_logic;
begin
  process (i_rst, i_clk) is
  begin
    if i_rst = '1' then
      s_fifo_count <= 0;
      s_wr_idx <= 0;
      s_rd_idx <= 0;
    elsif rising_edge(i_clk) then
      -- Keeps track of the total number of words in the FIFO.
      if i_wr_en = '1' and i_rd_en = '0' then
        s_fifo_count <= s_fifo_count + 1;
      elsif i_wr_en = '0' and i_rd_en = '1' then
        s_fifo_count <= s_fifo_count - 1;
      end if;

      -- Keeps track of the write index (and controls roll-over).
      if i_wr_en = '1' and s_full = '0' then
        if s_wr_idx = G_DEPTH - 1 then
          s_wr_idx <= 0;
        else
          s_wr_idx <= s_wr_idx + 1;
        end if;
      end if;

      -- Keeps track of the read index (and controls roll-over).
      if i_rd_en = '1' and s_empty = '0' then
        if s_rd_idx = G_DEPTH - 1 then
          s_rd_idx <= 0;
        else
          s_rd_idx <= s_rd_idx + 1;
        end if;
      end if;

      -- Registers the input data when there is a write.
      if i_wr_en = '1' then
        s_fifo_data(s_wr_idx) <= i_wr_data;
      end if;
    end if;
  end process;

  o_rd_data <= s_fifo_data(s_rd_idx);

  -- TODO(m): Make the full/empty signals registered.
  s_full  <= '1' when s_fifo_count = G_DEPTH else '0';
  s_empty <= '1' when s_fifo_count = 0       else '0';

  o_full <= s_full;
  o_empty <= s_empty;
end rtl;
