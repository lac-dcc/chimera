// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE


//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_bipad
//
// Description     :
//
// Limitation      :  n/a
//
// Results expected:
//
//END_MODULE_NAME--------------------------------------------------------------

// BEGINNING OF MODULE
`timescale 1 ps / 1 ps

// MODULE DECLARATION
/*verilator lint_off CASEX*/
/*verilator lint_off COMBDLY*/
/*verilator lint_off INITIALDLY*/
/*verilator lint_off LITENDIAN*/
/*verilator lint_off MULTIDRIVEN*/
/*verilator lint_off UNOPTFLAT*/
/*verilator lint_off BLKANDNBLK*/
module lpm_bipad (
    data,
    enable,
    result,
    pad
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;
    parameter lpm_type = "lpm_bipad";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;
    input  enable;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] result;

// INPUT/OUTPUT PORT DECLARATION
    inout  [lpm_width-1:0] pad;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg    [lpm_width-1:0] result;

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if (lpm_width <= 0)
        begin
            $display("Value of lpm_width parameter must be greater than 0(ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
    end

// ALWAYS CONSTRUCT BLOCK
    always @(data or pad or enable)
    begin
        if (enable == 1)
        begin
            result = {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
        end
        else if (enable == 0)
        begin
            result = pad;
        end
    end

// CONTINOUS ASSIGNMENT
    assign pad = (enable == 1) ? data : {lpm_width{1'b0 /* converted x or z to 1'b0 */}};

endmodule // lpm_bipad

