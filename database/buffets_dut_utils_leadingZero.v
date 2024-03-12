// 
// Author: Kartik Hegde (kartikhegde.net)
//
// Copyright (c) 2019 Authors of "Buffets: An Efficient and Composable Storage Idiom for Explicit Decoupled Data
// Orchestration".
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
// Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



// This file is a work under progress: Need to parametrize

// Lowest level of number of leading zeros
module encode
        (array,
        enc_array);

input       [1:0]   array;
output reg  [1:0]   enc_array;

// Combo
always@(*) begin
    if(array == 2'b00)
        enc_array = 2'b10;
    else if(array == 2'b01)
        enc_array = 2'b01;
    else
        enc_array = 2'b00;
end

endmodule


module assemble
        (
        array_i,
        array_o
    );

   // external parameter
   parameter   WIDTH = 2;
   // internal parameters
   localparam WIDTH_IN = 2 * WIDTH;
   localparam   WIDTH_OUT = WIDTH + 1;

   input        [WIDTH_IN-1:0]  array_i;
   output reg   [WIDTH_OUT-1:0] array_o;

   wire     [WIDTH_IN/2-1:0]    RHS = array_i[WIDTH-1:0];
   wire     [WIDTH_IN/2-1:0]    LHS = array_i[WIDTH_IN-1: WIDTH];

   always @(*) begin
       if(LHS[WIDTH-1] &  RHS[WIDTH-1])
           array_o = {1'b1, {WIDTH{1'b0}}};
       else if(LHS[WIDTH-1] & ~RHS[WIDTH-1])
           array_o = {2'b01, RHS[WIDTH-2:0]};
       else if(~LHS[WIDTH-1])
           array_o = {1'b0, LHS};
   end

endmodule 

// TODO: Make this below a recursive parametrizable function

module leadingZero32
    (
    sequence,
    index
    );
    
    input   [31:0]  sequence;
    output  [5:0]   index;

    wire [31:0] enc_sequence;
    wire [23:0] sequence_step1;
    wire [15:0] sequence_step2;
    wire [9:0]  sequence_step3;

	genvar i;
	generate
		for (i=0; i<16; i=i+1) begin : encoder
		encode u_enc(
			.array(sequence[i*2 +: 2]),
			.enc_array(enc_sequence[i*2 +: 2])
		);
	end 
	endgenerate


	generate
	for (i=0; i<8; i=i+1) begin : assembleS1
		assemble #(
				.WIDTH(2)
				) u_assemble(
					.array_i(enc_sequence[i*4 +: 4]),
					.array_o(sequence_step1[i*3 +: 3])
				);
	end 
	endgenerate

	generate
	for (i=0; i<4; i=i+1) begin : assembleS2
		assemble #(
				.WIDTH(3)
				) u_assemble(
					.array_i(sequence_step1[i*6 +: 6]),
					.array_o(sequence_step2[i*4 +: 4])
				);
	end 
	endgenerate


	generate
	for (i=0; i<2; i=i+1) begin : assembleS3
		assemble #(
				.WIDTH(4)
				) u_assemble(
					.array_i(sequence_step2[i*8 +: 8]),
					.array_o(sequence_step3[i*5 +: 5])
				);
	end 
	endgenerate

	assemble #(5)u_assemble(sequence_step3, index);

endmodule

module leadingZero8
    (
    sequence,
    index
    );
    
    parameter W = 8;

    input   [W-1:0]  sequence;
    output  [3:0]   index;

    wire [W-1:0] enc_sequence;
    wire [5:0] sequence_step1;

	genvar i;
	generate
		for (i=0; i<W/2; i=i+1) begin : encoder
		encode u_enc(
			.array(sequence[i*2 +: 2]),
			.enc_array(enc_sequence[i*2 +: 2])
		);
	end 
	endgenerate


	generate
	for (i=0; i<W/4; i=i+1) begin : assembleS1
		assemble #(
				.WIDTH(2)
				) u_assemble(
					.array_i(enc_sequence[i*4 +: 4]),
					.array_o(sequence_step1[i*3 +: 3])
				);
	end 
	endgenerate

	assemble #(3)u_assemble(sequence_step1, index);

endmodule



