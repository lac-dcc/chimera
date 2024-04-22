--   __   __     __  __     __         __
--  /\ "-.\ \   /\ \/\ \   /\ \       /\ \
--  \ \ \-.  \  \ \ \_\ \  \ \ \____  \ \ \____
--   \ \_\\"\_\  \ \_____\  \ \_____\  \ \_____\
--    \/_/ \/_/   \/_____/   \/_____/   \/_____/
--   ______     ______       __     ______     ______     ______
--  /\  __ \   /\  == \     /\ \   /\  ___\   /\  ___\   /\__  _\
--  \ \ \/\ \  \ \  __<    _\_\ \  \ \  __\   \ \ \____  \/_/\ \/
--   \ \_____\  \ \_____\ /\_____\  \ \_____\  \ \_____\    \ \_\
--    \/_____/   \/_____/ \/_____/   \/_____/   \/_____/     \/_/
--
-- https://joshbassett.info
-- https://twitter.com/nullobject
-- https://github.com/nullobject
--
-- Copyright (c) 2020 Josh Bassett
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--use work.common.all;
use work.math.all;

-- A segment provides a read-only interface to a contiguous block of ROM data,
-- located somewhere in memory.
entity segment is
  generic (
    -- the width of the ROM address bus
    ROM_ADDR_WIDTH : natural;

    -- the width of the ROM data bus
    ROM_DATA_WIDTH : natural;

    -- the byte offset of the ROM data in memory
    ROM_OFFSET : natural := 0
  );
  port (
    -- reset
    reset : in std_logic;

    -- clock
    clk : in std_logic;

    -- When the chip select signal is asserted, the segment will request data
    -- from the ROM controller when there is a cache miss.
    cs : in std_logic := '1';

    -- When the output enable signal is asserted, the output buffer is enabled
    -- and the word at the requested address will be placed on the ROM data
    -- bus.
    oe : in std_logic := '1';

    -- controller interface
    ctrl_addr  : buffer unsigned(22 downto 0);
    ctrl_req   : out std_logic;
    ctrl_hit   : buffer std_logic;
    ctrl_ack   : in std_logic;
    ctrl_valid : in std_logic;
    ctrl_data  : in std_logic_vector(31 downto 0);

    -- ROM interface
    rom_addr : in unsigned(ROM_ADDR_WIDTH-1 downto 0);
    rom_data : out std_logic_vector(ROM_DATA_WIDTH-1 downto 0)
  );
end segment;

architecture arch of segment is
  -- the number of ROM words in a 32-bit word (e.g. there are four 8-bit ROM
  -- words in a 32-bit word)
  constant ROM_WORDS : natural := 32/ROM_DATA_WIDTH;

  -- the number of bits in the offset component of the ROM address
  constant OFFSET_WIDTH : natural := ilog2(ROM_WORDS);

  -- the offset of the word from the requested ROM address in the cache
  signal offset : natural range 0 to ROM_WORDS-1;

  -- control signals
--  signal hit : std_logic;

  -- registers
  signal full         : std_logic;
  signal pending      : std_logic;
  signal pending_addr : unsigned(22 downto 0);
  signal cache_addr   : unsigned(22 downto 0);
  signal cache_data   : std_logic_vector(31 downto 0);
begin
  -- latch data received from the memory controller
  latch_data : process (clk, reset)
  begin
    if reset = '1' then
      full    <= '0';
      pending <= '0';
    elsif rising_edge(clk) then
      if ctrl_ack = '1' then
        -- set the pending register
        pending <= '1';

        -- set the pending addr
        pending_addr <= ctrl_addr;
      elsif ctrl_valid = '1' then
        -- set the full register
        full <= '1';

        -- clear the pending register
        pending <= '0';

        -- set the cached address/data
        cache_addr <= pending_addr;
        cache_data <= ctrl_data;
      end if;
    end if;
  end process;

  -- assert the hit signal when the cache has been filled, and the requested
  -- address is in the cache
  ctrl_hit <= '1' when full = '1' and ctrl_addr = cache_addr else '0';

  -- calculate the offset of the ROM address within a 32-bit word
  offset <= to_integer(rom_addr(OFFSET_WIDTH-1 downto 0)) when OFFSET_WIDTH > 0 else 0;

  -- extract the word at the requested offset in the cache
  -- rom_data <= cache_data((ROM_WORDS-offset)*ROM_DATA_WIDTH-1 downto (ROM_WORDS-offset-1)*ROM_DATA_WIDTH) when cs = '1' and oe = '1' else (others => '0');
   rom_data <= cache_data((ROM_WORDS-offset)*ROM_DATA_WIDTH-1 downto (ROM_WORDS-offset-1)*ROM_DATA_WIDTH) when cs = '1' and oe = '1' and ctrl_valid = '0' 
        else ctrl_data((ROM_WORDS-offset)*ROM_DATA_WIDTH-1 downto (ROM_WORDS-offset-1)*ROM_DATA_WIDTH) when cs = '1' and oe = '1' and ctrl_valid = '1' 
        else (others => '0');

  -- we need to divide the ROM offset by four, because we are converting from
  -- an 8-bit ROM offset to a 32-bit address
  ctrl_addr <= resize(shift_right(rom_addr, OFFSET_WIDTH), 23) + ROM_OFFSET/4;

  -- assert the request signal unless there is a pending request or a cache hit
  ctrl_req <= cs and not (pending or ctrl_hit);
end architecture arch;
