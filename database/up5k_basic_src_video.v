// This program was cloned from: https://github.com/emeb/up5k_basic
// License: MIT License

// video.v - 1k byte video buffer & drive logic
// 2nd generation w/ better timing, no chars in overscan region
// 03-19-19 E. Brombaugh

`default_nettype none

module video(
	input clk,					// 16MHz system clock
	input clk_2x,				// 32MHz pixel clock
	input reset,				// active high system reset
	input sel_ram,				// decoded video RAM address
	input sel_ctl,				// decoded video control address
	input we,					// write enable
	input [12:0] addr,			// address (8k range)
	input [7:0] din,			// write data
	output reg [7:0] ram_dout,	// RAM read data
	output reg [7:0] ctl_dout,	// control read data
	inout [3:0] vdac			// video DAC signal
);
	// set up timing parameters for 32MHz clock rate
	localparam MAX_H = 2037;	// 2038 clocks/line
	localparam MAX_V = 261;		// 262 lines/frame
	localparam HS_WID = 149;	// 150 clocks/4.7us H sync pulse
	localparam BK_TOP = 16;		// Blanking top on line
	localparam BK_BOT = 240;	// Blanking bottom on line
	localparam VS_LIN = 248;	// Vsync on line
	localparam VS_WID = 1887; 	// 1888 clocks/59us V sync pulse
	localparam ASTART = 371;	// start of active area @ 11.6us
	localparam CB_ST = 168;		// start of colorburst - HS_WID + 0.6us
	localparam CB_ND = 248;		// end of colorburst - CB_ST + 2.5us
	
	// control register and color LUT
	reg [7:0] ctrl, hires, color_lut[15:0];
	// write
	always @(posedge clk)
		if(reset)
		begin
			// text mode, bank 0
			ctrl <= 8'h00;
			
			// hires color mapping
			hires <= 8'hF5;
			
			// 3-bits luma, 3-bits chroma phase, 2-bits chroma gain
			color_lut[0]  <= 8'b000_000_00;	// black
			color_lut[1]  <= 8'b010_110_10;	// dk red
			color_lut[2]  <= 8'b010_111_10;	// dk org
			color_lut[3]  <= 8'b011_111_10;	// dk yellow
			color_lut[4]  <= 8'b010_000_10;	// dk green
			color_lut[5]  <= 8'b010_100_10;	// dk blue
			color_lut[6]  <= 8'b010_101_10;	// dk purple
			color_lut[7]  <= 8'b011_100_00;	// dk gray
			color_lut[8]  <= 8'b101_100_00;	// lt gray
			color_lut[9]  <= 8'b101_110_11;	// pink
			color_lut[10] <= 8'b101_111_11;	// lt org
			color_lut[11] <= 8'b110_000_10;	// lt yellow
			color_lut[12] <= 8'b101_001_11;	// lt green
			color_lut[13] <= 8'b101_011_11;	// lt blue
			color_lut[14] <= 8'b101_100_11;	// lt purple
			color_lut[15] <= 8'b111_000_00;	// white
		end
		else if((we == 1'b1) && (sel_ctl == 1'b1))
		begin
			if(addr[4]==1'b0)
				case(addr[3:0])
					4'h0: ctrl <= din;
					4'h1: hires <= din;
				endcase
			else
				color_lut[addr[3:0]] <= din;
		end
		
	// read
	always @(posedge clk)
		if((we == 1'b0) && (sel_ctl == 1'b1))
			if(addr[4]==1'b0)
				case(addr[3:0])
					4'h0: ctl_dout <= ctrl;
					4'h1: ctl_dout <= hires;
					default: ctl_dout <= 8'h00;
				endcase
			else
				ctl_dout <= color_lut[addr[3:0]];

	// break out mode and bank
	wire mode = ctrl[2];
	wire [1:0] bank = ctrl[1:0];
	
	// video timing - separate H and V counters
	reg [10:0] hcnt;
	reg [8:0] vcnt;
	reg hs, vs, cb;
	always @(posedge clk_2x)
	begin
		if(reset)
		begin
			hcnt <= 11'd0;
			vcnt <= 9'd0;
			hs <= 1'b0;
			vs <= 1'b1;
			cb <= 1'b0;
		end
		else
		begin
			// counters
			if(hcnt == MAX_H)
			begin
				hcnt <= 11'd0;
				if(vcnt == MAX_V)
					vcnt <= 9'd0;
				else
					vcnt <= vcnt + 9'd1;
			end
			else
				hcnt <= hcnt + 1;

			// sync pulses
			hs <= (hcnt < HS_WID) ? 1'b0 : 1'b1;
			vs <= ((hcnt < VS_WID)&&(vcnt == VS_LIN)) ? 1'b0 : 1'b1;
			cb <= ((hcnt >= CB_ST) && (hcnt < CB_ND)) ? 1'b1 : 1'b0;
		end
	end
	
	// extract video character data address & ROM line
	reg active;			// active video 
	reg [2:0] dcnt;		// decimate counter (1/3)
	reg pixena;			// pixel rate enable
	reg [2:0] pcnt;		// pixel/char count
	reg vload;			// load video shift reg
	reg [4:0] haddr;	// horizontal component of vram addr
	reg [2:0] cline;	// character line index
	reg [4:0] vaddr;	// vertical component of vram addr
	always @(posedge clk_2x)
	begin
		if(reset)
		begin
			active <= 1'b0;
			dcnt <= 3'b000;
			pixena <= 1'b0;
			pcnt <= 3'b000;
			vload <= 1'b0;
			haddr <= 5'd0;
			cline <= 3'b000;
			vaddr <= 5'd0;
		end
		else
		begin
			// wait for start of active
			if(active == 1'b0)
			begin
				if((hcnt == ASTART) && (vcnt >= BK_TOP) && (vcnt < BK_BOT))
				begin
					// reset horizontal stuff at hcnt == ASTART
					active <= 1'b1;		// active video
					dcnt <= 3'b000;
					pixena <= 1'b1;		// start with enable
					pcnt <= 3'b000;
					vload <= 1'b1;		// start with load
					haddr <= 5'd0;
					
					// reset vertical stuff at vcnt == 0;
					if(vcnt == BK_TOP)
					begin
						cline <= 3'b000;
						vaddr <= 5'd0;
					end
				end
			end
			else
			begin
				// divide clock by 6 to get pixel 
				if(dcnt == 3'b101)
				begin
					// generate pixel enable
					dcnt <= 3'b000;
					pixena <= 1'b1;
					if(pcnt == 3'b111)
					begin
						// generate vload
						vload <= 1'b1;
						
						// end of line?
						if(haddr == 5'd31)
						begin
							// shut off counting & loading
							active <= 1'b0;
							vload <= 1'b0;
							pixena <= 1'b0;
							
							// time to update vertical address?
							if(cline == 3'b111)
								vaddr <= vaddr + 5'd1;
							
							// update character line index
							cline <= cline + 3'b001;
						end
						
						// update horizontal address
						haddr <= haddr + 5'd1;
					end
					else
						vload <= 1'b0;
					
					// always increment pixel count
					pcnt <= pcnt + 3'b001;
				end
				else
				begin
					dcnt <= dcnt + 2'b01;
					pixena <= 1'b0;
				end
			end
		end
	end
	
	// pipeline control signals
	reg [1:0] pixena_pipe, vload_pipe;
	reg [3:0] active_pipe, hs_pipe, vs_pipe, cb_pipe;
	reg [2:0] cline_dly;
	always @(posedge clk_2x)
	begin
		pixena_pipe <= {pixena_pipe[0],pixena};
		vload_pipe <= {vload_pipe[0],vload};
		active_pipe <= {active_pipe[2:0],active};
		hs_pipe <= {hs_pipe[2:0],hs};
		vs_pipe <= {vs_pipe[2:0],vs};
		cb_pipe <= {cb_pipe[2:0],cb};
		cline_dly <= cline;
	end
	wire pixena_dly = pixena_pipe[1];
	wire vload_dly = vload_pipe[1];
	wire active_dly = active_pipe[3];
	wire hs_dly = hs_pipe[3];
	wire vs_dly = vs_pipe[3];
	wire cb_dly = cb_pipe[3];
	
	// generate a toggle signal from clk_2x but synced to clk
	reg rst_clk;
	always @(posedge clk)
		rst_clk <= reset;
	reg toggle_clk_sync;
	always @(posedge clk_2x)
		if(rst_clk)
			toggle_clk_sync <= 1'b1;
		else
			toggle_clk_sync <= ~toggle_clk_sync;
		
	// concatenate horizontal and vertical addresses to make vram address
	wire [12:0] vid_addr = mode ? {vaddr,cline,haddr} : {2'b00,vaddr,haddr,1'b0};
	
	// invert msb of cpu addr due to decoding on D/E range
	wire [12:0] cpu_addr = mode ? addr ^ 13'h1000 : {addr[11:0],~addr[12]};
		
	// address mux selects video or CPU - video in 1st half and CPU in 2nd half
	wire [12:0] mem_addr = toggle_clk_sync ? vid_addr : cpu_addr;
	
	// cpu writes to video memory only on 2nd half of CPU clock cycle
	wire mem_we = sel_ram & we & ~toggle_clk_sync;
	
	// instantiated video memory
	wire [7:0] raw_ram_dout;
	wire [15:0] raw_ram_word;
	vram_32kb uram(
		.clk(clk_2x),
		.we(mem_we),
		.addr({bank,mem_addr}),
		.din(din),
		.dout_byte(raw_ram_dout),
		.dout_word(raw_ram_word)
	);

	// hold data for full cycle for CPU
	always @(posedge clk_2x)
		if(toggle_clk_sync)
			ram_dout <= raw_ram_dout;
	
	// one pipe delay
	
	// Character Generator ROM
	wire [10:0] cg_addr = {raw_ram_word[7:0],cline_dly};
	wire [7:0] cg_dout;
	rom_cg_2kB ucgr(
		.clk(clk_2x),
		.addr(cg_addr),
		.dout(cg_dout)
	);
	
	// pipeline character color data or hires default
	reg [7:0] color_idx;
	always @(posedge clk_2x)
		color_idx <= mode ? hires : raw_ram_word[15:8];
	
	// graphics mode pass-thru
	reg [7:0] gfx_dout;
	always @(posedge clk_2x)
		gfx_dout <= raw_ram_dout;
	
	// mux CG or GFX
	wire [7:0] vdat = mode ? gfx_dout : cg_dout;
	
	// two pipes delay
		
	// Video Shift Register
	reg [7:0] vid_shf_reg;
	reg [3:0] fore, back;
	always @(posedge clk_2x)
		if(pixena_dly)
		begin
			if(vload_dly)
			begin
				vid_shf_reg <= vdat;
				fore <= color_idx[7:4];
				back <= color_idx[3:0];
			end
			else 
				vid_shf_reg <= {vid_shf_reg[6:0],1'b0};
		end
		
	// three pipes delay
		
	// Color LUT
	reg [2:0] luma, phase;
	reg [1:0] gain;
	always @(posedge clk_2x)
		{luma,phase,gain} <= color_lut[vid_shf_reg[7] ? fore : back];
		
	// four pipes delay
	
	// combine and reclock outputs
	reg [3:0] luma_sync, luma_sync_d1, luma_sync_d2;
	always @(posedge clk_2x)
	begin
		// comput luma + sync from color LUT output + piped sync
		if(!(hs_dly & vs_dly))
			luma_sync <= 4'h0;	// sync
		else
		begin
			if(!active_dly)
				luma_sync <= 4'h4;	// blank
			else
			begin
				luma_sync <= 4'h5 + luma; // luma from LUT
			end
		end
		
		// pipe 2x to align with chroma
		luma_sync_d1 <= luma_sync;
		luma_sync_d2 <= luma_sync_d1;
	end
	
	// chroma oscillator
	reg [15:0] chroma_nco;
	reg [3:0] chroma_phs;
	reg [1:0] gain_d1, gain_d2;
	reg cb_d1, cb_d2, active_d1, active_d2;
	reg signed [3:0] chroma_osc, chroma;
	always @(posedge clk_2x)
	begin
		if(reset)
		begin
			chroma_nco <= 16'h0000;
		end
		else
		begin
			// NCO
			chroma_nco <= chroma_nco + 16'd7331;
			
			// phase reference or add in color
			if(!active_dly)
				chroma_phs <= chroma_nco[15:12];
			else
				chroma_phs <= chroma_nco[15:12] + {phase,1'b0};
			
			// simple sine LUT for oscillator
			case(chroma_phs)
				4'h0: chroma_osc <= 4'd0;
				4'h1: chroma_osc <= 4'd3;
				4'h2: chroma_osc <= 4'd5;
				4'h3: chroma_osc <= 4'd6;
				4'h4: chroma_osc <= 4'd7;
				4'h5: chroma_osc <= 4'd6;
				4'h6: chroma_osc <= 4'd5;
				4'h7: chroma_osc <= 4'd3;
				4'h8: chroma_osc <= 4'd0;
				4'h9: chroma_osc <= -4'd3;
				4'ha: chroma_osc <= -4'd5;
				4'hb: chroma_osc <= -4'd6;
				4'hc: chroma_osc <= -4'd7;
				4'hd: chroma_osc <= -4'd6;
				4'he: chroma_osc <= -4'd5;
				4'hf: chroma_osc <= -4'd3;
			endcase
			
			// gain piped
			gain_d1 <= gain;
			gain_d2 <= gain_d1;
			
			// chroma burst piped
			cb_d1 <= cb_dly;
			cb_d2 <= cb_d1;
			
			// active piped
			active_d1 <= active_dly;
			active_d2 <= active_d1;
			
			// chroma value
			if(cb_d2)
				chroma <= chroma_osc>>>2;	// colorburst
			else
			begin
				if(!active_d2 || (gain_d2 == 2'b00))
					chroma <= 4'h0;	// no chroma
				else
					chroma <= chroma_osc>>>(2'b11-gain);
			end
		end
	end
	
	// add luma/sync to chroma to generate composite
	reg signed [5:0] yc_sum;
	wire [3:0] sat_comp;
	reg [3:0] composite;
	always @(posedge clk_2x)
	begin
		yc_sum <= $signed({1'b0,luma_sync_d2}) + chroma;
		composite <= sat_comp;
	end
	
	// saturation from 6-bit signed to 4-bit unsigned
	satsu #(.isz(6),.osz(4)) usat(.in(yc_sum), .out(sat_comp));
	
	// video DAC output register & drivers
	SB_IO #(
		.PIN_TYPE(6'b101001),
		.PULLUP(1'b1),
		.NEG_TRIGGER(1'b0),
		.IO_STANDARD("SB_LVCMOS")
	) uvdac[3:0] (
		.PACKAGE_PIN(vdac),
		.LATCH_INPUT_VALUE(1'b0),
		.CLOCK_ENABLE(1'b1),
		.INPUT_CLK(1'b0),
		.OUTPUT_CLK(clk_2x),
		.OUTPUT_ENABLE(1'b1),
		.D_OUT_0(composite[3:0]),
		.D_OUT_1(1'b0),
		.D_IN_0(),
		.D_IN_1()
	);
endmodule
