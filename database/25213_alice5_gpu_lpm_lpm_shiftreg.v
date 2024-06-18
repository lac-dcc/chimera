// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_shiftreg
//
// Description     :  Parameterized shift register megafunction.
//
// Limitation      :  n/a
//
// Results expected:  Data output from the shift register and the Serial shift data output.
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
module lpm_shiftreg (
    data,       // Data input to the shift register.
    clock,      // Positive-edge-triggered clock. (Required)
    enable,     // Clock enable input
    shiftin,    // Serial shift data input.
    load,       // Synchronous parallel load. High (1): load operation;
                //                            low (0): shift operation.
    aclr,       // Asynchronous clear input.
    aset,       // Asynchronous set input.
    sclr,       // Synchronous clear input.
    sset,       // Synchronous set input.
    q,          // Data output from the shift register.
    shiftout    // Serial shift data output.
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width  = 1;  // Width of the data[] and q ports. (Required)
    parameter lpm_direction = "LEFT";   // Values are "LEFT", "RIGHT", and "UNUSED".
    parameter lpm_avalue = "UNUSED";    // Constant value that is loaded when aset is high.
    parameter lpm_svalue = "UNUSED";    // Constant value that is loaded on the rising edge
                                        // of clock when sset is high.
    parameter lpm_pvalue = "UNUSED";
    parameter lpm_type = "lpm_shiftreg";
    parameter lpm_hint  = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;
    input  clock;
    input  enable;
    input  shiftin;
    input  load;
    input  aclr;
    input  aset;
    input  sclr;
    input  sset;


// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] q;
    output shiftout;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg  [lpm_width-1:0] tmp_q;
    reg  abit;
    reg  [lpm_width-1:0] svalue;
    reg  [lpm_width-1:0] avalue;
    reg  [lpm_width-1:0] pvalue;

// LOCAL INTEGER DECLARATION
    integer i;

// INTERNAL WIRE DECLARATION
    wire tmp_shiftout;

// INTERNAL TRI DECLARATION
    logic enable; // -- converted tristate to logic
    logic shiftin; // -- converted tristate to logic
    logic load; // -- converted tristate to logic
    logic aclr; // -- converted tristate to logic
    logic aset; // -- converted tristate to logic
    logic sclr; // -- converted tristate to logic
    logic sset; // -- converted tristate to logic

    wire i_enable;
    wire i_shiftin;
    wire i_load;
    wire i_aclr;
    wire i_aset;
    wire i_sclr;
    wire i_sset;
    assign i_enable = enable; // -- converted buf to assign
    assign i_shiftin = shiftin; // -- converted buf to assign
    assign i_load = load; // -- converted buf to assign
    assign i_aclr = aclr; // -- converted buf to assign
    assign i_aset = aset; // -- converted buf to assign
    assign i_sclr = sclr; // -- converted buf to assign
    assign i_sset = sset; // -- converted buf to assign

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

        if ((lpm_direction != "LEFT") &&
            (lpm_direction != "RIGHT") &&
            (lpm_direction != "UNUSED"))          // non-LPM 220 standard
        begin
            $display("Error!  LPM_DIRECTION value must be \"LEFT\" or \"RIGHT\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if (lpm_avalue == "UNUSED")
            avalue =  {lpm_width{1'b1}};
        else
            string_to_reg(lpm_avalue, avalue);

        if (lpm_svalue == "UNUSED")
            svalue =  {lpm_width{1'b1}};
        else
            string_to_reg(lpm_svalue, svalue);

        if (lpm_pvalue == "UNUSED")
            pvalue =  {lpm_width{1'b0}};
        else
            string_to_reg(lpm_pvalue, pvalue);

        tmp_q = pvalue;
    end

// ALWAYS CONSTRUCT BLOCK
    always @(i_aclr or i_aset or avalue)
    begin
        if (i_aclr)
            tmp_q <= {lpm_width{1'b0}};
        else if (i_aset)
            tmp_q <= avalue;
    end

    always @(posedge clock)
    begin
        if (i_aclr)
            tmp_q <= (i_aset) ? {lpm_width{1'b0 /* converted x or z to 1'b0 */}} : {lpm_width{1'b0}};
        else if (i_aset)
            tmp_q <= avalue;
        else
        begin
            if (i_enable)
            begin
                if (i_sclr)
                    tmp_q <= {lpm_width{1'b0}};
                else if (i_sset)
                    tmp_q <= svalue;
                else if (i_load)
                    tmp_q <= data;
                else if (!i_load)
                begin
                    if ((lpm_direction == "LEFT") || (lpm_direction == "UNUSED"))
                        {abit,tmp_q} <= {tmp_q,i_shiftin};
                    else if (lpm_direction == "RIGHT")
                        {tmp_q,abit} <= {i_shiftin,tmp_q};
                end
            end
        end
    end

// CONTINOUS ASSIGNMENT
    assign tmp_shiftout = (lpm_direction == "RIGHT") ? tmp_q[0]
                                                    : tmp_q[lpm_width-1];
    assign q = tmp_q;
    assign shiftout = tmp_shiftout;

endmodule // lpm_shiftreg

