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

----------------------------------------------------------------------------------------------------
-- This is a dual-ported RAM module that implements the internal video RAM. It has the following
-- properties:
--   * Configurable size (2^N words).
--   * 32-bit data width.
--   * Port A:
--     - Wishbone B4 pipelined interface.
--     - Byte enable / select for write operations.
--     - Single cycle read/write operation.
--   * Port B:
--     - Read-only (no byte enable)
--   * Synthesizes to BRAM
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vram is
  generic(
    ADR_BITS : positive := 10  -- 2**10 = 1024 words
  );
  port(
    -- Reset signal.
    i_rst : in std_logic;

    -- Wishbone memory interface (b4 pipelined slave).
    -- See: https://cdn.opencores.org/downloads/wbspec_b4.pdf
    i_wb_clk : in std_logic;
    i_wb_cyc : in std_logic;
    i_wb_stb : in std_logic;
    i_wb_adr : in std_logic_vector(ADR_BITS-1 downto 0);
    i_wb_dat : in std_logic_vector(31 downto 0);
    i_wb_we : in std_logic;
    i_wb_sel : in std_logic_vector(32/8-1 downto 0);
    o_wb_dat : out std_logic_vector(31 downto 0);
    o_wb_ack : out std_logic;
    o_wb_stall : out std_logic;

    -- Read-only second port to the RAM.
    i_read_clk : in std_logic;
    i_read_adr : in std_logic_vector(ADR_BITS-1 downto 0);
    o_read_dat : out std_logic_vector(31 downto 0)
  );
end vram;

architecture rtl of vram is
  signal s_is_valid_wb_request : std_logic;
  signal s_we_a : std_logic;
  signal s_we_a_0 : std_logic;
  signal s_we_a_1 : std_logic;
  signal s_we_a_2 : std_logic;
  signal s_we_a_3 : std_logic;
begin
  -- Wishbone control logic.
  s_is_valid_wb_request <= i_wb_cyc and i_wb_stb;
  s_we_a <= s_is_valid_wb_request and i_wb_we;
  s_we_a_0 <= s_we_a and i_wb_sel(0);
  s_we_a_1 <= s_we_a and i_wb_sel(1);
  s_we_a_2 <= s_we_a and i_wb_sel(2);
  s_we_a_3 <= s_we_a and i_wb_sel(3);

  -- We always ack and never stall - we're that fast ;-)
  process(i_wb_clk)
  begin
    if rising_edge(i_wb_clk) then
      o_wb_ack <= s_is_valid_wb_request;
    end if;
  end process;
  o_wb_stall <= '0';

  -- We instatiate four 8-bit wide RAM entities in order to support byte select.
  ram_tdp_0: entity work.ram_true_dual_port
    generic map (
      DATA_BITS => 8,
      ADR_BITS => ADR_BITS
    )
    port map (
      i_clk_a => i_wb_clk,
      i_we_a => s_we_a_0,
      i_adr_a => i_wb_adr,
      i_data_a => i_wb_dat(7 downto 0),
      o_data_a => o_wb_dat(7 downto 0),

      i_clk_b => i_read_clk,
      i_adr_b => i_read_adr,
      o_data_b => o_read_dat(7 downto 0)
    );

  ram_tdp_1: entity work.ram_true_dual_port
    generic map (
      DATA_BITS => 8,
      ADR_BITS => ADR_BITS
    )
    port map (
      i_clk_a => i_wb_clk,
      i_we_a => s_we_a_1,
      i_adr_a => i_wb_adr,
      i_data_a => i_wb_dat(15 downto 8),
      o_data_a => o_wb_dat(15 downto 8),

      i_clk_b => i_read_clk,
      i_adr_b => i_read_adr,
      o_data_b => o_read_dat(15 downto 8)
    );

  ram_tdp_2: entity work.ram_true_dual_port
    generic map (
      DATA_BITS => 8,
      ADR_BITS => ADR_BITS
    )
    port map (
      i_clk_a => i_wb_clk,
      i_we_a => s_we_a_2,
      i_adr_a => i_wb_adr,
      i_data_a => i_wb_dat(23 downto 16),
      o_data_a => o_wb_dat(23 downto 16),

      i_clk_b => i_read_clk,
      i_adr_b => i_read_adr,
      o_data_b => o_read_dat(23 downto 16)
    );

  ram_tdp_3: entity work.ram_true_dual_port
    generic map (
      DATA_BITS => 8,
      ADR_BITS => ADR_BITS
    )
    port map (
      i_clk_a => i_wb_clk,
      i_we_a => s_we_a_3,
      i_adr_a => i_wb_adr,
      i_data_a => i_wb_dat(31 downto 24),
      o_data_a => o_wb_dat(31 downto 24),

      i_clk_b => i_read_clk,
      i_adr_b => i_read_adr,
      o_data_b => o_read_dat(31 downto 24)
    );
end rtl;
