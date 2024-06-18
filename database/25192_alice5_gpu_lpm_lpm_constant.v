// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_constant
//
// Description     :  Parameterized constant generator megafunction. lpm_constant
//                    may be useful for convert a parameter into a constant.
//
// Limitation      :  n/a
//
// Results expected:  Value specified by the argument to LPM_CVALUE.
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
module lpm_constant (
    result // Value specified by the argument to LPM_CVALUE. (Required)
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;    // Width of the result[] port. (Required)
    parameter lpm_cvalue = 0;   // Constant value to be driven out on the
                                // result[] port. (Required)
    parameter lpm_strength = "UNUSED";
    parameter lpm_type = "lpm_constant";
    parameter lpm_hint = "UNUSED";

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] result;

// INTERNAL REGISTERS DECLARATION
    reg[32:0] int_value;

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if (lpm_width <= 0)
        begin
            $display("Value of lpm_width parameter must be greater than 0(ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        int_value = lpm_cvalue;
    end

// CONTINOUS ASSIGNMENT
    assign result = int_value[lpm_width-1:0];

endmodule // lpm_constant

