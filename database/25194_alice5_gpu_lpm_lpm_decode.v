// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_decode
//
// Description     :  Parameterized decoder megafunction.
//
// Limitation      :  n/a
//
// Results expected:  Decoded output.
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
module lpm_decode (
    data,    // Data input. Treated as an unsigned binary encoded number. (Required)
    enable,  // Enable. All outputs low when not active.
    clock,   // Clock for pipelined usage.
    aclr,    // Asynchronous clear for pipelined usage.
    clken,   // Clock enable for pipelined usage.
    eq       // Decoded output. (Required)
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;                // Width of the data[] port, or the
                                            // input value to be decoded. (Required)
    parameter lpm_decodes = 1 << lpm_width; // Number of explicit decoder outputs. (Required)
    parameter lpm_pipeline = 0;             // Number of Clock cycles of latency
    parameter lpm_type = "lpm_decode";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;
    input  enable;
    input  clock;
    input  aclr;
    input  clken;

// OUTPUT PORT DECLARATION
    output [lpm_decodes-1:0] eq;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg    [lpm_decodes-1:0] eq_pipe [(lpm_pipeline+1):0];
    reg    [lpm_decodes-1:0] tmp_eq;

// LOCAL INTEGER DECLARATION
    integer i;
    integer pipe_ptr;

// INTERNAL TRI DECLARATION
    logic   enable; // -- converted tristate to logic
    logic   clock; // -- converted tristate to logic
    logic   aclr; // -- converted tristate to logic
    logic   clken; // -- converted tristate to logic

    wire i_clock;
    wire i_clken;
    wire i_aclr;
    wire i_enable;
    assign i_clock = clock; // -- converted buf to assign
    assign i_clken = clken; // -- converted buf to assign
    assign i_aclr = aclr; // -- converted buf to assign
    assign i_enable = enable; // -- converted buf to assign

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if (lpm_width <= 0)
        begin
            $display("Value of lpm_width parameter must be greater than 0 (ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if (lpm_decodes <= 0)
        begin
            $display("Value of lpm_decodes parameter must be greater than 0 (ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if (lpm_decodes > (1 << lpm_width))
        begin
            $display("Value of lpm_decodes parameter must be less or equal to 2^lpm_width (ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if (lpm_pipeline < 0)
        begin
            $display("Value of lpm_pipeline parameter must be greater or equal to 0 (ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        pipe_ptr = 0;
    end

// ALWAYS CONSTRUCT BLOCK
    always @(data or i_enable)
    begin
        tmp_eq = {lpm_decodes{1'b0}};
        if (i_enable)
            tmp_eq[data] = 1'b1;
    end

    always @(posedge i_clock or posedge i_aclr)
    begin
        if (i_aclr)
        begin
            for (i = 0; i <= lpm_pipeline; i = i + 1)
                eq_pipe[i] <= {lpm_decodes{1'b0}};

            pipe_ptr <= 0;
        end
        else if (clken == 1'b1)
        begin
            eq_pipe[pipe_ptr] <= tmp_eq;

            if (lpm_pipeline > 1)
                pipe_ptr <= (pipe_ptr + 1) % lpm_pipeline;
        end
    end

    assign eq = (lpm_pipeline > 0) ? eq_pipe[pipe_ptr] : tmp_eq;

endmodule // lpm_decode

