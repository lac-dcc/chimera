//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*

axistream_snooper.v

This is basically an AXI to BRAM bridge, but with the extra byte_inc logic

*/



`define genif generate if
`define endgen end endgenerate

`ifdef ICARUS_VERILOG
`include "sn_width_adapter.v"
`define localparam parameter
`else /*For Vivado*/
`define localparam localparam
`endif

`define CLOG2(x) (\
   (((x) <= 1) ? 0 : \
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
   -1))))))))))))))))))
   
module axistream_snooper # (
    parameter SN_FWD_ADDR_WIDTH = 8,
    parameter SN_FWD_DATA_WIDTH = 64,
    parameter SN_INC_WIDTH = `CLOG2(SN_FWD_DATA_WIDTH/8)+1,
    parameter PACKMEM_ADDR_WIDTH = SN_FWD_ADDR_WIDTH,
    parameter PACKMEM_DATA_WIDTH = SN_FWD_DATA_WIDTH,
    parameter PACKMEM_INC_WIDTH = `CLOG2(PACKMEM_DATA_WIDTH/8)+1,
    parameter PESS = 0,
    parameter ENABLE_BACKPRESSURE = 0,
    
    //Derived parameters. Don't set these
    parameter KEEP_WIDTH = SN_FWD_DATA_WIDTH/8
) (
    input wire clk,
    input wire rst,
    
    //AXI stream snoop interface
    //TODO: enable/disable TKEEP? 
    input wire [SN_FWD_DATA_WIDTH-1:0] sn_TDATA,
    input wire [KEEP_WIDTH-1:0] sn_TKEEP,
    input wire sn_TREADY,
    output wire sn_bp_TREADY, 
    input wire sn_TVALID,
    input wire sn_TLAST,
    
    //Interface to parallel_cores
    output wire [PACKMEM_ADDR_WIDTH-1:0] sn_addr,
    output wire [PACKMEM_DATA_WIDTH-1:0] sn_wr_data,
    output wire sn_wr_en,
    output wire [PACKMEM_INC_WIDTH-1:0] sn_byte_inc,
    output wire sn_done,
    input wire rdy_for_sn,
    output wire rdy_for_sn_ack, //Yeah, I'm ready for a snack
    
    output wire packet_dropped_inc //At any clock edge, a 1 means increment number of dropped packets
);
    /************************************/
    /**Forward-declare internal signals**/
    /************************************/
    
    //AXI stream snoop interface
    wire [SN_FWD_DATA_WIDTH-1:0] sn_TDATA_i;
    wire [KEEP_WIDTH-1:0] sn_TKEEP_i;
    wire sn_TREADY_i;
    wire sn_bp_TREADY_i;
    wire sn_TVALID_i;
    wire sn_TLAST_i;
    
    //Interface to parallel_cores
    wire [SN_FWD_DATA_WIDTH-1:0] sn_wr_data_i;
    wire sn_wr_en_i;
    wire [SN_INC_WIDTH-1:0] sn_byte_inc_i;
    wire sn_done_i;
    wire rdy_for_sn_i;
    wire rdy_for_sn_ack_i; //Yeah, I'm ready for a snack
    
    
    //State machine signals
    `localparam NOT_STARTED = 2'b00;
    `localparam WAITING = 2'b01;
    `localparam STARTED = 2'b11;
    reg [1:0] state;
`genif (ENABLE_BACKPRESSURE == 0) begin
    initial state <= NOT_STARTED;
end else begin
    initial state <= STARTED;
`endgen
    wire valid_i;
    wire done_i;
    reg [SN_FWD_ADDR_WIDTH-1:0] addr_i = 0;
    
    /***************************************/
    /**Assign internal signals from inputs**/
    /***************************************/

    //AXI stream snoop interface
`genif (PESS) begin
    reg [SN_FWD_DATA_WIDTH-1:0] sn_TDATA_r = 0;
    reg [KEEP_WIDTH-1:0] sn_TKEEP_r = 0;
    reg sn_TREADY_r = 0;
    reg sn_TVALID_r = 0;
    reg sn_TLAST_r = 0;
    
    always @(posedge clk) begin
        if (rst) begin
            sn_TVALID_r <= 0;
        end else begin
            sn_TVALID_r <= sn_TVALID;
        end
        sn_TDATA_r <= sn_TDATA;
        sn_TKEEP_r <= sn_TKEEP;
        sn_TREADY_r <= sn_TREADY;
        sn_TLAST_r <= sn_TLAST;
    end

    assign sn_TDATA_i = sn_TDATA_r;
    assign sn_TKEEP_i = sn_TKEEP_r;
    assign sn_TREADY_i = sn_TREADY_r;
    assign sn_TVALID_i = sn_TVALID_r;
    assign sn_TLAST_i = sn_TLAST_r;
    
end else begin
    assign sn_TDATA_i = sn_TDATA;
    assign sn_TKEEP_i = sn_TKEEP;
    assign sn_TREADY_i = sn_TREADY;
    assign sn_TVALID_i = sn_TVALID;
    assign sn_TLAST_i = sn_TLAST;
`endgen

    
    //Interface to parallel_cores
    assign rdy_for_sn_i = rdy_for_sn;    
    
    
    /****************/
    /**Do the logic**/
    /****************/
    
    //Cleans up code a bit
    wire lastrdyvalid;
    assign lastrdyvalid = sn_TLAST_i && sn_TREADY_i && sn_TVALID_i;
    
    //State machine logic. Please see READNE.txt for more details along
    //with a nice diagram
    
    //next-state logic
`genif (ENABLE_BACKPRESSURE == 0) begin
    always @(posedge clk) begin
        if (rst) begin
            state <= NOT_STARTED;
        end else begin
            case (state)
                NOT_STARTED:
                    //Normally we go to WAITING as soon as ready goes high, but
                    //we also include a special case for when ready and last are
                    //high at on the same cycle
                    state <= rdy_for_sn_i ? (lastrdyvalid ? STARTED : WAITING) : NOT_STARTED;
                WAITING:
                    //TODO: should I keep assuming ready never goes low once it 
                    //goes high? The rest of the system is designed that way
                    state <= (lastrdyvalid) ? STARTED : WAITING;
                STARTED:
                    state <= ({lastrdyvalid, rdy_for_sn_i} == 2'b10) ? NOT_STARTED : STARTED;
            endcase
        end
    end
    
end else begin
    //When backpressure is enabled, there is no need for a WAITING state, since
    //we assume that we'll never "start listening" halfway through a packet. 
    //Also, sn_bp_TREADY is always high when we are in the STARTED state
    always @(posedge clk) begin
        if (rst) begin
            state <= STARTED;
        end else begin
            case (state)
                NOT_STARTED:
                    //Note: rdy_for_sn_ack is always high when we are NOT_STARTED
                    //so we can go to STARTED as soon as rdy_for_sn is asserted
                    state <= rdy_for_sn_i ? STARTED : NOT_STARTED;
                STARTED:
                    //The only way to leave the started state is if an input 
                    //packet ends and the packet filter is not currently ready
                    //for the snooper
                    state <= ({sn_TREADY_i && sn_TLAST_i, rdy_for_sn_i} == 2'b10) ? NOT_STARTED : STARTED;
            endcase
        end
    end
`endgen

    //state machine outputs. Note this is a Mealy machine
    assign rdy_for_sn_ack_i = (state == NOT_STARTED) || (state == STARTED && lastrdyvalid);
`genif (ENABLE_BACKPRESSURE == 0) begin
    assign valid_i = (state == STARTED) && sn_TVALID_i  && sn_TREADY_i;
end else begin
    assign valid_i = (state == STARTED) && sn_TVALID_i;
`endgen
    assign done_i = (state == STARTED) && lastrdyvalid;

`genif (ENABLE_BACKPRESSURE != 0) begin
    //Flits are only accepted when the state is STARTED
    assign sn_bp_TREADY_i = (state == STARTED);
`endgen
    
    //Actual AXI-to-BRAM conversion
    assign sn_wr_data_i = sn_TDATA_i;
    assign sn_wr_en_i = valid_i;
    always @(posedge clk) begin
        if (rst) begin
            addr_i <= 0;
        end else begin
            addr_i <= (done_i) ? 0 : (addr_i + valid_i);
        end
    end
    //TODO: do actual TKEEP logic
    assign sn_byte_inc_i = SN_FWD_DATA_WIDTH/8;
    assign sn_done_i = done_i;
    
    /****************************************/
    /**Assign outputs from internal signals**/
    /****************************************/
    
    //Jun 5 / 2020
    //If packet memory is wider than forwarder, need to use width adapter
    wire [PACKMEM_ADDR_WIDTH -1:0] addr_i_adapted;
    wire [PACKMEM_DATA_WIDTH -1:0] sn_wr_data_i_adapted;
    wire sn_wr_en_i_adapted;
    wire [PACKMEM_INC_WIDTH -1:0] sn_byte_inc_i_adapted;
    wire sn_done_i_adapted;
`genif (PACKMEM_DATA_WIDTH > SN_FWD_DATA_WIDTH) begin
    sn_width_adapter # (
        .OUT_WIDTH(PACKMEM_DATA_WIDTH),
        .IN_WIDTH(SN_FWD_DATA_WIDTH),
        .OUT_ADDR_WIDTH(PACKMEM_ADDR_WIDTH),
        .IN_ADDR_WIDTH(SN_FWD_ADDR_WIDTH),
        .OUT_INC_WIDTH(PACKMEM_INC_WIDTH),
        .IN_INC_WIDTH(SN_INC_WIDTH)
    ) width_adapter (
		.clk(clk),
		.rst(rst),
        
        //Outputs from snooper
		.in_addr(addr_i),
		.in_wr_data(sn_wr_data_i),
		.in_wr_en(sn_wr_en_i),
		.in_byte_inc(sn_byte_inc_i),
		.in_done(sn_done_i),
        
        //Inputs to packet mem
		.out_addr(addr_i_adapted),
		.out_wr_data(sn_wr_data_i_adapted),
		.out_wr_en(sn_wr_en_i_adapted),
		.out_byte_inc(sn_byte_inc_i_adapted),
		.out_done(sn_done_i_adapted)
    );
end else begin
    assign addr_i_adapted = addr_i;
    assign sn_wr_data_i_adapted = sn_wr_data_i;
    assign sn_wr_en_i_adapted = sn_wr_en_i;
    assign sn_byte_inc_i_adapted = sn_byte_inc_i;
    assign sn_done_i_adapted = sn_done_i;
`endgen

    //Interface to parallel_cores
    assign sn_addr = addr_i_adapted;
    assign sn_wr_data = sn_wr_data_i_adapted;
    assign sn_wr_en = sn_wr_en_i_adapted;
    assign sn_byte_inc = sn_byte_inc_i_adapted;
    assign sn_done = sn_done_i_adapted;
    assign rdy_for_sn_ack = rdy_for_sn_ack_i; //Yeah, I'm ready for a snack
    
    //AXI Stream interface
    assign sn_bp_TREADY = sn_bp_TREADY_i;
    
    assign packet_dropped_inc = (state != STARTED) && lastrdyvalid;

endmodule

`undef localparam
`undef CLOG2
`undef genif
`undef endgen
