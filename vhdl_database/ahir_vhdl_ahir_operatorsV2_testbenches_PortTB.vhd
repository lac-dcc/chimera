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
use ahir.Components.all;
use ahir.BaseComponents.all;

entity PortTB is
  generic
     ( g_num_req: integer := 2;
       verbose_mode: boolean := false;
       tb_id : string := "anonymous"
     );
end PortTB;

architecture Behave of PortTB is

    constant data_width : integer := 8;
    constant num_req : integer := g_num_req;
    
    signal reqR, ackR, reqL, ackL : BooleanArray(num_req-1 downto 0);
    signal din, dout : std_logic_vector((num_req*data_width)-1 downto 0);

    type   Data2D is array(natural range <>) of std_logic_vector(data_width-1 downto 0);
    signal din_raw, dout_raw: Data2D(num_req-1 downto 0);

    function Build_Data(tmp_addr: in Data2D) return std_logic_vector is
	variable tmp: std_logic_vector((num_req*data_width)-1 downto 0);
    begin
        for I in 0 to num_req-1 loop
            Insert(tmp,I,tmp_addr(I));
        end loop;
	return(tmp);
    end function Build_Data;

    signal clock, reset : std_logic := '0';

    signal done_flag, success_flag: BooleanArray(num_req-1 downto 0);
begin

     clock <= not clock after 5 ns;

     process(done_flag)
     begin
        if(AndReduce(done_flag))then
           if(AndReduce(success_flag)) then
              assert false report "All Tests Have Passed in TB " & tb_id  severity note;
	   else
              assert false report "Some Tests Have Failed in TB " & tb_id severity error;
	   end if;
        end if;
     end process;
    
     process
     begin
	 reset <= '1';
         wait until clock = '1';
         reset <= '0' after 1 ns;
 	 wait;
     end process;

     din <= Build_Data(din_raw);

     GenBlockSend: for R in 0 to num_req-1 generate

       process 
         variable dv: natural;
	 variable counter: natural;
         variable td : std_logic_vector(data_width-1 downto 0);
       begin 
         reqL(R) <= false;
         counter := 1;

         ----------------------------------------------------------------------
         -- first the request
         ----------------------------------------------------------------------
  	 dv := R + 2**(data_width-1);
         
         wait until reset = '0';
         
         while (dv < (2**data_width)-2) loop
           
           din_raw(R) <= (To_SLV(To_Unsigned(dv,data_width)));

           reqL(R) <= true;
	   assert not verbose_mode report "Send request " & Convert_To_String(R) & "," &
		Convert_To_String(counter) & " started in TB " & tb_id severity note;
           while true loop
             wait until clock = '1';
             reqL(R)  <= false;
             if(ackL(R)) then
		assert not verbose_mode report "Send Request " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed in TB " & tb_id severity note;
               exit;
             end if;
           end loop;

	   dv := dv + num_req;
	   counter := counter  + 1;
         end loop;
	wait;
       end process;
     end generate GenBlockSend;

     GenBlockReceive: for R in 0 to num_req-1 generate

       process(dout)
         variable dout_var : std_logic_vector(data_width-1 downto 0);
       begin
         Extract(dout,R,dout_var);
         dout_raw(R) <= dout_var;
       end process;


       process 
         variable dv: natural;
	 variable counter: natural;
	 variable err_flag : boolean;
         variable dout_var : std_logic_vector(data_width-1 downto 0);
       begin 
         reqR(R) <= false;	
         counter := 1;
 	 err_flag := false;

  	 dv := R + 2**(data_width-1);

         wait until reset = '0';

         while (dv < (2**data_width)-2) loop
           
           -- operation complete?
           reqR(R) <= true;
	   assert not verbose_mode report "Receive request " & Convert_To_String(R) & "," &
		Convert_To_String(counter) & " started in TB " & tb_id severity note;
           while true loop
             wait until clock = '1';
             reqR(R) <= false;
             if(ackR(R)) then
		assert not verbose_mode report "Receive Request " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed in TB " & tb_id  severity note;

                Extract(dout,R,dout_var);
                if(To_SLV(To_Unsigned(dv,data_width)) /= dout_var) then
                  err_flag := true;
                  assert false report "Mismatch observed at " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " in TB " & tb_id  severity note;                  
		end if;
               exit;
             end if;
             
           end loop;

	   dv := dv + num_req;
	   counter := counter  + 1;
         end loop;

	assert err_flag report "Send/Receive Tests Finished Successfully (" & Convert_To_String(R) & ") in TB "
			& tb_id
			severity note;
	assert (not err_flag) report "Send/Receive Tests Failed (" & Convert_To_String(R) & ") in TB "
			& tb_id
			severity error;

        done_flag(R) <= true;
        success_flag(R) <= not err_flag;
	wait;
       end process;
     end generate GenBlockReceive;

     --------------------------------------------------------------------------
     -- component instantiations: output port linked to input port
     --------------------------------------------------------------------------
     InstanceBlock: block
	signal ip_to_op_ack, op_to_ip_req: std_logic;
	signal op_to_ip_data: std_logic_vector(data_width-1 downto 0);
     begin
     	op: OutputPort generic map(name => tb_id & "-op", num_reqs => num_req, data_width => data_width , no_arbitration => false)
		port map(req => reqL,
		 	ack => ackL,
		 	data => din,
		 	oreq => op_to_ip_req,
		 	oack => ip_to_op_ack,
                 	odata => op_to_ip_data,
		 	clk => clock,
		 	reset => reset);
        
     	ip: InputPort generic map (name => tb_id & "-ip", num_reqs => num_req, data_width => data_width , no_arbitration => false)
 		port map (req => reqR,
                  	ack => ackR,
                  	data => dout,
		  	oreq => ip_to_op_ack,
                  	oack => op_to_ip_req,
		  	odata => op_to_ip_data,
		  	clk => clock,
		  	reset => reset);
      end block;
end Behave;
