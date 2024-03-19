module UsbRxPhy (
      input   io_usbDif,
      input   io_usbDp,
      input   io_usbDn,
      output [1:0] io_lineState,
      output  io_clkRecovered,
      output  io_clkRecoveredEdge,
      output  io_rawData,
      input   io_rxEn,
      output  io_rxActive,
      output  io_rxError,
      output  io_valid,
      output [7:0] io_data,
      input   clkout2,
      input   reset);
  wire [6:0] _zz_1_;
  wire [7:0] paInc;
  wire [6:0] paCompensate;
  wire [6:0] idleCntInit;
  reg [7:0] rPa;
  reg [1:0] rDifShift;
  reg [1:0] rClkRecoveredShift;
  reg  rLineBitPrev;
  reg  rFrame;
  reg [7:0] rData;
  reg [7:0] rDataLatch;
  reg [7:0] rValid;
  reg [1:0] rLineState;
  reg [1:0] rLineStateSync;
  reg [1:0] rLineStatePrev;
  reg [6:0] rIdleCnt;
  reg  rPreamble;
  reg  rRxActive;
  reg  rRxEn;
  reg  rValidPrev;
  wire  sClkRecovered;
  wire  sLineBit;
  wire  sBit;
  assign _zz_1_ = (paInc[6 : 0] + paInc[6 : 0]);
  assign paInc = (8'b00100000);
  assign paCompensate = (_zz_1_ + paInc[6 : 0]);
  assign idleCntInit = (7'b1000000);
  assign sClkRecovered = rPa[7];
  assign sLineBit = rDifShift[0];
  assign sBit = (! (sLineBit ^ rLineBitPrev));
  assign io_data = rDataLatch;
  assign io_rawData = rLineBitPrev;
  assign io_lineState = rLineState;
  assign io_rxActive = rFrame;
  assign io_valid = (rValid[0] && (! rValidPrev));
  assign io_rxError = 1'b0;
  assign io_clkRecovered = sClkRecovered;
  assign io_clkRecoveredEdge = (rClkRecoveredShift[1] != sClkRecovered);
  always @ (posedge clkout2 or posedge reset) begin
    if (reset) begin
      rPa <= (8'b00000000);
      rDifShift <= (2'b00);
      rClkRecoveredShift <= (2'b00);
      rLineBitPrev <= 1'b0;
      rFrame <= 1'b0;
      rData <= (8'b00000000);
      rDataLatch <= (8'b00000000);
      rValid <= (8'b10000000);
      rLineState <= (2'b00);
      rLineStateSync <= (2'b00);
      rLineStatePrev <= (2'b00);
      rIdleCnt <= idleCntInit;
      rPreamble <= 1'b0;
      rRxActive <= 1'b0;
      rRxEn <= 1'b0;
      rValidPrev <= 1'b0;
    end else begin
      rClkRecoveredShift <= {sClkRecovered,rClkRecoveredShift[1]};
      rLineState <= {io_usbDn,io_usbDp};
      rLineStatePrev <= rLineState;
      rRxEn <= io_rxEn;
      rValidPrev <= rValid[0];
      if(((io_usbDn || io_usbDp) && io_rxEn))begin
        rDifShift <= {io_usbDif,rDifShift[1]};
      end
      if((rDifShift[1] != rDifShift[0]))begin
        rPa[6 : 0] <= paCompensate[6 : 0];
      end else begin
        rPa <= (rPa + paInc);
      end
      if(rRxEn)begin
        if((rClkRecoveredShift[1] != sClkRecovered))begin
          if((rLineBitPrev == sLineBit))begin
            rIdleCnt <= {rIdleCnt[0],rIdleCnt[6 : 1]};
          end else begin
            rIdleCnt <= idleCntInit;
          end
          rLineBitPrev <= sLineBit;
          if((((! rIdleCnt[0]) && rFrame) || (! rFrame)))begin
            if((rLineStateSync == (2'b00)))begin
              rData <= (8'b00000000);
            end else begin
              rData <= {sBit,rData[7 : 1]};
            end
          end
          if((rFrame && rValid[1]))begin
            rDataLatch <= rData;
          end
          if((rLineStateSync == (2'b00)))begin
            rFrame <= 1'b0;
            rValid <= (8'b00000000);
            rPreamble <= 1'b0;
            rRxActive <= 1'b0;
          end else begin
            if(rFrame)begin
              if(rPreamble)begin
                if((rData[6 : 1] == (6'b100000)))begin
                  rPreamble <= 1'b0;
                  rValid <= (8'b10000000);
                  rRxActive <= 1'b1;
                end
              end else begin
                if((! rIdleCnt[0]))begin
                  rValid <= {rValid[0],rValid[7 : 1]};
                end else begin
                  if(sBit)begin
                    rValid <= (8'b00000000);
                    rFrame <= 1'b0;
                    rRxActive <= 1'b0;
                  end
                end
              end
            end else begin
              if((rData[7 : 2] == (6'b000111)))begin
                rFrame <= 1'b1;
                rPreamble <= 1'b1;
                rValid <= (8'b00000000);
                rRxActive <= 1'b0;
              end
            end
          end
          rLineStateSync <= rLineState;
        end
      end else begin
        rValid <= (8'b00000000);
        rFrame <= 1'b0;
        rRxActive <= 1'b0;
      end
    end
  end

endmodule

