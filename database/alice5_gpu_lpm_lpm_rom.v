// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  lpm_rom
//
// Description     :  Parameterized ROM megafunction. This megafunction is provided
//                    only for backward compatibility in Cyclone, Stratix, and
//                    Stratix GX designs; instead, Altera recommends using the
//                    altsyncram megafunction.
//
// Limitation      :  This option is available for all Altera devices supported by
//                    the Quartus II software except MAX 3000 and MAX 7000 devices.
//
// Results expected:  Output of memory.
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
module lpm_rom (
    address,    // Address input to the memory. (Required)
    inclock,    // Clock for input registers.
    outclock,   // Clock for output registers.
    memenab,    // Memory enable input.
    q           // Output of memory.  (Required)
);

// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;    // Width of the q[] port. (Required)
    parameter lpm_widthad = 1;  // Width of the address[] port. (Required)
    parameter lpm_numwords = 0; // Number of words stored in memory.
    parameter lpm_address_control = "REGISTERED"; // Indicates whether the address port is registered.
    parameter lpm_outdata = "REGISTERED"; // Indicates whether the q and eq ports are registered.
    parameter lpm_file = ""; // Name of the memory file containing ROM initialization data
    parameter intended_device_family = "Stratix";
    parameter lpm_type = "lpm_rom";
    parameter lpm_hint = "UNUSED";

// LOCAL_PARAMETERS_BEGIN

    parameter NUM_WORDS = (lpm_numwords == 0) ? (1 << lpm_widthad) : lpm_numwords;

// LOCAL_PARAMETERS_END

// INPUT PORT DECLARATION
    input  [lpm_widthad-1:0] address;
    input  inclock;
    input  outclock;
    input  memenab;

// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] q;

// INTERNAL REGISTER/SIGNAL DECLARATION
    reg  [lpm_width-1:0] mem_data [0:NUM_WORDS-1];
    reg  [lpm_widthad-1:0] address_reg;
    reg  [lpm_width-1:0] tmp_q_reg;
    reg  [8*256:1] rom_initf;

// INTERNAL WIRE DECLARATION
    wire [lpm_widthad-1:0] w_address;
    wire [lpm_width-1:0] w_read_data;
    wire i_inclock;
    wire i_outclock;
    wire i_memenab;

// LOCAL INTEGER DECLARATION
    integer i;

// INTERNAL TRI DECLARATION
    logic inclock; // -- converted tristate to logic
    logic outclock; // -- converted tristate to logic
    logic memenab; // -- converted tristate to logic

    assign i_inclock = inclock; // -- converted buf to assign
    assign i_outclock = outclock; // -- converted buf to assign
    assign i_memenab = memenab; // -- converted buf to assign

// COMPONENT INSTANTIATIONS
    LPM_DEVICE_FAMILIES dev ();
    LPM_MEMORY_INITIALIZATION mem ();

// FUNCTON DECLARATION
    // Check the validity of the address.
    function ValidAddress;
        input [lpm_widthad-1:0] address;
        begin
            ValidAddress = 1'b0;
            if (^address == {lpm_widthad{1'b0 /* converted x or z to 1'b0 */}})
            begin
                $display("%d:Error:  Invalid address.", $time);
                $display("Time: %0t  Instance: %m", $time);
                $finish;
            end
            else if (address >= NUM_WORDS)
            begin
                $display("%d:Error:  Address out of bound on ROM.", $time);
                $display("Time: %0t  Instance: %m", $time);
                $finish;
            end
            else
                ValidAddress = 1'b1;
        end
    endfunction

// INITIAL CONSTRUCT BLOCK
    initial
    begin
        // Initialize output
        tmp_q_reg = {lpm_width{1'b0}};
        address_reg = {lpm_widthad{1'b0}};

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
        if ((NUM_WORDS > (1 << lpm_widthad)) ||
            (NUM_WORDS <= (1 << (lpm_widthad-1))))
        begin
            $display("Error!  The ceiling of log2(LPM_NUMWORDS) must equal to LPM_WIDTHAD.");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if ((lpm_address_control != "REGISTERED") &&
            (lpm_address_control != "UNREGISTERED"))
        begin
            $display("Error!  LPM_ADDRESS_CONTROL must be \"REGISTERED\" or \"UNREGISTERED\".");
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
        if (dev.FEATURE_FAMILY_MAX(intended_device_family) == 1)
        begin
            $display ("Error! LPM_ROM megafunction does not support %s devices.", intended_device_family);
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        for (i = 0; i < NUM_WORDS; i=i+1)
            mem_data[i] = {lpm_width{1'b0}};

        // load data to the ROM
        if ((lpm_file == "") || (lpm_file == "UNUSED"))
        begin
            $display("Warning:  LPM_ROM must have data file for initialization.\n");
            $display ("Time: %0t  Instance: %m", $time);
        end
        else
        begin
            mem.convert_to_ver_file(lpm_file, lpm_width, rom_initf);
            $readmemh(rom_initf, mem_data);
        end
    end

    always @(posedge i_inclock)
    begin
        if (lpm_address_control == "REGISTERED")
            address_reg <=  address; // address port is registered
    end

    always @(w_address or w_read_data)
    begin
        if (ValidAddress(w_address))
        begin
            if (lpm_outdata == "UNREGISTERED")
                // Load the output register with the contents of the memory location
                // pointed to by address[].
                tmp_q_reg <=  w_read_data;
        end
        else
        begin
            if (lpm_outdata == "UNREGISTERED")
                tmp_q_reg <= {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
        end
    end

    always @(posedge i_outclock)
    begin
        if (lpm_outdata == "REGISTERED")
        begin
            if (ValidAddress(w_address))
                tmp_q_reg <=  w_read_data;
            else
                tmp_q_reg <= {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
        end
    end

// CONTINOUS ASSIGNMENT
    assign w_address = (lpm_address_control == "REGISTERED") ? address_reg : address;
    assign w_read_data = mem_data[w_address];
    assign q = (i_memenab) ? tmp_q_reg : {lpm_width{1'b0 /* converted x or z to 1'b0 */}};

endmodule // lpm_rom

