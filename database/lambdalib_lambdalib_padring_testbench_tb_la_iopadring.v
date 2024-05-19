// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

module testbench ();

    `include "la_iopadring.vh"

    initial begin
        $dumpvars();
    end

    // padring parameters (implementation)
    parameter CFGW = 16;  // config bus width
    parameter RINGW = 16;  // ring width
    parameter NCELLS = 46;  // cells per side
    parameter NPINS = 22;  /// number of io pins per side
    parameter NSECTIONS = 2;

    // CELL MAP
    parameter [24*NCELLS-1:0] CELLMAP = {  //{SECTION, PIN#, TYPE}
        {8'd1, 8'd0, LA_VDDIO},
        {8'd1, 8'd0, LA_VSSIO},
        {8'd1, 8'd0, LA_VDD},
        {8'd1, 8'd0, LA_VSS},
        {8'd1, 8'd21, LA_BIDIR},
        {8'd1, 8'd20, LA_BIDIR},
        {8'd1, 8'd19, LA_BIDIR},
        {8'd1, 8'd18, LA_BIDIR},
        {8'd1, 8'd17, LA_BIDIR},
        {8'd1, 8'd0, LA_VDDIO},
        {8'd1, 8'd0, LA_VSSIO},
        {8'd1, 8'd0, LA_VDD},
        {8'd1, 8'd0, LA_VSS},
        {8'd1, 8'd16, LA_BIDIR},
        {8'd1, 8'd15, LA_BIDIR},
        {8'd1, 8'd14, LA_BIDIR},
        {8'd1, 8'd13, LA_BIDIR},
        {8'd1, 8'd12, LA_BIDIR},
        {8'd1, 8'd0, LA_VDDIO},
        {8'd1, 8'd0, LA_VSSIO},
        {8'd1, 8'd0, LA_VDD},
        {8'd1, 8'd0, LA_VSS},
        {8'd1, 8'd11, LA_BIDIR},
        {8'd1, 8'd10, LA_BIDIR},
        {8'd1, 8'd9, LA_BIDIR},
        {8'd1, 8'd8, LA_BIDIR},
        {8'd1, 8'd7, LA_BIDIR},
        {8'd1, 8'd0, LA_VDDIO},
        {8'd1, 8'd0, LA_VSSIO},
        {8'd1, 8'd0, LA_VDD},
        {8'd1, 8'd0, LA_VSS},
        {8'd1, 8'd6, LA_BIDIR},
        {8'd1, 8'd5, LA_BIDIR},
        {8'd1, 8'd4, LA_BIDIR},
        {8'd1, 8'd3, LA_BIDIR},
        {8'd1, 8'd2, LA_BIDIR},
        {8'd1, 8'd0, LA_VDDIO},
        {8'd1, 8'd0, LA_VSSIO},
        {8'd1, 8'd0, LA_VDD},
        {8'd1, 8'd0, LA_VSS},
        //ANALOG SECTION (6)
        {
            8'd0, 8'd0, LA_CUT
        },
        {8'd0, 8'd1, LA_ANALOG},
        {8'd0, 8'd0, LA_ANALOG},
        {8'd0, 8'd0, LA_VDDA},
        {8'd0, 8'd0, LA_VSSA},
        {8'd0, 8'd0, LA_CUT}
    };


    wire [NPINS-1:0] ea_a;  // To dut of la_iopadring.v
    wire [CFGW*NPINS-1:0] ea_cfg;  // To dut of la_iopadring.v
    wire [NPINS-1:0] ea_ie;  // To dut of la_iopadring.v
    wire [NPINS-1:0] ea_oe;  // To dut of la_iopadring.v
    wire [NPINS-1:0] no_a;  // To dut of la_iopadring.v
    wire [CFGW*NPINS-1:0] no_cfg;  // To dut of la_iopadring.v
    wire [NPINS-1:0] no_ie;  // To dut of la_iopadring.v
    wire [NPINS-1:0] no_oe;  // To dut of la_iopadring.v
    wire [NPINS-1:0] so_a;  // To dut of la_iopadring.v
    wire [CFGW*NPINS-1:0] so_cfg;  // To dut of la_iopadring.v
    wire [NPINS-1:0] so_ie;  // To dut of la_iopadring.v
    wire [NPINS-1:0] so_oe;  // To dut of la_iopadring.v
    wire [NPINS-1:0] we_a;  // To dut of la_iopadring.v
    wire [CFGW*NPINS-1:0] we_cfg;  // To dut of la_iopadring.v
    wire [NPINS-1:0] we_ie;  // To dut of la_iopadring.v
    wire [NPINS-1:0] we_oe;  // To dut of la_iopadring.v

    /*AUTOINPUT*/
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire [3*NPINS-1:0] ea_aio;  // To/From dut of la_iopadring.v
    wire [RINGW*NSECTIONS-1:0] ea_io;  // To/From dut of la_iopadring.v
    wire [NPINS-1:0] ea_pad;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] ea_vdd;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] ea_vddio;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] ea_vssio;  // To/From dut of la_iopadring.v
    wire [NPINS-1:0] ea_z;  // From dut of la_iopadring.v
    wire [3*NPINS-1:0] no_aio;  // To/From dut of la_iopadring.v
    wire [RINGW*NSECTIONS-1:0] no_io;  // To/From dut of la_iopadring.v
    wire [NPINS-1:0] no_pad;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] no_vdd;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] no_vddio;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] no_vssio;  // To/From dut of la_iopadring.v
    wire [NPINS-1:0] no_z;  // From dut of la_iopadring.v
    wire [3*NPINS-1:0] so_aio;  // To/From dut of la_iopadring.v
    wire [RINGW*NSECTIONS-1:0] so_io;  // To/From dut of la_iopadring.v
    wire [NPINS-1:0] so_pad;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] so_vdd;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] so_vddio;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] so_vssio;  // To/From dut of la_iopadring.v
    wire [NPINS-1:0] so_z;  // From dut of la_iopadring.v
    wire vss;  // To/From dut of la_iopadring.v
    wire [3*NPINS-1:0] we_aio;  // To/From dut of la_iopadring.v
    wire [RINGW*NSECTIONS-1:0] we_io;  // To/From dut of la_iopadring.v
    wire [NPINS-1:0] we_pad;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] we_vdd;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] we_vddio;  // To/From dut of la_iopadring.v
    wire [NSECTIONS-1:0] we_vssio;  // To/From dut of la_iopadring.v
    wire [NPINS-1:0] we_z;  // From dut of la_iopadring.v
    // End of automatics



    //#################################
    // DUT
    //#################################

    /*la_iopadring AUTO_TEMPLATE (//outputs
    .\(.*\)_v\(.*\) (\1_v\2[NSECTIONS-1:0]),
    .\(.*\)_ioring  (\1_io\2[RINGW*NSECTIONS-1:0]),
    .\(.*\)_cfg     (\1_cfg\2[CFGW*NPINS-1:0]),
    .\(.*\)_aio     (\1_aio\2[3*NPINS-1:0]),
    .\(.*\)_\(.*\)  (\1_\2[NPINS-1:0]),
    );
    */

    la_iopadring #(
        .RINGW(RINGW),
        .CFGW(CFGW),
        .NO_NPINS(NPINS),
        .NO_NCELLS(NCELLS),
        .NO_NSECTIONS(NSECTIONS),
        .NO_CELLMAP(CELLMAP),
        .EA_NPINS(NPINS),
        .EA_NCELLS(NCELLS),
        .EA_NSECTIONS(NSECTIONS),
        .EA_CELLMAP(CELLMAP),
        .SO_NPINS(NPINS),
        .SO_NCELLS(NCELLS),
        .SO_NSECTIONS(NSECTIONS),
        .SO_CELLMAP(CELLMAP),
        .WE_NPINS(NPINS),
        .WE_NCELLS(NCELLS),
        .WE_NSECTIONS(NSECTIONS),
        .WE_CELLMAP(CELLMAP)
    ) dut (  /*AUTOINST*/
        // Outputs
        .no_z     (no_z[NPINS-1:0]),             // Templated
        .ea_z     (ea_z[NPINS-1:0]),             // Templated
        .so_z     (so_z[NPINS-1:0]),             // Templated
        .we_z     (we_z[NPINS-1:0]),             // Templated
        // Inouts
        .vss      (vss),
        .no_pad   (no_pad[NPINS-1:0]),           // Templated
        .no_aio   (no_aio[3*NPINS-1:0]),         // Templated
        .no_vdd   (no_vdd[NSECTIONS-1:0]),       // Templated
        .no_vddio (no_vddio[NSECTIONS-1:0]),     // Templated
        .no_vssio (no_vssio[NSECTIONS-1:0]),     // Templated
        .no_ioring(no_io[RINGW*NSECTIONS-1:0]),  // Templated
        .ea_pad   (ea_pad[NPINS-1:0]),           // Templated
        .ea_aio   (ea_aio[3*NPINS-1:0]),         // Templated
        .ea_vdd   (ea_vdd[NSECTIONS-1:0]),       // Templated
        .ea_vddio (ea_vddio[NSECTIONS-1:0]),     // Templated
        .ea_vssio (ea_vssio[NSECTIONS-1:0]),     // Templated
        .ea_ioring(ea_io[RINGW*NSECTIONS-1:0]),  // Templated
        .so_pad   (so_pad[NPINS-1:0]),           // Templated
        .so_aio   (so_aio[3*NPINS-1:0]),         // Templated
        .so_vdd   (so_vdd[NSECTIONS-1:0]),       // Templated
        .so_vddio (so_vddio[NSECTIONS-1:0]),     // Templated
        .so_vssio (so_vssio[NSECTIONS-1:0]),     // Templated
        .so_ioring(so_io[RINGW*NSECTIONS-1:0]),  // Templated
        .we_pad   (we_pad[NPINS-1:0]),           // Templated
        .we_aio   (we_aio[3*NPINS-1:0]),         // Templated
        .we_vdd   (we_vdd[NSECTIONS-1:0]),       // Templated
        .we_vddio (we_vddio[NSECTIONS-1:0]),     // Templated
        .we_vssio (we_vssio[NSECTIONS-1:0]),     // Templated
        .we_ioring(we_io[RINGW*NSECTIONS-1:0]),  // Templated
        // Inputs
        .no_a     (no_a[NPINS-1:0]),             // Templated
        .no_ie    (no_ie[NPINS-1:0]),            // Templated
        .no_oe    (no_oe[NPINS-1:0]),            // Templated
        .no_cfg   (no_cfg[CFGW*NPINS-1:0]),      // Templated
        .ea_a     (ea_a[NPINS-1:0]),             // Templated
        .ea_ie    (ea_ie[NPINS-1:0]),            // Templated
        .ea_oe    (ea_oe[NPINS-1:0]),            // Templated
        .ea_cfg   (ea_cfg[CFGW*NPINS-1:0]),      // Templated
        .so_a     (so_a[NPINS-1:0]),             // Templated
        .so_ie    (so_ie[NPINS-1:0]),            // Templated
        .so_oe    (so_oe[NPINS-1:0]),            // Templated
        .so_cfg   (so_cfg[CFGW*NPINS-1:0]),      // Templated
        .we_a     (we_a[NPINS-1:0]),             // Templated
        .we_ie    (we_ie[NPINS-1:0]),            // Templated
        .we_oe    (we_oe[NPINS-1:0]),            // Templated
        .we_cfg   (we_cfg[CFGW*NPINS-1:0])
    );  // Templated










endmodule  // testbench
// Local Variables:
// verilog-library-directories:("../rtl" "../../../oh/stdlib/testbench")
// End:
