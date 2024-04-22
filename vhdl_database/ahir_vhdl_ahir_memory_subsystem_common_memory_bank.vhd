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

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

library ahir;
use ahir.mem_function_pack.all;
use ahir.mem_component_pack.all;

entity memory_bank is
   generic (
     name: string;
     g_addr_width: natural;
     g_data_width: natural;
     g_write_tag_width : natural;
     g_read_tag_width : natural;
     g_time_stamp_width: natural;
     g_base_bank_addr_width: natural;
     g_base_bank_data_width: natural
	);
   port (
     clk : in std_logic;
     reset: in std_logic;
     write_data     : in  std_logic_vector(g_data_width-1 downto 0);
     write_addr     : in std_logic_vector(g_addr_width-1 downto 0);
     write_tag      : in std_logic_vector(g_write_tag_width-1 downto 0);
     write_tag_out  : out std_logic_vector(g_write_tag_width-1 downto 0);
     write_enable   : in std_logic;
     write_ack   : out std_logic;
     write_result_accept : in std_logic;
     write_result_ready : out std_logic;
     read_data     : out std_logic_vector(g_data_width-1 downto 0);
     read_addr     : in std_logic_vector(g_addr_width-1 downto 0);
     read_tag      : in std_logic_vector(g_read_tag_width-1 downto 0);
     read_tag_out  : out std_logic_vector(g_read_tag_width-1 downto 0);
     read_enable   : in std_logic;
     read_ack      : out std_logic;
     read_result_accept: in std_logic;
     read_result_ready: out std_logic
     );
end entity memory_bank;


architecture SimModel of memory_bank is

  signal write_has_priority: std_logic;
  signal enable_base,enable_sig, write_enable_base, read_enable_base, read_enable_base_registered: std_logic;

  signal addr_base : std_logic_vector(g_addr_width-1 downto 0);
  signal read_data_base  : std_logic_vector(g_data_width-1 downto 0);
  signal read_data_base_reg  : std_logic_vector(g_data_width-1 downto 0);
  
  type FsmState is (IDLE, RDONE, WDONE);
  signal fsm_state : FsmState;

-- see comment above..
--##decl_synopsys_sync_set_reset##

begin  -- behave

  Tstampgen: if g_time_stamp_width > 0 generate 
  
  tstamp_block: Block
  	signal read_time_stamp, write_time_stamp: std_logic_vector(g_time_stamp_width-1 downto 0);
  begin 
  	read_time_stamp <= read_tag(g_time_stamp_width-1 downto 0);
  	write_time_stamp <= write_tag(g_time_stamp_width-1 downto 0);

  	process(read_time_stamp,write_time_stamp, read_enable, write_enable)
  	begin
      	if(write_enable = '1' and read_enable = '1') then
		if(IsGreaterThan(write_time_stamp,read_time_stamp)) then
        		write_has_priority <=   '0';
		else
			write_has_priority <= '1';
		end if;
      	elsif(write_enable = '1') then
		write_has_priority <= '1';
      	elsif(read_enable = '1') then
		write_has_priority <= '0';
      	else
		write_has_priority <= '1';
      	end if;
  	end process;
   end block;
   end generate Tstampgen;

   NoTstampGen: if g_time_stamp_width <= 0 generate
        write_has_priority <= write_enable;
   end generate NoTstampGen;

  -- FSM
  process(clk, reset, fsm_state, 
		write_enable, write_addr, write_data, write_result_accept, write_has_priority,
		read_enable, read_addr, read_result_accept)
	variable next_state: FsmState;
	variable we_base, re_base: std_logic;
        variable wrr, rrr: std_logic;

	variable write_active, read_active: boolean;
  begin
	next_state := fsm_state;
	we_base := '0'; 
	re_base := '0';
	wrr	:= '0';
	rrr 	:= '0';

	write_active := ((((write_enable = '1') and (read_enable = '1')) and (write_has_priority = '1'))
				or
			 ((write_enable = '1') and (read_enable = '0')));
	read_active := ((((write_enable = '1') and (read_enable = '1')) and (write_has_priority = '0'))
				or
			 ((write_enable = '0') and (read_enable = '1')));

	case fsm_state is
		when IDLE =>
		        if(write_active) then
				we_base := '1';
				next_state := WDONE;
			elsif (read_active) then
				re_base := '1';
				next_state := RDONE;
			end if;
		when RDONE =>
			rrr := '1';
			if(read_result_accept = '1') then
		        	if(write_active) then
					we_base := '1';
					next_state := WDONE;
				elsif (read_active) then
					re_base := '1';
					next_state := RDONE;
				else
					next_state := IDLE;
				end if;
			end if;
		when WDONE =>
			wrr := '1';
			if(write_result_accept ='1') then
		        	if(write_active) then
					we_base := '1';
					next_state := WDONE;
				elsif (read_active) then
					re_base := '1';
					next_state := RDONE;
				else
					next_state := IDLE;
				end if;
			end if;
	end case;

	write_enable_base <= we_base;
	write_ack <= we_base;

	read_enable_base <= re_base;
	read_ack <= re_base;

	write_result_ready <= wrr;
	read_result_ready <= rrr;

	if(clk'event and clk = '1') then
		if(reset = '1') then
			fsm_state <= IDLE;
			read_enable_base_registered <= '0';
		else
			fsm_state <= next_state;
			read_enable_base_registered <= re_base;
		end if;
	end if;
  end process;

  addr_base <= write_addr when write_enable_base = '1' else read_addr when read_enable_base = '1' else (others => '0');
  enable_sig <= write_enable_base or read_enable_base;
  
  memBase: memory_bank_base generic map(name => name & "-memBase", g_addr_width => g_addr_width,
                                        g_data_width => g_data_width,
					g_base_bank_addr_width => g_base_bank_addr_width,
					g_base_bank_data_width => g_base_bank_data_width)
    port map(data_in => write_data,
             addr_in => addr_base,
             data_out => read_data_base,
             enable => enable_sig,
             write_bar => read_enable_base,
             clk => clk,
             reset => reset);
 

  -- tag-out is updated in parallel with the
  -- memory access in memory_bank_base.
  process(clk)
  begin
	if(clk'event and clk = '1') then
		if(reset = '1') then
		     read_tag_out <= (others => '0');
		     write_tag_out <= (others => '0');
		elsif(enable_sig = '1') then
			if(read_enable_base = '1') then
				read_tag_out <= read_tag;
			else
				write_tag_out <= write_tag;
			end if;
		end if;
	end if;
  end process;

  -- bypass register for read_data_base
  process(clk)
  begin
	if(clk'event and clk = '1') then
		if(read_enable_base_registered = '1') then 
			read_data_base_reg  <= read_data_base;
		end if;
	end if;
  end process;
  read_data <= read_data_base when (read_enable_base_registered = '1') else read_data_base_reg;

end SimModel;

