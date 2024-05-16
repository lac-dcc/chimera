/////////////////////////////////////////////////////////////////////////////////////
//
//Copyright 2019  Li Xinbing
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.
//
/////////////////////////////////////////////////////////////////////////////////////

`define N(n)                       [(n)-1:0]
`define FFx(signal,bits)           always @ ( posedge clk or posedge  rst ) if (   rst   )  signal <= bits;  else

`define PERIOD 10
`define XLEN   32
`define DEL     2
module tb;

    reg clk = 0;
    always clk = #(`PERIOD/2) ~clk;
    
    reg rst = 1'b1;
    initial #(`PERIOD) rst = 1'b0;
	
	reg `N(`XLEN)    dividend = 0, divisor =0, quotient, remainder;
	reg              vld = 1'b0;
	
	wire             ack;
	wire `N(`XLEN)   quo,rem;
	
	localparam  STAGE_LIST = 32'h0101_0101;//32'b00000000_00000000_00000000_00000000;
	
	function `N($clog2(`XLEN+1)) bitcount( input `N(`XLEN) n);
	integer i;
	begin
	    bitcount = 0;
		for (i=0;i<`XLEN;i=i+1)
		    bitcount = bitcount + n[i];
	end
	endfunction
	
	wire `N($clog2(`XLEN+1)) stage_num = bitcount(STAGE_LIST);
	
	divfunc 
	#(
	    .XLEN         (    `XLEN                                       ),
		.STAGE_LIST   (    STAGE_LIST                                  )
	
	) i_div (
	    .clk          (    clk                                         ),
		.rst          (    rst                                         ),
		
		.a            (    dividend                                    ),
		.b            (    divisor                                     ),
		.vld          (    vld                                         ),
		
		.quo          (    quo                                         ),
		.rem          (    rem                                         ),
        .ack          (    ack                                         )		
	
	);


    task  one_div_operation(
        input `N(32) a,b
    );
	begin
	    dividend   = a;
		divisor    = b;
		quotient   = a/b;
		remainder  = a%b;
		$display("---ONE DIV OPERATION: dividend=%h, divisor=%h, quotient=%h, remainder=%h",dividend,divisor,quotient,remainder);
		
		@(posedge clk);
		#`DEL vld = 1'b1;
		@(posedge clk);
		if ( stage_num!=0 ) begin
		    #`DEL vld = 1'b0;
		    repeat(stage_num-1'b1) begin
		        @(posedge clk);
			    #`DEL vld = 1'b0;
		    end
		    @(posedge clk );
		end
		check_response;
		#`DEL vld = 1'b0;
	end
	endtask


    task check_response;
	begin
	    if ( ack & (quo==quotient) & (rem==remainder) ) begin
		    $display($time," ns---RESPONSE OK---");
		end else begin
		    $display($time," ns---RESPONSE ERROR---");
			$stop(1);
		end
	end
	endtask

    initial begin: initial_main
	    reg `N(`XLEN) a,b;
		repeat(100) begin
		    a = $random;
			b = $random;
			one_div_operation(a,b);
		end
		repeat(100) begin
		    a = $random;
			b = $random & 8'hff;
			one_div_operation(a,b);
		end		
		$display("---Verified OK---");
		$stop(1);
	end



endmodule