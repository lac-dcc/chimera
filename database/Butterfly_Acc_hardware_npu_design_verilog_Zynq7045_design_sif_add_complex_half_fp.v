`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: sif_add_complex
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


module sif_add_complex_half_fp
# (
  parameter WIDTH_A = 16,       // input a data width, 8,16, 20, 28
  parameter WIDTH_B = 16,       // input b data width, 16, 20, 28
  parameter WIDTH_S = 16,
  parameter IS_SUB = 1
)
(
  input                       clk,
  input                       rst_n,
  input                       is_sub,
  input                       A_vld,
  input   [WIDTH_A-1:0]       A_real_dat,
  input   [WIDTH_A-1:0]       A_img_dat,
  output                      A_rdy,
  input                       B_vld,
  input   [WIDTH_B-1:0]       B_real_dat,
  input   [WIDTH_B-1:0]       B_img_dat,
  output                      B_rdy,
  output                      S_vld,
  output  [WIDTH_S-1:0]       S_real_dat,
  output  [WIDTH_S-1:0]       S_img_dat,
  input                       S_rdy
); // sif_add
  
  wire          S_real_vld;
  wire          S_img_vld;
  // get output
  generate
    if(WIDTH_A == 16 & IS_SUB ==1)          // no overflow, add 0 prefix
    begin
        half_fp_sub u_half_fp_sub_real (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(A_vld),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(A_rdy),            // output wire s_axis_a_tready
        .s_axis_a_tdata(A_real_dat),              // input wire [15 : 0] s_axis_a_tdata
        .s_axis_b_tvalid(B_vld),            // input wire s_axis_b_tvalid
        .s_axis_b_tready(B_rdy),            // output wire s_axis_b_tready
        .s_axis_b_tdata(B_real_dat),              // input wire [15 : 0] s_axis_b_tdata
        // .s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
        // .s_axis_operation_tready(),  // output wire s_axis_operation_tready
        // .s_axis_operation_tdata({{7{1'b0}}, is_sub}),    // input wire [7 : 0] s_axis_operation_tdata
        .m_axis_result_tvalid(S_real_vld),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(S_rdy),  // input wire m_axis_result_tready
        .m_axis_result_tdata(S_real_dat)    // output wire [15 : 0] m_axis_result_tdata
        ); 

        half_fp_sub u_half_fp_sub_img (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(A_vld),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(),            // output wire s_axis_a_tready
        .s_axis_a_tdata(A_img_dat),              // input wire [15 : 0] s_axis_a_tdata
        .s_axis_b_tvalid(B_vld),            // input wire s_axis_b_tvalid
        .s_axis_b_tready(),            // output wire s_axis_b_tready
        .s_axis_b_tdata(B_img_dat),              // input wire [15 : 0] s_axis_b_tdata
        // .s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
        // .s_axis_operation_tready(),  // output wire s_axis_operation_tready
        // .s_axis_operation_tdata({{7{1'b0}}, is_sub}),    // input wire [7 : 0] s_axis_operation_tdata
        .m_axis_result_tvalid(S_img_vld),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(S_rdy),  // input wire m_axis_result_tready
        .m_axis_result_tdata(S_img_dat)    // output wire [15 : 0] m_axis_result_tdata
        ); 
    end
    else if (WIDTH_A == 16 & IS_SUB ==0) begin
        half_fp_add u_half_fp_add_real (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(A_vld),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(A_rdy),            // output wire s_axis_a_tready
        .s_axis_a_tdata(A_real_dat),              // input wire [15 : 0] s_axis_a_tdata
        .s_axis_b_tvalid(B_vld),            // input wire s_axis_b_tvalid
        .s_axis_b_tready(B_rdy),            // output wire s_axis_b_tready
        .s_axis_b_tdata(B_real_dat),              // input wire [15 : 0] s_axis_b_tdata
        //.s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
        //.s_axis_operation_tready(),  // output wire s_axis_operation_tready
        //.s_axis_operation_tdata({{8{1'b0}}}),    // input wire [7 : 0] s_axis_operation_tdata
        .m_axis_result_tvalid(S_real_vld),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(S_rdy),  // input wire m_axis_result_tready
        .m_axis_result_tdata(S_real_dat)    // output wire [15 : 0] m_axis_result_tdata
        ); 

        half_fp_add u_half_fp_add_img (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(A_vld),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(),            // output wire s_axis_a_tready
        .s_axis_a_tdata(A_img_dat),              // input wire [15 : 0] s_axis_a_tdata
        .s_axis_b_tvalid(B_vld),            // input wire s_axis_b_tvalid
        .s_axis_b_tready(),            // output wire s_axis_b_tready
        .s_axis_b_tdata(B_img_dat),              // input wire [15 : 0] s_axis_b_tdata
        //.s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
        //.s_axis_operation_tready(),  // output wire s_axis_operation_tready
        //.s_axis_operation_tdata({{8{1'b0}}}),    // input wire [7 : 0] s_axis_operation_tdata
        .m_axis_result_tvalid(S_img_vld),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(S_rdy),  // input wire m_axis_result_tready
        .m_axis_result_tdata(S_img_dat)    // output wire [15 : 0] m_axis_result_tdata
        ); 
    end
  endgenerate
  
  assign S_vld = S_real_vld & S_img_vld;

endmodule
