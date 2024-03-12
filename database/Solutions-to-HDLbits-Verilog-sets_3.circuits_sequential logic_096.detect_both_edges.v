module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] in_last;
    always @(posedge clk) begin
        in_last <= in;
        anyedge <= in ^ in_last;
    end 
endmodule
