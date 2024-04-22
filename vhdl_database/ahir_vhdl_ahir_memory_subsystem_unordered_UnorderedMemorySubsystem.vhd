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

entity UnorderedMemorySubsystem is
  generic(name: string;
	  num_loads             : natural := 5;
          num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7;
          -- number_of_banks       : natural := 1; (will always be 1 in this memory)
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
end entity UnorderedMemorySubsystem;


architecture struct of UnorderedMemorySubsystem is

  
  constant c_load_port_id_width : natural := Maximum(1,Ceil_Log2(num_loads));
  constant c_store_port_id_width : natural := Maximum(1,Ceil_Log2(num_stores));

  type LoadPortIdArray is array (natural range <>) of std_logic_vector(c_load_port_id_width-1 downto 0);
  type StorePortIdArray is array (natural range <>) of std_logic_vector(c_store_port_id_width-1 downto 0);
  
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

  constant c_load_port_id_array : LoadPortIdArray(0 to num_loads-1) := LoadPortIdGen(num_loads, c_load_port_id_width);
  signal s_load_port_id_array: LoadPortIdArray(0 to num_loads-1);
  constant c_store_port_id_array : StorePortIdArray(0 to num_stores-1) := StorePortIdGen(num_stores, c_store_port_id_width);
  signal s_store_port_id_array: StorePortIdArray(0 to num_stores-1) ;

  constant rd_mux_data_width: integer :=  (addr_width + tag_width + c_load_port_id_width );
  constant wr_mux_data_width: integer :=  (addr_width + data_width + tag_width + c_store_port_id_width);

  signal rd_mux_data_in : std_logic_vector((num_loads*rd_mux_data_width)-1 downto 0);
  signal rd_mux_data_out : std_logic_vector(rd_mux_data_width-1 downto 0);
  signal rd_mux_out_req : std_logic;
  signal rd_mux_out_ack : std_logic;

  signal wr_mux_data_in : std_logic_vector((num_stores*wr_mux_data_width)-1 downto 0);
  signal wr_mux_data_out : std_logic_vector(wr_mux_data_width-1 downto 0);
  signal wr_mux_out_req : std_logic;
  signal wr_mux_out_ack : std_logic;

  signal rd_demux_sel_in  : std_logic_vector(c_load_port_id_width-1 downto 0);
  signal rd_demux_data_in : std_logic_vector(data_width+tag_width-1 downto 0);
  signal rd_demux_data_out : std_logic_vector((num_loads*(data_width+tag_width))-1 downto 0);
  signal rd_demux_in_req, rd_demux_in_ack : std_logic;
  signal rd_demux_out_req, rd_demux_out_ack : std_logic_vector(num_loads-1 downto 0);

  signal wr_demux_sel_in : std_logic_vector(c_store_port_id_width-1 downto 0);
  signal wr_demux_data_in : std_logic_vector(tag_width-1 downto 0);
  signal wr_demux_data_out : std_logic_vector((num_stores*tag_width)-1 downto 0);
  signal wr_demux_in_req, wr_demux_in_ack : std_logic;
  signal wr_demux_out_req, wr_demux_out_ack : std_logic_vector(num_stores-1 downto 0);

  signal mem_bank_write_data     : std_logic_vector(data_width-1 downto 0);
  signal mem_bank_write_addr     : std_logic_vector(addr_width-1 downto 0);
  signal mem_bank_write_tag, mem_bank_write_tag_out : 
	std_logic_vector(tag_width+c_store_port_id_width-1 downto 0);
  signal mem_bank_write_enable   : std_logic;
  signal mem_bank_write_ack   : std_logic;
  signal mem_bank_write_result_accept : std_logic;
  signal mem_bank_write_result_ready : std_logic;
  signal mem_bank_read_data     : std_logic_vector(data_width-1 downto 0);
  signal mem_bank_read_addr     : std_logic_vector(addr_width-1 downto 0);
  signal mem_bank_read_tag,mem_bank_read_tag_out  : std_logic_vector((c_load_port_id_width+tag_width)-1 downto 0);
  signal mem_bank_read_enable   : std_logic;
  signal mem_bank_read_ack      : std_logic;
  signal mem_bank_read_result_accept: std_logic;
  signal mem_bank_read_result_ready: std_logic;

begin

   s_load_port_id_array <= c_load_port_id_array;
   s_store_port_id_array <= c_store_port_id_array;

   -- read mux data aggregation
   process(lr_addr_in, lr_tag_in)
   begin
	for I in 0 to num_loads-1 loop
		rd_mux_data_in((rd_mux_data_width*(I+1))-1 downto rd_mux_data_width*I)
			<= lr_addr_in((addr_width*(I+1))-1 downto addr_width*I) &
				lr_tag_in((tag_width*(I+1))-1 downto tag_width*I) &
				   c_load_port_id_array(I); 
	end loop;
   end process;

  
   -- read mux data aggregation
   process(sr_addr_in,sr_data_in, sr_tag_in)
   begin
	for I in 0 to num_stores-1 loop
		wr_mux_data_in((wr_mux_data_width*(I+1))-1 downto wr_mux_data_width*I)
			<= sr_addr_in((addr_width*(I+1))-1 downto addr_width*I) & 
			     sr_data_in((data_width*(I+1))-1 downto data_width*I) & 
				sr_tag_in((tag_width*(I+1))-1 downto tag_width*I) &
				 c_store_port_id_array(I); 
	end loop;
   end process;
 
   -- Readmux instantiation.
   rmux: PipelinedMux generic map(name => name & "-rmux", g_number_of_inputs => num_loads,
				g_data_width => rd_mux_data_width,
			        g_mux_degree => mux_degree,
				g_port_id_width => c_load_port_id_width)
		port map(merge_data_in => rd_mux_data_in,
			  merge_req_in => lr_req_in,
			  merge_ack_out => lr_ack_out,
			  merge_data_out => rd_mux_data_out,
			  merge_req_out => rd_mux_out_req,
			  merge_ack_in => rd_mux_out_ack,
		          clock => clock,
			  reset => reset);	

    -- connect rmux to memory bank
    mem_bank_read_addr <= rd_mux_data_out(rd_mux_data_width-1 downto (rd_mux_data_width-addr_width));
    mem_bank_read_tag <= rd_mux_data_out((rd_mux_data_width-addr_width)-1 downto 0); -- tag & port-id
    mem_bank_read_enable <= rd_mux_out_req;
    rd_mux_out_ack <= mem_bank_read_ack;
    
				
   -- Writemux instantiation.
   wmux: PipelinedMux generic map(name => name & "-wmux", g_number_of_inputs => num_stores,
				g_data_width => wr_mux_data_width,
			        g_mux_degree => mux_degree,
				g_port_id_width => c_store_port_id_width)
		port map(merge_data_in => wr_mux_data_in,
			  merge_req_in => sr_req_in,
			  merge_ack_out => sr_ack_out,
			  merge_data_out => wr_mux_data_out,
			  merge_req_out => wr_mux_out_req,
			  merge_ack_in => wr_mux_out_ack,
		          clock => clock,
			  reset => reset);	

    -- connect to memory bank.
    mem_bank_write_addr <= wr_mux_data_out(wr_mux_data_width-1 downto (wr_mux_data_width-addr_width));
    mem_bank_write_data <= wr_mux_data_out((wr_mux_data_width-addr_width)-1 downto 
	((wr_mux_data_width-addr_width)-data_width));
    mem_bank_write_tag <= wr_mux_data_out((wr_mux_data_width-(data_width+addr_width))-1 downto 0);
    mem_bank_write_enable <= wr_mux_out_req;
    wr_mux_out_ack <= mem_bank_write_ack;


    -- the memory bank..
    mbank: memory_bank generic map(name => name & "-mbank", 
				   g_addr_width => addr_width,
				   g_data_width => data_width,
				   g_write_tag_width => (tag_width + c_store_port_id_width),
				   g_read_tag_width => (tag_width + c_load_port_id_width),
				   g_time_stamp_width => 0,  -- no time-stamp.
				   g_base_bank_addr_width => base_bank_addr_width,
			           g_base_bank_data_width => base_bank_data_width)
		port map(clk => clock,
			 reset => reset,
			 write_data => mem_bank_write_data,
			 write_addr => mem_bank_write_addr,
			 write_tag => mem_bank_write_tag,
			 write_tag_out => mem_bank_write_tag_out,
			 write_enable => mem_bank_write_enable,
			 write_ack => mem_bank_write_ack,
			 write_result_ready => mem_bank_write_result_ready,
			 write_result_accept => mem_bank_write_result_accept,
			 read_data => mem_bank_read_data,
			 read_addr => mem_bank_read_addr,
			 read_tag => mem_bank_read_tag,
			 read_tag_out => mem_bank_read_tag_out,
			 read_enable => mem_bank_read_enable,
			 read_ack => mem_bank_read_ack,
			 read_result_ready => mem_bank_read_result_ready,
			 read_result_accept => mem_bank_read_result_accept);
			

    -- memory bank to read-demux
    rd_demux_sel_in  <= mem_bank_read_tag_out(c_load_port_id_width-1 downto 0);
    rd_demux_data_in <= mem_bank_read_data & mem_bank_read_tag_out((tag_width+c_load_port_id_width)-1 downto c_load_port_id_width);
    rd_demux_in_req <= mem_bank_read_result_ready;
    mem_bank_read_result_accept <= rd_demux_in_ack;
 
    rd_demux: PipelinedDemux generic map (name => name & "-rd_demux",
					g_data_width => data_width+tag_width,
				       g_destination_id_width => c_load_port_id_width,
				       g_number_of_outputs => num_loads)
		port map(data_in => rd_demux_data_in,
			 sel_in => rd_demux_sel_in,
			 req_in => rd_demux_in_req,
			 ack_out => rd_demux_in_ack,
			 data_out => rd_demux_data_out,
			 req_out => rd_demux_out_req,
			 ack_in => rd_demux_out_ack,
			 clk => clock,
			 reset => reset);

    process(rd_demux_data_out)
    begin
       for I in 0 to num_loads-1 loop
	 lc_data_out(((I+1)*data_width)-1 downto I*data_width) 
		<= rd_demux_data_out(((I+1)*(data_width+tag_width))-1 downto (I*(data_width+tag_width))+tag_width);
	 lc_tag_out(((I+1)*tag_width)-1 downto I*tag_width) 
		<= rd_demux_data_out((I*(data_width+tag_width))+tag_width-1 downto (I*(data_width+tag_width)));
       end loop;
    end process;

    rd_demux_out_ack <= lc_req_in;
    lc_ack_out <= rd_demux_out_req;
					 
    -- memory bank to write-demux
    wr_demux_sel_in <= mem_bank_write_tag_out(c_store_port_id_width-1 downto 0);
    wr_demux_data_in <= mem_bank_write_tag_out(tag_width+c_store_port_id_width-1 downto c_store_port_id_width);
    wr_demux_in_req <= mem_bank_write_result_ready;
    mem_bank_write_result_accept <= wr_demux_in_ack;
    
    wr_demux: PipelinedDemux generic map (name => name & "-wr_demux",
					g_data_width => tag_width,
				       g_destination_id_width => c_store_port_id_width,
				       g_number_of_outputs => num_stores)
		port map(data_in => wr_demux_data_in,
			 sel_in => wr_demux_sel_in,
			 req_in => wr_demux_in_req,
			 ack_out => wr_demux_in_ack,
			 data_out => wr_demux_data_out,
			 req_out => wr_demux_out_req,
			 ack_in => wr_demux_out_ack,
			 clk => clock,
			 reset => reset);

    sc_tag_out <= wr_demux_data_out;
    wr_demux_out_ack <= sc_req_in;
    sc_ack_out <= wr_demux_out_req;

end struct;
