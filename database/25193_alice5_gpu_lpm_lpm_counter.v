// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_counter
//
// Description     :  Parameterized counter megafunction. The lpm_counter
//                    megafunction is a binary counter that features an up,
//                    down, or up/down counter with optional synchronous or
//                    asynchronous clear, set, and load ports.
//
// Limitation      :  n/a
//
// Results expected:  Data output from the counter and carry-out of the MSB.
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
module lpm_counter (
    clock,  // Positive-edge-triggered clock. (Required)
    clk_en, // Clock enable input. Enables all synchronous activities.
    cnt_en, // Count enable input. Disables the count when low (0) without
            // affecting sload, sset, or sclr.
    updown, // Controls the direction of the count. High (1) = count up.
            //                                      Low (0) = count down.
    aclr,   // Asynchronous clear input.
    aset,   // Asynchronous set input.
    aload,  // Asynchronous load input. Asynchronously loads the counter with
            // the value on the data input.
    sclr,   // Synchronous clear input. Clears the counter on the next active
            // clock edge.
    sset,   // Synchronous set input. Sets the counter on the next active clock edge.
    sload,  // Synchronous load input. Loads the counter with data[] on the next
            // active clock edge.
    data,   // Parallel data input to the counter.
    cin,    // Carry-in to the low-order bit.
    q,      // Data output from the counter.
    cout,   // Carry-out of the MSB.
    eq      // Counter decode output. Active high when the counter reaches the specified
            // count value.
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;    //The number of bits in the count, or the width of the q[]
                                // and data[] ports, if they are used. (Required)
    parameter lpm_direction = "UNUSED"; // Direction of the count.
    parameter lpm_modulus = 0;          // The maximum count, plus one.
    parameter lpm_avalue = "UNUSED";    // Constant value that is loaded when aset is high.
    parameter lpm_svalue = "UNUSED";    // Constant value that is loaded on the rising edge
                                        // of clock when sset is high.
    parameter lpm_pvalue = "UNUSED";
    parameter lpm_port_updown = "PORT_CONNECTIVITY";
    parameter lpm_type = "lpm_counter";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  clock;
    input  clk_en;
    input  cnt_en;
    input  updown;
    input  aclr;
    input  aset;
    input  aload;
    input  sclr;
    input  sset;
    input  sload;
    input  [lpm_width-1:0] data;
    input  cin;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] q;
    output cout;
    output [15:0] eq;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg  [lpm_width-1:0] tmp_count;
    reg  [lpm_width-1:0] adata;

    reg  use_adata;
    reg  tmp_updown;
    reg  [lpm_width:0] tmp_modulus;
    reg  [lpm_width:0] max_modulus;
    reg  [lpm_width-1:0] svalue;
    reg  [lpm_width-1:0] avalue;
    reg  [lpm_width-1:0] pvalue;

// INTERNAL WIRE DECLARATION
    wire w_updown;
    wire [lpm_width-1:0] final_count;

// LOCAL INTEGER DECLARATION
    integer i;

// INTERNAL TRI DECLARATION

    logic clk_en; // -- converted tristate to logic
    logic cnt_en; // -- converted tristate to logic
    logic aclr; // -- converted tristate to logic
    logic aset; // -- converted tristate to logic
    logic aload; // -- converted tristate to logic
    logic sclr; // -- converted tristate to logic
    logic sset; // -- converted tristate to logic
    logic sload; // -- converted tristate to logic
    logic cin; // -- converted tristate to logic
    logic updown_z; // -- converted tristate to logic

    wire i_clk_en;
    wire i_cnt_en;
    wire i_aclr;
    wire i_aset;
    wire i_aload;
    wire i_sclr;
    wire i_sset;
    wire i_sload;
    wire i_cin;
    wire i_updown;
    assign i_clk_en = clk_en; // -- converted buf to assign
    assign i_cnt_en = cnt_en; // -- converted buf to assign
    assign i_aclr = aclr; // -- converted buf to assign
    assign i_aset = aset; // -- converted buf to assign
    assign i_aload = aload; // -- converted buf to assign
    assign i_sclr = sclr; // -- converted buf to assign
    assign i_sset = sset; // -- converted buf to assign
    assign i_sload = sload; // -- converted buf to assign
    assign i_cin = cin; // -- converted buf to assign
    assign i_updown = updown_z; // -- converted buf to assign

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
        max_modulus = 1 << lpm_width;

        // check if lpm_width < 0
        if (lpm_width <= 0)
        begin
            $display("Error!  LPM_WIDTH must be greater than 0.\n");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        // check if lpm_modulus < 0
        if (lpm_modulus < 0)
        begin
            $display("Error!  LPM_MODULUS must be greater or equal to 0.\n");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        // check if lpm_modulus > 1<<lpm_width
        if (lpm_modulus > max_modulus)
        begin
            $display("Warning!  LPM_MODULUS should be within 1 to 2^LPM_WIDTH. Assuming no modulus input.\n");
            $display ("Time: %0t  Instance: %m", $time);
        end
        // check if lpm_direction valid
        if ((lpm_direction != "UNUSED") && (lpm_direction != "DEFAULT") &&
            (lpm_direction != "UP") && (lpm_direction != "DOWN"))
        begin
            $display("Error!  LPM_DIRECTION must be \"UP\" or \"DOWN\" if used.\n");
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

        tmp_modulus = ((lpm_modulus == 0) || (lpm_modulus > max_modulus))
                        ? max_modulus : lpm_modulus;
        tmp_count = pvalue;
        use_adata = 1'b0;
    end

    // NCSIM will only assigns 1'bZ to unconnected port at time 0fs + 1
    initial #0
    begin
        // // check if lpm_direction valid
        if ((lpm_direction != "UNUSED") && (lpm_direction != "DEFAULT") && (updown !== 1'b0 /* converted x or z to 1'b0 */) &&
            (lpm_port_updown == "PORT_CONNECTIVITY"))
        begin
            $display("Error!  LPM_DIRECTION and UPDOWN cannot be used at the same time.\n");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
    end

// ALWAYS CONSTRUCT BLOCK
    always @(posedge i_aclr or posedge i_aset or posedge i_aload or posedge clock)
    begin
        if (i_aclr || i_aset || i_aload)
            use_adata <= 1'b1;
        else if ($time > 0)
        begin
            if (i_clk_en)
            begin
                use_adata <= 1'b0;

                if (i_sclr)
                    tmp_count <= 0;
                else if (i_sset)
                    tmp_count <= svalue;
                else if (i_sload)
                    tmp_count <= data;
                else if (i_cnt_en && i_cin)
                begin
                    if (w_updown)
                        tmp_count <= (final_count == tmp_modulus-1) ? 0
                                                    : final_count+1;
                    else
                        tmp_count <= (final_count == 0) ? tmp_modulus-1
                                                    : final_count-1;
                end
                else
                    tmp_count <= final_count;
            end
        end
    end

    always @(i_aclr or i_aset or i_aload or data or avalue)
    begin
        if (i_aclr)
        begin
            adata <= 0;
        end
        else if (i_aset)
        begin
            adata <= avalue;
        end
        else if (i_aload)
            adata <= data;
    end

// CONTINOUS ASSIGNMENT
    assign q = final_count;
    assign final_count = (use_adata == 1'b1) ? adata : tmp_count;
    assign cout = (i_cin && (((w_updown==0) && (final_count==0)) ||
                            ((w_updown==1) && ((final_count==tmp_modulus-1) ||
                                                (final_count=={lpm_width{1'b1}}))) ))
                    ? 1'b1 : 1'b0;
    assign updown_z = updown;
    assign w_updown =   (lpm_port_updown == "PORT_USED") ? i_updown :
                        (lpm_port_updown == "PORT_UNUSED") ? ((lpm_direction == "DOWN") ? 1'b0 : 1'b1) :
                        ((((lpm_direction == "UNUSED") || (lpm_direction == "DEFAULT")) && (i_updown == 1)) ||
                        (lpm_direction == "UP"))
                        ? 1'b1 : 1'b0;
    assign eq = {16{1'b0}};

endmodule // lpm_counter

