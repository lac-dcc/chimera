// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY
// verilator lint_off COMBDLY


`ifndef V_74245
`define V_74245

`timescale 1ns/1ns

module hct74245( 
    input dir,
    input nOE,
    inout tri [7:0] A,
    inout tri [7:0] B
);
    parameter NAME="74245";
    parameter LOG=0;
    // HCT typical @ 5v according to https://assets.nexperia.com/documents/data-sheet/74HC_HCT245.pdf
    parameter PD_TRANS=10;
    parameter PD_DIR=16;
    parameter PD_OE=16;

    // TRANSMISSION DELAY MODEL
    logic dir_d;
    logic nOE_d;
    
    logic [7:0] A_d;
    logic [7:0] B_d;

    assign A= nOE_d ? 8'bzzzzzzzz :dir_d==1?'bzzzzzzzz:B_d;
    assign B= nOE_d ? 8'bzzzzzzzz :dir_d==0?'bzzzzzzzz:A_d;
    
    always @* begin
        dir_d <= #(PD_DIR) dir;
        nOE_d <= #(PD_OE) nOE;
        A_d <= #(PD_TRANS) A;
        B_d <= #(PD_TRANS) B; 
    end

    // specify
    //     (A => B) = (PD_TRANS);
    //     (B => A) = (PD_TRANS);
    //     (dir *> A) = (PD_DIR);
    //     (dir *> B) = (PD_DIR);
    //     (nOE *> A) = (PD_OE);
    //     (nOE *> B) = (PD_OE);
    // endspecify

    // assign A= nOE ? 8'bzzzzzzzz :dir?8'bzzzzzzzz:B;
    // assign B= nOE ? 8'bzzzzzzzz :dir?A:8'bzzzzzzzz;

    
    if (LOG) 
        always @(*) 
        begin
            $display("%9t", $time,  " BUF %m (%s) : A=%8b ", NAME, A, "B=%8b ", B, "dir=%1b", dir, " nOE=%1b", nOE);
        end

endmodule: hct74245

`endif

