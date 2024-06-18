// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

// This should blink at a rate of ~ second

// 12mhz/(56000hz) = 214/2 = 107
// 12mhz/2400 = 5000 /2 = 2500
// 12mhz/9600 = 1250 /2 = 625
// 12mhz/38400 = 312 /2 = 156
// 12mhz/57600 =  208.3 /2 = 104
// 12mhz/19200 =  625 /2 = 312
// 12mhz/115200 =  104 /2 = 52

// 2400hz
//parameter UART_PERIOD = 5000;
//parameter UART_PERIOD_TH = 7500;  // three halves

//9600
//parameter UART_PERIOD = 1250;
//parameter UART_PERIOD_TH = 1875;  // three halves

//19200
//parameter UART_PERIOD = 625;
//parameter UART_PERIOD_TH = 937;  // three halves

//57600
//parameter UART_PERIOD = 206;
//parameter UART_PERIOD_TH = 309;  // three halves

// 115200
// * the trick here is to have the FPGA run slightly faster than the computer
// then the FPGA won't get behind and drop data.
parameter UART_PERIOD = 100;
parameter UART_PERIOD_TH = 150;  // three halves

module TXMOD(
  output TX,
  input CLK,
  input [7:0] data,
  input valid,
  output ready);

reg TXReg = 1;
assign TX = TXReg;

reg [10:0] dataStore = 1536; // MSB=1, LSB=0
reg writing = 0;
assign ready = (writing==0);

reg [13:0] writeClock = 0; // which cycle are we in?
reg [3:0] writeBit = 0; // which bit are we writing? (10 bits total)

always @(posedge CLK) begin
  if(writing==0 && valid==1) begin
    writing <= 1;
    dataStore[8:1] <= data;
    writeClock <= UART_PERIOD;
    writeBit <= 0;
    TXReg <= dataStore[0];
  end else if(writing==1 && writeClock==0 && writeBit==9) begin
    // we're done
    TXReg <= 1;
    writing <= 0;
  end else if(writing==1 && writeClock==0) begin
    // move on to next bit
    TXReg <= dataStore[writeBit];
    writeBit <= writeBit+1;
    writeClock <= UART_PERIOD;
  end else if(writing==1) begin
    TXReg <= dataStore[writeBit];
    writeClock <= writeClock - 1;
  end else begin
    TXReg <= 1;
  end 

end

endmodule

module RXMOD(
  input RX, 
  input CLK,
  output [7:0] data,
  output valid);

reg RX_1;
reg RX_2;
always @(posedge CLK) begin
  RX_1 <= RX;
  RX_2 <= RX_1;
end

wire RXi;
assign RXi = RX_2;

reg [8:0] dataReg;
reg validReg = 0;
assign data = dataReg[7:0];
assign valid = validReg;

reg [12:0] readClock = 0; // which subclock?
reg [3:0] readBit = 0; // which bit? (0-8)
reg reading = 0;


always @ (posedge CLK)
begin
  if(RXi==0 && reading==0) begin
    reading <= 1;
    readClock <= UART_PERIOD_TH; // sample to middle of second byte
    readBit <= 0;
    validReg <= 0;
  end else if(reading==1 && readClock==0 && readBit==8) begin
    // we're done
    reading <= 0;
    dataReg[8] <= RXi;
    validReg <= 1;
  end else if(reading==1 && readClock==0) begin
    // read a byte
    dataReg[readBit] <= RXi;
    readClock <= UART_PERIOD;
    readBit <= readBit + 1;
    validReg <= 0;
  end else if(reading==1 && readClock>0) begin
    readClock <= readClock - 1;
    validReg <= 0;
  end else begin
    validReg <= 0;
  end
end
endmodule

module main (input CLK, input RX, output TX,
  output LED0,
  output LED1,
  output LED2,
  output LED3,
  output LED4,
  output PMOD_1,
  output PMOD_2);

  assign PMOD_1 = RX;
  assign PMOD_2 = TX;

  wire [7:0] readData;
  wire readValid;

  reg [7:0] readDataReg;
  wire txReady;
  reg txValid = 0;

  always @(posedge CLK) begin
    if(readValid) begin
      readDataReg <= readData;
      txValid <= 1;
    end else if(txReady) begin
      txValid <= 0;
    end
  end

  assign LED4 = readValid;
  assign {LED3, LED2, LED1, LED0} = readDataReg[3:0];

  RXMOD rxmod(.RX(RX), .CLK(CLK), .data(readData), .valid(readValid) );
  TXMOD txmod(.TX(TX), .CLK(CLK), .data(readDataReg+10), .valid(txValid), .ready(txReady) );
endmodule
