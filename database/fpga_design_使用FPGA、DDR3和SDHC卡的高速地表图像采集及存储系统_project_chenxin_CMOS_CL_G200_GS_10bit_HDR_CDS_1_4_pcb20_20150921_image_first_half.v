`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:26:44 01/07/2015 
// Design Name: 
// Module Name:    image_first_half 
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
/*module image_first_half(clk_rxg, rst_rx_n, clk_txg, rst_tx_n, fvals, lvals,grab_done,grab_done_h,
			dram_h_din0, dram_h_din1, dram_h_din2, dram_h_din3, dram_h_din4, dram_h_din5, dram_h_din6, dram_h_din7,
				chan_h0, chan_h1, chan_h2, chan_h3,
				fval, lval
    );
	input			clk_rxg;
	input			rst_rx_n;
	input			clk_txg;
	input			rst_tx_n;
	input			fvals;
	input			lvals;
	input       grab_done;
	
	output		fval;
	output		lval;
	output      grab_done_h;

	input	[11:0]	dram_h_din0;
	input	[11:0]	dram_h_din1;
	input	[11:0]	dram_h_din2;
	input	[11:0]	dram_h_din3;
	input	[11:0]	dram_h_din4;
	input	[11:0]	dram_h_din5;
	input	[11:0]	dram_h_din6;
	input	[11:0]	dram_h_din7;
	
	output [11:0]	chan_h0;
	output [11:0]	chan_h1;
	output [11:0]	chan_h2;
	output [11:0]	chan_h3;
	
	
	wire	[11:0]	dram_dout0;
	wire	[11:0]	dram_dout1;
	wire	[11:0]	dram_dout2;
	wire	[11:0]	dram_dout3;
	wire	[11:0]	dram_dout4;
	wire	[11:0]	dram_dout5;
	wire	[11:0]	dram_dout6;
	wire	[11:0]	dram_dout7;
	
	reg [11:0]		chan_h0;
	reg [11:0]		chan_h1;
	reg [11:0]		chan_h2;
	reg [11:0]		chan_h3;
	
	reg				wea_1;
	reg				wea_2;
	reg	[9:0]		wr_addr_1;
	reg	[9:0]		wr_addr_2;
	
	wire				fvals_q;
	wire				lvals_q;
	reg				fval;
	reg				lval;
	reg				fvals_qq;
	reg				lvals_qq;
	reg				fvals_qqq;
	reg				lvals_qqq;
	reg				lval_t;
	reg				fval_tt;
	reg				lval_tt;
	reg				lval_ttt;
	
	reg				p1;
	reg				p2;
	reg [3:0]		fsm_write;
	parameter		s_IDLE		= 4'b0001,
						s_1_FH		= 4'b0010,
						s_1_SH		= 4'b0100,
						s_2_FH		= 4'b1000,
						s_2_SH		= 4'b1001;
	
	reg [1:0]		fsm_rd;
	parameter		s1 = 2'b00,
						s2 = 2'b01,
						s3 = 2'b10,
						s4 = 2'b11;
						
	reg [1:0]		fsm_chan;
	parameter		L1 = 2'b00,
						L2 = 2'b01;
	
	reg [9:0]		rd_addr_1;
	reg [9:0]		rd_addr_2;
	
	reg [9:0]		cnt_chan;
	reg [11:0]		cnt_lval;
	reg [11:0]		cnt_lval_max;

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
	
	always @(posedge clk_txg) begin
		if (!rst_tx_n) begin
			fval_tt		<= 1'b0;
			lval_tt		<= 1'b0;
			fval			<= 1'b0;
			lval			<= 1'b0;
		end
		else begin
			fval_tt		<= fvals_qqq;
			lval_tt		<= lval_t;
			fval			<= fval_tt;
			lval			<= lval_tt;
		end
	end
	
	// write in
	always @(posedge clk_rxg) begin
		if(!rst_rx_n) begin
			wea_1					<= 1'b0;
			wea_2					<= 1'b0;
			wr_addr_1			<= 10'd0;
			wr_addr_2			<= 10'd0;
			fsm_write			<= s_IDLE;
		end
		else begin
			case (fsm_write)	
					s_IDLE: 		begin	//	1
										if(fvals == 1'b1) begin
											if(lvals == 1'b1) begin
												wea_1			<= 1'b1;
												wr_addr_1 	<= 10'd0;
												wea_2			<= 1'b0;
												wr_addr_2	<= 10'd0;
												fsm_write	<= s_1_FH;
											end
											else begin
												wea_1			<= 1'b0;
												wr_addr_1 	<= 10'd0;
												wea_2			<= 1'b0;
												wr_addr_2	<= 10'd0;		
											end
										end
									end
					s_1_FH: 		begin		// 2								
										if(wr_addr_1 == 10'd255) begin
											fsm_write	<= s_1_SH;
											wea_1			<= 1'b0;
											wea_2			<= 1'b1;
											wr_addr_1 	<= 10'd256;
										end
										else begin
											wea_1			<= 1'b1;
											wr_addr_1	<= wr_addr_1 + 10'd1;
										end
									end
					s_1_SH:		begin  // 4
										if(wr_addr_2 == 10'd255) begin
											wea_2			<= 1'b0;
											wea_1			<= 1'b1;
											fsm_write	<= s_2_FH;
											wr_addr_2	<= 10'd256;
										end
										else begin
											wea_2			<= 1'b1;
											wr_addr_2	<= wr_addr_2 + 10'd1;
										end
									end
					s_2_FH:		begin // 8
										if(wr_addr_1 == 10'd511) begin
											fsm_write	<= s_2_SH;
											wea_1			<= 1'b0;
											wea_2			<= 1'b1;
										end
										else begin
											wea_1			<= 1'b1;
											wr_addr_1	<= wr_addr_1 + 10'd1;
										end
									end
					s_2_SH:		begin // 9
										if(wr_addr_2 == 10'd511) begin
											fsm_write	<= s_IDLE;
											wea_1			<= 1'b0;
											wea_2			<= 1'b0;
										end
										else begin
											wea_2			<= 1'b1;
											wr_addr_2	<= wr_addr_2 + 10'd1;
										end
									end
				endcase
		end
	end
	
		// read out
	always @(posedge clk_txg) begin
		if(!rst_tx_n) begin
			chan_h0				<= 12'd0;
			chan_h1				<= 12'd0;
			chan_h2				<= 12'd0;
			chan_h3				<= 12'd0;
			fsm_rd				<=	s1;
			fsm_chan				<= L1;
			rd_addr_1			<= 10'd0;
			rd_addr_2			<= 10'd0;
			cnt_chan				<= 10'd0;
		end
		else begin
			case(fsm_rd)
				s1:	begin
							if ((lval_t == 1'b1) && (lvals_qqq == 1'b1)) begin
								if(rd_addr_1 == 10'd255) begin
									fsm_rd	<= s2;
									rd_addr_1 <= 10'd256;
								end
								else begin
									rd_addr_1	<= rd_addr_1 + 10'd1;
								end
							end
						end
				s2:	begin
						if(lval_t == 1'b1)begin
							if(rd_addr_2 == 10'd255) begin
								fsm_rd	<= s3;
								rd_addr_2 <= 10'd256;
							end
							else begin
								rd_addr_2 <=rd_addr_2 + 10'd1;
							end
						end
						end
				s3:	begin
							chan_h0 <= dram_dout0;
							chan_h1 <= dram_dout1;
							chan_h2 <= dram_dout2;
							chan_h3 <= dram_dout3;
						if(lval_t == 1'b1)begin
							if(rd_addr_1 == 10'd511) begin
								fsm_rd 	<= s4;
							end
							else begin
								rd_addr_1	<= rd_addr_1 + 10'd1;
							end
						end
						end
				s4:	begin
							chan_h0 <= dram_dout4;
							chan_h1 <= dram_dout5;
							chan_h2 <= dram_dout6;
							chan_h3 <= dram_dout7;
						if(lval_t == 1'b1)begin
							if(rd_addr_2 == 10'd511) begin
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
					L1:	begin
								if (lval_ttt == 1'b1) begin
									if(cnt_chan == 10'd255) begin
										fsm_chan	<= L2;
										cnt_chan	<= 10'd0;
									end
									else begin
										chan_h0 <= dram_dout0;
										chan_h1 <= dram_dout1;
										chan_h2 <= dram_dout2;
										chan_h3 <= dram_dout3;
										cnt_chan <= cnt_chan + 10'd1;
									end
								end
								else begin
									chan_h0	<= 12'd0;
									chan_h1	<= 12'd0;
									chan_h2	<= 12'd0;
									chan_h3	<= 12'd0;
								end
							end
					L2:	begin
								if (lval_ttt == 1'b1) begin
									if(cnt_chan == 10'd255) begin
										fsm_chan	<= L1;
										cnt_chan	<= 10'd0;
									end
									else begin
										cnt_chan	<= cnt_chan + 10'd1;
										chan_h0 <= dram_dout4;
										chan_h1 <= dram_dout5;
										chan_h2 <= dram_dout6;
										chan_h3 <= dram_dout7;
									end
								end
								else begin
									chan_h0	<= 12'd0;
									chan_h1	<= 12'd0;
									chan_h2	<= 12'd0;
									chan_h3	<= 12'd0;
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
		end
		else begin
			if ((lvals_qq == 1'b1) && (lvals_qqq == 1'b0)) begin
				lval_t	<= 1'b1;
				cnt_lval	<= 12'd0;
			end
			
			if (lval_t == 1'b1) begin
				if (cnt_lval == 12'd511) begin
					cnt_lval		<= 12'd0;
					lval_t		<= 1'b0;
				end
				else begin
					cnt_lval		<= cnt_lval + 12'd1;
				end
			end
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
	
	
	// 8 rams
	simple_dual_ram_w12_d1024 dram0(
				.clka			(clk_rxg),
				.wea			(wea_1),
				.addra		(wr_addr_1),
				.dina			(dram_h_din0),
				.clkb			(clk_txg),
				.addrb		(rd_addr_1),
				.doutb		(dram_dout0)
	);
	
	simple_dual_ram_w12_d1024 dram1(
				.clka			(clk_rxg),
				.wea			(wea_2),
				.addra		(wr_addr_2),
				.dina			(dram_h_din1),
				.clkb			(clk_txg),
				.addrb		(rd_addr_1),
				.doutb		(dram_dout1)
	);

	simple_dual_ram_w12_d1024 dram2(
				.clka			(clk_rxg),
				.wea			(wea_1),
				.addra		(wr_addr_1),
				.dina			(dram_h_din2),
				.clkb			(clk_txg),
				.addrb		(rd_addr_1),
				.doutb		(dram_dout2)
	);
	
	simple_dual_ram_w12_d1024 dram3(
				.clka			(clk_rxg),
				.wea			(wea_2),
				.addra		(wr_addr_2),
				.dina			(dram_h_din3),
				.clkb			(clk_txg),
				.addrb		(rd_addr_2),
				.doutb		(dram_dout3)
	);
	
	simple_dual_ram_w12_d1024 dram4(
				.clka			(clk_rxg),
				.wea			(wea_1),
				.addra		(wr_addr_1),
				.dina			(dram_h_din4),
				.clkb			(clk_txg),
				.addrb		(rd_addr_1),
				.doutb		(dram_dout4)
	);
	
	simple_dual_ram_w12_d1024 dram5(
				.clka			(clk_rxg),
				.wea			(wea_2),
				.addra		(wr_addr_2),
				.dina			(dram_h_din5),
				.clkb			(clk_txg),
				.addrb		(rd_addr_2),
				.doutb		(dram_dout5)
	);
	
	simple_dual_ram_w12_d1024 dram6(
				.clka			(clk_rxg),
				.wea			(wea_1),
				.addra		(wr_addr_1),
				.dina			(dram_h_din6),
				.clkb			(clk_txg),
				.addrb		(rd_addr_1),
				.doutb		(dram_dout6)
	);
	simple_dual_ram_w12_d1024 dram7(
				.clka			(clk_rxg),
				.wea			(wea_2),
				.addra		(wr_addr_2),
				.dina			(dram_h_din7),
				.clkb			(clk_txg),
				.addrb		(rd_addr_2),
				.doutb		(dram_dout7)
	);
endmodule*/
