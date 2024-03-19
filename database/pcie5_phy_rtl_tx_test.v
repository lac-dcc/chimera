//`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:25:43 05/25/2021
// Design Name:   TOP_MODULE
// Module Name:   D:/4th CSE/GP/TXinteg/TX/tx_test.v
// Project Name:  TX
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TOP_MODULE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tx_test;

	// Inputs
	reg pclk;
	reg reset_n;
	reg lp_irdy;
	reg [511:0] lp_data;
	reg [63:0] lp_valid;
	reg [63:0] lp_dlpstart;
	reg [63:0] lp_dlpend;
	reg [63:0] lp_tlpstart;
	reg [63:0] lp_tlpend;
	reg [47:0] RxStatus;
	reg [15:0] PhyStatus;
	reg [3:0] SetTXState;
	reg [7:0] ReadLinkNum;

	// Outputs
	wire pl_trdy;
	wire [15:0] TxDetectRx_Loopback;
	wire [63:0] PowerDown;
	wire [15:0] TxElecIdle;
	wire [15:0] detected_lanes;
	wire WriteDetectLanesFlag;
	wire TXFinishFlag;
	wire [3:0] TXExitTo;
	wire [7:0] WriteLinkNum;
	wire WriteLinkNumFlag;
	wire [31:0] TxData1;
	wire [31:0] TxData2;
	wire [31:0] TxData3;
	wire [31:0] TxData4;
	wire [31:0] TxData5;
	wire [31:0] TxData6;
	wire [31:0] TxData7;
	wire [31:0] TxData8;
	wire [31:0] TxData9;
	wire [31:0] TxData10;
	wire [31:0] TxData11;
	wire [31:0] TxData12;
	wire [31:0] TxData13;
	wire [31:0] TxData14;
	wire [31:0] TxData15;
	wire [31:0] TxData16;
	wire [3:0] TxDataValid1;
	wire [3:0] TxDataValid2;
	wire [3:0] TxDataValid3;
	wire [3:0] TxDataValid4;
	wire [3:0] TxDataValid5;
	wire [3:0] TxDataValid6;
	wire [3:0] TxDataValid7;
	wire [3:0] TxDataValid8;
	wire [3:0] TxDataValid9;
	wire [3:0] TxDataValid10;
	wire [3:0] TxDataValid11;
	wire [3:0] TxDataValid12;
	wire [3:0] TxDataValid13;
	wire [3:0] TxDataValid14;
	wire [3:0] TxDataValid15;
	wire [3:0] TxDataValid16;
	wire [3:0] TxDataK1;
	wire [3:0] TxDataK2;
	wire [3:0] TxDataK3;
	wire [3:0] TxDataK4;
	wire [3:0] TxDataK5;
	wire [3:0] TxDataK6;
	wire [3:0] TxDataK7;
	wire [3:0] TxDataK8;
	wire [3:0] TxDataK9;
	wire [3:0] TxDataK10;
	wire [3:0] TxDataK11;
	wire [3:0] TxDataK12;
	wire [3:0] TxDataK13;
	wire [3:0] TxDataK14;
	wire [3:0] TxDataK15;
	wire [3:0] TxDataK16;
	integer i;

	// Instantiate the Unit Under Test (UUT)
	TOP_MODULE uut (
		.pclk(pclk), 
		.reset_n(reset_n), 
		.pl_trdy(pl_trdy), 
		.lp_irdy(lp_irdy), 
		.lp_data(lp_data), 
		.lp_valid(lp_valid), 
		.lp_dlpstart(lp_dlpstart), 
		.lp_dlpend(lp_dlpend), 
		.lp_tlpstart(lp_tlpstart), 
		.lp_tlpend(lp_tlpend), 
		.RxStatus(RxStatus), 
		.TxDetectRx_Loopback(TxDetectRx_Loopback), 
		.PowerDown(PowerDown), 
		.PhyStatus(PhyStatus), 
		.TxElecIdle(TxElecIdle), 
		.detected_lanes(detected_lanes), 
		.WriteDetectLanesFlag(WriteDetectLanesFlag), 
		.SetTXState(SetTXState), 
		.TXFinishFlag(TXFinishFlag), 
		.TXExitTo(TXExitTo), 
		.WriteLinkNum(WriteLinkNum), 
		.WriteLinkNumFlag(WriteLinkNumFlag), 
		.ReadLinkNum(ReadLinkNum), 
		.TxData1(TxData1), 
		.TxData2(TxData2), 
		.TxData3(TxData3), 
		.TxData4(TxData4), 
		.TxData5(TxData5), 
		.TxData6(TxData6), 
		.TxData7(TxData7), 
		.TxData8(TxData8), 
		.TxData9(TxData9), 
		.TxData10(TxData10), 
		.TxData11(TxData11), 
		.TxData12(TxData12), 
		.TxData13(TxData13), 
		.TxData14(TxData14), 
		.TxData15(TxData15), 
		.TxData16(TxData16), 
		.TxDataValid1(TxDataValid1), 
		.TxDataValid2(TxDataValid2), 
		.TxDataValid3(TxDataValid3), 
		.TxDataValid4(TxDataValid4), 
		.TxDataValid5(TxDataValid5), 
		.TxDataValid6(TxDataValid6), 
		.TxDataValid7(TxDataValid7), 
		.TxDataValid8(TxDataValid8), 
		.TxDataValid9(TxDataValid9), 
		.TxDataValid10(TxDataValid10), 
		.TxDataValid11(TxDataValid11), 
		.TxDataValid12(TxDataValid12), 
		.TxDataValid13(TxDataValid13), 
		.TxDataValid14(TxDataValid14), 
		.TxDataValid15(TxDataValid15), 
		.TxDataValid16(TxDataValid16), 
		.TxDataK1(TxDataK1), 
		.TxDataK2(TxDataK2), 
		.TxDataK3(TxDataK3), 
		.TxDataK4(TxDataK4), 
		.TxDataK5(TxDataK5), 
		.TxDataK6(TxDataK6), 
		.TxDataK7(TxDataK7), 
		.TxDataK8(TxDataK8), 
		.TxDataK9(TxDataK9), 
		.TxDataK10(TxDataK10), 
		.TxDataK11(TxDataK11), 
		.TxDataK12(TxDataK12), 
		.TxDataK13(TxDataK13), 
		.TxDataK14(TxDataK14), 
		.TxDataK15(TxDataK15), 
		.TxDataK16(TxDataK16)
	);
	parameter  DetectQuiet = 4'b0000, DetectActive = 4'b0001, PollingActive = 4'b0010,
	    PollingConfigration = 4'b0011, ConfigrationLinkWidthStart = 4'b0100, ConfigrationLinkWidthAccept= 4'b0101,
             ConfigrationLaneNumWait = 4'b0110 ,  ConfigrationLaneNumActive = 4'b0111 , ConfigrationComplete = 4'b1000 ,
            ConfigrationIdle = 4'b1001 , 
				L0=4'b1010 , 
				Idle=4'b1111;
	always #5 pclk=~pclk;
	initial begin
		// Initialize Inputs
		pclk = 0;
		reset_n = 0;
		lp_irdy = 0;
		lp_data = 0;
		lp_valid = 0;
		lp_dlpstart = 0;
		lp_dlpend = 0;
		lp_tlpstart = 0;
		lp_tlpend = 0;
		RxStatus = 0;
		PhyStatus = 0;
		SetTXState = 0;
		ReadLinkNum = 0;
			
		// Wait 100 ns for global reset to finish
		#50;
		reset_n<=1;
		  
		// Add stimulus here
		SetTXState = DetectQuiet;
		wait(TXFinishFlag && TXExitTo==DetectActive);
		#100
		SetTXState = DetectActive;
		///wait(PowerDown=={4{4'b0010}} && TxDetectRx_Loopback=={4{1'b1}});
		PhyStatus={16{1'b1}};
		RxStatus={16{3'b011}};
		
		wait(TXFinishFlag && TXExitTo==PollingActive);
		SetTXState = L0;
		lp_irdy=1;
		for (i=0;i<512;i=i+1) begin
		 lp_data[i]=$random;
		 lp_valid=1;
		 lp_tlpstart[i]=0;
		 lp_tlpend[i]=0;
		 end
		 lp_tlpstart[0]=1;
		 lp_tlpstart[12]=1;
		 lp_tlpstart[24]=1;
		 lp_tlpstart[36]=1;
		 lp_tlpend[9]=1;
		 lp_tlpend[16]=1;
		 lp_tlpend[30]=1;
		 lp_tlpend[40]=1;
		 #10
		 lp_irdy=0;
		 #100
		wait(TXFinishFlag && TXExitTo==PollingConfigration );
	end
      
endmodule

