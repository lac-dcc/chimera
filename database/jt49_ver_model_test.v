// This program was cloned from: https://github.com/jotego/jt49
// License: GNU General Public License v3.0

`timescale 1ns/1ps

module test;

reg        clk, rst_n;
wire       wr_n, eof;
wire [3:0] addr;
wire [7:0] din;

initial begin
    $dumpfile("test.lxt");
    $dumpvars;
    $dumpon;
    #10000000000 $finish;
end

initial begin
    clk=0;
    rst_n=0;
    #300 rst_n=1;
    forever #(1270/4) clk = ~clk;
end

always @(posedge clk) begin
    if( eof ) $finish;
end

vcd_tnzso16 stim(
    .clk    ( clk   ),
    .addr   ( addr  ),
    .wr_n   ( wr_n  ),
    .din    ( din   ),
    .eof    ( eof   )
);

jt49 uut(
    .rst_n      (   rst_n       ),
    .clk        (   clk         ),
    .clk_en     (   1'b1        ),
    .addr       (   addr        ),
    .cs_n       (   1'b0        ),
    .wr_n       (   wr_n        ),
    .din        (   din         ),
    .sel        (   1'b0        ),
    .dout       (               ),
    .sound      (               ),
    .A          (               ),
    .B          (               ),
    .C          (               ),
    .sample     (               ),
    .IOA_in     (   8'd0        ),
    .IOA_out    (               ),
    .IOA_oe     (               ),
    .IOB_in     (   8'd0        ),
    .IOB_out    (               ),
    .IOB_oe     (               )
);

wire [7:0] dmux = wr_n ? {4'd0, addr } : din;

// {bdir, bc2, bc1} | bus operation
// -----------------+---------------
//      either of   | Select register (number is da[3:0]) for subsequent read or write.
//     0    0    1  | Selection only succeedes when da[7:4]==0,
//     1    0    0  | a8=1 and _a9=0, otherwise AY gets 'unselected',
//     1    1    1  | i.e. it won't react on subsequent reads or writes.
// -----------------+---------------
//     1    1    0  | write the contents of the 'da' bus into the previously selected AY register
// -----------------+---------------
//     0    1    1  | read contents of the previously selected AY register to the 'da' bus
// -----------------+---------------
// any other values | ignore anything on the bus and do not change selected register (idle state)
ay_model model(
    .clk        ( clk           ),
    ._rst       ( rst_n         ),
    .da         ( dmux          ),
    .bdir       ( ~wr_n         ),
    .bc2        ( ~wr_n         ),
    .bc1        (  wr_n         ),
    .a8         ( 1'b1          ),
    ._a9        ( 1'b0          ),

    .ioa        (               ),
    .iob        (               ),
    .test1      (               ),
    .test2      (               ),
    .ch_a       (               ),
    .ch_b       (               ),
    .ch_c       (               )
);

endmodule