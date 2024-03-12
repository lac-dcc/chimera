// --------------------------------------------------------------------
// Copyright (c) 2005 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	DE2 CMOS Camera Demo - Picture in Picture
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Johnny Chen       :| 06/02/23  :|      Initial Revision
//   V1.1 :| Johnny Chen       :| 06/03/22  :|      Change Pin Assignment For New Sensor
//   V1.2 :| Johnny Chen       :| 06/03/22  :|      Fixed to Compatible with Quartus II 6.0
// --------------------------------------------------------------------

module DE2_CCD_PIP
	(
		////////////////////	Clock Input	 	////////////////////	 
		CLOCK_27,						//	27 MHz
		CLOCK_50,						//	50 MHz
		EXT_CLOCK,						//	External Clock
		////////////////////	Push Button		////////////////////
		KEY,							//	Pushbutton[3:0]
		////////////////////	DPDT Switch		////////////////////
		SW,								//	Toggle Switch[17:0]
		////////////////////	7-SEG Dispaly	////////////////////
		HEX0,							//	Seven Segment Digit 0
		HEX1,							//	Seven Segment Digit 1
		HEX2,							//	Seven Segment Digit 2
		HEX3,							//	Seven Segment Digit 3
		HEX4,							//	Seven Segment Digit 4
		HEX5,							//	Seven Segment Digit 5
		HEX6,							//	Seven Segment Digit 6
		HEX7,							//	Seven Segment Digit 7
		////////////////////////	LED		////////////////////////
		LEDG,							//	LED Green[8:0]
		LEDR,							//	LED Red[17:0]
		////////////////////////	UART	////////////////////////
		UART_TXD,						//	UART Transmitter
		UART_RXD,						//	UART Receiver
		////////////////////////	IRDA	////////////////////////
		IRDA_TXD,						//	IRDA Transmitter
		IRDA_RXD,						//	IRDA Receiver
		/////////////////////	SDRAM Interface		////////////////
		DRAM_DQ,						//	SDRAM Data bus 16 Bits
		DRAM_ADDR,						//	SDRAM Address bus 12 Bits
		DRAM_LDQM,						//	SDRAM Low-byte Data Mask 
		DRAM_UDQM,						//	SDRAM High-byte Data Mask
		DRAM_WE_N,						//	SDRAM Write Enable
		DRAM_CAS_N,						//	SDRAM Column Address Strobe
		DRAM_RAS_N,						//	SDRAM Row Address Strobe
		DRAM_CS_N,						//	SDRAM Chip Select
		DRAM_BA_0,						//	SDRAM Bank Address 0
		DRAM_BA_1,						//	SDRAM Bank Address 0
		DRAM_CLK,						//	SDRAM Clock
		DRAM_CKE,						//	SDRAM Clock Enable
		////////////////////	Flash Interface		////////////////
		FL_DQ,							//	FLASH Data bus 8 Bits
		FL_ADDR,						//	FLASH Address bus 22 Bits
		FL_WE_N,						//	FLASH Write Enable
		FL_RST_N,						//	FLASH Reset
		FL_OE_N,						//	FLASH Output Enable
		FL_CE_N,						//	FLASH Chip Enable
		////////////////////	SRAM Interface		////////////////
		SRAM_DQ,						//	SRAM Data bus 16 Bits
		SRAM_ADDR,						//	SRAM Address bus 18 Bits
		SRAM_UB_N,						//	SRAM High-byte Data Mask 
		SRAM_LB_N,						//	SRAM Low-byte Data Mask 
		SRAM_WE_N,						//	SRAM Write Enable
		SRAM_CE_N,						//	SRAM Chip Enable
		SRAM_OE_N,						//	SRAM Output Enable
		////////////////////	ISP1362 Interface	////////////////
		OTG_DATA,						//	ISP1362 Data bus 16 Bits
		OTG_ADDR,						//	ISP1362 Address 2 Bits
		OTG_CS_N,						//	ISP1362 Chip Select
		OTG_RD_N,						//	ISP1362 Write
		OTG_WR_N,						//	ISP1362 Read
		OTG_RST_N,						//	ISP1362 Reset
		OTG_FSPEED,						//	USB Full Speed,	0 = Enable, Z = Disable
		OTG_LSPEED,						//	USB Low Speed, 	0 = Enable, Z = Disable
		OTG_INT0,						//	ISP1362 Interrupt 0
		OTG_INT1,						//	ISP1362 Interrupt 1
		OTG_DREQ0,						//	ISP1362 DMA Request 0
		OTG_DREQ1,						//	ISP1362 DMA Request 1
		OTG_DACK0_N,					//	ISP1362 DMA Acknowledge 0
		OTG_DACK1_N,					//	ISP1362 DMA Acknowledge 1
		////////////////////	LCD Module 16X2		////////////////
		LCD_ON,							//	LCD Power ON/OFF
		LCD_BLON,						//	LCD Back Light ON/OFF
		LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
		LCD_EN,							//	LCD Enable
		LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		LCD_DATA,						//	LCD Data bus 8 bits
		////////////////////	SD_Card Interface	////////////////
		SD_DAT,							//	SD Card Data
		SD_DAT3,						//	SD Card Data 3
		SD_CMD,							//	SD Card Command Signal
		SD_CLK,							//	SD Card Clock
		////////////////////	USB JTAG link	////////////////////
		TDI,  							// CPLD -> FPGA (data in)
		TCK,  							// CPLD -> FPGA (clk)
		TCS,  							// CPLD -> FPGA (CS)
	    TDO,  							// FPGA -> CPLD (data out)
		////////////////////	I2C		////////////////////////////
		I2C_SDAT,						//	I2C Data
		I2C_SCLK,						//	I2C Clock
		////////////////////	PS2		////////////////////////////
		PS2_DAT,						//	PS2 Data
		PS2_CLK,						//	PS2 Clock
		////////////////////	VGA		////////////////////////////
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK,						//	VGA BLANK
		VGA_SYNC,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,  						//	VGA Blue[9:0]
		////////////	Ethernet Interface	////////////////////////
		ENET_DATA,						//	DM9000A DATA bus 16Bits
		ENET_CMD,						//	DM9000A Command/Data Select, 0 = Command, 1 = Data
		ENET_CS_N,						//	DM9000A Chip Select
		ENET_WR_N,						//	DM9000A Write
		ENET_RD_N,						//	DM9000A Read
		ENET_RST_N,						//	DM9000A Reset
		ENET_INT,						//	DM9000A Interrupt
		ENET_CLK,						//	DM9000A Clock 25 MHz
		////////////////	Audio CODEC		////////////////////////
		AUD_ADCLRCK,					//	Audio CODEC ADC LR Clock
		AUD_ADCDAT,						//	Audio CODEC ADC Data
		AUD_DACLRCK,					//	Audio CODEC DAC LR Clock
		AUD_DACDAT,						//	Audio CODEC DAC Data
		AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
		AUD_XCK,						//	Audio CODEC Chip Clock
		////////////////	TV Decoder		////////////////////////
		TD_DATA,    					//	TV Decoder Data bus 8 bits
		TD_HS,							//	TV Decoder H_SYNC
		TD_VS,							//	TV Decoder V_SYNC
		TD_RESET,						//	TV Decoder Reset
		////////////////////	GPIO	////////////////////////////
		GPIO_0,							//	GPIO Connection 0
		GPIO_1							//	GPIO Connection 1
	);

////////////////////////	Clock Input	 	////////////////////////
input			CLOCK_27;				//	27 MHz
input			CLOCK_50;				//	50 MHz
input			EXT_CLOCK;				//	External Clock
////////////////////////	Push Button		////////////////////////
input	[3:0]	KEY;					//	Pushbutton[3:0]
////////////////////////	DPDT Switch		////////////////////////
input	[17:0]	SW;						//	Toggle Switch[17:0]
////////////////////////	7-SEG Dispaly	////////////////////////
output	[6:0]	HEX0;					//	Seven Segment Digit 0
output	[6:0]	HEX1;					//	Seven Segment Digit 1
output	[6:0]	HEX2;					//	Seven Segment Digit 2
output	[6:0]	HEX3;					//	Seven Segment Digit 3
output	[6:0]	HEX4;					//	Seven Segment Digit 4
output	[6:0]	HEX5;					//	Seven Segment Digit 5
output	[6:0]	HEX6;					//	Seven Segment Digit 6
output	[6:0]	HEX7;					//	Seven Segment Digit 7
////////////////////////////	LED		////////////////////////////
output	[8:0]	LEDG;					//	LED Green[8:0]
output	[17:0]	LEDR;					//	LED Red[17:0]
////////////////////////////	UART	////////////////////////////
output			UART_TXD;				//	UART Transmitter
input			UART_RXD;				//	UART Receiver
////////////////////////////	IRDA	////////////////////////////
output			IRDA_TXD;				//	IRDA Transmitter
input			IRDA_RXD;				//	IRDA Receiver
///////////////////////		SDRAM Interface	////////////////////////
inout	[15:0]	DRAM_DQ;				//	SDRAM Data bus 16 Bits
output	[11:0]	DRAM_ADDR;				//	SDRAM Address bus 12 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask 
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 0
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable
////////////////////////	Flash Interface	////////////////////////
inout	[7:0]	FL_DQ;					//	FLASH Data bus 8 Bits
output	[21:0]	FL_ADDR;				//	FLASH Address bus 22 Bits
output			FL_WE_N;				//	FLASH Write Enable
output			FL_RST_N;				//	FLASH Reset
output			FL_OE_N;				//	FLASH Output Enable
output			FL_CE_N;				//	FLASH Chip Enable
////////////////////////	SRAM Interface	////////////////////////
inout	[15:0]	SRAM_DQ;				//	SRAM Data bus 16 Bits
output	[17:0]	SRAM_ADDR;				//	SRAM Address bus 18 Bits
output			SRAM_UB_N;				//	SRAM High-byte Data Mask 
output			SRAM_LB_N;				//	SRAM Low-byte Data Mask 
output			SRAM_WE_N;				//	SRAM Write Enable
output			SRAM_CE_N;				//	SRAM Chip Enable
output			SRAM_OE_N;				//	SRAM Output Enable
////////////////////	ISP1362 Interface	////////////////////////
inout	[15:0]	OTG_DATA;				//	ISP1362 Data bus 16 Bits
output	[1:0]	OTG_ADDR;				//	ISP1362 Address 2 Bits
output			OTG_CS_N;				//	ISP1362 Chip Select
output			OTG_RD_N;				//	ISP1362 Write
output			OTG_WR_N;				//	ISP1362 Read
output			OTG_RST_N;				//	ISP1362 Reset
output			OTG_FSPEED;				//	USB Full Speed,	0 = Enable, Z = Disable
output			OTG_LSPEED;				//	USB Low Speed, 	0 = Enable, Z = Disable
input			OTG_INT0;				//	ISP1362 Interrupt 0
input			OTG_INT1;				//	ISP1362 Interrupt 1
input			OTG_DREQ0;				//	ISP1362 DMA Request 0
input			OTG_DREQ1;				//	ISP1362 DMA Request 1
output			OTG_DACK0_N;			//	ISP1362 DMA Acknowledge 0
output			OTG_DACK1_N;			//	ISP1362 DMA Acknowledge 1
////////////////////	LCD Module 16X2	////////////////////////////
inout	[7:0]	LCD_DATA;				//	LCD Data bus 8 bits
output			LCD_ON;					//	LCD Power ON/OFF
output			LCD_BLON;				//	LCD Back Light ON/OFF
output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
output			LCD_EN;					//	LCD Enable
output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////	SD Card Interface	////////////////////////
inout			SD_DAT;					//	SD Card Data
inout			SD_DAT3;				//	SD Card Data 3
inout			SD_CMD;					//	SD Card Command Signal
output			SD_CLK;					//	SD Card Clock
////////////////////////	I2C		////////////////////////////////
inout			I2C_SDAT;				//	I2C Data
output			I2C_SCLK;				//	I2C Clock
////////////////////////	PS2		////////////////////////////////
input		 	PS2_DAT;				//	PS2 Data
input			PS2_CLK;				//	PS2 Clock
////////////////////	USB JTAG link	////////////////////////////
input  			TDI;					// CPLD -> FPGA (data in)
input  			TCK;					// CPLD -> FPGA (clk)
input  			TCS;					// CPLD -> FPGA (CS)
output 			TDO;					// FPGA -> CPLD (data out)
////////////////////////	VGA			////////////////////////////
output			VGA_CLK;   				//	VGA Clock
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output			VGA_BLANK;				//	VGA BLANK
output			VGA_SYNC;				//	VGA SYNC
output	[9:0]	VGA_R;   				//	VGA Red[9:0]
output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
////////////////	Ethernet Interface	////////////////////////////
inout	[15:0]	ENET_DATA;				//	DM9000A DATA bus 16Bits
output			ENET_CMD;				//	DM9000A Command/Data Select, 0 = Command, 1 = Data
output			ENET_CS_N;				//	DM9000A Chip Select
output			ENET_WR_N;				//	DM9000A Write
output			ENET_RD_N;				//	DM9000A Read
output			ENET_RST_N;				//	DM9000A Reset
input			ENET_INT;				//	DM9000A Interrupt
output			ENET_CLK;				//	DM9000A Clock 25 MHz
////////////////////	Audio CODEC		////////////////////////////
inout			AUD_ADCLRCK;			//	Audio CODEC ADC LR Clock
input			AUD_ADCDAT;				//	Audio CODEC ADC Data
inout			AUD_DACLRCK;			//	Audio CODEC DAC LR Clock
output			AUD_DACDAT;				//	Audio CODEC DAC Data
inout			AUD_BCLK;				//	Audio CODEC Bit-Stream Clock
output			AUD_XCK;				//	Audio CODEC Chip Clock
////////////////////	TV Devoder		////////////////////////////
input	[7:0]	TD_DATA;    			//	TV Decoder Data bus 8 bits
input			TD_HS;					//	TV Decoder H_SYNC
input			TD_VS;					//	TV Decoder V_SYNC
output			TD_RESET;				//	TV Decoder Reset
////////////////////////	GPIO	////////////////////////////////
inout	[35:0]	GPIO_0;					//	GPIO Connection 0
inout	[35:0]	GPIO_1;					//	GPIO Connection 1

assign	LCD_ON		=	1'b1;
assign	LCD_BLON	=	1'b1;
assign	TD_RESET	=	1'b1;

//	All inout port turn to tri-state
assign	FL_DQ		=	8'hzz;
assign	SRAM_DQ		=	16'hzzzz;
assign	OTG_DATA	=	16'hzzzz;
assign	LCD_DATA	=	8'hzz;
assign	SD_DAT		=	1'bz;
assign	I2C_SDAT	=	1'bz;
assign	ENET_DATA	=	16'hzzzz;
assign	AUD_ADCLRCK	=	1'bz;
assign	AUD_DACLRCK	=	1'bz;
assign	AUD_BCLK	=	1'bz;

//	CCD 1
wire	[9:0]	CCD1_DATA;
wire			CCD1_SDAT;
wire			CCD1_SCLK;
wire			CCD1_FLASH;
wire			CCD1_FVAL;
wire			CCD1_LVAL;
wire			CCD1_PIXCLK;
reg				CCD1_MCLK;	//	CCD Master Clock
//	CCD	2
wire	[9:0]	CCD2_DATA;
wire			CCD2_SDAT;
wire			CCD2_SCLK;
wire			CCD2_FLASH;
wire			CCD2_FVAL;
wire			CCD2_LVAL;
wire			CCD2_PIXCLK;
reg				CCD2_MCLK;	//	CCD Master Clock

wire	[15:0]	Read_DATA1;
wire	[15:0]	Read_DATA2;
wire			VGA_CTRL_CLK;
wire	[9:0]	mCCD1_DATA;
wire			mCCD1_DVAL;
wire			mCCD1_DVAL_d;
wire	[9:0]	mCCD2_DATA;
wire			mCCD2_DVAL;
wire			mCCD2_DVAL_d;
wire	[10:0]	X1_Cont;
wire	[10:0]	Y1_Cont;
wire	[31:0]	Frame1_Cont;
wire	[9:0]	mCCD1_R;
wire	[9:0]	mCCD1_G;
wire	[9:0]	mCCD1_B;
wire	[10:0]	X2_Cont;
wire	[10:0]	Y2_Cont;
wire	[31:0]	Frame2_Cont;
wire	[9:0]	mCCD2_R;
wire	[9:0]	mCCD2_G;
wire	[9:0]	mCCD2_B;
wire			DLY_RST_0;
wire			DLY_RST_1;
wire			DLY_RST_2;
wire			Read1;
wire			Read2;
wire			Pre_Read;
wire	[9:0]	X_ADDR;
wire	[9:0]	Y_ADDR;
reg		[9:0]	rCCD1_DATA;
reg				rCCD1_LVAL;
reg				rCCD1_FVAL;
reg		[9:0]	rCCD2_DATA;
reg				rCCD2_LVAL;
reg				rCCD2_FVAL;
wire	[9:0]	sCCD1_R;
wire	[9:0]	sCCD1_G;
wire	[9:0]	sCCD1_B;
wire			sCCD1_DVAL;
wire	[9:0]	sCCD2_R;
wire	[9:0]	sCCD2_G;
wire	[9:0]	sCCD2_B;
wire			sCCD2_DVAL;


//	For Sensor 1
assign	CCD1_DATA[0]	=	GPIO_1[0];
assign	CCD1_DATA[1]	=	GPIO_1[1];
assign	CCD1_DATA[2]	=	GPIO_1[5];
assign	CCD1_DATA[3]	=	GPIO_1[3];
assign	CCD1_DATA[4]	=	GPIO_1[2];
assign	CCD1_DATA[5]	=	GPIO_1[4];
assign	CCD1_DATA[6]	=	GPIO_1[6];
assign	CCD1_DATA[7]	=	GPIO_1[7];
assign	CCD1_DATA[8]	=	GPIO_1[8];
assign	CCD1_DATA[9]	=	GPIO_1[9];
assign	GPIO_1[11]		=	CCD1_MCLK;
//assign	GPIO_1[15]		=	CCD1_SDAT;
//assign	GPIO_1[14]		=	CCD1_SCLK;
assign	CCD1_FVAL		=	GPIO_1[13];
assign	CCD1_LVAL		=	GPIO_1[12];
assign	CCD1_PIXCLK		=	GPIO_1[10];
//	For Sensor 2
assign	CCD2_DATA[0]	=	GPIO_1[0];
assign	CCD2_DATA[1]	=	GPIO_1[1];
assign	CCD2_DATA[2]	=	GPIO_1[5];
assign	CCD2_DATA[3]	=	GPIO_1[3];
assign	CCD2_DATA[4]	=	GPIO_1[2];
assign	CCD2_DATA[5]	=	GPIO_1[4];
assign	CCD2_DATA[6]	=	GPIO_1[6];
assign	CCD2_DATA[7]	=	GPIO_1[7];
assign	CCD2_DATA[8]	=	GPIO_1[8];
assign	CCD2_DATA[9]	=	GPIO_1[9];
assign	GPIO_1[11+20]	=	CCD2_MCLK;
//assign	GPIO_1[15+20]	=	CCD2_SDAT;
//assign	GPIO_1[14+20]	=	CCD2_SCLK;
assign	CCD2_FVAL		=	GPIO_1[13];
assign	CCD2_LVAL		=	GPIO_1[12];
assign	CCD2_PIXCLK		=	GPIO_1[10];

assign	LEDR		=	SW;
assign	LEDG		=	Y1_Cont;
assign	VGA_CTRL_CLK=	CCD1_MCLK;
assign	VGA_CLK		=	~CCD1_MCLK;

parameter	PIP_X	=	310;
parameter	PIP_Y	=	230;

assign	Read2		=	(X_ADDR>=PIP_X) && (X_ADDR<PIP_X+320) && (Y_ADDR>=PIP_Y) && (Y_ADDR<PIP_Y+240);
assign	Pre_Read	=	(X_ADDR>=PIP_X+2) && (X_ADDR<PIP_X+320+2) && (Y_ADDR>=PIP_Y) && (Y_ADDR<PIP_Y+240);

always@(posedge CLOCK_50)	CCD1_MCLK	<=	~CCD1_MCLK;
always@(posedge CLOCK_50)	CCD2_MCLK	<=	~CCD2_MCLK;

always@(posedge CCD1_PIXCLK)
begin
	rCCD1_DATA	<=	CCD1_DATA;
	rCCD1_LVAL	<=	CCD1_LVAL;
	rCCD1_FVAL	<=	CCD1_FVAL;
end

always@(posedge CCD2_PIXCLK)
begin
	rCCD2_DATA	<=	CCD2_DATA;
	rCCD2_LVAL	<=	CCD2_LVAL;
	rCCD2_FVAL	<=	CCD2_FVAL;
end

VGA_Controller		u1	(	//	Host Side
							.oRequest(Read1),
							.iRed(	Pre_Read	?	{Read_DATA2[14:10],	5'h00}	:	{Read_DATA1[14:10],	5'h00}	),
							.iGreen(Pre_Read	?	{Read_DATA2[9:5],	5'h00}	:	{Read_DATA1[9:5],	5'h00}	),
							.iBlue(	Pre_Read	?	{Read_DATA2[4:0],	5'h00}	:	{Read_DATA1[4:0],	5'h00}	),
							.oCoord_X(X_ADDR),
							.oCoord_Y(Y_ADDR),
							//	VGA Side
							.oVGA_R(VGA_R),
							.oVGA_G(VGA_G),
							.oVGA_B(VGA_B),
							.oVGA_H_SYNC(VGA_HS),
							.oVGA_V_SYNC(VGA_VS),
							.oVGA_SYNC(VGA_SYNC),
							.oVGA_BLANK(VGA_BLANK),
							//	Control Signal
							.iCLK(VGA_CTRL_CLK),
							.iRST_N(DLY_RST_2)	);

Reset_Delay			u2	(	.iCLK(CLOCK_50),
							.iRST(KEY[0]),
							.oRST_0(DLY_RST_0),
							.oRST_1(DLY_RST_1),
							.oRST_2(DLY_RST_2)	);

CCD_Capture			u3	(	.oDATA(mCCD1_DATA),
							.oDVAL(mCCD1_DVAL),
							.oX_Cont(X1_Cont),
							.oY_Cont(Y1_Cont),
							.oFrame_Cont(Frame1_Cont),
							.iDATA(rCCD1_DATA),
							.iFVAL(rCCD1_FVAL),
							.iLVAL(rCCD1_LVAL),
							.iSTART(!KEY[3]),
							.iEND(!KEY[2]),
							.iCLK(CCD1_PIXCLK),
							.iRST(DLY_RST_1)	);

CCD_Capture			v3	(	.oDATA(mCCD2_DATA),
							.oDVAL(mCCD2_DVAL),
							.oX_Cont(X2_Cont),
							.oY_Cont(Y2_Cont),
							.oFrame_Cont(Frame2_Cont),
							.iDATA(rCCD2_DATA),
							.iFVAL(rCCD2_FVAL),
							.iLVAL(rCCD2_LVAL),
							.iSTART(!KEY[3]),
							.iEND(!KEY[2]),
							.iCLK(CCD2_PIXCLK),
							.iRST(DLY_RST_1)	);

RAW2RGB_2X			u4	(	.oRed(mCCD1_R),
							.oGreen(mCCD1_G),
							.oBlue(mCCD1_B),
							.oDVAL(mCCD1_DVAL_d),
							.iX_Cont(X1_Cont),
							.iY_Cont(Y1_Cont),
							.iDATA(mCCD1_DATA),
							.iDVAL(mCCD1_DVAL),
							.iCLK(CCD1_PIXCLK),
							.iRST(DLY_RST_1)	);

RAW2RGB_4X			v4	(	.oRed(mCCD2_R),
							.oGreen(mCCD2_G),
							.oBlue(mCCD2_B),
							.oDVAL(mCCD2_DVAL_d),
							.iX_Cont(X2_Cont),
							.iY_Cont(Y2_Cont),
							.iDATA(mCCD2_DATA),
							.iDVAL(mCCD2_DVAL),
							.iCLK(CCD2_PIXCLK),
							.iRST(DLY_RST_1)	);

SEG7_LUT_8 			u5	(	.oSEG0(HEX0),.oSEG1(HEX1),
							.oSEG2(HEX2),.oSEG3(HEX3),
							.oSEG4(HEX4),.oSEG5(HEX5),
							.oSEG6(HEX6),.oSEG7(HEX7),
							.iDIG(Frame1_Cont) );

Sdram_Control_4Port	u6	(	//	HOST Side
						    .REF_CLK(CLOCK_50),
						    .RESET_N(1'b1),
							//	FIFO Write Side 1
						    .WR1_DATA(	{sCCD1_R[9:5],
										 sCCD1_G[9:5],
										 sCCD1_B[9:5]}),
							.WR1(sCCD1_DVAL),
							.WR1_ADDR(0),
							.WR1_MAX_ADDR(640*512),
							.WR1_LENGTH(9'h100),
							.WR1_LOAD(!DLY_RST_0),
							.WR1_CLK(CCD1_PIXCLK),
							//	FIFO Write Side 2
						    .WR2_DATA(	{sCCD2_R[9:5],
										 sCCD2_G[9:5],
										 sCCD2_B[9:5]}),
							.WR2(sCCD2_DVAL),
							.WR2_ADDR(22'h100000),
							.WR2_MAX_ADDR(22'h100000+320*256),
							.WR2_LENGTH(9'h100),
							.WR2_LOAD(!DLY_RST_0),
							.WR2_CLK(CCD2_PIXCLK),
							//	FIFO Read Side 1
						    .RD1_DATA(Read_DATA1),
				        	.RD1(Read1),
				        	.RD1_ADDR(640*16),
							.RD1_MAX_ADDR(640*496),
							.RD1_LENGTH(9'h100),
				        	.RD1_LOAD(!DLY_RST_0),
							.RD1_CLK(VGA_CTRL_CLK),
							//	FIFO Read Side 2
						    .RD2_DATA(Read_DATA2),
				        	.RD2(Read2),
				        	.RD2_ADDR(22'h100000+320*8),
							.RD2_MAX_ADDR(22'h100000+320*248),
							.RD2_LENGTH(9'h100),
				        	.RD2_LOAD(!DLY_RST_0),
							.RD2_CLK(VGA_CTRL_CLK),
							//	SDRAM Side
						    .SA(DRAM_ADDR),
						    .BA({DRAM_BA_1,DRAM_BA_0}),
						    .CS_N(DRAM_CS_N),
						    .CKE(DRAM_CKE),
						    .RAS_N(DRAM_RAS_N),
				            .CAS_N(DRAM_CAS_N),
				            .WE_N(DRAM_WE_N),
						    .DQ(DRAM_DQ),
				            .DQM({DRAM_UDQM,DRAM_LDQM}),
							.SDR_CLK(DRAM_CLK)	);

I2C_CCD_Config 		u7	(	//	Host Side
							.iCLK(CLOCK_50),
							.iRST_N(KEY[1]),
							.iExposure(SW[15:0]),
							//	I2C Side
							.I2C_SCLK(GPIO_1[14]),
							.I2C_SDAT(GPIO_1[15])	);

I2C_CCD_Config 		v7	(	//	Host Side
							.iCLK(CLOCK_50),
							.iRST_N(KEY[1]),
							.iExposure(SW[15:0]),
							//	I2C Side
							.I2C_SCLK(GPIO_1[34]),
							.I2C_SDAT(GPIO_1[35])	);

Mirror_Col_2X		u8	(	//	Input Side
							.iCCD_R(mCCD1_R),
							.iCCD_G(mCCD1_G),
							.iCCD_B(mCCD1_B),
							.iCCD_DVAL(mCCD1_DVAL_d),
							.iCCD_PIXCLK(CCD1_PIXCLK),
							.iRST_N(DLY_RST_1),
							//	Output Side
							.oCCD_R(sCCD1_R),
							.oCCD_G(sCCD1_G),
							.oCCD_B(sCCD1_B),
							.oCCD_DVAL(sCCD1_DVAL));

Mirror_Col_4X		u9	(	//	Input Side
							.iCCD_R(mCCD2_R),
							.iCCD_G(mCCD2_G),
							.iCCD_B(mCCD2_B),
							.iCCD_DVAL(mCCD2_DVAL_d),
							.iCCD_PIXCLK(CCD2_PIXCLK),
							.iRST_N(DLY_RST_1),
							//	Output Side
							.oCCD_R(sCCD2_R),
							.oCCD_G(sCCD2_G),
							.oCCD_B(sCCD2_B),
							.oCCD_DVAL(sCCD2_DVAL));


endmodule
						
						
						