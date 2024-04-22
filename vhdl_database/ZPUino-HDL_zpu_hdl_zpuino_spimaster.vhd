--
--  SPI master interface
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

entity spimaster is
  port (
    clk:  in std_logic;
    rst:  in std_logic;
    din:  in std_logic_vector(31 downto 0);
    dout:  out std_logic_vector(31 downto 0);
    en:   in std_logic;
    ready: out std_logic;

    miso: out std_logic;
    mosi: in std_logic;
    sck:  in std_logic;
    seln: in std_logic
  );
end entity spimaster;


architecture behave of spimaster is

signal sck_q:       std_logic;
signal sck_rising:  std_logic;
signal sck_falling: std_logic;

signal event_sample: std_logic;
signal event_shift: std_logic;

-- Registers

signal spi_cpol_q:  std_logic;
signal spi_cpha_q:  std_logic;

signal spi_shift_out_q: std_logic_vector(7 downto 0);
signal spi_shift_in_q: std_logic_vector(7 downto 0);
signal spi_read_q: std_logic_vector(7 downto 0);
signal spi_sample_q: std_logic;

signal spi_count_q: integer range 0 to 7;

begin


-- Clock delay

process(clk)
begin
  if rising_edge(clk) then
    sck_q <= sck;
  end if;
end process;

sck_rising<='1' when sck='1' and sck_q='0' else '0';

sck_falling<='1' when sck='0' and sck_q='1' else '0';

process(sck_rising,sck_falling,spi_cpha_q,spi_cpol_q)
  variable mode: std_logic_vector(1 downto 0);
begin
  event_sample<='0';
  event_shift<='0';

  mode := spi_cpol_q & spi_cpha_q;

  case mode is
    when "00" =>
      event_sample <= sck_rising;
      event_shift  <= sck_falling;
    when "01" =>
      event_sample <= sck_falling;
      event_shift  <= sck_rising;
    when "10" =>
      event_sample <= sck_falling;
      event_shift  <= sck_rising;
    when "11" =>
      event_sample <= sck_rising;
      event_shift  <= sck_falling;
    when others =>
  end case;

end process;

-- Sampling

process(clk)
begin
  if rising_edge(clk) then
    if event_sample='1' and seln='0' then
      spi_sample_q <= mosi;
      spi_shift_in_q(0) <= mosi;
      spi_shift_in_q(7 downto 1) <= spi_shift_in_q(6 downto 0);
    end if;
  end if;
end process;

process(clk)
begin
  if rising_edge(clk) then
    if rst='1' then
      spi_cpha_q<='0';
      spi_cpol_q<='0';
    end if;
  end if;
end process;

process(clk)
begin
  if rising_edge(clk) then
    if seln='1' then
      -- Deselected
      spi_count_q<=7;
    else
      if event_shift='1' then
        miso <= spi_shift_out_q(7);
        spi_shift_out_q(7 downto 1) <= spi_shift_out_q(6 downto 0);
        spi_shift_out_q(0) <= spi_sample_q;

        if spi_count_q=0 then
          spi_count_q<=7;
          -- Event
          spi_read_q <= spi_shift_in_q;
        else
          spi_count_q<=spi_count_q-1;
        end if;
      end if;
    end if;
  end if;
end process;

end behave;
