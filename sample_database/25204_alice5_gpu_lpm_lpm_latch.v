// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_latch
//
// Description     :  Parameterized latch megafunction.
//
// Limitation      :  n/a
//
// Results expected:  Data output from the latch.
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
module lpm_latch (
    data,  // Data input to the latch.
    gate,  // Latch enable input. High = flow-through, low = latch. (Required)
    aclr,  // Asynchronous clear input.
    aset,  // Asynchronous set input.
    aconst,
    q      // Data output from the latch.
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;         // Width of the data[] and q[] ports. (Required)
    parameter lpm_avalue = "UNUSED"; // Constant value that is loaded when aset is high.
    parameter lpm_pvalue = "UNUSED";
    parameter lpm_type = "lpm_latch";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;
    input  gate;
    input  aclr;
    input  aset;
    input  aconst;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] q;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg [lpm_width-1:0] q;
    reg [lpm_width-1:0] avalue;
    reg [lpm_width-1:0] pvalue;


// INTERNAL TRI DECLARATION
    logic [lpm_width-1:0] data; // -- converted tristate to logic
    logic aclr; // -- converted tristate to logic
    logic aset; // -- converted tristate to logic
    logic aconst; // -- converted tristate to logic

    wire i_aclr;
    wire i_aset;
    assign i_aclr = aclr; // -- converted buf to assign
    assign i_aset = aset; // -- converted buf to assign

// TASK DECLARATION
    task string_to_reg;
    input  [8*40:1] string_value;
    output [lpm_width-1:0] value;

    reg [8*40:1] reg_s;
    reg [8:1] digit;
    reg [8:1] tmp;
    reg [lpm_width-1:0] ivalue;

    integer m;

    begin
        ivalue = {lpm_width{1'b0}};
        reg_s = string_value;
        for (m=1; m<=40; m=m+1)
        begin
            tmp = reg_s[320:313];
            digit = tmp & 8'b00001111;
            reg_s = reg_s << 8;
            ivalue = ivalue * 10 + digit;
        end
        value = ivalue;
    end
    endtask

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if (lpm_width <= 0)
        begin
            $display("Value of lpm_width parameter must be greater than 0 (ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if (lpm_pvalue != "UNUSED")
        begin
            string_to_reg(lpm_pvalue, pvalue);
            q = pvalue;
        end

        if (lpm_avalue == "UNUSED")
            avalue =  {lpm_width{1'b1}};
        else
            string_to_reg(lpm_avalue, avalue);
    end

// ALWAYS CONSTRUCT BLOCK
    always @(data or gate or i_aclr or i_aset or avalue)
    begin
        if (i_aclr)
            q <= {lpm_width{1'b0}};
        else if (i_aset)
            q <= avalue;
        else if (gate)
            q <= data;
    end

endmodule // lpm_latch

