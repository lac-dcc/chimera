// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// verilator lint_off STMTDLY

`include "rom.v"
`include "../lib/assertion.v"

`timescale 1ns/1ns

module test();

 logic _OE, _CS;
 logic [3:0] A;
 wire [7:0] D;
 
  rom #(.DEPTH(16), .AWIDTH(4), .FILENAME("data.rom")) r1(._CS(_CS), ._OE(_OE), .A(A), .D(D));

    always @* 
        $display($time, " A=%d, D=%d", A, D);

 integer count = 1000;

 initial begin
    _OE=1'b1;
    _CS=1'b0;
    #200
    $display($time, " TEST: _OE=%1b, _CS=%1b, A=%8b, d=%8b - output disabled",_OE, _CS, A, D);
    `Equals(D, 8'bzzzzzzzz);


    A=4'b0010;
    _OE=1'b0;
    _CS=1'b0;
    #200
    $display($time, " TEST: _OE=%1b, _CS=%1b, A=%8b, d=%8b - setup write 2 @ 2",_OE, _CS, A, D);
    `Equals(D, 8'b00000010);
 
    A=4'b1111;
    _OE=1'b0;
    _CS=1'b0;
    #200
    $display($time, " TEST: _OE=%1b, _CS=%1b, A=%8b, d=%8b - setup write 2 @ 2",_OE, _CS, A, D);
     `Equals(D, 8'b00001111);
 
    $display($time, " tweak A1");
    A=1;
    #(r1.tACC/2)
    $display($time, " TEST: _OE=%1b, _CS=%1b, A=%8b, d=%8b - A=1 but not prop yet ",_OE, _CS, A, D);
    `Equals(D, 8'b00001111);

    $display($time, " tweak A2");
    A=2;
    #(r1.tACC/2)
    $display($time, " TEST: _OE=%1b, _CS=%1b, A=%8b, d=%8b - A=2 but not prop yet - resets inertial timer",_OE, _CS, A, D);
    `Equals(D, 8'b00001111);

    $display($time, " tweak A3");
    A=3;
    #(r1.tACC/2)
    $display($time, " TEST: _OE=%1b, _CS=%1b, A=%8b, d=%8b - A=3 but not prop yet - resets inertial timer",_OE, _CS, A, D);
    `Equals(D, 8'b00000001);

    #(r1.tACC/2+1)
    $display($time, " TEST: _OE=%1b, _CS=%1b, A=%8b, d=%8b - A=£ propagated",_OE, _CS, A, D);
    `Equals(D, 8'b00000011);

    $display($time, " tweak A3");
    A=2;
    #(r1.tACC+1)
    $display($time, " TEST: _OE=%1b, _CS=%1b, A=%8b, d=%8b - setup write 2 @ 2",_OE, _CS, A, D);
    `Equals(D, 8'b00000010);

 
 end

endmodule
