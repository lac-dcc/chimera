//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`ifndef BHAND_INCLUDE_GUARD
`define BHAND_INCLUDE_GUARD 1

`timescale 1ns / 1ps
/*
bhand.v

Implements a buffered handshake. Also has a parameter for turning on a 
"counting" mode. This counts how many cycles an input has been in the FIFO.

*/

`define genif generate if
`define endgen end endgenerate

module bhand # (
    parameter DATA_WIDTH = 8,
    parameter ENABLE_COUNT = 0,
    parameter COUNT_WIDTH = 4
) (
    input wire clk,
    input wire rst,
    
    input wire [DATA_WIDTH-1:0] idata,
    input wire idata_vld,
    output wire idata_rdy,
    
    output wire [DATA_WIDTH-1:0] odata,
    output wire odata_vld,
    input wire odata_rdy,
    
    //Counting signals. Ignore these ports if ENABLE_COUNT == 0
    input wire cnt_en,
    input wire [COUNT_WIDTH-1:0] icount,
    output wire [COUNT_WIDTH-1:0] ocount
);

    //Some helper signals for neatening up the code
    wire shift_in;
    assign shift_in = idata_vld && idata_rdy;
    
    wire shift_out;
    assign shift_out = odata_vld && odata_rdy;
    
    
    
    
    //Forward-declare this signal since extra_mem needs it
    reg mem_vld = 0;
    
    
    
    
    //Internal registers and signals for extra element
    reg [DATA_WIDTH-1:0] extra_mem = 0;
    reg extra_mem_vld = 0;
    wire extra_mem_rdy;
    
    //Unlike a regular FIFO, we are only ready if empty:
    assign extra_mem_rdy = (extra_mem_vld == 0);
    
    //We will enable writing into extra mem if a new element is shifting in AND
    //mem is full AND mem will not be read on this cycle
    wire extra_mem_en;
    assign extra_mem_en = shift_in && mem_vld && !shift_out;
    
    always @(posedge clk) begin
        //extra_mem_vld's next value
        if (rst) begin
            extra_mem_vld <= 0;
        end else begin
            if (extra_mem_en) begin
                extra_mem_vld <= 1;
            end else if (shift_out) begin
                extra_mem_vld <= 0;
            end
        end
        
        //extra_mem's next value
        if (extra_mem_en) begin
            extra_mem <= idata;
        end
    end
    
    
    
    
    //Internal registers and signals for FIFO element
    reg [DATA_WIDTH-1:0] mem = 0;
    //reg mem_vld = 0; //moved
    wire mem_rdy;
    
    //We are ready if FIFO is empty, or if the value is leaving on this cycle
    assign mem_rdy = !mem_vld || (odata_vld && odata_rdy);
    
    //We will enable writing into mem if it is ready, and if the input is valid
    wire mem_en;
    assign mem_en = mem_rdy && (idata_vld || extra_mem_vld);
    
    always @(posedge clk) begin
        //mem_vld's next value
        if (rst) begin
            mem_vld <= 0;
        end else begin
            if (mem_en) begin
                mem_vld <= 1;
            end else if (shift_out) begin
                mem_vld <= 0;
            end
        end
        
        //mem's next value
        if (mem_en) begin
            mem <= extra_mem_vld ? extra_mem : idata;
        end
    end




`genif(ENABLE_COUNT) begin
    //Declare internal registers
    reg [COUNT_WIDTH-1:0] extra_cnt_reg = 0;
    reg [COUNT_WIDTH-1:0] cnt_reg = 0;
    
    //extra_cnt_reg
    always @(posedge clk) begin
        if (rst) begin
            extra_cnt_reg <= 0;
        end else begin
            if (extra_mem_en) begin
                extra_cnt_reg <= icount + cnt_en;
            end else begin
                extra_cnt_reg <= extra_cnt_reg + cnt_en;
            end
        end
    end
    
    //cnt_reg
    always @(posedge clk) begin
        if (rst) begin
            cnt_reg <= 0;
        end else begin
            if (mem_en) begin
                cnt_reg <= extra_mem_vld ? extra_cnt_reg + cnt_en : icount + cnt_en;
            end else begin
                cnt_reg <= cnt_reg + cnt_en;
            end
        end
    end
    
    //Wire up outputs
    assign ocount = cnt_reg;
`endgen
    
    
    
    
    //Actually wire up module outputs
    assign idata_rdy = extra_mem_rdy;
    assign odata = mem;
    assign odata_vld = mem_vld;
    
endmodule

`undef genif
`undef endgen

`endif
