// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_divide
//
// Description     :  Parameterized divider megafunction. This function performs a
//                    divide operation such that denom * quotient + remain = numer
//                    The function allows for all combinations of signed(two's
//                    complement) and unsigned inputs. If any of the inputs is
//                    signed, the output is signed. Otherwise the output is unsigned.
//                    The function also allows the remainder to be specified as
//                    always positive (in which case remain >= 0); otherwise remain
//                    is zero or the same sign as the numerator
//                    (this parameter is ignored in the case of purely unsigned
//                    division). Finally the function is also pipelinable.
//
// Limitation      :  n/a
//
// Results expected:  Return quotient and remainder.
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
module lpm_divide (
    numer,  // The numerator (Required)
    denom,  // The denominator (Required)
    clock,  // Clock input for pipelined usage
    aclr,   // Asynchronous clear signal
    clken,  // Clock enable for pipelined usage.
    quotient, // Quotient (Required)
    remain    // Remainder (Required)
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_widthn = 1;  // Width of the numer[] and quotient[] port. (Required)
    parameter lpm_widthd = 1;  // Width of the denom[] and remain[] port. (Required)
    parameter lpm_nrepresentation = "UNSIGNED";  // The representation of numer
    parameter lpm_drepresentation = "UNSIGNED";  // The representation of denom
    parameter lpm_pipeline = 0; // Number of Clock cycles of latency
    parameter lpm_type = "lpm_divide";
    parameter lpm_hint = "LPM_REMAINDERPOSITIVE=TRUE";

// INPUT PORT DECLARATION
    input  [lpm_widthn-1:0] numer;
    input  [lpm_widthd-1:0] denom;
    input  clock;
    input  aclr;
    input  clken;

// OUTPUT PORT DECLARATION
    output [lpm_widthn-1:0] quotient;
    output [lpm_widthd-1:0] remain;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg [lpm_widthn-1:0] quotient_pipe [lpm_pipeline+1:0];
    reg [lpm_widthd-1:0] remain_pipe [lpm_pipeline+1:0];
    reg [lpm_widthn-1:0] tmp_quotient;
    reg [lpm_widthd-1:0] tmp_remain;
    reg [lpm_widthn-1:0] not_numer;
    reg [lpm_widthn-1:0] int_numer;
    reg [lpm_widthd-1:0] not_denom;
    reg [lpm_widthd-1:0] int_denom;
    reg [lpm_widthn-1:0] t_numer;
    reg [lpm_widthn-1:0] t_q;
    reg [lpm_widthd-1:0] t_denom;
    reg [lpm_widthd-1:0] t_r;
    reg sign_q;
    reg sign_r;
    reg sign_n;
    reg sign_d;
    reg [8*5:1] lpm_remainderpositive;


// LOCAL INTEGER DECLARATION
    integer i;
    integer rsig;
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

// COMPONENT INSTANTIATIONS
    LPM_HINT_EVALUATION eva();

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        // check if lpm_widthn > 0
        if (lpm_widthn <= 0)
        begin
            $display("Error!  LPM_WIDTHN must be greater than 0.\n");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        // check if lpm_widthd > 0
        if (lpm_widthd <= 0)
        begin
            $display("Error!  LPM_WIDTHD must be greater than 0.\n");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        // check for valid lpm_nrepresentation value
        if ((lpm_nrepresentation != "SIGNED") && (lpm_nrepresentation != "UNSIGNED"))
        begin
            $display("Error!  LPM_NREPRESENTATION value must be \"SIGNED\" or \"UNSIGNED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        // check for valid lpm_drepresentation value
        if ((lpm_drepresentation != "SIGNED") && (lpm_drepresentation != "UNSIGNED"))
        begin
            $display("Error!  LPM_DREPRESENTATION value must be \"SIGNED\" or \"UNSIGNED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        // check for valid lpm_remainderpositive value
        lpm_remainderpositive = eva.GET_PARAMETER_VALUE(lpm_hint, "LPM_REMAINDERPOSITIVE");
        if ((lpm_remainderpositive == "TRUE") &&
            (lpm_remainderpositive == "FALSE"))
        begin
            $display("Error!  LPM_REMAINDERPOSITIVE value must be \"TRUE\" or \"FALSE\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        for (i = 0; i <= (lpm_pipeline+1); i = i + 1)
        begin
            quotient_pipe[i] <= {lpm_widthn{1'b0}};
            remain_pipe[i] <= {lpm_widthd{1'b0}};
        end

        pipe_ptr = 0;
    end

// ALWAYS CONSTRUCT BLOCK
    always @(numer or denom or lpm_remainderpositive)
    begin
        sign_q = 1'b0;
        sign_r = 1'b0;
        sign_n = 1'b0;
        sign_d = 1'b0;
        t_numer = numer;
        t_denom = denom;

        if (lpm_nrepresentation == "SIGNED")
            if (numer[lpm_widthn-1] == 1'b1)
            begin
                t_numer = ~numer + 1;  // numer is negative number
                sign_n = 1'b1;
            end

        if (lpm_drepresentation == "SIGNED")
            if (denom[lpm_widthd-1] == 1'b1)
            begin
                t_denom = ~denom + 1; // denom is negative numbrt
                sign_d = 1'b1;
            end

        t_q = t_numer / t_denom; // get quotient
        t_r = t_numer % t_denom; // get remainder
        sign_q = sign_n ^ sign_d;
        sign_r = (t_r != {lpm_widthd{1'b0}}) ? sign_n : 1'b0;

        // Pipeline the result
        tmp_quotient = (sign_q == 1'b1) ? (~t_q + 1) : t_q;
        tmp_remain   = (sign_r == 1'b1) ? (~t_r + 1) : t_r;

        // Recalculate the quotient and remainder if remainder is negative number
        // and LPM_REMAINDERPOSITIVE=TRUE.
        if ((sign_r) && (lpm_remainderpositive == "TRUE"))
        begin
            tmp_quotient = tmp_quotient + ((sign_d == 1'b1) ? 1 : -1 );
            tmp_remain = tmp_remain + t_denom;
        end
    end

    always @(posedge i_clock or posedge i_aclr)
    begin
        if (i_aclr)
        begin
            for (i = 0; i <= (lpm_pipeline+1); i = i + 1)
            begin
                quotient_pipe[i] <= {lpm_widthn{1'b0}};
                remain_pipe[i] <= {lpm_widthd{1'b0}};
            end
            pipe_ptr <= 0;
        end
        else if (i_clken)
        begin
            quotient_pipe[pipe_ptr] <= tmp_quotient;
            remain_pipe[pipe_ptr] <= tmp_remain;

            if (lpm_pipeline > 1)
                pipe_ptr <= (pipe_ptr + 1) % lpm_pipeline;
        end
    end

// CONTINOUS ASSIGNMENT
    assign quotient = (lpm_pipeline > 0) ? quotient_pipe[pipe_ptr] : tmp_quotient;
    assign remain = (lpm_pipeline > 0) ? remain_pipe[pipe_ptr] : tmp_remain;

endmodule // lpm_divide

