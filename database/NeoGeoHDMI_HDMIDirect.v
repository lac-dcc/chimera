// Charlie Cole 2015
// HDMI output for Neo Geo MVS
//   Originally based on fpga4fun.com HDMI/DVI sample code (c) fpga4fun.com & KNJN LLC 2013
//   Added Neo Geo MVS input, scan doubling, HDMI data packets and audio
//   Offers fake scanline generation (select via button)
//		0: Line doubled but even lines are half brightness
//		1: Only show even lines (odd lines are black)
//		2: Line doubled

module HDMIDirectV(
	input pixclk,
	input pixclk72,
	input pixclk144,
	input [16:0] videobus,
	input [4:0] Rin, Gin, Bin,
	input dak, sha,
	input button,
	input sync,
	input audioLR,
	input audioClk,
	input audioData,
	input audioLR2,
	input [7:0] fontData,
	output [2:0] TMDSp, TMDSn,
	output TMDSp_clock, TMDSn_clock,
	output [11:0] videoaddressw,
	output videoramenable,
	output videoramclk,
	output videoramoutclk,
	output videowrite,
	output [11:0] videoaddressoutw,
	output [16:0] videobusoutw,
	output neogeoclk,
	output [10:0] fontAddress,
	output fontROMClock
);

////////////////////////////////////////////////////////////////////////
// User configuration defines

`define OLD_SYNC	// Comment out if have NeoGeo that clears at end of line
`define YM3016		// Comment out for BU9480F (chip found on newer boards)
`define SPLASH_SCREEN
`define BAD_SYNC_DETECT
`define DELAY_UNTIL_SPLASH_SCREEN	240	// In frames (/60 for seconds)

////////////////////////////////////////////////////////////////////////

// Defines to do with video signal generation
`define DISPLAY_WIDTH			720
`define DISPLAY_HEIGHT			480
`define FULL_WIDTH				858
`define FULL_HEIGHT				525
`define H_FRONT_PORCH			16
`define H_SYNC						62 
`define V_FRONT_PORCH			9
`define V_SYNC 					6

`define NEOGEO_DISPLAY_WIDTH	640
`define NEOGEO_DISPLAY_HEIGHT	448
`define NEOGEO_FULL_WIDTH		768
`define NEOGEO_FULL_HEIGHT		528
`ifdef OLD_SYNC
	`define NEOGEO_VSYNC_LENGTH	81
`else
	`define NEOGEO_VSYNC_LENGTH	80
`endif

`define CENTERING_X				((`DISPLAY_WIDTH-`NEOGEO_DISPLAY_WIDTH)/2)	// For centering NeoGeo's 4:3 screen
`define CENTERING_Y				((`DISPLAY_HEIGHT-`NEOGEO_DISPLAY_HEIGHT)/2)	// Should be multiple of 8

// Defines to do with data packet sending
`define DATA_START		(`DISPLAY_WIDTH+4) // Need 4 cycles of control data first
`define DATA_PREAMBLE	8
`define DATA_GUARDBAND	2
`define DATA_SIZE			32
`define VIDEO_PREAMBLE	8
`define VIDEO_GUARDBAND	2
`define CTL_END			(`FULL_WIDTH-`VIDEO_PREAMBLE-`VIDEO_GUARDBAND)

wire clk_TMDS = pixclk72;

////////////////////////////////////////////////////////////////////////
// Neo Geo Clk Gen
////////////////////////////////////////////////////////////////////////

reg [10:0] fraction;
reg [3:0] neoGeoClks;

initial
begin
	neoGeoClks=0;
	fraction=0;
end

wire x10clk = pixclk72^pixclk144; // These clocks are 2 135MHz clocks 90 degrees apart so this makes a 270MHz clock
reg latch, nlatch;

always @(posedge x10clk)
begin
	// To make the timings work we want a neo geo cycle every 11+(111/1024) 270MHz cycles
	// Keep track of fractional part and when overflows do a longer cycle to bring us back
	if (neoGeoClks==0) begin
		nlatch<=latch;
	end
	if (neoGeoClks==10) begin
		neoGeoClks<=(fraction<1024)?0:15;
		fraction<=(fraction&1023)+111;
	end else begin
		neoGeoClks<=neoGeoClks+1;
	end
end

assign risingEdge=(neoGeoClks==6 && !x10clk);

always @(posedge risingEdge)
begin
	latch<=!nlatch;
end

assign neogeoclk=latch^nlatch;

////////////////////////////////////////////////////////////////////////
// Line doubler
// Takes the 480i video data from the NeoGeo and doubles the line
// frequency by storing a line in RAM and then displaying it twice.
// Also takes care of centring the picture (using the sync input).
////////////////////////////////////////////////////////////////////////

reg [7:0] redneo, greenneo, blueneo;
reg [9:0] CounterX, CounterY;
reg [9:0] NeoCounterX, NeoCounterY;
reg [11:0] videoaddress;
reg [11:0] videoaddressout;
reg [16:0] videobusout;
reg [1:0] scanlineType;
reg [8:0] frames;
reg [23:0] syncWait;
reg bOverlay;
reg hSync, vSync, DrawArea;

initial
begin
	redneo=0;
	greenneo=0;
	blueneo=0;
	CounterX=0;
	CounterY=0;
	videoaddress=0;
	videoaddressout=0;
	videobusout=0;
	scanlineType=0;
	hSync=0;
	vSync=0;
	DrawArea=0;
	frames=0;
	syncWait=0;
	bOverlay=0;
	
	NeoCounterX=0;
	NeoCounterY=0;
end

assign videoramenable=1'b1;
assign videoramclk=!clk_TMDS;
assign videoramoutclk=!clk_TMDS;
assign videowrite=1'b1;
assign videoaddressoutw=videoaddressout;
assign videobusoutw=videobusout;
assign videoaddressw=videoaddress;

always @(posedge pixclk) DrawArea <= (CounterX<`DISPLAY_WIDTH) && (CounterY<`DISPLAY_HEIGHT);
always @(posedge pixclk) hSync <= !((CounterX>=(`DISPLAY_WIDTH+`H_FRONT_PORCH)) && (CounterX<(`DISPLAY_WIDTH+`H_FRONT_PORCH+`H_SYNC)));
always @(posedge pixclk) vSync <= !((
	(CounterY==(`DISPLAY_HEIGHT+`V_FRONT_PORCH-1) && CounterX>=(`DISPLAY_WIDTH+`H_FRONT_PORCH)) ||
	CounterY>=(`DISPLAY_HEIGHT+`V_FRONT_PORCH))
 && (
	(CounterY==(`DISPLAY_HEIGHT+`V_FRONT_PORCH+`V_SYNC-1) && CounterX<(`DISPLAY_WIDTH+`H_FRONT_PORCH)) ||
	CounterY<(`DISPLAY_HEIGHT+`V_FRONT_PORCH+`V_SYNC-1)
 )); // VSync and HSync seem to need to transition at the same time

`ifdef OLD_SYNC
always @(posedge neogeoclk)
`else
always @(negedge neogeoclk)
`endif
begin
	NeoCounterX <= (NeoCounterX==(`NEOGEO_FULL_WIDTH-1)) ? 0 : NeoCounterX+1;
	if(NeoCounterX==(`NEOGEO_FULL_WIDTH-1)) begin
		if (NeoCounterY==(`NEOGEO_FULL_HEIGHT-1)) begin
			NeoCounterY <= 0;
		end else begin
			NeoCounterY <= NeoCounterY+1;
		end
	end
	if (sync) begin
`ifdef OLD_SYNC
		if (NeoCounterY > `NEOGEO_FULL_HEIGHT-`NEOGEO_VSYNC_LENGTH) begin
			NeoCounterY <= `NEOGEO_FULL_HEIGHT-`NEOGEO_VSYNC_LENGTH+1;
			NeoCounterX <= 0;
		end
`else
		if (NeoCounterY > `NEOGEO_FULL_HEIGHT-`NEOGEO_VSYNC_LENGTH)
			NeoCounterY <= `NEOGEO_FULL_HEIGHT-`NEOGEO_VSYNC_LENGTH+1;
		if ((NeoCounterX>>1)+(NeoCounterY[0]?`NEOGEO_FULL_WIDTH/2:0)>=`NEOGEO_DISPLAY_WIDTH)
			NeoCounterX <= 2*`NEOGEO_DISPLAY_WIDTH-`NEOGEO_FULL_WIDTH;
`endif
	end
	if ((NeoCounterX>>1)+(NeoCounterY[0]?`NEOGEO_FULL_WIDTH/2:0)<`NEOGEO_DISPLAY_WIDTH) begin
		if (NeoCounterX[0]) begin
			videoaddressout<=(NeoCounterY[2:1]*`NEOGEO_DISPLAY_WIDTH)+(NeoCounterY[0]?`NEOGEO_FULL_WIDTH/2:0)+(NeoCounterX>>1);
			videobusout[4:0]<=Rin;
			videobusout[9:5]<=Gin;
			videobusout[14:10]<=Bin;
			videobusout[15]<=!dak;
			videobusout[16]<=!sha;
		end
	end
end
	
always @(posedge pixclk)
begin
	if(CounterX==(`FULL_WIDTH-1)) begin
		if (CounterY==(`FULL_HEIGHT-1)) begin
			// Sync screen output with NeoGeo output
			// +2 means there's a line in the doubler ready
			if (NeoCounterY==(`NEOGEO_FULL_HEIGHT-`CENTERING_Y+2) && NeoCounterX==0) begin
				syncWait <= 0;
				bOverlay <= 0;
				CounterY <= 0;
				CounterX <= 0;
				if (frames!=`DELAY_UNTIL_SPLASH_SCREEN)
					frames <= frames + 1;
			end
`ifdef BAD_SYNC_DETECT
			else if (syncWait==24'hFFFFFF) begin // If not synced within half a second then display error
				bOverlay <= 1;
				CounterY <= 0;
				CounterX <= 0;
				if (frames!=`DELAY_UNTIL_SPLASH_SCREEN)
					frames <= frames + 1;
			end else begin
				syncWait <= syncWait + 1;
			end
`endif
		end else begin
			CounterY <= CounterY+1;
			CounterX <= 0;
		end
	end else begin
		CounterX<=CounterX+1;
	end
	videoaddress<=(CounterY[2:1]*`NEOGEO_DISPLAY_WIDTH) + (CounterX+2-`CENTERING_X); // Look ahead two pixels
	if (CounterX>=`CENTERING_X && CounterX<`DISPLAY_WIDTH+`CENTERING_X) begin
		if ((CounterX-`CENTERING_X)<`NEOGEO_DISPLAY_WIDTH) begin
			if (scanlineType==2 || !(CounterY&1)) begin
				redneo <= ((videobus[4:0]<<1)|videobus[15])*3 + (videobus[16]?((videobus[4:0]<<1)|videobus[15]):0);
				greenneo <= ((videobus[9:5]<<1)|videobus[15])*3 + (videobus[16]?((videobus[9:5]<<1)|videobus[15]):0);
				blueneo <= ((videobus[14:10]<<1)|videobus[15])*3 + (videobus[16]?((videobus[14:10]<<1)|videobus[15]):0);
			end else begin
				if (!scanlineType[0]) begin
					redneo <= (((videobus[4:0]<<1)|videobus[15])*3 + (videobus[16]?((videobus[4:0]<<1)|videobus[15]):0)) >> 1;
					greenneo <= (((videobus[9:5]<<1)|videobus[15])*3 + (videobus[16]?((videobus[9:5]<<1)|videobus[15]):0)) >> 1;
					blueneo <= (((videobus[14:10]<<1)|videobus[15])*3 + (videobus[16]?((videobus[14:10]<<1)|videobus[15]):0)) >> 1;
				end else begin
					redneo <= 0;
					greenneo <= 0;
					blueneo <= 0;
				end
			end
		end else begin
			redneo <= 0;
			greenneo <= 0;
			blueneo <= 0;			
		end
	end
end

////////////////////////////////////////////////////////////////////////
// Error overlay
////////////////////////////////////////////////////////////////////////

reg [7:0] red, green, blue;
reg [10:0] fontAddr;
reg [7:0] scroll;
reg [6:0] logo;
reg [7:0] ba;
reg [9:0] dx;
reg [9:0] dx2;
reg [9:0] dy;
reg [15:0] d;
reg [15:0] dd;
reg [15:0] dd2;
reg [7:0] ax;
reg [8:0] num [7:0];
reg [8:0] den [7:0];
reg [8:0] res [7:0];
reg [9:0] s;
reg [19:0] cc; 
reg [1:0] lastScanlineType;
reg [7:0] scanlineChanged;
reg shadow;

initial
begin
	red=0;
	green=0;
	blue=0;
	fontAddr=0;
	scroll=0;
	logo=0;
	s=0;
	cc=0;
	lastScanlineType=0;
	scanlineChanged=0;
	shadow=0;
end

assign fontROMClock = pixclk;
assign fontAddress = fontAddr;

function [9:0] abs;
	input [9:0] v;
	begin
		abs=($signed(v)<0)?-v:v;
	end
endfunction

always @(posedge pixclk)
begin
`ifdef SPLASH_SCREEN
	if (logo!=127) begin
		// Splash screen rendering
		dx<=(CounterX+9-`DISPLAY_WIDTH/2);	// divide is latent so look ahead
		dx2<=(CounterX-`DISPLAY_WIDTH/2);
		dy<=(CounterY-`DISPLAY_HEIGHT/2);
		// Calulate distance from centre
		dd<=(((`DISPLAY_WIDTH*`DISPLAY_WIDTH/8)-($signed(dx2)*$signed(dx2)+$signed(dy)*$signed(dy)))>>8)
			-((logo<32)?8*(32-logo):0)+((logo>96)?32*(logo-96):0);
		// atan approximation
		if (abs(dx)<abs(dy)) begin
			num[0]<=abs(dx);
			den[0]<=abs(dy);
			s<=(s<<1)|(dx[9]^dy[9]);
			cc<=(cc<<2)|(($signed(dy)>0)?3:1);
		end else begin
			num[0]<=abs(dy);
			den[0]<=abs(dx);
			s<=(s<<1)|(dx[9]^dy[9]^1);
			cc<=(cc<<2)|(($signed(dx)<0)?2:0);
		end
		// 8 cycle latency divide
		if (num[0]>=den[0]) begin num[1]<=num[0]-den[0]; res[0]<=      +128; end else begin num[1]<=num[0]; res[0]<=0;      end den[1]<=den[0]>>1;
		if (num[1]>=den[1]) begin num[2]<=num[1]-den[1]; res[1]<=res[0]+ 64; end else begin num[2]<=num[1]; res[1]<=res[0]; end den[2]<=den[1]>>1;
		if (num[2]>=den[2]) begin num[3]<=num[2]-den[2]; res[2]<=res[1]+ 32; end else begin num[3]<=num[2]; res[2]<=res[1]; end den[3]<=den[2]>>1;
		if (num[3]>=den[3]) begin num[4]<=num[3]-den[3]; res[3]<=res[2]+ 16; end else begin num[4]<=num[3]; res[3]<=res[2]; end den[4]<=den[3]>>1;
		if (num[4]>=den[4]) begin num[5]<=num[4]-den[4]; res[4]<=res[3]+  8; end else begin num[5]<=num[4]; res[4]<=res[3]; end den[5]<=den[4]>>1;
		if (num[5]>=den[5]) begin num[6]<=num[5]-den[5]; res[5]<=res[4]+  4; end else begin num[6]<=num[5]; res[5]<=res[4]; end den[6]<=den[5]>>1;
		if (num[6]>=den[6]) begin num[7]<=num[6]-den[6]; res[6]<=res[5]+  2; end else begin num[7]<=num[6]; res[6]<=res[5]; end den[7]<=den[6]>>1;
		if (num[7]>=den[7]) begin                        res[7]<=res[6]+  1; end else begin                 res[7]<=res[6]; end
		ax<=(((s[9]?-res[7]:res[7])+(2*cc[19:18]+1)*128+logo*4)>>2)&'hFF;
		// Look up texture maps
		if (CounterX>=`DISPLAY_WIDTH/2-64 && CounterX<=`DISPLAY_WIDTH/2+64 && CounterY>=`DISPLAY_HEIGHT-16 && CounterY<`DISPLAY_HEIGHT-8) begin
			// Display the link
			fontAddr<=3*256+CounterX-(`DISPLAY_WIDTH/2-64);
			if (CounterX>`DISPLAY_WIDTH/2-64+2 && logo>32)
				ba<=fontData[CounterY-(`DISPLAY_HEIGHT-16)]?((logo<96)?(logo-32)>>1:32):0;
			else
				ba<=0;
		end else begin
			// Logo
			fontAddr<=(3*(255-ax))+((dd-128)>>5);
			ba<=0;
		end
		dd2<=dd;
		d<=dd2;
		// Output
		if ($signed(d)>=256) begin
			red <= redneo;
			green <= greenneo;
			blue <= blueneo;	
		end else begin
			if (CounterX>3 && $signed(d)>=0 && (d<128 || d>=224 || !fontData[(d>>2)&7])) begin
				red<=(ba+d<255)?ba+d:255;
				green<=(d*d)>>8;
				blue<=0;		
			end else begin
				red<=0;
				green<=0;
				blue<=0;
			end
		end
		if (frames==`DELAY_UNTIL_SPLASH_SCREEN && CounterX==0 && CounterY==0)
			logo<=logo+1;
	end else
`endif
	if (bOverlay && CounterY>=`DISPLAY_HEIGHT/2-8 && CounterY<`DISPLAY_HEIGHT/2+8) begin
		// Scrolling error message
		red <= 0;
		fontAddr<=3*256+(((CounterX>>1)+scroll)&'hFF);
		if (CounterX>3)
			green <= fontData[(CounterY-(`DISPLAY_HEIGHT/2-8))>>1]?255:0;
		else
			green <= 0;
		blue <= 0;
	end else if (scanlineChanged>0 && CounterX>=`DISPLAY_WIDTH-154 && CounterY>=`DISPLAY_HEIGHT-16) begin
		// Display scanline mode
		fontAddr<=(4*256)+(scanlineType*75)+((CounterX-(`DISPLAY_WIDTH-154))>>1);
		shadow<=fontData[(CounterY-(`DISPLAY_HEIGHT-16))>>1];
		if (CounterX>=`DISPLAY_WIDTH-150 && fontData[(CounterY-(`DISPLAY_HEIGHT-16))>>1]|shadow) begin
			if (shadow) begin
				if (scanlineType==2 || !(CounterY&1))
					green <= 255;
				else if (scanlineType==0)
					green <= 127;
				else
					green <= 0;
			end else begin
				green <=0;
			end
			red<=0;
			blue<=0;
		end else begin
			red <= redneo;
			green <= greenneo;
			blue <= blueneo;
		end
	end else begin
		// normal output
		red <= redneo;
		green <= greenneo;
		blue <= blueneo;
	end
	if (CounterX==0 && CounterY==0) begin
		scroll<=scroll+1;
		if (scanlineChanged>0)
			scanlineChanged <= scanlineChanged - 1;
		if (scanlineType!=lastScanlineType) begin
			lastScanlineType <= scanlineType;
			scanlineChanged <= 60;
		end
	end
end

////////////////////////////////////////////////////////////////////////
// Neo Geo audio input
////////////////////////////////////////////////////////////////////////

reg [15:0] audioInput [1:0];
reg [15:0] curSampleL;
reg [15:0] curSampleR;

initial
begin
	audioInput[0]=0;
	audioInput[1]=0;
	curSampleL=0;
	curSampleR=0;
end

`ifdef YM3016
always @(negedge audioClk)
begin
	audioInput[0]<=(audioInput[0]>>1)|(audioData<<15);
	audioInput[1]<=(audioInput[1]>>1)|(audioData<<15);
end
always @(negedge audioLR)  begin curSampleL<=audioInput[0]-16'h8000; end
always @(negedge audioLR2) begin curSampleR<=audioInput[1]-16'h8000; end
`else // BU9480F
always @(posedge audioClk) if (audioLR) audioInput[0]<=(audioInput[0]<<1)|audioData; else audioInput[1]<=(audioInput[1]<<1)|audioData;
always @(negedge audioLR) begin curSampleL<=audioInput[0]; curSampleR<=audioInput[1]; end
`endif

////////////////////////////////////////////////////////////////////////
// HDMI audio packet generator
////////////////////////////////////////////////////////////////////////

// Timing for 32KHz audio at 27MHz
`define AUDIO_TIMER_ADDITION	4
`define AUDIO_TIMER_LIMIT		3375

localparam [191:0] channelStatus = 192'hc203004004; // 32KHz 16-bit LPCM audio
reg [23:0] audioPacketHeader;
reg [55:0] audioSubPacket[3:0];
reg [7:0] channelStatusIdx;
reg [11:0] audioTimer;
reg [9:0] audioSamples;
reg [1:0] samplesHead;
reg sendRegenPacket;

initial
begin
	audioPacketHeader=0;
	audioSubPacket[0]=0;
	audioSubPacket[1]=0;
	audioSubPacket[2]=0;
	audioSubPacket[3]=0;
	channelStatusIdx=0;
	audioTimer=0;
	audioSamples=0;
	samplesHead=0;
	sendRegenPacket=0;
end

task AudioPacketGeneration;
	begin
		// Buffer up an audio sample every 750 pixel clocks (32KHz output from 24MHz pixel clock)
		// Don't add to the audio output if we're currently sending that packet though
		if (!(
			CounterX>=(`DATA_START+`DATA_PREAMBLE+`DATA_GUARDBAND+`DATA_SIZE) &&
			CounterX<(`DATA_START+`DATA_PREAMBLE+`DATA_GUARDBAND+`DATA_SIZE+`DATA_SIZE)
		)) begin
			if (audioTimer>=`AUDIO_TIMER_LIMIT) begin
				audioTimer<=audioTimer-`AUDIO_TIMER_LIMIT+`AUDIO_TIMER_ADDITION;
				audioPacketHeader<=audioPacketHeader|24'h000002|((channelStatusIdx==0?24'h100100:24'h000100)<<samplesHead);
				audioSubPacket[samplesHead]<=((curSampleL<<8)|(curSampleR<<32)
									|((^curSampleL)?56'h08000000000000:56'h0)		// parity bit for left channel
									|((^curSampleR)?56'h80000000000000:56'h0))	// parity bit for right channel
									^(channelStatus[channelStatusIdx]?56'hCC000000000000:56'h0); // And channel status bit and adjust parity
				if (channelStatusIdx<191)
					channelStatusIdx<=channelStatusIdx+1;
				else
					channelStatusIdx<=0;
				samplesHead<=samplesHead+1;
				audioSamples<=audioSamples+1;
				if (audioSamples[4:0]==0)
					sendRegenPacket<=1;
			end else begin
				audioTimer<=audioTimer+`AUDIO_TIMER_ADDITION;
			end
		end else begin
			audioTimer<=audioTimer+`AUDIO_TIMER_ADDITION;
			samplesHead<=0;
		end
	end
endtask

////////////////////////////////////////////////////////////////////////
// Error correction code generator
// Generates error correction codes needed for verifying HDMI packets
////////////////////////////////////////////////////////////////////////

function [7:0] ECCcode;	// Cycles the error code generator
	input [7:0] code;
	input bita;
	input passthroughData;
	begin
		ECCcode = (code<<1) ^ (((code[7]^bita) && passthroughData)?(1+(1<<6)+(1<<7)):0);
	end
endfunction

task ECCu;
	output outbit;
	inout [7:0] code;
	input bita;
	input passthroughData;
	begin
		outbit <= passthroughData?bita:code[7];
		code <= ECCcode(code, bita, passthroughData);
	end
endtask

task ECC2u;
	output outbita;
	output outbitb;
	inout [7:0] code;
	input bita;
	input bitb;
	input passthroughData;
	begin
		outbita <= passthroughData?bita:code[7];
		outbitb <= passthroughData?bitb:(code[6]^(((code[7]^bita) && passthroughData)?1'b1:1'b0));
		code <= ECCcode(ECCcode(code, bita, passthroughData), bitb, passthroughData);
	end
endtask

////////////////////////////////////////////////////////////////////////
// Packet sending
// During hsync periods send audio data and infoframe data packets
////////////////////////////////////////////////////////////////////////

reg [3:0] dataChannel0;
reg [3:0] dataChannel1;
reg [3:0] dataChannel2;
reg [23:0] packetHeader;
reg [55:0] subpacket[3:0];
reg [7:0] bchHdr;
reg [7:0] bchCode [3:0];
reg [4:0] dataOffset;
reg [3:0] preamble;
reg tercData;
reg dataGuardBand;
reg videoGuardBand;

initial
begin
	dataChannel0=0;
	dataChannel1=0;
	dataChannel2=0;
	packetHeader=0;
	subpacket[0]=0;
	subpacket[1]=0;
	subpacket[2]=0;
	subpacket[3]=0;
	bchHdr=0;
	bchCode[0]=0;
	bchCode[1]=0;
	bchCode[2]=0;
	bchCode[3]=0;
	dataOffset=0;
	preamble=0;
	tercData=0;
	dataGuardBand=0;
	videoGuardBand=0;
end

task SendPacket;
	inout [32:0] pckHeader;
	inout [55:0] pckData0;
	inout [55:0] pckData1;
	inout [55:0] pckData2;
	inout [55:0] pckData3;
	input firstPacket;
begin
	dataChannel0[0]=hSync;
	dataChannel0[1]=vSync;
	dataChannel0[3]=(!firstPacket || dataOffset)?1'b1:1'b0;
	ECCu(dataChannel0[2], bchHdr, pckHeader[0], dataOffset<24?1'b1:1'b0);
	ECC2u(dataChannel1[0], dataChannel2[0], bchCode[0], pckData0[0], pckData0[1], dataOffset<28?1'b1:1'b0);
	ECC2u(dataChannel1[1], dataChannel2[1], bchCode[1], pckData1[0], pckData1[1], dataOffset<28?1'b1:1'b0);
	ECC2u(dataChannel1[2], dataChannel2[2], bchCode[2], pckData2[0], pckData2[1], dataOffset<28?1'b1:1'b0);
	ECC2u(dataChannel1[3], dataChannel2[3], bchCode[3], pckData3[0], pckData3[1], dataOffset<28?1'b1:1'b0);
	pckHeader<=pckHeader[23:1];
	pckData0<=pckData0[55:2];
	pckData1<=pckData1[55:2];
	pckData2<=pckData2[55:2];
	pckData3<=pckData3[55:2];
	dataOffset<=dataOffset+5'b1;
end
endtask

always @(posedge pixclk)
begin
	AudioPacketGeneration();
	// Start sending audio data if we're in the right part of the hsync period
	if (CounterX>=`DATA_START)
	begin
		if (CounterX<(`DATA_START+`DATA_PREAMBLE))
		begin
			// Send the data period preamble
			// A nice "feature" of my test monitor (GL2450) is if you comment out
			// this line you see your data next to your image which is useful for
			// debugging
			preamble<='b0101;
		end
		else if (CounterX<(`DATA_START+`DATA_PREAMBLE+`DATA_GUARDBAND))
		begin
			// Start sending leading data guard band
			tercData<=1;
			dataGuardBand<=1;
			dataChannel0<={1'b1, 1'b1, vSync, hSync};
			preamble<=0;
			// Set up the first of the packets we'll send
			if (sendRegenPacket) begin
				packetHeader<=24'h000001;	// audio clock regeneration packet
				subpacket[0]<=56'h00100078690000;	// N=0x1000 CTS=0x6978 (27MHz pixel clock -> 32KHz audio clock)
				subpacket[1]<=56'h00100078690000;
				subpacket[2]<=56'h00100078690000;
				subpacket[3]<=56'h00100078690000;
				if (CounterX==(`DATA_START+`DATA_PREAMBLE+`DATA_GUARDBAND-1))
					sendRegenPacket<=0;
			end else begin
				if (!CounterY[0]) begin
					packetHeader<=24'h0D0282;	// infoframe AVI packet
					// Byte0: Checksum
					// Byte1: 10 = 0(Y1:Y0=0 RGB)(A0=1 No active format)(B1:B0=00 No bar info)(S1:S0=00 No scan info)
					// Byte2: 2A = (C1:C0=0 No colorimetry)(M1:M0=2 16:9)(R3:R0=A 16:9)
					// Byte3: 00 = 0(SC1:SC0=0 No scaling)
					// Byte4: 03 = 0(VIC6:VIC0=3 720x480p)
					// Byte5: 00 = 0(PR5:PR0=0 No repeation)
					subpacket[0]<=56'h000003002A1032;
					subpacket[1]<=56'h00000000000000;
				end else begin
					packetHeader<=24'h0A0184;	// infoframe audio packet
					// Byte0: Checksum
					// Byte1: 11 = (CT3:0=1 PCM)0(CC2:0=1 2ch)
					// Byte2: 00 = 000(SF2:0=0 As stream)(SS1:0=0 As stream)
					// Byte3: 00 = LPCM doesn't use this
					// Byte4-5: 00 Multichannel only (>2ch)
					subpacket[0]<=56'h00000000001160;
					subpacket[1]<=56'h00000000000000;
				end
				subpacket[2]<=56'h00000000000000;
				subpacket[3]<=56'h00000000000000;
			end
		end
		else if (CounterX<(`DATA_START+`DATA_PREAMBLE+`DATA_GUARDBAND+`DATA_SIZE))
		begin
			dataGuardBand<=0;
			// Send first data packet (Infoframe or audio clock regen)
			SendPacket(packetHeader, subpacket[0], subpacket[1], subpacket[2], subpacket[3], 1);
		end
		else if (CounterX<(`DATA_START+`DATA_PREAMBLE+`DATA_GUARDBAND+`DATA_SIZE+`DATA_SIZE))
		begin
			// Send second data packet (audio data)
			SendPacket(audioPacketHeader, audioSubPacket[0], audioSubPacket[1], audioSubPacket[2], audioSubPacket[3], 0);
		end
		else if (CounterX<(`DATA_START+`DATA_PREAMBLE+`DATA_GUARDBAND+`DATA_SIZE+`DATA_SIZE+`DATA_GUARDBAND))
		begin
			// Trailing guardband for data period
			dataGuardBand<=1;
			dataChannel0<={1'b1, 1'b1, vSync, hSync};	
		end
		else
		begin
			// Back to normal DVI style control data
			tercData<=0;
			dataGuardBand<=0;
		end
	end
	// After we've sent data packets we need to do the video preamble and
	// guardband just before sending active video data
	if (CounterX>=(`CTL_END+`VIDEO_PREAMBLE))
	begin
		preamble<=0;
		videoGuardBand<=1;
	end
	else if (CounterX>=(`CTL_END))
	begin
		preamble<='b0001;
	end
	else
	begin
		videoGuardBand<=0;
	end
end

////////////////////////////////////////////////////////////////////////
// HDMI encoder
// Encodes video data (TMDS) or packet data (TERC4) ready for sending
////////////////////////////////////////////////////////////////////////

reg tercDataDelayed [1:0];
reg videoGuardBandDelayed [1:0];
reg dataGuardBandDelayed [1:0];

initial
begin
	tercDataDelayed[0]=0;
	tercDataDelayed[1]=0;
	videoGuardBandDelayed[0]=0;
	videoGuardBandDelayed[1]=0;
	dataGuardBandDelayed[0]=0;
	dataGuardBandDelayed[1]=0;
end

always @(posedge pixclk)
begin
	// Cycle 1
	tercDataDelayed[0]<=tercData;	// To account for delay through encoder
	videoGuardBandDelayed[0]<=videoGuardBand;
	dataGuardBandDelayed[0]<=dataGuardBand;
	// Cycle 2
	tercDataDelayed[1]<=tercDataDelayed[0];
	videoGuardBandDelayed[1]<=videoGuardBandDelayed[0];
	dataGuardBandDelayed[1]<=dataGuardBandDelayed[0];
end

wire [9:0] TMDS_red, TMDS_green, TMDS_blue;
TMDS_encoder encode_R(.clk(pixclk), .VD(red  ), .CD(preamble[3:2]), .VDE(DrawArea), .TMDS(TMDS_red));
TMDS_encoder encode_G(.clk(pixclk), .VD(green), .CD(preamble[1:0]), .VDE(DrawArea), .TMDS(TMDS_green));
TMDS_encoder encode_B(.clk(pixclk), .VD(blue ), .CD({vSync,hSync}), .VDE(DrawArea), .TMDS(TMDS_blue));

wire [9:0] TERC4_red, TERC4_green, TERC4_blue;
TERC4_encoder encode_R4(.clk(pixclk), .data(dataChannel2), .TERC(TERC4_red));
TERC4_encoder encode_G4(.clk(pixclk), .data(dataChannel1), .TERC(TERC4_green));
TERC4_encoder encode_B4(.clk(pixclk), .data(dataChannel0), .TERC(TERC4_blue));

////////////////////////////////////////////////////////////////////////
// HDMI data serialiser
// Outputs the encoded video data as serial data across the HDMI bus
////////////////////////////////////////////////////////////////////////

reg [3:0] TMDS_mod10;  // modulus 10 counter
reg [9:0] TMDS_shift_red, TMDS_shift_green, TMDS_shift_blue;
reg [9:0] TMDS_shift_red_delay, TMDS_shift_green_delay, TMDS_shift_blue_delay;

initial
begin
  TMDS_mod10=0;
  TMDS_shift_red=0;
  TMDS_shift_green=0;
  TMDS_shift_blue=0;
  TMDS_shift_red_delay=0;
  TMDS_shift_green_delay=0;
  TMDS_shift_blue_delay=0;
end

always @(posedge pixclk)
begin
	TMDS_shift_red_delay<=videoGuardBandDelayed[1] ? 10'b1011001100 : (dataGuardBandDelayed[1] ? 10'b0100110011 : (tercDataDelayed[1] ? TERC4_red : TMDS_red));
	TMDS_shift_green_delay<=(dataGuardBandDelayed[1] || videoGuardBandDelayed[1]) ? 10'b0100110011 : (tercDataDelayed[1] ? TERC4_green : TMDS_green);
	TMDS_shift_blue_delay<=videoGuardBandDelayed[1] ? 10'b1011001100 : (tercDataDelayed[1] ? TERC4_blue : TMDS_blue);
end

always @(posedge clk_TMDS)
begin
	TMDS_shift_red   <= (TMDS_mod10==4'd8) ? TMDS_shift_red_delay   : TMDS_shift_red  [9:2];
	TMDS_shift_green <= (TMDS_mod10==4'd8) ? TMDS_shift_green_delay : TMDS_shift_green[9:2];
	TMDS_shift_blue  <= (TMDS_mod10==4'd8) ? TMDS_shift_blue_delay  : TMDS_shift_blue [9:2];	
	TMDS_mod10 <= (TMDS_mod10==4'd8) ? 4'd0 : TMDS_mod10+4'd2;
end

assign TMDSp[2]=clk_TMDS?TMDS_shift_red[0]:TMDS_shift_red[1];
assign TMDSn[2]=~TMDSp[2];
assign TMDSp[1]=clk_TMDS?TMDS_shift_green[0]:TMDS_shift_green[1];
assign TMDSn[1]=!TMDSp[1];
assign TMDSp[0]=clk_TMDS?TMDS_shift_blue[0]:TMDS_shift_blue[1];
assign TMDSn[0]=!TMDSp[0];
assign TMDSp_clock=(TMDS_mod10==4)?!clk_TMDS:(TMDS_mod10>5);
assign TMDSn_clock=!TMDSp_clock;

////////////////////////////////////////////////////////////////////////
// Scanline method selection button debouncer
////////////////////////////////////////////////////////////////////////

reg [16:0] buttonDebounce;

initial
begin
	buttonDebounce=0;
end

always @(posedge pixclk)
begin
	if (!button) begin
		if (buttonDebounce=='h1ffff)
			scanlineType<=scanlineType!=2?scanlineType+1:0;
		buttonDebounce<=0;
	end else if (buttonDebounce!='h1ffff) begin	// Audio clock is 6MHz so this is about 22ms
		buttonDebounce<=buttonDebounce+1;
	end
end

endmodule

////////////////////////////////////////////////////////////////////////
// TMDS encoder
// Used to encode HDMI/DVI video data
////////////////////////////////////////////////////////////////////////

module TMDS_encoder(
	input clk,
	input [7:0] VD,  // video data (red, green or blue)
	input [1:0] CD,  // control data
	input VDE,  // video data enable, to choose between CD (when VDE=0) and VD (when VDE=1)
	output reg [9:0] TMDS
);

reg [3:0] balance_acc;
reg [8:0] q_m;
reg [1:0] CD2;
reg VDE2;

initial begin
	balance_acc=0;
	q_m=0;
	CD2=0;
	VDE2=0;
end

function [3:0] balance;
	input [7:0] qm;
	begin
		balance = qm[0] + qm[1] + qm[2] + qm[3] + qm[4] + qm[5] + qm[6] + qm[7] - 4'd4;
	end
endfunction

always @(posedge clk)
begin
	// Cycle 1
	if ((VD[0] + VD[1] + VD[2] + VD[3] + VD[4] + VD[5] + VD[6] + VD[7])>(VD[0]?4'd4:4'd3)) begin
		q_m <= {1'b0,~^VD[7:0],^VD[6:0],~^VD[5:0],^VD[4:0],~^VD[3:0],^VD[2:0],~^VD[1:0],VD[0]};
	end else begin
		q_m <= {1'b1, ^VD[7:0],^VD[6:0], ^VD[5:0],^VD[4:0], ^VD[3:0],^VD[2:0], ^VD[1:0],VD[0]};
	end
	VDE2 <= VDE;
	CD2 <= CD;
	// Cycle 2
	if (VDE2) begin
		if (balance(q_m)==0 || balance_acc==0) begin
			if (q_m[8]) begin
				TMDS <= {1'b0, q_m[8], q_m[7:0]};
				balance_acc <= balance_acc+balance(q_m);
			end else begin
				TMDS <= {1'b1, q_m[8], ~q_m[7:0]};
				balance_acc <= balance_acc-balance(q_m);
			end
		end else begin
			if (balance(q_m)>>3 == balance_acc[3]) begin
				TMDS <= {1'b1, q_m[8], ~q_m[7:0]};
				balance_acc <= balance_acc+q_m[8]-balance(q_m);
			end else begin
				TMDS <= {1'b0, q_m[8], q_m[7:0]};
				balance_acc <= balance_acc-(~q_m[8])+balance(q_m);
			end
		end
	end else begin
		balance_acc <= 0;
		TMDS <= CD2[1] ? (CD2[0] ? 10'b1010101011 : 10'b0101010100) : (CD2[0] ? 10'b0010101011 : 10'b1101010100);
	end
end

endmodule

////////////////////////////////////////////////////////////////////////
// TERC4 Encoder
// Used to encode the HDMI data packets such as audio
////////////////////////////////////////////////////////////////////////

module TERC4_encoder(
	input clk,
	input [3:0] data,
	output reg [9:0] TERC
);

reg [9:0] TERC_pre;

initial
begin
	TERC_pre=0;
end

always @(posedge clk)
begin
	// Cycle 1
	case (data)
		4'b0000: TERC_pre <= 10'b1010011100;
		4'b0001: TERC_pre <= 10'b1001100011;
		4'b0010: TERC_pre <= 10'b1011100100;
		4'b0011: TERC_pre <= 10'b1011100010;
		4'b0100: TERC_pre <= 10'b0101110001;
		4'b0101: TERC_pre <= 10'b0100011110;
		4'b0110: TERC_pre <= 10'b0110001110;
		4'b0111: TERC_pre <= 10'b0100111100;
		4'b1000: TERC_pre <= 10'b1011001100;
		4'b1001: TERC_pre <= 10'b0100111001;
		4'b1010: TERC_pre <= 10'b0110011100;
		4'b1011: TERC_pre <= 10'b1011000110;
		4'b1100: TERC_pre <= 10'b1010001110;
		4'b1101: TERC_pre <= 10'b1001110001;
		4'b1110: TERC_pre <= 10'b0101100011;
		4'b1111: TERC_pre <= 10'b1011000011;
	endcase
	// Cycle 2
	TERC <= TERC_pre;
end

endmodule

////////////////////////////////////////////////////////////////////////

