/*************************************************************************************
 *
 * @file 		ad9361_spi_drv.v
 * @brief 		AD9361 chip SPI interface driver module.
 * @author 		Tang Tao, DSP Lab.
 * @date 		2017.6.12
 *
 *************************************************************************************/
`timescale 1ns / 1ps

module ad936_spi_drv(
	// Input clock and reset signal.
	input 					sys_clk,
	input 					sys_rst,
	
	// SPI command data signal.
	input  		[9 : 0] 	ad9361_reg_addr,
	input  		[7 : 0]  	ad9361_reg_data_in,
	input 					ad9361_reg_data_in_en,
	input 					ad9361_reg_wr_rdn,
	output reg	[7 : 0]  	ad9361_reg_data_out,
	output reg				ad9361_reg_data_out_en,
	
	// SPI interface and status signal.
	output reg				ad9361_spi_cs,
	output					ad9361_spi_sclk,
	output reg				ad9361_spi_mosi,
	input 					ad9361_spi_miso,
	
	output reg 				ad9361_spi_busy
);

	/* SPI interface state reg. */
	reg  [4 : 0] 	state;
	/* SPI interface 24-bit command data reg. */
	reg  [23 : 0] 	cmd;
	/* SPI interface send data state reg. */
	reg  [4 : 0] 	shift_reg;
	/* Read enable reg. */
	reg 			rd_en;
	
	/* Set SPI interface SCLK is VC707 clock, 20MHz. */
	assign ad9361_spi_sclk = sys_clk;
	
	/* According to the timing, send data on the posedge of the clock signal. */
	always @ (posedge sys_clk or posedge sys_rst)
		if (sys_rst) begin
			ad9361_spi_mosi <= 1'b0;
			ad9361_spi_cs   <= 1'b1;
			ad9361_spi_busy <= 1'b0;
			
			cmd 	  <= 24'd0;
			state 	  <= 5'b0_0001;
			shift_reg <= 5'd0;
			rd_en 	  <= 1'b0;
		end else begin
			case (state)
				/* SPI interface receive up-level data state. */
				5'b0_0001: begin
					/* If the input command data is valid, then read all these data. */
					if (ad9361_reg_data_in_en) begin
						cmd <= {ad9361_reg_wr_rdn, 3'd0, 2'd0, ad9361_reg_addr, 
							ad9361_reg_data_in};
						rd_en <= ~ad9361_reg_wr_rdn;
						ad9361_spi_busy <= 1'b1;		// Set the SPI interface busy flag.
						state <= 5'b0_0010;
					/* If the AD9361 configuration data valid signal is 0, wait. */
					end else begin 
					end
				end
				/* SPI interface preparing state. */
				5'b0_0010: begin
					ad9361_spi_cs <= 1'b1;				// Disable SPI interface.
					state <= 5'b0_0100;
				end
				/* SPI interface 24-bit data transferring state. */
				5'b0_0100: begin
					/* If the 24-bit command data haven't been completed yet. */
					if (shift_reg <= 5'd23) begin
						ad9361_spi_cs <= 1'b0;
						ad9361_spi_mosi <= cmd[23];
						cmd <= cmd << 1;
						shift_reg <= shift_reg + 1'b1;
						state <= 5'b0_0100;
					/* If all of the 24-bit data has been transmitted. */
					end else begin
						ad9361_spi_cs <= 1'b1;			// Disable SPI.
						ad9361_spi_mosi <= 1'b0;		// Idle state.
						shift_reg <= 5'd0;
						state <= 5'b1_0000;
					end
				end
				/* SPI interface send completed state, wait for 1 clock. */
				5'b0_1000: begin
					state <= 5'b1_0000;
				end
				/* Wait for register data valid signal to reset. */
				5'b1_0000: begin
					/* If the data valid signal is reset. */
					if (!ad9361_reg_data_in_en) begin 
						ad9361_spi_busy <= 1'b0;		// SPI idle.
						state <= 5'b0_0001;
					/* If the data valid signal is still set, then wait to reset. */
					end else begin 
						ad9361_spi_busy <= 1'b1;		// SPI busy.
						state <= 5'b1_0000;
					end
				end
			endcase
		end

	/* 8-bit read register data reg. */
	reg [7:0] dout_reg;
	/* Read data valid reg. */
	reg dout_en_reg;
	
	/* Sample the AD9361 data at the negedge of the clock signal. */
	always @ (negedge sys_clk or posedge sys_rst)
		if (sys_rst) begin
			dout_reg <= 8'd0;
			dout_en_reg <= 1'b0;
		/* If read AD9361 signal is valid, then read the MISO signal. */
		end else if (rd_en) begin
			case (shift_reg)
				/* MSB first. */
				5'd17: begin 
					dout_reg[7] <= ad9361_spi_miso;
					dout_en_reg <= 1'b0;
				end
				5'd18: begin 
					dout_reg[6] <= ad9361_spi_miso;
					dout_en_reg <= 1'b0;
				end
				5'd19: begin 
					dout_reg[5] <= ad9361_spi_miso;
					dout_en_reg <= 1'b0;
				end
				5'd20: begin 
					dout_reg[4] <= ad9361_spi_miso;
					dout_en_reg <= 1'b0;
				end
				5'd21: begin 
					dout_reg[3] <= ad9361_spi_miso;
					dout_en_reg <= 1'b0;
				end
				5'd22: begin 
					dout_reg[2] <= ad9361_spi_miso;
					dout_en_reg <= 1'b0;
				end
				5'd23: begin 
					dout_reg[1] <= ad9361_spi_miso;
					dout_en_reg <= 1'b0;
				end
				5'd24: begin 
					dout_reg[0] <= ad9361_spi_miso;
					dout_en_reg <= 1'b1;	// Read completed, set data valid signal.
				end
				default: begin 
					dout_reg <= 8'd0;
					dout_en_reg <= 1'b0;
				end
			endcase
		end

	/* Output AD9361 register data out and data out valid signal. */
	always @ (posedge sys_clk or posedge sys_rst)
		if (sys_rst) begin
			ad9361_reg_data_out <= 8'd0;
			ad9361_reg_data_out_en <= 1'b0;
		end else begin
			ad9361_reg_data_out <= dout_reg;
			ad9361_reg_data_out_en <= dout_en_reg;
		end

endmodule
