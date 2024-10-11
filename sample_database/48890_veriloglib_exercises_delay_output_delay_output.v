// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module delay_output
#(
    parameter integer LENGTH = 8
)
(
    input clk,
    input datain,
    output reg dataout
);

reg [LENGTH-1:0] delay_chain;
integer i = 0;

always @(posedge clk)
begin
    delay_chain[0] <= datain;
    for(i = 1; i < LENGTH-1; i = i + 1)
        delay_chain[i+1] <= delay_chain[i];
    dataout <= delay_chain[LENGTH-1];
end

endmodule