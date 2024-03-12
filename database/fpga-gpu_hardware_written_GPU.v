module GPU(
	input CLOCK_50, 
	input CLOCK2_50,
	input [17:0]SW,
	input [3:0]KEY,
	output [17:0]LEDR,
//	output [8:0]LEDG,
	
	output VGA_CLK,
	output VGA_SYNC_N,
	output VGA_BLANK_N,
	output [7:0]VGA_R,
	output [7:0]VGA_G,
	output [7:0]VGA_B,
	output VGA_HS,
	output VGA_VS,
	
//	output [19:0]SRAM_ADDR,
//	inout [15:0]SRAM_DQ,
//	output SRAM_OE_N,
//	output SRAM_WE_N,
//	output SRAM_CE_N,
//	output SRAM_LB_N,
//	output SRAM_UB_N,

	inout		[15:0]OTG_DATA,
	output	[1:0]OTG_ADDR,
	output	OTG_WR_N,
	output	OTG_RD_N,
	output	OTG_CS_N,
	output	OTG_RST_N,
	output	OTG_FSPEED,		//	USB Full Speed,	0 = Enable, Z = Disable
	output	OTG_LSPEED,		//	USB Low Speed, 	0 = Enable, Z = Disable
	input		[1:0]OTG_INT,
	input		OTG_DREQ0,
	input		OTG_DREQ1,
	output	OTG_DACK0_N,
	output	OTG_DACK1_N,
	
	output [12:0]DRAM_ADDR,
	inout [31:0]DRAM_DQ,
	output [1:0]DRAM_BA,
	output [3:0]DRAM_DQM,
	output DRAM_RAS_N,
	output DRAM_CAS_N,
	output DRAM_CKE,
	output DRAM_CLK,
	output DRAM_WE_N,
	output DRAM_CS_N,
	
	output SD_CLK, 
	inout SD_CMD,
	inout [3:0]SD_DAT
);	

	wire reset = !KEY[0];
	
	wire system_clock;
	wire vga_clock;
	
	//flip polarity of VGA_CLK output to solve timing issue with VGA DAC
	
	//nios and DRAM clk have same freq, DRAM shifted -3ns
	//VGA clk to internal logic and VGA clk to external driver have 180 phase diff
	//so that signals will travel from fpga to VGA chip
	system_clock P0(reset, CLOCK_50, system_clock, DRAM_CLK, vga_clock, VGA_CLK);
	
	//GPU core clock
	wire gpu_clk;
	gpu_clock P1(reset, CLOCK2_50, gpu_clk);
	
	//usb stuff
	assign OTG_DACK0_N = 1'b1;
	assign OTG_DACK1_N = 1'b1;
		
	assign OTG_FSPEED = 1'b0;
	assign OTG_LSPEED = 1'b0;
	
	nios2 u0 (
        .clk_clk                      (system_clock),                      //                     clk.clk
		  .reset_reset  (reset),   	// reset.reset
//        .sram_DQ   (SRAM_DQ),   // sram_external_interface.DQ
//        .sram_ADDR (SRAM_ADDR), //                        .ADDR
//        .sram_LB_N (SRAM_LB_N), //                        .LB_N
//        .sram_UB_N (SRAM_UB_N), //                        .UB_N
//        .sram_CE_N (SRAM_CE_N), //                        .CE_N
//        .sram_OE_N (SRAM_OE_N), //                        .OE_N
//        .sram_WE_N (SRAM_WE_N),  //                        .WE_N

			.sd_card_b_SD_cmd   (SD_CMD),   //   sd_card.b_SD_cmd
        .sd_card_b_SD_dat   (SD_DAT[0]),   //          .b_SD_dat
        .sd_card_b_SD_dat3  (SD_DAT[3]),  //          .b_SD_dat3
        .sd_card_o_SD_clock (SD_CLK), //          .o_SD_clock
		  
		  .isp1362_INT1       (OTG_INT[1]),       //   isp1362.INT1
        .isp1362_DATA       (OTG_DATA),       //          .DATA
        .isp1362_RST_N      (OTG_RST_N),      //          .RST_N
        .isp1362_ADDR       (OTG_ADDR),       //          .ADDR
        .isp1362_CS_N       (OTG_CS_N),       //          .CS_N
        .isp1362_RD_N       (OTG_RD_N),       //          .RD_N
        .isp1362_WR_N       (OTG_WR_N),       //          .WR_N
        .isp1362_INT0       (OTG_INT[0]),      
		  
		  .dram_addr 						(DRAM_ADDR),                   //                   sdram.addr
        .dram_ba   						(DRAM_BA),                     //                        .ba
        .dram_cas_n						(DRAM_CAS_N),                  //                        .cas_n
        .dram_cke  						(DRAM_CKE),                    //                        .cke
        .dram_cs_n 						(DRAM_CS_N),                   //                        .cs_n
        .dram_dq   						(DRAM_DQ),                     //                        .dq
        .dram_dqm  						(DRAM_DQM),                    //                        .dqm
        .dram_ras_n						(DRAM_RAS_N),                  //                        .ras_n
        .dram_we_n 						(DRAM_WE_N),                    //                        .we_n
		  
		  .vga_sync_n   					(VGA_SYNC_N),                   //                     gpu.SYNC_N
        .vga_blank_n  					(VGA_BLANK_N),                  //                        .BLANK_N
        .vga_r        					(VGA_R),                        //                        .R
        .vga_g        					(VGA_G),                        //                        .G
        .vga_b        					(VGA_B),                        //                        .B
        .vga_hs       					(VGA_HS),                       //                        .HS
        .vga_vs       					(VGA_VS),                        //                        .VS
        .vga_clk_clk						(vga_clock),                        //                        .CLK
		  
		  .gpu_clock_clk 					(gpu_clk),
		  
		  .led_r_export					(LEDR),                 //                   led_r.export
        .sw_export						(SW),                     //                      sw.export
		  .key_export   					(~KEY[3:1])    //   key.export
);

	
endmodule

