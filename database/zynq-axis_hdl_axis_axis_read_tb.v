/**
 * Testbench:
 *  axis_read
 *
 * Created:
 *  Fri Nov  7 17:22:50 EST 2014
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */

`timescale 1ns/10ps

`define TB_VERBOSE
//`define VERBOSE


`include "axis_read.v"

module axis_read_tb;

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

    localparam CFG_ID           = 1;
    localparam CFG_ADDR         = 23;
    localparam CFG_DATA         = 24;
    localparam CFG_AWIDTH       = 5;
    localparam CFG_DWIDTH       = 32;

    localparam AXI_ADDR_WIDTH   = 32;
    localparam AXI_DATA_WIDTH   = 256;
    localparam DATA_WIDTH       = 32;


`ifdef TB_VERBOSE
    initial $display("Testbench for unit 'axis_read'");
`endif


    /**
     *  signals, registers and wires
     */

    reg                             rst;

    reg     [CFG_AWIDTH-1:0]        cfg_addr;
    reg     [CFG_DWIDTH-1:0]        cfg_data;
    reg                             cfg_valid;

    reg                             axi_arready;
    wire    [AXI_ADDR_WIDTH-1:0]    axi_araddr;
    wire    [7:0]                   axi_arlen;
    wire                            axi_arvalid;

    reg     [AXI_DATA_WIDTH-1:0]    axi_rdata;
    reg                             axi_rvalid;
    wire                            axi_rready;

    wire    [DATA_WIDTH-1:0]        data;
    wire                            valid;
    reg                             ready;


    /**
     * Unit under test
     */

    axis_read #(
        .BUF_AWIDTH     (BUF_AWIDTH),

        .CFG_ID         (CFG_ID),
        .CFG_ADDR       (CFG_ADDR),
        .CFG_DATA       (CFG_DATA),
        .CFG_AWIDTH     (CFG_AWIDTH),
        .CFG_DWIDTH     (CFG_DWIDTH),

        .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH))
    uut (
        .clk            (clk),
        .rst            (rst),

        .cfg_addr       (cfg_addr),
        .cfg_data       (cfg_data),
        .cfg_valid      (cfg_valid),

        .axi_arready    (axi_arready),
        .axi_araddr     (axi_araddr),
        .axi_arlen      (axi_arlen),
        .axi_arvalid    (axi_arvalid),

        .axi_rdata      (axi_rdata),
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

            "\t%d\t%d\t%b",
            cfg_addr,
            cfg_data,
            cfg_valid,

            "\t%d\t%d\t%b\t%b",
            axi_araddr,
            axi_arlen,
            axi_arvalid,
            axi_arready,

            "\t%x\t%b\t%b",
            axi_rdata,
            axi_rvalid,
            axi_rready,

            "\t%d\t%b\t%b",
            data,
            valid,
            ready,

            "\t%b",
            uut.c_state,

            "\t%b",
            uut.axis_addr_.state,

        );

    endtask // display_signals

    task display_header;
        $display(
            "\t\ttime\trst",

            "\tc_a",
            "\t\tc_d",
            "\tc_v",

            "\t\tar_a",
            "\tar_l",
            "\tar_v",
            "\tar_r",

            "\t\t\t\t\t\tr_d",
            "\t\t\t\tr_v",
            "\tr_r",

            "\t\ts_d",
            "\ts_v",
            "\tm_r",

        );
    endtask


    /**
     * Testbench program
     */

    initial begin
        // init values
        clk = 0;
        rst = 0;

        cfg_addr    = 'b0;
        cfg_data    = 'b0;
        cfg_valid   = 'b0;

        axi_arready = 'b0;

        axi_rdata   = 'b0;
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
        cfg_addr    <= CFG_ADDR;
        cfg_data    <= CFG_ID;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= 'b0;
        cfg_data    <= 'b0;
        cfg_valid   <= 1'b0;
        repeat(5) @(negedge clk);

        // memory address
        cfg_addr    <= CFG_DATA;
        cfg_data    <= 4;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= 'b0;
        cfg_data    <= 'b0;
        cfg_valid   <= 1'b0;
        repeat(5) @(negedge clk);

        // length of flow stream
        cfg_addr    <= CFG_DATA;
        cfg_data    <= 8;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= 'b0;
        cfg_data    <= 'b0;
        cfg_valid   <= 1'b0;
        repeat(5) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test read address channel");
`endif

        repeat(3) @(negedge clk);
        axi_arready <= 1'b1;
        repeat(5) @(negedge clk);
        axi_arready <= 1'b0;


`ifdef TB_VERBOSE
    $display("test read data channel");
`endif

        @(negedge clk);

        ready       <= 1'b1;
        axi_rdata   <= 'b0;
        axi_rvalid  <= 1'b0;
        repeat(5) @(negedge clk);

        axi_rdata   <= {32'd8, 32'd7, 32'd6, 32'd5, 32'd4, 32'd3, 32'd2, 32'd1};
        axi_rvalid  <= 1'b1;
        @(negedge clk);

        axi_rvalid  <= 1'b0;
        repeat(15) @(negedge clk);


`ifdef TB_VERBOSE
    $display("send config id, start address and length");
`endif

        repeat(5) @(negedge clk);
        cfg_addr    <= CFG_ADDR;
        cfg_data    <= CFG_ID;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= CFG_DATA;
        cfg_data    <= 4;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= CFG_DATA;
        cfg_data    <= 20;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= 'b0;
        cfg_data    <= 'b0;
        cfg_valid   <= 1'b0;
        repeat(5) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test read address channel");
`endif

        repeat(3) @(negedge clk);
        axi_arready <= 1'b1;
        repeat(5) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test read data channel");
`endif


        @(negedge clk);

        ready       <= 1'b1;
        axi_rdata   <= 'b0;
        axi_rvalid  <= 1'b0;
        repeat(5) @(negedge clk);

        axi_rdata   <= {32'd8, 32'd7, 32'd6, 32'd5, 32'd4, 32'd3, 32'd2, 32'd1};
        axi_rvalid  <= 1'b1;
        @(negedge clk);
        axi_rdata   <= {32'd16, 32'd15, 32'd14, 32'd13, 32'd12, 32'd11, 32'd10, 32'd9};
        while ( ~axi_rready) @(negedge clk);
        axi_rvalid  <= 1'b1;
        @(negedge clk);
        axi_rdata   <= {32'd24, 32'd23, 32'd22, 32'd21, 32'd20, 32'd19, 32'd18, 32'd17};
        while ( ~axi_rready) @(negedge clk);
        axi_rvalid  <= 1'b1;
        @(negedge clk);
        axi_rdata   <= 'b0;
        axi_rvalid  <= 1'b0;

        axi_rvalid  <= 1'b0;
        repeat(15) @(negedge clk);



/*

`ifdef TB_VERBOSE
    $display("send config id, start address and length");
`endif

        repeat(5) @(negedge clk);
        cfg_addr    <= CFG_ADDR;
        cfg_data    <= CFG_ID;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= CFG_DATA;
        cfg_data    <= 255;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= CFG_DATA;
        cfg_data    <= STREAM_LENGTH;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= 'b0;
        cfg_data    <= 'b0;
        cfg_valid   <= 1'b0;
        repeat(5) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test long read");
`endif

        repeat(3) @(negedge clk);
        // ready to recive address
        axi_arready <= 1'b1;
        repeat(5) @(negedge clk);


        // ready to recive data
        axi_rready  <= 1'b1;
        data        <= 'b0;
        valid       <= 1'b0;
        repeat(5) @(negedge clk);


        repeat (STREAM_LENGTH) begin
            // stream data into axis
            data    <= data + 1;
            valid   <= 1'b1;
            @(negedge clk);
        end

        valid <= 1'b0;
        repeat(15) @(negedge clk);
        axi_rready  <= 1'b0;
        repeat(15) @(negedge clk);
*/


`ifdef TB_VERBOSE
    $display("END");
`endif
        -> end_trigger;
    end

endmodule
