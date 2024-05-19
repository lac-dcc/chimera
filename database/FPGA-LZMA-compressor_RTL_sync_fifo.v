// This program was cloned from: https://github.com/WangXuan95/FPGA-LZMA-compressor
// License: GNU General Public License v3.0


module sync_fifo #(
    parameter            DW = 8   // data width
) (
    input  wire          rstn,
    input  wire          clk,
    // input stream
    output wire          i_rdy,
    input  wire          i_en,
    input  wire [DW-1:0] i_data,
    // output stream
    input  wire          o_rdy,
    output reg           o_en,
    output reg  [DW-1:0] o_data
);


reg  [10:0] wptr    = 11'd0;
reg  [10:0] wptr_d1 = 11'd0;
reg  [10:0] wptr_d2 = 11'd0;
reg  [10:0] rptr    = 11'd0;
wire [10:0] rptr_next = (o_en & o_rdy) ? (rptr+11'd1) : rptr;

reg  [DW-1:0] buffer [1023:0];

assign i_rdy = ( wptr != {~rptr[10], rptr[9:0]} );


always @ (posedge clk or negedge rstn)
    if (~rstn)
        {wptr_d2, wptr_d1} <= 22'd0;
    else
        {wptr_d2, wptr_d1} <= {wptr_d1, wptr};

always @ (posedge clk or negedge rstn)
    if (~rstn) begin
        wptr <= 11'h0;
    end else begin
        if (i_en & i_rdy)
            wptr <= wptr + 11'h1;
    end

always @ (posedge clk)
    if (i_en & i_rdy)
        buffer[wptr[9:0]] <= i_data;


always @ (posedge clk or negedge rstn)
    if (~rstn) begin
        rptr <= 11'h0;
        o_en <= 1'b0;
    end else begin
        rptr <= rptr_next;
        o_en <= (rptr_next != wptr_d2);
    end

always @ (posedge clk)
    o_data <= buffer[rptr_next[9:0]];

endmodule

