module UsbPhy (
      input   io_phyTxMode,
      output  io_usbRst,
      input   io_rxd,
      input   io_rxdp,
      input   io_rxdn,
      output  io_txdp,
      output  io_txdn,
      output  io_txoe,
      output  io_ceO,
      input   io_lineCtrlI,
      input  [7:0] io_dataOutI,
      input   io_txValidI,
      output  io_txReadyO,
      output [7:0] io_dataInO,
      output  io_rxValidO,
      output  io_rxActiveO,
      output  io_rxErrorO,
      output [1:0] io_lineStateO,
      input   clkout2,
      input   reset);
  wire [1:0] usbRxPhy_1__io_lineState;
  wire  usbRxPhy_1__io_clkRecovered;
  wire  usbRxPhy_1__io_clkRecoveredEdge;
  wire  usbRxPhy_1__io_rawData;
  wire  usbRxPhy_1__io_rxActive;
  wire  usbRxPhy_1__io_rxError;
  wire  usbRxPhy_1__io_valid;
  wire [7:0] usbRxPhy_1__io_data;
  wire  usbTxPhy_1__io_txdp;
  wire  usbTxPhy_1__io_txdn;
  wire  usbTxPhy_1__io_txoe;
  wire  usbTxPhy_1__io_txReadyO;
  reg [4:0] rRstCnt;
  wire  rUsbRstOut;
  wire  sTxoe;
  UsbRxPhy usbRxPhy_1_ ( 
    .io_usbDif(io_rxd),
    .io_usbDp(io_rxdp),
    .io_usbDn(io_rxdn),
    .io_lineState(usbRxPhy_1__io_lineState),
    .io_clkRecovered(usbRxPhy_1__io_clkRecovered),
    .io_clkRecoveredEdge(usbRxPhy_1__io_clkRecoveredEdge),
    .io_rawData(usbRxPhy_1__io_rawData),
    .io_rxEn(sTxoe),
    .io_rxActive(usbRxPhy_1__io_rxActive),
    .io_rxError(usbRxPhy_1__io_rxError),
    .io_valid(usbRxPhy_1__io_valid),
    .io_data(usbRxPhy_1__io_data),
    .clkout2(clkout2),
    .reset(reset) 
  );
  UsbTxPhy usbTxPhy_1_ ( 
    .io_fsCe(usbRxPhy_1__io_clkRecoveredEdge),
    .io_phyMode(io_phyTxMode),
    .io_txdp(usbTxPhy_1__io_txdp),
    .io_txdn(usbTxPhy_1__io_txdn),
    .io_txoe(usbTxPhy_1__io_txoe),
    .io_lineCtrlI(io_lineCtrlI),
    .io_dataOutI(io_dataOutI),
    .io_txValidI(io_txValidI),
    .io_txReadyO(usbTxPhy_1__io_txReadyO),
    .clkout2(clkout2),
    .reset(reset) 
  );
  assign rUsbRstOut = 1'b0;
  assign sTxoe = usbTxPhy_1__io_txoe;
  assign io_usbRst = (rRstCnt == (5'b11111));
  assign io_rxErrorO = 1'b0;
  assign io_ceO = usbRxPhy_1__io_clkRecoveredEdge;
  assign io_txdp = usbTxPhy_1__io_txdp;
  assign io_txdn = usbTxPhy_1__io_txdn;
  assign io_txoe = usbTxPhy_1__io_txoe;
  assign io_txReadyO = usbTxPhy_1__io_txReadyO;
  assign io_dataInO = usbRxPhy_1__io_data;
  assign io_lineStateO = usbRxPhy_1__io_lineState;
  assign io_rxValidO = usbRxPhy_1__io_valid;
  assign io_rxActiveO = usbRxPhy_1__io_rxActive;
  always @ (posedge clkout2 or posedge reset) begin
    if (reset) begin
      rRstCnt <= (5'b00000);
    end else begin
      if((usbRxPhy_1__io_lineState != (2'b00)))begin
        rRstCnt <= (5'b00000);
      end else begin
        rRstCnt <= (rRstCnt + (5'b00001));
      end
    end
  end

endmodule

