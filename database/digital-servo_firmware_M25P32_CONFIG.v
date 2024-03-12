///////////////////////////////////////////////////////////////////////////////
// M25P32_CONFIG.v
//
// 3/10/11
// David Leibrandt
//
//	Non-volatile configuration register that is stored in a M25P32 flash memory.
// Limited to 2048 bits <= CONFIG_SIZE <= 524288 bits (1 sector), in increments of 2048 bits (1 page).
//
// addr_in = 16'h00?? --- get 16 bits of configuration variable with lsb = 16*data1_in
// addr_in = 16'h01?? --- set 16 bits of configuration variable with lsb = 16*data1_in
// addr_in = 16'h02?? --- load configuration from flash
// addr_in = 16'h03?? --- save configuration to flash
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module M25P32_CONFIG(
	input	 wire							clk_in,
	input	 wire						   rst_in,

	output reg  [CONFIG_SIZE-1:0] configuration_out,
	
	input  wire 			  			trig_in,
	input  wire 			  [15:0] addr_in,
	input	 wire 			  [15:0] data1_in,
	input	 wire 			  [15:0] data2_in,
	output reg  			  [15:0] data_out,
	
	output reg						 	spi_scs_out,
	output reg						 	spi_sck_out,
	output reg						 	spi_sdo_out,
	input  wire						 	spi_sdi_in
);

// Parameters
parameter CONFIG_SIZE	 = 32;			// size of configuration variable in bits (<= 524288)
parameter SPI_CLK_DIV    =  8'h19;     // M25P32 has a max SPI clock of 75 MHz, clk_in = 100 MHz and SPI_CLK_DIV = 8'h0A generates a 5 MHz SPI clock, I seem to run into trouble if I try to go faster (probably due to poor FSM design)
parameter SPI_ADDRESS    = 24'h3F0000; // address of memory sector to store data (sector 63)

// SPI clock divider
reg       spi_clk;
reg [7:0] clk_counter;

always @(posedge clk_in or posedge rst_in) begin
	if (rst_in) begin
		clk_counter <= 8'b0;
		spi_clk <= 1'b0;
	end
	else if (clk_counter == (SPI_CLK_DIV - 8'b1)) begin
		clk_counter <= 8'b0;
		spi_clk <= 1'b1;
	end
	else begin
		clk_counter <= clk_counter + 8'b1;
		spi_clk <= 1'b0;
	end
end

// Stretch the input trigger to 1 SPI clock cycle
reg [7:0] trig_counter;
wire trig_long;

always @(posedge clk_in or posedge rst_in) begin
	if (rst_in)
		trig_counter <= 8'b0;
	else begin
		if (trig_in & ~|trig_counter)
			trig_counter <= SPI_CLK_DIV;
		else if (|trig_counter)
			trig_counter <= trig_counter - 8'b1;
	end
end

assign trig_long = |trig_counter;

// M25P32 commands
localparam WREN_CMD = {8'h06, 24'h0};
localparam WREN_LEN = 20'd8;

localparam SE_CMD   = {8'hD8, SPI_ADDRESS};
localparam SE_LEN   = 20'd32;

localparam RDSR_CMD = {8'h05, 24'h0};
localparam RDSR_LEN = 20'd16;

localparam PP_CMD   = {8'h02, SPI_ADDRESS};
localparam PP_LEN   = 20'd32 + 20'd2048;

localparam READ_CMD = {8'h03, SPI_ADDRESS};
localparam READ_LEN = 20'd32 + CONFIG_SIZE;

// State machine definitions
localparam IDLE 	= 5'h00;
localparam RESET  = 5'h01;
localparam GET		= 5'h02;
localparam SET		= 5'h03;
localparam WREN1	= 5'h04;
localparam SE		= 5'h05;
localparam RDSR1A	= 5'h06;
localparam RDSR1B	= 5'h07;
localparam WREN2	= 5'h08;
localparam PP1		= 5'h09;
localparam PP2		= 5'h0A;
localparam PP3		= 5'h0B;
localparam RDSR2A	= 5'h0C;
localparam RDSR2B	= 5'h0D;
localparam READ1	= 5'h0E;
localparam READ2	= 5'h0F;
localparam SPI1	= 5'h10;
localparam SPI2	= 5'h11;
localparam SPI3	= 5'h12;
localparam SPI4	= 5'h13;

// State
// The next line makes synthesis happy
// synthesis attribute INIT of state_f is "R"
reg   			    [4:0] state_f;
reg  				    [4:0] spi_next_state_f;
reg [CONFIG_SIZE+32-1:0] spi_data_f;
reg  				   [19:0] spi_counter_f;
reg					[31:0] pp_cmd_f;
reg					[19:0] pp_offset_f;

// State machine - combinatorial part
function [4:0] next_state;
	input      [4:0] state;
	input      [3:0] spi_next_state;
	input		 		  trigger;
	input	    [15:0] address;
	input 			  write_in_progress;
	input				  pp_complete;
	input     [19:0] spi_counter;
	
	begin
		case (state)
			IDLE: 
				if (spi_counter > 20'b0)
					next_state = RESET;
				else if (trigger & (address[15:8] == 8'h00))
					next_state = GET;
				else if (trigger & (address[15:8] == 8'h01))
					next_state = SET;
				else if (trigger & (address[15:8] == 8'h02))
					next_state = READ1;
				else if (trigger & (address[15:8] == 8'h03))
					next_state = WREN1;
				else
					next_state = IDLE;
			RESET:
				if (spi_counter == 20'b1)
					next_state = READ1;
				else
					next_state = RESET;
			GET:
					next_state = IDLE;
			SET:
					next_state = IDLE;
			WREN1:
					next_state = SPI1;
			SE:
					next_state = SPI1;
			RDSR1A:
					next_state = SPI1;
			RDSR1B:
				if (write_in_progress)
					next_state = RDSR1A;
				else
					next_state = PP1;
			PP1:
					next_state = WREN2;
			WREN2:
					next_state = SPI1;
			PP2:
					next_state = PP3;
			PP3:
					next_state = SPI1;
			RDSR2A:
					next_state = SPI1;
			RDSR2B:
				if (write_in_progress)
					next_state = RDSR2A;
				else if (~pp_complete)
					next_state = WREN2;
				else
					next_state = IDLE;
			READ1:
					next_state = SPI1;
			READ2:
					next_state = IDLE;
			SPI1:
					next_state = SPI2;
			SPI2:
					next_state = SPI3;
			SPI3:
				if (spi_counter == 20'b1)
					next_state = SPI4;
				else
					next_state = SPI2;
			SPI4:
					next_state = spi_next_state;
			default:
					next_state = IDLE;
		endcase
	end
endfunction

// State machine - sequential part
always @(posedge spi_clk or posedge rst_in) begin
	if (rst_in) begin
		state_f <= IDLE;
		spi_next_state_f <= IDLE;
		spi_data_f <= {32'b0, {CONFIG_SIZE{1'b0}}};
		spi_counter_f <= 20'h02; // wait a couple spi_clk cycles after rst_in to read the flash
		pp_cmd_f <= PP_CMD;
		pp_offset_f <= 20'b0;
		configuration_out <= {CONFIG_SIZE{1'b0}};
		data_out <= 16'b0;
	end
	else begin
		state_f <= next_state(state_f, spi_next_state_f, trig_long, addr_in, spi_data_f[0], (pp_offset_f == 20'b0), spi_counter_f);
		case (state_f)
			IDLE: begin
				spi_scs_out <= 1'b1;
				spi_sck_out <= 1'b1;
				spi_sdo_out <= 1'b1;
			end
			RESET: begin
				spi_counter_f <= spi_counter_f - 20'b1;
			end
			GET: begin
				data_out <= configuration_out[({data1_in, 4'b0})+:16];
			end
			SET: begin
				configuration_out[({data1_in, 4'b0})+:16] <= data2_in;
			end
			WREN1: begin
				spi_data_f <= {WREN_CMD, {CONFIG_SIZE{1'b0}}};
				spi_counter_f <= WREN_LEN;
				spi_next_state_f <= SE;
			end
			SE: begin
				spi_data_f <= {SE_CMD, {CONFIG_SIZE{1'b0}}};
				spi_counter_f <= SE_LEN;
				spi_next_state_f <= RDSR1A;
			end
			RDSR1A: begin
				spi_data_f <= {RDSR_CMD, {CONFIG_SIZE{1'b0}}};
				spi_counter_f <= RDSR_LEN;
				spi_next_state_f <= RDSR1B;
			end
			PP1: begin
				pp_cmd_f <= PP_CMD - 32'd256;
				pp_offset_f <= CONFIG_SIZE;
			end
			WREN2: begin
				spi_data_f <= {WREN_CMD, {CONFIG_SIZE{1'b0}}};
				spi_counter_f <= WREN_LEN;
				spi_next_state_f <= PP2;
			end
			PP2: begin
				pp_cmd_f <= pp_cmd_f + 32'd256;
				pp_offset_f <= pp_offset_f - 20'd2048;
			end
			PP3: begin
				spi_data_f <= {pp_cmd_f, configuration_out[pp_offset_f+:2048], {(CONFIG_SIZE - 2048){1'b0}}};
				spi_counter_f <= PP_LEN;
				spi_next_state_f <= RDSR2A;
			end
			RDSR2A: begin
				spi_data_f <= {RDSR_CMD, {CONFIG_SIZE{1'b0}}};
				spi_counter_f <= RDSR_LEN;
				spi_next_state_f <= RDSR2B;
			end
			READ1: begin
				spi_data_f <= {READ_CMD, {CONFIG_SIZE{1'b0}}};
				spi_counter_f <= READ_LEN;
				spi_next_state_f <= READ2;
			end
			READ2: begin
				configuration_out <= spi_data_f[CONFIG_SIZE-1:0];
			end
			SPI1: begin
				spi_scs_out <= 1'b0;
			end
			SPI2: begin
				spi_sck_out <= 1'b0;
				spi_sdo_out <= spi_data_f[CONFIG_SIZE+32-1];
			end
			SPI3: begin
				spi_data_f <= {spi_data_f[CONFIG_SIZE+32-2:0], spi_sdi_in};
				spi_counter_f <= spi_counter_f - 20'b1;
				spi_sck_out <= 1'b1;
			end
			SPI4: begin
				spi_scs_out <= 1'b1;
				spi_sdo_out <= 1'b1;
			end
			endcase
	end
end

endmodule