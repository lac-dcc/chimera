
module osDecoder #(
parameter Width = 32,
parameter GEN1_PIPEWIDTH = 64 ,	
parameter GEN2_PIPEWIDTH = 8 ,	
parameter GEN3_PIPEWIDTH = 8 ,	
parameter GEN4_PIPEWIDTH = 8 ,	
parameter GEN5_PIPEWIDTH = 8 )
(
input clk,
input [2:0]gen,
input reset,
input [4:0]numberOfDetectedLanes,
input [511:0]data,
input validFromLMC,	
input linkUp,
input [4:0] substate,
input [2*16-1:0] syncHeader,
output reg valid,
output reg [2047:0]outOs);

reg [9:0]width;
reg [2047:0]orderedSets,orderedSetsnext,out;
reg [2:0]numberOfShifts;
reg found;
reg validnext;
reg [3:0] lane_iter;
reg [6:0] index_iter;
reg [11:0]capacity,capacitynext;
integer i,j;
parameter[7:0]
COM = 	8'b10111100, //BC
gen3TS1 = 8'h1E,
gen3TS2 = 8'h2D,
gen3SKIP =8'hAA,
gen3EIOS = 8'h66,
gen3EIEOSsymb1 = 8'h00,
gen3EIEOSsymb2 = 8'hFF, 
STP = 8'b11111011,
SDP = 8'b01011100,
SDS = 8'hE1;


localparam [4:0]
	detectQuiet =  5'd0,
	detectActive = 5'd1,
	pollingActive= 5'd2,
	pollingConfiguration= 5'd3,
	configurationLinkWidthStart = 5'd4,
	configurationLinkWidthAccept = 5'd5,
	configurationLanenumWait = 5'd6,
	configurationLanenumAccept = 5'd7,
	configurationComplete = 5'd8,
	configurationIdle = 5'd9,
	L0 = 5'd10,
	recoveryRcvrLock = 5'd11,
	recoveryRcvrCfg = 5'd12,
	recoverySpeed = 5'd13,
	phase0 = 5'd14,
	phase1 = 5'd15,
	phase2 = 5'd16,
	phase3 =5'd17,
	recoveryIdle = 5'd18,
	recoverySpeedeieos = 5'd19,
	recoverywait = 5'd20;



parameter [175:0] lanesOffsets ={11'd1920,11'd1792,11'd1664,11'd1536,11'd1408,11'd1280,11'd1152
,11'd1024,11'd896,11'd768,11'd640,11'd512,11'd384,11'd256,11'd128,11'd0};
always@(posedge clk or negedge reset)
begin
if(!reset)
begin
orderedSets <=2048'b0;
capacity<=12'd0;
lane_iter <= 4'd0;
index_iter <= 7'd0;
valid<=1'b0;
end
else
begin
	capacity <= capacitynext;
	orderedSets<=orderedSetsnext;
	valid <= validnext;
end
end
always@(*)
begin
validnext=1'b0;
found = 1'b0;
if(validFromLMC)
begin
		if(substate==5'd9 || substate==5'd18){out,valid} = {data,1'b1};
		else
		begin


			if (substate == recoverySpeedeieos) begin
				for(i=0;i<=504;i=i+8)
				begin	
				if(substate == recoverySpeedeieos&&syncHeader == {8{4'hA}}&&data[i+:8]==gen3EIEOSsymb1&&!found)
				begin
				found = 1'b1;
				if((substate !=recoverySpeed && capacity+i>= 128<<numberOfShifts)
					||(substate==recoverySpeed&&gen<3'd3&&capacity+i >= 32<<numberOfShifts))
				begin
				validnext = 1'b1;
				out = orderedSets|(data)<<capacity;
				end
				orderedSetsnext = data>>i;
				capacitynext = width-i;
				end

				end
				
			end
			else 
			begin
				for(i=504;i>=0;i=i-8)
				begin	
				if((data[i+:8]==COM||data[i+:8]==gen3TS1||data[i+:8]==gen3TS2||data[i+:8]==gen3SKIP||
					data[i+:8]==gen3EIOS) && !found)
				begin
				found = 1'b1;
				if((substate !=recoverySpeed && capacity+i-((numberOfDetectedLanes-1)<<3) >= 128<<numberOfShifts)
					||(substate==recoverySpeed&&gen<3'd3&&capacity+i-((numberOfDetectedLanes-1)<<3) >= 32<<numberOfShifts))
				begin
				validnext = 1'b1;
				out = orderedSets|(data)<<capacity;
				end
				orderedSetsnext = data>>i-((numberOfDetectedLanes-1)<<3);
				capacitynext = width-i+((numberOfDetectedLanes-1)<<3);
				end

				end
			end
			
			if(!found)
			begin
				orderedSetsnext = orderedSets|((2048'b0|data) << capacity);
				capacitynext = capacity + width;
				if((substate==recoverySpeed&&gen<3'd3&&capacity>= (32<<numberOfShifts))
				||(substate !=recoverySpeed && capacity>= (128<<numberOfShifts)))
				begin
				validnext = 1'b1;
				out = orderedSets;
				capacitynext=12'd0;
				end
			end
		end
end
end

always@(*)
begin
case(numberOfDetectedLanes)
5'd1:numberOfShifts = 3'd0;
5'd2:numberOfShifts = 3'd1;
5'd4:numberOfShifts = 3'd2;
5'd8:numberOfShifts = 3'd3;
5'd16:numberOfShifts= 3'd4;
endcase
end


always@(*)
begin
case (gen)
3'b001 : width = GEN1_PIPEWIDTH<<(numberOfShifts);
3'b010 : width = GEN2_PIPEWIDTH<<(numberOfShifts);
3'b011 : width = GEN3_PIPEWIDTH<<(numberOfShifts);
3'b100 : width = GEN4_PIPEWIDTH<<(numberOfShifts);
3'b101 : width = GEN5_PIPEWIDTH<<(numberOfShifts);
endcase
end

always@(out)
begin

	for(j = 0;j<128<<numberOfShifts;j=j+8)
	begin
	outOs[(lanesOffsets[11*lane_iter +: 11]+index_iter)+:8] = out[j+:8];
	if(lane_iter==numberOfDetectedLanes-1)
	begin
	lane_iter = 4'd0;
	index_iter = index_iter + 8; 
	end
	else lane_iter = lane_iter + 1'b1;
	end
	
end
endmodule








module osDecoderTB;
reg clk;
reg reset;
reg [4:0]numberOfDetectedLanes;
reg [511:0]data;
reg validFromLMC;
reg linkUp;
wire valid;
wire [2047:0]outOs;
osDecoder os(
clk,
3'b001,
reset,
numberOfDetectedLanes,
data,
validFromLMC,
linkUp,
valid,
outOs);

initial
begin
clk = 0;
reset = 0;
validFromLMC = 1'b1;
numberOfDetectedLanes = 5'd2;
#8
reset = 1;
#10
data = 512'hAABBAABBBCBC00000000000000000000;
#10
data = 512'hAABBAABBAABBAABBAABBAABBAABBAABB;
#10
data = 512'h000000000000AABBAABBAABBAABBAABB;
#10
data = 512'd0;
#10
validFromLMC=1'b0;
end
always #5 clk = ~clk;
endmodule