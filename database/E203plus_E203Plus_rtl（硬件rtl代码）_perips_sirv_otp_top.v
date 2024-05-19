// This program was cloned from: https://github.com/xiaoerlang0359/E203plus
// License: Apache License 2.0

 /*                                                                      
 Copyright 2018 Nuclei System Technology, Inc.                
                                                                         
 Licensed under the Apache License, Version 2.0 (the "License");         
 you may not use this file except in compliance with the License.        
 You may obtain a copy of the License at                                 
                                                                         
     http://www.apache.org/licenses/LICENSE-2.0                          
                                                                         
  Unless required by applicable law or agreed to in writing, software    
 distributed under the License is distributed on an "AS IS" BASIS,       
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and     
 limitations under the License.                                          
 */                                                                      
                                                                         
                                                                         
                                                                         
//=====================================================================
//
// Designer   : Bob Hu
//
// Description:
//  The top level module of otp
//
// ====================================================================

module sirv_otp_top(
  input   clk,
  input   rst_n,
  input   vga_clk,

  input                      i_icb_cmd_valid,
  output                     i_icb_cmd_ready,
  input  [32-1:0]            i_icb_cmd_addr, 
  input                      i_icb_cmd_read, 
  input  [32-1:0]            i_icb_cmd_wdata,
  
  output                     i_icb_rsp_valid,
  input                      i_icb_rsp_ready,
  output [32-1:0]            i_icb_rsp_rdata,

  input                      f_icb_cmd_valid,
  output                     f_icb_cmd_ready,
  input  [32-1:0]            f_icb_cmd_addr, 
  input                      f_icb_cmd_read, 
  input  [32-1:0]            f_icb_cmd_wdata,
  
  output                     f_icb_rsp_valid,
  input                      f_icb_rsp_ready,
  output [32-1:0]            f_icb_rsp_rdata,
  input  [9:0]               pixel_xpos,
  input  [9:0]               pixel_ypos,
  output reg [11:0]          pixel_data
);

assign f_icb_cmd_ready = 1'b0;
assign f_icb_rsp_valid = 1'b0;
assign f_icb_rsp_rdata = 32'd0;

parameter H_DISP = 10'd640;
parameter V_DISP = 10'd480;
parameter H_MAX  = 10'd143;
parameter V_MAX  = 10'd159;
localparam WHITE = 12'hfff;
localparam BLACK = 12'h000;

reg [127:0] char[10:0];
reg [3:0] data_file[179:0];
reg disp_en;
reg disp_en_m;
reg disp_en_sync;

assign i_icb_rsp_rdata = 32'd0;

always @(*)begin
    char[0]=128'h00000018244242424242424224180000;
    char[1]=128'h000000101C10101010101010107C0000;
    char[2]=128'h0000003C4242424020100804427E0000;
    char[3]=128'h0000003C4242402018204042423C0000;
    char[4]=128'h00000020303028242422FE2020F80000;
    char[5]=128'h0000007E0202021E22404042221C0000;
    char[6]=128'h000000182402023A4642424244380000;
    char[7]=128'h0000007E422020101008080808080000;
    char[8]=128'h0000003C4242422418244242423C0000;
    char[9]=128'h0000001C22424242625C404024180000;
    char[10]=128'h000000E7422424181818242442E70000;
end

wire [7:0] char_h_index;
wire [7:0] char_v_index;
wire [7:0] pixel_h_index;
wire [7:0] pixel_v_index;
wire [7:0] char_index;
wire [7:0] pixel_index;

assign char_h_index = {1'b0,pixel_xpos[9:3]};
assign char_v_index = {2'b00,pixel_ypos[9:4]};
assign pixel_h_index = {5'd0,pixel_xpos[2:0]};
assign pixel_v_index = {4'd0,pixel_ypos[3:0]};
assign char_index = (char_v_index<<4)+(char_v_index<<1)+char_h_index;
assign pixel_index = ((8'd15-pixel_v_index)<<3) + pixel_h_index;

    // In FPGA platform this module is just an empty wrapper

always @(posedge vga_clk or negedge rst_n) begin
    if (!rst_n)
        pixel_data<=12'd0;
    else begin
        if ((pixel_xpos<H_MAX) && (pixel_ypos<V_MAX))
            if (char[data_file[char_index]][pixel_index] && disp_en_sync)
                pixel_data <= WHITE;
            else
                pixel_data <= BLACK;
        else pixel_data <= BLACK; 
    end
end

genvar i;
generate
    for (i=0;i<180;i=i+1)
    begin: write_test
        always @(posedge clk) begin
            if ((i_icb_cmd_valid==1'b1) && (i_icb_cmd_read==1'b0) && (i_icb_cmd_addr[11:2]==i))
                data_file[i] <= i_icb_cmd_wdata[3:0];
            else
                data_file[i] <= data_file[i];
        end
    end
endgenerate

always @(posedge clk or negedge rst_n)begin
  if (rst_n==1'b0)
    disp_en<=1'b0;
  else
    if ((i_icb_cmd_valid==1'b1) && (i_icb_cmd_read==1'b0) && (i_icb_cmd_addr[11:0]==12'hffc))
      disp_en<=i_icb_cmd_wdata[0];
    else
      disp_en<=disp_en;
end

always @(posedge vga_clk or negedge rst_n)begin
  if (rst_n==1'b0)
    {disp_en_m,disp_en_sync}<=2'b00;
  else
    {disp_en_m,disp_en_sync}<={disp_en,disp_en_m};
end

  sirv_gnrl_pipe_stage # (
 .CUT_READY(0),
 .DP(1),
 .DW(0)
) u_e1_stage (
  .i_vld(i_icb_cmd_valid), 
  .i_rdy(i_icb_cmd_ready), 
  .i_dat(1'b0),
  .o_vld(i_icb_rsp_valid), 
  .o_rdy(i_icb_rsp_ready), 
  .o_dat(),

  .clk  (clk  ),
  .rst_n(rst_n)  
 );

endmodule
