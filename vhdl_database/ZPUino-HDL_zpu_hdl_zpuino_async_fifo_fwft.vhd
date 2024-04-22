--
--  General-purpose Async FIFO for ZPUINO
-- 
--  Copyright 2013 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all; 


entity async_fifo_fwft is
  generic (
    address_bits: integer := 11;
    data_bits: integer := 8;
    threshold: integer
  );
  port (
    clk_r:    in std_logic;
    clk_w:    in std_logic;
    arst:     in std_logic;

    wr:       in std_logic;
    rd:       in std_logic;

    write:    in std_logic_vector(data_bits-1 downto 0);
    read :    out std_logic_vector(data_bits-1 downto 0);

    almost_full: out std_logic;
    empty: out std_logic
  );
end entity async_fifo_fwft;


architecture behave of async_fifo_fwft is

  signal fifo_do_read: std_logic;
  signal fifo_data_valid: std_logic;
  signal empty_i: std_logic;

begin

  fifo_inst: entity work.async_fifo
  generic map (
    address_bits  => address_bits,
    data_bits     => data_bits,
    threshold     => threshold
  )
  port map (
    clk_r     => clk_r,
    clk_w     => clk_w,
    arst      => arst,

    wr        => wr,
    rd        => fifo_do_read,

    write     => write,
    read      => read,

    almost_full => almost_full,
    empty => empty_i
  );

  fifo_do_read <= (not empty_i) and ((not fifo_data_valid) or rd);
  empty <= not fifo_data_valid;

  process(clk_r,arst)
  begin
    if arst='1' then
      fifo_data_valid<='0';
    elsif rising_edge(clk_r) then
      if fifo_do_read='1' then
        fifo_data_valid <= '1';
      elsif rd='1' then
        fifo_data_valid <= '0';
      end if;
    end if;
  end process;


end behave;
