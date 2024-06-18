// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_ram_dq
//
// Description     :  Parameterized RAM with separate input and output ports megafunction.
//                    lpm_ram_dq implement asynchronous memory or memory with synchronous
//                    inputs and/or outputs.
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
module lpm_ram_dq (
    data,      // Data input to the memory. (Required)
    address,   // Address input to the memory. (Required)
    inclock,   // Synchronizes memory loading.
    outclock,  // Synchronizes q outputs from memory.
    we,        // Write enable input. Enables write operations to the memory when high. (Required)
    q          // Data output from the memory. (Required)
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;  // Width of data[] and q[] ports. (Required)
    parameter lpm_widthad = 1; // Width of the address port. (Required)
    parameter lpm_numwords = 1 << lpm_widthad; // Number of words stored in memory.
    parameter lpm_indata = "REGISTERED";  // Controls whether the data port is registered.
    parameter lpm_address_control = "REGISTERED"; // Controls whether the address and we ports are registered.
    parameter lpm_outdata = "REGISTERED"; // Controls whether the q ports are registered.
    parameter lpm_file = "UNUSED"; // Name of the file containing RAM initialization data.
    parameter use_eab = "ON"; // Specified whether to use the EAB or not.
    parameter intended_device_family = "Stratix";
    parameter lpm_type = "lpm_ram_dq";
    parameter lpm_hint = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;
    input  [lpm_widthad-1:0] address;
    input  inclock;
    input  outclock;
    input  we;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] q;


// INTERNAL REGISTER/SIGNAL DECLARATION
    reg  [lpm_width-1:0] mem_data [lpm_numwords-1:0];
    reg  [lpm_width-1:0] tmp_q;
    reg  [lpm_width-1:0] pdata;
    reg  [lpm_width-1:0] in_data;
    reg  [lpm_widthad-1:0] paddress;
    reg  pwe;
    reg  [lpm_width-1:0]  ZEROS, ONES, UNKNOWN;
    reg  [8*256:1] ram_initf;

// LOCAL INTEGER DECLARATION
    integer i;

// INTERNAL TRI DECLARATION
    logic inclock; // -- converted tristate to logic
    logic outclock; // -- converted tristate to logic

    wire i_inclock;
    wire i_outclock;
    assign i_inclock = inclock; // -- converted buf to assign
    assign i_outclock = outclock; // -- converted buf to assign

// COMPONENT INSTANTIATIONS
    LPM_DEVICE_FAMILIES dev ();
    LPM_MEMORY_INITIALIZATION mem ();

// FUNCTON DECLARATION
    // Check the validity of the address.
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

        // Initialize the internal data register.
        pdata = {lpm_width{1'b0}};
        paddress = {lpm_widthad{1'b0}};
        pwe = 1'b0;

        if (lpm_width <= 0)
        begin
            $display("Error!  LPM_WIDTH parameter must be greater than 0.");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if (lpm_widthad <= 0)
        begin
            $display("Error!  LPM_WIDTHAD parameter must be greater than 0.");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        // check for number of words out of bound
        if ((lpm_numwords > (1 << lpm_widthad)) ||
            (lpm_numwords <= (1 << (lpm_widthad-1))))
        begin
            $display("Error!  The ceiling of log2(LPM_NUMWORDS) must equal to LPM_WIDTHAD.");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if ((lpm_address_control != "REGISTERED") && (lpm_address_control != "UNREGISTERED"))
        begin
            $display("Error!  LPM_ADDRESS_CONTROL must be \"REGISTERED\" or \"UNREGISTERED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if ((lpm_indata != "REGISTERED") && (lpm_indata != "UNREGISTERED"))
        begin
            $display("Error!  LPM_INDATA must be \"REGISTERED\" or \"UNREGISTERED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if ((lpm_outdata != "REGISTERED") && (lpm_outdata != "UNREGISTERED"))
        begin
            $display("Error!  LPM_OUTDATA must be \"REGISTERED\" or \"UNREGISTERED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if (dev.IS_VALID_FAMILY(intended_device_family) == 0)
        begin
            $display ("Error! Unknown INTENDED_DEVICE_FAMILY=%s.", intended_device_family);
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        for (i=0; i < lpm_width; i=i+1)
        begin
            ZEROS[i] = 1'b0;
            ONES[i] = 1'b1;
            UNKNOWN[i] = 1'bX;
        end

        for (i = 0; i < lpm_numwords; i=i+1)
            mem_data[i] = {lpm_width{1'b0}};

        // load data to the RAM
        if (lpm_file != "UNUSED")
        begin
            mem.convert_to_ver_file(lpm_file, lpm_width, ram_initf);
            $readmemh(ram_initf, mem_data);
        end

        tmp_q = ZEROS;
    end

// ALWAYS CONSTRUCT BLOCK
    always @(posedge i_inclock)
    begin
        if (lpm_address_control == "REGISTERED")
        begin
            if ((we) && (use_eab != "ON") &&
                (lpm_hint != "USE_EAB=ON"))
            begin
                if (lpm_indata == "REGISTERED")
                    mem_data[address] <= data;
                else
                    mem_data[address] <= pdata;
            end
            paddress <= address;
            pwe <= we;
        end
        if (lpm_indata == "REGISTERED")
            pdata <= data;
    end

    always @(data)
    begin
        if (lpm_indata == "UNREGISTERED")
            pdata <= data;
    end

    always @(address)
    begin
        if (lpm_address_control == "UNREGISTERED")
            paddress <= address;
    end

    always @(we)
    begin
        if (lpm_address_control == "UNREGISTERED")
            pwe <= we;
    end

    always @(pdata or paddress or pwe)
    begin :UNREGISTERED_INCLOCK
        if (ValidAddress(paddress))
        begin
            if ((lpm_address_control == "UNREGISTERED") && (pwe))
                mem_data[paddress] <= pdata;
            end
        else
        begin
            if (lpm_outdata == "UNREGISTERED")
                tmp_q <= {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
        end
    end

    always @(posedge i_outclock)
    begin
        if (lpm_outdata == "REGISTERED")
        begin
            if (ValidAddress(paddress))
                tmp_q <= mem_data[paddress];
            else
                tmp_q <= {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
        end
    end

    always @(i_inclock or pwe or paddress or pdata)
    begin
        if ((lpm_address_control == "REGISTERED") && (pwe))
            if ((use_eab == "ON") || (lpm_hint == "USE_EAB=ON"))
            begin
                if (i_inclock == 1'b0)
                    mem_data[paddress] = pdata;
            end
    end

// CONTINOUS ASSIGNMENT
    assign q = (lpm_outdata == "UNREGISTERED") ? mem_data[paddress] : tmp_q;

endmodule // lpm_ram_dq

