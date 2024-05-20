// This program was cloned from: https://github.com/bangonkali/sram
// License: MIT License

`timescale 1ns/1ps
`define period 10

// http://www.nxp.com/documents/data_sheet/PCF8570.pdf
// iverilog -o test i2c_sram_embedded.v sram.v i2c_mock_master.v tb_i2c_sram.v && vvp test

module i2c_sram_embedded (
	sda,
	scl,
	my_addr,
	curr_data,
	rcvd_device_address,
	state,
	rcvd_mode
	);

	inout sda;
	input scl;

	wire sda_in;
	reg sda_is_slave_write;
	reg sda_out;

	input [6:0] my_addr;

	output reg [6:0] rcvd_device_address;
	reg [7:0] rcvd_data;
	output reg rcvd_mode;

	reg [8:0] counter;
	output reg [32:0] state;
	output reg [7:0] curr_data;

	assign sda_in = sda;
	assign sda = sda_is_slave_write ? sda_out: 1'bZ;

	/* operation:
	* at write, curr_data will be replaced by rcvd_data
	* at read, curr_data will be replaced by curr_data * curr_data
	*/

	//parameter `period = 10;

	parameter STOP                                   = 1;
	parameter START                                  = 2;
	parameter GET_DEVICE_ADDRESS                     = 3;
	parameter GET_MODE                               = 4;
	parameter READ_ADDRESS_PUT_ACK                   = 5;
	parameter GET_ACK                                = 6;

	// parameter SRAM_READ_GET_MEMORY_ADDRESS           = 7;
	// parameter SRAM_READ_GET_MEMORY_ADDRESS_PUT_ACK   = 8;
	parameter SRAM_READ_RETURN_VALUE_PART1           = 9;
	parameter SRAM_READ_RETURN_VALUE_PART1_GET_ACK   = 10;
	parameter SRAM_READ_RETURN_VALUE_PART2           = 11;
	parameter SRAM_READ_RETURN_VALUE_PART2_GET_ACK   = 12;
	parameter SRAM_READ_CONTINUE                     = 13;
	parameter SRAM_READ_INCREMENT_MEM_ADDRESS        = 14;

	parameter SRAM_WRITE_GET_MEMORY_ADDRESS          = 15;
	parameter SRAM_WRITE_GET_MEMORY_ADDRESS_PUT_ACK  = 16;
	parameter SRAM_WRITE_GET_DATA_PART1              = 17;
	parameter SRAM_WRITE_GET_DATA_PART1_PUT_ACK      = 18;
	parameter SRAM_WRITE_GET_DATA_PART2              = 19;
	parameter SRAM_WRITE_GET_DATA_PART2_PUT_ACK      = 20;
	parameter SRAM_WRITE_CONTINUE                    = 21;
	parameter SRAM_WRITE_INCREMENT_MEM_ADDRESS       = 22;

	reg clk;
	reg [7:0] address;
	wire [15:0] data_read;
	reg [15:0] data_write;
	inout [15:0] data;
	reg chip_enable;
	reg write_enable;
	reg output_enable;
	reg reset;
	reg [15:0] data_read2;

	// cache for received data for writing to sram
	reg [7:0] cache_data_write_p1;
	reg [7:0] cache_data_write_p2;

	wire do_write;
	wire do_enable;
	wire do_read;

	assign do_write = !write_enable;
	assign do_enable_chip = !chip_enable;
	assign do_read = output_enable;

	assign data = (do_write && do_enable_chip && do_read) ? data_write : 'bz;
	assign data_read = data;

	sram U_SRAM(
		.address(address),
		.data(data),
		.chip_enable(chip_enable),
		.write_enable(write_enable),
		.output_enable(output_enable),
		.reset(reset)
		);

	initial begin
		state = STOP;
		sda_is_slave_write = 0;
		counter = 0;
		curr_data = 0;
	end

	always @(negedge sda_in) begin
		if (scl == 1)
			state <= START;
	end

	always @(posedge sda_in) begin
		if (scl == 1)
			state <= STOP;
	end

	always @(posedge scl) begin
		case (state)
			GET_DEVICE_ADDRESS: rcvd_device_address[counter] <= sda_in;
			GET_MODE: rcvd_mode <= sda_in;
			// SRAM_READ_GET_MEMORY_ADDRESS: rcvd_data[counter] <= sda_in;
			SRAM_WRITE_GET_MEMORY_ADDRESS: rcvd_data[counter] <= sda_in;
			SRAM_WRITE_GET_DATA_PART1: rcvd_data[counter] <= sda_in;
			SRAM_WRITE_GET_DATA_PART2: rcvd_data[counter] <= sda_in;
		endcase
	end

	always @(negedge scl) begin
		case (state)

			START: begin
				state <= GET_DEVICE_ADDRESS;
				counter <= 3'h6;
			end

			GET_DEVICE_ADDRESS: begin
				if (counter == 0) begin
					state <= GET_MODE;
				end else begin
					counter <= counter - 1;
				end
			end

			GET_MODE: begin
				//#`period
				if (rcvd_device_address == my_addr) begin
					sda_is_slave_write <= 1;
					sda_out <= 0;


					output_enable <= 0; // active low / opposite
					chip_enable <= 0; // active low / opposite
					write_enable <= 1; // read (active low) / opposite
				end else begin
					sda_is_slave_write <= 0;
					sda_out <= 1;
				end

				state <= READ_ADDRESS_PUT_ACK;
			end

			READ_ADDRESS_PUT_ACK: begin
				output_enable <= 0; // active low / opposite
				chip_enable <= 1; // active low / opposite
				write_enable <= 1; // read (active low) / opposite

				if (rcvd_mode == 0) begin
					sda_is_slave_write <= 1;
					sda_out <= 0;
					state <= SRAM_WRITE_GET_MEMORY_ADDRESS;
					counter <= 7;
				end else begin
					sda_out <= 0;
					curr_data <= rcvd_data;
					address <= rcvd_data;
					chip_enable <= 0;
					assign data_read2 = data;
					address <= curr_data;
					counter <= 14; // prepare for sending first 8 bits of data
					state <= SRAM_READ_RETURN_VALUE_PART1;
					address <= curr_data;
					sda_is_slave_write <= 1;
					sda_out <= data_read[15];
				end
			end

			SRAM_READ_RETURN_VALUE_PART1: begin
				$display("%d\tdata_read[%d]=%d\tsda_out=%d\tdata=%b",$time,counter,data_read[counter],sda_out,data_read);
				if (counter == 7) begin
					state <= SRAM_READ_RETURN_VALUE_PART1_GET_ACK;
					sda_is_slave_write <= 0;
					counter <= 6;
				end else begin
					sda_is_slave_write <= 1; // prepare for writing sda, write data
					counter <= counter - 1;
					sda_out <= data_read[counter];
				end
			end

			SRAM_READ_RETURN_VALUE_PART1_GET_ACK : begin
				sda_is_slave_write <= 1; // prepare for getting ack (readonly sda)
				sda_out <= data_read[7];

				// $display("State=%d", SRAM_READ_RETURN_VALUE_PART1_GET_ACK);
				state <= SRAM_READ_RETURN_VALUE_PART2;
			end

			SRAM_READ_RETURN_VALUE_PART2: begin
				sda_is_slave_write <= 1; // prepare for writing sda, write data
				sda_out <= data_read[counter];
				counter <= counter - 1;

				// $display("sram_counter: %d\tsda_out:%b\tdata_read:%b\tdataread[c]:%b", counter, sda_out, data_read, data_read[counter]);

				if (counter == 0) begin
					state <= SRAM_READ_RETURN_VALUE_PART2_GET_ACK;
					sda_is_slave_write <= 0;
				end
			end

			SRAM_READ_RETURN_VALUE_PART2_GET_ACK : begin
				//#`period
				// prepare for getting ack (readonly sda)
				if (sda_out == 0) begin // looop again, increment address and send next first 8 bit of next 16 bits
					address <= address + 1;
					state <= STOP;
					counter <= 15; // prepare for sending first 8 bits of data
				end else begin // end comms
					state <= STOP; // comm ends if no ack received.
				end
			end

			SRAM_WRITE_GET_MEMORY_ADDRESS: begin
				if (counter == 0) begin
					sda_out <= 0;
					state <= SRAM_WRITE_GET_MEMORY_ADDRESS_PUT_ACK;
					curr_data <= rcvd_data;
					address <= rcvd_data; // received address goes to memory address param
					sda_is_slave_write <= 1;
				end else begin
					counter <= counter - 1;
					sda_is_slave_write <= 0;
				end
			end

			SRAM_WRITE_GET_MEMORY_ADDRESS_PUT_ACK: begin
				//#`period
				// Prepare reading from SRAM

				chip_enable <= 1; // turn off sram
				output_enable <= 1; // output is disable
				write_enable <= 0;

				// send out ack from slave to master
				sda_is_slave_write <= 0;
				sda_out <= 0;

				counter <= 7; // prepare for sending first 8 bits of data
				state <= SRAM_WRITE_GET_DATA_PART1;
			end

			SRAM_WRITE_GET_DATA_PART1: begin
				if (counter == 0) begin
					state <= SRAM_WRITE_GET_DATA_PART1_PUT_ACK;
					cache_data_write_p1 <= rcvd_data;
					sda_is_slave_write <= 1;
				end else begin
					counter <= counter - 1;
					sda_is_slave_write <= 0;
				end
			end

			SRAM_WRITE_GET_DATA_PART1_PUT_ACK: begin
				//#`period
				// send out ack from slave to master
				sda_is_slave_write <= 0; //cheat
				sda_out <= 0;

				counter <= 7; // prepare for sending first 8 bits of data
				state <= SRAM_WRITE_GET_DATA_PART2;
			end

			SRAM_WRITE_GET_DATA_PART2: begin
				if (counter == 0) begin
					chip_enable <= 0;
					state <= SRAM_WRITE_GET_DATA_PART2_PUT_ACK;
					cache_data_write_p2 <= rcvd_data;
					sda_is_slave_write <= 1;
				end else begin
					counter <= counter - 1;
					sda_is_slave_write <= 0;
				end
			end

			SRAM_WRITE_GET_DATA_PART2_PUT_ACK: begin
				data_write <= {cache_data_write_p1, cache_data_write_p2};// do the writing to memory
				#`period
				// send out ack from slave to master
				sda_is_slave_write <= 0; //cheat
				sda_out <= 0;

				counter <= 7; // prepare for sending first 8 bits of data
				state <= STOP;
				chip_enable <= 1;
			end
		endcase
	end
endmodule
