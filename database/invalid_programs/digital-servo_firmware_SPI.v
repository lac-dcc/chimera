///////////////////////////////////////////////////////////////////////////////
// SPI.v
//
// 7/13/11
// David Leibrandt
//
//	SPI controller.
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module SPI(
	input	 wire										clk_in,
	input	 wire						   			rst_in,

	input  wire							 			trigger_in,
	input  wire	[TRANSFER_SIZE-1:0] 			data_in,
	output reg	[N_SDI*TRANSFER_SIZE-1:0]	data_out,
	output reg										ready_out,
	
	output reg						 				spi_scs_out,
	output reg						 				spi_sck_out,
	output reg						 				spi_sdo_out,
	input  wire	[N_SDI-1:0]		 				spi_sdi_in
);

// Parameters
parameter TRANSFER_SIZE	 = 8;	// size of data transfer in bits (<= 4096)
parameter SPI_CLK_DIV    = 8'h19; // run the SPI clock at 2 MHz
parameter SPI_POLARITY	 = 1'b1; // SDO is clocked into the slave device on the rising edge of SCK
parameter N_SDI			 = 1; // number of parallel SDI lines (only 1 and 3 work at present)

// SPI clock divider
reg       spi_clk;
reg [7:0] clk_counter;

always @(posedge clk_in or posedge rst_in) begin
	if (rst_in) begin
		clk_counter <= 8'b0;
		spi_clk <= 1'b0;
	end
	else begin
		if (clk_counter == (SPI_CLK_DIV - 8'b1)) begin
			clk_counter <= 8'b0;
			spi_clk <= 1'b1;
		end
		else begin
			clk_counter <= clk_counter + 8'b1;
			spi_clk <= 1'b0;
		end
	end
end

// State machine definitions
localparam IDLE 	= 3'h0;
localparam TRIG	= 3'h1;
localparam SPI1	= 3'h2;
localparam SPI2	= 3'h3;
localparam SPI3	= 3'h4;
localparam SPI4	= 3'h5;

// State
// The next line makes synthesis happy
// synthesis attribute INIT of state_f is "R"
reg   			    [2:0] state_f;
reg  				   [11:0] counter_f;

// State machine - combinatorial part
function [2:0] next_state;
	input   				   [2:0] state;
	input   				  [11:0] counter;
	
	begin
		case (state)
			IDLE: 
				next_state = IDLE;
			TRIG:
					next_state = SPI1;
			SPI1:
					next_state = SPI2;
			SPI2:
					next_state = SPI3;
			SPI3:
				if (counter == 12'b1)
					next_state = SPI4;
				else
					next_state = SPI2;
			SPI4:
					next_state = IDLE;
			default:
					next_state = IDLE;
		endcase
	end
endfunction

// State machine - sequential part
always @(posedge spi_clk or posedge rst_in or posedge trigger_in) begin
	if (rst_in) begin
		state_f <= IDLE;
		counter_f <= 12'b0;
		data_out <= 8'b0;
		ready_out <= 1'b0;
	end
	else if (trigger_in) begin
		state_f <= TRIG;
		data_out <= data_in;
		ready_out <= 1'b0;
	end
	else begin
		state_f <= next_state(state_f, counter_f);
		case (state_f)
			IDLE: begin
				ready_out <= 1'b1;
				spi_scs_out <= 1'b1;
				spi_sck_out <= SPI_POLARITY;
				spi_sdo_out <= 1'b1;
			end
			TRIG: begin
				counter_f <= TRANSFER_SIZE;
			end
			SPI1: begin
				spi_scs_out <= 1'b0;
			end
			SPI2: begin
				spi_sck_out <= ~SPI_POLARITY;
				spi_sdo_out <= data_out[TRANSFER_SIZE-1];
			end
			SPI3: begin
				if (N_SDI == 1)
					data_out <= {data_out[TRANSFER_SIZE-2:0], spi_sdi_in};
				else if (N_SDI == 3)
					data_out <= {data_out[2*TRANSFER_SIZE+:TRANSFER_SIZE-1], spi_sdi_in[2],
									 data_out[1*TRANSFER_SIZE+:TRANSFER_SIZE-1], spi_sdi_in[1],
									 data_out[0*TRANSFER_SIZE+:TRANSFER_SIZE-1], spi_sdi_in[0]};
				counter_f <= counter_f - 12'b1;
				spi_sck_out <= SPI_POLARITY;
			end
			SPI4: begin
				spi_scs_out <= 1'b1;
				spi_sdo_out <= 1'b1;
			end
			default: begin
				spi_scs_out <= 1'b1;
				spi_sck_out <= SPI_POLARITY;
				spi_sdo_out <= 1'b1;
			end
		endcase
	end
end

endmodule