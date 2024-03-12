/**
 * Module:
 *  axis_write_data
 *
 * Description:
 *  The axis_write_data handles the AXI write data channel.
 *
 * Test bench:
 *  axis_write_tb.v
 *
 * Created:
 *  Tue Nov  4 22:18:14 EST 2014
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */
`ifndef _axis_write_data_
`define _axis_write_data_


`include "fifo_simple.v"
`include "axis_gbox.v"

module axis_write_data
  #(parameter
    BUF_CFG_AWIDTH  = 5,
    BUF_AWIDTH      = 9,
    CFG_DWIDTH      = 32,
    CONVERT_SHIFT   = 3,

    AXI_LEN_WIDTH   = 8,
    AXI_DATA_WIDTH  = 64,
    DATA_WIDTH      = 32)
   (input                               clk,
    input                               rst,

    input       [CFG_DWIDTH-1:0]        cfg_length,
    input                               cfg_val,
    output                              cfg_rdy,

    output                              axi_wlast,
    output      [AXI_DATA_WIDTH-1:0]    axi_wdata,
    output                              axi_wvalid,
    input                               axi_wready,

    input       [DATA_WIDTH-1:0]        data,
    input                               valid,
    output reg                          ready
);

    /**
     * Local parameters
     */

    localparam BURST_WIDTH  = AXI_LEN_WIDTH+CONVERT_SHIFT;
    localparam BURST_LAST   = (1<<BURST_WIDTH)-1;

    localparam
        CONFIG  =  0,
        SET     =  1,
        LOAD    =  2,
        ACTIVE  =  3;


`ifdef VERBOSE
    initial $display("\using 'axis_write_data'\n");
`endif


    /**
     * Internal signals
     */

    reg  [3:0]                  state;
    reg  [3:0]                  state_nx;

    wire                        cfg_buf_pop;
    wire                        cfg_buf_full;
    wire                        cfg_buf_empty;
    wire [CFG_DWIDTH-1:0]       cfg_buf_length;

    reg  [CFG_DWIDTH-1:0]       str_cnt;
    reg  [CFG_DWIDTH-1:0]       str_next;
    reg  [CFG_DWIDTH-1:0]       str_length;

    wire [BUF_AWIDTH:0]         buf_count;
    wire                        buf_pop;
    wire                        buf_empty;

    reg                         deser_done;
    reg                         deser_last;
    wire [DATA_WIDTH-1:0]       deser_data;
    reg                         deser_en;
    wire                        deser_rdy;

    /**
     * Implementation
     */


    assign cfg_rdy = ~cfg_buf_full;


    fifo_simple #(
        .DATA_WIDTH (CFG_DWIDTH),
        .ADDR_WIDTH (BUF_CFG_AWIDTH))
    cfg_buffer_ (
        .clk        (clk),
        .rst        (rst),

        .count      (),
        .empty      (cfg_buf_empty),
        .empty_a    (),
        .full       (cfg_buf_full),
        .full_a     (),

        .push_data  (cfg_length),
        .push       (cfg_val),

        .pop_data   (cfg_buf_length),
        .pop        (cfg_buf_pop)
    );

    assign cfg_buf_pop = ~cfg_buf_empty & state[CONFIG];


    always @(posedge clk)
        if (state[SET]) begin
            str_length <= cfg_buf_length-'b1;
        end


    // half way mark ready flag
    always @(posedge clk)
        if (rst)    ready <= 1'b0;
        else        ready <= ~|(buf_count[BUF_AWIDTH:BUF_AWIDTH-1]);


    fifo_simple #(
        .DATA_WIDTH (DATA_WIDTH),
        .ADDR_WIDTH (BUF_AWIDTH))
    buffer_ (
        .clk        (clk),
        .rst        (rst),

        .count      (buf_count),
        .empty      (buf_empty),
        .empty_a    (),
        .full       (),
        .full_a     (),

        .push_data  (data),
        .push       (valid),

        .pop_data   (deser_data),
        .pop        (buf_pop)
    );


    assign buf_pop = ~deser_en | (deser_rdy & state[ACTIVE]);


    always @(posedge clk)
        if      (rst)       deser_en <= 1'b0;
        else if (buf_pop)   deser_en <= ~buf_empty;


    always @(posedge clk)
        if (state[LOAD]) begin
            deser_done <= str_next[0] & (str_length == {CFG_DWIDTH{1'b0}});
        end
        else if (buf_pop) begin
            // trigger on last word in stream
            deser_done <= ~buf_empty & (str_length == str_cnt);
        end


    always @(posedge clk)
        if (state[LOAD]) begin
            deser_last <= str_next[0] &
                ((str_length == {CFG_DWIDTH{1'b0}}) | (BURST_LAST == {BURST_WIDTH{1'b0}}));
        end
        else if (buf_pop) begin
            // trigger on last word in stream or last word in burst
            deser_last <= ~buf_empty &
                ((str_length == str_cnt) | (BURST_LAST == str_cnt[0 +: BURST_WIDTH]));
        end


    always @(posedge clk)
        if (state[LOAD]) begin
            str_cnt <= str_next;
        end
        else if (buf_pop) begin
            str_cnt <= str_cnt + {{CFG_DWIDTH-1{1'b0}}, ~buf_empty};
        end


    always @(posedge clk)
        if (rst) str_next <= 'b0;
        else if (deser_en & deser_rdy & deser_done & state[ACTIVE]) begin
            // if buffer is not empty when one stream is done it means the 1st
            // word of the next stream is already in the pipeline

            str_next <= {{CFG_DWIDTH-1{1'b0}}, ~buf_empty};
        end


    axis_gbox #(
        .DATA_UP_WIDTH  (DATA_WIDTH),
        .DATA_DN_WIDTH  (AXI_DATA_WIDTH))
    deser_ (
        .clk        (clk),
        .rst        (rst),

        .up_data    (deser_data),
        .up_last    (deser_last),
        .up_val     (deser_en & state[ACTIVE]),
        .up_rdy     (deser_rdy),

        .dn_data    (axi_wdata),
        .dn_last    (axi_wlast),
        .dn_val     (axi_wvalid),
        .dn_rdy     (axi_wready)
    );


    always @(posedge clk)
        if (rst) begin
            state           <= 'b0;
            state[CONFIG]   <= 1'b1;
        end
        else state <= state_nx;


    always @* begin : DATA_
        state_nx = 'b0;

        case (1'b1)
            state[CONFIG] : begin
                if ( ~cfg_buf_empty) begin
                    state_nx[SET] = 1'b1;
                end
                else state_nx[CONFIG] = 1'b1;
            end
            state[SET] : begin
                state_nx[LOAD] = 1'b1;
            end
            state[LOAD] : begin
                state_nx[ACTIVE] = 1'b1;
            end
            state[ACTIVE] : begin
                if (deser_en & deser_rdy & deser_done) begin
                    state_nx[CONFIG] = 1'b1;
                end
                else state_nx[ACTIVE] = 1'b1;
            end
            default : begin
                state_nx[CONFIG] = 1'b1;
            end
        endcase
    end



endmodule

`endif //  `ifndef _axis_write_data_
