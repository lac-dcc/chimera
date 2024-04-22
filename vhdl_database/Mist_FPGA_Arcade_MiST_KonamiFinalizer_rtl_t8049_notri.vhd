-------------------------------------------------------------------------------
--
-- T8048 Microcontroller System
-- 8048 toplevel without tri-states
--
-- $Id: t8048_notri.vhd,v 1.7 2006/07/14 01:13:32 arniml Exp $
-- $Name:  $
--
-- Copyright (c) 2004, Arnim Laeuger (arniml@opencores.org)
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
-- The latest version of this file can be found at:
--      http://www.opencores.org/cvsweb.shtml/t48/
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity t8049_notri is

  generic (
    gate_port_input_g : integer := 1
  );

  port (
    xtal_i        : in  std_logic;
    xtal_en_i     : in  std_logic;
    reset_n_i     : in  std_logic;
    t0_i          : in  std_logic;
    t0_o          : out std_logic;
    t0_dir_o      : out std_logic;
    int_n_i       : in  std_logic;
    ea_i          : in  std_logic;
    rd_n_o        : out std_logic;
    psen_n_o      : out std_logic;
    wr_n_o        : out std_logic;
    ale_o         : out std_logic;
    db_i          : in  std_logic_vector( 7 downto 0);
    db_o          : out std_logic_vector( 7 downto 0);
    db_dir_o      : out std_logic;
    t1_i          : in  std_logic;
    p2_i          : in  std_logic_vector( 7 downto 0);
    p2_o          : out std_logic_vector( 7 downto 0);
    p2l_low_imp_o : out std_logic;
    p2h_low_imp_o : out std_logic;
    p1_i          : in  std_logic_vector( 7 downto 0);
    p1_o          : out std_logic_vector( 7 downto 0);
    p1_low_imp_o  : out std_logic;
    prog_n_o      : out std_logic;
    --Extra inputs for MiSTer ROM loader to load embedded ROM
    ADDR_DL       : in  std_logic_vector(24 downto 0);
    CLK_DL        : in  std_logic;
    CS_DL         : in  std_logic;
    DATA_IN       : in  std_logic_vector( 7 downto 0);
    WR            : in  std_logic
  );

end t8049_notri;


library ieee;
use ieee.numeric_std.all;

use work.t48_core_comp_pack.t48_core;
--use work.t48_core_comp_pack.kSND01_ROM;
use work.t48_core_comp_pack.generic_ram_ena;

architecture struct of t8049_notri is

  component kSND01_ROM
    port (
      CLK     : in  std_logic;
      CLK_DL  : in  std_logic;
      ADDR    : in  std_logic_vector(10 downto 0);
      ADDR_DL : in  std_logic_vector(24 downto 0);
      DATA_IN : in  std_logic_vector( 7 downto 0);
      CS_DL   : in  std_logic;
      WR      : in  std_logic;
      DATA    : out std_logic_vector( 7 downto 0)
    );
  end component;

  -- Address width of internal ROM
  constant rom_addr_width_c : natural := 11;

  signal xtal3_s          : std_logic;
  signal dmem_addr_s      : std_logic_vector( 7 downto 0);
  signal dmem_we_s        : std_logic;
  signal dmem_data_from_s : std_logic_vector( 7 downto 0);
  signal dmem_data_to_s   : std_logic_vector( 7 downto 0);
  signal pmem_addr_s      : std_logic_vector(11 downto 0);
  signal pmem_data_s      : std_logic_vector( 7 downto 0);

  signal ea_s             : std_logic;

  signal p1_in_s,
         p1_out_s         : std_logic_vector( 7 downto 0);
  signal p2_in_s,
         p2_out_s         : std_logic_vector( 7 downto 0);

  signal vdd_s            : std_logic;

begin

  vdd_s <= '1';

  -----------------------------------------------------------------------------
  -- Check generics for valid values.
  -----------------------------------------------------------------------------
  -- pragma translate_off
  assert gate_port_input_g = 0 or gate_port_input_g = 1
    report "gate_port_input_g must be either 1 or 0!"
    severity failure;
  -- pragma translate_on


  t48_core_b : t48_core
    generic map (
      xtal_div_3_g        => 1,
      register_mnemonic_g => 1,
      include_port1_g     => 1,
      include_port2_g     => 1,
      include_bus_g       => 1,
      include_timer_g     => 1,
      sample_t1_state_g   => 4
    )
    port map (
      xtal_i        => xtal_i,
      xtal_en_i     => xtal_en_i,
      reset_i       => reset_n_i,
      t0_i          => t0_i,
      t0_o          => t0_o,
      t0_dir_o      => t0_dir_o,
      int_n_i       => int_n_i,
      ea_i          => ea_s,
      rd_n_o        => rd_n_o,
      psen_n_o      => psen_n_o,
      wr_n_o        => wr_n_o,
      ale_o         => ale_o,
      db_i          => db_i,
      db_o          => db_o,
      db_dir_o      => db_dir_o,
      t1_i          => t1_i,
      p2_i          => p2_in_s,
      p2_o          => p2_out_s,
      p2l_low_imp_o => p2l_low_imp_o,
      p2h_low_imp_o => p2h_low_imp_o,
      p1_i          => p1_in_s,
      p1_o          => p1_out_s,
      p1_low_imp_o  => p1_low_imp_o,
      prog_n_o      => prog_n_o,
      clk_i         => xtal_i,
      en_clk_i      => xtal3_s,
      xtal3_o       => xtal3_s,
      dmem_addr_o   => dmem_addr_s,
      dmem_we_o     => dmem_we_s,
      dmem_data_i   => dmem_data_from_s,
      dmem_data_o   => dmem_data_to_s,
      pmem_addr_o   => pmem_addr_s,
      pmem_data_i   => pmem_data_s
    );


  -----------------------------------------------------------------------------
  -- Gate port 1 and 2 input bus with respetive output value
  -----------------------------------------------------------------------------
  gate_ports: if gate_port_input_g = 1 generate
    p1_in_s <= p1_i and p1_out_s;
    p2_in_s <= p2_i and p2_out_s;
  end generate;

  pass_ports: if gate_port_input_g = 0 generate
    p1_in_s <= p1_i;
    p2_in_s <= p2_i;
  end generate;  

  p1_o <= p1_out_s;
  p2_o <= p2_out_s;


  -----------------------------------------------------------------------------
  -- Process ea
  --
  -- Purpose:
  --   Detects access to external program memory.
  --   Either by ea_i = '1' or when program memory address leaves address
  --   range of internal ROM.
  --
  ea: process (ea_i,
               pmem_addr_s)
  begin
    if ea_i = '1' then
      -- Forced external access
      ea_s <= '1';

    elsif unsigned(pmem_addr_s(11 downto rom_addr_width_c)) = 0 then
      -- Internal access
      ea_s <= '0';

    else
      -- Access to program memory out of internal range
      ea_s <= '1';

    end if;

  end process ea;
  --
  -----------------------------------------------------------------------------


  rom_2k_b : kSND01_ROM
    port map (
      CLK     => xtal_i,
      CLK_DL  => CLK_DL,
      ADDR    => pmem_addr_s(rom_addr_width_c-1 downto 0),
      ADDR_DL => ADDR_DL,
      DATA_IN => DATA_IN,
      CS_DL   => CS_DL,
      WR      => WR,
      DATA    => pmem_data_s
    );

  ram_64_b : generic_ram_ena
    generic map (
      addr_width_g => 7,
      data_width_g => 8
    )
    port map (
      clk_i => xtal_i,
      a_i   => dmem_addr_s(6 downto 0),
      we_i  => dmem_we_s,
      ena_i => vdd_s,
      d_i   => dmem_data_to_s,
      d_o   => dmem_data_from_s
    );

end struct;


-------------------------------------------------------------------------------
-- File History:
--
-- $Log: t8048_notri.vhd,v $
-- Revision 1.7  2006/07/14 01:13:32  arniml
-- name keyword added
--
-- Revision 1.6  2006/06/21 01:02:16  arniml
-- replaced syn_rom and syn_ram with t48_rom and generic_ram_ena
--
-- Revision 1.5  2006/06/20 00:47:08  arniml
-- new input xtal_en_i
--
-- Revision 1.4  2005/11/01 21:38:48  arniml
-- wire signals for P2 low impedance marker issue
--
-- Revision 1.3  2004/12/02 22:08:42  arniml
-- introduced generic gate_port_input_g
-- forces masking of P1 and P2 input bus
--
-- Revision 1.2  2004/12/01 23:08:08  arniml
-- update
--
-------------------------------------------------------------------------------
