// This program was cloned from: https://github.com/bangonkali/sram
// License: MIT License

`define period 10
module i2c_slave (
	sda, 
	scl, 
	my_addr, 
	curr_data,
	rcvd_addr,
	state,
	rcvd_mode
);

	inout sda;
	input scl;

	wire sda_in;
	reg sda_dir;
	reg sda_out;

	input [6:0] my_addr;

	output reg [6:0] rcvd_addr;
	reg [7:0] rcvd_data;
	output reg rcvd_mode;

	reg [2:0] counter;
	output reg [2:0] state;
	output reg [7:0] curr_data;

	assign sda_in = sda;
	assign sda = sda_dir ? sda_out: 1'bZ;

	/* operation:
	* at write, curr_data will be replaced by rcvd_data
	* at read, curr_data will be replaced by curr_data * curr_data
	*/

	//parameter `period = 10;

    parameter STOP = 3'h0;
	parameter START = 3'h1;
	parameter GET_ADDR = 3'h3;
	parameter GET_MODE = 3'h7;
	parameter PUT_ACK = 3'h6;
	parameter GET_ACK = 3'h5;
	parameter GET_DATA = 3'h4;
	parameter PUT_DATA = 3'h2;

	initial begin
		state = STOP;
		sda_dir = 0;
		counter = 0;
		curr_data = 8'h12;
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
			GET_ADDR: rcvd_addr[counter] <= sda_in;
			GET_MODE: rcvd_mode <= sda_in;
		       	GET_DATA: rcvd_data[counter] <= sda_in;
		endcase
	end

	always @(negedge scl) begin
		case (state)
			START: begin
				state <= GET_ADDR;
				counter <= 3'h6;
			end
			GET_ADDR: begin
				if (counter == 0)
					state <= GET_MODE;
				else
					counter <= counter - 1;
			end
			GET_MODE: begin
				#`period
				if (rcvd_addr == my_addr) begin
					sda_dir <= 1;
					sda_out <= 0;
				end else begin
					sda_dir <= 0;
					sda_out <= 1;
				end
				state <= PUT_ACK;
			end
			PUT_ACK: begin
				#`period
				if (sda_out == 0) begin
					if (rcvd_mode == 0) begin
						sda_dir <= 0;
						state <= GET_DATA;
						counter <= 3'h7;
					end else begin
						sda_dir <= 1;
						state <= PUT_DATA;
						counter <= 3'h6;
						sda_out <= curr_data[7];
					end
				end else begin
					state <= STOP;
				end
			end
			GET_ACK: begin
				#`period
				sda_dir <= 0;
				state <= PUT_DATA;
			end
			GET_DATA: begin
				if (counter == 0) begin
					#`period
					sda_dir <= 1;
					sda_out <= 0;
					state <= PUT_ACK;
					curr_data <= rcvd_data;
				end else
					counter <= counter - 1;
			end
			PUT_DATA: begin
				#`period
				if (counter == 3'h7) begin
					state <= GET_ACK;
					sda_dir <= 0;
					sda_out <= 1;
					curr_data <= curr_data * curr_data;
				end else begin
					sda_dir <= 1;
					sda_out <= curr_data[counter];
					counter <= counter - 1;
				end
			end
		endcase
	end
endmodule
