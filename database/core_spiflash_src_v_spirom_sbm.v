// This program was cloned from: https://github.com/ultraembedded/core_spiflash
// License: GNU Lesser General Public License v2.1

//-----------------------------------------------------------------
//                     SPI-Flash XIP Interface
//                              V0.2
//              github.com/ultraembedded/core_spiflash
//                       Copyright 2019-2021
//
//                 Email: admin@ultra-embedded.com
//
//                       License: LGPL
//-----------------------------------------------------------------
//
// This source file may be used and distributed without         
// restriction provided that this copyright statement is not    
// removed from the file and that any derivative work contains  
// the original copyright notice and the associated disclaimer. 
//
// This source file is free software; you can redistribute it   
// and/or modify it under the terms of the GNU Lesser General   
// Public License as published by the Free Software Foundation; 
// either version 2.1 of the License, or (at your option) any   
// later version.
//
// This source is distributed in the hope that it will be       
// useful, but WITHOUT ANY WARRANTY; without even the implied   
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      
// PURPOSE.  See the GNU Lesser General Public License for more 
// details.
//
// You should have received a copy of the GNU Lesser General    
// Public License along with this source; if not, write to the 
// Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
// Boston, MA  02111-1307  USA
//-----------------------------------------------------------------

module spirom_sbm
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
     parameter UNROLL_BURSTS    = 1
    ,parameter OUTSTANDING      = 4
    ,parameter OUTSTANDING_W    = 2
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           inport_cvalid_i
    ,input  [ 31:0]  inport_caddr_i
    ,input  [ 31:0]  inport_cdata_i
    ,input  [  3:0]  inport_cstrb_i
    ,input  [  3:0]  inport_cid_i
    ,input  [  7:0]  inport_clen_i
    ,input           inport_cwrite_i
    ,input           inport_cfirst_i
    ,input           inport_clast_i
    ,input  [  2:0]  inport_ctype_i
    ,input           inport_rready_i
    ,input           ram_accept_i
    ,input           ram_ack_i
    ,input           ram_error_i
    ,input  [ 31:0]  ram_read_data_i

    // Outputs
    ,output          inport_cready_o
    ,output          inport_cburstok_o
    ,output          inport_rvalid_o
    ,output          inport_rwrite_o
    ,output [ 31:0]  inport_rdata_o
    ,output [  1:0]  inport_rresp_o
    ,output [  3:0]  inport_rid_o
    ,output          inport_rlast_o
    ,output [  3:0]  ram_wr_o
    ,output          ram_rd_o
    ,output [  7:0]  ram_len_o
    ,output [ 31:0]  ram_addr_o
    ,output [ 31:0]  ram_write_data_o
);



wire          cvalid_w;
wire [ 31:0]  caddr_w;
wire [ 31:0]  cdata_w;
wire [  3:0]  cstrb_w;
wire [  3:0]  cid_w;
wire [  7:0]  clen_w;
wire          cwrite_w;
wire          cfirst_w;
wire          clast_w;
wire [  2:0]  ctype_w;
wire          rready_w;
wire          cready_w;
wire          rvalid_w;
wire          rwrite_w;
wire [ 31:0]  rdata_w;
wire [  3:0]  rid_w;
wire [  1:0]  rresp_w;
wire          rlast_w;

localparam BURST_FIXED = 2'd0;
localparam BURST_INCR  = 2'd1;
localparam BURST_WRAP  = 2'd2;

generate
if (UNROLL_BURSTS)
begin
    spirom_sbm_unroll
    u_unroll
    (
         .clk_i(clk_i)
        ,.rst_i(rst_i)

        ,.inport_cvalid_i(inport_cvalid_i)
        ,.inport_caddr_i(inport_caddr_i)
        ,.inport_cdata_i(inport_cdata_i)
        ,.inport_cstrb_i(inport_cstrb_i)
        ,.inport_cid_i(inport_cid_i)
        ,.inport_clen_i(inport_clen_i)
        ,.inport_cwrite_i(inport_cwrite_i)
        ,.inport_cfirst_i(inport_cfirst_i)
        ,.inport_clast_i(inport_clast_i)
        ,.inport_ctype_i(inport_ctype_i)
        ,.inport_rready_i(inport_rready_i)
        ,.inport_cready_o(inport_cready_o)
        ,.inport_cburstok_o(inport_cburstok_o)
        ,.inport_rvalid_o(inport_rvalid_o)
        ,.inport_rwrite_o(inport_rwrite_o)
        ,.inport_rdata_o(inport_rdata_o)
        ,.inport_rresp_o(inport_rresp_o)
        ,.inport_rid_o(inport_rid_o)
        ,.inport_rlast_o(inport_rlast_o)

        ,.outport_cvalid_o(cvalid_w)
        ,.outport_caddr_o(caddr_w)
        ,.outport_cdata_o(cdata_w)
        ,.outport_cstrb_o(cstrb_w)
        ,.outport_cid_o(cid_w)
        ,.outport_clen_o(clen_w)
        ,.outport_cwrite_o(cwrite_w)
        ,.outport_cfirst_o(cfirst_w)
        ,.outport_clast_o(clast_w)
        ,.outport_ctype_o(ctype_w)
        ,.outport_rready_o(rready_w)
        ,.outport_cready_i(cready_w)
        ,.outport_cburstok_i(1'b0)
        ,.outport_rvalid_i(rvalid_w)
        ,.outport_rwrite_i(rwrite_w)
        ,.outport_rdata_i(rdata_w)
        ,.outport_rresp_i(rresp_w)
        ,.outport_rid_i(rid_w)
        ,.outport_rlast_i(rlast_w)
    );
end
else
begin
    assign cvalid_w        = inport_cvalid_i;
    assign caddr_w         = inport_caddr_i;
    assign cdata_w         = inport_cdata_i;
    assign cstrb_w         = inport_cstrb_i;
    assign cid_w           = inport_cid_i;
    assign clen_w          = inport_clen_i;
    assign cwrite_w        = inport_cwrite_i;
    assign cfirst_w        = inport_cfirst_i;
    assign clast_w         = inport_clast_i;
    assign ctype_w         = inport_ctype_i;
    assign inport_cready_o = cready_w;

    assign inport_rvalid_o = rvalid_w;
    assign inport_rwrite_o = rwrite_w;
    assign inport_rdata_o  = rdata_w;
    assign inport_rid_o    = rid_w;
    assign inport_rresp_o  = rresp_w;
    assign inport_rlast_o  = rlast_w;
    assign rready_w        = inport_rready_i;
end
endgenerate

//-----------------------------------------------------------------
// Request tracking
//-----------------------------------------------------------------
wire req_space_w;

spirom_sbm_fifo
#(
     .WIDTH(1 + 1 + 4)
    ,.DEPTH(OUTSTANDING)
    ,.ADDR_W(OUTSTANDING_W)
)
u_requests
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    // Input
    ,.data_in_i({cwrite_w, clast_w, cid_w})
    ,.push_i(cvalid_w & ram_accept_i)
    ,.accept_o(req_space_w)

    // Output
    ,.valid_o()
    ,.pop_i(rvalid_w & rready_w)
    ,.data_out_o({rwrite_w, rlast_w, rid_w})
);

assign ram_addr_o       = caddr_w;
assign ram_write_data_o = cdata_w;
assign ram_rd_o         = cvalid_w & ~cwrite_w & req_space_w;
assign ram_wr_o         = (cvalid_w & cwrite_w & req_space_w) ? cstrb_w : 4'b0;
assign ram_len_o        = (ctype_w[1:0] == BURST_INCR) ? clen_w : 8'b0;

assign cready_w         = req_space_w & ram_accept_i;

//-----------------------------------------------------------------
// Response buffer
//-----------------------------------------------------------------
spirom_sbm_fifo
#(
     .WIDTH(32 + 2)
    ,.DEPTH(OUTSTANDING)
    ,.ADDR_W(OUTSTANDING_W)
)
u_response
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    // Input
    ,.data_in_i({1'b0, ram_error_i, ram_read_data_i})
    ,.push_i(ram_ack_i)
    ,.accept_o()

    // Output
    ,.valid_o(rvalid_w)
    ,.data_out_o({rresp_w, rdata_w})
    ,.pop_i(rready_w)
);

endmodule

module spirom_sbm_unroll
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           outport_cready_i
    ,input           outport_cburstok_i
    ,input           outport_rvalid_i
    ,input           outport_rwrite_i
    ,input  [ 31:0]  outport_rdata_i
    ,input  [  1:0]  outport_rresp_i
    ,input  [  3:0]  outport_rid_i
    ,input           outport_rlast_i
    ,input           inport_cvalid_i
    ,input  [ 31:0]  inport_caddr_i
    ,input  [ 31:0]  inport_cdata_i
    ,input  [  3:0]  inport_cstrb_i
    ,input  [  3:0]  inport_cid_i
    ,input  [  7:0]  inport_clen_i
    ,input           inport_cwrite_i
    ,input           inport_cfirst_i
    ,input           inport_clast_i
    ,input  [  2:0]  inport_ctype_i
    ,input           inport_rready_i

    // Outputs
    ,output          outport_cvalid_o
    ,output [ 31:0]  outport_caddr_o
    ,output [ 31:0]  outport_cdata_o
    ,output [  3:0]  outport_cstrb_o
    ,output [  3:0]  outport_cid_o
    ,output [  7:0]  outport_clen_o
    ,output          outport_cwrite_o
    ,output          outport_cfirst_o
    ,output          outport_clast_o
    ,output [  2:0]  outport_ctype_o
    ,output          outport_rready_o
    ,output          inport_cready_o
    ,output          inport_cburstok_o
    ,output          inport_rvalid_o
    ,output          inport_rwrite_o
    ,output [ 31:0]  inport_rdata_o
    ,output [  1:0]  inport_rresp_o
    ,output [  3:0]  inport_rid_o
    ,output          inport_rlast_o
);

localparam BURST_FIXED = 2'd0;
localparam BURST_INCR  = 2'd1;
localparam BURST_WRAP  = 2'd2;

//-------------------------------------------------------------
// next_addr
//-------------------------------------------------------------
function [31:0] next_addr;
    input [31:0] addr;
    input [1:0]  ctype;
    input [7:0]  clen;

    reg [31:0]   mask;
begin
    mask = 0;

    case (ctype)
    // Fixed
    BURST_FIXED: next_addr = addr;
    // Wrapping
    BURST_WRAP:
    begin
        case (clen)
        8'd0:      mask = 32'h03;
        8'd1:      mask = 32'h07;
        8'd3:      mask = 32'h0F;
        8'd7:      mask = 32'h1F;
        8'd15:     mask = 32'h3F;
        8'd31:     mask = 32'h7F;
        default:   mask = 32'hFF;
        endcase

        next_addr = (addr & ~mask) | ((addr + 4) & mask);
    end
    // Increment
    default: next_addr = addr + 4;
    endcase
end
endfunction

//-----------------------------------------------------------------
// Burst tracking
//-----------------------------------------------------------------
reg rd_burst_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    rd_burst_q <= 1'b0;
else if (outport_cvalid_o && outport_cready_i && !outport_clast_o)
    rd_burst_q <= ~outport_cwrite_o;
else if (outport_cvalid_o && outport_cready_i && outport_clast_o)
    rd_burst_q <= 1'b0;

reg burst_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    burst_q <= 1'b0;
else if (outport_cvalid_o && outport_cready_i)
    burst_q <= ~outport_clast_o;

reg [7:0] burst_idx_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    burst_idx_q <= 8'b0;
else if (outport_cvalid_o && !outport_clast_o && outport_cready_i)
    burst_idx_q <= burst_idx_q + 8'd1;
else if (outport_cvalid_o && outport_clast_o && outport_cready_i)
    burst_idx_q <= 8'b0;

//-----------------------------------------------------------------
// Address unroll
//-----------------------------------------------------------------
reg  [31:0] caddr_q;

always @ (posedge clk_i)
if (outport_cvalid_o && outport_cready_i)
    caddr_q <= next_addr(outport_caddr_o, outport_ctype_o[1:0], burst_q ? clen_q : inport_clen_i);

//-----------------------------------------------------------------
// Address details storage
//-----------------------------------------------------------------
reg  [3:0] cid_q;
reg  [2:0] ctype_q;
reg  [7:0] clen_q;
reg        cwrite_q;

always @ (posedge clk_i)
if (inport_cvalid_i && inport_cready_o)
    cid_q <= inport_cid_i;

always @ (posedge clk_i)
if (inport_cvalid_i && inport_cready_o)
    ctype_q <= inport_ctype_i;

always @ (posedge clk_i)
if (inport_cvalid_i && inport_cready_o)
    clen_q <= inport_clen_i;

always @ (posedge clk_i)
if (inport_cvalid_i && inport_cready_o)
    cwrite_q <= inport_cwrite_i;

//-----------------------------------------------------------------
// Request
//-----------------------------------------------------------------
assign outport_cvalid_o    = rd_burst_q ? 1'b1  : inport_cvalid_i;
assign outport_caddr_o     = burst_q ? caddr_q  : inport_caddr_i;
assign outport_cid_o       = burst_q ? cid_q    : inport_cid_i;
assign outport_clen_o      = burst_q ? 8'b0     : inport_clen_i;
assign outport_cwrite_o    = burst_q ? cwrite_q : inport_cwrite_i;
assign outport_ctype_o     = burst_q ? ctype_q  : inport_ctype_i;
assign outport_cdata_o     = inport_cdata_i;
assign outport_cstrb_o     = inport_cstrb_i;
assign outport_cfirst_o    = (burst_idx_q == 8'b0);
assign outport_clast_o     = burst_q ? (clen_q == burst_idx_q): (inport_clen_i == 8'b0);

assign inport_cready_o     = rd_burst_q ? 1'b0 : outport_cready_i;

//-----------------------------------------------------------------
// Response
//-----------------------------------------------------------------
assign inport_rvalid_o  = outport_rvalid_i ? (~outport_rwrite_i | outport_rlast_i) : 1'b0;
assign inport_rwrite_o  = outport_rwrite_i;
assign inport_rdata_o   = outport_rdata_i;
assign inport_rresp_o   = outport_rresp_i;
assign inport_rid_o     = outport_rid_i;
assign inport_rlast_o   = outport_rlast_i;

assign outport_rready_o = inport_rready_i | ~inport_rvalid_o;

assign inport_cburstok_o = 1'b1;

endmodule

//-----------------------------------------------------------------
// FIFO
//-----------------------------------------------------------------
module spirom_sbm_fifo

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
always @ (posedge clk_i or posedge rst_i)
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
