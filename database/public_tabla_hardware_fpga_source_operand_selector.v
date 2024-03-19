`timescale 1ns/1ps
module op_selector #(
parameter LEN = 8
)(
  	sel,
  	weight,
  	data,
  	alu_out,
  	interim,
  	meta,
  	neigh,
  	bus,
  	out
);

	// *****************************************************************************
	
	
	// *****************************************************************************
	input     [2:0]        sel;
	input     [LEN-1 : 0]  weight;
	input     [LEN-1 : 0]  data;
	input     [LEN-1 : 0]  alu_out;
	input     [LEN-1 : 0]  interim;
	input     [LEN-1 : 0]  meta;
	input     [LEN-1 : 0]  neigh;
	input     [LEN-1 : 0]  bus;
	output reg   [LEN-1 : 0]  out;


	// *****************************************************************************
//	wire [LEN-1 : 0] out1;
//	wire [LEN-1 : 0] out2;
//	wire [LEN-1 : 0] out3;
//	wire [LEN-1 : 0] out4;
//	wire [LEN-1 : 0] out5;
//	wire [LEN-1 : 0] out6;

//	assign out1 = sel[0] ? weight : 0;
//	assign out2 = sel[0] ? gradient: data;
//	assign out3 = sel[0] ? meta: interim;
//	assign out4 = sel[0] ? bus: neigh;

//	assign out5 = sel[1] ? out2 : out1;
//	assign out6 = sel[1] ? out4 : out3;

//	assign out = sel[2] ? out6 : out5;
    always @(*) begin
        case(sel)
            3'b0: out = {LEN{1'b0}};
//            3'd1: out = {LEN{1'b0}};
            3'd1: out = alu_out;
            3'd2: out = weight;
            3'd3: out = data;
            3'd4: out = meta;
            3'd5: out = interim;
            3'd6: out = neigh;
            default: out = bus;
         endcase
     end
endmodule
