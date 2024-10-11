// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

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
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

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
