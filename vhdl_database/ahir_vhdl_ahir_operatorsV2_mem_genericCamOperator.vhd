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

--
-- a generic CAM.
--   MPD.
--
-- Supported operations:
--    write tag,data pair at specified index. (insert_flag=1)
--    lookup tag and return hit, data.	      (lookup_flag=1)
--    clear everything.			      (clear_flag=1)
--
-- 
-- number of entries=2**index_width.
--
entity genericCamOperator is
	generic (name: string; index_width: integer; tag_width: integer; data_width: integer);
	port (clk, reset: in std_logic;
		tag_in: in std_logic_vector(tag_width-1 downto 0);
		  data_in: in std_logic_vector(data_width-1 downto 0);
		    data_out: out std_logic_vector(data_width-1 downto 0);
		       index_in: in std_logic_vector(index_width-1 downto 0);
			   clear_flag, insert_flag, lookup_flag : in std_logic_vector(0 downto 0);
			      hit_flag: out std_logic_vector(0 downto 0);
				sample_req, update_req: in Boolean;
				  sample_ack, update_ack: out Boolean);
end entity;

architecture Behave of genericCamOperator is
	signal valid_entry: std_logic_vector(0 to (2**index_width)-1);

	type TagArray is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);
	type DataArray is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);

	signal tag_array: TagArray(0 to max_number_of_entries-1);
	signal data_array: DataArray(0 to max_number_of_entries-1);

	signal start_sample, start_update_delayed: Boolean;

	signal tag_in_delayed  : std_logic_vector(tag_width-1 downto 0);
	signal data_in_delayed : std_logic_vector(data_width-1 downto 0);
	signal index_in_delayed: std_logic_vector(index_width-1 downto 0);
	signal clear_flag_delayed, insert_flag_delayed, lookup_flag_delayed : std_logic_vector(0 downto 0);

begin

	-----------------------------------------------------------------------------------------
	-- control sequencing
	-----------------------------------------------------------------------------------------
	ss_block: block
		constant place_capacities: IntegerArray(0 to 1) := (1,1);
		constant place_markings: IntegerArray(0 to 1) := (0,1);
		constant place_delays: IntegerArray(0 to 1) := (0,1);
		signal preds: BooleanArray(0 to 1);
	begin

		preds(0) <= sample_req;
		preds(1) <= start_update;

		ji: generic_join
			generic map (name => "genericCamOperator_ss_block_join",
					place_capacities => place_capacities,
					place_markings => place_markings,
					place_delays => place_delays)
			port map (preds => preds, symbol_out => start_sample, clk => clk, reset => reset);
	end block;	

	su_block: block
		constant place_capacities: IntegerArray(0 to 1) := (1,1);
		constant place_markings: IntegerArray(0 to 1) := (0,0);
		constant place_delays: IntegerArray(0 to 1) := (1,0);
		signal preds: BooleanArray(0 to 1);
	begin

		preds(0) <= sample_req;
		preds(1) <= update_req;

		ji: generic_join
			generic map (name => "genericCamOperator_su_block_join",
					place_capacities => place_capacities,
					place_markings => place_markings,
					place_delays => place_delays)
			port map (preds => preds, symbol_out => start_update, clk => clk, reset => reset);
	end block;	

	
	dsu: control_delay_element generic map (delay_value => 1)
			port map (req => start_update, ack => start_update_delayed, clk => clk, reset => reset);	


	sample_ack <= start_sample;
	update_ack <= start_update_delayed;

	-----------------------------------------------------------------------------------------
	-- data flow.
	-----------------------------------------------------------------------------------------
	-- first stage
	process(clk)
		variable end_to_end_vector: std_logic_vector(((2**index_width)*data_width)-1 downto 0);
		variable sel_vector: BooleanArray((2**index_width)-1 downto 0);
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				clear_flag_delayed(0) <= '0';
				insert_flag_delayed(0) <= '0';
				lookup_flag_delayed(0) <= '0';
			elsif(start_sample) then
				tag_in_delayed <= tag_in;
				data_in_delayed <= data_in;
				index_in_delayed <= index_in;
				clear_flag_delayed <= clear_flag;
				insert_flag_delayed <= insert_flag;
				lookup_flag_delayed <= lookup_flag;
			end if;
		end if;
	end process;

	-- second stage.
	process(clk, cam_state, hit_vector, clear_flag, insert_flag, lookup_flag)
		variable IINDEX: integer range 0 to (2**index_width)-1;
	begin
		
		if(clk'event and clk = '1') then
		    if(reset = '1') then
			valid_entry <= (others => '0');
			hit_flag <= '0';
		    elsif(start_update) then
			if (clear_flag_delayed(0) = '1') then
				valid_entry <= (others => '0');
				hit_flag(0) <= '0';
			elsif (insert_flag_delayed(0) = '1') then
				IINDEX := to_integer(to_unsigned(index_in_delayed));
				tag_array(IINDEX) <= tag_in_delayed;
				data_array(IINDEX) <= data_in_delayed;
				valid_entry(IINDEX) <= '1';
				hit_flag(0) <= '1';
			elsif (lookup_flag_delayed(0) = '1') then

				for I in 0 to (2**index_width)-1 loop
				    end_to_end_vector(((I+1)*data_width)-1 downto I*data_width) <= data_array(I);
				    if((tag_in_delayed = tag_array(I)) and (valid_entry(I) = '1')) then
					sel_vector(I) <= true;
				    else
					sel_vector(I) <= false;
				    end if;
				end loop;
	
				-- balanced mux.
				data_out <= MuxOneHot(end_to_end_vector,sel_vector);	
				if(OrReduce(sel_vector)) then
				    hit_flag(0) <= '1';
				else
				    hit_flag(0) <= '0';
				end if;
			end if;
		    end if;
		end if;
	end process;

end Behave;
