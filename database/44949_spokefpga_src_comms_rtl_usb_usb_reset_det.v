// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

// detects USB port reset signal from host
module usb_reset_det (
	  input clk,
	  input reset,

	  input usb_p_rx,  
	  input usb_n_rx,
	  
	   output usb_reset
	);
	localparam RESET_COUNT = 16'HFFFF;

	// reset detection (1 bit extra for overflow)
	reg [17:0] reset_timer = 0;

	// keep counting?
	wire timer_expired = reset_timer[ 17 ];

	// one time event when reset_timer = 0;	// assign usb_reset = !(|reset_timer);
	assign usb_reset = timer_expired;

	always @(posedge clk) begin
		if ( reset ) begin
			reset_timer <= RESET_COUNT;
		end else begin 
			// reset is both inputs low for 10ms
			if (usb_p_rx || usb_n_rx) begin
				reset_timer <= RESET_COUNT;
			end else begin 			
				reset_timer <= reset_timer - ((timer_expired)? 0 : 1);
			end	  
		end
	end
  
endmodule
