`timescale 1ps / 1ps

module sdram_arbiter_tb();

reg rMAIN_CLK;
initial rMAIN_CLK<=0;

reg rVID_CLK;
initial rVID_CLK<=0;


always
#10000 rMAIN_CLK<=!rMAIN_CLK;

always
#40000 rVID_CLK<=!rVID_CLK;

	FBST #(
		.pHRES   (640),
		.pVRES   (4),
		.pHTOTAL (762),
		.pVTOTAL (8),
		.pHSS    (656),
		.pHSE    (752),
		.pVSS    (6),
		.pVSE    (7)
	) fbst_0 (
		.oBLU          (fb_vport_blu), //   vport.blu
		.oDE           (fb_vport_de),  //        .de
		.oGRN          (fb_vport_grn), //        .grn
		.oHS           (fb_vport_hs),  //        .hs
		.oVS           (fb_vport_vs),  //        .vs
		.oRED          (fb_vport_red), //        .red
		.iCLK          (rVID_CLK),      // vid_clk.clk
		.iFB_START     (fb_st_start),  //  stream.start
		.iFB_DATA      (fb_st_data),   //        .data
		.iFB_DATAVALID (fb_st_dv),     //        .dv
		.oFB_READY     (fb_st_ready)   //        .ready
	);
wire sdram_arbiter_0_sdram_write, sdram_arbiter_0_sdram_read;
        reg [15:0] rDELAY;
        reg [3:0] rWAITDELAY;
        reg rDWRITE,rDREAD;
        reg rAVL_WRITE;
        wire wAVL_WAITREQUEST;
initial begin
  rDELAY<=0;
  rWAITDELAY<=0;
  rDWRITE<=0;
  rDREAD<=0;
  rAVL_WRITE<=0;
end
wire sdram_arbiter_0_sdram_wait = !rWAITDELAY[3]|!rDREAD&sdram_arbiter_0_sdram_read|!rDWRITE&sdram_arbiter_0_sdram_write;


reg [15:0] rSDRAM_DATA;
initial rSDRAM_DATA<=0;

always @(posedge rMAIN_CLK)
begin
  rDELAY<= {rDELAY,sdram_arbiter_0_sdram_read&!sdram_arbiter_0_sdram_wait};
  rDWRITE<=sdram_arbiter_0_sdram_write;
  rDREAD<=sdram_arbiter_0_sdram_read;
  if (!rDWRITE&sdram_arbiter_0_sdram_write | !rDREAD&sdram_arbiter_0_sdram_read)
    rWAITDELAY<=0;
  else if (!rWAITDELAY[3])
    rWAITDELAY<=rWAITDELAY+1;

  if (!wAVL_WAITREQUEST)
    rAVL_WRITE<=!rAVL_WRITE;

  if (rDELAY[15])
    rSDRAM_DATA<=rSDRAM_DATA+1;
end

reg rDVS;
initial rDVS <=0;
reg [15:0] rMIPI_DATA;
initial rMIPI_DATA <=0;
always @(posedge rVID_CLK)
begin
  rDVS <= fb_vport_vs;
  if (fb_vport_de) rMIPI_DATA <= rMIPI_DATA+1;
end
   SDRAM_ARBITER #(
       .pBURST_SIZE(64),
       .pFB_OFFSET(640*4),
       .pFB_SIZE(640*4)
   
        )sdram_arbiter_0 (
		.oSDRAM_ADDRESS        (),       // sdram.address
		.oSDRAM_WRITE          (sdram_arbiter_0_sdram_write),         //      .write
		.oSDRAM_READ           (sdram_arbiter_0_sdram_read),          //      .read
		.oSDRAM_WRITEDATA      (),     //      .writedata
		.iSDRAM_READ_DATA      (rSDRAM_DATA),      //      .readdata
		.iSDRAM_WAITREQUEST    (sdram_arbiter_0_sdram_wait),   //      .waitrequest
		.iSDRAM_READ_DATAVALID (rDELAY[15]), //      .readdatavalid
		.iMEM_CLK              (rMAIN_CLK),                             // clock.clk
		.iRESET                (1'b0),      // reset.reset
		.iFB_CLK               (rVID_CLK),                          //    fb.clk
		.iFB_READY             (fb_st_ready),                          //      .rdy
		.oFB_DATA              (fb_st_data),                         //      .data
		.oFB_DATAVALID         (fb_st_dv),                           //      .dv
		.oFB_START             (fb_st_start),                        //      .start
		.iMIPI_CLK             (rVID_CLK),                        //  mipi.clk
		.iMIPI_DATA            (rMIPI_DATA),                       //      .data
		.iMIPI_DATAVALID       (fb_vport_de),                         //      .dv
		.iMIPI_START           (fb_vport_vs&!rDVS),                       //      .start
                .iAVL_WRITE            (0&rAVL_WRITE),
                .iAVL_READ             (0&!rAVL_WRITE),
                .oAVL_WAITREQUEST      (wAVL_WAITREQUEST),
                .iAVL_BURSTCOUNT       (1)
	);

endmodule
