module emadTB;


//rxltssm signals
reg clk;
reg reset;
wire [2047:0] orderedSets;
reg [4:0]numberOfDetectedLanes;
reg [3:0]substate;
reg [7:0]linkNumber;
reg forceDetect;
reg rxElectricalIdle;
wire validOrderedSets;
wire [7:0] rateid;
wire upConfigureCapability;
wire finish;
wire [3:0]exitTo;
wire linkUp;
wire witeUpconfigureCapability;
wire writerateid;
wire disableDescrambler;

// os decoder signals
reg [511:0]data;
reg validFromLMC;





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


/******************************************/

osDecoder os(
clk,
3'b001,
reset,
numberOfDetectedLanes,
data,
validFromLMC,
linkUp,
validOrderedSets,
orderedSets);

RxLTSSM #(0) rxltssm(
 clk,
 reset,
 orderedSets,
 numberOfDetectedLanes,
 substate,
 linkNumber,
 forceDetect,
 rxElectricalIdle,
 validOrderedSets,
 rateid,
 upConfigureCapability,
 finish,
 exitTo,
 linkUp,
 witeUpconfigureCapability,
 writerateid,
 disableDescrambler
);
initial
begin
clk = 0;
reset = 0;
#8
reset = 1;
substate = detectQuiet; //DETECET ELEC IDLE EXIT FROM THE OTHER DEVICE OR 12MS TIMEOUT
#10
rxElectricalIdle = 1'b1;
#10
substate = detectActive; //RX DOESN'T DO ANY THING SO IT WILL FINISH IMMEDIATELY
#20
reset = 1;
numberOfDetectedLanes = 5'd2;
substate = pollingActive;//8 CONSEC TS2 WITH LINK = PAD AND LANE = PAD
#10
validFromLMC = 1'b1; 	      
data = 128'h252525252525AAAAAAAAF7F7F7F7BCBC;
#10
data= 128'h25252525252525252525252525252525;
#10
data = 128'h252525252525AAAAAAAAF7F7F7F7BCBC;
#10
data= 128'h25252525252525252525252525252525;
#10
data = 128'h252525252525AAAAAAAAF7F7F7F7BCBC;
#10
data= 128'h25252525252525252525252525252525;
#10
data = 128'h252525252525AAAAAAAAF7F7F7F7BCBC;
#10
data= 128'h25252525252525252525252525252525;
#10
data = 128'h252525252525AAAAAAAAF7F7F7F7BCBC;
#10
data= 128'h25252525252525252525252525252525;
#10
data = 128'h252525252525AAAAAAAAF7F7F7F7BCBC;
#10
data= 128'h25252525252525252525252525252525;
#10
data = 128'h252525252525AAAAAAAAF7F7F7F7BCBC;
#10
data= 128'h25252525252525252525252525252525;
#10
data = 128'h252525252525AAAAAAAAF7F7F7F7BCBC;
#10
data= 128'h25252525252525252525252525252525;
#10
validFromLMC = 1'b0;
data = 512'b0;
/*
#110
substate = pollingConfiguration;//8 CONSEC TS2 WITH LINK = PAD AND LANE = PAD
#10
validOrderedSets = 1'b1;
orderedSets[127:0] =   128'h2525252525252525252525AAAAF7F7F7;
orderedSets[255:128] = 128'h2525252525252525252525AAAAF7F7F7;
#110
substate = configurationLinkWidthStart;//2 CONSEC TS1 WITH LINK = LINK# AND LANE = PAD
#10
linkNumber = 8'hBB;
orderedSets[127:0] =   128'h2A2A2A2A2A2A2A2A2A2A2AAAAAF7BBF7;
orderedSets[255:128] = 128'h2A2A2A2A2A2A2A2A2A2A2AAAAAF7BBF7;
#10
orderedSets[127:0] =   128'h2A2A2A2A2A2A2A2A2A2A2AAAAA000000;
orderedSets[255:128] = 128'h2A2A2A2A2A2A2A2A2A2A2AAAAA000000;
#20
orderedSets[127:0] =   128'h2A2A2A2A2A2A2A2A2A2A2AAAAAF7BBF7;
orderedSets[255:128] = 128'h2A2A2A2A2A2A2A2A2A2A2AAAAAF7BBF7;
#50
substate = configurationLanenumWait;//2 CONSEC TS1 WITH LINK = LINK# AND LANE = LANE#
#10
orderedSets[127:0] =   128'h2A2A2A2A2A2A2A2A2A2A2AAAAA00BBF7;
orderedSets[255:128] = 128'h2A2A2A2A2A2A2A2A2A2A2AAAAA01BBF7;
#50
substate = configurationLanenumAccept;//2 CONSEC TS1 WITH LINK = LINK# AND LANE = LANE#
#10
orderedSets[127:0] =   128'h2A2A2A2A2A2A2A2A2A2A2AAAAA00BBF7;
orderedSets[255:128] = 128'h2A2A2A2A2A2A2A2A2A2A2AAAAA01BBF7;
#50
substate = configurationComplete;//8 CONSEC TS2 WITH LINK = LINK# AND LANE = LANE#
#10
orderedSets[127:0] =   128'h252525252525252525252AAAAA00BBF7;
orderedSets[255:128] = 128'h252525252525252525252AAAAA01BBF7;
#110
substate = configurationIdle;//8 CONSEC TS2 WITH LINK = LINK# AND LANE = LANE#
#10
orderedSets[127:0] =   128'h00;
orderedSets[255:128] = 128'h00;
*/
end


always #5 clk = ~clk;
endmodule