`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	sensor_spi 
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		Gvision200 5-wire spi, to write and read Gvision400 register
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module sensor_spi(clk_fix, rst_fix_n, 
	cmd_wr_sensor_spi, cmd_rd_sensor_spi,
	spi_register,
	spi_out, spi_clk, spi_write, spi_in, spi_read,
	fifo_sensor_wen, fifo_sensor_din
	);

	// clock & reset
	input				clk_fix;
	input				rst_fix_n;
	
	// cmd
	input				cmd_wr_sensor_spi;
	input				cmd_rd_sensor_spi;
	
	// rb2 interface
	input  [255:0]	spi_register;
	
	// spi_io
	input				spi_out;
	output			spi_clk;
	output			spi_write;
	output			spi_in;
	output			spi_read;
	
	// data interface
	output			fifo_sensor_wen;
	output [7:0]	fifo_sensor_din;
	
	
	reg 			 	spi_write;
	reg 			 	spi_in;
	reg 			 	spi_read;
	
	reg 			 	fifo_sensor_wen;
	reg  [7:0] 	 	fifo_sensor_din;
	
	reg				rst_spll_n;

	reg  [9:0]		cnt_spi_clk;
	reg				spi_clk_out;
	reg				cmd_wr_sensor_spi_q;
	reg				cmd_rd_sensor_spi_q;
	reg  [3:0]		fsm_gen_spi_clk;
	parameter		s_GEN_CLK_IDLE		= 4'b0001,
						s_GEN_CLK_WR		= 4'b0010,
						s_GEN_CLK_RD		= 4'b0100,
						s_GEN_CLK_FINISH	= 4'b1000;

	wire [7:0]		rb2 [31:0];
	
	reg [2:0] 	 	reg_cnt_bit;					// counter for bits
	reg [5:0] 	 	reg_cnt_byte;					// counter for bytes
	reg [7:0] 	 	reg_spi_dout;					// buffer for read sensor spi data
	reg 		 	 	reg_rd_flag;

	reg [4:0] 	 	fsm_sensor_spi;				// FSM
	parameter 	 	s_IDLE 			= 5'b00001,
						s_TRANSMITTER 	= 5'b00010,
						s_RECEIVER 		= 5'b00100,
						s_WRITE_ZERO	= 5'b01000,
						s_FINISH 		= 5'b10000;
	
	reg				wr_flag;
	reg				rd_flag;
	
	genvar i;
	// store sensor register data to memory
	generate
		for(i = 0; i < 32; i = i+1) begin: loop
			assign rb2[i] = spi_register[i*8+7: i*8];
		end
	endgenerate
	
	// gen_spi_clk
	always @(posedge clk_fix) begin
		if (!rst_fix_n) begin
			cnt_spi_clk					<= 10'd0;
			spi_clk_out					<= 1'b0;
			
			cmd_wr_sensor_spi_q		<= 1'b0;
			cmd_rd_sensor_spi_q		<= 1'b0;
			
			fsm_gen_spi_clk			<= s_GEN_CLK_IDLE;
			
			wr_flag						<= 1'b0;
			rd_flag						<= 1'b0;
		end
		else begin
			cmd_wr_sensor_spi_q		<= cmd_wr_sensor_spi;
			cmd_rd_sensor_spi_q		<= cmd_rd_sensor_spi;
			
			case (fsm_gen_spi_clk)
				s_GEN_CLK_IDLE:	begin
					if (cmd_wr_sensor_spi_q == 1'b0 && cmd_wr_sensor_spi == 1'b1) begin
						fsm_gen_spi_clk	<= s_GEN_CLK_WR;
						cnt_spi_clk			<= 10'd0;
						wr_flag				<= 1'b1;
					end
					if (cmd_rd_sensor_spi_q == 1'b0 && cmd_rd_sensor_spi == 1'b1) begin
						fsm_gen_spi_clk	<= s_GEN_CLK_RD;
						cnt_spi_clk			<= 10'd0;
						rd_flag				<= 1'b1;
					end
				end
				s_GEN_CLK_WR:		begin
					if (cnt_spi_clk == 10'd520) begin
						cnt_spi_clk			<= 10'd0;
						fsm_gen_spi_clk	<= s_GEN_CLK_FINISH;
					end
					else begin
						cnt_spi_clk			<= cnt_spi_clk + 10'd1;
						spi_clk_out			<= ~ spi_clk_out;
					end
					
					if (cnt_spi_clk == 10'd2) begin
						wr_flag				<= 1'b0;
					end
				end
				s_GEN_CLK_RD:		begin
					if (cnt_spi_clk == 10'd800) begin
						cnt_spi_clk			<= 10'd0;
						fsm_gen_spi_clk	<= s_GEN_CLK_FINISH;
					end
					else begin
						cnt_spi_clk			<= cnt_spi_clk + 10'd1;
						spi_clk_out			<= ~ spi_clk_out;
					end
					
					if (cnt_spi_clk == 10'd2) begin
						rd_flag				<= 1'b0;
					end
				end
				s_GEN_CLK_FINISH:	begin
					fsm_gen_spi_clk	<= s_GEN_CLK_IDLE;
					spi_clk_out			<= 1'b0;
				end
			endcase
		end
	end
	
	assign spi_clk	= spi_clk_out;

	always @(negedge spi_clk) begin
		if (!rst_fix_n) begin
			fsm_sensor_spi 	<= s_IDLE;
			spi_write 			<= 0;
			spi_read 			<= 0;
			spi_in 				<= 0;
			reg_cnt_bit			<= 3'b111;
			reg_cnt_byte		<= 6'b00_0000;
			reg_spi_dout		<= 8'b0000_0000;
			reg_rd_flag			<= 0;
			
			fifo_sensor_wen 	<= 0;
			fifo_sensor_din	<= 0;
		end
		
		else begin
		
			fifo_sensor_wen	<= 0;
			fifo_sensor_din	<= 0;
			
			case (fsm_sensor_spi)
				s_IDLE:			begin
										spi_write 		<= 0;
										spi_read 		<= 0;
										spi_in 			<= 0;
										reg_cnt_bit		<= 3'b111;

										if (wr_flag == 1'b1)begin
											fsm_sensor_spi		<= s_TRANSMITTER;
											reg_cnt_byte		<= 6'b10_0000;
										end
										else begin 
											if(rd_flag == 1'b1) begin
												fsm_sensor_spi		<= s_RECEIVER;
												reg_cnt_byte		<= 6'b10_0010;
												reg_rd_flag			<= 1;
											end
										end
									end
									
				s_TRANSMITTER:	begin
										if (reg_cnt_byte == 6'b00_0000) begin
											fsm_sensor_spi 	<= s_FINISH;
											spi_write 			<= 1;
										end
										else begin
											if (reg_cnt_bit == 3'b000) begin
												reg_cnt_bit 	<= 3'b111;
												reg_cnt_byte 	<= reg_cnt_byte - 6'd1;
											end
											spi_in				<= rb2[reg_cnt_byte-1][reg_cnt_bit];
											reg_cnt_bit 		<= reg_cnt_bit - 3'd1;
										end
									end
									
				s_RECEIVER:		begin
										spi_read <= 1;
										if (reg_cnt_byte == 6'b00_0000) begin
											fsm_sensor_spi 	<= s_WRITE_ZERO;
											spi_read 			<= 0;
										end
										if (reg_cnt_bit == 3'b000) begin
											reg_cnt_bit 		<= 3'b111;
											reg_cnt_byte 		<= reg_cnt_byte - 6'd1;
										end
										if (reg_cnt_bit == 3'b111) begin
											if(reg_rd_flag == 1)
												reg_rd_flag 		<= 0;
											else begin
												fifo_sensor_wen 	<= 1;
												fifo_sensor_din 	<= reg_spi_dout;//rb2[reg_cnt_byte-2];
											end
										end
										reg_spi_dout		<= {reg_spi_dout[6:0],spi_out};
										reg_cnt_bit 		<= reg_cnt_bit - 3'd1;
									end
				s_WRITE_ZERO:	begin
										fifo_sensor_wen	<= 1;
										fifo_sensor_din	<= 8'd0;
										fsm_sensor_spi 	<= s_FINISH;
									end
				s_FINISH:		begin
										spi_write 			<= 0;
										fsm_sensor_spi		<=	s_IDLE;
									end
			endcase
		end
	end
	
endmodule
