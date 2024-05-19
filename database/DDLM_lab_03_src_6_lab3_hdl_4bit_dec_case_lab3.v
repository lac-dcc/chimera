// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module b6_4bit_dec_case (
  input [3:0] binary_in,
  output reg [15:0] decoder_out,
  input enable
);

always @ (*)
begin
  decoder_out = 0;
  if (enable) begin
    case (binary_in)
      4'h0 : decoder_out = 16'h1;
      4'h1 : decoder_out = 16'h2;
      4'h2 : decoder_out = 16'h4;
      4'h3 : decoder_out = 16'h8;
      4'h4 : decoder_out = 16'h10;
      4'h5 : decoder_out = 16'h20;
      4'h6 : decoder_out = 16'h40;
      4'h7 : decoder_out = 16'h80;
      4'h8 : decoder_out = 16'h100;
      4'h9 : decoder_out = 16'h200;
      4'hA : decoder_out = 16'h400;
      4'hB : decoder_out = 16'h800;
      4'hC : decoder_out = 16'h1000;
      4'hD : decoder_out = 16'h2000;
      4'hE : decoder_out = 16'h4000;
      4'hF : decoder_out = 16'h8000;
    endcase
  end
end	

endmodule


module b6_custombit_dec (
   binary_in,
   decoder_out,
   enable
);

	parameter IN_SIZE = 4;
	
	parameter OUT_SIZE = 1<<IN_SIZE;
	
	
	input  wire [IN_SIZE-1:0] binary_in;
	output reg [OUT_SIZE-1:0] decoder_out;
	input enable;
	reg [IN_SIZE-1:0] binary_tst;
	
	
	genvar i;

generate

			
		for (i=0; i<OUT_SIZE; i=i+1) begin : gen

		 always @(*) begin
		 
				if(enable && binary_in == i)
				  decoder_out <= 1<<i;
				//else
					//decoder_out <= 'bZ;
			end
		end
		
    
	
endgenerate
endmodule



module enc (in,out,enable);
	parameter OUT_SIZE = 4;
	parameter IN_SIZE = 1<<OUT_SIZE;
	
	input  wire [IN_SIZE-1:0] in;
	output reg [OUT_SIZE-1:0] out;
	input enable;
	
	genvar i;
	generate
		for(i=0;i<IN_SIZE-1;i=i+1) begin :gen_block
			always @(*) begin
				if(enable && in[i]==1'b1 && in[IN_SIZE-1:i+1]=='b0)
					out = i;
				else
					out = 'bZ;
			end
		end
	endgenerate
	
	always @(*) begin
	if(enable && in[IN_SIZE-1])
			out = IN_SIZE-1;
	else
	    	out = 'bZ;
	end
endmodule


module timeQuest_wrapper(clock,SW,LED,enable);
	input clock,enable;
	input [3:0] SW;
	output [9:0] LED;
 
	reg [3:0] SW_reg;
	reg [9:0] LED_reg; // registers for 'catching' time
 
	wire [9:0] LED_wire;
	wire [3:0] SW_wire;
	assign SW_wire = SW_reg;
	
	// creating our test instance
	b6_4bit_dec_case (SW_reg,LED_wire,enable);
  
   // clock needed to determine at which step register was filled with data
	always @(posedge clock)
		begin
			SW_reg <= SW; // avoiding race and latch by setting '<=' instead of '='
			LED_reg<=LED_wire;
		end
	assign LED = LED_reg;
endmodule


module lab3
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

	enc  (SW,LEDR,KEY[0]);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	//timeQuest_wrapper(KEY[1],SW,LEDR,KEY[0]);
	
endmodule