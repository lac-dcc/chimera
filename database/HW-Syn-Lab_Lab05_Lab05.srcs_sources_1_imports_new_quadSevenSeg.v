// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns/1ns

module quadSevenSeg(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input [3:0] num0,
    input [3:0] num1,
    input [3:0] num2,
    input [3:0] num3,
    input clk
);

reg [1:0] ns;
reg [1:0] ps;
reg [3:0] dispEn;
reg [3:0] hexIn;
wire [6:0] segments;
assign seg = segments;

hexTo7Segment segDecode(segments, hexIn);
assign dp = 1;
assign an = ~dispEn;

initial 
begin
ns = 0; hexIn = 1;
end

always @(posedge clk)
begin
    ps=ns;
end

always @(ps)
begin
    ns=ps+1;
end

always @(ps)
begin
    case(ps)
        2'b00: dispEn=4'b0001;
        2'b01: dispEn=4'b0010;
        2'b10: dispEn=4'b0100;
        2'b11: dispEn=4'b1000;
    endcase 
end

always @(ps)
begin
    case(ps)
        2'b00: hexIn=num0;
        2'b01: hexIn=num1;
        2'b10: hexIn=num2;
        2'b11: hexIn=num3;
    endcase
end

endmodule