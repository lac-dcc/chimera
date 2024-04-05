/************************************************************************************
 *
 * @file 		ad9361_spi_ctrl.v
 * @brief 		AD9361 SPI interface control module.
 * @author 		Tang Tao, DSP Lab.
 * @date 		2017.6.12
 *
 ************************************************************************************/
`timescale 1ns / 1ps

module ad9361_spi_ctrl(
	// System clock and high-valid reset signal.
	input 					sys_clk,
	input 					sys_rst,
	
	// AD9361 SPI interface signals.
	output 					ad9361_spi_cs,
	output 					ad9361_spi_sclk,
	output 					ad9361_spi_mosi,
	input 					ad9361_spi_miso,
	
	// AD9361 configuration status signals.
	output reg				ad9361_id_chk,
	output reg				ad9361_bbpll_cal_done,
	output reg				ad9361_rx_rfpll_cp_done,
	output reg				ad9361_tx_rfpll_cp_done,
	output reg				ad9361_rx_rfpll_vco_done,
	output reg				ad9361_tx_rfpll_vco_done,
	output reg				ad9361_rx_bb_flt_done,
	output reg				ad9361_tx_bb_flt_done,
	output reg				ad9361_bbdc_cal_done,
	output reg				ad9361_rfdc_cal_done,
	output reg				ad9361_tx_quad_done,
	output reg				ad9361_spi_ok
);
	/* Include the AD9361 register configuration function file. */
	`include   "ad9361_lut.v"
	
	/* The maximum index of the AD9361 register configuration. */
	wire   [12 : 0] index_bon = 13'd2567;
	/* 8-bit AD9361 register data output signal. */
	wire   [7 : 0]  ad9361_reg_data_out;
	/* AD9361 register data output valid signal. */
	wire   			ad9361_reg_data_out_en;
	/* AD9361 SPI interface busy/idle signal. */
	wire 			ad9361_spi_busy;
	
	/* 19-bit command data reg, used to store the output of the function. */
	reg    [18 : 0] cmd;
	/* 10-bit AD9361 register address reg. */
	reg    [9 : 0]  ad9361_reg_addr;
	/* 8-bit AD9361 register configuration data. */
	reg    [7 : 0]  ad9361_reg_data_in;
	/* AD9361 register configuration data valid reg. */
	reg 			ad9361_reg_data_in_en;
	/* AD9361 write/read control reg. */
	reg 			ad9361_reg_wr_rdn;
	
	/* The configuration status of AD9361 reg. */
	reg    [6 : 0]  state;
	/* 13-bit AD9361 register index reg. */
	reg    [12 : 0] index;
	/* 26-bit delay wait counter reg. */
	reg    [25 : 0] wait_cnt;
	
	always @ (posedge sys_clk or posedge sys_rst)
		if (sys_rst) begin
			cmd <= 19'd0;
			ad9361_reg_addr <= 10'd0;
			ad9361_reg_data_in <= 8'd0;
			ad9361_reg_data_in_en <= 1'b0;
			ad9361_reg_wr_rdn <= 1'b0;
			
			state <= 7'b000_0001;
			index <= 13'd0;
			wait_cnt <= 26'd0;
			
			ad9361_spi_ok <= 1'b0;
			ad9361_id_chk <= 1'b0;
			ad9361_bbpll_cal_done <= 1'b0;
			ad9361_rx_rfpll_cp_done <= 1'b0;
			ad9361_tx_rfpll_cp_done <= 1'b0;
			ad9361_rx_rfpll_vco_done <= 1'b0;
			ad9361_tx_rfpll_vco_done <= 1'b0;
			ad9361_rx_bb_flt_done <= 1'b0;
			ad9361_tx_bb_flt_done <= 1'b0;
			ad9361_bbdc_cal_done <= 1'b0;
			ad9361_rfdc_cal_done <= 1'b0;
			ad9361_tx_quad_done <= 1'b0;
		end else begin
			case (state)
				/* Call the function to get the configuration command data state. */
				7'b000_0001: begin
					cmd <= ad9361_cmd_data(index);		// Get the command data.
					state <= 7'b000_0010;
				end
				/* Get the Wr/Rd flag, reg address, reg data info state. */
				7'b000_0010: begin
					/* If SPI is idle, do the process. */
					if (!ad9361_spi_busy) begin
						ad9361_reg_wr_rdn <= cmd[18];		// Wr/Rd flag.
						ad9361_reg_addr <= cmd[17 : 8];		// Reg address.
						ad9361_reg_data_in <= cmd[7 : 0];	// Reg data.
						ad9361_reg_data_in_en <= 1'b1;		// Reg data valid.
						state <= 7'b000_0100;
					/* If the SPI is busy, wait it to go to idle state. */
					end else begin
					end
				end
				/* Wait for the SPI to get the configuration data state. */
				7'b000_0100: begin
					/* If SPI is busy, then SPI has get the address and data info. */
					if (ad9361_spi_busy) begin
						ad9361_reg_data_in_en <= 1'b0;		// Reset data valid signal.
						state <= 7'b000_1000;
					/* If SPI is idle, then SPI hasn't get the data, wait. */
					end else begin
					end
				end
				/* SPI write or read judge state. */
				7'b000_1000: begin
					/* If SPI read signal is valid. */
					if (!ad9361_reg_wr_rdn)
						state <= 7'b001_0000;
					/* If SPI write signal is valid. */
					else
						state <= 7'b010_0000;
				end
				/* Check the read out data state. */
				7'b001_0000: begin
					/* If the output data is valid, check the output data. */
					if (ad9361_reg_data_out_en) begin
						case (index)
							/* Read the product ID, 0x037[3] == 1. */
							13'd2: begin
								if (ad9361_reg_data_out[3] == 1'b1) begin
									state <= 7'b010_0000;
									ad9361_id_chk <= 1'b1;
								end else begin
									state <= 7'b000_0001;
									ad9361_id_chk <= 1'b0;
								end
							end
							/* Read the BBPLL VCO cal done flag, 0x05E[7] == 1. */
							13'd28: begin
								if (ad9361_reg_data_out[7] == 1'b1) begin
									state <= 7'b010_0000;
									ad9361_bbpll_cal_done <= 1'b1;
								end else begin
									state <= 7'b000_0001;
									ad9361_bbpll_cal_done <= 1'b0;
								end
							end
							/* Read the Rx RFPLL CP cal done flag, 0x244[7] == 1. */
							13'd1626: begin
								if (ad9361_reg_data_out[7] == 1'b1) begin
									state <= 7'b010_0000;
									ad9361_rx_rfpll_cp_done <= 1'b1;
								end else begin
									state <= 7'b000_0001;
									ad9361_rx_rfpll_cp_done <= 1'b0;
								end
							end
							/* Read the Tx RFPLL CP cal done flag, 0x284[7] == 1. */
							13'd1628: begin
								if (ad9361_reg_data_out[7] == 1'b1) begin
									state <= 7'b010_0000;
									ad9361_tx_rfpll_cp_done <= 1'b1;
								end else begin
									state <= 7'b000_0001;
									ad9361_tx_rfpll_cp_done <= 1'b0;
								end
							end
							/* Read the Rx RFPLL VCO cal done flag, 0x247[1] == 1. */
							13'd1663: begin
								if (ad9361_reg_data_out[1] == 1'b1) begin
									state <= 7'b010_0000;
									ad9361_rx_rfpll_vco_done <= 1'b1;
								end else begin
									state <= 7'b000_0001;
									ad9361_rx_rfpll_vco_done <= 1'b0;
								end
							end
							/* Read the Tx RFPLL VCO cal done flag, 0x287[1] == 1. */
							13'd1664: begin
								if (ad9361_reg_data_out[1] == 1'b1) begin
									state <= 7'b010_0000;
									ad9361_tx_rfpll_vco_done <= 1'b1;
								end else begin
									state <= 7'b000_0001;
									ad9361_tx_rfpll_vco_done <= 1'b0;
								end
							end
							/* Read Rx filter to tune, 0x016[7] == 0. */
							13'd2452: begin
								if (ad9361_reg_data_out[7] == 1'b0) begin
									state <= 7'b010_0000;
									ad9361_rx_bb_flt_done <= 1'b1;
								end else begin
									state <= 7'b000_0001;
									ad9361_rx_bb_flt_done <= 1'b0;
								end
							end
							/* Read Tx filter to tune, 0x016[6] == 0. */
							13'd2459: begin
								if (ad9361_reg_data_out[6] == 1'b0) begin
									state <= 7'b010_0000;
									ad9361_tx_bb_flt_done <= 1'b1;
								end else begin
									state <= 7'b000_0001;
									ad9361_tx_bb_flt_done <= 1'b0;
								end
							end
							/* Read baseband DC offset cal done flag, 0x016[0] == 0. */
							13'd2530: begin
								if (ad9361_reg_data_out[0] == 1'b0) begin
									state <= 7'b010_0000;
									ad9361_bbdc_cal_done <= 1'b1;
								end else begin
									state <= 7'b000_0001;
									ad9361_bbdc_cal_done <= 1'b0;
								end
							end
							/* Read RF DC offset cal done flag, 0x016[1] == 0. */
							13'd2538: begin
								if (ad9361_reg_data_out[1] == 1'b0) begin
									state <= 7'b010_0000;
									ad9361_rfdc_cal_done <= 1'b1;
								end else begin
									state <= 7'b000_0001;
									ad9361_rfdc_cal_done <= 1'b0;
								end
							end
							/* Read Tx quad cal done flag, 0x016[4] == 0. */
							13'd2540: begin
								if (ad9361_reg_data_out[4] == 1'b0) begin
									state <= 7'b010_0000;
									ad9361_tx_quad_done <= 1'b1;
								end else begin
									state <= 7'b000_0001;
									ad9361_tx_quad_done <= 1'b0;
								end
							end
							default: begin
								state <= 7'b010_0000;
							end
						endcase
					/* If read data out is not valid, wait. */
					end else begin
					end
				end
				/* Time delay/register index control state. */
				7'b010_0000: begin
					/* If all the configurations are completed. */
					if (index == index_bon) begin
						state <= 7'b100_0000;
						index <= 13'd0;
					/* Enable clocks, need to wait for 20ms. */
					end else if (index == 13'd11) begin
						if (wait_cnt != 26'd40_0000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;		// Reg index plus 1.
							state <= 7'b000_0001;
						end
					/* BBPLL VCO cal, need to wait for 1000ms. */
					end else if (index == 13'd27) begin
						if (wait_cnt != 26'd20_000_000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;		// Reg index plus 1.
							state <= 7'b000_0001;
						end
					/* Enable Tx filter programme clock, need to wait for 1ms. */
					end else if (index == 13'd33) begin
						if (wait_cnt != 26'd2_0000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;
							state <= 7'b000_0001;
						end
					/* Enable Rx filter prog clock, need to wait for 1ms. */
					end else if (index == 13'd804) begin
						if (wait_cnt != 26'd2_0000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;
							state <= 7'b000_0001;
						end
					/* Set ENSM into FDD mode, need to wait for 1ms. */
					end else if (index == 13'd1624) begin
						if (wait_cnt != 26'd2_0000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;		// Reg index plus 1.
							state <= 7'b000_0001;
						end
					/* Rx RFPLL CP cal, need to wait for 1000ms. */
					end else if (index == 13'd1625) begin
						if (wait_cnt != 26'd20_000_000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;		// Reg index plus 1.
							state <= 7'b000_0001;
						end
					/* Tx RFPLL CP cal, need to wait for 1000ms. */
					end else if (index == 13'd1627) begin
						if (wait_cnt != 26'd20_000_000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;		// Reg index plus 1.
							state <= 7'b000_0001;
						end
					/* Rx RFPLL VCO cal, need to wait for 1000ms. */
					end else if (index == 13'd1662) begin
						if (wait_cnt != 26'd20_000_000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;		// Reg index plus 1.
							state <= 7'b000_0001;
						end
					/* Rx baseband filter tune, need to wait for 1000ms. */
					end else if (index == 13'd2451) begin
						if (wait_cnt != 26'd20_000_000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;		// Reg index plus 1.
							state <= 7'b000_0001;
						end
					/* Tx baseband filter tune, need to wait for 1000ms. */
					end else if (index == 13'd2458) begin
						if (wait_cnt != 26'd20_000_000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;		// Reg index plus 1.
							state <= 7'b000_0001;
						end
					/* Baseband DC cal, need to wait for 1000ms. */
					end else if (index == 13'd2529) begin
						if (wait_cnt != 26'd20_000_000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;		// Reg index plus 1.
							state <= 7'b000_0001;
						end
					/* RF DC cal, need to wait for 1000ms. */
					end else if (index == 13'd2537) begin
						if (wait_cnt != 26'd20_000_000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;		// Reg index plus 1.
							state <= 7'b000_0001;
						end
					/* Tx quad cal, need to wait for 1000ms. */
					end else if (index == 13'd2539) begin
						if (wait_cnt != 26'd20_000_000)
							wait_cnt <= wait_cnt + 1'b1;
						else begin
							wait_cnt <= 26'd0;
							index <= index + 1'b1;		// Reg index plus 1.
							state <= 7'b000_0001;
						end
					/* If no time delay needed. */
					end else begin
						index <= index + 1'b1;
						state <= 7'b000_0001;
					end
				end
				/* SPI configuration completed state. */
				7'b100_0000: begin
					ad9361_spi_ok <= 1'b1;			// Configuration completed.
					state <= 7'b100_0000;
				end
				default: begin
					ad9361_spi_ok <= 1'b0;
					state <= 7'b000_0001;
				end
			endcase
		end

	/* vc707_ad9361_spi_drv module. */
	ad936_spi_drv uut_ad9361_spi_drv(
		.sys_clk(sys_clk),
		.sys_rst(sys_rst),
		.ad9361_reg_addr(ad9361_reg_addr),
		.ad9361_reg_data_in(ad9361_reg_data_in),
		.ad9361_reg_data_in_en(ad9361_reg_data_in_en),
		.ad9361_reg_wr_rdn(ad9361_reg_wr_rdn),
		.ad9361_reg_data_out(ad9361_reg_data_out),
		.ad9361_reg_data_out_en(ad9361_reg_data_out_en),
		.ad9361_spi_busy(ad9361_spi_busy),
		.ad9361_spi_cs(ad9361_spi_cs),
		.ad9361_spi_sclk(ad9361_spi_sclk),
		.ad9361_spi_mosi(ad9361_spi_mosi),
		.ad9361_spi_miso(ad9361_spi_miso)
	);

endmodule
