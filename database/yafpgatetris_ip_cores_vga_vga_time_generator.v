// ============================================================================
// Copyright (c) 2012 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//
//
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================

/*

Horizonal Timing
A (us) Scanline 
B (us) Sync pulse
C (us) Back porchch
D (us) Active video
E (us) Front porcch
E+B+C = blanking

         ______________________          _________
________|        VIDEO         |________| VIDEO (next line)
    |-C-|----------D-----------|-E-|
__   _______________________________   ___________
  |_|                               |_|
  |B|
  |---------------A-----------------|


Vertical Timing
O (ms) Total frame
P (ms) Sync length
Q (ms) Back porch
R (ms) Active video
S (ms) Front porch
         ______________________          ________
________|        VIDEO         |________| VIDEO (next fram
    |-Q-|----------R-----------|-S-|
__   ______________________________   ___________
  |_|                              |_|
  |P|
  |---------------O----------------|


VGA 640x480@60Hz

Reference:
http://www.epanorama.net/documents/pc/vga_timing.html

"VGA industry standard" 640x480 pixel mode

example: 640x480@60
General characteristics
Clock frequency 25.175 MHz
Line  frequency 31469 Hz
Field frequency 59.94 Hz

One line
  8 pixels front porch
 96 pixels horizontal sync
 40 pixels back porch
  8 pixels left border
640 pixels video
  8 pixels right border
---
800 pixels total per line

One field
  2 lines front porch
  2 lines vertical sync
 25 lines back porch
  8 lines top border
480 lines video
  8 lines bottom border
---
525 lines total per field 

Other details
Sync polarity: H negative, V negative
Scan type: non interlaced.



*/

module vga_time_generator(

           clk,
           reset_n,
 
           h_disp,
           h_fporch,
           h_sync,   
           h_bporch,
 
           v_disp,
           v_fporch,
           v_sync,   
           v_bporch,
           
           hs_polarity,
           vs_polarity,
           frame_interlaced,
 
           vga_hs,
           vga_vs,
           vga_de,
           
           pixel_i_odd_frame,
           pixel_x,
           pixel_y
           
 
);

////////////////////////////////////////////////
/////// Port Declare
////////////////////////////////////////////////
input       	clk;
input       	reset_n;

input [11:0]	h_disp;
input [11:0]	h_fporch;
input [11:0]	h_sync;   
input [11:0]	h_bporch;

input [11:0]	v_disp;
input [11:0]	v_fporch;
input [11:0]	v_sync;   
input [11:0]	v_bporch;

input			hs_polarity;
input			vs_polarity;
input			frame_interlaced;

output  reg		vga_hs;
output  reg    	vga_vs;
output      	vga_de;

output	reg		pixel_i_odd_frame;
output  reg	[11:0]	pixel_x;
output  reg	[11:0]	pixel_y;




////////////////////////////////////////////////
///////h sync////////
////////////////////////////////////////////////
//h total sum//
reg [11:0]	h_total;
reg [11:0]	h_total_half;
reg [11:0]	h_pixel_start;
reg [11:0]	h_pixel_end;
reg		  	h_sync_polarity;
reg  	  	vga_h_de;

wire h_de;
wire [11:0] h_valid_pixel_count;
wire h_last_pixel;
assign h_de = (h_counter >= h_pixel_start && h_counter < h_pixel_end)?1'b1:1'b0;
assign h_valid_pixel_count = h_counter - h_pixel_start;
assign h_last_pixel = (h_counter+1 == h_total)?1'b1:1'b0;


//h counter gen //
reg [11:0]h_counter;
reg	[11:0] h_cur_disp;


//	H_Sync, H_Blank Generator, 
always @(posedge clk or negedge reset_n)
begin
	if (!reset_n)
	begin
		h_counter <= 12'h000;
		vga_hs <= hs_polarity?1'b1:1'b0;
		vga_h_de <= 1'b0;
		pixel_x <= 12'hfff;
		h_cur_disp <= 0;
    end
    else if (h_cur_disp != h_disp)
    begin
		h_cur_disp <= h_disp;
		//
		h_total <= h_disp+h_fporch+h_sync+h_bporch;	
		h_total_half <= (h_disp+h_fporch+h_sync+h_bporch ) >> 1;	
		h_pixel_start <= h_sync+h_bporch;
		h_pixel_end <= h_sync+h_bporch+h_disp;
		h_sync_polarity <= hs_polarity;
		//
		h_counter <= 12'h000;
		vga_hs <= hs_polarity?1'b1:1'b0;
		vga_h_de <= 1'b0;
		pixel_x <= 12'hfff;
	end
	else
	begin
		// h_counter
		if (!h_last_pixel) 
			h_counter <= h_counter+1'b1;
		else 
			h_counter <= 0;
			
	    // h sync generator
		if (h_counter < h_sync)
			vga_hs <= h_sync_polarity?1'b1:1'b0;
        else					
			vga_hs <= h_sync_polarity?1'b0:1'b1;
			
	    // de
		pixel_x <= (h_de)?h_valid_pixel_count:12'hfff; 
		vga_h_de <= h_de;
		
    end						
end


////////////////////////////////////////////////
/////v sync///// 
////////////////////////////////////////////////
//v total sum//
reg vga_v_de;
reg [11:0]v_total;
reg [11:0]v_pixel_start;
reg [11:0]v_pixel_end;
reg		  v_sync_polarity;
reg		  v_interlaced;
reg	  	  gen_field1_sync;
reg		  f0_to_f1;

wire [11:0] v_field_total;
wire [11:0] v_field_disp;
wire [11:0] v_valid_line_count;
wire v_de;
assign v_de = (v_counter >= v_pixel_start && v_counter < v_pixel_end)?1'b1:1'b0;
assign v_valid_line_count = v_counter - v_pixel_start;
assign v_field_disp = (frame_interlaced)?(v_disp >> 1):v_disp;
assign v_field_total = v_sync+v_bporch+v_field_disp+v_fporch;

//v counter gen
reg [11:0] v_counter;
reg	[11:0] v_cur_disp;

//	H_Sync, H_Blank Generator, 
always @(posedge clk or negedge reset_n)
begin
	if (!reset_n)
	begin
		v_counter <= 12'h000;
		vga_vs <= vs_polarity?1'b1:1'b0;
		vga_v_de <= 1'b0;
		pixel_y <= 12'hfff;
		pixel_i_odd_frame <= 1'b0;
		v_cur_disp <= 0;
	end
    else if (v_cur_disp != v_disp)
	begin
		v_cur_disp <= v_disp;
		//
		v_pixel_start <= v_sync+v_bporch;
		v_pixel_end <= v_sync+v_bporch+v_field_disp;
		v_total <= v_field_total;// + frame_interlaced; 
		v_sync_polarity <= vs_polarity;
		v_interlaced <= frame_interlaced;
		f0_to_f1 <= 1'b0;
		//
		v_counter <= 12'h000;
		vga_vs <= vs_polarity?1'b1:1'b0;
		vga_v_de <= 1'b0;
		pixel_y <= 12'hfff;
		pixel_i_odd_frame <= 1'b0;
	end
	else if (h_counter == 0 && f0_to_f1)
		f0_to_f1 <= 1'b0;  // line between field0 and filed1
	else if (h_counter == h_total_half && (f0_to_f1 || pixel_i_odd_frame))
	begin   // generate sync for filed1
		// v sync generator
		if (f0_to_f1)
			pixel_i_odd_frame <= 1'b1;
		else	
		begin
			if (v_counter < v_sync)  // v_counter, 0,1,2,3.... 
				vga_vs <= v_sync_polarity?1'b1:1'b0;
			else					
				vga_vs <= v_sync_polarity?1'b0:1'b1;		
		end		
	end	
	else if (h_counter == 0)
	begin
		// v_counter
		if (v_counter+1  < v_total) 
			v_counter <= v_counter+1'b1;
		else 
		begin
			v_counter <= 0;
			//
			if (v_interlaced)
			begin
				if (pixel_i_odd_frame)
					pixel_i_odd_frame <= 1'b0; 
				else	
					f0_to_f1 <= 1'b1;
			end
		end	
		
	    // v sync generator
	    if (!pixel_i_odd_frame)
	    begin
			if (v_counter < v_sync)
				vga_vs <= v_sync_polarity?1'b1:1'b0;
			else					
				vga_vs <= v_sync_polarity?1'b0:1'b1;
        end					
			
	    // blank	
	    vga_v_de <= v_de;
		if (!v_de)
			pixel_y <= 12'hfff;
		else if (!v_interlaced)
			pixel_y <= v_valid_line_count;
		else if (pixel_i_odd_frame)
			pixel_y <= (v_valid_line_count << 1) + 1;  // odd frame, 1, 3, 5, ...
		else
			pixel_y <= v_valid_line_count << 1;  // even frame, 0, 2, 4, ...
			
	end
end

//sync timing output//


assign vga_de = vga_h_de & vga_v_de;


endmodule
