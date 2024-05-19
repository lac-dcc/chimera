// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_ff
//
// Description     :  Parameterized flipflop megafunction. The lpm_ff function
//                    contains features that are not available in the DFF, DFFE,
//                    DFFEA, TFF, and TFFE primitives, such as synchronous or
//                    asynchronous set, clear, and load inputs.

//
// Limitation      :  n/a
//
// Results expected:  Data output from D or T flipflops.
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
module lpm_ff (
    data,   // T-type flipflop: Toggle enable
            // D-type flipflop: Data input

    clock,  // Positive-edge-triggered clock. (Required)
    enable, // Clock enable input.
    aclr,   // Asynchronous clear input.
    aset,   // Asynchronous set input.

    aload,  // Asynchronous load input. Asynchronously loads the flipflop with
            // the value on the data input.

    sclr,   // Synchronous clear input.
    sset,   // Synchronous set input.

    sload,  // Synchronous load input. Loads the flipflop with the value on the
            // data input on the next active clock edge.

    q       // Data output from D or T flipflops. (Required)
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width  = 1; // Width of the data[] and q[] ports. (Required)
    parameter lpm_avalue = "UNUSED";    // Constant value that is loaded when aset is high.
    parameter lpm_svalue = "UNUSED";    // Constant value that is loaded on the rising edge
                                        // of clock when sset is high.
    parameter lpm_pvalue = "UNUSED";
    parameter lpm_fftype = "DFF";       // Type of flipflop
    parameter lpm_type = "lpm_ff";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;
    input  clock;
    input  enable;
    input  aclr;
    input  aset;
    input  aload;
    input  sclr;
    input  sset;
    input  sload ;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] q;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg  [lpm_width-1:0] tmp_q;
    reg  [lpm_width-1:0] adata;
    reg  use_adata;
    reg  [lpm_width-1:0] svalue;
    reg  [lpm_width-1:0] avalue;
    reg  [lpm_width-1:0] pvalue;

// INTERNAL WIRE DECLARATION
    wire [lpm_width-1:0] final_q;

// LOCAL INTEGER DECLARATION
    integer i;

// INTERNAL TRI DECLARATION
    logic  [lpm_width-1:0] data; // -- converted tristate to logic
    logic enable; // -- converted tristate to logic
    logic sload; // -- converted tristate to logic
    logic sclr; // -- converted tristate to logic
    logic sset; // -- converted tristate to logic
    logic aload; // -- converted tristate to logic
    logic aclr; // -- converted tristate to logic
    logic aset; // -- converted tristate to logic

    wire i_enable;
    wire i_sload;
    wire i_sclr;
    wire i_sset;
    wire i_aload;
    wire i_aclr;
    wire i_aset;
    assign i_enable = enable; // -- converted buf to assign
    assign i_sload = sload; // -- converted buf to assign
    assign i_sclr = sclr; // -- converted buf to assign
    assign i_sset = sset; // -- converted buf to assign
    assign i_aload = aload; // -- converted buf to assign
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
            $display("Value of lpm_width parameter must be greater than 0(ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if ((lpm_fftype != "DFF") &&
            (lpm_fftype != "TFF") &&
            (lpm_fftype != "UNUSED"))          // non-LPM 220 standard
        begin
            $display("Error!  LPM_FFTYPE value must be \"DFF\" or \"TFF\".");
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
        use_adata = 1'b0;
    end

// ALWAYS CONSTRUCT BLOCK
    always @(posedge i_aclr or posedge i_aset or posedge i_aload or posedge clock)
    begin // Asynchronous process
        if (i_aclr || i_aset || i_aload)
            use_adata <= 1'b1;
        else if ($time > 0)
        begin // Synchronous process
            if (i_enable)
            begin
                use_adata <= 1'b0;

                if (i_sclr)
                    tmp_q <= 0;
                else if (i_sset)
                    tmp_q <= svalue;
                else if (i_sload)  // Load data
                    tmp_q <= data;
                else
                begin
                    if (lpm_fftype == "TFF") // toggle
                    begin
                        for (i = 0; i < lpm_width; i=i+1)
                            if (data[i] == 1'b1)
                                tmp_q[i] <= ~final_q[i];
                            else
                                tmp_q[i] <= final_q[i];
                    end
                    else    // DFF, load data
                        tmp_q <= data;
                end
            end
        end
    end

    always @(i_aclr or i_aset or i_aload or data or avalue or pvalue)
    begin
        if (i_aclr === 1'b1)
            adata <= {lpm_width{1'b0}};
        else if (i_aclr === 1'b0 /* converted x or z to 1'b0 */)
            adata <= {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
        else if (i_aset)
            adata <= avalue;
        else if (i_aload)
            adata <= data;
        else if ((i_aclr === 1'b0) && ($time == 0))
            adata <= pvalue;
    end

// CONTINOUS ASSIGNMENT
    assign q = final_q;
    assign final_q = (use_adata == 1'b1) ? adata : tmp_q;

endmodule // lpm_ff

