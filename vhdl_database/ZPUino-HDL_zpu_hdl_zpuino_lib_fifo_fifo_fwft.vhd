--
--  General-purpose FIFO for ZPUINO
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
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


entity fifo_fwft is
  generic (
    bits: integer := 11;
    datawidth: integer := 8
  );
  port (
    clk:      in std_logic;
    rst:      in std_logic;
    wr:       in std_logic;
    rd:       in std_logic;
    write:    in std_logic_vector(datawidth-1 downto 0);
    read :    out std_logic_vector(datawidth-1 downto 0);
    full:     out std_logic;
    empty:    out std_logic
  );
end entity fifo_fwft;

architecture behave of fifo_fwft is
  signal fifo_do_read: std_logic;
  signal fifo_data_valid: std_logic;
  signal empty_i: std_logic;
begin

  classicfifo: entity work.fifo
    generic map (
      bits      => bits,
      datawidth => datawidth
    )
    port map (
      clk => clk,
      rst => rst,
      wr  => wr,
      rd  => fifo_do_read,
      write => write,
      read  => read,
      full  => full,
      empty => empty_i
    );

  fifo_do_read <= (not empty_i) and ((not fifo_data_valid) or rd);
  empty <= not fifo_data_valid;

  process(clk)
  begin
    if rising_edge(clk) then
      if rst='1' then
        fifo_data_valid<='0';
      else
        if fifo_do_read='1' then
          fifo_data_valid <= '1';
        elsif rd='1' then
          fifo_data_valid <= '0';
        end if;
      end if;
    end if;
  end process;

end behave;

