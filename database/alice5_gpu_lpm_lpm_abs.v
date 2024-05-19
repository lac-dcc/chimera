// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_abs
//
// Description     :  Parameterized absolute value megafunction. This megafunction
//                    requires the input data to be signed number.
//
// Limitation      :  n/a
//
// Results expected:  Return absolute value of data and the overflow status
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
module lpm_abs (
    data,     // Signed number (Required)
    result,   // Absolute value of data[].
    overflow  // High if data = -2 ^ (LPM_WIDTH-1).
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1; // Width of the data[] and result[] ports.(Required)
    parameter lpm_type = "lpm_abs";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] result;
    output overflow;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg [lpm_width-1:0] result_tmp;
    reg overflow;

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
    always @(data)
    begin
        result_tmp = (data[lpm_width-1] == 1) ? (~data) + 1 : data;
        overflow = (data[lpm_width-1] == 1) ? (result_tmp == (1<<(lpm_width-1))) : 0;
    end

// CONTINOUS ASSIGNMENT
    assign result = result_tmp;

endmodule // lpm_abs

