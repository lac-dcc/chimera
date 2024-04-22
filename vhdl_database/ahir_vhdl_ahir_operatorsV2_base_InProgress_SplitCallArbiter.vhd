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
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity SplitCallArbiter is
  generic(name: string;
	  num_reqs: integer;
	  call_data_width: integer;
	  return_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
end SplitCallArbiter;


architecture Struct of SplitCallArbiter is
   signal pe_call_reqs:  std_logic_vector(num_reqs-1 downto 0);
   signal return_acks_sig: std_logic_vector(num_reqs-1 downto 0);

   type TwordArray is array (natural range <>) of std_logic_vector(return_mdata'length-1 downto 0);
   signal return_data_sig : TwordArray(num_reqs-1 downto 0);

   type TagwordArray is array (natural range <>) of std_logic_vector(caller_tag_length-1 downto 0);
   signal return_tag_sig : TagwordArray(num_reqs-1 downto 0);

   type CallStateType is (idle, busy);
   signal call_state: CallStateType;


   signal latch_call_data : std_logic;
   signal call_mdata_prereg, call_mdata_reg  : std_logic_vector(call_data_width-1 downto 0);
   signal callee_mtag_prereg, callee_mtag_reg, callee_mtag_forwarded  : 
					std_logic_vector(callee_tag_length-1 downto 0);
   signal caller_mtag_prereg, caller_mtag_reg, caller_mtag_forwarded  : 
					std_logic_vector(caller_tag_length-1 downto 0);

   signal fair_call_reqs, fair_call_acks: std_logic_vector(num_reqs-1 downto 0);
   signal return_mreq_sig : std_logic_vector(num_reqs-1 downto 0); 
   signal call_accept_bypass, latch_caller_tag: std_logic;

begin
  -----------------------------------------------------------------------------
  -- "fairify" the call-reqs.
  -----------------------------------------------------------------------------
  fairify: NobodyLeftBehind generic map (name => name & "-fairify", num_reqs => num_reqs)
		port map (clk => clk, reset => reset, reqIn => call_reqs, ackOut => call_acks,
					reqOut => fair_call_reqs, ackIn => fair_call_acks);

  -----------------------------------------------------------------------------
  -- priority encode incoming
  -----------------------------------------------------------------------------
   pe_call_reqs <= PriorityEncode(fair_call_reqs);

   ----------------------------------------------------------------------------
   -- process to handle call_reqs  --> call_mreq muxing
   ----------------------------------------------------------------------------
   process(clk,pe_call_reqs,call_state,call_mack,reset)
        variable nstate: CallStateType;
        variable there_is_a_call, call_accept_bypass_var : std_logic;

   begin
	nstate := call_state;
        there_is_a_call := OrReduce(pe_call_reqs);
	call_accept_bypass_var := '0';

	latch_call_data <= '0';
	call_mreq <= '0';

	if(call_state = idle) then
		if(there_is_a_call = '1') then
			call_mreq <= '1';
			latch_call_data <=  '1';
			call_accept_bypass_var := '1';
			if(call_mack /= '1') then
				nstate := busy;
			end if;
		end if;
	elsif (call_state = busy) then
		call_mreq <= '1';
		if(call_mack = '1') then
			if(there_is_a_call = '1') then
				latch_call_data <=  '1';
                        else
				nstate := idle;
			end if;
		end if;
	end if;
	
        call_accept_bypass <= call_accept_bypass_var;

	if(clk'event and clk = '1') then
		if(reset = '1') then
			call_state <= idle;
		else
			call_state <= nstate;
		end if;
	end if;
   end process;



   -- combinational process.. generate fair_call_acks, and also
   -- mux to input of call data register.
   process(pe_call_reqs,call_accept_bypass, latch_call_data, call_data)
	variable out_data : std_logic_vector(call_data_width-1 downto 0);
   begin
	fair_call_acks <= (others => '0');
	out_data := (others => '0');
       	for I in num_reqs-1 downto 0 loop
       		if(pe_call_reqs(I) = '1') then
			out_data := call_data(((I+1)*call_data_width)-1 downto
							I*call_data_width);
			if((call_accept_bypass = '1') or (latch_call_data = '1')) then
				fair_call_acks(I) <= '1';
			end if;
       		end if;
	end loop;
	call_mdata_prereg <= out_data;
   end process;

   -- call data register.
   process(clk)
   begin
     if(clk'event and clk = '1') then
     	if(latch_call_data = '1') then
		call_mdata_reg  <= call_mdata_prereg;
		callee_mtag_reg <= callee_mtag_prereg;
        end if;  -- I
     end if;
   end process;


   --
   -- forwarded data
   --
   call_mdata <= call_mdata_prereg when call_accept_bypass = '1' else call_mdata_reg;
   callee_mtag_forwarded <= callee_mtag_prereg when call_accept_bypass = '1' else callee_mtag_reg;

   -- tag generation.
   tagGen : BinaryEncoder generic map (name => name & "-tagGen", iwidth => num_reqs,
                                       owidth => callee_tag_length)
     port map (din => pe_call_reqs, dout => callee_mtag_prereg);

   -- on a successful call, register the tag from the caller
   -- side..
   process(clk)
	variable tvar : std_logic_vector(caller_tag_length-1 downto 0);
	variable latch_caller_tag_var : std_logic;
   begin
      latch_caller_tag_var := '0';
      tvar := (others => '0');
      for T in 0 to num_reqs-1 loop
         if(pe_call_reqs(T) = '1' and latch_call_data = '1') then
            latch_caller_tag_var := '1';
            tvar := call_tag(((T+1)*caller_tag_length)-1 downto T*caller_tag_length);
         end if;
       end loop;

       caller_mtag_prereg <= tvar;
       latch_caller_tag <= latch_caller_tag_var;

       if(clk'event and clk = '1') then
        if(latch_caller_tag_var = '1') then
		caller_mtag_reg <= tvar;
	end if;
       end if;
   end process;     

   -- call tag.
   caller_mtag_forwarded <= caller_mtag_prereg when call_accept_bypass = '1' else caller_mtag_reg;

   -- mtag forwarded to called function.
   call_mtag <= callee_mtag_forwarded & caller_mtag_forwarded;

   ----------------------------------------------------------------------------
   -- reverse path
   ----------------------------------------------------------------------------
   -- pack registers into return data array
   process(return_data_sig)
     variable lreturn_data : std_logic_vector((num_reqs*return_data_width)-1 downto 0);
   begin
     for J in return_data_sig'high(1) downto return_data_sig'low(1) loop
       lreturn_data(((J+1)*return_data_width)-1 downto J*return_data_width)
		:= return_data_sig(J);
       -- Insert(lreturn_data,J,return_data_sig(J));
     end loop;  -- J
     return_data <= lreturn_data;
   end process;
 
   -- 2D to 1D packing.
   process(return_tag_sig)
     variable lreturn_tag : std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
   begin
     for J in return_tag_sig'high(1) downto return_tag_sig'low(1) loop
       lreturn_tag(((J+1)*caller_tag_length)-1 downto J*caller_tag_length)
		:= return_tag_sig(J);
       -- Insert(lreturn_tag,J,return_tag_sig(J));
     end loop;  -- J
     return_tag <= lreturn_tag;
   end process;

   -- return mreq is '1' if any of the requesters is 
   -- accepting the return..
   return_mreq <= OrReduce(return_mreq_sig);

   -- return to caller.
   return_acks <= return_acks_sig;
   
   -- incoming data written into appropriate register.
   RetGen: for I in num_reqs-1 downto 0 generate

     fsm: block
       signal ack_reg, valid_flag : std_logic;
       signal data_reg : std_logic_vector(return_mdata'length-1 downto 0);
       signal tag_reg  : std_logic_vector(caller_tag_length-1 downto 0);
       signal return_state : CallStateType;
       signal bypass_flag: std_logic;
     begin  -- block fsm

       -- valid = '1' implies this index is incoming
       valid_flag <= '1' when return_mack = '1' and (I = To_Integer(To_Unsigned(return_mtag(caller_tag_length+callee_tag_length-1 downto caller_tag_length)))) else '0';

       --------------------------------------------------------------------------
       -- ack FSM
       --------------------------------------------------------------------------
       process(clk,return_state,return_reqs(I),valid_flag,reset)
	variable nstate: CallStateType;
	variable latch_var: std_logic;
	variable bypass_flag_var: std_logic;
	variable ack_var: std_logic;
       begin

	 nstate := return_state;

	 latch_var := '0';
	 bypass_flag_var := '0';

 	-- indicate to the requester that it can
	-- pick up return data I.
	 ack_var := '0';

	-- indicate to the function that I
	-- is picking up the return data.
	 return_mreq_sig(I) <= '0';

	 if(return_state = Idle) then
		if(valid_flag = '1') then

			-- if I is selected, then ack = '1'.
			ack_var := '1';
			bypass_flag_var := '1';


			-- if requester I reqs (wants to pick up)
			-- stay here, since the transfer is completed.
			-- Otherwise, latch the return data (goto busy)
			-- so the function can go on.
			if (return_reqs(I) = '0') then
				latch_var := '1';
				nstate := Busy;
			end if;
		end if;		
	 else 

		-- registered data.. keep acking!
		ack_var := '1';

		-- next returned data is arriving...
		-- latch it if reqs is accepting.
		if((valid_flag = '1') and (return_reqs(I) = '1')) then
			-- registered data is picked up, put the 
			-- incoming valid data into the latch and hang on.
			latch_var := '1';
		elsif (return_reqs(I) = '1') then
			nstate := Idle;
		end if;
	 end if;

	 bypass_flag <= bypass_flag_var;
	 return_mreq_sig(I) <= (bypass_flag_var or latch_var);
	 return_acks_sig(I) <= ack_var;

         if clk'event and clk= '1' then
           if(reset = '1') then
             return_state <= Idle;
	   else
	     return_state <= nstate;
	     if(latch_var = '1') then
             	data_reg <= return_mdata;
             	tag_reg  <= return_mtag(caller_tag_length-1 downto 0);
	     end if;
           end if;
         end if;
       end process;

       -- pass info out of the generate
       return_data_sig(I) <= return_mdata when bypass_flag = '1' else data_reg;
       return_tag_sig(I)  <= return_mtag (caller_tag_length-1 downto 0) when bypass_flag = '1' else tag_reg;

     end block fsm;
     
   end generate RetGen;

end Struct;
