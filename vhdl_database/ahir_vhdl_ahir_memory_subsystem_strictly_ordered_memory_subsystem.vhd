------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

-- memory subsystem guarantees that accesses to the same location
-- will take place in the order of the time-stamp assigned to each
-- access (tie breaks will be random). Time-stamp is set at the
-- point of acceptance of an access request.

entity memory_subsystem is
  generic(name: string;
	  num_loads             : natural := 5;
          num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7;
          number_of_banks       : natural := 1;
          mux_degree            : natural := 10;
          demux_degree          : natural := 10;
	  base_bank_addr_width  : natural := 8;
	  base_bank_data_width  : natural := 8);
  port(
    ------------------------------------------------------------------------------
    -- load request ports
    ------------------------------------------------------------------------------
    lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on load request.
    lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag for request, will be returned on completion.
    lr_tag_in : in std_logic_vector((num_loads*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- load complete ports
    ---------------------------------------------------------------------------
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, user should latch data_out.
    lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag of completed request.
    lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- store request ports
    ------------------------------------------------------------------------------
    sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on store request.
    sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag for request, will be returned on completion.
    sr_tag_in : in std_logic_vector((num_stores*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- store complete ports
    ---------------------------------------------------------------------------
    -- req/ack pair:
    -- when both are asserted, user assumes that store is done.
    sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag of completed request.
    sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
end entity memory_subsystem;


architecture bufwrap of memory_subsystem is

  constant time_stamp_width : natural := 2 + Ceil_Log2(num_loads + num_stores);   --  two msb bits for identification
  
  signal lr_addr_in_core :std_logic_vector((num_loads*addr_width)-1 downto 0);
  signal lr_req_in_core  :std_logic_vector(num_loads-1 downto 0);
  signal lr_ack_out_core :std_logic_vector(num_loads-1 downto 0);
  signal lr_tag_in_core :std_logic_vector((num_loads*tag_width)-1 downto 0);
  signal lr_time_stamp_in_core :std_logic_vector((num_loads*time_stamp_width)-1 downto 0);  

  signal sr_addr_in_core :std_logic_vector((num_stores*addr_width)-1 downto 0);
  signal sr_data_in_core :std_logic_vector((num_stores*data_width)-1 downto 0);
  signal sr_req_in_core  : std_logic_vector(num_stores-1 downto 0);
  signal sr_ack_out_core : std_logic_vector(num_stores-1 downto 0);
  signal sr_tag_in_core :std_logic_vector((num_stores*tag_width)-1 downto 0);
  signal sr_time_stamp_in_core :std_logic_vector((num_stores*time_stamp_width)-1 downto 0);
  

  type LoadRepeaterData is array (natural range <> ) of std_logic_vector(time_stamp_width+addr_width+tag_width - 1 downto 0);
  type StoreRepeaterData is array (natural range <> ) of std_logic_vector(time_stamp_width+data_width+addr_width+tag_width - 1 downto 0);
  signal load_repeater_data_in, load_repeater_data_out: LoadRepeaterData(0 to num_loads-1);
  signal store_repeater_data_in, store_repeater_data_out: StoreRepeaterData(0 to num_stores-1);

  signal raw_time_stamp: std_logic_vector(time_stamp_width-1 downto 0);

begin

  -----------------------------------------------------------------------------
  -- time-stamp generation
  -----------------------------------------------------------------------------

  process(clock,reset)
  begin

    if clock'event and clock = '1' then
      if(reset = '1') then
        raw_time_stamp <= (others => '0');
      else
        raw_time_stamp <= IncrementSLV(raw_time_stamp);
      end if;
    end if;
  end process;

  -- instantiate repeaters for each load and store input
  LoadRepGen: for LOAD in 0 to num_loads-1 generate

    load_repeater_data_in(LOAD) <= raw_time_stamp &
                                   lr_addr_in((LOAD+1)*addr_width-1 downto LOAD*addr_width) &
                                   lr_tag_in((LOAD+1)*tag_width - 1 downto LOAD*tag_width);

    lr_time_stamp_in_core((LOAD+1)*time_stamp_width -1 downto LOAD*time_stamp_width) <=
      load_repeater_data_out(LOAD)(time_stamp_width+addr_width+tag_width-1 downto addr_width+tag_width);
    
    lr_addr_in_core((LOAD+1)*addr_width -1 downto LOAD*addr_width) <=
      load_repeater_data_out(LOAD)(addr_width+tag_width-1 downto tag_width);
    lr_tag_in_core((LOAD+1)*tag_width-1 downto LOAD*tag_width) <= load_repeater_data_out(LOAD)(tag_width-1 downto 0);
    
    Rptr : mem_shift_repeater generic map (
      name => name & "-load-mem-shift-repeater-" & Convert_Integer_To_String(LOAD),
      g_data_width => time_stamp_width+ addr_width + tag_width,
	g_number_of_stages => 0)
      port map (
        clk      => clock,
        reset    => reset,
        data_in  => load_repeater_data_in(LOAD),
        req_in   => lr_req_in(LOAD),
        ack_out  => lr_ack_out(LOAD),
        data_out => load_repeater_data_out(LOAD),
        req_out  => lr_req_in_core(LOAD),
        ack_in   => lr_ack_out_core(LOAD));
    
  end generate LoadRepGen;


  StoreRepGen: for STORE in 0 to num_stores-1 generate
    store_repeater_data_in(STORE) <= raw_time_stamp &
                                     sr_data_in((STORE+1)*data_width-1 downto STORE*data_width) &
                                     sr_addr_in((STORE+1)*addr_width-1 downto STORE*addr_width) &
                                     sr_tag_in((STORE+1)*tag_width - 1 downto STORE*tag_width);

    sr_time_stamp_in_core((STORE+1)*time_stamp_width -1 downto STORE*time_stamp_width) <=
      store_repeater_data_out(STORE)(time_stamp_width+data_width+addr_width+tag_width-1 downto data_width+addr_width+tag_width);
    sr_data_in_core((STORE+1)*data_width -1 downto STORE*data_width) <=
          store_repeater_data_out(STORE)(data_width+addr_width+tag_width-1 downto addr_width+tag_width);
    sr_addr_in_core((STORE+1)*addr_width -1 downto STORE*addr_width) <=
      store_repeater_data_out(STORE)(addr_width+tag_width-1 downto tag_width);
    sr_tag_in_core((STORE+1)*tag_width-1 downto STORE*tag_width) <= store_repeater_data_out(STORE)(tag_width-1 downto 0);
    
    Rptr : mem_shift_repeater generic map (
      name => name & "-store-mem-shift-repeater-" & Convert_Integer_To_String(STORE),
      g_data_width => time_stamp_width+data_width + addr_width + tag_width,
      g_number_of_stages => 0)
      port map (
        clk      => clock,
        reset    => reset,
        data_in  => store_repeater_data_in(STORE),
        req_in   => sr_req_in(STORE),
        ack_out  => sr_ack_out(STORE),
        data_out => store_repeater_data_out(STORE),
        req_out  => sr_req_in_core(STORE),
        ack_in   => sr_ack_out_core(STORE));
    
  end generate StoreRepGen;

  core: memory_subsystem_core
    generic map (
      name => name & "-core",
      num_loads            => num_loads,
      num_stores           => num_stores,
      addr_width           => addr_width,
      data_width           => data_width,
      tag_width            => tag_width,
      time_stamp_width     => time_stamp_width,
      number_of_banks      => number_of_banks,
      mux_degree           => mux_degree,
      demux_degree         => demux_degree,
      base_bank_addr_width => base_bank_addr_width,
      base_bank_data_width => base_bank_data_width)
    port map (
      lr_addr_in  => lr_addr_in_core,
      lr_req_in   => lr_req_in_core,
      lr_ack_out  => lr_ack_out_core,
      lr_tag_in   => lr_tag_in_core,
      lr_time_stamp_in => lr_time_stamp_in_core,
      lc_data_out => lc_data_out,
      lc_req_in   => lc_req_in,
      lc_ack_out  => lc_ack_out,
      lc_tag_out  => lc_tag_out,
      sr_addr_in  => sr_addr_in_core,
      sr_data_in  => sr_data_in_core,
      sr_req_in   => sr_req_in_core,
      sr_ack_out  => sr_ack_out_core,
      sr_tag_in   => sr_tag_in_core,
      sr_time_stamp_in => sr_time_stamp_in_core,      
      sc_ack_out  => sc_ack_out,
      sc_req_in   => sc_req_in,
      sc_tag_out  => sc_tag_out,
      clock       => clock,
      reset       => reset);    
end bufwrap;

