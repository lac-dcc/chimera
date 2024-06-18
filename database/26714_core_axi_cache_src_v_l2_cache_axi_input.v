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
module l2_cache_axi_input
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
     parameter DATA_W = 32
    ,parameter STRB_W = 4
    ,parameter ID_W   = 4
    ,parameter RW_ARB = 1  // Arbitrate between reads and writes
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
     input                clk_i
    ,input                rst_i

    // AXI
    ,input                axi_awvalid_i
    ,input  [ 31:0]       axi_awaddr_i
    ,input  [ID_W-1:0]    axi_awid_i
    ,input  [  7:0]       axi_awlen_i
    ,input  [  1:0]       axi_awburst_i
    ,input                axi_wvalid_i
    ,input  [DATA_W-1:0]  axi_wdata_i
    ,input  [STRB_W-1:0]  axi_wstrb_i
    ,input                axi_wlast_i
    ,input                axi_arvalid_i
    ,input  [ 31:0]       axi_araddr_i
    ,input  [ID_W-1:0]    axi_arid_i
    ,input  [  7:0]       axi_arlen_i
    ,input  [  1:0]       axi_arburst_i
    ,output               axi_awready_o
    ,output               axi_wready_o
    ,output               axi_arready_o

    // Write
    ,output               wr_valid_o
    ,input                wr_accept_i
    ,output [ 31:0]       wr_addr_o
    ,output [ID_W-1:0]    wr_id_o
    ,output [DATA_W-1:0]  wr_data_o
    ,output [STRB_W-1:0]  wr_strb_o
    ,output               wr_last_o

    // Read
    ,output               rd_valid_o
    ,input                rd_accept_i
    ,output [ 31:0]       rd_addr_o
    ,output [ID_W-1:0]    rd_id_o
    ,output               rd_last_o
);

//-----------------------------------------------------------------
// ffs: Find first set (2 input)
//-----------------------------------------------------------------
function [1:0] ffs;
    input [1:0] request;
begin
    ffs[0] = request[0];
    ffs[1] = ffs[0] | request[1];
end
endfunction

//-----------------------------------------------------------------
// Arbitration (optional)
//-----------------------------------------------------------------
wire rd_enable_w;
wire rd_request_w;
wire wr_enable_w;
wire wr_request_w;

generate
if (RW_ARB)
begin
    reg hold_q;

    // Hold the arbitration if in the middle of a burst transfer
    // or if the transfer is not accepted.
    always @ (posedge clk_i )
    if (rst_i)
        hold_q <= 1'b0;
    else if ((wr_valid_o && (!wr_accept_i || !wr_last_o)) || 
             (rd_valid_o && (!rd_accept_i || !rd_last_o)))
        hold_q <= 1'b1;
    else if ((wr_valid_o && wr_last_o && wr_accept_i) ||
             (rd_valid_o && rd_last_o && rd_accept_i))
        hold_q <= 1'b0;

    wire [1:0] request_w = {rd_request_w, wr_request_w};

    wire [1:0] req_ffs_masked_w;
    wire [1:0] req_ffs_unmasked_w;
    wire [1:0] req_ffs_w;

    reg  [1:0] mask_next_q;
    reg  [1:0] grant_last_q;
    wire [1:0] grant_new_w;
    wire [1:0] grant_w;

    assign req_ffs_masked_w   = ffs(request_w & mask_next_q);
    assign req_ffs_unmasked_w = ffs(request_w);

    assign req_ffs_w = (|req_ffs_masked_w) ? req_ffs_masked_w : req_ffs_unmasked_w;

    always @ (posedge clk_i )
    if (rst_i)
    begin
        mask_next_q  <= {2{1'b1}};
        grant_last_q <= 2'b0;
    end
    else
    begin
        if (~hold_q)
            mask_next_q <= {req_ffs_w[0:0], 1'b0};
        
        grant_last_q <= grant_w;
    end

    assign grant_new_w = req_ffs_w ^ {req_ffs_w[0:0], 1'b0};
    assign grant_w     = hold_q ? grant_last_q : grant_new_w;

    assign {rd_enable_w, wr_enable_w} = grant_w;
end
else
begin
    assign rd_enable_w = 1'b1;
    assign wr_enable_w = 1'b1;
end
endgenerate

wire rd_accept_w = rd_enable_w & rd_accept_i;
wire wr_accept_w = wr_enable_w & wr_accept_i;

//-----------------------------------------------------------------
// Write address skid buffer
//-----------------------------------------------------------------
reg             awvalid_q;
reg [31:0]      awaddr_q;
reg [1:0]       awburst_q;
reg [7:0]       awlen_q;
reg [ID_W-1:0]  awid_q;

wire            awvalid_w = awvalid_q | axi_awvalid_i;
wire [31:0]     awaddr_w  = awvalid_q ? awaddr_q  : axi_awaddr_i;
wire [1:0]      awburst_w = awvalid_q ? awburst_q : axi_awburst_i;
wire [7:0]      awlen_w   = awvalid_q ? awlen_q   : axi_awlen_i;
wire [ID_W-1:0] awid_w    = awvalid_q ? awid_q    : axi_awid_i;

reg [31:0]      awaddr_r;

always @ *
begin
    awaddr_r = awaddr_w;

    // Last / single
    if (wr_valid_o && wr_last_o && wr_accept_w)
        awaddr_r = awaddr_w;
    // Middle of burst
    else if (wr_valid_o && wr_accept_w)
    begin
        case (awburst_w)
        2'd0: // FIXED
            awaddr_r = awaddr_w;
        2'd2: // WRAP
            awaddr_r = (awaddr_w & ~((DATA_W/8)-1)) | ((awaddr_w + (DATA_W/8)) & ((DATA_W/8)-1));
        default: // INCR
            awaddr_r = awaddr_w + (DATA_W/8);
        endcase
    end
end

always @ (posedge clk_i )
if (rst_i)
    awaddr_q <= 32'b0;
else
    awaddr_q <= awaddr_r;

always @ (posedge clk_i )
if (rst_i)
    awburst_q <= 2'b01;
else if (axi_awvalid_i && axi_awready_o)
    awburst_q <= axi_awburst_i;

always @ (posedge clk_i )
if (rst_i)
    awlen_q <= 8'b0;
else if (axi_awvalid_i && axi_awready_o)
    awlen_q <= axi_awlen_i;

always @ (posedge clk_i )
if (rst_i)
    awid_q <= {ID_W{1'b0}};
else if (axi_awvalid_i && axi_awready_o)
    awid_q <= axi_awid_i;

always @ (posedge clk_i )
if (rst_i)
    awvalid_q <= 1'b0;
else if (wr_valid_o && wr_last_o && wr_accept_w)
    awvalid_q <= 1'b0;
else if (axi_awvalid_i)
    awvalid_q <= 1'b1;

assign axi_awready_o = ~awvalid_q;

//-----------------------------------------------------------------
// Write data skid buffer
//-----------------------------------------------------------------
reg               wvalid_q;
reg [DATA_W-1:0]  wdata_q;
reg [STRB_W-1:0]  wstrb_q;
reg               wlast_q;

wire              wvalid_w = wvalid_q | axi_wvalid_i;
wire [DATA_W-1:0] wdata_w  = wvalid_q ? wdata_q : axi_wdata_i;
wire [STRB_W-1:0] wstrb_w  = wvalid_q ? wstrb_q : axi_wstrb_i;
wire              wlast_w  = wvalid_q ? wlast_q : axi_wlast_i;

always @ (posedge clk_i )
if (rst_i)
    wdata_q <= {DATA_W{1'b0}};
else if (axi_wvalid_i && axi_wready_o)
    wdata_q <= axi_wdata_i;

always @ (posedge clk_i )
if (rst_i)
    wstrb_q <= {STRB_W{1'b0}};
else if (axi_wvalid_i && axi_wready_o)
    wstrb_q <= axi_wstrb_i;

always @ (posedge clk_i )
if (rst_i)
    wlast_q <= 1'b0;
else if (axi_wvalid_i && axi_wready_o)
    wlast_q <= axi_wlast_i;

always @ (posedge clk_i )
if (rst_i)
    wvalid_q <= 1'b0;
else if (wr_valid_o && wr_accept_w)
    wvalid_q <= 1'b0;
else if (axi_wvalid_i)
    wvalid_q <= 1'b1;

assign axi_wready_o = ~wvalid_q;

//-----------------------------------------------------------------
// Write Output
//-----------------------------------------------------------------
assign wr_request_w = awvalid_w & wvalid_w; 
assign wr_valid_o   = wr_request_w & wr_enable_w;
assign wr_addr_o    = awaddr_w;
assign wr_id_o      = awid_w;
assign wr_data_o    = wdata_w;
assign wr_strb_o    = wstrb_w;
assign wr_last_o    = wlast_w;

//-----------------------------------------------------------------
// Read address skid buffer
//-----------------------------------------------------------------
reg             arvalid_q;
reg [31:0]      araddr_q;
reg [1:0]       arburst_q;
reg [7:0]       arlen_q;
reg [ID_W-1:0]  arid_q;

wire            arvalid_w = arvalid_q | axi_arvalid_i;
wire [31:0]     araddr_w  = arvalid_q ? araddr_q  : axi_araddr_i;
wire [1:0]      arburst_w = arvalid_q ? arburst_q : axi_arburst_i;
wire [7:0]      arlen_w   = arvalid_q ? arlen_q   : axi_arlen_i;
wire [ID_W-1:0] arid_w    = arvalid_q ? arid_q    : axi_arid_i;

reg [31:0]      araddr_r;

always @ *
begin
    araddr_r = araddr_w;

    // Last / single
    if (rd_valid_o && rd_last_o && rd_accept_w)
        araddr_r = araddr_w;
    // Middle of burst
    else if (rd_valid_o && rd_accept_w)
    begin
        case (arburst_w)
        2'd0: // FIXED
            araddr_r = araddr_w;
        2'd2: // WRAP
            araddr_r = (araddr_w & ~((DATA_W/8)-1)) | ((araddr_w + (DATA_W/8)) & ((DATA_W/8)-1));
        default: // INCR
            araddr_r = araddr_w + (DATA_W/8);
        endcase
    end
end

always @ (posedge clk_i )
if (rst_i)
    araddr_q <= 32'b0;
else
    araddr_q <= araddr_r;

always @ (posedge clk_i )
if (rst_i)
    arburst_q <= 2'b01;
else if (axi_arvalid_i && axi_arready_o)
    arburst_q <= axi_arburst_i;

always @ (posedge clk_i )
if (rst_i)
    arlen_q <= 8'b0;
else if (axi_arvalid_i && axi_arready_o)
    arlen_q <= axi_arlen_i;

always @ (posedge clk_i )
if (rst_i)
    arid_q <= {ID_W{1'b0}};
else if (axi_arvalid_i && axi_arready_o)
    arid_q <= axi_arid_i;

always @ (posedge clk_i )
if (rst_i)
    arvalid_q <= 1'b0;
else if (rd_valid_o && rd_last_o && rd_accept_w)
    arvalid_q <= 1'b0;
else if (rd_valid_o && rd_accept_w)
    arvalid_q <= 1'b1;

assign axi_arready_o = rd_accept_w & ~arvalid_q;

//-----------------------------------------------------------------
// Read burst tracking
//-----------------------------------------------------------------
reg [7:0] rd_idx_q;

always @ (posedge clk_i )
if (rst_i)
    rd_idx_q <= 8'b0;
else if (rd_valid_o && rd_last_o && rd_accept_w)
    rd_idx_q <= 8'b0;
else if (rd_valid_o && rd_accept_w)
    rd_idx_q <= rd_idx_q + 8'd1;

//-----------------------------------------------------------------
// Read Output
//-----------------------------------------------------------------
assign rd_request_w = arvalid_w;
assign rd_valid_o   = rd_request_w & rd_enable_w;
assign rd_addr_o    = araddr_w;
assign rd_id_o      = arid_w;
assign rd_last_o    = arlen_w == rd_idx_q;

endmodule
