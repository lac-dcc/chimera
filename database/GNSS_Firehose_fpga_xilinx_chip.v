// Chip-level module with technology-specific clock, tristate, DDR handling
//
// GNSS Firehose
// Copyright (c) 2012 Peter Monta <pmonta@gmail.com>

module chip(
  input clk_adc_p, clk_adc_n,
  input clk_3888,

// RF channel 1

  inout ch1_sda, ch1_scl,
  output ch1_gc1,
  output ch1_cs, ch1_sclk,
  inout ch1_sdin,
  input ch1_clk,
  input [7:0] ch1_d,

// RF channel 2

  inout ch2_sda, ch2_scl,
  output ch2_gc1,
  output ch2_cs, ch2_sclk,
  inout ch2_sdin,
  input ch2_clk,
  input [7:0] ch2_d,

// RF channel 3

  inout ch3_sda, ch3_scl,
  output ch3_gc1,
  output ch3_cs, ch3_sclk,
  inout ch3_sdin,
  input ch3_clk,
  input [7:0] ch3_d,

// baseband channel 4

  output ch4_cs, ch4_sclk,
  inout ch4_sdin,
  input ch4_clk,
  input [7:0] ch4_d,

// Ethernet PHY (RGMII)

  output phy_tx_clk,
  output [3:0] phy_tx_data,
  output phy_tx_ctl,

  input phy_rx_clk,
  input [3:0] phy_rx_data,
  input phy_rx_ctl,

  output phy_mdc,
  inout phy_mdio,
  input phy_mdint,
  output phy_nreset,

// clock chip (LMK03806) control and status

  output clock_clk,
  output clock_data,
  output clock_le,
  input clock_readback,
  input clock_ftest_ld,

// debugging UART

  input uart_rx,
  output uart_tx,

// LEDs

  output led0,
  output led1,
	    
// flash chip

  output spi_cclk,
  input spi_din,
  output spi_mosi,
  output spi_cso_b
);
  
// clocks

  wire clk_adc;
  wire clk_adc_i;
  IBUFDS _ibuf_clk_adc(.I(clk_adc_p), .IB(clk_adc_n), .O(clk_adc_i));
  BUFG _bufg_clk_adc(.I(clk_adc_i), .O(clk_adc));

  wire clk_tcxo;
  wire clk_tcxo_i;
  IBUFG _ibuf_clk_3888(.I(clk_3888), .O(clk_tcxo_i));
  BUFG _bufg_clk_tcxo(.I(clk_tcxo_i), .O(clk_tcxo));

// synthesize Ethernet PHY transmit clock (125 MHz) from clk_tcxo
//   125 MHz ~= 38.88 MHz * (254/79)   (53 ppm error)

  wire clk125;
  wire clk125_dcm;
  wire dcm_rst, dcm_locked;

  DCM_CLKGEN #(.CLKFX_MULTIPLY(254),.CLKFX_DIVIDE(79)) _dcm_clk125(
    .CLKIN(clk_tcxo),
    .CLKFX(clk125_dcm),
    .RST(dcm_rst),
    .LOCKED(dcm_locked)
  );

  BUFG _bufg_clk125(.I(clk125_dcm), .O(clk125));

// I2C pins (open-drain)

  wire ch1_sda_t, ch1_sda_i;
  assign ch1_sda = !ch1_sda_t ? 1'b0 : 1'bz;
  assign ch1_sda_i = ch1_sda;

  wire ch1_scl_t, ch1_scl_i;
  assign ch1_scl = !ch1_scl_t ? 1'b0 : 1'bz;
  assign ch1_scl_i = ch1_scl;

  wire ch2_sda_t, ch2_sda_i;
  assign ch2_sda = !ch2_sda_t ? 1'b0 : 1'bz;
  assign ch2_sda_i = ch2_sda;

  wire ch2_scl_t, ch2_scl_i;
  assign ch2_scl = !ch2_scl_t ? 1'b0 : 1'bz;
  assign ch2_scl_i = ch2_scl;

  wire ch3_sda_t, ch3_sda_i;
  assign ch3_sda = !ch3_sda_t ? 1'b0 : 1'bz;
  assign ch3_sda_i = ch3_sda;

  wire ch3_scl_t, ch3_scl_i;
  assign ch3_scl = !ch3_scl_t ? 1'b0 : 1'bz;
  assign ch3_scl_i = ch3_scl;

// MDIO/SMI pins

  wire phy_mdio_i, phy_mdio_o, phy_mdio_t;

  assign phy_mdio = phy_mdio_t ? phy_mdio_o : 1'bz;
  assign phy_mdio_i = phy_mdio;

// SPI pins

  wire ch1_sdin_i, ch1_sdin_o, ch1_sdin_t;

  assign ch1_sdin = ch1_sdin_t ? ch1_sdin_o : 1'bz;
  assign ch1_sdin_i = ch1_sdin;

  wire ch2_sdin_i, ch2_sdin_o, ch2_sdin_t;

  assign ch2_sdin = ch2_sdin_t ? ch2_sdin_o : 1'bz;
  assign ch2_sdin_i = ch2_sdin;

  wire ch3_sdin_i, ch3_sdin_o, ch3_sdin_t;

  assign ch3_sdin = ch3_sdin_t ? ch3_sdin_o : 1'bz;
  assign ch3_sdin_i = ch3_sdin;

  wire ch4_sdin_i, ch4_sdin_o, ch4_sdin_t;

  assign ch4_sdin = ch4_sdin_t ? ch4_sdin_o : 1'bz;
  assign ch4_sdin_i = ch4_sdin;

// demultiplex PHY RX signals

  wire phy_rx_demux_clk;
  wire [7:0] phy_rx_demux_data;
  wire [1:0] phy_rx_demux_ctl;

  BUFG _phy_rx_bufg(      // fixme: should be using local clock resources and/or DCM for proper timing
    .I(~phy_rx_clk),
    .O(phy_rx_demux_clk)
  );

  demux_rx _demux_rx(phy_rx_demux_clk, phy_rx_data, phy_rx_demux_data, phy_rx_ctl, phy_rx_demux_ctl);

// multiplex PHY TX signals

  wire phy_tx_mux_clk = clk125;
  wire [7:0] phy_tx_mux_data;
  wire [1:0] phy_tx_mux_ctl;

  mux_tx _mux_tx(phy_tx_mux_clk, phy_tx_data, phy_tx_mux_data, phy_tx_ctl, phy_tx_mux_ctl);
  mux_tx_clk _mux_tx_clk(phy_tx_mux_clk, phy_tx_clk);
   
// DDR receivers for ADC data pins

  wire [15:0] ch1_data, ch2_data, ch3_data, ch4_data;

  demux_adc _demux_adc_ch1(clk_adc, ch1_d, ch1_data);
  demux_adc _demux_adc_ch2(clk_adc, ch2_d, ch2_data);
  demux_adc _demux_adc_ch3(clk_adc, ch3_d, ch3_data);
  demux_adc _demux_adc_ch4(clk_adc, ch4_d, ch4_data);

// generate reset signals

  wire clk_tcxo_reset;
  reset_gen _reset_gen_clk_tcxo(clk_tcxo, clk_tcxo_reset);

  wire phy_reset;
  wire phy_reset_auto;
  phy_reset_auto _phy_reset_auto(clk_tcxo, clk_tcxo_reset, phy_reset_auto);
  assign phy_nreset = (phy_reset|phy_reset_auto) ? 0 : 1'bz;

// top-level module

  top _top(
    clk_tcxo, clk_tcxo_reset,
    clk_adc,
    ch1_sda_t, ch1_scl_t, ch1_gc1,
    ch1_sda_i, ch1_scl_i,
    ch1_cs, ch1_sclk,
    ch1_sdin_i, ch1_sdin_o, ch1_sdin_t,
    ch1_clk,
    ch1_data,
    ch2_sda_t, ch2_scl_t, ch2_gc1,
    ch2_sda_i, ch2_scl_i,
    ch2_cs, ch2_sclk,
    ch2_sdin_i, ch2_sdin_o, ch2_sdin_t, 
    ch2_clk,
    ch2_data,
    ch3_sda_t, ch3_scl_t, ch3_gc1,
    ch3_sda_i, ch3_scl_i,
    ch3_cs, ch3_sclk,
    ch3_sdin_i, ch3_sdin_o, ch3_sdin_t,
    ch3_clk,
    ch3_data,
    ch4_cs, ch4_sclk,
    ch4_sdin_i, ch4_sdin_o, ch4_sdin_t, 
    ch4_clk,
    ch4_data,
    phy_tx_mux_clk,
    phy_tx_mux_data,
    phy_tx_mux_ctl,
    phy_rx_demux_clk,
    phy_rx_demux_data,
    phy_rx_demux_ctl,
    phy_mdc,
    phy_mdio_i, phy_mdio_o, phy_mdio_t,
    phy_mdint,
    phy_reset,
    clock_clk,
    clock_data,
    clock_le,
    clock_readback,
    clock_ftest_ld,
    uart_rx,
    uart_tx,
    led0,
    led1,
    spi_cclk,
    spi_din,
    spi_mosi,
    spi_cso_b,
    dcm_rst,
    dcm_locked
  );

endmodule

module demux_rx(
  input phy_rx_clk,
  input [3:0] phy_rx_data,
  output [7:0] phy_rx_demux_data,
  input phy_rx_ctl,
  output [1:0] phy_rx_demux_ctl
);

  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_0(.Q0(phy_rx_demux_data[4]), .Q1(phy_rx_demux_data[0]), .C0(phy_rx_clk), .C1(!phy_rx_clk), .CE(1'b1), .D(phy_rx_data[0]), .R(1'b0), .S(1'b0));
  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_1(.Q0(phy_rx_demux_data[5]), .Q1(phy_rx_demux_data[1]), .C0(phy_rx_clk), .C1(!phy_rx_clk), .CE(1'b1), .D(phy_rx_data[1]), .R(1'b0), .S(1'b0));
  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_2(.Q0(phy_rx_demux_data[6]), .Q1(phy_rx_demux_data[2]), .C0(phy_rx_clk), .C1(!phy_rx_clk), .CE(1'b1), .D(phy_rx_data[2]), .R(1'b0), .S(1'b0));
  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_3(.Q0(phy_rx_demux_data[7]), .Q1(phy_rx_demux_data[3]), .C0(phy_rx_clk), .C1(!phy_rx_clk), .CE(1'b1), .D(phy_rx_data[3]), .R(1'b0), .S(1'b0));
  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_4(.Q0(phy_rx_demux_ctl[1]), .Q1(phy_rx_demux_ctl[0]), .C0(phy_rx_clk), .C1(!phy_rx_clk), .CE(1'b1), .D(phy_rx_ctl), .R(1'b0), .S(1'b0));

endmodule

module mux_tx(
  input clk,
  output [3:0] tx_data,
  input [7:0] tx_data_mux,
  output tx_ctl,
  input [1:0] tx_ctl_mux
);

  ODDR2 #(.DDR_ALIGNMENT("C0"),.SRTYPE("ASYNC")) _oddr2_0(.D0(tx_data_mux[0]), .D1(tx_data_mux[4]), .C0(clk), .C1(!clk), .CE(1'b1), .Q(tx_data[0]), .R(1'b0), .S(1'b0));
  ODDR2 #(.DDR_ALIGNMENT("C0"),.SRTYPE("ASYNC")) _oddr2_1(.D0(tx_data_mux[1]), .D1(tx_data_mux[5]), .C0(clk), .C1(!clk), .CE(1'b1), .Q(tx_data[1]), .R(1'b0), .S(1'b0));
  ODDR2 #(.DDR_ALIGNMENT("C0"),.SRTYPE("ASYNC")) _oddr2_2(.D0(tx_data_mux[2]), .D1(tx_data_mux[6]), .C0(clk), .C1(!clk), .CE(1'b1), .Q(tx_data[2]), .R(1'b0), .S(1'b0));
  ODDR2 #(.DDR_ALIGNMENT("C0"),.SRTYPE("ASYNC")) _oddr2_3(.D0(tx_data_mux[3]), .D1(tx_data_mux[7]), .C0(clk), .C1(!clk), .CE(1'b1), .Q(tx_data[3]), .R(1'b0), .S(1'b0));
  ODDR2 #(.DDR_ALIGNMENT("C0"),.SRTYPE("ASYNC")) _oddr2_4(.D0(tx_ctl_mux[0]), .D1(tx_ctl_mux[1]), .C0(clk), .C1(!clk), .CE(1'b1), .Q(tx_ctl), .R(1'b0), .S(1'b0));

endmodule

module demux_adc(
  input clk,
  input [7:0] x,
  output [15:0] y
);

  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_0(.Q0(y[0]), .Q1(y[8]), .C0(clk), .C1(!clk), .CE(1'b1), .D(x[0]), .R(1'b0), .S(1'b0));
  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_1(.Q0(y[1]), .Q1(y[9]), .C0(clk), .C1(!clk), .CE(1'b1), .D(x[1]), .R(1'b0), .S(1'b0));
  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_2(.Q0(y[2]), .Q1(y[10]), .C0(clk), .C1(!clk), .CE(1'b1), .D(x[2]), .R(1'b0), .S(1'b0));
  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_3(.Q0(y[3]), .Q1(y[11]), .C0(clk), .C1(!clk), .CE(1'b1), .D(x[3]), .R(1'b0), .S(1'b0));
  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_4(.Q0(y[4]), .Q1(y[12]), .C0(clk), .C1(!clk), .CE(1'b1), .D(x[4]), .R(1'b0), .S(1'b0));
  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_5(.Q0(y[5]), .Q1(y[13]), .C0(clk), .C1(!clk), .CE(1'b1), .D(x[5]), .R(1'b0), .S(1'b0));
  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_6(.Q0(y[6]), .Q1(y[14]), .C0(clk), .C1(!clk), .CE(1'b1), .D(x[6]), .R(1'b0), .S(1'b0));
  IDDR2 #(.DDR_ALIGNMENT("C0")) _iddr2_7(.Q0(y[7]), .Q1(y[15]), .C0(clk), .C1(!clk), .CE(1'b1), .D(x[7]), .R(1'b0), .S(1'b0));

endmodule

module mux_tx_clk(
  input clk,
  output clk_forward
);

  ODDR2 #(.DDR_ALIGNMENT("C0"),.SRTYPE("ASYNC")) _oddr2_clk(.D0(1'b1), .D1(1'b0), .C0(clk), .C1(!clk), .CE(1'b1), .Q(clk_forward), .R(1'b0), .S(1'b0));

endmodule

module phy_reset_auto(
  input clk,
  input reset,
  output reg phy_reset_auto
);

  reg [23:0] c;

  always @(posedge clk)
    if (reset) begin
      c <= 0;
      phy_reset_auto <= 1;
    end else begin
      c <= (c==24'd16777215) ? c : c+1;
      phy_reset_auto <= (c<24'd16000000);
    end

endmodule

`include "../hdl/top.v"
