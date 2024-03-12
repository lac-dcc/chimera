`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: sif_add_half_fp
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


module sif_mult_half_fp(
  input                       clk,
  input                       A_vld,
  input   [16-1:0]       A_dat,
  output                      A_rdy,
  input                       B_vld,
  input   [16-1:0]       B_dat,
  output                      B_rdy,
  output                      P_vld,
  output  [16-1:0]       P_dat,
  input                       P_rdy
    );
    
half_fp_mult u_half_fp_mult (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(A_vld),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(A_rdy),            // output wire s_axis_a_tready
  .s_axis_a_tdata(A_dat),              // input wire [15 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(B_vld),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(B_rdy),            // output wire s_axis_b_tready
  .s_axis_b_tdata(B_dat),              // input wire [15 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(P_vld),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(P_rdy),  // input wire m_axis_result_tready
  .m_axis_result_tdata(P_dat)    // output wire [15 : 0] m_axis_result_tdata
);    

endmodule
