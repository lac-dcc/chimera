`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:28:48 01/07/2015 
// Design Name: 
// Module Name:    image_ful 
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
module image_ful( clk_rxg,	rst_rx_n, clk_txg, rst_tx_n, fvals, lvals,//grab_done,grab_done_f, 
				dram_f_din0, dram_f_din1, dram_f_din2, dram_f_din3, dram_f_din4, dram_f_din5, dram_f_din6, dram_f_din7,
				chan_f0, chan_f1, chan_f2, chan_f3,
				fval, lval
    );

	input				clk_rxg;
	input				rst_rx_n;
	input				clk_txg;
	input				rst_tx_n;
	input				fvals;
	input				lvals;
	output			fval;
	output			lval;


	input	[11:0]	dram_f_din0;
	input	[11:0]	dram_f_din1;
	input	[11:0]	dram_f_din2;
	input	[11:0]	dram_f_din3;
	input	[11:0]	dram_f_din4;
	input	[11:0]	dram_f_din5;
	input	[11:0]	dram_f_din6;
	input	[11:0]	dram_f_din7;
	
	output [11:0]	chan_f0;
	output [11:0]	chan_f1;
	output [11:0]	chan_f2;
	output [11:0]	chan_f3;

	wire	[11:0]	dram_dout0;
	wire	[11:0]	dram_dout1;
	wire	[11:0]	dram_dout2;
	wire	[11:0]	dram_dout3;
	wire	[11:0]	dram_dout4;
	wire	[11:0]	dram_dout5;
	wire	[11:0]	dram_dout6;
	wire	[11:0]	dram_dout7;

	reg [11:0]		chan_f0;
	reg [11:0]		chan_f1;
	reg [11:0]		chan_f2;
	reg [11:0]		chan_f3;

	reg	[9:0]		wr_addr;
	
	wire				fvals_q;
	wire				lvals_q;
	reg				fval;
	reg				lval;
	reg				fvals_qq;
	reg				lvals_qq;
	reg				fvals_qqq;
	reg				lvals_qqq;
	reg				lvals_qqqq;
	reg				lval_t;
	reg				fval_tt;
	reg				lval_tt;
	reg				lval_ttt; // chan_f的lval
	
	reg [1:0]		fsm_rd;
	parameter		s1 = 2'b00,
						s2 = 2'b01,
						s3 = 2'b10,
						s4 = 2'b11;
						
	reg [1:0]		fsm_chan;
	parameter		s_IDLE = 2'b00,
						L1 = 2'b01,
						L2 = 2'b11;
	
	(*keep = "true"*) reg [1:0]		fsm_fval;
	parameter		//s_IDLE 	= 2'b00,
						s_PEDGE	= 2'b01,
						s_WAIT	= 2'b10,
						s_FEDGE	= 2'b11;
						
	(*keep = "true"*) reg [1:0]		fsm_lval;
	parameter		s_FIR	= 2'b00,
						s_SEC	= 2'b01;
	
	reg [9:0]		rd_addr_1;
	reg [9:0]		rd_addr_2;
	
	reg [9:0]		cnt_chan;
	reg [11:0]		cnt_lval;
	reg [11:0]		cnt_lval_max;
	
	reg [9:0]		cnt_pedge;
	reg [9:0]		cnt_fedge;
	
	

	//同步
	always @(posedge clk_txg) begin
		if (!rst_tx_n) begin
			fvals_qq		<= 1'b0;
			lvals_qq		<= 1'b0;
			fvals_qqq	<= 1'b0;
			lvals_qqq	<= 1'b0;
		end
		else begin
			fvals_qq		<= fvals_q;
			lvals_qq		<= lvals_q;
			fvals_qqq	<= fvals_qq;
			lvals_qqq	<= lvals_qq;
		end
	end


	
	// write in
	always @(posedge clk_rxg) begin
		if(!rst_rx_n) begin
			wr_addr			<= 10'd0;
		end
		else begin
			if (wr_addr == 10'd1023) begin
				wr_addr 		<= 10'd0;
			end
			else begin
				if(fvals == 1'b1) begin
					if(lvals == 1'b1) begin
						wr_addr		<= wr_addr + 10'd1;
					end
				end
				else begin
					wr_addr <= 10'd0;
				end
			end
		end
	end
	
	// read out
	always @(posedge clk_txg) begin
		if(!rst_tx_n) begin
			chan_f0				<= 12'd0;
			chan_f1				<= 12'd0;
			chan_f2				<= 12'd0;
			chan_f3				<= 12'd0;
			fsm_rd				<=	s1;
			fsm_chan				<= s_IDLE;
			rd_addr_1			<= 10'd0;
			rd_addr_2			<= 10'd0;
			cnt_chan				<= 10'd0;
		end
		else begin
			case(fsm_rd)
				s1:	begin
							if ((lval_t == 1'b1) && (lvals_qqq == 1'b1)) begin
								if(rd_addr_1 == 10'd511) begin
									fsm_rd	<= s2;
									rd_addr_1 <= 10'd512;
								end
								else begin
									rd_addr_1	<= rd_addr_1 + 10'd1;
								end
							end
						end
				s2:	begin
						if(lval_t == 1'b1)begin
							if(rd_addr_2 == 10'd511) begin
								fsm_rd	<= s3;
								rd_addr_2 <= 10'd512;
							end
							else begin
								rd_addr_2 <=rd_addr_2 + 10'd1;
							end
						end
						end
				s3:	begin
						if(lval_t == 1'b1)begin
							if(rd_addr_1 == 10'd1023) begin
								fsm_rd 	<= s4;
							end
							else begin
								rd_addr_1	<= rd_addr_1 + 10'd1;
							end
						end
						end
				s4:	begin
						if(lval_t == 1'b1)begin
							if(rd_addr_2 == 10'd1023) begin
								fsm_rd <= s1;
								rd_addr_1	<= 10'd0;
								rd_addr_2	<= 10'd0;
							end
							else begin
								rd_addr_2	<= rd_addr_2 + 10'd1;
							end
						end
						end
			endcase
			case(fsm_chan)
					s_IDLE: begin
								if(lval_t == 1'b1) begin
									fsm_chan	<= L1;
									cnt_chan	<= 10'd0;
								end
								else begin
									chan_f0 <= 12'd0;
									chan_f1 <= 12'd0;
									chan_f2 <= 12'd0;
									chan_f3 <= 12'd0;
								end
							end
					L1:	begin
								if(cnt_chan == 10'd512) begin
										fsm_chan	<= L2;
										cnt_chan	<= 10'd0;
								end
								else begin
										chan_f0 <= dram_dout0;
										chan_f1 <= dram_dout2;
										chan_f2 <= dram_dout4;
										chan_f3 <= dram_dout6;
										cnt_chan <= cnt_chan + 10'd1;
								end
							end
					L2:	begin
								if(cnt_chan == 10'd512) begin
										fsm_chan	<= L1;
										cnt_chan	<= 10'd0;
								end
								else begin
										cnt_chan	<= cnt_chan + 10'd1;
										chan_f0 <= dram_dout1;
										chan_f1 <= dram_dout3;
										chan_f2 <= dram_dout5;
										chan_f3 <= dram_dout7;
								end
								if(fval == 1'b0) begin
									fsm_chan <= s_IDLE;
								end
							end
			endcase
		end
	end
		
	// RE-GENERATE FVAL & LVAL
	always @(posedge clk_txg) begin
		if (!rst_tx_n) begin
			lval_t		<= 1'b0;
			cnt_lval		<= 12'd0;
			fsm_lval		<= s_FIR;
		end
		else begin
			case (fsm_lval)
				s_FIR:	begin
								if(lvals_qq == 1'b1) begin
									if(cnt_lval == 12'd512) begin
										cnt_lval	<= 12'd0;
										lval_t	<= 1'b0;
										fsm_lval	<= s_SEC;
									end
									else begin
										cnt_lval	<= cnt_lval + 12'd1;
										lval_t	<= 1'b1;
									end
								end
							end
				s_SEC:	begin
								if(cnt_lval == 12'd512) begin
									cnt_lval	<= 12'd0;
									lval_t	<= 1'b0;
									fsm_lval	<= s_FIR;
								end
								else begin
									cnt_lval	<= cnt_lval + 12'd1;
									lval_t	<= 1'b1;
								end
							end
			endcase
		end
	end
	
	always @(posedge clk_txg) begin
		if (!rst_tx_n) begin
			fval_tt		<= 1'b0;
			lval_tt		<= 1'b0;
			lval			<= 1'b0;
		end
		else begin
			fval_tt		<= fvals_qqq;
			lval_tt		<= lval_t;
			lval_ttt		<= lval_tt;
			lval			<= lval_tt;
		end
	end
		
	always @(posedge clk_txg) begin
		if (!rst_tx_n) begin
			cnt_pedge	<= 10'd0;
			cnt_fedge	<= 10'd0;
			fval			<= 1'b0;
			fsm_fval		<= s_PEDGE;
		end
		else begin
			case(fsm_fval)
				s_PEDGE: begin
								if(fval_tt == 1'b1)begin
										fval			<= 1'b1;
										fsm_fval		<= s_WAIT;
								end
							end
				s_WAIT:	begin
								if((fvals_q == 1'b0) && (fvals_qq == 1'b1))begin
									fsm_fval	<= s_FEDGE;
								end
								else begin
									fval	<= 1'b1;
								end
							end
				s_FEDGE:	begin
								if(cnt_fedge == 10'd4) begin
									cnt_fedge	<= 10'd0;
									fval			<= 1'b0;
									fsm_fval		<= s_PEDGE;
								end
								else begin
									cnt_fedge	<= cnt_fedge + 10'd1;
								end
							end
			endcase
		end
	end

		
	// 移位寄存器 移动了一个位宽
	shifter_w1_d512 shifter_fval(
		.d			(fvals),
		.clk		(clk_rxg),
		.sclr		(~rst_rx_n),
		.q			(fvals_q)
	);
	
	shifter_w1_d512 shifter_lval(
		.d			(lvals),
		.clk		(clk_rxg),
		.sclr		(~rst_rx_n),
		.q			(lvals_q)
	);
	
	shifter_w1_d512 shifter_grab_done(
		.d			(grab_done),
		.clk		(clk_rxg),
		.sclr		(~rst_rx_n),
		.q			(grab_done_q)
	);
	
	// 8 rams
	simple_dual_ram_w12_d1024 dram0(
				.clka			(clk_rxg),
				.wea			(lvals),
				.addra		(wr_addr),
				.dina			(dram_f_din0),
				.clkb			(clk_txg),
				.addrb		(rd_addr_1),
				.doutb		(dram_dout0)
	);
	
	simple_dual_ram_w12_d1024 dram1(
				.clka			(clk_rxg),
				.wea			(lvals),
				.addra		(wr_addr),
				.dina			(dram_f_din1),
				.clkb			(clk_txg),
				.addrb		(rd_addr_2),
				.doutb		(dram_dout1)
	);

	simple_dual_ram_w12_d1024 dram2(
				.clka			(clk_rxg),
				.wea			(lvals),
				.addra		(wr_addr),
				.dina			(dram_f_din2),
				.clkb			(clk_txg),
				.addrb		(rd_addr_1),
				.doutb		(dram_dout2)
	);
	
	simple_dual_ram_w12_d1024 dram3(
				.clka			(clk_rxg),
				.wea			(lvals),
				.addra		(wr_addr),
				.dina			(dram_f_din3),
				.clkb			(clk_txg),
				.addrb		(rd_addr_2),
				.doutb		(dram_dout3)
	);
	
	simple_dual_ram_w12_d1024 dram4(
				.clka			(clk_rxg),
				.wea			(lvals),
				.addra		(wr_addr),
				.dina			(dram_f_din4),
				.clkb			(clk_txg),
				.addrb		(rd_addr_1),
				.doutb		(dram_dout4)
	);
	
	simple_dual_ram_w12_d1024 dram5(
				.clka			(clk_rxg),
				.wea			(lvals),
				.addra		(wr_addr),
				.dina			(dram_f_din5),
				.clkb			(clk_txg),
				.addrb		(rd_addr_2),
				.doutb		(dram_dout5)
	);
	
	simple_dual_ram_w12_d1024 dram6(
				.clka			(clk_rxg),
				.wea			(lvals),
				.addra		(wr_addr),
				.dina			(dram_f_din6),
				.clkb			(clk_txg),
				.addrb		(rd_addr_1),
				.doutb		(dram_dout6)
	);
	simple_dual_ram_w12_d1024 dram7(
				.clka			(clk_rxg),
				.wea			(lvals),
				.addra		(wr_addr),
				.dina			(dram_f_din7),
				.clkb			(clk_txg),
				.addrb		(rd_addr_2),
				.doutb		(dram_dout7)
	);
endmodule
