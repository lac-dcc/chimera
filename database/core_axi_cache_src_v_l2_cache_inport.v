// This program was cloned from: https://github.com/ultraembedded/core_axi_cache
// License: BSD 3-Clause "New" or "Revised" License

//-----------------------------------------------------------------
// Copyright (c) 2021, admin@ultra-embedded.com
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions 
// are met:
//   - Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
//   - Redistributions in binary form must reproduce the above copyright
//     notice, this list of conditions and the following disclaimer 
//     in the documentation and/or other materials provided with the 
//     distribution.
//   - Neither the name of the author nor the names of its contributors 
//     may be used to endorse or promote products derived from this 
//     software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE 
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF 
// SUCH DAMAGE.
//-----------------------------------------------------------------
module l2_cache_inport
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           axi_awvalid_i
    ,input  [ 31:0]  axi_awaddr_i
    ,input  [  3:0]  axi_awid_i
    ,input  [  7:0]  axi_awlen_i
    ,input  [  1:0]  axi_awburst_i
    ,input           axi_wvalid_i
    ,input  [ 31:0]  axi_wdata_i
    ,input  [  3:0]  axi_wstrb_i
    ,input           axi_wlast_i
    ,input           axi_bready_i
    ,input           axi_arvalid_i
    ,input  [ 31:0]  axi_araddr_i
    ,input  [  3:0]  axi_arid_i
    ,input  [  7:0]  axi_arlen_i
    ,input  [  1:0]  axi_arburst_i
    ,input           axi_rready_i
    ,input           outport_accept_i
    ,input           outport_ack_i
    ,input           outport_error_i
    ,input  [ 31:0]  outport_read_data_i

    // Outputs
    ,output          axi_awready_o
    ,output          axi_wready_o
    ,output          axi_bvalid_o
    ,output [  1:0]  axi_bresp_o
    ,output [  3:0]  axi_bid_o
    ,output          axi_arready_o
    ,output          axi_rvalid_o
    ,output [ 31:0]  axi_rdata_o
    ,output [  1:0]  axi_rresp_o
    ,output [  3:0]  axi_rid_o
    ,output          axi_rlast_o
    ,output [  3:0]  outport_wr_o
    ,output          outport_rd_o
    ,output [ 31:0]  outport_addr_o
    ,output [ 31:0]  outport_write_data_o
);

localparam RETIME_RESP = 0;

wire               output_busy_w;

// Write
wire               wr_valid_w;
wire               wr_accept_w;
wire [ 31:0]       wr_addr_w;
wire [3:0]         wr_id_w;
wire [31:0]        wr_data_w;
wire [3:0]         wr_strb_w;
wire               wr_last_w;

// Read
wire               rd_valid_w;
wire               rd_accept_w;
wire [ 31:0]       rd_addr_w;
wire [3:0]         rd_id_w;
wire               rd_last_w;

l2_cache_axi_input
#(
     .DATA_W(32)
    ,.STRB_W(4)
    ,.ID_W(4)
    ,.RW_ARB(1)
)
u_input
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    // AXI
    ,.axi_awvalid_i(axi_awvalid_i)
    ,.axi_awaddr_i(axi_awaddr_i)
    ,.axi_awid_i(axi_awid_i)
    ,.axi_awlen_i(axi_awlen_i)
    ,.axi_awburst_i(axi_awburst_i)
    ,.axi_wvalid_i(axi_wvalid_i)
    ,.axi_wdata_i(axi_wdata_i)
    ,.axi_wstrb_i(axi_wstrb_i)
    ,.axi_wlast_i(axi_wlast_i)
    ,.axi_arvalid_i(axi_arvalid_i)
    ,.axi_araddr_i(axi_araddr_i)
    ,.axi_arid_i(axi_arid_i)
    ,.axi_arlen_i(axi_arlen_i)
    ,.axi_arburst_i(axi_arburst_i)
    ,.axi_awready_o(axi_awready_o)
    ,.axi_wready_o(axi_wready_o)
    ,.axi_arready_o(axi_arready_o)

    // Write
    ,.wr_valid_o(wr_valid_w)
    ,.wr_accept_i(wr_accept_w)
    ,.wr_addr_o(wr_addr_w)
    ,.wr_id_o(wr_id_w)
    ,.wr_data_o(wr_data_w)
    ,.wr_strb_o(wr_strb_w)
    ,.wr_last_o(wr_last_w)

    // Read
    ,.rd_valid_o(rd_valid_w)
    ,.rd_accept_i(rd_accept_w)
    ,.rd_addr_o(rd_addr_w)
    ,.rd_id_o(rd_id_w)
    ,.rd_last_o(rd_last_w)
);

//-----------------------------------------------------------------
// Request
//-----------------------------------------------------------------
wire req_fifo_accept_w;

wire wr_enable_w            = wr_valid_w & req_fifo_accept_w & ~output_busy_w;
wire rd_enable_w            = rd_valid_w & req_fifo_accept_w & ~output_busy_w;

assign outport_addr_o       = wr_enable_w ? wr_addr_w : rd_addr_w;
assign outport_write_data_o = wr_data_w;
assign outport_rd_o         = rd_enable_w;
assign outport_wr_o         = wr_enable_w ? wr_strb_w : 4'b0;

assign rd_accept_w          = rd_enable_w & outport_accept_i & req_fifo_accept_w & ~output_busy_w;
assign wr_accept_w          = wr_enable_w & outport_accept_i & req_fifo_accept_w & ~output_busy_w;

//-----------------------------------------------------------------
// Request tracking
//-----------------------------------------------------------------
wire       req_push_w = (outport_rd_o || (outport_wr_o != 4'b0)) && outport_accept_i;
reg [5:0]  req_in_r;

wire       req_out_valid_w;
wire [5:0] req_out_w;
wire       resp_accept_w;

always @ *
begin
    req_in_r = 6'b0;

    // Read
    if (outport_rd_o)
        req_in_r = {1'b1, rd_last_w, rd_id_w};
    // Write
    else
        req_in_r = {1'b0, wr_last_w, wr_id_w};
end

l2_cache_inport_fifo2
#( .WIDTH(1 + 1 + 4) )
u_requests
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    // Input
    .data_in_i(req_in_r),
    .push_i(req_push_w),
    .accept_o(req_fifo_accept_w),

    // Output
    .pop_i(resp_accept_w),
    .data_out_o(req_out_w),
    .valid_o(req_out_valid_w)
);

wire resp_is_write_w = req_out_valid_w ? ~req_out_w[5] : 1'b0;
wire resp_is_read_w  = req_out_valid_w ? req_out_w[5]  : 1'b0;
wire resp_is_last_w  = req_out_w[4];
wire [3:0] resp_id_w = req_out_w[3:0];

//-----------------------------------------------------------------
// Retimed respone (latency = 1)
//-----------------------------------------------------------------
generate
if (RETIME_RESP)
begin
    assign output_busy_w = 1'b0;

    //-------------------------------------------------------------
    // Response buffering
    //-------------------------------------------------------------
    wire resp_valid_w;

    l2_cache_inport_fifo2
    #( .WIDTH(32) )
    u_response
    (
        .clk_i(clk_i),
        .rst_i(rst_i),

        // Input
        .data_in_i(outport_read_data_i),
        .push_i(outport_ack_i),
        .accept_o(),

        // Output
        .pop_i(resp_accept_w),
        .data_out_o(axi_rdata_o),
        .valid_o(resp_valid_w)
    );

    //-------------------------------------------------------------
    // Response
    //-------------------------------------------------------------
    assign axi_bvalid_o  = resp_valid_w & resp_is_write_w & resp_is_last_w;
    assign axi_bresp_o   = 2'b0;
    assign axi_bid_o     = resp_id_w;

    assign axi_rvalid_o  = resp_valid_w & resp_is_read_w;
    assign axi_rresp_o   = 2'b0;
    assign axi_rid_o     = resp_id_w;
    assign axi_rlast_o   = resp_is_last_w;

    assign resp_accept_w    = (axi_rvalid_o & axi_rready_i) | 
                              (axi_bvalid_o & axi_bready_i) |
                              (resp_valid_w & resp_is_write_w & !resp_is_last_w); // Ignore write resps mid burst
end
//-----------------------------------------------------------------
// Direct response (latency = 0)
//-----------------------------------------------------------------
else
begin
    reg bvalid_q;
    reg rvalid_q;

    always @ (posedge clk_i )
    if (rst_i)
        bvalid_q <= 1'b0;
    else if (axi_bvalid_o && ~axi_bready_i)
        bvalid_q <= 1'b1;
    else if (axi_bready_i)
        bvalid_q <= 1'b0;

    always @ (posedge clk_i )
    if (rst_i)
        rvalid_q <= 1'b0;
    else if (axi_rvalid_o && ~axi_rready_i)
        rvalid_q <= 1'b1;
    else if (axi_rready_i)
        rvalid_q <= 1'b0;

    assign axi_bvalid_o = bvalid_q | (resp_is_write_w & resp_is_last_w & outport_ack_i);
    assign axi_bid_o    = resp_id_w;
    assign axi_bresp_o  = 2'b0;

    assign axi_rvalid_o = rvalid_q | (resp_is_read_w & outport_ack_i);
    assign axi_rid_o    = resp_id_w;
    assign axi_rresp_o  = 2'b0;

    assign output_busy_w = (axi_bvalid_o & ~axi_bready_i) | (axi_rvalid_o & ~axi_rready_i);

    //-------------------------------------------------------------
    // Read resp skid
    //-------------------------------------------------------------
    reg         rbuf_valid_q;
    reg [31:0]  rbuf_data_q;
    reg         rbuf_last_q;

    always @ (posedge clk_i )
    if (rst_i)
    begin
        rbuf_valid_q  <= 1'b0;
        rbuf_data_q   <= 32'b0;
    end
    // Response skid buffer
    else if (axi_rvalid_o && !axi_rready_i)
    begin
        rbuf_valid_q <= 1'b1;
        rbuf_data_q  <= axi_rdata_o;
    end
    else
        rbuf_valid_q <= 1'b0;

    assign axi_rdata_o   = rbuf_valid_q ? rbuf_data_q : outport_read_data_i;
    assign axi_rlast_o   = resp_is_last_w;

    assign resp_accept_w    = (axi_rvalid_o & axi_rready_i) | 
                              (axi_bvalid_o & axi_bready_i) |
                              (outport_ack_i & resp_is_write_w & !resp_is_last_w); // Ignore write resps mid burst
end
endgenerate

//-------------------------------------------------------------------
// Stats
//-------------------------------------------------------------------
`ifdef verilator
reg [31:0] stats_rd_singles_q;
reg [31:0] stats_wr_singles_q;

always @ (posedge clk_i )
if (rst_i)
    stats_rd_singles_q   <= 32'b0;
else if (axi_arvalid_i && axi_arready_o && axi_arlen_i == 8'b0)
    stats_rd_singles_q   <= stats_rd_singles_q + 32'd1;

always @ (posedge clk_i )
if (rst_i)
    stats_wr_singles_q   <= 32'b0;
else if (axi_awvalid_i && axi_awready_o && axi_awlen_i == 8'b0)
    stats_wr_singles_q   <= stats_wr_singles_q + 32'd1;

`endif

endmodule

//-----------------------------------------------------------------
// FIFO
//-----------------------------------------------------------------
module l2_cache_inport_fifo2

//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
    parameter WIDTH   = 8,
    parameter DEPTH   = 4,
    parameter ADDR_W  = 2
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Inputs
     input               clk_i
    ,input               rst_i
    ,input  [WIDTH-1:0]  data_in_i
    ,input               push_i
    ,input               pop_i

    // Outputs
    ,output [WIDTH-1:0]  data_out_o
    ,output              accept_o
    ,output              valid_o
);

//-----------------------------------------------------------------
// Local Params
//-----------------------------------------------------------------
localparam COUNT_W = ADDR_W + 1;

//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
reg [WIDTH-1:0]         ram [DEPTH-1:0];
reg [ADDR_W-1:0]        rd_ptr;
reg [ADDR_W-1:0]        wr_ptr;
reg [COUNT_W-1:0]       count;

//-----------------------------------------------------------------
// Sequential
//-----------------------------------------------------------------
always @ (posedge clk_i )
if (rst_i)
begin
    count   <= {(COUNT_W) {1'b0}};
    rd_ptr  <= {(ADDR_W) {1'b0}};
    wr_ptr  <= {(ADDR_W) {1'b0}};
end
else
begin
    // Push
    if (push_i & accept_o)
    begin
        ram[wr_ptr] <= data_in_i;
        wr_ptr      <= wr_ptr + 1;
    end

    // Pop
    if (pop_i & valid_o)
        rd_ptr      <= rd_ptr + 1;

    // Count up
    if ((push_i & accept_o) & ~(pop_i & valid_o))
        count <= count + 1;
    // Count down
    else if (~(push_i & accept_o) & (pop_i & valid_o))
        count <= count - 1;
end

//-------------------------------------------------------------------
// Combinatorial
//-------------------------------------------------------------------
/* verilator lint_off WIDTH */
assign accept_o   = (count != DEPTH);
assign valid_o    = (count != 0);
/* verilator lint_on WIDTH */

assign data_out_o = ram[rd_ptr];



endmodule
