// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_ram_dp
//
// Description     :  Parameterized dual-port RAM megafunction.
//
// Limitation      :  n/a
//
// Results expected:  Data output from the memory.
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
module lpm_ram_dp (
    data,      // Data input to the memory. (Required)
    rdaddress, // Read address input to the memory. (Required)
    wraddress, // Write address input to the memory. (Required)
    rdclock,   // Positive-edge-triggered clock for read operation.
    rdclken,   // Clock enable for rdclock.
    wrclock,   // Positive-edge-triggered clock for write operation.
    wrclken,   // Clock enable for wrclock.
    rden,      // Read enable input. Disables reading when low (0).
    wren,      // Write enable input. (Required)
    q          // Data output from the memory. (Required)
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;   // Width of the data[] and q[] ports. (Required)
    parameter lpm_widthad = 1; // Width of the rdaddress[] and wraddress[] ports. (Required)
    parameter lpm_numwords = 1 << lpm_widthad; // Number of words stored in memory.
    parameter lpm_indata = "REGISTERED"; // Determines the clock used by the data port.
    parameter lpm_rdaddress_control  = "REGISTERED"; // Determines the clock used by the rdaddress and rden ports.
    parameter lpm_wraddress_control  = "REGISTERED"; // Determines the clock used by the wraddress and wren ports.
    parameter lpm_outdata = "REGISTERED"; // Determines the clock used by the q[] pxort.
    parameter lpm_file = "UNUSED"; // Name of the file containing RAM initialization data.
    parameter use_eab = "ON"; // Specified whether to use the EAB or not.
    parameter rden_used = "TRUE"; // Specified whether to use the rden port or not.
    parameter intended_device_family = "Stratix";
    parameter lpm_type = "lpm_ram_dp";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;
    input  [lpm_widthad-1:0] rdaddress;
    input  [lpm_widthad-1:0] wraddress;
    input  rdclock;
    input  rdclken;
    input  wrclock;
    input  wrclken;
    input  rden;
    input  wren;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] q;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg [lpm_width-1:0] mem_data [(1<<lpm_widthad)-1:0];
    reg [lpm_width-1:0] i_data_reg, i_data_tmp, i_q_reg, i_q_tmp;
    reg [lpm_widthad-1:0] i_wraddress_reg, i_wraddress_tmp;
    reg [lpm_widthad-1:0] i_rdaddress_reg, i_rdaddress_tmp;
    reg i_wren_reg, i_wren_tmp, i_rden_reg, i_rden_tmp;
    reg [8*256:1] ram_initf;

// LOCAL INTEGER DECLARATION
    integer i, i_numwords;

// INTERNAL TRI DECLARATION
    logic wrclock; // -- converted tristate to logic
    logic wrclken; // -- converted tristate to logic
    logic rdclock; // -- converted tristate to logic
    logic rdclken; // -- converted tristate to logic
    logic wren; // -- converted tristate to logic
    logic rden; // -- converted tristate to logic

    wire i_inclock;
    wire i_inclocken;
    wire i_outclock;
    wire i_outclocken;
    wire i_wren;
    wire i_rden;

    assign i_inclock = wrclock; // -- converted buf to assign
    assign i_inclocken = wrclken; // -- converted buf to assign
    assign i_outclock = rdclock; // -- converted buf to assign
    assign i_outclocken = rdclken; // -- converted buf to assign
    assign i_wren = wren; // -- converted buf to assign
    assign i_rden = rden; // -- converted buf to assign

// COMPONENT INSTANTIATIONS
    LPM_DEVICE_FAMILIES dev ();
    LPM_MEMORY_INITIALIZATION mem ();

// FUNCTON DECLARATION
    function ValidAddress;
        input [lpm_widthad-1:0] paddress;

        begin
            ValidAddress = 1'b0;
            if (^paddress === {lpm_widthad{1'b0 /* converted x or z to 1'b0 */}})
            begin
                $display("%t:Error!  Invalid address.\n", $time);
                $display("Time: %0t  Instance: %m", $time);
            end
            else if (paddress >= lpm_numwords)
            begin
                $display("%t:Error!  Address out of bound on RAM.\n", $time);
                $display("Time: %0t  Instance: %m", $time);
            end
            else
                ValidAddress = 1'b1;
        end
    endfunction

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        // Check for invalid parameters
        if (lpm_width < 1)
        begin
            $display("Error! lpm_width parameter must be greater than 0.");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if (lpm_widthad < 1)
        begin
            $display("Error! lpm_widthad parameter must be greater than 0.");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if ((lpm_indata != "REGISTERED") && (lpm_indata != "UNREGISTERED"))
        begin
            $display("Error! lpm_indata must be \"REGISTERED\" or \"UNREGISTERED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if ((lpm_outdata != "REGISTERED") && (lpm_outdata != "UNREGISTERED"))
        begin
            $display("Error! lpm_outdata must be \"REGISTERED\" or \"UNREGISTERED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if ((lpm_wraddress_control != "REGISTERED") && (lpm_wraddress_control != "UNREGISTERED"))
        begin
            $display("Error! lpm_wraddress_control must be \"REGISTERED\" or \"UNREGISTERED\".");
            $display("Time: %0t  Instance: %m", $time);
        end
        if ((lpm_rdaddress_control != "REGISTERED") && (lpm_rdaddress_control != "UNREGISTERED"))
        begin
            $display("Error! lpm_rdaddress_control must be \"REGISTERED\" or \"UNREGISTERED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if (dev.IS_VALID_FAMILY(intended_device_family) == 0)
        begin
            $display ("Error! Unknown INTENDED_DEVICE_FAMILY=%s.", intended_device_family);
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        // Initialize mem_data
        i_numwords = (lpm_numwords) ? lpm_numwords : (1<<lpm_widthad);

        if (lpm_file == "UNUSED")
            for (i=0; i<i_numwords; i=i+1)
                mem_data[i] = {lpm_width{1'b0}};
        else
        begin
            mem.convert_to_ver_file(lpm_file, lpm_width, ram_initf);
            $readmemh(ram_initf, mem_data);
        end

        // Initialize registers
        i_data_reg = {lpm_width{1'b0}};
        i_wraddress_reg = {lpm_widthad{1'b0}};
        i_rdaddress_reg = {lpm_widthad{1'b0}};
        i_wren_reg = 1'b0;
        if (rden_used == "TRUE")
            i_rden_reg = 1'b0;
        else
            i_rden_reg = 1'b1;

        // Initialize output
        i_q_reg = {lpm_width{1'b0}};
        if ((use_eab == "ON") || (lpm_hint == "USE_EAB=ON"))
        begin
            i_q_tmp = {lpm_width{1'b1}};
        end
        else
            i_q_tmp = {lpm_width{1'b0}};
    end


// ALWAYS CONSTRUCT BLOCK

    always @(posedge i_inclock)
    begin
        if (lpm_indata == "REGISTERED")
            if ((i_inclocken == 1'b1) && ($time > 0))
                i_data_reg <= data;

        if (lpm_wraddress_control == "REGISTERED")
            if ((i_inclocken == 1'b1) && ($time > 0))
            begin
                i_wraddress_reg <= wraddress;
                i_wren_reg <= i_wren;
            end

    end

    always @(posedge i_outclock)
    begin
        if (lpm_outdata == "REGISTERED")
            if ((i_outclocken == 1'b1) && ($time > 0))
            begin
                i_q_reg <= i_q_tmp;
            end

        if (lpm_rdaddress_control == "REGISTERED")
            if ((i_outclocken == 1'b1) && ($time > 0))
            begin
                i_rdaddress_reg <= rdaddress;
                i_rden_reg <= i_rden;
            end
    end


    //=========
    // Memory
    //=========

    always @(i_data_tmp or i_wren_tmp or i_wraddress_tmp or negedge i_inclock)
    begin
        if (i_wren_tmp == 1'b1)
            if (ValidAddress(i_wraddress_tmp))
            begin
                if (((use_eab == "ON") || (lpm_hint == "USE_EAB=ON")) &&
                    (lpm_wraddress_control == "REGISTERED"))
                begin
                    if (i_inclock == 1'b0)
                        mem_data[i_wraddress_tmp] <= i_data_tmp;
                end
                else
                    mem_data[i_wraddress_tmp] <= i_data_tmp;
            end
    end

    always @(i_rden_tmp or i_rdaddress_tmp or mem_data[i_rdaddress_tmp])
    begin
        if (i_rden_tmp == 1'b1)
            i_q_tmp = (ValidAddress(i_rdaddress_tmp))
                        ? mem_data[i_rdaddress_tmp]
                        : {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
    end


    //=======
    // Sync
    //=======

    always @(wraddress or i_wraddress_reg)
            i_wraddress_tmp = (lpm_wraddress_control == "REGISTERED")
                        ? i_wraddress_reg
                        : wraddress;
    always @(rdaddress or i_rdaddress_reg)
        i_rdaddress_tmp = (lpm_rdaddress_control == "REGISTERED")
                        ? i_rdaddress_reg
                        : rdaddress;
    always @(i_wren or i_wren_reg)
        i_wren_tmp = (lpm_wraddress_control == "REGISTERED")
                        ? i_wren_reg
                        : i_wren;
    always @(i_rden or i_rden_reg)
        i_rden_tmp = (lpm_rdaddress_control == "REGISTERED")
                        ? i_rden_reg
                        : i_rden;
    always @(data or i_data_reg)
        i_data_tmp = (lpm_indata == "REGISTERED")
                        ? i_data_reg
                        : data;

// CONTINOUS ASSIGNMENT
    assign q = (lpm_outdata == "REGISTERED") ? i_q_reg : i_q_tmp;

endmodule // lpm_ram_dp

