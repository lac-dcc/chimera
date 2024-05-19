// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_fifo_dc_fefifo
//
// Description     :  Dual Clock FIFO
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
module lpm_fifo_dc_fefifo ( usedw_in,
                            wreq,
                            rreq,
                            clock,
                            aclr,
                            empty,
                            full);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_widthad = 1;
    parameter lpm_numwords = 1;
    parameter underflow_checking = "ON";
    parameter overflow_checking = "ON";
    parameter lpm_mode = "READ";
    parameter lpm_hint = "";

// INPUT PORT DECLARATION
    input [lpm_widthad-1:0] usedw_in;
    input wreq;
    input rreq;
    input clock;
    input aclr;

// OUTPUT PORT DECLARATION
    output empty;
    output full;

// INTERNAL REGISTERS DECLARATION
    reg [1:0] sm_empty;
    reg lrreq;
    reg i_empty;
    reg i_full;
    reg [8*5:1] i_overflow_checking;
    reg [8*5:1] i_underflow_checking;

// LOCAL INTEGER DECLARATION
    integer almostfull;

// COMPONENT INSTANTIATIONS
    LPM_HINT_EVALUATION eva();

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if ((lpm_mode != "READ") && (lpm_mode != "WRITE"))
        begin
            $display ("Error! LPM_MODE must be READ or WRITE.");
            $display("Time: %0t  Instance: %m", $time);
            $stop;
        end

        i_overflow_checking = eva.GET_PARAMETER_VALUE(lpm_hint, "OVERFLOW_CHECKING");
        if (i_overflow_checking == "")
        begin
            if ((overflow_checking != "ON") && (overflow_checking != "OFF"))
            begin
                $display ("Error! OVERFLOW_CHECKING must equal to either 'ON' or 'OFF'");
                $display("Time: %0t  Instance: %m", $time);
                $stop;
            end
            else
                i_overflow_checking = overflow_checking;
        end
        else if ((i_overflow_checking != "ON") && (i_overflow_checking != "OFF"))
        begin
            $display ("Error! OVERFLOW_CHECKING must equal to either 'ON' or 'OFF'");
            $display("Time: %0t  Instance: %m", $time);
            $stop;
        end

        i_underflow_checking = eva.GET_PARAMETER_VALUE(lpm_hint, "UNDERFLOW_CHECKING");
        if(i_underflow_checking == "")
        begin
            if ((underflow_checking != "ON") && (underflow_checking != "OFF"))
            begin
                $display ("Error! UNDERFLOW_CHECKING must equal to either 'ON' or 'OFF'");
                $display("Time: %0t  Instance: %m", $time);
                $stop;
            end
            else
                i_underflow_checking = underflow_checking;
        end
        else if ((i_underflow_checking != "ON") && (i_underflow_checking != "OFF"))
        begin
            $display ("Error! UNDERFLOW_CHECKING must equal to either 'ON' or 'OFF'");
            $display("Time: %0t  Instance: %m", $time);
            $stop;
        end

        sm_empty <= 2'b00;
        i_empty <= 1'b1;
        i_full <= 1'b0;
        lrreq <= 1'b0;

        if (lpm_numwords >= 3)
            almostfull <= lpm_numwords - 3;
        else
            almostfull <= 0;
    end

// ALWAYS CONSTRUCT BLOCK
    always @(posedge aclr)
    begin
        sm_empty <= 2'b00;
        i_empty <= 1'b1;
        i_full <= 1'b0;
        lrreq <= 1'b0;
    end // @(posedge aclr)

    always @(posedge clock)
    begin
        if (i_underflow_checking == "OFF")
            lrreq <= rreq;
        else
            lrreq <= rreq && ~i_empty;

        if (~aclr && ($time > 0))
        begin
            if (lpm_mode == "READ")
            begin
                casex (sm_empty)
                    // state_empty
                    2'b00:
                        if (usedw_in != 0)
                            sm_empty <= 2'b01;
                    // state_non_empty
                    2'b01:
                        if (rreq && (((usedw_in == 1) && !lrreq) || ((usedw_in == 2) && lrreq)))
                            sm_empty <= 2'b10;
                    // state_emptywait
                    2'b10:
                        if (usedw_in > 1)
                            sm_empty <= 2'b01;
                        else
                            sm_empty <= 2'b00;
                    default:
                        begin
                            $display ("Error! Invalid sm_empty state in read mode.");
                            $display("Time: %0t  Instance: %m", $time);
                        end
                endcase
            end // if (lpm_mode == "READ")
            else if (lpm_mode == "WRITE")
            begin
                casex (sm_empty)
                    // state_empty
                    2'b00:
                        if (wreq)
                            sm_empty <= 2'b01;
                    // state_one
                    2'b01:
                        if (!wreq)
                            sm_empty <= 2'b11;
                    // state_non_empty
                    2'b11:
                        if (wreq)
                            sm_empty <= 2'b01;
                        else if (usedw_in == 0)
                            sm_empty <= 2'b00;
                    default:
                        begin
                            $display ("Error! Invalid sm_empty state in write mode.");
                            $display("Time: %0t  Instance: %m", $time);
                        end
                endcase
            end // if (lpm_mode == "WRITE")

            if (~aclr && (usedw_in >= almostfull) && ($time > 0))
                i_full <= 1'b1;
            else
                i_full <= 1'b0;
        end // if (~aclr && $time > 0)
    end // @(posedge clock)

    always @(sm_empty)
    begin
        i_empty <= !sm_empty[0];
    end
    // @(sm_empty)

// CONTINOUS ASSIGNMENT
    assign empty = i_empty;
    assign full = i_full;
endmodule // lpm_fifo_dc_fefifo

