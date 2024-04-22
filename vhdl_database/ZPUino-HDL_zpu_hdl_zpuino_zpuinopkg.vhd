--
--  ZPUINO package
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
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuino_config.all;

package zpuinopkg is


  constant num_devices: integer := (2**zpuino_number_io_select_bits);

  type slot_std_logic_type is array(1 to num_devices-1) of std_logic;
  subtype cpuword_type     is std_logic_vector(31 downto 0);
  type slot_cpuword_type   is array(1 to num_devices-1) of cpuword_type;
  subtype address_type     is std_logic_vector(maxIObit downto minIObit);
  type slot_address_type   is array(1 to num_devices-1) of address_type;
  subtype slot_id          is std_logic_vector(15 downto 0);
  type slot_id_type        is array(1 to num_devices-1) of slot_id;

  type ppsoutinfotype is array(PPSCOUNT_OUT-1 downto 0) of integer range 0 to 15;
  type ppsininfotype is array(PPSCOUNT_IN-1 downto 0) of integer range 0 to 15;

  component zpuino_top_icache is
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
    -- Wishbone MASTER interface (for DMA)
    m_wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    m_wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    m_wb_adr_i: in std_logic_vector(maxAddrBitIncIO downto 0);
    m_wb_we_i:  in std_logic;
    m_wb_cyc_i: in std_logic;
    m_wb_stb_i: in std_logic;
    m_wb_cti_i: in std_logic_vector(2 downto 0);
    m_wb_ack_o: out std_logic;
    m_wb_stall_o: out std_logic;

    -- PPS information
    pps_in_slot:  in ppsininfotype;
    pps_in_pin:  in ppsininfotype;
    pps_out_slot:  in ppsoutinfotype;
    pps_out_pin:  in ppsoutinfotype;

    -- Memory connection

    wb_ack_i:       in std_logic;
    wb_stall_i:     in std_logic;
    wb_dat_i:       in std_logic_vector(wordSize-1 downto 0);
    wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    wb_adr_o:       out std_logic_vector(maxAddrBit downto 0);
    wb_cyc_o:       out std_logic;
    wb_stb_o:       out std_logic;
    wb_cti_o:       out std_logic_vector(2 downto 0);
    wb_sel_o:       out std_logic_vector(3 downto 0);
    wb_we_o:        out std_logic;

    dbg_reset: out std_logic;
    jtag_data_chain_out: out std_logic_vector(98 downto 0);
    jtag_ctrl_chain_in: in std_logic_vector(11 downto 0)

  );
  end component zpuino_top_icache;

  component zpuino_top_icache_iom is
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
    -- Wishbone MASTER interface (for DMA)
    m_wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    m_wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    m_wb_adr_i: in std_logic_vector(maxAddrBitIncIO downto 0);
    m_wb_we_i:  in std_logic;
    m_wb_cyc_i: in std_logic;
    m_wb_stb_i: in std_logic;
    m_wb_ack_o: out std_logic;
    m_wb_stall_o: out std_logic;

    -- IO accesses
    -- This is a master interface

    io_m_wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    io_m_wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    io_m_wb_adr_i: in std_logic_vector(maxAddrBitIncIO downto 0);
    io_m_wb_we_i:  in std_logic;
    io_m_wb_cyc_i: in std_logic;
    io_m_wb_stb_i: in std_logic;
    io_m_wb_ack_o: out std_logic;
    -- PPS information
    pps_in_slot:  in ppsininfotype;
    pps_in_pin:  in ppsininfotype;
    pps_out_slot:  in ppsoutinfotype;
    pps_out_pin:  in ppsoutinfotype;

    -- Memory connection

    wb_ack_i:       in std_logic;
    wb_stall_i:     in std_logic;
    wb_dat_i:       in std_logic_vector(wordSize-1 downto 0);
    wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    wb_adr_o:       out std_logic_vector(maxAddrBit downto 0);
    wb_cyc_o:       out std_logic;
    wb_stb_o:       out std_logic;
    wb_cti_o:       out std_logic_vector(2 downto 0);
    wb_sel_o:       out std_logic_vector(3 downto 0);
    wb_we_o:        out std_logic;

    dbg_reset: out std_logic;
    jtag_data_chain_out: out std_logic_vector(98 downto 0);
    jtag_ctrl_chain_in: in std_logic_vector(11 downto 0)

  );
  end component zpuino_top_icache_iom;


  component zpuino_io is
    port (
      wb_clk_i: in std_logic;
  	 	wb_rst_i: in std_logic;
      wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
      wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
      wb_adr_i: in std_logic_vector(maxAddrBitIncIO downto 0);
      wb_we_i:  in std_logic;
      wb_cyc_i: in std_logic;
      wb_stb_i: in std_logic;
      wb_ack_o: out std_logic;
      wb_inta_o:out std_logic;

      intready: in std_logic;
      cache_flush: out std_logic;
      memory_enable: out std_logic;

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
      pps_out_pin:  in ppsoutinfotype
    );
  end component zpuino_io;

  component zpuino_empty_device is
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
    id:       out slot_id
  );
  end component zpuino_empty_device;

  component zpuino_spi is
    generic (
    INTERNAL_SPI: boolean := false
  );
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

    mosi:     out std_logic;
    miso:     in std_logic;
    sck:      out std_logic;

    enabled:  out std_logic
  );
  end component zpuino_spi;

  component zpuino_uart is
  generic (
    bits: integer := 11
  );
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

    enabled:  out std_logic;
    tx:       out std_logic;
    rx:       in std_logic
  );
  end component zpuino_uart;

  component zpuino_gpio is
  generic (
    gpio_count: integer := 32
  );
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

    spp_data: in std_logic_vector(PPSCOUNT_OUT-1 downto 0);
    spp_read: out std_logic_vector(PPSCOUNT_IN-1 downto 0);

    gpio_o:   out std_logic_vector(gpio_count-1 downto 0);
    gpio_t:   out std_logic_vector(gpio_count-1 downto 0);
    gpio_i:   in std_logic_vector(gpio_count-1 downto 0);

    spp_cap_in:  in std_logic_vector(gpio_count-1 downto 0); -- SPP capable pin for INPUT
    spp_cap_out: in std_logic_vector(gpio_count-1 downto 0) -- SPP capable pin for OUTPUT
  );
  end component zpuino_gpio;

  component zpuino_timers is
  generic (
    A_TSCENABLED: boolean := false;
    A_PWMCOUNT: integer range 1 to 8 := 2;
    A_WIDTH: integer range 1 to 32 := 16;
    A_PRESCALER_ENABLED: boolean := true;
    A_BUFFERS: boolean := true;
    B_TSCENABLED: boolean := false;
    B_PWMCOUNT: integer range 1 to 8 := 2;
    B_WIDTH: integer range 1 to 32 := 16;
    B_PRESCALER_ENABLED: boolean := false;
    B_BUFFERS: boolean := false
  );

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
    wb_intb_o:out std_logic;
    id:       out slot_id;

    pwm_A_out: out std_logic_vector(A_PWMCOUNT-1 downto 0);
    pwm_B_out: out std_logic_vector(B_PWMCOUNT-1 downto 0)
  );
  end component zpuino_timers;


  component zpuino_sysctl is
  generic (
    INTERRUPT_LINES: integer := 16
  );
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

    -- PPS information
    pps_in_slot:  in ppsininfotype;
    pps_in_pin:  in ppsininfotype;
    pps_out_slot:  in ppsoutinfotype;
    pps_out_pin:  in ppsoutinfotype;

    poppc_inst:in std_logic;
    cache_flush: out std_logic;
    memory_enable: out std_logic;

    intr_in:    in std_logic_vector(INTERRUPT_LINES-1 downto 0);
    intr_cfglvl:in std_logic_vector(INTERRUPT_LINES-1 downto 0);
    slot_id:    in slot_id_type
  );
  end component zpuino_sysctl;

  component zpuino_sigmadelta is
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
  end component zpuino_sigmadelta;

  component zpuino_crc16 is
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
    id:       out slot_id
  );
  end component zpuino_crc16;

  component zpuino_adc is
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
    sample:   in std_logic;
    -- GPIO SPI pins

    mosi:     out std_logic;
    miso:     in std_logic;
    sck:      out std_logic;
    seln:     out std_logic;
    enabled:  out std_logic
  );
  end component zpuino_adc;

  component sram_ctrl is
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    wb_dat_o: out std_logic_vector(31 downto 0);
    wb_dat_i: in std_logic_vector(31 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    --wb_sel_i: in std_logic_vector(3 downto 0);
    --wb_cti_i: in std_logic_vector(2 downto 0);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_stall_o: out std_logic;

    id:       out slot_id;

    clk_we: in std_logic;
    clk_wen: in std_logic;

    -- SRAM signals
    sram_addr:  out std_logic_vector(18 downto 0);
    sram_data:  inout std_logic_vector(15 downto 0);
    sram_ce:    out std_logic;
    sram_we:    out std_logic;
    sram_oe:    out std_logic;
    sram_be:    out std_logic
  );
  end component sram_ctrl;

  component sram_ctrl8 is
  generic (
    WIDTH_BITS: integer := 19
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    wb_dat_o: out std_logic_vector(31 downto 0);
    wb_dat_i: in std_logic_vector(31 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_sel_i: in std_logic_vector(3 downto 0);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_stall_o: out std_logic;
    clk_we: in std_logic;
    clk_wen: in std_logic;

    -- SRAM signals
    sram_addr:  out std_logic_vector(WIDTH_BITS-1 downto 0);
    sram_data:  inout std_logic_vector(7 downto 0);
    sram_ce:    out std_logic;
    sram_we:    out std_logic;
    sram_oe:    out std_logic
  );
  end component sram_ctrl8;

  component zpuino_sevenseg is
  generic (
    BITS: integer := 2;
    EXTRASIZE: integer := 32;
    FREQ_PER_DISPLAY:  integer := 120;
    MHZ:  integer := 96;
    INVERT: boolean := true
  );
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

    segdata:  out std_logic_vector(6 downto 0);
    dot:      out std_logic;
    extra:    out std_logic_vector(EXTRASIZE-1 downto 0);
    enable:   out std_logic_vector((2**BITS)-1 downto 0)
  );
  end component;

  component wbarb2_1 is
  generic (
    ADDRESS_HIGH: integer := maxIObit;
    ADDRESS_LOW: integer := maxIObit
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    -- Master 0 signals

    m0_wb_dat_o: out std_logic_vector(31 downto 0);
    m0_wb_dat_i: in std_logic_vector(31 downto 0);
    m0_wb_adr_i: in std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    m0_wb_sel_i: in std_logic_vector(3 downto 0);
    m0_wb_cti_i: in std_logic_vector(2 downto 0);
    m0_wb_we_i:  in std_logic;
    m0_wb_cyc_i: in std_logic;
    m0_wb_stb_i: in std_logic;
    m0_wb_ack_o: out std_logic;
    m0_wb_stall_o: out std_logic;

    -- Master 1 signals

    m1_wb_dat_o: out std_logic_vector(31 downto 0);
    m1_wb_dat_i: in std_logic_vector(31 downto 0);
    m1_wb_adr_i: in std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    m1_wb_sel_i: in std_logic_vector(3 downto 0);
    m1_wb_cti_i: in std_logic_vector(2 downto 0);
    m1_wb_we_i:  in std_logic;
    m1_wb_cyc_i: in std_logic;
    m1_wb_stb_i: in std_logic;
    m1_wb_ack_o: out std_logic;
    m1_wb_stall_o: out std_logic;

    -- Slave signals

    s0_wb_dat_i: in std_logic_vector(31 downto 0);
    s0_wb_dat_o: out std_logic_vector(31 downto 0);
    s0_wb_adr_o: out std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    s0_wb_sel_o: out std_logic_vector(3 downto 0);
    s0_wb_cti_o: out std_logic_vector(2 downto 0);
    s0_wb_we_o:  out std_logic;
    s0_wb_cyc_o: out std_logic;
    s0_wb_stb_o: out std_logic;
    s0_wb_ack_i: in std_logic;
    s0_wb_stall_i: in std_logic
  );
  end component;

  component wbbootloadermux is
  generic (
    address_high: integer:=31;
    address_low: integer:=2
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    sel:        in std_logic;
    -- Master 

    m_wb_dat_o: out std_logic_vector(31 downto 0);
    m_wb_dat_i: in std_logic_vector(31 downto 0);
    m_wb_adr_i: in std_logic_vector(address_high downto address_low);
    m_wb_sel_i: in std_logic_vector(3 downto 0);
    m_wb_cti_i: in std_logic_vector(2 downto 0);
    m_wb_we_i:  in std_logic;
    m_wb_cyc_i: in std_logic;
    m_wb_stb_i: in std_logic;
    m_wb_ack_o: out std_logic;
    m_wb_stall_o: out std_logic;

    -- Slave 0 signals

    s0_wb_dat_i: in std_logic_vector(31 downto 0);
    s0_wb_dat_o: out std_logic_vector(31 downto 0);
    s0_wb_adr_o: out std_logic_vector(address_high downto address_low);
    s0_wb_sel_o: out std_logic_vector(3 downto 0);
    s0_wb_cti_o: out std_logic_vector(2 downto 0);
    s0_wb_we_o:  out std_logic;
    s0_wb_cyc_o: out std_logic;
    s0_wb_stb_o: out std_logic;
    s0_wb_ack_i: in std_logic;
    s0_wb_stall_i: in std_logic;

    -- Slave 1 signals

    s1_wb_dat_i: in std_logic_vector(31 downto 0);
    s1_wb_dat_o: out std_logic_vector(31 downto 0);
    s1_wb_adr_o: out std_logic_vector(11 downto 2);
    s1_wb_sel_o: out std_logic_vector(3 downto 0);
    s1_wb_cti_o: out std_logic_vector(2 downto 0);
    s1_wb_we_o:  out std_logic;
    s1_wb_cyc_o: out std_logic;
    s1_wb_stb_o: out std_logic;
    s1_wb_ack_i: in std_logic;
    s1_wb_stall_i: in std_logic

  );
  end component wbbootloadermux;

  component wb_master_np_to_slave_p is
  generic (
    ADDRESS_HIGH: integer := maxIObit;
    ADDRESS_LOW: integer := maxIObit
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    -- Master signals

    m_wb_dat_o: out std_logic_vector(31 downto 0);
    m_wb_dat_i: in std_logic_vector(31 downto 0);
    m_wb_adr_i: in std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    m_wb_sel_i: in std_logic_vector(3 downto 0);
    m_wb_cti_i: in std_logic_vector(2 downto 0);
    m_wb_we_i:  in std_logic;
    m_wb_cyc_i: in std_logic;
    m_wb_stb_i: in std_logic;
    m_wb_ack_o: out std_logic;

    -- Slave signals

    s_wb_dat_i: in std_logic_vector(31 downto 0);
    s_wb_dat_o: out std_logic_vector(31 downto 0);
    s_wb_adr_o: out std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    s_wb_sel_o: out std_logic_vector(3 downto 0);
    s_wb_cti_o: out std_logic_vector(2 downto 0);
    s_wb_we_o:  out std_logic;
    s_wb_cyc_o: out std_logic;
    s_wb_stb_o: out std_logic;
    s_wb_ack_i: in std_logic;
    s_wb_stall_i: in std_logic
  );
  end component;

  component generic_sp_ram is
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
    doa:              out std_logic_vector(data_bits-1 downto 0)
  );
  end component;

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

  end component generic_dp_ram;

  component zpuino_stack is
  port (
    stack_clk: in std_logic;
    stack_a_read: out std_logic_vector(wordSize-1 downto 0);
    stack_b_read: out std_logic_vector(wordSize-1 downto 0);
    stack_a_write: in std_logic_vector(wordSize-1 downto 0);
    stack_b_write: in std_logic_vector(wordSize-1 downto 0);
    stack_a_writeenable: in std_logic_vector(3 downto 0);
    stack_a_enable: in std_logic;
    stack_b_writeenable: in std_logic_vector(3 downto 0);
    stack_b_enable: in std_logic;
    stack_a_addr: in std_logic_vector(stackSize_bits-1 downto 2);
    stack_b_addr: in std_logic_vector(stackSize_bits-1 downto 2)
  );
  end component zpuino_stack;

  component zpuino_debug_core is
  port (
    clk: in std_logic;
    rst: in std_logic;

    dbg_in:         in zpu_dbg_out_type;
    dbg_out:        out zpu_dbg_in_type;
    dbg_reset:      out std_logic;

    jtag_data_chain_out: out std_logic_vector(98 downto 0);
    jtag_ctrl_chain_in: in std_logic_vector(11 downto 0)

  );
  end component;

  component wbmux2 is
  generic (
    select_line: integer;
    address_high: integer:=31;
    address_low: integer:=2
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    -- Master 

    m_wb_dat_o: out std_logic_vector(31 downto 0);
    m_wb_dat_i: in std_logic_vector(31 downto 0);
    m_wb_adr_i: in std_logic_vector(address_high downto address_low);
    m_wb_sel_i: in std_logic_vector(3 downto 0);
    m_wb_cti_i: in std_logic_vector(2 downto 0);
    m_wb_we_i:  in std_logic;
    m_wb_cyc_i: in std_logic;
    m_wb_stb_i: in std_logic;
    m_wb_ack_o: out std_logic;

    -- Slave 0 signals

    s0_wb_dat_i: in std_logic_vector(31 downto 0);
    s0_wb_dat_o: out std_logic_vector(31 downto 0);
    s0_wb_adr_o: out std_logic_vector(address_high downto address_low);
    s0_wb_sel_o: out std_logic_vector(3 downto 0);
    s0_wb_cti_o: out std_logic_vector(2 downto 0);
    s0_wb_we_o:  out std_logic;
    s0_wb_cyc_o: out std_logic;
    s0_wb_stb_o: out std_logic;
    s0_wb_ack_i: in std_logic;

    -- Slave 1 signals

    s1_wb_dat_i: in std_logic_vector(31 downto 0);
    s1_wb_dat_o: out std_logic_vector(31 downto 0);
    s1_wb_adr_o: out std_logic_vector(address_high downto address_low);
    s1_wb_sel_o: out std_logic_vector(3 downto 0);
    s1_wb_cti_o: out std_logic_vector(2 downto 0);
    s1_wb_we_o:  out std_logic;
    s1_wb_cyc_o: out std_logic;
    s1_wb_stb_o: out std_logic;
    s1_wb_ack_i: in std_logic
  );
  end component wbmux2;

  component wb_bootloader is
  port (
    wb_clk_i:   in std_logic;
    wb_rst_i:   in std_logic;

    wb_dat_o:   out std_logic_vector(31 downto 0);
    wb_adr_i:   in std_logic_vector(11 downto 2);
    wb_cyc_i:   in std_logic;
    wb_stb_i:   in std_logic;
    wb_ack_o:   out std_logic;
    wb_stall_o: out std_logic;

    wb2_dat_o:   out std_logic_vector(31 downto 0);
    wb2_adr_i:   in std_logic_vector(11 downto 2);
    wb2_cyc_i:   in std_logic;
    wb2_stb_i:   in std_logic;
    wb2_ack_o:   out std_logic;
    wb2_stall_o: out std_logic
  );
  end component;

  component zpuino_pwmaudio is
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
  end component;

end package zpuinopkg;
