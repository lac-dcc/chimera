module qdiv #(
	//Parameterized values
	parameter Q = 15,
	parameter N = 32
	)
	(
	input 	[N-1:0] i_dividend,
	input 	[N-1:0] i_divisor,
	input 	i_start,
	input 	i_clk,
	output 	[N-1:0] o_quotient_out,
	output 	o_complete,
	output	o_overflow
	);
 
	reg [2*N+Q-3:0]	reg_working_quotient;	
	reg [N-1:0] 		reg_quotient;				
	reg [N-2+Q:0] 		reg_working_dividend;	
	reg [2*N+Q-3:0]	reg_working_divisor;		
 
	reg [N-1:0] 			reg_count; 		
													
										 
	reg					reg_done;			
	reg					reg_sign;			
	reg					reg_overflow;		
 
	initial reg_done = 1'b1;				
	initial reg_overflow = 1'b0;			
	initial reg_sign = 1'b0;				

	initial reg_working_quotient = 0;	
	initial reg_quotient = 0;				
	initial reg_working_dividend = 0;	
	initial reg_working_divisor = 0;		
 	initial reg_count = 0; 		

 
	assign o_quotient_out[N-2:0] = reg_quotient[N-2:0];	
	assign o_quotient_out[N-1] = reg_sign;						
	assign o_complete = reg_done;
	assign o_overflow = reg_overflow;
 
	always @( posedge i_clk ) begin
		if( reg_done && i_start ) begin										
			
			reg_done <= 1'b0;														
			reg_count <= N+Q-1;											
			reg_working_quotient <= 0;									
			reg_working_dividend <= 0;									
			reg_working_divisor <= 0;									
			reg_overflow <= 1'b0;										

			reg_working_dividend[N+Q-2:Q] <= i_dividend[N-2:0];				
			reg_working_divisor[2*N+Q-3:N+Q-1] <= i_divisor[N-2:0];		

			reg_sign <= i_dividend[N-1] ^ i_divisor[N-1];		
			end 
		else if(!reg_done) begin
			reg_working_divisor <= reg_working_divisor >> 1;	
			reg_count <= reg_count - 1;								

			//	If the dividend is greater than the divisor
			if(reg_working_dividend >= reg_working_divisor) begin
				reg_working_quotient[reg_count] <= 1'b1;										
				reg_working_dividend <= reg_working_dividend - reg_working_divisor;	
				end
 
			//stop condition
			if(reg_count == 0) begin
				reg_done <= 1'b1;										
				reg_quotient <= reg_working_quotient;			
				if (reg_working_quotient[2*N+Q-3:N]>0)
					reg_overflow <= 1'b1;
					end
			else
				reg_count <= reg_count - 1;	
			end
		end
endmodule

module Test_Div;

	// Inputs
	reg [31:0] i_dividend;
	reg [31:0] i_divisor;
	reg i_start;
	reg i_clk;

	// Outputs
	wire [31:0] o_quotient_out;
	wire o_complete;
	wire o_overflow;

	// Instantiate the Unit Under Test (UUT)
	qdiv uut (
		.i_dividend(i_dividend), 
		.i_divisor(i_divisor), 
		.i_start(i_start), 
		.i_clk(i_clk), 
		.o_quotient_out(o_quotient_out), 
		.o_complete(o_complete), 
		.o_overflow(o_overflow)
	);

	reg [10:0]	count;

	initial begin
		// Initialize Inputs
		i_dividend = 1;
		i_divisor = 1;
		i_start = 0;
		i_clk = 0;
		
		count <= 0;

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
		forever #2 i_clk = ~i_clk;
	end
        
		always @(posedge i_clk) begin
			if (count == 47) begin
				count <= 0;
				i_start <= 1'b1;
				end
			else begin				
				count <= count + 1;
				i_start <= 1'b0;
				end
			end

		always @(count) begin
			if (count == 47) begin
				if ( i_divisor > 32'h1FFFFFFF ) begin
					i_divisor <= 1;
					i_dividend = (i_dividend << 1) + 3;
					end
				else
					i_divisor = (i_divisor << 1) + 1;
				end
			end
			
	always @(posedge o_complete)
		$display ("%b,%b,%b, %b", i_dividend, i_divisor, o_quotient_out, o_overflow);		

endmodule
