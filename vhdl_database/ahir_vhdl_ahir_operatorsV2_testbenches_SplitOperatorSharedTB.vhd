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
use ahir.OperatorPackage.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity SplitOperatorSharedTB is
  generic
     ( g_num_req: integer := 2;
       operator_id: string := "ApIntAdd";
       verbose_mode: boolean := false;
       input_data_width: integer := 8;
       output_data_width: integer := 8;
       num_ips : integer := 2;
       tb_id : string := "anonymous"
     );
end SplitOperatorSharedTB;

architecture Behave of SplitOperatorSharedTB is

    constant num_req : integer := g_num_req;
    
    signal reqR, ackR, reqL, ackL : BooleanArray(num_req-1 downto 0);
    signal din_2 : StdLogicArray2D((2*num_req)-1 downto 0, input_data_width-1 downto 0);
    signal din_2_slv : std_logic_vector((input_data_width*2*num_req)-1 downto 0);
    
    signal din_1, din_2_c : StdLogicArray2D(num_req-1 downto 0, input_data_width-1 downto 0);
    signal din_1_slv, din_2_c_slv : std_logic_vector((input_data_width*2*num_req)-1 downto 0);
    signal dout_2, dout_1, dout_1_C: StdLogicArray2D(num_req-1 downto 0, output_data_width-1 downto 0);
    signal dout_2_slv, dout_1_slv, dout_1_C_slv  : std_logic_vector((num_req*output_data_width)-1 downto 0);

    signal op_idata : std_logic_vector((num_req*input_data_width*num_ips)-1 downto 0);
    signal op_odata : std_logic_vector((num_req*output_data_width)-1 downto 0);

    constant const_operand: std_logic_vector(input_data_width-1 downto 0) := (others => '1');

    type   Data2D is array(natural range <>) of std_logic_vector(input_data_width-1 downto 0);
    signal d2_1, d2_2, d1, d2_C: Data2D(num_req-1 downto 0);

    function Build_Data(tmp_addr: in Data2D) return StdLogicArray2D is
	variable tmp: StdLogicArray2D(num_req-1 downto 0, input_data_width-1 downto 0);
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

     din_2 <= Stack(Build_Data(d2_1), Build_Data(d2_2));

     GenBlock_2: for R in 0 to num_req-1 generate

       process 
         variable dv: natural;
	 variable counter: natural;
	 variable err_flag : boolean;
         variable td : std_logic_vector(output_data_width-1 downto 0);
         variable td_islv : IStdLogicVector(output_data_width-1 downto 0);
       begin 
         reqR(R) <= false;	
         reqL(R) <= false;

         counter := 1;

 	 err_flag := false;

         ----------------------------------------------------------------------
         -- first the request
         ----------------------------------------------------------------------
  	 dv := R + 2**(input_data_width-1);
         
         wait until reset = '0';
         
         while (dv < (2**input_data_width)-2) loop
           
           d2_1(R) <= (To_SLV(To_Unsigned(dv,input_data_width)));
           d2_2(R) <= (To_SLV(To_Unsigned(dv+1,input_data_width)));

           reqL(R) <= true;
	   assert not verbose_mode report "Operator Request " & Convert_To_String(R) & "," &
		Convert_To_String(counter) & " started in TB " & tb_id severity note;
           while true loop
             wait until clock = '1';
             reqL(R)  <= false;
             if(ackL(R)) then
		assert not verbose_mode report "Operator Request " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed in TB " & tb_id severity note;
               exit;
             end if;
           end loop;

           -- operation complete?
           reqR(R) <= true;
           while true loop
             wait until clock = '1';
             reqR(R) <= false;
             if(ackR(R)) then
		assert not verbose_mode report "Operation Complete " & Convert_To_String(R) & "," &
			Convert_To_String(counter) & " completed in TB " & tb_id  severity note;
	
                TwoInputOperation(operator_id,
                                     To_SLV(To_Unsigned(dv,input_data_width)),
                                     To_SLV(To_Unsigned(dv+1,input_data_width)),td);


                if(td /= (Extract(dout_2,R))) then
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

	assert err_flag report "Two Operator Tests Finished Successfully (" & Convert_To_String(R) & ") in TB "
			& tb_id
			severity note;
	assert (not err_flag) report "Two Operator Tests Failed (" & Convert_To_String(R) & ") in TB "
			& tb_id
			severity error;

        done_flag(R) <= true;
        success_flag(R) <= not err_flag;

	wait;
       end process;
     end generate GenBlock_2;

     --------------------------------------------------------------------------
     -- component instantiations
     --------------------------------------------------------------------------
     -- insert stuff which converts 2D array to SLV and back..
     din_2_slv <= To_SLV_Shuffle(din_2);
     dout_2 <= To_StdLogicArray2D(dout_2_slv, output_data_width);
     
     op2: SplitOperatorShared
       -- generic map needs to be redone..
       generic map (
        name => tb_id & "-op2", 
         operator_id  => operator_id,
        input1_is_int => true,
        input1_characteristic_width => 0,
        input1_mantissa_width    => 0,
        iwidth_1      => input_data_width,
        input2_is_int => true,
        input2_characteristic_width => 0,
        input2_mantissa_width      => 0,
        iwidth_2      => input_data_width,
        num_inputs     => 2,
        output_is_int => true,
        output_characteristic_width => output_data_width,
        output_mantissa_width    => 0,
         owidth     => output_data_width,
	constant_operand => const_operand,
        constant_width => const_operand'length,
        use_constant  => false,
        num_reqs => num_req,
        no_arbitration => false
        )
       port map (
         reqL => reqL,
	 ackL => ackL,
	 reqR => reqR,
 	 ackR => ackR,
	 dataL => din_2_slv,
	 dataR => dout_2_slv, 
	 clk => clock,
	 reset => reset);
end Behave;
