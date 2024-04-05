///////////////////////////////////////////////////////////////////////////////
// AD5791.v
//
// 7/13/11
// David Leibrandt
//
//	AD5791 controller.
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module AD5791(
	input	 wire							clk_in,
	input	 wire						   rst_in,

	input  wire	signed	  [19:0] DAC_in,
	
	output reg						 	ldac_out,
	output reg						 	clr_out,
	output reg						 	rst_out,
	output wire						 	spi_scs_out,
	output wire						 	spi_sck_out,
	output wire						 	spi_sdo_out,
	input  wire						 	spi_sdi_in
);

reg			spi_trigger;
reg  [23:0]	spi_data;
wire			spi_ready;

SPI #(
	.TRANSFER_SIZE(24),
	.SPI_CLK_DIV(8'h02), // 8'h02 = run the SPI clock at 25 MHz
	.SPI_POLARITY(1'b0)  // clock data into the DAC on the clock negative edge
)
SPI_inst(
	.clk_in(clk_in),
	.rst_in(rst_in),
	.trigger_in(spi_trigger),
	.data_in(spi_data),
	.data_out(cmd_data_out),
	.ready_out(spi_ready),
	.spi_scs_out(spi_scs_out),
	.spi_sck_out(spi_sck_out),
	.spi_sdo_out(spi_sdo_out),
	.spi_sdi_in(spi_sdi_in)
);

///////////////////////////////////////////////////////////////////////////////
// State machine which controls initialization and communicates with the PC

// State machine definitions
localparam RST1A  = 4'h0;
localparam RST1B  = 4'h1;
localparam RST1C  = 4'h2;
localparam RST2A  = 4'h3;
localparam RST2B  = 4'h4;
localparam RST2C  = 4'h5;
localparam DAC1A	= 4'h6;
localparam DAC1B	= 4'h7;
localparam DAC1C	= 4'h8;

// State
// The next line makes synthesis happy
// synthesis attribute INIT of state_f is "R"
reg  [3:0]  state_f;
reg  [11:0] counter_f;

// State machine - combinatorial part
function [3:0] next_state;
	input    [3:0]  state;
	input    [11:0] counter;
	input				 ready;
	
	begin
		case (state)
			RST1A:
				if (counter == 12'b1)
					next_state = RST1B;
				else
					next_state = RST1A;
			RST1B:
					next_state = RST1C;
			RST1C:
				if (counter == 12'b1)
					next_state = RST2A;
				else
					next_state = RST1C;
			RST2A:
				if (ready)
					next_state = RST2B;
				else
					next_state = RST2A;
			RST2B:
					next_state = RST2C;
			RST2C:
					next_state = DAC1A;
			DAC1A:
				if (ready)
					next_state = DAC1B;
				else
					next_state = DAC1A;
			DAC1B:
					next_state = DAC1C;
			DAC1C:
					next_state = DAC1A;
			default:
					next_state = DAC1A;
		endcase
	end
endfunction

// State machine - sequential part
always @(posedge clk_in or posedge rst_in) begin
	if (rst_in) begin
		state_f <= RST1A;
		counter_f <= 12'hFFF;
		spi_trigger <= 1'b0;
		ldac_out <=1'b0;
		clr_out <=1'b1;
		rst_out <=1'b0;
	end
	else begin
		state_f <= next_state(state_f, counter_f, spi_ready);
		case (state_f)
			// Reset the DAC
			RST1A: begin
				counter_f <= counter_f - 12'b1;
			end
			RST1B: begin
				rst_out <=1'b1;
				counter_f <= 12'hFFF;
			end
			RST1C: begin
				counter_f <= counter_f - 12'b1;
			end
			// Set the control register
			RST2A: begin
				spi_data <= {1'b0, 3'b010, 20'h00002};
			end
			RST2B: begin
				spi_trigger <= 1'b1;
			end
			RST2C: begin
				spi_trigger <= 1'b0;
			end
			// Set the DAC register
			DAC1A: begin
				spi_data <= {1'b0, 3'b001, DAC_in};
			end
			DAC1B: begin
				spi_trigger <= 1'b1;
			end
			DAC1C: begin
				spi_trigger <= 1'b0;
			end
			endcase
	end
end

endmodule