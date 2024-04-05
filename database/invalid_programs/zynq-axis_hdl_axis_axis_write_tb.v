/**
 * Testbench:
 *  axis_write
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


`include "axis_write.v"

module axis_write_tb;

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

    localparam AXI_LEN_WIDTH    = 2;
    localparam AXI_ADDR_WIDTH   = 32;
    localparam AXI_DATA_WIDTH   = 256;
    localparam DATA_WIDTH       = 32;


`ifdef TB_VERBOSE
    initial $display("Testbench for unit 'axis_write'");
`endif


    /**
     *  signals, registers and wires
     */

    reg                             rst;

    reg     [CFG_AWIDTH-1:0]        cfg_addr;
    reg     [CFG_DWIDTH-1:0]        cfg_data;
    reg                             cfg_valid;

    reg                             axi_awready;
    wire    [AXI_ADDR_WIDTH-1:0]    axi_awaddr;
    wire    [AXI_LEN_WIDTH-1:0]     axi_awlen;
    wire                            axi_awvalid;

    wire                            axi_wlast;
    wire    [AXI_DATA_WIDTH-1:0]    axi_wdata;
    wire                            axi_wvalid;
    reg                             axi_wready;

    reg     [DATA_WIDTH-1:0]        data;
    reg                             valid;
    wire                            ready;


    /**
     * Unit under test
     */

    axis_write #(
        .BUF_AWIDTH     (BUF_AWIDTH),

        .CFG_ID         (CFG_ID),
        .CFG_ADDR       (CFG_ADDR),
        .CFG_DATA       (CFG_DATA),
        .CFG_AWIDTH     (CFG_AWIDTH),
        .CFG_DWIDTH     (CFG_DWIDTH),

        .AXI_LEN_WIDTH  (AXI_LEN_WIDTH),
        .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH))
    uut (
        .clk            (clk),
        .rst            (rst),

        .cfg_addr       (cfg_addr),
        .cfg_data       (cfg_data),
        .cfg_valid      (cfg_valid),

        .axi_awready    (axi_awready),
        .axi_awaddr     (axi_awaddr),
        .axi_awlen      (axi_awlen),
        .axi_awvalid    (axi_awvalid),

        .axi_wlast      (axi_wlast),
        .axi_wdata      (axi_wdata),
        .axi_wvalid     (axi_wvalid),
        .axi_wready     (axi_wready),

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
            axi_awaddr,
            axi_awlen,
            axi_awvalid,
            axi_awready,

            "\t%x\t%b\t%b\t%b",
            axi_wdata,
            axi_wvalid,
            axi_wready,
            axi_wlast,

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

            "\t\taw_a",
            "\taw_l",
            "\taw_v",
            "\taw_r",

            "\t\t\t\t\t\tw_d",
            "\t\t\t\tw_v",
            "\tw_r",
            "\tw_l",

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

        axi_awready = 'b0;

        axi_wready  = 'b0;
        data        = 'b0;
        valid       = 'b0;
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

        cfg_addr    <= CFG_DATA;
        cfg_data    <= 4;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= 'b0;
        cfg_data    <= 'b0;
        cfg_valid   <= 1'b0;
        repeat(5) @(negedge clk);

        cfg_addr    <= CFG_DATA;
        cfg_data    <= 8;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= 'b0;
        cfg_data    <= 'b0;
        cfg_valid   <= 1'b0;
        repeat(5) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test write address channel");
`endif

        repeat(3) @(negedge clk);
        axi_awready <= 1'b1;
        repeat(5) @(negedge clk);


        axi_wready  <= 1'b1;
        data        <= 'b0;
        valid       <= 1'b0;
        repeat(5) @(negedge clk);

        repeat (5) begin
            data    <= data + 1;
            valid   <= 1'b1;
            @(negedge clk);
        end

        axi_wready  <= 1'b0;
        //data        <= 'b0;
        valid       <= 1'b0;
        repeat(5) @(negedge clk);

        repeat (3) begin
            data    <= data + 1;
            valid   <= 1'b1;
            @(negedge clk);
        end

        axi_wready  <= 1'b1;
        data        <= 'b0;
        valid       <= 1'b0;
        //repeat(4) @(negedge clk);
        repeat(5) @(negedge clk);
        //repeat(6) @(negedge clk);
        axi_wready  <= 1'b0;
        @(negedge clk);
        axi_wready  <= 1'b1;
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
        cfg_data    <= 8;
        cfg_valid   <= 1'b1;
        @(negedge clk)

        cfg_addr    <= 'b0;
        cfg_data    <= 'b0;
        cfg_valid   <= 1'b0;
        repeat(5) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test write address channel");
`endif

        repeat(3) @(negedge clk);
        axi_awready <= 1'b1;
        repeat(5) @(negedge clk);


        axi_wready  <= 1'b1;
        data        <= 'b0;
        valid       <= 1'b0;
        repeat(5) @(negedge clk);


        repeat (8) begin
            data    <= data + 1;
            valid   <= 1'b1;
            @(negedge clk);
            valid   <= 1'b0;
            repeat(5) @(negedge clk);
        end

        axi_awready <= 1'b0;
        axi_wready  <= 1'b0;
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
    $display("test long write");
`endif

        repeat(3) @(negedge clk);
        // ready to recive address
        axi_awready <= 1'b1;
        repeat(5) @(negedge clk);


        // ready to recive data
        axi_wready  <= 1'b1;
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
        axi_wready  <= 1'b0;
        repeat(15) @(negedge clk);



`ifdef TB_VERBOSE
    $display("END");
`endif
        -> end_trigger;
    end

endmodule
