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
-- Package:     axi
-- File:        axi.vhd
-- Modified:    Alen Bardizbanyan, Cobham Gaisler
-- Description: AXI related functions
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.config_types.all;
use grlib.config.all;
use grlib.amba.all;
use grlib.devices.all;
use grlib.stdlib.all;


package axi is

  
  function axi4_max_n(width : in integer)
    return integer;

  function full_dwsize(size : in integer)
    return std_logic_vector;
  
  function read_replicate (data_in : in std_logic_vector;
                           addr    : in std_logic_vector(log2(AXIDW/8)-1 downto 0);
                           hsize   : in std_logic_vector(2 downto 0))
    return std_logic_vector;

  function wstrb_generate(addr : in std_logic_vector(log2(AXIDW/8)-1 downto 0);
                          size : in std_logic_vector(2 downto 0))
    return std_logic_vector;

  function burst_type_translate(hburst : in std_logic_vector(2 downto 0))
    return std_logic_vector;
  
  function burst_length_translate(hburst : in std_logic_vector(2 downto 0))
    return std_logic_vector;

  function byte_swap (data_in : std_logic_vector)
    return std_logic_vector;

  function be_to_le_address(data_width : integer;          
                            address_in : std_logic_vector(log2((AXIDW/8))-1 downto 0);
                            size       : std_logic_vector(2 downto 0))
    return std_logic_vector;

  function be_to_le_data(data_in : in std_logic_vector;
                         size    : in std_logic_vector(2 downto 0))
    return std_logic_vector;

  function power_of_two(number : integer range 0 to 1048576 )
    return integer;

  function max_len(axi_v : integer)
    return integer;

  function size_incr(size       : std_logic_vector(2 downto 0);
                     data_width : integer) --constant
    return unsigned ;

  component axinullslv is
    port (
      clk: in std_ulogic;
      rst: in std_ulogic;
      axisi: in axi_mosi_type;
      axiso: out axi_somi_type
      );
  end component;

    component axichancdc is
    generic (
      tech: integer;
      width: integer;
      nsync: integer := 2;
      skew: integer := 1;
      usefifo: integer := 0
      );
    port (
      vclk     : in std_ulogic;
      vrst     : in std_ulogic;
      vrclkact : in std_ulogic;
      vdata    : in std_logic_vector(width-1 downto 0);
      vvalid   : in std_ulogic;
      vready   : out std_ulogic;
      rclk     : in std_ulogic;
      rrst     : in std_ulogic;
      rvclkact : in std_ulogic;
      rdata    : out std_logic_vector(width-1 downto 0);
      rvalid   : out std_ulogic;
      rready   : in std_ulogic;
      tsten    : in std_ulogic := '0'
      );
  end component;

  component axicdc is
    generic (
      tech   : integer;
      awfifo : integer := 0;
      wfifo  : integer := 0;
      bfifo  : integer := 0;
      arfifo : integer := 0;
      rfifo  : integer := 0
      );
    port(
      mclk    : in std_ulogic;
      mrst    : in std_ulogic;
      msclkact: in std_ulogic;
      mmi     : out axi_somi_type;
      mmo     : in axi_mosi_type;
      mpend   : out std_ulogic;
      sclk    : in std_ulogic;
      srst    : in std_ulogic;
      smclkact: in std_ulogic;
      smi     : in axi_somi_type;
      smo     : out axi_mosi_type;
      spend   : out std_ulogic;
      tsten   : in std_ulogic := '0'
      );
  end component;

  component ahb2axi_l is
    generic (
      hindex    : integer                       := 0;
      aximid    : integer range 0 to 15         := 0;  --AXI master transaction ID
      axisecure : boolean                       := true;
      -- scantest
      scantest  : integer                       := 0;
      -- GRLIB plug&play configuration
      vendor    : integer                       := VENDOR_GAISLER;
      device    : integer                       := GAISLER_AHB2AXI;
      bar0      : integer range 0 to 1073741823 := 0;
      bar1      : integer range 0 to 1073741823 := 0;
      bar2      : integer range 0 to 1073741823 := 0;
      bar3      : integer range 0 to 1073741823 := 0
      );                                    
    port (
      rst   : in  std_logic;
      clk   : in  std_logic;
      ahbsi : in  ahb_slv_in_type;
      ahbso : out ahb_slv_out_type;
      aximi : in  axi_somi_type;
      aximo : out axi_mosi_type
      );  
  end component;

  component ahbm2axi
    generic (
      memtech       : integer                := 0;
      hindex        : integer                := 0;
      aximid        : integer range 0 to 15  := 0;  --AXI master transaction ID
      wbuffer_num   : integer range 1 to 256 := 8;
      rprefetch_num : integer range 1 to 256 := 8;
      always_secure : integer range 0 to 1   := 1;  --0->not secure; 1->secure
      axi4          : integer range 0 to 1   := 0;
      endianness_mode : integer range 0 to 1   := 0;  --0->BE(AHB)-to-BE(AXI)
                                                      --1->BE(AHB)-to-LE(AXI)
      -- scantest
      scantest      : integer                := 0
      );                                    
    port (
      rst   : in  std_logic;
      clk   : in  std_logic;
      ahbsi : in  ahb_slv_in_type;
      ahbso : out ahb_slv_out_type;
      aximi : in  axi_somi_type;
      aximo : out axix_mosi_type
      );  
  end component;

  component ahbm2axi3 is
    generic (
      memtech         : integer               := 0;
      aximid          : integer range 0 to 15 := 0;
      wbuffer_num     : integer range 1 to 16 := 8;
      rprefetch_num   : integer range 1 to 16 := 8;
      always_secure   : integer range 0 to 1  := 1;
      endianness_mode : integer range 0 to 1  := 0;
      --scantest
      scantest        : integer               := 0
      );
    port (
      rstn  : in  std_logic;
      clk   : in  std_logic;
      ahbsi : in  ahb_slv_in_type;
      ahbso : out ahb_slv_out_type;
      aximi : in  axi_somi_type;
      aximo : out axi3_mosi_type
      );
  end component;

  component ahbm2axi4 is
    generic (
      memtech         : integer                              := 0;
      aximid          : integer range 0 to 15                := 0;
      wbuffer_num     : integer range 1 to axi4_max_n(AXIDW) := 8;
      rprefetch_num   : integer range 1 to axi4_max_n(AXIDW) := 8;
      always_secure   : integer range 0 to 1                 := 1;
      endianness_mode : integer range 0 to 1                 := 0;
      --scantest
      scantest        : integer                              := 0
      );
    port (
      rstn  : in  std_logic;
      clk   : in  std_logic;
      ahbsi : in  ahb_slv_in_type;
      ahbso : out ahb_slv_out_type;
      aximi : in  axi_somi_type;
      aximo : out axi4_mosi_type
      );
  end component;


  component ahb2axib is
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
  end component;


  component ahb2axi3b is
    generic (
      memtech         : integer                       := 0;
      hindex          : integer                       := 0;
      aximid          : integer range 0 to 15         := 0;  --AXI master transaction ID
      wbuffer_num     : integer range 1 to 16         := 8;
      rprefetch_num   : integer range 1 to 16         := 8;
      always_secure   : integer range 0 to 1          := 1;  --0->not secure; 1->secure
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
      rstn  : in  std_logic;
      clk   : in  std_logic;
      ahbsi : in  ahb_slv_in_type;
      ahbso : out ahb_slv_out_type;
      aximi : in  axi_somi_type;
      aximo : out axi3_mosi_type
      );
  end component;

  component ahb2axi4b is
    generic (
      memtech         : integer                              := 0;
      hindex          : integer                              := 0;
      aximid          : integer range 0 to 15                := 0;  --AXI master transaction ID
      wbuffer_num     : integer range 1 to axi4_max_n(AXIDW) := 8;
      rprefetch_num   : integer range 1 to axi4_max_n(AXIDW) := 8;
      always_secure   : integer range 0 to 1                 := 1;  --0->not secure; 1->secure
      endianness_mode : integer range 0 to 1                 := 0;  --0->BE(AHB)-to-BE(AXI)
                                                                    --1->BE(AHB)-to-LE(AXI)
      narrow_acc_mode : integer range 0 to 1                 := 0;  --0->each beat in narrow burst
                                                                    --treated as single access
                                                                    --1->narrow burst directly
                                                                    --transalted to AXI
                                                                    --supported only in BE-to-BE
      -- scantest
      scantest        : integer                              := 0;
      -- GRLIB plug&play configuration
      vendor          : integer                              := VENDOR_GAISLER;
      device          : integer                              := GAISLER_AHB2AXI;
      bar0            : integer range 0 to 1073741823        := 0;
      bar1            : integer range 0 to 1073741823        := 0;
      bar2            : integer range 0 to 1073741823        := 0;
      bar3            : integer range 0 to 1073741823        := 0
      );
    port (
      rstn  : in  std_logic;
      clk   : in  std_logic;
      ahbsi : in  ahb_slv_in_type;
      ahbso : out ahb_slv_out_type;
      aximi : in  axi_somi_type;
      aximo : out axi4_mosi_type
      );
  end component;
  
end package axi;


package body axi is

  --max supported width is 256-bit
  --function that makes sure read prefetch
  --or write buffering does not exceed 4K
  function axi4_max_n(
    width : in integer
    ) return integer is
  begin

    if AXIDW = 32 then
      return 256;
    elsif AXIDW = 64 then
      return 128;
    elsif AXIDW = 128 then
      return 64;
    else
      return 32;
    end if;

  end axi4_max_n;


  --AHB2AXI currently supports 32-bit/64-bit/128-bit/256-bit bus data-width
  function full_dwsize(
    size : in integer
    ) return std_logic_vector is
    variable hsize : std_logic_vector(2 downto 0);
  begin
    --default 32-bit
    hsize := "010";

    case size is
      when 64 =>
        hsize := "011";
      when 128 =>
        hsize := "100";
      when 256 =>
        hsize := "101";
      when others => null;
    end case;

    return hsize;
  end full_dwsize;

  function subwidth_replicate(
    data_in   : std_logic_vector;
    width     : integer;
    rep_width : integer)
    return std_logic_vector is
    variable data : std_logic_vector(width-1 downto 0);
  begin
    for i in 0 to (width/rep_width)-1 loop
      data((i+1)*rep_width-1 downto i*rep_width) := data_in;
    end loop;  -- i
    return data;
  end subwidth_replicate;

  ------------------------------------------------------------------------------   
  --functions to avoid simulate warnings when AXIDW is 32
  function range_return (
    width : in integer
    ) return integer is
    variable temp : integer;
  begin
    temp := 0;
    if width > 32 then
      temp := (AXIDW/32)-2;
    end if;
    return temp;
  end range_return;

  function addr_range_high(
    width : in integer
    ) return integer is
    variable temp : integer;
  begin
    temp := 0;
    if width > 32 then
      temp := log2(AXIDW/8)-1;
    end if;
    return temp;
  end addr_range_high;

  function addr_range_low(
    width : in integer
    ) return integer is
    variable temp : integer;
  begin
    temp     := 2;
    if width <= 32 then
      temp := 0;
    end if;
    return temp;
  end addr_range_low;


  function dswr_64(
    width : in integer
    ) return integer is
    variable temp : integer;
  begin
    temp := 31;
    if width > 32 then
      temp := 63;
    end if;
    return temp;
  end dswr_64;

  function dswr_128(
    width : in integer
    ) return integer is
    variable temp : integer;
  begin
    temp := 31;
    if width = 64 then
      temp := 63;
    end if;
    if width > 64 then
      temp := 127;
    end if;
    return temp;
  end dswr_128;
  -----------------------------------------------------------------------------

  --read replicate function for AXIDW sizes larger than 32-bit
  --the replication is done at least in word(32-bit) level
  --if it is called for 32-bit it will always return the same data
  --or if the hsize is bigger than the AXIDW it will return the same data

  --this function is intended to be used on the AXI side hence it is based
  --on little endian addressing
  function read_replicate (
    data_in : in std_logic_vector;
    addr    : in std_logic_vector(log2(AXIDW/8)-1 downto 0);
    hsize   : in std_logic_vector(2 downto 0)
    ) return std_logic_vector is
    variable addr_i       : integer range 0 to (AXIDW/32)-1;
    variable data_shifted : std_logic_vector(AXIDW-1 downto 0);
    variable data_out     : std_logic_vector(AXIDW-1 downto 0);
  begin
    
    addr_i := to_integer(unsigned(addr(addr_range_high(AXIDW) downto addr_range_low(AXIDW))));

    data_shifted := data_in;
    if AXIDW > 32 then
      for i in 0 to range_return(AXIDW) loop
        for j in i to (AXIDW/32)-1 loop
          if (j-i) = addr_i then
            data_shifted((i+1)*32-1 downto i*32) := data_in((j+1)*32-1 downto j*32);
          end if;
        end loop;  -- j      
      end loop;  -- i
    end if;

    data_out := data_in;
    case hsize is
      --replicate for 8-bit/16-bit/32-bit
      --always 32-bit replication
      when "000" | "001" | "010" =>
        data_out := subwidth_replicate(data_shifted(31 downto 0), AXIDW, 32);
      when "011" =>
        if AXIDW > 64 then
          --replicate for 64-bit
          data_out := subwidth_replicate(data_shifted(dswr_64(AXIDW) downto 0), AXIDW, dswr_64(AXIDW)+1);
        end if;
      when "100" =>
        if AXIDW > 128 then
          --replicate for 128-bit
          data_out := subwidth_replicate(data_shifted(dswr_128(AXIDW) downto 0), AXIDW, dswr_128(AXIDW)+1);
        end if;
      when others => null;
    end case;

    return data_out;

  end read_replicate;

  function wstrb_generate(
    addr : in std_logic_vector(log2(AXIDW/8)-1 downto 0);
    size : in std_logic_vector(2 downto 0)
    ) return std_logic_vector is
    variable mask      : std_logic_vector(AXIDW/8-1 downto 0);
    variable mask_temp : std_logic_vector(AXIDW/8-1 downto 0);
  begin
    mask_temp := (others => '0');

    --create strb bits depending on the size aligned to the lsb
    for i in 0 to (AXIDW/8)-1 loop
      if i <= (2**(to_integer(unsigned(size))))-1 then
        mask_temp(i) := '1';
      end if;
    end loop;
    --shift the generated strb depending on the addr to align it with correct
    --byte lanes
    mask := std_logic_vector(shift_left(unsigned(mask_temp), to_integer(unsigned(addr))));

    return mask;
  end wstrb_generate;

  --function that translates AHB burst type to AXI burst type
  function burst_type_translate(
    hburst : in std_logic_vector(2 downto 0)
    ) return std_logic_vector is
    variable burst : std_logic_vector(1 downto 0);
  begin
    
    case hburst is
      --incremental bursts
      when HBURST_SINGLE | HBURST_INCR | HBURST_INCR4 |
        HBURST_INCR8 | HBURST_INCR16 =>
        burst := XBURST_INCR;
      when others =>
        --wrapping bursts
        burst := XBURST_WRAP;
    end case;
    return burst;
  end burst_type_translate;

  --function that translates AHB burst length
  --to AXI burst length
  function burst_length_translate(
    hburst : in std_logic_vector(2 downto 0)
    ) return std_logic_vector is
    variable len : std_logic_vector(3 downto 0);
  begin
    
    case hburst is
      when HBURST_SINGLE =>
        len := "0000";
      when HBURST_INCR =>
        len := "0011";
      when HBURST_WRAP4 | HBURST_INCR4 =>
        len := "0011";
      when HBURST_WRAP8 | HBURST_INCR8 =>
        len := "0111";
      when HBURST_WRAP16 | HBURST_INCR16 =>
        len := "1111";
      when others =>
        len := "0000";
    end case;

    return len;
  end burst_length_translate;


  --function that swaps the byte positions for a given vector
  function byte_swap (
    data_in : std_logic_vector)
    return std_logic_vector is
    variable data       : std_logic_vector(data_in'high-data_in'low downto 0);
    variable data_align : std_logic_vector(data_in'high-data_in'low downto 0);
  begin

    data_align := data_in(data_in'high downto data_in'low);

    for i in 0 to (data_align'length/8)-1 loop
      data((i+1)*8-1 downto i*8) := data_align(data_align'left-(i*8) downto data_align'length-((i+1)*8));
    end loop;  -- i

    return data;

  end byte_swap;


  function decode_size(
    size : in std_logic_vector(2 downto 0)
    )
    return unsigned is
    variable ret : unsigned(7 downto 0);
  begin

    case size is
      when "000" =>
        ret := "00000001";
      when "001" =>
        ret := "00000010";
      when "010" =>
        ret := "00000100";
      when "011" =>
        ret := "00001000";
      when "100" =>
        ret := "00010000";
      when "101" =>
        ret := "00100000";
      when "110" =>
        ret := "01000000";
      when "111" =>
        ret := "10000000";
      when others =>
        ret := "00000000";
    end case;

    return ret;
   
  end decode_size;

  --function that translates a big-endian narrow access
  --address to little-endina narrow access address
  --size must not be bigger than the data-width otherwise
  --result is unpredictable
  function be_to_le_address(
    data_width : integer;               --constant
    address_in : std_logic_vector(log2((AXIDW/8))-1 downto 0);
    size       : std_logic_vector(2 downto 0)
    )
    return std_logic_vector is
    variable max_add : unsigned(7 downto 0);
    variable temp    : unsigned(7 downto 0);
    variable ret     : unsigned(7 downto 0);
  begin  

    max_add := (others=>'0');
    max_add(log2(AXIDW/8)) := '1';
    temp := (others => '0');
    ret  := (others => '0');

    if ( full_dwsize(data_width) = size ) then
      return address_in;
    else
      temp := max_add - decode_size(size);
      ret  := temp - unsigned(address_in);
      return std_logic_vector(ret(log2((AXIDW/8))-1 downto 0));
    end if;

  end be_to_le_address;
 
    
    
  --Big endian to little endian data bus conversion
  --First byte swap the entire data bus then byte swap
  --the sub-bytes depending on the size
  function be_to_le_data(
    data_in : in std_logic_vector;
    size    : in std_logic_vector(2 downto 0)
    )
    return std_logic_vector is
    variable data         : std_logic_vector(data_in'range);
    variable data_swapped : std_logic_vector(data_in'range);
  begin

    data_swapped := byte_swap(data_in);
    data         := data_swapped;
    if size /= "000" then
      for i in 0 to (AXIDW/8)-2 loop
        for j in i+1 to (AXIDW/8) loop
          if ((j-i) = 2**to_integer(unsigned(size))) and ((i mod 2**to_integer(unsigned(size))) = 0) then
            data((j*8)-1 downto i*8) := byte_swap(data_swapped((j*8)-1 downto i*8));
          end if;
        end loop;
      end loop;
    end if;
    return data;

  end be_to_le_data;

  --return the nearest power of two (max 1048576)
  function power_of_two(
    number : integer range 0 to 1048576)
    return integer is
    variable ret : integer;
  begin

    ret := 1;
    
    for i in 20 downto 0 loop
      if number >= 2**i then
        ret := 2**i;
        exit;
      end if;
    end loop;
    
    return ret;
    
  end power_of_two;

  function max_len(
    axi_v : integer)
    return integer is
  begin

    if axi_v = 0 then
      return 4;
    else
      return 8;
    end if;

  end max_len;


  function size_incr(
    size       : std_logic_vector(2 downto 0);
    data_width : integer)               --constant
    return unsigned is
    variable size_temp : unsigned(7 downto 0);
  begin

    size_temp := decode_size(size);
    return resize(size_temp, log2(data_width/8));
    
  end size_incr;



  

end axi;
