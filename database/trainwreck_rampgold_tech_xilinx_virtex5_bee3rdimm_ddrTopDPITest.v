//---------------------------------------------------------------------------   
// File:        ddrTop.v
// Author:      Zhangxi Tan
// Description: Modified for 2GB dual-rank SODIMMs 
//------------------------------------------------------------------------------  

`timescale 1ns / 1ps

//© Copyright Microsoft Corporation, 2008

module ddrTop(
 input CLKBN,
 input CLKBP,
 input FPGA_Reset,
 //Signals to the DIMMs
 inout [63:0] DQ,  //the 64 DQ pins
 inout [7:0]  DQS, //the 8  DQS pins
 inout [7:0]  DQS_L,
 output [7:0] DM,
 output [1:0] DIMMCK,  //differential clock to the DIMM
 output [1:0] DIMMCKL,
 output [13:0]A,  //addresses to DIMMs
 output [2:0] BA, //bank address to DIMMs
 output [1:0] RS, //rank select
 output RAS,
 output CAS,
 output WE,
 output [1:0] ODT,
 output [1:0] ClkEn, //common clock enable for both DIMMs. SSTL1_8
  
// input Global_Reset, //low true
// inout SCL,  //I2C clock
// inout SDA,  //I2C data
 output TxD, //RS232 transmit data
 input RxD,  //RS232 received data
 output [3:0] Leds  // 0: reading LED 1: single bit error 2: double bit errors, 3: hold fail
);
 
 
  
 //Signals between the TC5 and the tester
 wire Start;
 wire HoldFail;
 wire [7:0] XDbyte;
 wire TakeXD;
 wire [1:0] testConf;
 wire StartDQCal0;
 
 //LastALU also goes to tester
 
 //Signals between the tester and  the DDR controller.
 wire [27:0] Address;
 wire Read;
 wire WriteAF;
 wire AFfull;
 wire [127:0] WriteData;
 wire [127:0] ReadData;
 wire RBempty; //Don't read from RB
 wire ReadRB;
 wire WriteWB;
 wire WBfull;

 wire SingleError;  //goes to tester 
 wire DoubleError;  //goes to tester

 wire ResetDDR; 
 wire RxDin;

 
//wire Select;


(* syn_maxfan=20 *) wire  Reset;

//Clocks
 wire RamClock;
 wire CLK;
 wire MCLK; 
 wire MCLK90;
 wire Ph0; //MCLK / 4
 wire CLKx;
 wire MCLKx;
 wire MCLK90x;
 wire Ph0x;
 wire MCLK180x;
 wire PLLBfb;
 wire pllLock;
 wire ctrlLock;
 
 //TC5 interface signals
 wire [35:0] LastALU;
 wire injectTC5address;
 wire CalFailed;
 wire InhibitDDR;
 wire Force;
 wire DDRclockEnable;
// wire SCLx, SDAx, SDAin;
 wire RBfullx;
// reg  RBfull;
 wire Reading;
// wire a_IncDly;

 wire [31:0] read_data1, read_data2, read_data3, read_data4;
 wire [31:0] write_data1, write_data2, write_data3, write_data4;
 
 wire ResetTester;
 bit dly_ResetTester;

reg [1:0] rleds;

`ifdef MODEL_TECH
reg   start_test;
`endif
 

 reg CReset;
 wire [27:0] add_inv;
//--------------------End of Declarations-------------------------------

// always @(posedge CLK) RBfull <= RBfullx;

 assign Leds[0] = Reading;
 assign Leds[3] = HoldFail;
 assign Leds[2:1] = rleds;
// assign add_inv = {1'b0,~Address[25], Address[24:0]};
 assign add_inv = {1'b0,~Address[25], Address[24:0]};

 always @(posedge CLK) begin
  CReset <= Reset | ResetDDR;

  if (CReset)
    rleds[1:0] <= 2'b0;
  else begin
    if (SingleError)
      rleds[0] <= 1'b1;
    
    if (DoubleError)
      rleds[1] <= 1'b1;
  end
 end

 
 assign OTPIN = 0;


//Instantiate the TC5
 TC5 TC5a(.Ph0(Ph0), .ResetIn(ResetIn), .TxD(TxD), .RxD(RxDin),
    .StartDQCal0(StartDQCal0), .LastALU(LastALU), .injectTC5address(injectTC5address),
    .CalFailed(CalFailed), .InhibitDDR(InhibitDDR), .Force(Force), .DDRclockEnable(DDRclockEnable), .ResetDDR(ResetDDR),
    .HoldFail(HoldFail), .Start(Start), .testConf(testConf), 
    .TakeXD(TakeXD), .XDbyte(XDbyte), .SCL(), .SDA(), .SDAin(1'b0), .Select(), .Which(1'b0)
  );
  
`ifdef MODEL_TECH
 
 always @(posedge Ph0) begin
  if (Reset)
     start_test <= 1'b0;
  else 
     start_test <= ~InhibitDDR & ~start_test;
 end  
 
  
bee3_tester test(
  .clk(CLK), .rst(ResetTester), .readRB(ReadRB), .RBempty(RBempty), .read_data1(read_data1), .read_data2(read_data2), .read_data3(read_data3), .read_data4(read_data4),
  .writeAF(WriteAF), .writeWB(WriteWB), .AFfull(AFfull), .WBfull(WBfull), .read(Read), .addr(Address), .write_data1(write_data1),
  .write_data2(write_data2), .write_data3(write_data3), .write_data4(write_data4));
  
  assign WriteData = {write_data4, write_data3, write_data2, write_data1};
  assign read_data4 = ReadData[127:96];
  assign read_data3 = ReadData[95:64];
  assign read_data2 = ReadData[63:32];
  assign read_data1 = ReadData[31:0];
  assign ResetTester = Reset | ~DDRclockEnable | dly_ResetTester;

 initial begin
  dly_ResetTester = '1;
  #300us dly_ResetTester = '0;
 end
`endif


//Instantiate the tester
/* `ifdef MODEL_TECH
 
 always @(posedge Ph0) begin
  if (Reset)
     start_test <= 1'b0;
  else 
     start_test <= ~InhibitDDR & ~start_test;
 end
 
 Tester testtesta(
   .CLK(CLK), .Reset(Reset), .Start(start_test), .ResetDDR(ResetDDR), .HoldFail(HoldFail), .testConf(2'b10),
   .Address(Address), .Read(Read), .WriteAF(WriteAF), .AFfull(AFfull), .WriteData(WriteData), .WriteWB(WriteWB),
   .ReadData(ReadData), .ReadRB(ReadRB), .RBempty(RBempty), .SingleError(SingleError),
   .DoubleError(DoubleError), .XDbyte(XDbyte), .TakeXD(TakeXD), .LastALU(36'h8), .WBfull(WBfull), .Reading(Reading)   
  );   
 
 `else
 Tester testa(
   .CLK(CLK), .Reset(Reset), .Start(Start), .ResetDDR(ResetDDR), .HoldFail(HoldFail), .testConf(testConf),
   .Address(Address), .Read(Read), .WriteAF(WriteAF), .AFfull(AFfull), .WriteData(WriteData), .WriteWB(WriteWB),
   .ReadData(ReadData), .ReadRB(ReadRB), .RBempty(RBempty), .SingleError(SingleError),
   .DoubleError(DoubleError), .XDbyte(XDbyte), .TakeXD(TakeXD), .LastALU(LastALU), .WBfull(WBfull), .Reading(Reading)   
  );   
 `endif */
   
//Instantiate the DDR2 controller
 ddrController ddra(
 .CLK(CLK),
 .MCLK(MCLK),
 .MCLK90(MCLK90),
 .Reset(Reset),
 .CalFailed(CalFailed),
 .DDRclockEnable(DDRclockEnable),
// .Address(Address),
 .Address(add_inv),
 .Read(Read),
 .ReadData(ReadData),
 .WriteData(WriteData),
 
 .DQ(DQ), //the 64 DQ pins
 .DQS(DQS), //the 8  DQS pins
 .DQS_L(DQS_L),
 .DM(DM),
 .DIMMCK(DIMMCK),  //differential clock to the two DIMMs
 .DIMMCKL(DIMMCKL),
 .A(A), //addresses to DIMMs
 .BA(BA), //bank address to DIMMs
 .RS(RS), //rank select
 .RAS(RAS),
 .CAS(CAS),
 .WE(WE),
 .ODT(ODT),  //two ODTs, one for each DIMM
 .ClkEn(ClkEn), //common clock enable for both DIMMs. SSTL1_8
 
 .StartDQCal0(StartDQCal0),
 .LastALU(LastALU),
 .injectTC5address(injectTC5address),
 .InhibitDDR(InhibitDDR),
 .Force(Force),
 .ResetDDR(ResetDDR),
 .SingleError(SingleError),
 .DoubleError(DoubleError),
 .RBempty(RBempty),
 .RBfull(RBfullx),
 .ReadRB(ReadRB),
 .WBfull(WBfull),
 .WriteWB(WriteWB),
 .WBclock(CLK),
 .RBclock(CLK),
 .AFclock(Ph0),
 .WriteAF(WriteAF),
 .AFfull(AFfull)
// .IncDly(a_IncDly)
 );
 
 
 
//Pin buffer for RxD
 IBUF rsbuf(.I(RxD), .O(RxDin));
	
	
 assign ResetIn =  ~FPGA_Reset ; // low true
  
//The clocks
 (* DIFF_TERM = "TRUE" *) IBUFGDS ClkBuf (
  .O (RamClock),
  .I (CLKBP),
  .IB (CLKBN)
 );

//This PLL generates MCLK and MCLK90 at whatever frequency we want.
PLL_BASE #(
.BANDWIDTH("OPTIMIZED"), // "HIGH", "LOW" or "OPTIMIZED"
.CLKFBOUT_MULT(7), // Multiplication factor for all output clocks
.CLKFBOUT_PHASE(0.0), // Phase shift (degrees) of all output clocks
.CLKIN_PERIOD(5.0), // Clock period (ns) of input clock on CLKIN

.CLKOUT0_DIVIDE(3), // Division factor for MCLK (1 to 128)
.CLKOUT0_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT0 (0.01 to 0.99)
.CLKOUT0_PHASE(0.0), // Phase shift (degrees) for CLKOUT0 (0.0 to 360.0)

.CLKOUT1_DIVIDE(3), // Division factor for MCLK90 (1 to 128)
.CLKOUT1_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT1 (0.01 to 0.99)
.CLKOUT1_PHASE(90.0), // Phase shift (degrees) for CLKOUT1 (0.0 to 360.0)

.CLKOUT2_DIVIDE(12), // Division factor for Ph0 (1 to 128)
.CLKOUT2_DUTY_CYCLE(0.375), // Duty cycle for CLKOUT2 (0.01 to 0.99)
.CLKOUT2_PHASE(0.0), // Phase shift (degrees) for CLKOUT2 (0.0 to 360.0)

.CLKOUT3_DIVIDE(3), // Division factor for MCLK180 (1 to 128)
.CLKOUT3_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT3 (0.01 to 0.99)
.CLKOUT3_PHASE(180.0), // Phase shift (degrees) for CLKOUT3 (0.0 to 360.0)

.CLKOUT4_DIVIDE(6), // Division factor for CLK (1 to 128)
.CLKOUT4_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT4 (0.01 to 0.99)
.CLKOUT4_PHASE(0.0), // Phase shift (degrees) for CLKOUT4 (0.0 to 360.0)

.COMPENSATION("SYSTEM_SYNCHRONOUS"), // "SYSTEM_SYNCHRONOUS",
.DIVCLK_DIVIDE(2), // Division factor for all clocks (1 to 52)
.REF_JITTER(0.100) // Input reference jitter (0.000 to 0.999 UI%)


) clkBPLL (
.CLKFBOUT(PLLBfb), // General output feedback signal
.CLKOUT0(MCLKx), // 266 MHz
.CLKOUT1(MCLK90x), // 266 MHz, 90 degree shift
.CLKOUT2(Ph0x), // MCLK/4
.CLKOUT3(MCLK180x),
.CLKOUT4(CLKx), // MCLK/2
.CLKOUT5(),
.LOCKED(pllLock), // Active high PLL lock signal
.CLKFBIN(PLLBfb), // Clock feedback input
.CLKIN(RamClock), // Clock input
.RST(1'b0)
);

 BUFG bufc (.O(CLK), .I(CLKx));
 BUFG bufM (.O(MCLK), .I(MCLKx));
 BUFG bufM90 (.O(MCLK90), .I(MCLK90x));
 BUFG p0buf(.O(Ph0), .I(Ph0x));
  
 assign Reset = ResetIn  | ~pllLock | ~ctrlLock;

//instantiate an idelayctrl.
 IDELAYCTRL idelayctrl0 (
  .RDY(ctrlLock),
  .REFCLK(MCLK), 
  .RST(~pllLock)
  );

endmodule

//synthesis translate_off
module sim_top;

parameter clkperiod = 2.5;

bit clk = 0;
bit rst;


bit  [3:0]               leds;

wire [63:0]              ddr2_dq;
wire [13:0]              ddr2_a;
wire [2:0]               ddr2_ba;
wire                     ddr2_ras_n;
wire                     ddr2_cas_n;
wire                     ddr2_we_n;
wire [1:0]               ddr2_cs_n;
wire [1:0]               ddr2_odt;
wire [1:0]               ddr2_cke;
wire [7:0]               ddr2_dm;
wire [7:0]               ddr2_dqs;
wire [7:0]               ddr2_dqs_n;
wire [1:0]               ddr2_ck;
wire [1:0]               ddr2_ck_n;




default clocking main_clk @(posedge clk);
endclocking

initial begin
  forever #clkperiod clk = ~clk;
end

initial begin

  rst 	 = '0;
  
  ##200;
  rst = '0;
  
  ##20;
  rst = '1;
  
  
end

mt16htf25664hy  gen_sodimm(
                         .dq(ddr2_dq),
                         .addr(ddr2_a),           //COL/ROW addr
                         .ba(ddr2_ba),            //bank addr
                         .ras_n(ddr2_ras_n),
                         .cas_n(ddr2_cas_n),
                         .we_n(ddr2_we_n),
                         .cs_n(ddr2_cs_n),
                         .odt(ddr2_odt),
                         .cke(ddr2_cke),
                         .dm(ddr2_dm),
                         .dqs(ddr2_dqs),
                         .dqs_n(ddr2_dqs_n),
                         .ck(ddr2_ck),
                         .ck_n(ddr2_ck_n)
                          );

ddrTop bee3ddr(
 .CLKBN(~clk),
 .CLKBP(clk),
 .FPGA_Reset(rst),
 //Signals to the DIMMs
 .DQ(ddr2_dq),  //the 64 DQ pins
 .DQS(ddr2_dqs), //the 8  DQS pins
 .DQS_L(ddr2_dqs_n),
 .DM(ddr2_dm),
 .DIMMCK(ddr2_ck),  //differential clock to the DIMM
 .DIMMCKL(ddr2_ck_n),
 .A(ddr2_a),  //addresses to DIMMs
 .BA(ddr2_ba), //bank address to DIMMs
 .RS(ddr2_cs_n), //rank select
 .RAS(ddr2_ras_n),
 .CAS(ddr2_cas_n),
 .WE(ddr2_we_n),
 .ODT(ddr2_odt),
 .ClkEn(ddr2_cke), //common clock enable for both DIMMs. SSTL1_8
  
 .TxD(), //RS232 transmit data
 .RxD(1'b0),  //RS232 received data
 .Leds(leds)  // 0: reading LED 1: single bit error 2: double bit errors
);


endmodule
//synthesis translate_on