// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_fifo_dc_dffpipe
//
// Description     :  Dual Clocks FIFO
//
// Limitation      :
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
module lpm_fifo_dc_dffpipe (d,
                            clock,
                            aclr,
                            q);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_delay = 1;
    parameter lpm_width = 64;

// INPUT PORT DECLARATION
    input [lpm_width-1:0] d;
    input clock;
    input aclr;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] q;

// INTERNAL REGISTERS DECLARATION
    reg [lpm_width-1:0] dffpipe [lpm_delay:0];
    reg [lpm_width-1:0] q;

// LOCAL INTEGER DECLARATION
    integer delay;
    integer i;

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        delay <= lpm_delay - 1;

        for (i = 0; i <= lpm_delay; i = i + 1)
            dffpipe[i] <= 0;
        q <= 0;
    end

// ALWAYS CONSTRUCT BLOCK
    always @(posedge aclr or posedge clock)
    begin
        if (aclr)
        begin
            for (i = 0; i <= lpm_delay; i = i + 1)
                dffpipe[i] <= 0;
            q <= 0;
        end
        else if (clock)
        begin
            if ((lpm_delay > 0) && ($time > 0))
            begin
                if (delay > 0)
                begin
                    for (i = delay; i > 0; i = i - 1)
                        dffpipe[i] <= dffpipe[i - 1];
                    q <= dffpipe[delay - 1];
                end
                else
                    q <= d;

                dffpipe[0] <= d;
            end
        end
    end // @(posedge aclr or posedge clock)

    always @(d)
    begin
        if (lpm_delay == 0)
            q <= d;
    end // @(d)

endmodule // lpm_fifo_dc_dffpipe

