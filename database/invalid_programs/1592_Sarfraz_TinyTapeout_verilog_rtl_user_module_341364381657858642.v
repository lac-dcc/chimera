// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0


`default_nettype none

module user_module_341364381657858642(
  input [7:0] io_in,
  output [7:0] io_out
);

mcpu6bit mcpu6bit_top (
  .clk(io_in[0]),
  .rst(io_in[1]),
  .datain(io_in[7:2]),

  .we(io_out[1]),
  .dataout(io_out[7:2])
);

endmodule


module mcpu6bit(datain,dataout,we,rst,clk);

input [5:0] datain;
output [5:0] dataout;
output we;
input rst;
input clk;

reg [6:0] accumulator; // accumulator(6) is carry !
reg [3:0] adreg;
reg [3:0] pc;
reg [2:0] states;

initial begin
end

	always @(posedge clk)
		if (~rst) begin
			adreg 	  <= 0;
			states	  <= 0;
			accumulator <= 0;	
			pc <= 0;
		end
		else begin
			// PC / Address path
			if (~|states) begin
				pc	 <= adreg + 1'b1;
				adreg <= datain[3:0];  // was adreg <=pc, aw fix.
			end
			else adreg <= pc;
		
			// ALU / Data Path
			case(states)
				3'b010 : accumulator 	 <= {1'b0, accumulator[5:0]} + {1'b0, datain}; // add
				3'b011 : accumulator[5:0] <= ~(accumulator[5:0]|datain); // nor
				3'b101 : accumulator[6]   <= 1'b0; // branch not taken, clear carry					   
			endcase							// default:  instruction fetch, jcc taken

			// State machine
			if (|states) states <= 0;
			else begin 
				if ( &datain[5:4] && accumulator[6] ) states <= 3'b101;
				else states <= {1'b0, ~datain[5:4]};
			end
		end

assign dataout   = clk ?  {1'b00,adreg} : accumulator[5:0]; 
assign we     =  ~rst | (states!=3'b001) ; 

endmodule
