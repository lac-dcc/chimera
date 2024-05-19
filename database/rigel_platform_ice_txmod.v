// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

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
    writeClock <= 100;
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
    writeClock <= 100;
  end else if(writing==1) begin
    TXReg <= dataStore[writeBit];
    writeClock <= writeClock - 1;
  end else begin
    TXReg <= 1;
  end 

end

endmodule
