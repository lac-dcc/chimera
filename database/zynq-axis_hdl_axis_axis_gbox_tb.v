/**
 * Testbench for:
 *  axis_gbox
 *
 * Created:
 *  Sun Jun  3 17:57:21 PDT 2018
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */

`timescale 1ns/10ps

`define TB_VERBOSE
//`define VERBOSE


`include "axis_gbox.v"

module axis_gbox_tb;

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

    localparam DATA_UP_WIDTH    = 24;
    localparam DATA_DN_WIDTH    = 8;
    localparam DATA_NB          = DATA_UP_WIDTH/DATA_DN_WIDTH;

    //localparam DATA_UP_WIDTH    = 8;
    //localparam DATA_DN_WIDTH    = 24;
    //localparam DATA_NB          = DATA_DN_WIDTH/DATA_UP_WIDTH;

    localparam STREAM_LENGTH    = 256;
    localparam STREAM_WIDTH     = (DATA_DN_WIDTH < DATA_UP_WIDTH) ?
                                   DATA_DN_WIDTH : DATA_UP_WIDTH ;

`ifdef TB_VERBOSE
    initial begin
        $display("Testbench for unit 'axis_gbox' data up width: %d, down: %d",
            DATA_UP_WIDTH, DATA_DN_WIDTH);
    end
`endif


    /**
     *  signals, registers and wires
     */

    reg                         rst;

    wire    [DATA_UP_WIDTH-1:0] up_data;
    reg                         up_last;
    wire                        up_val;
    wire                        up_rdy;

    wire    [DATA_DN_WIDTH-1:0] dn_data;
    wire                        dn_last;
    wire                        dn_val;
    reg                         dn_rdy;

    reg     [STREAM_WIDTH-1:0]  stream  [0:STREAM_LENGTH-1];
    integer                     cnt;

    /**
     * Unit under test
     */

    axis_gbox #(
        .DATA_UP_WIDTH  (DATA_UP_WIDTH),
        .DATA_DN_WIDTH  (DATA_DN_WIDTH))
    uut (
        .clk        (clk),
        .rst        (rst),

        .up_data    (up_data),
        .up_last    (up_last),
        .up_val     (up_val),
        .up_rdy     (up_rdy),

        .dn_data    (dn_data),
        .dn_last    (dn_last),
        .dn_val     (dn_val),
        .dn_rdy     (dn_rdy)
    );


    /**
     * Wave form display
     */

    task display_signals;
        $display(
            "%d\t%d",
            $time, rst,

            "\tu: %x",
            up_data,

            "\tv %b\tr %b\tl %b",
            up_val,
            up_rdy,
            up_last,

            "\t%x\t%b\t%b\t%b",
            dn_data,
            dn_val,
            dn_rdy,
            dn_last,

        );
    endtask // display_signals

    task display_header;
        $display(
            "\t\ttime\trst",

            "\tu_d",
            "\t\tu_v",
            "\tu_r",
            "\tu_l",

            "\td_d",
            "\td_v",
            "\td_r",
            "\td_l",

        );
    endtask


    /**
     * Testbench program
     */

    assign up_data = {stream[cnt]+4'd2, stream[cnt]+4'd1, stream[cnt]};
    //assign up_data  = stream[cnt];

    assign up_val   = 1'b1;

    always @(posedge clk)
        if (up_rdy & up_val) begin
            cnt <= cnt + 1;
        end



    initial begin
        // init values
        clk = 0;
        rst = 0;

        up_last = 'b0;
        dn_rdy  = 'b0;

        cnt = 0;
        repeat (STREAM_LENGTH) begin
            stream[cnt] = (DATA_NB*cnt)+1;
            //stream[cnt] = cnt + 1;
            cnt         = cnt + 1;
        end
        cnt = 0;
        //end init

`ifdef TB_VERBOSE
    $display("RESET");
`endif

        repeat(6) @(negedge clk);
        rst <= 1'b1;
        repeat(6) @(negedge clk);
        rst <= 1'b0;
        repeat(6) @(negedge clk);

`ifdef TB_VERBOSE
    $display("test continuous ready");
`endif

        @(negedge clk);
        dn_rdy <= 1'b1;
        repeat(20) @(negedge clk);
        dn_rdy <= 1'b0;
        repeat(10) @(negedge clk);


`ifdef TB_VERBOSE
    $display("test non-continuous ready");
`endif

        dn_rdy <= 1'b1;
        repeat(20) @(negedge clk);
        dn_rdy  <= 1'b0;
        up_last <= 1'b1;
        @(negedge clk);
        dn_rdy  <= 1'b1;
        repeat (3) @(negedge clk);
        up_last <= 1'b0;
        repeat(5) @(negedge clk);
        dn_rdy <= 1'b0;
        repeat(5) @(negedge clk);
        dn_rdy <= 1'b1;
        repeat(5) @(negedge clk);
        dn_rdy <= 1'b0;
        repeat(10) @(negedge clk);
        dn_rdy <= 1'b1;
        @(negedge clk);
        dn_rdy <= 1'b0;
        @(negedge clk);
        dn_rdy <= 1'b1;
        @(negedge clk);
        dn_rdy <= 1'b0;
        repeat(10) @(negedge clk);



`ifdef TB_VERBOSE
    $display("END");
`endif
        -> end_trigger;
    end

endmodule
