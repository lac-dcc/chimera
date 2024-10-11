// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

module vga_select_module 
(	
//	input CLK_40M,
//	input RSTn,
	
	input play_VSYNC_Sig,
	input play_HSYNC_Sig,
	input play_VGA_red,
	input play_VGA_green,
	input play_VGA_blue,

	input end_VSYNC_Sig,
	input end_HSYNC_Sig,
	input end_VGA_red,
	input end_VGA_green,
	input end_VGA_blue,
	
	input start_VSYNC_Sig,
	input start_HSYNC_Sig,
	input start_VGA_red,
	input start_VGA_green,
	input start_VGA_blue,
	
	
	input [2:0] Game_status,//3种游戏状态，START：001；PLAY：010；END：100；
	input Flash_over_sig,
	
	
	output VSYNC_Sig_out,
	output HSYNC_Sig_out,
	
	output VGA_red_out,
	output VGA_green_out,
	output VGA_blue_out
);
	
	//3种游戏状态	
	localparam START = 3'b001;
	localparam PLAY = 3'b010;
	localparam END = 3'b100;
	
	
	
	
	reg VSYNC_Sig;
	reg HSYNC_Sig;
	reg VGA_red;
	reg VGA_green;
	reg VGA_blue;	
	
	
	always @ (*)	
		begin
			case(Game_status)			
				START:
					begin
						VSYNC_Sig = start_VSYNC_Sig; 
						HSYNC_Sig = start_HSYNC_Sig;
						VGA_red 	 = start_VGA_red;
						VGA_green = start_VGA_green;
						VGA_blue  = start_VGA_blue; 									
					end							
				PLAY:
					begin
						VSYNC_Sig = play_VSYNC_Sig; 
						HSYNC_Sig = play_HSYNC_Sig;
						VGA_red   = play_VGA_red;
						VGA_green = play_VGA_green;
						VGA_blue  = play_VGA_blue; 
					end	
				END:
					begin
						VSYNC_Sig = end_VSYNC_Sig; 
						HSYNC_Sig = end_HSYNC_Sig;
						VGA_red   = end_VGA_red;
						VGA_green = end_VGA_green;
						VGA_blue  = end_VGA_blue; 
					end
				default:
					begin
						VSYNC_Sig = start_VSYNC_Sig; 
						HSYNC_Sig = start_HSYNC_Sig;
						VGA_red   = start_VGA_red;
						VGA_green = start_VGA_green;
						VGA_blue  = start_VGA_blue; 						
					end
			endcase
		end
		
	assign	VSYNC_Sig_out = VSYNC_Sig; 
	assign   HSYNC_Sig_out = HSYNC_Sig;
	assign	VGA_red_out   = VGA_red;
	assign	VGA_green_out = VGA_green;
	assign	VGA_blue_out  = VGA_blue; 		

endmodule					
						
						
									
