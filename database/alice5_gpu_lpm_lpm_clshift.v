// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_clshift
//
// Description     :  Parameterized combinatorial logic shifter or barrel shifter
//                    megafunction.
//
// Limitation      :  n/a
//
// Results expected:  Return the shifted data and underflow/overflow status bit.
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
module lpm_clshift (
    data,       // Data to be shifted. (Required)
    distance,   // Number of positions to shift data[] in the direction specified
                // by the direction port. (Required)
    direction,  // Direction of shift. Low = left (toward the MSB),
                //                     high = right (toward the LSB).
    clock,      // Clock for pipelined usage.
    aclr,       // Asynchronous clear for pipelined usage.
    clken,      // Clock enable for pipelined usage.
    result,     // Shifted data. (Required)
    underflow,  // Logical or arithmetic underflow.
    overflow    // Logical or arithmetic overflow.
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;    // Width of the data[] and result[] ports. Must be
                                // greater than 0 (Required)
    parameter lpm_widthdist = 1; // Width of the distance[] input port. (Required)
    parameter lpm_shifttype = "LOGICAL"; // Type of shifting operation to be performed.
    parameter lpm_pipeline = 0;             // Number of Clock cycles of latency
    parameter lpm_type = "lpm_clshift";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;
    input  [lpm_widthdist-1:0] distance;
    input  direction;
    input  clock;
    input  aclr;
    input  clken;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] result;
    output underflow;
    output overflow;

// INTERNAL REGISTERS DECLARATION
    reg    [lpm_width-1:0] ONES;
    reg    [lpm_width-1:0] ZEROS;
    reg    [lpm_width-1:0] tmp_result;
    reg    tmp_underflow;
    reg    tmp_overflow;
    reg    [lpm_width-1:0] result_pipe [(lpm_pipeline+1):0];
    reg    [(lpm_pipeline+1):0] overflow_pipe;
    reg    [(lpm_pipeline+1):0] underflow_pipe;

// LOCAL INTEGER DECLARATION
    integer i;
    integer i1;
    integer pipe_ptr;

// INTERNAL TRI DECLARATION
    logic  direction; // -- converted tristate to logic
    logic   clock; // -- converted tristate to logic
    logic   aclr; // -- converted tristate to logic
    logic   clken; // -- converted tristate to logic

    wire i_direction;
    wire i_clock;
    wire i_clken;
    wire i_aclr;
    assign i_direction = direction; // -- converted buf to assign
    assign i_clock = clock; // -- converted buf to assign
    assign i_clken = clken; // -- converted buf to assign
    assign i_aclr = aclr; // -- converted buf to assign


// FUNCTON DECLARATION
    // Perform logival shift operation
    function [lpm_width+1:0] LogicShift;
        input [lpm_width-1:0] data;
        input [lpm_widthdist-1:0] shift_num;
        input direction;
        reg   [lpm_width-1:0] tmp_buf;
        reg   underflow;
        reg   overflow;

        begin
            tmp_buf = data;
            overflow = 1'b0;
            underflow = 1'b0;
            if ((direction) && (shift_num > 0)) // shift right
            begin
                tmp_buf = data >> shift_num;
                if ((data != ZEROS) && ((shift_num >= lpm_width) || (tmp_buf == ZEROS)))
                    underflow = 1'b1;
            end
            else if (shift_num > 0) // shift left
            begin
                tmp_buf = data << shift_num;
                if ((data != ZEROS) && ((shift_num >= lpm_width)
                    || ((data >> (lpm_width-shift_num)) != ZEROS)))
                    overflow = 1'b1;
            end
            LogicShift = {overflow,underflow,tmp_buf[lpm_width-1:0]};
        end
    endfunction // LogicShift

    // Perform Arithmetic shift operation
    function [lpm_width+1:0] ArithShift;
        input [lpm_width-1:0] data;
        input [lpm_widthdist-1:0] shift_num;
        input direction;
        reg   [lpm_width-1:0] tmp_buf;
        reg   underflow;
        reg   overflow;
        integer i;
        integer i1;

        begin
            tmp_buf = data;
            overflow = 1'b0;
            underflow = 1'b0;

            if (shift_num < lpm_width)
            begin
                if ((direction) && (shift_num > 0))   // shift right
                begin
                    if (data[lpm_width-1] == 1'b0) // positive number
                    begin
                        tmp_buf = data >> shift_num;
                        if ((data != ZEROS) && ((shift_num >= lpm_width) || (tmp_buf == ZEROS)))
                            underflow = 1'b1;
                    end
                    else // negative number
                    begin
                        tmp_buf = (data >> shift_num) | (ONES << (lpm_width - shift_num));
                        if ((data != ONES) && ((shift_num >= lpm_width-1) || (tmp_buf == ONES)))
                            underflow = 1'b1;
                    end
                end
                else if (shift_num > 0) // shift left
                begin
                    tmp_buf = data << shift_num;

                    for (i=lpm_width-1; i >= lpm_width-shift_num; i=i-1)
                    begin
                        if(data[i-1] != data[lpm_width-1])
                            overflow = 1'b1;
                    end
                end
            end
            else    // shift_num >= lpm_width
            begin
                if (direction)
                begin
                    for (i=0; i < lpm_width; i=i+1)
                        tmp_buf[i] = data[lpm_width-1];

                    underflow = 1'b1;
                end
                else
                begin
                    tmp_buf = {lpm_width{1'b0}};

                    if (data != ZEROS)
                    begin
                        overflow = 1'b1;
                    end
                end
            end
            ArithShift = {overflow,underflow,tmp_buf[lpm_width-1:0]};
        end
    endfunction // ArithShift

    // Perform rotate shift operation
    function [lpm_width+1:0] RotateShift;
        input [lpm_width-1:0] data;
        input [lpm_widthdist-1:0] shift_num;
        input direction;
        reg   [lpm_width-1:0] tmp_buf;

        begin
            tmp_buf = data;
            if ((direction) && (shift_num > 0)) // shift right
                tmp_buf = (data >> shift_num) | (data << (lpm_width - shift_num));
            else if (shift_num > 0) // shift left
                tmp_buf = (data << shift_num) | (data >> (lpm_width - shift_num));
            RotateShift = {2'bx, tmp_buf[lpm_width-1:0]};
        end
    endfunction // RotateShift

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if ((lpm_shifttype != "LOGICAL") &&
            (lpm_shifttype != "ARITHMETIC") &&
            (lpm_shifttype != "ROTATE") &&
            (lpm_shifttype != "UNUSED"))          // non-LPM 220 standard
            begin
                $display("Error!  LPM_SHIFTTYPE value must be \"LOGICAL\", \"ARITHMETIC\", or \"ROTATE\".");
                $display("Time: %0t  Instance: %m", $time);
            end

        if (lpm_width <= 0)
        begin
            $display("Value of lpm_width parameter must be greater than 0(ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if (lpm_widthdist <= 0)
        begin
            $display("Value of lpm_widthdist parameter must be greater than 0(ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        for (i=0; i < lpm_width; i=i+1)
        begin
            ONES[i] = 1'b1;
            ZEROS[i] = 1'b0;
        end

        for (i = 0; i <= lpm_pipeline; i = i + 1)
        begin
            result_pipe[i] = ZEROS;
            overflow_pipe[i] = 1'b0;
            underflow_pipe[i] = 1'b0;
        end

        tmp_result = ZEROS;
        tmp_underflow = 1'b0;
        tmp_overflow = 1'b0;
        pipe_ptr = 0;

    end

// ALWAYS CONSTRUCT BLOCK
    always @(data or i_direction or distance)
    begin
        if ((lpm_shifttype == "LOGICAL") || (lpm_shifttype == "UNUSED"))
            {tmp_overflow, tmp_underflow, tmp_result} = LogicShift(data, distance, i_direction);
        else if (lpm_shifttype == "ARITHMETIC")
            {tmp_overflow, tmp_underflow, tmp_result} = ArithShift(data, distance, i_direction);
        else if (lpm_shifttype == "ROTATE")
            {tmp_overflow, tmp_underflow, tmp_result} = RotateShift(data, distance, i_direction);
    end

    always @(posedge i_clock or posedge i_aclr)
    begin
        if (i_aclr)
        begin
            for (i1 = 0; i1 <= lpm_pipeline; i1 = i1 + 1)
            begin
                result_pipe[i1] <= {lpm_width{1'b0}};
                overflow_pipe[i1] <= 1'b0;
                underflow_pipe[i1] <= 1'b0;
            end
            pipe_ptr <= 0;
        end
        else if (i_clken == 1'b1)
        begin
            result_pipe[pipe_ptr] <= tmp_result;
            overflow_pipe[pipe_ptr] <= tmp_overflow;
            underflow_pipe[pipe_ptr] <= tmp_underflow;

            if (lpm_pipeline > 1)
                pipe_ptr <= (pipe_ptr + 1) % lpm_pipeline;
        end
    end

    assign result = (lpm_pipeline > 0) ? result_pipe[pipe_ptr] : tmp_result;
    assign overflow = (lpm_pipeline > 0) ? overflow_pipe[pipe_ptr] : tmp_overflow;
    assign underflow = (lpm_pipeline > 0) ? underflow_pipe[pipe_ptr] : tmp_underflow;

endmodule // lpm_clshift

