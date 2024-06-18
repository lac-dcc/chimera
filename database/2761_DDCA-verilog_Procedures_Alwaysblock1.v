// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);

assign out_assign = a & b ;
always @(*) begin
    out_alwaysblock = a&b;
end

endmodule