//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps
`default_nettype none

/*

axistream_forwarder.v

Right now, this is me writing some very unfocused Verilog while I figure out 
how to do this properly

The last big thing I need to figure out is fwd_done, and the rdy/rdy_ack 
handshaking. I will do that tomorrow.

TODOs from the code:
    - Disable aggressive fifo_full logic in pessimistic mode
    - Add bhand in pessimistic mode?
    - Compute fwd_TVALID based on internal counts, instead of another FIFO?

*/

`ifdef ICARUS_VERILOG
`include "fwd_width_adapter.v"
`define localparam parameter
`else /*For Vivado*/
`define localparam localparam
`endif

`define CLOG2(x) (\
   (((x) <= 2) ? 1 : \
   (((x) <= 4) ? 2 : \
   (((x) <= 8) ? 3 : \
   (((x) <= 16) ? 4 : \
   (((x) <= 32) ? 5 : \
   (((x) <= 64) ? 6 : \
   (((x) <= 128) ? 7 : \
   (((x) <= 256) ? 8 : \
   (((x) <= 512) ? 9 : \
   (((x) <= 1024) ? 10 : \
   (((x) <= 2048) ? 11 : \
   (((x) <= 4096) ? 12 : \
   (((x) <= 8192) ? 13 : \
   (((x) <= 16384) ? 14 : \
   (((x) <= 32768) ? 15 : \
   (((x) <= 65536) ? 16 : \
   -1)))))))))))))))))

module axistream_forwarder # (
    parameter SN_FWD_ADDR_WIDTH = 8,
    parameter SN_FWD_DATA_WIDTH = 64,
    parameter PACKMEM_ADDR_WIDTH = SN_FWD_ADDR_WIDTH,
    parameter PACKMEM_DATA_WIDTH = SN_FWD_DATA_WIDTH,
    parameter MEM_LAT = 2,
    parameter PLEN_WIDTH = 32,
    
    //Probably don't set these parameters
    parameter FIFO_ORDER = 4 //FIFO will have capacity 2^FIFO_ORDER
) (
    input wire clk,
    input wire rst,
    
    //AXI Stream interface
    output wire [SN_FWD_DATA_WIDTH-1:0] fwd_TDATA,
    output wire [SN_FWD_DATA_WIDTH/8-1:0] fwd_TKEEP,
    output wire fwd_TLAST,
    output wire fwd_TVALID,
    input wire fwd_TREADY,
    
    //Interface to parallel_cores
    output wire [PACKMEM_ADDR_WIDTH-1:0] fwd_addr,
    output wire fwd_rd_en,
    input wire [PACKMEM_DATA_WIDTH-1:0] fwd_rd_data,
    input wire fwd_rd_data_vld,
    input wire [PLEN_WIDTH-1:0] fwd_byte_len,
    
    output wire fwd_done,
    input wire rdy_for_fwd,
    output wire rdy_for_fwd_ack
);
    
    //Local parameters
    `localparam FIFO_DEPTH = 2**(FIFO_ORDER);
    `localparam ADDR_SHIFT = `CLOG2(SN_FWD_DATA_WIDTH/8);
    
    /**********************/
    /***Internal signals***/
    /**********************/
    
    //FIFO-RELATED SIGNALS
    //--------------------
    
    //FIFO queues
    reg [SN_FWD_DATA_WIDTH-1:0] TDATA_fifo[0:FIFO_DEPTH-1];
    reg [SN_FWD_DATA_WIDTH/8-1:0] TKEEP_fifo[0:FIFO_DEPTH-1];
    reg TLAST_fifo[0:FIFO_DEPTH-1];
    
    //Cant initialize regs inline, so use a for loop.
    genvar i;
    for (i = 0; i < FIFO_DEPTH; i = i + 1) begin
        initial TDATA_fifo[i] = 0;
        initial TKEEP_fifo[i] = 0;
        initial TLAST_fifo[i] = 0;
    end
    
    //TDATA_fifo uses the TDATA pointers
    reg [FIFO_ORDER-1:0] TDATA_wr_ptr = 0;
    reg [FIFO_ORDER-1:0] rd_ptr = 0;
    //Both TLAST_fifo and TKEEP_fifo use the TLAST write pointer, but use the
    //TDATA read pointer
    reg [FIFO_ORDER-1:0] TLAST_wr_ptr = 0;
    
    //Total number of elements in the FIFO, plus in-flight memory transactions
    reg [FIFO_ORDER-1:0] in_flight_cnt = 0; //This counts all "in-flight" flits
    //between the filter and the person receiving forwarded packets. It also 
    //represents the number of full or reserved spaces in the fifo
    reg [FIFO_ORDER-1:0] pending = 0; //This counts all flits that have reserved
    //space in the FIFO but we are still waiting for them to come out of the 
    //memory in the filter
    
    //Example: suppose FIFO contains 3 elements, and there have been no recent
    //read requests from filter memory.
    //Then, on this cycle, fwd_rd_en = 1. On the next cycle, 
    //  - in_flight_cnt = 4
    //  - pending = 1
    //Supposing fwd_rd_en goes back to zero forever, and that a few cycles 
    //later, the filter sends back the data, we will have
    //  - in_flight_cnt = 4
    //  - pending = 0
    
    wire fifo_empty;
    wire fifo_full;
    
    wire rd_from_fifo;
    wire wr_to_fifo;
    
    wire wr_to_keep_last;
    
    //STATE MACHINE SIGNALS
    //---------------------
    `localparam IDLE = 2'b00;
    `localparam NORMAL = 2'b01;
    `localparam WAITING = 2'b11;
    reg [1:0] state = IDLE;
    wire last_i; //This signal is asserted when the last read request for this packet
    //is transmitted (NOT the same as TLAST!)
    wire pending_will_be_zero_on_the_next_cycle; //Can't argue with what this means!
    
    //OTHER SIGNALS
    //-------------
    wire [SN_FWD_ADDR_WIDTH-1:0] max_addr;
    reg [SN_FWD_ADDR_WIDTH-1:0] addr_i = 0;
    
    /******************/
    /***Do the logic***/
    /******************/
    
    //State machine:
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            case (state)
                IDLE:
                    state <= (rdy_for_fwd) ? NORMAL : IDLE;
                NORMAL:
                    state <= (last_i) ? WAITING : NORMAL;
                WAITING:
                    state <= (pending_will_be_zero_on_the_next_cycle) ? (rdy_for_fwd ? NORMAL : IDLE) : WAITING;
            endcase
        end
    end
    
    assign rdy_for_fwd_ack = (state == IDLE) || (state == WAITING && pending_will_be_zero_on_the_next_cycle);
    assign fwd_done = (state == WAITING) && pending_will_be_zero_on_the_next_cycle;
    
    //Last address we will read from
    wire [PLEN_WIDTH-1:0] tmp;
    assign tmp = fwd_byte_len - 1; //Need to do this to get around Verilog's syntax
    assign max_addr = tmp[SN_FWD_ADDR_WIDTH + ADDR_SHIFT -1 -: SN_FWD_ADDR_WIDTH];
    
    //last_i
    assign last_i = (addr_i == max_addr) && fwd_rd_en;
    
    //Empty and full signals
    assign fifo_empty = (in_flight_cnt == 0);
    assign fifo_full = (in_flight_cnt == {FIFO_ORDER{1'b1}}) && !rd_from_fifo; //TODO: take off the second condition in pessimistic mode
    
    //In-flight and pending counts
    always @(posedge clk) begin
        if (rst) begin
            in_flight_cnt <= 0;
            pending <= 0;
        end else begin
            in_flight_cnt <= in_flight_cnt + fwd_rd_en - rd_from_fifo;
            pending <= pending + fwd_rd_en - wr_to_fifo;
        end
    end
    
    assign pending_will_be_zero_on_the_next_cycle = (pending == 'd1) && wr_to_fifo && !fwd_rd_en;
    
    //Read/write pointers
    always @(posedge clk) begin
        if (rst) begin
            rd_ptr <= 0;
            TDATA_wr_ptr <= 0;
            TLAST_wr_ptr <= 0;
        end else begin
            rd_ptr <= rd_ptr + rd_from_fifo;
            TDATA_wr_ptr <= TDATA_wr_ptr + wr_to_fifo;
            TLAST_wr_ptr <= TLAST_wr_ptr + wr_to_keep_last;
        end
    end
    
    //Jun 5 / 2020
    //If packet memory is wider than forwarder, need to use width adapter
    wire [PACKMEM_ADDR_WIDTH -1:0] addr_i_adapted;
    wire [SN_FWD_DATA_WIDTH -1:0] fwd_rd_data_adapted;
generate if (PACKMEM_DATA_WIDTH > SN_FWD_DATA_WIDTH) begin
    fwd_width_adapter # (
        .MEM_WIDTH(PACKMEM_DATA_WIDTH),
        .FWD_WIDTH(SN_FWD_DATA_WIDTH),
        .MEM_ADDR_WIDTH(PACKMEM_ADDR_WIDTH),
        .FWD_ADDR_WIDTH(SN_FWD_ADDR_WIDTH),
        .MEM_LAT(MEM_LAT)
    ) width_adapter (
        .clk(clk),
        
        //Interface to forwarder
        .fwd_addr(addr_i),
        .fwd_rd_data(fwd_rd_data_adapted),
        
        //Interface to packet mem
        .mem_addr(addr_i_adapted),
        .mem_rd_data(fwd_rd_data)
    );
end else begin
    assign addr_i_adapted = addr_i;
    assign fwd_rd_data_adapted = fwd_rd_data;
end endgenerate
    
    //AXI Stream signals
    //TODO: have pessimistic mode gate these with a bhand?
    assign fwd_TDATA = TDATA_fifo[rd_ptr];
    assign fwd_TKEEP = TKEEP_fifo[rd_ptr];
    assign fwd_TVALID = ((in_flight_cnt - pending) != 0);
    assign fwd_TLAST = TLAST_fifo[rd_ptr];
    
    //Read/write signals
    assign rd_from_fifo = fwd_TVALID && fwd_TREADY;
    assign wr_to_fifo = fwd_rd_data_vld;
    assign wr_to_keep_last = fwd_rd_en;
    
    //Update FIFO values
    always @(posedge clk) begin
        if (wr_to_fifo && !rst) begin
            TDATA_fifo[TDATA_wr_ptr] <= fwd_rd_data_adapted;
        end 
        
        if (wr_to_keep_last && !rst) begin
            //TODO: implement proper TKEEP logic
            TKEEP_fifo[TLAST_wr_ptr] <= -'sd1;
            TLAST_fifo[TLAST_wr_ptr] <= (addr_i == max_addr);
        end
    end
    
    //Signals to filter
    assign fwd_rd_en = !fifo_full && (state == NORMAL);
    always @(posedge clk) begin
        if (rst) begin
            addr_i <= 0;
        end else begin
            //We reset the address on the last memory transfer, otherwise increment it
            addr_i <= last_i ? 0 : addr_i + fwd_rd_en;
        end
    end
    
    assign fwd_addr = addr_i_adapted;

endmodule

`undef CLOG2
`undef localparam
