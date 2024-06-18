// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_bustri
//
// Description     :  Parameterized tri-state buffer. lpm_bustri is useful for
//                    controlling both unidirectional and bidirectional I/O bus
//                    controllers.
//
// Limitation      :  n/a
//
// Results expected:  Belows are the three configurations which are valid:
//
//                    1) Only the input ports data[LPM_WIDTH-1..0] and enabledt are
//                       present, and only the output ports tridata[LPM_WIDTH-1..0]
//                       are present.
//
//                        ----------------------------------------------------
//                       | Input           |  Output                          |
//                       |====================================================|
//                       | enabledt        |     tridata[LPM_WIDTH-1..0]      |
//                       |----------------------------------------------------|
//                       |    0            |     Z                            |
//                       |----------------------------------------------------|
//                       |    1            |     DATA[LPM_WIDTH-1..0]         |
//                        ----------------------------------------------------
//
//                    2) Only the input ports tridata[LPM_WIDTH-1..0] and enabletr
//                       are present, and only the output ports result[LPM_WIDTH-1..0]
//                       are present.
//
//                        ----------------------------------------------------
//                       | Input           |  Output                          |
//                       |====================================================|
//                       | enabletr        |     result[LPM_WIDTH-1..0]       |
//                       |----------------------------------------------------|
//                       |    0            |     Z                            |
//                       |----------------------------------------------------|
//                       |    1            |     tridata[LPM_WIDTH-1..0]      |
//                        ----------------------------------------------------
//
//                    3) All ports are present: input ports data[LPM_WIDTH-1..0],
//                       enabledt, and enabletr; output ports result[LPM_WIDTH-1..0];
//                       and bidirectional ports tridata[LPM_WIDTH-1..0].
//
//        ----------------------------------------------------------------------------
//       |         Input        |      Bidirectional       |         Output           |
//       |----------------------------------------------------------------------------|
//       | enabledt  | enabletr | tridata[LPM_WIDTH-1..0]  |  result[LPM_WIDTH-1..0]  |
//       |============================================================================|
//       |    0      |     0    |       Z (input)          |          Z               |
//       |----------------------------------------------------------------------------|
//       |    0      |     1    |       Z (input)          |  tridata[LPM_WIDTH-1..0] |
//       |----------------------------------------------------------------------------|
//       |    1      |     0    |     data[LPM_WIDTH-1..0] |          Z               |
//       |----------------------------------------------------------------------------|
//       |    1      |     1    |     data[LPM_WIDTH-1..0] |  data[LPM_WIDTH-1..0]    |
//       ----------------------------------------------------------------------------
//
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
module lpm_bustri (
    tridata,    // Bidirectional bus signal. (Required)
    data,       // Data input to the tridata[] bus. (Required)
    enabletr,   // If high, enables tridata[] onto the result bus.
    enabledt,   // If high, enables data onto the tridata[] bus.
    result      // Output from the tridata[] bus.
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;
    parameter lpm_type = "lpm_bustri";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;
    input  enabletr;
    input  enabledt;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] result;

// INPUT/OUTPUT PORT DECLARATION
    inout  [lpm_width-1:0] tridata;

// INTERNAL REGISTERS DECLARATION
    reg  [lpm_width-1:0] result;

// INTERNAL TRI DECLARATION
    logic  enabletr; // -- converted tristate to logic
    logic  enabledt; // -- converted tristate to logic

    wire i_enabledt;
    wire i_enabletr;
    assign i_enabledt = enabledt; // -- converted buf to assign
    assign i_enabletr = enabletr; // -- converted buf to assign


// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if (lpm_width <= 0)
        begin
            $display("Value of lpm_width parameter must be greater than 0(ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
    end

// ALWAYS CONSTRUCT BLOCK
    always @(data or tridata or i_enabletr or i_enabledt)
    begin
        if ((i_enabledt == 1'b0) && (i_enabletr == 1'b1))
        begin
            result = tridata;
        end
        else if ((i_enabledt == 1'b1) && (i_enabletr == 1'b1))
        begin
            result = data;
        end
        else
        begin
            result = {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
        end
    end

// CONTINOUS ASSIGNMENT
    assign tridata = (i_enabledt == 1) ? data : {lpm_width{1'b0 /* converted x or z to 1'b0 */}};

endmodule // lpm_bustri

