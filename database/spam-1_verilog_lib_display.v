// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef V_DISPLAY
`define V_DISPLAY

`timescale 1ns/1ns

module display;
 reg [80:0][7:0] label = "xxx";

 task display(reg [80:0][7:0] x);
    begin
        label = x;
        $display("\n%-s", x);
    end
 endtask
endmodule

`endif