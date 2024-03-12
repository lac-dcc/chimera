`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	fifo_map 
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		control spi and train to put into fifo
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module fifo_mapping(clk_fix, rst_fix_n, clk_rxg, rst_rx_n, spi_clk,
	fifo_train_wen, fifo_train_din,
	fifo_sensor_wen, fifo_sensor_din,
	fifo_ren, fifo_empty, fifo_dout
	);
	
	// clock & reset
	input				clk_fix;
	input				rst_fix_n;
	input				clk_rxg;
	input				rst_rx_n;
	input				spi_clk;		
	
	
	// fifo_in
	input				fifo_train_wen;
	input  [7:0]	fifo_train_din;
	input				fifo_sensor_wen;
	input  [7:0]	fifo_sensor_din;
	
	input				fifo_ren;
	output			fifo_empty;
	output [7:0]	fifo_dout;
	
	wire  [7:0]		fifo_dout;
	
	wire				fifo_train_empty;
	reg				fifo_train_ren;
	wire [7:0]		fifo_train_dout;
	
	wire				fifo_sensor_empty;
	reg				fifo_sensor_ren;
	wire [7:0]		fifo_sensor_dout;
	

	
	fifo_8_1024 fifo_train (
		.wr_clk				(clk_rxg),
		.wr_rst				(~ rst_rx_n),
		.rd_clk				(clk_fix),
		.rd_rst				(~ rst_fix_n),
		.din					(fifo_train_din),
		.wr_en				(fifo_train_wen),
		.rd_en				(fifo_train_ren),
		.dout					(fifo_train_dout),
		.full					(),
		.empty				(fifo_train_empty)
	);	
	
	
	fifo_8_1024 fifo_sensor (
		.wr_clk				(spi_clk),
		.wr_rst				(~ rst_fix_n),
		.rd_clk				(clk_fix),
		.rd_rst				(~ rst_fix_n),
		.din					(fifo_sensor_din),
		.wr_en				(fifo_sensor_wen),
		.rd_en				(fifo_sensor_ren),
		.dout					(fifo_sensor_dout),
		.full					(),
		.empty				(fifo_sensor_empty)
	);
	
	assign	fifo_empty = fifo_train_empty & fifo_sensor_empty;
	
	always @(posedge clk_fix) begin
		if (!rst_fix_n) begin
			fifo_train_ren		<= 1'b0;
			fifo_sensor_ren	<= 1'b0;
		end
		else begin
			if (!fifo_train_empty) begin
				fifo_train_ren		<= fifo_ren;
				fifo_sensor_ren	<= 1'b0;
			end
			else if (!fifo_sensor_empty) begin
				fifo_train_ren		<= 1'b0;
				fifo_sensor_ren	<= fifo_ren;
			end
			else begin
				fifo_train_ren		<= 1'b0;
				fifo_sensor_ren	<= 1'b0;
			end
		end
	end

	assign	fifo_dout = fifo_train_dout | fifo_sensor_dout;

endmodule
