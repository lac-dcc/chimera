module tb;
    reg clk;
    reg linkNumber;
    reg laneNumber;
    reg [127:0]orderedset;
    reg valid;
    reg [3:0]substate;
    reg reset;
    wire countup;
    wire resetcounter;
    wire [7:0] rateid;
    wire upconfigure_capability;
wire[4:0]currentState,nextState;
wire [7:0]link,lane,id;
wire[7:0]currentcount;
 localparam [7:0]
    PAD = 8'b11110111, //F7
    TS1 = 8'b00101010,	//2A
    TS2 = 8'b00100101;  //25

localparam [3:0]
	detectQuiet =  3'd0,
	detectActive = 3'd1,
	pollingActive= 3'd2,
	pollingConfiguration= 3'd3,
    configurationLinkWidthStart = 3'd4,
    configurationLinkWidthAccept = 3'd5,
    configurationLanenumWait = 3'd6,
    configurationLanenumAccept = 3'd7,
    configurationComplete = 3'd8,
    configurationIdle = 3'd9;

os_checker #(0) test(clk,
    linkNumber,
    laneNumber,
    orderedset,
    valid,
    substate,
    reset,
    countup,
    resetcounter,
    rateid,
    upconfigure_capability,currentState,nextState,link,lane,id);
counter #(8)Counter(resetcounter,clk,countup,currentcount);

initial
begin
clk = 0;
reset = 0;
#12
reset = 1;
substate = pollingActive;
#10
valid = 1'b1;
orderedset = 128'h25252525252525AAAAF7F7F7; //counter = 1
#10
orderedset = 128'h25252525252525AAAAF7F7F7; //counter = 2
#10
orderedset = 128'h25252525252525AAAAF7F7F7; //counter = 3
#10
orderedset = 128'h25252525252525AAAAAAAAAA; //counter = 0
#10
orderedset = 128'h25252525252525AAAAF7F7F7; //counter = 1
#10
orderedset = 128'h25252525252525AAAAF7F7F7; //counter = 2
#10
reset = 0;
#10
valid = 0;
reset = 1;
substate = pollingConfiguration;
#10
valid = 1'b1;
orderedset = 128'h25252525252525AAAAF7F7F7; //counter = 1
#10
orderedset = 128'h25252525252525AAAAF7F7F7; //counter = 2
#10
orderedset = 128'h25252525252525AAAAF7F7F7; //counter = 3
#10
orderedset = 128'h25252525252525AAAAAAAAAA; //counter = 0
#10
orderedset = 128'h25252525252525AAAAF7F7F7; //counter = 1
#10
orderedset = 128'h25252525252525AAAAF7F7F7; //counter = 2
#10
reset = 0;

#10
valid = 0;
reset = 1;
substate = configurationLinkWidthStart;
linkNumber = 1;
#10
valid = 1'b1;
orderedset = 128'h2A2A2A2A2A2A2AAAAAF701F7; //counter = 1
#10
orderedset = 128'h2A2A2A2A2A2A2AAAAAF701F7; //counter = 2
#10
orderedset = 128'h2A2A2A2A2A2A2AAAAAF701F7; //counter = 3
#10
orderedset = 128'h25252525252525AAAAAAAAAA; //counter = 0
#10
orderedset = 128'h2A2A2A2A2A2A2AAAAAF701F7; //counter = 1
#10
orderedset = 128'h2A2A2A2A2A2A2AAAAAF701F7; //counter = 2
#10
reset = 0;

end


always #5 clk = ~clk;
endmodule
