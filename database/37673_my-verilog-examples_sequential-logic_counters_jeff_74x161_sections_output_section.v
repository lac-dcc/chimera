// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// MUST PUT includes IN TESTBENCH SINCE MY 8-bit PROCESSOR IS CALLING THESE FILES
//`include "../../../basic-code/sequential-logic/jk_flip_flop/jk_flip_flop_pos_edge_sync_clear.v"

module output_section (
    input  clr_bar,
    input  ld,
    input  feedback,
    input  clk,
    input  data,
    output q);

wire NOTHING;

assign to_j_and_k = (feedback | ld);

assign to_j = ~(ld & to_k);
assign to_k = ~(data & ld);
 
assign j = (to_j & to_j_and_k);
assign k = (to_k & to_j_and_k);

jk_flip_flop_pos_edge_sync_clear_behavioral JK (
    .clk(clk),       
    .clrbar(clr_bar),
    .j(j),        
    .k(k),        
    .q(q),    
    .qbar(NOTHING)     
);

endmodule





