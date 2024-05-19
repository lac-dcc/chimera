// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`timescale 1ns/1ns
// verilator lint_off COMBDLY

// regarding approach to delays see https://stackoverflow.com/questions/64083950/why-are-icarus-verilog-specify-times-not-respected/64085508?noredirect=1#comment113337822_64085508
// where my question is answered arount how to create delays that allow glitches through.

// https://assets.nexperia.com/documents/data-sheet/74HC_HCT151_Q100.pdf
// The data sheet says this chips glitches during transitions - this shows up in the test

module hct74151(_E, I, S, Y, _Y);
    parameter LOG=0;
    output Y, _Y;
    input [2:0] S;
    input [7:0] I;
    input _E;

    // setup timing be delaying the signals according to the data PD then combine them at last minute
    logic [7:0] Id;
    logic [2:0] Sd;

    always @*
        Id <= #(19) I;

    always @*
        Sd <= #(20) S;

    // according to nexperia _E->_Y is slower than _E->Y
    logic _Ed, Ed;
    always @* 
        _Ed <= #(13) _E;
    always @* 
        Ed <= #(18) ! _E;

    // combine
    wire O =
        (Sd==0 & Id[0]) ||
        (Sd==1 & Id[1]) ||
        (Sd==2 & Id[2]) ||
        (Sd==3 & Id[3]) ||
        (Sd==4 & Id[4]) ||
        (Sd==5 & Id[5]) ||
        (Sd==6 & Id[6]) ||
        (Sd==7 & Id[7]);

    // when _E is high then fixed values are assumed otherwise Y follows the selected pin and _Y is the inverse
    assign Y  = _Ed==0 ? O  : 0;
    assign _Y = _Ed==0 ? !O : 1;

    if (LOG) always @*
    begin 
        $display("%9t %m ", $time, "_E=%1b  I=%8b  S=%1d   Y=%b _Y=%b (_Ed=%b, Ed=%b)", _E, I, S, Y, _Y, _Ed, Ed);
    end

endmodule

// verilator lint_on COMBDLY
