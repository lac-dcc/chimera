`timescale 1ns / 1ps

`include "macros.vh"
`include "riscvConst.vh"

module mac_gmii
(
  input wire clk_eth,
  input wire reset_eth,

  input wire clk_cpu,
  input wire reset_cpu,

  input wire clk_200,
  input wire reset_200,

  output wire [63:0] rxq_bits,
  output wire        rxq_last_word,
  output wire        rxq_val,
  input  wire        rxq_rdy,

  input  wire [63:0] txq_bits,
  input  wire        txq_last_word,
  input  wire [2:0]  txq_byte_cnt,
  input  wire        txq_val,
  output wire        txq_rdy,

  output rxclk,

  output reg  [7:0] GMII_TXD   /* synthesis syn_useioff=1 */,   
  output reg        GMII_TX_EN /* synthesis syn_useioff=1 */,
  output reg        GMII_TX_ER /* synthesis syn_useioff=1 */,
  output wire       GMII_TX_CLK, //to PHY. Made in ODDR
  input  wire [7:0] GMII_RXD,
  input  wire       GMII_RX_DV,
  input  wire       GMII_RX_ER,
  input  wire       GMII_RX_CLK, //from PHY. Goes through BUFG
  output wire       GMII_RESET_B      
);
  
  wire ethTXclock = clk_eth;
  wire ethRXclock;
  
  wire       TX_EN_FROM_MAC;
  wire       TX_ER_FROM_MAC;
  wire [7:0] TXD_FROM_MAC;

  (* syn_useioff=1 *) reg [7:0] RXdataDelayReg;
  (* syn_useioff=1 *) reg       RXdvDelayReg, RXerDelayReg;

  wire       RXclockDelay;
  wire [7:0] RXdataDelay;
  wire       RXdvDelay, RXerDelay;
  
  wire [15:0] RXmacData;
  wire [7:0]  RXdata;
  wire        RXdataValid;
  wire        RXgoodFrame;
  wire        RXbadFrame;
   
  reg [7:0] TXdata;
  reg       TXdataValid;
  wire      TXack;

  // rxq

  wire rxq_full;
  wire rxq_empty;

  wire rxq_enq_clk;
  wire [63:0] rxq_enq_bits;
  wire [7:0] rxq_enq_aux_bits;
  wire rxq_enq_val;
  wire rxq_enq_rdy;

  wire rxq_deq_clk;
  wire [63:0] rxq_deq_bits;
  wire [7:0] rxq_deq_aux_bits;
  wire rxq_deq_val;
  wire rxq_deq_rdy;

  assign rxq_enq_clk = ethRXclock;
  assign rxq_deq_clk = clk_cpu;

  assign rxq_deq_rdy = rxq_rdy;

  FIFO36_72
  #(
    .DO_REG(1),       // Enable output register (0 or 1)
    .EN_SYN("FALSE"), // Specifies FIFO as Asynchronous ("FALSE")
    .FIRST_WORD_FALL_THROUGH("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE"
  )
  rxq
  (
    .RST(reset_eth),

    .WRCLK(rxq_enq_clk),
    .DI(rxq_enq_bits),
    .DIP(rxq_enq_aux_bits),
    .WREN(~reset_eth & rxq_enq_rdy & rxq_enq_val),
    .FULL(rxq_full),
    .ALMOSTFULL(),
    .WRCOUNT(),
    .WRERR(),

    .RDCLK(rxq_deq_clk),
    .DO(rxq_deq_bits),
    .DOP(rxq_deq_aux_bits),
    .RDEN(~reset_cpu & rxq_deq_rdy & rxq_deq_val),
    .EMPTY(rxq_empty),
    .ALMOSTEMPTY(),
    .RDCOUNT(),
    .RDERR(),

    .DBITERR(),
    .SBITERR(),
    .ECCPARITY()
  );

  assign rxq_enq_rdy = ~rxq_full;
  assign rxq_deq_val = ~rxq_empty;

  assign rxq_bits = rxq_deq_bits;
  assign rxq_last_word = rxq_deq_aux_bits[6];
  assign rxq_val = rxq_deq_val;


  // rx logic

  reg reg_rx_val, next_rx_val;
  reg [2:0] reg_rx_cnt, next_rx_cnt;
  reg [63:0] reg_rx_bits, next_rx_bits;
  reg reg_rx_good;
  reg reg_rx_bad;

  always @(posedge ethRXclock or posedge reset_eth)
  begin
    if (reset_eth)
    begin
      reg_rx_val <= '0;
      reg_rx_cnt <= '0;
      reg_rx_bits <= '0;
      reg_rx_good <= '0;
      reg_rx_bad <= '0;
    end
    else
    begin
      reg_rx_val <= next_rx_val;
      reg_rx_cnt <= next_rx_cnt;
      reg_rx_bits <= next_rx_bits;
      reg_rx_good <= RXgoodFrame;
      reg_rx_bad <= RXbadFrame;
    end
  end

  always @(*)
  begin
    next_rx_val = '0;
    next_rx_cnt = reg_rx_cnt;
    next_rx_bits = reg_rx_bits;

    if (RXdataValid)
    begin
      if (reg_rx_cnt == 3'd7)
        next_rx_val = 1'b1;

      next_rx_cnt = reg_rx_cnt + 1'b1;
      case (reg_rx_cnt)
      3'd0: next_rx_bits[7:0] = RXmacData;
      3'd1: next_rx_bits[15:8] = RXmacData;
      3'd2: next_rx_bits[23:16] = RXmacData;
      3'd3: next_rx_bits[31:24] = RXmacData;
      3'd4: next_rx_bits[39:32] = RXmacData;
      3'd5: next_rx_bits[47:40] = RXmacData;
      3'd6: next_rx_bits[55:48] = RXmacData;
      3'd7: next_rx_bits[63:56] = RXmacData;
      endcase
    end

    if (RXgoodFrame || RXbadFrame)
    begin
      next_rx_val = 1'b1;
      next_rx_cnt = '0;
    end
  end

  assign rxq_enq_bits = reg_rx_bits;
  assign rxq_enq_aux_bits = {1'b0, reg_rx_good | reg_rx_bad, reg_rx_good, reg_rx_bad, 1'b0, reg_rx_cnt-1'b1};
  assign rxq_enq_val = reg_rx_val;

  assign rxclk = ethRXclock;


  // txq

  wire [63:0] txq_watermark_bits;
  wire [2:0] txq_watermark_aux_bits;
  wire txq_watermark_val;
  wire txq_watermark_rdy;

  `VC_SIMPLE_QUEUE(67, 8) txq_watermark
  (
    .clk(clk_cpu),
    .reset(reset_cpu),
    .enq_bits({txq_byte_cnt,txq_bits}),
    .enq_val(txq_val),
    .enq_rdy(txq_rdy),
    .deq_bits({txq_watermark_aux_bits,txq_watermark_bits}),
    .deq_val(txq_watermark_val),
    .deq_rdy(txq_watermark_rdy)
  );

  reg txq_watermark_reached;

  always @(posedge clk_cpu)
  begin
    if (reset_cpu)
      txq_watermark_reached <= 1'b0;
    else if (txq_val && txq_rdy && txq_last_word)
      txq_watermark_reached <= 1'b1;
    else if (txq_watermark_reached && !txq_watermark_val)
      txq_watermark_reached <= 1'b0;
  end

  wire txq_full;
  wire txq_empty;

  wire txq_enq_clk;
  wire [63:0] txq_enq_bits;
  wire [7:0] txq_enq_aux_bits;
  wire txq_enq_val;
  wire txq_enq_rdy;

  wire txq_deq_clk;
  wire [63:0] txq_deq_bits;
  wire [8:0] txq_deq_count;
  wire [7:0] txq_deq_aux_bits;
  wire txq_deq_val;
  wire txq_deq_rdy;

  assign txq_enq_clk = clk_cpu;
  assign txq_deq_clk = ethTXclock;

  assign txq_enq_bits = txq_watermark_bits;
  assign txq_enq_aux_bits = {5'd0, txq_watermark_aux_bits};
  assign txq_enq_val = txq_watermark_reached & txq_watermark_val;

  FIFO36_72
  #(
    .DO_REG(1),       // Enable output register (0 or 1)
    .EN_SYN("FALSE"), // Specifies FIFO as Asynchronous ("FALSE")
    .FIRST_WORD_FALL_THROUGH("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE"
  )
  txq
  (
    .RST(reset_eth),

    .WRCLK(txq_enq_clk),
    .DI(txq_enq_bits),
    .DIP(txq_enq_aux_bits),
    .WREN(~reset_cpu & txq_enq_rdy & txq_enq_val),
    .FULL(txq_full),
    .ALMOSTFULL(),
    .WRCOUNT(),
    .WRERR(),

    .RDCLK(txq_deq_clk),
    .DO(txq_deq_bits),
    .DOP(txq_deq_aux_bits),
    .RDEN(~reset_eth & txq_deq_rdy & txq_deq_val),
    .EMPTY(txq_empty),
    .ALMOSTEMPTY(),
    .RDCOUNT(txq_deq_count),
    .RDERR(),

    .DBITERR(),
    .SBITERR(),
    .ECCPARITY()
  );

  assign txq_watermark_rdy = ~txq_full & txq_watermark_reached;
  assign txq_enq_rdy = ~txq_full;
  assign txq_deq_val = ~txq_empty;

  //assign txq_rdy = txq_enq_rdy;


  // tx logic

  reg reg_tx_state, next_tx_state;
  reg [9:0] reg_tx_cnt, next_tx_cnt;

  always @(posedge ethTXclock or posedge reset_eth)
  begin
    if (reset_eth)
    begin
      reg_tx_state <= '0;
      reg_tx_cnt <= '0;
    end
    else
    begin
      reg_tx_state <= next_tx_state;
      reg_tx_cnt <= next_tx_cnt;
    end
  end

  always @(*)
  begin
    next_tx_state = reg_tx_state;
    next_tx_cnt = reg_tx_cnt;
    TXdataValid = 1'b0;
    TXdata = '0;

    if (txq_deq_val && reg_tx_cnt[2:0] <= txq_deq_aux_bits[2:0])
    begin
      if (!(reg_tx_state == 1'b0 && reg_tx_cnt[2:0] == 3'd0) || TXack)
      begin
        next_tx_state = 1'b1;
        next_tx_cnt = reg_tx_cnt + 1'b1;
      end

      TXdataValid = 1'b1;
      case (reg_tx_cnt[2:0])
      3'd0: TXdata = txq_deq_bits[7:0];
      3'd1: TXdata = txq_deq_bits[15:8];
      3'd2: TXdata = txq_deq_bits[23:16];
      3'd3: TXdata = txq_deq_bits[31:24];
      3'd4: TXdata = txq_deq_bits[39:32];
      3'd5: TXdata = txq_deq_bits[47:40];
      3'd6: TXdata = txq_deq_bits[55:48];
      3'd7: TXdata = txq_deq_bits[63:56];
      endcase
    end
    else
    begin
      next_tx_state = 1'b0;
      next_tx_cnt = '0;
    end
  end

  assign txq_deq_rdy = (reg_tx_cnt[2:0] == txq_deq_aux_bits[2:0]);

  // Details

  //------------------------------------------------------------------------
  // GMII Transmitter Logic : Drive TX signals through IOBs onto GMII
  // interface
  //------------------------------------------------------------------------
  // Infer IOB Output flip-flops.

  always @(posedge ethTXclock, posedge reset_eth)
  begin
    if (reset_eth)
    begin
      GMII_TX_EN <= 1'b0;
      GMII_TX_ER <= 1'b0;
      GMII_TXD   <= 8'h00;
    end
    else
    begin
      GMII_TX_EN <= TX_EN_FROM_MAC;
      GMII_TX_ER <= TX_ER_FROM_MAC;
      GMII_TXD   <= TXD_FROM_MAC;
    end
  end        

  assign GMII_RESET_B = ~reset_eth;

  // ODDR for Phy Clock
  ODDR GMIIoddr
  (
    .Q(GMII_TX_CLK),
    .C(ethTXclock),
    .CE(1'b1),
    .D1(1'b0),
    .D2(1'b1),
    .R(reset_eth),
    .S(1'b0)
  );

  // IDELAYs and BUFG for the Receive data and clock

  // based on the following synopsys document
  // https://solvnet.synopsys.com/retrieve/033856.html?newArticles=channelPersonal
  IDELAYCTRL delaycontrol
  (
    .REFCLK(clk_200),
    .RST(reset_200),
    .RDY()
  );

  IDELAY
  #(
    .IOBDELAY_TYPE("FIXED"), // "DEFAULT", "FIXED" or "VARIABLE"
    .IOBDELAY_VALUE(0) // Any value from 0 to 63
  )
  RXclockBlock
  (
    .I(GMII_RX_CLK),
    .O(RXclockDelay),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .RST(1'b0)
  );

  BUFG bufgClientRx (.I(RXclockDelay), .O(ethRXclock));
  
  IDELAY
  #(
    .IOBDELAY_TYPE("FIXED"), // "DEFAULT", "FIXED" or "VARIABLE"
    .IOBDELAY_VALUE(20) // Any value from 0 to 63
  )
  RXdvBlock
  (
    .I(GMII_RX_DV),
    .O(RXdvDelay),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .RST(1'b0)
  );

  IDELAY
  #(
    .IOBDELAY_TYPE("FIXED"), // "DEFAULT", "FIXED" or "VARIABLE"
    .IOBDELAY_VALUE(20) // Any value from 0 to 63
  )
  RXerBlock
  (
    .I(GMII_RX_ER),
    .O(RXerDelay),
    .C(1'b0),
    .CE(1'b0),
    .INC(1'b0),
    .RST(1'b0)
  );
        
  genvar idly;

  generate
    for (idly = 0; idly < 8; idly = idly + 1)
    begin: dlyBlock
      IDELAY
      #(
        .IOBDELAY_TYPE("FIXED"), // "DEFAULT", "FIXED" or "VARIABLE"
        .IOBDELAY_VALUE(20) // Any value from 0 to 63
      )
      RXdataBlock
      (
        .I(GMII_RXD[idly]),
        .O(RXdataDelay[idly]),
        .C(1'b0),
        .CE(1'b0),
        .INC(1'b0),
        .RST(1'b0)
      );
    end
  endgenerate
  
  always @(posedge ethRXclock)
  begin  //register the delayed RXdata.
    RXdataDelayReg <= RXdataDelay;
    RXdvDelayReg <= RXdvDelay;
    RXerDelayReg <= RXerDelay;
  end
    
  //--------------------------------------------------------------------------
  // Instantiate the Virtex-5 Embedded Ethernet EMAC
  //--------------------------------------------------------------------------

  assign RXdata = RXmacData[7:0];  //TEMAC has a 16-bit interface

  TEMAC_SINGLE v6_emac
  (
    .RESET                          (reset_eth),

    // EMAC
    .EMACCLIENTRXCLIENTCLKOUT      (),
    .CLIENTEMACRXCLIENTCLKIN       (ethRXclock),
    .EMACCLIENTRXD                 (RXmacData),
    .EMACCLIENTRXDVLD              (RXdataValid),
    .EMACCLIENTRXDVLDMSW           (),
    .EMACCLIENTRXGOODFRAME         (RXgoodFrame),
    .EMACCLIENTRXBADFRAME          (RXbadFrame),
    .EMACCLIENTRXFRAMEDROP         (),
    .EMACCLIENTRXSTATS             (),
    .EMACCLIENTRXSTATSVLD          (),
    .EMACCLIENTRXSTATSBYTEVLD      (),

    .EMACCLIENTTXCLIENTCLKOUT      (),
    .CLIENTEMACTXCLIENTCLKIN       (ethTXclock),
    .CLIENTEMACTXD                 ({8'h0,TXdata}),
    .CLIENTEMACTXDVLD              (TXdataValid),
    .CLIENTEMACTXDVLDMSW           (1'b0),
    .EMACCLIENTTXACK               (TXack),
    .CLIENTEMACTXFIRSTBYTE         (1'b0),
    .CLIENTEMACTXUNDERRUN          (1'b0),
    .EMACCLIENTTXCOLLISION         (),
    .EMACCLIENTTXRETRANSMIT        (),
    .CLIENTEMACTXIFGDELAY          (),
    .EMACCLIENTTXSTATS             (),
    .EMACCLIENTTXSTATSVLD          (),
    .EMACCLIENTTXSTATSBYTEVLD      (),

    .CLIENTEMACPAUSEREQ            (1'b0),                 //no flow control now
    .CLIENTEMACPAUSEVAL            (16'b0),

    .PHYEMACGTXCLK                 (1'b0),
    .EMACPHYTXGMIIMIICLKOUT        (),
    .PHYEMACTXGMIIMIICLKIN         (ethTXclock),

    .PHYEMACRXCLK                  (ethRXclock),
    .PHYEMACRXD                    (RXdataDelayReg),
    .PHYEMACRXDV                   (RXdvDelayReg),
    .PHYEMACRXER                   (RXerDelayReg),
    .EMACPHYTXCLK                  (),
    .EMACPHYTXD                    (TXD_FROM_MAC),
    .EMACPHYTXEN                   (TX_EN_FROM_MAC),
    .EMACPHYTXER                   (TX_ER_FROM_MAC),
    .PHYEMACMIITXCLK               (1'b0),
    .PHYEMACCOL                    (1'b0),
    .PHYEMACCRS                    (1'b0),

    .CLIENTEMACDCMLOCKED           (~reset_eth),
    .EMACCLIENTANINTERRUPT         (),
    .PHYEMACSIGNALDET              (1'b0),
    .PHYEMACPHYAD                  (5'b00000),
    .EMACPHYENCOMMAALIGN           (),
    .EMACPHYLOOPBACKMSB            (),
    .EMACPHYMGTRXRESET             (),
    .EMACPHYMGTTXRESET             (),
    .EMACPHYPOWERDOWN              (),
    .EMACPHYSYNCACQSTATUS          (),
    .PHYEMACRXCLKCORCNT            (3'b000),
    .PHYEMACRXBUFSTATUS            (2'b00),
    //.PHYEMACRXBUFERR               (1'b0),
    .PHYEMACRXCHARISCOMMA          (1'b0),
    .PHYEMACRXCHARISK              (1'b0),
    //.PHYEMACRXCHECKINGCRC          (1'b0),
    //.PHYEMACRXCOMMADET             (1'b0),
    .PHYEMACRXDISPERR              (1'b0),
    //.PHYEMACRXLOSSOFSYNC           (2'b00),
    .PHYEMACRXNOTINTABLE           (1'b0),
    .PHYEMACRXRUNDISP              (1'b0),
    .PHYEMACTXBUFERR               (1'b0),
    .EMACPHYTXCHARDISPMODE         (),
    .EMACPHYTXCHARDISPVAL          (),
    .EMACPHYTXCHARISK              (),

    .EMACPHYMCLKOUT                (),
    .PHYEMACMCLKIN                 (1'b0),
    .PHYEMACMDIN                   (1'b1),
    .EMACPHYMDOUT                  (),
    .EMACPHYMDTRI                  (),
    .EMACSPEEDIS10100              (),

    // Host Interface 
    .HOSTCLK                        (1'b0),
    .HOSTOPCODE                     (2'b00),
    .HOSTREQ                        (1'b0),
    .HOSTMIIMSEL                    (1'b0),
    .HOSTADDR                       (10'b0000000000),
    .HOSTWRDATA                     (32'h00000000),
    .HOSTMIIMRDY                    (),
    .HOSTRDDATA                     (),
    //.HOSTEMAC1SEL                   (1'b0),

    // DCR Interface
    .DCREMACCLK                     (1'b0),
    .DCREMACABUS                    (10'h000),
    .DCREMACREAD                    (1'b0),
    .DCREMACWRITE                   (1'b0),
    .DCREMACDBUS                    (32'h00000000),
    .EMACDCRACK                     (),
    .EMACDCRDBUS                    (),
    .DCREMACENABLE                  (1'b0),
    .DCRHOSTDONEIR                  ()
  );

  defparam v6_emac.EMAC_PHYINITAUTONEG_ENABLE = "FALSE";
  defparam v6_emac.EMAC_PHYISOLATE = "FALSE";
  defparam v6_emac.EMAC_PHYLOOPBACKMSB = "FALSE";
  defparam v6_emac.EMAC_PHYPOWERDOWN = "FALSE";
  defparam v6_emac.EMAC_PHYRESET = "TRUE";
  //defparam v6_emac.EMAC_CONFIGVEC_79 = "FALSE";
  defparam v6_emac.EMAC_GTLOOPBACK = "FALSE";
  defparam v6_emac.EMAC_UNIDIRECTION_ENABLE = "FALSE";
  defparam v6_emac.EMAC_LINKTIMERVAL = 9'h000;
  defparam v6_emac.EMAC_MDIO_ENABLE = "FALSE";  
  defparam v6_emac.EMAC_SPEED_LSB = "FALSE";
  defparam v6_emac.EMAC_SPEED_MSB = "TRUE"; 
  defparam v6_emac.EMAC_USECLKEN = "FALSE";
  defparam v6_emac.EMAC_BYTEPHY = "FALSE";
  defparam v6_emac.EMAC_RGMII_ENABLE = "FALSE";
  defparam v6_emac.EMAC_SGMII_ENABLE = "FALSE";
  defparam v6_emac.EMAC_1000BASEX_ENABLE = "FALSE";
  defparam v6_emac.EMAC_HOST_ENABLE = "FALSE";  
  defparam v6_emac.EMAC_TX16BITCLIENT_ENABLE = "FALSE";
  defparam v6_emac.EMAC_RX16BITCLIENT_ENABLE = "FALSE";    
  defparam v6_emac.EMAC_ADDRFILTER_ENABLE = "FALSE";  
  defparam v6_emac.EMAC_LTCHECK_DISABLE = "FALSE";  
  defparam v6_emac.EMAC_RXFLOWCTRL_ENABLE = "FALSE";  
  defparam v6_emac.EMAC_TXFLOWCTRL_ENABLE = "FALSE";  
  defparam v6_emac.EMAC_TXRESET = "FALSE";  
  defparam v6_emac.EMAC_TXJUMBOFRAME_ENABLE = "TRUE";            //support jumbo frame
  defparam v6_emac.EMAC_TXINBANDFCS_ENABLE = "FALSE";  
  defparam v6_emac.EMAC_TX_ENABLE = "TRUE";  
  defparam v6_emac.EMAC_TXVLAN_ENABLE = "FALSE";  
  defparam v6_emac.EMAC_TXHALFDUPLEX = "FALSE";  
  defparam v6_emac.EMAC_TXIFGADJUST_ENABLE = "FALSE";  
  defparam v6_emac.EMAC_RXRESET = "FALSE";  
  defparam v6_emac.EMAC_RXJUMBOFRAME_ENABLE = "TRUE";           //support jumbo frame
  defparam v6_emac.EMAC_RXINBANDFCS_ENABLE = "FALSE";  
  defparam v6_emac.EMAC_RX_ENABLE = "TRUE";  
  defparam v6_emac.EMAC_RXVLAN_ENABLE = "FALSE";  
  defparam v6_emac.EMAC_RXHALFDUPLEX = "FALSE";  
  defparam v6_emac.EMAC_PAUSEADDR = 48'hFFEEDDCCBBAA;
  defparam v6_emac.EMAC_UNICASTADDR = 48'h000000000000;
  defparam v6_emac.EMAC_DCRBASEADDR = 8'h00;

endmodule
