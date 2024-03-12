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



module fifo(
            clk,
            nreset_i,
            data_i,
            data_i_valid,
            data_i_ready,
            data_o,
            data_o_valid,
            data_o_ready
        );

//------------------------------------------------------------------
//	                   PARAMETERS 
//------------------------------------------------------------------

parameter DATA_WIDTH = 32;
parameter FIFO_DEPTH = 8; //Assumed to be power of 2

localparam IDX_WIDTH = $clog2(FIFO_DEPTH);
localparam IDLE = 2'b00, READ_ONLY = 2'b01, WRITE_ONLY = 2'b10, READ_WRITE = 2'b11;
localparam READY = 2'b00, ALMOST_FULL = 2'b01, FULL =  2'b10;

//------------------------------------------------------------------
//	                   INPUT/OUTPUT PORTS
//------------------------------------------------------------------

input                       clk, nreset_i;

// Data In
input [DATA_WIDTH-1:0]      data_i;
input                       data_i_valid;
output                      data_i_ready;
//Data Out
output [DATA_WIDTH-1:0]     data_o;
output                      data_o_valid;
input                       data_o_ready;

//------------------------------------------------------------------
//	                   REGISTERS
//------------------------------------------------------------------

reg     [DATA_WIDTH-1:0]    regfile     [FIFO_DEPTH-1:0];
reg     [IDX_WIDTH-1:0]     head, tail;
reg     [1:0]               state;

reg     [DATA_WIDTH-1:0]    data_o_r;
reg                         data_o_valid_r, data_i_ready_r;
//------------------------------------------------------------------
//	                   WIRES 
//------------------------------------------------------------------

// Head Tail chase has two cases: (1) one where head is greater than tail and (2) vice versa
wire                        head_greater_than_tail = (head < tail)? 1'b0:1'b1;

// Distance between the tail and the end of the FIFO
wire    [IDX_WIDTH-1:0]     tail_offset = FIFO_DEPTH - tail;

// Distance between head and tail (applicable in case 1)
wire    [IDX_WIDTH-1:0]     head_tail_distance = head - tail;

// In case 1, head_tail_distance directly gives occupancy, in case (2) offset needs to be added to head.
wire    [IDX_WIDTH-1:0]     occupancy = (head_greater_than_tail)? head_tail_distance :
                                        (head + tail_offset);

// Empty FIFO
wire                        empty = ((occupancy == 1'b0)&&(state != FULL))? 1'b1:1'b0;

// Four events: Only read, only write, both or none
wire                        read_event = ~empty & data_o_ready;
wire                        write_event = data_i_valid & (state != FULL);
wire [1:0]                  event_cur = {write_event, read_event};

// Almost full refers to FIFO full if another data is written
    // Case 1, when head greater than tail (hgtt) - Distance is 2
wire                        almost_full_hgtt = (head_tail_distance == FIFO_DEPTH-2)? 1'b1 : 1'b0;
    // Case 2, when ~hgtt. Head is 0 and tail offset is 1, or head is 1 and tail offset is 0
wire                        almost_full_hgtt_n = ((head + tail_offset) == FIFO_DEPTH-2)? 1'b1: 1'b0;
    // Mux the above two to get the almost full
wire                        almost_full = (head_greater_than_tail) ? almost_full_hgtt : almost_full_hgtt_n;

// When will the FIFO be full: when it is almost full and there is only write (no read)
wire                        fifo_will_be_full = almost_full & data_i_valid & ~data_o_ready;

//------------------------------------------------------------------
//	                   SEQUENTIAL LOGIC
//------------------------------------------------------------------

// State Machine for FIFO status
always @(posedge clk or negedge nreset_i) begin
    if(~nreset_i) begin
        state <= READY;
    end
    else begin
        case(state)

        READY: 
            state <= (almost_full)? ALMOST_FULL : READY;
        ALMOST_FULL:
            state <= (event_cur == WRITE_ONLY)? FULL : 
                        ((event_cur == READ_ONLY)? READY : ALMOST_FULL);
        FULL:
            state <= (event_cur == READ_ONLY)? ALMOST_FULL : FULL;

        endcase
    end
end

// ready is pulled low if - (1) Almost full and valid input, or already full
always @(posedge clk or negedge nreset_i) begin
    if(~nreset_i) begin
        data_i_ready_r <= 1'b1;
    end
    else begin
        if((state == ALMOST_FULL) && (event_cur == WRITE_ONLY))
            data_i_ready_r <= 1'b0;
        else if((state == FULL) & (event_cur == READ_ONLY))
            data_i_ready_r <= 1'b1;
    end
end

// If the data out ready is asserted high, we send the data
always @(posedge clk)
    if(read_event)
        data_o_r <= regfile[tail];

// Data out valid is asserted high whenever we can read out
always @(posedge clk or negedge nreset_i) begin
    if(~nreset_i) begin
        data_o_valid_r <= 1'b0;
    end
    else begin
        data_o_valid_r <= read_event;
    end
end

// Tail is updated as the data is read
always @(posedge clk or negedge nreset_i) begin
    if(~nreset_i) begin
        tail <= {IDX_WIDTH{1'b0}};
    end
    else begin
        // Wrapping counter
        if(read_event)
            tail <= tail + 1'b1;
    end
end

// Data is always accepted (assuming the source has checked ready before dispatch)
// Head is updated on every write event
always @(posedge clk or negedge nreset_i) begin
    if(~nreset_i) begin
        head <= {IDX_WIDTH{1'b0}};
    end
    else begin
        // Wrapping counter
        if(write_event)
            head <= head + 1'b1;
    end
end

// Write the data
always @(posedge clk) begin
    if(write_event)
        regfile[head] <= data_i;
end


//------------------------------------------------------------------
//	                Assign Outputs
//------------------------------------------------------------------

assign data_o = data_o_r;
assign data_o_valid = data_o_valid_r;
assign data_i_ready = data_i_ready_r;


endmodule
