// This program was cloned from: https://github.com/MikeS11/MiSTerFPGA_YC_Encoder
// License: MIT License

module dffen_2seg
(
    input wire clk, reset,
    input wire en,
    input wire d,
    output reg q
);
// s i g n a l d e c l a r a t i o n
reg data, nextdata;
// body
// D FF
always @(posedge clk , posedge reset)
if (reset)
    data <= 1'b0;
else
    data <= nextdata;

always @*
if(en)
    nextdata = d;
else
    nextdata = data;
// o u t p u t l o g i c
always @*
    q = data;

endmodule