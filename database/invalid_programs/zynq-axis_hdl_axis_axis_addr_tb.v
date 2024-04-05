/**
 * Testbench:
 *  axis_addr
 *
 * Created:
 *  Wed Nov  5 21:16:08 EST 2014
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */

`timescale 1ns/10ps

`define TB_VERBOSE
//`define VERBOSE


`include "axis_addr.v"

module axis_addr_tb;

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

    localparam CFG_DWIDTH       = 32;
    localparam WIDTH_RATIO      = 16;
    localparam AXI_LEN_WIDTH    = 8;
    localparam AXI_ADDR_WIDTH   = 32;


`ifdef TB_VERBOSE
    initial $display("Testbench for unit 'axis_addr'");
`endif


    /**
     *  signals, registers and wires
     */

    reg                             rst;

    reg     [CFG_DWIDTH-1:0]        cfg_address;
    reg     [CFG_DWIDTH-1:0]        cfg_length;
    reg                             cfg_val;
    wire                            cfg_rdy;

    reg                             axi_aready;
    wire    [AXI_ADDR_WIDTH-1:0]    axi_aaddr;
    wire    [AXI_LEN_WIDTH-1:0]     axi_alen;
    wire                            axi_avalid;


    /**
     * Unit under test
     */

    axis_addr #(
        .CFG_DWIDTH     (CFG_DWIDTH),
        .WIDTH_RATIO    (WIDTH_RATIO),
        .CONVERT_SHIFT  ($clog2(WIDTH_RATIO)),
        .AXI_LEN_WIDTH  (AXI_LEN_WIDTH),
        .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH))
    uut (
        .clk            (clk),
        .rst            (rst),

        .cfg_address    (cfg_address),
        .cfg_length     (cfg_length),
        .cfg_val        (cfg_val),
        .cfg_rdy        (cfg_rdy),

        .axi_aready     (axi_aready),
        .axi_aaddr      (axi_aaddr),
        .axi_alen       (axi_alen),
        .axi_avalid     (axi_avalid)
    );


    /**
     * Wave form display
     */

    task display_signals;
        $display(
            "%d\t%d",
            $time, rst,

            "\t%d\t%d\t%b\t%b",
            cfg_address,
            cfg_length,
            cfg_val,
            cfg_rdy,

            "\t%d\t%d\t%b\t%b",
            axi_aaddr,
            axi_alen,
            axi_avalid,
            axi_aready,

            "\tl_en %d\tl_nb %d",
            uut.last_en,
            uut.last_nb,

            "\tb_en %d\tb_nb %d",
            uut.burst_en,
            uut.burst_nb,

            "\t%b",
            uut.state,

        );

    endtask // display_signals

    task display_header;
        $display(
            "\t\ttime\trst",

            "\t\tc_a",
            "\t\tc_l",
            "\tc_v",
            "\tc_r",

            "\t\ta_a",
            "\ta_l",
            "\ta_v",
            "\ta_r",

        );
    endtask


    /**
     * Testbench program
     */

    initial begin
        // init values
        clk = 0;
        rst = 0;

        cfg_address = 'b0;
        cfg_length  = 'b0;
        cfg_val   = 'b0;

        axi_aready  = 'b0;
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
    $display("send config address and length");
`endif

        repeat(5) @(negedge clk);
        cfg_address <= 255;
        //cfg_length  <= 8;
        cfg_length  <= 256+256+64;
        cfg_val   <= 1'b1;
        @(negedge clk);
        cfg_address <= 'b0;
        cfg_length  <= 'b0;
        cfg_val     <= 1'b0;
        repeat(5) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test write address channel");
`endif

        repeat(3) @(negedge clk);
        axi_aready <= 1'b1;
        @(negedge clk);
        axi_aready <= 1'b0;
        @(negedge clk);
        axi_aready <= 1'b1;
        repeat(50) @(negedge clk);


`ifdef TB_VERBOSE
    $display("END");
`endif
        -> end_trigger;
    end

endmodule
