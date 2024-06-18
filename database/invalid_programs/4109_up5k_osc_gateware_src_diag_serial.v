// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// diag_serial.v - serial output diagnostics
// 04-27-21 E. Brombaugh

`default_nettype none

module diag_serial(
    input clk,              // 48MHz CPU clock
    input reset,            // Low-true reset
    
	input [11:0] a0, a1, a2, a3,
	output tx
);
	// hard-coded bit-rate
	localparam sym_rate = 115200;
    localparam clk_freq = 48000000;
    localparam sym_cnt = clk_freq / sym_rate;
	localparam SCW = $clog2(sym_cnt);
	
	wire [SCW-1:0] sym_cntr = sym_cnt;
	
	// sequencing state machine
	reg [1:0] chl;
	reg [2:0] char;
	reg [7:0] din;
	reg [11:0] a_mux;
	reg [3:0] nybble;
	reg [7:0] digit;
	reg tx_start;
	wire tx_busy;
	always @(posedge clk)
	begin
		if(reset)
		begin
			chl <= 2'b00;
			char <= 3'b000;
			din <= 2'h00;
			tx_start <= 1'b0;
		end
		else
		begin
			// start next char
			tx_start <= !tx_busy;
			
			// advance state
			if(!tx_start && !tx_busy)
			begin
				// choose char
				case(char)
					3'b000: din <= digit;
					3'b001: din <= digit;
					3'b010: din <= digit;
					3'b011: din <= (chl == 3) ? 8'h0d : 8'h20;
					3'b100: din <= (chl == 3) ? 8'h0a : 8'h20;
				endcase
				
				char <= char + 3'b001;
				if(char == 3'b100)
				begin
					char <= 3'b000;
					chl <= chl + 2'b01;
				end
			end
			
			// choose channel
			case(chl)
				2'b00: a_mux <= a0;
				2'b01: a_mux <= a1;
				2'b10: a_mux <= a2;
				2'b11: a_mux <= a3;
			endcase
			
			// choose nybble
			case(char)
				3'b000: nybble <= a_mux[11:8];
				3'b001: nybble <= a_mux[7:4];
				3'b010: nybble <= a_mux[3:0];
			endcase
			
			// convert nybble to hex
			if(nybble > 4'h9)
				digit = nybble + 8'd55;
			else
				digit = nybble + 8'd48;
		end
	end
	
	// Transmitter
	acia_tx #(
		.SCW(SCW),              // rate counter width
		.sym_cnt(sym_cnt)       // rate count value
	)
	my_tx(
		.clk(clk),				// system clock
		.rst(reset),			// system reset
		.tx_dat(din),           // transmit data byte
		.tx_start(tx_start),    // trigger transmission
		.tx_serial(tx),         // tx serial output
		.tx_busy(tx_busy)       // tx is active (not ready)
	);
endmodule

