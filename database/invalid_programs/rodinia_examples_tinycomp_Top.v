`timescale 1ns / 1ps 
module Top (
	input wire clk,
	output wire[7:0] bank0,
	output wire[7:0] bank1,
	output wire[7:0] bank2,
	output wire[7:0] bank3
);

// TinyComp I/O
wire [31:0] IOvalue1;
wire [31:0] IOaddr1;
wire IOread1;
wire IOwrite1;
wire [31:0] IOvalue2;
wire [31:0] IOaddr2;
wire IOread2;
wire IOwrite2;
wire [31:0] IOvalue3;
wire [31:0] IOaddr3;
wire IOread3;
wire IOwrite3;

wire writeLED1;
assign writeLED1 = IOwrite1 & (IOaddr1 == 32'h000003ff);
wire writeLED2;
assign writeLED2 = IOwrite2 & (IOaddr2 == 32'h000003ff);
wire writeLED3;
assign writeLED3 = IOwrite3 & (IOaddr3 == 32'h000003ff);

// The CPU
TinyComp tc1(
	.Ph0(clk), .Ph1(~clk), .Reset(1'b0), 
	.IOaddr(IOaddr1), .OutData(IOvalue1), 
	.InData(32'b0), .InRdy(1'b1), .InStrobe(IOread1), .OutStrobe(IOwrite1)
);
TinyComp tc2(
	.Ph0(clk), .Ph1(~clk), .Reset(1'b0), 
	.IOaddr(IOaddr2), .OutData(IOvalue2), 
	.InData(32'b0), .InRdy(1'b1), .InStrobe(IOread2), .OutStrobe(IOwrite2)
);
TinyComp tc3(
	.Ph0(clk), .Ph1(~clk), .Reset(1'b0), 
	.IOaddr(IOaddr3), .OutData(IOvalue3), 
	.InData(32'b0), .InRdy(1'b1), .InStrobe(IOread3), .OutStrobe(IOwrite3)
);

always @(posedge clk) begin
	if (writeLED1) begin
		bank0 <= IOvalue1[7:0];
	end
	if (writeLED2) begin
		bank1 <= IOvalue2[7:0];
	end
	if (writeLED3) begin
		bank2 <= IOvalue3[7:0];
	end
end

endmodule
