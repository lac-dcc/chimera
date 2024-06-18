// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_compare
//
// Description     :  Parameterized comparator megafunction. The comparator will
//                    compare between data[] and datab[] and return the status of
//                    comparation for the following operation.
//                    1) dataa[] < datab[].
//                    2) dataa[] == datab[].
//                    3) dataa[] > datab[].
//                    4) dataa[] >= datab[].
//                    5) dataa[] != datab[].
//                    6) dataa[] <= datab[].
//
// Limitation      :  n/a
//
// Results expected:  Return status bits of the comparision between dataa[] and
//                    datab[].
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
module lpm_compare (
    dataa,   // Value to be compared to datab[]. (Required)
    datab,   // Value to be compared to dataa[]. (Required)
    clock,   // Clock for pipelined usage.
    aclr,    // Asynchronous clear for pipelined usage.
    clken,   // Clock enable for pipelined usage.

    // One of the following ports must be present.
    alb,     // High (1) if dataa[] < datab[].
    aeb,     // High (1) if dataa[] == datab[].
    agb,     // High (1) if dataa[] > datab[].
    aleb,    // High (1) if dataa[] <= datab[].
    aneb,    // High (1) if dataa[] != datab[].
    ageb     // High (1) if dataa[] >= datab[].
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;  // Width of the dataa[] and datab[] ports. (Required)
    parameter lpm_representation = "UNSIGNED";  // Type of comparison performed:
                                                // "SIGNED", "UNSIGNED"
    parameter lpm_pipeline = 0; // Specifies the number of Clock cycles of latency
                                // associated with the alb, aeb, agb, ageb, aleb,
                                //  or aneb output.
    parameter lpm_type = "lpm_compare";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] dataa;
    input  [lpm_width-1:0] datab;
    input  clock;
    input  aclr;
    input  clken;

// OUTPUT PORT DECLARATION
    output alb;
    output aeb;
    output agb;
    output aleb;
    output aneb;
    output ageb;

// INTERNAL REGISTERS DECLARATION
    reg [lpm_pipeline+1:0] alb_pipe;
    reg [lpm_pipeline+1:0] aeb_pipe;
    reg [lpm_pipeline+1:0] agb_pipe;
    reg [lpm_pipeline+1:0] aleb_pipe;
    reg [lpm_pipeline+1:0] aneb_pipe;
    reg [lpm_pipeline+1:0] ageb_pipe;
    reg tmp_alb;
    reg tmp_aeb;
    reg tmp_agb;
    reg tmp_aleb;
    reg tmp_aneb;
    reg tmp_ageb;


// LOCAL INTEGER DECLARATION
    integer i;
    integer pipe_ptr;

// INTERNAL TRI DECLARATION
    logic aclr; // -- converted tristate to logic
    logic clock; // -- converted tristate to logic
    logic clken; // -- converted tristate to logic

    wire i_aclr;
    wire i_clock;
    wire i_clken;
    assign i_aclr = aclr; // -- converted buf to assign
    assign i_clock = clock; // -- converted buf to assign
    assign i_clken = clken; // -- converted buf to assign

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if ((lpm_representation != "SIGNED") &&
            (lpm_representation != "UNSIGNED"))
        begin
            $display("Error!  LPM_REPRESENTATION value must be \"SIGNED\" or \"UNSIGNED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if (lpm_width <= 0)
        begin
            $display("Value of lpm_width parameter must be greater than 0(ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        pipe_ptr = 0;
    end

// ALWAYS CONSTRUCT BLOCK
    // get the status of comparison
    always @(dataa or datab)
    begin
        tmp_aeb = (dataa == datab);
        tmp_aneb = (dataa != datab);

        if ((lpm_representation == "SIGNED") &&
            ((dataa[lpm_width-1] ^ datab[lpm_width-1]) == 1))
        begin
            // create latency
            tmp_alb = (dataa > datab);
            tmp_agb = (dataa < datab);
            tmp_aleb = (dataa >= datab);
            tmp_ageb = (dataa <= datab);
        end
        else
        begin
        // create latency
            tmp_alb = (dataa < datab);
            tmp_agb = (dataa > datab);
            tmp_aleb = (dataa <= datab);
            tmp_ageb = (dataa >= datab);
        end
    end

    // pipelining process
    always @(posedge i_clock or posedge i_aclr)
    begin
        if (i_aclr) // reset all variables
        begin
            for (i = 0; i <= (lpm_pipeline + 1); i = i + 1)
            begin
                aeb_pipe[i] <= 1'b0;
                agb_pipe[i] <= 1'b0;
                alb_pipe[i] <= 1'b0;
                aleb_pipe[i] <= 1'b0;
                aneb_pipe[i] <= 1'b0;
                ageb_pipe[i] <= 1'b0;
            end
            pipe_ptr <= 0;
        end
        else if (i_clken == 1)
        begin
            alb_pipe[pipe_ptr] <= tmp_alb;
            aeb_pipe[pipe_ptr] <= tmp_aeb;
            agb_pipe[pipe_ptr] <= tmp_agb;
            aleb_pipe[pipe_ptr] <= tmp_aleb;
            aneb_pipe[pipe_ptr] <= tmp_aneb;
            ageb_pipe[pipe_ptr] <= tmp_ageb;

            if (lpm_pipeline > 1)
                pipe_ptr <= (pipe_ptr + 1) % lpm_pipeline;
        end
    end

// CONTINOUS ASSIGNMENT
    assign alb = (lpm_pipeline > 0) ? alb_pipe[pipe_ptr] : tmp_alb;
    assign aeb = (lpm_pipeline > 0) ? aeb_pipe[pipe_ptr] : tmp_aeb;
    assign agb = (lpm_pipeline > 0) ? agb_pipe[pipe_ptr] : tmp_agb;
    assign aleb = (lpm_pipeline > 0) ? aleb_pipe[pipe_ptr] : tmp_aleb;
    assign aneb = (lpm_pipeline > 0) ? aneb_pipe[pipe_ptr] : tmp_aneb;
    assign ageb = (lpm_pipeline > 0) ? ageb_pipe[pipe_ptr] : tmp_ageb;

endmodule // lpm_compare

