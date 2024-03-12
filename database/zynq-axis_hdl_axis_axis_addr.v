/**
 * Module:
 *  axis_addr
 *
 * Description:
 *  The axis_addr handles the AXI write address channel.
 *
 * Test bench:
 *  axis_addr_tb.v
 *
 * Created:
 *  Wed Nov  5 21:15:56 EST 2014
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */
`ifndef _axis_addr_
`define _axis_addr_

`include "fifo_simple.v"

`define MIN(p,q) (p)<(q)?(p):(q)

module axis_addr
  #(parameter
    BUF_CFG_AWIDTH  = 5,
    CFG_DWIDTH      = 32,
    WIDTH_RATIO     = 16,
    CONVERT_SHIFT   = 3,
    AXI_LEN_WIDTH   = 8,
    AXI_ADDR_WIDTH  = 32,
    AXI_DATA_WIDTH  = 256)
   (input                               clk,
    input                               rst,

    input       [CFG_DWIDTH-1:0]        cfg_address,
    input       [CFG_DWIDTH-1:0]        cfg_length,
    input                               cfg_val,
    output                              cfg_rdy,

    input                               axi_aready,
    output      [AXI_ADDR_WIDTH-1:0]    axi_aaddr,
    output      [AXI_LEN_WIDTH-1:0]     axi_alen,
    output                              axi_avalid
);

    /**
     * Local parameters
     */

    localparam AWIDTH           = `MIN(CFG_DWIDTH, AXI_ADDR_WIDTH);
    localparam BURST_NB_WIDTH   = CFG_DWIDTH-AXI_LEN_WIDTH;
    localparam BURST_LENGTH     = 1<<AXI_LEN_WIDTH;

    localparam
        CONFIG  =  0,
        SETUP   =  1,
        BURST   =  2,
        LAST    =  3,
        DONE    =  4;



`ifdef VERBOSE
    initial $display("\using 'axis_addr'\n");
`endif


    /**
     * Internal signals
     */


    reg  [4:0]                  state;
    reg  [4:0]                  state_nx;

    wire                        cfg_buf_pop;
    wire                        cfg_buf_full;
    wire                        cfg_buf_empty;
    wire [CFG_DWIDTH-1:0]       cfg_buf_address;
    wire [CFG_DWIDTH-1:0]       cfg_buf_length;
    reg                         cfg_buf_valid;

    reg                         last_en;
    reg  [AXI_LEN_WIDTH-1:0]    last_nb;

    reg                         burst_en;
    reg  [BURST_NB_WIDTH-1:0]   burst_nb;
    reg  [BURST_NB_WIDTH-1:0]   burst_cnt;
    wire                        burst_done;

    reg  [AXI_ADDR_WIDTH-1:0]   axi_address;
    reg  [CFG_DWIDTH-1:0]       axi_length;
    reg                         axi_valid;
    reg                         cfg_done;


    /**
     * Implementation
     */


    assign cfg_rdy = ~cfg_buf_full;


    fifo_simple #(
        .DATA_WIDTH (2*CFG_DWIDTH),
        .ADDR_WIDTH (BUF_CFG_AWIDTH))
    cfg_buffer_ (
        .clk        (clk),
        .rst        (rst),

        .count      (),
        .empty      (cfg_buf_empty),
        .empty_a    (),
        .full       (cfg_buf_full),
        .full_a     (),

        .push_data  ({cfg_address,      cfg_length}),
        .push       (cfg_val),

        .pop_data   ({cfg_buf_address,  cfg_buf_length}),
        .pop        (cfg_buf_pop)
    );


    assign cfg_buf_pop = ~cfg_buf_empty & state[CONFIG];


    always @(posedge clk)
        if (rst) begin
            cfg_buf_valid   <= 1'b0;
            axi_valid       <= 1'b0;
            cfg_done        <= 1'b0;
        end
        else begin
            cfg_buf_valid   <= cfg_buf_pop;
            axi_valid       <= cfg_buf_valid;
            cfg_done        <= axi_valid;
        end


    always @(posedge clk)
        if (cfg_buf_valid) begin
            // the shift converts from number of stream elements to number of
            // bursts to be sent to the memory after stream is packed. adding a
            // bit to the length ensures that the shift rounds up

            axi_length <= (cfg_buf_length+WIDTH_RATIO-1) >> CONVERT_SHIFT;
        end


    always @(posedge clk)
        if (cfg_buf_valid) begin
            axi_address             <= {AXI_ADDR_WIDTH{1'b0}};
            axi_address[AWIDTH-1:0] <= cfg_buf_address[AWIDTH-1:0];
        end
        else if (axi_aready & state[BURST]) begin
            // e.g. each burst has 256 long words & each long word has 32 bytes
            axi_address <= axi_address + (BURST_LENGTH * (AXI_DATA_WIDTH/8));
        end


    always @(posedge clk)
        if (axi_valid) begin
            last_en     <= |(axi_length[AXI_LEN_WIDTH-1:0]);
            last_nb     <= axi_length[AXI_LEN_WIDTH-1:0]-1;

            burst_en    <= |(axi_length[AXI_LEN_WIDTH +: BURST_NB_WIDTH]);
            burst_nb    <= axi_length[AXI_LEN_WIDTH +: BURST_NB_WIDTH]-1;
        end


    always @(posedge clk)
        if (axi_valid) begin
            burst_cnt <= 'b0;
        end
        else if (axi_aready & state[BURST]) begin
            burst_cnt <= burst_cnt + 1;
        end


    assign burst_done = (burst_nb == burst_cnt);


    always @(posedge clk)
        if (rst) begin
            state           <= 'b0;
            state[CONFIG]   <= 1'b1;
        end
        else state <= state_nx;


    always @* begin : ADDR_
        state_nx = 'b0;

        case (1'b1)
            state[CONFIG] : begin
                if ( ~cfg_buf_empty) begin
                    state_nx[SETUP] = 1'b1;
                end
                else state_nx[CONFIG] = 1'b1;
            end
            state[SETUP] : begin
                if (cfg_done & burst_en) begin
                    state_nx[BURST] = 1'b1;
                end
                else if (cfg_done & ~burst_en) begin
                    state_nx[LAST] = 1'b1;
                end
                else state_nx[SETUP] = 1'b1;
            end
            state[BURST] : begin
                if (axi_aready & burst_done & last_en) begin
                    state_nx[LAST] = 1'b1;
                end
                else if (axi_aready & burst_done & ~last_en) begin
                    state_nx[DONE] = 1'b1;
                end
                else state_nx[BURST] = 1'b1;
            end
            state[LAST] : begin
                if (axi_aready) begin
                    state_nx[DONE] = 1'b1;
                end
                else state_nx[LAST] = 1'b1;
            end
            state[DONE] : begin
                state_nx[CONFIG] = 1'b1;
            end
            default : begin
                state_nx[CONFIG] = 1'b1;
            end
        endcase
    end


    assign axi_aaddr    = axi_address;

    assign axi_alen     = state[BURST] ? (BURST_LENGTH-1) : last_nb;

    assign axi_avalid   = state[BURST] | state[LAST];


endmodule

`undef MIN

`endif //  `ifndef _axis_addr_
