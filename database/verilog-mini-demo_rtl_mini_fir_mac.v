// This program was cloned from: https://github.com/ic7x24/verilog-mini-demo
// License: MIT License

// ================================================================ 
// Verilog Mini Demo Project 
//  
// Licensed under the MIT License.
// 
// https://github.com/ic7x24/verilog-mini-demo 
// ================================================================

module mini_fir_mac (
    input             clk,
    input             rst_n,
    input      [ 7:0] i_data,
    input      [ 7:0] i_coeff,
    input      [18:0] i_prev,
    output reg [18:0] o_next    
);

// MPY_BITS = INBITS + COEFF_BITS
localparam MPY_BITS = 8+8;

// ACCU_BITS = MPY_BITS + log2(TAPS)
localparam ACCU_BITS = MPY_BITS + 3;


wire [MPY_BITS-1:0] mult;

wire [ACCU_BITS-1:0] adder;

// unsigned multiplier
assign mult  = i_data * i_coeff;

// unsigned adder
assign adder = i_prev + {{(ACCU_BITS-MPY_BITS){1'b0}}, mult[MPY_BITS-1:0]};

// 1-pipe
always @(posedge clk or negedge rst_n) begin
    if(~rst_n) 
        o_next <= 'd0;
    else
        o_next <= adder;
end

endmodule
