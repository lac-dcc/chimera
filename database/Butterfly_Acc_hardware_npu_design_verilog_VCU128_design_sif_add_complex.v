`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 04:50:13 PM
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


module sif_add_complex
# (
  parameter WIDTH_A = 16,       // input a data width, 8,16, 20, 28
  parameter WIDTH_B = 16,       // input b data width, 16, 20, 28
  parameter WIDTH_S = 17,
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
  
  // local parameter definition, used to align input a and b
  localparam  WIDTH_DIFF = WIDTH_A - WIDTH_B;         // assume width of a is greater or equal to width of b
  
  reg                         vld_reg;
  wire                        enable;
  wire                        is_add;
  // register for the sum
  wire    [WIDTH_A : 0]       S_real_dat_tmp;
  wire    [WIDTH_A : 0]       S_img_dat_tmp;
  assign is_add = !is_sub;
  always @ (posedge clk or negedge rst_n)
  begin
    if (!rst_n)
      vld_reg <= 1'b0;
    else if (enable)
      vld_reg <= 1'b1;
    else if (S_rdy)
      vld_reg <= 1'b0;
  end

  assign enable = S_rdy & A_vld & B_vld;
  assign A_rdy = enable;
  assign B_rdy = enable;
  assign S_vld = vld_reg;
  
    // get output
  generate
    if(WIDTH_A == 16 & IS_SUB ==1)          // no overflow, add 0 prefix
    begin
      sub_16b u_sub_real (
        .A(A_real_dat),      // input wire [15 : 0] A
        .B(B_real_dat),      // input wire [15 : 0] B
        .ADD(is_add),
        .CLK(clk),  // input wire CLK
        .S(S_real_dat_tmp)      // output wire [16 : 0] S
      );
      
      sub_16b u_sub_img (
        .A(A_img_dat),      // input wire [15 : 0] A
        .B(B_img_dat),      // input wire [15 : 0] B
        .ADD(is_add),
        .CLK(clk),  // input wire CLK
        .S(S_img_dat_tmp)      // output wire [16 : 0] S
      );
    end
    else if (WIDTH_A == 16 & IS_SUB ==0) begin
       addsub_16b u_adder_real (
        .A(A_real_dat),      // input wire [15 : 0] A
        .B(B_real_dat),      // input wire [15 : 0] B
        .CLK(clk),  // input wire CLK
        .S(S_real_dat_tmp)      // output wire [16 : 0] S
      );
      
       addsub_16b u_adder_img (
        .A(A_img_dat),      // input wire [15 : 0] A
        .B(B_img_dat),      // input wire [15 : 0] B
        .CLK(clk),  // input wire CLK
        .S(S_img_dat_tmp)      // output wire [16 : 0] S
      );

    end
  endgenerate
  
  assign S_real_dat = S_real_dat_tmp[WIDTH_S-1:0];
  assign S_img_dat = S_img_dat_tmp[WIDTH_S-1:0];
endmodule
