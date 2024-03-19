module UsbHostHid (
      input   io_usbDif,
      inout  io_usbDp,
      inout  io_usbDn,
      output [7:0] io_led,
      output [15:0] io_rxCount,
      output  io_rxDone,
      output reg [159:0] io_hidReport,
      output  io_hidValid,
      input   clkout2,
      input   reset);
  wire  _zz_5_;
  wire [7:0] _zz_6_;
  wire [7:0] _zz_7_;
  wire [7:0] _zz_8_;
  wire [7:0] _zz_9_;
  wire [7:0] _zz_10_;
  wire [7:0] _zz_11_;
  wire [7:0] _zz_12_;
  wire [7:0] _zz_13_;
  wire [7:0] _zz_14_;
  wire [7:0] _zz_15_;
  wire [7:0] _zz_16_;
  wire [7:0] _zz_17_;
  wire [7:0] _zz_18_;
  wire [7:0] _zz_19_;
  wire [7:0] _zz_20_;
  wire [7:0] _zz_21_;
  wire [7:0] _zz_22_;
  wire [7:0] _zz_23_;
  wire [7:0] _zz_24_;
  wire [7:0] _zz_25_;
  wire [7:0] _zz_26_;
  wire  usbPhy_1__io_usbRst;
  wire  usbPhy_1__io_txdp;
  wire  usbPhy_1__io_txdn;
  wire  usbPhy_1__io_txoe;
  wire  usbPhy_1__io_ceO;
  wire  usbPhy_1__io_txReadyO;
  wire [7:0] usbPhy_1__io_dataInO;
  wire  usbPhy_1__io_rxValidO;
  wire  usbPhy_1__io_rxActiveO;
  wire  usbPhy_1__io_rxErrorO;
  wire [1:0] usbPhy_1__io_lineStateO;
  wire  usbhSie_1__io_ackO;
  wire  usbhSie_1__io_txPopO;
  wire [7:0] usbhSie_1__io_rxDataO;
  wire  usbhSie_1__io_rxPushO;
  wire  usbhSie_1__io_txDoneO;
  wire  usbhSie_1__io_rxDoneO;
  wire  usbhSie_1__io_crcErrO;
  wire  usbhSie_1__io_timeoutO;
  wire [7:0] usbhSie_1__io_responseO;
  wire [15:0] usbhSie_1__io_rxCountO;
  wire  usbhSie_1__io_idleO;
  wire  usbhSie_1__io_utmiLineCtrlO;
  wire [7:0] usbhSie_1__io_utmiDataO;
  wire  usbhSie_1__io_utmiTxValidO;
  wire [2:0] _zz_27_;
  wire [3:0] _zz_28_;
  wire [4:0] _zz_29_;
  wire [4:0] _zz_30_;
  wire [4:0] _zz_31_;
  wire [4:0] _zz_32_;
  wire [4:0] _zz_33_;
  wire [4:0] _zz_34_;
  wire [4:0] _zz_35_;
  wire [4:0] _zz_36_;
  wire [4:0] _zz_37_;
  wire [4:0] _zz_38_;
  wire [4:0] _zz_39_;
  wire [4:0] _zz_40_;
  wire [4:0] _zz_41_;
  wire [4:0] _zz_42_;
  wire [4:0] _zz_43_;
  wire [4:0] _zz_44_;
  wire [4:0] _zz_45_;
  wire [4:0] _zz_46_;
  wire [4:0] _zz_47_;
  wire [4:0] _zz_48_;
  wire [4:0] _zz_49_;
  reg  _zz_1_;
  reg  _zz_2_;
  reg  _zz_3_;
  wire  C_datastatus_enable;
  wire [1:0] C_STATE_DETACHED;
  wire [1:0] C_STATE_SETUP;
  wire [1:0] C_STATE_REPORT;
  wire [1:0] C_STATE_DATA;
  reg [7:0] rSetupRomAddr;
  reg [7:0] rSetupRomAddrAcked;
  reg [2:0] rSetupByteCounter;
  reg  rCtrlIn;
  reg  rDataStatus;
  reg [15:0] rPacketCounter;
  reg [1:0] rState;
  reg [4:0] rRetry;
  reg [17:0] rSlow;
  reg  rResetPending;
  reg  rResetAccepted;
  reg  startI;
  reg  rTimeout;
  reg  inTransferI;
  reg  sofTransferI;
  reg  respExpectedI;
  reg [7:0] tokenPidI;
  reg [6:0] tokenDevI;
  reg [3:0] tokenEpI;
  reg [15:0] dataLenI;
  reg  dataIdxI;
  reg  rSetAddressFound;
  reg [6:0] rDevAddressRequested;
  reg [6:0] rDevAddressConfirmed;
  reg [7:0] rStoredResponse;
  reg [15:0] rWLength;
  reg [15:0] rBytesRemaining;
  reg  rAdvanceData;
  reg  rFirstByte0Found;
  reg  rTxOverDebug;
  reg [10:0] rSofCounter;
  reg [15:0] rRxCount;
  reg  rRxDone;
  reg  rCrcErr;
  reg  rHidValid;
  wire  sRxd;
  wire  sRxdp;
  wire  sRxdn;
  wire  sTxdp;
  wire  sTxdn;
  wire  sTxoe;
  wire [63:0] sOled;
  wire  sLINECTRL;
  wire  sTXVALID;
  wire [7:0] sDATAOUT;
  wire  rxDoneO;
  wire  timeoutO;
  wire  idleO;
  wire [7:0] responseO;
  wire  txPopO;
  wire  txDoneO;
  wire [15:0] rxCountO;
  wire [7:0] rxDataO;
  wire  crcErrO;
  wire  rxPushO;
  wire [7:0] _zz_4_;
  wire [7:0] txDataI;
  wire [6:0] sSofDev;
  wire [3:0] sSofEp;
  wire [6:0] reverseTokenDevI;
  wire [3:0] reverseTokenEpI;
  wire  sReportLengthOK;
  wire  sTransmissionOver;
  reg [7:0] rReportBuf [0:19];
  reg [7:0] C_setup_rom [0:15];
  assign _zz_27_ = rSetupByteCounter[2 : 0];
  assign _zz_28_ = _zz_4_[3:0];
  assign _zz_29_ = rRxCount[4:0];
  assign _zz_30_ = (5'b00000);
  assign _zz_31_ = (5'b00001);
  assign _zz_32_ = (5'b00010);
  assign _zz_33_ = (5'b00011);
  assign _zz_34_ = (5'b00100);
  assign _zz_35_ = (5'b00101);
  assign _zz_36_ = (5'b00110);
  assign _zz_37_ = (5'b00111);
  assign _zz_38_ = (5'b01000);
  assign _zz_39_ = (5'b01001);
  assign _zz_40_ = (5'b01010);
  assign _zz_41_ = (5'b01011);
  assign _zz_42_ = (5'b01100);
  assign _zz_43_ = (5'b01101);
  assign _zz_44_ = (5'b01110);
  assign _zz_45_ = (5'b01111);
  assign _zz_46_ = (5'b10000);
  assign _zz_47_ = (5'b10001);
  assign _zz_48_ = (5'b10010);
  assign _zz_49_ = (5'b10011);
  always @ (posedge clkout2) begin
    if(_zz_3_) begin
      rReportBuf[_zz_29_] <= rxDataO;
    end
  end

  assign _zz_6_ = rReportBuf[_zz_30_];
  assign _zz_7_ = rReportBuf[_zz_31_];
  assign _zz_8_ = rReportBuf[_zz_32_];
  assign _zz_9_ = rReportBuf[_zz_33_];
  assign _zz_10_ = rReportBuf[_zz_34_];
  assign _zz_11_ = rReportBuf[_zz_35_];
  assign _zz_12_ = rReportBuf[_zz_36_];
  assign _zz_13_ = rReportBuf[_zz_37_];
  assign _zz_14_ = rReportBuf[_zz_38_];
  assign _zz_15_ = rReportBuf[_zz_39_];
  assign _zz_16_ = rReportBuf[_zz_40_];
  assign _zz_17_ = rReportBuf[_zz_41_];
  assign _zz_18_ = rReportBuf[_zz_42_];
  assign _zz_19_ = rReportBuf[_zz_43_];
  assign _zz_20_ = rReportBuf[_zz_44_];
  assign _zz_21_ = rReportBuf[_zz_45_];
  assign _zz_22_ = rReportBuf[_zz_46_];
  assign _zz_23_ = rReportBuf[_zz_47_];
  assign _zz_24_ = rReportBuf[_zz_48_];
  assign _zz_25_ = rReportBuf[_zz_49_];
  initial begin
    $readmemb("UsbHidTest.v_toplevel_coreArea_usbHostHid_C_setup_rom.bin",C_setup_rom);
  end
  assign _zz_26_ = C_setup_rom[_zz_28_];
  UsbPhy usbPhy_1_ ( 
    .io_phyTxMode(_zz_5_),
    .io_usbRst(usbPhy_1__io_usbRst),
    .io_rxd(sRxd),
    .io_rxdp(sRxdp),
    .io_rxdn(sRxdn),
    .io_txdp(usbPhy_1__io_txdp),
    .io_txdn(usbPhy_1__io_txdn),
    .io_txoe(usbPhy_1__io_txoe),
    .io_ceO(usbPhy_1__io_ceO),
    .io_lineCtrlI(sLINECTRL),
    .io_dataOutI(sDATAOUT),
    .io_txValidI(sTXVALID),
    .io_txReadyO(usbPhy_1__io_txReadyO),
    .io_dataInO(usbPhy_1__io_dataInO),
    .io_rxValidO(usbPhy_1__io_rxValidO),
    .io_rxActiveO(usbPhy_1__io_rxActiveO),
    .io_rxErrorO(usbPhy_1__io_rxErrorO),
    .io_lineStateO(usbPhy_1__io_lineStateO),
    .clkout2(clkout2),
    .reset(reset) 
  );
  UsbhSie usbhSie_1_ ( 
    .io_startI(startI),
    .io_inTransferI(inTransferI),
    .io_sofTransferI(sofTransferI),
    .io_respExpectedI(respExpectedI),
    .io_tokenPidI(tokenPidI),
    .io_tokenDevI(reverseTokenDevI),
    .io_tokenEpI(reverseTokenEpI),
    .io_dataLenI(dataLenI),
    .io_dataIdxI(dataIdxI),
    .io_txDataI(txDataI),
    .io_utmiTxReadyI(usbPhy_1__io_txReadyO),
    .io_utmiDataI(usbPhy_1__io_dataInO),
    .io_utmiRxValidI(usbPhy_1__io_rxValidO),
    .io_utmiRxActiveI(usbPhy_1__io_rxActiveO),
    .io_ackO(usbhSie_1__io_ackO),
    .io_txPopO(usbhSie_1__io_txPopO),
    .io_rxDataO(usbhSie_1__io_rxDataO),
    .io_rxPushO(usbhSie_1__io_rxPushO),
    .io_txDoneO(usbhSie_1__io_txDoneO),
    .io_rxDoneO(usbhSie_1__io_rxDoneO),
    .io_crcErrO(usbhSie_1__io_crcErrO),
    .io_timeoutO(usbhSie_1__io_timeoutO),
    .io_responseO(usbhSie_1__io_responseO),
    .io_rxCountO(usbhSie_1__io_rxCountO),
    .io_idleO(usbhSie_1__io_idleO),
    .io_utmiLineCtrlO(usbhSie_1__io_utmiLineCtrlO),
    .io_utmiDataO(usbhSie_1__io_utmiDataO),
    .io_utmiTxValidO(usbhSie_1__io_utmiTxValidO),
    .clkout2(clkout2),
    .reset(reset) 
  );
  assign io_usbDp = _zz_2_ ? sTxdn : 1'bz;
  assign io_usbDn = _zz_1_ ? sTxdp : 1'bz;
  always @ (*) begin
    _zz_1_ = 1'b0;
    if((! sTxoe))begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2_ = 1'b0;
    if((! sTxoe))begin
      _zz_2_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_3_ = 1'b0;
    if(rxPushO)begin
      _zz_3_ = 1'b1;
    end
  end

  assign C_datastatus_enable = 1'b0;
  assign C_STATE_DETACHED = (2'b00);
  assign C_STATE_SETUP = (2'b01);
  assign C_STATE_REPORT = (2'b10);
  assign C_STATE_DATA = (2'b11);
  assign _zz_4_ = rSetupRomAddr;
  assign txDataI = _zz_26_;
  assign sSofDev = rSofCounter[10 : 4];
  assign sSofEp = rSofCounter[3 : 0];
  assign reverseTokenDevI = {{{{{{tokenDevI[0],tokenDevI[1]},tokenDevI[2]},tokenDevI[3]},tokenDevI[4]},tokenDevI[5]},tokenDevI[6]};
  assign reverseTokenEpI = {{{tokenEpI[0],tokenEpI[1]},tokenEpI[2]},tokenEpI[3]};
  assign sReportLengthOK = (1'b0 ? (rRxCount == (16'b0000000000010100)) : (rRxCount != (16'b0000000000000000)));
  assign sRxd = (! io_usbDif);
  assign sRxdp = io_usbDn;
  assign sRxdn = io_usbDp;
  assign _zz_5_ = 1'b1;
  assign sTxdp = usbPhy_1__io_txdp;
  assign sTxdn = usbPhy_1__io_txdn;
  assign sTxoe = usbPhy_1__io_txoe;
  assign sTransmissionOver = (rxDoneO || (timeoutO && (! rTimeout)));
  assign txPopO = usbhSie_1__io_txPopO;
  assign rxDataO = usbhSie_1__io_rxDataO;
  assign rxPushO = usbhSie_1__io_rxPushO;
  assign txDoneO = usbhSie_1__io_txDoneO;
  assign rxDoneO = usbhSie_1__io_rxDoneO;
  assign crcErrO = usbhSie_1__io_crcErrO;
  assign timeoutO = usbhSie_1__io_timeoutO;
  assign responseO = usbhSie_1__io_responseO;
  assign rxCountO = usbhSie_1__io_rxCountO;
  assign idleO = usbhSie_1__io_idleO;
  assign sLINECTRL = usbhSie_1__io_utmiLineCtrlO;
  assign sDATAOUT = usbhSie_1__io_utmiDataO;
  assign sTXVALID = usbhSie_1__io_utmiTxValidO;
  always @ (*) begin
    io_hidReport[7 : 0] = _zz_6_;
    io_hidReport[15 : 8] = _zz_7_;
    io_hidReport[23 : 16] = _zz_8_;
    io_hidReport[31 : 24] = _zz_9_;
    io_hidReport[39 : 32] = _zz_10_;
    io_hidReport[47 : 40] = _zz_11_;
    io_hidReport[55 : 48] = _zz_12_;
    io_hidReport[63 : 56] = _zz_13_;
    io_hidReport[71 : 64] = _zz_14_;
    io_hidReport[79 : 72] = _zz_15_;
    io_hidReport[87 : 80] = _zz_16_;
    io_hidReport[95 : 88] = _zz_17_;
    io_hidReport[103 : 96] = _zz_18_;
    io_hidReport[111 : 104] = _zz_19_;
    io_hidReport[119 : 112] = _zz_20_;
    io_hidReport[127 : 120] = _zz_21_;
    io_hidReport[135 : 128] = _zz_22_;
    io_hidReport[143 : 136] = _zz_23_;
    io_hidReport[151 : 144] = _zz_24_;
    io_hidReport[159 : 152] = _zz_25_;
  end

  assign io_hidValid = rHidValid;
  assign io_rxCount = rxCountO;
  assign io_rxDone = rxDoneO;
  assign io_led = {{{{{(1'b0),rResetPending},rTxOverDebug},rSetupRomAddrAcked[3]},usbPhy_1__io_lineStateO},rState};
  always @ (posedge clkout2 or posedge reset) begin
    if (reset) begin
      rSetupRomAddr <= (8'b00000000);
      rSetupRomAddrAcked <= (8'b00000000);
      rSetupByteCounter <= (3'b000);
      rCtrlIn <= 1'b0;
      rDataStatus <= 1'b0;
      rPacketCounter <= (16'b0000000000000000);
      rState <= (2'b00);
      rRetry <= (5'b00000);
      rSlow <= (18'b000000000000000000);
      rResetPending <= 1'b1;
      rResetAccepted <= 1'b0;
      startI <= 1'b0;
      rTimeout <= 1'b0;
      inTransferI <= 1'b0;
      sofTransferI <= 1'b0;
      respExpectedI <= 1'b0;
      tokenPidI <= (8'b00000000);
      tokenDevI <= (7'b0000000);
      tokenEpI <= (4'b0000);
      dataLenI <= (16'b0000000000000000);
      dataIdxI <= 1'b0;
      rSetAddressFound <= 1'b0;
      rDevAddressRequested <= (7'b0000000);
      rDevAddressConfirmed <= (7'b0000000);
      rStoredResponse <= (8'b00000000);
      rWLength <= (16'b0000000000000000);
      rBytesRemaining <= (16'b0000000000000000);
      rAdvanceData <= 1'b0;
      rFirstByte0Found <= 1'b0;
      rTxOverDebug <= 1'b1;
      rSofCounter <= (11'b00000000000);
      rRxCount <= (16'b0000000000000000);
      rRxDone <= 1'b0;
      rCrcErr <= 1'b0;
      rHidValid <= 1'b0;
    end else begin
      rTimeout <= timeoutO;
      if(rResetAccepted)begin
        rSetupRomAddr <= (8'b00000000);
        rSetupRomAddrAcked <= (8'b00000000);
        rSetupByteCounter <= (3'b000);
        rRetry <= (5'b00000);
        rResetPending <= 1'b0;
        rTxOverDebug <= 1'b0;
      end else begin
        if((rState == C_STATE_DETACHED)) begin
            rDevAddressConfirmed <= (7'b0000000);
            rRetry <= (5'b00000);
        end else if((rState == C_STATE_SETUP)) begin
            if(sTransmissionOver)begin
              rTxOverDebug <= 1'b1;
              if((tokenPidI == (8'b00101101)))begin
                if((rxDoneO && (responseO == (8'b11010010))))begin
                  rSetupRomAddrAcked <= rSetupRomAddr;
                  rRetry <= (5'b00000);
                end else begin
                  rSetupRomAddr <= rSetupRomAddrAcked;
                  if((! rRetry[4]))begin
                    rRetry <= (rRetry + (5'b00001));
                  end
                end
              end
            end else begin
              if(txPopO)begin
                rSetupRomAddr <= (rSetupRomAddr + (8'b00000001));
                rSetupByteCounter <= (rSetupByteCounter + (3'b001));
              end
            end
            rStoredResponse <= (8'b00000000);
        end else if((rState == C_STATE_REPORT)) begin
            if(sTransmissionOver)begin
              if((timeoutO && (! rTimeout)))begin
                if((! rRetry[4]))begin
                  rRetry <= (rRetry + (5'b00001));
                end
              end else begin
                if(rxDoneO)begin
                  rRetry <= (5'b00000);
                end
              end
            end
        end else begin
            if(sTransmissionOver)begin
              if((tokenPidI == (8'b11100001)))begin
                if((rxDoneO && (responseO == (8'b11010010))))begin
                  rStoredResponse <= responseO;
                  rSetupRomAddrAcked <= rSetupRomAddr;
                  rRetry <= (5'b00000);
                end else begin
                  rSetupRomAddr <= rSetupRomAddrAcked;
                  if((! rRetry[4]))begin
                    rRetry <= (rRetry + (5'b00001));
                  end
                end
              end else begin
                if((timeoutO && (! rTimeout)))begin
                  if((! rRetry[4]))begin
                    rRetry <= (rRetry + (5'b00001));
                  end
                end else begin
                  if(rxDoneO)begin
                    rStoredResponse <= responseO;
                    if((responseO == (8'b01001011)))begin
                      rRetry <= (5'b00000);
                      rDevAddressConfirmed <= rDevAddressRequested;
                    end else begin
                      rRetry <= (rRetry + (5'b00001));
                    end
                  end
                end
              end
            end else begin
              if(txPopO)begin
                rSetupRomAddr <= (rSetupRomAddr + (8'b00000001));
              end
            end
        end
      end
      if((rState == C_STATE_DETACHED)) begin
          rDevAddressRequested <= (7'b0000000);
          rSetAddressFound <= 1'b0;
          rWLength <= (16'b0000000000000000);
      end else if((rState == C_STATE_SETUP)) begin
          case(_zz_27_)
            3'b000 : begin
              rFirstByte0Found <= (txDataI == (8'b00000000));
            end
            3'b001 : begin
              if((txDataI == (8'b00000101)))begin
                rSetAddressFound <= rFirstByte0Found;
              end
              rWLength <= (16'b0000000000000000);
            end
            3'b010 : begin
              if(rSetAddressFound)begin
                rDevAddressRequested <= txDataI[6 : 0];
              end
            end
            3'b110 : begin
              rWLength[7 : 0] <= txDataI;
            end
            3'b111 : begin
              rWLength[15 : 8] <= (8'b00000000);
            end
            default : begin
            end
          endcase
      end else begin
          rWLength <= (16'b0000000000000000);
          rSetAddressFound <= 1'b0;
      end
      rAdvanceData <= 1'b0;
      if((rState == C_STATE_DETACHED)) begin
          rResetAccepted <= 1'b0;
          if((usbPhy_1__io_lineStateO == (2'b01)))begin
            if((! rSlow[17]))begin
              rSlow <= (rSlow + (18'b000000000000000001));
            end else begin
              rSlow <= (18'b000000000000000000);
              sofTransferI <= 1'b1;
              inTransferI <= 1'b1;
              tokenPidI[1 : 0] <= (2'b11);
              tokenDevI <= (7'b0000000);
              respExpectedI <= 1'b0;
              rCtrlIn <= 1'b0;
              startI <= 1'b1;
              rPacketCounter <= (16'b0000000000000000);
              rSofCounter <= (11'b00000000000);
              rState <= C_STATE_SETUP;
            end
          end else begin
            startI <= 1'b0;
            rSlow <= (18'b000000000000000000);
          end
      end else if((rState == C_STATE_SETUP)) begin
          if(idleO)begin
            if((! rSlow[17]))begin
              rSlow <= (rSlow + (18'b000000000000000001));
              if(rRetry[4])begin
                rResetAccepted <= 1'b1;
                rState <= C_STATE_DETACHED;
              end
              if(((rSlow[11 : 0] == (12'b100000000000)) && 1'b1))begin
                sofTransferI <= 1'b1;
                inTransferI <= 1'b1;
                if(1'b1)begin
                  tokenPidI[1 : 0] <= (2'b00);
                end else begin
                  tokenPidI <= (8'b10100101);
                  tokenDevI <= sSofDev;
                  tokenEpI <= sSofEp;
                  dataLenI <= (16'b0000000000000000);
                  rSofCounter <= (rSofCounter + (11'b00000000001));
                end
                respExpectedI <= 1'b0;
                startI <= 1'b1;
              end else begin
                startI <= 1'b0;
              end
            end else begin
              rSlow <= (18'b000000000000000000);
              sofTransferI <= 1'b0;
              tokenDevI <= rDevAddressConfirmed;
              tokenEpI <= (4'b0000);
              respExpectedI <= 1'b1;
              if((rSetupRomAddr == (8'b00010000)))begin
                dataLenI <= (16'b0000000000000000);
                startI <= 1'b0;
                rState <= C_STATE_REPORT;
              end else begin
                inTransferI <= 1'b0;
                tokenPidI <= (8'b00101101);
                dataLenI <= (16'b0000000000001000);
                if(((rSetAddressFound || rCtrlIn) || (rWLength != (16'b0000000000000000))))begin
                  rBytesRemaining <= rWLength;
                  if(rSetAddressFound)begin
                    rCtrlIn <= 1'b1;
                    rDataStatus <= 1'b0;
                  end else begin
                    rDataStatus <= C_datastatus_enable;
                  end
                  dataIdxI <= 1'b1;
                  rState <= C_STATE_DATA;
                end else begin
                  dataIdxI <= 1'b0;
                  rCtrlIn <= txDataI[7];
                  rPacketCounter <= (rPacketCounter + (16'b0000000000000001));
                  startI <= 1'b1;
                end
              end
            end
          end else begin
            startI <= 1'b0;
          end
      end else if((rState == C_STATE_REPORT)) begin
          if(idleO)begin
            if((! rSlow[16]))begin
              rSlow <= (rSlow + (18'b000000000000000001));
              if(((rSlow[11 : 0] == (12'b100000000000)) && 1'b1))begin
                sofTransferI <= 1'b1;
                inTransferI <= 1'b1;
                if(1'b1)begin
                  tokenPidI[1 : 0] <= (2'b00);
                end else begin
                  tokenPidI <= (8'b10100101);
                  tokenDevI <= sSofDev;
                  tokenEpI <= sSofEp;
                  dataLenI <= (16'b0000000000000000);
                  rSofCounter <= (rSofCounter + (11'b00000000001));
                end
                respExpectedI <= 1'b0;
                startI <= 1'b1;
              end else begin
                startI <= 1'b0;
              end
            end else begin
              rSlow <= (18'b000000000000000000);
              sofTransferI <= 1'b0;
              inTransferI <= 1'b1;
              tokenPidI <= (8'b01101001);
              if((! 1'b1))begin
                tokenDevI <= rDevAddressConfirmed;
              end
              tokenEpI <= (4'b0001);
              dataIdxI <= 1'b0;
              respExpectedI <= 1'b1;
              startI <= 1'b1;
              if(((rResetPending || (usbPhy_1__io_lineStateO == (2'b00))) || rRetry[4]))begin
                rResetAccepted <= 1'b1;
                rState <= C_STATE_DETACHED;
              end
            end
          end else begin
            startI <= 1'b0;
          end
      end else begin
          if(idleO)begin
            if((! rSlow[17]))begin
              rSlow <= (rSlow + (18'b000000000000000001));
              if(rRetry[4])begin
                rResetAccepted <= 1'b1;
                rState <= C_STATE_DETACHED;
              end
              if(((rSlow[11 : 0] == (12'b100000000000)) && 1'b1))begin
                sofTransferI <= 1'b1;
                inTransferI <= 1'b1;
                if(1'b1)begin
                  tokenPidI[1 : 0] <= (2'b00);
                end else begin
                  tokenPidI <= (8'b10100101);
                  tokenDevI <= sSofDev;
                  tokenEpI <= sSofEp;
                  dataLenI <= (16'b0000000000000000);
                  rSofCounter <= (rSofCounter + (11'b00000000001));
                end
                respExpectedI <= 1'b0;
                startI <= 1'b1;
              end else begin
                startI <= 1'b0;
              end
            end else begin
              rSlow <= (18'b000000000000000000);
              sofTransferI <= 1'b0;
              inTransferI <= rCtrlIn;
              if(rCtrlIn)begin
                tokenPidI <= (8'b01101001);
              end else begin
                tokenPidI <= (8'b11100001);
              end
              if((! 1'b1))begin
                tokenDevI <= rDevAddressConfirmed;
              end
              tokenEpI <= (4'b0000);
              respExpectedI <= 1'b1;
              if((rBytesRemaining != (16'b0000000000000000)))begin
                if((rBytesRemaining[15 : 3] != (13'b0000000000000)))begin
                  dataLenI <= (16'b0000000000001000);
                end else begin
                  dataLenI <= {(13'b0000000000000),rBytesRemaining[2 : 0]};
                end
              end else begin
                dataLenI <= (16'b0000000000000000);
              end
              if(rCtrlIn)begin
                if(((rStoredResponse == (8'b01001011)) || (rStoredResponse == (8'b11000011))))begin
                  rAdvanceData <= 1'b1;
                  if((rBytesRemaining[15 : 3] == (13'b0000000000000)))begin
                    rCtrlIn <= 1'b0;
                    if((! rDataStatus))begin
                      rState <= C_STATE_SETUP;
                    end
                  end else begin
                    rAdvanceData <= 1'b1;
                    rPacketCounter <= (rPacketCounter + (16'b0000000000000001));
                    startI <= 1'b1;
                  end
                end else begin
                  rPacketCounter <= (rPacketCounter + (16'b0000000000000001));
                  startI <= 1'b1;
                end
              end else begin
                if((rStoredResponse == (8'b11010010)))begin
                  rAdvanceData <= 1'b1;
                  if(rDataStatus)begin
                    rState <= C_STATE_SETUP;
                  end else begin
                    if((rBytesRemaining == (16'b0000000000000000)))begin
                      rCtrlIn <= 1'b1;
                    end
                  end
                end else begin
                  rPacketCounter <= (rPacketCounter + (16'b0000000000000001));
                  startI <= 1'b1;
                end
              end
            end
          end else begin
            startI <= 1'b0;
          end
          if(rAdvanceData)begin
            if((rBytesRemaining != (16'b0000000000000000)))begin
              if((rBytesRemaining[15 : 3] != (13'b0000000000000)))begin
                rBytesRemaining[15 : 3] <= (rBytesRemaining[15 : 3] - (13'b0000000000001));
              end else begin
                rBytesRemaining[2 : 0] <= (3'b000);
              end
              dataIdxI <= (! dataIdxI);
            end else begin
              if(rCtrlIn)begin
                dataIdxI <= 1'b1;
              end
            end
          end
      end
      rRxCount <= rxCountO;
      rRxDone <= rxDoneO;
      if((rRxDone && (! rxDoneO)))begin
        rCrcErr <= 1'b0;
      end else begin
        if(crcErrO)begin
          rCrcErr <= 1'b1;
        end
      end
      rHidValid <= (((((rRxDone && (! rxDoneO)) && (! rCrcErr)) && (! timeoutO)) && (rState == C_STATE_REPORT)) && sReportLengthOK);
    end
  end

endmodule

