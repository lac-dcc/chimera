//
// iceZ0mb1e - FPGA 8-Bit TV80 SoC for Lattice iCE40
// with complete open-source toolchain flow using yosys and SDCC
//
// Copyright (c) 2021 Franz Neumann (netinside2000@gmx.de)
//
// Permission is hereby granted, free of charge, to any person obtaining a 
// copy of this software and associated documentation files (the "Software"), 
// to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, 
// and/or sell copies of the Software, and to permit persons to whom the 
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included 
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

`timescale 1us/1us

module tb_uart;

    reg clk = 0;
    reg reset = 0;

    wire rx = 0;
    wire tx;

    reg[7:0] wrdata;
    reg transmit;

    wire[7:0] rddata;
    wire received;

    simpleuart uart1 (
        .clk        (clk),
	    .reset      (reset),

        .baud_divider   (16'd 1250),

        .data_write (wrdata),
        .transmit   (transmit),
        .ready (),

        .data_read  (),
        .received   (),

        .tx         (tx),
        .rx         (rx)
    );

    simpleuart uart2 (
        .clk        (clk),
	    .reset      (reset),

        .baud_divider   (16'd 1250),

        .data_write (8'h 00),
        .transmit   (1'b 0),
        .ready (),

        .data_read  (rddata),
        .received   (received),

        .tx         (rx),
        .rx         (tx)
    );

    always #1 clk = !clk;

    initial begin
        $dumpfile(`__def_vcd_file);
        $dumpvars(0, tb_uart);

        # 1 transmit = 0;

        # 5 reset = 0;
        # 5 reset = 1;
        # 5 reset = 0;

        # 20 wrdata = 8'h 81;
        # 5 transmit = 1;
        # 5 transmit = 0;

        // # 400 wrdata = 8'h FF;
        // # 1 transmit = 1;
        // # 1 transmit = 0;

        // # 800 wrdata = 8'h 01;
        // # 1 transmit = 1;
        // # 1 transmit = 0;

        //# 15E3 $finish;
        # 250E3 $finish;
        //# 1E6 $finish;
    end

endmodule
