// This program was cloned from: https://github.com/ISKU/Autonomous-Drone-Design
// License: GNU General Public License v3.0

/************************************************************************
  Project   : SoC Robot WAR Support
  Title     : FPGA HDL Source for Image Processing(SRAM Interface)
  File name : FPGA_Processing.v

  Author(s) : Advanced Digital Chips Inc. 

  History
        + v0.0   2002/ 9/18 : First version released
        + v0.1   2003/ 7/08 : Update
		  + v0.2   2004/ 6/12 : Update(Conversion for FPGA Chip(XC2S100))
	     + v0.3   2006/ 6/30 : Update(Conversion for FPGA Chip(XC3S400))
	Modify by KAIST SDIA
	     + v0.5	 2008/7/23: Update(Conversion for FPGA Chip (Cyclone3 - EP3C16U256C7N)
	Modify
	     + v0.6  2011/9/07: Update(Conversion for FPGA Chip (Cyclone4 - EP4CE75U19I7))
		                      - change to use Internal FPGA RAM
		                     Video Decoder Input YCbCr422 to RGB565
									Add Interrupt Request 1 channel
	Modify
	     + v0.7  2014/6/19: Update(Conversion for AMAZON2 Chip)					
*************************************************************************/

module FPGA_Processing (
	resetx,
	clk_llc2, clk_llc, vref, href, odd, vpo, // mem_ctrl <- SAA7111A
	AMAmem_adr, AMAmem_data, AMAmem_csx, // Amazon2 Interface
	AMAmem_wrx, AMAmem_rdx, AMAmem_waitx, AMAmem_irq0, AMAmem_irq1, // Amazon2 Interface
	led_test // FPGA test(LED On/Off)
);

	input resetx;
	
	/* mem_ctrl <- SAA7111A */
	input clk_llc2; // 13.5 MHz
	input clk_llc; // 27 MHz
	input vref; // vertical sync.
	input href; // horizontal sync.
	input odd; // odd field (RTS0) 
	input [15:0] vpo; // RGB(565) input vidoe data
	
	/* Amazon2 SRAM Interface */
	input [14:0] AMAmem_adr; // Amazon2 Address[15:1] 
	inout [15:0] AMAmem_data; // Amazon2 Data[15:0] 
	input AMAmem_csx; // FPGA Chip Select, Amazon2 nCS3
	input AMAmem_wrx; // write strobe, Amazon2 nWR
	input AMAmem_rdx; // read strobe, Amazon2 nRD
	output AMAmem_waitx; // Amazon2 read wait, Amazon2 nWAIT 
	output AMAmem_irq0; // external read interrupt(FPGA -> Amazon2), Amazon2 IRQ6
	output AMAmem_irq1; // external read interrupt(FPGA -> Amazon2), Amazon2 IRQ7
	
	/* FPGA test */
	output led_test;
	
	
//-----------------------------------------------------------------
// SRAM WRITE & Interrupt	
// SAA7111A Video Decoder => SRAM, V/H sync. input 
// 720x480 -> 180x120 compression
//-----------------------------------------------------------------
	
	reg [1:0] clk_div;     
	
	always @(negedge resetx or posedge clk_llc2)
		if (~resetx) 			clk_div <= 2'b0;
		else 						clk_div <= clk_div + 1'b1;
	
	// clk_llc8 : 180(720/4) clock generation
	wire clk_llc8  = clk_div[1];
	
	// href2 : (480/2) clock generation
	reg  href2;
	always @(negedge resetx or posedge href)
		if (~resetx) 			href2 <= 1'b0;
		else 						href2 <= ~href2;
	
	// select only odd frame
	wire oddframe = odd & vref;
	
	// 120(480/4) clock generation
	wire href2_wr = href2 & href & oddframe; // & oddframe2; 
	
/////////////////////////////////////////////////////////////////////////////

	// YCbCr422 to RGB565
	reg [1:0] CodeCnt;
	reg [7:0] Y_Data1, Cb_Data1, Cr_Data1, Y_Data2, Cb_Data2, Cr_Data2;
	reg [20:0] R_int, G_int, B_int, X_int, A_int, B1_int, B2_int, C_int; 
	reg [9:0] const1, const2, const3, const4, const5;
	
	always @(posedge clk_llc or negedge resetx)
		if      (~resetx)				CodeCnt <= 2'b0;
		else if (href2_wr)			CodeCnt <= CodeCnt + 1'b1;
		else if (~href2_wr)			CodeCnt <= 2'b0;
		
	always @(posedge clk_llc or negedge resetx)
		if      (~resetx)				Cb_Data1 <= 8'b0;
		else if (CodeCnt == 2'b00)	Cb_Data1 <= vpo[15:8];
		
	always @(posedge clk_llc or negedge resetx)
		if      (~resetx)				Y_Data1 <= 8'b0;
		else if (CodeCnt == 2'b01)	Y_Data1 <= vpo[15:8];
		
	always @(posedge clk_llc or negedge resetx)
		if      (~resetx)				Cr_Data1 <= 8'b0;
		else if (CodeCnt == 2'b10)	Cr_Data1 <= vpo[15:8];
		
	always @(posedge clk_llc or negedge resetx)
		if      (~resetx)				Y_Data2 <= 8'b0;
		else if (CodeCnt == 2'b11)	Y_Data2 <= vpo[15:8];
		
	always @(posedge clk_llc or negedge resetx)
		if      (~resetx)				Cb_Data2 <= 8'b0;
		else if (CodeCnt == 2'b00)	Cb_Data2 <= vpo[15:8];
	
	always @ (posedge clk_llc or negedge resetx)
		if      (~resetx)				Cr_Data2 <= 8'b0;
		else if (CodeCnt == 2'b10)	Cr_Data2 <= vpo[15:8];
	
	//registering constants
	always @(posedge clk_llc) begin
		const1 = 10'b0100101010; //1.164 = 01.00101010
		const2 = 10'b0110011000; //1.596 = 01.10011000
		const3 = 10'b0011010000; //0.813 = 00.11010000
		const4 = 10'b0001100100; //0.392 = 00.01100100
		const5 = 10'b1000000100; //2.017 = 10.00000100
	end
	
	wire [9:0] YData1 = {Y_Data1, 2'b00};
	wire [9:0] CbData1 = {Cb_Data1, 2'b00};
	wire [9:0] CrData1 = {Cr_Data1, 2'b00};
	wire [9:0] YData2 = {Y_Data2, 2'b00};
	wire [9:0] CbData2 = {Cb_Data2, 2'b00};
	wire [9:0] CrData2 = {Cr_Data2, 2'b00};
	
	always @(posedge clk_llc or negedge resetx)
		if (~resetx) begin
			 A_int <= 0; 
			 B1_int <= 0; 
			 B2_int <= 0; 
			 C_int <= 0; 
			 X_int <= 0;
		end
		else if (CodeCnt == 2'b10) begin
			X_int <= (const1 * (YData1 - 'd64)) ;
			A_int <= (const2 * (CrData1 - 'd512));
			B1_int <= (const3 * (CrData1 - 'd512));
			B2_int <= (const4 * (CbData1 - 'd512));
			C_int <= (const5 * (CbData1 - 'd512));
		end
		else if (CodeCnt == 2'b11) begin
			X_int <= (const1 * (YData2 - 'd64)) ;
			A_int <= (const2 * (CrData2 - 'd512));
			B1_int <= (const3 * (CrData2 - 'd512));
			B2_int <= (const4 * (CbData2 - 'd512));
			C_int <= (const5 * (CbData2 - 'd512));
		end
		  
	always @(posedge clk_llc or negedge resetx)
		if (~resetx) begin
			R_int <= 0; 
			G_int <= 0; 
			B_int <= 0;
		end
		else if ((CodeCnt == 2'b10) | (CodeCnt == 2'b11))
		begin
			R_int <= X_int + A_int;  
			G_int <= X_int - B1_int - B2_int; 
			B_int <= X_int + C_int; 
		end
		
	wire [4:0] R = (R_int[20]) ? 5'b0 : (R_int[19:18] == 2'b0) ? R_int[17:13] : 5'b11111;
	wire [5:0] G = (G_int[20]) ? 6'b0 : (G_int[19:18] == 2'b0) ? G_int[17:12] : 6'b111111;
	wire [4:0] B = (B_int[20]) ? 5'b0 : (B_int[19:18] == 2'b0) ? B_int[17:13] : 5'b11111;
	
	wire [5:0] Grey = (R + G[5:1] + B) / 3;
	wire [15:0] DecVData = {Grey[4:0], Grey[4:0], 1'b0, Grey[4:0]};
	
/////////////////////////////////////////////////////////////////////////////
	
	// 180x120 write clock generation 
	wire vpo_wrx = ~(vref & href2_wr & clk_llc8);
	reg vpo_wrxd1;
	reg vpo_wrxd2;
	reg vpo_wrxd3;
	
	always @(negedge resetx or posedge clk_llc)
		if 	(~resetx) 			vpo_wrxd1 <= 1'b1;
		else 							vpo_wrxd1 <= vpo_wrx;
	
	always @(negedge resetx or posedge clk_llc)
		if 	(~resetx) 			vpo_wrxd2 <= 1'b1;
		else 							vpo_wrxd2 <= vpo_wrxd1;
	
	always @(negedge resetx or posedge clk_llc)
		if 	(~resetx) 			vpo_wrxd3 <= 1'b1;
		else 							vpo_wrxd3 <= vpo_wrxd2;
	
	// delayed write clock for no grich
	wire vd_wrx = ~(~vpo_wrxd1 & vpo_wrxd3);
	
//------------------------------------------------------
// 16bit SRAM address generation (64KB)
// 180 x 120
//   __________ 
//  |          |  0x0000  
//  | 180x120  |  
//  |          |  
//  |          |  
//  |----------|  0x5460(word)
//  | reserved |  
//  |----------|  0x8000(word)
//  |          |  
//  | 180x120  |  
//  |          |  
//  |          |  
//  |----------|  0xD460(word)  
//  | reserved |  
//  |__________|  0xFFFF
//
//------------------------------------------------------
	
	reg [15:0] vdata;
	reg [15:0] vadr;
	reg A_addr;
	
	always @(negedge resetx or posedge clk_llc8)
		if      (~resetx)           vdata <= 16'b0;
		else if (href2_wr)          vdata <= DecVData;
	
	always @(negedge resetx or posedge clk_llc8)
		if      (~resetx)           vadr[14:0] <= 15'b0;
		else if (~oddframe)         vadr[14:0] <= 15'b0;
		else if (href2_wr)          vadr[14:0] <= vadr[14:0] + 1'b1;
	
	always @(negedge resetx or posedge odd)
		if      (~resetx)       vadr[15] <= 1'b0;
		else                    vadr[15] <= ~vadr[15];
		
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)       A_addr <= 1'b0;
		else                    A_addr <= AMAmem_irq1;
	
//----------------------------------------------------------------------------------
// External Interrupt Generation
// 1 interrupter per 1 frame(interrupt length = Sys_clk 2cycle)
//----------------------------------------------------------------------------------

	reg oddframe_d1;
	reg oddframe_d2;
	reg oddframe_d3;
	
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)             oddframe_d1 <= 1'b0;
		else                          oddframe_d1 <= oddframe;
	
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)             oddframe_d2 <= 1'b0;
		else                          oddframe_d2 <= oddframe_d1;
	
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)             oddframe_d3 <= 1'b0;
		else                          oddframe_d3 <= oddframe_d2;
	
	assign AMAmem_irq0 = ~oddframe_d1 & oddframe_d3 & (vadr[15] == 1);
	assign AMAmem_irq1 = ~oddframe_d1 & oddframe_d3 & (vadr[15] == 0);
	
	wire [15:0] vmem_addr;
	wire [15:0] vmem_data;
	wire vmem_rden;
	wire vmem_wren;
	wire [15:0] vmem_q;
	
//////////////////////////// MEGA Wizard //////////////////////////////////

	// FPGA PLL
	wire Sys_clk;
	
	// clk_llc PLL
	pll pll_inst(
		.inclk0 (clk_llc),
		.c0 (Sys_clk)
	);
	
	// Original Image Block RAM Instance
	RAM RAM_inst(
		.address (vmem_addr),
		.clock (Sys_clk),
		.data (vmem_data),
		.rden (vmem_rden),
		.wren (vmem_wren),
		.q (vmem_q)
	);
////////////////////////////////////////////////////////////////////////////
	
//-----------------------------------------------------------------
// SRAM Controller State Machine
// SRAM (2cycle command & wait enable)
//-----------------------------------------------------------------
	
	supply1 vdd;
	reg [6:0] cs, ns;
	
	parameter s0 = 7'b0000001;
	parameter s1 = 7'b0000010;
	parameter s2 = 7'b0000100;
	parameter s3 = 7'b0001000;
	parameter s4 = 7'b0010000;
	parameter s5 = 7'b0100000;
	parameter s6 = 7'b1000000;
	
	wire mcs0 = cs[0]; // idle state
	wire mcs1 = cs[1]; // sa7111 video data write state 
	wire mcs2 = cs[2]; // sa7111 video data write last state 
	wire mcs3 = cs[3]; // Eagle data write state(for test)
	wire mcs4 = cs[4]; // Eagle data write last state
	wire mcs5 = cs[5]; // Eagle data read state 
	wire mcs6 = cs[6]; // Eagle data read last state
	
	always @(negedge resetx or posedge Sys_clk)
		if (~resetx) cs <= s0;
		else         cs <= ns;
	  
	always @(mcs0 or mcs1 or mcs2 or mcs3 or mcs4 or mcs5 or mcs6 or AMAmem_csx or vd_wrx or AMAmem_wrx or AMAmem_rdx) begin
		ns = s0;
		
		case (vdd) // synopsys parallel_case full_case
			mcs0:
				if (~vd_wrx) ns = s1;
				else if (vd_wrx & ~AMAmem_csx & ~AMAmem_wrx) ns = s3;
				else if (vd_wrx & ~AMAmem_csx & ~AMAmem_rdx) ns = s5;
				else ns = s0;
				
			mcs1:
				if (vd_wrx) ns = s2;
				else ns = s1;
				
			mcs2:
				ns = s0;
				
			mcs3:
				if (AMAmem_wrx) ns = s4;
				else ns = s3;
				
			mcs4:
				ns = s0;
				
			mcs5: 
				if (AMAmem_rdx) ns = s6;
				else ns = s5;
				
			mcs6: 
				ns = s0;
				
			default:
				ns = s0;
	  endcase
	end  
	
	
//-----------------------------------------------------------------
// SRAM Controller Output
//-----------------------------------------------------------------
	
	//assign mem_csx = mcs0; // SRAM Chip select
	assign vmem_wren = mcs1; // SRAM Write // ~(mcs1);
	assign vmem_rden = mcs5; // SRAM Read // ~mcs5;
	
	//assign mem_bex[1] = ~(mcs1 | mcs3 | mcs5);	// 16bit MSB Byte enable
	//assign mem_bex[0] = ~(mcs1 | mcs3 | mcs5);	// 16bit LSB Byte enable
	
	assign AMAmem_data = 
		(AMAmem_adr == 15'h545e) ? {16{isMatching}} :
		(AMAmem_adr == 15'h545f) ? goal :
		(outPixel == 0) ? 16'b0000011111100000 :
		(isCorner == 1'b1) ? 16'b1111100000000000 :
		(~AMAmem_csx) ? vmem_q : 16'bZ;
	assign vmem_data =
		//(AMAmem_adr == 15'h545e) ? isMatching :
		//(AMAmem_adr == 15'h545f) ? goal :
		(mcs1|mcs2) ? vdata : 16'bZ;
	assign vmem_addr = 
		//(AMAmem_adr == 15'h545e) ? {vadr[15], 15'h545e} :
		//(AMAmem_adr == 15'h545f) ? {vadr[15], 15'h545f} :
		(sramRead) ? {vadr[15], sramAddr} :
		(mcs1|mcs2) ? vadr : 
		{A_addr, AMAmem_adr}; // 16bit SRAM address
		

	wire [14:0] bufferAddr;
	wire [7:0] bufferData;
	wire bufferWren;
	
	assign bufferAddr =
		(mcs1 | mcs2) ? vadr : FBAddr;
	assign bufferData =
		(mcs1 | mcs2 ) ? vdata : 16'bx;
	assign bufferWren = mcs1;

//-----------------------------------------------------------------
// FPGA waitx signal generation
// if Eagle is interfaced to low speed device, waitx has to delayed  
//-----------------------------------------------------------------
	
	wire waitx = AMAmem_csx | ~(mcs1 | mcs2);
	
	reg  waitx_d1;
	reg  waitx_d2;
	reg  waitx_d3;
	reg  waitx_d4;
	reg  waitx_d5;
	reg  waitx_d6;
	reg  waitx_d7;
	reg  waitx_d8;
	reg  waitx_d9;
	reg  waitx_d10;
	
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)     		waitx_d1 <= 1'b0;
		else                    	waitx_d1 <= waitx;
	
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)         	waitx_d2 <= 1'b0;
		else                     	waitx_d2 <= waitx_d1;
	
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)         	waitx_d3 <= 1'b0;
		else                     	waitx_d3 <= waitx_d2;
	
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)         	waitx_d4 <= 1'b0;
		else                     	waitx_d4 <= waitx_d3;
	
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)         	waitx_d5 <= 1'b0;
		else                     	waitx_d5 <= waitx_d4;
	
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)         	waitx_d6 <= 1'b0;
		else                     	waitx_d6 <= waitx_d5;
		
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)         	waitx_d7 <= 1'b0;
		else                     	waitx_d7 <= waitx_d6;
		
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)         	waitx_d8 <= 1'b0;
		else                     	waitx_d8 <= waitx_d7;
		
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)         	waitx_d9 <= 1'b0;
		else                     	waitx_d9 <= waitx_d8; 
	
	always @(negedge resetx or posedge Sys_clk)
		if      (~resetx)         	waitx_d10 <= 1'b0;
		else                     	waitx_d10 <= waitx_d9;   
	
	assign AMAmem_waitx = 
		waitx & waitx_d1 & waitx_d2 & waitx_d3 & waitx_d4 & waitx_d5 & waitx_d6 & waitx_d7 & waitx_d8 & waitx_d9 & waitx_d10;
	
//-----------------------------------------------------------------
// FPGA Test
// led has to on/off after FPGA download
//-----------------------------------------------------------------
	reg [5:0] led_blink;
	wire vadrclk = vadr[14];
	
	always @(negedge resetx or posedge vadrclk)
		if      (~resetx)           led_blink <= 6'b0;
		else                        led_blink <= led_blink + 1'b1;
	
	assign led_test = led_blink[5];
///////////////////////////////////////////////////////////////////
	
	wire isCorner;
	wire [7:0] refPixel;
	wire [14:0] sramAddr;
	wire sramRead;
	wire [127:0] adjPixel;
	wire [31:0] compare;
	wire [7:0] thres;
	
	FD_Top detection(
		.clock(Sys_clk),
		.nReset(resetx),
		.refAddr(vadr[14:0]),
		.sramData({3'b0, vmem_q[4:0]}),
		.sramAddr(sramAddr),
		.sramRead(sramRead),
		.isCorner(isCorner),
		.refPixel(refPixel),
		.adjPixel(adjPixel),
		.compare(compare),
		.thres(thres)
	);
	
	
	wire [14:0] scoreAddr;
	wire [7:0] scoreValue;
	wire [7:0] scoreData;
	wire scoreWren;
	
	FS_Top score(
		.isCorner(isCorner),
		.compare(compare),
		.refAddr(vadr[14:0]),
		.refPixel(refPixel),
		.adjPixel(adjPixel),
		.thres(thres),
		.scoreValue(scoreValue),
		.wren(scoreWren)
	);
	
	ScoreMem score_memory(
		.clock(Sys_clk),
		.address(scoreAddr),
		.data(scoreValue),
		.wren(scoreWren),
		.q(scoreData)
	);
	
	
	wire [14:0] outAddr;
	wire [7:0] outPixel;
	
	NMS_Top nms(
		.clock(Sys_clk),
		.nReset(resetx),
		.refAddr(vadr[14:0]),
		.scoreData(scoreData),
		.scoreAddr(scoreAddr),
		.outAddr(outAddr),
		.outPixel(outPixel)
	);
	
	
	wire [239:0] position;
	wire isMatching;
	wire [14:0] FBAddr;
	wire [7:0] FBData;
	
	Mat_Top matching(
		.clock(Sys_clk),
		.nReset(resetx),
		.refAddr(vadr[14:0]),
		.isFeature(outPixel),
		.position(position),
		.isMatching(isMatching)
	);
	
	Buffer buffer(
		.clock(Sys_clk),
		.address(BufferAddr),
		.data(bufferData),
		.wren(bufferWren),
		.q(FBData)
	);
	
	wire [15:0] goal;
	assign goal =
		(position[14:0] + position[29:15] + position[44:30] + position[59:45] + position[74:60] + position[89:75]
		+ position[104:90] + position[119:105] + position[134:120] + position[149:135] + position[164:150] +
		position[179:165] + position[194:180] + position[209:195] + position[224:210] + position[239:225]) / 16;
endmodule 