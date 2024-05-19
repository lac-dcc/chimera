// This program was cloned from: https://github.com/efabless/clear
// License: Apache License 2.0

/*
 *-------------------------------------------------------------
 *
 * A wrapper for the FPGA IP to fit the I/O interface of Caravel SoC
 *
 * The wrapper is a technology mapped netlist where the mode-switch
 * multiplexers are mapped to the Skywater 130nm
 * High-Density (HD) standard cells
 *
 *-------------------------------------------------------------
 */

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

`define MPRJ_IO_PADS_1 19	/* number of user GPIO pads on user1 side */
`define MPRJ_IO_PADS_2 19	/* number of user GPIO pads on user2 side */
`define MPRJ_IO_PADS (`MPRJ_IO_PADS_1 + `MPRJ_IO_PADS_2)

module user_project_wrapper #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

    /*

        IOs Connections:

        Caravel IO                             | FPGA                 |  Mode
        
        io_in[1]                               | isol_n               | Input
        io_in[9]                               | reset                | Input
        io_in[10]                              | test_enable          | Input
        io_out[14]                             | sc_tail              | Output
        io_out[23]                             | ccff_tail            | Output
        io_in[22]                              | sc_head              | Input
        io_in[29]                              | prog_reset           | Input 
        io_in[34]                              | ccff_head            | Input
        io_in[35]                              | clk_sel              | Input
        io_in[36]                              | clk                  | Input
        io_in[37]                              | prog_clk             | Input
        io_in[0]-[8:2]-[13:11]                 | EMBEDDED_IO[46:36]   | Bidirectional
        io_in[21:15]                           | EMBEDDED_IO[18:12]   | Bidirectional
        io_in[28:24]-[33:30]                   | EMBEDDED_IO[127:119] | Bidirectional

    */
    // FPGA wires
    wire prog_clk;
    wire test_enable;
    wire isol_n;
    wire clk;

`ifdef PnR
    wire [127:0] gfpga_pad_io_soc_in;
    wire [127:0] gfpga_pad_io_soc_out;
    wire [127:0] gfpga_pad_io_soc_dir;
`else
    wire [0:127] gfpga_pad_io_soc_in;
    wire [0:127] gfpga_pad_io_soc_out;
    wire [0:127] gfpga_pad_io_soc_dir;
`endif

    wire ccff_head;
    wire ccff_tail;
    wire prog_reset;
    wire reset;
    wire sc_head;
    wire sc_tail;
    wire clk_sel;
    
    // Wire-bond RIGHT side I/O of FPGA to RIGHT-side of Caravel interface
    assign gfpga_pad_io_soc_in[46] = io_in[0];
    assign io_out[0] = gfpga_pad_io_soc_out[46];
    assign io_oeb[0] = gfpga_pad_io_soc_dir[46];

    generate 
        genvar i;
        for(i=0; i<=6; i=i+1) begin
            assign gfpga_pad_io_soc_in[45-i] = io_in[2+i];
            assign io_out[2+i] = gfpga_pad_io_soc_out[45-i];
            assign io_oeb[2+i] = gfpga_pad_io_soc_dir[45-i];
        end
    endgenerate

    assign gfpga_pad_io_soc_in[38] = io_in[11];
    assign io_out[11] = gfpga_pad_io_soc_out[38];
    assign io_oeb[11] = gfpga_pad_io_soc_dir[38];

    assign gfpga_pad_io_soc_in[37] = io_in[12];
    assign io_out[12] = gfpga_pad_io_soc_out[37];
    assign io_oeb[12] = gfpga_pad_io_soc_dir[37];

    assign gfpga_pad_io_soc_in[36] = io_in[13];
    assign io_out[13] = gfpga_pad_io_soc_out[36];
    assign io_oeb[13] = gfpga_pad_io_soc_dir[36];

    // Wire-bond TOP side I/O of FPGA to TOP-side of Caravel interface
    generate 
        for(i=0; i<=6; i=i+1) begin
            assign gfpga_pad_io_soc_in[19-i] = io_in[15+i];
            assign io_out[15+i] = gfpga_pad_io_soc_out[19-i];
            assign io_oeb[15+i] = gfpga_pad_io_soc_dir[19-i];
        end
    endgenerate

    // Wire-bond LEFT side I/O of FPGA to LEFT-side of Caravel interface
    generate 
        for(i=0; i<=4; i=i+1) begin
            assign gfpga_pad_io_soc_in[127-i] = io_in[24+i];
            assign io_out[24+i] = gfpga_pad_io_soc_out[127-i];
            assign io_oeb[24+i] = gfpga_pad_io_soc_dir[127-i];
        end
    endgenerate

    generate 
        for(i=0; i<=3; i=i+1) begin
            assign gfpga_pad_io_soc_in[122-i] = io_in[30+i];
            assign io_out[30+i] = gfpga_pad_io_soc_out[122-i];
            assign io_oeb[30+i] = gfpga_pad_io_soc_dir[122-i];
        end
    endgenerate
    
    

    // CCFF_HEAD - Input
    assign ccff_head = io_in[34];
    assign io_out[34] = 1'b0;
    assign io_oeb[34] = 1'b1;

    // SC_TAIL -- output
    assign io_out[14] = sc_tail;
    assign io_oeb[14] = 1'b0;

    // reset -- Input
    assign prog_reset = io_in[29];
    assign io_out[29] = 1'b0;
    assign io_oeb[29] = 1'b1;

    assign reset = io_in[9];
    assign io_out[9] = 1'b0;
    assign io_oeb[9] = 1'b1;

    // isol_n -- Input
    assign isol_n = io_in[1];
    assign io_out[1] = 1'b0;
    assign io_oeb[1] = 1'b1;

    // test_enable -- Input
    assign test_enable = io_in[10];
    assign io_out[10] = 1'b0;
    assign io_oeb[10] = 1'b1;

    // Connecting the Fabric IO 47 to 118 to the LA_out: 127 to 56
    // MS: Disconnect the WBS bus dat_o lines
    generate 
        for(i=0; i<=71; i=i+1) begin
            assign gfpga_pad_io_soc_in[47+i] = la_data_in[127-i];
            assign la_data_out[127-i] = gfpga_pad_io_soc_out[47+i];
        end
    endgenerate
    

    // PROG-CLK -- Input
    // Wire-bond LEFT side I/O of FPGA to LEFT-side of Caravel interface
    assign prog_clk = io_in[37];
    assign io_out[37] = 1'b0;
    assign io_oeb[37] = 1'b1;

    // CLK -- Input
    // FPGA clock port can be driven by either wishbone clock or an GPIO
    assign clk_sel = io_in[35];
    assign io_out[35] = 1'b0;
    assign io_oeb[35] = 1'b1;

    assign clk = clk_sel ? wb_clk_i : io_in[36];
    assign io_out[36] = 1'b0;
    assign io_oeb[36] = 1'b1;

    // CCFF-TAIL - Output
    assign io_out[23] = ccff_tail;
    assign io_oeb[23] = 1'b0;

    // SC-HEAD -- Input
    assign sc_head = io_in[22];
    assign io_out[22] = 1'b0;
    assign io_oeb[22] = 1'b1;

    fpga_core fpga_core_uut(
        `ifdef USE_POWER_PINS
            .VPWR(vccd1),	
            .VGND(vssd1),	
        `endif
        .prog_clk(prog_clk),
        .test_enable(test_enable),
        .clk(clk),
        .isol_n(isol_n),
        .gfpga_pad_io_soc_in(gfpga_pad_io_soc_in),
        .gfpga_pad_io_soc_out(gfpga_pad_io_soc_out),
        .gfpga_pad_io_soc_dir(gfpga_pad_io_soc_dir),
        .ccff_head(ccff_head),
        .ccff_tail(ccff_tail),
        .prog_reset(prog_reset),
        .reset(reset),
        .sc_head(sc_head),
        .sc_tail(sc_tail)
    );

    // Wishbone 
    
    wire [31:0] wbs_dat_can_o, wbs_dat_dac_o;
    wire        wbs_stb_can_i, wbs_stb_dac_i;
    wire        wbs_ack_can_o, wbs_ack_dac_o;

    assign      wbs_stb_can_i   =   wbs_stb_i & ~wbs_adr_i[14]; 
    assign      wbs_stb_dac_i   =   wbs_stb_i & wbs_adr_i[14]; 
    
    assign      wbs_ack_o   =   wbs_stb_can_i ? wbs_ack_can_o :
                                wbs_stb_dac_i ? wbs_ack_dac_o :
                                1'b1;

    assign      wbs_dat_o   =   wbs_stb_can_i ? wbs_dat_can_o :
                                wbs_stb_dac_i ? wbs_dat_dac_o :
                                32'hDEADBEEF;
    
endmodule
