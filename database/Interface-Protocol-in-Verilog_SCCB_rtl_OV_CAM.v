// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: halftop
// Github: https://github.com/halftop
// Email: yu.zh@live.com
// Description: 
// Dependencies: 
// Since: 2019-07-30 17:23:59
// LastEditors: halftop
// LastEditTime: 2019-07-30 17:23:59
// ********************************************************************
// Module Function:
`timescale 1ns/1ns
module OV_CAM
#(
	parameter CLK_FREQUENCE	= 50_000_000,
	parameter SCL_FREQUENCE = 200_000     //scl总线时钟采用200kHz
)
(
	input					clk			,
	input					rst_n		,
	output					scl			,
	inout					sda			,
	output					cmos_en		,
	output					nRESET		,
	//CMOS Sensor Interface
	input				cmos_pclk,			//24MHz CMOS Pixel clock input
	input				cmos_vsync,			//H : Data Valid; L : Frame Sync(Set it by register)
	input				cmos_href,			//H : Data vaild, L : Line Sync
	input		[7:0]	cmos_din,			//8 bits cmos data input
	
	//CMOS SYNC Data output
	output				cmos_frame_vsync,	//cmos frame data vsync valid signal
	output				cmos_frame_href,	//cmos frame data href vaild  signal
	output		[15:0]	cmos_frame_data,	//cmos frame RGB output: {{R[4:0],G[5:3]}, {G2:0}, B[4:0]}	
	output				cmos_frame_clken,	//cmos frame data output/capture enable clock, 12MHz
	
	//user interface
	output		[7:0]	cmos_fps_rate		//cmos frame output rate
);

wire sccb_start;
wire sccb_done;
wire all_done;
assign cmos_en = ~all_done;

wire [7:0]		devaddr		;
wire [7:0]		regaddr		;
wire [7:0]		wrdata		;

OV_CAM_Ctrl 
#(
	.CLK_FREQUENCE   (CLK_FREQUENCE   ),
	.SCL_CLOCK       (SCL_FREQUENCE   )
)
u_OV_CAM_Ctrl(
	.clk        (clk        ),
	.rst_n      (rst_n      ),
	.sccb_start (sccb_start ),
	.sccb_done  (sccb_done  ),
	.all_done   (all_done   ),
	.devaddr    (devaddr    ),
	.regaddr    (regaddr    ),
	.wrdata     (wrdata     ),
	.nRESET     (nRESET     )
);

OV_CAM_SCCB 
#(
	.SYS_CLOCK (CLK_FREQUENCE ),
	.SCL_CLOCK (SCL_FREQUENCE )
)
u_OV_CAM_SCCB(
	.clk     (clk     		),
	.rst_n   (rst_n   		),
	.iic_en  (sccb_start	),
	.devaddr (devaddr 		),
	.regaddr (regaddr 		),
	.wrdata  (wrdata  		),
	.rddata  (		  		),
	.scl     (scl     		),
	.sda     (sda     		),
	.done    (sccb_done		),
	.sda_en  (  			)
);

OV_CAM_Capture u_OV_CAM_Capture(
	.rst_n            (rst_n            ),
	.cmos_pclk        (cmos_pclk        ),
	.cmos_vsync       (cmos_vsync       ),
	.cmos_href        (cmos_href        ),
	.cmos_din         (cmos_din         ),
	.cmos_frame_vsync (cmos_frame_vsync ),
	.cmos_frame_href  (cmos_frame_href  ),
	.cmos_frame_data  (cmos_frame_data  ),
	.cmos_frame_clken (cmos_frame_clken ),
	.cmos_fps_rate    (cmos_fps_rate    )
);


endmodule