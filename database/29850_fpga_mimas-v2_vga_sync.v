// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module sync(
    input               CLK,
    output              HSYNC,
    output              VSYNC,
    output              ACTIVE,
    output wire [12:0]  h,
    output wire [12:0]  v
);

    // Timing parameters (1024x768 @ 60 Hz)
	/*
	localparam H_ACTIVE = 1024;     // Horizontal active pixels
	localparam H_FPORCH = 24;       // Horizontal front porch
	localparam H_PULSE  = 136;      // Horizontal sync pulse
	localparam H_BPORCH = 160;      // Horizontal back porch
	localparam V_ACTIVE = 768;      // Vertical active pixels
	localparam V_FPORCH = 3;        // Vertical front porch
	localparam V_PULSE  = 6;        // Vertical sync pulse
	localparam V_BPORCH = 29;       // Vertical back porch
	*/

	// Timing parameters (1600x1200 @ 60 Hz)
	localparam H_ACTIVE = 1600;     // Horizontal active pixels
	localparam H_FPORCH = 64;       // Horizontal front porch
	localparam H_PULSE  = 192;      // Horizontal sync pulse
	localparam H_BPORCH = 304;      // Horizontal back porch
	localparam V_ACTIVE = 1200;     // Vertical active pixels
	localparam V_FPORCH = 1;        // Vertical front porch
	localparam V_PULSE  = 3;        // Vertical sync pulse
	localparam V_BPORCH = 46;       // Vertical back porch

	// Calculated timing parameters
	localparam H_SYNC_S = H_ACTIVE + H_FPORCH;     							// Horizontal sync start
	localparam H_SYNC_E = H_SYNC_S + H_PULSE;      							// Horizontal sync end
	localparam H_TOTAL  = H_ACTIVE + H_FPORCH + H_PULSE + H_BPORCH - 1;     // Horizontal total pixels
	localparam V_SYNC_S = V_ACTIVE + V_FPORCH;     							// Horizontal sync start
	localparam V_SYNC_E = V_SYNC_S + V_PULSE;      							// Horizontal sync end
	localparam V_TOTAL  = V_ACTIVE + V_FPORCH + V_PULSE + V_BPORCH - 1;     // Horizontal total pixels

    // Position registers
	reg [12:0] h_out, v_out;
	
	// Generate horizontal and vertical sync signals
	always @(posedge CLK) begin
		// Reset horizontal position if at last pixel
		// else increment to next pixel
		h_out <= h_out == H_TOTAL ? 0 : h_out + 1;
		
		// Increment vertical position after horizontal reset
		// and reset vertical position if at last row
		// else do nothing
		v_out <= h_out == 0 ? (
			v_out == V_TOTAL ? 0 : v_out + 1
		) : v_out;
	end
	
	// Assign outputs
	assign HSYNC  = ~( h_out >= H_SYNC_S && h_out <= H_SYNC_E );
	assign VSYNC  = ~( v_out >= V_SYNC_S && v_out <= V_SYNC_E );
    assign ACTIVE = h_out < H_ACTIVE && v_out < V_ACTIVE;
    assign h = h_out;
    assign v = v_out;
endmodule
