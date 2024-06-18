// This program was cloned from: https://github.com/HurleyResearch/nRFICE
// License: GNU General Public License v3.0

// this one ties the data_receiver and pwm1 together

//`define GENRANGE  (i * 16 + 15) : (i * 16)


module top (
    clock_in,
	reset_in,
	//period_in,
//	ontime_in,
      pwm_out,
	//  dbg0,
	//  dbg1,
	//  count_out,
	  spicsn,
	  spiclk,
	  spimosi,
	  spimiso,
	  spiState,
	//  spiBitCount,
	  dbgledr,
	  dbgledg,
	  dbgledb,
	  spiDebug4

);

parameter [3:0] ontime_in = 4'b0101;

input  clock_in;
input  reset_in;

input  spicsn;
input  spiclk;
input  spimosi;
//input  spimiso;

//input [7:0] period_in;
//input [15:0] ontime_in;



output pwm_out;
output dbgledr;
output dbgledg;
output dbgledb;
output spimiso;
output  [4:0]  spiState;
//output  [3:0]  spiBitCount;
output  [4:0]  spiDebug4;


// ------------------------------
//        Definitions          
// ------------------------------

// inputs from nordic
wire  clock_in;
//wire stretchedClock;
wire  reset_in;
wire  spicsn;
wire  spiclk;
wire  spimosi;
wire  spimiso;

wire [4:0] spiState;
wire [19:0] spiStateBits;
wire [3:0] spiBitCount;
wire [3:0] ramReadData4;
//wire  [15:0]  spiRamReadData;
//wire  [15:0]  spiRamWriteData;
wire spiReadMode;

wire [15:0] pwm_counter;
wire [15:0] count_out;
wire pwm_out;
wire dbgledr;
wire dbgledg;
wire dbgledb;

reg slowClock;
always @ (posedge clock_in or posedge reset_in) begin 

if (reset_in)
     slowClock <= 1'b0;
else
     slowClock <= ~slowClock;	
end




wire ramCLK;
wire ramCLKEn;
wire ramWriteEn;
wire [15:0] ramWriteData;
wire [7:0] ramAddr;
wire [15:0] ramReadData;

wire [47:0] pwmOnTimes;

ebr8x16 ebr (


        .clk_i(ramCLK), 
        .rst_i(reset_in), 
        .clk_en_i(ramCLKEn), 
        .wr_en_i(ramWriteEn), 
        .wr_data_i(ramWriteData), 
        .addr_i(ramAddr), 
        .rd_data_o(ramReadData)

);





spi spi(
	.clock(clock_in), // was working with slowclock
	.reset(reset_in),
	.csn(spicsn), 
	.clk(spiclk), 
	.mosi(spimosi), 
	.miso(spimiso),
	.ramAddr(ramAddr),
	.ramReadData(ramReadData),
	.ramCLKEn(ramCLKEn),
	.ramCLK(ramCLK),
	.ramWriteData(ramWriteData),
	.ramWriteEn(ramWriteEn),
	.stateDebug(spiStateBits),
	.debug4(spiDebug4),
	.pwmRegs(pwmOnTimes)
	
);





reg [15:0] pwmCounter;
always @ (posedge clock_in or posedge reset_in) begin 

if (reset_in)
     pwmCounter <= 16'b0;
else
     pwmCounter <= pwmCounter + 1'b1;	
end



/*pwm pwm(
.clock(clock_in),
.reset(reset_in),
.ramSafe(spicsn), 
.counter(pwmCounter),
.pwmOut(pwm_out)
);*/




assign pwm_out = pwm_counter[3];
//assign pwm_out = pwm_counter < ontime_in ? 1'b0 : 1'b1;
// assign new_frame_latch = ((pcraw > 100) && (pcraw < 500) && (frame_count % pwm_on_times[103:96] == 8'b0)) ? 1'b1 : 1'b0;

assign count_out[15:0] = pwm_counter[15:0];
//assign dbgledr = clock_in;
//assign dbgledr = slowClock;
//assign dbgledr = clock_in;
//assign dbgledg = spiBitCount[1];
//assign dbgledb = spiReadMode;


assign dbgledr = pwm_counter[15:0] < pwmOnTimes[15:0] ? 1'b0 : 1'b1;
assign dbgledg = pwm_counter[15:0] < pwmOnTimes[31:16] ? 1'b0 : 1'b1;
assign dbgledb = pwm_counter[15:0] < pwmOnTimes[47:32] ? 1'b0 : 1'b1;

//assign dbgledr = 1'b1;
//assign dbgledg = 1'b1;
//assign dbgledb = 1'b1;

//assign ramData4[3:0] = ramReadData[3:0];
//assign ramData4[3:0] = ramWriteData[3:0];
//assign spiDebug4[3:0] = ramWriteData[3:0];

assign spiState[4:0] = (spiStateBits == 20'b00000000000000000001) ? 0 :
                       (spiStateBits == 20'b00000000000000000010) ? 1 :
                       (spiStateBits == 20'b00000000000000000100) ? 2 :
                       (spiStateBits == 20'b00000000000000001000) ? 3 :
                       (spiStateBits == 20'b00000000000000010000) ? 4 :
                       (spiStateBits == 20'b00000000000000100000) ? 5 :
                       (spiStateBits == 20'b00000000000001000000) ? 6 :
                       (spiStateBits == 20'b00000000000010000000) ? 7 :
                       (spiStateBits == 20'b00000000000100000000) ? 8 :
                       (spiStateBits == 20'b00000000001000000000) ? 9 :
                       (spiStateBits == 20'b00000000010000000000) ? 10 :
                       (spiStateBits == 20'b00000000100000000000) ? 11 :
                       (spiStateBits == 20'b00000001000000000000) ? 12 :
                       (spiStateBits == 20'b00000010000000000000) ? 13 :
                       (spiStateBits == 20'b00000100000000000000) ? 14 :
                       (spiStateBits == 20'b00001000000000000000) ? 15 :
                       (spiStateBits == 20'b00010000000000000000) ? 16 :
                       (spiStateBits == 20'b00100000000000000000) ? 17 :
                       (spiStateBits == 20'b01000000000000000000) ? 18 :
                       (spiStateBits == 20'b10000000000000000000) ? 19 : 20;


endmodule      // end of module top