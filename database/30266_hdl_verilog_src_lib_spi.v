// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2020-05-06 by mza
// last updated 2020-05-07 by mza

// from https://en.wikipedia.org/wiki/Serial_Peripheral_Interface#/media/File:SPI_timing_diagram2.svg
//module spi_peripheral #(
//	parameter cpol = 0,
//	parameter cpha = 0
//) (
//	input sclock,
//	input reset,
//	input mosi,
//	output miso,
//	input cs_active_low
//);
//	reg [2:0] bit_counter = 0;
//	always @(posedge sclock) begin
//		if (reset) begin
//			bit_counter <= 0;
//		end else begin
//			if (cs_active_low==0) begin
//				bit_counter <= bit_counter + 1'b1;
//			end
//		end
//	end
//endmodule

// modified from https://www.fpga4fun.com/SPI2.html
module SPI_peripheral_simple8 (
	input clock,
	input SCK, SSEL, MOSI,
	output MISO,
	input [7:0] data_to_controller,
	output reg [7:0] data_from_controller = 0,
	output reg data_valid = 0
);
	// sync SCK, SSEL, MOSI to the FPGA clock using a 3-bits shift register
	reg [2:0] SCKr = 0;
	reg [2:0] SSELr = 0;
	reg [1:0] MOSIr = 0;
	always @(posedge clock) begin
		SCKr <= {SCKr[1:0], SCK};
		SSELr <= {SSELr[1:0], SSEL};
		MOSIr <= {MOSIr[0], MOSI};
	end
	wire SCK_risingedge = (SCKr[2:1]==2'b01);  // now we can detect SCK rising edges
	wire SCK_fallingedge = (SCKr[2:1]==2'b10);  // and falling edges
	wire SSEL_active = ~SSELr[1];  // SSEL is active low
	wire SSEL_startmessage = (SSELr[2:1]==2'b10);  // message starts at falling edge
	wire SSEL_endmessage = (SSELr[2:1]==2'b01);  // message stops at rising edge
	wire MOSI_data = MOSIr[1];
	// we handle SPI in 8-bits format, so we need a 3 bits counter to count the bits as they come in
	reg [2:0] bitcnt = 0;
	reg byte_received = 0;  // high when a byte has been received
	reg [7:0] byte_data_received = 0;
	always @(posedge clock) begin
		if (~SSEL_active) begin
			bitcnt <= 0;
		end else if (SCK_risingedge) begin
			bitcnt <= bitcnt + 1'b1;
			// implement a shift-left register (since we receive the data MSB first)
			byte_data_received <= {byte_data_received[6:0], MOSI_data};
		end
	end
	always @(posedge clock) begin
		data_valid <= 0;
		if (byte_received) begin
			data_from_controller <= byte_data_received;
			data_valid <= 1;
		end
		byte_received <= SSEL_active && SCK_risingedge && (bitcnt==7);
	end
	reg [7:0] byte_data_sent = 0;
//	reg [7:0] cnt = 0;
//	always @(posedge clock) begin
//		if (SSEL_startmessage) begin
//			cnt <= cnt + 8'h1;  // count the messages
//		end
//	end
	always @(posedge clock) begin
		if(SSEL_active) begin
			if (SSEL_startmessage) begin
				//byte_data_sent <= cnt;  // first byte sent in a message is the message count
				byte_data_sent <= data_to_controller;
			end else if (SCK_fallingedge) begin
				if (bitcnt==0) begin
					byte_data_sent <= 8'h00;  // after that, we send 0s
				end else begin
					byte_data_sent <= {byte_data_sent[6:0], 1'b0};
				end
			end
		end
	end
	assign MISO = byte_data_sent[7];	// send MSB first
	// we assume that there is only one peripheral on the SPI bus
	// so we don't bother with a tri-state buffer for MISO
	// otherwise we would need to tri-state MISO when SSEL is inactive
endmodule

module SPI_peripheral_simple8_tb;
	reg clock = 0;
	reg SCK = 0;
	reg MOSI = 0;
	reg SSEL = 1;
	wire MISO;
	reg [7:0] data_to_controller = 8'h89;
	wire [7:0] data_from_controller;
	wire data_valid;
	SPI_peripheral_simple8 spi_s8 (.clock(clock), .SCK(SCK), .MOSI(MOSI), .MISO(MISO), .SSEL(SSEL), .data_to_controller(data_to_controller), .data_from_controller(data_from_controller), .data_valid(data_valid));
	reg [7:0] data = 8'ha5;
	reg [7:0] i = 0;
	initial begin
		SCK <= 0;
		MOSI <= 0;
		SSEL <= 1;
		#200;
		SSEL <= 0;
		for (i=8; i>0; i=i-1) begin : command
			MOSI <= data[i-1];
			#100;
			SCK <= 1;
			#100;
			SCK <= 0;
		end
		MOSI <= 0;
		#100;
		SSEL <= 1;
	end
	always begin
		#10;
		clock <= ~clock;
	end
endmodule

// originally from https://www.fpga4fun.com/SPI2.html
// notes:
// raw pipelines should be 1 deeper (also the pickoffs)
// address16 and data32 and transaction_valid should probably have an extra level of buffering
// command8 should be interpreted and allow an addressless (autoincrement) mode
module SPI_peripheral_command8_address16_data32 (
	input clock,
	input SCK, SSEL, MOSI,
	output MISO,
	output reg [7:0] command8 = 0,
	output reg [15:0] address16 = 0,
	output reg [31:0] data32 = 0,
	input [31:0] data32_to_controller,
	output reg transaction_valid = 0
);
//	reg [8+16+32-1:0] word = 0;
	// sync SCK, SSEL, MOSI to the FPGA clock using a 3-bits shift register
	reg [2:0] SCKr = 0;
	reg [2:0] SSELr = 0;
	reg [1:0] MOSIr = 0;
	always @(posedge clock) begin
		SCKr <= {SCKr[1:0], SCK};
		SSELr <= {SSELr[1:0], SSEL};
		MOSIr <= {MOSIr[0], MOSI};
	end
	wire SCK_risingedge = (SCKr[2:1]==2'b01);  // now we can detect SCK rising edges
	wire SCK_fallingedge = (SCKr[2:1]==2'b10);  // and falling edges
	wire SSEL_active = ~SSELr[1];  // SSEL is active low
	wire SSEL_startmessage = (SSELr[2:1]==2'b10);  // message starts at falling edge
	wire SSEL_endmessage = (SSELr[2:1]==2'b01);  // message stops at rising edge
	wire MOSI_data = MOSIr[1];
	reg [3:0] bitcnt = 0;
	reg [3:0] bytecnt = 0;
	reg [7:0] byte_data_received = 0;
//	reg [7:0] error_count = 0;
	always @(posedge clock) begin
		transaction_valid <= 0;
		if (~SSEL_active) begin
			bitcnt <= 0;
			bytecnt <= 0;
		end else if (SCK_risingedge) begin
			bitcnt <= bitcnt + 1'b1;
			byte_data_received <= {byte_data_received[6:0], MOSI_data};
		end else begin
			if (bitcnt==8) begin
				if (bytecnt==0) begin
					command8 <= byte_data_received;
				// if (command8[3] and bytecnt==1)
				end else if (bytecnt==1) begin
					address16[15:8] <= byte_data_received;
				end else if (bytecnt==2) begin
					address16[7:0] <= byte_data_received;
					// address_valid <= 1;
				end else if (bytecnt==3) begin
					data32[31:24] <= byte_data_received;
				end else if (bytecnt==4) begin
					data32[23:16] <= byte_data_received;
				end else if (bytecnt==5) begin
					data32[15:8] <= byte_data_received;
				end else if (bytecnt==6) begin
					data32[7:0] <= byte_data_received;
					transaction_valid <= 1;
//				end else begin
//					error_count <= error_count + 1'b1;
				end
				bitcnt <= 0;
				bytecnt <= bytecnt + 1'b1;
			end
		end
	end
	reg [7:0] byte_data_sent = 0;
//	reg [7:0] cnt = 0;
//	always @(posedge clock) begin
//		if (SSEL_startmessage) begin
//			cnt <= cnt + 8'h1;  // count the messages
//		end
//	end
	reg [31:0] copy_of_data32_to_controller = 0;
	always @(posedge clock) begin
		if (SSEL_active) begin
//			if (SSEL_startmessage) begin
				//byte_data_sent <= cnt;  // first byte sent in a message is the message count
//				byte_data_sent <= data_to_controller;
//				byte_data_sent <= 8'h88;
			if (bytecnt==3 && bitcnt==0) begin
				copy_of_data32_to_controller <= data32_to_controller;
			end else if (SCK_fallingedge) begin
				copy_of_data32_to_controller <= { copy_of_data32_to_controller[30:0], 1'b0 };
//				byte_data_sent <= {byte_data_sent[6:0], 1'b0};
			end
		end
	end
	assign MISO = copy_of_data32_to_controller[31];	// send MSB first
	// we assume that there is only one peripheral on the SPI bus
	// so we don't bother with a tri-state buffer for MISO
	// otherwise we would need to tri-state MISO when SSEL is inactive
endmodule

module SPI_peripheral_command8_address16_data32_tb;
	reg clock = 0;
	reg SCK = 0;
	reg MOSI = 0;
	reg SSEL = 1;
	wire MISO;
//	reg [7:0] data_to_controller = 8'h89;
	wire transaction_valid;
	SPI_peripheral_command8_address16_data32 spi_c8_a16_d32 (.clock(clock), .SCK(SCK), .MOSI(MOSI), .MISO(MISO), .SSEL(SSEL), .transaction_valid(transaction_valid));
	reg [7:0] command8 = 8'h01;
	reg [15:0] address16 = 16'h2345;
	reg [31:0] data32 = 32'h6789abcd;
	reg [7:0] i = 0;
	initial begin
		SCK <= 0;
		MOSI <= 0;
		SSEL <= 1;
		#300;
		SSEL <= 0;
		for (i=8; i>0; i=i-1) begin : command
			MOSI <= command8[i-1];
			#100;
			SCK <= 1;
			#100;
			SCK <= 0;
		end
		for (i=16; i>0; i=i-1) begin : address
			MOSI <= address16[i-1];
			#100;
			SCK <= 1;
			#100;
			SCK <= 0;
		end
		for (i=32; i>0; i=i-1) begin : data
			MOSI <= data32[i-1];
			#100;
			SCK <= 1;
			#100;
			SCK <= 0;
		end
		MOSI <= 0;
		#100;
		SSEL <= 1;
	end
	always begin
		#10;
		clock <= ~clock;
	end
endmodule

