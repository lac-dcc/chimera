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

entity memory_subsystem_core is
  generic(name: string;
	  num_loads             : natural := 5;
          num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7;
          time_stamp_width      : natural := 11;
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

    -- time-stamp for request: will be used for all ordering inside
    -- the subsystem
    lr_time_stamp_in   : in  std_logic_vector((num_loads*time_stamp_width)-1 downto 0);
    
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

    -- time-stamp for request: will be used for all ordering inside
    -- the subsystem
    sr_time_stamp_in   : in  std_logic_vector((num_stores*time_stamp_width)-1 downto 0);
    
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
end entity memory_subsystem_core;


architecture pipelined of memory_subsystem_core is

  -----------------------------------------------------------------------------
  -- configuration constants.  These should be determined by the
  -- implementation itself based on the input generics.  For the moment
  -- these are hardwired.
  -----------------------------------------------------------------------------
  constant c_mux_degree : natural :=  mux_degree;
  constant c_demux_degree : natural := demux_degree;
  constant log2_number_of_banks : natural := Ceil_Log2(number_of_banks);  --  
  constant bank_addr_width : natural := addr_width - log2_number_of_banks;
  constant c_load_merge_stages : natural := Maximum(1, Ceil_Log(num_loads,c_mux_degree));
  constant c_store_merge_stages : natural := Maximum(1,Ceil_Log(num_stores,c_mux_degree));
  constant c_number_of_merge_stages : natural := Maximum(c_load_merge_stages,c_store_merge_stages);
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- useful constants
  constant c_number_of_inputs : natural := num_loads + num_stores;
  constant c_log2_number_of_inputs : natural := Ceil_Log2(num_loads + num_stores);
  -----------------------------------------------------------------------------

  type LoadDataArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);
  type LoadDataTagArray is array (natural range <>) of std_logic_vector(data_width+tag_width-1 downto 0);
  signal load_port_data : LoadDataTagArray(0 to num_loads-1);
  
  -----------------------------------------------------------------------------
  -- Todo: create an array of port id tags to keep track of the
  --       input port
  -----------------------------------------------------------------------------
  constant c_load_port_id_width : natural := Maximum(1,Ceil_Log2(num_loads));
  constant c_store_port_id_width : natural := Maximum(1,Ceil_Log2(num_stores));

  type LoadPortIdArray is array (natural range <>) of std_logic_vector(c_load_port_id_width-1 downto 0);
  type StorePortIdArray is array (natural range <>) of std_logic_vector(c_store_port_id_width-1 downto 0);
  
  type TimeStampArray is array (natural range<>) of std_logic_vector(time_stamp_width-1 downto 0);
  function StorePortIdGen (
    constant x : natural;
    constant width : natural
    )
    return StorePortIdArray
  is
    variable ret_var : StorePortIdArray(0 to x-1);
    variable curr_value : std_logic_vector(width-1 downto 0);
  begin
    curr_value := (others => '0');
    ret_var := (others => (others => '0'));
    for I  in 0 to x-1 loop
      ret_var(I) := curr_value;
      curr_value := IncrementSLV(curr_value);
    end loop;  -- I
    return(ret_var);
  end function StorePortIdGen;

  function LoadPortIdGen (
    constant x : natural;
    constant width : natural
    )
    return LoadPortIdArray
  is
    variable ret_var : LoadPortIdArray(0 to x-1);
    variable curr_value : std_logic_vector(width-1 downto 0);
  begin
    curr_value := (others => '0');
    ret_var := (others => (others => '0'));
    for I  in 0 to x-1 loop
      ret_var(I) := curr_value;
      curr_value := IncrementSLV(curr_value);
    end loop;  -- I
    return(ret_var);
  end function LoadPortIdGen;


  constant c_load_port_id_array : LoadPortIdArray := LoadPortIdGen(num_loads, c_load_port_id_width);
  signal s_load_port_id_array : LoadPortIdArray(0 to num_loads-1) := c_load_port_id_array;


  constant c_store_port_id_array : StorePortIdArray := StorePortIdGen(num_stores, c_store_port_id_width);
  signal s_store_port_id_array : StorePortIdArray(0 to num_stores-1) := c_store_port_id_array;
  
  constant c_load_merge_data_width : natural := (bank_addr_width) + tag_width + c_load_port_id_width + time_stamp_width;
  constant c_load_demerge_data_width : natural := data_width + tag_width + c_load_port_id_width + time_stamp_width;
  
  constant c_store_merge_data_width : natural := (bank_addr_width) + data_width + tag_width + c_store_port_id_width + time_stamp_width;
  constant c_store_demerge_data_width : natural := tag_width + c_store_port_id_width + time_stamp_width;
  

  signal load_time_stamp : TimeStampArray(num_loads-1 downto 0);
  signal store_complete_time_stamp,store_time_stamp : TimeStampArray(num_stores-1 downto 0);

  type LoadMergeArray is array(0 to number_of_banks-1) of std_logic_vector(num_loads*c_load_merge_data_width-1 downto 0);
  type StoreMergeArray is array(0 to number_of_banks-1) of std_logic_vector(num_stores*c_store_merge_data_width-1 downto 0);
  type LoadControlArray is array(0 to number_of_banks-1) of std_logic_vector(num_loads-1 downto 0);
  
  type LoadDemergeArray is array(0 to number_of_banks-1) of std_logic_vector(num_loads*c_load_demerge_data_width-1 downto 0);
  type StoreDemergeArray is array(0 to number_of_banks-1) of std_logic_vector(num_stores*c_store_demerge_data_width-1 downto 0);
  type StoreControlArray is array(0 to number_of_banks-1) of std_logic_vector(num_stores-1 downto 0);
  
  signal load_merge_data_in : LoadMergeArray;
  signal load_merge_data_out : std_logic_vector((number_of_banks*c_load_merge_data_width)-1 downto 0);

  -- port side load merge control
  signal load_merge_from_port_req, load_merge_to_port_ack : LoadControlArray;

  -- bank side load merge control
  signal load_merge_to_bank_req, load_merge_from_bank_ack : std_logic_vector(number_of_banks-1 downto 0);
  
  signal load_demerge_data_in : std_logic_vector((number_of_banks*c_load_demerge_data_width)-1 downto 0);
  signal load_demerge_data_out : LoadDemergeArray;

  -- port side load demerge control
  signal load_demerge_to_port_req, load_demerge_from_port_ack :LoadControlArray;

  -- bank side load demerge control
  signal load_demerge_from_bank_req, load_demerge_to_bank_ack : std_logic_vector(number_of_banks-1 downto 0);
    
  signal store_merge_data_in : StoreMergeArray;
  signal store_merge_data_out : std_logic_vector((number_of_banks*c_store_merge_data_width)-1 downto 0);

  -- port side store merge control
  signal store_merge_from_port_req, store_merge_to_port_ack : StoreControlArray;
  
  -- bank side store merge control
  signal store_merge_to_bank_req, store_merge_from_bank_ack : std_logic_vector(number_of_banks-1 downto 0);
  signal store_demerge_data_in : std_logic_vector((number_of_banks*c_store_demerge_data_width)-1 downto 0);
  signal store_demerge_data_out : StoreDemergeArray;

  -- port side store demerge control
  signal store_demerge_to_port_req, store_demerge_from_port_ack : StoreControlArray;

  -- bank side store demerge control
  signal store_demerge_from_bank_req, store_demerge_to_bank_ack : std_logic_vector(number_of_banks-1 downto 0);

  signal load_req_state : std_logic_vector(num_loads-1 downto 0);
  signal store_req_state : std_logic_vector(num_stores-1 downto 0);

  type BankDataArray is array(natural range <>) of std_logic_vector(number_of_banks*(data_width+tag_width)-1 downto 0);
  type BankTagArray is array(natural range <>) of std_logic_vector(number_of_banks*tag_width-1 downto 0);
  type BankStorePortIdArray is array(natural range <>) of std_logic_vector(number_of_banks*c_store_port_id_width-1 downto 0);
  type BankTimestampArray is array(natural range <>) of std_logic_vector(number_of_banks*time_stamp_width-1 downto 0);
  type BankControlArray is array(natural range <>) of std_logic_vector(number_of_banks-1 downto 0);

  signal load_data_from_banks : BankDataArray(0 to num_loads-1);
  signal load_tstamp_from_banks : BankTimestampArray(0 to num_loads-1);
  signal load_data_req_from_banks, load_data_ack_to_banks : BankControlArray(0 to num_loads-1);
  signal store_tstamp_from_banks : BankTimestampArray(0 to num_stores-1);
  signal store_port_id_from_banks : BankStorePortIdArray(0 to num_stores-1);
  signal store_tag_from_banks : BankTagArray(0 to num_stores-1);
  signal store_data_req_from_banks, store_data_ack_to_banks : BankControlArray(0 to num_stores-1);

  type BankMemDataArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);
  type BankMemTagArray is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);
  type BankMemLoadTagArray is array (natural range <>) of std_logic_vector((tag_width+c_load_port_id_width+time_stamp_width)-1 downto 0);
  type BankMemStoreTagArray is array (natural range <>) of std_logic_vector((tag_width+c_store_port_id_width+time_stamp_width)-1 downto 0);
  type BankMemStorePortIdArray is array(natural range <>) of std_logic_vector(c_store_port_id_width-1 downto 0);
  type BankMemAddressArray is array (natural range <>) of std_logic_vector(bank_addr_width-1 downto 0);
  signal bank_mem_read_addr, bank_mem_write_addr: BankMemAddressArray(0 to number_of_banks-1);
  signal bank_mem_read_data, bank_mem_write_data : BankMemDataArray(0 to number_of_banks-1);
  signal bank_mem_read_tag : BankMemLoadTagArray(0 to number_of_banks-1);
  signal bank_mem_read_tag_out: BankMemLoadTagArray(0 to number_of_banks-1);
  signal bank_mem_write_tag : BankMemStoreTagArray(0 to number_of_banks-1);
  signal bank_mem_write_tag_out : BankMemStoreTagArray(0 to number_of_banks-1);
  signal bank_mem_store_port_id_out: BankMemStorePortIdArray(0 to number_of_banks-1);
  signal bank_mem_store_tag_out: BankMemTagArray(0 to number_of_banks-1);
  signal bank_mem_write_enable, bank_mem_write_ack, bank_mem_read_enable, bank_mem_read_ack : std_logic_vector(0 to number_of_banks-1);
  signal bank_mem_write_result_ready, bank_mem_write_result_accept, bank_mem_read_result_ready, bank_mem_read_result_accept : std_logic_vector(0 to number_of_banks-1);
  

begin

  -----------------------------------------------------------------------------
  -- load merge logic
  -----------------------------------------------------------------------------
  LoadMergeGen: for I in 0 to num_loads-1 generate

    load_time_stamp(I) <= lr_time_stamp_in((I+1)*time_stamp_width -1 downto I*time_stamp_width);

    ---------------------------------------------------------------------------
    -- lr_ack
    ---------------------------------------------------------------------------
    process(load_merge_to_port_ack)
      variable sig_var : std_logic;
    begin
      sig_var := '0';
      for BANK in 0 to number_of_banks-1 loop
        sig_var := sig_var or load_merge_to_port_ack(BANK)(I);
      end loop;  -- BANK
      lr_ack_out(I) <= sig_var;
    end process;


    ---------------------------------------------------------------------------
    -- address & tag & port-id & time-stamp
    BankGen: for BANK in 0 to number_of_banks-1 generate

      -------------------------------------------------------------------------
      -- distribution of data to banks
      -------------------------------------------------------------------------
      
      -- data-in to merge tree for BANK. (from Ith port)
      load_merge_data_in(BANK)((I+1)*c_load_merge_data_width - 1 downto I*c_load_merge_data_width)
        <= lr_addr_in((I+1)*addr_width-1 downto (I*addr_width) + log2_number_of_banks) &
        lr_tag_in((I+1)*tag_width-1 downto I*tag_width) & c_load_port_id_array(I) & load_time_stamp(I);

      -- handshake between ports and load-merge
      load_merge_from_port_req(BANK)(I) <=
        lr_req_in(I) when Bank_Match(BANK,log2_number_of_banks,lr_addr_in((I+1)*addr_width-1 downto I*addr_width)) else '0';
      -- ack through lr_ack process.

      -------------------------------------------------------------------------
      -- reverse data from banks
      -------------------------------------------------------------------------
      
      -- data & tag &  port-id & time-stamp
      load_data_from_banks(I)((BANK+1)*(tag_width+data_width)-1 downto BANK*(tag_width+data_width)) 
        <= 
        load_demerge_data_out(BANK)((I+1)*(c_load_demerge_data_width)-1 downto ((I+1)*(c_load_demerge_data_width)-data_width)-tag_width);

      load_tstamp_from_banks(I)((BANK+1)*(time_stamp_width)-1 downto BANK*time_stamp_width)
        <=
        load_demerge_data_out(BANK)((I*c_load_demerge_data_width)+(time_stamp_width-1) downto 
                                    ((I*c_load_demerge_data_width)));

      -------------------------------------------------------------------------
      -- port-side handshake
      --  Ports   -> req    Merge  -> req   Bank
      --          <- ack           <- ack
      -------------------------------------------------------------------------
      load_data_req_from_banks(I)(BANK) <= load_demerge_to_port_req(BANK)(I);
      load_demerge_from_port_ack(BANK)(I) <=  load_data_ack_to_banks(I)(BANK);

    end generate BankGen;


    ---------------------------------------------------------------------------
    -- merge for load-complete
    ---------------------------------------------------------------------------
    mergeComplete : combinational_merge_with_repeater generic map (
      name => name & "-load-mergeComplete-" & Convert_Integer_To_String(I), 
      g_data_width       => data_width + tag_width,
      g_number_of_inputs => number_of_banks,
      g_time_stamp_width => time_stamp_width)
      port map (clk => clock, reset => reset,
		in_data => load_data_from_banks(I),
                in_tstamp => load_tstamp_from_banks(I),
                out_data => load_port_data(I),
                out_tstamp => open,
                in_req => load_data_req_from_banks(I),
                in_ack => load_data_ack_to_banks(I),
                out_req => lc_ack_out(I),
                out_ack => lc_req_in(I));

    lc_data_out((I+1)*data_width-1 downto I*data_width) <= load_port_data(I)(data_width+tag_width-1 downto tag_width);
    lc_tag_out((I+1)*tag_width -1 downto I*tag_width) <= load_port_data(I)(tag_width-1 downto 0);
    
  end generate LoadMergeGen;

  -----------------------------------------------------------------------------
  -- store merge
  -----------------------------------------------------------------------------
  StoreMergeGen: for I in 0 to num_stores-1 generate
    
    store_time_stamp(I) <= sr_time_stamp_in((I+1)*time_stamp_width -1 downto I*time_stamp_width);

    ---------------------------------------------------------------------------
    -- sr_ack
    ---------------------------------------------------------------------------
    process(store_merge_to_port_ack)
      variable sig_var : std_logic;
    begin
      sig_var := '0';
      for BANK in 0 to number_of_banks-1 loop
        sig_var := sig_var or store_merge_to_port_ack(BANK)(I);
      end loop;  -- BANK
      sr_ack_out(I) <= sig_var;
    end process;


    BankGen: for BANK in 0 to number_of_banks-1 generate
      
      -------------------------------------------------------------------------
      -- distribution of data to banks
      -------------------------------------------------------------------------
      -- address & data & tag & port_id & time_stamp
      
      store_merge_data_in(BANK)((I+1)*c_store_merge_data_width - 1 downto I*c_store_merge_data_width)
        <= sr_addr_in((I+1)*addr_width-1 downto I*addr_width + log2_number_of_banks) &
        sr_data_in((I+1)*data_width-1 downto I*data_width) & 
        sr_tag_in((I+1)*tag_width-1 downto I*tag_width) &  c_store_port_id_array(I) & store_time_stamp(I);

      store_merge_from_port_req(BANK)(I) <=
        sr_req_in(I) when Bank_Match(BANK,log2_number_of_banks,sr_addr_in((I+1)*addr_width-1 downto I*addr_width)) else '0';

      -------------------------------------------------------------------------
      -- reverse data from banks (tag only).
      -------------------------------------------------------------------------
      -- tag & port-id & time-stamp
      store_tag_from_banks(I)((BANK+1)*(tag_width)-1 downto BANK*(tag_width)) 
        <= 
        store_demerge_data_out(BANK)((I+1)*(c_store_demerge_data_width)-1 downto ((I+1)*(c_store_demerge_data_width)-tag_width));

      store_tstamp_from_banks(I)((BANK+1)*(time_stamp_width)-1 downto BANK*time_stamp_width)
        <=
        store_demerge_data_out(BANK)(I*c_store_demerge_data_width+(time_stamp_width-1) downto
                                    (I*c_store_demerge_data_width));

      store_port_id_from_banks(I)((BANK+1)*c_store_port_id_width -1 downto BANK*c_store_port_id_width)
	<=
        store_demerge_data_out(BANK)((I+1)*(c_store_demerge_data_width)-(tag_width+1) downto ((I+1)*(c_store_demerge_data_width)-(c_store_port_id_width + tag_width)));
	
      -- port side handshake
      store_data_req_from_banks(I)(BANK) <= store_demerge_to_port_req(BANK)(I);
      store_demerge_from_port_ack(BANK)(I) <=  store_data_ack_to_banks(I)(BANK);

    end generate BankGen;


    ---------------------------------------------------------------------------
    -- merge for store-complete
    ---------------------------------------------------------------------------
    mergeComplete : combinational_merge_with_repeater generic map (
      name => name & "-store-mergeComplete-" & Convert_Integer_To_String(I), 
      g_data_width       => tag_width,
      g_number_of_inputs => number_of_banks,
      g_time_stamp_width => time_stamp_width)
      port map (clk => clock,
		reset => reset,
		in_data => store_tag_from_banks(I),
                in_tstamp => store_tstamp_from_banks(I),
                out_data => sc_tag_out((I+1)*tag_width-1 downto I*tag_width),
                out_tstamp => store_complete_time_stamp(I),
                in_req => store_data_req_from_banks(I),
                in_ack => store_data_ack_to_banks(I),
                out_req => sc_ack_out(I),
                out_ack => sc_req_in(I));

  end generate StoreMergeGen;


  -----------------------------------------------------------------------------
  -- now the banks
  -----------------------------------------------------------------------------
  BankGen: for BANK in 0 to number_of_banks-1 generate

    ---------------------------------------------------------------------------
    -- todo: instantiate merge trees for load and store
    ---------------------------------------------------------------------------
    loadMerge : merge_tree
      generic map(name => name & "-loadMerge-" & Convert_Integer_To_String(BANK),
	     	  g_mux_degree => c_mux_degree,
                  g_number_of_inputs => num_loads,
                  g_data_width => c_load_merge_data_width,
                  g_time_stamp_width => time_stamp_width,
                  g_num_stages => c_number_of_merge_stages,
                  g_port_id_width => c_load_port_id_width,
                  g_tag_width => tag_width)
      port map (merge_data_in  => load_merge_data_in(BANK),
                merge_req_in   => load_merge_from_port_req(BANK),
                merge_ack_out  => load_merge_to_port_ack(BANK),
                merge_data_out => load_merge_data_out((BANK+1)*c_load_merge_data_width-1 downto BANK*c_load_merge_data_width),
                merge_req_out  => load_merge_to_bank_req(BANK),
                merge_ack_in   => load_merge_from_bank_ack(BANK),
                clock => clock,
                reset => reset);

    ---------------------------------------------------------------------------
    -- store merge (from ports to bank)
    ---------------------------------------------------------------------------
    storeMerge : merge_tree
      generic map(name => name & "-storeMerge-" & Convert_Integer_To_String(BANK),
		  g_mux_degree => c_mux_degree,
                  g_number_of_inputs => num_stores,
                  g_data_width => c_store_merge_data_width,
                  g_num_stages => c_number_of_merge_stages,
                  g_time_stamp_width => time_stamp_width,
                  g_port_id_width => c_store_port_id_width,
                  g_tag_width => tag_width)
      port map (merge_data_in => store_merge_data_in(BANK),
                merge_req_in => store_merge_from_port_req(BANK),
                merge_ack_out => store_merge_to_port_ack(BANK),
                merge_data_out => store_merge_data_out((BANK+1)*c_store_merge_data_width-1 downto BANK*c_store_merge_data_width),
                merge_req_out => store_merge_to_bank_req(BANK),
                merge_ack_in => store_merge_from_bank_ack(BANK),
                clock => clock,
                reset => reset);
    
    
    ---------------------------------------------------------------------------
    -- connections to memory bank
    ---------------------------------------------------------------------------

    -- write side
    bank_mem_write_addr(BANK) <= store_merge_data_out((BANK+1)*c_store_merge_data_width-1 downto
                                                      (BANK+1)*c_store_merge_data_width - bank_addr_width);
    bank_mem_write_data(BANK) <= store_merge_data_out((BANK+1)*c_store_merge_data_width-(bank_addr_width+1)
                                                      downto
                                                      (BANK+1)*c_store_merge_data_width -
                                                      (bank_addr_width + data_width));
    bank_mem_write_tag(BANK) <=
      store_merge_data_out(
        (BANK+1)*c_store_merge_data_width-(bank_addr_width+data_width+1) downto
        (BANK*c_store_merge_data_width));

    -- write handshake (push all the way)
    bank_mem_write_enable(BANK) <=  store_merge_to_bank_req(BANK);
    store_merge_from_bank_ack(BANK) <= bank_mem_write_ack(BANK);

    -- read side
    bank_mem_read_addr(BANK) <= load_merge_data_out((BANK+1)*c_load_merge_data_width-1 downto
                                                      (BANK+1)*c_load_merge_data_width - bank_addr_width);
    bank_mem_read_tag(BANK) <=
      load_merge_data_out(
        (BANK+1)*c_load_merge_data_width-(bank_addr_width+1) downto
        (BANK*c_load_merge_data_width));

    -- read handshake (push all the way)
    bank_mem_read_enable(BANK) <=  load_merge_to_bank_req(BANK);
    load_merge_from_bank_ack(BANK) <= bank_mem_read_ack(BANK);

                                                    
    memBank : memory_bank generic map (
      name => name & "-memory-bank-" & Convert_Integer_To_String(BANK), 
      g_data_width       => data_width,
      g_read_tag_width        => tag_width+c_load_port_id_width+time_stamp_width,
      g_write_tag_width        => tag_width+c_store_port_id_width+time_stamp_width,
      g_addr_width    => bank_addr_width,
      g_time_stamp_width => time_stamp_width,
      g_base_bank_addr_width => base_bank_addr_width,
      g_base_bank_data_width => base_bank_data_width)
      port map (
        clk => clock,
        reset => reset,
        write_data => bank_mem_write_data(BANK),
        write_addr => bank_mem_write_addr(BANK),
        write_enable => bank_mem_write_enable(BANK),
        write_tag => bank_mem_write_tag(BANK),
        write_tag_out => bank_mem_write_tag_out(BANK),
        write_ack => bank_mem_write_ack(BANK),
        write_result_ready => bank_mem_write_result_ready(BANK),
        write_result_accept => bank_mem_write_result_accept(BANK),
        read_data => bank_mem_read_data(BANK),
        read_addr => bank_mem_read_addr(BANK),
        read_enable => bank_mem_read_enable(BANK),
        read_ack => bank_mem_read_ack(BANK),
        read_result_ready => bank_mem_read_result_ready(BANK),
        read_result_accept => bank_mem_read_result_accept(BANK),
        read_tag => bank_mem_read_tag(BANK),
        read_tag_out => bank_mem_read_tag_out(BANK));

    bank_mem_store_port_id_out(BANK) <= bank_mem_write_tag_out(BANK)(c_store_port_id_width + time_stamp_width-1 downto 
				time_stamp_width);
    bank_mem_store_tag_out(BANK) <=  bank_mem_write_tag_out(BANK)(c_store_port_id_width + time_stamp_width + tag_width-1 downto time_stamp_width + c_store_port_id_width); 

    ---------------------------------------------------------------------------
    -- connections to store demerge tree
    ---------------------------------------------------------------------------
    store_demerge_data_in((BANK+1)*c_store_demerge_data_width -1 downto (BANK*c_store_demerge_data_width))
      <= bank_mem_write_tag_out(BANK);

    bank_mem_write_result_accept(BANK) <= store_demerge_to_bank_ack(BANK);
    store_demerge_from_bank_req(BANK) <= bank_mem_write_result_ready(BANK);

    ---------------------------------------------------------------------------
    -- store demerge tree
    ---------------------------------------------------------------------------
    
    storeDemerge: demerge_tree
      generic map (name => name & "-storeDemerge-" & Convert_Integer_To_String(BANK),
		   g_demux_degree => c_demux_degree,
                   g_number_of_outputs => num_stores,
                   g_data_width => c_store_demerge_data_width,
                   g_id_width => c_store_port_id_width,
                   g_stage_id => 0)
      port map (demerge_data_out => store_demerge_data_out(BANK),
                demerge_ack_out => store_demerge_to_bank_ack(BANK),
                demerge_req_in => store_demerge_from_bank_req(BANK),
                demerge_data_in => store_demerge_data_in((BANK+1)*c_store_demerge_data_width-1 downto BANK*c_store_demerge_data_width),
                demerge_ready_out => store_demerge_to_port_req(BANK),
                demerge_accept_in =>  store_demerge_from_port_ack(BANK),
                demerge_sel_in => bank_mem_write_tag_out(BANK)(time_stamp_width+c_store_port_id_width-1 downto time_stamp_width),
                clock => clock,
                reset => reset);

    ---------------------------------------------------------------------------
    -- data/control connections to load demerge tree
    ---------------------------------------------------------------------------
    load_demerge_data_in((BANK+1)*c_load_demerge_data_width -1 downto (BANK*c_load_demerge_data_width))
      <= bank_mem_read_data(BANK) & bank_mem_read_tag_out(BANK);
    
    bank_mem_read_result_accept(BANK) <= load_demerge_to_bank_ack(BANK);
    load_demerge_from_bank_req(BANK) <= bank_mem_read_result_ready(BANK);
    
    ---------------------------------------------------------------------------
    -- load demerge tree
    ---------------------------------------------------------------------------
    loadDemerge: demerge_tree
      generic map (name => name & "-loadDemerge-" & Convert_Integer_To_String(BANK),
		   g_demux_degree => c_demux_degree,
                   g_number_of_outputs => num_loads,
                   g_data_width => c_load_demerge_data_width,
                   g_id_width => c_load_port_id_width,
                   g_stage_id => 0)
      port map (demerge_data_out => load_demerge_data_out(BANK),
                demerge_ack_out => load_demerge_to_bank_ack(BANK),
                demerge_req_in => load_demerge_from_bank_req(BANK),
                demerge_data_in => load_demerge_data_in((BANK+1)*c_load_demerge_data_width-1 downto BANK*c_load_demerge_data_width),
                demerge_ready_out => load_demerge_to_port_req(BANK),
                demerge_accept_in =>  load_demerge_from_port_ack(BANK),
                demerge_sel_in => bank_mem_read_tag_out(BANK)(time_stamp_width+c_load_port_id_width-1 downto time_stamp_width),
                clock => clock,
                reset => reset);

  end generate BankGen;
end pipelined;

