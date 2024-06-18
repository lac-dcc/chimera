// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns / 1ns

module debouncer(
        input i,
        input clk,
        output reg o
    );

reg ls = 0;

always @(posedge clk)
begin
if(i)
    begin
    if(ls)
        begin
        o = 1;
        ls = i;
        end
    else
        begin
        o = 0;
        ls = i;
        end
    end
else
    begin
    o = 0;
    ls = i;
    end
end
endmodule
