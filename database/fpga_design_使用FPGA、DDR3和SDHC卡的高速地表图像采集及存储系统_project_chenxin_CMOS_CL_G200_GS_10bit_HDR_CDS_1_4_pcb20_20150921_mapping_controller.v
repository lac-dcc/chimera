`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:04 02/25/2015 
// Design Name: 
// Module Name:    mapping_controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mapping_controller(clk_rxg, rst_rx_n,	
	data_trained0, data_trained1, data_trained2,  data_trained3,  data_trained4,  data_trained5,  data_trained6,  data_trained7, 
	data_trained8, data_trained9, data_trained10, data_trained11, data_trained12, data_trained13, data_trained14, data_trained15, 
	datapar_out0,	datapar_out1,	datapar_out2,	datapar_out3,	
	datapar_out4,	datapar_out5,	datapar_out6,	datapar_out7,	
	fvals_map,	lvals_map,	fvals,	lvals
    );

	input				clk_rxg;
	input				rst_rx_n;
	input				fvals_map;
	input				lvals_map;

	input	[11:0]	data_trained0;
	input	[11:0]	data_trained1;
	input	[11:0]	data_trained2;
	input	[11:0]	data_trained3;
	input	[11:0]	data_trained4;
	input	[11:0]	data_trained5;
	input	[11:0]	data_trained6;
	input	[11:0]	data_trained7;
	input	[11:0]	data_trained8;
	input	[11:0]	data_trained9;
	input	[11:0]	data_trained10;
	input	[11:0]	data_trained11;
	input	[11:0]	data_trained12;
	input	[11:0]	data_trained13;
	input	[11:0]	data_trained14;
	input	[11:0]	data_trained15;

	output [11:0]	datapar_out0;
	output [11:0]	datapar_out1;
	output [11:0]	datapar_out2;
	output [11:0]	datapar_out3;
	output [11:0]	datapar_out4;
	output [11:0]	datapar_out5;
	output [11:0]	datapar_out6;
	output [11:0]	datapar_out7;
		
	output			fvals;
	output			lvals;
	
	reg	[11:0]	data_ram_in0;	
	reg	[11:0]	data_ram_in1;	
	reg	[11:0]	data_ram_in2;	
	reg	[11:0]	data_ram_in3;	
	reg	[11:0]	data_ram_in4;	
	reg	[11:0]	data_ram_in5;	
	reg	[11:0]	data_ram_in6;	
	reg	[11:0]	data_ram_in7;	
	reg	[11:0]	data_ram_in8;	
	reg	[11:0]	data_ram_in9;	
	reg	[11:0]	data_ram_in10;	
	reg	[11:0]	data_ram_in11;	
	reg	[11:0]	data_ram_in12;	
	reg	[11:0]	data_ram_in13;	
	reg	[11:0]	data_ram_in14;	
	reg	[11:0]	data_ram_in15;
	
	wire	[11:0]	data_ram_out0;	
	wire	[11:0]	data_ram_out1;	
	wire	[11:0]	data_ram_out2;	
	wire	[11:0]	data_ram_out3;	
	wire	[11:0]	data_ram_out4;	
	wire	[11:0]	data_ram_out5;	
	wire	[11:0]	data_ram_out6;	
	wire	[11:0]	data_ram_out7;	
	wire	[11:0]	data_ram_out8;	
	wire	[11:0]	data_ram_out9;	
	wire	[11:0]	data_ram_out10;	
	wire	[11:0]	data_ram_out11;	
	wire	[11:0]	data_ram_out12;	
	wire	[11:0]	data_ram_out13;	
	wire	[11:0]	data_ram_out14;	
	wire	[11:0]	data_ram_out15;
	
	reg 	[11:0]	datapar_out0;
	reg 	[11:0]	datapar_out1;
	reg 	[11:0]	datapar_out2;
	reg 	[11:0]	datapar_out3;
	reg 	[11:0]	datapar_out4;
	reg 	[11:0]	datapar_out5;
	reg 	[11:0]	datapar_out6;
	reg 	[11:0]	datapar_out7;
	
	wire				fval_map;
	wire				lval_map;
	reg				fval_map_q;
	reg				lval_map_q;
	reg				fvals;
	reg				lvals;
	
	reg	[1:0]		flag_map;
	
	reg				even_1;
	reg	[9:0]		wr_addr1;
	reg	[9:0]		rd_addr1;
	reg	[9:0]		rd_addr2;
	
	reg	[1:0]		cnt_rd;
	reg	[2:0]		fsm_rd_addr;
	parameter		s_IDLE_RD_ADDR	=	3'b000,
						s_RD_1_64		=	3'b001,
						s_RD_2_64		=	3'b010,
						s_RD_WAIT		=	3'b011,
						s_RD_1_128		=	3'b100,
						s_RD_2_128		=	3'b101;
						
	reg	[1:0]		fsm_flag;
	parameter		s_IDLE_F			=	2'b00,
						s_flag_1			=	2'b01,
						s_flag_2			=	2'b10,
						s_flag_wait		=	2'b11;
	reg	[11:0]	cnt_flag;
	
	always	@(posedge clk_rxg) begin
		if(!rst_rx_n)begin
			even_1		<= 1'b0;
		end
		else begin
			if(lvals_map	==	1'b1)	begin
				even_1	<=	~even_1;
			end
			else begin
				even_1	<=	1'b0;
			end
		end
	end
	
	// write in
	always	@(posedge clk_rxg)begin
		if(!rst_rx_n)begin
			wr_addr1					<=	10'd0;
		end
		else begin
			if(wr_addr1	==	10'd128)begin
				wr_addr1				<=	10'd0;
			end
			else begin
				if(even_1	==	1'b1)begin
					wr_addr1			<=	wr_addr1	+	10'd1;
				end
			end
		end
	end
	
	// read_out
	always	@(posedge clk_rxg)begin
		if(!rst_rx_n)begin
			rd_addr1					<= 10'd0;
			rd_addr2					<=	10'd0;
			fsm_rd_addr				<=	s_IDLE_RD_ADDR;
			cnt_rd					<=	2'b00;
		end
		else begin
			case(fsm_rd_addr)
				s_IDLE_RD_ADDR:	begin
											if(fval_map	==	1'b1)begin
												if(lval_map	==	1'b1)begin
													fsm_rd_addr			<=	s_RD_1_64;
													rd_addr1				<=	10'd1;
													rd_addr2				<=	10'd0;
												end
											end
										end
				s_RD_1_64:			begin
											if(fval_map	==	1'b1)begin
												if(lval_map	==	1'b1)begin
													if(rd_addr1	==	10'd63)begin
														fsm_rd_addr				<=	s_RD_2_64;
														rd_addr2					<=	10'd0;
													end
													else begin
														rd_addr1					<=	rd_addr1	+	10'd1;
													end
												end
											end
										end
				s_RD_2_64:			begin
											if(fval_map	==	1'b1)begin
												if(lval_map	==	1'b1)begin
													if(rd_addr2	==	10'd63)begin
														fsm_rd_addr				<=	s_RD_1_128;
														rd_addr1					<=	10'd64;
													end
													else begin
														rd_addr2					<=	rd_addr2	+	10'd1;
													end
												end
											end
										end
/*				s_RD_WAIT:			begin
											if(cnt_rd	==	2'd1)begin
												fsm_rd_addr				<=	s_RD_1_128;
												rd_addr1					<=	10'd64;
												cnt_rd					<=	2'b00;
											end
											else begin
												cnt_rd					<=	cnt_rd + 2'b01;
											end
										end*/
				s_RD_1_128:			begin
											if(fval_map	==	1'b1)begin
												if(lval_map	==	1'b1)begin
													if(rd_addr1	==	10'd127)begin
														fsm_rd_addr				<=	s_RD_2_128;
														rd_addr2					<=	10'd64;
													end
													else begin
														rd_addr1					<=	rd_addr1	+	10'd1;
													end
												end
											end
										end
				s_RD_2_128:			begin
											if(fval_map	==	1'b1)begin
												if(lval_map	==	1'b1)begin
													if(rd_addr2	==	10'd127)begin
														fsm_rd_addr				<=	s_IDLE_RD_ADDR;
														rd_addr1					<=	10'd0;
														rd_addr2					<=	10'd0;
													end
													else begin
														rd_addr2					<=	rd_addr2	+10'd1;
													end
												end
											end
										end
			endcase
		end
	end
	
	//gen flag_map
	always	@(posedge clk_rxg)begin
		if(!rst_rx_n)begin
			flag_map			<=	2'b00;
			fsm_flag			<=	s_IDLE_F;
			cnt_flag			<=	12'd0;
		end
		else begin
			case(fsm_flag)
				s_IDLE_F:		begin
										if(fval_map	==	1'b1)begin
											if(lval_map	==	1'b1)begin
												flag_map		<=	2'b01;
												fsm_flag		<=	s_flag_1;
												cnt_flag		<=	12'd0;
											end
										end
									end
				s_flag_1:		begin
										if(cnt_flag	==	12'd63)begin
											flag_map		<=	2'b10;
											fsm_flag		<=	s_flag_2;
											cnt_flag		<=	12'd0;
										end
										else begin
											cnt_flag		<=	cnt_flag + 12'd1;
										end
									end
				s_flag_2:		begin
										if(cnt_flag	==	12'd63)begin
											flag_map		<=	2'b00;
											fsm_flag		<=	s_flag_wait;
											cnt_flag		<=	12'd0;
										end
										else begin
											cnt_flag		<=	cnt_flag + 12'd1;
										end
									end
				s_flag_wait:	begin
										fsm_flag			<=	s_IDLE_F;
										flag_map			<=	2'b00;
									end
			endcase
		end
	end
	
	always	@(posedge clk_rxg)begin
		if(!rst_rx_n)begin
			datapar_out0			<=	12'd0;
			datapar_out1			<=	12'd0;
			datapar_out2			<=	12'd0;
			datapar_out3			<=	12'd0;
			datapar_out4			<=	12'd0;
			datapar_out5			<=	12'd0;
			datapar_out6			<=	12'd0;
			datapar_out7			<=	12'd0;
		end
		else begin
			case(flag_map)
				3'b000:	begin
								datapar_out0			<=	12'd0;
								datapar_out1			<=	12'd0;
								datapar_out2			<=	12'd0;
								datapar_out3			<=	12'd0;
								datapar_out4			<=	12'd0;
								datapar_out5			<=	12'd0;
								datapar_out6			<=	12'd0;
								datapar_out7			<=	12'd0;
							end
				3'b001:	begin
								datapar_out0			<=	data_ram_out0;
								datapar_out1			<=	data_ram_out2;
								datapar_out2			<=	data_ram_out4;
								datapar_out3			<=	data_ram_out6;
								datapar_out4			<=	data_ram_out8;
								datapar_out5			<=	data_ram_out10;
								datapar_out6			<=	data_ram_out12;
								datapar_out7			<=	data_ram_out14;
							end
				3'b010:	begin
								datapar_out0			<=	data_ram_out1;
								datapar_out1			<=	data_ram_out3;
								datapar_out2			<=	data_ram_out5;
								datapar_out3			<=	data_ram_out7;
								datapar_out4			<=	data_ram_out9;
								datapar_out5			<=	data_ram_out11;
								datapar_out6			<=	data_ram_out13;
								datapar_out7			<=	data_ram_out15;
							end
			endcase
		end
	end
	
	always	@(posedge clk_rxg)begin
		if(!rst_rx_n)begin
			data_ram_in0			<=	12'd0;
			data_ram_in1			<=	12'd0;
			data_ram_in2			<=	12'd0;
			data_ram_in3			<=	12'd0;
			data_ram_in4			<=	12'd0;
			data_ram_in5			<=	12'd0;
			data_ram_in6			<=	12'd0;
			data_ram_in7			<=	12'd0;
			data_ram_in8			<=	12'd0;
			data_ram_in9			<=	12'd0;
			data_ram_in10			<=	12'd0;
			data_ram_in11			<=	12'd0;
			data_ram_in12			<=	12'd0;
			data_ram_in13			<=	12'd0;
			data_ram_in14			<=	12'd0;
			data_ram_in15			<=	12'd0;
			fval_map_q				<= 1'b0;
			lval_map_q				<=	1'b0;
		end
		else begin
			data_ram_in0			<=	data_trained0;
			data_ram_in1			<=	data_trained1;
			data_ram_in2			<=	data_trained2;
			data_ram_in3			<=	data_trained3;
			data_ram_in4			<=	data_trained4;
			data_ram_in5			<=	data_trained5;
			data_ram_in6			<=	data_trained6;
			data_ram_in7			<=	data_trained7;
			data_ram_in8			<=	data_trained8;
			data_ram_in9			<=	data_trained9;
			data_ram_in10			<=	data_trained10;
			data_ram_in11			<=	data_trained11;
			data_ram_in12			<=	data_trained12;
			data_ram_in13			<=	data_trained13;
			data_ram_in14			<=	data_trained14;
			data_ram_in15			<=	data_trained15;
			fval_map_q				<=	fval_map;
			lval_map_q				<= lval_map;
			fvals						<=	fval_map_q;
			lvals						<=	lval_map_q;
		end
	end
	
	shifter_w1_d128 shifter_fval(				//d64
				.d			(fvals_map),
				.clk		(clk_rxg),
				.sclr		(~rst_rx_n),
				.q			(fval_map)
	);
	
	shifter_w1_d128 shifter_lval(				//d64
				.d			(lvals_map),
				.clk		(clk_rxg),
				.sclr		(~rst_rx_n),
				.q			(lval_map)
	);
	
	simple_dual_ram_w12_d256 dram0(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in0),
				.clkb			(clk_rxg),
				.addrb		(rd_addr1),
				.doutb		(data_ram_out0)
	);
	
	simple_dual_ram_w12_d256 dram1(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in1),
				.clkb			(clk_rxg),
				.addrb		(rd_addr2),
				.doutb		(data_ram_out1)
	);	
	simple_dual_ram_w12_d256 dram2(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in2),
				.clkb			(clk_rxg),
				.addrb		(rd_addr1),
				.doutb		(data_ram_out2)
	);	
	simple_dual_ram_w12_d256 dram3(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in3),
				.clkb			(clk_rxg),
				.addrb		(rd_addr2),
				.doutb		(data_ram_out3)
	);	
	simple_dual_ram_w12_d256 dram4(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in4),
				.clkb			(clk_rxg),
				.addrb		(rd_addr1),
				.doutb		(data_ram_out4)
	);	
	simple_dual_ram_w12_d256 dram5(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in5),
				.clkb			(clk_rxg),
				.addrb		(rd_addr2),
				.doutb		(data_ram_out5)
	);	
	simple_dual_ram_w12_d256 dram6(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in6),
				.clkb			(clk_rxg),
				.addrb		(rd_addr1),
				.doutb		(data_ram_out6)
	);	
	simple_dual_ram_w12_d256 dram7(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in7),
				.clkb			(clk_rxg),
				.addrb		(rd_addr2),
				.doutb		(data_ram_out7)
	);	
	simple_dual_ram_w12_d256 dram8(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in8),
				.clkb			(clk_rxg),
				.addrb		(rd_addr1),
				.doutb		(data_ram_out8)
	);	
	simple_dual_ram_w12_d256 dram9(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in9),
				.clkb			(clk_rxg),
				.addrb		(rd_addr2),
				.doutb		(data_ram_out9)
	);	
	simple_dual_ram_w12_d256 dram10(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in10),
				.clkb			(clk_rxg),
				.addrb		(rd_addr1),
				.doutb		(data_ram_out10)
	);	
	simple_dual_ram_w12_d256 dram11(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in11),
				.clkb			(clk_rxg),
				.addrb		(rd_addr2),
				.doutb		(data_ram_out11)
	);	
	simple_dual_ram_w12_d256 dram12(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in12),
				.clkb			(clk_rxg),
				.addrb		(rd_addr1),
				.doutb		(data_ram_out12)
	);	
	simple_dual_ram_w12_d256 dram13(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in13),
				.clkb			(clk_rxg),
				.addrb		(rd_addr2),
				.doutb		(data_ram_out13)
	);	
	simple_dual_ram_w12_d256 dram14(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in14),
				.clkb			(clk_rxg),
				.addrb		(rd_addr1),
				.doutb		(data_ram_out14)
	);	
	simple_dual_ram_w12_d256 dram15(
				.clka			(clk_rxg),
				.wea			(even_1),
				.addra		(wr_addr1),
				.dina			(data_ram_in15),
				.clkb			(clk_rxg),
				.addrb		(rd_addr2),
				.doutb		(data_ram_out15)
	);
	
endmodule
