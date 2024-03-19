module RxLTSSM #(
parameter DEVICETYPE=0,
parameter Width = 32,
parameter GEN1_PIPEWIDTH = 8 ,	
parameter GEN2_PIPEWIDTH = 8 ,	
parameter GEN3_PIPEWIDTH = 8 ,	
parameter GEN4_PIPEWIDTH = 8 ,	
parameter GEN5_PIPEWIDTH = 8)
 (
input [2:0]Gen,
input clk,
input reset,
input [2047:0] orderedSets,
input [4:0]numberOfDetectedLanes,
input [4:0]substate,
input [7:0]linkNumber,
input directed_speed_change,
input [2:0] trainToGen,
input rxElectricalIdle,
input validOrderedSets,
output [7:0] rateId,
output [7:0] linkNumberOut,
output upConfigureCapability,
output finish,
output [4:0]exitTo,
output witeUpconfigureCapability,
output writerateid,
output writeLinkNumber,
output [3:0]lpifStatus,
output [3*16-1:0] ReceiverpresetHintDSPout,
output [4*16-1:0] TransmitterPresetHintDSPout,
output [3*16-1:0] ReceiverpresetHintUSPout,
output [4*16-1:0] TransmitterPresetHintUSPout,
input [3*16-1:0] ReceiverpresetHintDSP,
input [4*16-1:0] TransmitterPresetHintDSP,
input [3*16-1:0] ReceiverpresetHintUSP,
input [4*16-1:0] TransmitterPresetHintUSP,
output writeReceiverpresetHintDSP,
output writeTransmitterPresetHintDSP,
output writeReceiverpresetHintUSP,
output writeTransmitterPresetHintUSP,
output [16*6-1:0]LFDSP,
output [16*6-1:0]FSDSP,
input  [6*16-1:0]CursorCoff,
input  [6*16-1:0]PreCursorCoff,
input  [6*16-1:0]PostCursorCoff
);

wire [15:0]resetOsCheckers;
wire [15:0]countUp,resetCounters;
wire [127:0]rateIds;
wire [127:0]linkNumbers;
wire [15:0]upConfigurebits;
wire [79:0]countersValues;
wire [4:0] checkValues;
wire [15:0]comparisonValues;
wire  enableTimer,startTimer,resetTimer,timeOut;
wire [2:0]setTimer;
wire [15:0]RcvrCfgToidle;
wire [15:0]detailedRecoverySubstates;


genvar i;
generate
   for (i=0; i <= 15; i=i+1) 
   begin
     osChecker #(.DEVICETYPE(DEVICETYPE),.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH),.GEN2_PIPEWIDTH(GEN2_PIPEWIDTH),
     .GEN3_PIPEWIDTH(GEN3_PIPEWIDTH),.GEN4_PIPEWIDTH(GEN4_PIPEWIDTH),.GEN5_PIPEWIDTH(GEN5_PIPEWIDTH))
     osChecker( 
      .clk(clk),
      .linkNumber(linkNumber),
      .laneNumber(i[7:0]),
      .orderedset(orderedSets[(i*128)+127:i*128]),
      .valid(validOrderedSets),
      .substate(substate),
      .reset(resetOsCheckers[i]),
      .directed_speed_change(directed_speed_change),
      .detailedRecoverySubstates(detailedRecoverySubstates[i]),
      .gen(Gen),
      .countup(countUp[i]),
      .resetcounter(resetCounters[i]),
      .rateid(rateIds[(i*8)+7:i*8]),
      .linkNumberOut(linkNumbers[(i*8)+7:i*8]),
      .upconfigure_capability(upConfigurebits[i]),
      .RcvrCfgToidle(RcvrCfgToidle[i]),
      .ReceiverpresetHintDSPout(ReceiverpresetHintDSPout[(i*3)+2:i*3]),
      .TransmitterPresetHintDSPout(TransmitterPresetHintDSPout[(i*4)+3:i*4]),
      .ReceiverpresetHintUSPout(ReceiverpresetHintUSPout[(i*3)+2:i*3]),
      .TransmitterPresetHintUSPout(TransmitterPresetHintUSPout[(i*4)+3:i*4]),
      .ReceiverpresetHintDSP(ReceiverpresetHintDSP[(i*3)+2:i*3]),
      .TransmitterPresetHintDSP(TransmitterPresetHintDSP[(i*4)+3:i*4]),
      .ReceiverpresetHintUSP(ReceiverpresetHintUSP[(i*3)+2:i*3]),
      .TransmitterPresetHintUSP(TransmitterPresetHintUSP[(i*4)+3:i*4]),
      .FSDSP(FSDSP[(i*6)+5:i*6]),
      .LFDSP(LFDSP[(i*6)+5:i*6]),
      .CursorCoff(CursorCoff[(i*6)+5:i*6]),
      .PreCursorCoff(PreCursorCoff[(i*6)+5:i*6]),
      .PostCursorCoff(PostCursorCoff[(i*6)+5:i*6])
     );

     counter counter(
     resetCounters[i],
     clk,
     countUp[i],
     countersValues[(i*5)+4:i*5]);

     comparator comparator(
     countersValues[(i*5)+4:i*5],
     checkValues,
     comparisonValues[i]);

     
   end
endgenerate


masterRxLTSSM#(.DEVICETYPE(DEVICETYPE),.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH),.GEN2_PIPEWIDTH(GEN2_PIPEWIDTH),
.GEN3_PIPEWIDTH(GEN3_PIPEWIDTH),.GEN4_PIPEWIDTH(GEN4_PIPEWIDTH),.GEN5_PIPEWIDTH(GEN5_PIPEWIDTH)) 
masterRxLTSSM(
    .clk(clk),
    .numberOfDetectedLanes(numberOfDetectedLanes),
    .substate(substate),
    .countersComparators(comparisonValues),
    .rxElectricalIdle(rxElectricalIdle),
    .timeOut(timeOut),
    .reset(reset),
    .RcvrCfgToidle(RcvrCfgToidle),
    .detailedRecoverySubstates(detailedRecoverySubstates),
    .finish(finish),
    .exitTo(exitTo),
    .resetOsCheckers(resetOsCheckers),
    .lpifStatus(lpifStatus),
    .timeToWait(setTimer),
    .enableTimer(enableTimer),
    .startTimer(startTimer),
    .resetTimer(resetTimer),
    .comparatorsCount(checkValues),
    .trainToGen(trainToGen),
    .gen(Gen));
 
Timer #(
Width,
GEN1_PIPEWIDTH,	
GEN2_PIPEWIDTH,	
GEN3_PIPEWIDTH,	
GEN4_PIPEWIDTH,	
GEN5_PIPEWIDTH
)
timer
(
Gen,
resetTimer,
clk,
enableTimer,
startTimer,
setTimer,
timeOut
);

assign writerateid= (finish &&(exitTo == 4'd4|| exitTo == 4'd9))? 1'b1 : 1'b0;
assign witeUpconfigureCapability=(finish &&(exitTo == 4'd4|| exitTo == 4'd9))? 1'b1 : 1'b0;
assign writeLinkNumber = (finish && (exitTo == 4'd5) && DEVICETYPE)? 1'b1:1'b0;
assign {rateId,upConfigureCapability,linkNumberOut} = {rateIds[7:0],upConfigurebits[0],linkNumbers[7:0]};
assign {writeReceiverpresetHintDSP,writeTransmitterPresetHintDSP} = (DEVICETYPE&&substate ==4'd12&&finish&&exitTo == 4'd13)? 2'b11:2'b00;
assign {writeReceiverpresetHintUSP,writeTransmitterPresetHintUSP} = (!DEVICETYPE&&substate ==4'd12&&finish&&exitTo == 4'd13)? 2'b11:2'b00;

endmodule