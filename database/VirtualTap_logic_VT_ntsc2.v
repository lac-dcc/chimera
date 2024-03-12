// VIRTUALTAP Rev. C CPLD logic
// Version 2-NTSC, for Max V 5M240ZT100
// (C) 2018 Sean "furrtek" Gonsalves

module VT_NTSC2 (
		input CLK_40M,
		input [15:0] VB_PIXELS,
		input VB_CS, VB_SHIFT,
		input VB_CLEAR,						// Unused
		input VB_CLKA, VB_CLKB, VB_CLKC,	// Unused, smooth fading
		input PAL_SW,						// Pull-up required !
		input MODE,							// Pull-up required !
		inout [15:0] SRAM_DATA,
		output [15:0] SRAM_ADDR,
		output nSRAM_WE, nSRAM_OE,
		output V_VS,						// Composite sync
		output [1:0] V_RED,
		output [1:0] V_GREEN,
		output [1:0] V_BLUE
);

reg [11:0] HCOUNT;		// Sync gen
reg [8:0] VCOUNT;		// Sync gen
reg [1:0] PIXEL_OUT;
reg [3:0] VB_CS_SR;		// Shift registers for edge detection
reg [3:0] VB_SHIFT_SR;
reg [1:0] PAL_SW_SR;
reg WRITE_FLAG;
reg [13:0] WRITE_ADDR;
reg [15:0] PIXELS_IN;
reg [2:0] PAIR_INDEX;	// 0~7
reg [4:0] READ_OFFSET;	// 0~27
reg [13:0] READ_COUNTER;
reg [2:0] PALETTE = 0;
reg [1:0] BUFFER_WR;
reg [1:0] BUFFER_RD;

wire ACTIVE_V, ACTIVE;
wire NTSC_HS, NTSC_VS;
reg [2:0] HSTRETCH;
wire [13:0] READ_ADDR;
wire [1:0] BUFFER_WR_SW;
wire [1:0] BUFFER_RD_SW;
wire [1:0] PAL_RED;
wire [1:0] PAL_GREEN;
wire [1:0] PAL_BLUE;

reg [23:0] PAL_COLORS;

// Palette LUT
always @(*)
begin						 // 11    10    01    00
	case(PALETTE)			 // RRGGBBRRGGBBRRGGBBRRGGBB
		3'd0: PAL_COLORS <= 24'b110000100000010000000000;	// Red gradient
		3'd1: PAL_COLORS <= 24'b111100101000010100000000;	// Yellow gradient
		3'd2: PAL_COLORS <= 24'b001100001000000100000000;	// Green gradient
		3'd3: PAL_COLORS <= 24'b001111001010000101000000;	// Cyan gradient
		3'd4: PAL_COLORS <= 24'b000011000010000001000000;	// Blue gradient
		3'd5: PAL_COLORS <= 24'b110011100010010001000000;	// Magenta gradient
		3'd6: PAL_COLORS <= 24'b111111101010010101000000;	// White gradient
		3'd7: PAL_COLORS <= 24'b000000010101101010111111;	// White inverted gradient
	endcase
end

// Decompose PAL_COLORS to RGB depending on pixel value
assign PAL_RED = (PIXEL_OUT == 2'b11) ? PAL_COLORS[23:22] :
						(PIXEL_OUT == 2'b10) ? PAL_COLORS[17:16] :
						(PIXEL_OUT == 2'b01) ? PAL_COLORS[11:10] :
						PAL_COLORS[5:4];
assign PAL_GREEN = (PIXEL_OUT == 2'b11) ? PAL_COLORS[21:20] :
						(PIXEL_OUT == 2'b10) ? PAL_COLORS[15:14] :
						(PIXEL_OUT == 2'b01) ? PAL_COLORS[9:8] :
						PAL_COLORS[3:2];
assign PAL_BLUE = (PIXEL_OUT == 2'b11) ? PAL_COLORS[19:18] :
						(PIXEL_OUT == 2'b10) ? PAL_COLORS[13:12] :
						(PIXEL_OUT == 2'b01) ? PAL_COLORS[7:6] :
						PAL_COLORS[1:0];

// Blank video output when needed
assign V_RED = ACTIVE ? PAL_RED : 2'b00;
assign V_GREEN = ACTIVE ? PAL_GREEN : 2'b00;
assign V_BLUE = ACTIVE ? PAL_BLUE : 2'b00;

// Perform writes only when HSTRETCH=0
assign nSRAM_WE = ~(WRITE_FLAG & (HSTRETCH == 0));
assign nSRAM_OE = ~nSRAM_WE;
assign SRAM_DATA = nSRAM_OE ? PIXELS_IN : 16'bzzzzzzzzzzzzzzzz;

// Active:
//   W=384*5=1920px
//   H=224*1=224px
assign ACTIVE_V = (VCOUNT >= 24) && (VCOUNT < 248);
assign ACTIVE = (HCOUNT >= 500) && (HCOUNT < 2410) && ACTIVE_V;
assign NTSC_HS = !((HCOUNT >= 0) && (HCOUNT < 188));
assign NTSC_VS = ((VCOUNT >= 0) && (VCOUNT < 6));
assign V_VS = NTSC_HS ^ NTSC_VS;

// READ_COUNTER is the column number * 28
// READ_OFFSET is the index for a 8-pixel block in the column
assign READ_ADDR = READ_OFFSET + READ_COUNTER;

// Select between buffer counters or fixed buffers depending on MODE input
assign BUFFER_RD_SW = MODE ? BUFFER_RD : 2'b00;
assign BUFFER_WR_SW = MODE ? BUFFER_WR : 2'b00;

// Select between read or write address depending on access CYCLE
assign SRAM_ADDR = (HSTRETCH != 0) ? {BUFFER_RD_SW, READ_ADDR} : {BUFFER_WR_SW, WRITE_ADDR};

// Only used for simulation
initial
begin
	PAIR_INDEX <= 0;
	HCOUNT <= 0;
	VCOUNT <= 0;
	HSTRETCH <= 0;
	BUFFER_RD <= 0;
	BUFFER_WR <= 0;
	WRITE_FLAG <= 0;
	READ_OFFSET <= 0;
	READ_COUNTER <= 0;
	WRITE_ADDR <= 0;
end

always @(posedge CLK_40M)
begin

	// Shift VB_CS and VB_SHIFT in
	VB_CS_SR <= {VB_CS_SR[2:0], VB_CS};
	VB_SHIFT_SR = {VB_SHIFT_SR[2:0], VB_SHIFT};
	
	// Detect VB_CS rising edge
	if (VB_CS_SR[3:0] == 4'b1100)
	begin
		// New frame, reset write address and increment write buffer index
		WRITE_ADDR <= 14'h0000;
		BUFFER_WR <= BUFFER_WR + 1'b1;
	end
	
	// Detect VB_SHIFT rising edge
	if (VB_CS && (VB_SHIFT_SR == 4'b0011)&& (!WRITE_FLAG))
	begin
		// Latch pixel data and set WRITE_FLAG
		WRITE_FLAG <= 1'b1;
		PIXELS_IN <= VB_PIXELS;
	end
	
	// SRAM access cycle control
	if (HSTRETCH == 4)
	begin
		// HSTRETCH was 4 (read)
		// Latch SRAM data and select appropriate pixel (bit pair) for output
		if (PAIR_INDEX == 3'd0) PIXEL_OUT <= {SRAM_DATA[1], SRAM_DATA[0]};
		if (PAIR_INDEX == 3'd1) PIXEL_OUT <= {SRAM_DATA[14], SRAM_DATA[15]};
		if (PAIR_INDEX == 3'd2) PIXEL_OUT <= {SRAM_DATA[3], SRAM_DATA[2]};
		if (PAIR_INDEX == 3'd3) PIXEL_OUT <= {SRAM_DATA[12], SRAM_DATA[13]};
		if (PAIR_INDEX == 3'd4) PIXEL_OUT <= {SRAM_DATA[5], SRAM_DATA[4]};
		if (PAIR_INDEX == 3'd5) PIXEL_OUT <= {SRAM_DATA[10], SRAM_DATA[11]};
		if (PAIR_INDEX == 3'd6) PIXEL_OUT <= {SRAM_DATA[7], SRAM_DATA[6]};
		if (PAIR_INDEX == 3'd7) PIXEL_OUT <= {SRAM_DATA[8], SRAM_DATA[9]};
	end
	else if (HSTRETCH == 0)
	begin
		// HSTRETCH was 0 (write)
		if (WRITE_FLAG)
		begin
			// Write done, reset flag and increment write address
			WRITE_FLAG <= 1'b0;
			WRITE_ADDR <= WRITE_ADDR + 1'b1;
		end
	end

	// NTSC sync
	// 1clk = 1/40M = 25ns
	// 1 NTSC line = 63.556us = ~2542clk
	if (HCOUNT < 2541)	// Whole line
	begin
		// In active frame, next column
		// Horizontal pixel stretching is done here
		if (ACTIVE)
		begin
			if (HSTRETCH == 3'd0)
				READ_COUNTER <= READ_COUNTER + 14'd28;
		
			if (HSTRETCH == 3'd4)
				HSTRETCH <= 0;
			else
				HSTRETCH <= HSTRETCH + 1'b1;
		end
		else
			HSTRETCH <= 0;
		HCOUNT <= HCOUNT + 1'b1;
	end
	else
	begin
		// New raster line
		HCOUNT <= 0;
		HSTRETCH <= 0;
		
		// Restart at first column
		READ_COUNTER <= 0;
		
		if (ACTIVE_V)
		begin
			// Move to next 8-pixel column if needed
			if (PAIR_INDEX == 3'd7)
				READ_OFFSET <= READ_OFFSET + 1'b1;
			PAIR_INDEX <= PAIR_INDEX + 1'b1;
		end
		
		if (VCOUNT == 261)	// Whole frame
		begin
			// New frame
			VCOUNT <= 0;
			READ_OFFSET <= 0;
			PAIR_INDEX <= 3'd0;
			BUFFER_RD <= BUFFER_WR - 1'b1;	// Keep BUFFER_RD away from BUFFER_WR
			
            // Read color switch
			PAL_SW_SR <= {PAL_SW_SR[0], PAL_SW};
			// Detect PAL_SW falling edge
			if (PAL_SW_SR[1:0] == 2'b10)
				PALETTE <= PALETTE + 1'b1;
		end
		else
			VCOUNT <= VCOUNT + 1'b1;
	end
end

endmodule
