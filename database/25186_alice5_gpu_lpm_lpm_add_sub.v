// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_add_sub
//
// Description     :  Parameterized adder/subtractor megafunction.
//
// Limitation      :  n/a
//
// Results expected:  If performs as adder, the result will be dataa[]+datab[]+cin.
//                    If performs as subtractor, the result will be dataa[]-datab[]+cin-1.
//                    Also returns carry out bit and overflow status bit.
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
module lpm_add_sub (
    dataa,      // Augend/Minuend
    datab,      // Addend/Subtrahend
    cin,        // Carry-in to the low-order bit.
    add_sub,    // If the signal is high, the operation = dataa[]+datab[]+cin.
                // If the signal is low, the operation = dataa[]-datab[]+cin-1.

    clock,      // Clock for pipelined usage.
    aclr,       // Asynchronous clear for pipelined usage.
    clken,      // Clock enable for pipelined usage.
    result,     // dataa[]+datab[]+cin or dataa[]-datab[]+cin-1
    cout,       // Carry-out (borrow-in) of the MSB.
    overflow    // Result exceeds available precision.
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1; // Width of the dataa[],datab[], and result[] ports.
    parameter lpm_representation = "SIGNED"; // Type of addition performed
    parameter lpm_direction  = "UNUSED";  // Specify the operation of the lpm_add_sub function
    parameter lpm_pipeline = 0; // Number of Clock cycles of latency
    parameter lpm_type = "lpm_add_sub";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] dataa;
    input  [lpm_width-1:0] datab;
    input  cin;
    input  add_sub;
    input  clock;
    input  aclr;
    input  clken;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] result;
    output cout;
    output overflow;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg [lpm_width-1:0] result_pipe [(lpm_pipeline+1):0];
    reg [(lpm_pipeline+1):0] cout_pipe;
    reg [(lpm_pipeline+1):0] overflow_pipe;
    reg tmp_cout;
    reg tmp_overflow;
    reg [lpm_width-1:0] tmp_result;
    reg i_cin;

// LOCAL INTEGER DECLARATION
    integer borrow;
    integer i;
    integer pipe_ptr;

// INTERNAL TRI DECLARATION
    logic i_add_sub; // -- converted tristate to logic
    logic i_aclr; // -- converted tristate to logic
    logic i_clken; // -- converted tristate to logic
    logic i_clock; // -- converted tristate to logic


// INITIAL CONSTRUCT BLOCK
    initial
    begin
        // check if lpm_width < 0
        if (lpm_width <= 0)
        begin
            $display("Error!  LPM_WIDTH must be greater than 0.\n");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if ((lpm_direction != "ADD") &&
            (lpm_direction != "SUB") &&
            (lpm_direction != "UNUSED") &&   // non-LPM 220 standard
            (lpm_direction != "DEFAULT"))    // non-LPM 220 standard
        begin
            $display("Error!  LPM_DIRECTION value must be \"ADD\" or \"SUB\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if ((lpm_representation != "SIGNED") &&
            (lpm_representation != "UNSIGNED"))
        begin
            $display("Error!  LPM_REPRESENTATION value must be \"SIGNED\" or \"UNSIGNED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if (lpm_pipeline < 0)
        begin
            $display("Error!  LPM_PIPELINE must be greater than or equal to 0.\n");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        for (i = 0; i <= (lpm_pipeline+1); i = i + 1)
        begin
            result_pipe[i] = 'b0;
            cout_pipe[i] = 1'b0;
            overflow_pipe[i] = 1'b0;
        end

        pipe_ptr = 0;
    end

// ALWAYS CONSTRUCT BLOCK
    always @(cin or dataa or datab or i_add_sub)
    begin
        i_cin = 1'b0;
        borrow = 1'b0;

        // cout is the same for both signed and unsign representation.
        if ((lpm_direction == "ADD") || ((i_add_sub == 1) &&
            ((lpm_direction == "UNUSED") || (lpm_direction == "DEFAULT")) ))
        begin
            i_cin = (cin === 1'b0 /* converted x or z to 1'b0 */) ? 0 : cin;
            {tmp_cout, tmp_result} = dataa + datab + i_cin;
            tmp_overflow = tmp_cout;
        end
        else if ((lpm_direction == "SUB") || ((i_add_sub == 0) &&
                ((lpm_direction == "UNUSED") || (lpm_direction == "DEFAULT")) ))
        begin
            i_cin = (cin === 1'b0 /* converted x or z to 1'b0 */) ? 1 : cin;
            borrow = (~i_cin) ? 1 : 0;
            {tmp_overflow, tmp_result} = dataa - datab - borrow;
            tmp_cout = (dataa >= (datab+borrow))?1:0;
        end

        if (lpm_representation == "SIGNED")
        begin
            // perform the addtion or subtraction operation
            if ((lpm_direction == "ADD") || ((i_add_sub == 1) &&
                ((lpm_direction == "UNUSED") || (lpm_direction == "DEFAULT")) ))
            begin
                tmp_result = dataa + datab + i_cin;
                tmp_overflow = ((dataa[lpm_width-1] == datab[lpm_width-1]) &&
                                                (dataa[lpm_width-1] != tmp_result[lpm_width-1])) ?
                                                1 : 0;
            end
            else if ((lpm_direction == "SUB") || ((i_add_sub == 0) &&
                    ((lpm_direction == "UNUSED") || (lpm_direction == "DEFAULT")) ))
            begin
                tmp_result = dataa - datab - borrow;
                tmp_overflow = ((dataa[lpm_width-1] != datab[lpm_width-1]) &&
                                                (dataa[lpm_width-1] != tmp_result[lpm_width-1])) ?
                                                1 : 0;
            end
        end
    end

    always @(posedge i_clock or posedge i_aclr)
    begin
        if (i_aclr)
        begin
            for (i = 0; i <= (lpm_pipeline+1); i = i + 1)
            begin
                result_pipe[i] <= {lpm_width{1'b0}};
                cout_pipe[i] <= 1'b0;
                overflow_pipe[i] <= 1'b0;
            end
            pipe_ptr <= 0;
        end
        else if (i_clken == 1)
        begin
            result_pipe[pipe_ptr] <= tmp_result;
            cout_pipe[pipe_ptr] <= tmp_cout;
            overflow_pipe[pipe_ptr] <= tmp_overflow;

            if (lpm_pipeline > 1)
                pipe_ptr <= (pipe_ptr + 1) % lpm_pipeline;
        end
    end

// CONTINOUS ASSIGNMENT
    assign result = (lpm_pipeline > 0) ? result_pipe[pipe_ptr] : tmp_result;
    assign cout = (lpm_pipeline > 0) ? cout_pipe[pipe_ptr] : tmp_cout;
    assign overflow = (lpm_pipeline > 0) ? overflow_pipe[pipe_ptr] : tmp_overflow;
    assign i_clock = clock;
    assign i_aclr = aclr;
    assign i_clken = clken;
    assign i_add_sub = add_sub;

endmodule // lpm_add_sub

