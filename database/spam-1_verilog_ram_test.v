// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// verilator lint_off STMTDLY

`include "ram.v"
`include "../lib/assertion.v"
`timescale 1ns/1ns

module test();

 logic _OE, _WE;
 logic [7:0] A;
 tri [7:0] D;
 
 logic [7:0] Vd;
 assign D=Vd;

 `include "../lib/display_snippet.sv"

 localparam PD=56; // max delay is tAA which is 55 ns

  ram #(.AWIDTH(8), .LOG(1)) RAM(._OE, ._WE, .A, .D);

  always @*
      $display("%9t", $time, " MON : _OE=%1b, _WE=%1b, A=%8b, D=%8b - setup write 1 @ 1",_OE, _WE, A, D);

 initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(0, test);

    `DISPLAY("TEST: INITIAL STATE");
    #PD

    `DISPLAY("TEST: write 1 at 1");
    A=8'b00000001;
    Vd=8'b00000001;
    _OE=1'b1;
    _WE=1'b0;
    #PD
    _WE=1'b1;
    #PD
    `Equals(RAM.Mem[1],1);
 
    `DISPLAY("TEST: write 2 at 2");
    A=8'b00000010;
    Vd=8'b00000010;
    _OE=1'b1;
    _WE=1'b0;
    #PD
    _WE=1'b1;
    #PD
    `Equals(RAM.Mem[2],2);

   `DISPLAY("TEST: READ at 2");
    A=8'b00000010;
    Vd=8'bz;
    _OE=1'b0;
    #PD
    `Equals(D, 8'b00000010);
 
    `DISPLAY("TEST: NO READ OR WRITE");
    Vd=8'bzzzzzzzz;
    _OE=1'b1;
    #PD
    `Equals(D, 8'bzzzzzzzz);

   `DISPLAY("TEST: READ at 2");
    Vd=8'bz;
    A=8'b00000010;
    _OE=1'b0;
    #PD
    `Equals(D, 8'b00000010);
 
    `DISPLAY("TEST: Slide READ at 1");
    Vd=8'bz;
    A=8'b00000001;
    #PD
    `Equals(D, 8'b00000001);
 
    `DISPLAY("TEST: Slide READ at 0 is not defined");
    Vd=8'bz;
    A=8'b00000000;
    #PD
    `Equals(D, RAM.UNDEF);

    `DISPLAY("TEST: READ at 3");
    Vd=8'bz;
    _WE=1'b1;
    _OE=1'b0;
    A=8'b00000011;
    #PD
    `Equals(D, RAM.UNDEF);
 
    `DISPLAY("TEST: WRITE AT 3 with _OE override");
    Vd=8'b00000011;
    A=8'b00000011;
    _WE=1'b0;
    _OE=1'b0;
    #PD

    `DISPLAY("TEST: READ BACK AT 3 and expect bus conflict");
    Vd=8'b11111111;
    _WE=1'b1;
    _OE=1'b0;
    #PD
    `Equals(D, 8'bxxxxxx11); // conflicting for 6 lines
 
    `DISPLAY("TEST: READ BACK AT 3");
    Vd=8'bz;
    _WE=1'b1;
    _OE=1'b0;
    #PD
    `Equals(D, 8'b11); // conflicting for 6 lines
 
 
 end

endmodule
