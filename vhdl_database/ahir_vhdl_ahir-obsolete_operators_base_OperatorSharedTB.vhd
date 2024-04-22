library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity OperatorSharedTB is
  generic
     ( g_num_req: integer := 2;
       operator_id: string := "ApIntSle";
       zero_delay : boolean := false;
       verbose_mode: boolean := false;
       tb_id : string := "anonymous"
     );
end OperatorSharedTB;

architecture Behave of OperatorSharedTB is

    constant input_data_width : integer := 8;
    constant output_data_width : integer := 1;
    constant num_req : integer := g_num_req;
    
    signal reqR, ackR, reqL, ackL : BooleanArray(num_req-1 downto 0);
    signal din_2 : StdLogicArray2D((2*num_req)-1 downto 0, input_data_width-1 downto 0);
    signal din_1, din_2_c : StdLogicArray2D(num_req-1 downto 0, input_data_width-1 downto 0);
    signal dout_2, dout_1, dout_1_C: StdLogicArray2D(num_req-1 downto 0, output_data_width-1 downto 0);
    
    constant const_operand: IStdLogicVector(input_data_width-1 downto 0) := (others => '1');

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

    constant def_colouring: NaturalArray(num_req-1 downto 0) := (0 => 0, others => 1);
    constant def_suppress_imm_ack : BooleanArray(num_req - 1 downto 0) := (others => false);
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
                                     To_ISLV(To_SLV(To_Unsigned(dv,input_data_width))),
                                     To_ISLV(To_SLV(To_Unsigned(dv+1,input_data_width))),td_islv);

		td := to_SLV(td_islv);

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
     op2: OperatorShared
       generic map (operator_id => operator_id,
		    const_operand => const_operand,
		    use_constant => false,
		    colouring   => def_colouring,
                    suppress_immediate_ack => def_suppress_imm_ack)
       port map (
         reqL => reqL,
	 ackL => ackL,
	 reqR => reqR,
 	 ackR => ackR,
	 dataL => din_2,
	 dataR => dout_2,
	 clk => clock,
	 reset => reset);
end Behave;
