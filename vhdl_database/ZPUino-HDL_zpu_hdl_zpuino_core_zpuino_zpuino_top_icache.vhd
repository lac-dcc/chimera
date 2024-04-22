--
--  Top module for ZPUINO
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;
use work.wishbonepkg.all;

entity zpuino_top_icache is
  port (
    clk:      in std_logic;
	 	rst:      in std_logic;

    -- Connection to board IO module

    slot_cyc:   out slot_std_logic_type;
    slot_we:    out slot_std_logic_type;
    slot_stb:   out slot_std_logic_type;
    slot_read:  in slot_cpuword_type;
    slot_write: out slot_cpuword_type;
    slot_address:  out slot_address_type;
    slot_ack:   in slot_std_logic_type;
    slot_interrupt: in slot_std_logic_type;
    slot_id:    in slot_id_type;

    -- PPS information
    pps_in_slot:  in ppsininfotype;
    pps_in_pin:  in ppsininfotype;
    pps_out_slot:  in ppsoutinfotype;
    pps_out_pin:  in ppsoutinfotype;

    dbg_reset:  out std_logic;
    --memory_enable: out std_logic;

    -- Memory accesses (for DMA)
    -- This is a master interface

    m_wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    m_wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    m_wb_adr_i: in std_logic_vector(maxAddrBitIncIO downto 0);
    m_wb_we_i:  in std_logic;
    m_wb_cyc_i: in std_logic;
    m_wb_cti_i: in std_logic_vector(2 downto 0);
    m_wb_stb_i: in std_logic;
    m_wb_ack_o: out std_logic;
    m_wb_stall_o: out std_logic;

    -- Memory connection

    wb_ack_i:       in std_logic;
    wb_stall_i:     in std_logic;
    wb_dat_i:       in std_logic_vector(wordSize-1 downto 0);
    wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    wb_adr_o:       out std_logic_vector(maxAddrBit downto 0);
    wb_cyc_o:       out std_logic;
    wb_cti_o:       out std_logic_vector(2 downto 0);
    wb_stb_o:       out std_logic;
    wb_sel_o:       out std_logic_vector(3 downto 0);
    wb_we_o:        out std_logic;

    jtag_data_chain_out: out std_logic_vector(98 downto 0);
    jtag_ctrl_chain_in: in std_logic_vector(11 downto 0)

  );
end entity zpuino_top_icache;

architecture behave of zpuino_top_icache is

  signal i_slot_cyc:   slot_std_logic_type;
  signal i_slot_we:    slot_std_logic_type;
  signal i_slot_stb:   slot_std_logic_type;
  signal i_slot_read:  slot_cpuword_type;
  signal i_slot_write: slot_cpuword_type;
  signal i_slot_address:  slot_address_type;
  signal i_slot_ack:   slot_std_logic_type;
  signal i_slot_interrupt: slot_std_logic_type;
  signal i_slot_id:    slot_id_type;

  signal io_read:    std_logic_vector(wordSize-1 downto 0);
  signal io_write:   std_logic_vector(wordSize-1 downto 0);
  signal io_address: std_logic_vector(maxAddrBitIncIO downto 0);
  signal io_stb:     std_logic;
  signal io_cyc:     std_logic;
  signal io_we:       std_logic;
  signal io_ack:     std_logic;

  signal wb_read:    std_logic_vector(wordSize-1 downto 0);
  signal wb_write:   std_logic_vector(wordSize-1 downto 0);
  signal wb_address: std_logic_vector(maxAddrBitIncIO downto 0);
  signal wb_stb:     std_logic;
  signal wb_cyc:     std_logic;
  signal wb_sel:     std_logic_vector(3 downto 0);
  signal wb_cti:     std_logic_vector(2 downto 0);
  signal wb_we:       std_logic;
  signal wb_ack:     std_logic;

  signal poppc_inst: std_logic;

  signal dbg_pc:         std_logic_vector(maxAddrBit downto 0);
  signal dbg_opcode:     std_logic_vector(7 downto 0);
  signal dbg_opcode_in:  std_logic_vector(7 downto 0);
  signal dbg_sp:         std_logic_vector(10 downto 2);
  signal dbg_brk:        std_logic;
  signal dbg_stacka:     std_logic_vector(wordSize-1 downto 0);
  signal dbg_stackb:     std_logic_vector(wordSize-1 downto 0);
  signal dbg_step:       std_logic := '0';
  signal dbg_freeze:     std_logic;
  signal dbg_flush:      std_logic;
  signal dbg_valid:      std_logic;
  signal dbg_ready:      std_logic;
  signal dbg_inject:     std_logic;
  signal dbg_injectmode: std_logic;
  signal dbg_idim:      std_logic;

  signal stack_a_addr,stack_b_addr: std_logic_vector(stackSize_bits-1 downto 2);
  signal stack_a_writeenable, stack_b_writeenable: std_logic_vector(3 downto 0);
  signal stack_a_enable,stack_b_enable: std_logic;
  signal stack_a_write,stack_b_write: std_logic_vector(31 downto 0);
  signal stack_a_read,stack_b_read: std_logic_vector(31 downto 0);
  signal stack_clk: std_logic;
  signal cache_flush: std_logic;
  --signal memory_enable: std_logic;

  signal cpu_ram_wb_clk_i:       std_logic;
  signal cpu_ram_wb_rst_i:       std_logic;
  signal cpu_ram_wb_ack_o:       std_logic;
  signal cpu_ram_wb_stall_o:     std_logic;
  signal cpu_ram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal cpu_ram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal cpu_ram_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal cpu_ram_wb_cyc_i:       std_logic;
  signal cpu_ram_wb_stb_i:       std_logic;
  signal cpu_ram_wb_sel_i:       std_logic_vector(3 downto 0);
  signal cpu_ram_wb_we_i:        std_logic;

  signal p_cpu_ram_wb_clk_i:       std_logic;
  signal p_cpu_ram_wb_rst_i:       std_logic;
  signal p_cpu_ram_wb_ack_o:       std_logic;
  signal p_cpu_ram_wb_stall_o:     std_logic;
  signal p_cpu_ram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal p_cpu_ram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal p_cpu_ram_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal p_cpu_ram_wb_cyc_i:       std_logic;
  signal p_cpu_ram_wb_stb_i:       std_logic;
  signal p_cpu_ram_wb_sel_i:       std_logic_vector(3 downto 0);
  signal p_cpu_ram_wb_we_i:        std_logic;

  signal ram_wb_clk_i:       std_logic;
  signal ram_wb_rst_i:       std_logic;
  signal ram_wb_ack_o:       std_logic;
  signal ram_wb_stall_o:     std_logic;
  signal ram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal ram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal ram_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal ram_wb_cyc_i:       std_logic;
  signal ram_wb_stb_i:       std_logic;
  signal ram_wb_sel_i:       std_logic_vector(3 downto 0);
  signal ram_wb_cti_i:       std_logic_vector(2 downto 0);
  signal ram_wb_we_i:        std_logic;

  signal rom_wb_ack_o:       std_logic;
  signal rom_wb_stall_o:     std_logic;
  signal rom_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal rom_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal rom_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal rom_wb_cyc_i:       std_logic;
  signal rom_wb_stb_i:       std_logic;
  signal rom_wb_cti_i:       std_logic_vector(2 downto 0);
  signal rom_wb_sel_i:       std_logic_vector(3 downto 0);
  signal rom_wb_we_i:        std_logic;
                             
  signal sram_rom_wb_ack_o:       std_logic;
  signal sram_rom_wb_stall_o:     std_logic;
  signal sram_rom_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal sram_rom_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal sram_rom_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal sram_rom_wb_cyc_i:       std_logic;
  signal sram_rom_wb_stb_i:       std_logic;
  signal sram_rom_wb_cti_i:       std_logic_vector(2 downto 0);
  signal sram_rom_wb_sel_i:       std_logic_vector(3 downto 0);
  signal sram_rom_wb_we_i:        std_logic;

  signal prom_rom_wb_ack_o:       std_logic;
  signal prom_rom_wb_stall_o:     std_logic;
  signal prom_rom_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal prom_rom_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal prom_rom_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal prom_rom_wb_cyc_i:       std_logic;
  signal prom_rom_wb_stb_i:       std_logic;
  signal prom_rom_wb_cti_i:       std_logic_vector(2 downto 0);
  signal prom_rom_wb_sel_i:       std_logic_vector(3 downto 0);
  signal prom_rom_wb_we_i:        std_logic;

  signal cpu_wb_clk_i:       std_logic;
  signal cpu_wb_rst_i:       std_logic;
  signal cpu_wb_ack_i:       std_logic;
  signal cpu_wb_stall_o:     std_logic;
  signal cpu_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal cpu_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal cpu_wb_adr_o:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal cpu_wb_cyc_o:       std_logic;
  signal cpu_wb_stb_o:       std_logic;
  signal cpu_wb_sel_o:       std_logic_vector(3 downto 0);
  signal cpu_wb_we_o:        std_logic;
  signal cpu_wb_inta_i:      std_logic;

  signal dbg_to_zpu:         zpu_dbg_in_type;
  signal dbg_from_zpu:       zpu_dbg_out_type;

  signal memory_enable:      std_logic;

begin

  core: zpu_core_extreme_icache
    port map (
      wb_clk_i      => clk,
	 		wb_rst_i      => rst,

	 		wb_ack_i      => cpu_wb_ack_i,
	 		wb_dat_i      => cpu_wb_dat_i,
	 		wb_dat_o      => cpu_wb_dat_o,
      wb_adr_o      => cpu_wb_adr_o,
			wb_cyc_o      => cpu_wb_cyc_o,
			wb_stb_o      => cpu_wb_stb_o,
      wb_sel_o      => cpu_wb_sel_o,
      wb_we_o       => cpu_wb_we_o,
	 		wb_inta_i     => cpu_wb_inta_i,

      poppc_inst    => poppc_inst,
	 		break         => open,
      cache_flush   => cache_flush,
      memory_enable => memory_enable,

      stack_clk     => stack_clk,
      stack_a_read  => stack_a_read,
      stack_b_read  => stack_b_read,
      stack_a_write => stack_a_write,
      stack_b_write => stack_b_write,
      stack_a_writeenable => stack_a_writeenable,
      stack_b_writeenable => stack_b_writeenable,
      stack_a_enable => stack_a_enable,
      stack_b_enable => stack_b_enable,
      stack_a_addr  => stack_a_addr,
      stack_b_addr  => stack_b_addr,

      rom_wb_ack_i  => rom_wb_ack_o,
      rom_wb_dat_i  => rom_wb_dat_o,
      rom_wb_adr_o  => rom_wb_adr_i(maxAddrBit downto 0),
      rom_wb_cyc_o  => rom_wb_cyc_i,
      rom_wb_stb_o  => rom_wb_stb_i,
      rom_wb_cti_o  => rom_wb_cti_i,
      rom_wb_stall_i  => rom_wb_stall_o,

      dbg_in        => dbg_to_zpu,
      dbg_out       => dbg_from_zpu
    );

  stack: zpuino_stack
  port map (
    stack_clk     => stack_clk,
    stack_a_read  => stack_a_read,
    stack_b_read  => stack_b_read,
    stack_a_write => stack_a_write,
    stack_b_write => stack_b_write,
    stack_a_writeenable => stack_a_writeenable,
    stack_b_writeenable => stack_b_writeenable,
    stack_a_enable => stack_a_enable,
    stack_b_enable => stack_b_enable,
    stack_a_addr  => stack_a_addr,
    stack_b_addr  => stack_b_addr
  );

  dbg: zpuino_debug_core
    port map (
      clk           => clk,
      rst           => rst,
      dbg_out       => dbg_to_zpu,
      dbg_in        => dbg_from_zpu,
      dbg_reset     => dbg_reset,

      jtag_data_chain_out => jtag_data_chain_out,
      jtag_ctrl_chain_in => jtag_ctrl_chain_in

   );


  io: zpuino_io
    port map (
      wb_clk_i      => clk,
	 	  wb_rst_i      => rst,
      wb_dat_o      => io_read,
      wb_dat_i      => io_write,
      wb_adr_i      => io_address,
      wb_cyc_i      => io_cyc,
      wb_stb_i      => io_stb,
      wb_ack_o      => io_ack,
      wb_we_i       => io_we,
      wb_inta_o     => cpu_wb_inta_i,

      intready      => poppc_inst,
      cache_flush   => cache_flush,
      memory_enable => memory_enable,

      slot_cyc      => i_slot_cyc,
      slot_we       => i_slot_we,
      slot_stb      => i_slot_stb,
      slot_read     => i_slot_read,
      slot_write    => i_slot_write,
      slot_address  => i_slot_address,
      slot_ack      => i_slot_ack,
      slot_interrupt=> i_slot_interrupt,
      slot_id       => i_slot_id,

      pps_in_slot   => pps_in_slot,
      pps_in_pin    => pps_in_pin,
      pps_out_slot  => pps_out_slot,
      pps_out_pin   => pps_out_pin

    );

  -- PROM

  prom: wb_bootloader
    port map (
      wb_clk_i    => clk,
      wb_rst_i    => rst,

      wb_dat_o    => prom_rom_wb_dat_o,
      wb_adr_i    => prom_rom_wb_adr_i(11 downto 2),
      wb_cyc_i    => prom_rom_wb_cyc_i,
      wb_stb_i    => prom_rom_wb_stb_i,
      wb_ack_o    => prom_rom_wb_ack_o,
      wb_stall_o  => prom_rom_wb_stall_o,

      wb2_dat_o    => i_slot_read(15),
      wb2_adr_i    => i_slot_address(15)(11 downto 2),
      wb2_cyc_i    => i_slot_cyc(15),
      wb2_stb_i    => i_slot_stb(15),
      wb2_ack_o    => i_slot_ack(15),
      wb2_stall_o  => open
    );

    i_slot_id(15) <= x"08" & x"02";


  -- Bootloader MUX

  bootmux: wbbootloadermux
  generic map (
    address_high  => maxAddrBit
  )
  port map (
    wb_clk_i      => clk,
	 	wb_rst_i      => rst,

    sel           => memory_enable,

    -- Master 

    m_wb_dat_o    => rom_wb_dat_o,
    m_wb_dat_i    => (others => DontCareValue),
    m_wb_adr_i    => rom_wb_adr_i(maxAddrBit downto 2),
    m_wb_sel_i    => (others => '1'),
    m_wb_cti_i    => CTI_CYCLE_INCRADDR,  -- Fix me.
    m_wb_we_i     => '0',
    m_wb_cyc_i    => rom_wb_cyc_i,
    m_wb_stb_i    => rom_wb_stb_i,
    m_wb_ack_o    => rom_wb_ack_o,
    m_wb_stall_o  => rom_wb_stall_o,

    -- Slave 0 signals

    s0_wb_dat_i   => sram_rom_wb_dat_o,
    s0_wb_dat_o   => open,
    s0_wb_adr_o   => sram_rom_wb_adr_i(maxAddrBit downto 2),
    s0_wb_sel_o   => open,
    s0_wb_cti_o   => sram_rom_wb_cti_i,
    s0_wb_we_o    => open,
    s0_wb_cyc_o   => sram_rom_wb_cyc_i,
    s0_wb_stb_o   => sram_rom_wb_stb_i,
    s0_wb_ack_i   => sram_rom_wb_ack_o,
    s0_wb_stall_i => sram_rom_wb_stall_o,

    -- Slave 1 signals

    s1_wb_dat_i   => prom_rom_wb_dat_o,
    s1_wb_dat_o   => open,
    s1_wb_adr_o   => prom_rom_wb_adr_i(11 downto 2),
    s1_wb_sel_o   => open,
    s1_wb_cti_o   => open,
    s1_wb_we_o    => open,
    s1_wb_cyc_o   => prom_rom_wb_cyc_i,
    s1_wb_stb_o   => prom_rom_wb_stb_i,
    s1_wb_ack_i   => prom_rom_wb_ack_o,
    s1_wb_stall_i => prom_rom_wb_stall_o

  );

  memarb: wbarb2_1
  generic map (
    ADDRESS_HIGH => maxAddrBit,
    ADDRESS_LOW => 2
  )
  port map (
    wb_clk_i      => clk,
    wb_rst_i      => rst,

    m0_wb_dat_o   => ram_wb_dat_o,
    m0_wb_dat_i   => ram_wb_dat_i,
    m0_wb_adr_i   => ram_wb_adr_i(maxAddrBit downto 2),
    m0_wb_sel_i   => ram_wb_sel_i,
    m0_wb_cti_i   => ram_wb_cti_i,
    m0_wb_we_i    => ram_wb_we_i,
    m0_wb_cyc_i   => ram_wb_cyc_i,
    m0_wb_stb_i   => ram_wb_stb_i,
    m0_wb_ack_o   => ram_wb_ack_o,
    m0_wb_stall_o => ram_wb_stall_o,

    m1_wb_dat_o   => sram_rom_wb_dat_o,
    m1_wb_dat_i   => (others => DontCareValue),
    m1_wb_adr_i   => sram_rom_wb_adr_i(maxAddrBit downto 2),
    m1_wb_sel_i   => (others => '1'),
    m1_wb_cti_i   => sram_rom_wb_cti_i,
    m1_wb_we_i    => '0',--rom_wb_we_i,
    m1_wb_cyc_i   => sram_rom_wb_cyc_i,
    m1_wb_stb_i   => sram_rom_wb_stb_i,
    m1_wb_ack_o   => sram_rom_wb_ack_o,
    m1_wb_stall_o => sram_rom_wb_stall_o,

    s0_wb_dat_i   => wb_dat_i,
    s0_wb_dat_o   => wb_dat_o,
    s0_wb_adr_o   => wb_adr_o(maxAddrBit downto 2),
    s0_wb_sel_o   => wb_sel_o,
    s0_wb_cti_o   => wb_cti_o,
    s0_wb_we_o    => wb_we_o,
    s0_wb_cyc_o   => wb_cyc_o,
    s0_wb_stb_o   => wb_stb_o,
    s0_wb_ack_i   => wb_ack_i,
    s0_wb_stall_i => wb_stall_i
  );


  npnadapt: wb_master_np_to_slave_p
  generic map (
    ADDRESS_HIGH  => maxAddrBitIncIO,
    ADDRESS_LOW   => 0
  )
  port map (
    wb_clk_i    => clk,
	 	wb_rst_i    => rst,

    -- Master signals

    m_wb_dat_o  => cpu_ram_wb_dat_o,
    m_wb_dat_i  => cpu_ram_wb_dat_i,
    m_wb_adr_i  => cpu_ram_wb_adr_i,
    m_wb_sel_i  => cpu_ram_wb_sel_i,
    m_wb_cti_i  => CTI_CYCLE_CLASSIC,
    m_wb_we_i   => cpu_ram_wb_we_i,
    m_wb_cyc_i  => cpu_ram_wb_cyc_i,
    m_wb_stb_i  => cpu_ram_wb_stb_i,
    m_wb_ack_o  => cpu_ram_wb_ack_o,

    -- Slave signals

    s_wb_dat_i  => p_cpu_ram_wb_dat_o,
    s_wb_dat_o  => p_cpu_ram_wb_dat_i,
    s_wb_adr_o  => p_cpu_ram_wb_adr_i,
    s_wb_sel_o  => p_cpu_ram_wb_sel_i,
    s_wb_cti_o  => open,
    s_wb_we_o   => p_cpu_ram_wb_we_i,
    s_wb_cyc_o  => p_cpu_ram_wb_cyc_i,
    s_wb_stb_o  => p_cpu_ram_wb_stb_i,
    s_wb_ack_i  => p_cpu_ram_wb_ack_o,
    s_wb_stall_i => p_cpu_ram_wb_stall_o
  );



  iomemmux: wbmux2
  generic map (
    select_line => maxAddrBitIncIO,
    address_high =>maxAddrBitIncIO,
    address_low=>0  
  )
  port map (
    wb_clk_i     => clk,
	 	wb_rst_i     => rst,

    -- Master 

    m_wb_dat_o    => cpu_wb_dat_i,
    m_wb_dat_i    => cpu_wb_dat_o,
    m_wb_adr_i    => cpu_wb_adr_o,
    m_wb_sel_i    => cpu_wb_sel_o,
    m_wb_cti_i    => CTI_CYCLE_CLASSIC,
    m_wb_we_i     => cpu_wb_we_o,
    m_wb_cyc_i    => cpu_wb_cyc_o,
    m_wb_stb_i    => cpu_wb_stb_o,
    m_wb_ack_o    => cpu_wb_ack_i,

    -- Slave 0 signals

    s0_wb_dat_i   => cpu_ram_wb_dat_o,
    s0_wb_dat_o   => cpu_ram_wb_dat_i,
    s0_wb_adr_o   => cpu_ram_wb_adr_i,
    s0_wb_sel_o   => cpu_ram_wb_sel_i,
    s0_wb_cti_o   => open,
    s0_wb_we_o    => cpu_ram_wb_we_i,
    s0_wb_cyc_o   => cpu_ram_wb_cyc_i,
    s0_wb_stb_o   => cpu_ram_wb_stb_i,
    s0_wb_ack_i   => cpu_ram_wb_ack_o,

    -- Slave 1 signals

    s1_wb_dat_i   => io_read,
    s1_wb_dat_o   => io_write,
    s1_wb_adr_o   => io_address,
    s1_wb_sel_o   => open,
    s1_wb_cti_o   => open,
    s1_wb_we_o    => io_we,
    s1_wb_cyc_o   => io_cyc,
    s1_wb_stb_o   => io_stb,
    s1_wb_ack_i   => io_ack
  );

  memarb2: wbarb2_1
  generic map (
    ADDRESS_HIGH => maxAddrBit,
    ADDRESS_LOW => 0
  )
  port map (
    wb_clk_i      => clk,
	 	wb_rst_i      => rst,

    -- Master 0 signals (CPU)

    m0_wb_dat_o   => p_cpu_ram_wb_dat_o,
    m0_wb_dat_i   => p_cpu_ram_wb_dat_i,
    m0_wb_adr_i   => p_cpu_ram_wb_adr_i(maxAddrBit downto 0),
    m0_wb_sel_i   => p_cpu_ram_wb_sel_i,
    m0_wb_cti_i   => CTI_CYCLE_CLASSIC,
    m0_wb_we_i    => p_cpu_ram_wb_we_i,
    m0_wb_cyc_i   => p_cpu_ram_wb_cyc_i,
    m0_wb_stb_i   => p_cpu_ram_wb_stb_i,
    m0_wb_ack_o   => p_cpu_ram_wb_ack_o,
    m0_wb_stall_o => p_cpu_ram_wb_stall_o,

    -- Master 1 signals

    m1_wb_dat_o   => m_wb_dat_o,
    m1_wb_dat_i   => m_wb_dat_i,
    m1_wb_adr_i   => m_wb_adr_i(maxAddrBit downto 0),
    m1_wb_sel_i   => (others => '1'),
    m1_wb_cti_i   => m_wb_cti_i,
    m1_wb_we_i    => m_wb_we_i,
    m1_wb_cyc_i   => m_wb_cyc_i,
    m1_wb_stb_i   => m_wb_stb_i,
    m1_wb_ack_o   => m_wb_ack_o,
    m1_wb_stall_o   => m_wb_stall_o,

    -- Slave signals

    s0_wb_dat_i   => ram_wb_dat_o,
    s0_wb_dat_o   => ram_wb_dat_i,
    s0_wb_adr_o   => ram_wb_adr_i(maxAddrBit downto 0),
    s0_wb_sel_o   => ram_wb_sel_i,
    s0_wb_cti_o   => ram_wb_cti_i,
    s0_wb_we_o    => ram_wb_we_i,
    s0_wb_cyc_o   => ram_wb_cyc_i,
    s0_wb_stb_o   => ram_wb_stb_i,
    s0_wb_ack_i   => ram_wb_ack_o,
    s0_wb_stall_i => ram_wb_stall_o
  );

  -- Don't connect reserved slots (0-system controller, 15-bootloader)

  slotcon: for i in 1 to 14
  generate
    slot_cyc(i)    <= i_slot_cyc(i);
    slot_we(i)     <= i_slot_we(i);
    slot_stb(i)    <= i_slot_stb(i);
    i_slot_read(i) <= slot_read(i);
    slot_write(i)  <= i_slot_write(i);
    slot_address(i)  <= i_slot_address(i);
    i_slot_ack(i)  <= slot_ack(i);
    i_slot_interrupt(i)  <= slot_interrupt(i);
    i_slot_id(i)   <= slot_id(i);
  end generate;

end behave;
