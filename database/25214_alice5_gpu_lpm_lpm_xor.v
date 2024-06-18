// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_xor
//
// Description     :  Parameterized XOR gate megafunction. This megafunction takes in
//                    data inputs for a number of XOR gates.
//
// Limitation      :  n/a.
//
// Results expected:  Each result[] bit is the result of each XOR gates.
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
module lpm_xor (
    data,   // Data input to the XOR gates. (Required)
    result  // Result of XOR operators. (Required)
);

// GLOBAL PARAMETER DECLARATION
    // Width of the data[] and result[] ports. Number of XOR gates. (Required)
    parameter lpm_width = 1;
    // Number of inputs to each XOR gate. Number of input buses. (Required)
    parameter lpm_size = 1;
    parameter lpm_type = "lpm_xor";
    parameter lpm_hint  = "UNUSED";

// INPUT PORT DECLARATION
    input  [(lpm_size * lpm_width)-1:0] data;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] result;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg    [lpm_width-1:0] result_tmp;

// LOCAL INTEGER DECLARATION
    integer i;
    integer j;
    integer k;

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if (lpm_width <= 0)
        begin
            $display("Value of lpm_width parameter must be greater than 0 (ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if (lpm_size <= 0)
        begin
            $display("Value of lpm_size parameter must be greater than 0 (ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
    end

// ALWAYS CONSTRUCT BLOCK
    always @(data)
    begin
        for (i=0; i<lpm_width; i=i+1)
        begin
            result_tmp[i] = 1'b0;
            for (j=0; j<lpm_size; j=j+1)
            begin
                k = (j * lpm_width) + i;
                result_tmp[i] = result_tmp[i] ^ data[k];
            end
        end
    end

// CONTINOUS ASSIGNMENT
    assign result = result_tmp;

endmodule // lpm_xor

