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
//  --========================================================================--
//  Version and Release Control Information:
//
//  File Name           : AHBVGA.v
//  File Revision       : modified from 1.00 of Educational Design Kit (EDK)
//
//  ----------------------------------------------------------------------------
//  Purpose             : AHB VGA system that includes a vga synchronizer and
//                        a text console (font_gen).
//                        
//  --========================================================================--
// Modifications from EDK version:
//
// 1) Clock freq
// VGA runs at 25MHz. (Originally 50MHz)
// If HCLK running at 50MHz, uncomment the following line
//`define HCLK_IS_50MHZ
// The design also allows the AHB clock (HCLK) to be Nx of 
// actual AHB clock frequency (HCLKEN need to be correctly generated).
//
// 2) Color depth
// Originally design use 8-bit color.  In this design the 
// color is 12-bit (4 bit for each color). 
//
// 3) Memory map
// The address decoding is changed.
//
module AHBVGA(
  input  wire        HCLK,
  input  wire        HRESETn,
  input  wire        HCLKEN,  // MODIFICATION : Added to allow VGA core to run at Nx HCLK freq
  input  wire [23:0] HADDR,
  input  wire [31:0] HWDATA,
  input  wire        HREADY,
  input  wire        HWRITE,
  input  wire  [1:0] HTRANS,
  input  wire        HSEL,
  
  output wire [31:0] HRDATA,
  output wire        HREADYOUT,
  
  output wire        hsync,
  output wire        vsync,
`ifdef VGA_8BIT_IMAGE
  output wire [7:0]  rgb
`else
  output wire [11:0] rgb
`endif  
);
  // Register locations
  localparam IMAGEADDR   = 4'h1; // MODIFICATION : Modify from 4'hA to 4'h1
  localparam CONSOLEADDR = 4'h0;

`ifdef VGA_8BIT_IMAGE
  localparam PWIDTH  = 8;  // Pixel width
`else
  localparam PWIDTH  = 12;
`endif
 
  // Internal AHB signals
  reg        last_HWRITE;
  reg        last_HSEL;
  reg  [1:0] last_HTRANS;
  reg [23:0] last_HADDR;
  
  wire [7:0] console_rgb;    // console rgb signal              
  reg  [PWIDTH-1:0] rgb_reg; // rgb register account for delay
  wire       video_on;       // display area
  wire [9:0] pixel_x;        // current x pixel
  wire [9:0] pixel_y;        // current y pixel
  wire       p_tick;         // 25Mhz clk tick
  
  reg        console_write;  //write to console
  reg        image_write;    //write to image
  reg  [PWIDTH-1:0]  reg_wdata;      //data to write to image/console
  
  wire       image_on;       //display only top right

  wire [PWIDTH-1:0]  image_rgb;      //image color

  wire       scroll;         //scrolling signal
  
  wire       sel_console;       
  wire       sel_image;
  
  // De-pipeline AHB controls
  always @(posedge HCLK)
  if(HCLKEN & HREADY)
    begin
      last_HADDR  <= HADDR[23:0];
      last_HWRITE <= HWRITE;
      last_HSEL   <= HSEL;
      last_HTRANS <= HTRANS;
    end
    
  // Give time for the screen to refresh before writing
  assign HREADYOUT = ~scroll;   
  
  // Counters for image clock 
  vga_sync u_vga_sync(
    .clk        (HCLK),
    .resetn     (HRESETn),
`ifdef HCLK_IS_50MHZ
    .clk_cfg    (1'b0),    // 0 : clk=50MHz, 1 : clk=25MHz 
`else    
    .clk_cfg    (1'b1),    // 0 : clk=50MHz, 1 : clk=25MHz 
`endif    
    .hsync      (hsync),
    .vsync      (vsync),
    .video_on   (video_on),
    .p_tick     (p_tick),
    .pixel_x    (pixel_x),
    .pixel_y    (pixel_y)
  );
  
  vga_console u_vga_console(
    .clk        (HCLK),
    .resetn     (HRESETn),
    .video_on   (video_on),
    .pixel_x    (pixel_x),
    .pixel_y    (pixel_y),
    .text_rgb   (console_rgb),
    .font_we    (console_write),
    .font_data  (reg_wdata[7:0]),
    .scroll     (scroll)
    );

  vga_image u_vga_image(
    .clk        (HCLK),
    .resetn     (HRESETn),
    .address    (last_HADDR[17:2]),
    .video_on   (video_on),
    .pixel_x    (pixel_x),
    .pixel_y    (pixel_y),
    .image_we   (image_write),
    .image_data (reg_wdata[PWIDTH-1:0]),
    .image_on   (image_on),
    .image_rgb  (image_rgb)
    );

  assign sel_console = (last_HADDR[23:20]==CONSOLEADDR);
  assign sel_image   = (last_HADDR[23:20]==IMAGEADDR); // MODIFICATION : Modify from 4'hA to 4'h1
  
  // Set console write
  always @(posedge HCLK or negedge HRESETn)
  begin
    if(~HRESETn)
      console_write <= 1'b0;
    else 
      if(last_HWRITE & last_HSEL & last_HTRANS[1] & HREADYOUT & sel_console & HCLKEN)
        console_write <= 1'b1;
      else
        console_write <= 1'b0;
  end
  
  // Set image write and image write data
  always @(posedge HCLK or negedge HRESETn)
  begin
    if(~HRESETn)
      image_write <= 1'b0;
    else 
      if(last_HWRITE & last_HSEL & last_HTRANS[1] & HREADYOUT & sel_image & HCLKEN)
        image_write <= 1'b1;
      else
        image_write <= 1'b0;
  end

  // Register write data
  always @(posedge HCLK or negedge HRESETn)
  begin
    if(~HRESETn)
      reg_wdata <= {PWIDTH{1'b0}};
    else 
      if(last_HWRITE & last_HSEL & last_HTRANS[1] & HREADYOUT & (sel_image|sel_console) & HCLKEN)
        reg_wdata <= HWDATA[PWIDTH-1:0];
      else
        reg_wdata <= {PWIDTH{1'b0}};
 end       

  // RGB output buffer
  always @(posedge HCLK or negedge HRESETn)
  begin
    if(~HRESETn)
      rgb_reg <= {PWIDTH{1'b0}};
    else if (p_tick)
      if(image_on && !console_rgb)
        rgb_reg <= image_rgb[PWIDTH-1:0];// R, G, B
      else
`ifdef VGA_8BIT_IMAGE
        rgb_reg <= console_rgb[7:0];
`else
        rgb_reg <= {console_rgb[7:5],1'b0,  // R
                    console_rgb[4:2],1'b0,  // G
                    console_rgb[1:0],2'b00};// B
`endif
  end

  // Set output
  assign rgb = (video_on) ? rgb_reg : {PWIDTH{1'b0}};
  
  assign HRDATA = {32{1'b0}};

endmodule
  
  
