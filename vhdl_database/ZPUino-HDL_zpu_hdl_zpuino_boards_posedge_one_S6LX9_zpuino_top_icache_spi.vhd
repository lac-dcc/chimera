--
--  Top module for ZPUINO/DUO with SPI interface
-- 
--  Copyright 2014 Alvaro Lopes <alvieboy@alvie.com>
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

entity zpuino_top_icache_spi is
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

    -- Memory accesses (for DMA)
    -- This is a master interface

    m_wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    m_wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    m_wb_adr_i: in std_logic_vector(maxAddrBitIncIO downto 0);
    m_wb_we_i:  in std_logic;
    m_wb_cyc_i: in std_logic;
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
    jtag_ctrl_chain_in: in std_logic_vector(11 downto 0);

    -- Master SPI interface
    CS:             in std_logic;
    nCS:            in std_logic;
    SCK:            in std_logic;
    MOSI:           in std_logic;
    MISO:           out std_logic;
    MISOTRIS:       out std_logic
  );
end entity zpuino_top_icache_spi;

architecture behave of zpuino_top_icache_spi is

  signal spiwb_wb_ack_o:       std_logic;
  signal spiwb_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal spiwb_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal spiwb_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal spiwb_wb_cyc_i:       std_logic;
  signal spiwb_wb_stb_i:       std_logic;
  signal spiwb_wb_sel_i:       std_logic_vector(3 downto 0);
  signal spiwb_wb_we_i:        std_logic;

  component spiwb is
  port (
    nCS:  in std_logic;
    SCK:  in std_logic;
    MOSI: in std_logic;
    MISO: out std_logic;
    MISOTRIS: out std_logic;

    clk:    in std_logic;
    rst:    in std_logic;

    wb_we_o:  out std_logic;
    wb_cyc_o:  out std_logic;
    wb_stb_o:  out std_logic;
    wb_adr_o:  out std_logic_vector(maxIObit downto minIObit);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_ack_i: in std_logic
  );
  end component;

  signal ncs_int: std_logic;

begin

  zpuino:zpuino_top_icache_iom
    port map (
      clk           => clk,
	 	  rst           => rst,

      slot_cyc      => slot_cyc,
      slot_we       => slot_we,
      slot_stb      => slot_stb,
      slot_read     => slot_read,
      slot_write    => slot_write,
      slot_address  => slot_address,
      slot_ack      => slot_ack,
      slot_interrupt=> slot_interrupt,
      slot_id       => slot_id,

      pps_in_slot   => pps_in_slot,
      pps_in_pin    => pps_in_pin,

      pps_out_slot  => pps_out_slot,
      pps_out_pin   => pps_out_pin,
	  
      m_wb_dat_o    => m_wb_dat_o,
      m_wb_dat_i    => m_wb_dat_i,
      m_wb_adr_i    => m_wb_adr_i,
      m_wb_we_i     => m_wb_we_i,
      m_wb_cyc_i    => m_wb_cyc_i,
      m_wb_stb_i    => m_wb_stb_i,
      m_wb_ack_o    => m_wb_ack_o,
      m_wb_stall_o  => m_wb_stall_o,

      io_m_wb_dat_o => spiwb_wb_dat_o,
      io_m_wb_dat_i => spiwb_wb_dat_i,
      io_m_wb_adr_i => spiwb_wb_adr_i,
      io_m_wb_we_i  => spiwb_wb_we_i,
      io_m_wb_cyc_i => spiwb_wb_cyc_i,
      io_m_wb_stb_i => spiwb_wb_stb_i,
      io_m_wb_ack_o => spiwb_wb_ack_o,

      wb_ack_i      => wb_ack_i,
      wb_stall_i    => wb_stall_i,
      wb_dat_o      => wb_dat_o,
      wb_dat_i      => wb_dat_i,
      wb_adr_o      => wb_adr_o,
      wb_cyc_o      => wb_cyc_o,
      wb_stb_o      => wb_stb_o,
      wb_sel_o      => wb_sel_o,
      wb_we_o       => wb_we_o,
	  
      -- No debug unit connected
      dbg_reset     => dbg_reset,
      jtag_data_chain_out => jtag_data_chain_out,
      jtag_ctrl_chain_in  => jtag_ctrl_chain_in
      );

    ncs_int <= nCS or not CS;

    spiwb_inst: spiwb
    port map (
      nCS   => ncs_int,
      SCK   => SCK,
      MOSI  => MOSI,
      MISO  => MISO,
      MISOTRIS  => MISOTRIS,

      clk   => clk,
      rst   => rst,

      wb_we_o   => spiwb_wb_we_i,
      wb_cyc_o  => spiwb_wb_cyc_i,
      wb_stb_o  => spiwb_wb_stb_i,
      wb_adr_o  => spiwb_wb_adr_i(maxIObit downto 2),
      wb_dat_i  => spiwb_wb_dat_o,
      wb_dat_o  => spiwb_wb_dat_i,
      wb_ack_i  => spiwb_wb_ack_o

    );

end behave;
