// This program was cloned from: https://github.com/shuji-oh/PLI_TDC_for_CAN
// License: MIT License

/*
 * Simple testbench for UART.  Loop the rx and tx pins to each other and send
 * incrementing bytes, make sure that we receive what we expected.
 */
`timescale 1ns/100ps
module tdc_test();

reg clk = 0;
reg sw = 0;
reg rst = 0;
reg can = 0;
reg [6:0] hex5;
reg [6:0] hex4;
reg [6:0] hex3;
wire [20:0] data;

ex_divider test_tdc(
    .out_data(data),
    .CLK(clk),
    .SW(sw),
    .RST(rst),
    .CAN_logic(can),
    .HEX5(hex5),
    .HEX4(hex4),
    .HEX3(hex3)
);

initial begin
	$dumpfile("tdc.vcd");
	$dumpvars(0, tdc_test);
end

always begin
	#1 clk = ~clk;
    #10 can = ~can;
end

always @(posedge clk) begin
	$display("SUCCESS: send to slave %x", hit);
end

endmodule
