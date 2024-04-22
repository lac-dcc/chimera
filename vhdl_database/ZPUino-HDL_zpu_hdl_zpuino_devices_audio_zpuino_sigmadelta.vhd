--
-- Sigma-delta output
--
-- Copyright 2008,2009,2010 �lvaro Lopes <alvieboy@alvie.com>
--
-- Version: 1.2
--
-- The FreeBSD license
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimer in the documentation and/or other materials
--    provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-- ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
-- INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
-- STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-- Changelog:
--
-- 1.2: Adapted from ALZPU to ZPUino
-- 1.1: First version, imported from old controller.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpupkg.all;
use work.zpu_config.all;
use work.zpuinopkg.all;

entity zpuino_sigmadelta is
	port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_inta_o:out std_logic;
    id:       out slot_id;

    sync_in:  in std_logic;

    -- Connection to GPIO pin
	 raw_out: out std_logic_vector(17 downto 0);
    spp_data: out std_logic_vector(1 downto 0);
    spp_en:   out std_logic_vector(1 downto 0)
  );
end entity zpuino_sigmadelta;

architecture behave of zpuino_sigmadelta is

component dac_dsm3v is
  generic (
    nbits : integer := 16);
  port (
    din     : in  signed((nbits-1) downto 0);
    dout    : out std_logic;
    clk     : in  std_logic;
    clk_ena : in  std_logic;
    n_rst   : in  std_logic);
end component;

component dac_simplesd is
  generic (
    nbits : integer := 16);
  port (
    din     : in  signed((nbits-1) downto 0);
    dout    : out std_logic;
    clk     : in  std_logic;
    clk_ena : in  std_logic;
    rst     : in  std_logic);
end component;

component dac_dsm2v is
  generic (
    nbits : integer := 16);
  port (
    din     : in  signed((nbits-1) downto 0);
    dout    : out std_logic;
    clk     : in  std_logic;
    clk_ena : in  std_logic;
    n_rst   : in  std_logic);
end component;

signal dat_q1: unsigned(15 downto 0);
signal dat_q2: unsigned(15 downto 0);

signal sync_dat_q1: signed(15 downto 0);
signal sync_dat_q2: signed(15 downto 0);

signal sd_en_q: std_logic_vector(1 downto 0);
signal sdout: std_logic_vector(1 downto 0);

signal sdtick: std_logic;
signal sdcnt: integer;
signal le_q: std_logic;
signal do_sync: std_logic;
signal extsync_q: std_logic;
signal nrst: std_logic;
signal sign_q: std_logic;

begin

  id <= x"08" & x"14"; -- Vendor: ZPUino  Device: 16-Bit Dual SigmaDelta
  wb_dat_o <= (others => DontCareValue);
  wb_inta_o <= '0';
  wb_ack_o <= wb_cyc_i and wb_stb_i;
  raw_out(17 downto 2) <= std_logic_vector(dat_q1(15 downto 0));
  raw_out(1 downto 0)<=(others => '0');

process(wb_clk_i)
  variable in_le1,in_le2: std_logic_vector(15 downto 0);
begin
  if rising_edge(wb_clk_i) then
    if wb_rst_i='1' then
      dat_q1 <= (others =>'0');
      dat_q1(15) <= '1';
      dat_q2 <= (others =>'0');
      dat_q2(15) <= '1';
      sd_en_q <= (others =>'0');
      sign_q <= '0';
    else 
	    if wb_cyc_i='1' and wb_stb_i='1' and wb_we_i='1' then
        case wb_adr_i(2) is
          when '0' =>
            sd_en_q(0) <= wb_dat_i(0);
            sd_en_q(1) <= wb_dat_i(1);
            le_q <= wb_dat_i(2);
            extsync_q <= wb_dat_i(3);
            sign_q <= wb_dat_i(5);
          when '1' =>
            --report "SigmaDelta set: " & hstr(wb_dat_i(15 downto 0)) severity note;
            case le_q is
              when '0' =>
    		        dat_q1(15 downto 0) <= unsigned(wb_dat_i(15 downto 0));
                dat_q2(15 downto 0) <= unsigned(wb_dat_i(31 downto 16));
              when '1' =>
                in_le1(15 downto 8) := wb_dat_i(7 downto 0);
                in_le1(7 downto 0) := wb_dat_i(15 downto 8);

                in_le2(15 downto 8) := wb_dat_i(23 downto 16);
                in_le2(7 downto 0) := wb_dat_i(31 downto 24);

                dat_q1(15 downto 0) <= unsigned(in_le1);
                dat_q2(15 downto 0) <= unsigned(in_le2);
              when others =>
            end case;
          when others =>
        end case;
      end if;
    end if;
  end if;
end process;

process(extsync_q,sync_in)
begin
  if extsync_q='1' then
    do_sync <= sync_in;
  else
    do_sync <='1';
  end if;
end process;

process(wb_clk_i)
begin
  if rising_edge(wb_clk_i) then
    if do_sync='1' then
      if sign_q='0' then
        sync_dat_q1 <= signed(dat_q1)-32768;
        sync_dat_q2 <= signed(dat_q2)-32768;
      else
        sync_dat_q1 <= signed(dat_q1);
        sync_dat_q2 <= signed(dat_q2);
      end if;
    end if;
  end if;
end process;

process(wb_clk_i)
begin
  if rising_edge(wb_clk_i) then
    if wb_rst_i='1' then
      nrst<='0';
    else
      nrst<='1';
    end if;
  end if;
end process;

chan0: dac_simplesd
  port map (
    din     => sync_dat_q1(15 downto 0),
    dout    => sdout(0),
    clk     => wb_clk_i,
    clk_ena => '1',
    rst     => wb_rst_i
  );

chan1: dac_simplesd
  port map (
    din     => sync_dat_q2(15 downto 0),
    dout    => sdout(1),
    clk     => wb_clk_i,
    clk_ena => '1',
    rst     => wb_rst_i
  );


spp_data <= sdout;
spp_en <= sd_en_q;

end behave;

