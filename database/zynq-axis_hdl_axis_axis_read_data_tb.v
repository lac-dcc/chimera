/**
 * Testbench:
 *  axis_read_data
 *
 * Created:
 *  Tue Nov  4 22:17:15 EST 2014
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */

`timescale 1ns/10ps

`define TB_VERBOSE
//`define VERBOSE


`include "axis_read_data.v"

module axis_read_data_tb;

    /**
     * Clock and control functions
     */

    // Generate a clk
    reg clk;
    always #1 clk = !clk;

    // End of simulation event definition
    event end_trigger;
    always @(end_trigger) $finish;

`ifdef TB_VERBOSE
    // Display header information
    initial #1 display_header();
    always @(end_trigger) display_header();

    // And strobe signals at each clk
    always @(posedge clk) display_signals();
`endif

//    initial begin
//        $dumpfile("result.vcd"); // Waveform file
//        $dumpvars;
//    end


    /**
     * Local parameters
     */

    localparam STREAM_LENGTH    = (256*8*2)-4;

    localparam BUF_AWIDTH       = 4;
    localparam CFG_DWIDTH       = 32;
    localparam AXI_DATA_WIDTH   = 256;
    localparam DATA_WIDTH       = 32;


`ifdef TB_VERBOSE
    initial $display("Testbench for unit 'axis_read_data'");
`endif


    /**
     *  signals, registers and wires
     */

    reg                             rst;

    reg     [CFG_DWIDTH-1:0]        cfg_length;
    reg                             cfg_val;
    wire                            cfg_rdy;

    reg     [AXI_DATA_WIDTH-1:0]    axi_rdata;
    reg                             axi_rlast;
    reg                             axi_rvalid;
    wire                            axi_rready;

    wire    [DATA_WIDTH-1:0]        data;
    wire                            valid;
    reg                             ready;


    /**
     * Unit under test
     */

    axis_read_data #(
        .BUF_AWIDTH     (BUF_AWIDTH),
        .CFG_DWIDTH     (CFG_DWIDTH),

        .AXI_DATA_WIDTH (AXI_DATA_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH))
    uut (
        .clk            (clk),
        .rst            (rst),

        .cfg_length     (cfg_length),
        .cfg_val        (cfg_val),
        .cfg_rdy        (cfg_rdy),

        .axi_rdata      (axi_rdata),
        .axi_rlast      (axi_rlast),
        .axi_rvalid     (axi_rvalid),
        .axi_rready     (axi_rready),

        .data           (data),
        .valid          (valid),
        .ready          (ready)
    );


    /**
     * Wave form display
     */

    task display_signals;
        $display(
            "%d\t%d",
            $time, rst,

            "\t%d\t%b\t%b",
            cfg_length,
            cfg_val,
            cfg_rdy,

            "\t%x\t%b\t%b\t%b",
            axi_rdata,
            axi_rlast,
            axi_rvalid,
            axi_rready,

            "\t%x\t%b\t%b",
            data,
            valid,
            ready,

            "\t%b",
            uut.state,

        );

    endtask // display_signals

    task display_header;
        $display(
            "\t\ttime\trst",

            "\t\tc_l",
            "\tc_v",
            "\tc_r",

            "\t\t\t\t\t\tr_d",
            "\t\t\t\tr_l",
            "\tr_v",
            "\tr_r",

            "\t\ts_d",
            "\ts_v",
            "\ts_r",

        );
    endtask


    /**
     * Testbench program
     */

    initial begin
        // init values
        clk = 0;
        rst = 0;

        cfg_length  = 'b0;
        cfg_val     = 'b0;

        axi_rdata   = 'b0;
        axi_rlast   = 'b0;
        axi_rvalid  = 'b0;

        ready       = 'b0;
        //end init

`ifdef TB_VERBOSE
    $display("RESET");
`endif

        repeat(6) @(negedge clk);
        rst <= 1'b1;
        repeat(6) @(negedge clk);
        rst <= 1'b0;
        @(negedge clk);


`ifdef TB_VERBOSE
    $display("send config id, start address and length");
`endif

        repeat(5) @(negedge clk);
        cfg_length  <= 10;
        cfg_val     <= 1'b1;
        @(negedge clk)

        cfg_length  <= 'b0;
        cfg_val     <= 1'b0;
        repeat(5) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test read");
`endif

        ready <= 1'b1;
        repeat(5) @(negedge clk);

        axi_rdata   <= {32'd8, 32'd7, 32'd6, 32'd5, 32'd4, 32'd3, 32'd2, 32'd1};
        axi_rvalid  <= 1'b1;
        @(negedge clk);
        axi_rdata   <= {32'd9, 32'd8, 32'd7, 32'd6, 32'd5, 32'd4, 32'd3, 32'd2};
        axi_rlast   <= 1'b1;
        while ( ~axi_rready) @(negedge clk);
        axi_rvalid  <= 1'b1;
        @(negedge clk);
        axi_rdata   <= 'b0;
        axi_rlast   <= 1'b0;
        axi_rvalid  <= 1'b0;

        repeat(15) @(negedge clk);

`ifdef TB_VERBOSE
    $display("END");
`endif
        -> end_trigger;
    end

endmodule
