module mem_ctrl(
    input clk,
    input [31:0]addr,
    input [31:0]data,
    input we,

    output reg [15:0]data_out = 16'b0
);

always @(posedge clk) begin
/*
*   Problem 4:
*   Drive 'data_out' register here
*/
end

endmodule
