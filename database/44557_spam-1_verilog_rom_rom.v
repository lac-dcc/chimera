// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan


// verilator lint_off COMBDLY
// needed because I am using non blocking inside a nonclocked always
// as per section 4.1 https://www-inst.eecs.berkeley.edu/~cs152/fa06/handouts/CummingsHDLCON1999_BehavioralDelays_Rev1_1.pdf
// because I'm modelling transport delays

`ifndef ROM_V
`define  ROM_V

`timescale 1ns/1ns

// timing from AT28C64 EEPROM http://www.farnell.com/datasheets/1469975.pdf
// verilator lint_off UNOPTFLAT

module rom (A, D, _CS, _OE);

  parameter DWIDTH=8,AWIDTH=16, DEPTH= 1 << AWIDTH;
  localparam DEFAULT_FILENAME = "";
  parameter FILENAME = DEFAULT_FILENAME;
  parameter tACC = 80;
  parameter tCE = 80;
  parameter tOE = 70;
  parameter LOG = 0;

  input  [AWIDTH-1:0] A;
  input _CS, _OE;
  output  [DWIDTH-1:0] D;

  reg [DWIDTH-1:0] Mem [0:DEPTH-1];

    initial begin
// verilator lint_off WIDTH
        if (DEFAULT_FILENAME != FILENAME)
            $readmemh(FILENAME , Mem);
// verilator lint_on WIDTH
    end

    logic  [AWIDTH-1:0] Ad;
    logic _CSd, _OEd;

    always @*
        Ad <= #(tACC) A;

    always @*
        _CSd <= #(tCE) _CS;

    always @*
        _OEd <= #(tOE) _OE;

    /* verilator lint_off ASSIGNDLY */
      //assign #(tACC) D = (!_CS && !_OE) ? Mem[A] : {DWIDTH{1'bz}};
      assign D = (!_CSd && !_OEd) ? Mem[Ad] : {DWIDTH{1'bz}};
    /* verilator lint_on ASSIGNDLY */

    if (0) always @(*) begin
         $display("%9t ROM %m : Ad=%x A=%x (b%b) D=%2x (b%b) _CS=%1b, _OE=%1b", $time, Ad, A, A, D, D, _CS, _OE);
    end

endmodule

`endif
