`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	sequencer 
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		Gvsion200 sequencer and receive the command from labview
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module sequencer_g200(clk_rxg, rst_rx_n,
	frame_req, reg_frames,
	reg_integration, hdr_enable, reg_cnt_timing_cycle, reg_window_row_start, reg_window_row_length, 
	timing_bram_rd_addr, timing_bram_dout, 
	pixel_read_timing, decoder,
	fot_rst_rd_addr,	fot_rst_bram_dout, fot_rst_timing_cycle,
	fot_sig_rd_addr,	fot_sig_bram_dout, fot_sig_timing_cycle, 
	fot_dout, 
	tx2, cnt_t3
	);
	// clock & reset
	input				clk_rxg;
	input				rst_rx_n;
	
	// register
	input				frame_req;
	input  [7:0]	reg_frames;
	input  [23:0]	reg_integration;
	input				hdr_enable;
	input  [9:0]	reg_cnt_timing_cycle;
	input  [11:0]	reg_window_row_start;
	input  [11:0]	reg_window_row_length;
	
	// timing bram
	input  [17:0]	timing_bram_dout;
	output [9:0]	timing_bram_rd_addr;
	
	input	[4:0]		fot_sig_bram_dout;
	(*keep = "true"*)input	[10:0]	fot_sig_timing_cycle;
	input	[4:0]		fot_rst_bram_dout;
	input	[10:0]	fot_rst_timing_cycle;
		
	// outputs
	output [17:0]	pixel_read_timing;
	output [4:0]	fot_dout;
	output [10:0]	fot_rst_rd_addr;
	output [10:0]	fot_sig_rd_addr;
	output [10:0]	decoder;
	output			tx2;
	input	[7:0]		cnt_t3; // inte/130的余数
	
	reg [3:0]		flag;
	reg [3:0]		flag_q;
	reg				tx2;
	reg				tx2_r;
	reg [10:0]		decoder_r;
	reg [4:0]		fot_dout;
	reg [17:0]		pixel_read_timing;
	reg [10:0]		decoder;
	reg [9:0]		cnt_timing_cycle;
	reg [10:0]		cnt_decoder;						
	reg [23:0]		cnt_exp;
	reg [7:0]		cnt_frames;
	reg [23:0]		t3_length;
	reg [11:0]		cnt_fot_rst;
	reg [10:0]		cnt_fot_sig;
	reg				frame_req_q;
	reg				frame_req_qq;
	reg				timing_bram_dout_q;
	(*keep = "true"*)reg [11:0]		cnt_tx2;
	reg [11:0]		cnt_tx2_1;
	reg				flag_tx2;
	
	wire [11:0]		window_row_real_length;
	wire [10:0] 	fot_rst_rd_addr;
	wire [10:0]		fot_sig_rd_addr;
	reg [2:0]		flag_cho;
	reg				at_begining;
	reg	[7:0]		remainder_1;//
	reg	[23:0]	remainder_2;//曝光时间小于4timing-cycle
	reg	[23:0]	inte_new;
	reg	[7:0]		cnt_fot;
						
	(*keep = "true"*) reg [3:0]	fsm_global;
	parameter		s_IDLE   	=	4'b0000,
						s_T3			= 	4'b0001,
						s_RD_RST		= 	4'b0011,
						s_FOT_SIG	=	4'b0100,
						s_RD_SIG		=	4'b0101,
						s_GEN_TX2	=	4'b0110;
						
	wire [23:0]		rd_length;
		

	assign			timing_bram_rd_addr	= cnt_timing_cycle;
	assign			fot_sig_rd_addr		= cnt_fot_sig;
	assign			fot_rst_rd_addr 		= cnt_fot_rst;
	
	mult mult_rd_length (
		.clk			(clk_rxg),
		.a				({1'b0, reg_cnt_timing_cycle}),
		.b				((reg_window_row_length + 11'd1)),
		.p				(rd_length)
	);
	
	//Global sequncer
	always @(posedge clk_rxg) begin
		if (!rst_rx_n) begin
			fsm_global				<= s_IDLE;
			frame_req_q				<= 1'b0;
			frame_req_qq			<= 1'b0;
			t3_length				<= 24'd0;
			cnt_fot_rst				<= 12'd0;
			decoder_r				<= 11'd0;
			cnt_exp					<= 24'd0;
			cnt_timing_cycle		<= 10'd0;
			cnt_decoder				<=	11'd0;
			cnt_fot_sig				<= 11'd0;
			cnt_fot_rst				<= 11'd0;
			tx2_r						<= 1'b1;//1'b0;
			timing_bram_dout_q	<= 1'b0;
			cnt_frames				<= 8'd0;
			flag						<= 4'b0001;
			cnt_tx2					<=	12'd0;
			flag_tx2 				<= 1'b0;
			flag_cho					<=	3'd0;
			at_begining				<=	1'b0;
			cnt_fot					<=	8'd0;
			decoder_r				<= 11'd0;
			decoder					<= 11'd0;
		end
		else begin
			remainder_1				<=	8'd130 - cnt_t3;
			timing_bram_dout_q	<= timing_bram_dout[16];
			frame_req_q				<= frame_req;
			frame_req_qq			<= frame_req_q;
			decoder					<= decoder_r;
			
			// remainder_2赋值
			if(reg_integration < 5*reg_cnt_timing_cycle)begin
				remainder_2						<=	5*reg_cnt_timing_cycle - reg_integration - 23'd1;
				inte_new							<=	reg_integration;
			end
			else begin
				if(cnt_t3 == 8'd0)begin
					inte_new							<=	reg_integration -	5*reg_cnt_timing_cycle;
				end
				else begin
					inte_new							<=	reg_integration -	4*reg_cnt_timing_cycle;
				end
			end
			
			case(fsm_global)
				s_IDLE:		begin
									tx2_r				<=	1'b1;//1'b0;
									decoder_r		<=	11'd0;
									if((frame_req_q == 1'b1) && (frame_req_qq == 1'b0))begin
										tx2_r							<=	1'b0;
										cnt_frames					<= 8'd0;
										flag_cho						<=	3'd2;//tx2跳回选择s_T3
										flag							<= 4'b0001;
										flag_tx2						<=	1'b0;
										cnt_timing_cycle			<= 10'd0;
										if(inte_new > rd_length - 24'd1)begin
											t3_length			<= inte_new - rd_length - cnt_t3;
											cnt_exp				<= inte_new - 24'd1;
											fsm_global			<= s_GEN_TX2;
											flag					<= 4'b1010;
											cnt_tx2				<=	12'd0;
											tx2_r					<=	1'b0;
										end		
										else begin		
											t3_length			<= 24'd0;
											cnt_exp				<= rd_length - 24'd1;
											fsm_global			<= s_T3;
											tx2_r					<=	1'b0;
											flag					<= 4'b0001;
										end							
									end
									//时序一直发
									if(cnt_timing_cycle == reg_cnt_timing_cycle - 10'd1)begin
										cnt_timing_cycle				<= 10'd0;
									end
									else begin
										cnt_timing_cycle				<= cnt_timing_cycle + 10'd1;
									end
								end
				s_T3:			begin
									if(t3_length	==	24'd0) begin
										tx2_r					<=	1'b0;
										fsm_global			<= s_RD_RST;
										flag					<= 4'b0010;
										decoder_r			<= reg_window_row_start;
										cnt_timing_cycle	<= 10'd0;
										cnt_decoder			<= 11'd0;
									end
									else begin
										tx2_r					<=	1'b0;
										t3_length			<= t3_length - 24'd1;
										flag					<= 4'b0001;
										
										if(cnt_timing_cycle == reg_cnt_timing_cycle - 10'd1)begin
											cnt_timing_cycle				<= 10'd0;
										end
										else begin
											cnt_timing_cycle				<= cnt_timing_cycle + 10'd1;
										end
									end
								end
				s_RD_RST:	begin
									cnt_exp							<= cnt_exp	-	24'd1;
									if(cnt_timing_cycle == reg_cnt_timing_cycle - 10'd1)begin
										cnt_timing_cycle				<= 10'd0;
										if(cnt_decoder == reg_window_row_length)begin
											if(flag_tx2 == 1'b0)begin
												fsm_global						<=	s_GEN_TX2;
												flag								<= 4'b1010;
												flag_cho							<=	3'd5;
												cnt_exp							<=	24'd0;
												cnt_tx2							<=	12'd0;
												cnt_decoder						<= 11'd0;
												cnt_timing_cycle				<= 10'd0;   
												cnt_fot_sig						<= 12'd0;
											end
											else begin
												cnt_decoder					<= 11'd0;
												cnt_timing_cycle			<= 10'd0;   
												cnt_fot_sig					<= 12'd0;
												fsm_global					<= s_FOT_SIG;
												flag							<= 4'b0100;
											end
										end
										else begin
											if(reg_integration < 5*reg_cnt_timing_cycle)begin///state A
												cnt_decoder					<= cnt_decoder + 11'd1;
												if(cnt_decoder	>= reg_window_row_length - 11'd1)begin
													decoder_r					<= decoder_r;
												end
												else begin
													decoder_r					<=	decoder_r + 11'd1;
												end
											end
											else begin
												if((cnt_exp < inte_new) && (flag_tx2 == 1'b0))begin
													fsm_global					<= s_GEN_TX2;
													flag							<= 4'b0001;
													cnt_tx2						<=	12'd0;	
													flag_cho						<=	3'd4;
												end
												else begin
													cnt_decoder					<= cnt_decoder + 11'd1;
													if(cnt_decoder	>= reg_window_row_length - 11'd1)begin
														decoder_r					<= decoder_r;
													end
													else begin
														decoder_r					<=	decoder_r + 11'd1;
													end
												end
											end
										end
									end
									else begin
										cnt_timing_cycle				<= cnt_timing_cycle + 10'd1;
									end
								end
				s_FOT_SIG:	begin
									if(cnt_fot_sig == fot_sig_timing_cycle - 12'd1)begin
										cnt_fot_sig					<=	12'd0;
										if(cnt_fot == 8'd5)begin
											cnt_fot			<=	8'd0;
											if(cnt_exp == inte_new - 24'd1)begin
												fsm_global							<= s_GEN_TX2;
												flag									<= 4'b1010;
												cnt_tx2								<=	12'd0;
												flag_cho								<=	3'd1;		
												at_begining							<=	1'b1;
											end
											else begin
												cnt_fot_sig					<= 12'd0;
												fsm_global					<= s_RD_SIG;
												flag							<= 4'b1000;
												tx2_r							<= 1'b0;
												decoder_r					<= reg_window_row_start;
												cnt_timing_cycle			<= 10'd0;
												cnt_decoder					<= 11'd0;
												flag_tx2 					<= 1'b0;
											end
										end
										else begin
											cnt_fot					<=	cnt_fot + 8'd1;
											flag						<= 4'b1010;
										end
									end
									else begin
										cnt_fot_sig					<= cnt_fot_sig + 12'd1;
									end
																		
									if(cnt_timing_cycle == reg_cnt_timing_cycle - 10'd1)begin
										cnt_timing_cycle				<= 10'd0;
									end
									else begin
										cnt_timing_cycle				<= cnt_timing_cycle + 10'd1;
									end
									
									if(inte_new > rd_length + rd_length - 24'd1)begin
										t3_length				<= inte_new -(rd_length + rd_length)- cnt_t3;
										cnt_exp					<= inte_new - 24'd1;
									end	
									else begin	
										t3_length				<= 24'd0;
										cnt_exp					<= rd_length + rd_length - 24'd1;
									end
								end
				s_RD_SIG:	begin
									cnt_exp							<= cnt_exp	-	24'd1;
									if(cnt_timing_cycle == reg_cnt_timing_cycle - 10'd1)begin
										cnt_timing_cycle				<= 10'd0;
										if(cnt_decoder == reg_window_row_length)begin
											if(cnt_frames == reg_frames - 8'd1)begin
												fsm_global				<= s_IDLE;
												tx2_r						<=	1'b0;
												cnt_decoder				<= 11'd0;
												flag						<= 4'b0001;
												cnt_timing_cycle		<= 10'd0;
												at_begining				<=	1'b0;													
											end
											else begin
												cnt_frames				<= cnt_frames + 8'd1;
												if(inte_new > rd_length + rd_length - 24'd1)begin
													t3_length			<= inte_new -(rd_length + rd_length)- cnt_t3;
													fsm_global			<= s_T3;
													flag					<= 4'b0001;
													at_begining			<=	1'b0;	
												end
												else begin
													at_begining			<=	1'b0;	
													tx2_r					<=	1'b0;
													fsm_global			<= s_RD_RST;
													flag					<= 4'b0010;
													decoder_r			<= reg_window_row_start;
													cnt_timing_cycle	<= 10'd0;
													cnt_decoder			<= 11'd0;
												end
											end
										end
										else begin
											if((cnt_exp < inte_new)	&&(flag_tx2 == 1'b0))begin
												fsm_global					<= s_GEN_TX2;
												flag							<= 4'b1010;
												cnt_tx2						<=	12'd0;
												flag_cho						<=	3'd1;
												at_begining					<=	1'b0;	
											end
											else begin
												cnt_decoder					<= cnt_decoder + 11'd1;
												if(cnt_decoder	>= reg_window_row_length - 11'd1)begin
													decoder_r					<= decoder_r;
												end
												else begin
													decoder_r					<=	decoder_r + 11'd1;
												end
											end
										end
									end
									else begin
										cnt_timing_cycle				<= cnt_timing_cycle + 10'd1;
									end
								end
								
				s_GEN_TX2:	begin
									flag_tx2									<=	1'b1;
									if(cnt_tx2	==	6*reg_cnt_timing_cycle	-	10'd1)begin// 满了6个timing_cycle，选择回到哪个状态机
										remainder_1							<=	8'd130 - cnt_t3;
										cnt_tx2_1							<=	12'd0;
										if(flag_cho	==	3'd1)begin
											fsm_global						<=	s_RD_SIG;
											flag								<= 4'b1000;
											cnt_exp							<=	cnt_exp	-	24'd1;
											cnt_tx2							<=	12'd0;
											flag_cho							<=	3'd0;	
											if(at_begining	==	1'b0)begin
												cnt_decoder					<= cnt_decoder + 11'd1;
												if(cnt_decoder	>= reg_window_row_length - 11'd1)begin
													decoder_r					<= decoder_r;
												end
												else begin
													decoder_r					<=	decoder_r + 11'd1;
												end
											end
											else begin
												cnt_decoder					<= 11'd0;
												decoder_r					<= reg_window_row_start;
											end
										end
										if(flag_cho	==	3'd2)begin
											fsm_global						<=	s_T3;
											flag								<= 4'b0001;
										end
										if(flag_cho	==	3'd4)begin
											fsm_global						<=	s_RD_RST;
											flag								<= 4'b0010;
											cnt_exp							<=	cnt_exp	-	24'd1;
											cnt_tx2							<=	12'd0;
											
											cnt_decoder						<= cnt_decoder + 11'd1;
											if(cnt_decoder	>= reg_window_row_length - 11'd1)begin
												decoder_r					<= decoder_r;
											end
											else begin
												decoder_r					<=	decoder_r + 11'd1;
											end
										end
										if(flag_cho	== 3'd5)begin
											fsm_global						<= s_FOT_SIG;
											flag								<= 4'b0100;
										end
									end
									else begin
										cnt_tx2								<=	cnt_tx2	+	12'd1;
										if(reg_integration	>=	5*reg_cnt_timing_cycle)begin
											if(cnt_t3 > 8'd0)begin
												if(cnt_tx2 >= remainder_1)begin
													if(cnt_tx2_1	>	12'd129)begin
														tx2_r								<=	1'b0;
													end
													else begin
														tx2_r								<=	1'b1;
														cnt_tx2_1						<=	cnt_tx2_1 + 12'd1;//查数用，保证130个时钟周期
													end
												end
											end
											else begin
												if(cnt_tx2 > 12'd129)begin
													tx2_r					<=	1'b0;
												end
												else begin
													tx2_r					<=	1'b1;
												end
											end
										end
										else begin
											if(cnt_tx2 >= remainder_2)begin
												if(cnt_tx2_1	>	12'd129)begin
													tx2_r								<=	1'b0;
												end
												else begin
													tx2_r								<=	1'b1;
													cnt_tx2_1						<=	cnt_tx2_1 + 12'd1;
												end
											end
										end
									end
									
									if(cnt_timing_cycle == reg_cnt_timing_cycle - 10'd1)begin
										cnt_timing_cycle				<= 10'd0;
									end
									else begin
										cnt_timing_cycle				<= cnt_timing_cycle + 10'd1;
									end
								end
			endcase
		end
	end
	
	always @(posedge clk_rxg) begin
		if(!rst_rx_n)begin
			pixel_read_timing[17:5] 		<=	13'd0;
			fot_dout[0]							<=	1'b0;		//RST
			fot_dout[1]							<=	1'b0;		//SEL
			fot_dout[2]							<=	1'b0;		//TX1
			fot_dout[3]							<=	1'b0;		//HDR
			fot_dout[4]							<=	1'd0;		//FOT
			
			flag_q								<= 4'b0000;
			tx2									<= 1'b0;
		end
		else begin
			flag_q		<= flag;
			tx2			<= tx2_r;
			case (flag)
				4'b0001:	begin //RD_RST_SYNC
								pixel_read_timing[17:6] 	<=	timing_bram_dout[17:6];
								pixel_read_timing[5] 		<=	1'b0;
								fot_dout[0]						<=	timing_bram_dout[0];		//RST
								fot_dout[1]						<=	timing_bram_dout[1];		//SEL
								fot_dout[2]						<=	timing_bram_dout[2];		//TX1
								fot_dout[3]						<=	timing_bram_dout[4];		//HDR
								fot_dout[4]						<=	1'b0;							//FOT
							end
				4'b0010:	begin //RD_RST						
								pixel_read_timing[17:5] 	<=	timing_bram_dout[17:5];
								fot_dout[0]						<=	timing_bram_dout[0];		//RST
								fot_dout[1]						<=	timing_bram_dout[1];		//SEL
								fot_dout[2]						<=	timing_bram_dout[2];		//TX1
								fot_dout[3]						<=	timing_bram_dout[4];		//HDR
								fot_dout[4]						<=	1'b0;							//FOT
							end
				4'b0100:	begin //FOT_SIG
								pixel_read_timing[17:6]		<= 12'd0;
								pixel_read_timing[5] 		<=	1'b0;
								fot_dout[0]						<= fot_sig_bram_dout[0];//RST
								fot_dout[1]						<= fot_sig_bram_dout[1];//SEL
								fot_dout[2]						<= fot_sig_bram_dout[2];//TX1
								fot_dout[3]						<= fot_sig_bram_dout[3];//HDR
								fot_dout[4]						<= fot_sig_bram_dout[4];//FOT
							end
				4'b1000:	begin //RD_SIG
								pixel_read_timing[17:5] 	<=	timing_bram_dout[17:5];
								fot_dout[0]						<=	1'b0;							//RST
								fot_dout[1]						<=	timing_bram_dout[1];		//SEL
								fot_dout[2]						<=	timing_bram_dout[2];		//TX1
								fot_dout[3]						<=	timing_bram_dout[4];		//HDR
								fot_dout[4]						<=	1'b0;							//FOT
							end
				4'b1010:	begin //RD_SIG_SYNC
								pixel_read_timing[17:6] 	<=	timing_bram_dout[17:6];
								pixel_read_timing[5] 		<=	1'b0;
								fot_dout[0]						<=	1'b0;							//RST
								fot_dout[1]						<=	timing_bram_dout[1];		//SEL
								fot_dout[2]						<=	timing_bram_dout[2];		//TX1
								fot_dout[3]						<=	timing_bram_dout[4];		//HDR
								fot_dout[4]						<=	1'b0;							//FOT
							end
			endcase
		end
	end
	
endmodule
