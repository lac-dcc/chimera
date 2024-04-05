// 
// Author: Kartik Hegde (kartikhegde.net)
//
// Copyright (c) 2019 Authors of "Buffets: An Efficient and Composable Storage Idiom for Explicit Decoupled Data
// Orchestration".
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
// Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



`include "buffet_defines.v"

module buffet(
			clk,
			nreset_i,
            // Read Port
            read_data,
            read_data_ready,
            read_data_valid,
            read_idx,
            read_idx_valid,
            read_idx_ready,
            read_will_update,
            // Write Port
            push_data,
            push_data_valid,
            push_data_ready,
            //Update Port
            update_data,
            update_data_valid,
            update_idx,
            update_idx_valid,
            update_ready,
            update_receive_ack,
            // Shrink Port
            is_shrink,
            // Credits
            credit_ready,
            credit_out,
            credit_valid

);
 
	parameter IDX_WIDTH     = `IDX_WIDTH; // Index width
	parameter DATA_WIDTH    = `DATA_WIDTH; // Data width
 
	// If this is 0, the in-place update path will be
	// statically removed (only Fill writes the RAM)
	// This would reduce hardware cost.
	parameter SUPPORTS_UPDATE = `SUPPORTS_UPDATE;
 
	// If this is 0, Fill and Update data will
	// share a single arbitrated RAM write port.
	// This could reduce hardware cost, but also
	// can degrade performace.
	// Because of buffet semantics this will never introduce deadlocks.
	// TODO: control over arbitration fairness.
	parameter SEPARATE_WRITE_PORTS = `SEPARATE_WRITE_PORTS;
 
    input                   clk, nreset_i;
 
	// Send credits to producer
	// Matches FIFO fills.
	output [IDX_WIDTH-1:0]  credit_out;
	output                  credit_valid;
	input                   credit_ready;
 
	// Operation: Fill(Data) -> void;
	// Matches FIFO fills.
	input  [DATA_WIDTH-1:0] push_data;
	input                   push_data_valid;
    output                  push_data_ready;
    // Asserted to 1 as producer will not send w/o credit.
 
	// Operation: Read(Index, bool) -> Data
	// Read closely matches scratchpads, but with index relative to the oldest element instead of absolute address. Additionally the "read_will_update" flag is used to indicate if the data will be modified in place. Subsequent reads to the same index will block until the RAW hazard is cleared by the update completing.
	// Read response matches scratchpad. However read responses may be
	// additionally delayed until fill and update hazards have cleared.
	// No response for shrinks.
	input  [IDX_WIDTH-1:0]  read_idx;
	input                   read_idx_valid;
    output                  read_idx_ready;
	input                   read_will_update;
	output [DATA_WIDTH-1:0] read_data;
	output                  read_data_valid;
	input                   read_data_ready;
 
	// Operation: Shrink(Size) -> void
	// Shrinks share the same port as read in order to maintain ordering.
    // read_idx will be considered as shrink size.
    input                   is_shrink;

	// Operation: Update(Index, Data) -> void;
	// Closely resembles scratchpad write but with relative index, and
	// separate valid for idx/data allows for potentially distinct producers
	input  [IDX_WIDTH-1:0]  update_idx;
	input                   update_idx_valid;
	input  [DATA_WIDTH-1:0] update_data;
	input                   update_data_valid;
    output                  update_ready;
    output                  update_receive_ack;
	// Update is always ready since there was a proceeding Read() to same index.
	// Request is accepted as soon as both are valid.
 
//------------------------------------------------------------------
//	                    WIRES/REGS
//------------------------------------------------------------------
 
wire    [IDX_WIDTH-1:0]     read_idx_fifo, update_idx_fifo;
wire    [DATA_WIDTH-1:0]    push_data_fifo, update_data_fifo;
wire                        read_idx_fifo_valid, read_idx_buffet_ready, read_will_update_fifo, is_shrink_fifo;
wire                        push_data_fifo_valid, update_idx_fifo_valid, update_buffet_ready, read_data_fifo_ready;

wire    [IDX_WIDTH-1:0]     araddr_buffet, waddr0_buffet, waddr1_buffet;
wire    [DATA_WIDTH-1:0]    read_data_buffet, wdata0_buffet, wdata1_buffet;
wire                        arvalid_buffet, wvalid0_buffet, wvalid1_buffet, read_data_buffet_valid;

reg                         update_receive_ack_r;

//------------------------------------------------------------------
//	                    INSTANTIATIONS
//------------------------------------------------------------------


// We will adda FIFO to every Request/Responnse port for better throughput

fifo    
        #(
            .DATA_WIDTH(IDX_WIDTH+2),
            .FIFO_DEPTH(`READREQ_FIFO_DEPTH)
        )
        u_channel_readreq
        (
            .clk(clk),
            .nreset_i(nreset_i),
            .data_i({read_idx, read_will_update, is_shrink}),
            .data_i_valid(read_idx_valid),
            .data_i_ready(read_idx_ready),
            .data_o({read_idx_fifo, read_will_update_fifo, is_shrink_fifo}),
            .data_o_valid(read_idx_fifo_valid),
            .data_o_ready(read_idx_buffet_ready)
        );


fifo    
        #(
            .DATA_WIDTH(DATA_WIDTH),
            .FIFO_DEPTH(`READRESP_FIFO_DEPTH)
        )
        u_channel_readresp
        (
            .clk(clk),
            .nreset_i(nreset_i),
            .data_i(read_data_buffet),
            .data_i_valid(read_data_buffet_valid),
            .data_i_ready(read_data_fifo_ready),
            .data_o(read_data),
            .data_o_valid(read_data_valid),
            .data_o_ready(read_data_ready)
        );

fifo    
        #(
            .DATA_WIDTH(IDX_WIDTH+DATA_WIDTH),
            .FIFO_DEPTH(`UPDATE_FIFO_DEPTH)
        )
        u_channel_update
        (
            .clk(clk),
            .nreset_i(nreset_i),
            .data_i({update_data, update_idx}),
            .data_i_valid(update_idx_valid & update_data_valid),
            .data_i_ready(),
            .data_o({update_data_fifo, update_idx_fifo}),
            .data_o_valid(update_idx_fifo_valid),
            .data_o_ready(update_buffet_ready)
        );

fifo    
        #(
            .DATA_WIDTH(DATA_WIDTH),
            .FIFO_DEPTH(`PUSH_FIFO_DEPTH)
        )
        u_channel_push
        (
            .clk(clk),
            .nreset_i(nreset_i),
            .data_i(push_data),
            .data_i_valid(push_data_valid),
            .data_i_ready(push_data_ready),
            .data_o(push_data_fifo),
            .data_o_valid(push_data_fifo_valid),
            .data_o_ready(1'b1)
        );

//TODO Add a backpressure from the consumer for the read

// The Buffet Controller
buffet_control 
            #(
            .DATA_WIDTH(DATA_WIDTH),
            .ADDR_WIDTH(IDX_WIDTH),
            .SIZE(`SIZE)
            )
            u_control
            (
            .clk(clk),
            .nreset_i(nreset_i),
            // read index input and output
            .read_idx_i(read_idx_fifo),
            .read_idx_valid_i(read_idx_fifo_valid),
            .read_data_ready_i(read_data_fifo_ready),
            .read_idx_o(araddr_buffet),
            .read_idx_valid_o(arvalid_buffet),
            .read_idx_ready_o(read_idx_buffet_ready),
            // read controls
            .read_will_update(read_will_update_fifo),
            .read_is_shrink(is_shrink_fifo),
            // Data pushes
            .push_data_i(push_data_fifo),
            .push_data_valid_i(push_data_fifo_valid),
            .push_data_ready(),
            .push_data_o(wdata0_buffet),
            .push_idx_o(waddr0_buffet),
            .push_data_valid_o(wvalid0_buffet),
            // Updates
            .update_data_i(update_data_fifo),
            .update_idx_i(update_idx_fifo),
            .update_valid_i(update_idx_fifo_valid),
            .update_data_o(wdata1_buffet),
            .update_idx_o(waddr1_buffet),
            .update_valid_o(wvalid1_buffet),
            .update_ready_o(update_buffet_ready),
            //Credits
            .credit_ready(credit_ready),
            .credit_out(credit_out),
            .credit_valid(credit_valid)

            );

// RAM
dpram 	
			#(
            .ADDR_WIDTH(IDX_WIDTH),
            .DATA_WIDTH(DATA_WIDTH),
			.SEPARATE_WRITE_PORTS(SEPARATE_WRITE_PORTS)
			)
            u_dpram
			(
			.CLK(clk),
			.RESET(nreset_i),
			.ARADDR(araddr_buffet),
			.ARVALID(arvalid_buffet),
			.WADDR0(waddr0_buffet),
			.WVALID0(wvalid0_buffet),
			.WADDR1(waddr1_buffet),
			.WVALID1(wvalid1_buffet),
			.WDATA0(wdata0_buffet),
			.WDATA1(wdata1_buffet),
			.RDATA(read_data_buffet),
			.RVALID(read_data_buffet_valid)
			);


//------------------------------------------------------------------
//	                   SEQUENTIAL LOGIC 
//------------------------------------------------------------------

always @(posedge clk or negedge nreset_i) begin
    if(~nreset_i) begin
        update_receive_ack_r <= 1'b0;
    end
    else begin
        update_receive_ack_r <= update_idx_valid & update_data_valid;
    end
end

//------------------------------------------------------------------
//	                   ASSIGN OUTPUTS
//------------------------------------------------------------------
assign update_receive_ack = update_receive_ack_r;

endmodule
