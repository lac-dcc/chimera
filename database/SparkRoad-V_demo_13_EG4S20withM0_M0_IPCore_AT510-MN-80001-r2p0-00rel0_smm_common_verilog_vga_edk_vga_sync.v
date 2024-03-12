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
// Abstract : VGA sync signal generator
//-----------------------------------------------------------------------------

module vga_sync(
  input  wire       clk,
  input  wire       resetn,
  input  wire       clk_cfg,  // 0 : clk=50MHz, 1 : clk=25MHz 
  output wire       hsync,
  output wire       vsync,
  output wire       video_on,
  output wire       p_tick,   // pixel clock
  output wire [9:0] pixel_x,
  output wire [9:0] pixel_y
);


  localparam HD = 640;  //horizontal display
  localparam HF = 48;   //h. front border
  localparam HB = 16;   //h. back border
  localparam HR = 96;   //h. retrace

  localparam VD = 480;  //vertical display
  localparam VF = 10;   //v. front border
  localparam VB = 33;   //v. back border
  localparam VR = 2;    //v. retrace



  reg       reg_px_div;
  wire      nxt_px_div;

  reg [9:0] h_count;
  reg [9:0] h_count_next;

  reg [9:0] v_count;
  reg [9:0] v_count_next;
  
  reg       hsync_reg;
  wire      hsync_next;
  
  reg       vsync_reg;
  wire      vsync_next;
  
 
  // Divide by 2 Counter to generate 25MHz clk 
  always @(posedge clk or negedge resetn)
  begin
    if(!resetn)
      reg_px_div <= 1'b0;
    else
      reg_px_div <= nxt_px_div;
  end
  
  assign nxt_px_div = ~reg_px_div;
  assign p_tick     = nxt_px_div | clk_cfg;

  // Horizontal Pixel Counter
  always @(posedge clk or negedge resetn)
  begin
    if(!resetn)
      h_count <= 10'b0;
    else
      h_count <= h_count_next;
  end

  always @*
  begin
    if(p_tick)
      if(h_count == (HD+HF+HB+HR-1))
        h_count_next = 10'b0;
      else
        h_count_next = h_count + 10'd1;
    else
      h_count_next = h_count;
  end

  assign pixel_x = h_count;

  // Vertical Pixel Counter
  always @(posedge clk or negedge resetn)
  begin
    if(!resetn)
      v_count <= 10'b0;
    else
      v_count <= v_count_next;
  end

  always @*
  begin
    if(p_tick & (h_count == (HD+HF+HB+HR-1)))
      if(v_count == (VD+VF+VB+VR-1))
        v_count_next = 10'b0;
      else
        v_count_next = v_count + 10'd1;
    else
      v_count_next = v_count;
  end

  assign pixel_y = v_count;

  //Horizontal and Vertical Sync
  always @(posedge clk, negedge resetn)
  begin
    if(!resetn)
      begin
        hsync_reg <= 1'b0;
        vsync_reg <= 1'b0;
      end
    else
      begin
        hsync_reg <= hsync_next;
        vsync_reg <= vsync_next;
      end
  end
  
  //If h_count and v_count are in the hsync range assert the signal
  assign hsync_next = ((h_count >= HD+HB) && (h_count <=HD+HB+HR-1));
  assign vsync_next = ((v_count >= VD+VB) && (v_count <=VD+VB+VR-1));

  assign hsync = hsync_reg;
  assign vsync = vsync_reg;

  //video_on signal
  assign video_on = ((h_count < HD) && (v_count < VD));

endmodule
  

