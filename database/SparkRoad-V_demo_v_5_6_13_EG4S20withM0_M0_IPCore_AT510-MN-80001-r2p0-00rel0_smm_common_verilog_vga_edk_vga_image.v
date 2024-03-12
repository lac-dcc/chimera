//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Graphic generator for VGA
//-----------------------------------------------------------------------------

module vga_image(
  input wire clk,
  input wire resetn,
  input wire video_on,
  input wire [9:0] pixel_x,
  input wire [9:0] pixel_y,
  input wire image_we,
`ifdef VGA_8BIT_IMAGE
  input wire [7:0] image_data,
`else
  input wire [11:0] image_data,
`endif  
  input wire [15:0] address,

  output wire image_on,
`ifdef VGA_8BIT_IMAGE
  output reg [7:0] image_rgb
`else
  output reg [11:0] image_rgb
`endif  
  );


`ifdef VGA_8BIT_IMAGE
  localparam PWIDTH  = 8;  // Pixel width
`else
  localparam PWIDTH  = 12;
`endif

  wire [15:0] addr_r;
  wire [15:0] addr_w;
  wire [PWIDTH-1:0] din;
  wire [PWIDTH-1:0] dout;

  reg [15:0] address_reg;
  reg [2:0] u3;
  
  //buffer address
  always @(posedge clk)
    address_reg <= address;

 dual_port_ram_sync
  #(.ADDR_WIDTH(16), .DATA_WIDTH(PWIDTH))
  u_image_ram
  ( .clk(clk),
    .we(image_we),
    .addr_a(addr_w),
    .addr_b(addr_r),
    .din_a(din),
    .dout_a(),
    .dout_b(dout)
  );
  

  assign addr_w = address_reg[15:0];
  assign din = image_data;
  
  
  //assign addr_r = {pixel_y[7:0], ~pixel_x[7], pixel_x[6:0]}; //offset x address by -128
  //assign addr_r = {~pixel_y[5],pixel_y[4:0], pixel_x[8:0]}; //offset x address by -128
  //assign addr_r = pixel_y[5:0] * 12'h280 + pixel_x[9:0];
  
  always@*
  begin
    if(pixel_y[7:5] == 3'b011)
        u3 = 3'b000;
    else if(pixel_y[7:5] == 3'b100)
        u3 = 3'b001;
    else if(pixel_y[7:5] == 3'b101)
        u3 = 3'b010;
    else if(pixel_y[7:5] == 3'b110)
        u3 = 3'b011;
    else
        u3 = 3'b100;
    end

  assign addr_r = {u3[1:0],pixel_y[4:0], pixel_x[8:0]}; //offset x address by -128
  
  //image on only in top right
  assign image_on = ((pixel_y[9:8] == 2'b01) && (u3[2] == 1'b0) && (pixel_x[9] == 1'b0));
  
  //image output
  always @*
  if(~image_on || ~video_on)
    image_rgb = {PWIDTH{1'b0}};
  else
    image_rgb = dout;

endmodule
