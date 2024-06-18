// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

`timescale 1 ns / 1 ps
module ecc_testmodul(
                     set_fail,
                     data_in_i,
                     fail_location_0,
                     fail_location_1,
                     fail_location_2,
                     data_out_o,
					 single_error,
                     double_error
					 );


input [2:0]    set_fail;
input [31:0]   data_in_i;
input [5:0]    fail_location_0;
input [5:0]    fail_location_1;
input [5:0]    fail_location_2;
output [31:0]  data_out_o;
output         single_error;
output         double_error;




reg [38:0]   code_fail;
reg [38:0]   code_reg;

wire [38:0]  code_out_encoder;


ecc_encode encoder(.data_in(data_in_i),
                   .code_out(code_out_encoder));

ecc_decode decoder(.code_in(code_fail),
                   .data_out(data_out_o),
                   .single_error(single_error),
				   .double_error(double_error)
				   );

always @(*)
	begin
    	code_fail=code_out_encoder;
	  	
        if(set_fail[0]==1'b1)
	    	begin
	       		code_fail[fail_location_0]=!code_fail[fail_location_0];
	    	end
            
        if(set_fail[1]==1'b1)
	    	begin
	       		code_fail[fail_location_1]=!code_fail[fail_location_1];
	    	end
            
        if(set_fail[2]==1'b1)
	    	begin
	       		code_fail[fail_location_2]=!code_fail[fail_location_2];
	    	end    
            
  	end




endmodule
