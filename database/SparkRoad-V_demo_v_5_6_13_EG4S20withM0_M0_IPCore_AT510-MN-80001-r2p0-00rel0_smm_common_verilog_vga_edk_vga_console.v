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
// Abstract : Text Console for VGA
//-----------------------------------------------------------------------------

module vga_console(
  input wire clk,
  input wire resetn,
  input wire video_on,
  input wire [9:0] pixel_x,
  input wire [9:0] pixel_y,
  
  input wire font_we,         //font write
  input wire [7:0] font_data, //input 7-bit ascii value
  
  output reg [7:0] text_rgb,  //output color
  output reg scroll           //signals scrolling
);

  //Screen tile parameters
  //localparam MAX_X = 80;      //Number of horizontal tiles
  localparam MAX_X = 80;      //Number of horizontal tiles
  localparam MAX_Y = 21;      //Number of tile rows
  
  //Font ROM
  wire [10:0] rom_addr;       
  wire [6:0] char_addr;
  wire [3:0] row_addr;
  wire [2:0] bit_addr;
  wire [7:0] font_word;
  wire font_bit;
  
  //Dual port RAM
  wire [11:0] addr_r;
  wire [11:0] addr_w;
  wire [6:0] din;
  wire [6:0] dout;
  
  //Cursor
  reg [6:0] cur_x_reg;
  wire [6:0] cur_x_next;
  reg [4:0] cur_y_reg;
  wire [4:0] cur_y_next;
  wire cursor_on;
  
  //pixel buffers
  reg [9:0] pixel_x1;
  reg [9:0] pixel_x2;
  reg [9:0] pixel_y1;
  reg [9:0] pixel_y2;
  
  wire [7:0] font_rgb;      //color for text
  wire [7:0] font_inv_rgb;  //color for text with cursor on top
  
  reg current_state;
  reg next_state;
  
  wire return_key;      //carriage return or '\n'
  wire back_space;
  wire new_line;        //move cursor to next line
  
  //reg scroll;
  reg scroll_next;
  reg  [4:0] yn;         //row count
  reg  [4:0] yn_next;    
  reg  [6:0] xn;         //horizontal count
  reg  [6:0] xn_next;
  wire [4:0] yn_inc;    // Increment of yn, same size, wraps around
  
  wire      we;
  
  // Automatically clear memory on reset
  reg [11:0] addr_empty;
  wire [6:0] mem_data;
  reg empty_mem;        // Memory is being cleared, hold off writes
  
  //Module Instantiation
  font_rom u_font_rom(
    .clk(clk),
    .addr(rom_addr),
    .data(font_word)
  );
  
  dual_port_ram_sync
  #(.ADDR_WIDTH(12), .DATA_WIDTH(7))
  u_video_ram
  ( .clk(clk),
    .we(we | empty_mem),
    .addr_a(addr_w),
    .addr_b(addr_r),
    .din_a(mem_data),
    .dout_a(),
    .dout_b(dout)
  );
  
  //---------------------------------------
  // Memory clear when block in reset logic
  //---------------------------------------
  // Keep addr clear logic counter until it has cleared the whole memory
  always @ (posedge clk, negedge resetn)
  if(!resetn)
    empty_mem <= 1'b1;
  else if (addr_empty == 12'd0)
    empty_mem <= 1'b0;
    
  always @ (posedge clk)
  if(!resetn | empty_mem)
    addr_empty <= addr_empty + 12'd1;
  else
    addr_empty <= 12'd0;

  assign mem_data = (!empty_mem) ? din : 7'd0;
  
  //State Machine for cursor and pixel buffer
  always @ (posedge clk, negedge resetn)
  begin
    if(!resetn)
      begin
        cur_x_reg <= 7'b0;
        cur_y_reg <= 5'b0;
      end
    else
      begin
        cur_x_reg <= cur_x_next;
        cur_y_reg <= cur_y_next;
        pixel_x1 <= pixel_x;
        pixel_x2 <= pixel_x1;
        pixel_y1 <= pixel_y;
        pixel_y2 <= pixel_y1;
      end
  end
  

  //Font ROM Access
  assign row_addr = pixel_y[3:0];           //row value
  assign rom_addr = {char_addr,row_addr};   //ascii value and row of character
  assign bit_addr = pixel_x2[2:0]; //delayed
  assign font_bit = font_word[~bit_addr];   //output from font rom
  
  //Return key found
  assign return_key = (din == 6'b001101 || din == 6'b001010) && ~scroll; // Return || "\n"
  
  //Backspace
  assign back_space = (din == 6'b001000);
  
  //New line logic
  assign new_line = font_we && ((cur_x_reg == MAX_X-1) || return_key);
        
  //Next Cursor Position logic   
  assign cur_x_next = (new_line) ? 7'b0 :
                      (back_space && cur_x_reg) ? cur_x_reg - 7'd1 :
                      (font_we && ~back_space && ~scroll) ? cur_x_reg + 7'd1 : cur_x_reg;
  
  assign cur_y_next = (cur_y_reg == MAX_Y - 5'd1) ? cur_y_reg :
                       ((new_line) ? cur_y_reg + 5'd1 : cur_y_reg );

  //Color Generation
  assign font_rgb = (font_bit) ? 8'b00011100 : 8'b00000000; //green:black
  assign font_inv_rgb = (font_bit) ? 8'b0000000 : 8'b00011100; //black:green
  
  //Display logic for cursor
  assign cursor_on = (pixel_x2[9:3] == cur_x_reg) && (pixel_y2[8:4] == cur_y_reg);
  
  //RAM Write Enable
  assign we = font_we || scroll;
  
  //Display combinational logic
  always @*
  begin
    if(~video_on)
      text_rgb = 8'h00;
    else
      if(cursor_on)
        text_rgb = font_inv_rgb;
      else
        text_rgb = font_rgb;
  end
  
  //Console state machine
  assign yn_inc = yn + 5'b00001;

  always @(posedge clk, negedge resetn)
    if(!resetn)
      begin
        scroll <= 1'b0;
        yn <= 5'b00000;
        xn <= 7'b0000000;
        current_state <= 1'b0;
      end
    else
      begin
        scroll <= scroll_next;
        yn <= yn_next;
        xn <= xn_next;
        current_state <= next_state;
      end
  
  //Console next state logic
  always @*
  begin
    scroll_next = scroll;
    xn_next = xn;
    yn_next = yn;
    next_state = current_state;
    case(current_state)
      1'b0: //Waits for a new line and the cursor on the last line of the screen
        if(new_line && (cur_y_reg == MAX_Y-1))
          begin
            scroll_next = 1'b1;
            next_state = 1'b1;
            yn_next = 5'b0;
            xn_next = 7'b1111111; //Delayed by one cycle
          end
        else
          scroll_next = 1'b0;
      1'b1: //Counts through every tile and refreshes
      begin
        if(xn_next == MAX_X)
          begin
            xn_next = 7'b1111111; //Delayed by one cycle
            yn_next = yn_inc;
            if(yn_next == MAX_Y)
              begin
                next_state = 1'b0;
                scroll_next = 1'b0;
              end
          end
        else
          xn_next = xn + 7'b0000001;
        
          
      end    
    endcase
  end
  
  
  //RAM Write 
  assign addr_w = (!empty_mem) ? ((scroll) ? {yn,xn} : {cur_y_reg, cur_x_reg}) : addr_empty; 
  assign din = (scroll) ?  dout : font_data[6:0];
  //RAM Read
  assign addr_r =(scroll) ? {yn_inc,xn_next} : {pixel_y[8:4],pixel_x[9:3]};
  assign char_addr = dout;
  
  // Remove lint warnings
  wire unused;
  assign unused = font_data[7];

endmodule
