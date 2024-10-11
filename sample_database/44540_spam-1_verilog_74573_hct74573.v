// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

`ifndef  V_74573
`define  V_74573
// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY
// verilator lint_off UNOPTFLAT


/* octal d-type transparent latch.
 Same model as 74373 but with timings from HCT573
 
 LE = H is transparent
 _OE = H is Z
 
 Timings have are for 74HCT573
 https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf
 https://assets.nexperia.com/documents/data-sheet/74HC_HCT373.pdf
 */

`timescale 1ns/1ns
module hct74573 (
    input LE, // transparent when high 
    input _OE,
	input [7:0] D,
    output [7:0] Q
);
    parameter LOG=0;

    reg [7:0] data;
    
    specify
    (D => Q) = (17);
    (LE *> Q) = (15);
    (_OE *> Q) = (18);
    endspecify
    
    always @(D or LE)
        if (LE)
        begin 
            data = D;
        end
    
    assign Q = _OE ? 8'bz : data;

    if (LOG) always @* 
        $display("%09t ", $time, 
                " LE=%1b", LE,
                " _OE=%1b", _OE,
                " D=%8b", D,
                " Q=%8b", D,
                "%m");
        
    
endmodule: hct74573

`endif
