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

module spirom_axi
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
     parameter WVALID_AWAIT_AWVALID = 1
    ,parameter COMPLIANT        = 1
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
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
    ,input           outport_cready_i
    ,input           outport_cburstok_i
    ,input           outport_rvalid_i
    ,input           outport_rwrite_i
    ,input  [ 31:0]  outport_rdata_i
    ,input  [  1:0]  outport_rresp_i
    ,input  [  3:0]  outport_rid_i
    ,input           outport_rlast_i

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
);



localparam ADDR_FIFO_W = 32+4+3+8+1;
localparam DATA_FIFO_W = 32+4+1;

//-----------------------------------------------------------------
// Standard compliant conversion
//-----------------------------------------------------------------
generate
if (COMPLIANT)
begin
    wire addr_push_w;
    wire addr_accept_w;
    wire addr_valid_w;
    wire addr_pop_w;

    wire data_valid_w;
    wire data_pop_w;

    //-----------------------------------------------------------------
    // Write state tracking
    //-----------------------------------------------------------------
    reg  awvalid_q;
    wire wr_cmd_accepted_w  = (axi_awvalid_i && axi_awready_o) || awvalid_q;

    always @ (posedge clk_i or posedge rst_i)
    if (rst_i)
        awvalid_q <= 1'b0;
    else if (axi_awvalid_i && axi_awready_o && (!axi_wvalid_i || !axi_wlast_i || !axi_wready_o) && WVALID_AWAIT_AWVALID)
        awvalid_q <= 1'b1;
    else if (axi_wvalid_i && axi_wready_o && axi_wlast_i)
        awvalid_q <= 1'b0;

    //-----------------------------------------------------------------
    // Arbitrate R/W
    //-----------------------------------------------------------------
    reg turn_q;

    always @ (posedge clk_i or posedge rst_i)
    if (rst_i)
        turn_q <= 1'b0;
    else if (addr_push_w && addr_accept_w)
        turn_q <= ~turn_q;

    wire rd_src_w = turn_q ? axi_arvalid_i : (axi_arvalid_i & ~axi_awvalid_i);

    assign axi_arready_o = rd_src_w  & addr_accept_w & ~awvalid_q;
    assign axi_awready_o = ~rd_src_w & addr_accept_w & ~awvalid_q;

    assign addr_push_w   = (axi_arvalid_i | axi_awvalid_i) & ~awvalid_q;

    //-----------------------------------------------------------------
    // FIFO: Address
    //-----------------------------------------------------------------
    wire [ADDR_FIFO_W-1:0] addr_in_w = rd_src_w ? {1'b0, 1'b0, axi_arburst_i, axi_arid_i, axi_arlen_i, axi_araddr_i}:
                                                  {1'b1, 1'b0, axi_awburst_i, axi_awid_i, axi_awlen_i, axi_awaddr_i};
    wire [ADDR_FIFO_W-1:0] addr_out_w;

    spirom_axi_fifo2
    #(
        .WIDTH(ADDR_FIFO_W)
    )
    u_fifo_addr
    (
         .clk_i(clk_i)
        ,.rst_i(rst_i)

        ,.push_i(addr_push_w)
        ,.data_in_i(addr_in_w)
        ,.accept_o(addr_accept_w)

        ,.valid_o(addr_valid_w)
        ,.data_out_o(addr_out_w)
        ,.pop_i(addr_pop_w)
    );

    assign {outport_cwrite_o, outport_ctype_o, outport_cid_o, outport_clen_o, outport_caddr_o} = addr_out_w;

    //-----------------------------------------------------------------
    // First item tracking
    //-----------------------------------------------------------------
    reg out_first_q;

    always @ (posedge clk_i or posedge rst_i)
    if (rst_i)
        out_first_q <= 1'b1;
    else if (outport_cvalid_o && outport_clast_o && outport_cready_i)
        out_first_q <= 1'b1;
    else if (outport_cvalid_o && outport_cready_i)
        out_first_q <= 1'b0;

    //-----------------------------------------------------------------
    // Burst tracking
    //-----------------------------------------------------------------
    reg out_burst_q;

    always @ (posedge clk_i or posedge rst_i)
    if (rst_i)
        out_burst_q <= 1'b0;
    else if (outport_cvalid_o && outport_clast_o && outport_cready_i)
        out_burst_q <= 1'b0;
    else if (outport_cvalid_o && outport_cwrite_o && outport_clen_o != 8'b0 && outport_cready_i)
        out_burst_q <= 1'b1;

    assign outport_cvalid_o = addr_valid_w & (!outport_cwrite_o || data_valid_w);

    //-----------------------------------------------------------------
    // FIFO: Write data
    //-----------------------------------------------------------------
    wire data_accept_w;
    wire outport_clast_w;

    spirom_axi_fifo2
    #(
        .WIDTH(DATA_FIFO_W)
    )
    u_fifo_data
    (
         .clk_i(clk_i)
        ,.rst_i(rst_i)

        ,.push_i(axi_wvalid_i & axi_wready_o)
        ,.data_in_i({axi_wlast_i, axi_wstrb_i, axi_wdata_i})
        ,.accept_o(data_accept_w)

        ,.valid_o(data_valid_w)
        ,.data_out_o({outport_clast_w, outport_cstrb_o, outport_cdata_o})
        ,.pop_i(data_pop_w)
    );

    assign axi_wready_o     = (awvalid_q || !WVALID_AWAIT_AWVALID) ? data_accept_w : (axi_awready_o & data_accept_w);

    assign outport_cfirst_o = out_first_q;
    assign outport_clast_o  = outport_cwrite_o ? outport_clast_w : 1'b1;

    //-----------------------------------------------------------------
    // FIFO pop
    //-----------------------------------------------------------------
    assign addr_pop_w = (outport_cvalid_o & outport_clast_o  & outport_cready_i);
    assign data_pop_w = (outport_cvalid_o & outport_cwrite_o & outport_cready_i);

    //-----------------------------------------------------------------
    // Response
    //-----------------------------------------------------------------
    assign axi_rvalid_o = outport_rvalid_i & ~outport_rwrite_i;
    assign axi_rdata_o  = outport_rdata_i;
    assign axi_rresp_o  = outport_rresp_i;
    assign axi_rid_o    = outport_rid_i;
    assign axi_rlast_o  = outport_rlast_i;

    assign axi_bvalid_o = outport_rvalid_i & outport_rwrite_i;
    assign axi_bresp_o  = outport_rresp_i;
    assign axi_bid_o    = outport_rid_i;

    assign outport_rready_o = outport_rwrite_i ? axi_bready_i : axi_rready_i;
end
//-----------------------------------------------------------------
// Trivial conversion (for a simple well-behaved initiator)
//-----------------------------------------------------------------
else
begin
    //-----------------------------------------------------------------
    // Request
    //-----------------------------------------------------------------
    reg turn_q;

    always @ (posedge clk_i or posedge rst_i)
    if (rst_i)
        turn_q <= 1'b0;
    else if ((axi_arvalid_i && axi_arready_o) || (axi_wvalid_i && axi_wlast_i && axi_wready_o))
        turn_q <= ~turn_q;

    wire rd_src_w = turn_q ? axi_arvalid_i : (axi_arvalid_i & ~(axi_awvalid_i | axi_wvalid_i));

    assign outport_cvalid_o = axi_arvalid_i | axi_awvalid_i | axi_wvalid_i;
    assign outport_cwrite_o = ~rd_src_w;
    assign outport_ctype_o  = rd_src_w ? {1'b0, axi_arburst_i} : {1'b0, axi_awburst_i};
    assign outport_cid_o    = rd_src_w ? axi_arid_i : axi_awid_i;
    assign outport_clen_o   = rd_src_w ? axi_arlen_i : axi_awlen_i;
    assign outport_caddr_o  = rd_src_w ? axi_araddr_i : axi_awaddr_i;
    assign outport_cfirst_o = axi_arvalid_i | axi_awvalid_i;
    assign outport_cstrb_o  = axi_wstrb_i;
    assign outport_cdata_o  = axi_wdata_i;
    assign outport_clast_o  = rd_src_w ? 1'b1 : axi_wlast_i;

    assign axi_arready_o    =  rd_src_w & outport_cready_i;
    assign axi_awready_o    = ~rd_src_w & outport_cready_i;
    assign axi_wready_o     = ~rd_src_w & outport_cready_i;

    //-----------------------------------------------------------------
    // Response
    //-----------------------------------------------------------------
    assign axi_rvalid_o = outport_rvalid_i & ~outport_rwrite_i;
    assign axi_rdata_o  = outport_rdata_i;
    assign axi_rresp_o  = outport_rresp_i;
    assign axi_rid_o    = outport_rid_i;
    assign axi_rlast_o  = outport_rlast_i;

    assign axi_bvalid_o = outport_rvalid_i & outport_rwrite_i;
    assign axi_bresp_o  = outport_rresp_i;
    assign axi_bid_o    = outport_rid_i;

    assign outport_rready_o = outport_rwrite_i ? axi_bready_i : axi_rready_i;
end
endgenerate

endmodule

//-----------------------------------------------------------------
// FIFO
//-----------------------------------------------------------------
module spirom_axi_fifo2

//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
    parameter WIDTH   = 8,
    parameter DEPTH   = 2,
    parameter ADDR_W  = 1
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
