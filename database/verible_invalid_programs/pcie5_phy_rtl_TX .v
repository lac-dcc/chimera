module TOP_MODULE #
(
parameter MAXPIPEWIDTH = 32,
parameter DEVICETYPE = 0, //0 for downstream 1 for upstream
parameter LANESNUMBER =16,
parameter GEN1_PIPEWIDTH = 8 ,	
parameter GEN2_PIPEWIDTH = 8 ,	
parameter GEN3_PIPEWIDTH = 8 ,	
parameter GEN4_PIPEWIDTH = 8 ,	
parameter GEN5_PIPEWIDTH = 8 ,	
parameter MAX_GEN = 1
)
(pclk,reset_n,NumberDetectLanes,pl_trdy,lp_irdy,lp_data,lp_valid,lp_dlpstart,lp_dlpend, lp_tlpstart,lp_tlpend,RxStatus,TxDetectRx_Loopback,PowerDown,
 PhyStatus,TxElecIdle,WriteDetectLanesFlag,SetTXState,TXFinishFlag,TXExitTo,WriteLinkNum,WriteLinkNumFlag,ReadLinkNum ,
TxData1,TxData2,TxData3,TxData4,TxData5,TxData6,TxData7,TxData8,TxData9,TxData10,TxData11,TxData12,TxData13,TxData14,TxData15,TxData16,
TxDataValid1,TxDataValid2,TxDataValid3,TxDataValid4,TxDataValid5,TxDataValid6,TxDataValid7,TxDataValid8,TxDataValid9,TxDataValid10,TxDataValid11,TxDataValid12,
TxDataValid13,TxDataValid14,TxDataValid15,TxDataValid16,TxDataK1,TxDataK2,TxDataK3,TxDataK4,TxDataK5,TxDataK6,TxDataK7,TxDataK8,TxDataK9,TxDataK10,TxDataK11,
TxDataK12,TxDataK13,TxDataK14,TxDataK15,TxDataK16,rateIdIn,upConfigureCapabilityIn,ReceiverpresetHintDSP, TransmitterPresetHintDSP,ReceiverpresetHintUSP,
TransmitterPresetHintUSP,LF_register,FS_register,CursorCoff_register,PreCursorCoff_register,PostCursorCoff_register,TrainToGen,ReadDirectSpeedChange,MainLTSSMGen,
TxSyncHeader1,TxSyncHeader2,TxSyncHeader3,TxSyncHeader4,TxSyncHeader5,TxSyncHeader6,TxSyncHeader7,TxSyncHeader8,TxSyncHeader9,TxSyncHeader10,TxSyncHeader11,
TxSyncHeader12,TxSyncHeader13,TxSyncHeader14,TxSyncHeader15,TxSyncHeader16,
TxStartBlock1,TxStartBlock2,TxStartBlock3,TxStartBlock4,TxStartBlock5,TxStartBlock6,TxStartBlock7,TxStartBlock8,TxStartBlock9,
TxStartBlock10,TxStartBlock11,TxStartBlock12,TxStartBlock13,TxStartBlock14,TxStartBlock15,TxStartBlock16,turnOff,RxStandby,startSend16,,turnOffScrambler_flag);

//lane number 
input [7:0] rateIdIn;
input upConfigureCapabilityIn;
output  [4:0] NumberDetectLanes;
//lpif control
wire hold;
output turnOffScrambler_flag;
//can not find it
output pl_trdy;
input  lp_irdy;
////// wr in tx control ??????

input  [512-1:0]lp_data;
input  [64-1:0]lp_valid;
input [64-1:0]lp_dlpstart;
input [64-1:0]lp_dlpend;
input [64-1:0]lp_tlpstart;
input [64-1:0]lp_tlpend;
input [2:0]MainLTSSMGen;
input turnOff;
input startSend16;
output [1:0]TxSyncHeader1,TxSyncHeader2,TxSyncHeader3,TxSyncHeader4,TxSyncHeader5,TxSyncHeader6,TxSyncHeader7,TxSyncHeader8,TxSyncHeader9,TxSyncHeader10,TxSyncHeader11,
TxSyncHeader12,TxSyncHeader13,TxSyncHeader14,TxSyncHeader15,TxSyncHeader16;

output TxStartBlock1,TxStartBlock2,TxStartBlock3,TxStartBlock4,TxStartBlock5,TxStartBlock6,TxStartBlock7,TxStartBlock8,TxStartBlock9,
TxStartBlock10,TxStartBlock11,TxStartBlock12,TxStartBlock13,TxStartBlock14,TxStartBlock15,TxStartBlock16;
output [15:0] RxStandby;
wire [1:0]scramblerSyncHeader1,scramblerSyncHeader2,scramblerSyncHeader3,scramblerSyncHeader4,scramblerSyncHeader5,scramblerSyncHeader6,
scramblerSyncHeader7,scramblerSyncHeader8,scramblerSyncHeader9,scramblerSyncHeader10,scramblerSyncHeader11,scramblerSyncHeader12,
scramblerSyncHeader13,scramblerSyncHeader14,scramblerSyncHeader15,scramblerSyncHeader16;
//fifo 
wire [511:0] FIFO_dataIN;
wire [63:0] FIFO_datavalid;
wire [63:0] FIFO_datak;
wire MuxSyncHeader;



//mux
wire sel;
//output data signals
output [31:0] TxData1,TxData2,TxData3,TxData4,TxData5,TxData6,TxData7,TxData8,TxData9,TxData10,TxData11,TxData12,TxData13,TxData14,TxData15,TxData16;
output  TxDataValid1,TxDataValid2,TxDataValid3,TxDataValid4,TxDataValid5,TxDataValid6,TxDataValid7,TxDataValid8,TxDataValid9,TxDataValid10,TxDataValid11,TxDataValid12,TxDataValid13,TxDataValid14,TxDataValid15,TxDataValid16;
output [3:0]  TxDataK1,TxDataK2,TxDataK3,TxDataK4,TxDataK5,TxDataK6,TxDataK7,TxDataK8,TxDataK9,TxDataK10,TxDataK11,TxDataK12,TxDataK13,TxDataK14,TxDataK15,TxDataK16;
//common
wire [2:0] gen;
input pclk;
input reset_n;
//os generator internal signals
wire [2:0] os_type;
wire [1:0]lane_number;
wire [7:0]link_number;
wire [2:0] rate;
wire loopback;
wire start;
wire finish;
wire busy;
wire [15:0]RxStandbyRequest;
//Gen3 
wire [1:0] EC;
wire ResetEIEOSCount;
wire [4* LANESNUMBER-1:0] TXPreset;
wire [3* LANESNUMBER-1:0] RXPreset;
wire [LANESNUMBER-1:0] UsePresetCoff;
wire [6* LANESNUMBER-1:0] FS;
wire [6* LANESNUMBER-1:0] LF;
wire [6* LANESNUMBER-1:0] PreCursorCoff;
wire [6* LANESNUMBER-1:0] CursorCoff;
wire [6* LANESNUMBER-1:0] PostCursorCoff;
wire [ LANESNUMBER-1:0] RejectCoff;
wire SpeedChange;
wire ReqEq;
wire EQTS2;

///main ltssm
wire [15:0]detected_lanes;
output  WriteDetectLanesFlag;
input  [4:0] SetTXState;
output  TXFinishFlag;
output  [4:0] TXExitTo;
output [7:0] WriteLinkNum;
output  WriteLinkNumFlag;
input [7:0] ReadLinkNum;
// new 
input [2:0] TrainToGen;
input ReadDirectSpeedChange;
input  [47:0] ReceiverpresetHintDSP;
input [63:0] TransmitterPresetHintDSP;
input  [47:0] ReceiverpresetHintUSP;
input  [63:0] TransmitterPresetHintUSP;
input  [6*16-1:0]LF_register;
input  [6*16-1:0]FS_register;
input  [6*16-1:0]CursorCoff_register;
input  [6*16-1:0]PreCursorCoff_register;
input  [6*16-1:0]PostCursorCoff_register;
//scrambler  
wire [31:0]scramblerDataOut1,scramblerDataOut2, scramblerDataOut3,scramblerDataOut4, scramblerDataOut5,scramblerDataOut6,scramblerDataOut7,scramblerDataOut8,scramblerDataOut9,scramblerDataOut10, scramblerDataOut11, scramblerDataOut12,scramblerDataOut13, scramblerDataOut14,scramblerDataOut15,scramblerDataOut16;
wire [3:0] scramblerDataK1, scramblerDataK2, scramblerDataK3, scramblerDataK4, scramblerDataK5, scramblerDataK6, scramblerDataK7, scramblerDataK8, scramblerDataK9, scramblerDataK10, scramblerDataK11, scramblerDataK12, scramblerDataK13, scramblerDataK14, scramblerDataK15,scramblerDataK16;
wire  scramblerDataValid1,scramblerDataValid2,scramblerDataValid3,scramblerDataValid4,scramblerDataValid5,scramblerDataValid6,scramblerDataValid7,scramblerDataValid8,scramblerDataValid9,scramblerDataValid10,scramblerDataValid11,scramblerDataValid12,scramblerDataValid13,scramblerDataValid14,scramblerDataValid15,scramblerDataValid16;

wire[511:0] os_data;
wire [63:0] os_datak;
wire [63:0] os_datavalid;
wire[511:0] data_muxout;
wire [63:0] datak_muxout;
wire [63:0] datavalid_muxout;
wire  datavalid_lmcout1,datavalid_lmcout2,datavalid_lmcout3,datavalid_lmcout4,datavalid_lmcout5,datavalid_lmcout6,datavalid_lmcout7,datavalid_lmcout8,datavalid_lmcout9,datavalid_lmcout10,datavalid_lmcout11,datavalid_lmcout12,datavalid_lmcout13,datavalid_lmcout14,datavalid_lmcout15,datavalid_lmcout16;
wire [31:0] data_lmc1,data_lmc2,data_lmc3,data_lmc4,data_lmc5,data_lmc6,data_lmc7,data_lmc8,data_lmc9,data_lmc10,data_lmc11,data_lmc12,data_lmc13,data_lmc14,data_lmc15,data_lmc16;
wire [3:0]  datak_lmc1,datak_lmc2,datak_lmc3,datak_lmc4,datak_lmc5,datak_lmc6,datak_lmc7,datak_lmc8,datak_lmc9,datak_lmc10,datak_lmc11,datak_lmc12,datak_lmc13,datak_lmc14,datak_lmc15,datak_lmc16;
wire [5:0] pipewidth;
wire [1:0]LMCSyncHeader1,LMCSyncHeader2,LMCSyncHeader3,LMCSyncHeader4,LMCSyncHeader5,LMCSyncHeader6,LMCSyncHeader7,LMCSyncHeader8,LMCSyncHeader9,LMCSyncHeader10,LMCSyncHeader11,LMCSyncHeader12,LMCSyncHeader13,LMCSyncHeader14,LMCSyncHeader15,LMCSyncHeader16;
//pipe control
wire [ LANESNUMBER-1:0]DetectReq;
wire [ LANESNUMBER-1:0]ElecIdleReq;
wire  [ LANESNUMBER-1:0]DetectStatus;
input	[3*LANESNUMBER -1:0]RxStatus;
output [LANESNUMBER-1:0]TxDetectRx_Loopback;
input [ LANESNUMBER-1:0]PhyStatus;
output [4*LANESNUMBER-1:0]PowerDown;
output [LANESNUMBER-1:0]TxElecIdle;

// wires of os generator 

reg [191:0]seedValue = {24'h1dbfbc, 24'h0607bb, 24'h1ec760, 24'h18c0db, 24'h010f12, 24'h19cfc9, 24'h0277ce, 24'h1bb807};



Tx_CTRL 
#(.MAXPIPEWIDTH(MAXPIPEWIDTH),.LANESNUMBER(LANESNUMBER),.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH),
.GEN2_PIPEWIDTH(GEN2_PIPEWIDTH),.GEN3_PIPEWIDTH(GEN3_PIPEWIDTH),.GEN4_PIPEWIDTH(GEN4_PIPEWIDTH),.GEN5_PIPEWIDTH(GEN5_PIPEWIDTH)) 
LPIF_CTRL
(.reset_n(reset_n),.data_in(lp_data),.wr(lp_irdy),.wr_valid(lp_valid),.pclk(pclk),.STP_IN(lp_tlpstart),.SDP_IN(lp_dlpstart)
,.END_IN(lp_tlpend|lp_dlpend),.Gen(gen),.DetectedLanes(detected_lanes),.Hold(hold),.DataOut(FIFO_dataIN),.ValidOut(FIFO_datavalid),.DKOut(FIFO_datak),.full(pl_trdy));
genvar i;
generate 
for(i=0;i<LANESNUMBER;i=i+1)
begin
PIPE_Control PIPE_CTL(.substate(SetTXState),.generation(gen), .pclk(pclk), .reset_n(reset_n), .RxStatus(RxStatus[3*i+:3]),
 .ElecIdle_req(ElecIdleReq[i]), .Detect_req(DetectReq[i]), .PhyStatus(PhyStatus[i]), .TxDetectRx_Loopback(TxDetectRx_Loopback[i]),
 .PowerDown(PowerDown[4*i+:4]), .Detect_status(DetectStatus[i]), .TxElecIdle(TxElecIdle[i]),.RxStandbyRequest(RxStandbyRequest[i])
 ,.RxStandby(RxStandby[i]));
end

endgenerate

TX_LTSSM #(.DEVICETYPE(DEVICETYPE),.MAXPIPEWIDTH(MAXPIPEWIDTH),.LANESNUMBER(LANESNUMBER),.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH),.MAX_GEN(MAX_GEN),
.GEN2_PIPEWIDTH(GEN2_PIPEWIDTH),.GEN3_PIPEWIDTH(GEN3_PIPEWIDTH),.GEN4_PIPEWIDTH(GEN4_PIPEWIDTH),.GEN5_PIPEWIDTH(GEN5_PIPEWIDTH)) txltssm (.Pclk(pclk),.Reset(reset_n),.Gen(gen),.TXFinishFlag(TXFinishFlag),.TXExitTo(TXExitTo),.DetectLanes(detected_lanes),.WriteDetectLanesFlag(WriteDetectLanesFlag),.SetTXState(SetTXState)
,.WriteLinkNum(WriteLinkNum),.WriteLinkNumFlag(WriteLinkNumFlag),.ReadLinkNum(ReadLinkNum),.HoldFIFOData(hold),.FIFOReady(),.OSType(os_type),.LaneNumber(lane_number),.LinkNumber( link_number),
.Rate(rate),.Loopback(loopback),.OSGeneratorStart(start),.OSGeneratorBusy(busy),.OSGeneratorFinish(finish),. EC(EC),.ResetEIEOSCount(ResetEIEOSCount),.TXPreset(TXPreset),.RXPreset(RXPreset),.UsePresetCoff(UsePresetCoff),
.FS(FS),.LF(LF),.PreCursorCoff(PreCursorCoff),.CursorCoff(CursorCoff),.PostCursorCoff(PostCursorCoff),.RejectCoff(RejectCoff),.SpeedChange(SpeedChange),.ReqEq(ReqEq),.EQTS2(EQTS2),.MuxSel(sel),.DetectReq(DetectReq),
.ElecIdleReq(ElecIdleReq),.DetectStatus(DetectStatus),
.NumberDetectLanes(NumberDetectLanes),.TrainToGen(TrainToGen),.ReadDirectSpeedChange(ReadDirectSpeedChange),.ReceiverpresetHintDSP(ReceiverpresetHintDSP),.TransmitterPresetHintDSP(TransmitterPresetHintDSP),.ReceiverpresetHintUSP(ReceiverpresetHintUSP),
.TransmitterPresetHintUSP(TransmitterPresetHintUSP),.LF_register(LF_register),.FS_register(FS_register),.CursorCoff_register(CursorCoff_register),.PreCursorCoff_register(PreCursorCoff_register),.PostCursorCoff_register(PostCursorCoff_register),
.MainLTSSMGen(MainLTSSMGen),.RxStandby(RxStandbyRequest),.startSend16(startSend16),.turnOffScrambler_flag(turnOffScrambler_flag)
);


OS_GENERATOR #(.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH),.GEN2_PIPEWIDTH(GEN2_PIPEWIDTH),.GEN3_PIPEWIDTH(GEN3_PIPEWIDTH),
.GEN4_PIPEWIDTH(GEN4_PIPEWIDTH),.GEN5_PIPEWIDTH(GEN5_PIPEWIDTH),.no_of_lanes(LANESNUMBER))
block1 (pclk, reset_n, os_type, lane_number, link_number, rate, loopback , detected_lanes, gen, start,EQTS2,EC,ResetEIEOSCount  ,TXPreset ,RXPreset ,UsePresetCoff   ,FS,LF,PreCursorCoff   ,CursorCoff  ,PostCursorCoff   ,RejectCoff,ReqEq,SpeedChange, finish, os_data, os_datak, busy, os_datavalid);
MUX block2 (sel,FIFO_datavalid, os_datavalid, FIFO_dataIN, os_data, FIFO_datak, os_datak,data_muxout,datak_muxout,datavalid_muxout,MuxSyncHeader);
LMC  #(.pipe_width_gen1(GEN1_PIPEWIDTH),
.pipe_width_gen2(GEN2_PIPEWIDTH),
.pipe_width_gen3(GEN3_PIPEWIDTH),
.pipe_width_gen4(GEN4_PIPEWIDTH),
.pipe_width_gen5(GEN5_PIPEWIDTH),
.number_of_lanes(LANESNUMBER)
      )block3 ( reset_n, pclk, gen, datavalid_muxout, data_muxout, datak_muxout,MuxSyncHeader,pipewidth,datavalid_lmcout1,datavalid_lmcout2,datavalid_lmcout3,datavalid_lmcout4,datavalid_lmcout5,datavalid_lmcout6,datavalid_lmcout7,datavalid_lmcout8,datavalid_lmcout9,datavalid_lmcout10,datavalid_lmcout11,datavalid_lmcout12,datavalid_lmcout13,datavalid_lmcout14,datavalid_lmcout15,datavalid_lmcout16,datak_lmc1,datak_lmc2,datak_lmc3,datak_lmc4,datak_lmc5,datak_lmc6,datak_lmc7,datak_lmc8,datak_lmc9,datak_lmc10,datak_lmc11,datak_lmc12,datak_lmc13,datak_lmc14,datak_lmc15,datak_lmc16,data_lmc1,data_lmc2,data_lmc3,data_lmc4,data_lmc5,data_lmc6,data_lmc7,data_lmc8,data_lmc9,data_lmc10,data_lmc11,data_lmc12,data_lmc13,data_lmc14,data_lmc15,data_lmc16,LMCSyncHeader1,LMCSyncHeader2,LMCSyncHeader3,LMCSyncHeader4,LMCSyncHeader5,LMCSyncHeader6,LMCSyncHeader7,LMCSyncHeader8,LMCSyncHeader9,LMCSyncHeader10,LMCSyncHeader11,LMCSyncHeader12,LMCSyncHeader13,LMCSyncHeader14,LMCSyncHeader15,LMCSyncHeader16);
Scrambler lane1 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader1,seedValue[0+:24],data_lmc1,datak_lmc1, datavalid_lmcout1,gen,scramblerDataOut1,scramblerDataK1,scramblerDataValid1,scramblerSyncHeader1);
Scrambler lane2 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader2,seedValue[24+:24],data_lmc2,datak_lmc2, datavalid_lmcout2,gen,scramblerDataOut2,scramblerDataK2,scramblerDataValid2,scramblerSyncHeader2);
Scrambler lane3 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader3,seedValue[48+:24],data_lmc3,datak_lmc3, datavalid_lmcout3,gen,scramblerDataOut3,scramblerDataK3,scramblerDataValid3,scramblerSyncHeader3);
Scrambler lane4 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader4,seedValue[72+:24],data_lmc4,datak_lmc4, datavalid_lmcout4,gen,scramblerDataOut4,scramblerDataK4,scramblerDataValid4,scramblerSyncHeader4);
Scrambler lane5 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader5,seedValue[96+:24],data_lmc5,datak_lmc5, datavalid_lmcout5,gen,scramblerDataOut5,scramblerDataK5,scramblerDataValid5,scramblerSyncHeader5);
Scrambler lane6 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader6,seedValue[120+:24],data_lmc6,datak_lmc6, datavalid_lmcout6,gen,scramblerDataOut6,scramblerDataK6,scramblerDataValid6,scramblerSyncHeader6);
Scrambler lane7 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader7,seedValue[144+:24],data_lmc7,datak_lmc7, datavalid_lmcout7,gen,scramblerDataOut7,scramblerDataK7,scramblerDataValid7,scramblerSyncHeader7);
Scrambler lane8 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader8,seedValue[168+:24],data_lmc8,datak_lmc8, datavalid_lmcout8,gen,scramblerDataOut8,scramblerDataK8,scramblerDataValid8,scramblerSyncHeader8);
Scrambler lane9 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader9,seedValue[0+:24],data_lmc9,datak_lmc9, datavalid_lmcout9,gen,scramblerDataOut9,scramblerDataK9,scramblerDataValid9,scramblerSyncHeader9);
Scrambler lane10 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader10,seedValue[24+:24],data_lmc10,datak_lmc10, datavalid_lmcout10,gen,scramblerDataOut10,scramblerDataK10,scramblerDataValid10,scramblerSyncHeader10);
Scrambler lane11 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader11,seedValue[48+:24],data_lmc11,datak_lmc11, datavalid_lmcout11,gen,scramblerDataOut11,scramblerDataK11,scramblerDataValid11,scramblerSyncHeader11);
Scrambler lane12 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader12,seedValue[72+:24],data_lmc12,datak_lmc12, datavalid_lmcout12,gen,scramblerDataOut12,scramblerDataK12,scramblerDataValid12,scramblerSyncHeader12);
Scrambler lane13 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader13,seedValue[96+:24],data_lmc13,datak_lmc13, datavalid_lmcout13,gen,scramblerDataOut13,scramblerDataK13,scramblerDataValid13,scramblerSyncHeader13);
Scrambler lane14 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader14,seedValue[120+:24],data_lmc14,datak_lmc14, datavalid_lmcout14,gen,scramblerDataOut14,scramblerDataK14,scramblerDataValid14,scramblerSyncHeader14);
Scrambler lane15 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader15,seedValue[144+:24],data_lmc15,datak_lmc15, datavalid_lmcout15,gen,scramblerDataOut15,scramblerDataK15,scramblerDataValid15,scramblerSyncHeader15);
Scrambler lane16 (pclk,reset_n,turnOff,pipewidth,LMCSyncHeader16,seedValue[168+:24],data_lmc16,datak_lmc16, datavalid_lmcout16,gen,scramblerDataOut16,scramblerDataK16,scramblerDataValid16,scramblerSyncHeader16);

PIPE_Data Lane1(gen, pclk, reset_n, scramblerDataOut1, scramblerDataK1, scramblerSyncHeader1, scramblerDataValid1, TxData1, TxDataValid1, TxDataK1, TxSyncHeader1, TxStartBlock1);
PIPE_Data Lane2(gen, pclk, reset_n, scramblerDataOut2, scramblerDataK2, scramblerSyncHeader2, scramblerDataValid2, TxData2, TxDataValid2, TxDataK2, TxSyncHeader2, TxStartBlock2);
PIPE_Data Lane3(gen, pclk, reset_n, scramblerDataOut3, scramblerDataK3, scramblerSyncHeader3, scramblerDataValid3, TxData3, TxDataValid3, TxDataK3, TxSyncHeader3, TxStartBlock3);
PIPE_Data Lane4(gen, pclk, reset_n, scramblerDataOut4, scramblerDataK4, scramblerSyncHeader4, scramblerDataValid4, TxData4, TxDataValid4, TxDataK4, TxSyncHeader4, TxStartBlock4);
PIPE_Data Lane5(gen, pclk, reset_n, scramblerDataOut5, scramblerDataK5, scramblerSyncHeader5, scramblerDataValid5, TxData5, TxDataValid5, TxDataK5, TxSyncHeader5, TxStartBlock5);
PIPE_Data Lane6(gen, pclk, reset_n, scramblerDataOut6, scramblerDataK6, scramblerSyncHeader6, scramblerDataValid6, TxData6, TxDataValid6, TxDataK6, TxSyncHeader6, TxStartBlock6);
PIPE_Data Lane7(gen, pclk, reset_n, scramblerDataOut7, scramblerDataK7, scramblerSyncHeader7, scramblerDataValid7, TxData7, TxDataValid7, TxDataK7, TxSyncHeader7, TxStartBlock7);
PIPE_Data Lane8(gen, pclk, reset_n, scramblerDataOut8, scramblerDataK8, scramblerSyncHeader8, scramblerDataValid8, TxData8, TxDataValid8, TxDataK8, TxSyncHeader8, TxStartBlock8);
PIPE_Data Lane9(gen, pclk, reset_n, scramblerDataOut9, scramblerDataK9, scramblerSyncHeader9, scramblerDataValid9, TxData9, TxDataValid9, TxDataK9, TxSyncHeader9, TxStartBlock9);
PIPE_Data Lane10(gen, pclk, reset_n, scramblerDataOut10, scramblerDataK10, scramblerSyncHeader10, scramblerDataValid10, TxData10, TxDataValid10, TxDataK10, TxSyncHeader10, TxStartBlock10);
PIPE_Data Lane11(gen, pclk, reset_n, scramblerDataOut11, scramblerDataK11, scramblerSyncHeader11, scramblerDataValid11, TxData11, TxDataValid11, TxDataK11, TxSyncHeader11, TxStartBlock11);
PIPE_Data Lane12(gen, pclk, reset_n, scramblerDataOut12, scramblerDataK12, scramblerSyncHeader12, scramblerDataValid12, TxData12, TxDataValid12, TxDataK12, TxSyncHeader12, TxStartBlock12);
PIPE_Data Lane13(gen, pclk, reset_n, scramblerDataOut13, scramblerDataK13, scramblerSyncHeader13, scramblerDataValid13, TxData13, TxDataValid13, TxDataK13, TxSyncHeader13, TxStartBlock13);
PIPE_Data Lane14(gen, pclk, reset_n, scramblerDataOut14, scramblerDataK14, scramblerSyncHeader14, scramblerDataValid14, TxData14, TxDataValid14, TxDataK14, TxSyncHeader14, TxStartBlock14);
PIPE_Data Lane15(gen, pclk, reset_n, scramblerDataOut15, scramblerDataK15, scramblerSyncHeader15, scramblerDataValid15, TxData15, TxDataValid15, TxDataK15, TxSyncHeader15, TxStartBlock15);
PIPE_Data Lane16(gen, pclk, reset_n, scramblerDataOut16, scramblerDataK16, scramblerSyncHeader16, scramblerDataValid16, TxData16, TxDataValid16, TxDataK16, TxSyncHeader16, TxStartBlock16);


endmodule