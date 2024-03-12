/**
 * Testbench:
 *  axis_write_data
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


`include "axis_write_data.v"

module axis_write_data_tb;

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

    localparam AXI_LEN_WIDTH    = 4;
    localparam AXI_DATA_WIDTH   = 64;
    localparam DATA_WIDTH       = 32;

    localparam WIDTH_RATIO      = AXI_DATA_WIDTH/DATA_WIDTH;


`ifdef TB_VERBOSE
    initial $display("Testbench for unit 'axis_write_data'");
`endif


    /**
     *  signals, registers and wires
     */

    reg                             rst;

    reg     [CFG_DWIDTH-1:0]        cfg_length;
    reg                             cfg_val;
    wire                            cfg_rdy;

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

    axis_write_data #(
        .BUF_AWIDTH     (BUF_AWIDTH),
        .CFG_DWIDTH     (CFG_DWIDTH),
        .CONVERT_SHIFT  ($clog2(WIDTH_RATIO)),

        .AXI_LEN_WIDTH  (AXI_LEN_WIDTH),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH))
    uut (
        .clk            (clk),
        .rst            (rst),

        .cfg_length     (cfg_length),
        .cfg_val        (cfg_val),
        .cfg_rdy        (cfg_rdy),

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

            "\t%d\t%b\t%b",
            cfg_length,
            cfg_val,
            cfg_rdy,

            "\t%x\t%b\t%b\t%b",
            axi_wdata,
            axi_wvalid,
            axi_wready,
            axi_wlast,

            "\t%x\t%b\t%b",
            data,
            valid,
            ready,

            "\t%b",
            uut.state,

            "\t%d",
            uut.str_cnt,

        );

    endtask // display_signals

    task display_header;
        $display(
            "\t\ttime\trst",

            "\t\tc_l",
            "\tc_v",
            "\tc_r",

            "\tw_d",
            "\t\t\tw_v",
            "\tw_r",
            "\tw_l",

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
        cfg_length  <= 8;
        cfg_val     <= 1'b1;
        @(negedge clk)

        cfg_length  <= 'b0;
        cfg_val     <= 1'b0;
        repeat(5) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test write");
`endif

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
        //data        <= 'b0;
        valid       <= 1'b0;
        repeat(4) @(negedge clk);
        axi_wready <= 1'b1;
        @(negedge clk);
        axi_wready <= 1'b0;
        @(negedge clk);
        axi_wready <= 1'b1;
        @(negedge clk);
        axi_wready <= 1'b0;
        @(negedge clk);
        axi_wready <= 1'b1;
        @(negedge clk);
        axi_wready <= 1'b0;
        @(negedge clk);
        axi_wready <= 1'b1;
        @(negedge clk);
        axi_wready <= 1'b0;
        @(negedge clk);
        axi_wready  <= 1'b0;
        @(negedge clk);
        axi_wready  <= 1'b1;
        repeat(15) @(negedge clk);


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
        cfg_length  <= 8;
        cfg_val     <= 1'b1;
        @(negedge clk)

        cfg_length  <= 'b0;
        cfg_val     <= 1'b0;
        repeat(5) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test write address channel");
`endif

        repeat(5) @(negedge clk);
        axi_wready  <= 1'b1;
        //data        <= 'b0;
        valid       <= 1'b0;
        repeat(5) @(negedge clk);


        repeat (8) begin
            data    <= data + 1;
            valid   <= 1'b1;
            @(negedge clk);
            valid   <= 1'b0;
            repeat(5) @(negedge clk);
        end
        valid       <= 1'b0;


        repeat(15) @(negedge clk);
        axi_wready  <= 1'b0;

        repeat(15) @(negedge clk);


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
        cfg_length  <= STREAM_LENGTH;
        cfg_val     <= 1'b1;
        @(negedge clk)

        cfg_length  <= 1;
        cfg_val     <= 1'b1;
        @(negedge clk)

        cfg_length  <= 1;
        cfg_val     <= 1'b1;
        @(negedge clk)

        cfg_length  <= 'b0;
        cfg_val     <= 1'b0;
        repeat(5) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test write address channel");
`endif

        repeat(5) @(negedge clk);
        data        <= 'b0;
        valid       <= 1'b0;
        axi_wready  <= 1'b1;
        repeat(15) @(negedge clk);

        repeat (STREAM_LENGTH+1) begin
            data    <= data + 1;
            valid   <= 1'b1;
            @(negedge clk);
        end
        valid       <= 1'b0;


        repeat(15) @(negedge clk);
        data    <= data + 1;
        valid   <= 1'b1;
        @(negedge clk);
        valid       <= 1'b0;
        repeat(15) @(negedge clk);
        axi_wready  <= 1'b0;

        repeat(15) @(negedge clk);

`ifdef TB_VERBOSE
    $display("END");
`endif
        -> end_trigger;
    end

endmodule
