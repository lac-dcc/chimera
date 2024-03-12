`timescale 1ns/1ns
module encode (
    fifo_empty_0, fifo_empty_1, fifo_empty_2, fifo_empty_3,
    fifo_sel, fifo_sel_domain
);

input  [0:15] fifo_empty_0, fifo_empty_1, fifo_empty_2, fifo_empty_3;
output [0:15] fifo_sel;
output [1:0]  fifo_sel_domain;

function [0:15] encode;
input [0:15] a;
input [0:15] b;
input [0:15] c;
input [0:15] d;
integer i;
begin
    if (!(&d))
        casex (d)
        16'b0xxxxxxxxxxxxxxx: encode = 16'b1000000000000000;
        16'b10xxxxxxxxxxxxxx: encode = 16'b0100000000000000;
        16'b110xxxxxxxxxxxxx: encode = 16'b0010000000000000;
        16'b1110xxxxxxxxxxxx: encode = 16'b0001000000000000;
        16'b11110xxxxxxxxxxx: encode = 16'b0000100000000000;
        16'b111110xxxxxxxxxx: encode = 16'b0000010000000000;
        16'b1111110xxxxxxxxx: encode = 16'b0000001000000000;
        16'b11111110xxxxxxxx: encode = 16'b0000000100000000;
        16'b111111110xxxxxxx: encode = 16'b0000000010000000;
        16'b1111111110xxxxxx: encode = 16'b0000000001000000;
        16'b11111111110xxxxx: encode = 16'b0000000000100000;
        16'b111111111110xxxx: encode = 16'b0000000000010000;
        16'b1111111111110xxx: encode = 16'b0000000000001000;
        16'b11111111111110xx: encode = 16'b0000000000000100;
        16'b111111111111110x: encode = 16'b0000000000000010;
        16'b1111111111111110: encode = 16'b0000000000000001;
        default:              encode = 16'b0000000000000000;
        endcase
    else if (!(&c))
        casex (c)
        16'b0xxxxxxxxxxxxxxx: encode = 16'b1000000000000000;
        16'b10xxxxxxxxxxxxxx: encode = 16'b0100000000000000;
        16'b110xxxxxxxxxxxxx: encode = 16'b0010000000000000;
        16'b1110xxxxxxxxxxxx: encode = 16'b0001000000000000;
        16'b11110xxxxxxxxxxx: encode = 16'b0000100000000000;
        16'b111110xxxxxxxxxx: encode = 16'b0000010000000000;
        16'b1111110xxxxxxxxx: encode = 16'b0000001000000000;
        16'b11111110xxxxxxxx: encode = 16'b0000000100000000;
        16'b111111110xxxxxxx: encode = 16'b0000000010000000;
        16'b1111111110xxxxxx: encode = 16'b0000000001000000;
        16'b11111111110xxxxx: encode = 16'b0000000000100000;
        16'b111111111110xxxx: encode = 16'b0000000000010000;
        16'b1111111111110xxx: encode = 16'b0000000000001000;
        16'b11111111111110xx: encode = 16'b0000000000000100;
        16'b111111111111110x: encode = 16'b0000000000000010;
        16'b1111111111111110: encode = 16'b0000000000000001;
        default:              encode = 16'b0000000000000000;
        endcase
    else if (!(&b))
        casex (b)
        16'b0xxxxxxxxxxxxxxx: encode = 16'b1000000000000000;
        16'b10xxxxxxxxxxxxxx: encode = 16'b0100000000000000;
        16'b110xxxxxxxxxxxxx: encode = 16'b0010000000000000;
        16'b1110xxxxxxxxxxxx: encode = 16'b0001000000000000;
        16'b11110xxxxxxxxxxx: encode = 16'b0000100000000000;
        16'b111110xxxxxxxxxx: encode = 16'b0000010000000000;
        16'b1111110xxxxxxxxx: encode = 16'b0000001000000000;
        16'b11111110xxxxxxxx: encode = 16'b0000000100000000;
        16'b111111110xxxxxxx: encode = 16'b0000000010000000;
        16'b1111111110xxxxxx: encode = 16'b0000000001000000;
        16'b11111111110xxxxx: encode = 16'b0000000000100000;
        16'b111111111110xxxx: encode = 16'b0000000000010000;
        16'b1111111111110xxx: encode = 16'b0000000000001000;
        16'b11111111111110xx: encode = 16'b0000000000000100;
        16'b111111111111110x: encode = 16'b0000000000000010;
        16'b1111111111111110: encode = 16'b0000000000000001;
        default:              encode = 16'b0000000000000000;
        endcase
    else
        casex (a)
        16'b0xxxxxxxxxxxxxxx: encode = 16'b1000000000000000;
        16'b10xxxxxxxxxxxxxx: encode = 16'b0100000000000000;
        16'b110xxxxxxxxxxxxx: encode = 16'b0010000000000000;
        16'b1110xxxxxxxxxxxx: encode = 16'b0001000000000000;
        16'b11110xxxxxxxxxxx: encode = 16'b0000100000000000;
        16'b111110xxxxxxxxxx: encode = 16'b0000010000000000;
        16'b1111110xxxxxxxxx: encode = 16'b0000001000000000;
        16'b11111110xxxxxxxx: encode = 16'b0000000100000000;
        16'b111111110xxxxxxx: encode = 16'b0000000010000000;
        16'b1111111110xxxxxx: encode = 16'b0000000001000000;
        16'b11111111110xxxxx: encode = 16'b0000000000100000;
        16'b111111111110xxxx: encode = 16'b0000000000010000;
        16'b1111111111110xxx: encode = 16'b0000000000001000;
        16'b11111111111110xx: encode = 16'b0000000000000100;
        16'b111111111111110x: encode = 16'b0000000000000010;
        16'b1111111111111110: encode = 16'b0000000000000001;
        default:              encode = 16'b0000000000000000;
        endcase
end
endfunction

assign fifo_sel = encode( fifo_empty_0, fifo_empty_1, fifo_empty_2, fifo_empty_3);
assign fifo_sel_domain = (!(&fifo_empty_3)) ? 2'b11 :
                         (!(&fifo_empty_2)) ? 2'b10 :
                         (!(&fifo_empty_1)) ? 2'b01 :
                         2'b00;
                         
endmodule

`timescale 1ns/1ns
module decode (
    fifo_sel, fifo_sel_domain,
    fifo_we_0, fifo_we_1, fifo_we_2, fifo_we_3
);

input  [0:15] fifo_sel;
input  [1:0]  fifo_sel_domain;
output [0:15] fifo_we_0, fifo_we_1, fifo_we_2, fifo_we_3;

assign fifo_we_0 = (fifo_sel_domain == 2'b00) ? fifo_sel : {16{1'b0}};
assign fifo_we_1 = (fifo_sel_domain == 2'b01) ? fifo_sel : {16{1'b0}};
assign fifo_we_2 = (fifo_sel_domain == 2'b10) ? fifo_sel : {16{1'b0}};
assign fifo_we_3 = (fifo_sel_domain == 2'b11) ? fifo_sel : {16{1'b0}};

endmodule
