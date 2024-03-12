`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/01/13 13:11:37
// Design Name: 
// Module Name: bypath_ctr
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


module bypath_ctr(
input wire [4:0]        id_ex_rs,
input wire [4:0]        id_ex_rt,
input wire [4:0]        ex_mem_rd,
input wire [4:0]        mem_wb_rd,
input wire              ex_mem_regwrite_flag,
input wire              mem_wb_regwrite_flag,
output wire [1:0]       forward_a,
output wire [1:0]       forward_b
    );
    
    wire forwardA_ex_mem_condition;
    wire forwardA_mem_wb_condition;
    wire forwardB_ex_mem_condition;
    wire forwardB_mem_wb_condition;
    
    assign forwardA_ex_mem_condition = (ex_mem_regwrite_flag == 1'b1) && (ex_mem_rd != 0) && (ex_mem_rd == id_ex_rs);
//    assign forwardA_mem_wb_condition = (mem_wb_regwrite_flag == 1'b1) && (mem_wb_rd != 0) && ( mem_wb_rd == id_ex_rs) && 
//    ( !((ex_mem_regwrite_flag == 1'b1) && (ex_mem_rd != 0) && ( ex_mem_rd != id_ex_rs)) );
    assign forwardA_mem_wb_condition = (mem_wb_regwrite_flag == 1'b1) && (mem_wb_rd != 0) && ( mem_wb_rd == id_ex_rs);
    
    assign forwardB_ex_mem_condition = (ex_mem_regwrite_flag == 1'b1) && (ex_mem_rd != 0) && (ex_mem_rd == id_ex_rt);
//    assign forwardB_mem_wb_condition = (mem_wb_regwrite_flag == 1'b1) && (mem_wb_rd != 0) && ( mem_wb_rd == id_ex_rt) && 
//    ( !((ex_mem_regwrite_flag == 1'b1) && (ex_mem_rd != 0) && ( ex_mem_rd != id_ex_rt)) );
    assign forwardB_mem_wb_condition = (mem_wb_regwrite_flag == 1'b1) && (mem_wb_rd != 0) && ( mem_wb_rd == id_ex_rt);
    
    function [1:0]  FORWARD;
    input       ex_mem_condition;
    input       mem_wb_condition;
    begin
        if( ex_mem_condition )
            FORWARD = 2'b10;
        else if( mem_wb_condition )
            FORWARD = 2'b01;
        else
            FORWARD = 2'b00;
    end
    endfunction
    
    assign forward_a = FORWARD(forwardA_ex_mem_condition, forwardA_mem_wb_condition);
    assign forward_b = FORWARD(forwardB_ex_mem_condition, forwardB_mem_wb_condition);
    
endmodule
