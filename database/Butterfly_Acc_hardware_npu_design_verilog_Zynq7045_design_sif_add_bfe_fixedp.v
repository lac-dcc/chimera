`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: sif_add_bfe_fixedp
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


module sif_addsub_bfe_fixedp
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
  input   [WIDTH_A-1:0]       A_dat,
  output                      A_rdy,
  input                       B_vld,
  input   [WIDTH_B-1:0]       B_dat,
  output                      B_rdy,
  output                      S_vld,
  output  [WIDTH_S-1:0]       S_dat,
  input                       S_rdy
); // sif_add
  
  // local parameter definition, used to align input a and b
  localparam  WIDTH_DIFF = WIDTH_A - WIDTH_B;         // assume width of a is greater or equal to width of b
  
  reg                         vld_reg;
  wire                        enable;
  wire                        is_add;
  // register for the sum
  wire    [WIDTH_A : 0]       S_dat_tmp;
  assign is_add = ~is_sub;
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
      sub_16b u_sub (
        .A(A_dat),      // input wire [15 : 0] A
        .B(B_dat),      // input wire [15 : 0] B
        .ADD(is_add),
        .CLK(clk),  // input wire CLK
        .S(S_dat_tmp)      // output wire [16 : 0] S
      );
    end
    else if (WIDTH_A == 16 & IS_SUB ==0) begin
       addsub_16b u_adder (
        .A(A_dat),      // input wire [15 : 0] A
        .B(B_dat),      // input wire [15 : 0] B
        .CLK(clk),  // input wire CLK
        .S(S_dat_tmp)      // output wire [16 : 0] S
      );
    end
  endgenerate
  
  assign S_dat = {S_dat_tmp[WIDTH_A], S_dat_tmp[WIDTH_S-2 : 0]};
  
endmodule
