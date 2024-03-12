/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Counter to 10
*/

module counter(
    input clk,

    output clk2
);

assign clk2 = (cnt == 9);

reg [3:0]cnt = 0;

always @(posedge clk) begin
    if (clk2)
        cnt <= 0;
    else
        cnt <= cnt + 1;
end

endmodule
