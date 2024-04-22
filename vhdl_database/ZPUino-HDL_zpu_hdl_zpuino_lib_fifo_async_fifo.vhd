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


entity async_fifo is
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
    empty:    out std_logic
  );
end entity async_fifo;


architecture behave of async_fifo is

  component generic_dp_ram is
  generic (
    address_bits: integer := 8;
    data_bits: integer := 32
  );
  port (
    clka:             in std_logic;
    ena:              in std_logic;
    wea:              in std_logic;
    addra:            in std_logic_vector(address_bits-1 downto 0);
    dia:              in std_logic_vector(data_bits-1 downto 0);
    doa:              out std_logic_vector(data_bits-1 downto 0);
    clkb:             in std_logic;
    enb:              in std_logic;
    web:              in std_logic;
    addrb:            in std_logic_vector(address_bits-1 downto 0);
    dib:              in std_logic_vector(data_bits-1 downto 0);
    dob:              out std_logic_vector(data_bits-1 downto 0)
  );
  end component;

  signal rdptr: unsigned(address_bits-1 downto 0);
  signal wrptr: unsigned(address_bits-1 downto 0);
  signal rdptr_in_clkw_1: unsigned(address_bits-1 downto 0);
  signal rdptr_in_clkw_2: unsigned(address_bits-1 downto 0);

  signal wrptr_in_clkr_1: unsigned(address_bits-1 downto 0);
  signal wrptr_in_clkr_2: unsigned(address_bits-1 downto 0);

  constant nothing: std_logic_vector(data_bits-1 downto 0) := (others => 'X');
  constant threshcmp: unsigned(address_bits-1 downto 0) := to_unsigned( threshold, address_bits);
  signal rst_w, rst_w_1, rst_r, rst_r_1: std_logic;

begin

  process(arst,clk_r,clk_w)
  begin
    if arst='1' then
      rst_w_1<='1';
      rst_w <='1';
      rst_r_1<='1';
      rst_r <='1';
    else
      if rising_edge(clk_r) then
        rst_r_1<='0';
        rst_r<=rst_r_1;
      end if;
      if rising_edge(clk_w) then
        rst_w_1<='0';
        rst_w<=rst_w_1;
      end if;
    end if;
  end process;

  process(rdptr_in_clkw_2, wrptr, rst_r)
    variable delta: unsigned(address_bits-1 downto 0);
  begin
    delta := wrptr - rdptr_in_clkw_2;
    if (delta>threshcmp) then
      almost_full <= '1';
    else
      almost_full <= '0';
    end if;
    if rst_r='1' then
      almost_full <= '0';
    end if;
  end process;


  process(clk_w, rst_w)
  begin
    if rst_w='1' then
       rdptr_in_clkw_2  <= ( others => '0');
       rdptr_in_clkw_1  <= ( others => '0');
    elsif rising_edge(clk_w) then
      rdptr_in_clkw_2 <= rdptr_in_clkw_1;
      rdptr_in_clkw_1 <= rdptr;
    end if;
  end process;

  process(clk_r)
  begin
    if rst_r='1' then
      wrptr_in_clkr_2 <= ( others => '0');
      wrptr_in_clkr_1 <= ( others => '0');
    elsif rising_edge(clk_r) then
      wrptr_in_clkr_2 <= wrptr_in_clkr_1;
      wrptr_in_clkr_1 <= wrptr;
    end if;
  end process;

  empty <= '1' when wrptr_in_clkr_2=rdptr or rst_r='1' else '0';

  mem: generic_dp_ram
    generic map (
      address_bits => address_bits,
      data_bits => data_bits
    )
    port map (
      clka  => clk_r,
      ena   => rd,
      doa   => read,
      wea   => '0',
      dia   => nothing,
      addra => std_logic_vector(rdptr),

      clkb  => clk_w,
      enb   => wr,
      web   => wr,
      dib   => write,
      dob   => open,
      addrb => std_logic_vector(wrptr)
    );

  -- Write process
  process(clk_w, rst_w)
  begin
    if rst_w='1' then
      wrptr <= (others => '0');
    elsif rising_edge(clk_w) then
      if wr='1' then
        wrptr <= wrptr + 1;
      end if;
    end if;
  end process;

  -- Read process
  process(clk_r, rst_r)
  begin
    if rst_r='1' then
      rdptr <= (others => '0');
    elsif rising_edge(clk_r) then
      if rd='1' then
        rdptr <= rdptr + 1;
      end if;
    end if;
  end process;


end behave;
