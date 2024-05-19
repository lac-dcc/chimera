// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from 220model.v
// END OF MODULE

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     : lpm_ram_io
//
// Description     : Parameterized RAM with a single I/O port megafunction
//
// Limitation      : This megafunction is provided only for backward
//                   compatibility in Cyclone, Stratix, and Stratix GX designs;
//                   instead, Altera recommends using the altsyncram
//                   megafunction
//
// Results expected: Output of RAM content at bi-directional DIO.
//
//END_MODULE_NAME--------------------------------------------------------------
`timescale 1 ps / 1 ps

// MODULE DECLARATION
/*verilator lint_off CASEX*/
/*verilator lint_off COMBDLY*/
/*verilator lint_off INITIALDLY*/
/*verilator lint_off LITENDIAN*/
/*verilator lint_off MULTIDRIVEN*/
/*verilator lint_off UNOPTFLAT*/
/*verilator lint_off BLKANDNBLK*/
module lpm_ram_io ( dio, inclock, outclock, we, memenab, outenab, address );

// PARAMETER DECLARATION
    parameter lpm_type = "lpm_ram_io";
    parameter lpm_width = 1;
    parameter lpm_widthad = 1;
    parameter lpm_numwords = 1<< lpm_widthad;
    parameter lpm_indata = "REGISTERED";
    parameter lpm_address_control = "REGISTERED";
    parameter lpm_outdata = "REGISTERED";
    parameter lpm_file = "UNUSED";
    parameter lpm_hint = "UNUSED";
    parameter use_eab = "ON";
    parameter intended_device_family = "UNUSED";

// INPUT PORT DECLARATION
    input  [lpm_widthad-1:0] address;
    input  inclock, outclock, we;
    input  memenab;
    input  outenab;

// INPUT/OUTPUT PORT DECLARATION
    inout  [lpm_width-1:0] dio;

// INTERNAL REGISTERS DECLARATION
    reg  [lpm_width-1:0] mem_data [lpm_numwords-1:0];
    reg  [lpm_width-1:0] tmp_io;
    reg  [lpm_width-1:0] tmp_q;
    reg  [lpm_width-1:0] pdio;
    reg  [lpm_widthad-1:0] paddress;
    reg  [lpm_widthad-1:0] paddress_tmp;
    reg  pwe;
    reg  [8*256:1] ram_initf;

// INTERNAL WIRE DECLARATION
    wire [lpm_width-1:0] read_data;
    wire i_inclock;
    wire i_outclock;
    wire i_memenab;
    wire i_outenab;

// LOCAL INTEGER DECLARATION
    integer i;

// INTERNAL TRI DECLARATION
    logic inclock; // -- converted tristate to logic
    logic outclock; // -- converted tristate to logic
    logic memenab; // -- converted tristate to logic
    logic outenab; // -- converted tristate to logic

// INTERNAL BUF DECLARATION
    assign i_inclock = inclock; // -- converted buf to assign
    assign i_outclock = outclock; // -- converted buf to assign
    assign i_memenab = memenab; // -- converted buf to assign
    assign i_outenab = outenab; // -- converted buf to assign


// FUNCTON DECLARATION
    function ValidAddress;
        input [lpm_widthad-1:0] paddress;

        begin
            ValidAddress = 1'b0;
            if (^paddress === {lpm_widthad{1'b0 /* converted x or z to 1'b0 */}})
            begin
                $display("%t:Error:  Invalid address.", $time);
                $display("Time: %0t  Instance: %m", $time);
                $finish;
            end
            else if (paddress >= lpm_numwords)
            begin
                $display("%t:Error:  Address out of bound on RAM.", $time);
                $display("Time: %0t  Instance: %m", $time);
                $finish;
            end
            else
                ValidAddress = 1'b1;
        end
    endfunction

// COMPONENT INSTANTIATIONS
    LPM_MEMORY_INITIALIZATION mem ();


// INITIAL CONSTRUCT BLOCK
    initial
    begin

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
        if ((lpm_numwords > (1 << lpm_widthad))
            ||(lpm_numwords <= (1 << (lpm_widthad-1))))
        begin
            $display("Error!  The ceiling of log2(LPM_NUMWORDS) must equal to LPM_WIDTHAD.");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if ((lpm_indata != "REGISTERED") && (lpm_indata != "UNREGISTERED"))
        begin
            $display("Error!  LPM_INDATA must be \"REGISTERED\" or \"UNREGISTERED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end

        if ((lpm_address_control != "REGISTERED") && (lpm_address_control != "UNREGISTERED"))
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

        for (i = 0; i < lpm_numwords; i=i+1)
            mem_data[i] = {lpm_width{1'b0}};

        // Initialize input/output
        pwe = 1'b0;
        pdio = {lpm_width{1'b0}};
        paddress = {lpm_widthad{1'b0}};
        paddress_tmp = {lpm_widthad{1'b0}};
        tmp_io = {lpm_width{1'b0}};
        tmp_q = {lpm_width{1'b0}};

        // load data to the RAM
        if (lpm_file != "UNUSED")
        begin
            mem.convert_to_ver_file(lpm_file, lpm_width, ram_initf);
            $readmemh(ram_initf, mem_data);
        end
    end


// ALWAYS CONSTRUCT BLOCK
    always @(dio)
    begin
        if (lpm_indata == "UNREGISTERED")
            pdio <=  dio;
    end

    always @(address)
    begin
        if (lpm_address_control == "UNREGISTERED")
            paddress <=  address;
    end


    always @(we)
    begin
        if (lpm_address_control == "UNREGISTERED")
            pwe <=  we;
    end

    always @(posedge i_inclock)
    begin
        if (lpm_indata == "REGISTERED")
            pdio <=  dio;

        if (lpm_address_control == "REGISTERED")
        begin
            paddress <=  address;
            pwe <=  we;
        end
    end

    always @(pdio or paddress or pwe or i_memenab)
    begin
        if (ValidAddress(paddress))
        begin
            paddress_tmp <= paddress;
            if (lpm_address_control == "UNREGISTERED")
                if (pwe && i_memenab)
                    mem_data[paddress] <= pdio;
        end
        else
        begin
            if (lpm_outdata == "UNREGISTERED")
                tmp_q <= {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
        end
    end

    always @(read_data)
    begin
        if (lpm_outdata == "UNREGISTERED")
            tmp_q <= read_data;
    end

    always @(negedge i_inclock or pdio)
    begin
        if (lpm_address_control == "REGISTERED")
            if ((use_eab == "ON") || (lpm_hint == "USE_EAB=ON"))
                if (pwe && i_memenab && (i_inclock == 1'b0))
                    mem_data[paddress] = pdio;
    end

    always @(posedge i_inclock)
    begin
        if (lpm_address_control == "REGISTERED")
            if ((use_eab == "OFF") && pwe && i_memenab)
                mem_data[paddress] <= pdio;
    end

    always @(posedge i_outclock)
    begin
        if (lpm_outdata == "REGISTERED")
            tmp_q <= mem_data[paddress];
    end

    always @(i_memenab or i_outenab or tmp_q)
    begin
        if (i_memenab && i_outenab)
            tmp_io = tmp_q;
        else if ((!i_memenab) || (i_memenab && (!i_outenab)))
            tmp_io = {lpm_width{1'b0 /* converted x or z to 1'b0 */}};
    end


// CONTINOUS ASSIGNMENT
    assign dio = tmp_io;
    assign read_data = mem_data[paddress_tmp];

endmodule // lpm_ram_io

