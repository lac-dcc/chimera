// --------------------------------------------------------------------
// Copyright (c) 2007 by Terasic Technologies Inc. 
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
// Major Functions:	I2C_CCD_Config
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Johnny FAN        :| 07/07/09  :| Initial Revision
// --------------------------------------------------------------------
`include "VGA_Param.h"
module I2C_CCD_Config (	//	Host Side
						iCLK,
						iRST_N,
						iZOOM_MODE_SW,
						iEXPOSURE_ADJ,
						iEXPOSURE_DEC_p,
						//	I2C Side
						I2C_SCLK,
						I2C_SDAT
						);
						
//	Host Side
input			iCLK;
input			iRST_N;
input 			iZOOM_MODE_SW;

//	I2C Side
output		I2C_SCLK;
inout		I2C_SDAT;

//	Internal Registers/Wires
reg	[15:0]	mI2C_CLK_DIV;
reg	[31:0]	mI2C_DATA;
reg			mI2C_CTRL_CLK;
reg			mI2C_GO;
wire		mI2C_END;
wire		mI2C_ACK;
reg	[23:0]	LUT_DATA;
reg	[5:0]	LUT_INDEX;
reg	[3:0]	mSetup_ST;


//////////////   CMOS sensor registers setting //////////////////////

input 		iEXPOSURE_ADJ;
input		iEXPOSURE_DEC_p;	

parameter 	default_exposure 			= 16'h07c0;
parameter 	exposure_change_value	 	= 16'd200;

reg	[24:0]	combo_cnt;
wire		combo_pulse;

reg	[1:0]	izoom_mode_sw_delay;

reg	[3:0]	iexposure_adj_delay;
wire		exposure_adj_set;	
wire		exposure_adj_reset;
reg	[15:0]	senosr_exposure;
wire	[17:0]	senosr_exposure_temp;

wire [23:0] sensor_start_row;
wire [23:0] sensor_start_column;
wire [23:0] sensor_row_size;
wire [23:0] sensor_column_size; 
wire [23:0] sensor_row_mode;
wire [23:0] sensor_column_mode;

assign sensor_start_row 		= iZOOM_MODE_SW ?  24'h010036 : 24'h010000;
assign sensor_start_column 		= iZOOM_MODE_SW ?  24'h020010 : 24'h020000;
`ifdef VGA_640x480p60
assign sensor_row_size	 		= iZOOM_MODE_SW ?  24'h0303BF : 24'h03077F;
assign sensor_column_size 		= iZOOM_MODE_SW ?  24'h0404FF : 24'h0409FF;
`else
assign sensor_row_size	 		= iZOOM_MODE_SW ?  24'h0303BF : 24'h0304AF; //600
assign sensor_column_size 		= iZOOM_MODE_SW ?  24'h0404FF : 24'h04063F; //800
`endif
assign sensor_row_mode 			= iZOOM_MODE_SW ?  24'h220000 : 24'h220011;
assign sensor_column_mode		= iZOOM_MODE_SW ?  24'h230000 : 24'h230011;

	
always@(posedge iCLK or negedge iRST_N)
	begin
		if (!iRST_N)
			begin
				iexposure_adj_delay <= 0;
			end
		else 
			begin
				iexposure_adj_delay <= {iexposure_adj_delay[2:0],iEXPOSURE_ADJ};		
			end	
	end

assign 	exposure_adj_set = ({iexposure_adj_delay[0],iEXPOSURE_ADJ}==2'b10) ? 1 : 0 ;
assign  exposure_adj_reset = ({iexposure_adj_delay[3:2]}==2'b10) ? 1 : 0 ;		
assign  senosr_exposure_temp = iEXPOSURE_DEC_p ? (senosr_exposure - exposure_change_value) : (senosr_exposure + exposure_change_value);

always@(posedge iCLK or negedge iRST_N)
	begin
		if (!iRST_N)
			senosr_exposure <= default_exposure;
		else if (exposure_adj_set|combo_pulse)
			if (senosr_exposure_temp[17])
				senosr_exposure <= 0;
			else if (senosr_exposure_temp[16])
				senosr_exposure <= 16'hffff;
			else
				senosr_exposure <= senosr_exposure_temp[15:0];	
	end			
				
		
always@(posedge iCLK or negedge iRST_N)
	begin
		if (!iRST_N)
			combo_cnt <= 0;
		else if (!iexposure_adj_delay[3])
			combo_cnt <= combo_cnt + 1;
		else
			combo_cnt <= 0;	
	end
	
assign combo_pulse = (combo_cnt == 25'h1fffff) ? 1 : 0;				
		
wire	i2c_reset;		

assign i2c_reset = iRST_N & ~exposure_adj_reset & ~combo_pulse ;

/////////////////////////////////////////////////////////////////////

//	Clock Setting
parameter	CLK_Freq	=	50000000;	//	50	MHz
parameter	I2C_Freq	=	20000;		//	20	KHz
//	LUT Data Number
parameter	LUT_SIZE	=	25;

/////////////////////	I2C Control Clock	////////////////////////
always@(posedge iCLK or negedge i2c_reset)
begin
	if(!i2c_reset)
	begin
		mI2C_CTRL_CLK	<=	0;
		mI2C_CLK_DIV	<=	0;
	end
	else
	begin
		if( mI2C_CLK_DIV	< (CLK_Freq/I2C_Freq) )
		mI2C_CLK_DIV	<=	mI2C_CLK_DIV+1;
		else
		begin
			mI2C_CLK_DIV	<=	0;
			mI2C_CTRL_CLK	<=	~mI2C_CTRL_CLK;
		end
	end
end
////////////////////////////////////////////////////////////////////
I2C_Controller 	u0	(	.CLOCK(mI2C_CTRL_CLK),		//	Controller Work Clock
						.I2C_SCLK(I2C_SCLK),		//	I2C CLOCK
 	 	 	 	 	 	.I2C_SDAT(I2C_SDAT),		//	I2C DATA
						.I2C_DATA(mI2C_DATA),		//	DATA:[SLAVE_ADDR,SUB_ADDR,DATA]
						.GO(mI2C_GO),      			//	GO transfor
						.END(mI2C_END),				//	END transfor 
						.ACK(mI2C_ACK),				//	ACK
						.RESET(i2c_reset)
					);
////////////////////////////////////////////////////////////////////
//////////////////////	Config Control	////////////////////////////
//always@(posedge mI2C_CTRL_CLK or negedge iRST_N)
always@(posedge mI2C_CTRL_CLK or negedge i2c_reset)
begin
	if(!i2c_reset)
	begin
		LUT_INDEX	<=	0;
		mSetup_ST	<=	0;
		mI2C_GO		<=	0;

	end

	else if(LUT_INDEX<LUT_SIZE)
		begin
			case(mSetup_ST)
			0:	begin
					mI2C_DATA	<=	{8'hBA,LUT_DATA};
					mI2C_GO		<=	1;
					mSetup_ST	<=	1;
				end
			1:	begin
					if(mI2C_END)
					begin
						if(!mI2C_ACK)
						mSetup_ST	<=	2;
						else
						mSetup_ST	<=	0;							
						mI2C_GO		<=	0;
					end
				end
			2:	begin
					LUT_INDEX	<=	LUT_INDEX+1;
					mSetup_ST	<=	0;
				end
			endcase
		end
end
////////////////////////////////////////////////////////////////////
/////////////////////	Config Data LUT	  //////////////////////////		
always
begin
	case(LUT_INDEX)
	0	:	LUT_DATA	<=	24'h000000;
	1	:	LUT_DATA	<=	24'h20c000;				//	Mirror Row and Columns
	2	:	LUT_DATA	<=	{8'h09,senosr_exposure};//	Exposure
	3	:	LUT_DATA	<=	24'h050000;				//	H_Blanking
	4	:	LUT_DATA	<=	24'h060019;				//	V_Blanking	
	5	:	LUT_DATA	<=	24'h0A8000;				//	change latch
	6	:	LUT_DATA	<=	24'h2B0013;				//	Green 1 Gain
	7	:	LUT_DATA	<=	24'h2C009A;				//	Blue Gain
	8	:	LUT_DATA	<=	24'h2D019C;				//	Red Gain
	9	:	LUT_DATA	<=	24'h2E0013;				//	Green 2 Gain
	10	:	LUT_DATA	<=	24'h100051;				//	set up PLL power on
`ifdef VGA_640x480p60	
	11	:	LUT_DATA	<=	24'h111f04;				//	PLL_m_Factor<<8+PLL_n_Divider
	12	:	LUT_DATA	<=	24'h120001;				//	PLL_p1_Divider
`else
	11	:	LUT_DATA	<=	24'h111805;				//	PLL_m_Factor<<8+PLL_n_Divider
	12	:	LUT_DATA	<=	24'h120001;				//	PLL_p1_Divider
`endif
	13	:	LUT_DATA	<=	24'h100053;				//	set USE PLL	 
	14	:	LUT_DATA	<=	24'h980000;				//	disble calibration 	
	15	:	LUT_DATA	<=	24'hA00000;				//	Test pattern control 
	16	:	LUT_DATA	<=	24'hA10000;				//	Test green pattern value
	17	:	LUT_DATA	<=	24'hA20FFF;				//	Test red pattern value
	18	:	LUT_DATA	<=	sensor_start_row 	;	//	set start row	
	19	:	LUT_DATA	<=	sensor_start_column ;	//	set start column 	
	20	:	LUT_DATA	<=	sensor_row_size;		//	set row size	
	21	:	LUT_DATA	<=	sensor_column_size;		//	set column size
	22	:	LUT_DATA	<=	sensor_row_mode;		//	set row mode in bin mode
	23	:	LUT_DATA	<=	sensor_column_mode;		//	set column mode	 in bin mode
	24	:	LUT_DATA	<=	24'h4901A8;				//	row black target		
	default:LUT_DATA	<=	24'h000000;
	endcase
end

endmodule