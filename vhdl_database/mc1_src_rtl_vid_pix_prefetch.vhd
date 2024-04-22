----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 Marcus Geelnard
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
-- This is a pixel prefetch cache that aims to keep low priority pixel pipelines fed with data even
-- during high priority pixel pipeline memory cycles.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vid_types.all;

entity vid_pix_prefetch is
  port(
    i_rst : in std_logic;
    i_clk : in std_logic;

    -- Interface from the pixel pipeline.
    i_read_en : in std_logic;
    i_read_adr : in std_logic_vector(23 downto 0);
    i_decremental_read : in std_logic;
    i_row_start_imminent : in std_logic;
    i_row_start_addr : in std_logic_vector(23 downto 0);
    o_read_ack : out std_logic;
    o_read_dat : out std_logic_vector(31 downto 0);

    -- Interface to the RAM.
    o_read_en : out std_logic;
    o_read_adr : out std_logic_vector(23 downto 0);
    i_read_ack : in std_logic;
    i_read_dat : in std_logic_vector(31 downto 0)
  );
end vid_pix_prefetch;

architecture rtl of vid_pix_prefetch is
  signal s_speculative_read_en : std_logic;
  signal s_speculative_expect_ack : std_logic;
  signal s_prev_read_en : std_logic;
  signal s_prefetch_adr : std_logic_vector(23 downto 0);
  signal s_cache_hit : std_logic;
  signal s_cached_adr : std_logic_vector(23 downto 0);
  signal s_cached_dat : std_logic_vector(31 downto 0);
begin
  process(i_clk, i_rst)
    variable v_speculate : std_logic;
  begin
    if i_rst = '1' then
      s_speculative_read_en <= '0';
      s_speculative_expect_ack <= '0';
      s_prev_read_en <= '0';
      s_prefetch_adr <= (others => '0');
      s_cache_hit <= '0';
      s_cached_adr <= (others => '1');
      s_cached_dat <= (others => '0');
    elsif rising_edge(i_clk) then
      -- Did we have a cache hit?
      if i_read_adr = s_cached_adr then
        s_cache_hit <= '1';
      else
        s_cache_hit <= '0';
      end if;

      -- Should we cache a speculative read?
      if i_read_ack = '1' and s_speculative_expect_ack = '1' then
        s_cached_adr <= s_prefetch_adr;
        s_cached_dat <= i_read_dat;
        v_speculate := '0';
      else
        -- Continue an ongoing speculative read until we get an ack.
        v_speculate := s_speculative_read_en;
      end if;

      -- Start a new speculative read cycle?
      if i_read_en = '1' then
        -- Determine the next likey read address.
        if i_decremental_read = '1' then
          s_prefetch_adr <= std_logic_vector(unsigned(i_read_adr) - 1);
        else
          s_prefetch_adr <= std_logic_vector(unsigned(i_read_adr) + 1);
        end if;
        v_speculate := '1';
      elsif i_row_start_imminent = '1' then
        -- Prefetch the first word of the row before the new row starts.
        s_prefetch_adr <= i_row_start_addr;
        v_speculate := '1';
      end if;

      -- Did the pixel pipeline issue a read request during the last cycle?
      s_prev_read_en <= i_read_en;

      -- Do we expect an ack for a speculative read during the next cycle?
      s_speculative_expect_ack <= s_speculative_read_en;

      -- Can we start a speculative read during the next cycle?
      s_speculative_read_en <= v_speculate;
    end if;
  end process;

  -- Outputs to the memory subsystem.
  o_read_en <= i_read_en or s_speculative_read_en;
  o_read_adr <= i_read_adr when i_read_en = '1' else
                s_prefetch_adr;

  -- Outputs to the pixel pipeline.
  o_read_ack <= s_prev_read_en and (s_cache_hit or i_read_ack);
  o_read_dat <= s_cached_dat when s_cache_hit = '1' else
                i_read_dat;
end rtl;
