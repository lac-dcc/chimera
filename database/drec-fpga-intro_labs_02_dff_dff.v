/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Module which is synthesized as D-flip-flop
*/

module dff(
    input clk,
    input d,

    output reg q
);

always @(posedge clk) begin
    q <= d;
end

endmodule
