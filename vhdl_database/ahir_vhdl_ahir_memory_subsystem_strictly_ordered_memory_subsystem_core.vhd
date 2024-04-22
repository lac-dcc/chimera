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
use ieee.numeric_std.all;

library ahir;
use ahir.GlobalConstants.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;
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


-- simplified logic.  Use one memory bank only..
architecture pipelined of memory_subsystem_core is

  	constant c_load_port_id_width : natural := Maximum(1,Ceil_Log2(num_loads));
  	constant c_store_port_id_width : natural := Maximum(1,Ceil_Log2(num_stores));

	signal lc_ack_out_sig : std_logic_vector(num_loads-1 downto 0);
	signal sc_ack_out_sig : std_logic_vector(num_stores-1 downto 0);

	signal load_request_selected: std_logic;
	signal load_request_accepted: std_logic;
	signal load_request_address: std_logic_vector(addr_width-1 downto 0);
	signal load_request_id, load_complete_id: unsigned(c_load_port_id_width-1 downto 0);
	signal load_request_tag: std_logic_vector((tag_width-1) downto 0);
	signal load_request_time_stamp: std_logic_vector((time_stamp_width-1) downto 0);

	signal load_request_selected_repeated: std_logic;
	signal load_request_accepted_repeated: std_logic;
	signal load_request_address_repeated: std_logic_vector(addr_width-1 downto 0);
	signal load_request_id_repeated : unsigned(c_load_port_id_width-1 downto 0);
	signal load_request_tag_repeated: std_logic_vector((tag_width-1) downto 0);
	signal load_request_time_stamp_repeated: std_logic_vector((time_stamp_width-1) downto 0);

	signal load_complete_data: std_logic_vector(data_width-1 downto 0);
	signal load_complete_ready: std_logic;
	signal load_complete_accept: std_logic;
	signal load_complete_tag: std_logic_vector((tag_width-1) downto 0);

	signal store_request_selected: std_logic;
	signal store_request_accepted: std_logic;
	signal store_request_address: std_logic_vector(addr_width-1 downto 0);
	signal store_request_data: std_logic_vector(data_width-1 downto 0);
	signal store_request_id, store_complete_id: unsigned(c_store_port_id_width-1 downto 0);
	signal store_request_tag: std_logic_vector((tag_width-1) downto 0);
	signal store_request_time_stamp: std_logic_vector((time_stamp_width-1) downto 0);

	signal store_request_selected_repeated: std_logic;
	signal store_request_accepted_repeated: std_logic;
	signal store_request_address_repeated: std_logic_vector(addr_width-1 downto 0);
	signal store_request_data_repeated: std_logic_vector(data_width-1 downto 0);
	signal store_request_id_repeated : unsigned(c_store_port_id_width-1 downto 0);
	signal store_request_tag_repeated: std_logic_vector((tag_width-1) downto 0);
	signal store_request_time_stamp_repeated: std_logic_vector((time_stamp_width-1) downto 0);

	signal store_complete_ready: std_logic;
	signal store_complete_accept: std_logic;
	signal store_complete_tag: std_logic_vector((tag_width-1) downto 0);


	signal store_complete_accept_array: std_logic_vector(num_stores-1 downto 0);
	signal load_complete_accept_array: std_logic_vector(num_loads-1 downto 0);

	signal lrr_data_in, lrr_data_out : 
		std_logic_vector((time_stamp_width + c_load_port_id_width + addr_width + tag_width)-1
					downto 0);
	signal srr_data_in, srr_data_out : 
		std_logic_vector(((time_stamp_width + c_store_port_id_width + addr_width + data_width + 
						tag_width)-1) downto 0);

begin

  -----------------------------------------------------------------------------
  -- stage 1: choose a load and store request with lowest time-stamp.  The request could be
  --          a read or a write.  
  -----------------------------------------------------------------------------
  process(lr_req_in, lr_time_stamp_in, lr_addr_in, lr_tag_in)
	variable load_request_selected_var: std_logic;
	variable load_request_address_var: std_logic_vector(addr_width-1 downto 0);
	variable load_request_id_var: unsigned(c_load_port_id_width-1 downto 0);
	variable load_request_tag_var: std_logic_vector((tag_width-1) downto 0);

	variable smallest_time_stamp_var: std_logic_vector(time_stamp_width-1 downto 0);
	variable curr_time_stamp_var: std_logic_vector(time_stamp_width-1 downto 0);
	variable none_valid_so_far: std_logic;



  begin
	none_valid_so_far := '1';

	load_request_selected_var := '0';
	load_request_address_var := (others => '0');
	load_request_id_var := (others => '0');
	load_request_tag_var := (others => '0');
	smallest_time_stamp_var := (others => '0');

	for I in  0 to num_loads-1 loop
		if(lr_req_in(I) = '1') then
			curr_time_stamp_var := 
				lr_time_stamp_in (((I+1)*time_stamp_width)-1 downto
								I*time_stamp_width);
			if ((none_valid_so_far = '1') or 
				IsGreaterThan(smallest_time_stamp_var,curr_time_stamp_var)) then
				none_valid_so_far := '0';
				smallest_time_stamp_var := curr_time_stamp_var;
				load_request_id_var := to_unsigned(I,c_load_port_id_width);
				load_request_selected_var := '1';
				load_request_address_var := 
					lr_addr_in(((I+1)*addr_width)-1 downto I*addr_width);
				load_request_tag_var := 
					lr_tag_in(((I+1)*tag_width)-1 downto I*tag_width);
			end if;
		end if;
	end loop;


	load_request_selected <= load_request_selected_var;
	load_request_id <= load_request_id_var;
	load_request_address <= load_request_address_var;
	load_request_tag <= load_request_tag_var;
	load_request_time_stamp <= smallest_time_stamp_var;

  end process;

  lrr_data_in <= load_request_time_stamp & to_slv(load_request_id) & 
					load_request_address & load_request_tag;

  load_request_time_stamp_repeated <= 
		lrr_data_out((time_stamp_width+c_load_port_id_width+addr_width+tag_width)-1 downto 
							(c_load_port_id_width+addr_width+tag_width));
  load_request_id_repeated <= to_unsigned(lrr_data_out((c_load_port_id_width+addr_width+tag_width)-1 
							downto (addr_width+tag_width)));
  load_request_address_repeated <= lrr_data_out((addr_width+tag_width)-1 downto tag_width);
  load_request_tag_repeated <= lrr_data_out(tag_width-1 downto 0);
  lrr : QueueBase
		generic map (name => name & ":lrr", 
				queue_depth => 2,
				data_width => (time_stamp_width + c_load_port_id_width + 
								addr_width + tag_width))
		port map (clk => clock, reset => reset,
				data_in => lrr_data_in,
				data_out => lrr_data_out,
				push_req =>  load_request_selected,
				push_ack =>  load_request_accepted,
				pop_req  =>  load_request_accepted_repeated,
				pop_ack  =>  load_request_selected_repeated);	

  process(sr_req_in, sr_time_stamp_in, sr_addr_in, sr_data_in, sr_tag_in)
	variable store_request_selected_var: std_logic;
	variable store_request_address_var: std_logic_vector(addr_width-1 downto 0);
	variable store_request_data_var: std_logic_vector(data_width-1 downto 0);
	variable store_request_id_var: unsigned(c_store_port_id_width-1 downto 0);
	variable store_request_tag_var: std_logic_vector((tag_width-1) downto 0);
	variable smallest_time_stamp_var: std_logic_vector(time_stamp_width-1 downto 0);
	variable curr_time_stamp_var: std_logic_vector(time_stamp_width-1 downto 0);
	variable none_valid_so_far: std_logic;

  begin
	none_valid_so_far := '1';

	store_request_selected_var := '0';
	store_request_address_var := (others => '0');
	store_request_data_var := (others => '0');
	store_request_id_var := (others => '0');
	store_request_tag_var := (others => '0');
	smallest_time_stamp_var := (others => '0');

	for J in  0 to num_stores-1 loop
		if(sr_req_in(J) = '1') then
			curr_time_stamp_var := 
				sr_time_stamp_in (((J+1)*time_stamp_width)-1 downto
								J*time_stamp_width);
			if((none_valid_so_far = '1') or
				IsGreaterThan(smallest_time_stamp_var,
							curr_time_stamp_var)) then
				none_valid_so_far := '0';
				smallest_time_stamp_var := curr_time_stamp_var;
				store_request_id_var := to_unsigned(J, c_store_port_id_width);
				store_request_selected_var := '1';
				store_request_address_var := 
					sr_addr_in(((J+1)*addr_width)-1 downto J*addr_width);
				store_request_data_var := 
					sr_data_in(((J+1)*data_width)-1 downto J*data_width);
				store_request_tag_var := 
						sr_tag_in(((J+1)*tag_width)-1 downto J*tag_width);
			end if;
		end if;
	end loop;
	
	store_request_selected <= store_request_selected_var;
	store_request_id <= store_request_id_var;
	store_request_address <= store_request_address_var;
	store_request_data <= store_request_data_var;
	store_request_tag <= store_request_tag_var;
	store_request_time_stamp <= smallest_time_stamp_var;
  end process;

  srr_data_in <= store_request_time_stamp & 
			to_slv(store_request_id) &  
			store_request_address & store_request_data & store_request_tag;
  store_request_time_stamp_repeated <= 
			srr_data_out((time_stamp_width + c_store_port_id_width + 
							addr_width+data_width+tag_width)-1 downto 
					(c_store_port_id_width + addr_width+data_width + tag_width));
  store_request_id_repeated <= to_unsigned(srr_data_out((c_store_port_id_width + 
							addr_width+data_width+tag_width)-1 downto 
							(addr_width+data_width + tag_width)));
  store_request_address_repeated <= srr_data_out((addr_width+data_width+tag_width)-1 downto 
							(data_width + tag_width));
  store_request_data_repeated <= srr_data_out((data_width+tag_width)-1 downto tag_width);
  store_request_tag_repeated  <= srr_data_out(tag_width-1 downto 0);

  srr : QueueBase
		generic map (name => name & ":srr", 
				queue_depth => 2,
				data_width => (time_stamp_width + c_store_port_id_width +
						addr_width + data_width + tag_width))
		port map (clk => clock, reset => reset,
				data_in => srr_data_in,
				data_out => srr_data_out,
				push_req =>  store_request_selected,
				push_ack =>  store_request_accepted,
				pop_req  =>  store_request_accepted_repeated,
				pop_ack  =>  store_request_selected_repeated);	

  loadReqAcceptGen: for L in 0 to num_loads-1 generate
	lr_ack_out(L) <= '1' when ((load_request_selected = '1')  and 
						(load_request_accepted = '1')
					and (load_request_id = to_unsigned(L, c_load_port_id_width))) else '0';
  end generate loadReqAcceptGen;

  storeReqAcceptGen: for S in 0 to num_stores-1 generate
	sr_ack_out(S) <= '1' when ((store_request_selected = '1')  and 
						(store_request_accepted = '1')
					and (store_request_id = to_unsigned(S,c_store_port_id_width))) else '0';
  end generate storeReqAcceptGen;

  -----------------------------------------------------------------------------
  -- stage 2: memory access through memory bank.
  -----------------------------------------------------------------------------
  DebugGen: if (global_debug_flag) generate
      process(clock)
      begin
	if(clock'event and clock='1') then
		if(reset = '0') then
			if((store_request_selected_repeated = '1') and
				(store_request_accepted_repeated = '1'))  then
				assert false report
				"MS:" & name & "STORE TS=" & 
					Convert_Integer_To_String(To_Integer(store_request_time_stamp_repeated)) & 
		" ADDR=" & Convert_To_String(store_request_address_repeated) & 
		" DATA="  & Convert_To_String(store_request_data_repeated) 
				severity note;
			end if;
			if((load_request_selected_repeated = '1') and
				(load_request_accepted_repeated = '1'))  then
				assert false report
				"MS:" & name & "LOAD  TS=" & 
					Convert_To_String(load_request_time_stamp_repeated) & 
		" ADDR=" & Convert_Integer_To_String(To_Integer(load_request_address_repeated)) 
				severity note;
			end if;
		end if;
	end if;
      end process;
  end generate DebugGen;

  mb: memory_bank_revised
	generic map (name => name & ":memory_bank",
			g_addr_width => addr_width,
			g_data_width => data_width,
			g_write_tag_width => tag_width,
			g_read_tag_width => tag_width,
			g_read_port_id_width => c_load_port_id_width,
			g_write_port_id_width => c_store_port_id_width,
			g_time_stamp_width => time_stamp_width,
     			g_base_bank_addr_width => addr_width,
     			g_base_bank_data_width => data_width)
	port map ( clk => clock, reset => reset,
			write_data => store_request_data_repeated,
			write_addr => store_request_address_repeated,
			write_port_id => store_request_id_repeated,
			write_port_id_out => store_complete_id,
			write_tag  => store_request_tag_repeated,
			write_time_stamp => store_request_time_stamp_repeated,
			write_tag_out => store_complete_tag,
			write_enable => store_request_selected_repeated,
			write_ack => store_request_accepted_repeated,
			write_result_ready => store_complete_ready,
			write_result_accept => store_complete_accept,
			read_data => load_complete_data,
			read_addr => load_request_address_repeated,
			read_tag =>  load_request_tag_repeated,
			read_time_stamp => load_request_time_stamp_repeated,
			read_tag_out => load_complete_tag,
			read_port_id => load_request_id_repeated,
			read_port_id_out => load_complete_id,
			read_enable => load_request_selected_repeated,
			read_ack => load_request_accepted_repeated,
			read_result_ready => load_complete_ready,
			read_result_accept => load_complete_accept);
			

  -----------------------------------------------------------------------------
  -- stage 3:  write to appropriate destination.
  -----------------------------------------------------------------------------
  load_complete_accept <= OrReduce(load_complete_accept_array);
  loadCompleteAcceptGen: for CL in 0 to num_loads-1 generate
    llogic: block
	signal pop_req,pop_ack,push_req,push_ack: std_logic;
	signal rdata_in, rdata_out: std_logic_vector((data_width+tag_width)-1 downto 0);
    begin
	lnr: NullRepeater  -- a place-holder
		generic map (name => name & ":lfrr",
				data_width => (data_width + tag_width))
		port map (clk => clock, reset => reset,
				data_in => rdata_in,
				data_out => rdata_out,
				push_req => push_req,
				push_ack => push_ack,
				pop_req => pop_req,
				pop_ack => pop_ack);
				
	
	rdata_in <= load_complete_data & load_complete_tag;
	push_req <= '1' when ((load_complete_ready = '1') 
					and (load_complete_id = to_unsigned(CL,c_load_port_id_width)))
						else '0';
	load_complete_accept_array(CL) <= push_ack when 
				(load_complete_id = to_unsigned(CL,c_load_port_id_width)) else '0';

	pop_req <= lc_req_in(CL);
	lc_ack_out(CL) <= pop_ack;

	lc_data_out(((CL+1)*data_width)-1 downto CL*data_width) 
		<= rdata_out((data_width + tag_width)-1 downto tag_width);
	lc_tag_out(((CL+1)*tag_width)-1 downto CL*tag_width) <= rdata_out(tag_width-1 downto 0);
     end block;
  end generate loadCompleteAcceptGen;

  store_complete_accept <= OrReduce(store_complete_accept_array);
  storeCompleteAcceptGen: for CS in 0 to num_stores-1 generate
    slogic: block
	signal pop_req,pop_ack,push_req,push_ack: std_logic;
	signal rdata_in, rdata_out: std_logic_vector(tag_width-1 downto 0);
    begin
	snr: NullRepeater 
		generic map (name => name & ":sfrr",
				data_width => tag_width)
		port map (clk => clock, reset => reset,
				data_in => rdata_in,
				data_out => rdata_out,
				push_req => push_req,
				push_ack => push_ack,
				pop_req => pop_req,
				pop_ack => pop_ack);

	rdata_in <= store_complete_tag;
	push_req <= '1' when ((store_complete_ready = '1') 
					and (store_complete_id = to_unsigned(CS, c_store_port_id_width)))
					 else '0';
	store_complete_accept_array(CS) <= push_ack when 
				(store_complete_id = to_unsigned(CS, c_store_port_id_width)) else '0';

	pop_req <= sc_req_in(CS);
	sc_ack_out(CS) <= pop_ack;

	sc_tag_out(((CS+1)*tag_width)-1 downto CS*tag_width) <= rdata_out;

     end block;
  end generate storeCompleteAcceptGen;

end pipelined;

