`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:04:48 02/10/2015
// Design Name:   image_buffer
// Module Name:   C:/Users/ceshi/Desktop/G200_GLOBAL_LN_02_10/tb_image_buffer.v
// Project Name:  GVISION200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: image_buffer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_image_buffer;

	// Inputs
	reg clk_rxg;
	reg rst_rx_n;
	reg fvals;
	reg lvals;
	reg [11:0] datapar_out0;
	reg [11:0] datapar_out1;
	reg [11:0] datapar_out2;
	reg [11:0] datapar_out3;
	reg [11:0] datapar_out4;
	reg [11:0] datapar_out5;
	reg [11:0] datapar_out6;
	reg [11:0] datapar_out7;
	reg clk_txg;
	reg rst_tx_n;
	reg window_column_sel;
	reg [11:0]	cnt_512;
	
	reg	[11:0]	cnt_lvals;
	reg	[11:0]	cnt_fvals;
	reg	[1:0]		cnt;
	
	reg	[1:0]		fsm_lval;
	parameter		s_HIGH	=	2'b00,
						s_LOW		=	2'b01;	
	// Outputs
	wire [7:0] chan_0;
	wire [7:0] chan_1;
	wire [7:0] chan_2;
	wire [7:0] chan_3;
	wire [7:0] chan_4;
	wire [7:0] chan_5;
	wire [7:0] chan_6;
	wire [7:0] chan_7;
	wire fval;
	wire lval;

	// Instantiate the Unit Under Test (UUT)
	image_buffer uut (
		.clk_rxg(clk_rxg), 
		.rst_rx_n(rst_rx_n), 
		.fvals(fvals), 
		.lvals(lvals), 
		.datapar_out0(datapar_out0), 
		.datapar_out1(datapar_out1), 
		.datapar_out2(datapar_out2), 
		.datapar_out3(datapar_out3), 
		.datapar_out4(datapar_out4), 
		.datapar_out5(datapar_out5), 
		.datapar_out6(datapar_out6), 
		.datapar_out7(datapar_out7), 
		.clk_txg(clk_txg), 
		.rst_tx_n(rst_tx_n), 
		.chan_0(chan_0), 
		.chan_1(chan_1), 
		.chan_2(chan_2), 
		.chan_3(chan_3), 
		.chan_4(chan_4), 
		.chan_5(chan_5), 
		.chan_6(chan_6), 
		.chan_7(chan_7), 
		.fval(fval), 
		.lval(lval)
	);

	initial begin
		// Initialize Inputs
		clk_rxg = 1;
		rst_rx_n = 0;
		fvals = 0;
		lvals = 0;
		datapar_out0 = 15;
		datapar_out1 = 2;
		datapar_out2 = 2446;
		datapar_out3 = 2446;
		datapar_out4 = 2446;
		datapar_out5 = 2446;
		datapar_out6 = 2446;
		datapar_out7 = 2446;
		clk_txg = 1;
		rst_tx_n = 0;
		window_column_sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
      #100 	rst_rx_n =	1;
				rst_tx_n =	1;

		// Add stimulus here

	end
      always # 10 	clk_rxg	=	~clk_rxg;
		always # 7.14		clk_txg	=	~clk_txg;
		
	always @(posedge clk_rxg) begin
		if(!rst_rx_n)	begin
			fvals					<= 1'b0;
			lvals		 			<= 1'b0;
			cnt_lvals	 		<= 10'd0;
			cnt_fvals			<= 12'd0;
			cnt					<=	2'd0;
			fsm_lval				<=	s_HIGH;
		end
		else begin
			case(fsm_lval)
				s_HIGH:	begin
								if(cnt_lvals	==	10'd128)begin
									cnt_lvals			<=	10'd0;
									lvals					<=	1'b0;
									fsm_lval				<=	s_LOW;
								end
								else begin
									lvals					<=	1'b1;
									cnt_lvals			<=	cnt_lvals + 10'd1;
								end
							end
				s_LOW:	begin
								if(cnt_lvals	==	10'd1)begin
									cnt_lvals		<=	10'd1;
									lvals				<=	1'b1;
									fsm_lval			<=	s_HIGH;
								end
								else begin
									cnt_lvals		<=	cnt_lvals + 10'd1;
									lvals				<=	1'b0;
								end
							end
			endcase
			if(cnt_fvals == 12'd1028) begin
				cnt_fvals 			<= 12'd0;
				fvals		 			<= 1'b0;
			end
			else begin
				cnt_fvals 			<= cnt_fvals + 12'd1;
				fvals		 			<= 1'b1;
			end
		end
	end
endmodule

