// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

// Description:
//  FIFO with first-word fall-through parameter

module fifo_2w # (
    parameter FIFO_WIDTH = 0,
    parameter FIFO_DEPTH = 0,
    parameter CNT_WIDTH  = (clogb2(FIFO_DEPTH) + 1)
) (
    input                       clk,
    input                       rst_n,

    input                       w_val_0,
    input   [FIFO_WIDTH-1:0]    w_data_0,

    input                       w_val_1,
    input   [FIFO_WIDTH-1:0]    w_data_1,

    input                       r_val,
    output  [FIFO_WIDTH-1:0]    r_data,
   
    output  [CNT_WIDTH-1:0]     size, 
    output  reg                 full,
    output  wire                data_avail
);

localparam  PTR_WIDTH   = clogb2(FIFO_DEPTH);
localparam  ELEM_NONE   = {FIFO_WIDTH{1'b1}};

//-----------------------------------------------------------------------------
// Internal Signals

reg     [FIFO_WIDTH-1:0]    fifo [FIFO_DEPTH-1:0];
reg     [PTR_WIDTH-1:0]     head_ptr;
reg     [PTR_WIDTH-1:0]     tail_ptr;
reg     [CNT_WIDTH-1:0]     used_cnt;
reg                         empty;

wire    [PTR_WIDTH:0]     head_ptr_next;
wire    [PTR_WIDTH:0]     tail_ptr_next;
wire    [CNT_WIDTH:0]     used_cnt_next;
wire    [CNT_WIDTH:0]     used_cnt_tmp;

wire                        srtd_w_val_0;
wire    [FIFO_WIDTH-1:0]    srtd_w_data_0;

wire                        srtd_w_val_1;
wire    [FIFO_WIDTH-1:0]    srtd_w_data_1;

wire    [PTR_WIDTH-1:0]     w_ind_1;
wire    [PTR_WIDTH:0]       w_ind_tmp_1;

wire    [2:0]               added_cnt;      
//-----------------------------------------------------------------------------
// Combinational Logic

assign srtd_w_val_0 = (w_val_0 | w_val_1) & (used_cnt < FIFO_DEPTH-1);
assign srtd_w_val_1 = (w_val_0 & w_val_1) & (used_cnt < FIFO_DEPTH-2);

assign srtd_w_data_0 = w_val_0 ? w_data_0 : w_data_1;
assign srtd_w_data_1 = w_data_1;

assign added_cnt = srtd_w_val_1 ? 3'b010 :
                   srtd_w_val_0 ? 3'b001 : 3'b000;

assign head_ptr_next = head_ptr + {{PTR_WIDTH-1{1'b0}}, 1'b1};
assign tail_ptr_next = tail_ptr + {{(PTR_WIDTH-2){1'b0}}, added_cnt};

assign used_cnt_tmp = used_cnt + {{(CNT_WIDTH-2){1'b0}}, added_cnt};
assign used_cnt_next = ((used_cnt_tmp == {(CNT_WIDTH+1){1'b0}}) & r_val) ? {(CNT_WIDTH+1){1'b0}} : used_cnt_tmp - {{CNT_WIDTH{1'b0}}, r_val};

assign r_data = empty & srtd_w_val_0 ? srtd_w_data_0 : 
                empty & ~srtd_w_val_0 ? ELEM_NONE : fifo[head_ptr];

assign data_avail = (empty & srtd_w_val_0) | ~empty;

assign w_ind_tmp_1 = tail_ptr + {{PTR_WIDTH-1{1'b0}}, 1'b1};

assign w_ind_1 = w_ind_tmp_1[PTR_WIDTH-1:0];

assign size    = used_cnt;
//-----------------------------------------------------------------------------
// Sequential Logic
always @(posedge clk) begin
    if (~rst_n) begin
        head_ptr <= {PTR_WIDTH{1'b0}};
    end
    else begin
        head_ptr <= ((~empty & r_val) | (empty & srtd_w_val_0 & r_val))? head_ptr_next[PTR_WIDTH-1:0] : head_ptr;
    end
end


always @(posedge clk) begin
    if (~rst_n) begin
        tail_ptr <= {PTR_WIDTH{1'b0}};
    end
    else begin
        tail_ptr <= full ? tail_ptr : tail_ptr_next[PTR_WIDTH-1:0];
    end
end


always @(posedge clk) begin
    if (~rst_n) begin
        used_cnt <= {(PTR_WIDTH+1){1'b0}};
    end
    else begin
        used_cnt <= used_cnt_next >= FIFO_DEPTH - 1 ? FIFO_DEPTH - 1 : used_cnt_next;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        empty <= 1'b1;
        full  <= 1'b0;
    end
    else begin
        empty <= used_cnt_next == 0 ? 1'b1 : 1'b0;
        full  <= used_cnt_next >= (FIFO_DEPTH-1) ? 1'b1 : 1'b0;
    end
end


generate begin
    genvar ii;
    for (ii = 0; ii < FIFO_DEPTH; ii = ii + 1) begin: fifo_gen
        always @(posedge clk) begin
            if (~rst_n) begin
                fifo[ii] <= ELEM_NONE; 
            end
            else begin
                fifo[ii] <= srtd_w_val_0 & (ii == tail_ptr) ? srtd_w_data_0 : 
                            srtd_w_val_1 & (ii == w_ind_1) ? srtd_w_data_1 : fifo[ii];
            end
        end
    end
end
endgenerate

// clogb2 function
`include "clogb2.vh"

endmodule
