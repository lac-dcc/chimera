// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 

assign out_assign = sel_b1 & sel_b2 ? b : a;
always @(*) begin
    out_always = sel_b1 & sel_b2 ? b : a;
end
endmodule
