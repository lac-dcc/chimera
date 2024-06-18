// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2020 01:56:54 PM
// Design Name: 
// Module Name: neigh_fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module neigh_fifo #( parameter LEN = 16, parameter DEPTH = 4, parameter PTR = 2,
parameter NUM_PIPELINE_STAGES = 0
) (
    input clk,
    input rstn,
    input stall,
    
    input [LEN-1:0] data_in,
    input data_in_valid,
    
    input rd_rqst,
    
    output wire full,
    output [LEN-1:0] data_out,
    output  reg data_out_valid
    );
    
    wire rd_en,wr_en;
    reg data_rq,data_valid_retain;
    reg stall_d;
    wire empty;
    always @(posedge clk or negedge rstn) begin
    if(~rstn)
        stall_d <= 1'b0;
    else
        stall_d <= stall;
    end
//    assign data_out_valid = data_valid_retain || rd_en;
    always @(posedge clk or negedge rstn) begin
        if(~rstn)
            data_out_valid <= 1'b0;
        else
            data_out_valid <= (data_out_valid && stall) || rd_en;
    end
    always @(posedge clk or negedge rstn) begin
        if(~rstn) begin
            data_rq <= 1'b0;
            data_valid_retain <= 1'b0;
        end
        else if(~stall) begin
            data_rq <= rd_rqst;
            data_valid_retain <= 1'b0;
        end
        else begin
            data_rq <= rd_en ? 1'b0:data_rq;
            data_valid_retain <= data_out_valid ? 1'b1 : data_valid_retain ;
        end
    end
    
    assign rd_en = data_rq && ~empty;
    assign wr_en = data_in_valid;// && ~full;
    
    fifo_bus_read #(.DATA_LEN(LEN),
    .DEPTH(DEPTH),
    .NUM_PIPELINE_STAGES(NUM_PIPELINE_STAGES))
    fifo_wrt_to_bus 
    (
        .clk		(clk		),
        .rstn		(rstn		),
        .wr_data	(data_in	),
        .wr_en		(wr_en	),
        .rd_en		(rd_en	),
    
        .rd_data	(data_out	),
        .full		(full	),
        .empty_w		(empty	)
    );
endmodule
