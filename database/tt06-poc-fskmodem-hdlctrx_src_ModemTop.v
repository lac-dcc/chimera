// This program was cloned from: https://github.com/dlmiles/tt06-poc-fskmodem-hdlctrx
// License: Apache License 2.0

// Generator : SpinalHDL dev    git head : efcba5fcd17d0cfe48fa0981e8dec6e70234b294
// Component : ModemTop

`ifdef TIMESCALE
`timescale 1ns/1ps
`endif

module ModemTop (
  input               ena /* verilator public */ ,
  output reg [7:0]    uo_out /* verilator public */ ,
  input      [7:0]    ui_in /* verilator public */ ,
  output reg [7:0]    uio_out /* verilator public */ ,
  input      [7:0]    uio_in /* verilator public */ ,
  output     [7:0]    uio_oe /* verilator public */ ,
  input               simulation_z /* verilator public */ ,
  input      [15:0]   latched /* verilator public */ ,
  input               rst_n,
  input               clk
);

  wire                layer_io_resetCondx;
  wire                control_io_txClockStb;
  wire       [5:0]    control_io_addr6;
  wire                control_io_upDownOut;
  wire                control_io_rxClock;
  wire       [7:0]    control_io_txDac8;
  wire       [7:0]    control_io_rxDac8;
  wire                control_io_uartTxClock;
  wire                control_io_uartRxClock;
  wire                uart_io_isSending;
  wire                uart_io_txData;
  wire                uart_io_uartTxOut;
  wire                uart_io_uartCtsOut;
  wire                layer_io_txerror;
  wire                layer_io_rxerror;
  wire                layer_io_sending;
  wire       [7:0]    _zz_cfgTxBertMode;
  wire       [3:0]    _zz_dcdPopcount_9;
  reg        [3:0]    _zz_dcdPopcount_10;
  wire       [2:0]    _zz_dcdPopcount_11;
  reg        [3:0]    _zz_dcdPopcount_12;
  wire       [2:0]    _zz_dcdPopcount_13;
  reg        [3:0]    _zz_dcdPopcount_14;
  wire       [2:0]    _zz_dcdPopcount_15;
  wire       [1:0]    _zz_dcdPopcount_16;
  wire                cfgUartRxPrescale;
  wire                cfgUartTxPrescale;
  wire                cfgRxData;
  wire                cfgTxData;
  wire                cfgRxClockDirection;
  wire                cfgUpDownSource;
  wire                cfgAddrDirection;
  wire                cfgTableLatency;
  wire                cfgRxClockSource;
  wire       [1:0]    cfgTxBertMode;
  reg        [7:0]    oe;
  wire                rxDataIn;
  wire                txDataIn;
  wire                uartRtsIn;
  wire       [3:0]    rom4;
  wire                uartRxIn;
  wire                rxClockIn;
  wire                upDownIn;
  wire       [5:0]    addr6In;
  wire                sim;
  wire                dcdHistory_0;
  reg                 dcdHistory_1;
  reg                 dcdHistory_2;
  reg                 dcdHistory_3;
  reg                 dcdHistory_4;
  reg                 dcdHistory_5;
  reg                 dcdHistory_6;
  reg                 dcdHistory_7;
  wire       [7:0]    _zz_dcdPopcount;
  wire       [3:0]    _zz_dcdPopcount_1;
  wire       [3:0]    _zz_dcdPopcount_2;
  wire       [3:0]    _zz_dcdPopcount_3;
  wire       [3:0]    _zz_dcdPopcount_4;
  wire       [3:0]    _zz_dcdPopcount_5;
  wire       [3:0]    _zz_dcdPopcount_6;
  wire       [3:0]    _zz_dcdPopcount_7;
  wire       [3:0]    _zz_dcdPopcount_8;
  wire       [3:0]    dcdPopcount;
  wire                fakeDcd;
  reg                 uartRtsIn_regNext;

  assign _zz_cfgTxBertMode = latched[15 : 8];
  assign _zz_dcdPopcount_9 = (_zz_dcdPopcount_10 + _zz_dcdPopcount_12);
  assign _zz_dcdPopcount_16 = {_zz_dcdPopcount[7],_zz_dcdPopcount[6]};
  assign _zz_dcdPopcount_15 = {1'd0, _zz_dcdPopcount_16};
  assign _zz_dcdPopcount_11 = {_zz_dcdPopcount[2],{_zz_dcdPopcount[1],_zz_dcdPopcount[0]}};
  assign _zz_dcdPopcount_13 = {_zz_dcdPopcount[5],{_zz_dcdPopcount[4],_zz_dcdPopcount[3]}};
  ModemControl control (
    .io_sim               (sim                   ), //i
    .io_cfgUartTxPrescale (cfgUartTxPrescale     ), //i
    .io_cfgUartRxPrescale (cfgUartRxPrescale     ), //i
    .io_cfgTableLatency   (cfgTableLatency       ), //i
    .io_cfgUpDownSource   (cfgUpDownSource       ), //i
    .io_rom4              (rom4[3:0]             ), //i
    .io_upDownIn          (upDownIn              ), //i
    .io_rxClockIn         (rxClockIn             ), //i
    .io_txData            (uart_io_txData        ), //i
    .io_rxDataRawIn       (rxDataIn              ), //i
    .io_txClockStb        (control_io_txClockStb ), //o
    .io_addr6             (control_io_addr6[5:0] ), //o
    .io_upDownOut         (control_io_upDownOut  ), //o
    .io_rxClock           (control_io_rxClock    ), //o
    .io_txDac8            (control_io_txDac8[7:0]), //o
    .io_rxDac8            (control_io_rxDac8[7:0]), //o
    .io_uartTxClock       (control_io_uartTxClock), //o
    .io_uartRxClock       (control_io_uartRxClock), //o
    .rst_n                (rst_n                 ), //i
    .clk                  (clk                   )  //i
  );
  UartControl uart (
    .io_sim               (sim                   ), //i
    .io_analogRxRawDataIn (1'b0                  ), //i
    .io_extRxRawDataIn    (1'b0                  ), //i
    .io_cfgTxData         (cfgTxData             ), //i
    .io_cfgTxBertMode     (cfgTxBertMode[1:0]    ), //i
    .io_cfgRxDataSource   (3'b010                ), //i
    .io_txDataIn          (txDataIn              ), //i
    .io_isSending         (uart_io_isSending     ), //o
    .io_txData            (uart_io_txData        ), //o
    .io_uartRxIn          (uartRxIn              ), //i
    .io_uartRtsIn         (uartRtsIn             ), //i
    .io_txClockStb        (control_io_uartTxClock), //i
    .io_rxClockStb        (control_io_uartRxClock), //i
    .io_uartTxOut         (uart_io_uartTxOut     ), //o
    .io_uartCtsOut        (uart_io_uartCtsOut    ), //o
    .rst_n                (rst_n                 ), //i
    .clk                  (clk                   )  //i
  );
  LayerControl layer (
    .io_resetCondx     (layer_io_resetCondx), //i
    .io_hdlcTxActive   (1'b0               ), //i
    .io_hdlcFrameError (1'b0               ), //i
    .io_hdlcCrcError   (1'b0               ), //i
    .io_hdlcUnderrun   (1'b0               ), //i
    .io_txerror        (layer_io_txerror   ), //o
    .io_rxerror        (layer_io_rxerror   ), //o
    .io_sending        (layer_io_sending   ), //o
    .clk               (clk                ), //i
    .rst_n             (rst_n              )  //i
  );
  always @(*) begin
    case(_zz_dcdPopcount_11)
      3'b000 : _zz_dcdPopcount_10 = _zz_dcdPopcount_1;
      3'b001 : _zz_dcdPopcount_10 = _zz_dcdPopcount_2;
      3'b010 : _zz_dcdPopcount_10 = _zz_dcdPopcount_3;
      3'b011 : _zz_dcdPopcount_10 = _zz_dcdPopcount_4;
      3'b100 : _zz_dcdPopcount_10 = _zz_dcdPopcount_5;
      3'b101 : _zz_dcdPopcount_10 = _zz_dcdPopcount_6;
      3'b110 : _zz_dcdPopcount_10 = _zz_dcdPopcount_7;
      default : _zz_dcdPopcount_10 = _zz_dcdPopcount_8;
    endcase
  end

  always @(*) begin
    case(_zz_dcdPopcount_13)
      3'b000 : _zz_dcdPopcount_12 = _zz_dcdPopcount_1;
      3'b001 : _zz_dcdPopcount_12 = _zz_dcdPopcount_2;
      3'b010 : _zz_dcdPopcount_12 = _zz_dcdPopcount_3;
      3'b011 : _zz_dcdPopcount_12 = _zz_dcdPopcount_4;
      3'b100 : _zz_dcdPopcount_12 = _zz_dcdPopcount_5;
      3'b101 : _zz_dcdPopcount_12 = _zz_dcdPopcount_6;
      3'b110 : _zz_dcdPopcount_12 = _zz_dcdPopcount_7;
      default : _zz_dcdPopcount_12 = _zz_dcdPopcount_8;
    endcase
  end

  always @(*) begin
    case(_zz_dcdPopcount_15)
      3'b000 : _zz_dcdPopcount_14 = _zz_dcdPopcount_1;
      3'b001 : _zz_dcdPopcount_14 = _zz_dcdPopcount_2;
      3'b010 : _zz_dcdPopcount_14 = _zz_dcdPopcount_3;
      3'b011 : _zz_dcdPopcount_14 = _zz_dcdPopcount_4;
      3'b100 : _zz_dcdPopcount_14 = _zz_dcdPopcount_5;
      3'b101 : _zz_dcdPopcount_14 = _zz_dcdPopcount_6;
      3'b110 : _zz_dcdPopcount_14 = _zz_dcdPopcount_7;
      default : _zz_dcdPopcount_14 = _zz_dcdPopcount_8;
    endcase
  end

  always @(*) begin
    uo_out = 8'bxxxxxxxx;
    uo_out[0] = uart_io_uartTxOut;
    uo_out[1] = uart_io_uartCtsOut;
    uo_out[2] = fakeDcd;
    uo_out[3] = layer_io_rxerror;
    uo_out[4] = layer_io_txerror;
    uo_out[5] = uart_io_isSending;
    uo_out[6] = 1'b0;
    uo_out[7] = control_io_txClockStb;
  end

  always @(*) begin
    uio_out = 8'bxxxxxxxx;
    uio_out[0] = control_io_rxClock;
    uio_out[1] = control_io_upDownOut;
    uio_out[7 : 2] = control_io_addr6;
  end

  assign cfgUartRxPrescale = latched[0];
  assign cfgUartTxPrescale = latched[1];
  assign cfgRxData = latched[2];
  assign cfgTxData = latched[3];
  assign cfgRxClockDirection = (latched[5] ? 1'b0 : 1'b1);
  assign cfgUpDownSource = (latched[6] ? 1'b0 : 1'b1);
  assign cfgAddrDirection = (latched[7] ? 1'b0 : 1'b1);
  assign cfgTableLatency = latched[12];
  assign cfgRxClockSource = latched[13];
  assign cfgTxBertMode = _zz_cfgTxBertMode[7 : 6];
  always @(*) begin
    oe[0] = cfgRxClockDirection;
    oe[1] = cfgUpDownSource;
    oe[2] = cfgAddrDirection;
    oe[3] = cfgAddrDirection;
    oe[4] = cfgAddrDirection;
    oe[5] = cfgAddrDirection;
    oe[6] = cfgAddrDirection;
    oe[7] = cfgAddrDirection;
  end

  assign uio_oe = oe;
  assign rxDataIn = ui_in[0];
  assign txDataIn = ui_in[1];
  assign uartRtsIn = ui_in[2];
  assign rom4 = ui_in[6 : 3];
  assign uartRxIn = ui_in[7];
  assign rxClockIn = uio_in[0];
  assign upDownIn = uio_in[1];
  assign addr6In = uio_in[7 : 2];
  assign sim = 1'b1;
  assign dcdHistory_0 = control_io_upDownOut;
  assign _zz_dcdPopcount = {dcdHistory_7,{dcdHistory_6,{dcdHistory_5,{dcdHistory_4,{dcdHistory_3,{dcdHistory_2,{dcdHistory_1,dcdHistory_0}}}}}}};
  assign _zz_dcdPopcount_1 = 4'b0000;
  assign _zz_dcdPopcount_2 = 4'b0001;
  assign _zz_dcdPopcount_3 = 4'b0001;
  assign _zz_dcdPopcount_4 = 4'b0010;
  assign _zz_dcdPopcount_5 = 4'b0001;
  assign _zz_dcdPopcount_6 = 4'b0010;
  assign _zz_dcdPopcount_7 = 4'b0010;
  assign _zz_dcdPopcount_8 = 4'b0011;
  assign dcdPopcount = (_zz_dcdPopcount_9 + _zz_dcdPopcount_14);
  assign fakeDcd = ((4'b0011 <= dcdPopcount) && (dcdPopcount <= 4'b0101));
  assign layer_io_resetCondx = (uartRtsIn && (! uartRtsIn_regNext));
  always @(posedge clk) begin
    if(!rst_n) begin
      dcdHistory_1 <= 1'b0;
      dcdHistory_2 <= 1'b0;
      dcdHistory_3 <= 1'b0;
      dcdHistory_4 <= 1'b0;
      dcdHistory_5 <= 1'b0;
      dcdHistory_6 <= 1'b0;
      dcdHistory_7 <= 1'b0;
    end else begin
      if(control_io_rxClock) begin
        dcdHistory_1 <= dcdHistory_0;
      end
      if(control_io_rxClock) begin
        dcdHistory_2 <= dcdHistory_1;
      end
      if(control_io_rxClock) begin
        dcdHistory_3 <= dcdHistory_2;
      end
      if(control_io_rxClock) begin
        dcdHistory_4 <= dcdHistory_3;
      end
      if(control_io_rxClock) begin
        dcdHistory_5 <= dcdHistory_4;
      end
      if(control_io_rxClock) begin
        dcdHistory_6 <= dcdHistory_5;
      end
      if(control_io_rxClock) begin
        dcdHistory_7 <= dcdHistory_6;
      end
    end
  end

  always @(posedge clk) begin
    uartRtsIn_regNext <= uartRtsIn;
  end


endmodule

module LayerControl (
  input               io_resetCondx,
  input               io_hdlcTxActive,
  input               io_hdlcFrameError,
  input               io_hdlcCrcError,
  input               io_hdlcUnderrun,
  output reg          io_txerror,
  output reg          io_rxerror,
  output              io_sending,
  input               clk,
  input               rst_n
);

  reg                 txErrorReg;
  reg                 rxErrorReg;
  wire                when_ModemTop_l1247;

  always @(*) begin
    io_txerror = txErrorReg;
    if(!io_resetCondx) begin
      if(io_hdlcUnderrun) begin
        io_txerror = 1'b1;
      end
    end
  end

  always @(*) begin
    io_rxerror = rxErrorReg;
    if(!io_resetCondx) begin
      if(when_ModemTop_l1247) begin
        io_rxerror = 1'b1;
      end
    end
  end

  assign io_sending = io_hdlcTxActive;
  assign when_ModemTop_l1247 = (io_hdlcFrameError || io_hdlcCrcError);
  always @(posedge clk) begin
    if(!rst_n) begin
      txErrorReg <= 1'b0;
      rxErrorReg <= 1'b0;
    end else begin
      if(io_resetCondx) begin
        txErrorReg <= 1'b0;
        rxErrorReg <= 1'b0;
      end else begin
        if(io_hdlcUnderrun) begin
          txErrorReg <= 1'b1;
        end
        if(when_ModemTop_l1247) begin
          rxErrorReg <= 1'b1;
        end
      end
    end
  end


endmodule

module UartControl (
  input               io_sim,
  input               io_analogRxRawDataIn,
  input               io_extRxRawDataIn,
  input               io_cfgTxData,
  input      [1:0]    io_cfgTxBertMode,
  input      [2:0]    io_cfgRxDataSource,
  input               io_txDataIn,
  output              io_isSending,
  output              io_txData,
  input               io_uartRxIn,
  input               io_uartRtsIn,
  input               io_txClockStb,
  input               io_rxClockStb,
  output              io_uartTxOut,
  output              io_uartCtsOut,
  input               rst_n,
  input               clk
);

  reg                 rxUart_io_ready;
  reg                 rxFifo_io_dataOutEn;
  wire                txHdlc_io_wantFrameEnd;
  reg                 txFifo_io_dataInEn;
  wire                tx_io_valid;
  reg                 rxHdlc_io_ready;
  wire                rxHdlc_io_bertReset;
  wire       [7:0]    rxUart_io_payload;
  wire                rxUart_io_valid;
  wire                rxUart_io_eoverrun;
  wire       [7:0]    rxFifo_io_dataOut;
  wire                rxFifo_io_full;
  wire                rxFifo_io_almostFull;
  wire                rxFifo_io_almostEmpty;
  wire                rxFifo_io_empty;
  wire                rxFifo_io_eoverrun;
  wire                txPacketUpper_io_ready;
  wire       [7:0]    txPacketUpper_io_txPayload;
  wire                txPacketUpper_io_txValid;
  wire                txPacketUpper_io_raiseError;
  wire                txPacketUpper_io_frameEnd;
  wire                txCommandDecoder_io_ready;
  wire       [7:0]    txCommandDecoder_io_txPayload;
  wire                txCommandDecoder_io_txValid;
  wire                txCommandDecoder_io_wantTx;
  wire                txCommandDecoder_io_wantAbort;
  wire                txHdlc_io_ready;
  wire                txHdlc_io_txDataOut;
  wire                txHdlc_io_isSending;
  wire                txHdlc_io_underrunError;
  wire       [7:0]    txFifo_io_dataOut;
  wire                txFifo_io_full;
  wire                txFifo_io_almostFull;
  wire                txFifo_io_almostEmpty;
  wire                txFifo_io_empty;
  wire                txFifo_io_eoverrun;
  wire                tx_io_ready;
  wire                tx_io_uartTxOut;
  wire       [16:0]   descram_io_vecOut;
  wire                descram_io_dataOut;
  wire       [7:0]    rxHdlc_io_payload;
  wire                rxHdlc_io_valid;
  wire                rxHdlc_io_isRecving;
  wire                rxHdlc_io_rxDataOut;
  wire                rxHdlc_io_rxAbort;
  wire                rxHdlc_io_rxCrcError;
  wire                rxHdlc_io_rxOverrun;
  wire                rxHdlc_io_rxFrame;
  wire       [11:0]   rxHdlc_io_bertCount;
  wire                rxFifoValid;
  reg                 uart_txPacketUpper_io_ready_regNext;
  wire                when_ModemTop_l1107;
  reg                 uart_txCommandDecoder_io_wantTx_regNext;
  wire       [1:0]    switch_Misc_l226;
  reg                 rxRawDataSource;
  wire       [0:0]    switch_Misc_l226_1;
  reg                 rxDataSource;
  wire                when_ModemTop_l1164;
  reg                 txDataSource;
  reg                 txData;

  UartRx rxUart (
    .io_rxClockStb (io_rxClockStb         ), //i
    .io_uartRxIn   (io_uartRxIn           ), //i
    .io_ready      (rxUart_io_ready       ), //i
    .io_payload    (rxUart_io_payload[7:0]), //o
    .io_valid      (rxUart_io_valid       ), //o
    .io_eoverrun   (rxUart_io_eoverrun    ), //o
    .clk           (clk                   ), //i
    .rst_n         (rst_n                 )  //i
  );
  UartFifo rxFifo (
    .io_dataIn      (rxUart_io_payload[7:0]), //i
    .io_dataInEn    (rxUart_io_valid       ), //i
    .io_dataOutEn   (rxFifo_io_dataOutEn   ), //i
    .io_dataOut     (rxFifo_io_dataOut[7:0]), //o
    .io_full        (rxFifo_io_full        ), //o
    .io_almostFull  (rxFifo_io_almostFull  ), //o
    .io_almostEmpty (rxFifo_io_almostEmpty ), //o
    .io_empty       (rxFifo_io_empty       ), //o
    .io_eoverrun    (rxFifo_io_eoverrun    ), //o
    .clk            (clk                   ), //i
    .rst_n          (rst_n                 )  //i
  );
  KissDecoder txPacketUpper (
    .io_valid      (rxFifoValid                    ), //i
    .io_payload    (rxFifo_io_dataOut[7:0]         ), //i
    .io_ready      (txPacketUpper_io_ready         ), //o
    .io_txReady    (txCommandDecoder_io_ready      ), //i
    .io_txPayload  (txPacketUpper_io_txPayload[7:0]), //o
    .io_txValid    (txPacketUpper_io_txValid       ), //o
    .io_raiseError (txPacketUpper_io_raiseError    ), //o
    .io_frameEnd   (txPacketUpper_io_frameEnd      ), //o
    .clk           (clk                            ), //i
    .rst_n         (rst_n                          )  //i
  );
  CommandDecoder txCommandDecoder (
    .io_valid         (txPacketUpper_io_txValid          ), //i
    .io_payload       (txPacketUpper_io_txPayload[7:0]   ), //i
    .io_ready         (txCommandDecoder_io_ready         ), //o
    .io_txReady       (txHdlc_io_ready                   ), //i
    .io_txPayload     (txCommandDecoder_io_txPayload[7:0]), //o
    .io_txValid       (txCommandDecoder_io_txValid       ), //o
    .io_upperError    (txPacketUpper_io_raiseError       ), //i
    .io_upperFrameEnd (txPacketUpper_io_frameEnd         ), //i
    .io_wantTx        (txCommandDecoder_io_wantTx        ), //o
    .io_wantAbort     (txCommandDecoder_io_wantAbort     ), //o
    .clk              (clk                               ), //i
    .rst_n            (rst_n                             )  //i
  );
  HdlcTx txHdlc (
    .io_payload       (txCommandDecoder_io_txPayload[7:0]), //i
    .io_valid         (txCommandDecoder_io_txValid       ), //i
    .io_ready         (txHdlc_io_ready                   ), //o
    .io_txClockStb    (io_txClockStb                     ), //i
    .io_wantAbort     (txCommandDecoder_io_wantAbort     ), //i
    .io_wantFrameEnd  (txHdlc_io_wantFrameEnd            ), //i
    .io_wantTx        (txCommandDecoder_io_wantTx        ), //i
    .io_txDataOut     (txHdlc_io_txDataOut               ), //o
    .io_isSending     (txHdlc_io_isSending               ), //o
    .io_underrunError (txHdlc_io_underrunError           ), //o
    .clk              (clk                               ), //i
    .rst_n            (rst_n                             )  //i
  );
  UartFifo_1 txFifo (
    .io_dataIn      (rxHdlc_io_payload[7:0]), //i
    .io_dataInEn    (txFifo_io_dataInEn    ), //i
    .io_dataOutEn   (tx_io_ready           ), //i
    .io_dataOut     (txFifo_io_dataOut[7:0]), //o
    .io_full        (txFifo_io_full        ), //o
    .io_almostFull  (txFifo_io_almostFull  ), //o
    .io_almostEmpty (txFifo_io_almostEmpty ), //o
    .io_empty       (txFifo_io_empty       ), //o
    .io_eoverrun    (txFifo_io_eoverrun    ), //o
    .clk            (clk                   ), //i
    .rst_n          (rst_n                 )  //i
  );
  UartTx tx (
    .io_txClockStb (io_txClockStb         ), //i
    .io_data       (txFifo_io_dataOut[7:0]), //i
    .io_valid      (tx_io_valid           ), //i
    .io_ready      (tx_io_ready           ), //o
    .io_uartTxOut  (tx_io_uartTxOut       ), //o
    .clk           (clk                   ), //i
    .rst_n         (rst_n                 )  //i
  );
  Descrambler descram (
    .io_dataIn  (rxRawDataSource        ), //i
    .io_en      (io_rxClockStb          ), //i
    .io_sim     (io_sim                 ), //i
    .io_vecOut  (descram_io_vecOut[16:0]), //o
    .io_dataOut (descram_io_dataOut     ), //o
    .rst_n      (rst_n                  ), //i
    .clk        (clk                    )  //i
  );
  HdlcRx rxHdlc (
    .io_payload    (rxHdlc_io_payload[7:0]   ), //o
    .io_valid      (rxHdlc_io_valid          ), //o
    .io_ready      (rxHdlc_io_ready          ), //i
    .io_rxClockStb (io_txClockStb            ), //i
    .io_rxDataIn   (rxDataSource             ), //i
    .io_isRecving  (rxHdlc_io_isRecving      ), //o
    .io_rxDataOut  (rxHdlc_io_rxDataOut      ), //o
    .io_rxAbort    (rxHdlc_io_rxAbort        ), //o
    .io_rxCrcError (rxHdlc_io_rxCrcError     ), //o
    .io_rxOverrun  (rxHdlc_io_rxOverrun      ), //o
    .io_rxFrame    (rxHdlc_io_rxFrame        ), //o
    .io_bertReset  (rxHdlc_io_bertReset      ), //i
    .io_bertCount  (rxHdlc_io_bertCount[11:0]), //o
    .clk           (clk                      ), //i
    .rst_n         (rst_n                    )  //i
  );
  always @(*) begin
    rxUart_io_ready = 1'b0;
    if(rxUart_io_valid) begin
      rxUart_io_ready = 1'b1;
    end
  end

  assign rxFifoValid = (! rxFifo_io_empty);
  assign when_ModemTop_l1107 = (txPacketUpper_io_ready && (! uart_txPacketUpper_io_ready_regNext));
  always @(*) begin
    if(when_ModemTop_l1107) begin
      rxFifo_io_dataOutEn = 1'b1;
    end else begin
      rxFifo_io_dataOutEn = 1'b0;
    end
  end

  assign txHdlc_io_wantFrameEnd = ((! txCommandDecoder_io_wantTx) && uart_txCommandDecoder_io_wantTx_regNext);
  assign tx_io_valid = (! txFifo_io_empty);
  assign switch_Misc_l226 = io_cfgRxDataSource[1 : 0];
  always @(*) begin
    case(switch_Misc_l226)
      2'b00 : begin
        rxRawDataSource = io_analogRxRawDataIn;
      end
      2'b01 : begin
        rxRawDataSource = io_extRxRawDataIn;
      end
      2'b10 : begin
        rxRawDataSource = txHdlc_io_txDataOut;
      end
      default : begin
        rxRawDataSource = io_analogRxRawDataIn;
      end
    endcase
  end

  assign switch_Misc_l226_1 = io_cfgRxDataSource[2];
  always @(*) begin
    case(switch_Misc_l226_1)
      1'b0 : begin
        rxDataSource = descram_io_dataOut;
      end
      default : begin
        rxDataSource = io_extRxRawDataIn;
      end
    endcase
  end

  always @(*) begin
    rxHdlc_io_ready = 1'b0;
    if(when_ModemTop_l1164) begin
      rxHdlc_io_ready = 1'b1;
    end
  end

  always @(*) begin
    txFifo_io_dataInEn = 1'b0;
    if(when_ModemTop_l1164) begin
      txFifo_io_dataInEn = rxHdlc_io_valid;
    end
  end

  assign when_ModemTop_l1164 = (rxHdlc_io_valid && (! txFifo_io_full));
  assign rxHdlc_io_bertReset = (! rst_n);
  always @(*) begin
    case(io_cfgTxData)
      1'b0 : begin
        txDataSource = txHdlc_io_txDataOut;
      end
      default : begin
        txDataSource = io_txDataIn;
      end
    endcase
  end

  always @(*) begin
    case(io_cfgTxBertMode)
      2'b00 : begin
        txData = txDataSource;
      end
      2'b01 : begin
        txData = (! txDataSource);
      end
      2'b10 : begin
        txData = 1'b0;
      end
      default : begin
        txData = 1'b1;
      end
    endcase
  end

  assign io_isSending = txHdlc_io_isSending;
  assign io_txData = txData;
  assign io_uartCtsOut = rxFifo_io_almostFull;
  assign io_uartTxOut = tx_io_uartTxOut;
  always @(posedge clk) begin
    uart_txPacketUpper_io_ready_regNext <= txPacketUpper_io_ready;
    uart_txCommandDecoder_io_wantTx_regNext <= txCommandDecoder_io_wantTx;
  end


endmodule

module ModemControl (
  input               io_sim,
  input               io_cfgUartTxPrescale,
  input               io_cfgUartRxPrescale,
  input               io_cfgTableLatency,
  input               io_cfgUpDownSource,
  input      [3:0]    io_rom4,
  input               io_upDownIn,
  input               io_rxClockIn,
  input               io_txData,
  input               io_rxDataRawIn,
  output              io_txClockStb,
  output     [5:0]    io_addr6,
  output              io_upDownOut,
  output              io_rxClock,
  output     [7:0]    io_txDac8,
  output     [7:0]    io_rxDac8,
  output              io_uartTxClock,
  output              io_uartRxClock,
  input               rst_n,
  input               clk
);

  wire       [16:0]   scrambler_1_io_vecOut;
  wire                scrambler_1_io_dataOut;
  wire       [7:0]    _zz_rxClockInternal;
  reg        [5:0]    tablePhase;
  wire                when_ModemTop_l1317;
  wire                rxClockFixed;
  wire                _zz_rxClockFixedStb;
  reg                 _zz_rxClockFixedStb_regNext;
  wire                rxClockFixedStb;
  wire                txClock;
  wire                _zz_txClockStb;
  reg                 _zz_txClockStb_regNext;
  wire                txClockStb;
  wire                _zz_;
  reg                 _zz__regNext;
  wire                _zz__1;
  reg                 _zz__1_regNext;
  reg                 _zz_io_uartTxClock;
  wire                _zz__2;
  reg                 _zz__2_regNext;
  wire                _zz__3;
  reg                 _zz__3_regNext;
  reg                 _zz_io_uartRxClock;
  reg        [3:0]    rxCtr;
  wire                txClock2;
  wire                txClock3;
  reg        [7:0]    rxAddr8;
  wire       [11:0]   rxAddr;
  wire                rxClock;
  wire                when_ModemTop_l1371;
  wire                txClockInternal;
  wire                _zz_txClockInternalRiseStb;
  reg                 _zz_txClockInternalRiseStb_regNext;
  wire                txClockInternalRiseStb;
  wire                _zz_txClockInternalFallStb;
  reg                 _zz_txClockInternalFallStb_regNext;
  wire                txClockInternalFallStb;
  reg                 txDataAfterReg;
  reg        [11:0]   txAddr12;
  wire       [1:0]    switch_Misc_l226;
  reg        [5:0]    table6;
  reg        [7:0]    txDac;
  reg        [3:0]    txDacTmp;
  reg        [7:0]    rxRcrDac;
  reg        [3:0]    rxRcrDacTmp;
  wire       [1:0]    phase;
  reg                 updownSource;
  reg                 zeroCrossDet_0;
  reg                 zeroCrossDet_1;
  reg                 zeroCrossDet_2;
  reg                 zeroCrossDet_3;
  reg                 zeroCrossDet_4;
  reg                 zeroCrossDet_5;
  reg                 zeroCrossDet_6;
  reg                 zeroCrossDet_7;
  wire                rxClockInternal;
  wire                when_ModemTop_l1488;

  assign _zz_rxClockInternal = {zeroCrossDet_7,{zeroCrossDet_6,{zeroCrossDet_5,{zeroCrossDet_4,{zeroCrossDet_3,{zeroCrossDet_2,{zeroCrossDet_1,zeroCrossDet_0}}}}}}};
  Scrambler scrambler_1 (
    .io_dataIn  (txDataAfterReg             ), //i
    .io_en      (txClockInternalFallStb     ), //i
    .io_sim     (io_sim                     ), //i
    .io_vecOut  (scrambler_1_io_vecOut[16:0]), //o
    .io_dataOut (scrambler_1_io_dataOut     ), //o
    .rst_n      (rst_n                      ), //i
    .clk        (clk                        )  //i
  );
  assign when_ModemTop_l1317 = (! rst_n);
  assign rxClockFixed = tablePhase[1];
  assign _zz_rxClockFixedStb = tablePhase[1];
  assign rxClockFixedStb = (_zz_rxClockFixedStb && (! _zz_rxClockFixedStb_regNext));
  assign txClock = tablePhase[2];
  assign _zz_txClockStb = tablePhase[2];
  assign txClockStb = (_zz_txClockStb && (! _zz_txClockStb_regNext));
  assign _zz_ = tablePhase[4];
  assign _zz__1 = tablePhase[5];
  always @(*) begin
    case(io_cfgUartTxPrescale)
      1'b0 : begin
        _zz_io_uartTxClock = (_zz_ && (! _zz__regNext));
      end
      default : begin
        _zz_io_uartTxClock = (_zz__1 && (! _zz__1_regNext));
      end
    endcase
  end

  assign io_uartTxClock = _zz_io_uartTxClock;
  assign _zz__2 = tablePhase[1];
  assign _zz__3 = tablePhase[2];
  always @(*) begin
    case(io_cfgUartRxPrescale)
      1'b0 : begin
        _zz_io_uartRxClock = (_zz__2 && (! _zz__2_regNext));
      end
      default : begin
        _zz_io_uartRxClock = (_zz__3 && (! _zz__3_regNext));
      end
    endcase
  end

  assign io_uartRxClock = _zz_io_uartRxClock;
  assign txClock2 = rxCtr[2];
  assign txClock3 = rxCtr[3];
  assign rxAddr = {rxAddr8,rxCtr};
  assign rxClock = rxCtr[2];
  assign when_ModemTop_l1371 = (! rst_n);
  assign txClockInternal = rxCtr[3];
  assign _zz_txClockInternalRiseStb = rxCtr[3];
  assign txClockInternalRiseStb = (_zz_txClockInternalRiseStb && (! _zz_txClockInternalRiseStb_regNext));
  assign _zz_txClockInternalFallStb = rxCtr[3];
  assign txClockInternalFallStb = ((! _zz_txClockInternalFallStb) && _zz_txClockInternalFallStb_regNext);
  always @(*) begin
    txAddr12[1 : 0] = rxCtr[3 : 2];
    txAddr12[9 : 2] = scrambler_1_io_vecOut[7 : 0];
    txAddr12[11 : 10] = scrambler_1_io_vecOut[1 : 0];
  end

  assign switch_Misc_l226 = tablePhase[1 : 0];
  always @(*) begin
    case(switch_Misc_l226)
      2'b00 : begin
        table6 = txAddr12[11 : 6];
      end
      2'b01 : begin
        table6 = txAddr12[5 : 0];
      end
      2'b10 : begin
        table6 = rxAddr[11 : 6];
      end
      default : begin
        table6 = rxAddr[5 : 0];
      end
    endcase
  end

  assign io_addr6 = table6;
  assign io_txDac8 = txDac;
  assign io_rxDac8 = rxRcrDac;
  assign phase = tablePhase[1 : 0];
  always @(*) begin
    case(io_cfgUpDownSource)
      1'b0 : begin
        updownSource = rxRcrDac[7];
      end
      default : begin
        updownSource = io_upDownIn;
      end
    endcase
  end

  assign rxClockInternal = (_zz_rxClockInternal[7] ^ io_rxDataRawIn);
  assign when_ModemTop_l1488 = (! rst_n);
  assign io_txClockStb = txClockStb;
  assign io_rxClock = rxClock;
  assign io_upDownOut = updownSource;
  always @(posedge clk) begin
    if(when_ModemTop_l1317) begin
      tablePhase <= 6'h00;
    end else begin
      tablePhase <= (tablePhase - 6'h01);
    end
    _zz_rxClockFixedStb_regNext <= _zz_rxClockFixedStb;
    _zz_txClockStb_regNext <= _zz_txClockStb;
    _zz__regNext <= _zz_;
    _zz__1_regNext <= _zz__1;
    _zz__2_regNext <= _zz__2;
    _zz__3_regNext <= _zz__3;
    rxCtr <= (rxCtr + 4'b0001);
    if(when_ModemTop_l1371) begin
      rxCtr <= 4'b0000;
    end
    _zz_txClockInternalRiseStb_regNext <= _zz_txClockInternalRiseStb;
    _zz_txClockInternalFallStb_regNext <= _zz_txClockInternalFallStb;
    if(txClockInternalRiseStb) begin
      txDataAfterReg <= io_txData;
    end
    if(io_cfgTableLatency) begin
      case(phase)
        2'b00 : begin
          rxRcrDac <= {rxRcrDacTmp,io_rom4};
        end
        2'b01 : begin
          rxRcrDacTmp <= io_rom4;
        end
        2'b10 : begin
          txDac <= {txDacTmp,io_rom4};
        end
        default : begin
          txDacTmp <= io_rom4;
        end
      endcase
    end else begin
      case(phase)
        2'b00 : begin
          txDacTmp <= io_rom4;
        end
        2'b01 : begin
          rxRcrDac <= {rxRcrDacTmp,io_rom4};
        end
        2'b10 : begin
          rxRcrDacTmp <= io_rom4;
        end
        default : begin
          txDac <= {txDacTmp,io_rom4};
        end
      endcase
    end
    if(txClockStb) begin
      zeroCrossDet_0 <= io_rxDataRawIn;
      zeroCrossDet_1 <= zeroCrossDet_0;
      zeroCrossDet_2 <= zeroCrossDet_1;
      zeroCrossDet_3 <= zeroCrossDet_2;
      zeroCrossDet_4 <= zeroCrossDet_3;
      zeroCrossDet_5 <= zeroCrossDet_4;
      zeroCrossDet_6 <= zeroCrossDet_5;
      zeroCrossDet_7 <= zeroCrossDet_6;
    end
    if(when_ModemTop_l1488) begin
      rxAddr8 <= 8'h00;
    end else begin
      if(rxClockInternal) begin
        if(updownSource) begin
          rxAddr8 <= (rxAddr8 + 8'h01);
        end else begin
          rxAddr8 <= (rxAddr8 - 8'h01);
        end
      end
    end
  end


endmodule

module HdlcRx (
  output reg [7:0]    io_payload,
  output reg          io_valid,
  input               io_ready,
  input               io_rxClockStb,
  input               io_rxDataIn,
  output              io_isRecving,
  output              io_rxDataOut,
  output reg          io_rxAbort,
  output reg          io_rxCrcError,
  output reg          io_rxOverrun,
  output reg          io_rxFrame,
  input               io_bertReset,
  output     [11:0]   io_bertCount,
  input               clk,
  input               rst_n
);
  localparam fsmHdlcRx_enumDef_BOOT = 2'd0;
  localparam fsmHdlcRx_enumDef_HUNT = 2'd1;
  localparam fsmHdlcRx_enumDef_DATA = 2'd2;
  localparam fsmHdlcRx_enumDef_ABORT = 2'd3;

  reg                 rxCrc_io_enable;
  wire                rxCrc_io_init;
  wire       [15:0]   rxCrc_io_crc;
  wire                rxCrc_io_crcError;
  reg        [11:0]   bertCount;
  reg                 regNextRxDataIn;
  wire                rxDataInXor;
  wire                payloadBit;
  reg                 canInhibit;
  reg        [2:0]    oneBitCount;
  wire                when_ModemTop_l335;
  wire                inhibitOneBit;
  wire                fsmHdlcRx_wantExit;
  reg                 fsmHdlcRx_wantStart;
  wire                fsmHdlcRx_wantKill;
  reg        [6:0]    fsmHdlcRx_rxByte;
  reg        [2:0]    fsmHdlcRx_bit;
  wire                when_ModemTop_l438;
  reg        [1:0]    fsmHdlcRx_stateReg;
  reg        [1:0]    fsmHdlcRx_stateNext;
  wire                when_ModemTop_l388;
  wire                when_ModemTop_l391;
  wire                when_ModemTop_l399;
  wire                when_ModemTop_l400;
  wire                when_ModemTop_l401;
  wire                when_ModemTop_l402;
  wire                when_ModemTop_l409;
  wire                when_ModemTop_l431;
  wire                when_ModemTop_l374;
  `ifndef SYNTHESIS
  reg [39:0] fsmHdlcRx_stateReg_string;
  reg [39:0] fsmHdlcRx_stateNext_string;
  `endif


  CRC16_CCITT rxCrc (
    .io_data     (io_payload[7:0]   ), //i
    .io_enable   (rxCrc_io_enable   ), //i
    .io_init     (rxCrc_io_init     ), //i
    .io_crc      (rxCrc_io_crc[15:0]), //o
    .io_crcError (rxCrc_io_crcError ), //o
    .clk         (clk               ), //i
    .rst_n       (rst_n             )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsmHdlcRx_stateReg)
      fsmHdlcRx_enumDef_BOOT : fsmHdlcRx_stateReg_string = "BOOT ";
      fsmHdlcRx_enumDef_HUNT : fsmHdlcRx_stateReg_string = "HUNT ";
      fsmHdlcRx_enumDef_DATA : fsmHdlcRx_stateReg_string = "DATA ";
      fsmHdlcRx_enumDef_ABORT : fsmHdlcRx_stateReg_string = "ABORT";
      default : fsmHdlcRx_stateReg_string = "?????";
    endcase
  end
  always @(*) begin
    case(fsmHdlcRx_stateNext)
      fsmHdlcRx_enumDef_BOOT : fsmHdlcRx_stateNext_string = "BOOT ";
      fsmHdlcRx_enumDef_HUNT : fsmHdlcRx_stateNext_string = "HUNT ";
      fsmHdlcRx_enumDef_DATA : fsmHdlcRx_stateNext_string = "DATA ";
      fsmHdlcRx_enumDef_ABORT : fsmHdlcRx_stateNext_string = "ABORT";
      default : fsmHdlcRx_stateNext_string = "?????";
    endcase
  end
  `endif

  assign io_rxDataOut = 1'b0;
  always @(*) begin
    io_rxAbort = 1'b0;
    case(fsmHdlcRx_stateReg)
      fsmHdlcRx_enumDef_HUNT : begin
      end
      fsmHdlcRx_enumDef_DATA : begin
      end
      fsmHdlcRx_enumDef_ABORT : begin
        io_rxAbort = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_rxCrcError = 1'b0;
    case(fsmHdlcRx_stateReg)
      fsmHdlcRx_enumDef_HUNT : begin
      end
      fsmHdlcRx_enumDef_DATA : begin
        if(io_rxClockStb) begin
          if(when_ModemTop_l399) begin
            if(when_ModemTop_l400) begin
              if(when_ModemTop_l401) begin
                if(!when_ModemTop_l402) begin
                  io_rxCrcError = 1'b1;
                end
              end
            end
          end
        end
      end
      fsmHdlcRx_enumDef_ABORT : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_rxOverrun = 1'b0;
    case(fsmHdlcRx_stateReg)
      fsmHdlcRx_enumDef_HUNT : begin
      end
      fsmHdlcRx_enumDef_DATA : begin
        if(io_rxClockStb) begin
          if(when_ModemTop_l399) begin
            if(when_ModemTop_l400) begin
              if(!when_ModemTop_l401) begin
                if(!when_ModemTop_l409) begin
                  if(io_valid) begin
                    io_rxOverrun = 1'b1;
                  end
                end
              end
            end
          end
        end
      end
      fsmHdlcRx_enumDef_ABORT : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_rxFrame = 1'b0;
    case(fsmHdlcRx_stateReg)
      fsmHdlcRx_enumDef_HUNT : begin
      end
      fsmHdlcRx_enumDef_DATA : begin
        if(io_rxClockStb) begin
          if(when_ModemTop_l399) begin
            if(when_ModemTop_l400) begin
              if(when_ModemTop_l401) begin
                if(when_ModemTop_l402) begin
                  io_rxFrame = 1'b1;
                end
              end
            end
          end
        end
      end
      fsmHdlcRx_enumDef_ABORT : begin
      end
      default : begin
      end
    endcase
  end

  assign io_bertCount = bertCount;
  assign rxDataInXor = (regNextRxDataIn ^ io_rxDataIn);
  assign payloadBit = (! rxDataInXor);
  assign when_ModemTop_l335 = (oneBitCount < 3'b111);
  assign inhibitOneBit = (((oneBitCount == 3'b101) && (payloadBit == 1'b0)) && canInhibit);
  always @(*) begin
    rxCrc_io_enable = 1'b0;
    case(fsmHdlcRx_stateReg)
      fsmHdlcRx_enumDef_HUNT : begin
      end
      fsmHdlcRx_enumDef_DATA : begin
        if(io_rxClockStb) begin
          if(when_ModemTop_l399) begin
            if(when_ModemTop_l400) begin
              if(!when_ModemTop_l401) begin
                if(!when_ModemTop_l409) begin
                  if(!io_valid) begin
                    rxCrc_io_enable = 1'b1;
                  end
                end
              end
            end
          end
        end
      end
      fsmHdlcRx_enumDef_ABORT : begin
      end
      default : begin
      end
    endcase
  end

  assign fsmHdlcRx_wantExit = 1'b0;
  always @(*) begin
    fsmHdlcRx_wantStart = 1'b0;
    case(fsmHdlcRx_stateReg)
      fsmHdlcRx_enumDef_HUNT : begin
      end
      fsmHdlcRx_enumDef_DATA : begin
      end
      fsmHdlcRx_enumDef_ABORT : begin
      end
      default : begin
        fsmHdlcRx_wantStart = 1'b1;
      end
    endcase
  end

  assign fsmHdlcRx_wantKill = 1'b0;
  assign io_isRecving = (fsmHdlcRx_stateReg == fsmHdlcRx_enumDef_DATA);
  assign rxCrc_io_init = (! (fsmHdlcRx_stateReg == fsmHdlcRx_enumDef_DATA));
  assign when_ModemTop_l438 = (io_valid && io_ready);
  always @(*) begin
    fsmHdlcRx_stateNext = fsmHdlcRx_stateReg;
    case(fsmHdlcRx_stateReg)
      fsmHdlcRx_enumDef_HUNT : begin
        if(io_rxClockStb) begin
          if(when_ModemTop_l388) begin
            fsmHdlcRx_stateNext = fsmHdlcRx_enumDef_DATA;
          end else begin
            if(when_ModemTop_l391) begin
              fsmHdlcRx_stateNext = fsmHdlcRx_enumDef_ABORT;
            end
          end
        end
      end
      fsmHdlcRx_enumDef_DATA : begin
        if(io_rxClockStb) begin
          if(when_ModemTop_l399) begin
            if(when_ModemTop_l400) begin
              if(when_ModemTop_l401) begin
                if(when_ModemTop_l402) begin
                  fsmHdlcRx_stateNext = fsmHdlcRx_enumDef_HUNT;
                end else begin
                  fsmHdlcRx_stateNext = fsmHdlcRx_enumDef_HUNT;
                end
              end else begin
                if(when_ModemTop_l409) begin
                  fsmHdlcRx_stateNext = fsmHdlcRx_enumDef_ABORT;
                end else begin
                  if(io_valid) begin
                    fsmHdlcRx_stateNext = fsmHdlcRx_enumDef_HUNT;
                  end
                end
              end
            end
          end
        end
      end
      fsmHdlcRx_enumDef_ABORT : begin
        if(io_rxClockStb) begin
          if(when_ModemTop_l431) begin
            fsmHdlcRx_stateNext = fsmHdlcRx_enumDef_HUNT;
          end
        end
      end
      default : begin
      end
    endcase
    if(io_rxClockStb) begin
      if(io_rxDataIn) begin
        if(!when_ModemTop_l374) begin
          fsmHdlcRx_stateNext = fsmHdlcRx_enumDef_ABORT;
        end
      end
    end
    if(fsmHdlcRx_wantStart) begin
      fsmHdlcRx_stateNext = fsmHdlcRx_enumDef_HUNT;
    end
    if(fsmHdlcRx_wantKill) begin
      fsmHdlcRx_stateNext = fsmHdlcRx_enumDef_BOOT;
    end
  end

  assign when_ModemTop_l388 = ((oneBitCount == 3'b110) && (io_rxDataIn == 1'b0));
  assign when_ModemTop_l391 = (oneBitCount == 3'b111);
  assign when_ModemTop_l399 = (inhibitOneBit == 1'b0);
  assign when_ModemTop_l400 = (fsmHdlcRx_bit == 3'b111);
  assign when_ModemTop_l401 = ((oneBitCount == 3'b110) && (io_rxDataIn == 1'b0));
  assign when_ModemTop_l402 = (rxCrc_io_crcError == 1'b0);
  assign when_ModemTop_l409 = (oneBitCount == 3'b110);
  assign when_ModemTop_l431 = (io_rxDataIn == 1'b0);
  assign when_ModemTop_l374 = (oneBitCount < 3'b111);
  always @(posedge clk) begin
    if(!rst_n) begin
      io_valid <= 1'b0;
      fsmHdlcRx_stateReg <= fsmHdlcRx_enumDef_BOOT;
    end else begin
      if(when_ModemTop_l438) begin
        io_valid <= 1'b0;
      end
      fsmHdlcRx_stateReg <= fsmHdlcRx_stateNext;
      case(fsmHdlcRx_stateReg)
        fsmHdlcRx_enumDef_HUNT : begin
        end
        fsmHdlcRx_enumDef_DATA : begin
          if(io_rxClockStb) begin
            if(when_ModemTop_l399) begin
              if(when_ModemTop_l400) begin
                if(!when_ModemTop_l401) begin
                  if(!when_ModemTop_l409) begin
                    if(!io_valid) begin
                      io_valid <= 1'b1;
                    end
                  end
                end
              end
            end
          end
        end
        fsmHdlcRx_enumDef_ABORT : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(io_bertReset) begin
      bertCount <= 12'h000;
    end
    if(io_rxClockStb) begin
      regNextRxDataIn <= io_rxDataIn;
    end
    if(io_rxClockStb) begin
      if(rxDataInXor) begin
        bertCount <= (bertCount + 12'h001);
      end
    end
    if(io_rxClockStb) begin
      if(io_rxDataIn) begin
        if(when_ModemTop_l335) begin
          oneBitCount <= (oneBitCount + 3'b001);
        end
      end else begin
        oneBitCount <= 3'b000;
        canInhibit <= 1'b1;
      end
    end
    if(io_rxClockStb) begin
      if(inhibitOneBit) begin
        canInhibit <= 1'b0;
      end
    end
    case(fsmHdlcRx_stateReg)
      fsmHdlcRx_enumDef_HUNT : begin
        if(io_rxClockStb) begin
          if(when_ModemTop_l388) begin
            fsmHdlcRx_bit <= 3'b000;
          end
        end
      end
      fsmHdlcRx_enumDef_DATA : begin
        if(io_rxClockStb) begin
          if(when_ModemTop_l399) begin
            if(when_ModemTop_l400) begin
              if(!when_ModemTop_l401) begin
                if(!when_ModemTop_l409) begin
                  if(!io_valid) begin
                    io_payload <= {payloadBit,fsmHdlcRx_rxByte};
                  end
                end
              end
              fsmHdlcRx_bit <= 3'b000;
            end else begin
              fsmHdlcRx_rxByte[fsmHdlcRx_bit] <= payloadBit;
              fsmHdlcRx_bit <= (fsmHdlcRx_bit + 3'b001);
            end
          end
        end
      end
      fsmHdlcRx_enumDef_ABORT : begin
      end
      default : begin
      end
    endcase
    if(io_rxClockStb) begin
      if(io_rxDataIn) begin
        if(when_ModemTop_l374) begin
          oneBitCount <= (oneBitCount + 3'b001);
        end
      end else begin
        oneBitCount <= 3'b000;
      end
    end
  end


endmodule

module Descrambler (
  input               io_dataIn,
  input               io_en,
  input               io_sim,
  output     [16:0]   io_vecOut,
  output              io_dataOut,
  input               rst_n,
  input               clk
);

  reg        [16:0]   vec;
  wire                partial;
  wire                result;
  wire                when_ModemTop_l262;

  assign partial = (vec[16] ^ vec[11]);
  assign result = (partial ^ io_dataIn);
  assign when_ModemTop_l262 = (! rst_n);
  assign io_dataOut = result;
  assign io_vecOut = vec;
  always @(posedge clk) begin
    vec[0] <= io_dataIn;
    if(!when_ModemTop_l262) begin
      if(io_en) begin
        vec[1] <= vec[0];
        vec[2] <= vec[1];
        vec[3] <= vec[2];
        vec[4] <= vec[3];
        vec[5] <= vec[4];
        vec[6] <= vec[5];
        vec[7] <= vec[6];
        vec[8] <= vec[7];
        vec[9] <= vec[8];
        vec[10] <= vec[9];
        vec[11] <= vec[10];
        vec[12] <= vec[11];
        vec[13] <= vec[12];
        vec[14] <= vec[13];
        vec[15] <= vec[14];
        vec[16] <= vec[15];
      end
    end
  end


endmodule

module UartTx (
  input               io_txClockStb,
  input      [7:0]    io_data,
  input               io_valid,
  output reg          io_ready,
  output reg          io_uartTxOut,
  input               clk,
  input               rst_n
);
  localparam fsmUartTx_enumDef_BOOT = 3'd0;
  localparam fsmUartTx_enumDef_IDLE = 3'd1;
  localparam fsmUartTx_enumDef_START = 3'd2;
  localparam fsmUartTx_enumDef_DATA = 3'd3;
  localparam fsmUartTx_enumDef_STOP = 3'd4;

  wire                MARK;
  wire                SPACE;
  reg        [2:0]    bitId;
  wire                fsmUartTx_wantExit;
  reg                 fsmUartTx_wantStart;
  wire                fsmUartTx_wantKill;
  reg        [2:0]    fsmUartTx_stateReg;
  reg        [2:0]    fsmUartTx_stateNext;
  wire                when_ModemTop_l724;
  `ifndef SYNTHESIS
  reg [39:0] fsmUartTx_stateReg_string;
  reg [39:0] fsmUartTx_stateNext_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(fsmUartTx_stateReg)
      fsmUartTx_enumDef_BOOT : fsmUartTx_stateReg_string = "BOOT ";
      fsmUartTx_enumDef_IDLE : fsmUartTx_stateReg_string = "IDLE ";
      fsmUartTx_enumDef_START : fsmUartTx_stateReg_string = "START";
      fsmUartTx_enumDef_DATA : fsmUartTx_stateReg_string = "DATA ";
      fsmUartTx_enumDef_STOP : fsmUartTx_stateReg_string = "STOP ";
      default : fsmUartTx_stateReg_string = "?????";
    endcase
  end
  always @(*) begin
    case(fsmUartTx_stateNext)
      fsmUartTx_enumDef_BOOT : fsmUartTx_stateNext_string = "BOOT ";
      fsmUartTx_enumDef_IDLE : fsmUartTx_stateNext_string = "IDLE ";
      fsmUartTx_enumDef_START : fsmUartTx_stateNext_string = "START";
      fsmUartTx_enumDef_DATA : fsmUartTx_stateNext_string = "DATA ";
      fsmUartTx_enumDef_STOP : fsmUartTx_stateNext_string = "STOP ";
      default : fsmUartTx_stateNext_string = "?????";
    endcase
  end
  `endif

  assign MARK = 1'b1;
  assign SPACE = 1'b0;
  always @(*) begin
    io_ready = 1'b0;
    case(fsmUartTx_stateReg)
      fsmUartTx_enumDef_IDLE : begin
      end
      fsmUartTx_enumDef_START : begin
      end
      fsmUartTx_enumDef_DATA : begin
        if(io_txClockStb) begin
          if(when_ModemTop_l724) begin
            io_ready = 1'b1;
          end
        end
      end
      fsmUartTx_enumDef_STOP : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_uartTxOut = MARK;
    case(fsmUartTx_stateReg)
      fsmUartTx_enumDef_IDLE : begin
        io_uartTxOut = MARK;
      end
      fsmUartTx_enumDef_START : begin
        io_uartTxOut = SPACE;
      end
      fsmUartTx_enumDef_DATA : begin
        io_uartTxOut = io_data[bitId];
      end
      fsmUartTx_enumDef_STOP : begin
        io_uartTxOut = MARK;
      end
      default : begin
      end
    endcase
  end

  assign fsmUartTx_wantExit = 1'b0;
  always @(*) begin
    fsmUartTx_wantStart = 1'b0;
    case(fsmUartTx_stateReg)
      fsmUartTx_enumDef_IDLE : begin
      end
      fsmUartTx_enumDef_START : begin
      end
      fsmUartTx_enumDef_DATA : begin
      end
      fsmUartTx_enumDef_STOP : begin
      end
      default : begin
        fsmUartTx_wantStart = 1'b1;
      end
    endcase
  end

  assign fsmUartTx_wantKill = 1'b0;
  always @(*) begin
    fsmUartTx_stateNext = fsmUartTx_stateReg;
    case(fsmUartTx_stateReg)
      fsmUartTx_enumDef_IDLE : begin
        if(io_valid) begin
          fsmUartTx_stateNext = fsmUartTx_enumDef_START;
        end
      end
      fsmUartTx_enumDef_START : begin
        if(io_txClockStb) begin
          fsmUartTx_stateNext = fsmUartTx_enumDef_DATA;
        end
      end
      fsmUartTx_enumDef_DATA : begin
        if(io_txClockStb) begin
          if(when_ModemTop_l724) begin
            fsmUartTx_stateNext = fsmUartTx_enumDef_STOP;
          end
        end
      end
      fsmUartTx_enumDef_STOP : begin
        if(io_txClockStb) begin
          if(io_valid) begin
            fsmUartTx_stateNext = fsmUartTx_enumDef_START;
          end else begin
            fsmUartTx_stateNext = fsmUartTx_enumDef_IDLE;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsmUartTx_wantStart) begin
      fsmUartTx_stateNext = fsmUartTx_enumDef_IDLE;
    end
    if(fsmUartTx_wantKill) begin
      fsmUartTx_stateNext = fsmUartTx_enumDef_BOOT;
    end
  end

  assign when_ModemTop_l724 = (bitId == 3'b111);
  always @(posedge clk) begin
    if(!rst_n) begin
      fsmUartTx_stateReg <= fsmUartTx_enumDef_BOOT;
    end else begin
      fsmUartTx_stateReg <= fsmUartTx_stateNext;
    end
  end

  always @(posedge clk) begin
    case(fsmUartTx_stateReg)
      fsmUartTx_enumDef_IDLE : begin
      end
      fsmUartTx_enumDef_START : begin
        if(io_txClockStb) begin
          bitId <= 3'b000;
        end
      end
      fsmUartTx_enumDef_DATA : begin
        if(io_txClockStb) begin
          if(!when_ModemTop_l724) begin
            bitId <= (bitId + 3'b001);
          end
        end
      end
      fsmUartTx_enumDef_STOP : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module UartFifo_1 (
  input      [7:0]    io_dataIn,
  input               io_dataInEn,
  input               io_dataOutEn,
  output     [7:0]    io_dataOut,
  output              io_full,
  output              io_almostFull,
  output              io_almostEmpty,
  output              io_empty,
  output              io_eoverrun,
  input               clk,
  input               rst_n
);

  reg        [7:0]    _zz_io_dataOut;
  reg        [7:0]    fifo_0;
  reg        [7:0]    fifo_1;
  reg        [7:0]    fifo_2;
  reg        [7:0]    fifo_3;
  reg        [1:0]    nextOut;
  reg        [1:0]    nextIn;
  reg        [2:0]    count;
  wire                when_ModemTop_l652;
  wire       [3:0]    _zz_1;

  always @(*) begin
    case(nextOut)
      2'b00 : _zz_io_dataOut = fifo_0;
      2'b01 : _zz_io_dataOut = fifo_1;
      2'b10 : _zz_io_dataOut = fifo_2;
      default : _zz_io_dataOut = fifo_3;
    endcase
  end

  assign when_ModemTop_l652 = (io_dataInEn && io_dataOutEn);
  assign _zz_1 = ({3'd0,1'b1} <<< nextIn);
  assign io_dataOut = _zz_io_dataOut;
  assign io_full = (count == 3'b100);
  assign io_almostFull = (3'b011 <= count);
  assign io_almostEmpty = (count == 3'b001);
  assign io_empty = (count == 3'b000);
  assign io_eoverrun = ((count == 3'b100) && io_dataInEn);
  always @(posedge clk) begin
    if(!rst_n) begin
      nextOut <= 2'b00;
      nextIn <= 2'b00;
      count <= 3'b000;
    end else begin
      if(!when_ModemTop_l652) begin
        if(io_dataInEn) begin
          count <= (count + 3'b001);
        end else begin
          if(io_dataOutEn) begin
            count <= (count - 3'b001);
          end
        end
      end
      if(io_dataInEn) begin
        nextIn <= (nextIn + 2'b01);
      end
      if(io_dataOutEn) begin
        nextOut <= (nextOut + 2'b01);
      end
    end
  end

  always @(posedge clk) begin
    if(io_dataInEn) begin
      if(_zz_1[0]) begin
        fifo_0 <= io_dataIn;
      end
      if(_zz_1[1]) begin
        fifo_1 <= io_dataIn;
      end
      if(_zz_1[2]) begin
        fifo_2 <= io_dataIn;
      end
      if(_zz_1[3]) begin
        fifo_3 <= io_dataIn;
      end
    end
  end


endmodule

module HdlcTx (
  input      [7:0]    io_payload,
  input               io_valid,
  output reg          io_ready,
  input               io_txClockStb,
  input               io_wantAbort,
  input               io_wantFrameEnd,
  input               io_wantTx,
  output              io_txDataOut,
  output              io_isSending,
  output reg          io_underrunError,
  input               clk,
  input               rst_n
);

  reg        [0:0]    txCrc_io_data;
  reg                 txCrc_io_enable;
  wire                txCrc_io_init;
  wire       [15:0]   txCrc_io_crc;
  wire                txCrc_io_crcError;
  reg        [3:0]    bit_1;
  wire       [2:0]    bit8;
  wire                payloadBit;
  reg        [2:0]    bitstuffCnt;
  reg                 isSending;
  reg                 isAbort;
  reg                 isCRC;
  wire       [6:0]    SYNC;
  wire       [9:0]    ABORT;
  wire                when_ModemTop_l499;
  reg                 wantFrameEnd;
  reg                 nrziCurrent;
  wire                when_ModemTop_l521;
  wire                when_ModemTop_l548;
  wire                when_ModemTop_l534;
  wire                when_ModemTop_l537;
  wire                when_ModemTop_l559;
  wire                when_ModemTop_l586;
  wire                when_ModemTop_l593;
  wire                when_ModemTop_l596;
  wire                when_ModemTop_l616;

  CRC16_CCITT_1 txCrc (
    .io_data     (txCrc_io_data     ), //i
    .io_enable   (txCrc_io_enable   ), //i
    .io_init     (txCrc_io_init     ), //i
    .io_crc      (txCrc_io_crc[15:0]), //o
    .io_crcError (txCrc_io_crcError ), //o
    .clk         (clk               ), //i
    .rst_n       (rst_n             )  //i
  );
  always @(*) begin
    io_underrunError = 1'b0;
    if(io_txClockStb) begin
      if(!isAbort) begin
        if(!isCRC) begin
          if(isSending) begin
            if(!io_valid) begin
              if(!wantFrameEnd) begin
                io_underrunError = 1'b1;
              end
            end
          end
        end
      end
    end
  end

  always @(*) begin
    io_ready = 1'b0;
    if(io_txClockStb) begin
      if(!isAbort) begin
        if(!isCRC) begin
          if(isSending) begin
            if(when_ModemTop_l586) begin
              io_ready = 1'b1;
            end
          end
        end
      end
    end
  end

  assign bit8 = bit_1[2 : 0];
  assign payloadBit = io_payload[bit8];
  always @(*) begin
    txCrc_io_enable = 1'b0;
    if(io_txClockStb) begin
      if(!isAbort) begin
        if(!isCRC) begin
          if(isSending) begin
            if(io_valid) begin
              if(!when_ModemTop_l559) begin
                txCrc_io_enable = 1'b1;
              end
            end else begin
              if(wantFrameEnd) begin
                txCrc_io_enable = 1'b1;
              end
            end
          end
        end
      end
    end
  end

  assign txCrc_io_init = (! (isSending || isCRC));
  always @(*) begin
    txCrc_io_data = payloadBit;
    if(io_txClockStb) begin
      if(!isAbort) begin
        if(!isCRC) begin
          if(isSending) begin
            if(io_valid) begin
              if(!when_ModemTop_l559) begin
                txCrc_io_data = payloadBit;
              end
            end
          end
        end
      end
    end
  end

  assign SYNC = 7'h3f;
  assign ABORT = 10'h3fe;
  assign when_ModemTop_l499 = (isSending && io_wantAbort);
  assign when_ModemTop_l521 = (bit_1 == 4'b1001);
  assign when_ModemTop_l548 = (! txCrc_io_crc[bit_1]);
  assign when_ModemTop_l534 = ((bitstuffCnt == 3'b101) && when_ModemTop_l548);
  assign when_ModemTop_l537 = (bit_1 == 4'b1111);
  assign when_ModemTop_l559 = ((bitstuffCnt == 3'b101) && payloadBit);
  assign when_ModemTop_l586 = (bit_1 == 4'b0111);
  assign when_ModemTop_l593 = bit_1[3];
  assign when_ModemTop_l596 = (bit_1 == 4'b0110);
  assign when_ModemTop_l616 = (! nrziCurrent);
  assign io_txDataOut = nrziCurrent;
  assign io_isSending = isSending;
  always @(posedge clk) begin
    if(!rst_n) begin
      bit_1 <= 4'b0000;
      bitstuffCnt <= 3'b000;
      isSending <= 1'b0;
      isAbort <= 1'b0;
      isCRC <= 1'b0;
      wantFrameEnd <= 1'b0;
      nrziCurrent <= 1'b0;
    end else begin
      if(when_ModemTop_l499) begin
        isSending <= 1'b0;
        isAbort <= 1'b1;
        bit_1 <= 4'b0000;
      end
      if(io_wantFrameEnd) begin
        wantFrameEnd <= 1'b1;
      end
      if(io_txClockStb) begin
        if(isAbort) begin
          if(when_ModemTop_l521) begin
            nrziCurrent <= ABORT[bit_1];
            bit_1 <= 4'b0000;
            isAbort <= 1'b0;
          end else begin
            nrziCurrent <= ABORT[bit_1];
            bit_1 <= (bit_1 + 4'b0001);
          end
        end else begin
          if(isCRC) begin
            if(when_ModemTop_l534) begin
              nrziCurrent <= 1'b0;
              bitstuffCnt <= 3'b000;
            end else begin
              if(when_ModemTop_l537) begin
                nrziCurrent <= when_ModemTop_l548;
                isAbort <= 1'b0;
                isCRC <= 1'b0;
              end else begin
                nrziCurrent <= when_ModemTop_l548;
                if(when_ModemTop_l548) begin
                  bitstuffCnt <= (bitstuffCnt + 3'b001);
                end else begin
                  bitstuffCnt <= 3'b000;
                end
                bit_1 <= (bit_1 + 4'b0001);
              end
            end
          end else begin
            if(isSending) begin
              if(io_valid) begin
                if(when_ModemTop_l559) begin
                  nrziCurrent <= 1'b0;
                  bitstuffCnt <= 3'b000;
                end else begin
                  nrziCurrent <= payloadBit;
                  if(payloadBit) begin
                    bitstuffCnt <= (bitstuffCnt + 3'b001);
                  end else begin
                    bitstuffCnt <= 3'b000;
                  end
                  bit_1 <= (bit_1 + 4'b0001);
                end
              end else begin
                if(wantFrameEnd) begin
                  isSending <= 1'b0;
                  isCRC <= 1'b1;
                  nrziCurrent <= txCrc_io_crc[bit_1];
                  bit_1 <= 4'b0001;
                  wantFrameEnd <= 1'b0;
                end else begin
                  isAbort <= 1'b1;
                  isSending <= 1'b0;
                  bit_1 <= 4'b0000;
                end
              end
              if(when_ModemTop_l586) begin
                bit_1 <= 4'b0000;
              end
            end else begin
              if(when_ModemTop_l593) begin
                nrziCurrent <= 1'b0;
                bit_1 <= 4'b0000;
              end else begin
                if(when_ModemTop_l596) begin
                  nrziCurrent <= SYNC[bit8];
                  bit_1 <= 4'b0000;
                  if(io_valid) begin
                    bitstuffCnt <= 3'b000;
                    isSending <= 1'b1;
                    wantFrameEnd <= 1'b0;
                  end
                end else begin
                  nrziCurrent <= SYNC[bit8];
                  bit_1 <= (bit_1 + 4'b0001);
                end
              end
            end
          end
        end
      end
      if(io_txClockStb) begin
        if(when_ModemTop_l616) begin
          nrziCurrent <= (! nrziCurrent);
        end
      end
    end
  end


endmodule

module CommandDecoder (
  input               io_valid,
  input      [7:0]    io_payload,
  output reg          io_ready,
  input               io_txReady,
  output     [7:0]    io_txPayload,
  output reg          io_txValid,
  input               io_upperError,
  input               io_upperFrameEnd,
  output              io_wantTx,
  output reg          io_wantAbort,
  input               clk,
  input               rst_n
);
  localparam fsmCmdDecoder_enumDef_BOOT = 3'd0;
  localparam fsmCmdDecoder_enumDef_IDLE = 3'd1;
  localparam fsmCmdDecoder_enumDef_CONTROL = 3'd2;
  localparam fsmCmdDecoder_enumDef_DATA = 3'd3;
  localparam fsmCmdDecoder_enumDef_DRAIN = 3'd4;

  reg                 wantAbort;
  reg                 wantTx;
  wire                fsmCmdDecoder_wantExit;
  reg                 fsmCmdDecoder_wantStart;
  wire                fsmCmdDecoder_wantKill;
  wire                when_ModemTop_l934;
  reg        [2:0]    fsmCmdDecoder_stateReg;
  reg        [2:0]    fsmCmdDecoder_stateNext;
  wire                when_ModemTop_l891;
  wire                when_ModemTop_l914;
  wire                when_ModemTop_l925;
  `ifndef SYNTHESIS
  reg [55:0] fsmCmdDecoder_stateReg_string;
  reg [55:0] fsmCmdDecoder_stateNext_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(fsmCmdDecoder_stateReg)
      fsmCmdDecoder_enumDef_BOOT : fsmCmdDecoder_stateReg_string = "BOOT   ";
      fsmCmdDecoder_enumDef_IDLE : fsmCmdDecoder_stateReg_string = "IDLE   ";
      fsmCmdDecoder_enumDef_CONTROL : fsmCmdDecoder_stateReg_string = "CONTROL";
      fsmCmdDecoder_enumDef_DATA : fsmCmdDecoder_stateReg_string = "DATA   ";
      fsmCmdDecoder_enumDef_DRAIN : fsmCmdDecoder_stateReg_string = "DRAIN  ";
      default : fsmCmdDecoder_stateReg_string = "???????";
    endcase
  end
  always @(*) begin
    case(fsmCmdDecoder_stateNext)
      fsmCmdDecoder_enumDef_BOOT : fsmCmdDecoder_stateNext_string = "BOOT   ";
      fsmCmdDecoder_enumDef_IDLE : fsmCmdDecoder_stateNext_string = "IDLE   ";
      fsmCmdDecoder_enumDef_CONTROL : fsmCmdDecoder_stateNext_string = "CONTROL";
      fsmCmdDecoder_enumDef_DATA : fsmCmdDecoder_stateNext_string = "DATA   ";
      fsmCmdDecoder_enumDef_DRAIN : fsmCmdDecoder_stateNext_string = "DRAIN  ";
      default : fsmCmdDecoder_stateNext_string = "???????";
    endcase
  end
  `endif

  always @(*) begin
    io_ready = 1'b0;
    case(fsmCmdDecoder_stateReg)
      fsmCmdDecoder_enumDef_IDLE : begin
        if(io_valid) begin
          io_ready = 1'b1;
        end
      end
      fsmCmdDecoder_enumDef_CONTROL : begin
        if(io_valid) begin
          io_ready = 1'b1;
        end
      end
      fsmCmdDecoder_enumDef_DATA : begin
        if(io_valid) begin
          io_ready = io_txReady;
        end
      end
      fsmCmdDecoder_enumDef_DRAIN : begin
      end
      default : begin
      end
    endcase
  end

  assign io_txPayload = io_payload;
  always @(*) begin
    io_txValid = 1'b0;
    case(fsmCmdDecoder_stateReg)
      fsmCmdDecoder_enumDef_IDLE : begin
      end
      fsmCmdDecoder_enumDef_CONTROL : begin
      end
      fsmCmdDecoder_enumDef_DATA : begin
        io_txValid = io_valid;
      end
      fsmCmdDecoder_enumDef_DRAIN : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_wantAbort = wantAbort;
    if(when_ModemTop_l934) begin
      io_wantAbort = 1'b1;
    end
  end

  assign io_wantTx = wantTx;
  assign fsmCmdDecoder_wantExit = 1'b0;
  always @(*) begin
    fsmCmdDecoder_wantStart = 1'b0;
    case(fsmCmdDecoder_stateReg)
      fsmCmdDecoder_enumDef_IDLE : begin
      end
      fsmCmdDecoder_enumDef_CONTROL : begin
      end
      fsmCmdDecoder_enumDef_DATA : begin
      end
      fsmCmdDecoder_enumDef_DRAIN : begin
      end
      default : begin
        fsmCmdDecoder_wantStart = 1'b1;
      end
    endcase
  end

  assign fsmCmdDecoder_wantKill = 1'b0;
  assign when_ModemTop_l934 = (io_upperError || wantAbort);
  always @(*) begin
    fsmCmdDecoder_stateNext = fsmCmdDecoder_stateReg;
    case(fsmCmdDecoder_stateReg)
      fsmCmdDecoder_enumDef_IDLE : begin
        if(io_valid) begin
          if(when_ModemTop_l891) begin
            fsmCmdDecoder_stateNext = fsmCmdDecoder_enumDef_CONTROL;
          end else begin
            fsmCmdDecoder_stateNext = fsmCmdDecoder_enumDef_DATA;
          end
        end
      end
      fsmCmdDecoder_enumDef_CONTROL : begin
        if(io_upperFrameEnd) begin
          fsmCmdDecoder_stateNext = fsmCmdDecoder_enumDef_IDLE;
        end
      end
      fsmCmdDecoder_enumDef_DATA : begin
        if(io_upperFrameEnd) begin
          if(when_ModemTop_l914) begin
            fsmCmdDecoder_stateNext = fsmCmdDecoder_enumDef_IDLE;
          end else begin
            fsmCmdDecoder_stateNext = fsmCmdDecoder_enumDef_DRAIN;
          end
        end
      end
      fsmCmdDecoder_enumDef_DRAIN : begin
        if(when_ModemTop_l925) begin
          fsmCmdDecoder_stateNext = fsmCmdDecoder_enumDef_IDLE;
        end
      end
      default : begin
      end
    endcase
    if(fsmCmdDecoder_wantStart) begin
      fsmCmdDecoder_stateNext = fsmCmdDecoder_enumDef_IDLE;
    end
    if(fsmCmdDecoder_wantKill) begin
      fsmCmdDecoder_stateNext = fsmCmdDecoder_enumDef_BOOT;
    end
  end

  assign when_ModemTop_l891 = (io_payload == 8'h80);
  assign when_ModemTop_l914 = ((! io_valid) || io_txReady);
  assign when_ModemTop_l925 = ((! io_valid) || io_txReady);
  always @(posedge clk) begin
    if(!rst_n) begin
      wantAbort <= 1'b0;
      wantTx <= 1'b0;
      fsmCmdDecoder_stateReg <= fsmCmdDecoder_enumDef_BOOT;
    end else begin
      if(when_ModemTop_l934) begin
        wantAbort <= 1'b0;
      end
      fsmCmdDecoder_stateReg <= fsmCmdDecoder_stateNext;
      case(fsmCmdDecoder_stateReg)
        fsmCmdDecoder_enumDef_IDLE : begin
        end
        fsmCmdDecoder_enumDef_CONTROL : begin
        end
        fsmCmdDecoder_enumDef_DATA : begin
          if(io_valid) begin
            wantTx <= 1'b1;
          end
          if(io_upperFrameEnd) begin
            if(when_ModemTop_l914) begin
              wantTx <= 1'b0;
            end
          end
        end
        fsmCmdDecoder_enumDef_DRAIN : begin
          if(when_ModemTop_l925) begin
            wantTx <= 1'b0;
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module KissDecoder (
  input               io_valid,
  input      [7:0]    io_payload,
  output reg          io_ready,
  input               io_txReady,
  output reg [7:0]    io_txPayload,
  output              io_txValid,
  output reg          io_raiseError,
  output reg          io_frameEnd,
  input               clk,
  input               rst_n
);
  localparam fsmKissDecoder_enumDef_BOOT = 3'd0;
  localparam fsmKissDecoder_enumDef_HUNT = 3'd1;
  localparam fsmKissDecoder_enumDef_DATAFEND = 3'd2;
  localparam fsmKissDecoder_enumDef_SEND = 3'd3;
  localparam fsmKissDecoder_enumDef_DATAFESC = 3'd4;
  localparam fsmKissDecoder_enumDef_SENDFEND = 3'd5;
  localparam fsmKissDecoder_enumDef_SENDFESC = 3'd6;

  reg                 txValid;
  wire                fsmKissDecoder_wantExit;
  reg                 fsmKissDecoder_wantStart;
  wire                fsmKissDecoder_wantKill;
  wire                when_ModemTop_l1044;
  reg        [2:0]    fsmKissDecoder_stateReg;
  reg        [2:0]    fsmKissDecoder_stateNext;
  wire                when_ModemTop_l982;
  wire                when_ModemTop_l989;
  wire                when_ModemTop_l993;
  wire                when_ModemTop_l1004;
  wire                when_ModemTop_l1011;
  wire                when_ModemTop_l1015;
  wire                when_ModemTop_l1037;
  wire                when_ModemTop_l1030;
  `ifndef SYNTHESIS
  reg [63:0] fsmKissDecoder_stateReg_string;
  reg [63:0] fsmKissDecoder_stateNext_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(fsmKissDecoder_stateReg)
      fsmKissDecoder_enumDef_BOOT : fsmKissDecoder_stateReg_string = "BOOT    ";
      fsmKissDecoder_enumDef_HUNT : fsmKissDecoder_stateReg_string = "HUNT    ";
      fsmKissDecoder_enumDef_DATAFEND : fsmKissDecoder_stateReg_string = "DATAFEND";
      fsmKissDecoder_enumDef_SEND : fsmKissDecoder_stateReg_string = "SEND    ";
      fsmKissDecoder_enumDef_DATAFESC : fsmKissDecoder_stateReg_string = "DATAFESC";
      fsmKissDecoder_enumDef_SENDFEND : fsmKissDecoder_stateReg_string = "SENDFEND";
      fsmKissDecoder_enumDef_SENDFESC : fsmKissDecoder_stateReg_string = "SENDFESC";
      default : fsmKissDecoder_stateReg_string = "????????";
    endcase
  end
  always @(*) begin
    case(fsmKissDecoder_stateNext)
      fsmKissDecoder_enumDef_BOOT : fsmKissDecoder_stateNext_string = "BOOT    ";
      fsmKissDecoder_enumDef_HUNT : fsmKissDecoder_stateNext_string = "HUNT    ";
      fsmKissDecoder_enumDef_DATAFEND : fsmKissDecoder_stateNext_string = "DATAFEND";
      fsmKissDecoder_enumDef_SEND : fsmKissDecoder_stateNext_string = "SEND    ";
      fsmKissDecoder_enumDef_DATAFESC : fsmKissDecoder_stateNext_string = "DATAFESC";
      fsmKissDecoder_enumDef_SENDFEND : fsmKissDecoder_stateNext_string = "SENDFEND";
      fsmKissDecoder_enumDef_SENDFESC : fsmKissDecoder_stateNext_string = "SENDFESC";
      default : fsmKissDecoder_stateNext_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_ready = 1'b0;
    case(fsmKissDecoder_stateReg)
      fsmKissDecoder_enumDef_HUNT : begin
        if(when_ModemTop_l982) begin
          io_ready = 1'b1;
        end
      end
      fsmKissDecoder_enumDef_DATAFEND : begin
        if(io_valid) begin
          if(when_ModemTop_l989) begin
            io_ready = 1'b1;
          end else begin
            if(when_ModemTop_l993) begin
              io_ready = 1'b1;
            end
          end
        end
      end
      fsmKissDecoder_enumDef_SEND : begin
        if(when_ModemTop_l1004) begin
          io_ready = 1'b1;
        end
      end
      fsmKissDecoder_enumDef_DATAFESC : begin
      end
      fsmKissDecoder_enumDef_SENDFEND : begin
        if(when_ModemTop_l1037) begin
          io_ready = 1'b1;
        end
      end
      fsmKissDecoder_enumDef_SENDFESC : begin
        if(when_ModemTop_l1030) begin
          io_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_raiseError = 1'b0;
    case(fsmKissDecoder_stateReg)
      fsmKissDecoder_enumDef_HUNT : begin
      end
      fsmKissDecoder_enumDef_DATAFEND : begin
      end
      fsmKissDecoder_enumDef_SEND : begin
      end
      fsmKissDecoder_enumDef_DATAFESC : begin
        if(io_valid) begin
          if(!when_ModemTop_l1011) begin
            if(!when_ModemTop_l1015) begin
              io_raiseError = 1'b1;
            end
          end
        end
      end
      fsmKissDecoder_enumDef_SENDFEND : begin
      end
      fsmKissDecoder_enumDef_SENDFESC : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_frameEnd = 1'b0;
    case(fsmKissDecoder_stateReg)
      fsmKissDecoder_enumDef_HUNT : begin
      end
      fsmKissDecoder_enumDef_DATAFEND : begin
        if(io_valid) begin
          if(when_ModemTop_l989) begin
            io_frameEnd = 1'b1;
          end
        end
      end
      fsmKissDecoder_enumDef_SEND : begin
      end
      fsmKissDecoder_enumDef_DATAFESC : begin
      end
      fsmKissDecoder_enumDef_SENDFEND : begin
      end
      fsmKissDecoder_enumDef_SENDFESC : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_txPayload = io_payload;
    case(fsmKissDecoder_stateReg)
      fsmKissDecoder_enumDef_HUNT : begin
      end
      fsmKissDecoder_enumDef_DATAFEND : begin
      end
      fsmKissDecoder_enumDef_SEND : begin
      end
      fsmKissDecoder_enumDef_DATAFESC : begin
        if(io_valid) begin
          if(when_ModemTop_l1011) begin
            io_txPayload = 8'hdb;
          end else begin
            if(when_ModemTop_l1015) begin
              io_txPayload = 8'hc0;
            end
          end
        end
      end
      fsmKissDecoder_enumDef_SENDFEND : begin
        io_txPayload = 8'hc0;
      end
      fsmKissDecoder_enumDef_SENDFESC : begin
        io_txPayload = 8'hdb;
      end
      default : begin
      end
    endcase
  end

  assign fsmKissDecoder_wantExit = 1'b0;
  always @(*) begin
    fsmKissDecoder_wantStart = 1'b0;
    case(fsmKissDecoder_stateReg)
      fsmKissDecoder_enumDef_HUNT : begin
      end
      fsmKissDecoder_enumDef_DATAFEND : begin
      end
      fsmKissDecoder_enumDef_SEND : begin
      end
      fsmKissDecoder_enumDef_DATAFESC : begin
      end
      fsmKissDecoder_enumDef_SENDFEND : begin
      end
      fsmKissDecoder_enumDef_SENDFESC : begin
      end
      default : begin
        fsmKissDecoder_wantStart = 1'b1;
      end
    endcase
  end

  assign fsmKissDecoder_wantKill = 1'b0;
  assign when_ModemTop_l1044 = (txValid && io_txReady);
  assign io_txValid = txValid;
  always @(*) begin
    fsmKissDecoder_stateNext = fsmKissDecoder_stateReg;
    case(fsmKissDecoder_stateReg)
      fsmKissDecoder_enumDef_HUNT : begin
        if(when_ModemTop_l982) begin
          fsmKissDecoder_stateNext = fsmKissDecoder_enumDef_DATAFEND;
        end
      end
      fsmKissDecoder_enumDef_DATAFEND : begin
        if(io_valid) begin
          if(!when_ModemTop_l989) begin
            if(when_ModemTop_l993) begin
              fsmKissDecoder_stateNext = fsmKissDecoder_enumDef_DATAFESC;
            end else begin
              fsmKissDecoder_stateNext = fsmKissDecoder_enumDef_SEND;
            end
          end
        end
      end
      fsmKissDecoder_enumDef_SEND : begin
        if(when_ModemTop_l1004) begin
          fsmKissDecoder_stateNext = fsmKissDecoder_enumDef_DATAFEND;
        end
      end
      fsmKissDecoder_enumDef_DATAFESC : begin
        if(io_valid) begin
          if(when_ModemTop_l1011) begin
            fsmKissDecoder_stateNext = fsmKissDecoder_enumDef_SENDFESC;
          end else begin
            if(when_ModemTop_l1015) begin
              fsmKissDecoder_stateNext = fsmKissDecoder_enumDef_SENDFEND;
            end else begin
              fsmKissDecoder_stateNext = fsmKissDecoder_enumDef_HUNT;
            end
          end
        end
      end
      fsmKissDecoder_enumDef_SENDFEND : begin
        if(when_ModemTop_l1037) begin
          fsmKissDecoder_stateNext = fsmKissDecoder_enumDef_DATAFEND;
        end
      end
      fsmKissDecoder_enumDef_SENDFESC : begin
        if(when_ModemTop_l1030) begin
          fsmKissDecoder_stateNext = fsmKissDecoder_enumDef_DATAFEND;
        end
      end
      default : begin
      end
    endcase
    if(fsmKissDecoder_wantStart) begin
      fsmKissDecoder_stateNext = fsmKissDecoder_enumDef_HUNT;
    end
    if(fsmKissDecoder_wantKill) begin
      fsmKissDecoder_stateNext = fsmKissDecoder_enumDef_BOOT;
    end
  end

  assign when_ModemTop_l982 = (io_valid && (io_payload == 8'hc0));
  assign when_ModemTop_l989 = (io_payload == 8'hc0);
  assign when_ModemTop_l993 = (io_payload == 8'hdb);
  assign when_ModemTop_l1004 = (io_txReady || (txValid == 1'b0));
  assign when_ModemTop_l1011 = (io_payload == 8'hdd);
  assign when_ModemTop_l1015 = (io_payload == 8'hdc);
  assign when_ModemTop_l1037 = (io_txReady || (txValid == 1'b0));
  assign when_ModemTop_l1030 = (io_txReady || (txValid == 1'b0));
  always @(posedge clk) begin
    if(!rst_n) begin
      txValid <= 1'b0;
      fsmKissDecoder_stateReg <= fsmKissDecoder_enumDef_BOOT;
    end else begin
      if(when_ModemTop_l1044) begin
        txValid <= 1'b0;
      end
      fsmKissDecoder_stateReg <= fsmKissDecoder_stateNext;
      case(fsmKissDecoder_stateReg)
        fsmKissDecoder_enumDef_HUNT : begin
        end
        fsmKissDecoder_enumDef_DATAFEND : begin
          if(io_valid) begin
            if(!when_ModemTop_l989) begin
              if(!when_ModemTop_l993) begin
                txValid <= 1'b1;
              end
            end
          end
        end
        fsmKissDecoder_enumDef_SEND : begin
        end
        fsmKissDecoder_enumDef_DATAFESC : begin
          if(io_valid) begin
            if(when_ModemTop_l1011) begin
              txValid <= 1'b1;
            end else begin
              if(when_ModemTop_l1015) begin
                txValid <= 1'b1;
              end
            end
          end
        end
        fsmKissDecoder_enumDef_SENDFEND : begin
        end
        fsmKissDecoder_enumDef_SENDFESC : begin
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module UartFifo (
  input      [7:0]    io_dataIn,
  input               io_dataInEn,
  input               io_dataOutEn,
  output     [7:0]    io_dataOut,
  output              io_full,
  output              io_almostFull,
  output              io_almostEmpty,
  output              io_empty,
  output              io_eoverrun,
  input               clk,
  input               rst_n
);

  reg        [7:0]    _zz_io_dataOut;
  reg        [7:0]    fifo_0;
  reg        [7:0]    fifo_1;
  reg        [7:0]    fifo_2;
  reg        [7:0]    fifo_3;
  reg        [7:0]    fifo_4;
  reg        [7:0]    fifo_5;
  reg        [7:0]    fifo_6;
  reg        [7:0]    fifo_7;
  reg        [2:0]    nextOut;
  reg        [2:0]    nextIn;
  reg        [3:0]    count;
  wire                when_ModemTop_l652;
  wire       [7:0]    _zz_1;

  always @(*) begin
    case(nextOut)
      3'b000 : _zz_io_dataOut = fifo_0;
      3'b001 : _zz_io_dataOut = fifo_1;
      3'b010 : _zz_io_dataOut = fifo_2;
      3'b011 : _zz_io_dataOut = fifo_3;
      3'b100 : _zz_io_dataOut = fifo_4;
      3'b101 : _zz_io_dataOut = fifo_5;
      3'b110 : _zz_io_dataOut = fifo_6;
      default : _zz_io_dataOut = fifo_7;
    endcase
  end

  assign when_ModemTop_l652 = (io_dataInEn && io_dataOutEn);
  assign _zz_1 = ({7'd0,1'b1} <<< nextIn);
  assign io_dataOut = _zz_io_dataOut;
  assign io_full = (count == 4'b1000);
  assign io_almostFull = (4'b0110 <= count);
  assign io_almostEmpty = (count == 4'b0001);
  assign io_empty = (count == 4'b0000);
  assign io_eoverrun = ((count == 4'b1000) && io_dataInEn);
  always @(posedge clk) begin
    if(!rst_n) begin
      nextOut <= 3'b000;
      nextIn <= 3'b000;
      count <= 4'b0000;
    end else begin
      if(!when_ModemTop_l652) begin
        if(io_dataInEn) begin
          count <= (count + 4'b0001);
        end else begin
          if(io_dataOutEn) begin
            count <= (count - 4'b0001);
          end
        end
      end
      if(io_dataInEn) begin
        nextIn <= (nextIn + 3'b001);
      end
      if(io_dataOutEn) begin
        nextOut <= (nextOut + 3'b001);
      end
    end
  end

  always @(posedge clk) begin
    if(io_dataInEn) begin
      if(_zz_1[0]) begin
        fifo_0 <= io_dataIn;
      end
      if(_zz_1[1]) begin
        fifo_1 <= io_dataIn;
      end
      if(_zz_1[2]) begin
        fifo_2 <= io_dataIn;
      end
      if(_zz_1[3]) begin
        fifo_3 <= io_dataIn;
      end
      if(_zz_1[4]) begin
        fifo_4 <= io_dataIn;
      end
      if(_zz_1[5]) begin
        fifo_5 <= io_dataIn;
      end
      if(_zz_1[6]) begin
        fifo_6 <= io_dataIn;
      end
      if(_zz_1[7]) begin
        fifo_7 <= io_dataIn;
      end
    end
  end


endmodule

module UartRx (
  input               io_rxClockStb,
  input               io_uartRxIn,
  input               io_ready,
  output     [7:0]    io_payload,
  output              io_valid,
  output reg          io_eoverrun,
  input               clk,
  input               rst_n
);
  localparam fsmUartRx_enumDef_BOOT = 3'd0;
  localparam fsmUartRx_enumDef_DISC = 3'd1;
  localparam fsmUartRx_enumDef_IDLE = 3'd2;
  localparam fsmUartRx_enumDef_START = 3'd3;
  localparam fsmUartRx_enumDef_DATA = 3'd4;
  localparam fsmUartRx_enumDef_STOP = 3'd5;

  wire                io_uartRxIn_buffercc_io_dataOut;
  wire                _zz_sampleValue;
  wire                _zz_sampleValue_1;
  wire                _zz_sampleValue_2;
  wire                _zz_sampleValue_3;
  wire                _zz_sampleValue_4;
  wire                _zz_sampleValue_5;
  wire                _zz_sampleValue_6;
  wire                _zz_sampleValue_7;
  wire                _zz_sampleValue_8;
  wire                _zz_sampleValue_9;
  wire                _zz_sampleValue_10;
  wire                _zz_sampleValue_11;
  wire                _zz_sampleValue_12;
  wire                _zz_sampleValue_13;
  wire                _zz_sampleValue_14;
  wire                _zz_sampleValue_15;
  wire                _zz_sampleValue_16;
  wire                _zz_sampleValue_17;
  wire                _zz_sampleValue_18;
  wire                _zz_sampleValue_19;
  wire                _zz_sampleValue_20;
  wire                _zz_sampleValue_21;
  wire                _zz_sampleValue_22;
  wire                _zz_sampleValue_23;
  wire                _zz_sampleValue_24;
  wire                _zz_sampleValue_25;
  wire                _zz_sampleValue_26;
  wire                _zz_sampleValue_27;
  wire                _zz_sampleValue_28;
  wire                _zz_sampleValue_29;
  wire                _zz_sampleValue_30;
  wire                _zz_sampleValue_31;
  wire                _zz_sampleValue_32;
  wire                _zz_sampleValue_33;
  wire                _zz_sampleValue_34;
  wire                _zz_sampleValue_35;
  reg        [7:0]    payloadReg;
  reg                 validReg;
  wire                MARK;
  wire                SPACE;
  wire                cc;
  wire                samples_0;
  reg                 samples_1;
  reg                 samples_2;
  reg                 samples_3;
  reg                 samples_4;
  reg                 samples_5;
  reg                 samples_6;
  wire                sampleValue;
  reg        [2:0]    sampleTimer_counter;
  reg                 sampleTimer_tick;
  reg        [2:0]    bitId;
  wire                fsmUartRx_wantExit;
  reg                 fsmUartRx_wantStart;
  wire                fsmUartRx_wantKill;
  wire                when_ModemTop_l846;
  reg        [2:0]    fsmUartRx_stateReg;
  reg        [2:0]    fsmUartRx_stateNext;
  wire                when_ModemTop_l797;
  wire                when_ModemTop_l803;
  wire                when_ModemTop_l814;
  wire                when_ModemTop_l825;
  wire                when_ModemTop_l834;
  `ifndef SYNTHESIS
  reg [39:0] fsmUartRx_stateReg_string;
  reg [39:0] fsmUartRx_stateNext_string;
  `endif


  assign _zz_sampleValue = (((((_zz_sampleValue_1 || _zz_sampleValue_26) || (_zz_sampleValue_27 && samples_6)) || ((_zz_sampleValue_28 && samples_5) && samples_6)) || (((_zz_sampleValue_29 && samples_2) && samples_5) && samples_6)) || ((((_zz_sampleValue_30 && samples_0) && samples_3) && samples_5) && samples_6));
  assign _zz_sampleValue_31 = ((((1'b1 && samples_1) && samples_3) && samples_5) && samples_6);
  assign _zz_sampleValue_32 = (((1'b1 && samples_2) && samples_3) && samples_5);
  assign _zz_sampleValue_33 = ((1'b1 && samples_0) && samples_4);
  assign _zz_sampleValue_34 = (1'b1 && samples_1);
  assign _zz_sampleValue_35 = 1'b1;
  assign _zz_sampleValue_1 = (((((_zz_sampleValue_2 || _zz_sampleValue_21) || (_zz_sampleValue_22 && samples_6)) || ((_zz_sampleValue_23 && samples_4) && samples_6)) || (((_zz_sampleValue_24 && samples_3) && samples_4) && samples_6)) || ((((_zz_sampleValue_25 && samples_1) && samples_3) && samples_4) && samples_6));
  assign _zz_sampleValue_26 = ((((1'b1 && samples_2) && samples_3) && samples_4) && samples_6);
  assign _zz_sampleValue_27 = (((1'b1 && samples_0) && samples_1) && samples_5);
  assign _zz_sampleValue_28 = ((1'b1 && samples_0) && samples_2);
  assign _zz_sampleValue_29 = (1'b1 && samples_1);
  assign _zz_sampleValue_30 = 1'b1;
  assign _zz_sampleValue_2 = ((((((_zz_sampleValue_3 || _zz_sampleValue_16) || (_zz_sampleValue_17 && samples_5)) || ((_zz_sampleValue_18 && samples_2) && samples_6)) || (((_zz_sampleValue_19 && samples_1) && samples_3) && samples_6)) || ((((_zz_sampleValue_20 && samples_0) && samples_2) && samples_3) && samples_6)) || ((((1'b1 && samples_1) && samples_2) && samples_3) && samples_6));
  assign _zz_sampleValue_21 = ((((1'b1 && samples_0) && samples_1) && samples_4) && samples_6);
  assign _zz_sampleValue_22 = (((1'b1 && samples_0) && samples_2) && samples_4);
  assign _zz_sampleValue_23 = ((1'b1 && samples_1) && samples_2);
  assign _zz_sampleValue_24 = (1'b1 && samples_0);
  assign _zz_sampleValue_25 = 1'b1;
  assign _zz_sampleValue_3 = ((((((_zz_sampleValue_4 || _zz_sampleValue_11) || (_zz_sampleValue_12 && samples_5)) || ((_zz_sampleValue_13 && samples_4) && samples_5)) || (((_zz_sampleValue_14 && samples_2) && samples_4) && samples_5)) || ((((_zz_sampleValue_15 && samples_1) && samples_2) && samples_4) && samples_5)) || ((((1'b1 && samples_0) && samples_3) && samples_4) && samples_5));
  assign _zz_sampleValue_16 = ((((1'b1 && samples_1) && samples_3) && samples_4) && samples_5);
  assign _zz_sampleValue_17 = (((1'b1 && samples_2) && samples_3) && samples_4);
  assign _zz_sampleValue_18 = ((1'b1 && samples_0) && samples_1);
  assign _zz_sampleValue_19 = (1'b1 && samples_0);
  assign _zz_sampleValue_20 = 1'b1;
  assign _zz_sampleValue_4 = ((((((_zz_sampleValue_5 || _zz_sampleValue_6) || (_zz_sampleValue_7 && samples_4)) || ((_zz_sampleValue_8 && samples_3) && samples_4)) || (((_zz_sampleValue_9 && samples_2) && samples_3) && samples_4)) || ((((_zz_sampleValue_10 && samples_0) && samples_1) && samples_2) && samples_5)) || ((((1'b1 && samples_0) && samples_1) && samples_3) && samples_5));
  assign _zz_sampleValue_11 = ((((1'b1 && samples_0) && samples_2) && samples_3) && samples_5);
  assign _zz_sampleValue_12 = (((1'b1 && samples_1) && samples_2) && samples_3);
  assign _zz_sampleValue_13 = ((1'b1 && samples_0) && samples_1);
  assign _zz_sampleValue_14 = (1'b1 && samples_0);
  assign _zz_sampleValue_15 = 1'b1;
  assign _zz_sampleValue_5 = (1'b0 || ((((1'b1 && samples_0) && samples_1) && samples_2) && samples_3));
  assign _zz_sampleValue_6 = ((((1'b1 && samples_0) && samples_1) && samples_2) && samples_4);
  assign _zz_sampleValue_7 = (((1'b1 && samples_0) && samples_1) && samples_3);
  assign _zz_sampleValue_8 = ((1'b1 && samples_0) && samples_2);
  assign _zz_sampleValue_9 = (1'b1 && samples_1);
  assign _zz_sampleValue_10 = 1'b1;
  BufferCC io_uartRxIn_buffercc (
    .io_dataIn  (io_uartRxIn                    ), //i
    .io_dataOut (io_uartRxIn_buffercc_io_dataOut), //o
    .clk        (clk                            ), //i
    .rst_n      (rst_n                          )  //i
  );
  initial begin
  `ifndef SYNTHESIS
    payloadReg = {1{$urandom}};
    sampleTimer_counter = {1{$urandom}};
  `endif
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsmUartRx_stateReg)
      fsmUartRx_enumDef_BOOT : fsmUartRx_stateReg_string = "BOOT ";
      fsmUartRx_enumDef_DISC : fsmUartRx_stateReg_string = "DISC ";
      fsmUartRx_enumDef_IDLE : fsmUartRx_stateReg_string = "IDLE ";
      fsmUartRx_enumDef_START : fsmUartRx_stateReg_string = "START";
      fsmUartRx_enumDef_DATA : fsmUartRx_stateReg_string = "DATA ";
      fsmUartRx_enumDef_STOP : fsmUartRx_stateReg_string = "STOP ";
      default : fsmUartRx_stateReg_string = "?????";
    endcase
  end
  always @(*) begin
    case(fsmUartRx_stateNext)
      fsmUartRx_enumDef_BOOT : fsmUartRx_stateNext_string = "BOOT ";
      fsmUartRx_enumDef_DISC : fsmUartRx_stateNext_string = "DISC ";
      fsmUartRx_enumDef_IDLE : fsmUartRx_stateNext_string = "IDLE ";
      fsmUartRx_enumDef_START : fsmUartRx_stateNext_string = "START";
      fsmUartRx_enumDef_DATA : fsmUartRx_stateNext_string = "DATA ";
      fsmUartRx_enumDef_STOP : fsmUartRx_stateNext_string = "STOP ";
      default : fsmUartRx_stateNext_string = "?????";
    endcase
  end
  `endif

  always @(*) begin
    io_eoverrun = 1'b0;
    case(fsmUartRx_stateReg)
      fsmUartRx_enumDef_DISC : begin
      end
      fsmUartRx_enumDef_IDLE : begin
      end
      fsmUartRx_enumDef_START : begin
        if(sampleTimer_tick) begin
          if(io_valid) begin
            io_eoverrun = 1'b1;
          end
        end
      end
      fsmUartRx_enumDef_DATA : begin
      end
      fsmUartRx_enumDef_STOP : begin
      end
      default : begin
      end
    endcase
  end

  assign io_payload = payloadReg;
  assign io_valid = validReg;
  assign MARK = 1'b1;
  assign SPACE = 1'b0;
  assign cc = io_uartRxIn_buffercc_io_dataOut;
  assign samples_0 = cc;
  assign sampleValue = ((((((_zz_sampleValue || _zz_sampleValue_31) || (_zz_sampleValue_32 && samples_6)) || ((_zz_sampleValue_33 && samples_5) && samples_6)) || (((_zz_sampleValue_34 && samples_4) && samples_5) && samples_6)) || ((((_zz_sampleValue_35 && samples_2) && samples_4) && samples_5) && samples_6)) || ((((1'b1 && samples_3) && samples_4) && samples_5) && samples_6));
  always @(*) begin
    sampleTimer_tick = 1'b0;
    if(io_rxClockStb) begin
      sampleTimer_tick = (sampleTimer_counter == 3'b000);
    end
  end

  assign fsmUartRx_wantExit = 1'b0;
  always @(*) begin
    fsmUartRx_wantStart = 1'b0;
    case(fsmUartRx_stateReg)
      fsmUartRx_enumDef_DISC : begin
      end
      fsmUartRx_enumDef_IDLE : begin
      end
      fsmUartRx_enumDef_START : begin
      end
      fsmUartRx_enumDef_DATA : begin
      end
      fsmUartRx_enumDef_STOP : begin
      end
      default : begin
        fsmUartRx_wantStart = 1'b1;
      end
    endcase
  end

  assign fsmUartRx_wantKill = 1'b0;
  assign when_ModemTop_l846 = (io_valid && io_ready);
  always @(*) begin
    fsmUartRx_stateNext = fsmUartRx_stateReg;
    case(fsmUartRx_stateReg)
      fsmUartRx_enumDef_DISC : begin
        if(when_ModemTop_l797) begin
          fsmUartRx_stateNext = fsmUartRx_enumDef_IDLE;
        end
      end
      fsmUartRx_enumDef_IDLE : begin
        if(when_ModemTop_l803) begin
          fsmUartRx_stateNext = fsmUartRx_enumDef_START;
        end
      end
      fsmUartRx_enumDef_START : begin
        if(sampleTimer_tick) begin
          if(io_valid) begin
            fsmUartRx_stateNext = fsmUartRx_enumDef_IDLE;
          end else begin
            if(when_ModemTop_l814) begin
              fsmUartRx_stateNext = fsmUartRx_enumDef_DATA;
            end else begin
              fsmUartRx_stateNext = fsmUartRx_enumDef_IDLE;
            end
          end
        end
      end
      fsmUartRx_enumDef_DATA : begin
        if(sampleTimer_tick) begin
          if(when_ModemTop_l825) begin
            fsmUartRx_stateNext = fsmUartRx_enumDef_STOP;
          end
        end
      end
      fsmUartRx_enumDef_STOP : begin
        if(sampleTimer_tick) begin
          if(when_ModemTop_l834) begin
            fsmUartRx_stateNext = fsmUartRx_enumDef_IDLE;
          end else begin
            fsmUartRx_stateNext = fsmUartRx_enumDef_DISC;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsmUartRx_wantStart) begin
      fsmUartRx_stateNext = fsmUartRx_enumDef_DISC;
    end
    if(fsmUartRx_wantKill) begin
      fsmUartRx_stateNext = fsmUartRx_enumDef_BOOT;
    end
  end

  assign when_ModemTop_l797 = (io_rxClockStb && (sampleValue == MARK));
  assign when_ModemTop_l803 = (io_rxClockStb && (sampleValue == SPACE));
  assign when_ModemTop_l814 = (sampleValue == SPACE);
  assign when_ModemTop_l825 = (bitId == 3'b111);
  assign when_ModemTop_l834 = (sampleValue == MARK);
  always @(posedge clk) begin
    if(!rst_n) begin
      validReg <= 1'b0;
      fsmUartRx_stateReg <= fsmUartRx_enumDef_BOOT;
    end else begin
      if(when_ModemTop_l846) begin
        validReg <= 1'b0;
      end
      fsmUartRx_stateReg <= fsmUartRx_stateNext;
      case(fsmUartRx_stateReg)
        fsmUartRx_enumDef_DISC : begin
        end
        fsmUartRx_enumDef_IDLE : begin
        end
        fsmUartRx_enumDef_START : begin
        end
        fsmUartRx_enumDef_DATA : begin
        end
        fsmUartRx_enumDef_STOP : begin
          if(sampleTimer_tick) begin
            if(when_ModemTop_l834) begin
              validReg <= 1'b1;
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(io_rxClockStb) begin
      samples_1 <= samples_0;
    end
    if(io_rxClockStb) begin
      samples_2 <= samples_1;
    end
    if(io_rxClockStb) begin
      samples_3 <= samples_2;
    end
    if(io_rxClockStb) begin
      samples_4 <= samples_3;
    end
    if(io_rxClockStb) begin
      samples_5 <= samples_4;
    end
    if(io_rxClockStb) begin
      samples_6 <= samples_5;
    end
    if(io_rxClockStb) begin
      sampleTimer_counter <= (sampleTimer_counter - 3'b001);
    end
    case(fsmUartRx_stateReg)
      fsmUartRx_enumDef_DISC : begin
      end
      fsmUartRx_enumDef_IDLE : begin
        if(when_ModemTop_l803) begin
          sampleTimer_counter <= 3'b010;
        end
      end
      fsmUartRx_enumDef_START : begin
        if(sampleTimer_tick) begin
          if(!io_valid) begin
            if(when_ModemTop_l814) begin
              bitId <= 3'b000;
            end
          end
        end
      end
      fsmUartRx_enumDef_DATA : begin
        if(sampleTimer_tick) begin
          payloadReg[bitId] <= sampleValue;
          if(!when_ModemTop_l825) begin
            bitId <= (bitId + 3'b001);
          end
        end
      end
      fsmUartRx_enumDef_STOP : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module Scrambler (
  input               io_dataIn,
  input               io_en,
  input               io_sim,
  output     [16:0]   io_vecOut,
  output              io_dataOut,
  input               rst_n,
  input               clk
);

  reg        [16:0]   vec;
  wire                partial;
  wire                result;
  wire                when_ModemTop_l197;

  assign partial = (vec[16] ^ vec[11]);
  assign result = (partial ^ io_dataIn);
  assign when_ModemTop_l197 = (! rst_n);
  assign io_dataOut = result;
  assign io_vecOut = vec;
  always @(posedge clk) begin
    vec[0] <= result;
    if(when_ModemTop_l197) begin
      if(io_sim) begin
        vec <= 17'h00000;
      end
    end else begin
      if(io_en) begin
        vec[1] <= vec[0];
        vec[2] <= vec[1];
        vec[3] <= vec[2];
        vec[4] <= vec[3];
        vec[5] <= vec[4];
        vec[6] <= vec[5];
        vec[7] <= vec[6];
        vec[8] <= vec[7];
        vec[9] <= vec[8];
        vec[10] <= vec[9];
        vec[11] <= vec[10];
        vec[12] <= vec[11];
        vec[13] <= vec[12];
        vec[14] <= vec[13];
        vec[15] <= vec[14];
        vec[16] <= vec[15];
      end
    end
  end


endmodule

module CRC16_CCITT (
  input      [7:0]    io_data,
  input               io_enable,
  input               io_init,
  output     [15:0]   io_crc,
  output              io_crcError,
  input               clk,
  input               rst_n
);

  wire       [15:0]   _zz_INITIAL_VALUE;
  wire       [15:0]   _zz_VERIFY_VALUE;
  wire       [0:0]    _zz_crc;
  wire       [4:0]    _zz_crc_1;
  wire       [15:0]   INITIAL_VALUE;
  wire       [15:0]   VERIFY_VALUE;
  wire                crcNext_0;
  wire                crcNext_1;
  wire                crcNext_2;
  wire                crcNext_3;
  wire                crcNext_4;
  wire                crcNext_5;
  wire                crcNext_6;
  wire                crcNext_7;
  wire                crcNext_8;
  wire                crcNext_9;
  wire                crcNext_10;
  wire                crcNext_11;
  wire                crcNext_12;
  wire                crcNext_13;
  wire                crcNext_14;
  wire                crcNext_15;
  reg        [15:0]   crc;

  assign _zz_INITIAL_VALUE = 16'hffff;
  assign _zz_VERIFY_VALUE = 16'he5cc;
  assign _zz_crc = crcNext_5;
  assign _zz_crc_1 = {crcNext_4,{crcNext_3,{crcNext_2,{crcNext_1,crcNext_0}}}};
  assign INITIAL_VALUE = _zz_INITIAL_VALUE;
  assign VERIFY_VALUE = _zz_VERIFY_VALUE;
  assign crcNext_0 = (((crc[8] ^ crc[12]) ^ io_data[0]) ^ io_data[4]);
  assign crcNext_1 = (((crc[9] ^ crc[13]) ^ io_data[1]) ^ io_data[5]);
  assign crcNext_2 = (((crc[10] ^ crc[14]) ^ io_data[2]) ^ io_data[6]);
  assign crcNext_3 = (((crc[11] ^ crc[15]) ^ io_data[3]) ^ io_data[7]);
  assign crcNext_4 = (crc[12] ^ io_data[4]);
  assign crcNext_5 = (((((crc[8] ^ crc[12]) ^ crc[13]) ^ io_data[0]) ^ io_data[4]) ^ io_data[5]);
  assign crcNext_6 = (((((crc[9] ^ crc[13]) ^ crc[14]) ^ io_data[1]) ^ io_data[5]) ^ io_data[6]);
  assign crcNext_7 = (((((crc[10] ^ crc[14]) ^ crc[15]) ^ io_data[2]) ^ io_data[6]) ^ io_data[7]);
  assign crcNext_8 = ((((crc[0] ^ crc[11]) ^ crc[15]) ^ io_data[3]) ^ io_data[7]);
  assign crcNext_9 = ((crc[1] ^ crc[12]) ^ io_data[4]);
  assign crcNext_10 = ((crc[2] ^ crc[13]) ^ io_data[5]);
  assign crcNext_11 = ((crc[3] ^ crc[14]) ^ io_data[6]);
  assign crcNext_12 = ((((((crc[4] ^ crc[8]) ^ crc[12]) ^ crc[15]) ^ io_data[0]) ^ io_data[4]) ^ io_data[7]);
  assign crcNext_13 = ((((crc[5] ^ crc[9]) ^ crc[13]) ^ io_data[1]) ^ io_data[5]);
  assign crcNext_14 = ((((crc[6] ^ crc[10]) ^ crc[14]) ^ io_data[2]) ^ io_data[6]);
  assign crcNext_15 = ((((crc[7] ^ crc[11]) ^ crc[15]) ^ io_data[3]) ^ io_data[7]);
  assign io_crc = crc;
  assign io_crcError = (crc != VERIFY_VALUE);
  always @(posedge clk) begin
    if(!rst_n) begin
      crc <= INITIAL_VALUE;
    end else begin
      if(io_init) begin
        crc <= INITIAL_VALUE;
      end else begin
        if(io_enable) begin
          crc <= {crcNext_15,{crcNext_14,{crcNext_13,{crcNext_12,{crcNext_11,{crcNext_10,{crcNext_9,{crcNext_8,{crcNext_7,{crcNext_6,{_zz_crc,_zz_crc_1}}}}}}}}}}};
        end
      end
    end
  end


endmodule

module CRC16_CCITT_1 (
  input      [0:0]    io_data,
  input               io_enable,
  input               io_init,
  output     [15:0]   io_crc,
  output              io_crcError,
  input               clk,
  input               rst_n
);

  wire       [15:0]   _zz_INITIAL_VALUE;
  wire       [15:0]   _zz_VERIFY_VALUE;
  wire       [0:0]    _zz_crc;
  wire       [4:0]    _zz_crc_1;
  wire       [15:0]   INITIAL_VALUE;
  wire       [15:0]   VERIFY_VALUE;
  wire                crcNext_0;
  wire                crcNext_1;
  wire                crcNext_2;
  wire                crcNext_3;
  wire                crcNext_4;
  wire                crcNext_5;
  wire                crcNext_6;
  wire                crcNext_7;
  wire                crcNext_8;
  wire                crcNext_9;
  wire                crcNext_10;
  wire                crcNext_11;
  wire                crcNext_12;
  wire                crcNext_13;
  wire                crcNext_14;
  wire                crcNext_15;
  reg        [15:0]   crc;

  assign _zz_INITIAL_VALUE = 16'hffff;
  assign _zz_VERIFY_VALUE = 16'he5cc;
  assign _zz_crc = crcNext_5;
  assign _zz_crc_1 = {crcNext_4,{crcNext_3,{crcNext_2,{crcNext_1,crcNext_0}}}};
  assign INITIAL_VALUE = _zz_INITIAL_VALUE;
  assign VERIFY_VALUE = _zz_VERIFY_VALUE;
  assign crcNext_0 = (crc[15] ^ io_data[0]);
  assign crcNext_1 = crc[0];
  assign crcNext_2 = crc[1];
  assign crcNext_3 = crc[2];
  assign crcNext_4 = crc[3];
  assign crcNext_5 = ((crc[4] ^ crc[15]) ^ io_data[0]);
  assign crcNext_6 = crc[5];
  assign crcNext_7 = crc[6];
  assign crcNext_8 = crc[7];
  assign crcNext_9 = crc[8];
  assign crcNext_10 = crc[9];
  assign crcNext_11 = crc[10];
  assign crcNext_12 = ((crc[11] ^ crc[15]) ^ io_data[0]);
  assign crcNext_13 = crc[12];
  assign crcNext_14 = crc[13];
  assign crcNext_15 = crc[14];
  assign io_crc = crc;
  assign io_crcError = (crc != VERIFY_VALUE);
  always @(posedge clk) begin
    if(!rst_n) begin
      crc <= INITIAL_VALUE;
    end else begin
      if(io_init) begin
        crc <= INITIAL_VALUE;
      end else begin
        if(io_enable) begin
          crc <= {crcNext_15,{crcNext_14,{crcNext_13,{crcNext_12,{crcNext_11,{crcNext_10,{crcNext_9,{crcNext_8,{crcNext_7,{crcNext_6,{_zz_crc,_zz_crc_1}}}}}}}}}}};
        end
      end
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               rst_n
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule
