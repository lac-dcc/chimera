module RX #(parameter GEN1_PIPEWIDTH = 8, parameter GEN2_PIPEWIDTH = 16, parameter GEN3_PIPEWIDTH = 32, parameter GEN4_PIPEWIDTH = 8,
parameter GEN5_PIPEWIDTH = 8,parameter DEVICETYPE = 0,parameter Width =32)

(input reset, 
input clk, 
input [2:0]GEN, 
input [15:0]PhyStatus, 
input [15:0]RxValid,
input [15:0]RxStartBlock, 
input [47:0]RxStatus,
input [31:0]RxSyncHeader, 
input [15:0]RxElectricalIdle,
input [511:0]RxData, 
input [63:0]RxDataK,
input [4:0]numberOfDetectedLanes,
input [4:0]substate,
input [7:0]linkNumber,
output [63:0]pl_tlpstart, 
output [63:0]pl_dllpstart, 
output [63:0]pl_tlpend,
output [63:0]pl_dllpend, 
output [63:0]pl_tlpedb, 
output[63:0]pl_valid, 
output [511:0]pl_data,
output [2:0]pl_speedmode, 
output [7:0] rateid,
output [7:0] linkNumberOut,
output upConfigureCapability,
output finish,
output [4:0]exitTo,
output witeUpconfigureCapability,
output writerateid,
output writeLinkNumber,
output [3*16-1:0] ReceiverpresetHintDSPout,
output [4*16-1:0] TransmitterPresetHintDSPout,
output [3*16-1:0] ReceiverpresetHintUSPout,
output [4*16-1:0] TransmitterPresetHintUSPout,
input  [3*16-1:0] ReceiverpresetHintDSP,
input  [4*16-1:0] TransmitterPresetHintDSP,
input  [3*16-1:0] ReceiverpresetHintUSP,
input  [4*16-1:0] TransmitterPresetHintUSP,
output writeReceiverpresetHintUSP,
output writeTransmitterPresetHintUSP,
output writeReceiverpresetHintDSP,
output writeTransmitterPresetHintDSP,
output [16*6-1:0]LFDSP,
output [16*6-1:0]FSDSP,
input  [6*16-1:0]CursorCoff,
input  [6*16-1:0]PreCursorCoff,
input  [6*16-1:0]PostCursorCoff,
input directed_speed_change,
input [2:0] trainToGen,
input disableScrambler);
	
wire [5:0]PIPEWIDTH;
wire [511:0]PIPEData, descramblerData, LMCData;
wire [63:0]PIPEDataK, descramblerDataK, LMCDataK;
wire [15:0]PIPEDataValid, descramblerDataValid;
wire LMCValid;
wire [31:0]PIPESyncHeader, descramblerSyncHeader, LMCSyncHeader;
wire [2047:0] orderedSets;
wire [15:0]rxElectricalIdle;
wire validOrderedSets;
wire [3:0]lpifStatus;	
wire [511:0]Data_out;
wire w;
wire [63:0]valid     ;
wire [63:0]dlpstart  ;
wire [63:0]dlpend    ;
wire [63:0]tlpstart  ;
wire [63:0]tlpedb    ;
wire [63:0]tlpend    ;

	
	//=== seed values for Gen 3 descrambler ===
	reg [191:0]seedValue = {24'h1bb807, 24'h0277ce, 24'h19cfc9, 24'h010f12, 24'h18c0db, 24'h1ec760, 24'h0607bb, 24'h1dbfbc};


	
	genvar i;
	
	generate
		for(i=0; i<16; i=i+1)
			begin
			localparam integer j = i*2;
			localparam integer k = i*3;
			localparam integer l = i*4;
			localparam integer m = i*32;
			localparam integer s = (i%8)*24;
			PIPE_Rx_Data #(.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH), .GEN2_PIPEWIDTH(GEN2_PIPEWIDTH), .GEN3_PIPEWIDTH(GEN3_PIPEWIDTH), .GEN4_PIPEWIDTH(GEN4_PIPEWIDTH),
						.GEN5_PIPEWIDTH(GEN5_PIPEWIDTH)) 
						PIPE(.reset(reset), .clk(clk), .GEN(GEN), .RxValid(RxValid[i]), .RxStatus(RxStatus[k+:3]), .PhyStatus(PhyStatus[i]),.RxElectricalIdle(RxElectricalIdle[i]),
							.RxData(RxData[m+:32]), .RxDataK(RxDataK[l+:4]), .RxStartBlock(RxStartBlock[i]), .RxSyncHeader(RxSyncHeader[j+:2]), .PIPEWIDTH(PIPEWIDTH),
							.PIPESyncHeader(PIPESyncHeader[j+:2]), .PIPEDataValid(PIPEDataValid[i]), .PIPEData(PIPEData[m+:32]), .PIPEDataK(PIPEDataK[l+:4]),.PIPEElectricalIdle(rxElectricalIdle[i]));
							
			Descrambler descrambler(.clk(clk), .reset(reset), .turnOff(disableScrambler), .PIPEDataValid(PIPEDataValid[i]), .PIPEWIDTH(PIPEWIDTH), 
								.PIPESyncHeader(PIPESyncHeader[j+:2]), .seedValue(seedValue[s+:24]), .PIPEData(PIPEData[m+:32]), .PIPEDataK(PIPEDataK[l+:4]), .GEN(GEN),
								.descramblerDataValid(descramblerDataValid[i]), .descramblerData(descramblerData[m+:32]), .descramblerDataK(descramblerDataK[l+:4]), 
								.descramblerSyncHeader(descramblerSyncHeader[j+:2]));	
			end
	endgenerate
	
	LMC_RX #(.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH), .GEN2_PIPEWIDTH(GEN2_PIPEWIDTH), .GEN3_PIPEWIDTH(GEN3_PIPEWIDTH), .GEN4_PIPEWIDTH(GEN4_PIPEWIDTH), .GEN5_PIPEWIDTH(GEN5_PIPEWIDTH))  
		lmc (.clk(clk), .reset(reset), .GEN(GEN), .descramblerSyncHeader(descramblerSyncHeader), .descramblerDataValid(descramblerDataValid),
			.LANESNUMBER(numberOfDetectedLanes), .LMCIn(descramblerData), .descramblerDataK(descramblerDataK), .LMCValid(LMCValid), .LMCSyncHeader(LMCSyncHeader), .LMCDataK(LMCDataK),.LMCData(LMCData));									
	
	osDecoder#(.Width(32),.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH), .GEN2_PIPEWIDTH(GEN2_PIPEWIDTH), .GEN3_PIPEWIDTH(GEN3_PIPEWIDTH), .GEN4_PIPEWIDTH(GEN4_PIPEWIDTH), .GEN5_PIPEWIDTH(GEN5_PIPEWIDTH))
	 os(
	clk,
	GEN,
	reset,
	numberOfDetectedLanes,
	LMCData,
	LMCValid,
	linkUp,
	substate,
	LMCSyncHeader,
	validOrderedSets,
	orderedSets);
	
	RxLTSSM #(.DEVICETYPE(DEVICETYPE),.Width(Width),.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH), .GEN2_PIPEWIDTH(GEN2_PIPEWIDTH), .GEN3_PIPEWIDTH(GEN3_PIPEWIDTH), .GEN4_PIPEWIDTH(GEN4_PIPEWIDTH), .GEN5_PIPEWIDTH(GEN5_PIPEWIDTH)) rxltssm(
	GEN,
	clk,
	reset,
	orderedSets,
	numberOfDetectedLanes,
	substate,
	linkNumber,
	directed_speed_change,
	trainToGen,
	rxElectricalIdle[0],
	validOrderedSets,
	rateid,
	linkNumberOut,
	upConfigureCapability,
	finish,
	exitTo,
	witeUpconfigureCapability,
	writerateid,
	writeLinkNumber,
	lpifStatus,
	ReceiverpresetHintDSPout,
	TransmitterPresetHintDSPout,
	ReceiverpresetHintUSPout,
	TransmitterPresetHintUSPout,
	ReceiverpresetHintDSP,
	TransmitterPresetHintDSP,
	ReceiverpresetHintUSP,
	TransmitterPresetHintUSP,
	writeReceiverpresetHintDSP,
 	writeTransmitterPresetHintDSP,
	writeReceiverpresetHintUSP,
	writeTransmitterPresetHintUSP,
	LFDSP,
	FSDSP,
	CursorCoff,
    PreCursorCoff,
    PostCursorCoff
	);


packet_identifier#(.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH), .GEN2_PIPEWIDTH(GEN2_PIPEWIDTH), .GEN3_PIPEWIDTH(GEN3_PIPEWIDTH), .GEN4_PIPEWIDTH(GEN4_PIPEWIDTH), .GEN5_PIPEWIDTH(GEN5_PIPEWIDTH))
    packet_identifier(   
    .data_in(LMCData),
    .valid_pd(LMCValid),
    .gen(GEN),
    .linkup(linkUp),
    .DK(LMCDataK),
	.syncHeader(LMCSyncHeader),// gen3
    .numberOfDetectedLanes(numberOfDetectedLanes),
    .data_out(Data_out),
    .pl_valid   (valid),
    .pl_dlpstart(dlpstart),
    .pl_dlpend  (dlpend),
    .pl_tlpstart(tlpstart),
    .pl_tlpedb  (tlpedb),
    .pl_tlpend  (tlpend), 
	.clk(clk),
	.rst(reset),
    .w(w)  
);
LPIF_RX_Control_DataFlow lpif(.clk(clk),  .reset(reset), .tlpstart(tlpstart), .dllpstart(dlpstart), .tlpend(tlpend), .dllpend(dlpend), .edb(tlpedb), 
			      .packetValid(valid), .packetData(Data_out)/*, .lp_force_detect(lp_force_detect)*/, .GEN(GEN), /*.state(lpifStatus),*/ 
			      .pl_tlpstart(pl_tlpstart), .pl_dllpstart(pl_dllpstart), .pl_tlpend(pl_tlpend), .pl_dllpend(pl_dllpend), 
			      .pl_tlpedb(pl_tlpedb), .pl_valid(pl_valid), .pl_data(pl_data), .pl_speedmode(pl_speedmode)/*, .pl_state_sts(pl_state_sts),.ltssmForceDetect(forceDetect)*/);


endmodule



/*
module RX_TB_Integration;

	reg reset,clk;
	reg [15:0]  RxValid, PhyStatus, RxStartBlock , RxElectricalIdle;
	reg [63:0] RxDataK;
	reg [31:0] RxSyncHeader;
	reg [47:0] RxStatus;
	reg [2:0] GEN;
	reg [511:0] RxData;
	reg [4:0]numberOfDetectedLanes;
	reg [3:0]substate;
	reg [7:0]linkNumber;
	//reg lp_force_detect;
	wire [63:0]pl_tlpstart,
	pl_dllpstart,pl_tlpend,
	pl_dllpend,
	pl_tlpedb,
	pl_valid;
 	wire [511:0]pl_data;
	wire [2:0]pl_speedmode;
	wire [3:0]pl_state_sts;
	wire [7:0] rateid;
	wire [7:0] linkNumberOut;
	wire upConfigureCapability;
	wire finish;
	wire [3:0]exitTo;
	wire linkUp;
	wire witeUpconfigureCapability;
	wire writerateid;
	wire writeLinkNumber;
//input substates from main ltssm
    localparam [3:0]
		detectQuiet =  4'd0,
		detectActive = 4'd1,
		pollingActive= 4'd2,
		pollingConfiguration= 4'd3,
		configurationLinkWidthStart = 4'd4,
		configurationLinkWidthAccept = 4'd5,
		configurationLanenumWait = 4'd6,
		configurationLanenumAccept = 4'd7,
		configurationComplete = 4'd8,
		configurationIdle = 4'd9;



	 RX #(.GEN1_PIPEWIDTH(32),.GEN2_PIPEWIDTH(16),.GEN3_PIPEWIDTH(32),.GEN4_PIPEWIDTH(8),.GEN5_PIPEWIDTH(8))RX
	 (
	reset
	,clk,
	GEN,
	PhyStatus,
	RxValid,
	RxStartBlock,
	RxStatus,
	RxSyncHeader,
	RxElectricalIdle,
	RxData,
	RxDataK,
	numberOfDetectedLanes,
	substate,
	linkNumber,
	//lp_force_detect,
	pl_tlpstart,
	pl_dllpstart,
	pl_tlpend,
	pl_dllpend,
	pl_tlpedb,
	pl_valid,
	pl_data,
	pl_speedmode,
	pl_state_sts,
	rateid,
	linkNumberOut,
	upConfigureCapability,
	finish,
	exitTo,
	linkUp,
	witeUpconfigureCapability,
	writerateid,
	writeLinkNumber
);


	

initial
begin
//==== initialize clk ====
		clk = 0;
		//==== reset ====
		reset = 1;
		#5
		reset = 0;
		#5
		reset = 1;
		//=== GEN3 data ===
		RxStartBlock = 1;
		RxSyncHeader = 0;
		substate = pollingActive;
		//=== Good Scenario (data) with PIPEWIDTH = 8 ===
		numberOfDetectedLanes = 5'd2;
		GEN = 1;
		RxValid = 1;
		RxStatus = 0;
		PhyStatus = 1;
		//64'hBCF7F7AAAAAA25252525252525252525;
		repeat(8)
		begin
		RxData = {64'hBCF7F7AABCF7F7AA,448'd0};
		RxDataK = 0;
		#10
		//=== Bad Scenario_1 ===
		RxValid = 1;
		RxStatus = 0;
		RxData = {64'hAAAA2525AAAA2525,448'd0};
		RxDataK = 1;
		#10
		//=== Good Scenario (control) with PIPEWIDTH = 16===
		RxValid = 1;
		RxStatus = 0;
		RxData = {64'h2525252525252525,448'd0};
		RxDataK = 2;
		#10
		//=== Bad Scenario_2 ===
		RxValid = 1;
		RxStatus = 0;
		RxData = {64'h2525252525252525,448'd0};
		RxDataK = 3;
		#10;
		end
		#10
		//=== essaily scenario ===
		numberOfDetectedLanes = 5'd2;
		GEN = 1;
		RxValid = 1;
		RxStatus = 0;
		PhyStatus = 1;
		//64'hBCF7F7AAAAAA25252525252525252525;
		RxData = {64'hFBBCF7F7AABCF7F7,448'd0};
		RxDataK = {1'b1,63'b0};
		#10
		//=== Bad Scenario_1 ===
		RxValid = 1;
		RxStatus = 0;
		RxData = {64'hAAAA2525AAAA2525,448'd0};
		RxDataK = {1'b0,63'b0};
		#10
		//=== Good Scenario (control) with PIPEWIDTH = 16===
		RxValid = 1;
		RxStatus = 0;
		RxData = {64'h2525252525252525,448'd0};
		RxDataK = {1'b0,63'b0};
		#10
		//=== Bad Scenario_2 ===
		RxValid = 1;
		RxStatus = 0;
		RxData = {64'h2525252525252525,448'd0};
		RxDataK = {1'b0,63'b0};
		
		
end
always #5 clk = ~clk;



endmodule
*/
