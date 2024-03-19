module UsbhSie (
      input   io_startI,
      input   io_inTransferI,
      input   io_sofTransferI,
      input   io_respExpectedI,
      input  [7:0] io_tokenPidI,
      input  [6:0] io_tokenDevI,
      input  [3:0] io_tokenEpI,
      input  [15:0] io_dataLenI,
      input   io_dataIdxI,
      input  [7:0] io_txDataI,
      input   io_utmiTxReadyI,
      input  [7:0] io_utmiDataI,
      input   io_utmiRxValidI,
      input   io_utmiRxActiveI,
      output  io_ackO,
      output  io_txPopO,
      output [7:0] io_rxDataO,
      output  io_rxPushO,
      output  io_txDoneO,
      output  io_rxDoneO,
      output  io_crcErrO,
      output  io_timeoutO,
      output [7:0] io_responseO,
      output [15:0] io_rxCountO,
      output  io_idleO,
      output  io_utmiLineCtrlO,
      output [7:0] io_utmiDataO,
      output  io_utmiTxValidO,
      input   clkout2,
      input   reset);
  wire [4:0] _zz_1_;
  wire [10:0] _zz_2_;
  wire [15:0] usbCrc16_1__io_crc_o;
  wire [4:0] usbCrc5_1__io_crc_o;
  wire [7:0] PID_DATA0;
  wire [7:0] PID_DATA1;
  wire [7:0] PID_ACK;
  wire [7:0] PID_NAK;
  wire [7:0] PID_STALL;
  wire [3:0] STATE_IDLE;
  wire [3:0] STATE_RX_DATA;
  wire [3:0] STATE_TX_PID;
  wire [3:0] STATE_TX_DATA;
  wire [3:0] STATE_TX_CRC1;
  wire [3:0] STATE_TX_CRC2;
  wire [3:0] STATE_TX_TOKEN1;
  wire [3:0] STATE_TX_TOKEN2;
  wire [3:0] STATE_TX_TOKEN3;
  wire [3:0] STATE_TX_ACKNAK;
  wire [3:0] STATE_TX_WAIT;
  wire [3:0] STATE_RX_WAIT;
  wire [3:0] STATE_TX_IFS;
  wire [2:0] RX_TIME_ZERO;
  wire [2:0] RX_TIME_INC;
  wire [2:0] RX_TIME_READY;
  reg  rStartAckQ;
  reg  rStatusTxDoneQ;
  reg  rStatusRxDoneQ;
  reg  rStatusCrcErrQ;
  reg  rStatusTimeoutQ;
  reg [7:0] rStatusResponseQ;
  reg [15:0] rByteCountQ;
  reg  rInTransferQ;
  reg [2:0] rRxTimeQ;
  reg  rRxTimeEnQ;
  reg [8:0] rLastTxTimeQ;
  reg  rSendData1Q;
  reg  rSendSofQ;
  reg  rSendAckQ;
  reg [15:0] rCrcSumQ;
  reg [15:0] rTokenQ;
  reg  rWaitRespQ;
  reg [3:0] rStateQ;
  reg  rUtmiLineCtrl;
  reg [31:0] rDataBufferQ;
  reg [3:0] rDataValidQ;
  reg [3:0] rRxActiveQ;
  reg [1:0] rDataCrcQ;
  reg  rUtmiTxValidR;
  reg [7:0] rUtmiDataR;
  wire  autorespThreshW;
  wire  rxRespTimeoutW;
  wire  txIfsReadyW;
  wire  statusResponseDataW;
  wire  crcErrorW;
  wire [7:0] rxDataW;
  wire  dataReadyW;
  wire  crcByteW;
  wire  rxActiveW;
  wire [7:0] crcDataInW;
  wire [4:0] crc5OutW;
  wire [4:0] crc5NextW;
  wire  shiftEnW;
  reg [3:0] nextStateR;
  reg [15:0] tokenRevW;
  UsbCrc16 usbCrc16_1_ ( 
    .io_crc_i(rCrcSumQ),
    .io_data_i(crcDataInW),
    .io_crc_o(usbCrc16_1__io_crc_o) 
  );
  UsbCrc5 usbCrc5_1_ ( 
    .io_crc_i(_zz_1_),
    .io_data_i(_zz_2_),
    .io_crc_o(usbCrc5_1__io_crc_o) 
  );
  assign PID_DATA0 = (8'b11000011);
  assign PID_DATA1 = (8'b01001011);
  assign PID_ACK = (8'b11010010);
  assign PID_NAK = (8'b01011010);
  assign PID_STALL = (8'b00011110);
  assign STATE_IDLE = (4'b0000);
  assign STATE_RX_DATA = (4'b0001);
  assign STATE_TX_PID = (4'b0010);
  assign STATE_TX_DATA = (4'b0011);
  assign STATE_TX_CRC1 = (4'b0100);
  assign STATE_TX_CRC2 = (4'b0101);
  assign STATE_TX_TOKEN1 = (4'b0110);
  assign STATE_TX_TOKEN2 = (4'b0111);
  assign STATE_TX_TOKEN3 = (4'b1000);
  assign STATE_TX_ACKNAK = (4'b1001);
  assign STATE_TX_WAIT = (4'b1010);
  assign STATE_RX_WAIT = (4'b1011);
  assign STATE_TX_IFS = (4'b1100);
  assign RX_TIME_ZERO = (3'b000);
  assign RX_TIME_INC = (3'b001);
  assign RX_TIME_READY = (3'b111);
  assign autorespThreshW = ((rSendAckQ && rRxTimeEnQ) && (rRxTimeQ == RX_TIME_READY));
  assign rxRespTimeoutW = (((9'b111111111) <= rLastTxTimeQ) && rWaitRespQ);
  assign txIfsReadyW = ((9'b000000111) < rLastTxTimeQ);
  assign statusResponseDataW = ((rStatusResponseQ == PID_DATA0) || (rStatusResponseQ == PID_DATA1));
  assign crcErrorW = (rCrcSumQ != (16'b1011000000000001));
  assign rxDataW = rDataBufferQ[7 : 0];
  assign dataReadyW = rDataValidQ[0];
  assign crcByteW = rDataCrcQ[0];
  assign rxActiveW = rRxActiveQ[0];
  assign crcDataInW = ((rStateQ == STATE_RX_DATA) ? rxDataW : io_txDataI);
  assign crc5NextW = (crc5OutW ^ (5'b11111));
  assign shiftEnW = ((io_utmiRxValidI && io_utmiRxActiveI) || (! io_utmiRxActiveI));
  always @ (*) begin
    nextStateR = rStateQ;
    if((rStateQ == STATE_TX_TOKEN1)) begin
        if(io_utmiTxReadyI)begin
          if(rUtmiLineCtrl)begin
            nextStateR = STATE_TX_IFS;
          end else begin
            nextStateR = STATE_TX_TOKEN2;
          end
        end
    end else if((rStateQ == STATE_TX_TOKEN2)) begin
        if(io_utmiTxReadyI)begin
          nextStateR = STATE_TX_TOKEN3;
        end
    end else if((rStateQ == STATE_TX_TOKEN3)) begin
        if(io_utmiTxReadyI)begin
          if(rSendSofQ)begin
            nextStateR = STATE_TX_IFS;
          end else begin
            if(rInTransferQ)begin
              nextStateR = STATE_RX_WAIT;
            end else begin
              nextStateR = STATE_TX_IFS;
            end
          end
        end
    end else if((rStateQ == STATE_TX_IFS)) begin
        if(txIfsReadyW)begin
          if(rSendSofQ)begin
            nextStateR = STATE_IDLE;
          end else begin
            nextStateR = STATE_TX_PID;
          end
        end
    end else if((rStateQ == STATE_TX_PID)) begin
        if((io_utmiTxReadyI && (rByteCountQ == (16'b0000000000000000))))begin
          nextStateR = STATE_TX_CRC1;
        end else begin
          if(io_utmiTxReadyI)begin
            nextStateR = STATE_TX_DATA;
          end
        end
    end else if((rStateQ == STATE_TX_DATA)) begin
        if((io_utmiTxReadyI && (rByteCountQ == (16'b0000000000000000))))begin
          nextStateR = STATE_TX_CRC1;
        end
    end else if((rStateQ == STATE_TX_CRC1)) begin
        if(io_utmiTxReadyI)begin
          nextStateR = STATE_TX_CRC2;
        end
    end else if((rStateQ == STATE_TX_CRC2)) begin
        if(io_utmiTxReadyI)begin
          if(rWaitRespQ)begin
            nextStateR = STATE_RX_WAIT;
          end else begin
            nextStateR = STATE_IDLE;
          end
        end
    end else if((rStateQ == STATE_TX_WAIT)) begin
        if(autorespThreshW)begin
          nextStateR = STATE_TX_ACKNAK;
        end
    end else if((rStateQ == STATE_TX_ACKNAK)) begin
        if(io_utmiTxReadyI)begin
          nextStateR = STATE_IDLE;
        end
    end else if((rStateQ == STATE_RX_WAIT)) begin
        if(dataReadyW)begin
          nextStateR = STATE_RX_DATA;
        end else begin
          if(rxRespTimeoutW)begin
            nextStateR = STATE_IDLE;
          end
        end
    end else if((rStateQ == STATE_RX_DATA)) begin
        if((! rxActiveW))begin
          if(((crcErrorW && rSendAckQ) && statusResponseDataW))begin
            nextStateR = STATE_IDLE;
          end else begin
            if((rSendAckQ && statusResponseDataW))begin
              nextStateR = STATE_TX_WAIT;
            end else begin
              nextStateR = STATE_IDLE;
            end
          end
        end
    end else if((rStateQ == STATE_IDLE)) begin
        if(io_startI)begin
          nextStateR = STATE_TX_TOKEN1;
        end
    end
  end

  assign _zz_1_ = (5'b11111);
  assign _zz_2_ = rTokenQ[15 : 5];
  assign crc5OutW = usbCrc5_1__io_crc_o;
  always @ (*) begin
    tokenRevW[0] = rTokenQ[15];
    tokenRevW[1] = rTokenQ[14];
    tokenRevW[2] = rTokenQ[13];
    tokenRevW[3] = rTokenQ[12];
    tokenRevW[4] = rTokenQ[11];
    tokenRevW[5] = rTokenQ[10];
    tokenRevW[6] = rTokenQ[9];
    tokenRevW[7] = rTokenQ[8];
    tokenRevW[8] = rTokenQ[7];
    tokenRevW[9] = rTokenQ[6];
    tokenRevW[10] = rTokenQ[5];
    tokenRevW[11] = rTokenQ[4];
    tokenRevW[12] = rTokenQ[3];
    tokenRevW[13] = rTokenQ[2];
    tokenRevW[14] = rTokenQ[1];
    tokenRevW[15] = rTokenQ[0];
  end

  assign io_utmiTxValidO = rUtmiTxValidR;
  assign io_utmiDataO = rUtmiDataR;
  assign io_utmiLineCtrlO = rUtmiLineCtrl;
  assign io_rxDataO = rxDataW;
  assign io_rxPushO = ((((rStateQ != STATE_IDLE) && (rStateQ != STATE_RX_WAIT)) && dataReadyW) && (! crcByteW));
  assign io_rxCountO = rByteCountQ;
  assign io_idleO = (rStateQ == STATE_IDLE);
  assign io_ackO = rStartAckQ;
  assign io_txPopO = ((rStateQ == STATE_TX_DATA) && io_utmiTxReadyI);
  assign io_txDoneO = rStatusTxDoneQ;
  assign io_rxDoneO = rStatusRxDoneQ;
  assign io_crcErrO = rStatusCrcErrQ;
  assign io_timeoutO = rStatusTimeoutQ;
  assign io_responseO = rStatusResponseQ;
  always @ (posedge clkout2 or posedge reset) begin
    if (reset) begin
      rStartAckQ <= 1'b0;
      rStatusTxDoneQ <= 1'b0;
      rStatusRxDoneQ <= 1'b0;
      rStatusCrcErrQ <= 1'b0;
      rStatusTimeoutQ <= 1'b0;
      rStatusResponseQ <= (8'b00000000);
      rByteCountQ <= (16'b0000000000000000);
      rInTransferQ <= 1'b0;
      rRxTimeQ <= RX_TIME_ZERO;
      rRxTimeEnQ <= 1'b0;
      rLastTxTimeQ <= (9'b000000000);
      rSendData1Q <= 1'b0;
      rSendSofQ <= 1'b0;
      rSendAckQ <= 1'b0;
      rCrcSumQ <= (16'b1111111111111111);
      rTokenQ <= (16'b0000000000000000);
      rWaitRespQ <= 1'b0;
      rStateQ <= STATE_IDLE;
      rUtmiLineCtrl <= 1'b0;
      rDataBufferQ <= (32'b00000000000000000000000000000000);
      rDataValidQ <= (4'b0000);
      rRxActiveQ <= (4'b0000);
      rDataCrcQ <= (2'b00);
      rUtmiTxValidR <= 1'b0;
      rUtmiDataR <= (8'b00000000);
    end else begin
      rStateQ <= nextStateR;
      if((rStateQ == STATE_IDLE))begin
        rTokenQ <= {{io_tokenDevI,io_tokenEpI},(5'b00000)};
      end else begin
        if(((rStateQ == STATE_TX_TOKEN1) && io_utmiTxReadyI))begin
          rTokenQ[4 : 0] <= crc5NextW;
        end
      end
      if(((rStateQ == STATE_IDLE) || (io_utmiTxValidO && io_utmiTxReadyI)))begin
        rLastTxTimeQ <= (9'b000000000);
      end else begin
        if((rLastTxTimeQ != (9'b111111111)))begin
          rLastTxTimeQ <= (rLastTxTimeQ + (9'b000000001));
        end
      end
      if((((rStateQ == STATE_IDLE) && io_startI) && (! io_sofTransferI)))begin
        rByteCountQ <= io_dataLenI;
      end else begin
        if((rStateQ == STATE_RX_WAIT))begin
          rByteCountQ <= (16'b0000000000000000);
        end else begin
          if((((rStateQ == STATE_TX_PID) || (rStateQ == STATE_TX_DATA)) && io_utmiTxReadyI))begin
            if((rByteCountQ != (16'b0000000000000000)))begin
              rByteCountQ <= (rByteCountQ - (16'b0000000000000001));
            end
          end else begin
            if((((rStateQ == STATE_RX_DATA) && dataReadyW) && (! crcByteW)))begin
              rByteCountQ <= (rByteCountQ + (16'b0000000000000001));
            end
          end
        end
      end
      rStartAckQ <= ((rStateQ == STATE_TX_TOKEN1) && io_utmiTxReadyI);
      if(((rStateQ == STATE_IDLE) && io_startI))begin
        rInTransferQ <= io_inTransferI;
        rSendAckQ <= (io_inTransferI && io_respExpectedI);
        rSendData1Q <= io_dataIdxI;
        rUtmiLineCtrl <= (io_sofTransferI && io_inTransferI);
        rSendSofQ <= io_sofTransferI;
      end
      if((rStateQ == STATE_IDLE))begin
        rRxTimeQ <= RX_TIME_ZERO;
        rRxTimeEnQ <= 1'b0;
      end else begin
        if(((rStateQ == STATE_RX_DATA) && (! io_utmiRxActiveI)))begin
          rRxTimeQ <= RX_TIME_ZERO;
          rRxTimeEnQ <= 1'b1;
        end else begin
          if((rRxTimeEnQ && (rRxTimeQ != RX_TIME_READY)))begin
            rRxTimeQ <= (rRxTimeQ + RX_TIME_INC);
          end
        end
      end
      if(((rStateQ == STATE_RX_WAIT) && dataReadyW))begin
        rWaitRespQ <= 1'b0;
      end else begin
        if(((rStateQ == STATE_IDLE) && io_startI))begin
          rWaitRespQ <= io_respExpectedI;
        end
      end
      if((rStateQ == STATE_RX_WAIT)) begin
          if(dataReadyW)begin
            rStatusResponseQ <= rxDataW;
          end
          if(rxRespTimeoutW)begin
            rStatusTimeoutQ <= 1'b1;
          end
          rStatusTxDoneQ <= 1'b0;
      end else if((rStateQ == STATE_RX_DATA)) begin
          rStatusRxDoneQ <= (! io_utmiRxActiveI);
      end else if((rStateQ == STATE_TX_CRC2)) begin
          if((io_utmiTxReadyI && (! rWaitRespQ)))begin
            rStatusTxDoneQ <= 1'b1;
          end
      end else if((rStateQ == STATE_IDLE)) begin
          if((io_startI && (! io_sofTransferI)))begin
            rStatusResponseQ <= (8'b00000000);
            rStatusTimeoutQ <= 1'b0;
          end
          rStatusRxDoneQ <= 1'b0;
          rStatusTxDoneQ <= 1'b0;
      end else begin
          rStatusRxDoneQ <= 1'b0;
          rStatusTxDoneQ <= 1'b0;
      end
      if(shiftEnW)begin
        rDataBufferQ <= {io_utmiDataI,rDataBufferQ[31 : 8]};
        rDataValidQ <= {(io_utmiRxValidI && io_utmiRxActiveI),rDataValidQ[3 : 1]};
        rDataCrcQ <= {(! io_utmiRxActiveI),rDataCrcQ[1]};
      end else begin
        rDataValidQ <= {rDataValidQ[3 : 1],(1'b0)};
      end
      rRxActiveQ <= {io_utmiRxActiveI,rRxActiveQ[3 : 1]};
      if((rStateQ == STATE_TX_PID)) begin
          rCrcSumQ <= (16'b1111111111111111);
      end else if((rStateQ == STATE_TX_DATA)) begin
          if(io_utmiTxReadyI)begin
            rCrcSumQ <= usbCrc16_1__io_crc_o;
          end
      end else if((rStateQ == STATE_RX_WAIT)) begin
          rCrcSumQ <= (16'b1111111111111111);
      end else if((rStateQ == STATE_RX_DATA)) begin
          if(dataReadyW)begin
            rCrcSumQ <= usbCrc16_1__io_crc_o;
          end else begin
            if((! rxActiveW))begin
              rStatusCrcErrQ <= (crcErrorW && statusResponseDataW);
            end
          end
      end else if((rStateQ == STATE_IDLE)) begin
          if((io_startI && (! io_sofTransferI)))begin
            rStatusCrcErrQ <= 1'b0;
          end
      end
      if((rStateQ == STATE_TX_CRC1)) begin
          rUtmiTxValidR <= 1'b1;
          rUtmiDataR <= (rCrcSumQ[7 : 0] ^ (8'b11111111));
      end else if((rStateQ == STATE_TX_CRC2)) begin
          rUtmiTxValidR <= 1'b1;
          rUtmiDataR <= (rCrcSumQ[15 : 8] ^ (8'b11111111));
      end else if((rStateQ == STATE_TX_TOKEN1)) begin
          rUtmiTxValidR <= 1'b1;
          rUtmiDataR <= io_tokenPidI;
      end else if((rStateQ == STATE_TX_TOKEN2)) begin
          rUtmiTxValidR <= 1'b1;
          rUtmiDataR <= tokenRevW[7 : 0];
      end else if((rStateQ == STATE_TX_TOKEN3)) begin
          rUtmiTxValidR <= 1'b1;
          rUtmiDataR <= tokenRevW[15 : 8];
      end else if((rStateQ == STATE_TX_PID)) begin
          rUtmiTxValidR <= 1'b1;
          rUtmiDataR <= (rSendData1Q ? PID_DATA1 : PID_DATA0);
      end else if((rStateQ == STATE_TX_ACKNAK)) begin
          rUtmiTxValidR <= 1'b1;
          rUtmiDataR <= PID_ACK;
      end else if((rStateQ == STATE_TX_DATA)) begin
          rUtmiTxValidR <= 1'b1;
          rUtmiDataR <= io_txDataI;
      end else begin
          rUtmiTxValidR <= 1'b0;
          rUtmiDataR <= (8'b00000000);
      end
    end
  end

endmodule

