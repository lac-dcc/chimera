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

-- use work.types.all;

-- The download buffer writes a stream of bytes to an internal buffer. When the
-- buffer is full, it is flushed as a single word.
--
-- For example, with a buffer size of four, every four bytes written will be
-- flushed as a single 32-bit word.
entity download_buffer is
  generic (
    -- the size of the buffer (in bytes)
    SIZE : natural
  );
  port (
    -- reset
    reset : in std_logic := '0';

    -- clock
    clk : in std_logic;

    -- data in
    din : in std_logic_vector(7 downto 0);

    -- data out
    dout : out std_logic_vector(SIZE*8-1 downto 0);

    -- write enable
    we : in std_logic;

    -- when the valid signal is asserted there is a word on the output data bus
    valid : out std_logic
  );
end download_buffer;

architecture arch of download_buffer is
  signal counter : natural range 0 to SIZE-1;
begin
  process (clk, reset)
  begin
    if reset = '1' then
      counter <= 0;
      valid <= '0';
    elsif rising_edge(clk) then
      if we = '1' then
        -- write the word to the output data bus
        dout((SIZE-counter)*8-1 downto (SIZE-counter-1)*8) <= din;

        -- increment the counter
        counter <= counter + 1;

        -- flush the buffer if it is full
        if counter = SIZE-1 then
          valid <= '1';
        else
          valid <= '0';
        end if;
      end if;
    end if;
  end process;
end architecture;
