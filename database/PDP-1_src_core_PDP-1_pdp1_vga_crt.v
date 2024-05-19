// This program was cloned from: https://github.com/spacemen3/PDP-1
// License: MIT License

// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on

/*The PDP-1 Core running Spacewar! on the Analogue Pocket via openFPGA
Uses the original tape program file of Spacewar! v3.1 1962
Supports Sleep/Wake and Memories (beta)
All colors are assigned via an updatable LUT
Main sense switches are set via an updatable config file */


//	Spacewar! Video re-implementation
//
// start date: 071922
//   end date: 072122
// 
// Functional flow:
// 
// Pixels come in and are sent to a primary FIFO
// the coordinates are scaled to 768*720 for display, except in the case of the two
// ships.  They can be stored at full resolution to reduce jaggies from scaling.
//
// The "mag_ships" input controls if this happens or not.
// 
// Two coordinates, one from each ship, are saved so we can calculate their proper
// placement in our scaled grid.
//
// There are 16 1K pixel buffers where the points live and decay.  This allows the storage
// for up to 16384 unique points to live their life.  These buffers are read through
// exactly once per scanline.  During the time, four separate operations can be performed:
//
// * Searching for an already used pixel to replace
// * Finding the dimmest pixel in all 16 buffers in parallel
// * Emitting pixels to the scanline buffers
// * Perform dimming on the special dimming scanline
//
// searching:
// 
// The pixels from the FIFO are evaulated, one at a time.  Every scanline, if a pixel is
// ready in the FIFO, it is compared against all 16K pixels.  The X/Y coordinate is checked
// in parallel in all 16 buffers and if the coordinate is found, it's marked as unrendered (new)
// and the brightness value is replaced.
// 
// If this pixel is truly new, and its X/Y coordinate was NOT found, we progress to the search
// phase.  During evaluation, we determined which address in each of the 16 buffers had the dimmest
// pixel.  Now, the dimmest pixel from all 16 buffers are evaluated to find the dimmest of all 16K
// pixels.  This pixel is then replaced with our new one.
//
// readout:
// 
// Every line of each frame, we select 1 of the 16 buffers and compare its Y coordinate with
// the Y coordinate of each of the 1K points in it, and if the pixel is active, and visible.
// If it is, we send it to the line buffers. This filters out pixels that will be visible on
// a particular set of lines so we don't have to filter them later at the line buffer writein stage.
//
// Since we can evaluate each buffer exactly once during a single scanline, and we have 16 buffers,
// it takes a full 16 lines to cycle through each buffer and send their pixels to the line buffers.
// The line buffers must be 16 lines tall to account for this.  There's two of these buffers, so
// that we scan write into one while sending the other to the outside world.  Every 16 lines,
// the buffers are switched and the process continues.
// 
// dimming:
//
// On line 737 (720 lines total + 16 lines in each buffer + 1 extra) we perform dimming.
// This decrements the brightness of every live point by 1 step as determined by the trail_len
// value.  The first step is always 1 so that the ships will be blue for 2 full frames to stop
// them flickering.  There is a small caveat with dimming;  since the pixels are written in
// basically as they come, points can be written AFTER they were scanned to the line buffers.
// If this happens, those pixels will flicker, because they get dimmed before they are seen.
// The solution is to have an "unrendered" bit that is set when the pixel is written in,
// and clear it in two places:  either when it's scanned out (so theoretically a pixel can be
// set to unrendered, then set to rendered shortly after if it's scanned out right away) or
// when the dimming cycle happens.  In this case, we set it to "rendered" and DO NOT perform
// any dimming.
//
// line buffers:
//
// There are two 16 line high buffers.  These are written to and rendered alternately, so that
// we can render into one buffer and read out of the other.  During readout, we clear the buffer
// so that it will be empty for the next pass.  The vertical counter is used to coordinate all
// these activities.  Because we must render to it first before display, it means our first
// pixels will come out on line 16.  The V front porch accounts for this delay in rendering.
//
// blurring:
//
// This is the last step after the line buffers.  It will perform a 3*3 blur.  It isn't the
// best right now, so hopefully I get time to fix it up.
//


module pdp1_vga_crt (
	input 				reset_n,
	input 				clk,                    // 42.4Mz (all video processing)
	input 				CLK_50M,						// 50Mhz (CPU clock)
	input [10:0] 		horizontal_counter,              
	input [10:0] 		vertical_counter,   
	output reg [7:0] 	red_out,                         
	output reg [7:0] 	green_out,
	output reg [7:0] 	blue_out,             
   input 				frame_odd,   	  			// frame toggle since we only run the CPU every other frame
	input					cpu_stall,					// high = CPU stalled
	output reg			cpu_vga_run,				// pulse high = make CPU run another frame
  
	input  [9:0] 		pixel_x_i,              // X pixel coordinate 
	input  [9:0] 		pixel_y_i,                       
	input  [2:0] 		pixel_brightness,                
	input 				variable_brightness,       
	input  				pixel_available,
	input  [1:0]		pixel_type,
	
	input 				mag_ships,
	input [2:0] 		trail_len,
	input 				blur_on,
	
	input 				clk_74a,
	input	[31:0]		bridge_addr,
	input					bridge_wr,
	input	[31:0]		bridge_wr_data
	
	
);
             
	
	wire use_debugs = 1'b0;						// 0 = do not use corner/line debugs, 1 = use them
	
	// X width = 768, Y height = 720
	// X and Y coords are flipped relative to modern displays, so X and Y are flipped going into the multiplies.
	// X is also inverted.	
	wire [9:0] xcoord = xprod[15:6];			// multiply X coord by 0.75
	wire [9:0] ycoord = yprod[15:6];			// multiply Y coord by 0.703125
	
	// X scaling
	wire [9:0] xmula = pixel_y;
	wire [5:0] xmulb = 6'd48;	
	wire [15:0] xprod = xmula * xmulb;
	
	// Y scaling
	wire [9:0] ymula = ~pixel_x;
	wire [5:0] ymulb = 6'd45;
	wire [15:0] yprod = ymula * ymulb;
	
	reg [1:0] pa_del;								// detect pixel_available edges
	reg [2:0] frame_odd_d;						// synchronize and detect every other frame
	reg [1:0] cpu_stall_d;						// detect rising edge of cpu stall signal
	
	
	reg [9:0] pixel_x;							// pixel X coord to write to FIFO
	reg [9:0] pixel_y;							// pixel Y coord to write to FIFO
	reg write_fifo;								// high to write word to FIFO
	reg [3:0] stuffstate;						// debug pixel stuffer state
	reg [3:0] ss_wait;							// wait for same
	reg [9:0] pixtest;							// we increment this so we have a pixel that moves once every frame for debug
	
	reg [7:0] needlecnt;							// needle ship count
	reg [7:0] wedgecnt;							// wedge ship count
	
	reg [39:0] w_coord;							// wedge's coords (scaled and unscaled)
	reg [39:0] n_coord;
	
	
	// CPU clock domain
	always @ (posedge CLK_50M)
	begin
	
	
		
		pa_del <= {pa_del[0], pixel_available};				// we will write to the FIFO on the rising edge of the signal
		frame_odd_d <= {frame_odd_d[1:0], frame_odd};		// synchronize the even/odd frame thing
		cpu_vga_run <= (frame_odd_d[2:1] == 2'b01);			// every two frames we will start the CPU
		
		
		if (frame_odd_d[2:1] == 2'b01)							// count pixels for each thing to find a specific one
		begin
			needlecnt <= 8'h0;
			wedgecnt <= 8'h0;
		end
		else if (write_fifo)
		case (pixel_type)
		2'h1 :	begin
						needlecnt <= needlecnt + 1'b1;
						if (needlecnt == 8'h14) n_coord <= {~pixel_x, pixel_y, ycoord, xcoord};		// save both coordinates. scaled and unscaled
					end
		2'h2 :	begin
						wedgecnt <= wedgecnt + 1'b1;
						if (wedgecnt == 8'h24) w_coord <= {~pixel_x, pixel_y, ycoord, xcoord};		// save both coordinates. scaled and unscaled
					end
		endcase			
					
		
		// when rendering ends, we will stuff four new pixels into the fifo, to mark the four corners
		// this aids in debugging stuff.  
		if (cpu_stall_d == 2'b01)
		begin
			stuffstate <= (use_debugs ? 4'h1 : 4'h6);		// initial state each game frame
			write_fifo <= 1'b0;
		end
		else if (|ss_wait)
		begin
			ss_wait <= ss_wait - 1'b1;
			write_fifo <= 1'b0;
		end
		else
		case(stuffstate)
		// emit all four corners so we can test the scaler
		4'h1 :	begin
						pixel_x <= 10'h0;
						pixel_y <= 10'h0;
						write_fifo <= 1'b1;
						ss_wait <= 4'hf;
						stuffstate <= 4'h2;
					end
		
		4'h2 :	begin
						pixel_x <= 10'h3ff;
						pixel_y <= 10'h0;
						write_fifo <= 1'b1;
						ss_wait <= 4'hf;
						stuffstate <= 4'h3;
					end

		4'h3 :	begin
						pixel_x <= 10'h0;
						pixel_y <= 10'h3ff;
						write_fifo <= 1'b1;
						ss_wait <= 4'hf;
						stuffstate <= 4'h4;
					end

		4'h4 :	begin
						pixel_x <= 10'h3ff;
						pixel_y <= 10'h3ff;
						write_fifo <= 1'b1;
						ss_wait <= 4'hf;
						stuffstate <= 4'h5;
					end
					
		4'h5 :	begin
						pixel_x <= 10'h100;
						pixel_y <= pixtest;
						pixtest <= pixtest + 1'b1;
						write_fifo <= 1'b1;
						ss_wait <= 4'hf;
						stuffstate <= 4'h6;
					end
		
		4'h6 :	begin
						pixel_x <= pixel_x_i;
						pixel_y <= pixel_y_i;
						write_fifo <= (pa_del == 2'b01);
					end
		
		endcase
					

		
	end	
		
	
	wire [9:0] curr_x;		// current X coord from the FIFO
	wire [9:0] curr_y;		// current Y coord from the FIFO
	wire [1:0] curr_type;	// current object type. we will unscale the ships
	
	reg rdreq;
	wire rdempty;
	wire wr_full;
	
	
	wire magpix = (^pixel_type) & mag_ships;	// when the pixel type is 1 or 2 for the two ships, magnify it
	
	fifo_video thingera (
									.wrclk	(CLK_50M),
									.data		({pixel_type & {2{mag_ships}}, (magpix ? {~pixel_x, pixel_y} : {ycoord, xcoord})}),
									.wrreq	(write_fifo & ~wr_full),	// prevent the FIFO overflowing (this should never happen (tm))
									.wrfull  (wr_full),
									
									.rdclk	(clk),
									.rdreq	(rdreq),
									.rdempty	(rdempty),
									.q			({curr_type, curr_y, curr_x})
							  );


	
	
	
	localparam numbuffs = 8'd16;			// number of buffers
	reg [3:0] ob_buf;							// we need to set this to the number of bits for buffer count
	reg [3:0] ob_count;						// and this too
	reg [3:0] bufcount;						// buffer counter
	wire bufbit = vertical_counter[4];	// bit we use to swap buffers
	localparam dimline = 12'd737;			// do the dimming on one of the non-visble lines
	localparam startline = 12'd12;		// the line DE starts on, because we need to preroll for the first line buffer to fill
	localparam cv_lowbit = 'd4;			// lowest bit to check on the vertical counter
	
	// trail length
	reg [9:0] phos_dim;
	always
	case(trail_len[2:0])
	3'h0 : phos_dim <= 10'h3fe;
	3'h1 : phos_dim <= 10'd64;
	3'h2 : phos_dim <= 10'd32;
	3'h3 : phos_dim <= 10'd16;
	3'h4 : phos_dim <= 10'd8;
	3'h5 : phos_dim <= 10'd4;
	3'h6 : phos_dim <= 10'd2;
	3'h7 : phos_dim <= 10'd1;
	endcase
		
	localparam phos_full = 10'h3ff;							// maximum brightness
	
	wire [31:0] pa_out [numbuffs-1:0];	// bram port A out
	wire [31:0] pb_out [numbuffs-1:0];	// bram port B out (not used)
	reg [9:0] ramcnta;						// bram port A address 
	reg [9:0] ramcntb;						// bram port B address
	reg pb_wren [numbuffs-1:0];			// bram port B write
	reg [31:0] pb_in [numbuffs-1:0];		// bram port B in
		
	// buffer bits:
	// 31 - pixel is unrendered.  we clear this when it is sent to a line buffer
	// 30 - pixel used.  when we use a pixel, this is set (since there's no other way to tell from the coords)
	// 29 - pixel visible. set = pixel will be sent to line buffers. clear = pixel is not scanned out
	// 28:20 - pixel brightness.  Technically bit 29 is part of this too, and we decrement it to dim it out
	// 19:10 - Y coordinate
	// 9:0 - X coordinate
	
	genvar i;
	generate
		for (i = 0; i < numbuffs; i=i+1)
		begin : ramgen
			rendram rr_gen (
			.clock(clk),
			.data_a(32'h0000_0000), .address_a(ramcnta), .wren_a(1'b0), .q_a(pa_out[i]),
			.data_b(pb_in[i]), .address_b(ramcntb), .wren_b(pb_wren[i]), .q_b(pb_out[i])
			);
		end
	endgenerate
	
	
	reg [numbuffs-1:0] foundit;			// set = we found the pixel in this particular buffer
	reg [9:0] minbrite [numbuffs-1:0];	// dimmest pixel in each buffer
	reg [9:0] mb_add [numbuffs-1:0];		// address of dimmest pixel
	reg [3:0] state;							// state
	reg [7:0] j;
	reg [9:0] oldestbrite;					// dimmest pixel on all buffers
	reg [9:0] ob_add;							// address of same
	reg [9:0] ramcnta_d;						// delayed version of port A address (so the address matches the output data)
	reg pipehold;								// hold off pipeline evaluation for the first cycle
	
	reg fifovalid;								// we have valid pixels in the FIFO
	reg [9:0] fifo_x;							// X coord of eval pixel
	reg [9:0] fifo_y;							// Y coord of eval pixel

	reg whichbuf;								// which of the two buffers we are working on
	reg [7:0] pixout;							// pixel to write to
	reg [9:0] out_x;							// its X coord
	reg [9:0] out_y;							// its Y coord
	reg pixwrite, pixwrite_d;				// toggle for pixel writing into line buffers

	reg [39:0] w_coord_d;					// synchronized version of the wedge ship's coords
	reg [39:0] n_coord_d;					// synchronized version of the needle ship's coords
	
	
	// counter pipeline:
	//
	// ramcnta	ramcnta_d	pipehold
	// 0			x				1
	// 1			0				0
	// 2			1				0
	// 3			2				0
	// 4			3				0
	// ...
	// 3fe		3fd			0
	// 3ff		3fe			0
	// 0			3ff			0
	
	
	
	// fix up and recenter the coordinates for each object
	
	// wedge's Y
	wire [9:0] w_ya = (curr_y - w_coord_d[39:30]);							// we must calculate this first, in 10 bits, due to edge wrapping effects
	wire [10:0] w_yb = ({w_ya[9], w_ya} + {1'b0, w_coord_d[19:10]});	// now add the scaled pixel offset
	
	// properly wrap the graphics to our viewport
	reg [9:0] w_y_fix;
	always
	case({(w_yb > 11'd719), w_yb[10]})
	2'b10 	: w_y_fix <= (w_yb[9:0] + 10'd304);	// overflow
	2'b11 	: w_y_fix <= (w_yb[9:0] + 10'd720);	// underflow
	default	: w_y_fix <= w_yb[9:0];					// in range
	endcase
	
	// wedge's X
	wire [9:0] w_xa = (curr_x - w_coord_d[29:20]);							// we must calculate this first, in 10 bits, due to edge wrapping effects
	wire [10:0] w_xb = ({w_xa[9], w_xa} + {1'b0, w_coord_d[ 9: 0]});	// now add the scaled pixel offset
	
	// properly wrap the graphics to our viewport
	reg [9:0] w_x_fix;
	always
	case({(w_xb > 11'd767), w_xb[10]})
	2'b10 	: w_x_fix <= (w_xb[9:0] + 10'd256);	// overflow
	2'b11 	: w_x_fix <= (w_xb[9:0] + 10'd768);	// underflow
	default	: w_x_fix <= w_xb[9:0];					// in range
	endcase

	// needle's Y
	wire [9:0] n_ya = (curr_y - n_coord_d[39:30]);							// we must calculate this first, in 10 bits, due to edge wrapping effects
	wire [10:0] n_yb = ({n_ya[9], n_ya} + {1'b0, n_coord_d[19:10]});	// now add the scaled pixel offset
	
	// properly wrap the graphics to our viewport
	reg [9:0] n_y_fix;
	always
	case({(n_yb > 11'd719), n_yb[10]})
	2'b10 	: n_y_fix <= (n_yb[9:0] + 10'd304);	// overflow
	2'b11 	: n_y_fix <= (n_yb[9:0] + 10'd720);	// underflow
	default	: n_y_fix <= n_yb[9:0];					// in range
	endcase
	
	// needle's X
	wire [9:0] n_xa = (curr_x - n_coord_d[29:20]);							// we must calculate this first, in 10 bits, due to edge wrapping effects
	wire [10:0] n_xb = ({n_xa[9], n_xa} + {1'b0, n_coord_d[ 9: 0]});	// now add the scaled pixel offset
	
	// properly wrap the graphics to our viewport
	reg [9:0] n_x_fix;
	always
	case({(n_xb > 11'd767), n_xb[10]})
	2'b10 	: n_x_fix <= (n_xb[9:0] + 10'd256);	// overflow
	2'b11 	: n_x_fix <= (n_xb[9:0] + 10'd768);	// underflow
	default	: n_x_fix <= n_xb[9:0];					// in range
	endcase
	
	always @ (posedge clk)
	begin
	
		w_coord_d <= w_coord;	// synchronize wedge coordinates
		n_coord_d <= n_coord;	// synchronize needle coordinates
		
		cpu_stall_d <= {cpu_stall_d[0], cpu_stall};			// wait until the CPU stalls before rendering those pixels
		
		if (~|vertical_counter)										// we will do 1 complete search on every scanline, even if there's no pixels left.
		begin
			state <= 4'h1;
			bufcount <= 0;												// which buffer we will scan into our line buffers
		end
		else
		case (state)
		// run this every scanline until we run out of lines
		4'h1 :	begin
						
						if (horizontal_counter == 1)
						begin
							
							whichbuf <= bufbit;												// select which buffer we will render, and which we will fill
							ramcnta <= 0;
							
							fifovalid <= ~rdempty & cpu_stall_d[1];					// if we have a valid entry or not, and we will only do reads every other frame so our scale values can populate
							case(curr_type)
							2'h1 		: {fifo_y, fifo_x} <= {n_y_fix, n_x_fix};		// needle coords
							2'h2 		: {fifo_y, fifo_x} <= {w_y_fix, w_x_fix};		// wedge coords
							default	: {fifo_y, fifo_x} <= {curr_y, curr_x};		// everything else
							endcase
							rdreq <= ~rdempty & cpu_stall_d[1];							// next entry if there is one (and we finished rendering)
							
							for (j = 0; j < numbuffs; j = j + 1)
							begin
								foundit[j] <= 1'b0;											// reset the found flag
								minbrite[j] <= 10'h3ff;										// set min brightness to max brightness
							end
							
							pipehold <= 1'b1;
							state <= 4'h2;
						 
						 end
						 
					end
		
		// pixel update state; we can through all pixels in all buffers looking for the correct one, if present
		// also the pixel scanout is done here too.  and the dimming is done on one of the vblank lines.
		4'h2 :	begin
						rdreq <= 1'b0;

						ramcnta_d <= ramcnta;	// the ram counter is delayed 1 clock because of the bram.  so we will add a delay here, too
						ramcntb <= ramcnta_d;	// ram write port's address

						if (~pipehold)
						for (j = 0; j < numbuffs; j = j + 1)
						begin
							casex({
										(vertical_counter == dimline), (fifovalid & ({fifo_y, fifo_x} == pa_out[j][19:0])),
										((vertical_counter[10:cv_lowbit] == pa_out[bufcount][19:10+cv_lowbit]) & (j == bufcount)), pa_out[j][31:29]
									})
							
							// pixel is being replaced. mark it as unrendered and used
							6'b01x_x1x :	begin
													pb_in[j] <= {2'b11, phos_full, fifo_y, fifo_x};
													pb_wren[j] <= 1'b1;
													foundit[j] <= 1'b1;
												end
											
							// we scanned out the pixel which we previously marked as "unrendered" so mark it as rendered
							6'b001_1xx :	begin
													pb_in[j] <= {1'b0, pa_out[j][30:0]};
													pb_wren[j] <= 1'b1;
												end
												
							// do phosphor dim, but only if we are marked "rendered" and we have not hit 0
							// also, the first step is always 1 so that we will see the blue for 2 full frames, to prevent it flickering if it is being redrawn
							6'b1xx_0x1 :	begin
													pb_in[j][31:30] <= {1'b0, pa_out[j][30]};
													pb_in[j][19:0] <= pa_out[j][19:0];
													casex({&pa_out[j][29:20], 1'b0, pa_out[j][29:20]} - {1'b0, phos_dim})
													12'b1xxx_xxxx_xxxx : pb_in[j][29:20] <= 10'h3fe;								// subtract 1 on the first go
													12'b00xx_xxxx_xxxx : pb_in[j][29:20] <= (pa_out[j][29:20] - phos_dim);	// no underflow
													12'b01xx_xxxx_xxxx : pb_in[j][29:20] <= 10'h0;									// underflow
													endcase
													pb_wren[j] <= 1'b1;
												end
							
							// dimmed to minimum value so peg it at 0
							6'b1xx_0x0 :	begin
													pb_in[j] <= {12'h0, 20'h0};		// reset the coord too so we can see it on the tapper
													pb_wren[j] <= 1'b1;
												end
							
							// we wrote this but haven't rendered it yet, so mark it rendered
							6'b1xx_1xx :	begin
													pb_in[j] <= {1'b0, pa_out[j][30:0]};
													pb_wren[j] <= 1'b1;
												end
							
							// not writing for whatever reason, so clear the bit
							default :	begin
												pb_wren[j] <= 1'b0;
											end
							endcase
							
							// search for the dimmest pixel in all of our buffers and save it and its address
							if ((pa_out[j][29:20] < minbrite[j]) & ~pipehold)
							begin
								minbrite[j] <= pa_out[j][29:20];
								mb_add[j] <= ramcnta_d;
							end
						
						end

						// we have to not do any processing on the FIRST clock of this state
						pipehold <= 1'b0;
						
						// this pixel will be sent to the line buffers for scanout
						{pixout, out_y, out_x} <= {pa_out[bufcount][28:21], pa_out[bufcount][19:0]};
						
						// we will only write it to the buffers if it is in range for the buffer
						if ((vertical_counter[10:cv_lowbit] == pa_out[bufcount][19:10+cv_lowbit]) & pa_out[bufcount][29]) pixwrite <= ~pixwrite;

						// do all pixels
						ramcnta <= ramcnta + 1'b1;
						if (~|ramcnta & ~pipehold) state <= 4'h3;
					
					end
		
		// stop writing, and some some other minor cleanup things
		4'h3 :	begin
						
						for (j = 0; j < numbuffs; j = j + 1)
						begin
							
							pb_wren[j] <= 1'b0;			// stop writing if need be
						
						end
						
						casex({(vertical_counter == dimline), |foundit | ~fifovalid})
						2'b1x : state <= 4'h0;			// this is the last processed line, so we're done. go to idle						
						2'b01 : state <= 4'h1;			// we found the pixel so we are done for this line
						2'b00 : state <= 4'h4;
						endcase
						
						oldestbrite <= 10'h3ff;			// get ready for the next step
						ob_count <= 0;
						
						bufcount <= bufcount + 1'b1;	// step to the next buffer
						
					end
		
		
		// find the dimmest pixel across all buffers
		4'h4 :	begin
						if (minbrite[ob_count] < oldestbrite)
						begin
							oldestbrite <= minbrite[ob_count];
							ob_add <= mb_add[ob_count];
							ob_buf <= ob_count;
						end
						ob_count <= ob_count + 1'b1;
						if (&ob_count) state <= 4'h5;						
					end
		
		// you are the dimmest pixel. goodbye!
		4'h5 :	begin
						pb_in[ob_buf] <= {2'b11, phos_full, fifo_y, fifo_x};	// mark it as unrendered and used
						ramcntb <= ob_add;
						pb_wren[ob_buf] <= 1'b1;
						state <= 4'h6;
					end

		// stop writing and finish up
		4'h6 :	begin
						pb_wren[ob_buf] <= 1'b0;
						state <= 4'h1;
					end
		
		
		endcase

		
		
		pixwrite_d <= pixwrite;
		
		if (~whichbuf)
		begin
			// writing pixels into buffer A on even sets
			buf_a_wr <= (pixwrite ^ pixwrite_d);
			buf_a_dat <= pixout;
			buf_a_add <= {out_y[cv_lowbit-1:0], out_x};
			// reading out pixels from buffer B on even sets
			buf_b_add <= {vertical_counter[cv_lowbit-1:0], (horizontal_counter[9:0] - 10'd8)};
			buf_out <= buf_b_out;
		end
		else
		begin
			// writing pixels into buffer B on odd sets
			buf_b_wr <= (pixwrite ^ pixwrite_d);
			buf_b_dat <= pixout;
			buf_b_add <= {out_y[cv_lowbit-1:0], out_x};
			// reading out pixels from buffer A on odd sets
			buf_a_add <= {vertical_counter[cv_lowbit-1:0], (horizontal_counter[9:0] - 10'd8)};
			buf_out <= buf_a_out;
		end
		
		// buffer clearing address and enable
		buf_c_add <= {vertical_counter[cv_lowbit-1:0], (horizontal_counter[9:0] - 10'd16)};
		buf_c_wr <= (horizontal_counter >= 11'd16);
		
	
	end
	
	
	// line buffers
	
	reg [7:0] buf_out;
	reg [13:0] buf_c_add;
	reg buf_c_wr;
	
	reg [7:0] buf_a_dat;
	reg [13:0] buf_a_add;
	reg buf_a_wr;
	wire [7:0] buf_a_out;
	wire [7:0] buf_a_outb;
	
		
	linebuf thingerb (	.clock(clk),
								.data_a(buf_a_dat), .address_a(buf_a_add), .wren_a(buf_a_wr), .q_a(buf_a_out),
								.data_b(8'h0), .address_b(buf_c_add), .wren_b(buf_c_wr & whichbuf), .q_b(buf_a_outb)
							);
							
	reg [7:0] buf_b_dat;
	reg [13:0] buf_b_add;
	reg buf_b_wr;
	wire [7:0] buf_b_out;
	wire [7:0] buf_b_outb;
	
		
	linebuf thingerc (	.clock(clk),
								.data_a(buf_b_dat), .address_a(buf_b_add), .wren_a(buf_b_wr), .q_a(buf_b_out),
								.data_b(8'h0), .address_b(buf_c_add), .wren_b(buf_c_wr & ~whichbuf), .q_b(buf_b_outb)
							);
							
							
	
	// colour LUT
	
	wire [23:0] output_color;
	
	// we write to this on address range #1000_0000 to #1000_ffff Tho this is a 8bit addressable LUT we have to treat every
	// entry as a 32bit word
	wire write_clut_en = bridge_wr && (bridge_addr[31:16] == 16'h1000); 

	color_lut thingerd (
		.write_clk		(clk_74a),
		.write_address	(bridge_addr[9:2]),
		.write_data		(bridge_wr_data),
		.write_enable	(write_clut_en),
		.read_clk		(clk),
		.input_index	(buf_out),
		.output_color	(output_color)
	);
							

							
	// final blur operation.  we will do a 3*3 blur.
	// the edges of this are dirty, but since we're cropping them off, it doesn't matter.
	// this blur feature isn't being used right now, we need to improve it if there's time.
	
	reg [23:0] linebufa [1023:0];
	reg [23:0] linebufb [1023:0];
	reg [23:0] linebufc [1023:0];
	
	reg [23:0] pix [8:0];
	
	wire [9:0] writeline = (horizontal_counter[9:0] - 10'd3);

	reg [11:0] gauss_ra, gauss_rb, gauss_rc, gauss_r;
	reg [11:0] gauss_ga, gauss_gb, gauss_gc, gauss_g;
	reg [11:0] gauss_ba, gauss_bb, gauss_bc, gauss_b;
	
	
	
	always @ (posedge clk)
	begin	
	
		// generate a 3*3 pixel block:
		// 012
		// 345
		// 678
		
		
		pix[2] <= pix[1];
		pix[1] <= pix[0];
		pix[0] <= linebufa[horizontal_counter[9:0]];
		
		pix[5] <= pix[4];
		pix[4] <= pix[3];
		pix[3] <= linebufb[horizontal_counter[9:0]];
		
		pix[8] <= pix[7];
		pix[7] <= pix[6];
		pix[6] <= linebufc[horizontal_counter[9:0]];
							
		if (~horizontal_counter[10])
		begin
			
			linebufa[writeline] <= ((output_color[23] | ~blur_on) ? output_color : {1'b0, output_color[23:17], 1'b0, output_color[15:9], 1'b0, output_color[7:1]});
			linebufb[writeline] <= pix[2];
			linebufc[writeline] <= pix[5];
			
		end

		gauss_ra <= {4'h0, pix[0][7:0]      } + {3'h0, pix[1][7:0], 1'b0} + {4'h0, pix[2][7:0]      };
		gauss_rb <= {3'h0, pix[3][7:0], 1'b0} + {2'h0, pix[4][7:0], 2'b0} + {3'h0, pix[5][7:0], 1'b0};
		gauss_rc <= {4'h0, pix[6][7:0]      } + {3'h0, pix[7][7:0], 1'b0} + {4'h0, pix[8][7:0]      };
		
		gauss_r <= gauss_ra + gauss_rb + gauss_rc;
		

		gauss_ga <= {4'h0, pix[0][15:8]      } + {3'h0, pix[1][15:8], 1'b0} + {4'h0, pix[2][15:8]      };
		gauss_gb <= {3'h0, pix[3][15:8], 1'b0} + {2'h0, pix[4][15:8], 2'b0} + {3'h0, pix[5][15:8], 1'b0};
		gauss_gc <= {4'h0, pix[6][15:8]      } + {3'h0, pix[7][15:8], 1'b0} + {4'h0, pix[8][15:8]      };
		
		gauss_g <= gauss_ga + gauss_gb + gauss_gc;


		gauss_ba <= {4'h0, pix[0][23:16]      } + {3'h0, pix[1][23:16], 1'b0} + {4'h0, pix[2][23:16]      };
		gauss_bb <= {3'h0, pix[3][23:16], 1'b0} + {2'h0, pix[4][23:16], 2'b0} + {3'h0, pix[5][23:16], 1'b0};
		gauss_bc <= {4'h0, pix[6][23:16]      } + {3'h0, pix[7][23:16], 1'b0} + {4'h0, pix[8][23:16]      };
		
		gauss_b <= gauss_ba + gauss_bb + gauss_bc;
		
		
		// final RGB
		case(blur_on)
		1'b0 : {blue_out, green_out, red_out} <= pix[4];
		1'b1 : {blue_out, green_out, red_out} <= {(gauss_b[11] ? 8'hff : gauss_b[10:3]), (gauss_g[11] ? 8'hff : gauss_g[10:3]), (gauss_r[11] ? 8'hff : gauss_r[10:3])};
		endcase

		
	end


							
endmodule
							