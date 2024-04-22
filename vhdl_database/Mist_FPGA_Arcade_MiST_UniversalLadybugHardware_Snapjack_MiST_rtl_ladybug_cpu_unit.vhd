-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_cpu_unit.vhd,v 1.19 2005/12/10 14:51:51 arnim Exp $
--
-- CPU Main Unit of the Lady Bug Machine.
--
-- Actually, the PCB where the CPU resides on contains also the sound chips and
-- parts of the video controller. For the sake of simplicity, the CPU and chip
-- select logic has been moved into this separate unit.
--
-------------------------------------------------------------------------------
--
-- Copyright (c) 2005, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ladybug_cpu_unit is
  port (
    clk_20mhz_i    : in  std_logic;
    clk_en_4mhz_i  : in  std_logic;
    res_n_i        : in  std_logic;
    rom_cpu_a_o    : out std_logic_vector(14 downto 0);
    rom_cpu_d_i    : in  std_logic_vector( 7 downto 0);
    sound_wait_n_i : in  std_logic;
    wait_n_i       : in  std_logic;
    right_chute_i  : in  std_logic;
    left_chute_i   : in  std_logic;
    gpio_in0_i     : in  std_logic_vector( 7 downto  0);
    gpio_in1_i     : in  std_logic_vector( 7 downto  0);
    gpio_in2_i     : in  std_logic_vector( 7 downto  0);
    gpio_in3_i     : in  std_logic_vector( 7 downto  0);
    gpio_extra_i   : in  std_logic_vector( 7 downto  0);
    a_o            : out std_logic_vector(10 downto  0);
    d_to_cpu_i     : in  std_logic_vector( 7 downto  0);
    d_from_cpu_o   : out std_logic_vector( 7 downto  0);
    rd_n_o         : out std_logic;
    wr_n_o         : out std_logic;
    cs7_n_o        : out std_logic;
    cs10_n_o       : out std_logic;
    cs11_n_o       : out std_logic;
    cs12_n_o       : out std_logic;
    cs13_n_o       : out std_logic
  );

end ladybug_cpu_unit;

architecture struct of ladybug_cpu_unit is

  signal t80_clk_en_s   : std_logic;

  signal wait_n_s       : std_logic;
  signal int_n_s        : std_logic;
  signal nmi_n_s        : std_logic;
  signal mreq_n_s       : std_logic;
  signal rd_n_s         : std_logic;
  signal wr_n_s         : std_logic;
  signal rfsh_n_s       : std_logic;
  signal m1_n_s         : std_logic;
  signal a_s            : std_logic_vector(15 downto 0);
  signal d_to_cpu_s     : std_logic_vector( 7 downto 0);
  signal d_from_cpu_s   : std_logic_vector( 7 downto 0);
  signal d_from_rom_s,
         d_decrypted_s,
         d_rom_mux_s    : std_logic_vector( 7 downto 0);
  signal d_from_ram_s   : std_logic_vector( 7 downto 0);
  signal d_from_gpio_s  : std_logic_vector( 7 downto 0);

  signal cs_n_s         : std_logic_vector(15 downto 0);

  signal ram_cpu_cs_n_s : std_logic;

  signal vcc_s          : std_logic;

begin
  vcc_s <= '1';

  wait_n_s <= sound_wait_n_i and wait_n_i;

  -----------------------------------------------------------------------------
  -- The T80 CPU
  -----------------------------------------------------------------------------
  -- "wait" has to be modelled with the clock enable because the T80 is not
  -- able to enlarge write accesses properly when they are delayed with "wait"
  t80_clk_en_s <= clk_en_4mhz_i and wait_n_s;
  T80a_b : entity work.T80s
    generic map (
      Mode => 0
    )
    port map (
      RESET_n    => res_n_i,
      CLK        => clk_20mhz_i,
      CEN        => t80_clk_en_s,
      WAIT_n     => wait_n_s,
      INT_n      => int_n_s,
      NMI_n      => nmi_n_s,
      BUSRQ_n    => vcc_s,
      M1_n       => m1_n_s,
      MREQ_n     => mreq_n_s,
      IORQ_n     => open,
      RD_n       => rd_n_s,
      WR_n       => wr_n_s,
      RFSH_n     => rfsh_n_s,
      HALT_n     => open,
      BUSAK_n    => open,
      A          => a_s,
      DI         => d_to_cpu_s,
      DO         => d_from_cpu_s
    );
  d_from_cpu_o <= d_from_cpu_s;


  -----------------------------------------------------------------------------
  -- The CPU RAM
  -----------------------------------------------------------------------------
	cpu_ram_b : entity work.ladybug_cpu_ram
	port map (
		clk_i    => clk_20mhz_i,
		clk_en_i => clk_en_4mhz_i,
		a_i      => a_s(11 downto 0),
		cs_n_i   => cs_n_s(6),
		we_n_i   => wr_n_s,
		d_i      => d_from_cpu_s,
		d_o      => d_from_ram_s
	);

  -----------------------------------------------------------------------------
  -- The Address Decoder
  -----------------------------------------------------------------------------
  addr_dec_b : entity work.ladybug_addr_dec
    port map (
      clk_20mhz_i    => clk_20mhz_i,
      res_n_i        => res_n_i,
      a_i            => a_s(15 downto 12),
      rd_n_i         => rd_n_s,
      wr_n_i         => wr_n_s,
      mreq_n_i       => mreq_n_s,
      rfsh_n_i       => rfsh_n_s,
      cs_n_o         => cs_n_s,
      ram_cpu_cs_n_o => ram_cpu_cs_n_s
    );


  -----------------------------------------------------------------------------
  -- The General Purpose IO
  -----------------------------------------------------------------------------
  gpio_b : entity work.ladybug_gpio
    port map (
      a_i          => a_s(1 downto 0),
      cs_in_n_i    => cs_n_s(9),
      cs_extra_n_i => cs_n_s(14),
      in0_i        => gpio_in0_i,
      in1_i        => gpio_in1_i,
      in2_i        => gpio_in2_i,
      in3_i        => gpio_in3_i,
      extra_i      => gpio_extra_i,
      d_o          => d_from_gpio_s
    );


  -----------------------------------------------------------------------------
  -- The Coin Chutes
  -----------------------------------------------------------------------------
  coin_chutes_b : entity work.ladybug_chutes
    port map (
      clk_20mhz_i   => clk_20mhz_i,
      res_n_i       => res_n_i,
      right_chute_i => right_chute_i,
      left_chute_i  => left_chute_i,
      cs8_n_i       => cs_n_s(8),
      nmi_n_o       => nmi_n_s,
      int_n_o       => int_n_s
    );


  -----------------------------------------------------------------------------
  -- Decrytion PROMs
  -----------------------------------------------------------------------------

  decrypt_prom : entity work.prom_decrypt
    port map (
      CLK    => clk_20mhz_i,
      ADDR   => rom_cpu_d_i,
      DATA   => d_decrypted_s
    );

  -----------------------------------------------------------------------------
  -- Only opcodes (i.e. instruction fetches) have to be decrypted
  -----------------------------------------------------------------------------
  d_rom_mux_s <=   d_decrypted_s when m1_n_s = '0' else rom_cpu_d_i;

  -----------------------------------------------------------------------------
  -- Gate Data Bus from ROM
  -- The ROM puts data on the data bus within the CPU Main Unit so we do
  -- gating here.
  -----------------------------------------------------------------------------
  d_from_rom_s <=   d_rom_mux_s
                  when cs_n_s(0) = '0' or cs_n_s(1) = '0' or cs_n_s(2) = '0' or
                       cs_n_s(3) = '0' or cs_n_s(4) = '0' or cs_n_s(5) = '0' else
                    (others => '1');


  -----------------------------------------------------------------------------
  -- Combine Data Buses
  -- Uses an AND of all incoming buses from submodules. Each module has to
  -- drive ones when not active so we can save logic complexity here.
  -----------------------------------------------------------------------------
  d_to_cpu_s <= d_to_cpu_i and d_from_rom_s and d_from_ram_s and d_from_gpio_s;


  -----------------------------------------------------------------------------
  -- Output Mapping
  -----------------------------------------------------------------------------
  a_o         <= a_s(10 downto 0);
  rom_cpu_a_o <= a_s(14 downto 0);
  rd_n_o      <= rd_n_s;
  wr_n_o      <= wr_n_s;
  cs7_n_o     <= cs_n_s(7);
  cs10_n_o    <= cs_n_s(10);
  cs11_n_o    <= cs_n_s(11);
  cs12_n_o    <= cs_n_s(12);
  cs13_n_o    <= cs_n_s(13);

end struct;
