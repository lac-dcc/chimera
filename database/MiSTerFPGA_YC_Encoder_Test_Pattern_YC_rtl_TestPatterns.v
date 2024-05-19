// This program was cloned from: https://github.com/MikeS11/MiSTerFPGA_YC_Encoder
// License: MIT License

module testpatterns
(
	input         clk,
	input         reset,
	
	input         pal,
	input         range,
	input         smpte,
	input         scandouble,

	output reg    ce_pix,

	output reg    HBlank,
	output reg    HSync,
	output reg    VBlank,
	output reg    VSync,

	output reg  [7:0] video_r,
	output reg  [7:0] video_g,
	output reg  [7:0] video_b
);


reg [7:0] bright100;
reg [7:0] bright75;
reg [7:0] bright;
reg [7:0] dark;
reg [7:0] smpte_I_r;
reg [7:0] smpte_I_g;
reg [7:0] smpte_I_b;
reg [7:0] smpte_Q_r;
reg [7:0] smpte_Q_g;
reg [7:0] smpte_Q_b;
reg [7:0] smpte_pluge_1;
reg [7:0] smpte_pluge_2;
reg [7:0] smpte_pluge_3;

reg  [7:0] smpte_video_r;
reg  [7:0] smpte_video_g;
reg  [7:0] smpte_video_b;
reg  [2:0] smpte_vert_section;

reg  [3:0] smpte_vstripe_7;
reg  [3:0] smpte_botstrip;


reg   [9:0] hc;
reg   [9:0] vc;
wire [9:0] vsync_start = (pal ? 10'd270 : 10'd243);

always @(posedge clk) begin

if (range == 1'b0) begin	// NTSC level range = 16 to 235
		bright100 <= 225;
		bright75  <= 168;
		dark		 <= 16;
		smpte_I_r <= 16;
		smpte_I_g <= 44;
		smpte_I_b <= 81;
		smpte_Q_r <= 59;
		smpte_Q_g <= 16;
		smpte_Q_b <= 107;
		smpte_pluge_1 <= 8;
		smpte_pluge_2 <= 16;
		smpte_pluge_3 <= 25;
	end
	else begin						// HDMI use range = 0 to 255
		bright100 <= 255;
		bright75  <= 191;
		dark		 <= 0;
		smpte_I_r <= 0;
		smpte_I_g <= 33;
		smpte_I_b <= 76;
		smpte_Q_r <= 50;
		smpte_Q_g <= 0;
		smpte_Q_b <= 106;
		smpte_pluge_1 <= 8;
		smpte_pluge_2 <= 16;
		smpte_pluge_3 <= 25;
	end

	if (smpte == 1'b0)
		bright	 <= bright75;
	else
		bright	 <= bright100;


	if(scandouble) ce_pix <= 1;
		else ce_pix <= ~ce_pix;

	if(reset) begin
		hc <= 0;
		vc <= 0;
	end
	else if(ce_pix) begin
		if(hc == 340) begin
			hc <= 0;
			if(vc == (pal ? (scandouble ? 623 : 311) : (scandouble ? 523 : 261))) begin 
				vc <= 0;
			end else begin
				vc <= vc + 1'd1;
			end
		end else begin
			hc <= hc + 1'd1;
		end
	end
end

always @(posedge clk) begin
	if (hc == 256) begin
			
			smpte_vstripe_7 <= 0;
	end else if (hc == 340) begin
			
			smpte_vstripe_7 <= 4'd7;
			smpte_botstrip  <= 4'd0;
	end

//////  SMPTE ////////
   case (hc)									// divisions on horizontal axis for color bars in top 2 sections
		35:			smpte_vstripe_7 <= 4'd6;
		71:			smpte_vstripe_7 <= 4'd5;
		106:			smpte_vstripe_7 <= 4'd4;	
		141:			smpte_vstripe_7 <= 4'd3;
		176:			smpte_vstripe_7 <= 4'd2;
		212:			smpte_vstripe_7 <= 4'd1;
	endcase

   case (hc)									// divisions on horizontal axis for color bars in bottom section
		44:			smpte_botstrip <= 4'd1;
		88:			smpte_botstrip <= 4'd2;
		132:			smpte_botstrip <= 4'd3;
		176:			smpte_botstrip <= 4'd4;
		188:			smpte_botstrip <= 4'd5;
		200:			smpte_botstrip <= 4'd6;
		212:			smpte_botstrip <= 4'd7;
	endcase
	

//	smpte_video_r <= 8'b0;
//	smpte_video_g <= 8'b0;
//	smpte_video_b <= 8'b0;

	if (vc < (pal ? (scandouble ? 408 : 204) : (scandouble ? 327 : 163)))
		smpte_vert_section <= 0;
		
	else if (vc < (pal ? (scandouble ? 460 : 230) : (scandouble ? 368 : 184)))
	
		smpte_vert_section <= 1;
	else
		smpte_vert_section <= 2;


	case (smpte_vert_section)

		0:														// top band of colors
			begin
				smpte_video_g <= dark;
				smpte_video_r <= dark;
				smpte_video_b <= dark;

				if (smpte_vstripe_7[2] != 1'b0)
					smpte_video_g <= bright;
				
				if (smpte_vstripe_7[1] != 1'b0)
					smpte_video_r <= bright;

				if (smpte_vstripe_7[0] != 1'b0)
					smpte_video_b <= bright;
			end

		1:														// middle band for chroma balance
			begin
				smpte_video_g <= dark;
				smpte_video_r <= dark;
				smpte_video_b <= dark;

				if ((smpte_vstripe_7 == 4'd3) || (smpte_vstripe_7 == 4'd1))
					smpte_video_g <= bright;
				
				if ((smpte_vstripe_7 == 4'd5) || (smpte_vstripe_7 == 4'd1))
					smpte_video_r <= bright;

				if (smpte_vstripe_7[0] == 1'b1)
					smpte_video_b <= bright;
			end

		2:														// bottom band (including PLUGE)
			begin
				case (smpte_botstrip)
					0:										// I
						begin
							smpte_video_r <= smpte_I_r;
							smpte_video_g <= smpte_I_g;
							smpte_video_b <= smpte_I_b;
						end

					1:										// white
						begin
							smpte_video_r <= bright100;
							smpte_video_g <= bright100;
							smpte_video_b <= bright100;
						end
						
					2:										// Q
						begin
							smpte_video_r <= smpte_Q_r;
							smpte_video_g <= smpte_Q_g;
							smpte_video_b <= smpte_Q_b;
						end
						
					3:										// Black
						begin
							smpte_video_r <= dark;
							smpte_video_g <= dark;
							smpte_video_b <= dark;
						end
						
					4:										// PLUGE #1
						begin
							smpte_video_r <= smpte_pluge_1;
							smpte_video_g <= smpte_pluge_1;
							smpte_video_b <= smpte_pluge_1;
						end
						
					5:										// PLUGE #2
						begin
							smpte_video_r <= smpte_pluge_2;
							smpte_video_g <= smpte_pluge_2;
							smpte_video_b <= smpte_pluge_2;
						end
						
					6:										// PLUGE #3
						begin
							smpte_video_r <= smpte_pluge_3;
							smpte_video_g <= smpte_pluge_3;
							smpte_video_b <= smpte_pluge_3;
						end
						
					7:										// Black
						begin
							smpte_video_r <= dark;
							smpte_video_g <= dark;
							smpte_video_b <= dark;
						end
				endcase
			end
		
	endcase



	if (hc == 256) HBlank <= 1;
		else if (hc == 340) HBlank <= 0;

	if (hc == 279) begin
		HSync <= 1;

		if(pal) begin
			if(vc == (scandouble ? 609 : 270)) VSync <= 1;
				else if (vc == (scandouble ? 617 : 273)) VSync <= 0;

			if(vc == (scandouble ? 601 : 262)) VBlank <= 1;
				else if (vc == 0) VBlank <= 0;
		end
		else begin
			if(vc == (scandouble ? 490 : 243)) VSync <= 1;
				else if (vc == (scandouble ? 496 : 246)) VSync <= 0;

			if(vc ==  240) VBlank <= 1;
				else if (vc == 0) VBlank <= 0;
		end
	end
	
	if (hc == 304) HSync <= 0;
end


assign video_r = smpte_video_r;
assign video_g = smpte_video_g;
assign video_b = smpte_video_b;

endmodule