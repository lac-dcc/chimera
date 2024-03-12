`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:03 12/22/2014 
// Design Name: 
// Module Name:    image_buffer 
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
module image_buffer( 
	clk_rxg, rst_rx_n,
	fvals, lvals, 
	datapar_out0, datapar_out1, datapar_out2, datapar_out3,
	datapar_out4, datapar_out5, datapar_out6, datapar_out7,
	clk_txg, rst_tx_n,
	chan_0, chan_1, chan_2, chan_3, chan_4, chan_5, chan_6, chan_7,
	fval, lval
    );

	input				clk_rxg;
	input				rst_rx_n;
	input				fvals;
	input				lvals;	

	input	[11:0]	datapar_out0;
	input	[11:0]	datapar_out1;
	input	[11:0]	datapar_out2;
	input	[11:0]	datapar_out3;
	input	[11:0]	datapar_out4;
	input	[11:0]	datapar_out5;
	input	[11:0]	datapar_out6;
	input	[11:0]	datapar_out7;
	
	input				clk_txg;
	input				rst_tx_n;

	output [7:0]	chan_0;
	output [7:0]	chan_1;
	output [7:0]	chan_2;
	output [7:0]	chan_3;
	output [7:0]	chan_4;
	output [7:0]	chan_5;
	output [7:0]	chan_6;
	output [7:0]	chan_7;
	output			fval;
	output			lval;
	
	reg				fval;
	reg				fvals_q;
	reg				fvals_qq;
	reg				fvals_qqq;
	reg				fvals_4q;
	reg				fvals_5q;
	reg				fvals_6q;
	reg				fvals_7q;
	reg				lval;
	reg				lvals_q;
	reg				lvals_qq;
	reg				lvals_qqq;
	reg				lvals_4q;
	reg				lvals_5q;
	reg				lvals_6q;
	reg				lvals_7q;
	
	reg	[11:0]	datapar_out0_q;
	reg	[11:0]	datapar_out1_q;
	reg	[11:0]	datapar_out2_q;
	reg	[11:0]	datapar_out3_q;
	reg	[11:0]	datapar_out4_q;
	reg	[11:0]	datapar_out5_q;
	reg	[11:0]	datapar_out6_q;
	reg	[11:0]	datapar_out7_q;
	
	reg	[23:0]	reg_din0;
	reg	[23:0]	reg_din1;
	reg	[23:0]	reg_din2;
	reg	[23:0]	reg_din3;
	reg	[23:0]	reg_din4;
	reg	[23:0]	reg_din5;
	reg	[23:0]	reg_din6;
	reg	[23:0]	reg_din7;
	
	wire	[23:0]	reg_dout0;
	wire	[23:0]	reg_dout1;
	wire	[23:0]	reg_dout2;
	wire	[23:0]	reg_dout3;
	wire	[23:0]	reg_dout4;
	wire	[23:0]	reg_dout5;
	wire	[23:0]	reg_dout6;
	wire	[23:0]	reg_dout7;
	
	reg	[7:0]		chan_0;
	reg	[7:0]		chan_1;
	reg	[7:0]		chan_2;
	reg	[7:0]		chan_3;
	reg	[7:0]		chan_4;
	reg	[7:0]		chan_5;
	reg	[7:0]		chan_6;
	reg	[7:0]		chan_7;
	
	
	reg	[1:0]		cnt_even;
	reg	[1:0]		cnt_txg;
	reg				even;
	reg				even_q;
	reg	[2:0]		flag_2;
	
	reg	[7:0]		wr_addr;
	reg	[7:0]		rd_addr;
	
	reg	[1:0]		fsm_even;
	parameter		s_IDLE_EVEN	= 2'b00,
						s_GEN			= 2'b01;
						
	(*keep = "true"*)reg	[2:0]		fsm_rd;
	parameter		s_IDLE_RD	= 3'b000,
						s_FIRST8		= 3'b001,
						s_MID8		= 3'b010,
						s_LAST8		= 3'b011;
						
	reg	[11:0]	cnt_lval;
	reg	[2:0]		fsm_gen_lval;
	parameter		s_IDLE_GEN	=	3'b000,
						s_GEN_LVAL	=	3'b001,
						s_WAIT_GEN	=	3'b010;
						
	reg				lval_image;
	reg				lval_image_q;
	reg				fval_image;
	reg				fval_image_q;
	
	reg	[1:0]		cnt_wr;
	
	//Í¬²½
	always @(posedge clk_rxg) begin
		if(!rst_rx_n)begin
			fvals_q					<= 1'b0;
			fvals_qq					<= 1'b0;
			fvals_qqq				<= 1'b0;
			fvals_4q					<= 1'b0;
			fvals_5q					<=	1'b0;
			lvals_q					<= 1'b0;
			lvals_qq					<= 1'b0;
			lvals_qqq				<= 1'b0;
			lvals_4q					<= 1'b0;
			lvals_5q					<= 1'b0;
		end
		else begin
			fvals_q					<= fvals;
			fvals_qq					<= fvals_q;
			fvals_qqq				<= fvals_qq;
			fvals_4q					<= fvals_qqq;
			fvals_5q					<=	fvals_4q;
			
			lvals_q					<= lvals;
			lvals_qq					<= lvals_q;
			lvals_qqq				<= lvals_qq;
			lvals_4q					<= lvals_qqq;
			lvals_5q					<=	lvals_4q;
		end
	end

	// gen lval
	always	@(posedge clk_txg)begin
		if(!rst_tx_n)begin
			fsm_gen_lval	<=	s_IDLE_GEN;
			cnt_lval			<=	12'd0;
			lval_image		<=	1'b0;
			fval_image		<=	1'b0;
		end
		else begin
			case(fsm_gen_lval)
				s_IDLE_GEN: 		begin
											if((lvals_4q	==	1'b1) && (fvals_4q	==	1'b1))begin
												fsm_gen_lval	<=	s_GEN_LVAL;
												lval_image		<=	1'b1;
												fval_image		<=	1'b1;
												cnt_lval			<=	12'd0;
											end
											if(fvals_4q	==	1'b0)begin
												fval_image		<=	1'b0;
											end
										end
				s_GEN_LVAL:			begin
											if(cnt_lval	==	12'd191)begin
												lval_image		<=	0;
												fsm_gen_lval	<=	s_WAIT_GEN;
												cnt_lval			<=	12'd0;
											end
											else begin
												cnt_lval			<=	cnt_lval + 12'd1;
											end
										end
				s_WAIT_GEN:			begin
											if(cnt_lval	==	12'd1)begin
												fsm_gen_lval	<=	s_IDLE_GEN;
												cnt_lval			<=	12'd0;
											end
											else begin
												cnt_lval			<=	cnt_lval	+	12'd1;
											end
										end
			endcase
		end
	end
	
	always @(posedge clk_rxg) begin
		if(!rst_rx_n)begin
			cnt_even					<= 2'd0;
			cnt_txg					<= 2'd0;
			even						<= 1'b0;
			even_q					<= 1'b0;
			reg_din0					<= 24'd0;
			reg_din1					<= 24'd0;
			reg_din2					<= 24'd0;
			reg_din3					<= 24'd0;
			reg_din4					<= 24'd0;
			reg_din5					<= 24'd0;
			reg_din6					<= 24'd0;
			reg_din7					<= 24'd0;
			datapar_out0_q			<=	12'd0;
			datapar_out1_q			<=	12'd0;
			datapar_out2_q			<=	12'd0;
			datapar_out3_q			<=	12'd0;
			datapar_out4_q			<=	12'd0;
			datapar_out5_q			<=	12'd0;
			datapar_out6_q			<=	12'd0;
			datapar_out7_q			<=	12'd0;
			fsm_even					<= s_IDLE_EVEN;
		end
		else begin
			even_q					<= even;
			datapar_out0_q			<=	datapar_out0;
			datapar_out1_q			<=	datapar_out1;
			datapar_out2_q			<=	datapar_out2;
			datapar_out3_q			<=	datapar_out3;
			datapar_out4_q			<=	datapar_out4;
			datapar_out5_q			<=	datapar_out5;
			datapar_out6_q			<=	datapar_out6;
			datapar_out7_q			<=	datapar_out7;
			case(fsm_even)
				s_IDLE_EVEN:		begin
											if((lvals == 1'b1) && (lvals_q == 1'b0))begin
												fsm_even			<= s_GEN;
												even				<= 1'b1;
											end
										end
				s_GEN:				begin
											if(lvals == 1'b0) begin
												fsm_even			<= s_IDLE_EVEN;
												even				<= 1'b0;
											end
											else begin
												even				<= ~even;
											end
										end
			endcase

			if(even	== 1'b1) begin
				reg_din0					<= 	{datapar_out0,datapar_out0_q};
				reg_din1					<= 	{datapar_out1,datapar_out1_q};
				reg_din2					<= 	{datapar_out2,datapar_out2_q};
				reg_din3					<= 	{datapar_out3,datapar_out3_q};
				reg_din4					<= 	{datapar_out4,datapar_out4_q};
				reg_din5					<= 	{datapar_out5,datapar_out5_q};
				reg_din6					<= 	{datapar_out6,datapar_out6_q};
				reg_din7					<= 	{datapar_out7,datapar_out7_q};
			end
		end
	end
	
	// write in
	always @(posedge clk_rxg) begin
		if(!rst_rx_n) begin
			wr_addr			<= 8'd0;
			cnt_wr			<=	2'd0;
		end
		else begin
			if (wr_addr == 8'd64) begin
				wr_addr 		<= 8'd0;
			end
			else begin
				if(fvals_qq == 1'b1) begin
					if(lvals_qq == 1'b1) begin		
						if(cnt_wr	==	2'b01)begin
							cnt_wr		<=	2'b00;
							wr_addr		<= wr_addr + 8'd1;
						end
						else begin
							cnt_wr		<=	cnt_wr	+	2'b01;
						end
					end
				end
				else begin
					wr_addr <= 8'd0;
				end
			end
		end
	end
	
	always	@(posedge clk_txg)begin
		if(!rst_tx_n)begin
			lval_image_q	<=	1'b0;
			lval				<=	1'b0;
			fval				<=	1'b0;
			fval_image_q	<=	1'b0;
		end
		else begin
			lval_image_q	<=	lval_image;
			fval_image_q	<=	fval_image;
			fval				<=	fval_image_q;
			lval				<=	lval_image_q;
		end
	end
	//read_out
	always @(posedge clk_txg) begin
		if(!rst_tx_n)begin
			rd_addr					<= 8'd0;
			flag_2					<= 3'b000;
			fsm_rd					<= s_IDLE_RD;
		end
		else begin
			case(fsm_rd)
				s_IDLE_RD:			begin
											rd_addr				<=	12'd0;
											if((lval_image	==	1'b1)&&(lval_image_q	==	1'b0))begin
												fsm_rd				<=	s_MID8;
												rd_addr				<=	12'd0;
												flag_2				<=	3'b001;	//3'b001;
											end
											else begin
												flag_2				<=	3'b000;
											end
										end
				s_FIRST8:			begin
											//rd_addr					<=	rd_addr	+	8'd1;
											fsm_rd					<=	s_MID8;
											flag_2					<=	3'b001;		//3'b001;
										end
				s_MID8:				begin
											fsm_rd					<=	s_LAST8;
											flag_2					<=	3'b010;		//3'b010;
										end
				s_LAST8:				begin
											rd_addr					<=	rd_addr	+	8'd1;
											flag_2					<=	3'b011;		//3'b011;
											if(rd_addr	==	8'd63)begin
												fsm_rd				<=	s_IDLE_RD;
											end
											else begin
												fsm_rd				<=	s_FIRST8;
											end
										end
			endcase
		end
	end

	
	always @(posedge clk_txg)begin
		if(!rst_tx_n)begin
			chan_0						<= 8'd0;
			chan_1						<= 8'd0;
			chan_2						<= 8'd0;
			chan_3						<= 8'd0;
			chan_4						<= 8'd0;
			chan_5						<= 8'd0;
			chan_6						<= 8'd0;
			chan_7						<= 8'd0;
		end
		else begin
			case(flag_2)
				3'b000:		begin
									chan_0						<= 8'd0;
									chan_1						<= 8'd0;
									chan_2						<= 8'd0;
									chan_3						<= 8'd0;
									chan_4						<= 8'd0;
									chan_5						<= 8'd0;
									chan_6						<= 8'd0;
									chan_7						<= 8'd0;
								end
				3'b001:		begin
									chan_0						<= reg_dout0[7:0];
									chan_1						<= reg_dout1[7:0];
									chan_2						<= reg_dout2[7:0];
									chan_3						<= reg_dout3[7:0];
									chan_4						<= reg_dout4[7:0];
									chan_5						<= reg_dout5[7:0];
									chan_6						<= reg_dout6[7:0];
									chan_7						<= reg_dout7[7:0];
								end
				3'b010:		begin
									chan_0						<= {reg_dout0[23:20],reg_dout0[11:8]};
									chan_1						<= {reg_dout1[23:20],reg_dout1[11:8]};
									chan_2						<= {reg_dout2[23:20],reg_dout2[11:8]};
									chan_3						<= {reg_dout3[23:20],reg_dout3[11:8]};
									chan_4						<= {reg_dout4[23:20],reg_dout4[11:8]};
									chan_5						<= {reg_dout5[23:20],reg_dout5[11:8]};
									chan_6						<= {reg_dout6[23:20],reg_dout6[11:8]};
									chan_7						<= {reg_dout7[23:20],reg_dout7[11:8]};
								end
				3'b011:		begin
									chan_0						<= reg_dout0[19:12];
									chan_1						<= reg_dout1[19:12];
									chan_2						<= reg_dout2[19:12];
									chan_3						<= reg_dout3[19:12];
									chan_4						<= reg_dout4[19:12];
									chan_5						<= reg_dout5[19:12];
									chan_6						<= reg_dout6[19:12];
									chan_7						<= reg_dout7[19:12];
								end
			endcase
		end
	end
	
	simple_dual_ram_w24_d512 dram0(
				.clka			(clk_rxg),
				.wea			(lvals_qq),
				.addra		(wr_addr),
				.dina			(reg_din0),
				.clkb			(clk_txg),
				.addrb		(rd_addr),
				.doutb		(reg_dout0)
	);
	simple_dual_ram_w24_d512 dram1(
				.clka			(clk_rxg),
				.wea			(lvals_qq),
				.addra		(wr_addr),
				.dina			(reg_din1),
				.clkb			(clk_txg),
				.addrb		(rd_addr),
				.doutb		(reg_dout1)
	);
	simple_dual_ram_w24_d512 dram2(
				.clka			(clk_rxg),
				.wea			(lvals_qq),
				.addra		(wr_addr),
				.dina			(reg_din2),
				.clkb			(clk_txg),
				.addrb		(rd_addr),
				.doutb		(reg_dout2)
	);
	simple_dual_ram_w24_d512 dram3(
				.clka			(clk_rxg),
				.wea			(lvals_qq),
				.addra		(wr_addr),
				.dina			(reg_din3),
				.clkb			(clk_txg),
				.addrb		(rd_addr),
				.doutb		(reg_dout3)
	);
	simple_dual_ram_w24_d512 dram4(
				.clka			(clk_rxg),
				.wea			(lvals_qq),
				.addra		(wr_addr),
				.dina			(reg_din4),
				.clkb			(clk_txg),
				.addrb		(rd_addr),
				.doutb		(reg_dout4)
	);
	simple_dual_ram_w24_d512 dram5(
				.clka			(clk_rxg),
				.wea			(lvals_qq),
				.addra		(wr_addr),
				.dina			(reg_din5),
				.clkb			(clk_txg),
				.addrb		(rd_addr),
				.doutb		(reg_dout5)
	);
	simple_dual_ram_w24_d512 dram6(
				.clka			(clk_rxg),
				.wea			(lvals_qq),
				.addra		(wr_addr),
				.dina			(reg_din6),
				.clkb			(clk_txg),
				.addrb		(rd_addr),
				.doutb		(reg_dout6)
	);
	simple_dual_ram_w24_d512 dram7(
				.clka			(clk_rxg),
				.wea			(lvals_qq),
				.addra		(wr_addr),
				.dina			(reg_din7),
				.clkb			(clk_txg),
				.addrb		(rd_addr),
				.doutb		(reg_dout7)
	);

endmodule
