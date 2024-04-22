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
use ahir.BaseComponents.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;


entity genericRAMwithByteEnable_1xRW_Operator is
	generic (name: string; addr_width: integer; data_width: integer);
	port (clk, reset: in std_logic;
		addr: in std_logic_vector(addr_width-1 downto 0);
		din:  in std_logic_vector(data_width-1 downto 0);
		byte_enable: in std_logic_vector((data_width/8)-1 downto 0);
		init_flag, wr_bar: in std_logic_vector(0 downto 0);
		dout: out std_logic_vector(data_width-1 downto 0);
		sample_req, update_req: in Boolean;
		sample_ack, update_ack: out Boolean
		);
end entity;

-- three processes.
--    one which monitors the sample-req.
--    one which models the memory.
--    one which monitors the update_req
architecture Behave of genericRAMwithByteEnable_1xRW_Operator is
	type SampleState is (Run_State, Init_State);
	signal sample_state: SampleState;
	signal init_counter : integer range 0 to (2**addr_width);

	signal mem_data_in, mem_data_out: std_logic_vector(data_width-1 downto 0);
	signal mem_addr: std_logic_vector (addr_width-1 downto 0);
	signal mem_enable, mem_wr_bar, mem_ack: std_logic;

	type MemArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);

	signal mem_array : MemArray((2**addr_width)-1 downto 0);


	signal mem_access_started: Boolean;


	type UpdateState is (Run_State, Wait_For_Update_Req, Wait_For_Mem_Access);
	signal update_state: UpdateState;

	signal update_pending: Boolean;
begin
	assert (((data_width/8)*8) = data_width)
		report "Data width in genericRAM_1xRW_Operator must be a multiple of 8." 
		severity error;

	mem_data_in <= din;
	dout <= mem_data_out;


	-- Sample-req state machine.
	--   when sample-req is observed, trigger the memory access.
	process(clk, sample_state, sample_req, init_flag, init_counter, update_pending)
		variable next_sample_state: SampleState;
		variable next_init_counter: integer range 0 to (2**addr_width);
		variable mem_enable_var, mem_wr_bar_var: std_logic;
		variable sample_ack_var: Boolean;
		variable mem_addr_var : std_logic_vector(addr_width-1 downto 0);
		variable mem_access_started_var: Boolean;
	begin
		next_sample_state := sample_state;
		next_init_counter   := init_counter;
		mem_enable_var := '0';
		mem_wr_bar_var := '0';
		sample_ack_var := false;
		mem_addr_var := (others => '0');
		mem_access_started_var: Boolean;

		case sample_state is
			when Run_State =>
				if(sample_req) then
					if (init_flag = '1') then
						next_sample_state := Init_State;
						next_counter := 0;
					elsif (not update_pending) then
						mem_enable_var := '1';
						mem_wr_bar_var := wr_bar;	
						sample_ack_var := true;
						mem_addr_var := to_unsigned(addr);
						mem_access_started_var := true;
					end if;
				end if;
			when Init_State =>
				if (init_counter = (2**addr_width)) then
					next_sample_state := Run_State;
					sample_ack_var := true;
					mem_access_started_var := true;
				else
					next_init_counter := init_counter + 1;
					mem_enable_var := '1';
					mem_wr_bar_var := '0';
					mem_addr_var   := to_slv(to_unsigned(init_counter, addr_width));
				end if;
		end case;
		
		mem_addr <= mem_addr_var;
		mem_enable <= mem_enable_var;
		mem_wr_bar <= mem_wr_bar_var;
		sample_ack <= sample_ack_var;
		mem_access_started <= mem_access_started_var;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				sample_state <= Run_State;
				init_counter <= 0;
			else
				sample_state <= next_sample_state;
				init_counter <= next_init_counter;
				-- single-cycle access memory.
			end if;
		end if;
	end process;


	-- mem-bank.. to support byte-enables, we instantiate many byte-wide memories.
        base_bank_gen: for I in 0 to (data_width/8)-1 generate
	  mb: block
		signal bb_din, bb_dout: std_logic_vector(7 downto 0);
		signal bb_addr: std_logic_vector(addr_width-1 downto 0);
		signal bb_enable, bb_wr_bar: std_logic;
	  begin

		bb_enable <= (mem_enable & byte_enable(I));
		bb_din    <= mem_data_in ((8*(I+1))-1 downto 8*I);
		mem_data_out((8*(I+1))-1 downto 8*I) <= bb_dout;
		bb_wr_bar <= mem_wr_bar;

		memBase: base_bank
			generic map (g_addr_width => addr_width, g_data_width => 8)
			port map (datain => bb_din,
					dataout => bb_dout,
						addrin => mem_addr,
							enable => bb_enable,
							   	write_bar => bb_wr_bar,
									clk => clk, reset => reset);
	  end block mb;
	end generate base_bank_gen;

	

	-- update-ack side process.
	process(clk, update_state, mem_access_started, update_req, reset)
		variable next_update_state: UpdateState;
		variable update_ack_var: Boolean;
		variable update_pending_var: Boolean;
	begin
		next_update_state := update_state;
		update_pending_var := false;
		update_ack_var := false;

		case update_state is
			when Run_State => 
				if(update_req and mem_access_started) then
					update_ack_var := true;
				elsif(update_req) then
					-- wait for mem-access..
					next_update_state := Wait_For_Mem_Access;
				elsif(mem_access_started) then
					-- wait for update-req..
					next_update_state := Wait_For_Update_Req;
				end if;
			when Wait_For_Update_Req =>
				update_pending_var := true;
				if(update_req) then
					next_update_state := Run_State;
					update_ack_var := true;
				end if;
			when Wait_For_Mem_Access =>		
				if(mem_access_started) then
					next_update_state := Run_State;
					update_ack_var := true;
				end if;
		end case;

		update_pending <= update_pending_var;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				update_state <= Run_State;
				update_ack <= false;
			else
				update_state <= next_update_state;
				update_ack <= update_ack_var;
			end if;
		end if;
	end process;

end Behave;
