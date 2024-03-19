module UsbTxPhy (
      input   io_fsCe,
      input   io_phyMode,
      output  io_txdp,
      output  io_txdn,
      output  io_txoe,
      input   io_lineCtrlI,
      input  [7:0] io_dataOutI,
      input   io_txValidI,
      output  io_txReadyO,
      input   clkout2,
      input   reset);
  wire [3:0] _zz_1_;
  wire [3:0] IDLE_STATE;
  wire [3:0] SOP_STATE;
  wire [3:0] DATA_STATE;
  wire [3:0] WAIT_STATE;
  wire [3:0] EOP0_STATE;
  wire [3:0] EOP1_STATE;
  wire [3:0] EOP2_STATE;
  wire [3:0] EOP3_STATE;
  wire [3:0] EOP4_STATE;
  wire [3:0] EOP5_STATE;
  reg [7:0] rHold;
  reg  rLdData;
  reg  rLineCtrlI;
  reg  rLongI;
  reg  rBusResetI;
  reg [15:0] rBitCnt;
  reg  rDataXmit;
  reg [7:0] rHoldD;
  reg [2:0] rOneCnt;
  reg  rSdBsO;
  reg  rSdNrziO;
  reg  rSdRawO;
  reg  rSftDone;
  reg  rSftDoneR;
  reg [3:0] rState;
  reg  rTxIp;
  reg  rTxIpSync;
  reg  rTxoeR1;
  reg  rTxoeR2;
  reg  rTxDp;
  reg  rTxDn;
  reg  rTxoe;
  reg  rTxReady;
  wire  anyEopState;
  wire  appendEop;
  wire  stuff;
  wire  sftDoneE;
  wire  ldDataD;
  wire  ldSopD;
  wire  seState;
  wire  sLong;
  assign _zz_1_ = (rState + (4'b0001));
  assign IDLE_STATE = (4'b0000);
  assign SOP_STATE = (4'b0001);
  assign DATA_STATE = (4'b0010);
  assign WAIT_STATE = (4'b0011);
  assign EOP0_STATE = (4'b1000);
  assign EOP1_STATE = (4'b1001);
  assign EOP2_STATE = (4'b1010);
  assign EOP3_STATE = (4'b1011);
  assign EOP4_STATE = (4'b1100);
  assign EOP5_STATE = (4'b1101);
  assign anyEopState = rState[3];
  assign appendEop = (rState[3 : 2] == (2'b11));
  assign stuff = (rOneCnt == (3'b110));
  assign sftDoneE = (rSftDone && (! rSftDoneR));
  assign ldDataD = (((rState == SOP_STATE) || ((rState == DATA_STATE) && rDataXmit)) ? sftDoneE : 1'b0);
  assign ldSopD = ((rState == IDLE_STATE) ? io_txValidI : 1'b0);
  assign seState = (appendEop || ((((rState != WAIT_STATE) && rLineCtrlI) && rLongI) && rBusResetI));
  assign sLong = ((rState == WAIT_STATE) || (! rLongI));
  assign io_txReadyO = rTxReady;
  assign io_txdp = rTxDp;
  assign io_txdn = rTxDn;
  assign io_txoe = rTxoe;
  always @ (posedge clkout2 or posedge reset) begin
    if (reset) begin
      rHold <= (8'b00000000);
      rLdData <= 1'b0;
      rLineCtrlI <= 1'b0;
      rLongI <= 1'b0;
      rBusResetI <= 1'b0;
      rBitCnt <= (16'b0000000000000000);
      rDataXmit <= 1'b0;
      rHoldD <= (8'b00000000);
      rOneCnt <= (3'b000);
      rSdBsO <= 1'b0;
      rSdNrziO <= 1'b1;
      rSdRawO <= 1'b0;
      rSftDone <= 1'b0;
      rSftDoneR <= 1'b0;
      rState <= IDLE_STATE;
      rTxIp <= 1'b0;
      rTxIpSync <= 1'b0;
      rTxoeR1 <= 1'b0;
      rTxoeR2 <= 1'b0;
      rTxDp <= 1'b1;
      rTxDn <= 1'b0;
      rTxoe <= 1'b1;
      rTxReady <= 1'b0;
    end else begin
      rTxReady <= ((ldDataD || (rLineCtrlI && anyEopState)) && io_txValidI);
      rLdData <= ldDataD;
      if(ldSopD)begin
        rTxIp <= 1'b1;
      end else begin
        if(appendEop)begin
          rTxIp <= 1'b0;
        end
      end
      if(io_fsCe)begin
        rTxIpSync <= rTxIp;
      end
      if((io_txValidI && (! rTxIp)))begin
        rDataXmit <= 1'b1;
      end else begin
        if((! io_txValidI))begin
          rDataXmit <= 1'b0;
        end
      end
      if((! rTxIpSync))begin
        rBitCnt <= (16'b0000000000000000);
      end else begin
        if((io_fsCe && (! stuff)))begin
          rBitCnt <= (rBitCnt + (16'b0000000000000001));
        end
      end
      if((! rTxIpSync))begin
        rSdRawO <= 1'b0;
      end else begin
        rSdRawO <= rHoldD[rBitCnt[2 : 0]];
      end
      if(((rBitCnt[15] == (rLineCtrlI && rLongI)) && (rBitCnt[2 : 0] == (3'b111))))begin
        rSftDone <= (! stuff);
      end else begin
        rSftDone <= 1'b0;
      end
      rSftDoneR <= rSftDone;
      if(ldSopD)begin
        rHold <= (8'b10000000);
      end else begin
        if(rLdData)begin
          rHold <= io_dataOutI;
        end
      end
      rHoldD <= rHold;
      if((! rTxIpSync))begin
        rOneCnt <= (3'b000);
      end else begin
        if(io_fsCe)begin
          if(((! rSdRawO) || stuff))begin
            rOneCnt <= (3'b000);
          end else begin
            rOneCnt <= (rOneCnt + (3'b001));
          end
        end
      end
      if(io_fsCe)begin
        if((! rTxIpSync))begin
          rSdBsO <= 1'b0;
        end else begin
          if(stuff)begin
            rSdBsO <= 1'b0;
          end else begin
            rSdBsO <= rSdRawO;
          end
        end
      end
      if((((! rTxIpSync) || (! rTxoeR1)) || rLineCtrlI))begin
        if(rLineCtrlI)begin
          rSdNrziO <= sLong;
        end else begin
          rSdNrziO <= 1'b1;
        end
      end else begin
        if(io_fsCe)begin
          if(rSdBsO)begin
            rSdNrziO <= rSdNrziO;
          end else begin
            rSdNrziO <= (! rSdNrziO);
          end
        end
      end
      if(io_fsCe)begin
        rTxoeR1 <= rTxIpSync;
        rTxoeR2 <= rTxoeR1;
        rTxoe <= (! (rTxoeR1 || rTxoeR2));
      end
      if(io_fsCe)begin
        if(io_phyMode)begin
          rTxDp <= ((! seState) && rSdNrziO);
          rTxDn <= ((! seState) && (! rSdNrziO));
        end else begin
          rTxDp <= rSdNrziO;
          rTxDn <= seState;
        end
      end
      if((! anyEopState))begin
        if((rState == IDLE_STATE)) begin
            if(io_txValidI)begin
              rLineCtrlI <= io_lineCtrlI;
              rLongI <= io_dataOutI[0];
              rBusResetI <= io_dataOutI[1];
              rState <= SOP_STATE;
            end
        end else if((rState == SOP_STATE)) begin
            if(sftDoneE)begin
              rState <= DATA_STATE;
            end
        end else if((rState == DATA_STATE)) begin
            if(((! rDataXmit) && sftDoneE))begin
              if(((rOneCnt == (3'b101)) && rHoldD[7]))begin
                rState <= EOP0_STATE;
              end else begin
                rState <= EOP1_STATE;
              end
            end
        end else if((rState == WAIT_STATE)) begin
            if(io_fsCe)begin
              rState <= IDLE_STATE;
            end
        end else begin
            rState <= IDLE_STATE;
        end
      end else begin
        if(io_fsCe)begin
          if((rState == EOP5_STATE))begin
            rState <= WAIT_STATE;
          end else begin
            rState <= _zz_1_;
          end
        end
      end
    end
  end

endmodule

