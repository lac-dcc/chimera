--
--  VGA RAM for ZPUINO (and others)
-- 
--  Copyright 2011 Alvaro Lopes <alvieboy@alvie.com>
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity zpuino_vga_ram is
  port (
    -- Scan
    v_clk:    in std_logic;
    v_en:     in std_logic; 
    v_addr:   in std_logic_vector(14 downto 0);
    v_data:   out std_logic_vector(7 downto 0);

    -- Memory interface
    mi_clk: in std_logic;

    mi_dat_i: in std_logic_vector(7 downto 0); -- Data write
    mi_we:  in std_logic;
    mi_en:  in std_logic;
    mi_dat_o: out std_logic_vector(7 downto 0);
    mi_addr:  in std_logic_vector(14 downto 0)

  );
end entity zpuino_vga_ram;


--
--   Address 0 to 15: 1st char
--   Address 16 to 31: 2st char
--
--

architecture behave of zpuino_vga_ram is

  signal v_ram_0_en, v_ram_1_en: std_logic;
  signal v_ram_0_data, v_ram_1_data: std_logic_vector(7 downto 0);
  signal v_addrh_q: std_logic;

  signal mi_ram_0_en, mi_ram_1_en: std_logic;
  signal mi_ram_0_dat_o, mi_ram_1_dat_o: std_logic_vector(7 downto 0);
  signal mi_addrh_q: std_logic;
  signal nodata: std_logic_vector(7 downto 0) := (others => '0');
begin

  -- vport enable signals
  v_ram_0_en <= v_en and not v_addr(14);
  v_ram_1_en <= v_en and v_addr(14);

  -- vport address decode
  process(v_clk)
  begin
    if rising_edge(v_clk) then
      v_addrh_q <= v_ram_1_en;
    end if;
  end process;

  -- vport Output select
  v_data <= v_ram_0_data when v_addrh_q='0' else v_ram_1_data;



  -- miport enable signals
  mi_ram_0_en <= mi_en and not mi_addr(14);
  mi_ram_1_en <= mi_en and mi_addr(14);

  -- vport address decode
  process(mi_clk)
  begin
    if rising_edge(mi_clk) then
      mi_addrh_q <= mi_ram_1_en;
    end if;
  end process;

  -- vport Output select
  mi_dat_o <= mi_ram_0_dat_o when mi_addrh_q='0' else mi_ram_1_dat_o;


  ram0: generic_dp_ram
  generic map (
    address_bits => 14,
    data_bits    => 8
  )
  port map (
    clka      => v_clk,
    ena       => v_ram_0_en,
    wea       => '0',
    addra     => v_addr(13 downto 0),
    dia       => nodata,
    doa       => v_ram_0_data,

    clkb      => mi_clk,
    enb       => mi_ram_0_en,
    web       => mi_we,
    addrb     => mi_addr(13 downto 0),
    dib       => mi_dat_i,
    dob       => mi_ram_0_dat_o
  );

  ram1: generic_dp_ram
  generic map (
    address_bits => 12,
    data_bits    => 8
  )
  port map (
    clka      => v_clk,
    ena       => v_ram_1_en,
    wea       => '0',
    addra     => v_addr(11 downto 0),
    dia       => nodata,
    doa       => v_ram_1_data,

    clkb      => mi_clk,
    enb       => mi_ram_1_en,
    web       => mi_we,
    addrb     => mi_addr(11 downto 0),
    dib       => mi_dat_i,
    dob       => mi_ram_1_dat_o
  );

  
end behave;
