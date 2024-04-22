------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------   
-- Entity:      ahb2axib
-- File:        ahb2axib.vhd
-- Author:      Alen Bardizbanyan - Cobham Gaisler AB
-- Description: AHB to AXI(3/4)-generic bridge
------------------------------------------------------------------------------ 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.config_types.all;
use grlib.config.all;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
library techmap;
use techmap.gencomp.all;
library gaisler;
use gaisler.axi.all;

entity ahb2axib is
  generic (
    memtech         : integer                       := 0;
    hindex          : integer                       := 0;
    aximid          : integer range 0 to 15         := 0;  --AXI master transaction ID
    wbuffer_num     : integer range 1 to 256        := 8;
    rprefetch_num   : integer range 1 to 256        := 8;
    always_secure   : integer range 0 to 1          := 1;  --0->not secure; 1->secure
    axi4            : integer range 0 to 1          := 0;
    endianness_mode : integer range 0 to 1          := 0;  --0->BE(AHB)-to-BE(AXI)
                                                           --1->BE(AHB)-to-LE(AXI)
    narrow_acc_mode : integer range 0 to 1          := 0;  --0->each beat in narrow burst
                                                           --treated as single access
                                                           --1->narrow burst directly
                                                           --transalted to AXI
                                                           --supported only in BE-to-BE
    -- scantest
    scantest        : integer                       := 0;
    -- GRLIB plug&play configuration
    vendor          : integer                       := VENDOR_GAISLER;
    device          : integer                       := GAISLER_AHB2AXI;
    bar0            : integer range 0 to 1073741823 := 0;
    bar1            : integer range 0 to 1073741823 := 0;
    bar2            : integer range 0 to 1073741823 := 0;
    bar3            : integer range 0 to 1073741823 := 0
    );
  port (
    rst   : in  std_logic;
    clk   : in  std_logic;
    ahbsi : in  ahb_slv_in_type;
    ahbso : out ahb_slv_out_type;
    aximi : in  axi_somi_type;
    aximo : out axix_mosi_type
    );  
end ahb2axib;


architecture rtl of ahb2axib is


  constant ASYNC_RESET : boolean := GRLIB_CONFIG_ARRAY(grlib_async_reset_enable) = 1;

  constant wbuf_num_ptwo  : integer := power_of_two(wbuffer_num);
  constant read_pref_ptwo : integer := power_of_two(rprefetch_num);

  constant wbuf_boundary_high : integer
 := log2(wbuf_num_ptwo)+(log2(AXIDW/8)-1);
  constant wbuf_addr_zero : std_logic_vector(wbuf_boundary_high downto 0)
 := (others => '0');

  constant max_prefsize_vector : unsigned(log2(read_pref_ptwo)-1 downto 0)
 := (others => '1');

  --functions to allow a write/read buffer length of 1
  function wbuf_zero(
    wbuf : in integer)
    return integer is
    variable ret_val : integer;
  begin
    ret_val := 0;
    if wbuf = 1 then
      ret_val := 1;
    end if;
    return ret_val;
  end wbuf_zero;

  function abits(
    wbufn : in integer)
    return integer is
    variable ret_val : integer;
  begin
    ret_val := 1;

    if wbufn > 2 then
      ret_val := log2(wbufn);
    end if;
    return ret_val;
  end abits;

  constant read_pref_addr_high : integer := log2(AXIDW/8)+log2(read_pref_ptwo)
                                            -1+wbuf_zero(read_pref_ptwo);

  type ahbm_to_axis_state is (idle, read, write);

  type ahb_slv_out_local_type is record
    hready : std_ulogic;                          -- transfer done
    hresp  : std_logic_vector(1 downto 0);        -- response type
    hrdata : std_logic_vector(AHBDW-1 downto 0);  -- read data bus
  end record;

  type ahb_slv_in_local_type is record
    haddr  : std_logic_vector(31 downto 0);       -- address bus (byte)
    hwrite : std_ulogic;                          -- read/write
    htrans : std_logic_vector(1 downto 0);        -- transfer type
    hsize  : std_logic_vector(2 downto 0);        -- transfer size
    hburst : std_logic_vector(2 downto 0);        -- burst type
    hwdata : std_logic_vector(AHBDW-1 downto 0);  -- write data bus
    hprot  : std_logic_vector(3 downto 0);        -- protection control
  end record;

  type axi_rwc_local_type is record
    addr  : std_logic_vector (31 downto 0);
    len   : std_logic_vector (7 downto 0);
    size  : std_logic_vector (2 downto 0);
    burst : std_logic_vector (1 downto 0);
    cache : std_logic_vector (3 downto 0);
    prot  : std_logic_vector (2 downto 0);
  end record;


  type reg_type is record
    state                 : ahbm_to_axis_state;
    aximout               : axix_mosi_type;
    ahbsout               : ahb_slv_out_local_type;
    b2b                   : std_logic;  --back-2-back AHB operation
    write_op              : std_logic;  --write operation
    rburst_valid          : std_logic;  --read burst on the AHB side is still ongoing
    ahbin_reg_b2b         : ahb_slv_in_local_type;
    ahbin_reg_write       : ahb_slv_in_local_type;
    addr_temp             : std_logic_vector(31 downto 0);
    addr_strb             : std_logic_vector(log2(AXIDW/8)-1 downto 0);
    rerror                : std_logic;
    rlast_reg             : std_logic;
    rlast_reg_delayed     : std_logic;
    last_latched_word     : std_logic_vector(AXIDW-1 downto 0);
    wr_ptr                : unsigned(log2(wbuf_num_ptwo) downto 0);
    rd_ptr                : unsigned(log2(wbuf_num_ptwo) downto 0);
    rd_mem_ptr            : unsigned(log2(wbuf_num_ptwo) downto 0);
    mem_dout_latched      : std_logic_vector(AXIDW-1 downto 0);
    ren                   : std_logic;
    initial_wbuf_fill     : std_logic;
    wr_transmitting       : std_logic;  --write operation has started on AXI
    wr_transmit_req       : std_logic;
    write_length          : unsigned(log2(wbuf_num_ptwo)-1 downto 0);  --wr_ptr-1
    write_continues       : std_logic;
    write_continues_temp  : std_logic;
    write_error           : std_logic;
    write_data_finished   : std_logic;
    write_verified        : std_logic;
    propagate_werror      : std_logic;
    wbuf_boundary_crossed : std_logic;
  end record;
  
  constant rac_reset : axix_ar_mosi_type := (id    => (others => '0'), addr => (others => '0'),
                                             len   => (others => '0'), size => (others => '0'),
                                             burst => (others => '0'), lock => (others => '0'),
                                             cache => (others => '0'), prot => (others => '0'),
                                             valid => '0', qos => (others => '0'));

  constant rdc_reset : axi_r_mosi_type := (ready => '0');

  constant wac_reset : axix_aw_mosi_type := (id    => (others => '0'), addr => (others => '0'),
                                             len   => (others => '0'), size => (others => '0'),
                                             burst => (others => '0'), lock => (others => '0'),
                                             cache => (others => '0'), prot => (others => '0'),
                                             valid => '0', qos => (others => '0'));

  constant wdc_reset : axi_w_mosi_type := (id    => (others => '0'), data => (others => '0'),
                                           strb  => (others => '0'), last => '0',
                                           valid => '0');

  constant wrc_reset : axi_b_mosi_type := (ready => '0');

  constant aximout_res_t : axix_mosi_type := (
    aw => wac_reset,
    w  => wdc_reset,
    b  => wrc_reset,
    ar => rac_reset,
    r  => rdc_reset);

  constant ahbsout_reset : ahb_slv_out_local_type :=
    (hready => '1', hresp => "00", hrdata => (others => '0'));

  constant ahbin_reg_b2b_res_t : ahb_slv_in_local_type :=
    (haddr => (others => '0'), hwrite => '0', htrans => (others => '0'),
     hsize => (others => '0'), hburst => (others => '0'), hwdata => (others => '0'),
     hprot => (others => '0'));


  constant RES_T : reg_type := (
    state                 => idle,
    aximout               => aximout_res_t,
    ahbsout               => ahbsout_reset,
    b2b                   => '0',
    write_op              => '0',
    rburst_valid          => '0',
    ahbin_reg_b2b         => ahbin_reg_b2b_res_t,
    ahbin_reg_write       => ahbin_reg_b2b_res_t,
    addr_temp             => (others => '0'),
    addr_strb             => (others => '0'),
    rerror                => '0',
    rlast_reg             => '0',
    rlast_reg_delayed     => '0',
    last_latched_word     => (others => '0'),
    wr_ptr                => (others => '0'),
    rd_ptr                => (others => '0'),
    rd_mem_ptr            => (others => '0'),
    ren                   => '0',
    mem_dout_latched      => (others => '0'),
    initial_wbuf_fill     => '0',
    wr_transmitting       => '0',
    wr_transmit_req       => '0',
    write_length          => (others => '0'),
    write_continues       => '0',
    write_continues_temp  => '0',
    write_error           => '0',
    write_data_finished   => '0',
    write_verified        => '0',
    propagate_werror      => '0',
    wbuf_boundary_crossed => '0'
    );


  signal arst               : std_ulogic;
  signal r, rin             : reg_type;
  signal mem_ren, mem_wen   : std_logic;
  signal mem_dout, mem_din  : std_logic_vector(AXIDW-1 downto 0);
  signal rd_ptr_i, wr_ptr_i : std_logic_vector(log2(wbuf_num_ptwo)-1+wbuf_zero(wbuf_num_ptwo) downto 0);
  
begin

  -- pragma translate_off
  assert not(endianness_mode = 1 and narrow_acc_mode = 1) report "Direct narrow burst propagation is currently not supported when big endian AHB to little endian AXI translation is enbled." severity error;
  -- pragma translate_on

  arst <= ahbsi.testrst when (ASYNC_RESET and scantest /= 0 and ahbsi.testen /= '0') else
          rst when ASYNC_RESET else
          '1';
  
  wbuffer : syncram_2p
    generic map (
      tech   => memtech,
      abits  => abits(wbuf_num_ptwo),
      dbits  => AXIDW,
      sepclk => 0,
      wrfst  => 0,
      testen => 0)
    port map (
      rclk     => clk,
      renable  => mem_ren,
      raddress => rd_ptr_i,
      dataout  => mem_dout,
      wclk     => clk,
      write    => mem_wen,
      waddress => wr_ptr_i,
      datain   => mem_din);

  comb : process(r, ahbsi, aximi, mem_dout)
    variable v                       : reg_type;
    variable wsample_ahb             : std_logic;
    variable wsample_axi             : std_logic;
    variable rsample                 : std_logic;
    variable b2bsample               : std_logic;
    variable b2b2wrsample            : std_logic;
    variable wsample_onlyaddr        : std_logic;
    variable rdata_avail             : std_logic;
    variable rdata_avail_noerror     : std_logic;
    variable rdata_error             : std_logic;
    variable ahbin_mux               : ahb_slv_in_local_type;
    variable axi_mux                 : axi_rwc_local_type;
    variable wr_ptr_num              : unsigned(log2(wbuf_num_ptwo) downto 0);
    variable wen, ren                : std_logic;
    variable prefetch_count          : std_logic_vector(max_len(axi4)-1 downto 0);
    variable prefetch_count_temp     : unsigned(log2(read_pref_ptwo)-1 downto 0);
    variable prefetch_count_nshifted : unsigned(read_pref_addr_high+1 downto 0);
    variable prefetch_count_shifted  : unsigned(read_pref_addr_high+1 downto 0);
    variable axi_len                 : std_logic_vector(7 downto 0);
    variable pref_unaligned          : std_logic;
    variable pref_naddress_unaligned : std_logic;
    variable narrow_boundary_limit   : std_logic;
    variable wbuf_boundary           : std_logic;
    variable vrd_ptr_i, vwr_ptr_i    : std_logic_vector(log2(wbuf_num_ptwo)-1+wbuf_zero(wbuf_num_ptwo) downto 0);
    variable haddr_endianness        : std_logic_vector(31 downto 0);
    variable ahbso_hrdata            : std_logic_vector(AHBDW-1 downto 0);
    variable mem_din_v               : std_logic_vector(AHBDW-1 downto 0);
    variable slvcfg                  : ahb_config_type;
    variable tbar                    : std_logic_vector(29 downto 0);
  begin
    
    v := r;

    wsample_ahb             := '0';
    wsample_axi             := '0';
    rsample                 := '0';
    b2bsample               := '0';
    b2b2wrsample            := '0';
    wsample_onlyaddr        := '0';
    wen                     := '0';
    ren                     := '0';
    rdata_avail             := '0';
    rdata_avail_noerror     := '0';
    rdata_error             := '0';
    wr_ptr_num              := (others => '0');
    axi_len                 := (others => '0');
    pref_unaligned          := '0';
    pref_naddress_unaligned := '0';
    wbuf_boundary           := '0';
    vwr_ptr_i               := (others => '0');
    vrd_ptr_i               := (others => '0');
    prefetch_count          := (others => '0');
    prefetch_count_temp     := (others => '0');
    narrow_boundary_limit   := '0';
    prefetch_count_nshifted := (others => '0');
    prefetch_count_shifted  := (others => '0');

    haddr_endianness := ahbsi.haddr;
    if endianness_mode = 1 then
      haddr_endianness(log2(AXIDW/8)-1 downto 0) :=
        be_to_le_address(AXIDW, ahbsi.haddr(log2(AXIDW/8)-1 downto 0), ahbsi.hsize);
    end if;


    if r.b2b = '0' and r.write_op = '0' then
      --read operation
      ahbin_mux.haddr  := haddr_endianness;
      ahbin_mux.hwrite := ahbsi.hwrite;
      ahbin_mux.htrans := ahbsi.htrans;
      ahbin_mux.hburst := ahbsi.hburst;
      ahbin_mux.hwdata := ahbsi.hwdata;
      ahbin_mux.hprot  := ahbsi.hprot;
      ahbin_mux.hsize  := ahbsi.hsize;
    elsif r.write_op = '1' then
      --write operation
      ahbin_mux.haddr  := r.ahbin_reg_write.haddr;
      ahbin_mux.hwrite := r.ahbin_reg_write.hwrite;
      ahbin_mux.htrans := r.ahbin_reg_write.htrans;
      ahbin_mux.hburst := r.ahbin_reg_write.hburst;
      ahbin_mux.hwdata := r.ahbin_reg_write.hwdata;
      ahbin_mux.hprot  := r.ahbin_reg_write.hprot;
      ahbin_mux.hsize  := r.ahbin_reg_write.hsize;
    else
      --b2b operation (can be read or write)
      ahbin_mux.haddr  := r.ahbin_reg_b2b.haddr;
      ahbin_mux.hwrite := r.ahbin_reg_b2b.hwrite;
      ahbin_mux.htrans := r.ahbin_reg_b2b.htrans;
      ahbin_mux.hburst := r.ahbin_reg_b2b.hburst;
      ahbin_mux.hwdata := r.ahbin_reg_b2b.hwdata;
      ahbin_mux.hprot  := r.ahbin_reg_b2b.hprot;
      ahbin_mux.hsize  := r.ahbin_reg_b2b.hsize;
    end if;

    axi_mux.cache(0) := ahbin_mux.hprot(2);
    axi_mux.cache(1) := ahbin_mux.hprot(3);
    axi_mux.prot(0)  := ahbin_mux.hprot(1);
    axi_mux.prot(2)  := not(ahbin_mux.hprot(0));
    --wrapping bursts are currently not supported
    axi_mux.burst    := burst_type_translate(ahbin_mux.hburst);
    axi_mux.addr     := ahbin_mux.haddr;
    axi_mux.size     := ahbin_mux.hsize;
    axi_mux.len      := (others => '0');


    if always_secure = 1 then
      v.aximout.ar.prot(1) := '0';
    else
      v.aximout.ar.prot(1) := '1';
    end if;

    --locked access disabled
    v.aximout.ar.lock := (others => '0');
    v.aximout.aw.lock := (others => '0');

    v.aximout.ar.cache(2) := '0';
    v.aximout.ar.cache(3) := '0';

    --AXI ID for write operations
    v.aximout.aw.id := std_logic_vector(to_unsigned(aximid, AXI_ID_WIDTH));
    v.aximout.w.id  := std_logic_vector(to_unsigned(aximid, AXI_ID_WIDTH));
    --AXI ID for read operations
    v.aximout.ar.id := std_logic_vector(to_unsigned(aximid, AXI_ID_WIDTH));

    v.ahbsout.hresp := HRESP_OKAY;

    if ahbsi.haddr(wbuf_boundary_high downto 0) = wbuf_addr_zero then
      wbuf_boundary := '1';
    end if;


    if endianness_mode = 1 or narrow_acc_mode = 0 then
      for i in log2(AXIDW/8) to read_pref_addr_high loop
        if (ahbin_mux.haddr(i) = '1') and (full_dwsize(AXIDW) = ahbin_mux.hsize) then
          pref_unaligned := '1';
        end if;
      end loop;

      prefetch_count_temp := max_prefsize_vector-
                             unsigned(ahbin_mux.haddr(read_pref_addr_high downto log2(AXIDW/8)));
      prefetch_count                                  := (others => '0');
      prefetch_count(log2(read_pref_ptwo)-1 downto 0) := std_logic_vector(prefetch_count_temp);
      
    else

      
      for i in 0 to read_pref_addr_high loop
        if i <= (read_pref_addr_high-to_integer(unsigned((full_dwsize(AXIDW))))
                 +to_integer(unsigned((ahbin_mux.hsize)))) then
          if ahbin_mux.haddr(i) = '1' then
            pref_naddress_unaligned := '1';
          end if;
        end if;
      end loop;  -- i

      narrow_boundary_limit := '1';
      for i in read_pref_addr_high downto 0 loop
        if i > (read_pref_addr_high-to_integer(unsigned((full_dwsize(AXIDW))))
                +to_integer(unsigned((ahbin_mux.hsize)))) then
          if ahbin_mux.haddr(i) = '0' then
            narrow_boundary_limit := '0';
          end if;
        end if;
      end loop;  -- i

      pref_unaligned := pref_naddress_unaligned and narrow_boundary_limit;

      prefetch_count_nshifted := to_unsigned(read_pref_ptwo*(AXIDW/8), read_pref_addr_high+2)-
                                 unsigned(ahbin_mux.haddr(read_pref_addr_high downto 0));
      prefetch_count_shifted := prefetch_count_nshifted
                                srl to_integer(unsigned(ahbin_mux.hsize));
      prefetch_count                                  := (others => '0');
      prefetch_count(log2(read_pref_ptwo)-1 downto 0) :=
        std_logic_vector(prefetch_count_shifted(log2(read_pref_ptwo)-1 downto 0)-1);
      
      
    end if;

    --read prefetch should always end in boundaries of prefetch amount
    --this ensures minimum latency (prevents additional delays from memories)
    --and solves the boundary crossing problem implicitly
    --because prefecth amount is power two
    if (pref_unaligned = '1') and (read_pref_ptwo > 1) then
      axi_len(max_len(axi4)-1 downto 0) := prefetch_count;
    else
      axi_len(max_len(axi4)-1 downto 0) := std_logic_vector(to_unsigned(read_pref_ptwo-1, max_len(axi4)));
    end if;

    case r.state is
      
      when idle =>

        v.ahbsout.hready        := '1';
        v.rburst_valid          := '1';
        v.wr_transmitting       := '0';
        v.aximout.r.ready       := '0';
        v.write_error           := '0';
        v.write_verified        := '0';
        v.write_data_finished   := '0';
        v.wbuf_boundary_crossed := '0';
        v.rlast_reg             := '0';
        v.rlast_reg_delayed     := '0';
        v.write_op              := '0';

        if (ahbsi.htrans(1) = '1' and ahbsi.hready = '1' and ahbsi.hsel(hindex) = '1')
          or r.b2b = '1' then

          v.ahbsout.hready := '0';

          if r.b2b = '1' then
            v.b2b := '0';
          end if;

          if ahbin_mux.hwrite = '0' then
            --read operation
            v.state            := read;
            rsample            := '1';
            v.aximout.ar.valid := '1';
            v.addr_strb        := ahbin_mux.haddr(log2(AXIDW/8)-1 downto 0);

            if ahbin_mux.hburst = HBURST_INCR then
              --undefined length read burst
              axi_mux.len := axi_len;
            else
              axi_mux.len := "0000"&burst_length_translate(ahbin_mux.hburst);
            end if;

            if endianness_mode = 1 or narrow_acc_mode = 0 then
              if (full_dwsize(AXIDW) /= axi_mux.size) then
                --each beat in the narrow burst treated as single access
                axi_mux.len := (others => '0');
              end if;
            end if;
            
          else
            --write operation
            v.state             := write;
            v.initial_wbuf_fill := '1';
            v.write_op          := '1';

            if r.b2b = '1' then
              b2b2wrsample := '1';
            else
              wsample_ahb := '1';
            end if;

            v.wr_transmitting      := '0';
            v.wr_transmit_req      := '0';
            v.write_continues      := '0';
            v.write_continues_temp := '0';
            v.wr_ptr               := (others => '0');
            v.rd_ptr               := (others => '0');
            v.rd_mem_ptr           := (others => '0');
          end if;
          
        end if;

      when read =>

        v.rlast_reg := aximi.r.last and r.aximout.r.ready and aximi.r.valid;

        if aximi.ar.ready = '1' then
          v.aximout.ar.valid := '0';
          v.aximout.r.ready  := '1';
        end if;


        if ((ahbsi.hsel(hindex) = '0' or
             ((ahbsi.htrans = HTRANS_IDLE or ahbsi.htrans = HTRANS_NONSEQ) and (ahbsi.hsel(hindex) = '1')))
            and ahbsi.hready = '1') then
          v.rburst_valid := '0';
        end if;

        rdata_error         := aximi.r.resp(1) and v.rburst_valid;
        rdata_avail         := aximi.r.valid and r.aximout.r.ready and r.rburst_valid;
        rdata_avail_noerror := rdata_avail and not(rdata_error);

        --hready is asserted if undefined length burst is finished but
        --prefetching continous. If a new transaction encountered during that
        --period hready is deasserted and the new trans is sampled. This
        --also implicitly handles early burst termination of fixed lenght reads.
        v.ahbsout.hready := rdata_avail_noerror or (not(r.rburst_valid) and not(r.b2b)) or r.rerror;

        if rdata_avail = '1' then
          if CORE_ACDM /= 0 then
            --IF ACMD is enabled on the ahbctrl then there is no need
            --for read replication on the bridge
            v.ahbsout.hrdata := aximi.r.data;
          else
            if (full_dwsize(AXIDW) = r.aximout.ar.size) or AXIDW <= 32 then
              --read replication only applies if data-width is > 32 and the
              --access size is not equal to data-bus width
              v.ahbsout.hrdata := aximi.r.data;
            else
              v.ahbsout.hrdata := read_replicate(aximi.r.data, r.addr_strb, r.aximout.ar.size);
            end if;

            if (narrow_acc_mode = 1 and endianness_mode = 0) then
              if (unsigned('0'&r.addr_strb) + size_incr(r.aximout.ar.size, AXIDW))
                 = AXIDW/8 then
                v.addr_strb := (others => '0');
              else
                v.addr_strb := std_logic_vector(unsigned(r.addr_strb) +
                                                size_incr(r.aximout.ar.size, AXIDW));                
              end if;
            end if;
            
          end if;
          
        end if;

        if (ahbsi.htrans = HTRANS_NONSEQ) and (ahbsi.hsel(hindex) = '1') and (ahbsi.hready = '1') then
          v.b2b            := '1';
          b2bsample        := '1';
          v.ahbsout.hready := '0';
        end if;

        --error propagation cycle 1 with hready deasserted
        if rdata_error = '1' and aximi.r.valid = '1' then
          v.rerror          := '1';
          v.aximout.r.ready := '0';
          v.ahbsout.hresp   := HRESP_ERROR;
          --if error is encountered during the last beat of AXI burst
          --delay the last signal because hready will be deasserted
          --for one cycle
          if v.rlast_reg = '1' then
            v.rlast_reg         := '0';
            v.rlast_reg_delayed := '1';
          end if;
        end if;

        --error propagation cycle 2 with hready asserted
        if r.rerror = '1' then
          v.aximout.r.ready := '1';
          v.ahbsout.hresp   := HRESP_ERROR;
          v.rerror          := '0';
          if r.rlast_reg_delayed = '1' then
            v.rlast_reg_delayed := '0';
            v.rlast_reg         := '1';
          end if;
        end if;

        if r.rlast_reg = '1' then
          v.aximout.r.ready := '0';
          --AXI transaction finished
          if ((ahbsi.htrans = HTRANS_SEQ and ahbsi.hsel(hindex) = '1' and ahbsi.hready = '1')
              and (r.rburst_valid = '1')) then
            --undefined length read burst continous
            rsample            := '1';
            v.aximout.ar.valid := '1';
            axi_mux.len        := axi_len;
            v.addr_strb        := ahbin_mux.haddr(log2(AXIDW/8)-1 downto 0);

            if endianness_mode = 1 or narrow_acc_mode = 0 then
              if (full_dwsize(AXIDW) /= axi_mux.size) then
                --each beat in the narrow burst treated as single access
                axi_mux.len := (others => '0');
              end if;
            end if;
          elsif ((ahbsi.htrans = HTRANS_NONSEQ) and (ahbsi.hsel(hindex) = '1' and ahbsi.hready = '1')) then
            --b2b operation
            if r.b2b = '0' then
              v.b2b     := '1';
              b2bsample := '1';
            end if;
            v.state := idle;
          else
            v.state := idle;
            if r.b2b = '0' then
              v.ahbsout.hready := '1';
            end if;
          end if;
        end if;

        
      when write =>
        
        v.ahbsout.hready := '1';

        if r.ren = '1' then
          --latch the word that is read from syncram. It is used
          --if the write interface stalls on the AXI side
          v.mem_dout_latched := mem_dout;
        end if;

        --read a word from the buffer if currently in AXI write transmission mode
        --Start to read once cycle before asserting wvalid and read a new word
        --as soon as write channle is not stalled. If write channel is stalled
        --stall reading from syncram also and the last word is kept in r.mem_dout_latched
        v.ren := ((aximi.w.ready and r.aximout.w.valid and not(r.aximout.w.last)) or
                  (not(r.aximout.w.valid) and not(r.aximout.b.ready)))
                 and r.wr_transmitting;

        if v.ren = '1' then
          --rd_mem_ptr is always ahead of rd_ptr to make sure
          --the same address will not be written and read in the syncram
          --during the same cycle
          v.rd_mem_ptr := r.rd_mem_ptr+1;
        end if;

        if r.aximout.aw.valid = '1' and aximi.aw.ready = '1' then
          --write request acknowledged
          v.aximout.aw.valid := '0';
        end if;


        if r.wr_transmitting = '1' then
          --currently an AXI write transaction is ongoing
          
          if (r.write_data_finished = '0') then
            --there are still words left to be written in the AXI write burst
            
            v.aximout.w.valid := '1';

            --either the initial data is put to the write channel
            --or it is a continouation during burst
            if (aximi.w.ready = '1' or r.aximout.w.valid = '0') then

              --increment read pointer so that new data can be latched to the
              --write bffer
              v.rd_ptr := r.rd_ptr+1;

              if r.rd_ptr = unsigned(r.aximout.aw.len) then
                --last word in the AXI burst is going to be latched
                v.aximout.w.last      := '1';
                v.aximout.b.ready     := '1';
                v.write_data_finished := '1';
                if r.wbuf_boundary_crossed = '1' then
                  --if boundary is crossed set the rd_ptr to
                  --max wr_ptr+1 in order the buffering to continue
                  v.wbuf_boundary_crossed                  := '0';
                  v.rd_ptr(log2(wbuf_num_ptwo))            := '1';
                  v.rd_ptr(log2(wbuf_num_ptwo)-1 downto 0) := (others => '0');
                end if;
              end if;

              if (r.ren = '1') then
                v.aximout.w.data := mem_dout;
              else
                v.aximout.w.data := r.mem_dout_latched;
              end if;

              if (full_dwsize(AXIDW) = r.aximout.aw.size) then
                v.aximout.w.strb := (others => '1');
              else
                if (narrow_acc_mode = 1 and endianness_mode = 0) then
                  if (unsigned('0'&r.addr_strb) + size_incr(r.aximout.aw.size, AXIDW))
                     = AXIDW/8 then
                    v.addr_strb := (others => '0');
                  else
                    v.addr_strb := std_logic_vector(unsigned(r.addr_strb) +
                                                    size_incr(r.aximout.aw.size, AXIDW));                
                  end if;
                end if;
                v.aximout.w.strb := wstrb_generate(r.addr_strb, r.aximout.aw.size);
              end if;

            end if;
            
          end if;

          if aximi.w.ready = '1' and r.aximout.w.valid = '1' and r.write_data_finished = '1' then
            --last word is acknowledged
            v.aximout.w.valid := '0';
            v.aximout.w.last  := '0';
          end if;

          if r.aximout.b.ready = '1' and aximi.b.valid = '1' then
            --write verified
            v.write_verified  := '1';
            v.aximout.b.ready := '0';
            --Write error propagation is not supported in the bridge 
            --if (aximi.b.resp = XRESP_SLVERR or aximi.b.resp = XRESP_DECERR) then
            -- if r.write_error = '0' then
            --  v.write_error := '1';
            --end if;
            --end if;
          end if;

          if v.write_verified = '1' and r.aximout.w.valid = '0' and r.aximout.aw.valid = '0' then
            --transaction is finished with checking the correct order 
            if r.write_continues = '0' then
              --this was the last batch
              v.write_op        := '0';
              v.state           := idle;
              v.wr_transmitting := '0';
              v.ahbsout.hready  := '1';
            else
              --more beats exists in the burst continue
              --with clearing the r.wr_transmitting 
              v.wr_transmitting := '0';
              v.rd_mem_ptr      := (others => '0');
            end if;
          end if;

          
        end if;

        --initial buffer fill operation, or buffer fill operation while the
        --content is written to AXI transaction
        if ((r.rd_ptr > r.wr_ptr) and (r.write_continues_temp = '1'))
          or (r.initial_wbuf_fill = '1') then
          --there is space in the write buffer, assert HREADY so that
          --a new word can be read on the AHB write burst
          v.ahbsout.hready := '1';

          if (ahbsi.hready = '1') then
            --HREADY is asserted meaning either there is a valid data-word
            --and possibly a new transaction information
            wen                 := '1';
            v.wr_ptr            := r.wr_ptr+1;
            v.last_latched_word := ahbsi.hwdata;

            if (v.wr_ptr = r.rd_ptr) then
              --Clear HREADY in order not to read and write to the same entry
              --of the Syncram
              v.ahbsout.hready := '0';
            end if;

            if (v.wr_ptr = wbuf_num_ptwo)
              or (ahbsi.hsel(hindex) = '0' or ahbsi.htrans /= HTRANS_SEQ)
              or ((full_dwsize(AXIDW) /= ahbsi.hsize) and
                  (endianness_mode = 1 or narrow_acc_mode = 0)) 
              or (r.initial_wbuf_fill = '1' and wbuf_boundary = '1') then
              --end of the buffer reached
              --or less writes than buffer count
              --or wbuf boundar is going to be crossed so cut the burst efficiency
              --for narrow-sized burst each beat is treated as an independent
              --transaction on the AXI side
              v.wr_transmit_req   := '1';
              v.ahbsout.hready    := '0';
              v.initial_wbuf_fill := '0';
              wsample_onlyaddr    := '1';

              if (r.initial_wbuf_fill = '1') and (wbuf_boundary = '1')
                and (ahbsi.htrans = HTRANS_SEQ and ahbsi.hsel(hindex) = '1')
                and (full_dwsize(AXIDW) = ahbsi.hsize or
                     (narrow_acc_mode = 1 and endianness_mode = 0)) then
                --write buffer address boundary is crossed start the AXI transaction
                --here so that the start address of upcoming write batches
                --will be always aligned to the write buffer size boundary

                v.wbuf_boundary_crossed := '1';
              end if;

              if (ahbsi.htrans = HTRANS_SEQ and ahbsi.hsel(hindex) = '1') then
                --the AHB write burst is still ongoing mark it and start to
                --fill the buffer when there is space
                --the reason having a temp variable here is for not to deassert
                --r.write_continues directly which will cause the skip the last
                --batch of a long burst because exiting state checks that.
                v.write_continues_temp := '1';
              else
                v.write_continues_temp := '0';

                if (ahbsi.htrans = HTRANS_NONSEQ and ahbsi.hsel(hindex) = '1') then
                  --b2b operation
                  v.b2b     := '1';
                  b2bsample := '1';
                else
                  --current AHB transfer is finished so assert hready to wait for
                  --potential b2b operations
                  v.ahbsout.hready := '1';
                end if;
              end if;
            end if;
          end if;
          
        elsif r.write_continues_temp = '0' then
          --current AHB burst has finished

          if r.b2b = '0' then
            --waiting for a new transaction
            v.ahbsout.hready := '1';

            if (ahbsi.hready = '1' and ahbsi.hsel(hindex) = '1' and ahbsi.htrans(1) = '1') then
              v.b2b            := '1';
              b2bsample        := '1';
              v.ahbsout.hready := '0';
            end if;
          else
            --a new AHB transaction has been latched
            v.ahbsout.hready := '0';
          end if;
        else
          --There are still beats left in the AHB burst and
          --AXI burst is ongoing but there is no available
          --space in the write buffer to latch one more data beat
          --for the next AXI transaction
          --keep hready low until there is space available
          v.ahbsout.hready := '0';
        end if;

        axi_mux.len                                 := (others => '0');
        --axi length is encoded as length-1
        wr_ptr_num                                  := v.wr_ptr-1;
        axi_mux.len(log2(wbuf_num_ptwo)-1 downto 0) := std_logic_vector(wr_ptr_num(log2(wbuf_num_ptwo)-1 downto 0));

        if v.wr_transmit_req = '1' and r.wr_transmitting = '0' then
          v.wr_transmitting  := '1';
          v.wr_transmit_req  := '0';
          v.write_continues  := v.write_continues_temp;
          v.aximout.aw.valid := '1';
          v.rd_ptr           := (others => '0');
          v.rd_mem_ptr       := (others => '0');
          v.rd_mem_ptr(0)    := '1';
          v.ren              := '1';

          if (wsample_onlyaddr = '1') and (r.initial_wbuf_fill = '0') then
            --wsample and wsample_axi can be asserted at the same time
            --and the registered address must be forwarded in that case
            --if it is not the initial batch
            v.addr_strb := r.addr_temp(log2(AXIDW/8)-1 downto 0);
          else
            v.addr_strb := axi_mux.addr(log2(AXIDW/8)-1 downto 0);
          end if;

          if (v.wr_ptr = 1) then
            --single beat, the word is directly propagated
            --through the last word register
            v.ren := '0';
            --data must be stable
            if endianness_mode = 0 then
              v.mem_dout_latched := byte_swap(v.last_latched_word);
            else
              v.mem_dout_latched := v.last_latched_word;
            end if;
          end if;
          v.wr_ptr              := (others => '0');
          wsample_axi           := '1';
          v.write_data_finished := '0';
          v.write_verified      := '0';
        end if;
        
      when others => null;
                     
    end case;

    if wsample_axi = '1' then
      --sample for the write address channel
      if (wsample_onlyaddr = '1') and (r.initial_wbuf_fill = '0') then
        --wsample and wsample_axi can be asserted at the same time
        --and the registered address must be forwarded in that case
        --if it is not the initial batch
        v.aximout.aw.addr := r.addr_temp;
      else
        v.aximout.aw.addr := axi_mux.addr;
      end if;
      v.aximout.aw.size     := axi_mux.size;
      v.aximout.aw.len      := axi_mux.len;
      v.aximout.aw.burst    := axi_mux.burst;
      v.aximout.aw.prot(0)  := axi_mux.prot(0);
      v.aximout.aw.prot(2)  := axi_mux.prot(2);
      v.aximout.aw.cache(0) := axi_mux.cache(0);
      v.aximout.aw.cache(1) := axi_mux.cache(1);
    end if;

    if rsample = '1' then
      --sample for the read address channel
      v.aximout.ar.addr     := axi_mux.addr;
      v.aximout.ar.size     := axi_mux.size;
      v.aximout.ar.len      := axi_mux.len;
      v.aximout.ar.burst    := axi_mux.burst;
      v.aximout.ar.prot(0)  := axi_mux.prot(0);
      v.aximout.ar.prot(2)  := axi_mux.prot(2);
      v.aximout.ar.cache(0) := axi_mux.cache(0);
      v.aximout.ar.cache(1) := axi_mux.cache(1);
    end if;

    if wsample_ahb = '1' then
      v.ahbin_reg_write.haddr  := haddr_endianness;
      v.ahbin_reg_write.hwrite := ahbsi.hwrite;
      v.ahbin_reg_write.htrans := ahbsi.htrans;
      v.ahbin_reg_write.hburst := ahbsi.hburst;
      v.ahbin_reg_write.hwdata := ahbsi.hwdata;
      v.ahbin_reg_write.hprot  := ahbsi.hprot;
      v.ahbin_reg_write.hsize  := ahbsi.hsize;
    end if;

    if wsample_onlyaddr = '1' then
      v.addr_temp             := haddr_endianness;
      v.ahbin_reg_write.haddr := r.addr_temp;
    end if;

    if b2b2wrsample = '1' then
      --transfer b2b information to write_ahb
      --just before the write operation
      v.ahbin_reg_write.haddr  := r.ahbin_reg_b2b.haddr;
      v.ahbin_reg_write.hwrite := r.ahbin_reg_b2b.hwrite;
      v.ahbin_reg_write.htrans := r.ahbin_reg_b2b.htrans;
      v.ahbin_reg_write.hburst := r.ahbin_reg_b2b.hburst;
      v.ahbin_reg_write.hwdata := r.ahbin_reg_b2b.hwdata;
      v.ahbin_reg_write.hprot  := r.ahbin_reg_b2b.hprot;
      v.ahbin_reg_write.hsize  := r.ahbin_reg_b2b.hsize;
    end if;

    if b2bsample = '1' then
      --back-to-back sample
      v.ahbin_reg_b2b.haddr  := haddr_endianness;
      v.ahbin_reg_b2b.hwrite := ahbsi.hwrite;
      v.ahbin_reg_b2b.htrans := ahbsi.htrans;
      v.ahbin_reg_b2b.hburst := ahbsi.hburst;
      v.ahbin_reg_b2b.hwdata := ahbsi.hwdata;
      v.ahbin_reg_b2b.hprot  := ahbsi.hprot;
      v.ahbin_reg_b2b.hsize  := ahbsi.hsize;
    end if;

    if wbuf_num_ptwo = 1 then
      vwr_ptr_i := (others => '0');
      vrd_ptr_i := (others => '0');
    else
      vwr_ptr_i := std_logic_vector(r.wr_ptr(log2(wbuf_num_ptwo)-1 downto 0));
      vrd_ptr_i := std_logic_vector(r.rd_mem_ptr(log2(wbuf_num_ptwo)-1 downto 0));
    end if;

    rin <= v;

    ahbso.hready <= r.ahbsout.hready;
    if endianness_mode = 0 then
      ahbso_hrdata := byte_swap(r.ahbsout.hrdata);
    else
      ahbso_hrdata := r.ahbsout.hrdata;
    end if;
    ahbso.hrdata <= ahbso_hrdata;
    ahbso.hresp  <= r.ahbsout.hresp;
    ahbso.hsplit <= (others => '0');
    ahbso.hirq   <= (others => '0');
    ahbso.hindex <= hindex;

    aximo.ar      <= r.aximout.ar;
    aximo.aw      <= r.aximout.aw;
    aximo.b       <= r.aximout.b;
    aximo.r       <= r.aximout.r;
    aximo.w.id    <= r.aximout.w.id;
    aximo.w.data  <= r.aximout.w.data;
    aximo.w.strb  <= r.aximout.w.strb;
    aximo.w.last  <= r.aximout.w.last;
    aximo.w.valid <= r.aximout.w.valid;

    wr_ptr_i <= vwr_ptr_i;
    rd_ptr_i <= vrd_ptr_i;

    if endianness_mode = 0 then
      mem_din_v := byte_swap(ahbsi.hwdata);
    else
      mem_din_v := ahbsi.hwdata;
    end if;
    mem_din <= mem_din_v;
    mem_wen <= wen;
    mem_ren <= v.ren or r.ren;

    -- slave configuration info
    slvcfg                  := (others => (others => '0'));
    slvcfg(0)               := ahb_device_reg(vendor, device, 0, 0, 0);
    tbar                    := conv_std_logic_vector(bar0, 30);
    slvcfg(4)(31 downto 20) := tbar(29 downto 18); slvcfg(4)(17 downto 0) := tbar(17 downto 0);
    tbar                    := conv_std_logic_vector(bar1, 30);
    slvcfg(5)(31 downto 20) := tbar(29 downto 18); slvcfg(5)(17 downto 0) := tbar(17 downto 0);
    tbar                    := conv_std_logic_vector(bar2, 30);
    slvcfg(6)(31 downto 20) := tbar(29 downto 18); slvcfg(6)(17 downto 0) := tbar(17 downto 0);
    tbar                    := conv_std_logic_vector(bar3, 30);
    slvcfg(7)(31 downto 20) := tbar(29 downto 18); slvcfg(7)(17 downto 0) := tbar(17 downto 0);
    ahbso.hconfig           <= slvcfg;
    
  end process;


  syncregs : if not ASYNC_RESET generate
    regs : process(clk)
    begin
      if rising_edge(clk) then
        r <= rin;
        if rst = '0' then
          r <= RES_T;
        end if;
      end if;
    end process;
  end generate;

  asyncregs : if ASYNC_RESET generate
    regs : process(arst, clk)
    begin
      if arst = '0' then
        r <= RES_T;
      elsif rising_edge(clk) then
        r <= rin;
      end if;
    end process;
  end generate;

  
end rtl;
