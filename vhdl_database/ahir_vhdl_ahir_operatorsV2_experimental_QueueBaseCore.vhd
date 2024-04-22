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
-- copyright: Madhav Desai
--   re-engineered Queue core implementation to improve LUT count and critical path!
--   Why didn't I think of this before?
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

entity QueueBaseCore is
  generic(name : string := "Anon"; 
		queue_depth: integer := 3; 
		reverse_bypass_flag: boolean := false;
		data_width: integer := 32);
  port(clk: in std_logic;
       reset: in std_logic;
       empty, full: out std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity QueueBaseCore;

architecture behave of QueueBaseCore is

  type QueueArray is array(natural range <>) of std_logic_vector(data_width-1 downto 0);

-- see comment above..
--##decl_synopsys_sync_set_reset##

begin  -- SimModel

 pDZero:  if(queue_depth = 0) generate

	empty <= '1';
	full  <= '1';

	data_out <= data_in;

	push_ack <= pop_req;
	pop_ack  <= push_req;

 end generate pDZero;

 pDEq1: if (queue_depth = 1) generate
    bbb1: block
	signal qsize: std_logic;
	signal push_ack_sig, pop_ack_sig: std_logic;
    begin
   

     	rbpGen1: if (reverse_bypass_flag) generate
		push_ack_sig <= '1' when (qsize = '0') or (pop_req = '1') else '0';
     	end generate rbpGen1;

     	noRbpGen1: if (not reverse_bypass_flag) generate
		push_ack_sig <= '1' when (qsize = '0') else '0';
     	end generate noRbpGen1;
		
	pop_ack_sig  <= '1' when (qsize = '1') else '0';

	full  <= not push_ack_sig;
	empty <= not pop_ack_sig;

	push_ack <= push_ack_sig;
	pop_ack <= pop_ack_sig;
     	ob: block
        	signal queue_data: std_logic_vector(data_width-1 downto 0);
     	begin
		
		process(clk, reset, data_in, push_req, push_ack_sig, pop_req, pop_ack_sig, qsize, queue_data)
        		variable next_queue_data: std_logic_vector(data_width-1 downto 0);
			variable next_qsize: std_logic;
			variable push, pop: boolean;
		begin 
		 	next_qsize := qsize;
			next_queue_data := queue_data;

			push := (push_req = '1') and (push_ack_sig = '1');
			pop := (pop_req = '1') and (pop_ack_sig = '1');

			if (push and (not pop)) then
				next_qsize := '1';
			elsif (pop and (not push)) then
				next_qsize := '0';
			end if;

			if(push) then
				next_queue_data := data_in;
			end if;

			if(clk'event and (clk = '1')) then
				if(reset = '1') then
					qsize <= '0';
					queue_data <= (others => '0');
				else
					qsize <= next_qsize;
					queue_data <= next_queue_data;
				end if;
			end if;
		end process;

		data_out <= queue_data;
     	end block ob;
    end block bbb1;
 end generate pDEq1;
 
 pDGOne: if (queue_depth > 1) generate

     lb: block
     	signal queue_data: QueueArray (0 to queue_depth-1); 
        signal state_vector: std_logic_vector(queue_depth-1 downto 0);
        signal reverse_bypass_applicable : boolean;
	signal push_ack_sig, pop_ack_sig: std_logic;
	constant Zstatus: std_logic_vector(queue_depth-1 downto 0) := (others => '1');
     begin


	empty <= (not pop_ack_sig);
	full  <= (not push_ack_sig);
	
     	rbpGen: if (reverse_bypass_flag) generate

     		push_ack_sig <= '1' when ((state_vector(queue_depth-1) = '0') or reverse_bypass_applicable) else '0';
		reverse_bypass_applicable <= (state_vector = Zstatus) and (pop_req = '1');
     	end generate rbpGen;
	
     	noRbpGen: if (not reverse_bypass_flag) generate
     		push_ack_sig <= '1' when (state_vector(queue_depth-1) = '0')  else '0';
		reverse_bypass_applicable <= false;
     	end generate noRbpGen;
	push_ack <= push_ack_sig;

     	pop_ack_sig <= '1' when state_vector(0) = '1' else '0';
	pop_ack <= pop_ack_sig;

     	data_out <= queue_data(0);

	-- sequence of stages
	--   Each stage has the following inputs
	--        push pop  status(k+1) status(k) status(k-1)
	--   and performs actions as follows:
	--  -------------------------------------------------------------------
	--   status(k+1) status(k) status(k-1)   Action
	--  -------------------------------------------------------------------
	--      0           0            0        No action.
	--      0           0            1        If push.(~pop), then load din 
	--                                        into stage, set status(k) = 1
	--                                        Else, nothing.
	--      0           1            1        If push.pop then load din into
	--                                        stage, status stays the same.
	--                                        If (~push).pop set status(k) = 0
	--                                        Else nothing.
	--      1           1             1       If pop load data(k+1) into
	--                                        stage, keep status(k) = 1
	--                                        Else nothing.
	--  -------------------------------------------------------------------
	stageGen: for K in queue_depth-1 downto 0 generate 
		sb: block
		   -- signals
		   signal data_kp1: std_logic_vector(data_width-1 downto 0);
                   signal status_kp1, status_k, status_km1: std_logic;
		   signal stat_3 : std_logic_vector(2 downto 0); 
		   signal push, pop: boolean;
		begin
			push <= (push_req = '1') and (push_ack_sig = '1');
			pop  <= (pop_req = '1')  and (pop_ack_sig  = '1');

			stat_3 (1) <= state_vector(K);

			topGen: if (K = (queue_depth - 1)) generate
			    cb: block
                            begin
				stat_3 (2) <= '0';
				stat_3 (0) <= state_vector(K-1);
				data_kp1 <= (others => '0');
                            end block cb;
			end generate topGen;

			midGen: if (K < (queue_depth-1)) and (K > 0) generate 
			    cb: block
                            begin
				stat_3 (2) <= state_vector(K+1);
				stat_3 (0) <= state_vector(K-1);
				data_kp1 <= queue_data(K+1);
                            end block cb;
			end generate midGen;

			botGen: if (K = 0) generate
			    cb: block
                            begin
				stat_3 (2) <= state_vector(K+1);
				stat_3 (0) <= '1';
				data_kp1 <= queue_data(K+1);
                            end block cb;
			end generate botGen;
		
			status_k <= state_vector(K);

			process(clk, reset)
                   		variable next_status_k_var: std_logic;
				variable next_stage_data_var: std_logic_vector(data_width-1 downto 0);
			begin
				next_status_k_var := status_k;
				next_stage_data_var := queue_data(K);
				
				case stat_3 is
					when "001" =>
						if(push and (not pop)) then
							next_stage_data_var := data_in;
							next_status_k_var   := '1';
						end if;
					when "011" =>
						if (push and pop) then
							next_stage_data_var := data_in;
							next_status_k_var := '1';
						elsif ((not push) and pop) then
							next_status_k_var := '0';
						end if;
					when "111" =>
						if pop then
							next_stage_data_var := data_kp1;
						end if;
					when others => null;
				end case;	
			
				if(clk'event and (clk = '1')) then
					if(reset = '1') then
						state_vector(K) <= '0';
						queue_data(K) <= (others => '0');
					else
						state_vector(K) <= next_status_k_var;
						queue_data(K) <= next_stage_data_var;
					end if;
				end if;
			end process;
		end block sb;
	end generate stageGen;
     end block lb;
 end generate pDGOne;


end behave;
