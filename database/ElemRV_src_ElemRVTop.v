// This program was cloned from: https://github.com/SteffenReith/ElemRV
// License: Apache License 2.0

// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : ElemRVTop
// Git hash  : 74394a9c61c1d98858f6b5efa570f8a3b331d4d9

`timescale 1ns/1ps

module ElemRVTop (
  inout  wire          io_clock_PAD,
  inout  wire          io_reset_PAD,
  inout  wire          io_uartStd_txd_PAD,
  inout  wire          io_uartStd_rxd_PAD,
  inout  wire          io_uartStd_cts_PAD,
  inout  wire          io_uartStd_rts_PAD,
  inout  wire          io_jtag_tms_PAD,
  inout  wire          io_jtag_tdi_PAD,
  inout  wire          io_jtag_tdo_PAD,
  inout  wire          io_jtag_tck_PAD,
  inout  wire          io_gpioStatus_0_PAD,
  inout  wire          io_gpioStatus_1_PAD,
  inout  wire          io_gpioStatus_2_PAD,
  inout  wire          io_gpioStatus_3_PAD,
  inout  wire          io_hyperbus_cs_0_PAD,
  inout  wire          io_hyperbus_ck_PAD,
  inout  wire          io_hyperbus_reset_PAD,
  inout  wire          io_hyperbus_dq_0_PAD,
  inout  wire          io_hyperbus_dq_1_PAD,
  inout  wire          io_hyperbus_dq_2_PAD,
  inout  wire          io_hyperbus_dq_3_PAD,
  inout  wire          io_hyperbus_dq_4_PAD,
  inout  wire          io_hyperbus_dq_5_PAD,
  inout  wire          io_hyperbus_dq_6_PAD,
  inout  wire          io_hyperbus_dq_7_PAD,
  inout  wire          io_hyperbus_rwds_PAD,
  inout  wire          io_spi_cs_0_PAD,
  inout  wire          io_spi_dq_0_PAD,
  inout  wire          io_spi_dq_1_PAD,
  inout  wire          io_spi_sck_PAD
);

  reg        [7:0]    soc_io_plat_hyperbus_dq_read;
  reg        [1:0]    soc_io_plat_spi_dq_read;
  reg        [3:0]    soc_io_per_gpioStatus_pins_read;
  wire                sg13g2_IOPadInOut4mA_1_c2p;
  wire                sg13g2_IOPadInOut4mA_1_c2p_en;
  wire                sg13g2_IOPadInOut4mA_2_c2p;
  wire                sg13g2_IOPadInOut4mA_2_c2p_en;
  wire                sg13g2_IOPadInOut4mA_3_c2p;
  wire                sg13g2_IOPadInOut4mA_3_c2p_en;
  wire                sg13g2_IOPadInOut4mA_4_c2p;
  wire                sg13g2_IOPadInOut4mA_4_c2p_en;
  wire                sg13g2_IOPadOut4mA_4_c2p;
  wire                sg13g2_IOPadInOut30mA_1_c2p;
  wire                sg13g2_IOPadInOut30mA_1_c2p_en;
  wire                sg13g2_IOPadInOut30mA_2_c2p;
  wire                sg13g2_IOPadInOut30mA_2_c2p_en;
  wire                sg13g2_IOPadInOut30mA_3_c2p;
  wire                sg13g2_IOPadInOut30mA_3_c2p_en;
  wire                sg13g2_IOPadInOut30mA_4_c2p;
  wire                sg13g2_IOPadInOut30mA_4_c2p_en;
  wire                sg13g2_IOPadInOut30mA_5_c2p;
  wire                sg13g2_IOPadInOut30mA_5_c2p_en;
  wire                sg13g2_IOPadInOut30mA_6_c2p;
  wire                sg13g2_IOPadInOut30mA_6_c2p_en;
  wire                sg13g2_IOPadInOut30mA_7_c2p;
  wire                sg13g2_IOPadInOut30mA_7_c2p_en;
  wire                sg13g2_IOPadInOut30mA_8_c2p;
  wire                sg13g2_IOPadInOut30mA_8_c2p_en;
  wire                sg13g2_IOPadOut4mA_6_c2p;
  wire                sg13g2_IOPadInOut4mA_5_c2p;
  wire                sg13g2_IOPadInOut4mA_5_c2p_en;
  wire                sg13g2_IOPadInOut4mA_6_c2p;
  wire                sg13g2_IOPadInOut4mA_6_c2p_en;
  wire                soc_io_plat_jtag_tdo;
  wire       [0:0]    soc_io_plat_hyperbus_cs;
  wire                soc_io_plat_hyperbus_ck;
  wire                soc_io_plat_hyperbus_reset;
  wire       [7:0]    soc_io_plat_hyperbus_dq_write;
  wire       [7:0]    soc_io_plat_hyperbus_dq_writeEnable;
  wire                soc_io_plat_hyperbus_rwds_write;
  wire                soc_io_plat_hyperbus_rwds_writeEnable;
  wire       [0:0]    soc_io_plat_spi_cs;
  wire                soc_io_plat_spi_sclk;
  wire       [1:0]    soc_io_plat_spi_dq_write;
  wire       [1:0]    soc_io_plat_spi_dq_writeEnable;
  wire                soc_io_per_uartStd_txd;
  wire                soc_io_per_uartStd_rts;
  wire       [3:0]    soc_io_per_gpioStatus_pins_write;
  wire       [3:0]    soc_io_per_gpioStatus_pins_writeEnable;
  wire                sg13g2_IOPadIn_1_p2c;
  wire                sg13g2_IOPadIn_2_p2c;
  wire                sg13g2_IOPadIn_3_p2c;
  wire                sg13g2_IOPadIn_4_p2c;
  wire                sg13g2_IOPadIn_5_p2c;
  wire                sg13g2_IOPadIn_6_p2c;
  wire                sg13g2_IOPadIn_7_p2c;
  wire                sg13g2_IOPadInOut4mA_1_p2c;
  wire                sg13g2_IOPadInOut4mA_2_p2c;
  wire                sg13g2_IOPadInOut4mA_3_p2c;
  wire                sg13g2_IOPadInOut4mA_4_p2c;
  wire                sg13g2_IOPadInOut30mA_1_p2c;
  wire                sg13g2_IOPadInOut30mA_2_p2c;
  wire                sg13g2_IOPadInOut30mA_3_p2c;
  wire                sg13g2_IOPadInOut30mA_4_p2c;
  wire                sg13g2_IOPadInOut30mA_5_p2c;
  wire                sg13g2_IOPadInOut30mA_6_p2c;
  wire                sg13g2_IOPadInOut30mA_7_p2c;
  wire                sg13g2_IOPadInOut30mA_8_p2c;
  wire                sg13g2_IOPadInOut30mA_9_p2c;
  wire                sg13g2_IOPadInOut4mA_5_p2c;
  wire                sg13g2_IOPadInOut4mA_6_p2c;

  ElemRV soc (
    .io_plat_reset                      (sg13g2_IOPadIn_2_p2c                       ), //i
    .io_plat_clock                      (sg13g2_IOPadIn_1_p2c                       ), //i
    .io_plat_jtag_tms                   (sg13g2_IOPadIn_3_p2c                       ), //i
    .io_plat_jtag_tdi                   (sg13g2_IOPadIn_4_p2c                       ), //i
    .io_plat_jtag_tdo                   (soc_io_plat_jtag_tdo                       ), //o
    .io_plat_jtag_tck                   (sg13g2_IOPadIn_5_p2c                       ), //i
    .io_plat_hyperbus_cs                (soc_io_plat_hyperbus_cs                    ), //o
    .io_plat_hyperbus_ck                (soc_io_plat_hyperbus_ck                    ), //o
    .io_plat_hyperbus_reset             (soc_io_plat_hyperbus_reset                 ), //o
    .io_plat_hyperbus_dq_read           (soc_io_plat_hyperbus_dq_read[7:0]          ), //i
    .io_plat_hyperbus_dq_write          (soc_io_plat_hyperbus_dq_write[7:0]         ), //o
    .io_plat_hyperbus_dq_writeEnable    (soc_io_plat_hyperbus_dq_writeEnable[7:0]   ), //o
    .io_plat_hyperbus_rwds_read         (sg13g2_IOPadInOut30mA_9_p2c                ), //i
    .io_plat_hyperbus_rwds_write        (soc_io_plat_hyperbus_rwds_write            ), //o
    .io_plat_hyperbus_rwds_writeEnable  (soc_io_plat_hyperbus_rwds_writeEnable      ), //o
    .io_plat_spi_cs                     (soc_io_plat_spi_cs                         ), //o
    .io_plat_spi_sclk                   (soc_io_plat_spi_sclk                       ), //o
    .io_plat_spi_dq_read                (soc_io_plat_spi_dq_read[1:0]               ), //i
    .io_plat_spi_dq_write               (soc_io_plat_spi_dq_write[1:0]              ), //o
    .io_plat_spi_dq_writeEnable         (soc_io_plat_spi_dq_writeEnable[1:0]        ), //o
    .io_per_uartStd_txd                 (soc_io_per_uartStd_txd                     ), //o
    .io_per_uartStd_rxd                 (sg13g2_IOPadIn_6_p2c                       ), //i
    .io_per_uartStd_cts                 (sg13g2_IOPadIn_7_p2c                       ), //i
    .io_per_uartStd_rts                 (soc_io_per_uartStd_rts                     ), //o
    .io_per_gpioStatus_pins_read        (soc_io_per_gpioStatus_pins_read[3:0]       ), //i
    .io_per_gpioStatus_pins_write       (soc_io_per_gpioStatus_pins_write[3:0]      ), //o
    .io_per_gpioStatus_pins_writeEnable (soc_io_per_gpioStatus_pins_writeEnable[3:0])  //o
  );
  sg13g2_IOPadIn sg13g2_IOPadIn_1 (
    .p2c (sg13g2_IOPadIn_1_p2c), //o
    .pad ({io_clock_PAD}) 
  );
  sg13g2_IOPadIn sg13g2_IOPadIn_2 (
    .p2c (sg13g2_IOPadIn_2_p2c), //o
    .pad ({io_reset_PAD}) 
  );
  sg13g2_IOPadIn sg13g2_IOPadIn_3 (
    .p2c (sg13g2_IOPadIn_3_p2c), //o
    .pad ({io_jtag_tms_PAD}) 
  );
  sg13g2_IOPadIn sg13g2_IOPadIn_4 (
    .p2c (sg13g2_IOPadIn_4_p2c), //o
    .pad ({io_jtag_tdi_PAD}) 
  );
  sg13g2_IOPadOut4mA sg13g2_IOPadOut4mA_1 (
    .c2p (soc_io_plat_jtag_tdo), //i
    .pad ({io_jtag_tdo_PAD}) 
  );
  sg13g2_IOPadIn sg13g2_IOPadIn_5 (
    .p2c (sg13g2_IOPadIn_5_p2c), //o
    .pad ({io_jtag_tck_PAD}) 
  );
  sg13g2_IOPadOut4mA sg13g2_IOPadOut4mA_2 (
    .c2p (soc_io_per_uartStd_txd), //i
    .pad ({io_uartStd_txd_PAD}) 
  );
  sg13g2_IOPadIn sg13g2_IOPadIn_6 (
    .p2c (sg13g2_IOPadIn_6_p2c), //o
    .pad ({io_uartStd_rxd_PAD}) 
  );
  sg13g2_IOPadIn sg13g2_IOPadIn_7 (
    .p2c (sg13g2_IOPadIn_7_p2c), //o
    .pad ({io_uartStd_cts_PAD}) 
  );
  sg13g2_IOPadOut4mA sg13g2_IOPadOut4mA_3 (
    .c2p (soc_io_per_uartStd_rts), //i
    .pad ({io_uartStd_rts_PAD}) 
  );
  sg13g2_IOPadInOut4mA sg13g2_IOPadInOut4mA_1 (
    .c2p    (sg13g2_IOPadInOut4mA_1_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut4mA_1_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut4mA_1_p2c   ), //o
    .pad    ({io_gpioStatus_0_PAD}) 
  );
  sg13g2_IOPadInOut4mA sg13g2_IOPadInOut4mA_2 (
    .c2p    (sg13g2_IOPadInOut4mA_2_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut4mA_2_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut4mA_2_p2c   ), //o
    .pad    ({io_gpioStatus_1_PAD}) 
  );
  sg13g2_IOPadInOut4mA sg13g2_IOPadInOut4mA_3 (
    .c2p    (sg13g2_IOPadInOut4mA_3_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut4mA_3_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut4mA_3_p2c   ), //o
    .pad    ({io_gpioStatus_2_PAD}) 
  );
  sg13g2_IOPadInOut4mA sg13g2_IOPadInOut4mA_4 (
    .c2p    (sg13g2_IOPadInOut4mA_4_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut4mA_4_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut4mA_4_p2c   ), //o
    .pad    ({io_gpioStatus_3_PAD}) 
  );
  sg13g2_IOPadOut4mA sg13g2_IOPadOut4mA_4 (
    .c2p (sg13g2_IOPadOut4mA_4_c2p), //i
    .pad ({io_hyperbus_cs_0_PAD}) 
  );
  sg13g2_IOPadOut30mA sg13g2_IOPadOut30mA_1 (
    .c2p (soc_io_plat_hyperbus_ck), //i
    .pad ({io_hyperbus_ck_PAD}) 
  );
  sg13g2_IOPadOut4mA sg13g2_IOPadOut4mA_5 (
    .c2p (soc_io_plat_hyperbus_reset), //i
    .pad ({io_hyperbus_reset_PAD}) 
  );
  sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_1 (
    .c2p    (sg13g2_IOPadInOut30mA_1_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut30mA_1_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut30mA_1_p2c   ), //o
    .pad    ({io_hyperbus_dq_0_PAD}) 
  );
  sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_2 (
    .c2p    (sg13g2_IOPadInOut30mA_2_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut30mA_2_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut30mA_2_p2c   ), //o
    .pad    ({io_hyperbus_dq_1_PAD}) 
  );
  sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_3 (
    .c2p    (sg13g2_IOPadInOut30mA_3_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut30mA_3_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut30mA_3_p2c   ), //o
    .pad    ({io_hyperbus_dq_2_PAD}) 
  );
  sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_4 (
    .c2p    (sg13g2_IOPadInOut30mA_4_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut30mA_4_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut30mA_4_p2c   ), //o
    .pad    ({io_hyperbus_dq_3_PAD}) 
  );
  sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_5 (
    .c2p    (sg13g2_IOPadInOut30mA_5_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut30mA_5_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut30mA_5_p2c   ), //o
    .pad    ({io_hyperbus_dq_4_PAD}) 
  );
  sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_6 (
    .c2p    (sg13g2_IOPadInOut30mA_6_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut30mA_6_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut30mA_6_p2c   ), //o
    .pad    ({io_hyperbus_dq_5_PAD}) 
  );
  sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_7 (
    .c2p    (sg13g2_IOPadInOut30mA_7_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut30mA_7_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut30mA_7_p2c   ), //o
    .pad    ({io_hyperbus_dq_6_PAD}) 
  );
  sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_8 (
    .c2p    (sg13g2_IOPadInOut30mA_8_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut30mA_8_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut30mA_8_p2c   ), //o
    .pad    ({io_hyperbus_dq_7_PAD}) 
  );
  sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_9 (
    .c2p    (soc_io_plat_hyperbus_rwds_write      ), //i
    .c2p_en (soc_io_plat_hyperbus_rwds_writeEnable), //i
    .p2c    (sg13g2_IOPadInOut30mA_9_p2c          ), //o
    .pad    ({io_hyperbus_rwds_PAD}) 
  );
  sg13g2_IOPadOut4mA sg13g2_IOPadOut4mA_6 (
    .c2p (sg13g2_IOPadOut4mA_6_c2p), //i
    .pad ({io_spi_cs_0_PAD}) 
  );
  sg13g2_IOPadOut4mA sg13g2_IOPadOut4mA_7 (
    .c2p (soc_io_plat_spi_sclk), //i
    .pad ({io_spi_sck_PAD}) 
  );
  sg13g2_IOPadInOut4mA sg13g2_IOPadInOut4mA_5 (
    .c2p    (sg13g2_IOPadInOut4mA_5_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut4mA_5_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut4mA_5_p2c   ), //o
    .pad    ({io_spi_dq_0_PAD}) 
  );
  sg13g2_IOPadInOut4mA sg13g2_IOPadInOut4mA_6 (
    .c2p    (sg13g2_IOPadInOut4mA_6_c2p   ), //i
    .c2p_en (sg13g2_IOPadInOut4mA_6_c2p_en), //i
    .p2c    (sg13g2_IOPadInOut4mA_6_p2c   ), //o
    .pad    ({io_spi_dq_1_PAD}) 
  );
  sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_1 (
  );
  sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_2 (
  );
  sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_3 (
  );
  sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_4 (
  );
  sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_5 (
  );
  sg13g2_IOPadIOVss sg13g2_IOPadIOVss_1 (
  );
  sg13g2_IOPadIOVss sg13g2_IOPadIOVss_2 (
  );
  sg13g2_IOPadIOVss sg13g2_IOPadIOVss_3 (
  );
  sg13g2_IOPadIOVss sg13g2_IOPadIOVss_4 (
  );
  sg13g2_IOPadIOVss sg13g2_IOPadIOVss_5 (
  );
  sg13g2_IOPadVdd sg13g2_IOPadVdd_1 (
  );
  sg13g2_IOPadVdd sg13g2_IOPadVdd_2 (
  );
  sg13g2_IOPadVdd sg13g2_IOPadVdd_3 (
  );
  sg13g2_IOPadVss sg13g2_IOPadVss_1 (
  );
  sg13g2_IOPadVss sg13g2_IOPadVss_2 (
  );
  sg13g2_IOPadVss sg13g2_IOPadVss_3 (
  );
  assign sg13g2_IOPadInOut4mA_1_c2p = soc_io_per_gpioStatus_pins_write[0];
  assign sg13g2_IOPadInOut4mA_1_c2p_en = soc_io_per_gpioStatus_pins_writeEnable[0];
  always @(*) begin
    soc_io_per_gpioStatus_pins_read[0] = sg13g2_IOPadInOut4mA_1_p2c;
    soc_io_per_gpioStatus_pins_read[1] = sg13g2_IOPadInOut4mA_2_p2c;
    soc_io_per_gpioStatus_pins_read[2] = sg13g2_IOPadInOut4mA_3_p2c;
    soc_io_per_gpioStatus_pins_read[3] = sg13g2_IOPadInOut4mA_4_p2c;
  end

  assign sg13g2_IOPadInOut4mA_2_c2p = soc_io_per_gpioStatus_pins_write[1];
  assign sg13g2_IOPadInOut4mA_2_c2p_en = soc_io_per_gpioStatus_pins_writeEnable[1];
  assign sg13g2_IOPadInOut4mA_3_c2p = soc_io_per_gpioStatus_pins_write[2];
  assign sg13g2_IOPadInOut4mA_3_c2p_en = soc_io_per_gpioStatus_pins_writeEnable[2];
  assign sg13g2_IOPadInOut4mA_4_c2p = soc_io_per_gpioStatus_pins_write[3];
  assign sg13g2_IOPadInOut4mA_4_c2p_en = soc_io_per_gpioStatus_pins_writeEnable[3];
  assign sg13g2_IOPadOut4mA_4_c2p = soc_io_plat_hyperbus_cs[0];
  assign sg13g2_IOPadInOut30mA_1_c2p = soc_io_plat_hyperbus_dq_write[0];
  assign sg13g2_IOPadInOut30mA_1_c2p_en = soc_io_plat_hyperbus_dq_writeEnable[0];
  always @(*) begin
    soc_io_plat_hyperbus_dq_read[0] = sg13g2_IOPadInOut30mA_1_p2c;
    soc_io_plat_hyperbus_dq_read[1] = sg13g2_IOPadInOut30mA_2_p2c;
    soc_io_plat_hyperbus_dq_read[2] = sg13g2_IOPadInOut30mA_3_p2c;
    soc_io_plat_hyperbus_dq_read[3] = sg13g2_IOPadInOut30mA_4_p2c;
    soc_io_plat_hyperbus_dq_read[4] = sg13g2_IOPadInOut30mA_5_p2c;
    soc_io_plat_hyperbus_dq_read[5] = sg13g2_IOPadInOut30mA_6_p2c;
    soc_io_plat_hyperbus_dq_read[6] = sg13g2_IOPadInOut30mA_7_p2c;
    soc_io_plat_hyperbus_dq_read[7] = sg13g2_IOPadInOut30mA_8_p2c;
  end

  assign sg13g2_IOPadInOut30mA_2_c2p = soc_io_plat_hyperbus_dq_write[1];
  assign sg13g2_IOPadInOut30mA_2_c2p_en = soc_io_plat_hyperbus_dq_writeEnable[1];
  assign sg13g2_IOPadInOut30mA_3_c2p = soc_io_plat_hyperbus_dq_write[2];
  assign sg13g2_IOPadInOut30mA_3_c2p_en = soc_io_plat_hyperbus_dq_writeEnable[2];
  assign sg13g2_IOPadInOut30mA_4_c2p = soc_io_plat_hyperbus_dq_write[3];
  assign sg13g2_IOPadInOut30mA_4_c2p_en = soc_io_plat_hyperbus_dq_writeEnable[3];
  assign sg13g2_IOPadInOut30mA_5_c2p = soc_io_plat_hyperbus_dq_write[4];
  assign sg13g2_IOPadInOut30mA_5_c2p_en = soc_io_plat_hyperbus_dq_writeEnable[4];
  assign sg13g2_IOPadInOut30mA_6_c2p = soc_io_plat_hyperbus_dq_write[5];
  assign sg13g2_IOPadInOut30mA_6_c2p_en = soc_io_plat_hyperbus_dq_writeEnable[5];
  assign sg13g2_IOPadInOut30mA_7_c2p = soc_io_plat_hyperbus_dq_write[6];
  assign sg13g2_IOPadInOut30mA_7_c2p_en = soc_io_plat_hyperbus_dq_writeEnable[6];
  assign sg13g2_IOPadInOut30mA_8_c2p = soc_io_plat_hyperbus_dq_write[7];
  assign sg13g2_IOPadInOut30mA_8_c2p_en = soc_io_plat_hyperbus_dq_writeEnable[7];
  assign sg13g2_IOPadOut4mA_6_c2p = soc_io_plat_spi_cs[0];
  assign sg13g2_IOPadInOut4mA_5_c2p = soc_io_plat_spi_dq_write[0];
  assign sg13g2_IOPadInOut4mA_5_c2p_en = soc_io_plat_spi_dq_writeEnable[0];
  always @(*) begin
    soc_io_plat_spi_dq_read[0] = sg13g2_IOPadInOut4mA_5_p2c;
    soc_io_plat_spi_dq_read[1] = sg13g2_IOPadInOut4mA_6_p2c;
  end

  assign sg13g2_IOPadInOut4mA_6_c2p = soc_io_plat_spi_dq_write[1];
  assign sg13g2_IOPadInOut4mA_6_c2p_en = soc_io_plat_spi_dq_writeEnable[1];

endmodule

module ElemRV (
  input  wire          io_plat_reset,
  input  wire          io_plat_clock,
  input  wire          io_plat_jtag_tms,
  input  wire          io_plat_jtag_tdi,
  output wire          io_plat_jtag_tdo,
  input  wire          io_plat_jtag_tck,
  output wire [0:0]    io_plat_hyperbus_cs,
  output wire          io_plat_hyperbus_ck,
  output wire          io_plat_hyperbus_reset,
  input  wire [7:0]    io_plat_hyperbus_dq_read,
  output wire [7:0]    io_plat_hyperbus_dq_write,
  output wire [7:0]    io_plat_hyperbus_dq_writeEnable,
  input  wire          io_plat_hyperbus_rwds_read,
  output wire          io_plat_hyperbus_rwds_write,
  output wire          io_plat_hyperbus_rwds_writeEnable,
  output wire [0:0]    io_plat_spi_cs,
  output wire          io_plat_spi_sclk,
  input  wire [1:0]    io_plat_spi_dq_read,
  output wire [1:0]    io_plat_spi_dq_write,
  output wire [1:0]    io_plat_spi_dq_writeEnable,
  output wire          io_per_uartStd_txd,
  input  wire          io_per_uartStd_rxd,
  input  wire          io_per_uartStd_cts,
  output wire          io_per_uartStd_rts,
  input  wire [3:0]    io_per_gpioStatus_pins_read,
  output wire [3:0]    io_per_gpioStatus_pins_write,
  output wire [3:0]    io_per_gpioStatus_pins_writeEnable
);
  localparam CmdMode_CS = 2'd0;
  localparam CmdMode_ADDR = 2'd1;
  localparam CmdMode_DATA = 2'd2;

  reg        [1:0]    resetCtrl_io_trigger;
  reg        [1:0]    resetCtrl_io_buildConnection_resets;
  reg        [1:0]    clockCtrl_io_buildConnection_clocks;
  wire                system_core_cpu_iBus_rsp_payload_error;
  wire                system_core_cpu_softwareInterrupt;
  wire       [7:0]    system_core_cpu_debug_bus_cmd_payload_address;
  wire                system_core_cpu_dBus_cmd_ready;
  wire                system_core_cpu_dBus_rsp_error;
  wire       [11:0]   system_hyperbus_ctrl_io_bus_PADDR;
  wire       [11:0]   system_spiXipControllerCtrl_io_bus_PADDR;
  wire       [31:0]   axi4ReadOnlyDecoder_1_io_input_ar_payload_addr;
  wire       [3:0]    axi4ReadOnlyDecoder_1_io_input_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_1_io_input_ar_payload_prot;
  wire                axi4ReadOnlyDecoder_1_io_input_r_ready;
  wire       [2:0]    system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_size;
  wire       [1:0]    system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_burst;
  wire       [0:0]    system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_lock;
  wire       [3:0]    system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_qos;
  wire       [1:0]    system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_payload_burst;
  wire       [0:0]    system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_payload_lock;
  wire       [3:0]    system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_payload_qos;
  wire       [19:0]   system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_addr;
  wire       [2:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_size;
  wire       [1:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_burst;
  wire       [0:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_lock;
  wire       [3:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_qos;
  wire       [19:0]   system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_addr;
  wire       [1:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_burst;
  wire       [0:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_lock;
  wire       [3:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_qos;
  wire       [19:0]   system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire       [1:0]    system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_burst;
  wire                system_apbBridge_io_axi_arbiter_io_output_arw_ready;
  wire                system_apbBridge_io_axi_arbiter_io_output_w_ready;
  wire       [15:0]   system_plicCtrl_io_bus_PADDR;
  reg        [2:0]    system_plicCtrl_io_sources;
  wire       [11:0]   system_mtimerCtrl_io_bus_PADDR;
  wire       [11:0]   system_resetCtrlMapper_io_bus_PADDR;
  wire       [11:0]   system_clockCtrlMapper_io_bus_PADDR;
  wire       [11:0]   peripherals_uartStdCtrl_io_bus_PADDR;
  wire       [11:0]   peripherals_gpioStatusCtrl_io_bus_PADDR;
  wire       [1:0]    resetCtrl_io_resets;
  wire       [1:0]    resetCtrl_io_buildConnection_trigger;
  wire                resetCtrl__zz_3;
  wire                resetCtrl__zz_4;
  wire       [1:0]    clockCtrl_io_clocks;
  wire                clockCtrl__zz_3;
  wire                clockCtrl__zz_4;
  wire                system_core_cpu_iBus_cmd_valid;
  wire       [31:0]   system_core_cpu_iBus_cmd_payload_pc;
  wire                system_core_cpu_debug_bus_cmd_ready;
  wire       [31:0]   system_core_cpu_debug_bus_rsp_data;
  wire                system_core_cpu_debug_resetOut;
  wire                system_core_cpu_dBus_cmd_valid;
  wire                system_core_cpu_dBus_cmd_payload_wr;
  wire       [31:0]   system_core_cpu_dBus_cmd_payload_address;
  wire       [31:0]   system_core_cpu_dBus_cmd_payload_data;
  wire       [1:0]    system_core_cpu_dBus_cmd_payload_size;
  wire                jtagBridge_1_io_jtag_tdo;
  wire                jtagBridge_1_io_remote_cmd_valid;
  wire                jtagBridge_1_io_remote_cmd_payload_last;
  wire       [0:0]    jtagBridge_1_io_remote_cmd_payload_fragment;
  wire                jtagBridge_1_io_remote_rsp_ready;
  wire                systemDebugger_1_io_remote_cmd_ready;
  wire                systemDebugger_1_io_remote_rsp_valid;
  wire                systemDebugger_1_io_remote_rsp_payload_error;
  wire       [31:0]   systemDebugger_1_io_remote_rsp_payload_data;
  wire                systemDebugger_1_io_mem_cmd_valid;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_address;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_data;
  wire                systemDebugger_1_io_mem_cmd_payload_wr;
  wire       [1:0]    systemDebugger_1_io_mem_cmd_payload_size;
  wire                system_hyperbus_ctrl_io_memory_arw_ready;
  wire                system_hyperbus_ctrl_io_memory_w_ready;
  wire                system_hyperbus_ctrl_io_memory_b_valid;
  wire       [3:0]    system_hyperbus_ctrl_io_memory_b_payload_id;
  wire       [1:0]    system_hyperbus_ctrl_io_memory_b_payload_resp;
  wire                system_hyperbus_ctrl_io_memory_r_valid;
  wire       [31:0]   system_hyperbus_ctrl_io_memory_r_payload_data;
  wire       [3:0]    system_hyperbus_ctrl_io_memory_r_payload_id;
  wire       [1:0]    system_hyperbus_ctrl_io_memory_r_payload_resp;
  wire                system_hyperbus_ctrl_io_memory_r_payload_last;
  wire                system_hyperbus_ctrl_io_bus_PREADY;
  wire       [31:0]   system_hyperbus_ctrl_io_bus_PRDATA;
  wire                system_hyperbus_ctrl_io_bus_PSLVERROR;
  wire                system_hyperbus_ctrl_io_phy_cmd_valid;
  wire       [1:0]    system_hyperbus_ctrl_io_phy_cmd_payload_mode;
  wire       [9:0]    system_hyperbus_ctrl_io_phy_cmd_payload_args;
  wire                system_hyperbus_ctrl_io_phy_rsp_ready;
  wire       [6:0]    system_hyperbus_ctrl_io_phy_config_reset_pulse;
  wire       [7:0]    system_hyperbus_ctrl_io_phy_config_reset_halt;
  wire                system_hyperbus_ctrl_io_phy_config_reset_trigger;
  wire       [0:0]    system_hyperbus_phy_io_hyperbus_cs;
  wire                system_hyperbus_phy_io_hyperbus_ck;
  wire                system_hyperbus_phy_io_hyperbus_reset;
  wire       [7:0]    system_hyperbus_phy_io_hyperbus_dq_write;
  wire       [7:0]    system_hyperbus_phy_io_hyperbus_dq_writeEnable;
  wire                system_hyperbus_phy_io_hyperbus_rwds_write;
  wire                system_hyperbus_phy_io_hyperbus_rwds_writeEnable;
  wire                system_hyperbus_phy_io_phy_cmd_ready;
  wire                system_hyperbus_phy_io_phy_rsp_valid;
  wire       [7:0]    system_hyperbus_phy_io_phy_rsp_payload_data;
  wire                system_hyperbus_phy_io_phy_rsp_payload_last;
  wire                system_hyperbus_phy_io_phy_rsp_payload_error;
  wire                system_spiXipControllerCtrl_io_bus_PREADY;
  wire       [31:0]   system_spiXipControllerCtrl_io_bus_PRDATA;
  wire                system_spiXipControllerCtrl_io_bus_PSLVERROR;
  wire                system_spiXipControllerCtrl_io_dataBus_ar_ready;
  wire                system_spiXipControllerCtrl_io_dataBus_r_valid;
  wire       [31:0]   system_spiXipControllerCtrl_io_dataBus_r_payload_data;
  wire       [3:0]    system_spiXipControllerCtrl_io_dataBus_r_payload_id;
  wire       [1:0]    system_spiXipControllerCtrl_io_dataBus_r_payload_resp;
  wire                system_spiXipControllerCtrl_io_dataBus_r_payload_last;
  wire       [0:0]    system_spiXipControllerCtrl_io_spi_cs;
  wire                system_spiXipControllerCtrl_io_spi_sclk;
  wire       [1:0]    system_spiXipControllerCtrl_io_spi_dq_write;
  wire       [1:0]    system_spiXipControllerCtrl_io_spi_dq_writeEnable;
  wire                system_spiXipControllerCtrl_io_interrupt;
  wire                system_apbBridge_io_axi_arw_ready;
  wire                system_apbBridge_io_axi_w_ready;
  wire                system_apbBridge_io_axi_b_valid;
  wire       [3:0]    system_apbBridge_io_axi_b_payload_id;
  wire       [1:0]    system_apbBridge_io_axi_b_payload_resp;
  wire                system_apbBridge_io_axi_r_valid;
  wire       [31:0]   system_apbBridge_io_axi_r_payload_data;
  wire       [3:0]    system_apbBridge_io_axi_r_payload_id;
  wire       [1:0]    system_apbBridge_io_axi_r_payload_resp;
  wire                system_apbBridge_io_axi_r_payload_last;
  wire       [19:0]   system_apbBridge_io_apb_PADDR;
  wire       [0:0]    system_apbBridge_io_apb_PSEL;
  wire                system_apbBridge_io_apb_PENABLE;
  wire                system_apbBridge_io_apb_PWRITE;
  wire       [31:0]   system_apbBridge_io_apb_PWDATA;
  wire                axi4ReadOnlyDecoder_1_io_input_ar_ready;
  wire                axi4ReadOnlyDecoder_1_io_input_r_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_1_io_input_r_payload_data;
  wire       [1:0]    axi4ReadOnlyDecoder_1_io_input_r_payload_resp;
  wire                axi4ReadOnlyDecoder_1_io_input_r_payload_last;
  wire                axi4ReadOnlyDecoder_1_io_outputs_0_ar_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_addr;
  wire       [3:0]    axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_prot;
  wire                axi4ReadOnlyDecoder_1_io_outputs_0_r_ready;
  wire                axi4ReadOnlyDecoder_1_io_outputs_1_ar_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_1_io_outputs_1_ar_payload_addr;
  wire       [3:0]    axi4ReadOnlyDecoder_1_io_outputs_1_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_1_io_outputs_1_ar_payload_prot;
  wire                axi4ReadOnlyDecoder_1_io_outputs_1_r_ready;
  wire                axi4SharedDecoder_1_io_input_arw_ready;
  wire                axi4SharedDecoder_1_io_input_w_ready;
  wire                axi4SharedDecoder_1_io_input_b_valid;
  wire       [1:0]    axi4SharedDecoder_1_io_input_b_payload_resp;
  wire                axi4SharedDecoder_1_io_input_r_valid;
  wire       [31:0]   axi4SharedDecoder_1_io_input_r_payload_data;
  wire       [1:0]    axi4SharedDecoder_1_io_input_r_payload_resp;
  wire                axi4SharedDecoder_1_io_input_r_payload_last;
  wire                axi4SharedDecoder_1_io_readOutputs_0_ar_valid;
  wire       [31:0]   axi4SharedDecoder_1_io_readOutputs_0_ar_payload_addr;
  wire       [2:0]    axi4SharedDecoder_1_io_readOutputs_0_ar_payload_size;
  wire       [3:0]    axi4SharedDecoder_1_io_readOutputs_0_ar_payload_cache;
  wire       [2:0]    axi4SharedDecoder_1_io_readOutputs_0_ar_payload_prot;
  wire                axi4SharedDecoder_1_io_readOutputs_0_r_ready;
  wire                axi4SharedDecoder_1_io_sharedOutputs_0_arw_valid;
  wire       [31:0]   axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_addr;
  wire       [2:0]    axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_size;
  wire       [3:0]    axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_cache;
  wire       [2:0]    axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_prot;
  wire                axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_write;
  wire                axi4SharedDecoder_1_io_sharedOutputs_0_w_valid;
  wire       [31:0]   axi4SharedDecoder_1_io_sharedOutputs_0_w_payload_data;
  wire       [3:0]    axi4SharedDecoder_1_io_sharedOutputs_0_w_payload_strb;
  wire                axi4SharedDecoder_1_io_sharedOutputs_0_w_payload_last;
  wire                axi4SharedDecoder_1_io_sharedOutputs_0_b_ready;
  wire                axi4SharedDecoder_1_io_sharedOutputs_0_r_ready;
  wire                axi4SharedDecoder_1_io_sharedOutputs_1_arw_valid;
  wire       [31:0]   axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_addr;
  wire       [2:0]    axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_size;
  wire       [3:0]    axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_cache;
  wire       [2:0]    axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_prot;
  wire                axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_write;
  wire                axi4SharedDecoder_1_io_sharedOutputs_1_w_valid;
  wire       [31:0]   axi4SharedDecoder_1_io_sharedOutputs_1_w_payload_data;
  wire       [3:0]    axi4SharedDecoder_1_io_sharedOutputs_1_w_payload_strb;
  wire                axi4SharedDecoder_1_io_sharedOutputs_1_w_payload_last;
  wire                axi4SharedDecoder_1_io_sharedOutputs_1_b_ready;
  wire                axi4SharedDecoder_1_io_sharedOutputs_1_r_ready;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_ready;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_valid;
  wire       [31:0]   system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_payload_data;
  wire       [2:0]    system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_payload_id;
  wire       [1:0]    system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_payload_resp;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_payload_last;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_ready;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_w_ready;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_b_valid;
  wire       [2:0]    system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [2:0]    system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_payload_last;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_valid;
  wire       [31:0]   system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_id;
  wire       [3:0]    system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_region;
  wire       [7:0]    system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_len;
  wire       [2:0]    system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_size;
  wire       [1:0]    system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_burst;
  wire       [0:0]    system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_lock;
  wire       [3:0]    system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_cache;
  wire       [3:0]    system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_qos;
  wire       [2:0]    system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_prot;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_write;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_output_w_valid;
  wire       [31:0]   system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_data;
  wire       [3:0]    system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_strb;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_last;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_output_b_ready;
  wire                system_hyperbus_ctrl_io_memory_arbiter_io_output_r_ready;
  wire                system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_ready;
  wire                system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_valid;
  wire       [31:0]   system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_payload_data;
  wire       [2:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_payload_id;
  wire       [1:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_payload_resp;
  wire                system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_payload_last;
  wire                system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_ready;
  wire                system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_valid;
  wire       [31:0]   system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_payload_data;
  wire       [2:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_payload_id;
  wire       [1:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_payload_resp;
  wire                system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_payload_last;
  wire                system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_valid;
  wire       [19:0]   system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_addr;
  wire       [3:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_id;
  wire       [3:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_region;
  wire       [7:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_len;
  wire       [2:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_size;
  wire       [1:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_burst;
  wire       [0:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_lock;
  wire       [3:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_cache;
  wire       [3:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_qos;
  wire       [2:0]    system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_prot;
  wire                system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_r_ready;
  wire                system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                system_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [3:0]    system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [3:0]    system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                system_apbBridge_io_axi_arbiter_io_output_arw_valid;
  wire       [19:0]   system_apbBridge_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    system_apbBridge_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    system_apbBridge_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    system_apbBridge_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    system_apbBridge_io_axi_arbiter_io_output_arw_payload_burst;
  wire                system_apbBridge_io_axi_arbiter_io_output_arw_payload_write;
  wire                system_apbBridge_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   system_apbBridge_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    system_apbBridge_io_axi_arbiter_io_output_w_payload_strb;
  wire                system_apbBridge_io_axi_arbiter_io_output_w_payload_last;
  wire                system_apbBridge_io_axi_arbiter_io_output_b_ready;
  wire                system_apbBridge_io_axi_arbiter_io_output_r_ready;
  wire                system_plicCtrl_io_bus_PREADY;
  wire       [31:0]   system_plicCtrl_io_bus_PRDATA;
  wire                system_plicCtrl_io_bus_PSLVERROR;
  wire                system_plicCtrl_io_interrupt;
  wire                system_mtimerCtrl_io_bus_PREADY;
  wire       [31:0]   system_mtimerCtrl_io_bus_PRDATA;
  wire                system_mtimerCtrl_io_bus_PSLVERROR;
  wire                system_mtimerCtrl_io_interrupt;
  wire                system_resetCtrlMapper_io_bus_PREADY;
  wire       [31:0]   system_resetCtrlMapper_io_bus_PRDATA;
  wire                system_resetCtrlMapper_io_bus_PSLVERROR;
  wire       [1:0]    system_resetCtrlMapper_io_config_enable;
  wire       [1:0]    system_resetCtrlMapper_io_config_trigger;
  wire                system_resetCtrlMapper_io_config_acknowledge;
  wire                system_clockCtrlMapper_io_bus_PREADY;
  wire       [31:0]   system_clockCtrlMapper_io_bus_PRDATA;
  wire                system_clockCtrlMapper_io_bus_PSLVERROR;
  wire       [1:0]    system_clockCtrlMapper_io_config_enable;
  wire                peripherals_uartStdCtrl_io_bus_PREADY;
  wire       [31:0]   peripherals_uartStdCtrl_io_bus_PRDATA;
  wire                peripherals_uartStdCtrl_io_bus_PSLVERROR;
  wire                peripherals_uartStdCtrl_io_uart_txd;
  wire                peripherals_uartStdCtrl_io_uart_rts;
  wire                peripherals_uartStdCtrl_io_interrupt;
  wire                peripherals_gpioStatusCtrl_io_bus_PREADY;
  wire       [31:0]   peripherals_gpioStatusCtrl_io_bus_PRDATA;
  wire                peripherals_gpioStatusCtrl_io_bus_PSLVERROR;
  wire       [3:0]    peripherals_gpioStatusCtrl_io_gpio_pins_write;
  wire       [3:0]    peripherals_gpioStatusCtrl_io_gpio_pins_writeEnable;
  wire                peripherals_gpioStatusCtrl_io_interrupt;
  wire                io_apb_decoder_io_input_PREADY;
  wire       [31:0]   io_apb_decoder_io_input_PRDATA;
  wire                io_apb_decoder_io_input_PSLVERROR;
  wire       [19:0]   io_apb_decoder_io_output_PADDR;
  wire       [7:0]    io_apb_decoder_io_output_PSEL;
  wire                io_apb_decoder_io_output_PENABLE;
  wire                io_apb_decoder_io_output_PWRITE;
  wire       [31:0]   io_apb_decoder_io_output_PWDATA;
  wire                apb3Router_1_io_input_PREADY;
  wire       [31:0]   apb3Router_1_io_input_PRDATA;
  wire                apb3Router_1_io_input_PSLVERROR;
  wire       [19:0]   apb3Router_1_io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_0_PSEL;
  wire                apb3Router_1_io_outputs_0_PENABLE;
  wire                apb3Router_1_io_outputs_0_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_0_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_1_PSEL;
  wire                apb3Router_1_io_outputs_1_PENABLE;
  wire                apb3Router_1_io_outputs_1_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_1_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_2_PSEL;
  wire                apb3Router_1_io_outputs_2_PENABLE;
  wire                apb3Router_1_io_outputs_2_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_2_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_3_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_3_PSEL;
  wire                apb3Router_1_io_outputs_3_PENABLE;
  wire                apb3Router_1_io_outputs_3_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_3_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_4_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_4_PSEL;
  wire                apb3Router_1_io_outputs_4_PENABLE;
  wire                apb3Router_1_io_outputs_4_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_4_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_5_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_5_PSEL;
  wire                apb3Router_1_io_outputs_5_PENABLE;
  wire                apb3Router_1_io_outputs_5_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_5_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_6_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_6_PSEL;
  wire                apb3Router_1_io_outputs_6_PENABLE;
  wire                apb3Router_1_io_outputs_6_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_6_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_7_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_7_PSEL;
  wire                apb3Router_1_io_outputs_7_PENABLE;
  wire                apb3Router_1_io_outputs_7_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_7_PWDATA;
  wire                system_core_mtimerInterrupt;
  wire                system_core_globalInterrupt;
  wire                _zz_when_Stream_l369;
  wire                _zz_when_Stream_l1020;
  wire       [31:0]   _zz_io_input_arw_payload_addr;
  wire       [2:0]    _zz_io_input_arw_payload_size;
  wire                _zz_io_input_arw_payload_write;
  wire                _zz_when_Stream_l369_1;
  wire                _zz_when_Stream_l1020_1;
  wire       [31:0]   _zz_io_input_w_payload_data;
  wire       [3:0]    _zz_io_input_w_payload_strb;
  wire                soc_system_core_cpu_dBus_cmd_fire;
  wire                when_Utils_l694;
  reg                 _zz_when_Utils_l723;
  reg                 _zz_when_Utils_l723_1;
  reg        [2:0]    _zz_dBus_cmd_ready;
  reg        [2:0]    _zz_dBus_cmd_ready_1;
  wire                when_Utils_l723;
  wire                when_Utils_l725;
  wire                _zz_dBus_cmd_ready_2;
  wire                _zz_when_Stream_l369_2;
  reg                 _zz_dBus_cmd_ready_3;
  wire                _zz_when_Stream_l439;
  wire       [31:0]   _zz_io_input_arw_payload_addr_1;
  wire       [1:0]    _zz_io_input_arw_payload_size_1;
  wire                _zz_when_Stream_l369_3;
  wire                _zz_when_Stream_l1020_2;
  wire                _zz_when_Stream_l369_4;
  reg                 _zz_when_Stream_l1020_3;
  reg                 _zz_when_Stream_l1020_4;
  reg                 _zz_when_Stream_l1020_5;
  wire                when_Stream_l1020;
  wire                when_Stream_l1020_1;
  wire                when_Stream_l439;
  reg                 _zz_when_Stream_l369_5;
  reg        [3:0]    _zz_io_input_w_payload_strb_1;
  reg                 soc_system_core_cpu_debug_resetOut_regNext;
  wire                soc_system_core_cpu_debug_bus_cmd_fire;
  reg                 soc_system_core_cpu_debug_bus_cmd_fire_regNext;
  wire                soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_valid;
  wire                soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_ready;
  wire       [31:0]   soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_payload_addr;
  wire       [3:0]    soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_payload_cache;
  wire       [2:0]    soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_payload_prot;
  reg                 soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_rValid;
  wire                soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_fire;
  wire                soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_valid;
  wire                soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_ready;
  wire       [31:0]   soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_payload_addr;
  wire       [3:0]    soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_payload_cache;
  wire       [2:0]    soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_payload_prot;
  reg                 soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_rValid;
  wire                soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_fire;
  wire                soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_valid;
  wire                soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_ready;
  wire       [31:0]   soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_addr;
  wire       [2:0]    soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_size;
  wire       [3:0]    soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_cache;
  wire       [2:0]    soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_prot;
  reg                 soc_axi4SharedDecoder_1_io_readOutputs_0_ar_rValid;
  wire                soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_fire;
  wire                soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_valid;
  wire                soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_ready;
  wire       [31:0]   soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_addr;
  wire       [2:0]    soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_size;
  wire       [3:0]    soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_cache;
  wire       [2:0]    soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_prot;
  wire                soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_write;
  reg                 soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_rValid;
  wire                soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_fire;
  wire                soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_valid;
  wire                soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_ready;
  wire       [31:0]   soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_addr;
  wire       [2:0]    soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_size;
  wire       [3:0]    soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_cache;
  wire       [2:0]    soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_prot;
  wire                soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_write;
  reg                 soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_rValid;
  wire                soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_fire;
  reg                 _zz_1;
  reg                 _zz_io_input_arw_payload_addr_2;
  reg        [31:0]   _zz_io_input_arw_payload_addr_3;
  reg        [2:0]    _zz_io_input_arw_payload_size_2;
  reg        [3:0]    _zz_io_input_arw_payload_cache;
  reg        [2:0]    _zz_io_input_arw_payload_prot;
  reg                 _zz_io_input_arw_payload_write_1;
  wire                _zz_when_Stream_l369_6;
  reg                 _zz_when_Stream_l369_7;
  reg        [31:0]   _zz_io_input_arw_payload_addr_4;
  reg        [2:0]    _zz_io_input_arw_payload_size_3;
  reg        [3:0]    _zz_io_input_arw_payload_cache_1;
  reg        [2:0]    _zz_io_input_arw_payload_prot_1;
  reg                 _zz_io_input_arw_payload_write_2;
  wire                when_Stream_l369;
  reg                 _zz_2;
  reg                 _zz_io_input_w_payload_data_1;
  reg        [31:0]   _zz_io_input_w_payload_data_2;
  reg        [3:0]    _zz_io_input_w_payload_strb_2;
  reg                 _zz_io_input_w_payload_last;
  wire                _zz_when_Stream_l369_8;
  reg                 _zz_when_Stream_l369_9;
  reg        [31:0]   _zz_io_input_w_payload_data_3;
  reg        [3:0]    _zz_io_input_w_payload_strb_3;
  reg                 _zz_io_input_w_payload_last_1;
  wire                when_Stream_l369_1;
  wire                soc_axi4SharedDecoder_1_io_input_b_s2mPipe_valid;
  reg                 soc_axi4SharedDecoder_1_io_input_b_s2mPipe_ready;
  wire       [1:0]    soc_axi4SharedDecoder_1_io_input_b_s2mPipe_payload_resp;
  reg                 soc_axi4SharedDecoder_1_io_input_b_rValidN;
  reg        [1:0]    soc_axi4SharedDecoder_1_io_input_b_rData_resp;
  wire                soc_axi4SharedDecoder_1_io_input_b_s2mPipe_m2sPipe_valid;
  wire                soc_axi4SharedDecoder_1_io_input_b_s2mPipe_m2sPipe_ready;
  wire       [1:0]    soc_axi4SharedDecoder_1_io_input_b_s2mPipe_m2sPipe_payload_resp;
  reg                 soc_axi4SharedDecoder_1_io_input_b_s2mPipe_rValid;
  reg        [1:0]    soc_axi4SharedDecoder_1_io_input_b_s2mPipe_rData_resp;
  wire                when_Stream_l369_2;
  wire                soc_axi4SharedDecoder_1_io_input_r_s2mPipe_valid;
  reg                 soc_axi4SharedDecoder_1_io_input_r_s2mPipe_ready;
  wire       [31:0]   soc_axi4SharedDecoder_1_io_input_r_s2mPipe_payload_data;
  wire       [1:0]    soc_axi4SharedDecoder_1_io_input_r_s2mPipe_payload_resp;
  wire                soc_axi4SharedDecoder_1_io_input_r_s2mPipe_payload_last;
  reg                 soc_axi4SharedDecoder_1_io_input_r_rValidN;
  reg        [31:0]   soc_axi4SharedDecoder_1_io_input_r_rData_data;
  reg        [1:0]    soc_axi4SharedDecoder_1_io_input_r_rData_resp;
  reg                 soc_axi4SharedDecoder_1_io_input_r_rData_last;
  wire                soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_valid;
  wire                soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_ready;
  wire       [31:0]   soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_payload_data;
  wire       [1:0]    soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_payload_resp;
  wire                soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_payload_last;
  reg                 soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rValid;
  reg        [31:0]   soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rData_data;
  reg        [1:0]    soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rData_resp;
  reg                 soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rData_last;
  wire                when_Stream_l369_3;
  wire       [2:0]    _zz_io_readInputs_0_ar_payload_id;
  wire       [3:0]    _zz_io_readInputs_0_ar_payload_region;
  wire       [7:0]    _zz_io_readInputs_0_ar_payload_len;
  wire       [2:0]    _zz_io_sharedInputs_0_arw_payload_id;
  wire       [3:0]    _zz_io_sharedInputs_0_arw_payload_region;
  wire       [7:0]    _zz_io_sharedInputs_0_arw_payload_len;
  wire                soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_valid;
  reg                 soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_ready;
  wire       [31:0]   soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_addr;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_id;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_region;
  wire       [7:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_len;
  wire       [2:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_size;
  wire       [1:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_burst;
  wire       [0:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_lock;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_cache;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_qos;
  wire       [2:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_prot;
  wire                soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_write;
  reg                 soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN;
  reg        [31:0]   soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_addr;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_id;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_region;
  reg        [7:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_len;
  reg        [2:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_size;
  reg        [1:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_burst;
  reg        [0:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_lock;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_cache;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_qos;
  reg        [2:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_prot;
  reg                 soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_write;
  wire                soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_valid;
  wire                soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_ready;
  wire       [31:0]   soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_addr;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_id;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_region;
  wire       [7:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_len;
  wire       [2:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_size;
  wire       [1:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_burst;
  wire       [0:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_lock;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_cache;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_qos;
  wire       [2:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_prot;
  wire                soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_write;
  reg                 soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rValid;
  reg        [31:0]   soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_addr;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_id;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_region;
  reg        [7:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_len;
  reg        [2:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_size;
  reg        [1:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_burst;
  reg        [0:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_lock;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_cache;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_qos;
  reg        [2:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_prot;
  reg                 soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_write;
  wire                when_Stream_l369_4;
  wire                soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_valid;
  reg                 soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_ready;
  wire       [31:0]   soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_payload_data;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_payload_strb;
  wire                soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_payload_last;
  reg                 soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rValidN;
  reg        [31:0]   soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rData_data;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rData_strb;
  reg                 soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rData_last;
  wire                soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_valid;
  wire                soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_ready;
  wire       [31:0]   soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb;
  wire                soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last;
  reg                 soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rValid;
  reg        [31:0]   soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rData_data;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rData_strb;
  reg                 soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rData_last;
  wire                when_Stream_l369_5;
  wire                soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_valid;
  reg                 soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_ready;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_payload_id;
  wire       [1:0]    soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_payload_resp;
  reg                 soc_system_hyperbus_ctrl_io_memory_b_rValidN;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_b_rData_id;
  reg        [1:0]    soc_system_hyperbus_ctrl_io_memory_b_rData_resp;
  wire                soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_valid;
  wire                soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_ready;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_payload_id;
  wire       [1:0]    soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_payload_resp;
  reg                 soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_rValid;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_rData_id;
  reg        [1:0]    soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_rData_resp;
  wire                when_Stream_l369_6;
  wire                soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_valid;
  reg                 soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_ready;
  wire       [31:0]   soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_data;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_id;
  wire       [1:0]    soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_resp;
  wire                soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_last;
  reg                 soc_system_hyperbus_ctrl_io_memory_r_rValidN;
  reg        [31:0]   soc_system_hyperbus_ctrl_io_memory_r_rData_data;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_r_rData_id;
  reg        [1:0]    soc_system_hyperbus_ctrl_io_memory_r_rData_resp;
  reg                 soc_system_hyperbus_ctrl_io_memory_r_rData_last;
  wire                soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_valid;
  wire                soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_ready;
  wire       [31:0]   soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_id;
  wire       [1:0]    soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_resp;
  wire                soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_last;
  reg                 soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rValid;
  reg        [31:0]   soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_data;
  reg        [3:0]    soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_id;
  reg        [1:0]    soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_resp;
  reg                 soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_last;
  wire                when_Stream_l369_7;
  wire       [2:0]    _zz_io_inputs_0_ar_payload_id;
  wire       [3:0]    _zz_io_inputs_0_ar_payload_region;
  wire       [7:0]    _zz_io_inputs_0_ar_payload_len;
  wire       [2:0]    _zz_io_inputs_1_ar_payload_id;
  wire       [3:0]    _zz_io_inputs_1_ar_payload_region;
  wire       [7:0]    _zz_io_inputs_1_ar_payload_len;
  wire                soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_valid;
  reg                 soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_ready;
  wire       [19:0]   soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_addr;
  wire       [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_id;
  wire       [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_region;
  wire       [7:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_len;
  wire       [2:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_size;
  wire       [1:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_burst;
  wire       [0:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_lock;
  wire       [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_cache;
  wire       [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_qos;
  wire       [2:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_prot;
  reg                 soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN;
  reg        [19:0]   soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_addr;
  reg        [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_id;
  reg        [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_region;
  reg        [7:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_len;
  reg        [2:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_size;
  reg        [1:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_burst;
  reg        [0:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_lock;
  reg        [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_cache;
  reg        [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_qos;
  reg        [2:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_prot;
  wire                soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_valid;
  wire                soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_ready;
  wire       [19:0]   soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_addr;
  wire       [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_id;
  wire       [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_region;
  wire       [7:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_len;
  wire       [2:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_size;
  wire       [1:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_burst;
  wire       [0:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_lock;
  wire       [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_cache;
  wire       [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_qos;
  wire       [2:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_prot;
  reg                 soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rValid;
  reg        [19:0]   soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_addr;
  reg        [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_id;
  reg        [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_region;
  reg        [7:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_len;
  reg        [2:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_size;
  reg        [1:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_burst;
  reg        [0:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_lock;
  reg        [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_cache;
  reg        [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_qos;
  reg        [2:0]    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_prot;
  wire                when_Stream_l369_8;
  wire                soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_valid;
  reg                 soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_ready;
  wire       [31:0]   soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_data;
  wire       [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_id;
  wire       [1:0]    soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_resp;
  wire                soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_last;
  reg                 soc_system_spiXipControllerCtrl_io_dataBus_r_rValidN;
  reg        [31:0]   soc_system_spiXipControllerCtrl_io_dataBus_r_rData_data;
  reg        [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_r_rData_id;
  reg        [1:0]    soc_system_spiXipControllerCtrl_io_dataBus_r_rData_resp;
  reg                 soc_system_spiXipControllerCtrl_io_dataBus_r_rData_last;
  wire                soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_valid;
  wire                soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_ready;
  wire       [31:0]   soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_id;
  wire       [1:0]    soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_resp;
  wire                soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_last;
  reg                 soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rValid;
  reg        [31:0]   soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_data;
  reg        [3:0]    soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_id;
  reg        [1:0]    soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_resp;
  reg                 soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_last;
  wire                when_Stream_l369_9;
  wire       [3:0]    _zz_io_sharedInputs_0_arw_payload_id_1;
  wire       [7:0]    _zz_io_sharedInputs_0_arw_payload_len_1;
  wire                soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid;
  wire                soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready;
  wire       [19:0]   soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr;
  wire       [3:0]    soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id;
  wire       [7:0]    soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len;
  wire       [2:0]    soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size;
  wire       [1:0]    soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst;
  wire                soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write;
  reg                 soc_system_apbBridge_io_axi_arbiter_io_output_arw_rValid;
  wire                soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_fire;
  reg        [19:0]   soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_addr;
  reg        [3:0]    soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_id;
  reg        [7:0]    soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_len;
  reg        [2:0]    soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_size;
  reg        [1:0]    soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_burst;
  reg                 soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_write;
  wire                soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid;
  wire                soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready;
  wire       [31:0]   soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data;
  wire       [3:0]    soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb;
  wire                soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last;
  reg                 soc_system_apbBridge_io_axi_arbiter_io_output_w_rValid;
  wire                soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_fire;
  reg        [31:0]   soc_system_apbBridge_io_axi_arbiter_io_output_w_rData_data;
  reg        [3:0]    soc_system_apbBridge_io_axi_arbiter_io_output_w_rData_strb;
  reg                 soc_system_apbBridge_io_axi_arbiter_io_output_w_rData_last;

  ResetControllerCtrl resetCtrl (
    .io_resets                  (resetCtrl_io_resets[1:0]                     ), //o
    .io_trigger                 (resetCtrl_io_trigger[1:0]                    ), //i
    .io_buildConnection_resets  (resetCtrl_io_buildConnection_resets[1:0]     ), //i
    .io_buildConnection_trigger (resetCtrl_io_buildConnection_trigger[1:0]    ), //o
    .io_config_enable           (system_resetCtrlMapper_io_config_enable[1:0] ), //i
    .io_config_trigger          (system_resetCtrlMapper_io_config_trigger[1:0]), //i
    .io_config_acknowledge      (system_resetCtrlMapper_io_config_acknowledge ), //i
    ._zz_3                      (resetCtrl__zz_3                              ), //o
    ._zz_4                      (resetCtrl__zz_4                              )  //o
  );
  ClockControllerCtrl clockCtrl (
    .io_clocks                 (clockCtrl_io_clocks[1:0]                    ), //o
    .io_buildConnection_clocks (clockCtrl_io_buildConnection_clocks[1:0]    ), //i
    .io_config_enable          (system_clockCtrlMapper_io_config_enable[1:0]), //i
    ._zz_3                     (clockCtrl__zz_3                             ), //o
    ._zz_4                     (clockCtrl__zz_4                             )  //o
  );
  VexRiscv system_core_cpu (
    .iBus_cmd_valid                (system_core_cpu_iBus_cmd_valid                                       ), //o
    .iBus_cmd_ready                (axi4ReadOnlyDecoder_1_io_input_ar_ready                              ), //i
    .iBus_cmd_payload_pc           (system_core_cpu_iBus_cmd_payload_pc[31:0]                            ), //o
    .iBus_rsp_valid                (axi4ReadOnlyDecoder_1_io_input_r_valid                               ), //i
    .iBus_rsp_payload_error        (system_core_cpu_iBus_rsp_payload_error                               ), //i
    .iBus_rsp_payload_inst         (axi4ReadOnlyDecoder_1_io_input_r_payload_data[31:0]                  ), //i
    .timerInterrupt                (system_core_mtimerInterrupt                                          ), //i
    .externalInterrupt             (system_core_globalInterrupt                                          ), //i
    .softwareInterrupt             (system_core_cpu_softwareInterrupt                                    ), //i
    .debug_bus_cmd_valid           (systemDebugger_1_io_mem_cmd_valid                                    ), //i
    .debug_bus_cmd_ready           (system_core_cpu_debug_bus_cmd_ready                                  ), //o
    .debug_bus_cmd_payload_wr      (systemDebugger_1_io_mem_cmd_payload_wr                               ), //i
    .debug_bus_cmd_payload_address (system_core_cpu_debug_bus_cmd_payload_address[7:0]                   ), //i
    .debug_bus_cmd_payload_data    (systemDebugger_1_io_mem_cmd_payload_data[31:0]                       ), //i
    .debug_bus_rsp_data            (system_core_cpu_debug_bus_rsp_data[31:0]                             ), //o
    .debug_resetOut                (system_core_cpu_debug_resetOut                                       ), //o
    .dBus_cmd_valid                (system_core_cpu_dBus_cmd_valid                                       ), //o
    .dBus_cmd_ready                (system_core_cpu_dBus_cmd_ready                                       ), //i
    .dBus_cmd_payload_wr           (system_core_cpu_dBus_cmd_payload_wr                                  ), //o
    .dBus_cmd_payload_address      (system_core_cpu_dBus_cmd_payload_address[31:0]                       ), //o
    .dBus_cmd_payload_data         (system_core_cpu_dBus_cmd_payload_data[31:0]                          ), //o
    .dBus_cmd_payload_size         (system_core_cpu_dBus_cmd_payload_size[1:0]                           ), //o
    .dBus_rsp_ready                (soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_valid             ), //i
    .dBus_rsp_error                (system_core_cpu_dBus_rsp_error                                       ), //i
    .dBus_rsp_data                 (soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_payload_data[31:0]), //i
    ._zz_7                         (clockCtrl__zz_3                                                      ), //i
    ._zz_8                         (resetCtrl__zz_3                                                      ), //i
    ._zz_9                         (clockCtrl__zz_4                                                      ), //i
    ._zz_10                        (resetCtrl__zz_4                                                      )  //i
  );
  JtagBridge jtagBridge_1 (
    .io_jtag_tms                    (io_plat_jtag_tms                                 ), //i
    .io_jtag_tdi                    (io_plat_jtag_tdi                                 ), //i
    .io_jtag_tdo                    (jtagBridge_1_io_jtag_tdo                         ), //o
    .io_jtag_tck                    (io_plat_jtag_tck                                 ), //i
    .io_remote_cmd_valid            (jtagBridge_1_io_remote_cmd_valid                 ), //o
    .io_remote_cmd_ready            (systemDebugger_1_io_remote_cmd_ready             ), //i
    .io_remote_cmd_payload_last     (jtagBridge_1_io_remote_cmd_payload_last          ), //o
    .io_remote_cmd_payload_fragment (jtagBridge_1_io_remote_cmd_payload_fragment      ), //o
    .io_remote_rsp_valid            (systemDebugger_1_io_remote_rsp_valid             ), //i
    .io_remote_rsp_ready            (jtagBridge_1_io_remote_rsp_ready                 ), //o
    .io_remote_rsp_payload_error    (systemDebugger_1_io_remote_rsp_payload_error     ), //i
    .io_remote_rsp_payload_data     (systemDebugger_1_io_remote_rsp_payload_data[31:0]), //i
    ._zz_1                          (clockCtrl__zz_4                                  ), //i
    ._zz_2                          (resetCtrl__zz_4                                  )  //i
  );
  SystemDebugger systemDebugger_1 (
    .io_remote_cmd_valid            (jtagBridge_1_io_remote_cmd_valid                 ), //i
    .io_remote_cmd_ready            (systemDebugger_1_io_remote_cmd_ready             ), //o
    .io_remote_cmd_payload_last     (jtagBridge_1_io_remote_cmd_payload_last          ), //i
    .io_remote_cmd_payload_fragment (jtagBridge_1_io_remote_cmd_payload_fragment      ), //i
    .io_remote_rsp_valid            (systemDebugger_1_io_remote_rsp_valid             ), //o
    .io_remote_rsp_ready            (jtagBridge_1_io_remote_rsp_ready                 ), //i
    .io_remote_rsp_payload_error    (systemDebugger_1_io_remote_rsp_payload_error     ), //o
    .io_remote_rsp_payload_data     (systemDebugger_1_io_remote_rsp_payload_data[31:0]), //o
    .io_mem_cmd_valid               (systemDebugger_1_io_mem_cmd_valid                ), //o
    .io_mem_cmd_ready               (system_core_cpu_debug_bus_cmd_ready              ), //i
    .io_mem_cmd_payload_address     (systemDebugger_1_io_mem_cmd_payload_address[31:0]), //o
    .io_mem_cmd_payload_data        (systemDebugger_1_io_mem_cmd_payload_data[31:0]   ), //o
    .io_mem_cmd_payload_wr          (systemDebugger_1_io_mem_cmd_payload_wr           ), //o
    .io_mem_cmd_payload_size        (systemDebugger_1_io_mem_cmd_payload_size[1:0]    ), //o
    .io_mem_rsp_valid               (soc_system_core_cpu_debug_bus_cmd_fire_regNext   ), //i
    .io_mem_rsp_payload             (system_core_cpu_debug_bus_rsp_data[31:0]         ), //i
    ._zz_1                          (clockCtrl__zz_4                                  ), //i
    ._zz_2                          (resetCtrl__zz_4                                  )  //i
  );
  Axi4SharedHyperBus system_hyperbus_ctrl (
    .io_memory_arw_valid          (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_valid              ), //i
    .io_memory_arw_ready          (system_hyperbus_ctrl_io_memory_arw_ready                                                    ), //o
    .io_memory_arw_payload_addr   (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_addr[31:0] ), //i
    .io_memory_arw_payload_id     (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_id[3:0]    ), //i
    .io_memory_arw_payload_region (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_region[3:0]), //i
    .io_memory_arw_payload_len    (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_len[7:0]   ), //i
    .io_memory_arw_payload_size   (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_size[2:0]  ), //i
    .io_memory_arw_payload_burst  (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_burst[1:0] ), //i
    .io_memory_arw_payload_lock   (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_lock       ), //i
    .io_memory_arw_payload_cache  (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_cache[3:0] ), //i
    .io_memory_arw_payload_qos    (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_qos[3:0]   ), //i
    .io_memory_arw_payload_prot   (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_prot[2:0]  ), //i
    .io_memory_arw_payload_write  (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_write      ), //i
    .io_memory_w_valid            (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_valid                ), //i
    .io_memory_w_ready            (system_hyperbus_ctrl_io_memory_w_ready                                                      ), //o
    .io_memory_w_payload_data     (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data[31:0]   ), //i
    .io_memory_w_payload_strb     (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb[3:0]    ), //i
    .io_memory_w_payload_last     (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last         ), //i
    .io_memory_b_valid            (system_hyperbus_ctrl_io_memory_b_valid                                                      ), //o
    .io_memory_b_ready            (soc_system_hyperbus_ctrl_io_memory_b_rValidN                                                ), //i
    .io_memory_b_payload_id       (system_hyperbus_ctrl_io_memory_b_payload_id[3:0]                                            ), //o
    .io_memory_b_payload_resp     (system_hyperbus_ctrl_io_memory_b_payload_resp[1:0]                                          ), //o
    .io_memory_r_valid            (system_hyperbus_ctrl_io_memory_r_valid                                                      ), //o
    .io_memory_r_ready            (soc_system_hyperbus_ctrl_io_memory_r_rValidN                                                ), //i
    .io_memory_r_payload_data     (system_hyperbus_ctrl_io_memory_r_payload_data[31:0]                                         ), //o
    .io_memory_r_payload_id       (system_hyperbus_ctrl_io_memory_r_payload_id[3:0]                                            ), //o
    .io_memory_r_payload_resp     (system_hyperbus_ctrl_io_memory_r_payload_resp[1:0]                                          ), //o
    .io_memory_r_payload_last     (system_hyperbus_ctrl_io_memory_r_payload_last                                               ), //o
    .io_bus_PADDR                 (system_hyperbus_ctrl_io_bus_PADDR[11:0]                                                     ), //i
    .io_bus_PSEL                  (apb3Router_1_io_outputs_4_PSEL                                                              ), //i
    .io_bus_PENABLE               (apb3Router_1_io_outputs_4_PENABLE                                                           ), //i
    .io_bus_PREADY                (system_hyperbus_ctrl_io_bus_PREADY                                                          ), //o
    .io_bus_PWRITE                (apb3Router_1_io_outputs_4_PWRITE                                                            ), //i
    .io_bus_PWDATA                (apb3Router_1_io_outputs_4_PWDATA[31:0]                                                      ), //i
    .io_bus_PRDATA                (system_hyperbus_ctrl_io_bus_PRDATA[31:0]                                                    ), //o
    .io_bus_PSLVERROR             (system_hyperbus_ctrl_io_bus_PSLVERROR                                                       ), //o
    .io_phy_cmd_valid             (system_hyperbus_ctrl_io_phy_cmd_valid                                                       ), //o
    .io_phy_cmd_ready             (system_hyperbus_phy_io_phy_cmd_ready                                                        ), //i
    .io_phy_cmd_payload_mode      (system_hyperbus_ctrl_io_phy_cmd_payload_mode[1:0]                                           ), //o
    .io_phy_cmd_payload_args      (system_hyperbus_ctrl_io_phy_cmd_payload_args[9:0]                                           ), //o
    .io_phy_rsp_valid             (system_hyperbus_phy_io_phy_rsp_valid                                                        ), //i
    .io_phy_rsp_ready             (system_hyperbus_ctrl_io_phy_rsp_ready                                                       ), //o
    .io_phy_rsp_payload_data      (system_hyperbus_phy_io_phy_rsp_payload_data[7:0]                                            ), //i
    .io_phy_rsp_payload_last      (system_hyperbus_phy_io_phy_rsp_payload_last                                                 ), //i
    .io_phy_rsp_payload_error     (system_hyperbus_phy_io_phy_rsp_payload_error                                                ), //i
    .io_phy_config_reset_pulse    (system_hyperbus_ctrl_io_phy_config_reset_pulse[6:0]                                         ), //o
    .io_phy_config_reset_halt     (system_hyperbus_ctrl_io_phy_config_reset_halt[7:0]                                          ), //o
    .io_phy_config_reset_trigger  (system_hyperbus_ctrl_io_phy_config_reset_trigger                                            ), //o
    ._zz_1                        (clockCtrl__zz_3                                                                             ), //i
    ._zz_2                        (resetCtrl__zz_3                                                                             )  //i
  );
  Phy system_hyperbus_phy (
    .io_hyperbus_cs               (system_hyperbus_phy_io_hyperbus_cs                 ), //o
    .io_hyperbus_ck               (system_hyperbus_phy_io_hyperbus_ck                 ), //o
    .io_hyperbus_reset            (system_hyperbus_phy_io_hyperbus_reset              ), //o
    .io_hyperbus_dq_read          (io_plat_hyperbus_dq_read[7:0]                      ), //i
    .io_hyperbus_dq_write         (system_hyperbus_phy_io_hyperbus_dq_write[7:0]      ), //o
    .io_hyperbus_dq_writeEnable   (system_hyperbus_phy_io_hyperbus_dq_writeEnable[7:0]), //o
    .io_hyperbus_rwds_read        (io_plat_hyperbus_rwds_read                         ), //i
    .io_hyperbus_rwds_write       (system_hyperbus_phy_io_hyperbus_rwds_write         ), //o
    .io_hyperbus_rwds_writeEnable (system_hyperbus_phy_io_hyperbus_rwds_writeEnable   ), //o
    .io_phy_cmd_valid             (system_hyperbus_ctrl_io_phy_cmd_valid              ), //i
    .io_phy_cmd_ready             (system_hyperbus_phy_io_phy_cmd_ready               ), //o
    .io_phy_cmd_payload_mode      (system_hyperbus_ctrl_io_phy_cmd_payload_mode[1:0]  ), //i
    .io_phy_cmd_payload_args      (system_hyperbus_ctrl_io_phy_cmd_payload_args[9:0]  ), //i
    .io_phy_rsp_valid             (system_hyperbus_phy_io_phy_rsp_valid               ), //o
    .io_phy_rsp_ready             (system_hyperbus_ctrl_io_phy_rsp_ready              ), //i
    .io_phy_rsp_payload_data      (system_hyperbus_phy_io_phy_rsp_payload_data[7:0]   ), //o
    .io_phy_rsp_payload_last      (system_hyperbus_phy_io_phy_rsp_payload_last        ), //o
    .io_phy_rsp_payload_error     (system_hyperbus_phy_io_phy_rsp_payload_error       ), //o
    .io_phy_config_reset_pulse    (system_hyperbus_ctrl_io_phy_config_reset_pulse[6:0]), //i
    .io_phy_config_reset_halt     (system_hyperbus_ctrl_io_phy_config_reset_halt[7:0] ), //i
    .io_phy_config_reset_trigger  (system_hyperbus_ctrl_io_phy_config_reset_trigger   ), //i
    ._zz_1                        (clockCtrl__zz_3                                    ), //i
    ._zz_2                        (resetCtrl__zz_3                                    )  //i
  );
  Axi4ReadOnlySpiXipController system_spiXipControllerCtrl (
    .io_bus_PADDR                 (system_spiXipControllerCtrl_io_bus_PADDR[11:0]                                                     ), //i
    .io_bus_PSEL                  (apb3Router_1_io_outputs_5_PSEL                                                                     ), //i
    .io_bus_PENABLE               (apb3Router_1_io_outputs_5_PENABLE                                                                  ), //i
    .io_bus_PREADY                (system_spiXipControllerCtrl_io_bus_PREADY                                                          ), //o
    .io_bus_PWRITE                (apb3Router_1_io_outputs_5_PWRITE                                                                   ), //i
    .io_bus_PWDATA                (apb3Router_1_io_outputs_5_PWDATA[31:0]                                                             ), //i
    .io_bus_PRDATA                (system_spiXipControllerCtrl_io_bus_PRDATA[31:0]                                                    ), //o
    .io_bus_PSLVERROR             (system_spiXipControllerCtrl_io_bus_PSLVERROR                                                       ), //o
    .io_dataBus_ar_valid          (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_valid              ), //i
    .io_dataBus_ar_ready          (system_spiXipControllerCtrl_io_dataBus_ar_ready                                                    ), //o
    .io_dataBus_ar_payload_addr   (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_addr[19:0] ), //i
    .io_dataBus_ar_payload_id     (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_id[3:0]    ), //i
    .io_dataBus_ar_payload_region (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_region[3:0]), //i
    .io_dataBus_ar_payload_len    (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_len[7:0]   ), //i
    .io_dataBus_ar_payload_size   (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_size[2:0]  ), //i
    .io_dataBus_ar_payload_burst  (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_burst[1:0] ), //i
    .io_dataBus_ar_payload_lock   (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_lock       ), //i
    .io_dataBus_ar_payload_cache  (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_cache[3:0] ), //i
    .io_dataBus_ar_payload_qos    (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_qos[3:0]   ), //i
    .io_dataBus_ar_payload_prot   (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_prot[2:0]  ), //i
    .io_dataBus_r_valid           (system_spiXipControllerCtrl_io_dataBus_r_valid                                                     ), //o
    .io_dataBus_r_ready           (soc_system_spiXipControllerCtrl_io_dataBus_r_rValidN                                               ), //i
    .io_dataBus_r_payload_data    (system_spiXipControllerCtrl_io_dataBus_r_payload_data[31:0]                                        ), //o
    .io_dataBus_r_payload_id      (system_spiXipControllerCtrl_io_dataBus_r_payload_id[3:0]                                           ), //o
    .io_dataBus_r_payload_resp    (system_spiXipControllerCtrl_io_dataBus_r_payload_resp[1:0]                                         ), //o
    .io_dataBus_r_payload_last    (system_spiXipControllerCtrl_io_dataBus_r_payload_last                                              ), //o
    .io_spi_cs                    (system_spiXipControllerCtrl_io_spi_cs                                                              ), //o
    .io_spi_sclk                  (system_spiXipControllerCtrl_io_spi_sclk                                                            ), //o
    .io_spi_dq_read               (io_plat_spi_dq_read[1:0]                                                                           ), //i
    .io_spi_dq_write              (system_spiXipControllerCtrl_io_spi_dq_write[1:0]                                                   ), //o
    .io_spi_dq_writeEnable        (system_spiXipControllerCtrl_io_spi_dq_writeEnable[1:0]                                             ), //o
    .io_interrupt                 (system_spiXipControllerCtrl_io_interrupt                                                           ), //o
    ._zz_1                        (clockCtrl__zz_3                                                                                    ), //i
    ._zz_2                        (resetCtrl__zz_3                                                                                    )  //i
  );
  Axi4SharedToApb3Bridge system_apbBridge (
    .io_axi_arw_valid         (soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid             ), //i
    .io_axi_arw_ready         (system_apbBridge_io_axi_arw_ready                                            ), //o
    .io_axi_arw_payload_addr  (soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr[19:0]), //i
    .io_axi_arw_payload_id    (soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id[3:0]   ), //i
    .io_axi_arw_payload_len   (soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len[7:0]  ), //i
    .io_axi_arw_payload_size  (soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size[2:0] ), //i
    .io_axi_arw_payload_burst (soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst[1:0]), //i
    .io_axi_arw_payload_write (soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write     ), //i
    .io_axi_w_valid           (soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid               ), //i
    .io_axi_w_ready           (system_apbBridge_io_axi_w_ready                                              ), //o
    .io_axi_w_payload_data    (soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb    (soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last    (soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last        ), //i
    .io_axi_b_valid           (system_apbBridge_io_axi_b_valid                                              ), //o
    .io_axi_b_ready           (system_apbBridge_io_axi_arbiter_io_output_b_ready                            ), //i
    .io_axi_b_payload_id      (system_apbBridge_io_axi_b_payload_id[3:0]                                    ), //o
    .io_axi_b_payload_resp    (system_apbBridge_io_axi_b_payload_resp[1:0]                                  ), //o
    .io_axi_r_valid           (system_apbBridge_io_axi_r_valid                                              ), //o
    .io_axi_r_ready           (system_apbBridge_io_axi_arbiter_io_output_r_ready                            ), //i
    .io_axi_r_payload_data    (system_apbBridge_io_axi_r_payload_data[31:0]                                 ), //o
    .io_axi_r_payload_id      (system_apbBridge_io_axi_r_payload_id[3:0]                                    ), //o
    .io_axi_r_payload_resp    (system_apbBridge_io_axi_r_payload_resp[1:0]                                  ), //o
    .io_axi_r_payload_last    (system_apbBridge_io_axi_r_payload_last                                       ), //o
    .io_apb_PADDR             (system_apbBridge_io_apb_PADDR[19:0]                                          ), //o
    .io_apb_PSEL              (system_apbBridge_io_apb_PSEL                                                 ), //o
    .io_apb_PENABLE           (system_apbBridge_io_apb_PENABLE                                              ), //o
    .io_apb_PREADY            (io_apb_decoder_io_input_PREADY                                               ), //i
    .io_apb_PWRITE            (system_apbBridge_io_apb_PWRITE                                               ), //o
    .io_apb_PWDATA            (system_apbBridge_io_apb_PWDATA[31:0]                                         ), //o
    .io_apb_PRDATA            (io_apb_decoder_io_input_PRDATA[31:0]                                         ), //i
    .io_apb_PSLVERROR         (io_apb_decoder_io_input_PSLVERROR                                            ), //i
    ._zz_1                    (clockCtrl__zz_3                                                              ), //i
    ._zz_2                    (resetCtrl__zz_3                                                              )  //i
  );
  Axi4ReadOnlyDecoder axi4ReadOnlyDecoder_1 (
    .io_input_ar_valid             (system_core_cpu_iBus_cmd_valid                                                 ), //i
    .io_input_ar_ready             (axi4ReadOnlyDecoder_1_io_input_ar_ready                                        ), //o
    .io_input_ar_payload_addr      (axi4ReadOnlyDecoder_1_io_input_ar_payload_addr[31:0]                           ), //i
    .io_input_ar_payload_cache     (axi4ReadOnlyDecoder_1_io_input_ar_payload_cache[3:0]                           ), //i
    .io_input_ar_payload_prot      (axi4ReadOnlyDecoder_1_io_input_ar_payload_prot[2:0]                            ), //i
    .io_input_r_valid              (axi4ReadOnlyDecoder_1_io_input_r_valid                                         ), //o
    .io_input_r_ready              (axi4ReadOnlyDecoder_1_io_input_r_ready                                         ), //i
    .io_input_r_payload_data       (axi4ReadOnlyDecoder_1_io_input_r_payload_data[31:0]                            ), //o
    .io_input_r_payload_resp       (axi4ReadOnlyDecoder_1_io_input_r_payload_resp[1:0]                             ), //o
    .io_input_r_payload_last       (axi4ReadOnlyDecoder_1_io_input_r_payload_last                                  ), //o
    .io_outputs_0_ar_valid         (axi4ReadOnlyDecoder_1_io_outputs_0_ar_valid                                    ), //o
    .io_outputs_0_ar_ready         (soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_fire                       ), //i
    .io_outputs_0_ar_payload_addr  (axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_addr[31:0]                       ), //o
    .io_outputs_0_ar_payload_cache (axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_cache[3:0]                       ), //o
    .io_outputs_0_ar_payload_prot  (axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_prot[2:0]                        ), //o
    .io_outputs_0_r_valid          (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_valid                 ), //i
    .io_outputs_0_r_ready          (axi4ReadOnlyDecoder_1_io_outputs_0_r_ready                                     ), //o
    .io_outputs_0_r_payload_data   (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_payload_data[31:0]    ), //i
    .io_outputs_0_r_payload_resp   (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_payload_resp[1:0]     ), //i
    .io_outputs_0_r_payload_last   (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_payload_last          ), //i
    .io_outputs_1_ar_valid         (axi4ReadOnlyDecoder_1_io_outputs_1_ar_valid                                    ), //o
    .io_outputs_1_ar_ready         (soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_fire                       ), //i
    .io_outputs_1_ar_payload_addr  (axi4ReadOnlyDecoder_1_io_outputs_1_ar_payload_addr[31:0]                       ), //o
    .io_outputs_1_ar_payload_cache (axi4ReadOnlyDecoder_1_io_outputs_1_ar_payload_cache[3:0]                       ), //o
    .io_outputs_1_ar_payload_prot  (axi4ReadOnlyDecoder_1_io_outputs_1_ar_payload_prot[2:0]                        ), //o
    .io_outputs_1_r_valid          (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_valid             ), //i
    .io_outputs_1_r_ready          (axi4ReadOnlyDecoder_1_io_outputs_1_r_ready                                     ), //o
    .io_outputs_1_r_payload_data   (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_payload_data[31:0]), //i
    .io_outputs_1_r_payload_resp   (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_payload_resp[1:0] ), //i
    .io_outputs_1_r_payload_last   (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_payload_last      ), //i
    ._zz_1                         (clockCtrl__zz_3                                                                ), //i
    ._zz_2                         (resetCtrl__zz_3                                                                )  //i
  );
  Axi4SharedDecoder axi4SharedDecoder_1 (
    .io_input_arw_valid                   (_zz_when_Stream_l369_6                                                         ), //i
    .io_input_arw_ready                   (axi4SharedDecoder_1_io_input_arw_ready                                         ), //o
    .io_input_arw_payload_addr            (_zz_io_input_arw_payload_addr_4[31:0]                                          ), //i
    .io_input_arw_payload_size            (_zz_io_input_arw_payload_size_3[2:0]                                           ), //i
    .io_input_arw_payload_cache           (_zz_io_input_arw_payload_cache_1[3:0]                                          ), //i
    .io_input_arw_payload_prot            (_zz_io_input_arw_payload_prot_1[2:0]                                           ), //i
    .io_input_arw_payload_write           (_zz_io_input_arw_payload_write_2                                               ), //i
    .io_input_w_valid                     (_zz_when_Stream_l369_8                                                         ), //i
    .io_input_w_ready                     (axi4SharedDecoder_1_io_input_w_ready                                           ), //o
    .io_input_w_payload_data              (_zz_io_input_w_payload_data_3[31:0]                                            ), //i
    .io_input_w_payload_strb              (_zz_io_input_w_payload_strb_3[3:0]                                             ), //i
    .io_input_w_payload_last              (_zz_io_input_w_payload_last_1                                                  ), //i
    .io_input_b_valid                     (axi4SharedDecoder_1_io_input_b_valid                                           ), //o
    .io_input_b_ready                     (soc_axi4SharedDecoder_1_io_input_b_rValidN                                     ), //i
    .io_input_b_payload_resp              (axi4SharedDecoder_1_io_input_b_payload_resp[1:0]                               ), //o
    .io_input_r_valid                     (axi4SharedDecoder_1_io_input_r_valid                                           ), //o
    .io_input_r_ready                     (soc_axi4SharedDecoder_1_io_input_r_rValidN                                     ), //i
    .io_input_r_payload_data              (axi4SharedDecoder_1_io_input_r_payload_data[31:0]                              ), //o
    .io_input_r_payload_resp              (axi4SharedDecoder_1_io_input_r_payload_resp[1:0]                               ), //o
    .io_input_r_payload_last              (axi4SharedDecoder_1_io_input_r_payload_last                                    ), //o
    .io_readOutputs_0_ar_valid            (axi4SharedDecoder_1_io_readOutputs_0_ar_valid                                  ), //o
    .io_readOutputs_0_ar_ready            (soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_fire                     ), //i
    .io_readOutputs_0_ar_payload_addr     (axi4SharedDecoder_1_io_readOutputs_0_ar_payload_addr[31:0]                     ), //o
    .io_readOutputs_0_ar_payload_size     (axi4SharedDecoder_1_io_readOutputs_0_ar_payload_size[2:0]                      ), //o
    .io_readOutputs_0_ar_payload_cache    (axi4SharedDecoder_1_io_readOutputs_0_ar_payload_cache[3:0]                     ), //o
    .io_readOutputs_0_ar_payload_prot     (axi4SharedDecoder_1_io_readOutputs_0_ar_payload_prot[2:0]                      ), //o
    .io_readOutputs_0_r_valid             (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_valid             ), //i
    .io_readOutputs_0_r_ready             (axi4SharedDecoder_1_io_readOutputs_0_r_ready                                   ), //o
    .io_readOutputs_0_r_payload_data      (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_payload_data[31:0]), //i
    .io_readOutputs_0_r_payload_resp      (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_payload_resp[1:0] ), //i
    .io_readOutputs_0_r_payload_last      (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_payload_last      ), //i
    .io_sharedOutputs_0_arw_valid         (axi4SharedDecoder_1_io_sharedOutputs_0_arw_valid                               ), //o
    .io_sharedOutputs_0_arw_ready         (soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_fire                  ), //i
    .io_sharedOutputs_0_arw_payload_addr  (axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_addr[31:0]                  ), //o
    .io_sharedOutputs_0_arw_payload_size  (axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_size[2:0]                   ), //o
    .io_sharedOutputs_0_arw_payload_cache (axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_cache[3:0]                  ), //o
    .io_sharedOutputs_0_arw_payload_prot  (axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_prot[2:0]                   ), //o
    .io_sharedOutputs_0_arw_payload_write (axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_write                       ), //o
    .io_sharedOutputs_0_w_valid           (axi4SharedDecoder_1_io_sharedOutputs_0_w_valid                                 ), //o
    .io_sharedOutputs_0_w_ready           (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_w_ready               ), //i
    .io_sharedOutputs_0_w_payload_data    (axi4SharedDecoder_1_io_sharedOutputs_0_w_payload_data[31:0]                    ), //o
    .io_sharedOutputs_0_w_payload_strb    (axi4SharedDecoder_1_io_sharedOutputs_0_w_payload_strb[3:0]                     ), //o
    .io_sharedOutputs_0_w_payload_last    (axi4SharedDecoder_1_io_sharedOutputs_0_w_payload_last                          ), //o
    .io_sharedOutputs_0_b_valid           (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_b_valid               ), //i
    .io_sharedOutputs_0_b_ready           (axi4SharedDecoder_1_io_sharedOutputs_0_b_ready                                 ), //o
    .io_sharedOutputs_0_b_payload_resp    (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //i
    .io_sharedOutputs_0_r_valid           (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_valid               ), //i
    .io_sharedOutputs_0_r_ready           (axi4SharedDecoder_1_io_sharedOutputs_0_r_ready                                 ), //o
    .io_sharedOutputs_0_r_payload_data    (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_payload_data[31:0]  ), //i
    .io_sharedOutputs_0_r_payload_resp    (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //i
    .io_sharedOutputs_0_r_payload_last    (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_payload_last        ), //i
    .io_sharedOutputs_1_arw_valid         (axi4SharedDecoder_1_io_sharedOutputs_1_arw_valid                               ), //o
    .io_sharedOutputs_1_arw_ready         (soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_fire                  ), //i
    .io_sharedOutputs_1_arw_payload_addr  (axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_addr[31:0]                  ), //o
    .io_sharedOutputs_1_arw_payload_size  (axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_size[2:0]                   ), //o
    .io_sharedOutputs_1_arw_payload_cache (axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_cache[3:0]                  ), //o
    .io_sharedOutputs_1_arw_payload_prot  (axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_prot[2:0]                   ), //o
    .io_sharedOutputs_1_arw_payload_write (axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_write                       ), //o
    .io_sharedOutputs_1_w_valid           (axi4SharedDecoder_1_io_sharedOutputs_1_w_valid                                 ), //o
    .io_sharedOutputs_1_w_ready           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready                      ), //i
    .io_sharedOutputs_1_w_payload_data    (axi4SharedDecoder_1_io_sharedOutputs_1_w_payload_data[31:0]                    ), //o
    .io_sharedOutputs_1_w_payload_strb    (axi4SharedDecoder_1_io_sharedOutputs_1_w_payload_strb[3:0]                     ), //o
    .io_sharedOutputs_1_w_payload_last    (axi4SharedDecoder_1_io_sharedOutputs_1_w_payload_last                          ), //o
    .io_sharedOutputs_1_b_valid           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid                      ), //i
    .io_sharedOutputs_1_b_ready           (axi4SharedDecoder_1_io_sharedOutputs_1_b_ready                                 ), //o
    .io_sharedOutputs_1_b_payload_resp    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]          ), //i
    .io_sharedOutputs_1_r_valid           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid                      ), //i
    .io_sharedOutputs_1_r_ready           (axi4SharedDecoder_1_io_sharedOutputs_1_r_ready                                 ), //o
    .io_sharedOutputs_1_r_payload_data    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]         ), //i
    .io_sharedOutputs_1_r_payload_resp    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]          ), //i
    .io_sharedOutputs_1_r_payload_last    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last               ), //i
    ._zz_1                                (clockCtrl__zz_3                                                                ), //i
    ._zz_2                                (resetCtrl__zz_3                                                                )  //i
  );
  Axi4SharedArbiter system_hyperbus_ctrl_io_memory_arbiter (
    .io_readInputs_0_ar_valid             (soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_valid                      ), //i
    .io_readInputs_0_ar_ready             (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_ready                ), //o
    .io_readInputs_0_ar_payload_addr      (soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_payload_addr[31:0]         ), //i
    .io_readInputs_0_ar_payload_id        (_zz_io_readInputs_0_ar_payload_id[2:0]                                         ), //i
    .io_readInputs_0_ar_payload_region    (_zz_io_readInputs_0_ar_payload_region[3:0]                                     ), //i
    .io_readInputs_0_ar_payload_len       (_zz_io_readInputs_0_ar_payload_len[7:0]                                        ), //i
    .io_readInputs_0_ar_payload_size      (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_size[2:0]    ), //i
    .io_readInputs_0_ar_payload_burst     (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_burst[1:0]   ), //i
    .io_readInputs_0_ar_payload_lock      (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_lock         ), //i
    .io_readInputs_0_ar_payload_cache     (soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_payload_cache[3:0]         ), //i
    .io_readInputs_0_ar_payload_qos       (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_qos[3:0]     ), //i
    .io_readInputs_0_ar_payload_prot      (soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_payload_prot[2:0]          ), //i
    .io_readInputs_0_r_valid              (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_valid                 ), //o
    .io_readInputs_0_r_ready              (axi4ReadOnlyDecoder_1_io_outputs_0_r_ready                                     ), //i
    .io_readInputs_0_r_payload_data       (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_payload_data[31:0]    ), //o
    .io_readInputs_0_r_payload_id         (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_payload_id[2:0]       ), //o
    .io_readInputs_0_r_payload_resp       (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_payload_resp[1:0]     ), //o
    .io_readInputs_0_r_payload_last       (system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_r_payload_last          ), //o
    .io_sharedInputs_0_arw_valid          (soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_valid                 ), //i
    .io_sharedInputs_0_arw_ready          (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_ready             ), //o
    .io_sharedInputs_0_arw_payload_addr   (soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_addr[31:0]    ), //i
    .io_sharedInputs_0_arw_payload_id     (_zz_io_sharedInputs_0_arw_payload_id[2:0]                                      ), //i
    .io_sharedInputs_0_arw_payload_region (_zz_io_sharedInputs_0_arw_payload_region[3:0]                                  ), //i
    .io_sharedInputs_0_arw_payload_len    (_zz_io_sharedInputs_0_arw_payload_len[7:0]                                     ), //i
    .io_sharedInputs_0_arw_payload_size   (soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_size[2:0]     ), //i
    .io_sharedInputs_0_arw_payload_burst  (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_payload_burst[1:0]), //i
    .io_sharedInputs_0_arw_payload_lock   (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_payload_lock      ), //i
    .io_sharedInputs_0_arw_payload_cache  (soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_cache[3:0]    ), //i
    .io_sharedInputs_0_arw_payload_qos    (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_payload_qos[3:0]  ), //i
    .io_sharedInputs_0_arw_payload_prot   (soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_prot[2:0]     ), //i
    .io_sharedInputs_0_arw_payload_write  (soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_write         ), //i
    .io_sharedInputs_0_w_valid            (axi4SharedDecoder_1_io_sharedOutputs_0_w_valid                                 ), //i
    .io_sharedInputs_0_w_ready            (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_w_ready               ), //o
    .io_sharedInputs_0_w_payload_data     (axi4SharedDecoder_1_io_sharedOutputs_0_w_payload_data[31:0]                    ), //i
    .io_sharedInputs_0_w_payload_strb     (axi4SharedDecoder_1_io_sharedOutputs_0_w_payload_strb[3:0]                     ), //i
    .io_sharedInputs_0_w_payload_last     (axi4SharedDecoder_1_io_sharedOutputs_0_w_payload_last                          ), //i
    .io_sharedInputs_0_b_valid            (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_b_valid               ), //o
    .io_sharedInputs_0_b_ready            (axi4SharedDecoder_1_io_sharedOutputs_0_b_ready                                 ), //i
    .io_sharedInputs_0_b_payload_id       (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_b_payload_id[2:0]     ), //o
    .io_sharedInputs_0_b_payload_resp     (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_valid            (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_valid               ), //o
    .io_sharedInputs_0_r_ready            (axi4SharedDecoder_1_io_sharedOutputs_0_r_ready                                 ), //i
    .io_sharedInputs_0_r_payload_data     (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_payload_data[31:0]  ), //o
    .io_sharedInputs_0_r_payload_id       (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_payload_id[2:0]     ), //o
    .io_sharedInputs_0_r_payload_resp     (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_payload_last     (system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_r_payload_last        ), //o
    .io_output_arw_valid                  (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_valid                     ), //o
    .io_output_arw_ready                  (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN               ), //i
    .io_output_arw_payload_addr           (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_addr[31:0]        ), //o
    .io_output_arw_payload_id             (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_id[3:0]           ), //o
    .io_output_arw_payload_region         (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_region[3:0]       ), //o
    .io_output_arw_payload_len            (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_len[7:0]          ), //o
    .io_output_arw_payload_size           (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_size[2:0]         ), //o
    .io_output_arw_payload_burst          (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_burst[1:0]        ), //o
    .io_output_arw_payload_lock           (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_lock              ), //o
    .io_output_arw_payload_cache          (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_cache[3:0]        ), //o
    .io_output_arw_payload_qos            (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_qos[3:0]          ), //o
    .io_output_arw_payload_prot           (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_prot[2:0]         ), //o
    .io_output_arw_payload_write          (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_write             ), //o
    .io_output_w_valid                    (system_hyperbus_ctrl_io_memory_arbiter_io_output_w_valid                       ), //o
    .io_output_w_ready                    (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rValidN                 ), //i
    .io_output_w_payload_data             (system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_data[31:0]          ), //o
    .io_output_w_payload_strb             (system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_strb[3:0]           ), //o
    .io_output_w_payload_last             (system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_last                ), //o
    .io_output_b_valid                    (soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_valid                     ), //i
    .io_output_b_ready                    (system_hyperbus_ctrl_io_memory_arbiter_io_output_b_ready                       ), //o
    .io_output_b_payload_id               (soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_payload_id[3:0]           ), //i
    .io_output_b_payload_resp             (soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_payload_resp[1:0]         ), //i
    .io_output_r_valid                    (soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_valid                     ), //i
    .io_output_r_ready                    (system_hyperbus_ctrl_io_memory_arbiter_io_output_r_ready                       ), //o
    .io_output_r_payload_data             (soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_data[31:0]        ), //i
    .io_output_r_payload_id               (soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_id[3:0]           ), //i
    .io_output_r_payload_resp             (soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_resp[1:0]         ), //i
    .io_output_r_payload_last             (soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_last              ), //i
    ._zz_1                                (clockCtrl__zz_3                                                                ), //i
    ._zz_2                                (resetCtrl__zz_3                                                                )  //i
  );
  Axi4ReadOnlyArbiter system_spiXipControllerCtrl_io_dataBus_arbiter (
    .io_inputs_0_ar_valid          (soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_valid                       ), //i
    .io_inputs_0_ar_ready          (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_ready             ), //o
    .io_inputs_0_ar_payload_addr   (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_addr[19:0]), //i
    .io_inputs_0_ar_payload_id     (_zz_io_inputs_0_ar_payload_id[2:0]                                              ), //i
    .io_inputs_0_ar_payload_region (_zz_io_inputs_0_ar_payload_region[3:0]                                          ), //i
    .io_inputs_0_ar_payload_len    (_zz_io_inputs_0_ar_payload_len[7:0]                                             ), //i
    .io_inputs_0_ar_payload_size   (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_size[2:0] ), //i
    .io_inputs_0_ar_payload_burst  (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_burst[1:0]), //i
    .io_inputs_0_ar_payload_lock   (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_lock      ), //i
    .io_inputs_0_ar_payload_cache  (soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_payload_cache[3:0]          ), //i
    .io_inputs_0_ar_payload_qos    (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_qos[3:0]  ), //i
    .io_inputs_0_ar_payload_prot   (soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_payload_prot[2:0]           ), //i
    .io_inputs_0_r_valid           (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_valid              ), //o
    .io_inputs_0_r_ready           (axi4ReadOnlyDecoder_1_io_outputs_1_r_ready                                      ), //i
    .io_inputs_0_r_payload_data    (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_payload_data[31:0] ), //o
    .io_inputs_0_r_payload_id      (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_payload_id[2:0]    ), //o
    .io_inputs_0_r_payload_resp    (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_payload_resp[1:0]  ), //o
    .io_inputs_0_r_payload_last    (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_r_payload_last       ), //o
    .io_inputs_1_ar_valid          (soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_valid                     ), //i
    .io_inputs_1_ar_ready          (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_ready             ), //o
    .io_inputs_1_ar_payload_addr   (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_addr[19:0]), //i
    .io_inputs_1_ar_payload_id     (_zz_io_inputs_1_ar_payload_id[2:0]                                              ), //i
    .io_inputs_1_ar_payload_region (_zz_io_inputs_1_ar_payload_region[3:0]                                          ), //i
    .io_inputs_1_ar_payload_len    (_zz_io_inputs_1_ar_payload_len[7:0]                                             ), //i
    .io_inputs_1_ar_payload_size   (soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_size[2:0]         ), //i
    .io_inputs_1_ar_payload_burst  (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_burst[1:0]), //i
    .io_inputs_1_ar_payload_lock   (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_lock      ), //i
    .io_inputs_1_ar_payload_cache  (soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_cache[3:0]        ), //i
    .io_inputs_1_ar_payload_qos    (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_qos[3:0]  ), //i
    .io_inputs_1_ar_payload_prot   (soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_prot[2:0]         ), //i
    .io_inputs_1_r_valid           (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_valid              ), //o
    .io_inputs_1_r_ready           (axi4SharedDecoder_1_io_readOutputs_0_r_ready                                    ), //i
    .io_inputs_1_r_payload_data    (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_payload_data[31:0] ), //o
    .io_inputs_1_r_payload_id      (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_payload_id[2:0]    ), //o
    .io_inputs_1_r_payload_resp    (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_payload_resp[1:0]  ), //o
    .io_inputs_1_r_payload_last    (system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_r_payload_last       ), //o
    .io_output_ar_valid            (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_valid               ), //o
    .io_output_ar_ready            (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN         ), //i
    .io_output_ar_payload_addr     (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_addr[19:0]  ), //o
    .io_output_ar_payload_id       (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_id[3:0]     ), //o
    .io_output_ar_payload_region   (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_region[3:0] ), //o
    .io_output_ar_payload_len      (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_len[7:0]    ), //o
    .io_output_ar_payload_size     (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_size[2:0]   ), //o
    .io_output_ar_payload_burst    (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_burst[1:0]  ), //o
    .io_output_ar_payload_lock     (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_lock        ), //o
    .io_output_ar_payload_cache    (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_cache[3:0]  ), //o
    .io_output_ar_payload_qos      (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_qos[3:0]    ), //o
    .io_output_ar_payload_prot     (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_prot[2:0]   ), //o
    .io_output_r_valid             (soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_valid              ), //i
    .io_output_r_ready             (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_r_ready                ), //o
    .io_output_r_payload_data      (soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_data[31:0] ), //i
    .io_output_r_payload_id        (soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_id[3:0]    ), //i
    .io_output_r_payload_resp      (soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_resp[1:0]  ), //i
    .io_output_r_payload_last      (soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_last       ), //i
    ._zz_1                         (clockCtrl__zz_3                                                                 ), //i
    ._zz_2                         (resetCtrl__zz_3                                                                 )  //i
  );
  Axi4SharedArbiter_1 system_apbBridge_io_axi_arbiter (
    .io_sharedInputs_0_arw_valid         (soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_valid            ), //i
    .io_sharedInputs_0_arw_ready         (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready               ), //o
    .io_sharedInputs_0_arw_payload_addr  (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr[19:0]  ), //i
    .io_sharedInputs_0_arw_payload_id    (_zz_io_sharedInputs_0_arw_payload_id_1[3:0]                               ), //i
    .io_sharedInputs_0_arw_payload_len   (_zz_io_sharedInputs_0_arw_payload_len_1[7:0]                              ), //i
    .io_sharedInputs_0_arw_payload_size  (soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_size[2:0]), //i
    .io_sharedInputs_0_arw_payload_burst (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_burst[1:0]  ), //i
    .io_sharedInputs_0_arw_payload_write (soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_write    ), //i
    .io_sharedInputs_0_w_valid           (axi4SharedDecoder_1_io_sharedOutputs_1_w_valid                            ), //i
    .io_sharedInputs_0_w_ready           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready                 ), //o
    .io_sharedInputs_0_w_payload_data    (axi4SharedDecoder_1_io_sharedOutputs_1_w_payload_data[31:0]               ), //i
    .io_sharedInputs_0_w_payload_strb    (axi4SharedDecoder_1_io_sharedOutputs_1_w_payload_strb[3:0]                ), //i
    .io_sharedInputs_0_w_payload_last    (axi4SharedDecoder_1_io_sharedOutputs_1_w_payload_last                     ), //i
    .io_sharedInputs_0_b_valid           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid                 ), //o
    .io_sharedInputs_0_b_ready           (axi4SharedDecoder_1_io_sharedOutputs_1_b_ready                            ), //i
    .io_sharedInputs_0_b_payload_id      (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id[3:0]       ), //o
    .io_sharedInputs_0_b_payload_resp    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]     ), //o
    .io_sharedInputs_0_r_valid           (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid                 ), //o
    .io_sharedInputs_0_r_ready           (axi4SharedDecoder_1_io_sharedOutputs_1_r_ready                            ), //i
    .io_sharedInputs_0_r_payload_data    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]    ), //o
    .io_sharedInputs_0_r_payload_id      (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id[3:0]       ), //o
    .io_sharedInputs_0_r_payload_resp    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]     ), //o
    .io_sharedInputs_0_r_payload_last    (system_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last          ), //o
    .io_output_arw_valid                 (system_apbBridge_io_axi_arbiter_io_output_arw_valid                       ), //o
    .io_output_arw_ready                 (system_apbBridge_io_axi_arbiter_io_output_arw_ready                       ), //i
    .io_output_arw_payload_addr          (system_apbBridge_io_axi_arbiter_io_output_arw_payload_addr[19:0]          ), //o
    .io_output_arw_payload_id            (system_apbBridge_io_axi_arbiter_io_output_arw_payload_id[3:0]             ), //o
    .io_output_arw_payload_len           (system_apbBridge_io_axi_arbiter_io_output_arw_payload_len[7:0]            ), //o
    .io_output_arw_payload_size          (system_apbBridge_io_axi_arbiter_io_output_arw_payload_size[2:0]           ), //o
    .io_output_arw_payload_burst         (system_apbBridge_io_axi_arbiter_io_output_arw_payload_burst[1:0]          ), //o
    .io_output_arw_payload_write         (system_apbBridge_io_axi_arbiter_io_output_arw_payload_write               ), //o
    .io_output_w_valid                   (system_apbBridge_io_axi_arbiter_io_output_w_valid                         ), //o
    .io_output_w_ready                   (system_apbBridge_io_axi_arbiter_io_output_w_ready                         ), //i
    .io_output_w_payload_data            (system_apbBridge_io_axi_arbiter_io_output_w_payload_data[31:0]            ), //o
    .io_output_w_payload_strb            (system_apbBridge_io_axi_arbiter_io_output_w_payload_strb[3:0]             ), //o
    .io_output_w_payload_last            (system_apbBridge_io_axi_arbiter_io_output_w_payload_last                  ), //o
    .io_output_b_valid                   (system_apbBridge_io_axi_b_valid                                           ), //i
    .io_output_b_ready                   (system_apbBridge_io_axi_arbiter_io_output_b_ready                         ), //o
    .io_output_b_payload_id              (system_apbBridge_io_axi_b_payload_id[3:0]                                 ), //i
    .io_output_b_payload_resp            (system_apbBridge_io_axi_b_payload_resp[1:0]                               ), //i
    .io_output_r_valid                   (system_apbBridge_io_axi_r_valid                                           ), //i
    .io_output_r_ready                   (system_apbBridge_io_axi_arbiter_io_output_r_ready                         ), //o
    .io_output_r_payload_data            (system_apbBridge_io_axi_r_payload_data[31:0]                              ), //i
    .io_output_r_payload_id              (system_apbBridge_io_axi_r_payload_id[3:0]                                 ), //i
    .io_output_r_payload_resp            (system_apbBridge_io_axi_r_payload_resp[1:0]                               ), //i
    .io_output_r_payload_last            (system_apbBridge_io_axi_r_payload_last                                    ), //i
    ._zz_1                               (clockCtrl__zz_3                                                           ), //i
    ._zz_2                               (resetCtrl__zz_3                                                           )  //i
  );
  Apb3Plic system_plicCtrl (
    .io_bus_PADDR     (system_plicCtrl_io_bus_PADDR[15:0]    ), //i
    .io_bus_PSEL      (apb3Router_1_io_outputs_0_PSEL        ), //i
    .io_bus_PENABLE   (apb3Router_1_io_outputs_0_PENABLE     ), //i
    .io_bus_PREADY    (system_plicCtrl_io_bus_PREADY         ), //o
    .io_bus_PWRITE    (apb3Router_1_io_outputs_0_PWRITE      ), //i
    .io_bus_PWDATA    (apb3Router_1_io_outputs_0_PWDATA[31:0]), //i
    .io_bus_PRDATA    (system_plicCtrl_io_bus_PRDATA[31:0]   ), //o
    .io_bus_PSLVERROR (system_plicCtrl_io_bus_PSLVERROR      ), //o
    .io_interrupt     (system_plicCtrl_io_interrupt          ), //o
    .io_sources       (system_plicCtrl_io_sources[2:0]       ), //i
    ._zz_3            (clockCtrl__zz_3                       ), //i
    ._zz_4            (resetCtrl__zz_3                       )  //i
  );
  Apb3MachineTimer system_mtimerCtrl (
    .io_bus_PADDR     (system_mtimerCtrl_io_bus_PADDR[11:0]  ), //i
    .io_bus_PSEL      (apb3Router_1_io_outputs_1_PSEL        ), //i
    .io_bus_PENABLE   (apb3Router_1_io_outputs_1_PENABLE     ), //i
    .io_bus_PREADY    (system_mtimerCtrl_io_bus_PREADY       ), //o
    .io_bus_PWRITE    (apb3Router_1_io_outputs_1_PWRITE      ), //i
    .io_bus_PWDATA    (apb3Router_1_io_outputs_1_PWDATA[31:0]), //i
    .io_bus_PRDATA    (system_mtimerCtrl_io_bus_PRDATA[31:0] ), //o
    .io_bus_PSLVERROR (system_mtimerCtrl_io_bus_PSLVERROR    ), //o
    .io_interrupt     (system_mtimerCtrl_io_interrupt        ), //o
    ._zz_1            (clockCtrl__zz_3                       ), //i
    ._zz_2            (resetCtrl__zz_3                       )  //i
  );
  Apb3ResetController system_resetCtrlMapper (
    .io_bus_PADDR          (system_resetCtrlMapper_io_bus_PADDR[11:0]    ), //i
    .io_bus_PSEL           (apb3Router_1_io_outputs_2_PSEL               ), //i
    .io_bus_PENABLE        (apb3Router_1_io_outputs_2_PENABLE            ), //i
    .io_bus_PREADY         (system_resetCtrlMapper_io_bus_PREADY         ), //o
    .io_bus_PWRITE         (apb3Router_1_io_outputs_2_PWRITE             ), //i
    .io_bus_PWDATA         (apb3Router_1_io_outputs_2_PWDATA[31:0]       ), //i
    .io_bus_PRDATA         (system_resetCtrlMapper_io_bus_PRDATA[31:0]   ), //o
    .io_bus_PSLVERROR      (system_resetCtrlMapper_io_bus_PSLVERROR      ), //o
    .io_config_enable      (system_resetCtrlMapper_io_config_enable[1:0] ), //o
    .io_config_trigger     (system_resetCtrlMapper_io_config_trigger[1:0]), //o
    .io_config_acknowledge (system_resetCtrlMapper_io_config_acknowledge ), //o
    ._zz_1                 (clockCtrl__zz_3                              ), //i
    ._zz_2                 (resetCtrl__zz_3                              )  //i
  );
  Apb3ClockController system_clockCtrlMapper (
    .io_bus_PADDR     (system_clockCtrlMapper_io_bus_PADDR[11:0]   ), //i
    .io_bus_PSEL      (apb3Router_1_io_outputs_3_PSEL              ), //i
    .io_bus_PENABLE   (apb3Router_1_io_outputs_3_PENABLE           ), //i
    .io_bus_PREADY    (system_clockCtrlMapper_io_bus_PREADY        ), //o
    .io_bus_PWRITE    (apb3Router_1_io_outputs_3_PWRITE            ), //i
    .io_bus_PWDATA    (apb3Router_1_io_outputs_3_PWDATA[31:0]      ), //i
    .io_bus_PRDATA    (system_clockCtrlMapper_io_bus_PRDATA[31:0]  ), //o
    .io_bus_PSLVERROR (system_clockCtrlMapper_io_bus_PSLVERROR     ), //o
    .io_config_enable (system_clockCtrlMapper_io_config_enable[1:0]), //o
    ._zz_1            (clockCtrl__zz_3                             ), //i
    ._zz_2            (resetCtrl__zz_3                             )  //i
  );
  Apb3Uart peripherals_uartStdCtrl (
    .io_bus_PADDR     (peripherals_uartStdCtrl_io_bus_PADDR[11:0] ), //i
    .io_bus_PSEL      (apb3Router_1_io_outputs_6_PSEL             ), //i
    .io_bus_PENABLE   (apb3Router_1_io_outputs_6_PENABLE          ), //i
    .io_bus_PREADY    (peripherals_uartStdCtrl_io_bus_PREADY      ), //o
    .io_bus_PWRITE    (apb3Router_1_io_outputs_6_PWRITE           ), //i
    .io_bus_PWDATA    (apb3Router_1_io_outputs_6_PWDATA[31:0]     ), //i
    .io_bus_PRDATA    (peripherals_uartStdCtrl_io_bus_PRDATA[31:0]), //o
    .io_bus_PSLVERROR (peripherals_uartStdCtrl_io_bus_PSLVERROR   ), //o
    .io_uart_txd      (peripherals_uartStdCtrl_io_uart_txd        ), //o
    .io_uart_rxd      (io_per_uartStd_rxd                         ), //i
    .io_uart_cts      (io_per_uartStd_cts                         ), //i
    .io_uart_rts      (peripherals_uartStdCtrl_io_uart_rts        ), //o
    .io_interrupt     (peripherals_uartStdCtrl_io_interrupt       ), //o
    ._zz_1            (clockCtrl__zz_3                            ), //i
    ._zz_2            (resetCtrl__zz_3                            )  //i
  );
  Apb3Gpio peripherals_gpioStatusCtrl (
    .io_bus_PADDR             (peripherals_gpioStatusCtrl_io_bus_PADDR[11:0]           ), //i
    .io_bus_PSEL              (apb3Router_1_io_outputs_7_PSEL                          ), //i
    .io_bus_PENABLE           (apb3Router_1_io_outputs_7_PENABLE                       ), //i
    .io_bus_PREADY            (peripherals_gpioStatusCtrl_io_bus_PREADY                ), //o
    .io_bus_PWRITE            (apb3Router_1_io_outputs_7_PWRITE                        ), //i
    .io_bus_PWDATA            (apb3Router_1_io_outputs_7_PWDATA[31:0]                  ), //i
    .io_bus_PRDATA            (peripherals_gpioStatusCtrl_io_bus_PRDATA[31:0]          ), //o
    .io_bus_PSLVERROR         (peripherals_gpioStatusCtrl_io_bus_PSLVERROR             ), //o
    .io_gpio_pins_read        (io_per_gpioStatus_pins_read[3:0]                        ), //i
    .io_gpio_pins_write       (peripherals_gpioStatusCtrl_io_gpio_pins_write[3:0]      ), //o
    .io_gpio_pins_writeEnable (peripherals_gpioStatusCtrl_io_gpio_pins_writeEnable[3:0]), //o
    .io_interrupt             (peripherals_gpioStatusCtrl_io_interrupt                 ), //o
    ._zz_1                    (clockCtrl__zz_3                                         ), //i
    ._zz_2                    (resetCtrl__zz_3                                         )  //i
  );
  Apb3Decoder io_apb_decoder (
    .io_input_PADDR      (system_apbBridge_io_apb_PADDR[19:0]  ), //i
    .io_input_PSEL       (system_apbBridge_io_apb_PSEL         ), //i
    .io_input_PENABLE    (system_apbBridge_io_apb_PENABLE      ), //i
    .io_input_PREADY     (io_apb_decoder_io_input_PREADY       ), //o
    .io_input_PWRITE     (system_apbBridge_io_apb_PWRITE       ), //i
    .io_input_PWDATA     (system_apbBridge_io_apb_PWDATA[31:0] ), //i
    .io_input_PRDATA     (io_apb_decoder_io_input_PRDATA[31:0] ), //o
    .io_input_PSLVERROR  (io_apb_decoder_io_input_PSLVERROR    ), //o
    .io_output_PADDR     (io_apb_decoder_io_output_PADDR[19:0] ), //o
    .io_output_PSEL      (io_apb_decoder_io_output_PSEL[7:0]   ), //o
    .io_output_PENABLE   (io_apb_decoder_io_output_PENABLE     ), //o
    .io_output_PREADY    (apb3Router_1_io_input_PREADY         ), //i
    .io_output_PWRITE    (io_apb_decoder_io_output_PWRITE      ), //o
    .io_output_PWDATA    (io_apb_decoder_io_output_PWDATA[31:0]), //o
    .io_output_PRDATA    (apb3Router_1_io_input_PRDATA[31:0]   ), //i
    .io_output_PSLVERROR (apb3Router_1_io_input_PSLVERROR      )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR         (io_apb_decoder_io_output_PADDR[19:0]           ), //i
    .io_input_PSEL          (io_apb_decoder_io_output_PSEL[7:0]             ), //i
    .io_input_PENABLE       (io_apb_decoder_io_output_PENABLE               ), //i
    .io_input_PREADY        (apb3Router_1_io_input_PREADY                   ), //o
    .io_input_PWRITE        (io_apb_decoder_io_output_PWRITE                ), //i
    .io_input_PWDATA        (io_apb_decoder_io_output_PWDATA[31:0]          ), //i
    .io_input_PRDATA        (apb3Router_1_io_input_PRDATA[31:0]             ), //o
    .io_input_PSLVERROR     (apb3Router_1_io_input_PSLVERROR                ), //o
    .io_outputs_0_PADDR     (apb3Router_1_io_outputs_0_PADDR[19:0]          ), //o
    .io_outputs_0_PSEL      (apb3Router_1_io_outputs_0_PSEL                 ), //o
    .io_outputs_0_PENABLE   (apb3Router_1_io_outputs_0_PENABLE              ), //o
    .io_outputs_0_PREADY    (system_plicCtrl_io_bus_PREADY                  ), //i
    .io_outputs_0_PWRITE    (apb3Router_1_io_outputs_0_PWRITE               ), //o
    .io_outputs_0_PWDATA    (apb3Router_1_io_outputs_0_PWDATA[31:0]         ), //o
    .io_outputs_0_PRDATA    (system_plicCtrl_io_bus_PRDATA[31:0]            ), //i
    .io_outputs_0_PSLVERROR (system_plicCtrl_io_bus_PSLVERROR               ), //i
    .io_outputs_1_PADDR     (apb3Router_1_io_outputs_1_PADDR[19:0]          ), //o
    .io_outputs_1_PSEL      (apb3Router_1_io_outputs_1_PSEL                 ), //o
    .io_outputs_1_PENABLE   (apb3Router_1_io_outputs_1_PENABLE              ), //o
    .io_outputs_1_PREADY    (system_mtimerCtrl_io_bus_PREADY                ), //i
    .io_outputs_1_PWRITE    (apb3Router_1_io_outputs_1_PWRITE               ), //o
    .io_outputs_1_PWDATA    (apb3Router_1_io_outputs_1_PWDATA[31:0]         ), //o
    .io_outputs_1_PRDATA    (system_mtimerCtrl_io_bus_PRDATA[31:0]          ), //i
    .io_outputs_1_PSLVERROR (system_mtimerCtrl_io_bus_PSLVERROR             ), //i
    .io_outputs_2_PADDR     (apb3Router_1_io_outputs_2_PADDR[19:0]          ), //o
    .io_outputs_2_PSEL      (apb3Router_1_io_outputs_2_PSEL                 ), //o
    .io_outputs_2_PENABLE   (apb3Router_1_io_outputs_2_PENABLE              ), //o
    .io_outputs_2_PREADY    (system_resetCtrlMapper_io_bus_PREADY           ), //i
    .io_outputs_2_PWRITE    (apb3Router_1_io_outputs_2_PWRITE               ), //o
    .io_outputs_2_PWDATA    (apb3Router_1_io_outputs_2_PWDATA[31:0]         ), //o
    .io_outputs_2_PRDATA    (system_resetCtrlMapper_io_bus_PRDATA[31:0]     ), //i
    .io_outputs_2_PSLVERROR (system_resetCtrlMapper_io_bus_PSLVERROR        ), //i
    .io_outputs_3_PADDR     (apb3Router_1_io_outputs_3_PADDR[19:0]          ), //o
    .io_outputs_3_PSEL      (apb3Router_1_io_outputs_3_PSEL                 ), //o
    .io_outputs_3_PENABLE   (apb3Router_1_io_outputs_3_PENABLE              ), //o
    .io_outputs_3_PREADY    (system_clockCtrlMapper_io_bus_PREADY           ), //i
    .io_outputs_3_PWRITE    (apb3Router_1_io_outputs_3_PWRITE               ), //o
    .io_outputs_3_PWDATA    (apb3Router_1_io_outputs_3_PWDATA[31:0]         ), //o
    .io_outputs_3_PRDATA    (system_clockCtrlMapper_io_bus_PRDATA[31:0]     ), //i
    .io_outputs_3_PSLVERROR (system_clockCtrlMapper_io_bus_PSLVERROR        ), //i
    .io_outputs_4_PADDR     (apb3Router_1_io_outputs_4_PADDR[19:0]          ), //o
    .io_outputs_4_PSEL      (apb3Router_1_io_outputs_4_PSEL                 ), //o
    .io_outputs_4_PENABLE   (apb3Router_1_io_outputs_4_PENABLE              ), //o
    .io_outputs_4_PREADY    (system_hyperbus_ctrl_io_bus_PREADY             ), //i
    .io_outputs_4_PWRITE    (apb3Router_1_io_outputs_4_PWRITE               ), //o
    .io_outputs_4_PWDATA    (apb3Router_1_io_outputs_4_PWDATA[31:0]         ), //o
    .io_outputs_4_PRDATA    (system_hyperbus_ctrl_io_bus_PRDATA[31:0]       ), //i
    .io_outputs_4_PSLVERROR (system_hyperbus_ctrl_io_bus_PSLVERROR          ), //i
    .io_outputs_5_PADDR     (apb3Router_1_io_outputs_5_PADDR[19:0]          ), //o
    .io_outputs_5_PSEL      (apb3Router_1_io_outputs_5_PSEL                 ), //o
    .io_outputs_5_PENABLE   (apb3Router_1_io_outputs_5_PENABLE              ), //o
    .io_outputs_5_PREADY    (system_spiXipControllerCtrl_io_bus_PREADY      ), //i
    .io_outputs_5_PWRITE    (apb3Router_1_io_outputs_5_PWRITE               ), //o
    .io_outputs_5_PWDATA    (apb3Router_1_io_outputs_5_PWDATA[31:0]         ), //o
    .io_outputs_5_PRDATA    (system_spiXipControllerCtrl_io_bus_PRDATA[31:0]), //i
    .io_outputs_5_PSLVERROR (system_spiXipControllerCtrl_io_bus_PSLVERROR   ), //i
    .io_outputs_6_PADDR     (apb3Router_1_io_outputs_6_PADDR[19:0]          ), //o
    .io_outputs_6_PSEL      (apb3Router_1_io_outputs_6_PSEL                 ), //o
    .io_outputs_6_PENABLE   (apb3Router_1_io_outputs_6_PENABLE              ), //o
    .io_outputs_6_PREADY    (peripherals_uartStdCtrl_io_bus_PREADY          ), //i
    .io_outputs_6_PWRITE    (apb3Router_1_io_outputs_6_PWRITE               ), //o
    .io_outputs_6_PWDATA    (apb3Router_1_io_outputs_6_PWDATA[31:0]         ), //o
    .io_outputs_6_PRDATA    (peripherals_uartStdCtrl_io_bus_PRDATA[31:0]    ), //i
    .io_outputs_6_PSLVERROR (peripherals_uartStdCtrl_io_bus_PSLVERROR       ), //i
    .io_outputs_7_PADDR     (apb3Router_1_io_outputs_7_PADDR[19:0]          ), //o
    .io_outputs_7_PSEL      (apb3Router_1_io_outputs_7_PSEL                 ), //o
    .io_outputs_7_PENABLE   (apb3Router_1_io_outputs_7_PENABLE              ), //o
    .io_outputs_7_PREADY    (peripherals_gpioStatusCtrl_io_bus_PREADY       ), //i
    .io_outputs_7_PWRITE    (apb3Router_1_io_outputs_7_PWRITE               ), //o
    .io_outputs_7_PWDATA    (apb3Router_1_io_outputs_7_PWDATA[31:0]         ), //o
    .io_outputs_7_PRDATA    (peripherals_gpioStatusCtrl_io_bus_PRDATA[31:0] ), //i
    .io_outputs_7_PSLVERROR (peripherals_gpioStatusCtrl_io_bus_PSLVERROR    ), //i
    ._zz_1                  (clockCtrl__zz_3                                ), //i
    ._zz_2                  (resetCtrl__zz_3                                )  //i
  );
  always @(*) begin
    resetCtrl_io_trigger = 2'b00;
    if(soc_system_core_cpu_debug_resetOut_regNext) begin
      resetCtrl_io_trigger[0] = 1'b1;
    end
  end

  always @(*) begin
    resetCtrl_io_buildConnection_resets[0] = io_plat_reset;
    resetCtrl_io_buildConnection_resets[1] = io_plat_reset;
  end

  always @(*) begin
    clockCtrl_io_buildConnection_clocks[0] = io_plat_clock;
    clockCtrl_io_buildConnection_clocks[1] = io_plat_clock;
  end

  assign system_core_cpu_iBus_rsp_payload_error = (! (axi4ReadOnlyDecoder_1_io_input_r_payload_resp == 2'b00));
  assign soc_system_core_cpu_dBus_cmd_fire = (system_core_cpu_dBus_cmd_valid && system_core_cpu_dBus_cmd_ready);
  assign when_Utils_l694 = (soc_system_core_cpu_dBus_cmd_fire && system_core_cpu_dBus_cmd_payload_wr);
  always @(*) begin
    _zz_when_Utils_l723 = 1'b0;
    if(when_Utils_l694) begin
      _zz_when_Utils_l723 = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_Utils_l723_1 = 1'b0;
    if((soc_axi4SharedDecoder_1_io_input_b_s2mPipe_m2sPipe_valid && 1'b1)) begin
      _zz_when_Utils_l723_1 = 1'b1;
    end
  end

  assign when_Utils_l723 = (_zz_when_Utils_l723 && (! _zz_when_Utils_l723_1));
  always @(*) begin
    if(when_Utils_l723) begin
      _zz_dBus_cmd_ready_1 = 3'b001;
    end else begin
      if(when_Utils_l725) begin
        _zz_dBus_cmd_ready_1 = 3'b111;
      end else begin
        _zz_dBus_cmd_ready_1 = 3'b000;
      end
    end
  end

  assign when_Utils_l725 = ((! _zz_when_Utils_l723) && _zz_when_Utils_l723_1);
  assign _zz_dBus_cmd_ready_2 = (! ((((_zz_dBus_cmd_ready != 3'b000) && system_core_cpu_dBus_cmd_valid) && (! system_core_cpu_dBus_cmd_payload_wr)) || (_zz_dBus_cmd_ready == 3'b111)));
  assign _zz_when_Stream_l369_2 = (system_core_cpu_dBus_cmd_valid && _zz_dBus_cmd_ready_2);
  assign system_core_cpu_dBus_cmd_ready = (_zz_dBus_cmd_ready_3 && _zz_dBus_cmd_ready_2);
  assign _zz_when_Stream_l439 = system_core_cpu_dBus_cmd_payload_wr;
  assign _zz_io_input_arw_payload_addr_1 = system_core_cpu_dBus_cmd_payload_address;
  assign _zz_io_input_arw_payload_size_1 = system_core_cpu_dBus_cmd_payload_size;
  always @(*) begin
    _zz_dBus_cmd_ready_3 = 1'b1;
    if(when_Stream_l1020) begin
      _zz_dBus_cmd_ready_3 = 1'b0;
    end
    if(when_Stream_l1020_1) begin
      _zz_dBus_cmd_ready_3 = 1'b0;
    end
  end

  assign when_Stream_l1020 = ((! _zz_when_Stream_l1020_2) && _zz_when_Stream_l1020_4);
  assign when_Stream_l1020_1 = ((! _zz_when_Stream_l1020_3) && _zz_when_Stream_l1020_5);
  assign _zz_when_Stream_l369_3 = (_zz_when_Stream_l369_2 && _zz_when_Stream_l1020_4);
  assign _zz_when_Stream_l369_4 = (_zz_when_Stream_l369_2 && _zz_when_Stream_l1020_5);
  assign _zz_when_Stream_l369 = _zz_when_Stream_l369_3;
  assign _zz_when_Stream_l1020_2 = _zz_when_Stream_l1020;
  assign _zz_io_input_arw_payload_write = _zz_when_Stream_l439;
  assign _zz_io_input_arw_payload_size = {1'd0, _zz_io_input_arw_payload_size_1};
  assign _zz_io_input_arw_payload_addr = _zz_io_input_arw_payload_addr_1;
  assign when_Stream_l439 = (! _zz_when_Stream_l439);
  always @(*) begin
    _zz_when_Stream_l369_5 = _zz_when_Stream_l369_4;
    if(when_Stream_l439) begin
      _zz_when_Stream_l369_5 = 1'b0;
    end
  end

  always @(*) begin
    _zz_when_Stream_l1020_3 = _zz_when_Stream_l1020_1;
    if(when_Stream_l439) begin
      _zz_when_Stream_l1020_3 = 1'b1;
    end
  end

  assign _zz_when_Stream_l369_1 = _zz_when_Stream_l369_5;
  assign _zz_io_input_w_payload_data = system_core_cpu_dBus_cmd_payload_data;
  always @(*) begin
    case(_zz_io_input_arw_payload_size_1)
      2'b00 : begin
        _zz_io_input_w_payload_strb_1 = 4'b0001;
      end
      2'b01 : begin
        _zz_io_input_w_payload_strb_1 = 4'b0011;
      end
      default : begin
        _zz_io_input_w_payload_strb_1 = 4'b1111;
      end
    endcase
  end

  assign _zz_io_input_w_payload_strb = (_zz_io_input_w_payload_strb_1 <<< _zz_io_input_arw_payload_addr_1[1 : 0]);
  assign system_core_cpu_dBus_rsp_error = (! (soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_payload_resp == 2'b00));
  assign system_core_cpu_debug_bus_cmd_payload_address = systemDebugger_1_io_mem_cmd_payload_address[7:0];
  assign soc_system_core_cpu_debug_bus_cmd_fire = (systemDebugger_1_io_mem_cmd_valid && system_core_cpu_debug_bus_cmd_ready);
  assign io_plat_jtag_tdo = jtagBridge_1_io_jtag_tdo;
  assign io_plat_hyperbus_cs = system_hyperbus_phy_io_hyperbus_cs;
  assign io_plat_hyperbus_ck = system_hyperbus_phy_io_hyperbus_ck;
  assign io_plat_hyperbus_reset = system_hyperbus_phy_io_hyperbus_reset;
  assign io_plat_hyperbus_dq_write = system_hyperbus_phy_io_hyperbus_dq_write;
  assign io_plat_hyperbus_dq_writeEnable = system_hyperbus_phy_io_hyperbus_dq_writeEnable;
  assign io_plat_hyperbus_rwds_write = system_hyperbus_phy_io_hyperbus_rwds_write;
  assign io_plat_hyperbus_rwds_writeEnable = system_hyperbus_phy_io_hyperbus_rwds_writeEnable;
  assign io_plat_spi_cs = system_spiXipControllerCtrl_io_spi_cs;
  assign io_plat_spi_sclk = system_spiXipControllerCtrl_io_spi_sclk;
  assign io_plat_spi_dq_write = system_spiXipControllerCtrl_io_spi_dq_write;
  assign io_plat_spi_dq_writeEnable = system_spiXipControllerCtrl_io_spi_dq_writeEnable;
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_fire = (soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_valid && soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_ready);
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_valid = soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_rValid;
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_payload_addr = axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_addr;
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_payload_cache = axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_cache;
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_payload_prot = axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_prot;
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_ready = system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_ready;
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_fire = (soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_valid && soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_ready);
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_valid = soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_rValid;
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_payload_addr = axi4ReadOnlyDecoder_1_io_outputs_1_ar_payload_addr;
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_payload_cache = axi4ReadOnlyDecoder_1_io_outputs_1_ar_payload_cache;
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_payload_prot = axi4ReadOnlyDecoder_1_io_outputs_1_ar_payload_prot;
  assign soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_ready = system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_ready;
  assign axi4ReadOnlyDecoder_1_io_input_ar_payload_addr = {system_core_cpu_iBus_cmd_payload_pc[31 : 2],2'b00};
  assign axi4ReadOnlyDecoder_1_io_input_ar_payload_cache = 4'b1111;
  assign axi4ReadOnlyDecoder_1_io_input_ar_payload_prot = 3'b110;
  assign axi4ReadOnlyDecoder_1_io_input_r_ready = 1'b1;
  assign soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_fire = (soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_valid && soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_ready);
  assign soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_valid = soc_axi4SharedDecoder_1_io_readOutputs_0_ar_rValid;
  assign soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_addr = axi4SharedDecoder_1_io_readOutputs_0_ar_payload_addr;
  assign soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_size = axi4SharedDecoder_1_io_readOutputs_0_ar_payload_size;
  assign soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_cache = axi4SharedDecoder_1_io_readOutputs_0_ar_payload_cache;
  assign soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_prot = axi4SharedDecoder_1_io_readOutputs_0_ar_payload_prot;
  assign soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_ready = system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_ready;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_fire = (soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_valid && soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_ready);
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_valid = soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_rValid;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_addr = axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_addr;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_size = axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_size;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_cache = axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_cache;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_prot = axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_prot;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_payload_write = axi4SharedDecoder_1_io_sharedOutputs_0_arw_payload_write;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_ready = system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_ready;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_fire = (soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_valid && soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_ready);
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_valid = soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_rValid;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_addr = axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_addr;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_size = axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_size;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_cache = axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_cache;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_prot = axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_prot;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_write = axi4SharedDecoder_1_io_sharedOutputs_1_arw_payload_write;
  assign soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_ready = system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign _zz_when_Stream_l1020 = _zz_io_input_arw_payload_addr_2;
  always @(*) begin
    _zz_1 = axi4SharedDecoder_1_io_input_arw_ready;
    if(when_Stream_l369) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l369 = (! _zz_when_Stream_l369_6);
  assign _zz_when_Stream_l369_6 = _zz_when_Stream_l369_7;
  assign _zz_when_Stream_l1020_1 = _zz_io_input_w_payload_data_1;
  always @(*) begin
    _zz_2 = axi4SharedDecoder_1_io_input_w_ready;
    if(when_Stream_l369_1) begin
      _zz_2 = 1'b1;
    end
  end

  assign when_Stream_l369_1 = (! _zz_when_Stream_l369_8);
  assign _zz_when_Stream_l369_8 = _zz_when_Stream_l369_9;
  assign soc_axi4SharedDecoder_1_io_input_b_s2mPipe_valid = (axi4SharedDecoder_1_io_input_b_valid || (! soc_axi4SharedDecoder_1_io_input_b_rValidN));
  assign soc_axi4SharedDecoder_1_io_input_b_s2mPipe_payload_resp = (soc_axi4SharedDecoder_1_io_input_b_rValidN ? axi4SharedDecoder_1_io_input_b_payload_resp : soc_axi4SharedDecoder_1_io_input_b_rData_resp);
  always @(*) begin
    soc_axi4SharedDecoder_1_io_input_b_s2mPipe_ready = soc_axi4SharedDecoder_1_io_input_b_s2mPipe_m2sPipe_ready;
    if(when_Stream_l369_2) begin
      soc_axi4SharedDecoder_1_io_input_b_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l369_2 = (! soc_axi4SharedDecoder_1_io_input_b_s2mPipe_m2sPipe_valid);
  assign soc_axi4SharedDecoder_1_io_input_b_s2mPipe_m2sPipe_valid = soc_axi4SharedDecoder_1_io_input_b_s2mPipe_rValid;
  assign soc_axi4SharedDecoder_1_io_input_b_s2mPipe_m2sPipe_payload_resp = soc_axi4SharedDecoder_1_io_input_b_s2mPipe_rData_resp;
  assign soc_axi4SharedDecoder_1_io_input_b_s2mPipe_m2sPipe_ready = 1'b1;
  assign soc_axi4SharedDecoder_1_io_input_r_s2mPipe_valid = (axi4SharedDecoder_1_io_input_r_valid || (! soc_axi4SharedDecoder_1_io_input_r_rValidN));
  assign soc_axi4SharedDecoder_1_io_input_r_s2mPipe_payload_data = (soc_axi4SharedDecoder_1_io_input_r_rValidN ? axi4SharedDecoder_1_io_input_r_payload_data : soc_axi4SharedDecoder_1_io_input_r_rData_data);
  assign soc_axi4SharedDecoder_1_io_input_r_s2mPipe_payload_resp = (soc_axi4SharedDecoder_1_io_input_r_rValidN ? axi4SharedDecoder_1_io_input_r_payload_resp : soc_axi4SharedDecoder_1_io_input_r_rData_resp);
  assign soc_axi4SharedDecoder_1_io_input_r_s2mPipe_payload_last = (soc_axi4SharedDecoder_1_io_input_r_rValidN ? axi4SharedDecoder_1_io_input_r_payload_last : soc_axi4SharedDecoder_1_io_input_r_rData_last);
  always @(*) begin
    soc_axi4SharedDecoder_1_io_input_r_s2mPipe_ready = soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_ready;
    if(when_Stream_l369_3) begin
      soc_axi4SharedDecoder_1_io_input_r_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l369_3 = (! soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_valid);
  assign soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_valid = soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rValid;
  assign soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_payload_data = soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rData_data;
  assign soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_payload_resp = soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rData_resp;
  assign soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_payload_last = soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rData_last;
  assign soc_axi4SharedDecoder_1_io_input_r_s2mPipe_m2sPipe_ready = 1'b1;
  assign _zz_io_readInputs_0_ar_payload_id[2 : 0] = 3'b000;
  assign _zz_io_readInputs_0_ar_payload_region[3 : 0] = 4'b0000;
  assign _zz_io_readInputs_0_ar_payload_len[7 : 0] = 8'h00;
  assign system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_size = 3'b010;
  assign system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_burst = 2'b01;
  assign system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_lock = 1'b0;
  assign system_hyperbus_ctrl_io_memory_arbiter_io_readInputs_0_ar_payload_qos = 4'b0000;
  assign _zz_io_sharedInputs_0_arw_payload_id[2 : 0] = 3'b000;
  assign _zz_io_sharedInputs_0_arw_payload_region[3 : 0] = 4'b0000;
  assign _zz_io_sharedInputs_0_arw_payload_len[7 : 0] = 8'h00;
  assign system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_payload_burst = 2'b01;
  assign system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_payload_lock = 1'b0;
  assign system_hyperbus_ctrl_io_memory_arbiter_io_sharedInputs_0_arw_payload_qos = 4'b0000;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_valid = (system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_valid || (! soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN));
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_addr = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_addr : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_addr);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_id = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_id : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_id);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_region = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_region : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_region);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_len = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_len : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_len);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_size = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_size : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_size);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_burst = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_burst : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_burst);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_lock = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_lock : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_lock);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_cache = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_cache : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_cache);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_qos = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_qos : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_qos);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_prot = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_prot : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_prot);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_write = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_write : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_write);
  always @(*) begin
    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_ready = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_ready;
    if(when_Stream_l369_4) begin
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l369_4 = (! soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_valid);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_valid = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rValid;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_addr = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_addr;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_id = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_id;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_region = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_region;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_len = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_len;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_size = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_size;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_burst = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_burst;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_lock = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_lock;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_cache = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_cache;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_qos = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_qos;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_prot = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_prot;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_payload_write = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_write;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_m2sPipe_ready = system_hyperbus_ctrl_io_memory_arw_ready;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_valid = (system_hyperbus_ctrl_io_memory_arbiter_io_output_w_valid || (! soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rValidN));
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_payload_data = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_data : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rData_data);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_payload_strb = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_strb : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rData_strb);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_payload_last = (soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rValidN ? system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_last : soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rData_last);
  always @(*) begin
    soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_ready = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_ready;
    if(when_Stream_l369_5) begin
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l369_5 = (! soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_valid);
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_valid = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rValid;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rData_data;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rData_strb;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last = soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rData_last;
  assign soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_m2sPipe_ready = system_hyperbus_ctrl_io_memory_w_ready;
  assign soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_valid = (system_hyperbus_ctrl_io_memory_b_valid || (! soc_system_hyperbus_ctrl_io_memory_b_rValidN));
  assign soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_payload_id = (soc_system_hyperbus_ctrl_io_memory_b_rValidN ? system_hyperbus_ctrl_io_memory_b_payload_id : soc_system_hyperbus_ctrl_io_memory_b_rData_id);
  assign soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_payload_resp = (soc_system_hyperbus_ctrl_io_memory_b_rValidN ? system_hyperbus_ctrl_io_memory_b_payload_resp : soc_system_hyperbus_ctrl_io_memory_b_rData_resp);
  always @(*) begin
    soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_ready = soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_ready;
    if(when_Stream_l369_6) begin
      soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l369_6 = (! soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_valid);
  assign soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_valid = soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_rValid;
  assign soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_payload_id = soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_rData_id;
  assign soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_payload_resp = soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_rData_resp;
  assign soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_m2sPipe_ready = system_hyperbus_ctrl_io_memory_arbiter_io_output_b_ready;
  assign soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_valid = (system_hyperbus_ctrl_io_memory_r_valid || (! soc_system_hyperbus_ctrl_io_memory_r_rValidN));
  assign soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_data = (soc_system_hyperbus_ctrl_io_memory_r_rValidN ? system_hyperbus_ctrl_io_memory_r_payload_data : soc_system_hyperbus_ctrl_io_memory_r_rData_data);
  assign soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_id = (soc_system_hyperbus_ctrl_io_memory_r_rValidN ? system_hyperbus_ctrl_io_memory_r_payload_id : soc_system_hyperbus_ctrl_io_memory_r_rData_id);
  assign soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_resp = (soc_system_hyperbus_ctrl_io_memory_r_rValidN ? system_hyperbus_ctrl_io_memory_r_payload_resp : soc_system_hyperbus_ctrl_io_memory_r_rData_resp);
  assign soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_last = (soc_system_hyperbus_ctrl_io_memory_r_rValidN ? system_hyperbus_ctrl_io_memory_r_payload_last : soc_system_hyperbus_ctrl_io_memory_r_rData_last);
  always @(*) begin
    soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_ready = soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_ready;
    if(when_Stream_l369_7) begin
      soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l369_7 = (! soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_valid);
  assign soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_valid = soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rValid;
  assign soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_data = soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_data;
  assign soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_id = soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_id;
  assign soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_resp = soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_resp;
  assign soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_payload_last = soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_last;
  assign soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_m2sPipe_ready = system_hyperbus_ctrl_io_memory_arbiter_io_output_r_ready;
  assign system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_addr = soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_payload_addr[19:0];
  assign _zz_io_inputs_0_ar_payload_id[2 : 0] = 3'b000;
  assign _zz_io_inputs_0_ar_payload_region[3 : 0] = 4'b0000;
  assign _zz_io_inputs_0_ar_payload_len[7 : 0] = 8'h00;
  assign system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_size = 3'b010;
  assign system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_burst = 2'b01;
  assign system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_lock = 1'b0;
  assign system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_0_ar_payload_qos = 4'b0000;
  assign system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_addr = soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_payload_addr[19:0];
  assign _zz_io_inputs_1_ar_payload_id[2 : 0] = 3'b000;
  assign _zz_io_inputs_1_ar_payload_region[3 : 0] = 4'b0000;
  assign _zz_io_inputs_1_ar_payload_len[7 : 0] = 8'h00;
  assign system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_burst = 2'b01;
  assign system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_lock = 1'b0;
  assign system_spiXipControllerCtrl_io_dataBus_arbiter_io_inputs_1_ar_payload_qos = 4'b0000;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_valid = (system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_valid || (! soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN));
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_addr = (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN ? system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_addr : soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_addr);
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_id = (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN ? system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_id : soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_id);
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_region = (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN ? system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_region : soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_region);
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_len = (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN ? system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_len : soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_len);
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_size = (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN ? system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_size : soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_size);
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_burst = (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN ? system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_burst : soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_burst);
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_lock = (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN ? system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_lock : soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_lock);
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_cache = (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN ? system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_cache : soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_cache);
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_qos = (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN ? system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_qos : soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_qos);
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_prot = (soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN ? system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_prot : soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_prot);
  always @(*) begin
    soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_ready = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_ready;
    if(when_Stream_l369_8) begin
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l369_8 = (! soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_valid);
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_valid = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rValid;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_addr = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_addr;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_id = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_id;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_region = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_region;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_len = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_len;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_size = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_size;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_burst = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_burst;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_lock = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_lock;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_cache = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_cache;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_qos = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_qos;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_payload_prot = soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_prot;
  assign soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_m2sPipe_ready = system_spiXipControllerCtrl_io_dataBus_ar_ready;
  assign soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_valid = (system_spiXipControllerCtrl_io_dataBus_r_valid || (! soc_system_spiXipControllerCtrl_io_dataBus_r_rValidN));
  assign soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_data = (soc_system_spiXipControllerCtrl_io_dataBus_r_rValidN ? system_spiXipControllerCtrl_io_dataBus_r_payload_data : soc_system_spiXipControllerCtrl_io_dataBus_r_rData_data);
  assign soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_id = (soc_system_spiXipControllerCtrl_io_dataBus_r_rValidN ? system_spiXipControllerCtrl_io_dataBus_r_payload_id : soc_system_spiXipControllerCtrl_io_dataBus_r_rData_id);
  assign soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_resp = (soc_system_spiXipControllerCtrl_io_dataBus_r_rValidN ? system_spiXipControllerCtrl_io_dataBus_r_payload_resp : soc_system_spiXipControllerCtrl_io_dataBus_r_rData_resp);
  assign soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_last = (soc_system_spiXipControllerCtrl_io_dataBus_r_rValidN ? system_spiXipControllerCtrl_io_dataBus_r_payload_last : soc_system_spiXipControllerCtrl_io_dataBus_r_rData_last);
  always @(*) begin
    soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_ready = soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_ready;
    if(when_Stream_l369_9) begin
      soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l369_9 = (! soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_valid);
  assign soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_valid = soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rValid;
  assign soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_data = soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_data;
  assign soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_id = soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_id;
  assign soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_resp = soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_resp;
  assign soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_payload_last = soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_last;
  assign soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_m2sPipe_ready = system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_r_ready;
  assign system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr = soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_payload_addr[19:0];
  assign _zz_io_sharedInputs_0_arw_payload_id_1[3 : 0] = 4'b0000;
  assign _zz_io_sharedInputs_0_arw_payload_len_1[7 : 0] = 8'h00;
  assign system_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_payload_burst = 2'b01;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_fire = (soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid && soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready);
  assign system_apbBridge_io_axi_arbiter_io_output_arw_ready = (! soc_system_apbBridge_io_axi_arbiter_io_output_arw_rValid);
  assign soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid = soc_system_apbBridge_io_axi_arbiter_io_output_arw_rValid;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr = soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_addr;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id = soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_id;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len = soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_len;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size = soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_size;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst = soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_burst;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write = soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_write;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready = system_apbBridge_io_axi_arw_ready;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_fire = (soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid && soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready);
  assign system_apbBridge_io_axi_arbiter_io_output_w_ready = (! soc_system_apbBridge_io_axi_arbiter_io_output_w_rValid);
  assign soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid = soc_system_apbBridge_io_axi_arbiter_io_output_w_rValid;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data = soc_system_apbBridge_io_axi_arbiter_io_output_w_rData_data;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb = soc_system_apbBridge_io_axi_arbiter_io_output_w_rData_strb;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last = soc_system_apbBridge_io_axi_arbiter_io_output_w_rData_last;
  assign soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready = system_apbBridge_io_axi_w_ready;
  assign system_core_globalInterrupt = system_plicCtrl_io_interrupt;
  assign system_core_mtimerInterrupt = system_mtimerCtrl_io_interrupt;
  assign io_per_uartStd_txd = peripherals_uartStdCtrl_io_uart_txd;
  assign io_per_uartStd_rts = peripherals_uartStdCtrl_io_uart_rts;
  assign io_per_gpioStatus_pins_write = peripherals_gpioStatusCtrl_io_gpio_pins_write;
  assign io_per_gpioStatus_pins_writeEnable = peripherals_gpioStatusCtrl_io_gpio_pins_writeEnable;
  assign system_plicCtrl_io_bus_PADDR = apb3Router_1_io_outputs_0_PADDR[15:0];
  assign system_mtimerCtrl_io_bus_PADDR = apb3Router_1_io_outputs_1_PADDR[11:0];
  assign system_resetCtrlMapper_io_bus_PADDR = apb3Router_1_io_outputs_2_PADDR[11:0];
  assign system_clockCtrlMapper_io_bus_PADDR = apb3Router_1_io_outputs_3_PADDR[11:0];
  assign system_hyperbus_ctrl_io_bus_PADDR = apb3Router_1_io_outputs_4_PADDR[11:0];
  assign system_spiXipControllerCtrl_io_bus_PADDR = apb3Router_1_io_outputs_5_PADDR[11:0];
  assign peripherals_uartStdCtrl_io_bus_PADDR = apb3Router_1_io_outputs_6_PADDR[11:0];
  assign peripherals_gpioStatusCtrl_io_bus_PADDR = apb3Router_1_io_outputs_7_PADDR[11:0];
  always @(*) begin
    system_plicCtrl_io_sources[0] = 1'b0;
    system_plicCtrl_io_sources[1] = peripherals_uartStdCtrl_io_interrupt;
    system_plicCtrl_io_sources[2] = peripherals_gpioStatusCtrl_io_interrupt;
  end

  assign system_core_cpu_softwareInterrupt = 1'b0;
  always @(posedge clockCtrl__zz_3) begin
    if(!resetCtrl__zz_3) begin
      _zz_dBus_cmd_ready <= 3'b000;
      _zz_when_Stream_l1020_4 <= 1'b1;
      _zz_when_Stream_l1020_5 <= 1'b1;
      soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_rValid <= 1'b0;
      soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_rValid <= 1'b0;
      soc_axi4SharedDecoder_1_io_readOutputs_0_ar_rValid <= 1'b0;
      soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_rValid <= 1'b0;
      soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_rValid <= 1'b0;
      _zz_io_input_arw_payload_addr_2 <= 1'b1;
      _zz_when_Stream_l369_7 <= 1'b0;
      _zz_io_input_w_payload_data_1 <= 1'b1;
      _zz_when_Stream_l369_9 <= 1'b0;
      soc_axi4SharedDecoder_1_io_input_b_rValidN <= 1'b1;
      soc_axi4SharedDecoder_1_io_input_b_s2mPipe_rValid <= 1'b0;
      soc_axi4SharedDecoder_1_io_input_r_rValidN <= 1'b1;
      soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rValid <= 1'b0;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN <= 1'b1;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rValid <= 1'b0;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rValidN <= 1'b1;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rValid <= 1'b0;
      soc_system_hyperbus_ctrl_io_memory_b_rValidN <= 1'b1;
      soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_rValid <= 1'b0;
      soc_system_hyperbus_ctrl_io_memory_r_rValidN <= 1'b1;
      soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rValid <= 1'b0;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN <= 1'b1;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rValid <= 1'b0;
      soc_system_spiXipControllerCtrl_io_dataBus_r_rValidN <= 1'b1;
      soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rValid <= 1'b0;
      soc_system_apbBridge_io_axi_arbiter_io_output_arw_rValid <= 1'b0;
      soc_system_apbBridge_io_axi_arbiter_io_output_w_rValid <= 1'b0;
    end else begin
      _zz_dBus_cmd_ready <= (_zz_dBus_cmd_ready + _zz_dBus_cmd_ready_1);
      if((_zz_when_Stream_l369_3 && _zz_when_Stream_l1020_2)) begin
        _zz_when_Stream_l1020_4 <= 1'b0;
      end
      if((_zz_when_Stream_l369_4 && _zz_when_Stream_l1020_3)) begin
        _zz_when_Stream_l1020_5 <= 1'b0;
      end
      if(_zz_dBus_cmd_ready_3) begin
        _zz_when_Stream_l1020_4 <= 1'b1;
        _zz_when_Stream_l1020_5 <= 1'b1;
      end
      if(axi4ReadOnlyDecoder_1_io_outputs_0_ar_valid) begin
        soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_rValid <= 1'b1;
      end
      if(soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_validPipe_fire) begin
        soc_axi4ReadOnlyDecoder_1_io_outputs_0_ar_rValid <= 1'b0;
      end
      if(axi4ReadOnlyDecoder_1_io_outputs_1_ar_valid) begin
        soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_rValid <= 1'b1;
      end
      if(soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_validPipe_fire) begin
        soc_axi4ReadOnlyDecoder_1_io_outputs_1_ar_rValid <= 1'b0;
      end
      if(axi4SharedDecoder_1_io_readOutputs_0_ar_valid) begin
        soc_axi4SharedDecoder_1_io_readOutputs_0_ar_rValid <= 1'b1;
      end
      if(soc_axi4SharedDecoder_1_io_readOutputs_0_ar_validPipe_fire) begin
        soc_axi4SharedDecoder_1_io_readOutputs_0_ar_rValid <= 1'b0;
      end
      if(axi4SharedDecoder_1_io_sharedOutputs_0_arw_valid) begin
        soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_rValid <= 1'b1;
      end
      if(soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_validPipe_fire) begin
        soc_axi4SharedDecoder_1_io_sharedOutputs_0_arw_rValid <= 1'b0;
      end
      if(axi4SharedDecoder_1_io_sharedOutputs_1_arw_valid) begin
        soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_rValid <= 1'b1;
      end
      if(soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_validPipe_fire) begin
        soc_axi4SharedDecoder_1_io_sharedOutputs_1_arw_rValid <= 1'b0;
      end
      if(_zz_when_Stream_l369) begin
        _zz_io_input_arw_payload_addr_2 <= 1'b0;
      end
      if(_zz_1) begin
        _zz_io_input_arw_payload_addr_2 <= 1'b1;
      end
      if(_zz_1) begin
        _zz_when_Stream_l369_7 <= (_zz_when_Stream_l369 || (! _zz_io_input_arw_payload_addr_2));
      end
      if(_zz_when_Stream_l369_1) begin
        _zz_io_input_w_payload_data_1 <= 1'b0;
      end
      if(_zz_2) begin
        _zz_io_input_w_payload_data_1 <= 1'b1;
      end
      if(_zz_2) begin
        _zz_when_Stream_l369_9 <= (_zz_when_Stream_l369_1 || (! _zz_io_input_w_payload_data_1));
      end
      if(axi4SharedDecoder_1_io_input_b_valid) begin
        soc_axi4SharedDecoder_1_io_input_b_rValidN <= 1'b0;
      end
      if(soc_axi4SharedDecoder_1_io_input_b_s2mPipe_ready) begin
        soc_axi4SharedDecoder_1_io_input_b_rValidN <= 1'b1;
      end
      if(soc_axi4SharedDecoder_1_io_input_b_s2mPipe_ready) begin
        soc_axi4SharedDecoder_1_io_input_b_s2mPipe_rValid <= soc_axi4SharedDecoder_1_io_input_b_s2mPipe_valid;
      end
      if(axi4SharedDecoder_1_io_input_r_valid) begin
        soc_axi4SharedDecoder_1_io_input_r_rValidN <= 1'b0;
      end
      if(soc_axi4SharedDecoder_1_io_input_r_s2mPipe_ready) begin
        soc_axi4SharedDecoder_1_io_input_r_rValidN <= 1'b1;
      end
      if(soc_axi4SharedDecoder_1_io_input_r_s2mPipe_ready) begin
        soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rValid <= soc_axi4SharedDecoder_1_io_input_r_s2mPipe_valid;
      end
      if(system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_valid) begin
        soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN <= 1'b0;
      end
      if(soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_ready) begin
        soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN <= 1'b1;
      end
      if(soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_ready) begin
        soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rValid <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_valid;
      end
      if(system_hyperbus_ctrl_io_memory_arbiter_io_output_w_valid) begin
        soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rValidN <= 1'b0;
      end
      if(soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_ready) begin
        soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rValidN <= 1'b1;
      end
      if(soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_ready) begin
        soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rValid <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_valid;
      end
      if(system_hyperbus_ctrl_io_memory_b_valid) begin
        soc_system_hyperbus_ctrl_io_memory_b_rValidN <= 1'b0;
      end
      if(soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_ready) begin
        soc_system_hyperbus_ctrl_io_memory_b_rValidN <= 1'b1;
      end
      if(soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_ready) begin
        soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_rValid <= soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_valid;
      end
      if(system_hyperbus_ctrl_io_memory_r_valid) begin
        soc_system_hyperbus_ctrl_io_memory_r_rValidN <= 1'b0;
      end
      if(soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_ready) begin
        soc_system_hyperbus_ctrl_io_memory_r_rValidN <= 1'b1;
      end
      if(soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_ready) begin
        soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rValid <= soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_valid;
      end
      if(system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_valid) begin
        soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN <= 1'b0;
      end
      if(soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_ready) begin
        soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN <= 1'b1;
      end
      if(soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_ready) begin
        soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rValid <= soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_valid;
      end
      if(system_spiXipControllerCtrl_io_dataBus_r_valid) begin
        soc_system_spiXipControllerCtrl_io_dataBus_r_rValidN <= 1'b0;
      end
      if(soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_ready) begin
        soc_system_spiXipControllerCtrl_io_dataBus_r_rValidN <= 1'b1;
      end
      if(soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_ready) begin
        soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rValid <= soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_valid;
      end
      if(system_apbBridge_io_axi_arbiter_io_output_arw_valid) begin
        soc_system_apbBridge_io_axi_arbiter_io_output_arw_rValid <= 1'b1;
      end
      if(soc_system_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_fire) begin
        soc_system_apbBridge_io_axi_arbiter_io_output_arw_rValid <= 1'b0;
      end
      if(system_apbBridge_io_axi_arbiter_io_output_w_valid) begin
        soc_system_apbBridge_io_axi_arbiter_io_output_w_rValid <= 1'b1;
      end
      if(soc_system_apbBridge_io_axi_arbiter_io_output_w_halfPipe_fire) begin
        soc_system_apbBridge_io_axi_arbiter_io_output_w_rValid <= 1'b0;
      end
    end
  end

  always @(posedge clockCtrl__zz_4) begin
    soc_system_core_cpu_debug_resetOut_regNext <= system_core_cpu_debug_resetOut;
  end

  always @(posedge clockCtrl__zz_4) begin
    if(!resetCtrl__zz_4) begin
      soc_system_core_cpu_debug_bus_cmd_fire_regNext <= 1'b0;
    end else begin
      soc_system_core_cpu_debug_bus_cmd_fire_regNext <= soc_system_core_cpu_debug_bus_cmd_fire;
    end
  end

  always @(posedge clockCtrl__zz_3) begin
    if(_zz_when_Stream_l1020) begin
      _zz_io_input_arw_payload_addr_3 <= _zz_io_input_arw_payload_addr;
      _zz_io_input_arw_payload_size_2 <= _zz_io_input_arw_payload_size;
      _zz_io_input_arw_payload_cache <= 4'b1111;
      _zz_io_input_arw_payload_prot <= 3'b010;
      _zz_io_input_arw_payload_write_1 <= _zz_io_input_arw_payload_write;
    end
    if(_zz_1) begin
      _zz_io_input_arw_payload_addr_4 <= (_zz_io_input_arw_payload_addr_2 ? _zz_io_input_arw_payload_addr : _zz_io_input_arw_payload_addr_3);
      _zz_io_input_arw_payload_size_3 <= (_zz_io_input_arw_payload_addr_2 ? _zz_io_input_arw_payload_size : _zz_io_input_arw_payload_size_2);
      _zz_io_input_arw_payload_cache_1 <= (_zz_io_input_arw_payload_addr_2 ? 4'b1111 : _zz_io_input_arw_payload_cache);
      _zz_io_input_arw_payload_prot_1 <= (_zz_io_input_arw_payload_addr_2 ? 3'b010 : _zz_io_input_arw_payload_prot);
      _zz_io_input_arw_payload_write_2 <= (_zz_io_input_arw_payload_addr_2 ? _zz_io_input_arw_payload_write : _zz_io_input_arw_payload_write_1);
    end
    if(_zz_when_Stream_l1020_1) begin
      _zz_io_input_w_payload_data_2 <= _zz_io_input_w_payload_data;
      _zz_io_input_w_payload_strb_2 <= _zz_io_input_w_payload_strb;
      _zz_io_input_w_payload_last <= 1'b1;
    end
    if(_zz_2) begin
      _zz_io_input_w_payload_data_3 <= (_zz_io_input_w_payload_data_1 ? _zz_io_input_w_payload_data : _zz_io_input_w_payload_data_2);
      _zz_io_input_w_payload_strb_3 <= (_zz_io_input_w_payload_data_1 ? _zz_io_input_w_payload_strb : _zz_io_input_w_payload_strb_2);
      _zz_io_input_w_payload_last_1 <= (_zz_io_input_w_payload_data_1 ? 1'b1 : _zz_io_input_w_payload_last);
    end
    if(soc_axi4SharedDecoder_1_io_input_b_rValidN) begin
      soc_axi4SharedDecoder_1_io_input_b_rData_resp <= axi4SharedDecoder_1_io_input_b_payload_resp;
    end
    if(soc_axi4SharedDecoder_1_io_input_b_s2mPipe_ready) begin
      soc_axi4SharedDecoder_1_io_input_b_s2mPipe_rData_resp <= soc_axi4SharedDecoder_1_io_input_b_s2mPipe_payload_resp;
    end
    if(soc_axi4SharedDecoder_1_io_input_r_rValidN) begin
      soc_axi4SharedDecoder_1_io_input_r_rData_data <= axi4SharedDecoder_1_io_input_r_payload_data;
      soc_axi4SharedDecoder_1_io_input_r_rData_resp <= axi4SharedDecoder_1_io_input_r_payload_resp;
      soc_axi4SharedDecoder_1_io_input_r_rData_last <= axi4SharedDecoder_1_io_input_r_payload_last;
    end
    if(soc_axi4SharedDecoder_1_io_input_r_s2mPipe_ready) begin
      soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rData_data <= soc_axi4SharedDecoder_1_io_input_r_s2mPipe_payload_data;
      soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rData_resp <= soc_axi4SharedDecoder_1_io_input_r_s2mPipe_payload_resp;
      soc_axi4SharedDecoder_1_io_input_r_s2mPipe_rData_last <= soc_axi4SharedDecoder_1_io_input_r_s2mPipe_payload_last;
    end
    if(soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rValidN) begin
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_addr <= system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_addr;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_id <= system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_id;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_region <= system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_region;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_len <= system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_len;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_size <= system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_size;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_burst <= system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_burst;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_lock <= system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_lock;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_cache <= system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_cache;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_qos <= system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_qos;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_prot <= system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_prot;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_rData_write <= system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_payload_write;
    end
    if(soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_ready) begin
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_addr <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_addr;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_id <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_id;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_region <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_region;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_len <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_len;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_size <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_size;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_burst <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_burst;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_lock <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_lock;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_cache <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_cache;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_qos <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_qos;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_prot <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_prot;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_rData_write <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_arw_s2mPipe_payload_write;
    end
    if(soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rValidN) begin
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rData_data <= system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_data;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rData_strb <= system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_strb;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_rData_last <= system_hyperbus_ctrl_io_memory_arbiter_io_output_w_payload_last;
    end
    if(soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_ready) begin
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rData_data <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_payload_data;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rData_strb <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_payload_strb;
      soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_rData_last <= soc_system_hyperbus_ctrl_io_memory_arbiter_io_output_w_s2mPipe_payload_last;
    end
    if(soc_system_hyperbus_ctrl_io_memory_b_rValidN) begin
      soc_system_hyperbus_ctrl_io_memory_b_rData_id <= system_hyperbus_ctrl_io_memory_b_payload_id;
      soc_system_hyperbus_ctrl_io_memory_b_rData_resp <= system_hyperbus_ctrl_io_memory_b_payload_resp;
    end
    if(soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_ready) begin
      soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_rData_id <= soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_payload_id;
      soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_rData_resp <= soc_system_hyperbus_ctrl_io_memory_b_s2mPipe_payload_resp;
    end
    if(soc_system_hyperbus_ctrl_io_memory_r_rValidN) begin
      soc_system_hyperbus_ctrl_io_memory_r_rData_data <= system_hyperbus_ctrl_io_memory_r_payload_data;
      soc_system_hyperbus_ctrl_io_memory_r_rData_id <= system_hyperbus_ctrl_io_memory_r_payload_id;
      soc_system_hyperbus_ctrl_io_memory_r_rData_resp <= system_hyperbus_ctrl_io_memory_r_payload_resp;
      soc_system_hyperbus_ctrl_io_memory_r_rData_last <= system_hyperbus_ctrl_io_memory_r_payload_last;
    end
    if(soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_ready) begin
      soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_data <= soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_data;
      soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_id <= soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_id;
      soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_resp <= soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_resp;
      soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_rData_last <= soc_system_hyperbus_ctrl_io_memory_r_s2mPipe_payload_last;
    end
    if(soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rValidN) begin
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_addr <= system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_addr;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_id <= system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_id;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_region <= system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_region;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_len <= system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_len;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_size <= system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_size;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_burst <= system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_burst;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_lock <= system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_lock;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_cache <= system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_cache;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_qos <= system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_qos;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_rData_prot <= system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_payload_prot;
    end
    if(soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_ready) begin
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_addr <= soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_addr;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_id <= soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_id;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_region <= soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_region;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_len <= soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_len;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_size <= soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_size;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_burst <= soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_burst;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_lock <= soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_lock;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_cache <= soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_cache;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_qos <= soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_qos;
      soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_rData_prot <= soc_system_spiXipControllerCtrl_io_dataBus_arbiter_io_output_ar_s2mPipe_payload_prot;
    end
    if(soc_system_spiXipControllerCtrl_io_dataBus_r_rValidN) begin
      soc_system_spiXipControllerCtrl_io_dataBus_r_rData_data <= system_spiXipControllerCtrl_io_dataBus_r_payload_data;
      soc_system_spiXipControllerCtrl_io_dataBus_r_rData_id <= system_spiXipControllerCtrl_io_dataBus_r_payload_id;
      soc_system_spiXipControllerCtrl_io_dataBus_r_rData_resp <= system_spiXipControllerCtrl_io_dataBus_r_payload_resp;
      soc_system_spiXipControllerCtrl_io_dataBus_r_rData_last <= system_spiXipControllerCtrl_io_dataBus_r_payload_last;
    end
    if(soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_ready) begin
      soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_data <= soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_data;
      soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_id <= soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_id;
      soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_resp <= soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_resp;
      soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_rData_last <= soc_system_spiXipControllerCtrl_io_dataBus_r_s2mPipe_payload_last;
    end
    if(system_apbBridge_io_axi_arbiter_io_output_arw_ready) begin
      soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_addr <= system_apbBridge_io_axi_arbiter_io_output_arw_payload_addr;
      soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_id <= system_apbBridge_io_axi_arbiter_io_output_arw_payload_id;
      soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_len <= system_apbBridge_io_axi_arbiter_io_output_arw_payload_len;
      soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_size <= system_apbBridge_io_axi_arbiter_io_output_arw_payload_size;
      soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_burst <= system_apbBridge_io_axi_arbiter_io_output_arw_payload_burst;
      soc_system_apbBridge_io_axi_arbiter_io_output_arw_rData_write <= system_apbBridge_io_axi_arbiter_io_output_arw_payload_write;
    end
    if(system_apbBridge_io_axi_arbiter_io_output_w_ready) begin
      soc_system_apbBridge_io_axi_arbiter_io_output_w_rData_data <= system_apbBridge_io_axi_arbiter_io_output_w_payload_data;
      soc_system_apbBridge_io_axi_arbiter_io_output_w_rData_strb <= system_apbBridge_io_axi_arbiter_io_output_w_payload_strb;
      soc_system_apbBridge_io_axi_arbiter_io_output_w_rData_last <= system_apbBridge_io_axi_arbiter_io_output_w_payload_last;
    end
  end


endmodule

module Apb3Router (
  input  wire [19:0]   io_input_PADDR,
  input  wire [7:0]    io_input_PSEL,
  input  wire          io_input_PENABLE,
  output wire          io_input_PREADY,
  input  wire          io_input_PWRITE,
  input  wire [31:0]   io_input_PWDATA,
  output wire [31:0]   io_input_PRDATA,
  output wire          io_input_PSLVERROR,
  output wire [19:0]   io_outputs_0_PADDR,
  output wire [0:0]    io_outputs_0_PSEL,
  output wire          io_outputs_0_PENABLE,
  input  wire          io_outputs_0_PREADY,
  output wire          io_outputs_0_PWRITE,
  output wire [31:0]   io_outputs_0_PWDATA,
  input  wire [31:0]   io_outputs_0_PRDATA,
  input  wire          io_outputs_0_PSLVERROR,
  output wire [19:0]   io_outputs_1_PADDR,
  output wire [0:0]    io_outputs_1_PSEL,
  output wire          io_outputs_1_PENABLE,
  input  wire          io_outputs_1_PREADY,
  output wire          io_outputs_1_PWRITE,
  output wire [31:0]   io_outputs_1_PWDATA,
  input  wire [31:0]   io_outputs_1_PRDATA,
  input  wire          io_outputs_1_PSLVERROR,
  output wire [19:0]   io_outputs_2_PADDR,
  output wire [0:0]    io_outputs_2_PSEL,
  output wire          io_outputs_2_PENABLE,
  input  wire          io_outputs_2_PREADY,
  output wire          io_outputs_2_PWRITE,
  output wire [31:0]   io_outputs_2_PWDATA,
  input  wire [31:0]   io_outputs_2_PRDATA,
  input  wire          io_outputs_2_PSLVERROR,
  output wire [19:0]   io_outputs_3_PADDR,
  output wire [0:0]    io_outputs_3_PSEL,
  output wire          io_outputs_3_PENABLE,
  input  wire          io_outputs_3_PREADY,
  output wire          io_outputs_3_PWRITE,
  output wire [31:0]   io_outputs_3_PWDATA,
  input  wire [31:0]   io_outputs_3_PRDATA,
  input  wire          io_outputs_3_PSLVERROR,
  output wire [19:0]   io_outputs_4_PADDR,
  output wire [0:0]    io_outputs_4_PSEL,
  output wire          io_outputs_4_PENABLE,
  input  wire          io_outputs_4_PREADY,
  output wire          io_outputs_4_PWRITE,
  output wire [31:0]   io_outputs_4_PWDATA,
  input  wire [31:0]   io_outputs_4_PRDATA,
  input  wire          io_outputs_4_PSLVERROR,
  output wire [19:0]   io_outputs_5_PADDR,
  output wire [0:0]    io_outputs_5_PSEL,
  output wire          io_outputs_5_PENABLE,
  input  wire          io_outputs_5_PREADY,
  output wire          io_outputs_5_PWRITE,
  output wire [31:0]   io_outputs_5_PWDATA,
  input  wire [31:0]   io_outputs_5_PRDATA,
  input  wire          io_outputs_5_PSLVERROR,
  output wire [19:0]   io_outputs_6_PADDR,
  output wire [0:0]    io_outputs_6_PSEL,
  output wire          io_outputs_6_PENABLE,
  input  wire          io_outputs_6_PREADY,
  output wire          io_outputs_6_PWRITE,
  output wire [31:0]   io_outputs_6_PWDATA,
  input  wire [31:0]   io_outputs_6_PRDATA,
  input  wire          io_outputs_6_PSLVERROR,
  output wire [19:0]   io_outputs_7_PADDR,
  output wire [0:0]    io_outputs_7_PSEL,
  output wire          io_outputs_7_PENABLE,
  input  wire          io_outputs_7_PREADY,
  output wire          io_outputs_7_PWRITE,
  output wire [31:0]   io_outputs_7_PWDATA,
  input  wire [31:0]   io_outputs_7_PRDATA,
  input  wire          io_outputs_7_PSLVERROR,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  reg                 _zz_io_input_PREADY;
  reg        [31:0]   _zz_io_input_PRDATA;
  reg                 _zz_io_input_PSLVERROR;
  wire                _zz_selIndex;
  wire                _zz_selIndex_1;
  wire                _zz_selIndex_2;
  wire                _zz_selIndex_3;
  wire                _zz_selIndex_4;
  wire                _zz_selIndex_5;
  wire                _zz_selIndex_6;
  reg        [2:0]    selIndex;

  always @(*) begin
    case(selIndex)
      3'b000 : begin
        _zz_io_input_PREADY = io_outputs_0_PREADY;
        _zz_io_input_PRDATA = io_outputs_0_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_0_PSLVERROR;
      end
      3'b001 : begin
        _zz_io_input_PREADY = io_outputs_1_PREADY;
        _zz_io_input_PRDATA = io_outputs_1_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_1_PSLVERROR;
      end
      3'b010 : begin
        _zz_io_input_PREADY = io_outputs_2_PREADY;
        _zz_io_input_PRDATA = io_outputs_2_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_2_PSLVERROR;
      end
      3'b011 : begin
        _zz_io_input_PREADY = io_outputs_3_PREADY;
        _zz_io_input_PRDATA = io_outputs_3_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_3_PSLVERROR;
      end
      3'b100 : begin
        _zz_io_input_PREADY = io_outputs_4_PREADY;
        _zz_io_input_PRDATA = io_outputs_4_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_4_PSLVERROR;
      end
      3'b101 : begin
        _zz_io_input_PREADY = io_outputs_5_PREADY;
        _zz_io_input_PRDATA = io_outputs_5_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_5_PSLVERROR;
      end
      3'b110 : begin
        _zz_io_input_PREADY = io_outputs_6_PREADY;
        _zz_io_input_PRDATA = io_outputs_6_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_6_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_7_PREADY;
        _zz_io_input_PRDATA = io_outputs_7_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_7_PSLVERROR;
      end
    endcase
  end

  assign io_outputs_0_PADDR = io_input_PADDR;
  assign io_outputs_0_PENABLE = io_input_PENABLE;
  assign io_outputs_0_PSEL[0] = io_input_PSEL[0];
  assign io_outputs_0_PWRITE = io_input_PWRITE;
  assign io_outputs_0_PWDATA = io_input_PWDATA;
  assign io_outputs_1_PADDR = io_input_PADDR;
  assign io_outputs_1_PENABLE = io_input_PENABLE;
  assign io_outputs_1_PSEL[0] = io_input_PSEL[1];
  assign io_outputs_1_PWRITE = io_input_PWRITE;
  assign io_outputs_1_PWDATA = io_input_PWDATA;
  assign io_outputs_2_PADDR = io_input_PADDR;
  assign io_outputs_2_PENABLE = io_input_PENABLE;
  assign io_outputs_2_PSEL[0] = io_input_PSEL[2];
  assign io_outputs_2_PWRITE = io_input_PWRITE;
  assign io_outputs_2_PWDATA = io_input_PWDATA;
  assign io_outputs_3_PADDR = io_input_PADDR;
  assign io_outputs_3_PENABLE = io_input_PENABLE;
  assign io_outputs_3_PSEL[0] = io_input_PSEL[3];
  assign io_outputs_3_PWRITE = io_input_PWRITE;
  assign io_outputs_3_PWDATA = io_input_PWDATA;
  assign io_outputs_4_PADDR = io_input_PADDR;
  assign io_outputs_4_PENABLE = io_input_PENABLE;
  assign io_outputs_4_PSEL[0] = io_input_PSEL[4];
  assign io_outputs_4_PWRITE = io_input_PWRITE;
  assign io_outputs_4_PWDATA = io_input_PWDATA;
  assign io_outputs_5_PADDR = io_input_PADDR;
  assign io_outputs_5_PENABLE = io_input_PENABLE;
  assign io_outputs_5_PSEL[0] = io_input_PSEL[5];
  assign io_outputs_5_PWRITE = io_input_PWRITE;
  assign io_outputs_5_PWDATA = io_input_PWDATA;
  assign io_outputs_6_PADDR = io_input_PADDR;
  assign io_outputs_6_PENABLE = io_input_PENABLE;
  assign io_outputs_6_PSEL[0] = io_input_PSEL[6];
  assign io_outputs_6_PWRITE = io_input_PWRITE;
  assign io_outputs_6_PWDATA = io_input_PWDATA;
  assign io_outputs_7_PADDR = io_input_PADDR;
  assign io_outputs_7_PENABLE = io_input_PENABLE;
  assign io_outputs_7_PSEL[0] = io_input_PSEL[7];
  assign io_outputs_7_PWRITE = io_input_PWRITE;
  assign io_outputs_7_PWDATA = io_input_PWDATA;
  assign _zz_selIndex = io_input_PSEL[3];
  assign _zz_selIndex_1 = io_input_PSEL[5];
  assign _zz_selIndex_2 = io_input_PSEL[6];
  assign _zz_selIndex_3 = io_input_PSEL[7];
  assign _zz_selIndex_4 = (((io_input_PSEL[1] || _zz_selIndex) || _zz_selIndex_1) || _zz_selIndex_3);
  assign _zz_selIndex_5 = (((io_input_PSEL[2] || _zz_selIndex) || _zz_selIndex_2) || _zz_selIndex_3);
  assign _zz_selIndex_6 = (((io_input_PSEL[4] || _zz_selIndex_1) || _zz_selIndex_2) || _zz_selIndex_3);
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge _zz_1) begin
    selIndex <= {_zz_selIndex_6,{_zz_selIndex_5,_zz_selIndex_4}};
  end


endmodule

module Apb3Decoder (
  input  wire [19:0]   io_input_PADDR,
  input  wire [0:0]    io_input_PSEL,
  input  wire          io_input_PENABLE,
  output reg           io_input_PREADY,
  input  wire          io_input_PWRITE,
  input  wire [31:0]   io_input_PWDATA,
  output wire [31:0]   io_input_PRDATA,
  output reg           io_input_PSLVERROR,
  output wire [19:0]   io_output_PADDR,
  output reg  [7:0]    io_output_PSEL,
  output wire          io_output_PENABLE,
  input  wire          io_output_PREADY,
  output wire          io_output_PWRITE,
  output wire [31:0]   io_output_PWDATA,
  input  wire [31:0]   io_output_PRDATA,
  input  wire          io_output_PSLVERROR
);

  wire                when_Apb3Decoder_l88;

  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @(*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 20'h0ffff)) == 20'hf0000) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h20000) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h21000) && io_input_PSEL[0]);
    io_output_PSEL[3] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h22000) && io_input_PSEL[0]);
    io_output_PSEL[4] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h23000) && io_input_PSEL[0]);
    io_output_PSEL[5] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h24000) && io_input_PSEL[0]);
    io_output_PSEL[6] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h00000) && io_input_PSEL[0]);
    io_output_PSEL[7] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h01000) && io_input_PSEL[0]);
  end

  always @(*) begin
    io_input_PREADY = io_output_PREADY;
    if(when_Apb3Decoder_l88) begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @(*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(when_Apb3Decoder_l88) begin
      io_input_PSLVERROR = 1'b1;
    end
  end

  assign when_Apb3Decoder_l88 = (io_input_PSEL[0] && (io_output_PSEL == 8'h00));

endmodule

module Apb3Gpio (
  input  wire [11:0]   io_bus_PADDR,
  input  wire [0:0]    io_bus_PSEL,
  input  wire          io_bus_PENABLE,
  output wire          io_bus_PREADY,
  input  wire          io_bus_PWRITE,
  input  wire [31:0]   io_bus_PWDATA,
  output reg  [31:0]   io_bus_PRDATA,
  output wire          io_bus_PSLVERROR,
  input  wire [3:0]    io_gpio_pins_read,
  output wire [3:0]    io_gpio_pins_write,
  output wire [3:0]    io_gpio_pins_writeEnable,
  output wire          io_interrupt,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  reg        [3:0]    ctrl_io_config_write;
  reg        [3:0]    ctrl_io_config_direction;
  reg        [3:0]    mapper_interrupt_irqHighCtrl_io_inputs;
  reg        [3:0]    mapper_interrupt_irqHighCtrl_io_clears;
  reg        [3:0]    mapper_interrupt_irqLowCtrl_io_inputs;
  reg        [3:0]    mapper_interrupt_irqLowCtrl_io_clears;
  reg        [3:0]    mapper_interrupt_irqRiseCtrl_io_inputs;
  reg        [3:0]    mapper_interrupt_irqRiseCtrl_io_clears;
  reg        [3:0]    mapper_interrupt_irqFallCtrl_io_inputs;
  reg        [3:0]    mapper_interrupt_irqFallCtrl_io_clears;
  wire       [3:0]    ctrl_io_gpio_pins_write;
  wire       [3:0]    ctrl_io_gpio_pins_writeEnable;
  wire       [3:0]    ctrl_io_value;
  wire                ctrl_io_interrupt;
  wire       [3:0]    ctrl_io_irqHigh_valid;
  wire       [3:0]    ctrl_io_irqLow_valid;
  wire       [3:0]    ctrl_io_irqRise_valid;
  wire       [3:0]    ctrl_io_irqFall_valid;
  wire       [3:0]    mapper_interrupt_irqHighCtrl_io_pendings;
  wire       [3:0]    mapper_interrupt_irqLowCtrl_io_pendings;
  wire       [3:0]    mapper_interrupt_irqRiseCtrl_io_pendings;
  wire       [3:0]    mapper_interrupt_irqFallCtrl_io_pendings;
  wire                _zz_io_bus_PSLVERROR;
  wire                _zz_io_bus_PSLVERROR_1;
  wire                _zz_io_bus_PSLVERROR_2;
  wire                _zz_io_bus_PSLVERROR_3;
  reg                 _zz_io_bus_PRDATA;
  wire                _zz_io_bus_PRDATA_1;
  reg                 _zz_io_bus_PRDATA_2;
  wire                _zz_io_bus_PRDATA_3;
  reg                 _zz_io_bus_PRDATA_4;
  wire                _zz_io_bus_PRDATA_5;
  wire                _zz_io_bus_PRDATA_6;
  reg        [3:0]    peripherals_gpioStatusCtrl_mapper_interrupt_irqHighCtrl_io_masks_driver;
  reg        [3:0]    peripherals_gpioStatusCtrl_mapper_interrupt_irqLowCtrl_io_masks_driver;
  reg        [3:0]    peripherals_gpioStatusCtrl_mapper_interrupt_irqRiseCtrl_io_masks_driver;
  reg        [3:0]    peripherals_gpioStatusCtrl_mapper_interrupt_irqFallCtrl_io_masks_driver;

  GpioCtrl ctrl (
    .io_gpio_pins_read        (io_gpio_pins_read[3:0]                       ), //i
    .io_gpio_pins_write       (ctrl_io_gpio_pins_write[3:0]                 ), //o
    .io_gpio_pins_writeEnable (ctrl_io_gpio_pins_writeEnable[3:0]           ), //o
    .io_config_write          (ctrl_io_config_write[3:0]                    ), //i
    .io_config_direction      (ctrl_io_config_direction[3:0]                ), //i
    .io_value                 (ctrl_io_value[3:0]                           ), //o
    .io_interrupt             (ctrl_io_interrupt                            ), //o
    .io_irqHigh_valid         (ctrl_io_irqHigh_valid[3:0]                   ), //o
    .io_irqHigh_pending       (mapper_interrupt_irqHighCtrl_io_pendings[3:0]), //i
    .io_irqLow_valid          (ctrl_io_irqLow_valid[3:0]                    ), //o
    .io_irqLow_pending        (mapper_interrupt_irqLowCtrl_io_pendings[3:0] ), //i
    .io_irqRise_valid         (ctrl_io_irqRise_valid[3:0]                   ), //o
    .io_irqRise_pending       (mapper_interrupt_irqRiseCtrl_io_pendings[3:0]), //i
    .io_irqFall_valid         (ctrl_io_irqFall_valid[3:0]                   ), //o
    .io_irqFall_pending       (mapper_interrupt_irqFallCtrl_io_pendings[3:0]), //i
    ._zz_1                    (_zz_1                                        ), //i
    ._zz_2                    (_zz_2                                        )  //i
  );
  InterruptCtrl mapper_interrupt_irqHighCtrl (
    .io_inputs   (mapper_interrupt_irqHighCtrl_io_inputs[3:0]                                 ), //i
    .io_clears   (mapper_interrupt_irqHighCtrl_io_clears[3:0]                                 ), //i
    .io_masks    (peripherals_gpioStatusCtrl_mapper_interrupt_irqHighCtrl_io_masks_driver[3:0]), //i
    .io_pendings (mapper_interrupt_irqHighCtrl_io_pendings[3:0]                               ), //o
    ._zz_1       (_zz_1                                                                       ), //i
    ._zz_2       (_zz_2                                                                       )  //i
  );
  InterruptCtrl mapper_interrupt_irqLowCtrl (
    .io_inputs   (mapper_interrupt_irqLowCtrl_io_inputs[3:0]                                 ), //i
    .io_clears   (mapper_interrupt_irqLowCtrl_io_clears[3:0]                                 ), //i
    .io_masks    (peripherals_gpioStatusCtrl_mapper_interrupt_irqLowCtrl_io_masks_driver[3:0]), //i
    .io_pendings (mapper_interrupt_irqLowCtrl_io_pendings[3:0]                               ), //o
    ._zz_1       (_zz_1                                                                      ), //i
    ._zz_2       (_zz_2                                                                      )  //i
  );
  InterruptCtrl mapper_interrupt_irqRiseCtrl (
    .io_inputs   (mapper_interrupt_irqRiseCtrl_io_inputs[3:0]                                 ), //i
    .io_clears   (mapper_interrupt_irqRiseCtrl_io_clears[3:0]                                 ), //i
    .io_masks    (peripherals_gpioStatusCtrl_mapper_interrupt_irqRiseCtrl_io_masks_driver[3:0]), //i
    .io_pendings (mapper_interrupt_irqRiseCtrl_io_pendings[3:0]                               ), //o
    ._zz_1       (_zz_1                                                                       ), //i
    ._zz_2       (_zz_2                                                                       )  //i
  );
  InterruptCtrl mapper_interrupt_irqFallCtrl (
    .io_inputs   (mapper_interrupt_irqFallCtrl_io_inputs[3:0]                                 ), //i
    .io_clears   (mapper_interrupt_irqFallCtrl_io_clears[3:0]                                 ), //i
    .io_masks    (peripherals_gpioStatusCtrl_mapper_interrupt_irqFallCtrl_io_masks_driver[3:0]), //i
    .io_pendings (mapper_interrupt_irqFallCtrl_io_pendings[3:0]                               ), //o
    ._zz_1       (_zz_1                                                                       ), //i
    ._zz_2       (_zz_2                                                                       )  //i
  );
  assign io_gpio_pins_write = ctrl_io_gpio_pins_write;
  assign io_gpio_pins_writeEnable = ctrl_io_gpio_pins_writeEnable;
  assign io_interrupt = ctrl_io_interrupt;
  assign _zz_io_bus_PSLVERROR = 1'b0;
  assign _zz_io_bus_PSLVERROR_1 = 1'b0;
  assign io_bus_PREADY = 1'b1;
  always @(*) begin
    io_bus_PRDATA = 32'h00000000;
    case(io_bus_PADDR)
      12'h004 : begin
        io_bus_PRDATA[0 : 0] = _zz_io_bus_PRDATA;
        io_bus_PRDATA[1 : 1] = _zz_io_bus_PRDATA_2;
        io_bus_PRDATA[2 : 2] = _zz_io_bus_PRDATA_4;
        io_bus_PRDATA[3 : 3] = 1'b0;
      end
      12'h008 : begin
        io_bus_PRDATA[0 : 0] = _zz_io_bus_PRDATA_1;
        io_bus_PRDATA[1 : 1] = _zz_io_bus_PRDATA_3;
        io_bus_PRDATA[2 : 2] = _zz_io_bus_PRDATA_5;
        io_bus_PRDATA[3 : 3] = _zz_io_bus_PRDATA_6;
      end
      12'h000 : begin
        io_bus_PRDATA[3 : 3] = ctrl_io_value[3];
      end
      12'h010 : begin
        io_bus_PRDATA[3 : 0] = mapper_interrupt_irqHighCtrl_io_pendings;
      end
      12'h014 : begin
        io_bus_PRDATA[3 : 0] = peripherals_gpioStatusCtrl_mapper_interrupt_irqHighCtrl_io_masks_driver;
      end
      12'h018 : begin
        io_bus_PRDATA[3 : 0] = mapper_interrupt_irqLowCtrl_io_pendings;
      end
      12'h01c : begin
        io_bus_PRDATA[3 : 0] = peripherals_gpioStatusCtrl_mapper_interrupt_irqLowCtrl_io_masks_driver;
      end
      12'h020 : begin
        io_bus_PRDATA[3 : 0] = mapper_interrupt_irqRiseCtrl_io_pendings;
      end
      12'h024 : begin
        io_bus_PRDATA[3 : 0] = peripherals_gpioStatusCtrl_mapper_interrupt_irqRiseCtrl_io_masks_driver;
      end
      12'h028 : begin
        io_bus_PRDATA[3 : 0] = mapper_interrupt_irqFallCtrl_io_pendings;
      end
      12'h02c : begin
        io_bus_PRDATA[3 : 0] = peripherals_gpioStatusCtrl_mapper_interrupt_irqFallCtrl_io_masks_driver;
      end
      default : begin
      end
    endcase
  end

  assign _zz_io_bus_PSLVERROR_2 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign _zz_io_bus_PSLVERROR_3 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign io_bus_PSLVERROR = ((_zz_io_bus_PSLVERROR_2 && _zz_io_bus_PSLVERROR_1) || (_zz_io_bus_PSLVERROR_3 && _zz_io_bus_PSLVERROR));
  always @(*) begin
    ctrl_io_config_write[0] = _zz_io_bus_PRDATA;
    ctrl_io_config_write[1] = _zz_io_bus_PRDATA_2;
    ctrl_io_config_write[2] = _zz_io_bus_PRDATA_4;
    ctrl_io_config_write[3] = 1'b0;
  end

  assign _zz_io_bus_PRDATA_1 = 1'b1;
  always @(*) begin
    ctrl_io_config_direction[0] = _zz_io_bus_PRDATA_1;
    ctrl_io_config_direction[1] = _zz_io_bus_PRDATA_3;
    ctrl_io_config_direction[2] = _zz_io_bus_PRDATA_5;
    ctrl_io_config_direction[3] = _zz_io_bus_PRDATA_6;
  end

  assign _zz_io_bus_PRDATA_3 = 1'b1;
  assign _zz_io_bus_PRDATA_5 = 1'b1;
  assign _zz_io_bus_PRDATA_6 = 1'b0;
  always @(*) begin
    mapper_interrupt_irqHighCtrl_io_clears = 4'b0000;
    case(io_bus_PADDR)
      12'h010 : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          mapper_interrupt_irqHighCtrl_io_clears = io_bus_PWDATA[3 : 0];
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    mapper_interrupt_irqLowCtrl_io_clears = 4'b0000;
    case(io_bus_PADDR)
      12'h018 : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          mapper_interrupt_irqLowCtrl_io_clears = io_bus_PWDATA[3 : 0];
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    mapper_interrupt_irqRiseCtrl_io_clears = 4'b0000;
    case(io_bus_PADDR)
      12'h020 : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          mapper_interrupt_irqRiseCtrl_io_clears = io_bus_PWDATA[3 : 0];
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    mapper_interrupt_irqFallCtrl_io_clears = 4'b0000;
    case(io_bus_PADDR)
      12'h028 : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          mapper_interrupt_irqFallCtrl_io_clears = io_bus_PWDATA[3 : 0];
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    mapper_interrupt_irqHighCtrl_io_inputs[0] = 1'b0;
    mapper_interrupt_irqHighCtrl_io_inputs[1] = 1'b0;
    mapper_interrupt_irqHighCtrl_io_inputs[2] = 1'b0;
    mapper_interrupt_irqHighCtrl_io_inputs[3] = ctrl_io_irqHigh_valid[3];
  end

  always @(*) begin
    mapper_interrupt_irqLowCtrl_io_inputs[0] = 1'b0;
    mapper_interrupt_irqLowCtrl_io_inputs[1] = 1'b0;
    mapper_interrupt_irqLowCtrl_io_inputs[2] = 1'b0;
    mapper_interrupt_irqLowCtrl_io_inputs[3] = ctrl_io_irqLow_valid[3];
  end

  always @(*) begin
    mapper_interrupt_irqRiseCtrl_io_inputs[0] = 1'b0;
    mapper_interrupt_irqRiseCtrl_io_inputs[1] = 1'b0;
    mapper_interrupt_irqRiseCtrl_io_inputs[2] = 1'b0;
    mapper_interrupt_irqRiseCtrl_io_inputs[3] = ctrl_io_irqRise_valid[3];
  end

  always @(*) begin
    mapper_interrupt_irqFallCtrl_io_inputs[0] = 1'b0;
    mapper_interrupt_irqFallCtrl_io_inputs[1] = 1'b0;
    mapper_interrupt_irqFallCtrl_io_inputs[2] = 1'b0;
    mapper_interrupt_irqFallCtrl_io_inputs[3] = ctrl_io_irqFall_valid[3];
  end

  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      _zz_io_bus_PRDATA <= 1'b0;
      _zz_io_bus_PRDATA_2 <= 1'b0;
      _zz_io_bus_PRDATA_4 <= 1'b0;
      peripherals_gpioStatusCtrl_mapper_interrupt_irqHighCtrl_io_masks_driver <= 4'b0000;
      peripherals_gpioStatusCtrl_mapper_interrupt_irqLowCtrl_io_masks_driver <= 4'b0000;
      peripherals_gpioStatusCtrl_mapper_interrupt_irqRiseCtrl_io_masks_driver <= 4'b0000;
      peripherals_gpioStatusCtrl_mapper_interrupt_irqFallCtrl_io_masks_driver <= 4'b0000;
    end else begin
      case(io_bus_PADDR)
        12'h004 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            _zz_io_bus_PRDATA <= io_bus_PWDATA[0];
            _zz_io_bus_PRDATA_2 <= io_bus_PWDATA[1];
            _zz_io_bus_PRDATA_4 <= io_bus_PWDATA[2];
          end
        end
        12'h014 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            peripherals_gpioStatusCtrl_mapper_interrupt_irqHighCtrl_io_masks_driver <= io_bus_PWDATA[3 : 0];
          end
        end
        12'h01c : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            peripherals_gpioStatusCtrl_mapper_interrupt_irqLowCtrl_io_masks_driver <= io_bus_PWDATA[3 : 0];
          end
        end
        12'h024 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            peripherals_gpioStatusCtrl_mapper_interrupt_irqRiseCtrl_io_masks_driver <= io_bus_PWDATA[3 : 0];
          end
        end
        12'h02c : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            peripherals_gpioStatusCtrl_mapper_interrupt_irqFallCtrl_io_masks_driver <= io_bus_PWDATA[3 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module Apb3Uart (
  input  wire [11:0]   io_bus_PADDR,
  input  wire [0:0]    io_bus_PSEL,
  input  wire          io_bus_PENABLE,
  output wire          io_bus_PREADY,
  input  wire          io_bus_PWRITE,
  input  wire [31:0]   io_bus_PWDATA,
  output reg  [31:0]   io_bus_PRDATA,
  output wire          io_bus_PSLVERROR,
  output wire          io_uart_txd,
  input  wire          io_uart_rxd,
  input  wire          io_uart_cts,
  output wire          io_uart_rts,
  output wire          io_interrupt,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam ParityType_NONE = 2'd0;
  localparam ParityType_EVEN = 2'd1;
  localparam ParityType_ODD = 2'd2;
  localparam StopType_ONE = 1'd0;
  localparam StopType_TWO = 1'd1;

  wire                ctrl_io_readIsFull;
  wire                mapper_tx_streamUnbuffered_queueWithOccupancy_io_flush;
  reg                 peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_pop_ready;
  wire                peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_flush;
  reg        [1:0]    mapper_interrupt_irqCtrl_io_inputs;
  reg        [1:0]    mapper_interrupt_irqCtrl_io_clears;
  wire                ctrl_io_uart_txd;
  wire                ctrl_io_uart_rts;
  wire                ctrl_io_interrupt;
  wire                ctrl_io_write_ready;
  wire                ctrl_io_read_valid;
  wire       [8:0]    ctrl_io_read_payload;
  wire                mapper_tx_streamUnbuffered_queueWithOccupancy_io_push_ready;
  wire                mapper_tx_streamUnbuffered_queueWithOccupancy_io_pop_valid;
  wire       [8:0]    mapper_tx_streamUnbuffered_queueWithOccupancy_io_pop_payload;
  wire       [6:0]    mapper_tx_streamUnbuffered_queueWithOccupancy_io_occupancy;
  wire       [6:0]    mapper_tx_streamUnbuffered_queueWithOccupancy_io_availability;
  wire                peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_push_ready;
  wire                peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_pop_valid;
  wire       [8:0]    peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_pop_payload;
  wire       [6:0]    peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_occupancy;
  wire       [6:0]    peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_availability;
  wire       [1:0]    mapper_interrupt_irqCtrl_io_pendings;
  wire       [6:0]    _zz_io_bus_PRDATA;
  wire                _zz_io_bus_PSLVERROR;
  wire                _zz_io_bus_PSLVERROR_1;
  wire                _zz_io_bus_PSLVERROR_2;
  wire                _zz_io_bus_PSLVERROR_3;
  reg        [19:0]   mapper_config_cfg_clockDivider;
  reg        [1:0]    mapper_config_frameCfg_parity;
  reg        [0:0]    mapper_config_frameCfg_stop;
  reg        [3:0]    mapper_config_frameCfg_dataLength;
  reg                 _zz_mapper_tx_streamUnbuffered_valid;
  wire                mapper_tx_streamUnbuffered_valid;
  wire                mapper_tx_streamUnbuffered_ready;
  wire       [8:0]    mapper_tx_streamUnbuffered_payload;
  reg        [1:0]    peripherals_uartStdCtrl_mapper_interrupt_irqCtrl_io_masks_driver;
  wire       [1:0]    _zz_mapper_config_frameCfg_parity;
  wire       [0:0]    _zz_mapper_config_frameCfg_stop;
  wire                when_Apb3SlaveFactory_l81;
  `ifndef SYNTHESIS
  reg [31:0] mapper_config_frameCfg_parity_string;
  reg [23:0] mapper_config_frameCfg_stop_string;
  reg [31:0] _zz_mapper_config_frameCfg_parity_string;
  reg [23:0] _zz_mapper_config_frameCfg_stop_string;
  `endif


  assign _zz_io_bus_PRDATA = (7'h40 - mapper_tx_streamUnbuffered_queueWithOccupancy_io_occupancy);
  UartCtrl ctrl (
    .io_config_clockDivider    (mapper_config_cfg_clockDivider[19:0]                                 ), //i
    .io_frameConfig_parity     (mapper_config_frameCfg_parity[1:0]                                   ), //i
    .io_frameConfig_stop       (mapper_config_frameCfg_stop                                          ), //i
    .io_frameConfig_dataLength (mapper_config_frameCfg_dataLength[3:0]                               ), //i
    .io_uart_txd               (ctrl_io_uart_txd                                                     ), //o
    .io_uart_rxd               (io_uart_rxd                                                          ), //i
    .io_uart_cts               (io_uart_cts                                                          ), //i
    .io_uart_rts               (ctrl_io_uart_rts                                                     ), //o
    .io_interrupt              (ctrl_io_interrupt                                                    ), //o
    .io_pendingInterrupts      (mapper_interrupt_irqCtrl_io_pendings[1:0]                            ), //i
    .io_write_valid            (mapper_tx_streamUnbuffered_queueWithOccupancy_io_pop_valid           ), //i
    .io_write_ready            (ctrl_io_write_ready                                                  ), //o
    .io_write_payload          (mapper_tx_streamUnbuffered_queueWithOccupancy_io_pop_payload[8:0]    ), //i
    .io_read_valid             (ctrl_io_read_valid                                                   ), //o
    .io_read_ready             (peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_push_ready), //i
    .io_read_payload           (ctrl_io_read_payload[8:0]                                            ), //o
    .io_readIsFull             (ctrl_io_readIsFull                                                   ), //i
    ._zz_1                     (_zz_1                                                                ), //i
    ._zz_2                     (_zz_2                                                                )  //i
  );
  StreamFifo mapper_tx_streamUnbuffered_queueWithOccupancy (
    .io_push_valid   (mapper_tx_streamUnbuffered_valid                                  ), //i
    .io_push_ready   (mapper_tx_streamUnbuffered_queueWithOccupancy_io_push_ready       ), //o
    .io_push_payload (mapper_tx_streamUnbuffered_payload[8:0]                           ), //i
    .io_pop_valid    (mapper_tx_streamUnbuffered_queueWithOccupancy_io_pop_valid        ), //o
    .io_pop_ready    (ctrl_io_write_ready                                               ), //i
    .io_pop_payload  (mapper_tx_streamUnbuffered_queueWithOccupancy_io_pop_payload[8:0] ), //o
    .io_flush        (mapper_tx_streamUnbuffered_queueWithOccupancy_io_flush            ), //i
    .io_occupancy    (mapper_tx_streamUnbuffered_queueWithOccupancy_io_occupancy[6:0]   ), //o
    .io_availability (mapper_tx_streamUnbuffered_queueWithOccupancy_io_availability[6:0]), //o
    ._zz_4           (_zz_1                                                             ), //i
    ._zz_5           (_zz_2                                                             )  //i
  );
  StreamFifo peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy (
    .io_push_valid   (ctrl_io_read_valid                                                          ), //i
    .io_push_ready   (peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_push_ready       ), //o
    .io_push_payload (ctrl_io_read_payload[8:0]                                                   ), //i
    .io_pop_valid    (peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_pop_valid        ), //o
    .io_pop_ready    (peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_pop_ready        ), //i
    .io_pop_payload  (peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_pop_payload[8:0] ), //o
    .io_flush        (peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_flush            ), //i
    .io_occupancy    (peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_occupancy[6:0]   ), //o
    .io_availability (peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_availability[6:0]), //o
    ._zz_4           (_zz_1                                                                       ), //i
    ._zz_5           (_zz_2                                                                       )  //i
  );
  InterruptCtrl_4 mapper_interrupt_irqCtrl (
    .io_inputs   (mapper_interrupt_irqCtrl_io_inputs[1:0]                              ), //i
    .io_clears   (mapper_interrupt_irqCtrl_io_clears[1:0]                              ), //i
    .io_masks    (peripherals_uartStdCtrl_mapper_interrupt_irqCtrl_io_masks_driver[1:0]), //i
    .io_pendings (mapper_interrupt_irqCtrl_io_pendings[1:0]                            ), //o
    ._zz_1       (_zz_1                                                                ), //i
    ._zz_2       (_zz_2                                                                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(mapper_config_frameCfg_parity)
      ParityType_NONE : mapper_config_frameCfg_parity_string = "NONE";
      ParityType_EVEN : mapper_config_frameCfg_parity_string = "EVEN";
      ParityType_ODD : mapper_config_frameCfg_parity_string = "ODD ";
      default : mapper_config_frameCfg_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(mapper_config_frameCfg_stop)
      StopType_ONE : mapper_config_frameCfg_stop_string = "ONE";
      StopType_TWO : mapper_config_frameCfg_stop_string = "TWO";
      default : mapper_config_frameCfg_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_mapper_config_frameCfg_parity)
      ParityType_NONE : _zz_mapper_config_frameCfg_parity_string = "NONE";
      ParityType_EVEN : _zz_mapper_config_frameCfg_parity_string = "EVEN";
      ParityType_ODD : _zz_mapper_config_frameCfg_parity_string = "ODD ";
      default : _zz_mapper_config_frameCfg_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_mapper_config_frameCfg_stop)
      StopType_ONE : _zz_mapper_config_frameCfg_stop_string = "ONE";
      StopType_TWO : _zz_mapper_config_frameCfg_stop_string = "TWO";
      default : _zz_mapper_config_frameCfg_stop_string = "???";
    endcase
  end
  `endif

  assign io_uart_txd = ctrl_io_uart_txd;
  assign io_uart_rts = ctrl_io_uart_rts;
  assign io_interrupt = ctrl_io_interrupt;
  assign _zz_io_bus_PSLVERROR = 1'b0;
  assign _zz_io_bus_PSLVERROR_1 = 1'b0;
  assign io_bus_PREADY = 1'b1;
  always @(*) begin
    io_bus_PRDATA = 32'h00000000;
    case(io_bus_PADDR)
      12'h000 : begin
        io_bus_PRDATA[16 : 16] = (peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_pop_valid ^ 1'b0);
        io_bus_PRDATA[8 : 0] = peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_pop_payload;
      end
      12'h004 : begin
        io_bus_PRDATA[22 : 16] = _zz_io_bus_PRDATA;
        io_bus_PRDATA[30 : 24] = peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_occupancy;
      end
      12'h010 : begin
        io_bus_PRDATA[1 : 0] = mapper_interrupt_irqCtrl_io_pendings;
      end
      12'h014 : begin
        io_bus_PRDATA[1 : 0] = peripherals_uartStdCtrl_mapper_interrupt_irqCtrl_io_masks_driver;
      end
      default : begin
      end
    endcase
  end

  assign _zz_io_bus_PSLVERROR_2 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign _zz_io_bus_PSLVERROR_3 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign io_bus_PSLVERROR = ((_zz_io_bus_PSLVERROR_2 && _zz_io_bus_PSLVERROR_1) || (_zz_io_bus_PSLVERROR_3 && _zz_io_bus_PSLVERROR));
  always @(*) begin
    _zz_mapper_tx_streamUnbuffered_valid = 1'b0;
    case(io_bus_PADDR)
      12'h000 : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          _zz_mapper_tx_streamUnbuffered_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign mapper_tx_streamUnbuffered_valid = _zz_mapper_tx_streamUnbuffered_valid;
  assign mapper_tx_streamUnbuffered_payload = io_bus_PWDATA[8 : 0];
  assign mapper_tx_streamUnbuffered_ready = mapper_tx_streamUnbuffered_queueWithOccupancy_io_push_ready;
  assign ctrl_io_readIsFull = (7'h3f <= peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_occupancy);
  always @(*) begin
    peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_pop_ready = 1'b0;
    case(io_bus_PADDR)
      12'h000 : begin
        if(_zz_io_bus_PSLVERROR_3) begin
          peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_pop_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    mapper_interrupt_irqCtrl_io_clears = 2'b00;
    case(io_bus_PADDR)
      12'h010 : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          mapper_interrupt_irqCtrl_io_clears = io_bus_PWDATA[1 : 0];
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    mapper_interrupt_irqCtrl_io_inputs[0] = 1'b0;
    mapper_interrupt_irqCtrl_io_inputs[1] = ctrl_io_read_valid;
  end

  assign _zz_mapper_config_frameCfg_parity = io_bus_PWDATA[9 : 8];
  assign _zz_mapper_config_frameCfg_stop = io_bus_PWDATA[16 : 16];
  assign when_Apb3SlaveFactory_l81 = ((io_bus_PADDR & (~ 12'h003)) == 12'h008);
  assign mapper_tx_streamUnbuffered_queueWithOccupancy_io_flush = 1'b0;
  assign peripherals_uartStdCtrl_ctrl_io_read_queueWithOccupancy_io_flush = 1'b0;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      mapper_config_cfg_clockDivider <= 20'h0006b;
      mapper_config_frameCfg_dataLength <= 4'b0111;
      mapper_config_frameCfg_parity <= ParityType_NONE;
      mapper_config_frameCfg_stop <= StopType_ONE;
      peripherals_uartStdCtrl_mapper_interrupt_irqCtrl_io_masks_driver <= 2'b00;
    end else begin
      case(io_bus_PADDR)
        12'h00c : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            mapper_config_frameCfg_dataLength <= io_bus_PWDATA[3 : 0];
            mapper_config_frameCfg_parity <= _zz_mapper_config_frameCfg_parity;
            mapper_config_frameCfg_stop <= _zz_mapper_config_frameCfg_stop;
          end
        end
        12'h014 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            peripherals_uartStdCtrl_mapper_interrupt_irqCtrl_io_masks_driver <= io_bus_PWDATA[1 : 0];
          end
        end
        default : begin
        end
      endcase
      if(when_Apb3SlaveFactory_l81) begin
        if(_zz_io_bus_PSLVERROR_2) begin
          mapper_config_cfg_clockDivider[19 : 0] <= io_bus_PWDATA[19 : 0];
        end
      end
    end
  end


endmodule

module Apb3ClockController (
  input  wire [11:0]   io_bus_PADDR,
  input  wire [0:0]    io_bus_PSEL,
  input  wire          io_bus_PENABLE,
  output wire          io_bus_PREADY,
  input  wire          io_bus_PWRITE,
  input  wire [31:0]   io_bus_PWDATA,
  output reg  [31:0]   io_bus_PRDATA,
  output wire          io_bus_PSLVERROR,
  output wire [1:0]    io_config_enable,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire                busCtrl_readErrorFlag;
  wire                busCtrl_writeErrorFlag;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [1:0]    io_config_enable_driver;
  wire       [1:0]    _zz_io_config_enable_driver;

  assign busCtrl_readErrorFlag = 1'b0;
  assign busCtrl_writeErrorFlag = 1'b0;
  assign io_bus_PREADY = 1'b1;
  always @(*) begin
    io_bus_PRDATA = 32'h00000000;
    case(io_bus_PADDR)
      12'h000 : begin
        io_bus_PRDATA[1 : 0] = io_config_enable_driver;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PWRITE);
  assign busCtrl_askRead = ((io_bus_PSEL[0] && io_bus_PENABLE) && (! io_bus_PWRITE));
  assign busCtrl_doWrite = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign busCtrl_doRead = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign io_bus_PSLVERROR = ((busCtrl_doWrite && busCtrl_writeErrorFlag) || (busCtrl_doRead && busCtrl_readErrorFlag));
  assign io_config_enable = io_config_enable_driver;
  assign _zz_io_config_enable_driver[1 : 0] = 2'b11;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      io_config_enable_driver <= _zz_io_config_enable_driver;
    end else begin
      case(io_bus_PADDR)
        12'h000 : begin
          if(busCtrl_doWrite) begin
            io_config_enable_driver <= io_bus_PWDATA[1 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module Apb3ResetController (
  input  wire [11:0]   io_bus_PADDR,
  input  wire [0:0]    io_bus_PSEL,
  input  wire          io_bus_PENABLE,
  output wire          io_bus_PREADY,
  input  wire          io_bus_PWRITE,
  input  wire [31:0]   io_bus_PWDATA,
  output reg  [31:0]   io_bus_PRDATA,
  output wire          io_bus_PSLVERROR,
  output wire [1:0]    io_config_enable,
  output wire [1:0]    io_config_trigger,
  output wire          io_config_acknowledge,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire                busCtrl_readErrorFlag;
  wire                busCtrl_writeErrorFlag;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [1:0]    trigger;
  reg                 acknowledge;
  reg        [1:0]    io_config_enable_driver;
  wire       [1:0]    _zz_io_config_enable_driver;

  assign busCtrl_readErrorFlag = 1'b0;
  assign busCtrl_writeErrorFlag = 1'b0;
  assign io_bus_PREADY = 1'b1;
  always @(*) begin
    io_bus_PRDATA = 32'h00000000;
    case(io_bus_PADDR)
      12'h000 : begin
        io_bus_PRDATA[1 : 0] = io_config_enable_driver;
      end
      12'h004 : begin
        io_bus_PRDATA[1 : 0] = trigger;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PWRITE);
  assign busCtrl_askRead = ((io_bus_PSEL[0] && io_bus_PENABLE) && (! io_bus_PWRITE));
  assign busCtrl_doWrite = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign busCtrl_doRead = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign io_bus_PSLVERROR = ((busCtrl_doWrite && busCtrl_writeErrorFlag) || (busCtrl_doRead && busCtrl_readErrorFlag));
  always @(*) begin
    acknowledge = 1'b0;
    case(io_bus_PADDR)
      12'h008 : begin
        if(busCtrl_doWrite) begin
          acknowledge = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign io_config_enable = io_config_enable_driver;
  assign _zz_io_config_enable_driver[1 : 0] = 2'b11;
  assign io_config_trigger = trigger;
  assign io_config_acknowledge = acknowledge;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      trigger <= 2'b00;
      io_config_enable_driver <= _zz_io_config_enable_driver;
    end else begin
      if(acknowledge) begin
        trigger <= 2'b00;
      end
      case(io_bus_PADDR)
        12'h000 : begin
          if(busCtrl_doWrite) begin
            io_config_enable_driver <= io_bus_PWDATA[1 : 0];
          end
        end
        12'h004 : begin
          if(busCtrl_doWrite) begin
            trigger <= io_bus_PWDATA[1 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module Apb3MachineTimer (
  input  wire [11:0]   io_bus_PADDR,
  input  wire [0:0]    io_bus_PSEL,
  input  wire          io_bus_PENABLE,
  output wire          io_bus_PREADY,
  input  wire          io_bus_PWRITE,
  input  wire [31:0]   io_bus_PWDATA,
  output reg  [31:0]   io_bus_PRDATA,
  output wire          io_bus_PSLVERROR,
  output wire          io_interrupt,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire                ctrl_io_clear;
  wire       [63:0]   ctrl_io_counter;
  wire                ctrl_io_interrupt;
  wire                _zz_io_bus_PSLVERROR;
  wire                _zz_io_bus_PSLVERROR_1;
  wire                _zz_io_bus_PSLVERROR_2;
  wire                _zz_io_bus_PSLVERROR_3;
  reg        [63:0]   mapper_cfg_compare;
  wire       [63:0]   _zz_io_bus_PRDATA;
  reg                 _zz_io_clear;
  reg                 _zz_io_clear_1;
  wire                when_Apb3SlaveFactory_l81;
  wire                when_Apb3SlaveFactory_l81_1;
  wire                when_Apb3SlaveFactory_l81_2;
  wire                when_Apb3SlaveFactory_l81_3;

  MachineTimerCtrl ctrl (
    .io_config_compare (mapper_cfg_compare[63:0]), //i
    .io_counter        (ctrl_io_counter[63:0]   ), //o
    .io_clear          (ctrl_io_clear           ), //i
    .io_interrupt      (ctrl_io_interrupt       ), //o
    ._zz_1             (_zz_1                   ), //i
    ._zz_2             (_zz_2                   )  //i
  );
  assign io_interrupt = ctrl_io_interrupt;
  assign _zz_io_bus_PSLVERROR = 1'b0;
  assign _zz_io_bus_PSLVERROR_1 = 1'b0;
  assign io_bus_PREADY = 1'b1;
  always @(*) begin
    io_bus_PRDATA = 32'h00000000;
    if(when_Apb3SlaveFactory_l81) begin
      io_bus_PRDATA[31 : 0] = _zz_io_bus_PRDATA[31 : 0];
    end
    if(when_Apb3SlaveFactory_l81_1) begin
      io_bus_PRDATA[31 : 0] = _zz_io_bus_PRDATA[63 : 32];
    end
  end

  assign _zz_io_bus_PSLVERROR_2 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign _zz_io_bus_PSLVERROR_3 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign io_bus_PSLVERROR = ((_zz_io_bus_PSLVERROR_2 && _zz_io_bus_PSLVERROR_1) || (_zz_io_bus_PSLVERROR_3 && _zz_io_bus_PSLVERROR));
  assign _zz_io_bus_PRDATA = ctrl_io_counter;
  always @(*) begin
    _zz_io_clear = 1'b0;
    case(io_bus_PADDR)
      12'h008 : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          _zz_io_clear = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_io_clear_1 = 1'b0;
    case(io_bus_PADDR)
      12'h00c : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          _zz_io_clear_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign ctrl_io_clear = (_zz_io_clear || _zz_io_clear_1);
  assign when_Apb3SlaveFactory_l81 = ((io_bus_PADDR & (~ 12'h003)) == 12'h000);
  assign when_Apb3SlaveFactory_l81_1 = ((io_bus_PADDR & (~ 12'h003)) == 12'h004);
  assign when_Apb3SlaveFactory_l81_2 = ((io_bus_PADDR & (~ 12'h003)) == 12'h008);
  assign when_Apb3SlaveFactory_l81_3 = ((io_bus_PADDR & (~ 12'h003)) == 12'h00c);
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      mapper_cfg_compare <= 64'h0000000000000000;
    end else begin
      if(when_Apb3SlaveFactory_l81_2) begin
        if(_zz_io_bus_PSLVERROR_2) begin
          mapper_cfg_compare[31 : 0] <= io_bus_PWDATA[31 : 0];
        end
      end
      if(when_Apb3SlaveFactory_l81_3) begin
        if(_zz_io_bus_PSLVERROR_2) begin
          mapper_cfg_compare[63 : 32] <= io_bus_PWDATA[31 : 0];
        end
      end
    end
  end


endmodule

module Apb3Plic (
  input  wire [15:0]   io_bus_PADDR,
  input  wire [0:0]    io_bus_PSEL,
  input  wire          io_bus_PENABLE,
  output reg           io_bus_PREADY,
  input  wire          io_bus_PWRITE,
  input  wire [31:0]   io_bus_PWDATA,
  output reg  [31:0]   io_bus_PRDATA,
  output wire          io_bus_PSLVERROR,
  output wire          io_interrupt,
  input  wire [2:0]    io_sources,
  input  wire          _zz_3,
  input  wire          _zz_4
);

  wire                _zz_when_PlicGateway_l21;
  reg                 _zz_targets_0_requests_1_valid;
  reg                 _zz_when_PlicGateway_l21_1;
  wire                when_PlicGateway_l21;
  wire                _zz_when_PlicGateway_l21_2;
  reg                 _zz_targets_0_requests_2_valid;
  reg                 _zz_when_PlicGateway_l21_3;
  wire                when_PlicGateway_l21_1;
  wire                _zz_when_PlicGateway_l21_4;
  reg                 _zz_targets_0_requests_3_valid;
  reg                 _zz_when_PlicGateway_l21_5;
  wire                when_PlicGateway_l21_2;
  wire                targets_0_ie_0;
  wire                targets_0_ie_1;
  wire                targets_0_ie_2;
  wire       [0:0]    targets_0_threshold;
  wire       [0:0]    targets_0_requests_0_priority;
  wire       [1:0]    targets_0_requests_0_id;
  wire                targets_0_requests_0_valid;
  wire       [0:0]    targets_0_requests_1_priority;
  wire       [1:0]    targets_0_requests_1_id;
  wire                targets_0_requests_1_valid;
  wire       [0:0]    targets_0_requests_2_priority;
  wire       [1:0]    targets_0_requests_2_id;
  wire                targets_0_requests_2_valid;
  wire       [0:0]    targets_0_requests_3_priority;
  wire       [1:0]    targets_0_requests_3_id;
  wire                targets_0_requests_3_valid;
  wire                _zz_targets_0_bestRequest_id;
  wire       [0:0]    _zz_targets_0_bestRequest_priority;
  wire                _zz_targets_0_bestRequest_valid;
  wire                _zz_targets_0_bestRequest_id_1;
  wire       [0:0]    _zz_targets_0_bestRequest_priority_1;
  wire                _zz_targets_0_bestRequest_valid_1;
  wire                _zz_targets_0_bestRequest_priority_2;
  reg        [0:0]    targets_0_bestRequest_priority;
  reg        [1:0]    targets_0_bestRequest_id;
  reg                 targets_0_bestRequest_valid;
  wire                targets_0_iep;
  wire       [1:0]    targets_0_claim;
  wire                _zz_io_bus_PSLVERROR;
  wire                _zz_io_bus_PSLVERROR_1;
  wire                _zz_1;
  wire                _zz_2;
  wire                _zz_io_bus_PSLVERROR_2;
  wire                _zz_io_bus_PSLVERROR_3;
  reg                 mapping_claim_valid;
  reg        [1:0]    mapping_claim_payload;
  reg                 mapping_completion_valid;
  reg        [1:0]    mapping_completion_payload;
  reg                 mapping_coherencyStall_willIncrement;
  wire                mapping_coherencyStall_willClear;
  reg        [0:0]    mapping_coherencyStall_valueNext;
  reg        [0:0]    mapping_coherencyStall_value;
  wire                mapping_coherencyStall_willOverflowIfInc;
  wire                mapping_coherencyStall_willOverflow;
  wire                when_PlicMapper_l122;
  reg                 mapping_targetMapping_0_targetCompletion_valid;
  wire       [1:0]    mapping_targetMapping_0_targetCompletion_payload;
  reg                 _zz_targets_0_ie_0;
  reg                 _zz_targets_0_ie_1;
  reg                 _zz_targets_0_ie_2;
  wire                when_Apb3SlaveFactory_l81;

  assign _zz_when_PlicGateway_l21 = io_sources[0];
  assign when_PlicGateway_l21 = (! _zz_when_PlicGateway_l21_1);
  assign _zz_when_PlicGateway_l21_2 = io_sources[1];
  assign when_PlicGateway_l21_1 = (! _zz_when_PlicGateway_l21_3);
  assign _zz_when_PlicGateway_l21_4 = io_sources[2];
  assign when_PlicGateway_l21_2 = (! _zz_when_PlicGateway_l21_5);
  assign targets_0_requests_0_priority = 1'b0;
  assign targets_0_requests_0_id = 2'b00;
  assign targets_0_requests_0_valid = 1'b1;
  assign targets_0_requests_1_priority = 1'b1;
  assign targets_0_requests_1_id = 2'b00;
  assign targets_0_requests_1_valid = (_zz_targets_0_requests_1_valid && targets_0_ie_0);
  assign targets_0_requests_2_priority = 1'b1;
  assign targets_0_requests_2_id = 2'b01;
  assign targets_0_requests_2_valid = (_zz_targets_0_requests_2_valid && targets_0_ie_1);
  assign targets_0_requests_3_priority = 1'b1;
  assign targets_0_requests_3_id = 2'b10;
  assign targets_0_requests_3_valid = (_zz_targets_0_requests_3_valid && targets_0_ie_2);
  assign _zz_targets_0_bestRequest_id = ((! targets_0_requests_1_valid) || (targets_0_requests_0_valid && (targets_0_requests_1_priority <= targets_0_requests_0_priority)));
  assign _zz_targets_0_bestRequest_priority = (_zz_targets_0_bestRequest_id ? targets_0_requests_0_priority : targets_0_requests_1_priority);
  assign _zz_targets_0_bestRequest_valid = (_zz_targets_0_bestRequest_id ? targets_0_requests_0_valid : targets_0_requests_1_valid);
  assign _zz_targets_0_bestRequest_id_1 = ((! targets_0_requests_3_valid) || (targets_0_requests_2_valid && (targets_0_requests_3_priority <= targets_0_requests_2_priority)));
  assign _zz_targets_0_bestRequest_priority_1 = (_zz_targets_0_bestRequest_id_1 ? targets_0_requests_2_priority : targets_0_requests_3_priority);
  assign _zz_targets_0_bestRequest_valid_1 = (_zz_targets_0_bestRequest_id_1 ? targets_0_requests_2_valid : targets_0_requests_3_valid);
  assign _zz_targets_0_bestRequest_priority_2 = ((! _zz_targets_0_bestRequest_valid_1) || (_zz_targets_0_bestRequest_valid && (_zz_targets_0_bestRequest_priority_1 <= _zz_targets_0_bestRequest_priority)));
  assign targets_0_iep = (targets_0_threshold < targets_0_bestRequest_priority);
  assign targets_0_claim = (targets_0_iep ? targets_0_bestRequest_id : 2'b00);
  assign targets_0_threshold = 1'b0;
  assign _zz_io_bus_PSLVERROR = 1'b0;
  assign _zz_io_bus_PSLVERROR_1 = 1'b0;
  always @(*) begin
    io_bus_PREADY = 1'b1;
    if(when_PlicMapper_l122) begin
      io_bus_PREADY = 1'b0;
    end
  end

  always @(*) begin
    io_bus_PRDATA = 32'h00000000;
    case(io_bus_PADDR)
      16'hf004 : begin
        io_bus_PRDATA[1 : 0] = targets_0_claim;
      end
      16'h2000 : begin
        io_bus_PRDATA[0 : 0] = targets_0_ie_0;
        io_bus_PRDATA[1 : 1] = targets_0_ie_1;
        io_bus_PRDATA[2 : 2] = targets_0_ie_2;
      end
      default : begin
      end
    endcase
  end

  assign _zz_1 = ((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PWRITE);
  assign _zz_2 = ((io_bus_PSEL[0] && io_bus_PENABLE) && (! io_bus_PWRITE));
  assign _zz_io_bus_PSLVERROR_2 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign _zz_io_bus_PSLVERROR_3 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign io_bus_PSLVERROR = ((_zz_io_bus_PSLVERROR_2 && _zz_io_bus_PSLVERROR_1) || (_zz_io_bus_PSLVERROR_3 && _zz_io_bus_PSLVERROR));
  always @(*) begin
    mapping_claim_valid = 1'b0;
    case(io_bus_PADDR)
      16'hf004 : begin
        if(_zz_io_bus_PSLVERROR_3) begin
          mapping_claim_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    mapping_claim_payload = 2'bxx;
    case(io_bus_PADDR)
      16'hf004 : begin
        if(_zz_io_bus_PSLVERROR_3) begin
          mapping_claim_payload = targets_0_claim;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    mapping_completion_valid = 1'b0;
    if(mapping_targetMapping_0_targetCompletion_valid) begin
      mapping_completion_valid = 1'b1;
    end
  end

  always @(*) begin
    mapping_completion_payload = 2'bxx;
    if(mapping_targetMapping_0_targetCompletion_valid) begin
      mapping_completion_payload = mapping_targetMapping_0_targetCompletion_payload;
    end
  end

  always @(*) begin
    mapping_coherencyStall_willIncrement = 1'b0;
    if(when_PlicMapper_l122) begin
      mapping_coherencyStall_willIncrement = 1'b1;
    end
    if(when_Apb3SlaveFactory_l81) begin
      if(_zz_1) begin
        mapping_coherencyStall_willIncrement = 1'b1;
      end
      if(_zz_2) begin
        mapping_coherencyStall_willIncrement = 1'b1;
      end
    end
  end

  assign mapping_coherencyStall_willClear = 1'b0;
  assign mapping_coherencyStall_willOverflowIfInc = (mapping_coherencyStall_value == 1'b1);
  assign mapping_coherencyStall_willOverflow = (mapping_coherencyStall_willOverflowIfInc && mapping_coherencyStall_willIncrement);
  always @(*) begin
    mapping_coherencyStall_valueNext = (mapping_coherencyStall_value + mapping_coherencyStall_willIncrement);
    if(mapping_coherencyStall_willClear) begin
      mapping_coherencyStall_valueNext = 1'b0;
    end
  end

  assign when_PlicMapper_l122 = (mapping_coherencyStall_value != 1'b0);
  always @(*) begin
    mapping_targetMapping_0_targetCompletion_valid = 1'b0;
    case(io_bus_PADDR)
      16'hf004 : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          mapping_targetMapping_0_targetCompletion_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign targets_0_ie_0 = _zz_targets_0_ie_0;
  assign targets_0_ie_1 = _zz_targets_0_ie_1;
  assign targets_0_ie_2 = _zz_targets_0_ie_2;
  assign io_interrupt = targets_0_iep;
  assign mapping_targetMapping_0_targetCompletion_payload = io_bus_PWDATA[1 : 0];
  assign when_Apb3SlaveFactory_l81 = 1'b1;
  always @(posedge _zz_3) begin
    if(!_zz_4) begin
      _zz_targets_0_requests_1_valid <= 1'b0;
      _zz_when_PlicGateway_l21_1 <= 1'b0;
      _zz_targets_0_requests_2_valid <= 1'b0;
      _zz_when_PlicGateway_l21_3 <= 1'b0;
      _zz_targets_0_requests_3_valid <= 1'b0;
      _zz_when_PlicGateway_l21_5 <= 1'b0;
      mapping_coherencyStall_value <= 1'b0;
      _zz_targets_0_ie_0 <= 1'b0;
      _zz_targets_0_ie_1 <= 1'b0;
      _zz_targets_0_ie_2 <= 1'b0;
    end else begin
      if(when_PlicGateway_l21) begin
        _zz_targets_0_requests_1_valid <= _zz_when_PlicGateway_l21;
        _zz_when_PlicGateway_l21_1 <= _zz_when_PlicGateway_l21;
      end
      if(when_PlicGateway_l21_1) begin
        _zz_targets_0_requests_2_valid <= _zz_when_PlicGateway_l21_2;
        _zz_when_PlicGateway_l21_3 <= _zz_when_PlicGateway_l21_2;
      end
      if(when_PlicGateway_l21_2) begin
        _zz_targets_0_requests_3_valid <= _zz_when_PlicGateway_l21_4;
        _zz_when_PlicGateway_l21_5 <= _zz_when_PlicGateway_l21_4;
      end
      if(mapping_claim_valid) begin
        case(mapping_claim_payload)
          2'b00 : begin
            _zz_targets_0_requests_1_valid <= 1'b0;
          end
          2'b01 : begin
            _zz_targets_0_requests_2_valid <= 1'b0;
          end
          2'b10 : begin
            _zz_targets_0_requests_3_valid <= 1'b0;
          end
          default : begin
          end
        endcase
      end
      if(mapping_completion_valid) begin
        case(mapping_completion_payload)
          2'b00 : begin
            _zz_when_PlicGateway_l21_1 <= 1'b0;
          end
          2'b01 : begin
            _zz_when_PlicGateway_l21_3 <= 1'b0;
          end
          2'b10 : begin
            _zz_when_PlicGateway_l21_5 <= 1'b0;
          end
          default : begin
          end
        endcase
      end
      mapping_coherencyStall_value <= mapping_coherencyStall_valueNext;
      case(io_bus_PADDR)
        16'h2000 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            _zz_targets_0_ie_0 <= io_bus_PWDATA[0];
            _zz_targets_0_ie_1 <= io_bus_PWDATA[1];
            _zz_targets_0_ie_2 <= io_bus_PWDATA[2];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge _zz_3) begin
    targets_0_bestRequest_priority <= (_zz_targets_0_bestRequest_priority_2 ? _zz_targets_0_bestRequest_priority : _zz_targets_0_bestRequest_priority_1);
    targets_0_bestRequest_id <= (_zz_targets_0_bestRequest_priority_2 ? (_zz_targets_0_bestRequest_id ? targets_0_requests_0_id : targets_0_requests_1_id) : (_zz_targets_0_bestRequest_id_1 ? targets_0_requests_2_id : targets_0_requests_3_id));
    targets_0_bestRequest_valid <= (_zz_targets_0_bestRequest_priority_2 ? _zz_targets_0_bestRequest_valid : _zz_targets_0_bestRequest_valid_1);
  end


endmodule

module Axi4SharedArbiter_1 (
  input  wire          io_sharedInputs_0_arw_valid,
  output wire          io_sharedInputs_0_arw_ready,
  input  wire [19:0]   io_sharedInputs_0_arw_payload_addr,
  input  wire [3:0]    io_sharedInputs_0_arw_payload_id,
  input  wire [7:0]    io_sharedInputs_0_arw_payload_len,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_size,
  input  wire [1:0]    io_sharedInputs_0_arw_payload_burst,
  input  wire          io_sharedInputs_0_arw_payload_write,
  input  wire          io_sharedInputs_0_w_valid,
  output wire          io_sharedInputs_0_w_ready,
  input  wire [31:0]   io_sharedInputs_0_w_payload_data,
  input  wire [3:0]    io_sharedInputs_0_w_payload_strb,
  input  wire          io_sharedInputs_0_w_payload_last,
  output wire          io_sharedInputs_0_b_valid,
  input  wire          io_sharedInputs_0_b_ready,
  output wire [3:0]    io_sharedInputs_0_b_payload_id,
  output wire [1:0]    io_sharedInputs_0_b_payload_resp,
  output wire          io_sharedInputs_0_r_valid,
  input  wire          io_sharedInputs_0_r_ready,
  output wire [31:0]   io_sharedInputs_0_r_payload_data,
  output wire [3:0]    io_sharedInputs_0_r_payload_id,
  output wire [1:0]    io_sharedInputs_0_r_payload_resp,
  output wire          io_sharedInputs_0_r_payload_last,
  output wire          io_output_arw_valid,
  input  wire          io_output_arw_ready,
  output wire [19:0]   io_output_arw_payload_addr,
  output wire [3:0]    io_output_arw_payload_id,
  output wire [7:0]    io_output_arw_payload_len,
  output wire [2:0]    io_output_arw_payload_size,
  output wire [1:0]    io_output_arw_payload_burst,
  output wire          io_output_arw_payload_write,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [3:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [31:0]   io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_flush;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [19:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_thrown_translated_fifo_io_push_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_availability;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [19:0]   inputsCmd_0_payload_addr;
  wire       [3:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [19:0]   cmdOutputFork_payload_addr;
  wire       [3:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire                cmdOutputFork_payload_write;
  wire                cmdRouteFork_valid;
  reg                 cmdRouteFork_ready;
  wire       [19:0]   cmdRouteFork_payload_addr;
  wire       [3:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire                cmdRouteFork_payload_write;
  reg                 system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1020;
  wire                when_Stream_l1020_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                when_Stream_l439;
  reg                 cmdRouteFork_thrown_valid;
  wire                cmdRouteFork_thrown_ready;
  wire       [19:0]   cmdRouteFork_thrown_payload_addr;
  wire       [3:0]    cmdRouteFork_thrown_payload_id;
  wire       [7:0]    cmdRouteFork_thrown_payload_len;
  wire       [2:0]    cmdRouteFork_thrown_payload_size;
  wire       [1:0]    cmdRouteFork_thrown_payload_burst;
  wire                cmdRouteFork_thrown_payload_write;
  wire                cmdRouteFork_thrown_translated_valid;
  wire                cmdRouteFork_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire                readRspSels_0;

  StreamArbiter cmdArbiter (
    .io_inputs_0_valid         (inputsCmd_0_valid                      ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (inputsCmd_0_payload_addr[19:0]         ), //i
    .io_inputs_0_payload_id    (inputsCmd_0_payload_id[3:0]            ), //i
    .io_inputs_0_payload_len   (inputsCmd_0_payload_len[7:0]           ), //i
    .io_inputs_0_payload_size  (inputsCmd_0_payload_size[2:0]          ), //i
    .io_inputs_0_payload_burst (inputsCmd_0_payload_burst[1:0]         ), //i
    .io_inputs_0_payload_write (inputsCmd_0_payload_write              ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[19:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[3:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_write   (cmdArbiter_io_output_payload_write     ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH                 ), //o
    ._zz_1                     (_zz_1                                  ), //i
    ._zz_2                     (_zz_2                                  )  //i
  );
  StreamFifoLowLatency_1 cmdRouteFork_thrown_translated_fifo (
    .io_push_valid   (cmdRouteFork_thrown_translated_valid                    ), //i
    .io_push_ready   (cmdRouteFork_thrown_translated_fifo_io_push_ready       ), //o
    .io_pop_valid    (cmdRouteFork_thrown_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready    (cmdRouteFork_thrown_translated_fifo_io_pop_ready        ), //i
    .io_flush        (cmdRouteFork_thrown_translated_fifo_io_flush            ), //i
    .io_occupancy    (cmdRouteFork_thrown_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability (cmdRouteFork_thrown_translated_fifo_io_availability[2:0]), //o
    ._zz_1           (_zz_1                                                   ), //i
    ._zz_2           (_zz_2                                                   )  //i
  );
  assign inputsCmd_0_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_0_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_0_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_0_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_0_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_0_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1020) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1020_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1020 = ((! cmdOutputFork_ready) && system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1020_1 = ((! cmdRouteFork_ready) && system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_arw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_arw_ready;
  assign io_output_arw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_arw_payload_len = cmdOutputFork_payload_len;
  assign io_output_arw_payload_size = cmdOutputFork_payload_size;
  assign io_output_arw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_arw_payload_write = cmdOutputFork_payload_write;
  assign io_output_arw_payload_id = (cmdOutputFork_payload_write ? cmdOutputFork_payload_id : cmdOutputFork_payload_id);
  assign when_Stream_l439 = (! cmdRouteFork_payload_write);
  always @(*) begin
    cmdRouteFork_thrown_valid = cmdRouteFork_valid;
    if(when_Stream_l439) begin
      cmdRouteFork_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdRouteFork_ready = cmdRouteFork_thrown_ready;
    if(when_Stream_l439) begin
      cmdRouteFork_ready = 1'b1;
    end
  end

  assign cmdRouteFork_thrown_payload_addr = cmdRouteFork_payload_addr;
  assign cmdRouteFork_thrown_payload_id = cmdRouteFork_payload_id;
  assign cmdRouteFork_thrown_payload_len = cmdRouteFork_payload_len;
  assign cmdRouteFork_thrown_payload_size = cmdRouteFork_payload_size;
  assign cmdRouteFork_thrown_payload_burst = cmdRouteFork_payload_burst;
  assign cmdRouteFork_thrown_payload_write = cmdRouteFork_payload_write;
  assign cmdRouteFork_thrown_translated_valid = cmdRouteFork_thrown_valid;
  assign cmdRouteFork_thrown_ready = cmdRouteFork_thrown_translated_ready;
  assign cmdRouteFork_thrown_translated_ready = cmdRouteFork_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdRouteFork_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdRouteFork_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_thrown_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id;
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspSels_0 = 1'b1;
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id;
  assign io_output_r_ready = io_sharedInputs_0_r_ready;
  assign cmdRouteFork_thrown_translated_fifo_io_flush = 1'b0;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        system_apbBridge_io_axi_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4ReadOnlyArbiter (
  input  wire          io_inputs_0_ar_valid,
  output wire          io_inputs_0_ar_ready,
  input  wire [19:0]   io_inputs_0_ar_payload_addr,
  input  wire [2:0]    io_inputs_0_ar_payload_id,
  input  wire [3:0]    io_inputs_0_ar_payload_region,
  input  wire [7:0]    io_inputs_0_ar_payload_len,
  input  wire [2:0]    io_inputs_0_ar_payload_size,
  input  wire [1:0]    io_inputs_0_ar_payload_burst,
  input  wire [0:0]    io_inputs_0_ar_payload_lock,
  input  wire [3:0]    io_inputs_0_ar_payload_cache,
  input  wire [3:0]    io_inputs_0_ar_payload_qos,
  input  wire [2:0]    io_inputs_0_ar_payload_prot,
  output wire          io_inputs_0_r_valid,
  input  wire          io_inputs_0_r_ready,
  output wire [31:0]   io_inputs_0_r_payload_data,
  output wire [2:0]    io_inputs_0_r_payload_id,
  output wire [1:0]    io_inputs_0_r_payload_resp,
  output wire          io_inputs_0_r_payload_last,
  input  wire          io_inputs_1_ar_valid,
  output wire          io_inputs_1_ar_ready,
  input  wire [19:0]   io_inputs_1_ar_payload_addr,
  input  wire [2:0]    io_inputs_1_ar_payload_id,
  input  wire [3:0]    io_inputs_1_ar_payload_region,
  input  wire [7:0]    io_inputs_1_ar_payload_len,
  input  wire [2:0]    io_inputs_1_ar_payload_size,
  input  wire [1:0]    io_inputs_1_ar_payload_burst,
  input  wire [0:0]    io_inputs_1_ar_payload_lock,
  input  wire [3:0]    io_inputs_1_ar_payload_cache,
  input  wire [3:0]    io_inputs_1_ar_payload_qos,
  input  wire [2:0]    io_inputs_1_ar_payload_prot,
  output wire          io_inputs_1_r_valid,
  input  wire          io_inputs_1_r_ready,
  output wire [31:0]   io_inputs_1_r_payload_data,
  output wire [2:0]    io_inputs_1_r_payload_id,
  output wire [1:0]    io_inputs_1_r_payload_resp,
  output wire          io_inputs_1_r_payload_last,
  output wire          io_output_ar_valid,
  input  wire          io_output_ar_ready,
  output wire [19:0]   io_output_ar_payload_addr,
  output wire [3:0]    io_output_ar_payload_id,
  output wire [3:0]    io_output_ar_payload_region,
  output wire [7:0]    io_output_ar_payload_len,
  output wire [2:0]    io_output_ar_payload_size,
  output wire [1:0]    io_output_ar_payload_burst,
  output wire [0:0]    io_output_ar_payload_lock,
  output wire [3:0]    io_output_ar_payload_cache,
  output wire [3:0]    io_output_ar_payload_qos,
  output wire [2:0]    io_output_ar_payload_prot,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [31:0]   io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [19:0]   cmdArbiter_io_output_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_payload_id;
  wire       [3:0]    cmdArbiter_io_output_payload_region;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_payload_cache;
  wire       [3:0]    cmdArbiter_io_output_payload_qos;
  wire       [2:0]    cmdArbiter_io_output_payload_prot;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  reg                 _zz_io_output_r_ready;
  wire       [0:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;

  StreamArbiter_1 cmdArbiter (
    .io_inputs_0_valid          (io_inputs_0_ar_valid                    ), //i
    .io_inputs_0_ready          (cmdArbiter_io_inputs_0_ready            ), //o
    .io_inputs_0_payload_addr   (io_inputs_0_ar_payload_addr[19:0]       ), //i
    .io_inputs_0_payload_id     (io_inputs_0_ar_payload_id[2:0]          ), //i
    .io_inputs_0_payload_region (io_inputs_0_ar_payload_region[3:0]      ), //i
    .io_inputs_0_payload_len    (io_inputs_0_ar_payload_len[7:0]         ), //i
    .io_inputs_0_payload_size   (io_inputs_0_ar_payload_size[2:0]        ), //i
    .io_inputs_0_payload_burst  (io_inputs_0_ar_payload_burst[1:0]       ), //i
    .io_inputs_0_payload_lock   (io_inputs_0_ar_payload_lock             ), //i
    .io_inputs_0_payload_cache  (io_inputs_0_ar_payload_cache[3:0]       ), //i
    .io_inputs_0_payload_qos    (io_inputs_0_ar_payload_qos[3:0]         ), //i
    .io_inputs_0_payload_prot   (io_inputs_0_ar_payload_prot[2:0]        ), //i
    .io_inputs_1_valid          (io_inputs_1_ar_valid                    ), //i
    .io_inputs_1_ready          (cmdArbiter_io_inputs_1_ready            ), //o
    .io_inputs_1_payload_addr   (io_inputs_1_ar_payload_addr[19:0]       ), //i
    .io_inputs_1_payload_id     (io_inputs_1_ar_payload_id[2:0]          ), //i
    .io_inputs_1_payload_region (io_inputs_1_ar_payload_region[3:0]      ), //i
    .io_inputs_1_payload_len    (io_inputs_1_ar_payload_len[7:0]         ), //i
    .io_inputs_1_payload_size   (io_inputs_1_ar_payload_size[2:0]        ), //i
    .io_inputs_1_payload_burst  (io_inputs_1_ar_payload_burst[1:0]       ), //i
    .io_inputs_1_payload_lock   (io_inputs_1_ar_payload_lock             ), //i
    .io_inputs_1_payload_cache  (io_inputs_1_ar_payload_cache[3:0]       ), //i
    .io_inputs_1_payload_qos    (io_inputs_1_ar_payload_qos[3:0]         ), //i
    .io_inputs_1_payload_prot   (io_inputs_1_ar_payload_prot[2:0]        ), //i
    .io_output_valid            (cmdArbiter_io_output_valid              ), //o
    .io_output_ready            (io_output_ar_ready                      ), //i
    .io_output_payload_addr     (cmdArbiter_io_output_payload_addr[19:0] ), //o
    .io_output_payload_id       (cmdArbiter_io_output_payload_id[2:0]    ), //o
    .io_output_payload_region   (cmdArbiter_io_output_payload_region[3:0]), //o
    .io_output_payload_len      (cmdArbiter_io_output_payload_len[7:0]   ), //o
    .io_output_payload_size     (cmdArbiter_io_output_payload_size[2:0]  ), //o
    .io_output_payload_burst    (cmdArbiter_io_output_payload_burst[1:0] ), //o
    .io_output_payload_lock     (cmdArbiter_io_output_payload_lock       ), //o
    .io_output_payload_cache    (cmdArbiter_io_output_payload_cache[3:0] ), //o
    .io_output_payload_qos      (cmdArbiter_io_output_payload_qos[3:0]   ), //o
    .io_output_payload_prot     (cmdArbiter_io_output_payload_prot[2:0]  ), //o
    .io_chosen                  (cmdArbiter_io_chosen                    ), //o
    .io_chosenOH                (cmdArbiter_io_chosenOH[1:0]             ), //o
    ._zz_1                      (_zz_1                                   ), //i
    ._zz_2                      (_zz_2                                   )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : _zz_io_output_r_ready = io_inputs_0_r_ready;
      default : _zz_io_output_r_ready = io_inputs_1_r_ready;
    endcase
  end

  assign io_inputs_0_ar_ready = cmdArbiter_io_inputs_0_ready;
  assign io_inputs_1_ar_ready = cmdArbiter_io_inputs_1_ready;
  assign io_output_ar_valid = cmdArbiter_io_output_valid;
  assign io_output_ar_payload_addr = cmdArbiter_io_output_payload_addr;
  assign io_output_ar_payload_region = cmdArbiter_io_output_payload_region;
  assign io_output_ar_payload_len = cmdArbiter_io_output_payload_len;
  assign io_output_ar_payload_size = cmdArbiter_io_output_payload_size;
  assign io_output_ar_payload_burst = cmdArbiter_io_output_payload_burst;
  assign io_output_ar_payload_lock = cmdArbiter_io_output_payload_lock;
  assign io_output_ar_payload_cache = cmdArbiter_io_output_payload_cache;
  assign io_output_ar_payload_qos = cmdArbiter_io_output_payload_qos;
  assign io_output_ar_payload_prot = cmdArbiter_io_output_payload_prot;
  assign io_output_ar_payload_id = {cmdArbiter_io_chosen,cmdArbiter_io_output_payload_id};
  assign readRspIndex = io_output_r_payload_id[3 : 3];
  assign readRspSels_0 = (readRspIndex == 1'b0);
  assign readRspSels_1 = (readRspIndex == 1'b1);
  assign io_inputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_inputs_0_r_payload_data = io_output_r_payload_data;
  assign io_inputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_0_r_payload_last = io_output_r_payload_last;
  assign io_inputs_0_r_payload_id = io_output_r_payload_id[2 : 0];
  assign io_inputs_1_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_inputs_1_r_payload_data = io_output_r_payload_data;
  assign io_inputs_1_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_1_r_payload_last = io_output_r_payload_last;
  assign io_inputs_1_r_payload_id = io_output_r_payload_id[2 : 0];
  assign io_output_r_ready = _zz_io_output_r_ready;

endmodule

module Axi4SharedArbiter (
  input  wire          io_readInputs_0_ar_valid,
  output wire          io_readInputs_0_ar_ready,
  input  wire [31:0]   io_readInputs_0_ar_payload_addr,
  input  wire [2:0]    io_readInputs_0_ar_payload_id,
  input  wire [3:0]    io_readInputs_0_ar_payload_region,
  input  wire [7:0]    io_readInputs_0_ar_payload_len,
  input  wire [2:0]    io_readInputs_0_ar_payload_size,
  input  wire [1:0]    io_readInputs_0_ar_payload_burst,
  input  wire [0:0]    io_readInputs_0_ar_payload_lock,
  input  wire [3:0]    io_readInputs_0_ar_payload_cache,
  input  wire [3:0]    io_readInputs_0_ar_payload_qos,
  input  wire [2:0]    io_readInputs_0_ar_payload_prot,
  output wire          io_readInputs_0_r_valid,
  input  wire          io_readInputs_0_r_ready,
  output wire [31:0]   io_readInputs_0_r_payload_data,
  output wire [2:0]    io_readInputs_0_r_payload_id,
  output wire [1:0]    io_readInputs_0_r_payload_resp,
  output wire          io_readInputs_0_r_payload_last,
  input  wire          io_sharedInputs_0_arw_valid,
  output wire          io_sharedInputs_0_arw_ready,
  input  wire [31:0]   io_sharedInputs_0_arw_payload_addr,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_id,
  input  wire [3:0]    io_sharedInputs_0_arw_payload_region,
  input  wire [7:0]    io_sharedInputs_0_arw_payload_len,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_size,
  input  wire [1:0]    io_sharedInputs_0_arw_payload_burst,
  input  wire [0:0]    io_sharedInputs_0_arw_payload_lock,
  input  wire [3:0]    io_sharedInputs_0_arw_payload_cache,
  input  wire [3:0]    io_sharedInputs_0_arw_payload_qos,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_prot,
  input  wire          io_sharedInputs_0_arw_payload_write,
  input  wire          io_sharedInputs_0_w_valid,
  output wire          io_sharedInputs_0_w_ready,
  input  wire [31:0]   io_sharedInputs_0_w_payload_data,
  input  wire [3:0]    io_sharedInputs_0_w_payload_strb,
  input  wire          io_sharedInputs_0_w_payload_last,
  output wire          io_sharedInputs_0_b_valid,
  input  wire          io_sharedInputs_0_b_ready,
  output wire [2:0]    io_sharedInputs_0_b_payload_id,
  output wire [1:0]    io_sharedInputs_0_b_payload_resp,
  output wire          io_sharedInputs_0_r_valid,
  input  wire          io_sharedInputs_0_r_ready,
  output wire [31:0]   io_sharedInputs_0_r_payload_data,
  output wire [2:0]    io_sharedInputs_0_r_payload_id,
  output wire [1:0]    io_sharedInputs_0_r_payload_resp,
  output wire          io_sharedInputs_0_r_payload_last,
  output wire          io_output_arw_valid,
  input  wire          io_output_arw_ready,
  output wire [31:0]   io_output_arw_payload_addr,
  output wire [3:0]    io_output_arw_payload_id,
  output wire [3:0]    io_output_arw_payload_region,
  output wire [7:0]    io_output_arw_payload_len,
  output wire [2:0]    io_output_arw_payload_size,
  output wire [1:0]    io_output_arw_payload_burst,
  output wire [0:0]    io_output_arw_payload_lock,
  output wire [3:0]    io_output_arw_payload_cache,
  output wire [3:0]    io_output_arw_payload_qos,
  output wire [2:0]    io_output_arw_payload_prot,
  output wire          io_output_arw_payload_write,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [3:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [31:0]   io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_flush;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_payload_id;
  wire       [3:0]    cmdArbiter_io_output_payload_region;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_payload_cache;
  wire       [3:0]    cmdArbiter_io_output_payload_qos;
  wire       [2:0]    cmdArbiter_io_output_payload_prot;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_thrown_translated_fifo_io_push_ready;
  wire                cmdRouteFork_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_thrown_translated_fifo_io_availability;
  wire       [1:0]    _zz__zz_io_output_arw_payload_id;
  wire       [3:0]    _zz_io_output_arw_payload_id_1;
  wire       [2:0]    _zz_io_output_arw_payload_id_2;
  reg                 _zz_io_output_r_ready;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [31:0]   inputsCmd_0_payload_addr;
  wire       [2:0]    inputsCmd_0_payload_id;
  wire       [3:0]    inputsCmd_0_payload_region;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire       [0:0]    inputsCmd_0_payload_lock;
  wire       [3:0]    inputsCmd_0_payload_cache;
  wire       [3:0]    inputsCmd_0_payload_qos;
  wire       [2:0]    inputsCmd_0_payload_prot;
  wire                inputsCmd_0_payload_write;
  wire                inputsCmd_1_valid;
  wire                inputsCmd_1_ready;
  wire       [31:0]   inputsCmd_1_payload_addr;
  wire       [2:0]    inputsCmd_1_payload_id;
  wire       [3:0]    inputsCmd_1_payload_region;
  wire       [7:0]    inputsCmd_1_payload_len;
  wire       [2:0]    inputsCmd_1_payload_size;
  wire       [1:0]    inputsCmd_1_payload_burst;
  wire       [0:0]    inputsCmd_1_payload_lock;
  wire       [3:0]    inputsCmd_1_payload_cache;
  wire       [3:0]    inputsCmd_1_payload_qos;
  wire       [2:0]    inputsCmd_1_payload_prot;
  wire                inputsCmd_1_payload_write;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [31:0]   cmdOutputFork_payload_addr;
  wire       [2:0]    cmdOutputFork_payload_id;
  wire       [3:0]    cmdOutputFork_payload_region;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire       [0:0]    cmdOutputFork_payload_lock;
  wire       [3:0]    cmdOutputFork_payload_cache;
  wire       [3:0]    cmdOutputFork_payload_qos;
  wire       [2:0]    cmdOutputFork_payload_prot;
  wire                cmdOutputFork_payload_write;
  wire                cmdRouteFork_valid;
  reg                 cmdRouteFork_ready;
  wire       [31:0]   cmdRouteFork_payload_addr;
  wire       [2:0]    cmdRouteFork_payload_id;
  wire       [3:0]    cmdRouteFork_payload_region;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire       [0:0]    cmdRouteFork_payload_lock;
  wire       [3:0]    cmdRouteFork_payload_cache;
  wire       [3:0]    cmdRouteFork_payload_qos;
  wire       [2:0]    cmdRouteFork_payload_prot;
  wire                cmdRouteFork_payload_write;
  reg                 system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1020;
  wire                when_Stream_l1020_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                _zz_io_output_arw_payload_id;
  wire                when_Stream_l439;
  reg                 cmdRouteFork_thrown_valid;
  wire                cmdRouteFork_thrown_ready;
  wire       [31:0]   cmdRouteFork_thrown_payload_addr;
  wire       [2:0]    cmdRouteFork_thrown_payload_id;
  wire       [3:0]    cmdRouteFork_thrown_payload_region;
  wire       [7:0]    cmdRouteFork_thrown_payload_len;
  wire       [2:0]    cmdRouteFork_thrown_payload_size;
  wire       [1:0]    cmdRouteFork_thrown_payload_burst;
  wire       [0:0]    cmdRouteFork_thrown_payload_lock;
  wire       [3:0]    cmdRouteFork_thrown_payload_cache;
  wire       [3:0]    cmdRouteFork_thrown_payload_qos;
  wire       [2:0]    cmdRouteFork_thrown_payload_prot;
  wire                cmdRouteFork_thrown_payload_write;
  wire                cmdRouteFork_thrown_translated_valid;
  wire                cmdRouteFork_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire       [0:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;

  assign _zz__zz_io_output_arw_payload_id = {cmdArbiter_io_chosenOH[1 : 1],cmdArbiter_io_chosenOH[0 : 0]};
  assign _zz_io_output_arw_payload_id_2 = cmdOutputFork_payload_id;
  assign _zz_io_output_arw_payload_id_1 = {1'd0, _zz_io_output_arw_payload_id_2};
  StreamArbiter_2 cmdArbiter (
    .io_inputs_0_valid          (inputsCmd_0_valid                       ), //i
    .io_inputs_0_ready          (cmdArbiter_io_inputs_0_ready            ), //o
    .io_inputs_0_payload_addr   (inputsCmd_0_payload_addr[31:0]          ), //i
    .io_inputs_0_payload_id     (inputsCmd_0_payload_id[2:0]             ), //i
    .io_inputs_0_payload_region (inputsCmd_0_payload_region[3:0]         ), //i
    .io_inputs_0_payload_len    (inputsCmd_0_payload_len[7:0]            ), //i
    .io_inputs_0_payload_size   (inputsCmd_0_payload_size[2:0]           ), //i
    .io_inputs_0_payload_burst  (inputsCmd_0_payload_burst[1:0]          ), //i
    .io_inputs_0_payload_lock   (inputsCmd_0_payload_lock                ), //i
    .io_inputs_0_payload_cache  (inputsCmd_0_payload_cache[3:0]          ), //i
    .io_inputs_0_payload_qos    (inputsCmd_0_payload_qos[3:0]            ), //i
    .io_inputs_0_payload_prot   (inputsCmd_0_payload_prot[2:0]           ), //i
    .io_inputs_0_payload_write  (inputsCmd_0_payload_write               ), //i
    .io_inputs_1_valid          (inputsCmd_1_valid                       ), //i
    .io_inputs_1_ready          (cmdArbiter_io_inputs_1_ready            ), //o
    .io_inputs_1_payload_addr   (inputsCmd_1_payload_addr[31:0]          ), //i
    .io_inputs_1_payload_id     (inputsCmd_1_payload_id[2:0]             ), //i
    .io_inputs_1_payload_region (inputsCmd_1_payload_region[3:0]         ), //i
    .io_inputs_1_payload_len    (inputsCmd_1_payload_len[7:0]            ), //i
    .io_inputs_1_payload_size   (inputsCmd_1_payload_size[2:0]           ), //i
    .io_inputs_1_payload_burst  (inputsCmd_1_payload_burst[1:0]          ), //i
    .io_inputs_1_payload_lock   (inputsCmd_1_payload_lock                ), //i
    .io_inputs_1_payload_cache  (inputsCmd_1_payload_cache[3:0]          ), //i
    .io_inputs_1_payload_qos    (inputsCmd_1_payload_qos[3:0]            ), //i
    .io_inputs_1_payload_prot   (inputsCmd_1_payload_prot[2:0]           ), //i
    .io_inputs_1_payload_write  (inputsCmd_1_payload_write               ), //i
    .io_output_valid            (cmdArbiter_io_output_valid              ), //o
    .io_output_ready            (cmdArbiter_io_output_ready              ), //i
    .io_output_payload_addr     (cmdArbiter_io_output_payload_addr[31:0] ), //o
    .io_output_payload_id       (cmdArbiter_io_output_payload_id[2:0]    ), //o
    .io_output_payload_region   (cmdArbiter_io_output_payload_region[3:0]), //o
    .io_output_payload_len      (cmdArbiter_io_output_payload_len[7:0]   ), //o
    .io_output_payload_size     (cmdArbiter_io_output_payload_size[2:0]  ), //o
    .io_output_payload_burst    (cmdArbiter_io_output_payload_burst[1:0] ), //o
    .io_output_payload_lock     (cmdArbiter_io_output_payload_lock       ), //o
    .io_output_payload_cache    (cmdArbiter_io_output_payload_cache[3:0] ), //o
    .io_output_payload_qos      (cmdArbiter_io_output_payload_qos[3:0]   ), //o
    .io_output_payload_prot     (cmdArbiter_io_output_payload_prot[2:0]  ), //o
    .io_output_payload_write    (cmdArbiter_io_output_payload_write      ), //o
    .io_chosen                  (cmdArbiter_io_chosen                    ), //o
    .io_chosenOH                (cmdArbiter_io_chosenOH[1:0]             ), //o
    ._zz_1                      (_zz_1                                   ), //i
    ._zz_2                      (_zz_2                                   )  //i
  );
  StreamFifoLowLatency_1 cmdRouteFork_thrown_translated_fifo (
    .io_push_valid   (cmdRouteFork_thrown_translated_valid                    ), //i
    .io_push_ready   (cmdRouteFork_thrown_translated_fifo_io_push_ready       ), //o
    .io_pop_valid    (cmdRouteFork_thrown_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready    (cmdRouteFork_thrown_translated_fifo_io_pop_ready        ), //i
    .io_flush        (cmdRouteFork_thrown_translated_fifo_io_flush            ), //i
    .io_occupancy    (cmdRouteFork_thrown_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability (cmdRouteFork_thrown_translated_fifo_io_availability[2:0]), //o
    ._zz_1           (_zz_1                                                   ), //i
    ._zz_2           (_zz_2                                                   )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : _zz_io_output_r_ready = io_readInputs_0_r_ready;
      default : _zz_io_output_r_ready = io_sharedInputs_0_r_ready;
    endcase
  end

  assign inputsCmd_0_valid = io_readInputs_0_ar_valid;
  assign io_readInputs_0_ar_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_readInputs_0_ar_payload_addr;
  assign inputsCmd_0_payload_id = io_readInputs_0_ar_payload_id;
  assign inputsCmd_0_payload_region = io_readInputs_0_ar_payload_region;
  assign inputsCmd_0_payload_len = io_readInputs_0_ar_payload_len;
  assign inputsCmd_0_payload_size = io_readInputs_0_ar_payload_size;
  assign inputsCmd_0_payload_burst = io_readInputs_0_ar_payload_burst;
  assign inputsCmd_0_payload_lock = io_readInputs_0_ar_payload_lock;
  assign inputsCmd_0_payload_cache = io_readInputs_0_ar_payload_cache;
  assign inputsCmd_0_payload_qos = io_readInputs_0_ar_payload_qos;
  assign inputsCmd_0_payload_prot = io_readInputs_0_ar_payload_prot;
  assign inputsCmd_0_payload_write = 1'b0;
  assign inputsCmd_1_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_1_ready;
  assign inputsCmd_1_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_1_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_1_payload_region = io_sharedInputs_0_arw_payload_region;
  assign inputsCmd_1_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_1_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_1_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_1_payload_lock = io_sharedInputs_0_arw_payload_lock;
  assign inputsCmd_1_payload_cache = io_sharedInputs_0_arw_payload_cache;
  assign inputsCmd_1_payload_qos = io_sharedInputs_0_arw_payload_qos;
  assign inputsCmd_1_payload_prot = io_sharedInputs_0_arw_payload_prot;
  assign inputsCmd_1_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign inputsCmd_1_ready = cmdArbiter_io_inputs_1_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1020) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1020_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1020 = ((! cmdOutputFork_ready) && system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1020_1 = ((! cmdRouteFork_ready) && system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_region = cmdArbiter_io_output_payload_region;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_lock = cmdArbiter_io_output_payload_lock;
  assign cmdOutputFork_payload_cache = cmdArbiter_io_output_payload_cache;
  assign cmdOutputFork_payload_qos = cmdArbiter_io_output_payload_qos;
  assign cmdOutputFork_payload_prot = cmdArbiter_io_output_payload_prot;
  assign cmdOutputFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_region = cmdArbiter_io_output_payload_region;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_lock = cmdArbiter_io_output_payload_lock;
  assign cmdRouteFork_payload_cache = cmdArbiter_io_output_payload_cache;
  assign cmdRouteFork_payload_qos = cmdArbiter_io_output_payload_qos;
  assign cmdRouteFork_payload_prot = cmdArbiter_io_output_payload_prot;
  assign cmdRouteFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_arw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_arw_ready;
  assign io_output_arw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_arw_payload_region = cmdOutputFork_payload_region;
  assign io_output_arw_payload_len = cmdOutputFork_payload_len;
  assign io_output_arw_payload_size = cmdOutputFork_payload_size;
  assign io_output_arw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_arw_payload_lock = cmdOutputFork_payload_lock;
  assign io_output_arw_payload_cache = cmdOutputFork_payload_cache;
  assign io_output_arw_payload_qos = cmdOutputFork_payload_qos;
  assign io_output_arw_payload_prot = cmdOutputFork_payload_prot;
  assign io_output_arw_payload_write = cmdOutputFork_payload_write;
  assign _zz_io_output_arw_payload_id = _zz__zz_io_output_arw_payload_id[1];
  assign io_output_arw_payload_id = (cmdOutputFork_payload_write ? _zz_io_output_arw_payload_id_1 : {_zz_io_output_arw_payload_id,cmdOutputFork_payload_id});
  assign when_Stream_l439 = (! cmdRouteFork_payload_write);
  always @(*) begin
    cmdRouteFork_thrown_valid = cmdRouteFork_valid;
    if(when_Stream_l439) begin
      cmdRouteFork_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdRouteFork_ready = cmdRouteFork_thrown_ready;
    if(when_Stream_l439) begin
      cmdRouteFork_ready = 1'b1;
    end
  end

  assign cmdRouteFork_thrown_payload_addr = cmdRouteFork_payload_addr;
  assign cmdRouteFork_thrown_payload_id = cmdRouteFork_payload_id;
  assign cmdRouteFork_thrown_payload_region = cmdRouteFork_payload_region;
  assign cmdRouteFork_thrown_payload_len = cmdRouteFork_payload_len;
  assign cmdRouteFork_thrown_payload_size = cmdRouteFork_payload_size;
  assign cmdRouteFork_thrown_payload_burst = cmdRouteFork_payload_burst;
  assign cmdRouteFork_thrown_payload_lock = cmdRouteFork_payload_lock;
  assign cmdRouteFork_thrown_payload_cache = cmdRouteFork_payload_cache;
  assign cmdRouteFork_thrown_payload_qos = cmdRouteFork_payload_qos;
  assign cmdRouteFork_thrown_payload_prot = cmdRouteFork_payload_prot;
  assign cmdRouteFork_thrown_payload_write = cmdRouteFork_payload_write;
  assign cmdRouteFork_thrown_translated_valid = cmdRouteFork_thrown_valid;
  assign cmdRouteFork_thrown_ready = cmdRouteFork_thrown_translated_ready;
  assign cmdRouteFork_thrown_translated_ready = cmdRouteFork_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdRouteFork_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdRouteFork_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_thrown_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id[2:0];
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspIndex = io_output_r_payload_id[3 : 3];
  assign readRspSels_0 = (readRspIndex == 1'b0);
  assign readRspSels_1 = (readRspIndex == 1'b1);
  assign io_readInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_readInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_readInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_readInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_readInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_output_r_ready = _zz_io_output_r_ready;
  assign cmdRouteFork_thrown_translated_fifo_io_flush = 1'b0;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        system_hyperbus_ctrl_io_memory_arbiter_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4SharedDecoder (
  input  wire          io_input_arw_valid,
  output wire          io_input_arw_ready,
  input  wire [31:0]   io_input_arw_payload_addr,
  input  wire [2:0]    io_input_arw_payload_size,
  input  wire [3:0]    io_input_arw_payload_cache,
  input  wire [2:0]    io_input_arw_payload_prot,
  input  wire          io_input_arw_payload_write,
  input  wire          io_input_w_valid,
  output wire          io_input_w_ready,
  input  wire [31:0]   io_input_w_payload_data,
  input  wire [3:0]    io_input_w_payload_strb,
  input  wire          io_input_w_payload_last,
  output wire          io_input_b_valid,
  input  wire          io_input_b_ready,
  output reg  [1:0]    io_input_b_payload_resp,
  output wire          io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [31:0]   io_input_r_payload_data,
  output reg  [1:0]    io_input_r_payload_resp,
  output reg           io_input_r_payload_last,
  output wire          io_readOutputs_0_ar_valid,
  input  wire          io_readOutputs_0_ar_ready,
  output wire [31:0]   io_readOutputs_0_ar_payload_addr,
  output wire [2:0]    io_readOutputs_0_ar_payload_size,
  output wire [3:0]    io_readOutputs_0_ar_payload_cache,
  output wire [2:0]    io_readOutputs_0_ar_payload_prot,
  input  wire          io_readOutputs_0_r_valid,
  output wire          io_readOutputs_0_r_ready,
  input  wire [31:0]   io_readOutputs_0_r_payload_data,
  input  wire [1:0]    io_readOutputs_0_r_payload_resp,
  input  wire          io_readOutputs_0_r_payload_last,
  output wire          io_sharedOutputs_0_arw_valid,
  input  wire          io_sharedOutputs_0_arw_ready,
  output wire [31:0]   io_sharedOutputs_0_arw_payload_addr,
  output wire [2:0]    io_sharedOutputs_0_arw_payload_size,
  output wire [3:0]    io_sharedOutputs_0_arw_payload_cache,
  output wire [2:0]    io_sharedOutputs_0_arw_payload_prot,
  output wire          io_sharedOutputs_0_arw_payload_write,
  output wire          io_sharedOutputs_0_w_valid,
  input  wire          io_sharedOutputs_0_w_ready,
  output wire [31:0]   io_sharedOutputs_0_w_payload_data,
  output wire [3:0]    io_sharedOutputs_0_w_payload_strb,
  output wire          io_sharedOutputs_0_w_payload_last,
  input  wire          io_sharedOutputs_0_b_valid,
  output wire          io_sharedOutputs_0_b_ready,
  input  wire [1:0]    io_sharedOutputs_0_b_payload_resp,
  input  wire          io_sharedOutputs_0_r_valid,
  output wire          io_sharedOutputs_0_r_ready,
  input  wire [31:0]   io_sharedOutputs_0_r_payload_data,
  input  wire [1:0]    io_sharedOutputs_0_r_payload_resp,
  input  wire          io_sharedOutputs_0_r_payload_last,
  output wire          io_sharedOutputs_1_arw_valid,
  input  wire          io_sharedOutputs_1_arw_ready,
  output wire [31:0]   io_sharedOutputs_1_arw_payload_addr,
  output wire [2:0]    io_sharedOutputs_1_arw_payload_size,
  output wire [3:0]    io_sharedOutputs_1_arw_payload_cache,
  output wire [2:0]    io_sharedOutputs_1_arw_payload_prot,
  output wire          io_sharedOutputs_1_arw_payload_write,
  output wire          io_sharedOutputs_1_w_valid,
  input  wire          io_sharedOutputs_1_w_ready,
  output wire [31:0]   io_sharedOutputs_1_w_payload_data,
  output wire [3:0]    io_sharedOutputs_1_w_payload_strb,
  output wire          io_sharedOutputs_1_w_payload_last,
  input  wire          io_sharedOutputs_1_b_valid,
  output wire          io_sharedOutputs_1_b_ready,
  input  wire [1:0]    io_sharedOutputs_1_b_payload_resp,
  input  wire          io_sharedOutputs_1_r_valid,
  output wire          io_sharedOutputs_1_r_ready,
  input  wire [31:0]   io_sharedOutputs_1_r_payload_data,
  input  wire [1:0]    io_sharedOutputs_1_r_payload_resp,
  input  wire          io_sharedOutputs_1_r_payload_last,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire                errorSlave_io_axi_arw_valid;
  wire                errorSlave_io_axi_w_valid;
  wire                errorSlave_io_axi_arw_ready;
  wire                errorSlave_io_axi_w_ready;
  wire                errorSlave_io_axi_b_valid;
  wire       [1:0]    errorSlave_io_axi_b_payload_resp;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  wire       [1:0]    _zz__zz_writeRspIndex;
  reg        [1:0]    _zz_io_input_b_payload_resp;
  reg        [31:0]   _zz_io_input_r_payload_data;
  reg        [1:0]    _zz_io_input_r_payload_resp;
  reg                 _zz_io_input_r_payload_last;
  reg        [2:0]    _zz_pendingCmdCounter;
  reg        [2:0]    _zz_pendingCmdCounter_1;
  reg        [2:0]    _zz_pendingCmdCounter_2;
  wire                cmdAllowedStart;
  wire                io_input_arw_fire;
  wire                io_input_b_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l754;
  reg        [2:0]    pendingCmdCounter;
  wire       [2:0]    _zz_pendingCmdCounter_3;
  wire                when_Utils_l694;
  wire                io_input_w_fire;
  wire                when_Utils_l697;
  reg                 pendingDataCounter_incrementIt;
  reg                 pendingDataCounter_decrementIt;
  wire       [2:0]    pendingDataCounter_valueNext;
  reg        [2:0]    pendingDataCounter_value;
  wire                pendingDataCounter_mayOverflow;
  wire                pendingDataCounter_willOverflowIfInc;
  wire                pendingDataCounter_willOverflow;
  reg        [2:0]    pendingDataCounter_finalIncrement;
  wire                when_Utils_l723;
  wire                when_Utils_l725;
  wire       [2:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [2:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                allowData;
  reg                 _zz_cmdAllowedStart;
  wire       [1:0]    _zz_io_sharedOutputs_0_arw_valid;
  wire       [1:0]    _zz_io_sharedOutputs_0_w_valid;
  wire                _zz_writeRspIndex;
  wire       [0:0]    writeRspIndex;
  wire       [2:0]    _zz_readRspIndex;
  wire                _zz_readRspIndex_1;
  wire                _zz_readRspIndex_2;
  wire       [1:0]    readRspIndex;

  assign _zz__zz_writeRspIndex = pendingSels[2 : 1];
  Axi4SharedErrorSlave errorSlave (
    .io_axi_arw_valid         (errorSlave_io_axi_arw_valid           ), //i
    .io_axi_arw_ready         (errorSlave_io_axi_arw_ready           ), //o
    .io_axi_arw_payload_addr  (io_input_arw_payload_addr[31:0]       ), //i
    .io_axi_arw_payload_size  (io_input_arw_payload_size[2:0]        ), //i
    .io_axi_arw_payload_cache (io_input_arw_payload_cache[3:0]       ), //i
    .io_axi_arw_payload_prot  (io_input_arw_payload_prot[2:0]        ), //i
    .io_axi_arw_payload_write (io_input_arw_payload_write            ), //i
    .io_axi_w_valid           (errorSlave_io_axi_w_valid             ), //i
    .io_axi_w_ready           (errorSlave_io_axi_w_ready             ), //o
    .io_axi_w_payload_data    (io_input_w_payload_data[31:0]         ), //i
    .io_axi_w_payload_strb    (io_input_w_payload_strb[3:0]          ), //i
    .io_axi_w_payload_last    (io_input_w_payload_last               ), //i
    .io_axi_b_valid           (errorSlave_io_axi_b_valid             ), //o
    .io_axi_b_ready           (io_input_b_ready                      ), //i
    .io_axi_b_payload_resp    (errorSlave_io_axi_b_payload_resp[1:0] ), //o
    .io_axi_r_valid           (errorSlave_io_axi_r_valid             ), //o
    .io_axi_r_ready           (io_input_r_ready                      ), //i
    .io_axi_r_payload_data    (errorSlave_io_axi_r_payload_data[31:0]), //o
    .io_axi_r_payload_resp    (errorSlave_io_axi_r_payload_resp[1:0] ), //o
    .io_axi_r_payload_last    (errorSlave_io_axi_r_payload_last      ), //o
    ._zz_1                    (_zz_1                                 ), //i
    ._zz_2                    (_zz_2                                 )  //i
  );
  always @(*) begin
    case(writeRspIndex)
      1'b0 : _zz_io_input_b_payload_resp = io_sharedOutputs_0_b_payload_resp;
      default : _zz_io_input_b_payload_resp = io_sharedOutputs_1_b_payload_resp;
    endcase
  end

  always @(*) begin
    case(readRspIndex)
      2'b00 : begin
        _zz_io_input_r_payload_data = io_readOutputs_0_r_payload_data;
        _zz_io_input_r_payload_resp = io_readOutputs_0_r_payload_resp;
        _zz_io_input_r_payload_last = io_readOutputs_0_r_payload_last;
      end
      2'b01 : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_0_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_0_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_0_r_payload_last;
      end
      default : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_1_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_1_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_1_r_payload_last;
      end
    endcase
  end

  always @(*) begin
    _zz_pendingCmdCounter = _zz_pendingCmdCounter_1;
    if(when_Utils_l754) begin
      _zz_pendingCmdCounter = (_zz_pendingCmdCounter_1 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_1 = _zz_pendingCmdCounter_2;
    if(io_input_b_fire) begin
      _zz_pendingCmdCounter_1 = (_zz_pendingCmdCounter_2 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_2 = _zz_pendingCmdCounter_3;
    if(io_input_arw_fire) begin
      _zz_pendingCmdCounter_2 = (_zz_pendingCmdCounter_3 + 3'b001);
    end
  end

  assign io_input_arw_fire = (io_input_arw_valid && io_input_arw_ready);
  assign io_input_b_fire = (io_input_b_valid && io_input_b_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l754 = (io_input_r_fire && io_input_r_payload_last);
  assign _zz_pendingCmdCounter_3 = pendingCmdCounter;
  assign when_Utils_l694 = (cmdAllowedStart && io_input_arw_payload_write);
  assign io_input_w_fire = (io_input_w_valid && io_input_w_ready);
  assign when_Utils_l697 = (io_input_w_fire && io_input_w_payload_last);
  always @(*) begin
    pendingDataCounter_incrementIt = 1'b0;
    if(when_Utils_l694) begin
      pendingDataCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingDataCounter_decrementIt = 1'b0;
    if(when_Utils_l697) begin
      pendingDataCounter_decrementIt = 1'b1;
    end
  end

  assign pendingDataCounter_mayOverflow = (pendingDataCounter_value == 3'b111);
  assign pendingDataCounter_willOverflowIfInc = (pendingDataCounter_mayOverflow && (! pendingDataCounter_decrementIt));
  assign pendingDataCounter_willOverflow = (pendingDataCounter_willOverflowIfInc && pendingDataCounter_incrementIt);
  assign when_Utils_l723 = (pendingDataCounter_incrementIt && (! pendingDataCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l723) begin
      pendingDataCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l725) begin
        pendingDataCounter_finalIncrement = 3'b111;
      end else begin
        pendingDataCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l725 = ((! pendingDataCounter_incrementIt) && pendingDataCounter_decrementIt);
  assign pendingDataCounter_valueNext = (pendingDataCounter_value + pendingDataCounter_finalIncrement);
  assign decodedCmdSels = {{((io_input_arw_payload_addr & (~ 32'h000fffff)) == 32'hf0000000),((io_input_arw_payload_addr & (~ 32'h03ffffff)) == 32'h90000000)},(((io_input_arw_payload_addr & (~ 32'h007fffff)) == 32'ha0000000) && (! io_input_arw_payload_write))};
  assign decodedCmdError = (decodedCmdSels == 3'b000);
  assign allowCmd = ((pendingCmdCounter == 3'b000) || ((pendingCmdCounter != 3'b111) && (pendingSels == decodedCmdSels)));
  assign allowData = (pendingDataCounter_value != 3'b000);
  assign cmdAllowedStart = ((io_input_arw_valid && allowCmd) && _zz_cmdAllowedStart);
  assign io_input_arw_ready = (((|(decodedCmdSels & {io_sharedOutputs_1_arw_ready,{io_sharedOutputs_0_arw_ready,io_readOutputs_0_ar_ready}})) || (decodedCmdError && errorSlave_io_axi_arw_ready)) && allowCmd);
  assign errorSlave_io_axi_arw_valid = ((io_input_arw_valid && decodedCmdError) && allowCmd);
  assign io_readOutputs_0_ar_valid = ((io_input_arw_valid && decodedCmdSels[0]) && allowCmd);
  assign io_readOutputs_0_ar_payload_addr = io_input_arw_payload_addr;
  assign io_readOutputs_0_ar_payload_size = io_input_arw_payload_size;
  assign io_readOutputs_0_ar_payload_cache = io_input_arw_payload_cache;
  assign io_readOutputs_0_ar_payload_prot = io_input_arw_payload_prot;
  assign _zz_io_sharedOutputs_0_arw_valid = decodedCmdSels[2 : 1];
  assign io_sharedOutputs_0_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[0]) && allowCmd);
  assign io_sharedOutputs_0_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_0_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_0_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_0_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_0_arw_payload_write = io_input_arw_payload_write;
  assign io_sharedOutputs_1_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[1]) && allowCmd);
  assign io_sharedOutputs_1_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_1_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_1_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_1_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_1_arw_payload_write = io_input_arw_payload_write;
  assign io_input_w_ready = (((|(pendingSels[2 : 1] & {io_sharedOutputs_1_w_ready,io_sharedOutputs_0_w_ready})) || (pendingError && errorSlave_io_axi_w_ready)) && allowData);
  assign errorSlave_io_axi_w_valid = ((io_input_w_valid && pendingError) && allowData);
  assign _zz_io_sharedOutputs_0_w_valid = pendingSels[2 : 1];
  assign io_sharedOutputs_0_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[0]) && allowData);
  assign io_sharedOutputs_0_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_0_w_payload_last = io_input_w_payload_last;
  assign io_sharedOutputs_1_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[1]) && allowData);
  assign io_sharedOutputs_1_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_1_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_1_w_payload_last = io_input_w_payload_last;
  assign _zz_writeRspIndex = _zz__zz_writeRspIndex[1];
  assign writeRspIndex = _zz_writeRspIndex;
  assign io_input_b_valid = ((|{io_sharedOutputs_1_b_valid,io_sharedOutputs_0_b_valid}) || errorSlave_io_axi_b_valid);
  always @(*) begin
    io_input_b_payload_resp = _zz_io_input_b_payload_resp;
    if(pendingError) begin
      io_input_b_payload_resp = errorSlave_io_axi_b_payload_resp;
    end
  end

  assign io_sharedOutputs_0_b_ready = io_input_b_ready;
  assign io_sharedOutputs_1_b_ready = io_input_b_ready;
  assign _zz_readRspIndex = {pendingSels[2 : 1],pendingSels[0 : 0]};
  assign _zz_readRspIndex_1 = _zz_readRspIndex[1];
  assign _zz_readRspIndex_2 = _zz_readRspIndex[2];
  assign readRspIndex = {_zz_readRspIndex_2,_zz_readRspIndex_1};
  assign io_input_r_valid = ((|{io_sharedOutputs_1_r_valid,{io_sharedOutputs_0_r_valid,io_readOutputs_0_r_valid}}) || errorSlave_io_axi_r_valid);
  assign io_input_r_payload_data = _zz_io_input_r_payload_data;
  always @(*) begin
    io_input_r_payload_resp = _zz_io_input_r_payload_resp;
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = _zz_io_input_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_readOutputs_0_r_ready = io_input_r_ready;
  assign io_sharedOutputs_0_r_ready = io_input_r_ready;
  assign io_sharedOutputs_1_r_ready = io_input_r_ready;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      pendingCmdCounter <= 3'b000;
      pendingDataCounter_value <= 3'b000;
      pendingSels <= 3'b000;
      pendingError <= 1'b0;
      _zz_cmdAllowedStart <= 1'b1;
    end else begin
      pendingCmdCounter <= _zz_pendingCmdCounter;
      pendingDataCounter_value <= pendingDataCounter_valueNext;
      if(cmdAllowedStart) begin
        pendingSels <= decodedCmdSels;
      end
      if(cmdAllowedStart) begin
        pendingError <= decodedCmdError;
      end
      if(cmdAllowedStart) begin
        _zz_cmdAllowedStart <= 1'b0;
      end
      if(io_input_arw_ready) begin
        _zz_cmdAllowedStart <= 1'b1;
      end
    end
  end


endmodule

module Axi4ReadOnlyDecoder (
  input  wire          io_input_ar_valid,
  output wire          io_input_ar_ready,
  input  wire [31:0]   io_input_ar_payload_addr,
  input  wire [3:0]    io_input_ar_payload_cache,
  input  wire [2:0]    io_input_ar_payload_prot,
  output reg           io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [31:0]   io_input_r_payload_data,
  output reg  [1:0]    io_input_r_payload_resp,
  output reg           io_input_r_payload_last,
  output wire          io_outputs_0_ar_valid,
  input  wire          io_outputs_0_ar_ready,
  output wire [31:0]   io_outputs_0_ar_payload_addr,
  output wire [3:0]    io_outputs_0_ar_payload_cache,
  output wire [2:0]    io_outputs_0_ar_payload_prot,
  input  wire          io_outputs_0_r_valid,
  output wire          io_outputs_0_r_ready,
  input  wire [31:0]   io_outputs_0_r_payload_data,
  input  wire [1:0]    io_outputs_0_r_payload_resp,
  input  wire          io_outputs_0_r_payload_last,
  output wire          io_outputs_1_ar_valid,
  input  wire          io_outputs_1_ar_ready,
  output wire [31:0]   io_outputs_1_ar_payload_addr,
  output wire [3:0]    io_outputs_1_ar_payload_cache,
  output wire [2:0]    io_outputs_1_ar_payload_prot,
  input  wire          io_outputs_1_r_valid,
  output wire          io_outputs_1_r_ready,
  input  wire [31:0]   io_outputs_1_r_payload_data,
  input  wire [1:0]    io_outputs_1_r_payload_resp,
  input  wire          io_outputs_1_r_payload_last,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire                errorSlave_io_axi_ar_valid;
  wire                errorSlave_io_axi_ar_ready;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  wire                io_input_ar_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l697;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_mayOverflow;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l723;
  wire                when_Utils_l725;
  wire       [1:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [1:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                _zz_io_input_r_payload_data;
  wire                _zz_readRspIndex;
  wire       [0:0]    readRspIndex;

  Axi4ReadOnlyErrorSlave errorSlave (
    .io_axi_ar_valid         (errorSlave_io_axi_ar_valid            ), //i
    .io_axi_ar_ready         (errorSlave_io_axi_ar_ready            ), //o
    .io_axi_ar_payload_addr  (io_input_ar_payload_addr[31:0]        ), //i
    .io_axi_ar_payload_cache (io_input_ar_payload_cache[3:0]        ), //i
    .io_axi_ar_payload_prot  (io_input_ar_payload_prot[2:0]         ), //i
    .io_axi_r_valid          (errorSlave_io_axi_r_valid             ), //o
    .io_axi_r_ready          (io_input_r_ready                      ), //i
    .io_axi_r_payload_data   (errorSlave_io_axi_r_payload_data[31:0]), //o
    .io_axi_r_payload_resp   (errorSlave_io_axi_r_payload_resp[1:0] ), //o
    .io_axi_r_payload_last   (errorSlave_io_axi_r_payload_last      ), //o
    ._zz_1                   (_zz_1                                 ), //i
    ._zz_2                   (_zz_2                                 )  //i
  );
  assign io_input_ar_fire = (io_input_ar_valid && io_input_ar_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l697 = (io_input_r_fire && io_input_r_payload_last);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_ar_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(when_Utils_l697) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_mayOverflow = (pendingCmdCounter_value == 3'b111);
  assign pendingCmdCounter_willOverflowIfInc = (pendingCmdCounter_mayOverflow && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign when_Utils_l723 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l723) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l725) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l725 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign decodedCmdSels = {(((io_input_ar_payload_addr & (~ 32'h007fffff)) == 32'ha0000000) && io_input_ar_valid),(((io_input_ar_payload_addr & (~ 32'h03ffffff)) == 32'h90000000) && io_input_ar_valid)};
  assign decodedCmdError = (decodedCmdSels == 2'b00);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign io_input_ar_ready = (((|(decodedCmdSels & {io_outputs_1_ar_ready,io_outputs_0_ar_ready})) || (decodedCmdError && errorSlave_io_axi_ar_ready)) && allowCmd);
  assign errorSlave_io_axi_ar_valid = ((io_input_ar_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_ar_valid = ((io_input_ar_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_0_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_0_ar_payload_prot = io_input_ar_payload_prot;
  assign io_outputs_1_ar_valid = ((io_input_ar_valid && decodedCmdSels[1]) && allowCmd);
  assign io_outputs_1_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_1_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_1_ar_payload_prot = io_input_ar_payload_prot;
  assign _zz_io_input_r_payload_data = pendingSels[0];
  assign _zz_readRspIndex = pendingSels[1];
  assign readRspIndex = _zz_readRspIndex;
  always @(*) begin
    io_input_r_valid = (|{io_outputs_1_r_valid,io_outputs_0_r_valid});
    if(errorSlave_io_axi_r_valid) begin
      io_input_r_valid = 1'b1;
    end
  end

  assign io_input_r_payload_data = (_zz_io_input_r_payload_data ? io_outputs_0_r_payload_data : io_outputs_1_r_payload_data);
  always @(*) begin
    io_input_r_payload_resp = (_zz_io_input_r_payload_data ? io_outputs_0_r_payload_resp : io_outputs_1_r_payload_resp);
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = (_zz_io_input_r_payload_data ? io_outputs_0_r_payload_last : io_outputs_1_r_payload_last);
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_outputs_0_r_ready = io_input_r_ready;
  assign io_outputs_1_r_ready = io_input_r_ready;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      pendingCmdCounter_value <= 3'b000;
      pendingSels <= 2'b00;
      pendingError <= 1'b0;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      if(io_input_ar_ready) begin
        pendingSels <= decodedCmdSels;
      end
      if(io_input_ar_ready) begin
        pendingError <= decodedCmdError;
      end
    end
  end


endmodule

module Axi4SharedToApb3Bridge (
  input  wire          io_axi_arw_valid,
  output reg           io_axi_arw_ready,
  input  wire [19:0]   io_axi_arw_payload_addr,
  input  wire [3:0]    io_axi_arw_payload_id,
  input  wire [7:0]    io_axi_arw_payload_len,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [1:0]    io_axi_arw_payload_burst,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output reg           io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output reg           io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [3:0]    io_axi_b_payload_id,
  output wire [1:0]    io_axi_b_payload_resp,
  output reg           io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [3:0]    io_axi_r_payload_id,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  output wire [19:0]   io_apb_PADDR,
  output reg  [0:0]    io_apb_PSEL,
  output reg           io_apb_PENABLE,
  input  wire          io_apb_PREADY,
  output wire          io_apb_PWRITE,
  output wire [31:0]   io_apb_PWDATA,
  input  wire [31:0]   io_apb_PRDATA,
  input  wire          io_apb_PSLVERROR,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam Axi4ToApb3BridgePhase_SETUP = 2'd0;
  localparam Axi4ToApb3BridgePhase_ACCESS_1 = 2'd1;
  localparam Axi4ToApb3BridgePhase_RESPONSE = 2'd2;

  reg        [1:0]    phase;
  reg                 write;
  reg        [31:0]   readedData;
  reg        [3:0]    id;
  wire                when_Axi4SharedToApb3Bridge_l91;
  wire                when_Axi4SharedToApb3Bridge_l97;
  `ifndef SYNTHESIS
  reg [63:0] phase_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : phase_string = "SETUP   ";
      Axi4ToApb3BridgePhase_ACCESS_1 : phase_string = "ACCESS_1";
      Axi4ToApb3BridgePhase_RESPONSE : phase_string = "RESPONSE";
      default : phase_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_axi_arw_ready = 1'b1;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          io_axi_arw_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi_w_ready = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_axi_w_ready = 1'b1;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          io_axi_w_ready = write;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_axi_b_valid = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
      end
      default : begin
        if(write) begin
          io_axi_b_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_axi_r_valid = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
      end
      default : begin
        if(!write) begin
          io_axi_r_valid = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    io_apb_PSEL[0] = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        if(when_Axi4SharedToApb3Bridge_l91) begin
          io_apb_PSEL[0] = 1'b1;
          if(when_Axi4SharedToApb3Bridge_l97) begin
            io_apb_PSEL[0] = 1'b0;
          end
        end
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        io_apb_PSEL[0] = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_apb_PENABLE = 1'b0;
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        io_apb_PENABLE = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Axi4SharedToApb3Bridge_l91 = (io_axi_arw_valid && ((! io_axi_arw_payload_write) || io_axi_w_valid));
  assign when_Axi4SharedToApb3Bridge_l97 = (io_axi_arw_payload_write && (io_axi_w_payload_strb == 4'b0000));
  assign io_apb_PADDR = io_axi_arw_payload_addr;
  assign io_apb_PWDATA = io_axi_w_payload_data;
  assign io_apb_PWRITE = io_axi_arw_payload_write;
  assign io_axi_r_payload_resp = {io_apb_PSLVERROR,1'b0};
  assign io_axi_b_payload_resp = {io_apb_PSLVERROR,1'b0};
  assign io_axi_r_payload_id = id;
  assign io_axi_b_payload_id = id;
  assign io_axi_r_payload_data = readedData;
  assign io_axi_r_payload_last = 1'b1;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      phase <= Axi4ToApb3BridgePhase_SETUP;
    end else begin
      case(phase)
        Axi4ToApb3BridgePhase_SETUP : begin
          if(when_Axi4SharedToApb3Bridge_l91) begin
            phase <= Axi4ToApb3BridgePhase_ACCESS_1;
            if(when_Axi4SharedToApb3Bridge_l97) begin
              phase <= Axi4ToApb3BridgePhase_RESPONSE;
            end
          end
        end
        Axi4ToApb3BridgePhase_ACCESS_1 : begin
          if(io_apb_PREADY) begin
            phase <= Axi4ToApb3BridgePhase_RESPONSE;
          end
        end
        default : begin
          if(write) begin
            if(io_axi_b_ready) begin
              phase <= Axi4ToApb3BridgePhase_SETUP;
            end
          end else begin
            if(io_axi_r_ready) begin
              phase <= Axi4ToApb3BridgePhase_SETUP;
            end
          end
        end
      endcase
    end
  end

  always @(posedge _zz_1) begin
    case(phase)
      Axi4ToApb3BridgePhase_SETUP : begin
        write <= io_axi_arw_payload_write;
        id <= io_axi_arw_payload_id;
      end
      Axi4ToApb3BridgePhase_ACCESS_1 : begin
        if(io_apb_PREADY) begin
          readedData <= io_apb_PRDATA;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Axi4ReadOnlySpiXipController (
  input  wire [11:0]   io_bus_PADDR,
  input  wire [0:0]    io_bus_PSEL,
  input  wire          io_bus_PENABLE,
  output wire          io_bus_PREADY,
  input  wire          io_bus_PWRITE,
  input  wire [31:0]   io_bus_PWDATA,
  output reg  [31:0]   io_bus_PRDATA,
  output wire          io_bus_PSLVERROR,
  input  wire          io_dataBus_ar_valid,
  output wire          io_dataBus_ar_ready,
  input  wire [19:0]   io_dataBus_ar_payload_addr,
  input  wire [3:0]    io_dataBus_ar_payload_id,
  input  wire [3:0]    io_dataBus_ar_payload_region,
  input  wire [7:0]    io_dataBus_ar_payload_len,
  input  wire [2:0]    io_dataBus_ar_payload_size,
  input  wire [1:0]    io_dataBus_ar_payload_burst,
  input  wire [0:0]    io_dataBus_ar_payload_lock,
  input  wire [3:0]    io_dataBus_ar_payload_cache,
  input  wire [3:0]    io_dataBus_ar_payload_qos,
  input  wire [2:0]    io_dataBus_ar_payload_prot,
  output wire          io_dataBus_r_valid,
  input  wire          io_dataBus_r_ready,
  output wire [31:0]   io_dataBus_r_payload_data,
  output wire [3:0]    io_dataBus_r_payload_id,
  output wire [1:0]    io_dataBus_r_payload_resp,
  output wire          io_dataBus_r_payload_last,
  output wire [0:0]    io_spi_cs,
  output wire          io_spi_sclk,
  input  wire [1:0]    io_spi_dq_read,
  output wire [1:0]    io_spi_dq_write,
  output wire [1:0]    io_spi_dq_writeEnable,
  output wire          io_interrupt,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam CmdMode_1_DATA = 1'd0;
  localparam CmdMode_1_CS = 1'd1;

  wire       [1:0]    spiControllerCtrl_2_io_pendingInterrupts;
  wire       [0:0]    spiControllerCtrl_2_io_spi_cs;
  wire                spiControllerCtrl_2_io_spi_sclk;
  wire       [1:0]    spiControllerCtrl_2_io_spi_dq_write;
  wire       [1:0]    spiControllerCtrl_2_io_spi_dq_writeEnable;
  wire                spiControllerCtrl_2_io_interrupt;
  wire                spiControllerCtrl_2_io_cmd_ready;
  wire                spiControllerCtrl_2_io_rsp_valid;
  wire       [7:0]    spiControllerCtrl_2_io_rsp_payload;
  wire                spiXipControllerCtrl_io_bus_ar_ready;
  wire                spiXipControllerCtrl_io_bus_r_valid;
  wire       [31:0]   spiXipControllerCtrl_io_bus_r_payload_data;
  wire       [3:0]    spiXipControllerCtrl_io_bus_r_payload_id;
  wire       [1:0]    spiXipControllerCtrl_io_bus_r_payload_resp;
  wire                spiXipControllerCtrl_io_bus_r_payload_last;
  wire                spiXipControllerCtrl_io_cmd_valid;
  wire       [0:0]    spiXipControllerCtrl_io_cmd_payload_mode;
  wire       [8:0]    spiXipControllerCtrl_io_cmd_payload_args;
  wire                busFactory_readErrorFlag;
  wire                busFactory_writeErrorFlag;
  wire                busFactory_askWrite;
  wire                busFactory_askRead;
  wire                busFactory_doWrite;
  wire                busFactory_doRead;
  reg        [15:0]   _zz_io_config_clockDivider;
  reg        [0:0]    _zz_io_bus_PRDATA;
  reg        [15:0]   _zz_io_bus_PRDATA_1;
  reg        [15:0]   _zz_io_bus_PRDATA_2;
  reg        [15:0]   _zz_io_bus_PRDATA_3;
  reg                 _zz_io_bus_PRDATA_4;
  reg                 _zz_io_bus_PRDATA_5;
  wire       [1:0]    _zz_io_bus_PRDATA_6;
  wire                when_Apb3SlaveFactory_l81;

  SpiControllerCtrl spiControllerCtrl_2 (
    .io_config_clockDivider  (_zz_io_config_clockDivider[15:0]              ), //i
    .io_config_cs_activeHigh (_zz_io_bus_PRDATA                             ), //i
    .io_config_cs_setup      (_zz_io_bus_PRDATA_1[15:0]                     ), //i
    .io_config_cs_hold       (_zz_io_bus_PRDATA_2[15:0]                     ), //i
    .io_config_cs_disable    (_zz_io_bus_PRDATA_3[15:0]                     ), //i
    .io_modeConfig_cpol      (_zz_io_bus_PRDATA_4                           ), //i
    .io_modeConfig_cpha      (_zz_io_bus_PRDATA_5                           ), //i
    .io_spi_cs               (spiControllerCtrl_2_io_spi_cs                 ), //o
    .io_spi_sclk             (spiControllerCtrl_2_io_spi_sclk               ), //o
    .io_spi_dq_read          (io_spi_dq_read[1:0]                           ), //i
    .io_spi_dq_write         (spiControllerCtrl_2_io_spi_dq_write[1:0]      ), //o
    .io_spi_dq_writeEnable   (spiControllerCtrl_2_io_spi_dq_writeEnable[1:0]), //o
    .io_interrupt            (spiControllerCtrl_2_io_interrupt              ), //o
    .io_pendingInterrupts    (spiControllerCtrl_2_io_pendingInterrupts[1:0] ), //i
    .io_cmd_valid            (spiXipControllerCtrl_io_cmd_valid             ), //i
    .io_cmd_ready            (spiControllerCtrl_2_io_cmd_ready              ), //o
    .io_cmd_payload_mode     (spiXipControllerCtrl_io_cmd_payload_mode      ), //i
    .io_cmd_payload_args     (spiXipControllerCtrl_io_cmd_payload_args[8:0] ), //i
    .io_rsp_valid            (spiControllerCtrl_2_io_rsp_valid              ), //o
    .io_rsp_payload          (spiControllerCtrl_2_io_rsp_payload[7:0]       ), //o
    ._zz_1                   (_zz_1                                         ), //i
    ._zz_2                   (_zz_2                                         )  //i
  );
  SpiControllerCtrl_1 spiXipControllerCtrl (
    .io_bus_ar_valid          (io_dataBus_ar_valid                             ), //i
    .io_bus_ar_ready          (spiXipControllerCtrl_io_bus_ar_ready            ), //o
    .io_bus_ar_payload_addr   (io_dataBus_ar_payload_addr[19:0]                ), //i
    .io_bus_ar_payload_id     (io_dataBus_ar_payload_id[3:0]                   ), //i
    .io_bus_ar_payload_region (io_dataBus_ar_payload_region[3:0]               ), //i
    .io_bus_ar_payload_len    (io_dataBus_ar_payload_len[7:0]                  ), //i
    .io_bus_ar_payload_size   (io_dataBus_ar_payload_size[2:0]                 ), //i
    .io_bus_ar_payload_burst  (io_dataBus_ar_payload_burst[1:0]                ), //i
    .io_bus_ar_payload_lock   (io_dataBus_ar_payload_lock                      ), //i
    .io_bus_ar_payload_cache  (io_dataBus_ar_payload_cache[3:0]                ), //i
    .io_bus_ar_payload_qos    (io_dataBus_ar_payload_qos[3:0]                  ), //i
    .io_bus_ar_payload_prot   (io_dataBus_ar_payload_prot[2:0]                 ), //i
    .io_bus_r_valid           (spiXipControllerCtrl_io_bus_r_valid             ), //o
    .io_bus_r_ready           (io_dataBus_r_ready                              ), //i
    .io_bus_r_payload_data    (spiXipControllerCtrl_io_bus_r_payload_data[31:0]), //o
    .io_bus_r_payload_id      (spiXipControllerCtrl_io_bus_r_payload_id[3:0]   ), //o
    .io_bus_r_payload_resp    (spiXipControllerCtrl_io_bus_r_payload_resp[1:0] ), //o
    .io_bus_r_payload_last    (spiXipControllerCtrl_io_bus_r_payload_last      ), //o
    .io_cmd_valid             (spiXipControllerCtrl_io_cmd_valid               ), //o
    .io_cmd_ready             (spiControllerCtrl_2_io_cmd_ready                ), //i
    .io_cmd_payload_mode      (spiXipControllerCtrl_io_cmd_payload_mode        ), //o
    .io_cmd_payload_args      (spiXipControllerCtrl_io_cmd_payload_args[8:0]   ), //o
    .io_rsp_valid             (spiControllerCtrl_2_io_rsp_valid                ), //i
    .io_rsp_payload           (spiControllerCtrl_2_io_rsp_payload[7:0]         ), //i
    ._zz_1                    (_zz_1                                           ), //i
    ._zz_2                    (_zz_2                                           )  //i
  );
  assign io_spi_cs = spiControllerCtrl_2_io_spi_cs;
  assign io_spi_sclk = spiControllerCtrl_2_io_spi_sclk;
  assign io_spi_dq_write = spiControllerCtrl_2_io_spi_dq_write;
  assign io_spi_dq_writeEnable = spiControllerCtrl_2_io_spi_dq_writeEnable;
  assign io_interrupt = 1'b0;
  assign io_dataBus_ar_ready = spiXipControllerCtrl_io_bus_ar_ready;
  assign io_dataBus_r_valid = spiXipControllerCtrl_io_bus_r_valid;
  assign io_dataBus_r_payload_data = spiXipControllerCtrl_io_bus_r_payload_data;
  assign io_dataBus_r_payload_last = spiXipControllerCtrl_io_bus_r_payload_last;
  assign io_dataBus_r_payload_id = spiXipControllerCtrl_io_bus_r_payload_id;
  assign io_dataBus_r_payload_resp = spiXipControllerCtrl_io_bus_r_payload_resp;
  assign busFactory_readErrorFlag = 1'b0;
  assign busFactory_writeErrorFlag = 1'b0;
  assign io_bus_PREADY = 1'b1;
  always @(*) begin
    io_bus_PRDATA = 32'h00000000;
    case(io_bus_PADDR)
      12'h008 : begin
        io_bus_PRDATA[1 : 0] = {_zz_io_bus_PRDATA_5,_zz_io_bus_PRDATA_4};
        io_bus_PRDATA[4 : 4] = _zz_io_bus_PRDATA;
      end
      12'h010 : begin
        io_bus_PRDATA[15 : 0] = _zz_io_bus_PRDATA_1;
      end
      12'h014 : begin
        io_bus_PRDATA[15 : 0] = _zz_io_bus_PRDATA_2;
      end
      12'h018 : begin
        io_bus_PRDATA[15 : 0] = _zz_io_bus_PRDATA_3;
      end
      default : begin
      end
    endcase
  end

  assign busFactory_askWrite = ((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PWRITE);
  assign busFactory_askRead = ((io_bus_PSEL[0] && io_bus_PENABLE) && (! io_bus_PWRITE));
  assign busFactory_doWrite = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign busFactory_doRead = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign io_bus_PSLVERROR = ((busFactory_doWrite && busFactory_writeErrorFlag) || (busFactory_doRead && busFactory_readErrorFlag));
  assign _zz_io_bus_PRDATA_6 = io_bus_PWDATA[1 : 0];
  assign when_Apb3SlaveFactory_l81 = ((io_bus_PADDR & (~ 12'h003)) == 12'h00c);
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      _zz_io_bus_PRDATA <= 1'b0;
      _zz_io_config_clockDivider <= 16'h0032;
      _zz_io_bus_PRDATA_1 <= 16'h0032;
      _zz_io_bus_PRDATA_2 <= 16'h0032;
      _zz_io_bus_PRDATA_3 <= 16'h0032;
      _zz_io_bus_PRDATA_4 <= 1'b0;
      _zz_io_bus_PRDATA_5 <= 1'b0;
    end else begin
      case(io_bus_PADDR)
        12'h008 : begin
          if(busFactory_doWrite) begin
            _zz_io_bus_PRDATA_4 <= _zz_io_bus_PRDATA_6[0];
            _zz_io_bus_PRDATA_5 <= _zz_io_bus_PRDATA_6[1];
            _zz_io_bus_PRDATA <= io_bus_PWDATA[4 : 4];
          end
        end
        12'h010 : begin
          if(busFactory_doWrite) begin
            _zz_io_bus_PRDATA_1 <= io_bus_PWDATA[15 : 0];
          end
        end
        12'h014 : begin
          if(busFactory_doWrite) begin
            _zz_io_bus_PRDATA_2 <= io_bus_PWDATA[15 : 0];
          end
        end
        12'h018 : begin
          if(busFactory_doWrite) begin
            _zz_io_bus_PRDATA_3 <= io_bus_PWDATA[15 : 0];
          end
        end
        default : begin
        end
      endcase
      if(when_Apb3SlaveFactory_l81) begin
        if(busFactory_doWrite) begin
          _zz_io_config_clockDivider[15 : 0] <= io_bus_PWDATA[15 : 0];
        end
      end
    end
  end


endmodule

module Phy (
  output wire [0:0]    io_hyperbus_cs,
  output wire          io_hyperbus_ck,
  output wire          io_hyperbus_reset,
  input  wire [7:0]    io_hyperbus_dq_read,
  output reg  [7:0]    io_hyperbus_dq_write,
  output reg  [7:0]    io_hyperbus_dq_writeEnable,
  input  wire          io_hyperbus_rwds_read,
  output reg           io_hyperbus_rwds_write,
  output reg           io_hyperbus_rwds_writeEnable,
  input  wire          io_phy_cmd_valid,
  output wire          io_phy_cmd_ready,
  input  wire [1:0]    io_phy_cmd_payload_mode,
  input  wire [9:0]    io_phy_cmd_payload_args,
  output wire          io_phy_rsp_valid,
  input  wire          io_phy_rsp_ready,
  output wire [7:0]    io_phy_rsp_payload_data,
  output wire          io_phy_rsp_payload_last,
  output wire          io_phy_rsp_payload_error,
  input  wire [6:0]    io_phy_config_reset_pulse,
  input  wire [7:0]    io_phy_config_reset_halt,
  input  wire          io_phy_config_reset_trigger,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam CmdMode_CS = 2'd0;
  localparam CmdMode_ADDR = 2'd1;
  localparam CmdMode_DATA = 2'd2;
  localparam fsm_enumDef_1_BOOT = 3'd0;
  localparam fsm_enumDef_1_init = 3'd1;
  localparam fsm_enumDef_1_chipSelectSetup = 3'd2;
  localparam fsm_enumDef_1_address = 3'd3;
  localparam fsm_enumDef_1_read = 3'd4;
  localparam fsm_enumDef_1_write = 3'd5;
  localparam fsm_enumDef_1_end_1 = 3'd6;

  reg                 fsm_cmdFifo_io_pop_ready;
  wire                fsm_cmdFifo_io_flush;
  reg                 fsm_rspFifo_io_push_valid;
  reg        [7:0]    fsm_rspFifo_io_push_payload_data;
  reg                 fsm_rspFifo_io_push_payload_last;
  wire                fsm_rspFifo_io_push_payload_error;
  wire                fsm_rspFifo_io_flush;
  wire       [7:0]    io_hyperbus_dq_read_buffercc_io_dataOut;
  wire                io_hyperbus_rwds_read_buffercc_io_dataOut;
  wire                fsm_cmdFifo_io_push_ready;
  wire                fsm_cmdFifo_io_pop_valid;
  wire       [1:0]    fsm_cmdFifo_io_pop_payload_mode;
  wire       [9:0]    fsm_cmdFifo_io_pop_payload_args;
  wire       [3:0]    fsm_cmdFifo_io_occupancy;
  wire       [3:0]    fsm_cmdFifo_io_availability;
  wire                fsm_rspFifo_io_push_ready;
  wire                fsm_rspFifo_io_pop_valid;
  wire       [7:0]    fsm_rspFifo_io_pop_payload_data;
  wire                fsm_rspFifo_io_pop_payload_last;
  wire                fsm_rspFifo_io_pop_payload_error;
  wire       [3:0]    fsm_rspFifo_io_occupancy;
  wire       [3:0]    fsm_rspFifo_io_availability;
  wire       [8:0]    _zz_when_HyperBusGenericPhy_l45;
  wire       [8:0]    _zz_when_HyperBusGenericPhy_l48;
  wire       [2:0]    _zz_fsm_latencyCycles;
  wire       [11:0]   _zz_when_HyperBusGenericPhy_l173;
  wire       [11:0]   _zz_when_HyperBusGenericPhy_l173_1;
  wire       [12:0]   _zz_when_HyperBusGenericPhy_l173_2;
  wire       [12:0]   _zz_when_HyperBusGenericPhy_l173_3;
  wire       [12:0]   _zz_when_HyperBusGenericPhy_l173_4;
  wire                _zz_when;
  wire       [11:0]   _zz_when_HyperBusGenericPhy_l195;
  wire       [11:0]   _zz_when_HyperBusGenericPhy_l195_1;
  wire       [11:0]   _zz_when_HyperBusGenericPhy_l195_2;
  wire       [12:0]   _zz_when_HyperBusGenericPhy_l195_3;
  wire       [12:0]   _zz_when_HyperBusGenericPhy_l195_4;
  wire       [12:0]   _zz_when_HyperBusGenericPhy_l195_5;
  wire       [12:0]   _zz_when_HyperBusGenericPhy_l195_6;
  wire                _zz_when_1;
  reg                 phyIsIdle;
  reg                 reset_value;
  reg        [8:0]    reset_counter;
  reg        [6:0]    reset_pulse;
  reg        [7:0]    reset_halt;
  reg                 reset_run;
  reg                 reset_pendingReset;
  wire                when_HyperBusGenericPhy_l32;
  wire                when_HyperBusGenericPhy_l40;
  wire                when_HyperBusGenericPhy_l45;
  wire                when_HyperBusGenericPhy_l48;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [0:0]    fsm_chipSelects;
  reg        [2:0]    fsm_bitCount;
  reg                 fsm_additionalLatency;
  reg                 fsm_readTransaction;
  reg        [8:0]    fsm_latencyCycles;
  reg                 fsm_rwds;
  reg        [11:0]   fsm_counter_value;
  reg                 fsm_counter_enableOutput;
  wire       [7:0]    fsm_synchronizer_dq;
  wire                fsm_synchronizer_rwds;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  wire                when_HyperBusGenericPhy_l123;
  wire                when_HyperBusGenericPhy_l141;
  wire                when_HyperBusGenericPhy_l149;
  wire                when_HyperBusGenericPhy_l153;
  wire                when_HyperBusGenericPhy_l156;
  wire                when_HyperBusGenericPhy_l159;
  wire                when_HyperBusGenericPhy_l173;
  wire                when_HyperBusGenericPhy_l174;
  wire                when_HyperBusGenericPhy_l175;
  wire                when_HyperBusGenericPhy_l195;
  wire                when_HyperBusGenericPhy_l196;
  wire                when_HyperBusGenericPhy_l201;
  wire                when_HyperBusGenericPhy_l220;
  wire                when_StateMachine_l253;
  `ifndef SYNTHESIS
  reg [31:0] io_phy_cmd_payload_mode_string;
  reg [119:0] fsm_stateReg_string;
  reg [119:0] fsm_stateNext_string;
  `endif


  assign _zz_when = fsm_cmdFifo_io_pop_payload_args[9];
  assign _zz_when_1 = fsm_cmdFifo_io_pop_payload_args[9];
  assign _zz_when_HyperBusGenericPhy_l45 = {2'd0, reset_pulse};
  assign _zz_when_HyperBusGenericPhy_l48 = {1'd0, reset_halt};
  assign _zz_fsm_latencyCycles = fsm_cmdFifo_io_pop_payload_args[3 : 1];
  assign _zz_when_HyperBusGenericPhy_l173 = (12'h013 + _zz_when_HyperBusGenericPhy_l173_1);
  assign _zz_when_HyperBusGenericPhy_l173_1 = ({3'd0,fsm_latencyCycles} <<< 2'd3);
  assign _zz_when_HyperBusGenericPhy_l173_2 = (13'h0013 + _zz_when_HyperBusGenericPhy_l173_3);
  assign _zz_when_HyperBusGenericPhy_l173_3 = ({4'd0,fsm_latencyCycles} <<< 3'd4);
  assign _zz_when_HyperBusGenericPhy_l173_4 = {1'd0, fsm_counter_value};
  assign _zz_when_HyperBusGenericPhy_l195 = (_zz_when_HyperBusGenericPhy_l195_1 + 12'h002);
  assign _zz_when_HyperBusGenericPhy_l195_1 = (12'h013 + _zz_when_HyperBusGenericPhy_l195_2);
  assign _zz_when_HyperBusGenericPhy_l195_2 = ({3'd0,fsm_latencyCycles} <<< 2'd3);
  assign _zz_when_HyperBusGenericPhy_l195_3 = (_zz_when_HyperBusGenericPhy_l195_4 + 13'h0002);
  assign _zz_when_HyperBusGenericPhy_l195_4 = (13'h0013 + _zz_when_HyperBusGenericPhy_l195_5);
  assign _zz_when_HyperBusGenericPhy_l195_5 = ({4'd0,fsm_latencyCycles} <<< 3'd4);
  assign _zz_when_HyperBusGenericPhy_l195_6 = {1'd0, fsm_counter_value};
  BufferCC io_hyperbus_dq_read_buffercc (
    .io_dataIn  (io_hyperbus_dq_read[7:0]                    ), //i
    .io_dataOut (io_hyperbus_dq_read_buffercc_io_dataOut[7:0]), //o
    ._zz_1      (_zz_1                                       ), //i
    ._zz_2      (_zz_2                                       )  //i
  );
  BufferCC_4 io_hyperbus_rwds_read_buffercc (
    .io_dataIn  (io_hyperbus_rwds_read                    ), //i
    .io_dataOut (io_hyperbus_rwds_read_buffercc_io_dataOut), //o
    ._zz_1      (_zz_1                                    ), //i
    ._zz_2      (_zz_2                                    )  //i
  );
  StreamFifo_2 fsm_cmdFifo (
    .io_push_valid        (io_phy_cmd_valid                    ), //i
    .io_push_ready        (fsm_cmdFifo_io_push_ready           ), //o
    .io_push_payload_mode (io_phy_cmd_payload_mode[1:0]        ), //i
    .io_push_payload_args (io_phy_cmd_payload_args[9:0]        ), //i
    .io_pop_valid         (fsm_cmdFifo_io_pop_valid            ), //o
    .io_pop_ready         (fsm_cmdFifo_io_pop_ready            ), //i
    .io_pop_payload_mode  (fsm_cmdFifo_io_pop_payload_mode[1:0]), //o
    .io_pop_payload_args  (fsm_cmdFifo_io_pop_payload_args[9:0]), //o
    .io_flush             (fsm_cmdFifo_io_flush                ), //i
    .io_occupancy         (fsm_cmdFifo_io_occupancy[3:0]       ), //o
    .io_availability      (fsm_cmdFifo_io_availability[3:0]    ), //o
    ._zz_4                (_zz_1                               ), //i
    ._zz_5                (_zz_2                               )  //i
  );
  StreamFifo_3 fsm_rspFifo (
    .io_push_valid         (fsm_rspFifo_io_push_valid            ), //i
    .io_push_ready         (fsm_rspFifo_io_push_ready            ), //o
    .io_push_payload_data  (fsm_rspFifo_io_push_payload_data[7:0]), //i
    .io_push_payload_last  (fsm_rspFifo_io_push_payload_last     ), //i
    .io_push_payload_error (fsm_rspFifo_io_push_payload_error    ), //i
    .io_pop_valid          (fsm_rspFifo_io_pop_valid             ), //o
    .io_pop_ready          (io_phy_rsp_ready                     ), //i
    .io_pop_payload_data   (fsm_rspFifo_io_pop_payload_data[7:0] ), //o
    .io_pop_payload_last   (fsm_rspFifo_io_pop_payload_last      ), //o
    .io_pop_payload_error  (fsm_rspFifo_io_pop_payload_error     ), //o
    .io_flush              (fsm_rspFifo_io_flush                 ), //i
    .io_occupancy          (fsm_rspFifo_io_occupancy[3:0]        ), //o
    .io_availability       (fsm_rspFifo_io_availability[3:0]     ), //o
    ._zz_4                 (_zz_1                                ), //i
    ._zz_5                 (_zz_2                                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_phy_cmd_payload_mode)
      CmdMode_CS : io_phy_cmd_payload_mode_string = "CS  ";
      CmdMode_ADDR : io_phy_cmd_payload_mode_string = "ADDR";
      CmdMode_DATA : io_phy_cmd_payload_mode_string = "DATA";
      default : io_phy_cmd_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_1_BOOT : fsm_stateReg_string = "BOOT           ";
      fsm_enumDef_1_init : fsm_stateReg_string = "init           ";
      fsm_enumDef_1_chipSelectSetup : fsm_stateReg_string = "chipSelectSetup";
      fsm_enumDef_1_address : fsm_stateReg_string = "address        ";
      fsm_enumDef_1_read : fsm_stateReg_string = "read           ";
      fsm_enumDef_1_write : fsm_stateReg_string = "write          ";
      fsm_enumDef_1_end_1 : fsm_stateReg_string = "end_1          ";
      default : fsm_stateReg_string = "???????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_1_BOOT : fsm_stateNext_string = "BOOT           ";
      fsm_enumDef_1_init : fsm_stateNext_string = "init           ";
      fsm_enumDef_1_chipSelectSetup : fsm_stateNext_string = "chipSelectSetup";
      fsm_enumDef_1_address : fsm_stateNext_string = "address        ";
      fsm_enumDef_1_read : fsm_stateNext_string = "read           ";
      fsm_enumDef_1_write : fsm_stateNext_string = "write          ";
      fsm_enumDef_1_end_1 : fsm_stateNext_string = "end_1          ";
      default : fsm_stateNext_string = "???????????????";
    endcase
  end
  `endif

  always @(*) begin
    phyIsIdle = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
        phyIsIdle = 1'b1;
      end
      fsm_enumDef_1_chipSelectSetup : begin
      end
      fsm_enumDef_1_address : begin
      end
      fsm_enumDef_1_read : begin
      end
      fsm_enumDef_1_write : begin
      end
      fsm_enumDef_1_end_1 : begin
      end
      default : begin
      end
    endcase
  end

  assign when_HyperBusGenericPhy_l32 = (phyIsIdle && reset_pendingReset);
  assign when_HyperBusGenericPhy_l40 = (reset_counter == 9'h000);
  assign when_HyperBusGenericPhy_l45 = (reset_counter == _zz_when_HyperBusGenericPhy_l45);
  assign when_HyperBusGenericPhy_l48 = (reset_counter == _zz_when_HyperBusGenericPhy_l48);
  assign io_hyperbus_reset = reset_value;
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
      end
      fsm_enumDef_1_chipSelectSetup : begin
      end
      fsm_enumDef_1_address : begin
      end
      fsm_enumDef_1_read : begin
      end
      fsm_enumDef_1_write : begin
      end
      fsm_enumDef_1_end_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign io_hyperbus_cs = fsm_chipSelects;
  assign io_hyperbus_ck = ((! fsm_counter_value[2]) && fsm_counter_enableOutput);
  always @(*) begin
    io_hyperbus_dq_write = 8'h00;
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
      end
      fsm_enumDef_1_chipSelectSetup : begin
      end
      fsm_enumDef_1_address : begin
        if(when_HyperBusGenericPhy_l149) begin
          io_hyperbus_dq_write = fsm_cmdFifo_io_pop_payload_args[7 : 0];
        end
      end
      fsm_enumDef_1_read : begin
      end
      fsm_enumDef_1_write : begin
        if(when_HyperBusGenericPhy_l195) begin
          if(when_HyperBusGenericPhy_l196) begin
            io_hyperbus_dq_write = fsm_cmdFifo_io_pop_payload_args[7 : 0];
          end
        end
      end
      fsm_enumDef_1_end_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_hyperbus_dq_writeEnable = 8'h00;
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
      end
      fsm_enumDef_1_chipSelectSetup : begin
      end
      fsm_enumDef_1_address : begin
        if(when_HyperBusGenericPhy_l149) begin
          io_hyperbus_dq_writeEnable = 8'hff;
        end
      end
      fsm_enumDef_1_read : begin
      end
      fsm_enumDef_1_write : begin
        if(when_HyperBusGenericPhy_l195) begin
          if(when_HyperBusGenericPhy_l196) begin
            io_hyperbus_dq_writeEnable = 8'hff;
          end
        end
      end
      fsm_enumDef_1_end_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_hyperbus_rwds_write = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
      end
      fsm_enumDef_1_chipSelectSetup : begin
      end
      fsm_enumDef_1_address : begin
      end
      fsm_enumDef_1_read : begin
      end
      fsm_enumDef_1_write : begin
        if(when_HyperBusGenericPhy_l195) begin
          if(when_HyperBusGenericPhy_l196) begin
            io_hyperbus_rwds_write = fsm_cmdFifo_io_pop_payload_args[8];
          end
        end
      end
      fsm_enumDef_1_end_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_hyperbus_rwds_writeEnable = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
      end
      fsm_enumDef_1_chipSelectSetup : begin
      end
      fsm_enumDef_1_address : begin
      end
      fsm_enumDef_1_read : begin
      end
      fsm_enumDef_1_write : begin
        io_hyperbus_rwds_writeEnable = 1'b1;
      end
      fsm_enumDef_1_end_1 : begin
      end
      default : begin
      end
    endcase
  end

  assign fsm_synchronizer_dq = io_hyperbus_dq_read_buffercc_io_dataOut;
  assign fsm_synchronizer_rwds = io_hyperbus_rwds_read_buffercc_io_dataOut;
  assign io_phy_cmd_ready = fsm_cmdFifo_io_push_ready;
  always @(*) begin
    fsm_cmdFifo_io_pop_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
        if(when_HyperBusGenericPhy_l123) begin
          fsm_cmdFifo_io_pop_ready = 1'b1;
        end
      end
      fsm_enumDef_1_chipSelectSetup : begin
      end
      fsm_enumDef_1_address : begin
        if(when_HyperBusGenericPhy_l149) begin
          if(when_HyperBusGenericPhy_l153) begin
            fsm_cmdFifo_io_pop_ready = 1'b1;
          end
        end
      end
      fsm_enumDef_1_read : begin
        if(when_HyperBusGenericPhy_l173) begin
          if(when_HyperBusGenericPhy_l174) begin
            if(when_HyperBusGenericPhy_l175) begin
              fsm_cmdFifo_io_pop_ready = 1'b1;
            end
          end
        end
      end
      fsm_enumDef_1_write : begin
        if(when_HyperBusGenericPhy_l195) begin
          if(when_HyperBusGenericPhy_l196) begin
            if(when_HyperBusGenericPhy_l201) begin
              fsm_cmdFifo_io_pop_ready = 1'b1;
            end
          end
        end
      end
      fsm_enumDef_1_end_1 : begin
      end
      default : begin
      end
    endcase
  end

  assign io_phy_rsp_valid = fsm_rspFifo_io_pop_valid;
  assign io_phy_rsp_payload_data = fsm_rspFifo_io_pop_payload_data;
  assign io_phy_rsp_payload_last = fsm_rspFifo_io_pop_payload_last;
  assign io_phy_rsp_payload_error = fsm_rspFifo_io_pop_payload_error;
  always @(*) begin
    fsm_rspFifo_io_push_valid = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
      end
      fsm_enumDef_1_chipSelectSetup : begin
      end
      fsm_enumDef_1_address : begin
      end
      fsm_enumDef_1_read : begin
        if(when_HyperBusGenericPhy_l173) begin
          if(when_HyperBusGenericPhy_l174) begin
            if(when_HyperBusGenericPhy_l175) begin
              fsm_rspFifo_io_push_valid = 1'b1;
            end
          end
        end
      end
      fsm_enumDef_1_write : begin
        if(when_HyperBusGenericPhy_l195) begin
          if(when_HyperBusGenericPhy_l196) begin
            if(when_HyperBusGenericPhy_l201) begin
              fsm_rspFifo_io_push_valid = 1'b1;
            end
          end
        end
      end
      fsm_enumDef_1_end_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_rspFifo_io_push_payload_data = fsm_synchronizer_dq;
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
      end
      fsm_enumDef_1_chipSelectSetup : begin
      end
      fsm_enumDef_1_address : begin
      end
      fsm_enumDef_1_read : begin
        if(when_HyperBusGenericPhy_l173) begin
          if(when_HyperBusGenericPhy_l174) begin
            if(when_HyperBusGenericPhy_l175) begin
              if(fsm_cmdFifo_io_pop_payload_args[8]) begin
                fsm_rspFifo_io_push_payload_data = 8'h00;
              end
            end
          end
        end
      end
      fsm_enumDef_1_write : begin
        if(when_HyperBusGenericPhy_l195) begin
          if(when_HyperBusGenericPhy_l196) begin
            fsm_rspFifo_io_push_payload_data = 8'h00;
          end
        end
      end
      fsm_enumDef_1_end_1 : begin
      end
      default : begin
      end
    endcase
  end

  assign fsm_rspFifo_io_push_payload_error = 1'b0;
  always @(*) begin
    fsm_rspFifo_io_push_payload_last = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
      end
      fsm_enumDef_1_chipSelectSetup : begin
      end
      fsm_enumDef_1_address : begin
      end
      fsm_enumDef_1_read : begin
        if(when_HyperBusGenericPhy_l173) begin
          if(when_HyperBusGenericPhy_l174) begin
            if(when_HyperBusGenericPhy_l175) begin
              if(_zz_when) begin
                fsm_rspFifo_io_push_payload_last = 1'b1;
              end
            end
          end
        end
      end
      fsm_enumDef_1_write : begin
        if(when_HyperBusGenericPhy_l195) begin
          if(when_HyperBusGenericPhy_l196) begin
            if(when_HyperBusGenericPhy_l201) begin
              if(_zz_when_1) begin
                fsm_rspFifo_io_push_payload_last = 1'b1;
              end
            end
          end
        end
      end
      fsm_enumDef_1_end_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
        if(when_HyperBusGenericPhy_l123) begin
          fsm_stateNext = fsm_enumDef_1_chipSelectSetup;
        end
      end
      fsm_enumDef_1_chipSelectSetup : begin
        if(when_HyperBusGenericPhy_l141) begin
          fsm_stateNext = fsm_enumDef_1_address;
        end
      end
      fsm_enumDef_1_address : begin
        if(when_HyperBusGenericPhy_l149) begin
          if(when_HyperBusGenericPhy_l153) begin
            if(when_HyperBusGenericPhy_l159) begin
              if(fsm_readTransaction) begin
                fsm_stateNext = fsm_enumDef_1_read;
              end else begin
                fsm_stateNext = fsm_enumDef_1_write;
              end
            end
          end
        end
      end
      fsm_enumDef_1_read : begin
        if(when_HyperBusGenericPhy_l173) begin
          if(when_HyperBusGenericPhy_l174) begin
            if(when_HyperBusGenericPhy_l175) begin
              if(_zz_when) begin
                fsm_stateNext = fsm_enumDef_1_end_1;
              end
            end
          end
        end
      end
      fsm_enumDef_1_write : begin
        if(when_HyperBusGenericPhy_l195) begin
          if(when_HyperBusGenericPhy_l196) begin
            if(when_HyperBusGenericPhy_l201) begin
              if(_zz_when_1) begin
                fsm_stateNext = fsm_enumDef_1_end_1;
              end
            end
          end
        end
      end
      fsm_enumDef_1_end_1 : begin
        if(when_HyperBusGenericPhy_l220) begin
          fsm_stateNext = fsm_enumDef_1_init;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_1_init;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_1_BOOT;
    end
  end

  assign when_HyperBusGenericPhy_l123 = ((fsm_cmdFifo_io_pop_valid && (fsm_cmdFifo_io_pop_payload_mode == CmdMode_CS)) && (! (reset_run == 1'b1)));
  assign when_HyperBusGenericPhy_l141 = (fsm_counter_value == 12'h005);
  assign when_HyperBusGenericPhy_l149 = (fsm_cmdFifo_io_pop_valid && (fsm_cmdFifo_io_pop_payload_mode == CmdMode_ADDR));
  assign when_HyperBusGenericPhy_l153 = (fsm_counter_value[1 : 0] == 2'b01);
  assign when_HyperBusGenericPhy_l156 = (fsm_bitCount == 3'b010);
  assign when_HyperBusGenericPhy_l159 = (fsm_bitCount == 3'b101);
  assign when_HyperBusGenericPhy_l173 = (((! fsm_additionalLatency) && (_zz_when_HyperBusGenericPhy_l173 < fsm_counter_value)) || (fsm_additionalLatency && (_zz_when_HyperBusGenericPhy_l173_2 < _zz_when_HyperBusGenericPhy_l173_4)));
  assign when_HyperBusGenericPhy_l174 = (fsm_cmdFifo_io_pop_valid && (fsm_cmdFifo_io_pop_payload_mode == CmdMode_DATA));
  assign when_HyperBusGenericPhy_l175 = ((fsm_synchronizer_rwds == fsm_rwds) && (fsm_counter_value[1 : 0] == 2'b01));
  assign when_HyperBusGenericPhy_l195 = (((! fsm_additionalLatency) && (_zz_when_HyperBusGenericPhy_l195 < fsm_counter_value)) || (fsm_additionalLatency && (_zz_when_HyperBusGenericPhy_l195_3 < _zz_when_HyperBusGenericPhy_l195_6)));
  assign when_HyperBusGenericPhy_l196 = (fsm_cmdFifo_io_pop_valid && (fsm_cmdFifo_io_pop_payload_mode == CmdMode_DATA));
  assign when_HyperBusGenericPhy_l201 = (fsm_counter_value[1 : 0] == 2'b01);
  assign when_HyperBusGenericPhy_l220 = (fsm_counter_value == 12'h004);
  assign when_StateMachine_l253 = ((! (fsm_stateReg == fsm_enumDef_1_end_1)) && (fsm_stateNext == fsm_enumDef_1_end_1));
  assign fsm_cmdFifo_io_flush = 1'b0;
  assign fsm_rspFifo_io_flush = 1'b0;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      reset_value <= 1'b1;
      reset_counter <= 9'h000;
      reset_run <= 1'b0;
      reset_pendingReset <= 1'b0;
      fsm_chipSelects <= 1'b1;
      fsm_additionalLatency <= 1'b0;
      fsm_counter_value <= 12'h000;
      fsm_counter_enableOutput <= 1'b0;
      fsm_stateReg <= fsm_enumDef_1_BOOT;
    end else begin
      if(io_phy_config_reset_trigger) begin
        reset_pendingReset <= 1'b1;
      end
      if(when_HyperBusGenericPhy_l32) begin
        reset_pendingReset <= 1'b0;
        reset_counter <= 9'h000;
        reset_run <= 1'b1;
      end
      if(reset_run) begin
        reset_counter <= (reset_counter + 9'h001);
        if(when_HyperBusGenericPhy_l40) begin
          reset_value <= 1'b0;
        end
        if(when_HyperBusGenericPhy_l45) begin
          reset_value <= 1'b1;
        end
        if(when_HyperBusGenericPhy_l48) begin
          reset_run <= 1'b0;
        end
      end
      fsm_counter_value <= (fsm_counter_value + 12'h001);
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_1_init : begin
          if(when_HyperBusGenericPhy_l123) begin
            fsm_counter_value <= 12'h000;
            fsm_chipSelects[0] <= 1'b0;
          end
        end
        fsm_enumDef_1_chipSelectSetup : begin
          if(when_HyperBusGenericPhy_l141) begin
            fsm_counter_enableOutput <= 1'b1;
          end
        end
        fsm_enumDef_1_address : begin
          if(when_HyperBusGenericPhy_l149) begin
            if(when_HyperBusGenericPhy_l153) begin
              if(when_HyperBusGenericPhy_l156) begin
                fsm_additionalLatency <= fsm_synchronizer_rwds;
              end
            end
          end
        end
        fsm_enumDef_1_read : begin
        end
        fsm_enumDef_1_write : begin
        end
        fsm_enumDef_1_end_1 : begin
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l253) begin
        fsm_chipSelects <= 1'b1;
        fsm_counter_value <= 12'h000;
        fsm_counter_enableOutput <= 1'b0;
      end
    end
  end

  always @(posedge _zz_1) begin
    if(reset_run) begin
      if(when_HyperBusGenericPhy_l40) begin
        reset_pulse <= io_phy_config_reset_pulse;
        reset_halt <= io_phy_config_reset_halt;
      end
    end
    case(fsm_stateReg)
      fsm_enumDef_1_init : begin
        if(when_HyperBusGenericPhy_l123) begin
          fsm_readTransaction <= fsm_cmdFifo_io_pop_payload_args[4];
          fsm_latencyCycles <= {6'd0, _zz_fsm_latencyCycles};
          fsm_bitCount <= 3'b000;
          fsm_rwds <= 1'b1;
        end
      end
      fsm_enumDef_1_chipSelectSetup : begin
      end
      fsm_enumDef_1_address : begin
        if(when_HyperBusGenericPhy_l149) begin
          if(when_HyperBusGenericPhy_l153) begin
            fsm_bitCount <= (fsm_bitCount + 3'b001);
            if(when_HyperBusGenericPhy_l159) begin
              fsm_bitCount <= 3'b000;
            end
          end
        end
      end
      fsm_enumDef_1_read : begin
        if(when_HyperBusGenericPhy_l173) begin
          if(when_HyperBusGenericPhy_l174) begin
            if(when_HyperBusGenericPhy_l175) begin
              fsm_rwds <= (! fsm_rwds);
            end
          end
        end
      end
      fsm_enumDef_1_write : begin
      end
      fsm_enumDef_1_end_1 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module Axi4SharedHyperBus (
  input  wire          io_memory_arw_valid,
  output reg           io_memory_arw_ready,
  input  wire [31:0]   io_memory_arw_payload_addr,
  input  wire [3:0]    io_memory_arw_payload_id,
  input  wire [3:0]    io_memory_arw_payload_region,
  input  wire [7:0]    io_memory_arw_payload_len,
  input  wire [2:0]    io_memory_arw_payload_size,
  input  wire [1:0]    io_memory_arw_payload_burst,
  input  wire [0:0]    io_memory_arw_payload_lock,
  input  wire [3:0]    io_memory_arw_payload_cache,
  input  wire [3:0]    io_memory_arw_payload_qos,
  input  wire [2:0]    io_memory_arw_payload_prot,
  input  wire          io_memory_arw_payload_write,
  input  wire          io_memory_w_valid,
  output reg           io_memory_w_ready,
  input  wire [31:0]   io_memory_w_payload_data,
  input  wire [3:0]    io_memory_w_payload_strb,
  input  wire          io_memory_w_payload_last,
  output wire          io_memory_b_valid,
  input  wire          io_memory_b_ready,
  output wire [3:0]    io_memory_b_payload_id,
  output wire [1:0]    io_memory_b_payload_resp,
  output wire          io_memory_r_valid,
  input  wire          io_memory_r_ready,
  output wire [31:0]   io_memory_r_payload_data,
  output wire [3:0]    io_memory_r_payload_id,
  output wire [1:0]    io_memory_r_payload_resp,
  output wire          io_memory_r_payload_last,
  input  wire [11:0]   io_bus_PADDR,
  input  wire [0:0]    io_bus_PSEL,
  input  wire          io_bus_PENABLE,
  output wire          io_bus_PREADY,
  input  wire          io_bus_PWRITE,
  input  wire [31:0]   io_bus_PWDATA,
  output wire [31:0]   io_bus_PRDATA,
  output wire          io_bus_PSLVERROR,
  output wire          io_phy_cmd_valid,
  input  wire          io_phy_cmd_ready,
  output wire [1:0]    io_phy_cmd_payload_mode,
  output wire [9:0]    io_phy_cmd_payload_args,
  input  wire          io_phy_rsp_valid,
  output wire          io_phy_rsp_ready,
  input  wire [7:0]    io_phy_rsp_payload_data,
  input  wire          io_phy_rsp_payload_last,
  input  wire          io_phy_rsp_payload_error,
  output wire [6:0]    io_phy_config_reset_pulse,
  output wire [7:0]    io_phy_config_reset_halt,
  output wire          io_phy_config_reset_trigger,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam CmdMode_CS = 2'd0;
  localparam CmdMode_ADDR = 2'd1;
  localparam CmdMode_DATA = 2'd2;
  localparam incomingScheduler_enumDef_BOOT = 2'd0;
  localparam incomingScheduler_enumDef_stateEntry = 2'd1;
  localparam incomingScheduler_enumDef_stateWrite = 2'd2;
  localparam incomingScheduler_enumDef_stateRead = 2'd3;

  wire                hyperbus_io_frontend_ready;
  reg                 hyperbus_io_controller_valid;
  reg                 hyperbus_io_controller_payload_read;
  wire                hyperbus_io_controller_payload_memory;
  wire                hyperbus_io_controller_payload_unaligned;
  wire       [31:0]   hyperbus_io_controller_payload_addr;
  reg        [31:0]   hyperbus_io_controller_payload_data;
  reg        [3:0]    hyperbus_io_controller_payload_strobe;
  reg                 hyperbus_io_controller_payload_last;
  reg                 axiDataStorage_io_push_valid;
  wire                axiDataStorage_io_pop_ready;
  wire                axiDataStorage_io_flush;
  wire                hyperbus_io_bus_PREADY;
  wire       [31:0]   hyperbus_io_bus_PRDATA;
  wire                hyperbus_io_bus_PSLVERROR;
  wire                hyperbus_io_phy_cmd_valid;
  wire       [1:0]    hyperbus_io_phy_cmd_payload_mode;
  wire       [9:0]    hyperbus_io_phy_cmd_payload_args;
  wire                hyperbus_io_phy_rsp_ready;
  wire       [6:0]    hyperbus_io_phy_config_reset_pulse;
  wire       [7:0]    hyperbus_io_phy_config_reset_halt;
  wire                hyperbus_io_phy_config_reset_trigger;
  wire                hyperbus_io_frontend_valid;
  wire       [5:0]    hyperbus_io_frontend_payload_id;
  wire                hyperbus_io_frontend_payload_read;
  wire       [31:0]   hyperbus_io_frontend_payload_data;
  wire                hyperbus_io_frontend_payload_last;
  wire                hyperbus_io_frontend_payload_error;
  wire                hyperbus_io_controller_ready;
  wire                axiDataStorage_io_push_ready;
  wire                axiDataStorage_io_pop_valid;
  wire       [3:0]    axiDataStorage_io_pop_payload_id;
  wire       [3:0]    axiDataStorage_io_pop_payload_size;
  wire       [3:0]    axiDataStorage_io_occupancy;
  wire       [3:0]    axiDataStorage_io_availability;
  wire       [1:0]    _zz_Axi4Incr_alignMask;
  wire       [11:0]   _zz_Axi4Incr_baseIncr;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_1;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_2;
  reg        [11:0]   _zz_Axi4Incr_result;
  wire       [10:0]   _zz_Axi4Incr_result_1;
  wire       [0:0]    _zz_Axi4Incr_result_2;
  wire       [9:0]    _zz_Axi4Incr_result_3;
  wire       [1:0]    _zz_Axi4Incr_result_4;
  wire       [8:0]    _zz_Axi4Incr_result_5;
  wire       [2:0]    _zz_Axi4Incr_result_6;
  wire       [7:0]    _zz_Axi4Incr_result_7;
  wire       [3:0]    _zz_Axi4Incr_result_8;
  wire       [6:0]    _zz_Axi4Incr_result_9;
  wire       [4:0]    _zz_Axi4Incr_result_10;
  wire       [5:0]    _zz_Axi4Incr_result_11;
  wire       [5:0]    _zz_Axi4Incr_result_12;
  wire                incomingScheduler_wantExit;
  reg                 incomingScheduler_wantStart;
  wire                incomingScheduler_wantKill;
  reg        [5:0]    incomingScheduler_id;
  wire                io_memory_arw_fire;
  reg        [31:0]   incomingScheduler_burst_address;
  reg        [7:0]    incomingScheduler_burst_count;
  reg        [2:0]    incomingScheduler_burst_size;
  reg        [1:0]    incomingScheduler_burst_burstType;
  reg        [1:0]    incomingScheduler_burst_shift;
  wire       [1:0]    Axi4Incr_validSize;
  reg        [31:0]   Axi4Incr_result;
  wire       [19:0]   Axi4Incr_highCat;
  wire       [2:0]    Axi4Incr_sizeValue;
  wire       [11:0]   Axi4Incr_alignMask;
  wire       [11:0]   Axi4Incr_base;
  wire       [11:0]   Axi4Incr_baseIncr;
  reg        [1:0]    _zz_Axi4Incr_wrapCase;
  wire       [2:0]    Axi4Incr_wrapCase;
  reg        [3:0]    _zz_io_controller_payload_strobe;
  reg        [3:0]    _zz_io_push_payload_size;
  wire       [7:0]    _zz_io_memory_r_payload_data;
  wire       [15:0]   _zz_io_memory_r_payload_data_1;
  reg        [31:0]   _zz_io_memory_r_payload_data_2;
  reg        [1:0]    incomingScheduler_stateReg;
  reg        [1:0]    incomingScheduler_stateNext;
  reg        [3:0]    _zz_io_controller_payload_strobe_1;
  reg        [3:0]    _zz_io_controller_payload_strobe_2;
  wire       [3:0]    _zz_io_controller_payload_strobe_3;
  wire                when_Axi4SharedHyperBus_l110;
  wire                when_Axi4SharedHyperBus_l128;
  `ifndef SYNTHESIS
  reg [31:0] io_phy_cmd_payload_mode_string;
  reg [79:0] incomingScheduler_stateReg_string;
  reg [79:0] incomingScheduler_stateNext_string;
  `endif


  assign _zz_Axi4Incr_alignMask = {(2'b01 < Axi4Incr_validSize),(2'b00 < Axi4Incr_validSize)};
  assign _zz_Axi4Incr_baseIncr = {9'd0, Axi4Incr_sizeValue};
  assign _zz_Axi4Incr_wrapCase_1 = {1'd0, Axi4Incr_validSize};
  assign _zz_Axi4Incr_wrapCase_2 = {1'd0, _zz_Axi4Incr_wrapCase};
  assign _zz_Axi4Incr_result_1 = Axi4Incr_base[11 : 1];
  assign _zz_Axi4Incr_result_2 = Axi4Incr_baseIncr[0 : 0];
  assign _zz_Axi4Incr_result_3 = Axi4Incr_base[11 : 2];
  assign _zz_Axi4Incr_result_4 = Axi4Incr_baseIncr[1 : 0];
  assign _zz_Axi4Incr_result_5 = Axi4Incr_base[11 : 3];
  assign _zz_Axi4Incr_result_6 = Axi4Incr_baseIncr[2 : 0];
  assign _zz_Axi4Incr_result_7 = Axi4Incr_base[11 : 4];
  assign _zz_Axi4Incr_result_8 = Axi4Incr_baseIncr[3 : 0];
  assign _zz_Axi4Incr_result_9 = Axi4Incr_base[11 : 5];
  assign _zz_Axi4Incr_result_10 = Axi4Incr_baseIncr[4 : 0];
  assign _zz_Axi4Incr_result_11 = Axi4Incr_base[11 : 6];
  assign _zz_Axi4Incr_result_12 = Axi4Incr_baseIncr[5 : 0];
  Apb3HyperBus hyperbus (
    .io_bus_PADDR                    (io_bus_PADDR[11:0]                        ), //i
    .io_bus_PSEL                     (io_bus_PSEL                               ), //i
    .io_bus_PENABLE                  (io_bus_PENABLE                            ), //i
    .io_bus_PREADY                   (hyperbus_io_bus_PREADY                    ), //o
    .io_bus_PWRITE                   (io_bus_PWRITE                             ), //i
    .io_bus_PWDATA                   (io_bus_PWDATA[31:0]                       ), //i
    .io_bus_PRDATA                   (hyperbus_io_bus_PRDATA[31:0]              ), //o
    .io_bus_PSLVERROR                (hyperbus_io_bus_PSLVERROR                 ), //o
    .io_phy_cmd_valid                (hyperbus_io_phy_cmd_valid                 ), //o
    .io_phy_cmd_ready                (io_phy_cmd_ready                          ), //i
    .io_phy_cmd_payload_mode         (hyperbus_io_phy_cmd_payload_mode[1:0]     ), //o
    .io_phy_cmd_payload_args         (hyperbus_io_phy_cmd_payload_args[9:0]     ), //o
    .io_phy_rsp_valid                (io_phy_rsp_valid                          ), //i
    .io_phy_rsp_ready                (hyperbus_io_phy_rsp_ready                 ), //o
    .io_phy_rsp_payload_data         (io_phy_rsp_payload_data[7:0]              ), //i
    .io_phy_rsp_payload_last         (io_phy_rsp_payload_last                   ), //i
    .io_phy_rsp_payload_error        (io_phy_rsp_payload_error                  ), //i
    .io_phy_config_reset_pulse       (hyperbus_io_phy_config_reset_pulse[6:0]   ), //o
    .io_phy_config_reset_halt        (hyperbus_io_phy_config_reset_halt[7:0]    ), //o
    .io_phy_config_reset_trigger     (hyperbus_io_phy_config_reset_trigger      ), //o
    .io_frontend_valid               (hyperbus_io_frontend_valid                ), //o
    .io_frontend_ready               (hyperbus_io_frontend_ready                ), //i
    .io_frontend_payload_id          (hyperbus_io_frontend_payload_id[5:0]      ), //o
    .io_frontend_payload_read        (hyperbus_io_frontend_payload_read         ), //o
    .io_frontend_payload_data        (hyperbus_io_frontend_payload_data[31:0]   ), //o
    .io_frontend_payload_last        (hyperbus_io_frontend_payload_last         ), //o
    .io_frontend_payload_error       (hyperbus_io_frontend_payload_error        ), //o
    .io_controller_valid             (hyperbus_io_controller_valid              ), //i
    .io_controller_ready             (hyperbus_io_controller_ready              ), //o
    .io_controller_payload_id        (incomingScheduler_id[5:0]                 ), //i
    .io_controller_payload_read      (hyperbus_io_controller_payload_read       ), //i
    .io_controller_payload_memory    (hyperbus_io_controller_payload_memory     ), //i
    .io_controller_payload_unaligned (hyperbus_io_controller_payload_unaligned  ), //i
    .io_controller_payload_addr      (hyperbus_io_controller_payload_addr[31:0] ), //i
    .io_controller_payload_data      (hyperbus_io_controller_payload_data[31:0] ), //i
    .io_controller_payload_strobe    (hyperbus_io_controller_payload_strobe[3:0]), //i
    .io_controller_payload_last      (hyperbus_io_controller_payload_last       ), //i
    ._zz_1                           (_zz_1                                     ), //i
    ._zz_2                           (_zz_2                                     )  //i
  );
  StreamFifo_4 axiDataStorage (
    .io_push_valid        (axiDataStorage_io_push_valid           ), //i
    .io_push_ready        (axiDataStorage_io_push_ready           ), //o
    .io_push_payload_id   (io_memory_arw_payload_id[3:0]          ), //i
    .io_push_payload_size (_zz_io_push_payload_size[3:0]          ), //i
    .io_pop_valid         (axiDataStorage_io_pop_valid            ), //o
    .io_pop_ready         (axiDataStorage_io_pop_ready            ), //i
    .io_pop_payload_id    (axiDataStorage_io_pop_payload_id[3:0]  ), //o
    .io_pop_payload_size  (axiDataStorage_io_pop_payload_size[3:0]), //o
    .io_flush             (axiDataStorage_io_flush                ), //i
    .io_occupancy         (axiDataStorage_io_occupancy[3:0]       ), //o
    .io_availability      (axiDataStorage_io_availability[3:0]    ), //o
    ._zz_4                (_zz_1                                  ), //i
    ._zz_5                (_zz_2                                  )  //i
  );
  always @(*) begin
    case(Axi4Incr_wrapCase)
      3'b000 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_1,_zz_Axi4Incr_result_2};
      3'b001 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_3,_zz_Axi4Incr_result_4};
      3'b010 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_5,_zz_Axi4Incr_result_6};
      3'b011 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_7,_zz_Axi4Incr_result_8};
      3'b100 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_9,_zz_Axi4Incr_result_10};
      default : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_11,_zz_Axi4Incr_result_12};
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(io_phy_cmd_payload_mode)
      CmdMode_CS : io_phy_cmd_payload_mode_string = "CS  ";
      CmdMode_ADDR : io_phy_cmd_payload_mode_string = "ADDR";
      CmdMode_DATA : io_phy_cmd_payload_mode_string = "DATA";
      default : io_phy_cmd_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_BOOT : incomingScheduler_stateReg_string = "BOOT      ";
      incomingScheduler_enumDef_stateEntry : incomingScheduler_stateReg_string = "stateEntry";
      incomingScheduler_enumDef_stateWrite : incomingScheduler_stateReg_string = "stateWrite";
      incomingScheduler_enumDef_stateRead : incomingScheduler_stateReg_string = "stateRead ";
      default : incomingScheduler_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(incomingScheduler_stateNext)
      incomingScheduler_enumDef_BOOT : incomingScheduler_stateNext_string = "BOOT      ";
      incomingScheduler_enumDef_stateEntry : incomingScheduler_stateNext_string = "stateEntry";
      incomingScheduler_enumDef_stateWrite : incomingScheduler_stateNext_string = "stateWrite";
      incomingScheduler_enumDef_stateRead : incomingScheduler_stateNext_string = "stateRead ";
      default : incomingScheduler_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign io_bus_PREADY = hyperbus_io_bus_PREADY;
  assign io_bus_PRDATA = hyperbus_io_bus_PRDATA;
  assign io_bus_PSLVERROR = hyperbus_io_bus_PSLVERROR;
  assign io_phy_cmd_valid = hyperbus_io_phy_cmd_valid;
  assign io_phy_cmd_payload_mode = hyperbus_io_phy_cmd_payload_mode;
  assign io_phy_cmd_payload_args = hyperbus_io_phy_cmd_payload_args;
  assign io_phy_rsp_ready = hyperbus_io_phy_rsp_ready;
  assign io_phy_config_reset_pulse = hyperbus_io_phy_config_reset_pulse;
  assign io_phy_config_reset_halt = hyperbus_io_phy_config_reset_halt;
  assign io_phy_config_reset_trigger = hyperbus_io_phy_config_reset_trigger;
  assign incomingScheduler_wantExit = 1'b0;
  always @(*) begin
    incomingScheduler_wantStart = 1'b0;
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_stateEntry : begin
      end
      incomingScheduler_enumDef_stateWrite : begin
      end
      incomingScheduler_enumDef_stateRead : begin
      end
      default : begin
        incomingScheduler_wantStart = 1'b1;
      end
    endcase
  end

  assign incomingScheduler_wantKill = 1'b0;
  assign io_memory_arw_fire = (io_memory_arw_valid && io_memory_arw_ready);
  assign Axi4Incr_validSize = incomingScheduler_burst_size[1 : 0];
  assign Axi4Incr_highCat = incomingScheduler_burst_address[31 : 12];
  assign Axi4Incr_sizeValue = {(2'b10 == Axi4Incr_validSize),{(2'b01 == Axi4Incr_validSize),(2'b00 == Axi4Incr_validSize)}};
  assign Axi4Incr_alignMask = {10'd0, _zz_Axi4Incr_alignMask};
  assign Axi4Incr_base = (incomingScheduler_burst_address[11 : 0] & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_Axi4Incr_baseIncr);
  always @(*) begin
    casez(incomingScheduler_burst_count)
      8'b????1??? : begin
        _zz_Axi4Incr_wrapCase = 2'b11;
      end
      8'b????01?? : begin
        _zz_Axi4Incr_wrapCase = 2'b10;
      end
      8'b????001? : begin
        _zz_Axi4Incr_wrapCase = 2'b01;
      end
      default : begin
        _zz_Axi4Incr_wrapCase = 2'b00;
      end
    endcase
  end

  assign Axi4Incr_wrapCase = (_zz_Axi4Incr_wrapCase_1 + _zz_Axi4Incr_wrapCase_2);
  always @(*) begin
    case(incomingScheduler_burst_burstType)
      2'b00 : begin
        Axi4Incr_result = incomingScheduler_burst_address;
      end
      2'b10 : begin
        Axi4Incr_result = {Axi4Incr_highCat,_zz_Axi4Incr_result};
      end
      default : begin
        Axi4Incr_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @(*) begin
    io_memory_arw_ready = 1'b0;
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_stateEntry : begin
        if(io_memory_arw_valid) begin
          if(axiDataStorage_io_push_ready) begin
            io_memory_arw_ready = 1'b1;
          end
        end
      end
      incomingScheduler_enumDef_stateWrite : begin
      end
      incomingScheduler_enumDef_stateRead : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_memory_w_ready = 1'b0;
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_stateEntry : begin
      end
      incomingScheduler_enumDef_stateWrite : begin
        if(io_memory_w_valid) begin
          io_memory_w_ready = hyperbus_io_controller_ready;
        end
      end
      incomingScheduler_enumDef_stateRead : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    hyperbus_io_controller_valid = 1'b0;
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_stateEntry : begin
      end
      incomingScheduler_enumDef_stateWrite : begin
        if(io_memory_w_valid) begin
          hyperbus_io_controller_valid = 1'b1;
        end
      end
      incomingScheduler_enumDef_stateRead : begin
        hyperbus_io_controller_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    hyperbus_io_controller_payload_read = 1'b0;
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_stateEntry : begin
      end
      incomingScheduler_enumDef_stateWrite : begin
      end
      incomingScheduler_enumDef_stateRead : begin
        hyperbus_io_controller_payload_read = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign hyperbus_io_controller_payload_unaligned = incomingScheduler_burst_address[0];
  assign hyperbus_io_controller_payload_memory = 1'b1;
  assign hyperbus_io_controller_payload_addr = {1'b0,incomingScheduler_burst_address[31 : 1]};
  always @(*) begin
    hyperbus_io_controller_payload_data = 32'h00000000;
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_stateEntry : begin
      end
      incomingScheduler_enumDef_stateWrite : begin
        hyperbus_io_controller_payload_data = io_memory_w_payload_data;
      end
      incomingScheduler_enumDef_stateRead : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    case(incomingScheduler_burst_size)
      3'b000 : begin
        _zz_io_controller_payload_strobe = 4'b0001;
      end
      3'b001 : begin
        _zz_io_controller_payload_strobe = 4'b0011;
      end
      3'b010 : begin
        _zz_io_controller_payload_strobe = 4'b1111;
      end
      default : begin
        _zz_io_controller_payload_strobe = 4'b0000;
      end
    endcase
  end

  always @(*) begin
    hyperbus_io_controller_payload_strobe = _zz_io_controller_payload_strobe;
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_stateEntry : begin
      end
      incomingScheduler_enumDef_stateWrite : begin
        hyperbus_io_controller_payload_strobe = _zz_io_controller_payload_strobe_1;
      end
      incomingScheduler_enumDef_stateRead : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    hyperbus_io_controller_payload_last = 1'b0;
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_stateEntry : begin
      end
      incomingScheduler_enumDef_stateWrite : begin
        if(io_memory_w_valid) begin
          if(hyperbus_io_controller_ready) begin
            if(when_Axi4SharedHyperBus_l110) begin
              hyperbus_io_controller_payload_last = 1'b1;
            end
          end
        end
      end
      incomingScheduler_enumDef_stateRead : begin
        if(hyperbus_io_controller_ready) begin
          if(when_Axi4SharedHyperBus_l128) begin
            hyperbus_io_controller_payload_last = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    axiDataStorage_io_push_valid = 1'b0;
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_stateEntry : begin
        if(io_memory_arw_valid) begin
          if(axiDataStorage_io_push_ready) begin
            axiDataStorage_io_push_valid = 1'b1;
          end
        end
      end
      incomingScheduler_enumDef_stateWrite : begin
      end
      incomingScheduler_enumDef_stateRead : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    case(io_memory_arw_payload_size)
      3'b000 : begin
        _zz_io_push_payload_size = 4'b0001;
      end
      3'b001 : begin
        _zz_io_push_payload_size = 4'b0011;
      end
      3'b010 : begin
        _zz_io_push_payload_size = 4'b1111;
      end
      default : begin
        _zz_io_push_payload_size = 4'b0000;
      end
    endcase
  end

  assign io_memory_r_payload_id = axiDataStorage_io_pop_payload_id;
  assign _zz_io_memory_r_payload_data = hyperbus_io_frontend_payload_data[7 : 0];
  assign _zz_io_memory_r_payload_data_1 = hyperbus_io_frontend_payload_data[15 : 0];
  always @(*) begin
    case(axiDataStorage_io_pop_payload_size)
      4'b0001 : begin
        _zz_io_memory_r_payload_data_2 = {_zz_io_memory_r_payload_data,{_zz_io_memory_r_payload_data,{_zz_io_memory_r_payload_data,_zz_io_memory_r_payload_data}}};
      end
      4'b0011 : begin
        _zz_io_memory_r_payload_data_2 = {_zz_io_memory_r_payload_data_1,_zz_io_memory_r_payload_data_1};
      end
      default : begin
        _zz_io_memory_r_payload_data_2 = hyperbus_io_frontend_payload_data;
      end
    endcase
  end

  assign io_memory_r_payload_data = _zz_io_memory_r_payload_data_2;
  assign io_memory_r_payload_resp = 2'b00;
  assign io_memory_r_payload_last = hyperbus_io_frontend_payload_last;
  assign io_memory_r_valid = (hyperbus_io_frontend_payload_read && hyperbus_io_frontend_valid);
  assign io_memory_b_payload_id = axiDataStorage_io_pop_payload_id;
  assign io_memory_b_payload_resp = 2'b00;
  assign io_memory_b_valid = (((! hyperbus_io_frontend_payload_read) && hyperbus_io_frontend_valid) && hyperbus_io_frontend_payload_last);
  assign hyperbus_io_frontend_ready = (io_memory_r_ready || io_memory_b_ready);
  assign axiDataStorage_io_pop_ready = (io_memory_r_ready || io_memory_b_ready);
  always @(*) begin
    incomingScheduler_stateNext = incomingScheduler_stateReg;
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_stateEntry : begin
        if(io_memory_arw_valid) begin
          if(axiDataStorage_io_push_ready) begin
            if(io_memory_arw_payload_write) begin
              incomingScheduler_stateNext = incomingScheduler_enumDef_stateWrite;
            end else begin
              incomingScheduler_stateNext = incomingScheduler_enumDef_stateRead;
            end
          end
        end
      end
      incomingScheduler_enumDef_stateWrite : begin
        if(io_memory_w_valid) begin
          if(hyperbus_io_controller_ready) begin
            if(when_Axi4SharedHyperBus_l110) begin
              incomingScheduler_stateNext = incomingScheduler_enumDef_stateEntry;
            end
          end
        end
      end
      incomingScheduler_enumDef_stateRead : begin
        if(hyperbus_io_controller_ready) begin
          if(when_Axi4SharedHyperBus_l128) begin
            incomingScheduler_stateNext = incomingScheduler_enumDef_stateEntry;
          end
        end
      end
      default : begin
      end
    endcase
    if(incomingScheduler_wantStart) begin
      incomingScheduler_stateNext = incomingScheduler_enumDef_stateEntry;
    end
    if(incomingScheduler_wantKill) begin
      incomingScheduler_stateNext = incomingScheduler_enumDef_BOOT;
    end
  end

  always @(*) begin
    _zz_io_controller_payload_strobe_1 = _zz_io_controller_payload_strobe_2;
    _zz_io_controller_payload_strobe_1 = (incomingScheduler_burst_shift[1] ? {_zz_io_controller_payload_strobe_2[1 : 0],_zz_io_controller_payload_strobe_2[3 : 2]} : _zz_io_controller_payload_strobe_2);
  end

  always @(*) begin
    _zz_io_controller_payload_strobe_2 = _zz_io_controller_payload_strobe_3;
    _zz_io_controller_payload_strobe_2 = (incomingScheduler_burst_shift[0] ? {_zz_io_controller_payload_strobe_3[0 : 0],_zz_io_controller_payload_strobe_3[3 : 1]} : _zz_io_controller_payload_strobe_3);
  end

  assign _zz_io_controller_payload_strobe_3 = io_memory_w_payload_strb;
  assign when_Axi4SharedHyperBus_l110 = (incomingScheduler_burst_count == 8'h00);
  assign when_Axi4SharedHyperBus_l128 = (incomingScheduler_burst_count == 8'h00);
  assign axiDataStorage_io_flush = 1'b0;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      incomingScheduler_id <= 6'h00;
      incomingScheduler_stateReg <= incomingScheduler_enumDef_BOOT;
    end else begin
      if(io_memory_arw_fire) begin
        incomingScheduler_id <= (incomingScheduler_id + 6'h01);
      end
      incomingScheduler_stateReg <= incomingScheduler_stateNext;
    end
  end

  always @(posedge _zz_1) begin
    case(incomingScheduler_stateReg)
      incomingScheduler_enumDef_stateEntry : begin
        if(io_memory_arw_valid) begin
          incomingScheduler_burst_address <= io_memory_arw_payload_addr;
          incomingScheduler_burst_count <= io_memory_arw_payload_len;
          incomingScheduler_burst_size <= io_memory_arw_payload_size;
          incomingScheduler_burst_burstType <= io_memory_arw_payload_burst;
          incomingScheduler_burst_shift <= io_memory_arw_payload_addr[1 : 0];
        end
      end
      incomingScheduler_enumDef_stateWrite : begin
        if(io_memory_w_valid) begin
          if(hyperbus_io_controller_ready) begin
            if(!when_Axi4SharedHyperBus_l110) begin
              incomingScheduler_burst_address <= Axi4Incr_result;
              incomingScheduler_burst_count <= (incomingScheduler_burst_count - 8'h01);
            end
          end
        end
      end
      incomingScheduler_enumDef_stateRead : begin
        if(hyperbus_io_controller_ready) begin
          if(!when_Axi4SharedHyperBus_l128) begin
            incomingScheduler_burst_address <= Axi4Incr_result;
            incomingScheduler_burst_count <= (incomingScheduler_burst_count - 8'h01);
          end
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module SystemDebugger (
  input  wire          io_remote_cmd_valid,
  output wire          io_remote_cmd_ready,
  input  wire          io_remote_cmd_payload_last,
  input  wire [0:0]    io_remote_cmd_payload_fragment,
  output wire          io_remote_rsp_valid,
  input  wire          io_remote_rsp_ready,
  output wire          io_remote_rsp_payload_error,
  output wire [31:0]   io_remote_rsp_payload_data,
  output wire          io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output wire [31:0]   io_mem_cmd_payload_address,
  output wire [31:0]   io_mem_cmd_payload_data,
  output wire          io_mem_cmd_payload_wr,
  output wire [1:0]    io_mem_cmd_payload_size,
  input  wire          io_mem_rsp_valid,
  input  wire [31:0]   io_mem_rsp_payload,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire                when_Fragment_l356;
  wire                when_Fragment_l359;
  wire       [66:0]   _zz_io_mem_cmd_payload_address;
  wire                io_mem_cmd_isStall;
  wire                when_Fragment_l382;

  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign when_Fragment_l356 = (dispatcher_headerLoaded == 1'b0);
  assign when_Fragment_l359 = (dispatcher_counter == 3'b111);
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_io_mem_cmd_payload_address = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_io_mem_cmd_payload_address[31 : 0];
  assign io_mem_cmd_payload_data = _zz_io_mem_cmd_payload_address[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_io_mem_cmd_payload_address[64];
  assign io_mem_cmd_payload_size = _zz_io_mem_cmd_payload_address[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h00));
  assign io_mem_cmd_isStall = (io_mem_cmd_valid && (! io_mem_cmd_ready));
  assign when_Fragment_l382 = ((dispatcher_headerLoaded && dispatcher_dataLoaded) && (! io_mem_cmd_isStall));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= 3'b000;
    end else begin
      if(io_remote_cmd_valid) begin
        if(when_Fragment_l356) begin
          dispatcher_counter <= (dispatcher_counter + 3'b001);
          if(when_Fragment_l359) begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last) begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= 3'b000;
        end
      end
      if(when_Fragment_l382) begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @(posedge _zz_1) begin
    if(io_remote_cmd_valid) begin
      if(when_Fragment_l356) begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1'd1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1'd1);
      end
    end
  end


endmodule

module JtagBridge (
  input  wire          io_jtag_tms,
  input  wire          io_jtag_tdi,
  output wire          io_jtag_tdo,
  input  wire          io_jtag_tck,
  output wire          io_remote_cmd_valid,
  input  wire          io_remote_cmd_ready,
  output wire          io_remote_cmd_payload_last,
  output wire [0:0]    io_remote_cmd_payload_fragment,
  input  wire          io_remote_rsp_valid,
  output wire          io_remote_rsp_ready,
  input  wire          io_remote_rsp_payload_error,
  input  wire [31:0]   io_remote_rsp_payload_data,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam JtagState_RESET = 4'd0;
  localparam JtagState_IDLE = 4'd1;
  localparam JtagState_IR_SELECT = 4'd2;
  localparam JtagState_IR_CAPTURE = 4'd3;
  localparam JtagState_IR_SHIFT = 4'd4;
  localparam JtagState_IR_EXIT1 = 4'd5;
  localparam JtagState_IR_PAUSE = 4'd6;
  localparam JtagState_IR_EXIT2 = 4'd7;
  localparam JtagState_IR_UPDATE = 4'd8;
  localparam JtagState_DR_SELECT = 4'd9;
  localparam JtagState_DR_CAPTURE = 4'd10;
  localparam JtagState_DR_SHIFT = 4'd11;
  localparam JtagState_DR_EXIT1 = 4'd12;
  localparam JtagState_DR_PAUSE = 4'd13;
  localparam JtagState_DR_EXIT2 = 4'd14;
  localparam JtagState_DR_UPDATE = 4'd15;

  wire                flowCCByToggle_1_io_output_valid;
  wire                flowCCByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCByToggle_1_io_output_payload_fragment;
  wire       [3:0]    _zz_jtag_tap_isBypass;
  wire       [1:0]    _zz_jtag_tap_instructionShift;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  wire                system_cmd_toStream_valid;
  wire                system_cmd_toStream_ready;
  wire                system_cmd_toStream_payload_last;
  wire       [0:0]    system_cmd_toStream_payload_fragment;
  (* async_reg = "true" *) reg                 system_rsp_valid;
  (* async_reg = "true" *) reg                 system_rsp_payload_error;
  (* async_reg = "true" *) reg        [31:0]   system_rsp_payload_data;
  wire                io_remote_rsp_fire;
  wire       [3:0]    jtag_tap_fsm_stateNext;
  reg        [3:0]    jtag_tap_fsm_state;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_1;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_2;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_3;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_4;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_5;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_6;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_7;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_8;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_9;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_10;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_11;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_12;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_13;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_14;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_15;
  reg        [3:0]    _zz_jtag_tap_fsm_stateNext_16;
  reg        [3:0]    jtag_tap_instruction;
  reg        [3:0]    jtag_tap_instructionShift;
  reg                 jtag_tap_bypass;
  reg                 jtag_tap_tdoUnbufferd;
  reg                 jtag_tap_tdoDr;
  wire                jtag_tap_tdoIr;
  wire                jtag_tap_isBypass;
  reg                 jtag_tap_tdoUnbufferd_regNext;
  wire                jtag_idcodeArea_ctrl_tdi;
  wire                jtag_idcodeArea_ctrl_enable;
  wire                jtag_idcodeArea_ctrl_capture;
  wire                jtag_idcodeArea_ctrl_shift;
  wire                jtag_idcodeArea_ctrl_update;
  wire                jtag_idcodeArea_ctrl_reset;
  wire                jtag_idcodeArea_ctrl_tdo;
  reg        [31:0]   jtag_idcodeArea_shifter;
  wire                when_JtagTap_l120;
  wire                jtag_writeArea_ctrl_tdi;
  wire                jtag_writeArea_ctrl_enable;
  wire                jtag_writeArea_ctrl_capture;
  wire                jtag_writeArea_ctrl_shift;
  wire                jtag_writeArea_ctrl_update;
  wire                jtag_writeArea_ctrl_reset;
  wire                jtag_writeArea_ctrl_tdo;
  wire                jtag_writeArea_source_valid;
  wire                jtag_writeArea_source_payload_last;
  wire       [0:0]    jtag_writeArea_source_payload_fragment;
  reg                 jtag_writeArea_valid;
  reg                 jtag_writeArea_data;
  wire                jtag_readArea_ctrl_tdi;
  wire                jtag_readArea_ctrl_enable;
  wire                jtag_readArea_ctrl_capture;
  wire                jtag_readArea_ctrl_shift;
  wire                jtag_readArea_ctrl_update;
  wire                jtag_readArea_ctrl_reset;
  wire                jtag_readArea_ctrl_tdo;
  reg        [33:0]   jtag_readArea_full_shifter;
  `ifndef SYNTHESIS
  reg [79:0] jtag_tap_fsm_stateNext_string;
  reg [79:0] jtag_tap_fsm_state_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_1_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_2_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_3_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_4_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_5_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_6_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_7_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_8_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_9_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_10_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_11_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_12_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_13_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_14_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_15_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_16_string;
  `endif


  assign _zz_jtag_tap_isBypass = jtag_tap_instruction;
  assign _zz_jtag_tap_instructionShift = 2'b01;
  FlowCCByToggle flowCCByToggle_1 (
    .io_input_valid             (jtag_writeArea_source_valid                ), //i
    .io_input_payload_last      (jtag_writeArea_source_payload_last         ), //i
    .io_input_payload_fragment  (jtag_writeArea_source_payload_fragment     ), //i
    .io_output_valid            (flowCCByToggle_1_io_output_valid           ), //o
    .io_output_payload_last     (flowCCByToggle_1_io_output_payload_last    ), //o
    .io_output_payload_fragment (flowCCByToggle_1_io_output_payload_fragment), //o
    .io_jtag_tck                (io_jtag_tck                                ), //i
    ._zz_1                      (_zz_1                                      ), //i
    ._zz_2                      (_zz_2                                      )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(jtag_tap_fsm_stateNext)
      JtagState_RESET : jtag_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : jtag_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(jtag_tap_fsm_state)
      JtagState_RESET : jtag_tap_fsm_state_string = "RESET     ";
      JtagState_IDLE : jtag_tap_fsm_state_string = "IDLE      ";
      JtagState_IR_SELECT : jtag_tap_fsm_state_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : jtag_tap_fsm_state_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : jtag_tap_fsm_state_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : jtag_tap_fsm_state_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : jtag_tap_fsm_state_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : jtag_tap_fsm_state_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : jtag_tap_fsm_state_string = "IR_UPDATE ";
      JtagState_DR_SELECT : jtag_tap_fsm_state_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : jtag_tap_fsm_state_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : jtag_tap_fsm_state_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : jtag_tap_fsm_state_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : jtag_tap_fsm_state_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : jtag_tap_fsm_state_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : jtag_tap_fsm_state_string = "DR_UPDATE ";
      default : jtag_tap_fsm_state_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_1)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_1_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_1_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_1_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_1_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_1_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_1_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_1_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_1_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_1_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_1_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_1_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_1_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_1_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_1_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_1_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_1_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_1_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_2)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_2_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_2_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_2_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_2_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_2_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_2_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_2_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_2_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_2_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_2_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_2_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_2_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_2_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_2_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_2_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_2_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_2_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_3)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_3_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_3_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_3_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_3_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_3_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_3_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_3_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_3_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_3_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_3_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_3_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_3_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_3_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_3_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_3_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_3_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_3_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_4)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_4_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_4_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_4_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_4_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_4_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_4_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_4_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_4_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_4_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_4_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_4_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_4_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_4_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_4_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_4_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_4_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_4_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_5)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_5_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_5_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_5_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_5_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_5_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_5_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_5_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_5_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_5_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_5_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_5_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_5_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_5_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_5_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_5_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_5_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_5_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_6)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_6_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_6_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_6_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_6_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_6_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_6_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_6_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_6_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_6_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_6_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_6_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_6_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_6_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_6_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_6_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_6_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_6_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_7)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_7_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_7_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_7_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_7_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_7_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_7_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_7_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_7_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_7_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_7_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_7_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_7_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_7_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_7_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_7_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_7_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_7_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_8)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_8_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_8_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_8_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_8_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_8_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_8_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_8_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_8_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_8_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_8_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_8_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_8_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_8_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_8_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_8_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_8_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_8_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_9)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_9_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_9_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_9_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_9_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_9_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_9_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_9_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_9_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_9_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_9_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_9_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_9_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_9_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_9_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_9_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_9_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_9_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_10)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_10_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_10_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_10_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_10_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_10_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_10_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_10_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_10_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_10_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_10_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_10_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_10_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_10_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_10_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_10_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_10_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_10_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_11)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_11_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_11_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_11_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_11_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_11_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_11_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_11_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_11_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_11_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_11_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_11_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_11_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_11_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_11_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_11_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_11_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_11_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_12)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_12_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_12_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_12_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_12_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_12_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_12_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_12_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_12_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_12_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_12_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_12_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_12_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_12_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_12_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_12_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_12_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_12_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_13)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_13_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_13_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_13_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_13_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_13_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_13_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_13_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_13_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_13_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_13_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_13_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_13_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_13_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_13_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_13_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_13_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_13_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_14)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_14_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_14_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_14_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_14_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_14_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_14_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_14_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_14_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_14_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_14_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_14_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_14_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_14_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_14_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_14_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_14_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_14_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_15)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_15_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_15_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_15_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_15_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_15_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_15_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_15_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_15_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_15_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_15_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_15_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_15_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_15_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_15_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_15_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_15_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_15_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_16)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_16_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_16_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_16_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_16_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_16_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_16_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_16_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_16_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_16_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_16_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_16_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_16_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_16_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_16_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_16_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_16_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_16_string = "??????????";
    endcase
  end
  `endif

  assign system_cmd_toStream_valid = system_cmd_valid;
  assign system_cmd_toStream_payload_last = system_cmd_payload_last;
  assign system_cmd_toStream_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_cmd_valid = system_cmd_toStream_valid;
  assign system_cmd_toStream_ready = io_remote_cmd_ready;
  assign io_remote_cmd_payload_last = system_cmd_toStream_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_toStream_payload_fragment;
  assign io_remote_rsp_fire = (io_remote_rsp_valid && io_remote_rsp_ready);
  assign io_remote_rsp_ready = 1'b1;
  assign _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_RESET : JtagState_IDLE);
  assign _zz_jtag_tap_fsm_stateNext_1 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  assign _zz_jtag_tap_fsm_stateNext_2 = (io_jtag_tms ? JtagState_RESET : JtagState_IR_CAPTURE);
  assign _zz_jtag_tap_fsm_stateNext_3 = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_4 = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_5 = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_6 = (io_jtag_tms ? JtagState_IR_EXIT2 : JtagState_IR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_7 = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_8 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  assign _zz_jtag_tap_fsm_stateNext_9 = (io_jtag_tms ? JtagState_IR_SELECT : JtagState_DR_CAPTURE);
  assign _zz_jtag_tap_fsm_stateNext_10 = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_11 = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_12 = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_13 = (io_jtag_tms ? JtagState_DR_EXIT2 : JtagState_DR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_14 = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_15 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  always @(*) begin
    case(jtag_tap_fsm_state)
      JtagState_IDLE : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_1;
      end
      JtagState_IR_SELECT : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_2;
      end
      JtagState_IR_CAPTURE : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_3;
      end
      JtagState_IR_SHIFT : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_4;
      end
      JtagState_IR_EXIT1 : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_5;
      end
      JtagState_IR_PAUSE : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_6;
      end
      JtagState_IR_EXIT2 : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_7;
      end
      JtagState_IR_UPDATE : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_8;
      end
      JtagState_DR_SELECT : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_9;
      end
      JtagState_DR_CAPTURE : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_10;
      end
      JtagState_DR_SHIFT : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_11;
      end
      JtagState_DR_EXIT1 : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_12;
      end
      JtagState_DR_PAUSE : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_13;
      end
      JtagState_DR_EXIT2 : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_14;
      end
      JtagState_DR_UPDATE : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext_15;
      end
      default : begin
        _zz_jtag_tap_fsm_stateNext_16 = _zz_jtag_tap_fsm_stateNext;
      end
    endcase
  end

  assign jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_16;
  always @(*) begin
    jtag_tap_tdoUnbufferd = jtag_tap_bypass;
    case(jtag_tap_fsm_state)
      JtagState_IR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_tdoIr;
      end
      JtagState_DR_SHIFT : begin
        if(jtag_tap_isBypass) begin
          jtag_tap_tdoUnbufferd = jtag_tap_bypass;
        end else begin
          jtag_tap_tdoUnbufferd = jtag_tap_tdoDr;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    jtag_tap_tdoDr = 1'b0;
    if(jtag_idcodeArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_idcodeArea_ctrl_tdo;
    end
    if(jtag_writeArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_writeArea_ctrl_tdo;
    end
    if(jtag_readArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_readArea_ctrl_tdo;
    end
  end

  assign jtag_tap_tdoIr = jtag_tap_instructionShift[0];
  assign jtag_tap_isBypass = ($signed(_zz_jtag_tap_isBypass) == $signed(4'b1111));
  assign io_jtag_tdo = jtag_tap_tdoUnbufferd_regNext;
  assign jtag_idcodeArea_ctrl_tdo = jtag_idcodeArea_shifter[0];
  assign jtag_idcodeArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_idcodeArea_ctrl_enable = (jtag_tap_instruction == 4'b0001);
  assign jtag_idcodeArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_idcodeArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_idcodeArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_idcodeArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  assign when_JtagTap_l120 = (jtag_tap_fsm_state == JtagState_RESET);
  assign jtag_writeArea_source_valid = jtag_writeArea_valid;
  assign jtag_writeArea_source_payload_last = (! (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift));
  assign jtag_writeArea_source_payload_fragment[0] = jtag_writeArea_data;
  assign system_cmd_valid = flowCCByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCByToggle_1_io_output_payload_fragment;
  assign jtag_writeArea_ctrl_tdo = 1'b0;
  assign jtag_writeArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_writeArea_ctrl_enable = (jtag_tap_instruction == 4'b0010);
  assign jtag_writeArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_writeArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_writeArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_writeArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  assign jtag_readArea_ctrl_tdo = jtag_readArea_full_shifter[0];
  assign jtag_readArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_readArea_ctrl_enable = (jtag_tap_instruction == 4'b0011);
  assign jtag_readArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_readArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_readArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_readArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  always @(posedge _zz_1) begin
    if(io_remote_cmd_valid) begin
      system_rsp_valid <= 1'b0;
    end
    if(io_remote_rsp_fire) begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @(posedge io_jtag_tck) begin
    jtag_tap_fsm_state <= jtag_tap_fsm_stateNext;
    jtag_tap_bypass <= io_jtag_tdi;
    case(jtag_tap_fsm_state)
      JtagState_IR_CAPTURE : begin
        jtag_tap_instructionShift <= {2'd0, _zz_jtag_tap_instructionShift};
      end
      JtagState_IR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1'd1);
      end
      JtagState_IR_UPDATE : begin
        jtag_tap_instruction <= jtag_tap_instructionShift;
      end
      JtagState_DR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1'd1);
      end
      default : begin
      end
    endcase
    if(jtag_idcodeArea_ctrl_enable) begin
      if(jtag_idcodeArea_ctrl_shift) begin
        jtag_idcodeArea_shifter <= ({jtag_idcodeArea_ctrl_tdi,jtag_idcodeArea_shifter} >>> 1'd1);
      end
    end
    if(jtag_idcodeArea_ctrl_capture) begin
      jtag_idcodeArea_shifter <= 32'h10001fff;
    end
    if(when_JtagTap_l120) begin
      jtag_tap_instruction <= 4'b0001;
    end
    jtag_writeArea_valid <= (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift);
    jtag_writeArea_data <= jtag_writeArea_ctrl_tdi;
    if(jtag_readArea_ctrl_enable) begin
      if(jtag_readArea_ctrl_capture) begin
        jtag_readArea_full_shifter <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if(jtag_readArea_ctrl_shift) begin
        jtag_readArea_full_shifter <= ({jtag_readArea_ctrl_tdi,jtag_readArea_full_shifter} >>> 1'd1);
      end
    end
  end

  always @(negedge io_jtag_tck) begin
    jtag_tap_tdoUnbufferd_regNext <= jtag_tap_tdoUnbufferd;
  end


endmodule

module VexRiscv (
  output wire          iBus_cmd_valid,
  input  wire          iBus_cmd_ready,
  output wire [31:0]   iBus_cmd_payload_pc,
  input  wire          iBus_rsp_valid,
  input  wire          iBus_rsp_payload_error,
  input  wire [31:0]   iBus_rsp_payload_inst,
  input  wire          timerInterrupt,
  input  wire          externalInterrupt,
  input  wire          softwareInterrupt,
  input  wire          debug_bus_cmd_valid,
  output reg           debug_bus_cmd_ready,
  input  wire          debug_bus_cmd_payload_wr,
  input  wire [7:0]    debug_bus_cmd_payload_address,
  input  wire [31:0]   debug_bus_cmd_payload_data,
  output reg  [31:0]   debug_bus_rsp_data,
  output wire          debug_resetOut,
  output wire          dBus_cmd_valid,
  input  wire          dBus_cmd_ready,
  output wire          dBus_cmd_payload_wr,
  output wire [31:0]   dBus_cmd_payload_address,
  output wire [31:0]   dBus_cmd_payload_data,
  output wire [1:0]    dBus_cmd_payload_size,
  input  wire          dBus_rsp_ready,
  input  wire          dBus_rsp_error,
  input  wire [31:0]   dBus_rsp_data,
  input  wire          _zz_7,
  input  wire          _zz_8,
  input  wire          _zz_9,
  input  wire          _zz_10
);
  localparam BranchCtrlEnum_INC = 2'd0;
  localparam BranchCtrlEnum_B = 2'd1;
  localparam BranchCtrlEnum_JAL = 2'd2;
  localparam BranchCtrlEnum_JALR = 2'd3;
  localparam EnvCtrlEnum_NONE = 3'd0;
  localparam EnvCtrlEnum_XRET = 3'd1;
  localparam EnvCtrlEnum_WFI = 3'd2;
  localparam EnvCtrlEnum_ECALL = 3'd3;
  localparam EnvCtrlEnum_EBREAK = 3'd4;
  localparam ShiftCtrlEnum_DISABLE_1 = 2'd0;
  localparam ShiftCtrlEnum_SLL_1 = 2'd1;
  localparam ShiftCtrlEnum_SRL_1 = 2'd2;
  localparam ShiftCtrlEnum_SRA_1 = 2'd3;
  localparam AluBitwiseCtrlEnum_XOR_1 = 2'd0;
  localparam AluBitwiseCtrlEnum_OR_1 = 2'd1;
  localparam AluBitwiseCtrlEnum_AND_1 = 2'd2;
  localparam AluCtrlEnum_ADD_SUB = 2'd0;
  localparam AluCtrlEnum_SLT_SLTU = 2'd1;
  localparam AluCtrlEnum_BITWISE = 2'd2;
  localparam Src2CtrlEnum_RS = 2'd0;
  localparam Src2CtrlEnum_IMI = 2'd1;
  localparam Src2CtrlEnum_IMS = 2'd2;
  localparam Src2CtrlEnum_PC = 2'd3;
  localparam Src1CtrlEnum_RS = 2'd0;
  localparam Src1CtrlEnum_IMU = 2'd1;
  localparam Src1CtrlEnum_PC_INCREMENT = 2'd2;
  localparam Src1CtrlEnum_URS1 = 2'd3;

  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_flush;
  wire       [31:0]   _zz_RegFilePlugin_regFile_port0;
  wire       [31:0]   _zz_RegFilePlugin_regFile_port1;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [1:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire       [1:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_availability;
  wire       [51:0]   _zz_memory_MUL_LOW;
  wire       [51:0]   _zz_memory_MUL_LOW_1;
  wire       [51:0]   _zz_memory_MUL_LOW_2;
  wire       [32:0]   _zz_memory_MUL_LOW_3;
  wire       [51:0]   _zz_memory_MUL_LOW_4;
  wire       [49:0]   _zz_memory_MUL_LOW_5;
  wire       [51:0]   _zz_memory_MUL_LOW_6;
  wire       [49:0]   _zz_memory_MUL_LOW_7;
  wire       [31:0]   _zz_decode_FORMAL_PC_NEXT;
  wire       [2:0]    _zz_decode_FORMAL_PC_NEXT_1;
  wire       [31:0]   _zz_execute_SHIFT_RIGHT;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_1;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_2;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_1;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_2;
  wire                _zz_decode_LEGAL_INSTRUCTION_3;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_4;
  wire       [12:0]   _zz_decode_LEGAL_INSTRUCTION_5;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_6;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_7;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_8;
  wire                _zz_decode_LEGAL_INSTRUCTION_9;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_10;
  wire       [6:0]    _zz_decode_LEGAL_INSTRUCTION_11;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_12;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_13;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_14;
  wire                _zz_decode_LEGAL_INSTRUCTION_15;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_16;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_17;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_1;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_2;
  wire       [31:0]   _zz_IBusSimplePlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusSimplePlugin_fetchPc_pc_1;
  wire       [31:0]   _zz_IBusSimplePlugin_decodePc_pcPlus;
  wire       [2:0]    _zz_IBusSimplePlugin_decodePc_pcPlus_1;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_27;
  wire       [0:0]    _zz_IBusSimplePlugin_decompressor_decompressed_28;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_29;
  wire       [31:0]   _zz_IBusSimplePlugin_decompressor_decompressed_30;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_31;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_32;
  wire       [6:0]    _zz_IBusSimplePlugin_decompressor_decompressed_33;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_34;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_35;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_36;
  wire       [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_37;
  wire       [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_38;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_1;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_2;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_3;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_4;
  wire       [2:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire       [0:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1;
  wire       [31:0]   _zz__zz_decode_IS_CSR;
  wire       [31:0]   _zz__zz_decode_IS_CSR_1;
  wire       [31:0]   _zz__zz_decode_IS_CSR_2;
  wire       [31:0]   _zz__zz_decode_IS_CSR_3;
  wire       [0:0]    _zz__zz_decode_IS_CSR_4;
  wire                _zz__zz_decode_IS_CSR_5;
  wire       [31:0]   _zz__zz_decode_IS_CSR_6;
  wire       [31:0]   _zz__zz_decode_IS_CSR_7;
  wire       [0:0]    _zz__zz_decode_IS_CSR_8;
  wire       [31:0]   _zz__zz_decode_IS_CSR_9;
  wire       [25:0]   _zz__zz_decode_IS_CSR_10;
  wire                _zz__zz_decode_IS_CSR_11;
  wire                _zz__zz_decode_IS_CSR_12;
  wire       [0:0]    _zz__zz_decode_IS_CSR_13;
  wire                _zz__zz_decode_IS_CSR_14;
  wire       [0:0]    _zz__zz_decode_IS_CSR_15;
  wire       [31:0]   _zz__zz_decode_IS_CSR_16;
  wire       [20:0]   _zz__zz_decode_IS_CSR_17;
  wire       [31:0]   _zz__zz_decode_IS_CSR_18;
  wire       [31:0]   _zz__zz_decode_IS_CSR_19;
  wire       [0:0]    _zz__zz_decode_IS_CSR_20;
  wire       [0:0]    _zz__zz_decode_IS_CSR_21;
  wire       [0:0]    _zz__zz_decode_IS_CSR_22;
  wire                _zz__zz_decode_IS_CSR_23;
  wire       [31:0]   _zz__zz_decode_IS_CSR_24;
  wire       [0:0]    _zz__zz_decode_IS_CSR_25;
  wire       [31:0]   _zz__zz_decode_IS_CSR_26;
  wire       [31:0]   _zz__zz_decode_IS_CSR_27;
  wire       [15:0]   _zz__zz_decode_IS_CSR_28;
  wire       [0:0]    _zz__zz_decode_IS_CSR_29;
  wire       [0:0]    _zz__zz_decode_IS_CSR_30;
  wire       [0:0]    _zz__zz_decode_IS_CSR_31;
  wire                _zz__zz_decode_IS_CSR_32;
  wire       [0:0]    _zz__zz_decode_IS_CSR_33;
  wire                _zz__zz_decode_IS_CSR_34;
  wire                _zz__zz_decode_IS_CSR_35;
  wire       [11:0]   _zz__zz_decode_IS_CSR_36;
  wire       [0:0]    _zz__zz_decode_IS_CSR_37;
  wire       [31:0]   _zz__zz_decode_IS_CSR_38;
  wire       [3:0]    _zz__zz_decode_IS_CSR_39;
  wire       [31:0]   _zz__zz_decode_IS_CSR_40;
  wire       [31:0]   _zz__zz_decode_IS_CSR_41;
  wire                _zz__zz_decode_IS_CSR_42;
  wire       [31:0]   _zz__zz_decode_IS_CSR_43;
  wire       [0:0]    _zz__zz_decode_IS_CSR_44;
  wire       [31:0]   _zz__zz_decode_IS_CSR_45;
  wire       [31:0]   _zz__zz_decode_IS_CSR_46;
  wire       [0:0]    _zz__zz_decode_IS_CSR_47;
  wire       [0:0]    _zz__zz_decode_IS_CSR_48;
  wire       [31:0]   _zz__zz_decode_IS_CSR_49;
  wire                _zz__zz_decode_IS_CSR_50;
  wire                _zz__zz_decode_IS_CSR_51;
  wire       [31:0]   _zz__zz_decode_IS_CSR_52;
  wire       [0:0]    _zz__zz_decode_IS_CSR_53;
  wire       [2:0]    _zz__zz_decode_IS_CSR_54;
  wire                _zz__zz_decode_IS_CSR_55;
  wire       [31:0]   _zz__zz_decode_IS_CSR_56;
  wire       [0:0]    _zz__zz_decode_IS_CSR_57;
  wire       [0:0]    _zz__zz_decode_IS_CSR_58;
  wire       [31:0]   _zz__zz_decode_IS_CSR_59;
  wire       [31:0]   _zz__zz_decode_IS_CSR_60;
  wire       [0:0]    _zz__zz_decode_IS_CSR_61;
  wire       [0:0]    _zz__zz_decode_IS_CSR_62;
  wire       [1:0]    _zz__zz_decode_IS_CSR_63;
  wire                _zz__zz_decode_IS_CSR_64;
  wire       [31:0]   _zz__zz_decode_IS_CSR_65;
  wire       [7:0]    _zz__zz_decode_IS_CSR_66;
  wire       [5:0]    _zz__zz_decode_IS_CSR_67;
  wire       [0:0]    _zz__zz_decode_IS_CSR_68;
  wire       [31:0]   _zz__zz_decode_IS_CSR_69;
  wire       [31:0]   _zz__zz_decode_IS_CSR_70;
  wire       [3:0]    _zz__zz_decode_IS_CSR_71;
  wire                _zz__zz_decode_IS_CSR_72;
  wire       [31:0]   _zz__zz_decode_IS_CSR_73;
  wire       [0:0]    _zz__zz_decode_IS_CSR_74;
  wire       [31:0]   _zz__zz_decode_IS_CSR_75;
  wire       [31:0]   _zz__zz_decode_IS_CSR_76;
  wire       [1:0]    _zz__zz_decode_IS_CSR_77;
  wire                _zz__zz_decode_IS_CSR_78;
  wire                _zz__zz_decode_IS_CSR_79;
  wire                _zz__zz_decode_IS_CSR_80;
  wire       [0:0]    _zz__zz_decode_IS_CSR_81;
  wire       [0:0]    _zz__zz_decode_IS_CSR_82;
  wire       [31:0]   _zz__zz_decode_IS_CSR_83;
  wire       [31:0]   _zz__zz_decode_IS_CSR_84;
  wire       [0:0]    _zz__zz_decode_IS_CSR_85;
  wire       [1:0]    _zz__zz_decode_IS_CSR_86;
  wire                _zz__zz_decode_IS_CSR_87;
  wire       [31:0]   _zz__zz_decode_IS_CSR_88;
  wire       [4:0]    _zz__zz_decode_IS_CSR_89;
  wire                _zz__zz_decode_IS_CSR_90;
  wire       [0:0]    _zz__zz_decode_IS_CSR_91;
  wire       [31:0]   _zz__zz_decode_IS_CSR_92;
  wire       [31:0]   _zz__zz_decode_IS_CSR_93;
  wire       [2:0]    _zz__zz_decode_IS_CSR_94;
  wire       [0:0]    _zz__zz_decode_IS_CSR_95;
  wire       [0:0]    _zz__zz_decode_IS_CSR_96;
  wire       [31:0]   _zz__zz_decode_IS_CSR_97;
  wire       [0:0]    _zz__zz_decode_IS_CSR_98;
  wire       [0:0]    _zz__zz_decode_IS_CSR_99;
  wire       [31:0]   _zz__zz_decode_IS_CSR_100;
  wire       [31:0]   _zz__zz_decode_IS_CSR_101;
  wire       [2:0]    _zz__zz_decode_IS_CSR_102;
  wire                _zz__zz_decode_IS_CSR_103;
  wire       [0:0]    _zz__zz_decode_IS_CSR_104;
  wire       [31:0]   _zz__zz_decode_IS_CSR_105;
  wire       [1:0]    _zz__zz_decode_IS_CSR_106;
  wire       [31:0]   _zz__zz_decode_IS_CSR_107;
  wire       [31:0]   _zz__zz_decode_IS_CSR_108;
  wire       [31:0]   _zz__zz_decode_IS_CSR_109;
  wire       [31:0]   _zz__zz_decode_IS_CSR_110;
  wire       [0:0]    _zz__zz_decode_IS_CSR_111;
  wire       [1:0]    _zz__zz_decode_IS_CSR_112;
  wire       [31:0]   _zz__zz_decode_IS_CSR_113;
  wire       [31:0]   _zz__zz_decode_IS_CSR_114;
  wire       [0:0]    _zz__zz_decode_IS_CSR_115;
  wire       [1:0]    _zz__zz_decode_IS_CSR_116;
  wire       [31:0]   _zz__zz_decode_IS_CSR_117;
  wire       [31:0]   _zz__zz_decode_IS_CSR_118;
  wire       [0:0]    _zz__zz_execute_REGFILE_WRITE_DATA;
  wire       [2:0]    _zz__zz_execute_SRC1;
  wire       [4:0]    _zz__zz_execute_SRC1_1;
  wire       [11:0]   _zz__zz_execute_SRC2_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_1;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_4;
  wire       [65:0]   _zz_writeBack_MulPlugin_result;
  wire       [65:0]   _zz_writeBack_MulPlugin_result_1;
  wire       [31:0]   _zz__zz_decode_RS2_2;
  wire       [31:0]   _zz__zz_decode_RS2_2_1;
  wire       [5:0]    _zz_memory_DivPlugin_div_counter_valueNext;
  wire       [0:0]    _zz_memory_DivPlugin_div_counter_valueNext_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_outRemainder_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_stage_0_outNumerator;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_2;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_3;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_4;
  wire       [0:0]    _zz_memory_DivPlugin_div_result_5;
  wire       [32:0]   _zz_memory_DivPlugin_rs1_2;
  wire       [0:0]    _zz_memory_DivPlugin_rs1_3;
  wire       [31:0]   _zz_memory_DivPlugin_rs2_1;
  wire       [0:0]    _zz_memory_DivPlugin_rs2_2;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_15;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_16;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_17;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_18;
  wire       [51:0]   memory_MUL_LOW;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [33:0]   execute_MUL_HL;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_DO_EBREAK;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [1:0]    decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL_1;
  wire       [2:0]    _zz_memory_to_writeBack_ENV_CTRL;
  wire       [2:0]    _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       [2:0]    _zz_execute_to_memory_ENV_CTRL;
  wire       [2:0]    _zz_execute_to_memory_ENV_CTRL_1;
  wire       [2:0]    decode_ENV_CTRL;
  wire       [2:0]    _zz_decode_ENV_CTRL;
  wire       [2:0]    _zz_decode_to_execute_ENV_CTRL;
  wire       [2:0]    _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       [1:0]    decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL_1;
  wire       [1:0]    decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       [1:0]    decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL_1;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       [1:0]    decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL_1;
  wire                decode_MEMORY_ENABLE;
  wire       [1:0]    decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL_1;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire       [1:0]    execute_BRANCH_CTRL;
  wire       [1:0]    _zz_execute_BRANCH_CTRL;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       [2:0]    memory_ENV_CTRL;
  wire       [2:0]    _zz_memory_ENV_CTRL;
  wire       [2:0]    execute_ENV_CTRL;
  wire       [2:0]    _zz_execute_ENV_CTRL;
  wire       [2:0]    writeBack_ENV_CTRL;
  wire       [2:0]    _zz_writeBack_ENV_CTRL;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  (* keep , syn_keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  reg        [31:0]   _zz_decode_RS2;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   execute_SHIFT_RIGHT;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       [1:0]    execute_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_SHIFT_CTRL;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_execute_to_memory_PC;
  wire       [1:0]    execute_SRC2_CTRL;
  wire       [1:0]    _zz_execute_SRC2_CTRL;
  wire                execute_IS_RVC;
  wire       [1:0]    execute_SRC1_CTRL;
  wire       [1:0]    _zz_execute_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       [1:0]    execute_ALU_CTRL;
  wire       [1:0]    _zz_execute_ALU_CTRL;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       [1:0]    execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_execute_ALU_BITWISE_CTRL;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_1;
  wire       [2:0]    _zz_decode_ENV_CTRL_1;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_CTRL_1;
  wire       [1:0]    _zz_decode_SRC2_CTRL_1;
  wire       [1:0]    _zz_decode_SRC1_CTRL_1;
  reg        [31:0]   _zz_decode_RS2_2;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  reg        [31:0]   _zz_memory_to_writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire                decode_IS_RVC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusSimplePlugin_fetcherHalt;
  reg                 IBusSimplePlugin_forceNoDecodeCond;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire       [31:0]   CsrPlugin_csrMapping_readDataSignal;
  wire       [31:0]   CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   CsrPlugin_csrMapping_writeDataSignal;
  reg                 CsrPlugin_csrMapping_allowCsrSignal;
  wire                CsrPlugin_csrMapping_hazardFree;
  wire                CsrPlugin_csrMapping_doForceFailCsr;
  reg                 CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_selfException_valid;
  reg        [3:0]    CsrPlugin_selfException_payload_code;
  wire       [31:0]   CsrPlugin_selfException_payload_badAddr;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CsrPlugin_allowEbreakException;
  wire                CsrPlugin_xretAwayFromMachine;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  reg                 BranchPlugin_inDebugNoFetchFlag;
  reg                 DebugPlugin_injectionPort_valid;
  reg                 DebugPlugin_injectionPort_ready;
  wire       [31:0]   DebugPlugin_injectionPort_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_output_fire;
  wire                IBusSimplePlugin_fetchPc_corrected;
  wire                IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  wire                when_Fetcher_l133;
  wire                when_Fetcher_l133_1;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  wire                when_Fetcher_l160;
  reg                 IBusSimplePlugin_decodePc_flushed;
  reg        [31:0]   IBusSimplePlugin_decodePc_pcReg /* verilator public */ ;
  wire       [31:0]   IBusSimplePlugin_decodePc_pcPlus;
  reg                 IBusSimplePlugin_decodePc_injectedDecode;
  wire                when_Fetcher_l182;
  wire                when_Fetcher_l194;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_halt;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_payload;
  reg                 _zz_IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                when_Fetcher_l242;
  wire                IBusSimplePlugin_decompressor_input_valid;
  wire                IBusSimplePlugin_decompressor_input_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_pc;
  wire                IBusSimplePlugin_decompressor_input_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_input_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_output_valid;
  wire                IBusSimplePlugin_decompressor_output_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_pc;
  wire                IBusSimplePlugin_decompressor_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_flushNext;
  wire                IBusSimplePlugin_decompressor_consumeCurrent;
  reg                 IBusSimplePlugin_decompressor_bufferValid;
  reg        [15:0]   IBusSimplePlugin_decompressor_bufferData;
  wire                IBusSimplePlugin_decompressor_isInputLowRvc;
  wire                IBusSimplePlugin_decompressor_isInputHighRvc;
  reg                 IBusSimplePlugin_decompressor_throw2BytesReg;
  wire                IBusSimplePlugin_decompressor_throw2Bytes;
  wire                IBusSimplePlugin_decompressor_unaligned;
  reg                 IBusSimplePlugin_decompressor_bufferValidLatch;
  reg                 IBusSimplePlugin_decompressor_throw2BytesLatch;
  wire                IBusSimplePlugin_decompressor_bufferValidPatched;
  wire                IBusSimplePlugin_decompressor_throw2BytesPatched;
  wire       [31:0]   IBusSimplePlugin_decompressor_raw;
  wire                IBusSimplePlugin_decompressor_isRvc;
  wire       [15:0]   _zz_IBusSimplePlugin_decompressor_decompressed;
  reg        [31:0]   IBusSimplePlugin_decompressor_decompressed;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_1;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_2;
  wire       [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_3;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_4;
  reg        [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_5;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_6;
  reg        [9:0]    _zz_IBusSimplePlugin_decompressor_decompressed_7;
  wire       [20:0]   _zz_IBusSimplePlugin_decompressor_decompressed_8;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_9;
  reg        [14:0]   _zz_IBusSimplePlugin_decompressor_decompressed_10;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_11;
  reg        [2:0]    _zz_IBusSimplePlugin_decompressor_decompressed_12;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_13;
  reg        [9:0]    _zz_IBusSimplePlugin_decompressor_decompressed_14;
  wire       [20:0]   _zz_IBusSimplePlugin_decompressor_decompressed_15;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_16;
  reg        [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_17;
  wire       [12:0]   _zz_IBusSimplePlugin_decompressor_decompressed_18;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_19;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_20;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_21;
  wire       [4:0]    switch_Misc_l44;
  wire                when_Misc_l47;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_22;
  wire       [1:0]    switch_Misc_l241;
  wire       [1:0]    switch_Misc_l241_1;
  reg        [2:0]    _zz_IBusSimplePlugin_decompressor_decompressed_23;
  reg        [2:0]    _zz_IBusSimplePlugin_decompressor_decompressed_24;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_25;
  reg        [6:0]    _zz_IBusSimplePlugin_decompressor_decompressed_26;
  wire                IBusSimplePlugin_decompressor_output_fire;
  wire                IBusSimplePlugin_decompressor_bufferFill;
  wire                when_Fetcher_l285;
  wire                when_Fetcher_l288;
  wire                when_Fetcher_l293;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l331;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l331_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l331_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l331_3;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_pendingFull;
  wire                IBusSimplePlugin_cmdFork_enterTheMarket;
  reg                 IBusSimplePlugin_cmdFork_cmdKeep;
  reg                 IBusSimplePlugin_cmdFork_cmdFired;
  wire                IBusSimplePlugin_cmd_fire;
  wire                when_IBusSimplePlugin_l317;
  wire                when_IBusSimplePlugin_l318;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                iBus_rsp_toStream_valid;
  wire                iBus_rsp_toStream_ready;
  wire                iBus_rsp_toStream_payload_error;
  wire       [31:0]   iBus_rsp_toStream_payload_inst;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire                system_core_cpu_IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                when_IBusSimplePlugin_l376;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                IBusSimplePlugin_rspJoin_join_fire;
  wire                _zz_IBusSimplePlugin_iBusRsp_output_valid;
  wire                _zz_dBus_cmd_valid;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_dBus_cmd_payload_data;
  wire                when_DBusSimplePlugin_l436;
  reg        [3:0]    _zz_execute_DBusSimplePlugin_formalMask;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  wire                when_DBusSimplePlugin_l490;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire       [1:0]    switch_Misc_l241_2;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_1;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated_2;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_3;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire                when_DBusSimplePlugin_l566;
  wire       [31:0]   _zz_decode_IS_CSR;
  wire                _zz_decode_IS_CSR_1;
  wire                _zz_decode_IS_CSR_2;
  wire                _zz_decode_IS_CSR_3;
  wire                _zz_decode_IS_CSR_4;
  wire                _zz_decode_IS_CSR_5;
  wire                _zz_decode_IS_CSR_6;
  wire                _zz_decode_IS_CSR_7;
  wire                _zz_decode_IS_CSR_8;
  wire       [1:0]    _zz_decode_SRC1_CTRL_2;
  wire       [1:0]    _zz_decode_SRC2_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_2;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_2;
  wire       [2:0]    _zz_decode_ENV_CTRL_2;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_2;
  wire                when_RegFilePlugin_l63;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_5;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_execute_REGFILE_WRITE_DATA;
  reg        [31:0]   _zz_execute_SRC1;
  wire                _zz_execute_SRC2;
  reg        [19:0]   _zz_execute_SRC2_1;
  wire                _zz_execute_SRC2_2;
  reg        [19:0]   _zz_execute_SRC2_3;
  reg        [31:0]   _zz_execute_SRC2_4;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_execute_FullBarrelShifterPlugin_reversed;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_decode_RS2_3;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                when_HazardSimplePlugin_l47;
  wire                when_HazardSimplePlugin_l48;
  wire                when_HazardSimplePlugin_l51;
  wire                when_HazardSimplePlugin_l45;
  wire                when_HazardSimplePlugin_l57;
  wire                when_HazardSimplePlugin_l58;
  wire                when_HazardSimplePlugin_l48_1;
  wire                when_HazardSimplePlugin_l51_1;
  wire                when_HazardSimplePlugin_l45_1;
  wire                when_HazardSimplePlugin_l57_1;
  wire                when_HazardSimplePlugin_l58_1;
  wire                when_HazardSimplePlugin_l48_2;
  wire                when_HazardSimplePlugin_l51_2;
  wire                when_HazardSimplePlugin_l45_2;
  wire                when_HazardSimplePlugin_l57_2;
  wire                when_HazardSimplePlugin_l58_2;
  wire                when_HazardSimplePlugin_l105;
  wire                when_HazardSimplePlugin_l108;
  wire                when_HazardSimplePlugin_l113;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [1:0]    switch_MulPlugin_l87;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  wire                when_MulPlugin_l147;
  wire       [1:0]    switch_MulPlugin_l148;
  reg        [32:0]   memory_DivPlugin_rs1;
  reg        [31:0]   memory_DivPlugin_rs2;
  reg        [64:0]   memory_DivPlugin_accumulator;
  wire                memory_DivPlugin_frontendOk;
  reg                 memory_DivPlugin_div_needRevert;
  reg                 memory_DivPlugin_div_counter_willIncrement;
  reg                 memory_DivPlugin_div_counter_willClear;
  reg        [5:0]    memory_DivPlugin_div_counter_valueNext;
  reg        [5:0]    memory_DivPlugin_div_counter_value;
  wire                memory_DivPlugin_div_counter_willOverflowIfInc;
  wire                memory_DivPlugin_div_counter_willOverflow;
  reg                 memory_DivPlugin_div_done;
  wire                when_MulDivIterativePlugin_l126;
  wire                when_MulDivIterativePlugin_l126_1;
  reg        [31:0]   memory_DivPlugin_div_result;
  wire                when_MulDivIterativePlugin_l128;
  wire                when_MulDivIterativePlugin_l129;
  wire                when_MulDivIterativePlugin_l132;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outNumerator;
  wire                when_MulDivIterativePlugin_l151;
  wire       [31:0]   _zz_memory_DivPlugin_div_result;
  wire                when_MulDivIterativePlugin_l162;
  wire                _zz_memory_DivPlugin_rs2;
  wire                _zz_memory_DivPlugin_rs1;
  reg        [32:0]   _zz_memory_DivPlugin_rs1_1;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  wire       [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg        [31:0]   CsrPlugin_mscratch;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle;
  reg        [63:0]   CsrPlugin_minstret;
  wire                _zz_when_CsrPlugin_l1302;
  wire                _zz_when_CsrPlugin_l1302_1;
  wire                _zz_when_CsrPlugin_l1302_2;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire                when_CsrPlugin_l1259;
  wire                when_CsrPlugin_l1259_1;
  wire                when_CsrPlugin_l1259_2;
  wire                when_CsrPlugin_l1259_3;
  wire                when_CsrPlugin_l1272;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                when_CsrPlugin_l1296;
  wire                when_CsrPlugin_l1302;
  wire                when_CsrPlugin_l1302_1;
  wire                when_CsrPlugin_l1302_2;
  wire                CsrPlugin_exception;
  reg                 CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  wire                when_CsrPlugin_l1335;
  wire                when_CsrPlugin_l1335_1;
  wire                when_CsrPlugin_l1335_2;
  wire                when_CsrPlugin_l1340;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                when_CsrPlugin_l1346;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  wire                CsrPlugin_trapCauseEbreakDebug;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  wire                CsrPlugin_trapEnterDebug;
  wire                when_CsrPlugin_l1390;
  wire                when_CsrPlugin_l1398;
  wire                when_CsrPlugin_l1456;
  wire       [1:0]    switch_CsrPlugin_l1460;
  reg                 execute_CsrPlugin_wfiWake;
  wire                when_CsrPlugin_l1519;
  wire                when_CsrPlugin_l1521;
  wire                when_CsrPlugin_l1527;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire                when_CsrPlugin_l1540;
  wire                when_CsrPlugin_l1547;
  wire                when_CsrPlugin_l1548;
  wire                when_CsrPlugin_l1555;
  wire                when_CsrPlugin_l1565;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  wire                switch_Misc_l241_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1587;
  wire                when_CsrPlugin_l1591;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    switch_Misc_l241_4;
  reg                 _zz_execute_BRANCH_DO;
  reg                 _zz_execute_BRANCH_DO_1;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  reg        [31:0]   _zz_execute_BranchPlugin_branch_src2_6;
  wire       [31:0]   execute_BranchPlugin_branch_src2;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  wire                when_DebugPlugin_l238;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_debugUsed /* verilator public */ ;
  reg                 DebugPlugin_disableEbreak;
  wire                DebugPlugin_allowEBreak;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_when_DebugPlugin_l257;
  wire                when_DebugPlugin_l257;
  wire       [5:0]    switch_DebugPlugin_l280;
  wire                when_DebugPlugin_l284;
  wire                when_DebugPlugin_l284_1;
  wire                when_DebugPlugin_l285;
  wire                when_DebugPlugin_l285_1;
  wire                when_DebugPlugin_l286;
  wire                when_DebugPlugin_l287;
  wire                when_DebugPlugin_l288;
  wire                when_DebugPlugin_l288_1;
  wire                when_DebugPlugin_l308;
  wire                when_DebugPlugin_l311;
  wire                when_DebugPlugin_l324;
  reg                 _zz_6;
  reg                 DebugPlugin_resetIt_regNext;
  wire                when_DebugPlugin_l344;
  wire                when_Pipeline_l124;
  reg        [31:0]   decode_to_execute_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   execute_to_memory_PC;
  wire                when_Pipeline_l124_2;
  reg        [31:0]   memory_to_writeBack_PC;
  wire                when_Pipeline_l124_3;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l124_4;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  wire                when_Pipeline_l124_5;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  wire                when_Pipeline_l124_6;
  reg                 decode_to_execute_IS_RVC;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_10;
  reg        [1:0]    decode_to_execute_SRC1_CTRL;
  wire                when_Pipeline_l124_11;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_12;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_13;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_14;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  wire                when_Pipeline_l124_15;
  reg        [1:0]    decode_to_execute_SRC2_CTRL;
  wire                when_Pipeline_l124_16;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_17;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_18;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_19;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_20;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_21;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_22;
  reg                 decode_to_execute_MEMORY_STORE;
  wire                when_Pipeline_l124_23;
  reg                 execute_to_memory_MEMORY_STORE;
  wire                when_Pipeline_l124_24;
  reg        [1:0]    decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_25;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_26;
  reg        [1:0]    decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_27;
  reg        [1:0]    decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_28;
  reg                 decode_to_execute_IS_MUL;
  wire                when_Pipeline_l124_29;
  reg                 execute_to_memory_IS_MUL;
  wire                when_Pipeline_l124_30;
  reg                 memory_to_writeBack_IS_MUL;
  wire                when_Pipeline_l124_31;
  reg                 decode_to_execute_IS_DIV;
  wire                when_Pipeline_l124_32;
  reg                 execute_to_memory_IS_DIV;
  wire                when_Pipeline_l124_33;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  wire                when_Pipeline_l124_34;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  wire                when_Pipeline_l124_35;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_36;
  reg        [2:0]    decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_37;
  reg        [2:0]    execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_38;
  reg        [2:0]    memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_39;
  reg        [1:0]    decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_40;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_41;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_42;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_43;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_44;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_45;
  reg                 decode_to_execute_DO_EBREAK;
  wire                when_Pipeline_l124_46;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_47;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_48;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_49;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_50;
  reg        [31:0]   execute_to_memory_MUL_LL;
  wire                when_Pipeline_l124_51;
  reg        [33:0]   execute_to_memory_MUL_LH;
  wire                when_Pipeline_l124_52;
  reg        [33:0]   execute_to_memory_MUL_HL;
  wire                when_Pipeline_l124_53;
  reg        [33:0]   execute_to_memory_MUL_HH;
  wire                when_Pipeline_l124_54;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  wire                when_Pipeline_l124_55;
  reg                 execute_to_memory_BRANCH_DO;
  wire                when_Pipeline_l124_56;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  wire                when_Pipeline_l124_57;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  wire                when_Pipeline_l124_58;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  reg        [2:0]    IBusSimplePlugin_injector_port_state;
  wire                when_Fetcher_l373;
  wire                when_Fetcher_l391;
  wire                when_Fetcher_l411;
  wire                when_CsrPlugin_l1669;
  reg                 execute_CsrPlugin_csr_3857;
  wire                when_CsrPlugin_l1669_1;
  reg                 execute_CsrPlugin_csr_3858;
  wire                when_CsrPlugin_l1669_2;
  reg                 execute_CsrPlugin_csr_3859;
  wire                when_CsrPlugin_l1669_3;
  reg                 execute_CsrPlugin_csr_3860;
  wire                when_CsrPlugin_l1669_4;
  reg                 execute_CsrPlugin_csr_769;
  wire                when_CsrPlugin_l1669_5;
  reg                 execute_CsrPlugin_csr_768;
  wire                when_CsrPlugin_l1669_6;
  reg                 execute_CsrPlugin_csr_836;
  wire                when_CsrPlugin_l1669_7;
  reg                 execute_CsrPlugin_csr_772;
  wire                when_CsrPlugin_l1669_8;
  reg                 execute_CsrPlugin_csr_773;
  wire                when_CsrPlugin_l1669_9;
  reg                 execute_CsrPlugin_csr_833;
  wire                when_CsrPlugin_l1669_10;
  reg                 execute_CsrPlugin_csr_832;
  wire                when_CsrPlugin_l1669_11;
  reg                 execute_CsrPlugin_csr_834;
  wire                when_CsrPlugin_l1669_12;
  reg                 execute_CsrPlugin_csr_835;
  wire                when_CsrPlugin_l1669_13;
  reg                 execute_CsrPlugin_csr_2816;
  wire                when_CsrPlugin_l1669_14;
  reg                 execute_CsrPlugin_csr_2944;
  wire                when_CsrPlugin_l1669_15;
  reg                 execute_CsrPlugin_csr_2818;
  wire                when_CsrPlugin_l1669_16;
  reg                 execute_CsrPlugin_csr_2946;
  wire                when_CsrPlugin_l1669_17;
  reg                 execute_CsrPlugin_csr_3072;
  wire                when_CsrPlugin_l1669_18;
  reg                 execute_CsrPlugin_csr_3200;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit;
  wire       [1:0]    switch_CsrPlugin_l1031;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_4;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_5;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_6;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_7;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_8;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_9;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_10;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_11;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_12;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_13;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_14;
  wire                when_CsrPlugin_l1702;
  wire       [11:0]   _zz_when_CsrPlugin_l1709;
  wire                when_CsrPlugin_l1709;
  reg                 when_CsrPlugin_l1719;
  wire                when_CsrPlugin_l1717;
  wire                when_CsrPlugin_l1725;
  `ifndef SYNTHESIS
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_1_string;
  reg [47:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [47:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [47:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [47:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_decode_ENV_CTRL_string;
  reg [47:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [47:0] _zz_decode_to_execute_ENV_CTRL_1_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_1_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_1_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_1_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [47:0] memory_ENV_CTRL_string;
  reg [47:0] _zz_memory_ENV_CTRL_string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_execute_ENV_CTRL_string;
  reg [47:0] writeBack_ENV_CTRL_string;
  reg [47:0] _zz_writeBack_ENV_CTRL_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_execute_SRC2_CTRL_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_execute_SRC1_CTRL_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [47:0] _zz_decode_ENV_CTRL_1_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [47:0] _zz_decode_ENV_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_2_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [47:0] execute_to_memory_ENV_CTRL_string;
  reg [47:0] memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  (* ram_style = "distributed" *) reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW_1) + $signed(_zz_memory_MUL_LOW_4));
  assign _zz_memory_MUL_LOW_1 = ($signed(52'h0000000000000) + $signed(_zz_memory_MUL_LOW_2));
  assign _zz_memory_MUL_LOW_3 = {1'b0,memory_MUL_LL};
  assign _zz_memory_MUL_LOW_2 = {{19{_zz_memory_MUL_LOW_3[32]}}, _zz_memory_MUL_LOW_3};
  assign _zz_memory_MUL_LOW_5 = ({16'd0,memory_MUL_LH} <<< 5'd16);
  assign _zz_memory_MUL_LOW_4 = {{2{_zz_memory_MUL_LOW_5[49]}}, _zz_memory_MUL_LOW_5};
  assign _zz_memory_MUL_LOW_7 = ({16'd0,memory_MUL_HL} <<< 5'd16);
  assign _zz_memory_MUL_LOW_6 = {{2{_zz_memory_MUL_LOW_7[49]}}, _zz_memory_MUL_LOW_7};
  assign _zz_decode_FORMAL_PC_NEXT_1 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_decode_FORMAL_PC_NEXT = {29'd0, _zz_decode_FORMAL_PC_NEXT_1};
  assign _zz_execute_SHIFT_RIGHT_1 = ($signed(_zz_execute_SHIFT_RIGHT_2) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT_1[31 : 0];
  assign _zz_execute_SHIFT_RIGHT_2 = {((execute_SHIFT_CTRL == ShiftCtrlEnum_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_1 = (_zz_IBusSimplePlugin_jump_pcLoad_payload & (~ _zz_IBusSimplePlugin_jump_pcLoad_payload_2));
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_2 = (_zz_IBusSimplePlugin_jump_pcLoad_payload - 2'b01);
  assign _zz_IBusSimplePlugin_fetchPc_pc_1 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_IBusSimplePlugin_fetchPc_pc = {29'd0, _zz_IBusSimplePlugin_fetchPc_pc_1};
  assign _zz_IBusSimplePlugin_decodePc_pcPlus_1 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_IBusSimplePlugin_decodePc_pcPlus = {29'd0, _zz_IBusSimplePlugin_decodePc_pcPlus_1};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_30 = {{_zz_IBusSimplePlugin_decompressor_decompressed_10,_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2]},12'h000};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_37 = {{{4'b0000,_zz_IBusSimplePlugin_decompressor_decompressed[8 : 7]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 9]},2'b00};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_38 = {{{4'b0000,_zz_IBusSimplePlugin_decompressor_decompressed[8 : 7]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 9]},2'b00};
  assign _zz_IBusSimplePlugin_pending_next = (IBusSimplePlugin_pending_value + _zz_IBusSimplePlugin_pending_next_1);
  assign _zz_IBusSimplePlugin_pending_next_2 = IBusSimplePlugin_pending_inc;
  assign _zz_IBusSimplePlugin_pending_next_1 = {2'd0, _zz_IBusSimplePlugin_pending_next_2};
  assign _zz_IBusSimplePlugin_pending_next_4 = IBusSimplePlugin_pending_dec;
  assign _zz_IBusSimplePlugin_pending_next_3 = {2'd0, _zz_IBusSimplePlugin_pending_next_4};
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter = {2'd0, _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1};
  assign _zz__zz_execute_REGFILE_WRITE_DATA = execute_SRC_LESS;
  assign _zz__zz_execute_SRC1 = (execute_IS_RVC ? 3'b010 : 3'b100);
  assign _zz__zz_execute_SRC1_1 = execute_INSTRUCTION[19 : 15];
  assign _zz__zz_execute_SRC2_2 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_execute_SrcPlugin_addSub = ($signed(_zz_execute_SrcPlugin_addSub_1) + $signed(_zz_execute_SrcPlugin_addSub_4));
  assign _zz_execute_SrcPlugin_addSub_1 = ($signed(_zz_execute_SrcPlugin_addSub_2) + $signed(_zz_execute_SrcPlugin_addSub_3));
  assign _zz_execute_SrcPlugin_addSub_2 = execute_SRC1;
  assign _zz_execute_SrcPlugin_addSub_3 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_execute_SrcPlugin_addSub_4 = (execute_SRC_USE_SUB_LESS ? 32'h00000001 : 32'h00000000);
  assign _zz_writeBack_MulPlugin_result = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_writeBack_MulPlugin_result_1 = ({32'd0,writeBack_MUL_HH} <<< 6'd32);
  assign _zz__zz_decode_RS2_2 = writeBack_MUL_LOW[31 : 0];
  assign _zz__zz_decode_RS2_2_1 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_memory_DivPlugin_div_counter_valueNext_1 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_memory_DivPlugin_div_counter_valueNext = {5'd0, _zz_memory_DivPlugin_div_counter_valueNext_1};
  assign _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator = {1'd0, memory_DivPlugin_rs2};
  assign _zz_memory_DivPlugin_div_stage_0_outRemainder = memory_DivPlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_memory_DivPlugin_div_stage_0_outRemainder_1 = memory_DivPlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_memory_DivPlugin_div_stage_0_outNumerator = {_zz_memory_DivPlugin_div_stage_0_remainderShifted,(! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_memory_DivPlugin_div_result_1 = _zz_memory_DivPlugin_div_result_2;
  assign _zz_memory_DivPlugin_div_result_2 = _zz_memory_DivPlugin_div_result_3;
  assign _zz_memory_DivPlugin_div_result_3 = ({memory_DivPlugin_div_needRevert,(memory_DivPlugin_div_needRevert ? (~ _zz_memory_DivPlugin_div_result) : _zz_memory_DivPlugin_div_result)} + _zz_memory_DivPlugin_div_result_4);
  assign _zz_memory_DivPlugin_div_result_5 = memory_DivPlugin_div_needRevert;
  assign _zz_memory_DivPlugin_div_result_4 = {32'd0, _zz_memory_DivPlugin_div_result_5};
  assign _zz_memory_DivPlugin_rs1_3 = _zz_memory_DivPlugin_rs1;
  assign _zz_memory_DivPlugin_rs1_2 = {32'd0, _zz_memory_DivPlugin_rs1_3};
  assign _zz_memory_DivPlugin_rs2_2 = _zz_memory_DivPlugin_rs2;
  assign _zz_memory_DivPlugin_rs2_1 = {31'd0, _zz_memory_DivPlugin_rs2_2};
  assign _zz__zz_execute_BranchPlugin_branch_src2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_decode_LEGAL_INSTRUCTION = 32'h0000107f;
  assign _zz_decode_LEGAL_INSTRUCTION_1 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_decode_LEGAL_INSTRUCTION_2 = 32'h00002073;
  assign _zz_decode_LEGAL_INSTRUCTION_3 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_decode_LEGAL_INSTRUCTION_4 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_decode_LEGAL_INSTRUCTION_5 = {((decode_INSTRUCTION & 32'h0000107f) == 32'h00000013),{((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_6) == 32'h00000003),{(_zz_decode_LEGAL_INSTRUCTION_7 == _zz_decode_LEGAL_INSTRUCTION_8),{_zz_decode_LEGAL_INSTRUCTION_9,{_zz_decode_LEGAL_INSTRUCTION_10,_zz_decode_LEGAL_INSTRUCTION_11}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_6 = 32'h0000207f;
  assign _zz_decode_LEGAL_INSTRUCTION_7 = (decode_INSTRUCTION & 32'h0000505f);
  assign _zz_decode_LEGAL_INSTRUCTION_8 = 32'h00000003;
  assign _zz_decode_LEGAL_INSTRUCTION_9 = ((decode_INSTRUCTION & 32'h0000707b) == 32'h00000063);
  assign _zz_decode_LEGAL_INSTRUCTION_10 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_decode_LEGAL_INSTRUCTION_11 = {((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033),{((decode_INSTRUCTION & 32'hbe00705f) == 32'h00005013),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_12) == 32'h00001013),{(_zz_decode_LEGAL_INSTRUCTION_13 == _zz_decode_LEGAL_INSTRUCTION_14),{_zz_decode_LEGAL_INSTRUCTION_15,{_zz_decode_LEGAL_INSTRUCTION_16,_zz_decode_LEGAL_INSTRUCTION_17}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_12 = 32'hfe00305f;
  assign _zz_decode_LEGAL_INSTRUCTION_13 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_decode_LEGAL_INSTRUCTION_14 = 32'h00000033;
  assign _zz_decode_LEGAL_INSTRUCTION_15 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_decode_LEGAL_INSTRUCTION_16 = ((decode_INSTRUCTION & 32'hffefffff) == 32'h00000073);
  assign _zz_decode_LEGAL_INSTRUCTION_17 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h10500073);
  assign _zz_IBusSimplePlugin_decompressor_decompressed_27 = {_zz_IBusSimplePlugin_decompressor_decompressed_12,_zz_IBusSimplePlugin_decompressor_decompressed[4 : 3]};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_28 = _zz_IBusSimplePlugin_decompressor_decompressed[5];
  assign _zz_IBusSimplePlugin_decompressor_decompressed_29 = _zz_IBusSimplePlugin_decompressor_decompressed[2];
  assign _zz_IBusSimplePlugin_decompressor_decompressed_31 = (_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] == 2'b01);
  assign _zz_IBusSimplePlugin_decompressor_decompressed_32 = ((_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] == 2'b11) && (_zz_IBusSimplePlugin_decompressor_decompressed[6 : 5] == 2'b00));
  assign _zz_IBusSimplePlugin_decompressor_decompressed_33 = 7'h00;
  assign _zz_IBusSimplePlugin_decompressor_decompressed_34 = _zz_IBusSimplePlugin_decompressor_decompressed[6 : 2];
  assign _zz_IBusSimplePlugin_decompressor_decompressed_35 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  assign _zz_IBusSimplePlugin_decompressor_decompressed_36 = _zz_IBusSimplePlugin_decompressor_decompressed[11 : 7];
  assign _zz__zz_decode_IS_CSR = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz__zz_decode_IS_CSR_1 = 32'h00000004;
  assign _zz__zz_decode_IS_CSR_2 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_IS_CSR_3 = 32'h00000040;
  assign _zz__zz_decode_IS_CSR_4 = _zz_decode_IS_CSR_8;
  assign _zz__zz_decode_IS_CSR_5 = (|{((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_6) == 32'h10000050),((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_7) == 32'h00000050)});
  assign _zz__zz_decode_IS_CSR_8 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_9) == 32'h00000050));
  assign _zz__zz_decode_IS_CSR_10 = {(|{_zz__zz_decode_IS_CSR_11,_zz__zz_decode_IS_CSR_12}),{(|_zz_decode_IS_CSR_7),{(|_zz__zz_decode_IS_CSR_13),{_zz__zz_decode_IS_CSR_14,{_zz__zz_decode_IS_CSR_15,_zz__zz_decode_IS_CSR_17}}}}};
  assign _zz__zz_decode_IS_CSR_6 = 32'h10203050;
  assign _zz__zz_decode_IS_CSR_7 = 32'h10103050;
  assign _zz__zz_decode_IS_CSR_9 = 32'h00103050;
  assign _zz__zz_decode_IS_CSR_11 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz__zz_decode_IS_CSR_12 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz__zz_decode_IS_CSR_13 = _zz_decode_IS_CSR_7;
  assign _zz__zz_decode_IS_CSR_14 = (|((decode_INSTRUCTION & 32'h02004064) == 32'h02004020));
  assign _zz__zz_decode_IS_CSR_15 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_16) == 32'h02000030));
  assign _zz__zz_decode_IS_CSR_17 = {(|(_zz__zz_decode_IS_CSR_18 == _zz__zz_decode_IS_CSR_19)),{(|{_zz__zz_decode_IS_CSR_20,_zz__zz_decode_IS_CSR_21}),{(|_zz__zz_decode_IS_CSR_22),{_zz__zz_decode_IS_CSR_23,{_zz__zz_decode_IS_CSR_25,_zz__zz_decode_IS_CSR_28}}}}};
  assign _zz__zz_decode_IS_CSR_16 = 32'h02004074;
  assign _zz__zz_decode_IS_CSR_18 = (decode_INSTRUCTION & 32'h02007054);
  assign _zz__zz_decode_IS_CSR_19 = 32'h00005010;
  assign _zz__zz_decode_IS_CSR_20 = ((decode_INSTRUCTION & 32'h40003054) == 32'h40001010);
  assign _zz__zz_decode_IS_CSR_21 = ((decode_INSTRUCTION & 32'h02007054) == 32'h00001010);
  assign _zz__zz_decode_IS_CSR_22 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000024);
  assign _zz__zz_decode_IS_CSR_23 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_24) == 32'h00001000));
  assign _zz__zz_decode_IS_CSR_25 = (|(_zz__zz_decode_IS_CSR_26 == _zz__zz_decode_IS_CSR_27));
  assign _zz__zz_decode_IS_CSR_28 = {(|{_zz__zz_decode_IS_CSR_29,_zz__zz_decode_IS_CSR_30}),{(|_zz__zz_decode_IS_CSR_31),{_zz__zz_decode_IS_CSR_32,{_zz__zz_decode_IS_CSR_33,_zz__zz_decode_IS_CSR_36}}}};
  assign _zz__zz_decode_IS_CSR_24 = 32'h00001000;
  assign _zz__zz_decode_IS_CSR_26 = (decode_INSTRUCTION & 32'h00003000);
  assign _zz__zz_decode_IS_CSR_27 = 32'h00002000;
  assign _zz__zz_decode_IS_CSR_29 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz__zz_decode_IS_CSR_30 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz__zz_decode_IS_CSR_31 = ((decode_INSTRUCTION & 32'h00004004) == 32'h00004000);
  assign _zz__zz_decode_IS_CSR_32 = (|_zz_decode_IS_CSR_2);
  assign _zz__zz_decode_IS_CSR_33 = (|{_zz__zz_decode_IS_CSR_34,_zz__zz_decode_IS_CSR_35});
  assign _zz__zz_decode_IS_CSR_36 = {(|{_zz__zz_decode_IS_CSR_37,_zz__zz_decode_IS_CSR_39}),{(|_zz__zz_decode_IS_CSR_48),{_zz__zz_decode_IS_CSR_50,{_zz__zz_decode_IS_CSR_61,_zz__zz_decode_IS_CSR_66}}}};
  assign _zz__zz_decode_IS_CSR_34 = ((decode_INSTRUCTION & 32'h00000034) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_35 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_37 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_38) == 32'h00002040);
  assign _zz__zz_decode_IS_CSR_39 = {(_zz__zz_decode_IS_CSR_40 == _zz__zz_decode_IS_CSR_41),{_zz__zz_decode_IS_CSR_42,{_zz__zz_decode_IS_CSR_44,_zz__zz_decode_IS_CSR_47}}};
  assign _zz__zz_decode_IS_CSR_48 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_49) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_50 = (|{_zz__zz_decode_IS_CSR_51,{_zz__zz_decode_IS_CSR_53,_zz__zz_decode_IS_CSR_54}});
  assign _zz__zz_decode_IS_CSR_61 = (|{_zz__zz_decode_IS_CSR_62,_zz__zz_decode_IS_CSR_63});
  assign _zz__zz_decode_IS_CSR_66 = {(|_zz__zz_decode_IS_CSR_67),{_zz__zz_decode_IS_CSR_80,{_zz__zz_decode_IS_CSR_85,_zz__zz_decode_IS_CSR_89}}};
  assign _zz__zz_decode_IS_CSR_38 = 32'h00002040;
  assign _zz__zz_decode_IS_CSR_40 = (decode_INSTRUCTION & 32'h00001040);
  assign _zz__zz_decode_IS_CSR_41 = 32'h00001040;
  assign _zz__zz_decode_IS_CSR_42 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_43) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_44 = (_zz__zz_decode_IS_CSR_45 == _zz__zz_decode_IS_CSR_46);
  assign _zz__zz_decode_IS_CSR_47 = _zz_decode_IS_CSR_3;
  assign _zz__zz_decode_IS_CSR_49 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_51 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_52) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_53 = _zz_decode_IS_CSR_4;
  assign _zz__zz_decode_IS_CSR_54 = {_zz__zz_decode_IS_CSR_55,{_zz__zz_decode_IS_CSR_57,_zz__zz_decode_IS_CSR_58}};
  assign _zz__zz_decode_IS_CSR_62 = _zz_decode_IS_CSR_4;
  assign _zz__zz_decode_IS_CSR_63 = {_zz_decode_IS_CSR_6,_zz__zz_decode_IS_CSR_64};
  assign _zz__zz_decode_IS_CSR_67 = {_zz_decode_IS_CSR_5,{_zz__zz_decode_IS_CSR_68,_zz__zz_decode_IS_CSR_71}};
  assign _zz__zz_decode_IS_CSR_80 = (|{_zz__zz_decode_IS_CSR_81,_zz__zz_decode_IS_CSR_82});
  assign _zz__zz_decode_IS_CSR_85 = (|_zz__zz_decode_IS_CSR_86);
  assign _zz__zz_decode_IS_CSR_89 = {_zz__zz_decode_IS_CSR_90,{_zz__zz_decode_IS_CSR_98,_zz__zz_decode_IS_CSR_102}};
  assign _zz__zz_decode_IS_CSR_43 = 32'h00000050;
  assign _zz__zz_decode_IS_CSR_45 = (decode_INSTRUCTION & 32'h00400040);
  assign _zz__zz_decode_IS_CSR_46 = 32'h00000040;
  assign _zz__zz_decode_IS_CSR_52 = 32'h00000040;
  assign _zz__zz_decode_IS_CSR_55 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_56) == 32'h00004020);
  assign _zz__zz_decode_IS_CSR_57 = _zz_decode_IS_CSR_6;
  assign _zz__zz_decode_IS_CSR_58 = (_zz__zz_decode_IS_CSR_59 == _zz__zz_decode_IS_CSR_60);
  assign _zz__zz_decode_IS_CSR_64 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_65) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_68 = (_zz__zz_decode_IS_CSR_69 == _zz__zz_decode_IS_CSR_70);
  assign _zz__zz_decode_IS_CSR_71 = {_zz__zz_decode_IS_CSR_72,{_zz__zz_decode_IS_CSR_74,_zz__zz_decode_IS_CSR_77}};
  assign _zz__zz_decode_IS_CSR_81 = _zz_decode_IS_CSR_4;
  assign _zz__zz_decode_IS_CSR_82 = (_zz__zz_decode_IS_CSR_83 == _zz__zz_decode_IS_CSR_84);
  assign _zz__zz_decode_IS_CSR_86 = {_zz_decode_IS_CSR_4,_zz__zz_decode_IS_CSR_87};
  assign _zz__zz_decode_IS_CSR_90 = (|{_zz__zz_decode_IS_CSR_91,_zz__zz_decode_IS_CSR_94});
  assign _zz__zz_decode_IS_CSR_98 = (|_zz__zz_decode_IS_CSR_99);
  assign _zz__zz_decode_IS_CSR_102 = {_zz__zz_decode_IS_CSR_103,{_zz__zz_decode_IS_CSR_111,_zz__zz_decode_IS_CSR_115}};
  assign _zz__zz_decode_IS_CSR_56 = 32'h00004020;
  assign _zz__zz_decode_IS_CSR_59 = (decode_INSTRUCTION & 32'h02000020);
  assign _zz__zz_decode_IS_CSR_60 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_65 = 32'h02000060;
  assign _zz__zz_decode_IS_CSR_69 = (decode_INSTRUCTION & 32'h00001010);
  assign _zz__zz_decode_IS_CSR_70 = 32'h00001010;
  assign _zz__zz_decode_IS_CSR_72 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_73) == 32'h00002010);
  assign _zz__zz_decode_IS_CSR_74 = (_zz__zz_decode_IS_CSR_75 == _zz__zz_decode_IS_CSR_76);
  assign _zz__zz_decode_IS_CSR_77 = {_zz__zz_decode_IS_CSR_78,_zz__zz_decode_IS_CSR_79};
  assign _zz__zz_decode_IS_CSR_83 = (decode_INSTRUCTION & 32'h00000070);
  assign _zz__zz_decode_IS_CSR_84 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_87 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_88) == 32'h00000000);
  assign _zz__zz_decode_IS_CSR_91 = (_zz__zz_decode_IS_CSR_92 == _zz__zz_decode_IS_CSR_93);
  assign _zz__zz_decode_IS_CSR_94 = {_zz_decode_IS_CSR_3,{_zz__zz_decode_IS_CSR_95,_zz__zz_decode_IS_CSR_96}};
  assign _zz__zz_decode_IS_CSR_99 = (_zz__zz_decode_IS_CSR_100 == _zz__zz_decode_IS_CSR_101);
  assign _zz__zz_decode_IS_CSR_103 = (|{_zz__zz_decode_IS_CSR_104,_zz__zz_decode_IS_CSR_106});
  assign _zz__zz_decode_IS_CSR_111 = (|_zz__zz_decode_IS_CSR_112);
  assign _zz__zz_decode_IS_CSR_115 = (|_zz__zz_decode_IS_CSR_116);
  assign _zz__zz_decode_IS_CSR_73 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_75 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz__zz_decode_IS_CSR_76 = 32'h00000010;
  assign _zz__zz_decode_IS_CSR_78 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz__zz_decode_IS_CSR_79 = ((decode_INSTRUCTION & 32'h00000028) == 32'h00000000);
  assign _zz__zz_decode_IS_CSR_88 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_92 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz__zz_decode_IS_CSR_93 = 32'h00000000;
  assign _zz__zz_decode_IS_CSR_95 = _zz_decode_IS_CSR_2;
  assign _zz__zz_decode_IS_CSR_96 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_97) == 32'h00001000);
  assign _zz__zz_decode_IS_CSR_100 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_IS_CSR_101 = 32'h00000000;
  assign _zz__zz_decode_IS_CSR_104 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_105) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_106 = {(_zz__zz_decode_IS_CSR_107 == _zz__zz_decode_IS_CSR_108),(_zz__zz_decode_IS_CSR_109 == _zz__zz_decode_IS_CSR_110)};
  assign _zz__zz_decode_IS_CSR_112 = {(_zz__zz_decode_IS_CSR_113 == _zz__zz_decode_IS_CSR_114),_zz_decode_IS_CSR_1};
  assign _zz__zz_decode_IS_CSR_116 = {(_zz__zz_decode_IS_CSR_117 == _zz__zz_decode_IS_CSR_118),_zz_decode_IS_CSR_1};
  assign _zz__zz_decode_IS_CSR_97 = 32'h00005004;
  assign _zz__zz_decode_IS_CSR_105 = 32'h00000044;
  assign _zz__zz_decode_IS_CSR_107 = (decode_INSTRUCTION & 32'h00002014);
  assign _zz__zz_decode_IS_CSR_108 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_109 = (decode_INSTRUCTION & 32'h40000034);
  assign _zz__zz_decode_IS_CSR_110 = 32'h40000030;
  assign _zz__zz_decode_IS_CSR_113 = (decode_INSTRUCTION & 32'h00000014);
  assign _zz__zz_decode_IS_CSR_114 = 32'h00000004;
  assign _zz__zz_decode_IS_CSR_117 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz__zz_decode_IS_CSR_118 = 32'h00000004;
  assign _zz_CsrPlugin_csrMapping_readDataInit_15 = 32'h00000000;
  assign _zz_CsrPlugin_csrMapping_readDataInit_16 = 32'h00000000;
  assign _zz_CsrPlugin_csrMapping_readDataInit_17 = 32'h00000000;
  assign _zz_CsrPlugin_csrMapping_readDataInit_18 = 32'h00000000;
  assign _zz_RegFilePlugin_regFile_port0 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
  assign _zz_RegFilePlugin_regFile_port1 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
  always @(posedge _zz_7) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency_2 IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid         (iBus_rsp_toStream_valid                                       ), //i
    .io_push_ready         (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready            ), //o
    .io_push_payload_error (iBus_rsp_toStream_payload_error                               ), //i
    .io_push_payload_inst  (iBus_rsp_toStream_payload_inst[31:0]                          ), //i
    .io_pop_valid          (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid             ), //o
    .io_pop_ready          (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready             ), //i
    .io_pop_payload_error  (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error     ), //o
    .io_pop_payload_inst   (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]), //o
    .io_flush              (IBusSimplePlugin_rspJoin_rspBuffer_c_io_flush                 ), //i
    .io_occupancy          (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy[1:0]        ), //o
    .io_availability       (IBusSimplePlugin_rspJoin_rspBuffer_c_io_availability[1:0]     ), //o
    ._zz_1                 (_zz_7                                                         ), //i
    ._zz_2                 (_zz_8                                                         )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_memory_to_writeBack_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_memory_to_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_to_writeBack_ENV_CTRL_string = "EBREAK";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_memory_to_writeBack_ENV_CTRL_1_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_memory_to_writeBack_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_to_writeBack_ENV_CTRL_1_string = "EBREAK";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_execute_to_memory_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_execute_to_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_to_memory_ENV_CTRL_string = "EBREAK";
      default : _zz_execute_to_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_execute_to_memory_ENV_CTRL_1_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_execute_to_memory_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_to_memory_ENV_CTRL_1_string = "EBREAK";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : decode_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : decode_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : decode_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : decode_ENV_CTRL_string = "EBREAK";
      default : decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_decode_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_decode_to_execute_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_decode_to_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : _zz_decode_to_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_decode_to_execute_ENV_CTRL_1_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_decode_to_execute_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_to_execute_ENV_CTRL_1_string = "EBREAK";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : memory_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : memory_ENV_CTRL_string = "EBREAK";
      default : memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_memory_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_memory_ENV_CTRL_string = "EBREAK";
      default : _zz_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : execute_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : execute_ENV_CTRL_string = "EBREAK";
      default : execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_execute_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_execute_ENV_CTRL_string = "EBREAK";
      default : _zz_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : writeBack_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : writeBack_ENV_CTRL_string = "EBREAK";
      default : writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_writeBack_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_writeBack_ENV_CTRL_string = "EBREAK";
      default : _zz_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_execute_SRC2_CTRL_string = "PC ";
      default : _zz_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_1_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_1_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_decode_ENV_CTRL_1_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_1_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_1_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_2_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_2_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_2_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_2_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_2)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_2_string = "NONE  ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_2_string = "XRET  ";
      EnvCtrlEnum_WFI : _zz_decode_ENV_CTRL_2_string = "WFI   ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_2_string = "ECALL ";
      EnvCtrlEnum_EBREAK : _zz_decode_ENV_CTRL_2_string = "EBREAK";
      default : _zz_decode_ENV_CTRL_2_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_2)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_2_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_2_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_2_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_2_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_to_execute_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : decode_to_execute_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : decode_to_execute_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : decode_to_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_to_memory_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : execute_to_memory_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : execute_to_memory_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : execute_to_memory_ENV_CTRL_string = "EBREAK";
      default : execute_to_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE  ";
      EnvCtrlEnum_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET  ";
      EnvCtrlEnum_WFI : memory_to_writeBack_ENV_CTRL_string = "WFI   ";
      EnvCtrlEnum_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL ";
      EnvCtrlEnum_EBREAK : memory_to_writeBack_ENV_CTRL_string = "EBREAK";
      default : memory_to_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW) + $signed(_zz_memory_MUL_LOW_6));
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = _zz_execute_BRANCH_DO_1;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_execute_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0)) && DebugPlugin_allowEBreak);
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h00)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h00))));
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL;
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_IS_CSR[25];
  assign decode_IS_RS2_SIGNED = _zz_decode_IS_CSR[24];
  assign decode_IS_RS1_SIGNED = _zz_decode_IS_CSR[23];
  assign decode_IS_DIV = _zz_decode_IS_CSR[22];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_decode_IS_CSR[21];
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_IS_CSR[15];
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign decode_MEMORY_STORE = _zz_decode_IS_CSR[10];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_IS_CSR[9];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_IS_CSR[8];
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_to_execute_SRC2_CTRL = _zz_decode_to_execute_SRC2_CTRL_1;
  assign decode_MEMORY_ENABLE = _zz_decode_IS_CSR[3];
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign _zz_decode_to_execute_SRC1_CTRL = _zz_decode_to_execute_SRC1_CTRL_1;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_decode_FORMAL_PC_NEXT);
  assign memory_PC = execute_to_memory_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_decode_IS_CSR[29];
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_RS1 = decode_to_execute_RS1;
  assign decode_RS2_USE = _zz_decode_IS_CSR[12];
  assign decode_RS1_USE = _zz_decode_IS_CSR[4];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  always @(*) begin
    _zz_decode_RS2 = memory_REGFILE_WRITE_DATA;
    if(when_MulDivIterativePlugin_l128) begin
      _zz_decode_RS2 = memory_DivPlugin_div_result;
    end
  end

  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr1Match) begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l51) begin
          decode_RS2 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l51_1) begin
          decode_RS2 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
  end

  always @(*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr0Match) begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l48) begin
          decode_RS1 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l48_1) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
  end

  assign execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT;
  always @(*) begin
    _zz_decode_RS2_1 = execute_REGFILE_WRITE_DATA;
    if(execute_arbitration_isValid) begin
      case(execute_SHIFT_CTRL)
        ShiftCtrlEnum_SLL_1 : begin
          _zz_decode_RS2_1 = _zz_decode_RS2_3;
        end
        ShiftCtrlEnum_SRL_1, ShiftCtrlEnum_SRA_1 : begin
          _zz_decode_RS2_1 = execute_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(when_CsrPlugin_l1587) begin
      _zz_decode_RS2_1 = CsrPlugin_csrMapping_readDataSignal;
    end
  end

  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_execute_to_memory_PC = execute_PC;
  assign execute_SRC2_CTRL = _zz_execute_SRC2_CTRL;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_SRC1_CTRL = _zz_execute_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_IS_CSR[2];
  assign decode_SRC_ADD_ZERO = _zz_decode_IS_CSR[18];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_SRC2 = _zz_execute_SRC2_4;
  assign execute_SRC1 = _zz_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_IS_CSR[7];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = (|{((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION) == 32'h00001073),{(_zz_decode_LEGAL_INSTRUCTION_1 == _zz_decode_LEGAL_INSTRUCTION_2),{_zz_decode_LEGAL_INSTRUCTION_3,{_zz_decode_LEGAL_INSTRUCTION_4,_zz_decode_LEGAL_INSTRUCTION_5}}}}}});
  always @(*) begin
    _zz_decode_RS2_2 = writeBack_REGFILE_WRITE_DATA;
    if(when_DBusSimplePlugin_l566) begin
      _zz_decode_RS2_2 = writeBack_DBusSimplePlugin_rspFormated;
    end
    if(when_MulPlugin_l147) begin
      case(switch_MulPlugin_l148)
        2'b00 : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2;
        end
        default : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2_1;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  always @(*) begin
    _zz_memory_to_writeBack_FORMAL_PC_NEXT = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_memory_to_writeBack_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_decodePc_pcReg;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign decode_IS_RVC = IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @(*) begin
    decode_arbitration_haltItself = 1'b0;
    case(IBusSimplePlugin_injector_port_state)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1527) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decodeExceptionPort_valid) begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @(*) begin
    decode_arbitration_flushNext = 1'b0;
    if(decodeExceptionPort_valid) begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l436) begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(when_CsrPlugin_l1519) begin
      if(when_CsrPlugin_l1521) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(when_CsrPlugin_l1591) begin
      if(execute_CsrPlugin_blockedBySideEffects) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(when_DebugPlugin_l308) begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(CsrPlugin_selfException_valid) begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_flushIt = 1'b0;
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_selfException_valid) begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
    if(_zz_6) begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_6) begin
      execute_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l490) begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l129) begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed) begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @(*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(when_CsrPlugin_l1390) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @(*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l1272) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1390) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l324) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @(*) begin
    IBusSimplePlugin_forceNoDecodeCond = 1'b0;
    if(_zz_6) begin
      IBusSimplePlugin_forceNoDecodeCond = 1'b1;
    end
  end

  always @(*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(when_Fetcher_l242) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_csrMapping_allowCsrSignal = 1'b0;
    if(when_CsrPlugin_l1702) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
    if(when_CsrPlugin_l1709) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
  end

  assign CsrPlugin_csrMapping_doForceFailCsr = 1'b0;
  assign CsrPlugin_csrMapping_readDataSignal = CsrPlugin_csrMapping_readDataInit;
  always @(*) begin
    CsrPlugin_inWfi = 1'b0;
    if(when_CsrPlugin_l1519) begin
      CsrPlugin_inWfi = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt) begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(when_CsrPlugin_l1390) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrPlugin_l1390) begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(when_CsrPlugin_l1456) begin
      case(switch_CsrPlugin_l1460)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode) begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if(when_DebugPlugin_l344) begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode) begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowEbreakException = 1'b1;
    if(DebugPlugin_allowEBreak) begin
      CsrPlugin_allowEbreakException = 1'b0;
    end
  end

  assign CsrPlugin_xretAwayFromMachine = 1'b0;
  always @(*) begin
    BranchPlugin_inDebugNoFetchFlag = 1'b0;
    if(DebugPlugin_godmode) begin
      BranchPlugin_inDebugNoFetchFlag = 1'b1;
    end
  end

  assign IBusSimplePlugin_externalFlush = (|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}});
  assign IBusSimplePlugin_jump_pcLoad_valid = (|{BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid});
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload = {BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_IBusSimplePlugin_jump_pcLoad_payload_1[0] ? CsrPlugin_jumpInterface_payload : BranchPlugin_jumpInterface_payload);
  always @(*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_fire = (IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready);
  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  assign IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
  assign when_Fetcher_l133 = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate);
  assign when_Fetcher_l133_1 = ((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready);
  always @(*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_IBusSimplePlugin_fetchPc_pc);
    if(IBusSimplePlugin_fetchPc_inc) begin
      IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
  end

  always @(*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l160 = (IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate));
  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  always @(*) begin
    IBusSimplePlugin_decodePc_flushed = 1'b0;
    if(when_Fetcher_l194) begin
      IBusSimplePlugin_decodePc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_decodePc_pcPlus = (IBusSimplePlugin_decodePc_pcReg + _zz_IBusSimplePlugin_decodePc_pcPlus);
  always @(*) begin
    IBusSimplePlugin_decodePc_injectedDecode = 1'b0;
    if(when_Fetcher_l373) begin
      IBusSimplePlugin_decodePc_injectedDecode = 1'b1;
    end
  end

  assign when_Fetcher_l182 = (decode_arbitration_isFiring && (! IBusSimplePlugin_decodePc_injectedDecode));
  assign when_Fetcher_l194 = (IBusSimplePlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt));
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
    if(when_IBusSimplePlugin_l317) begin
      IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b1;
    end
    if(when_IBusSimplePlugin_l318) begin
      IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_halt = 1'b0;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready = (! IBusSimplePlugin_iBusRsp_stages_2_halt);
  assign IBusSimplePlugin_iBusRsp_stages_2_input_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_valid = (IBusSimplePlugin_iBusRsp_stages_2_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_payload = IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = ((1'b0 && (! IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_valid)) || IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_valid = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_payload = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_ready = IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid)) || IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid = _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload = _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_valid = IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready = IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_payload = IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign when_Fetcher_l242 = (IBusSimplePlugin_iBusRsp_stages_1_input_valid || IBusSimplePlugin_iBusRsp_stages_2_input_valid);
  assign IBusSimplePlugin_decompressor_input_valid = (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_iBusRsp_redoFetch));
  assign IBusSimplePlugin_decompressor_input_payload_pc = IBusSimplePlugin_iBusRsp_output_payload_pc;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_error = IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_inst = IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  assign IBusSimplePlugin_decompressor_input_payload_isRvc = IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  assign IBusSimplePlugin_iBusRsp_output_ready = IBusSimplePlugin_decompressor_input_ready;
  assign IBusSimplePlugin_decompressor_flushNext = 1'b0;
  assign IBusSimplePlugin_decompressor_consumeCurrent = 1'b0;
  assign IBusSimplePlugin_decompressor_isInputLowRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[1 : 0] != 2'b11);
  assign IBusSimplePlugin_decompressor_isInputHighRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[17 : 16] != 2'b11);
  assign IBusSimplePlugin_decompressor_throw2Bytes = (IBusSimplePlugin_decompressor_throw2BytesReg || IBusSimplePlugin_decompressor_input_payload_pc[1]);
  assign IBusSimplePlugin_decompressor_unaligned = (IBusSimplePlugin_decompressor_throw2Bytes || IBusSimplePlugin_decompressor_bufferValid);
  assign IBusSimplePlugin_decompressor_bufferValidPatched = (IBusSimplePlugin_decompressor_input_valid ? IBusSimplePlugin_decompressor_bufferValid : IBusSimplePlugin_decompressor_bufferValidLatch);
  assign IBusSimplePlugin_decompressor_throw2BytesPatched = (IBusSimplePlugin_decompressor_input_valid ? IBusSimplePlugin_decompressor_throw2Bytes : IBusSimplePlugin_decompressor_throw2BytesLatch);
  assign IBusSimplePlugin_decompressor_raw = (IBusSimplePlugin_decompressor_bufferValidPatched ? {IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0],IBusSimplePlugin_decompressor_bufferData} : {IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16],(IBusSimplePlugin_decompressor_throw2BytesPatched ? IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16] : IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0])});
  assign IBusSimplePlugin_decompressor_isRvc = (IBusSimplePlugin_decompressor_raw[1 : 0] != 2'b11);
  assign _zz_IBusSimplePlugin_decompressor_decompressed = IBusSimplePlugin_decompressor_raw[15 : 0];
  always @(*) begin
    IBusSimplePlugin_decompressor_decompressed = 32'h00000000;
    case(switch_Misc_l44)
      5'h00 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{{2'b00,_zz_IBusSimplePlugin_decompressor_decompressed[10 : 7]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 11]},_zz_IBusSimplePlugin_decompressor_decompressed[5]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},2'b00},5'h02},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed_2},7'h13};
        if(when_Misc_l47) begin
          IBusSimplePlugin_decompressor_decompressed = 32'h00000000;
        end
      end
      5'h02 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_IBusSimplePlugin_decompressor_decompressed_3,_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed_2},7'h03};
      end
      5'h06 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_3[11 : 5],_zz_IBusSimplePlugin_decompressor_decompressed_2},_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed_3[4 : 0]},7'h23};
      end
      5'h08 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_IBusSimplePlugin_decompressor_decompressed_5,_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h09 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_8[20],_zz_IBusSimplePlugin_decompressor_decompressed_8[10 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_8[11]},_zz_IBusSimplePlugin_decompressor_decompressed_8[19 : 12]},_zz_IBusSimplePlugin_decompressor_decompressed_20},7'h6f};
      end
      5'h0a : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_IBusSimplePlugin_decompressor_decompressed_5,5'h00},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h0b : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7] == 5'h02) ? {{{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_27,_zz_IBusSimplePlugin_decompressor_decompressed_28},_zz_IBusSimplePlugin_decompressor_decompressed_29},_zz_IBusSimplePlugin_decompressor_decompressed[6]},4'b0000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13} : {{_zz_IBusSimplePlugin_decompressor_decompressed_30[31 : 12],_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h37});
      end
      5'h0c : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{((_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] == 2'b10) ? _zz_IBusSimplePlugin_decompressor_decompressed_26 : {{1'b0,(_zz_IBusSimplePlugin_decompressor_decompressed_31 || _zz_IBusSimplePlugin_decompressor_decompressed_32)},5'h00}),(((! _zz_IBusSimplePlugin_decompressor_decompressed[11]) || _zz_IBusSimplePlugin_decompressor_decompressed_22) ? _zz_IBusSimplePlugin_decompressor_decompressed[6 : 2] : _zz_IBusSimplePlugin_decompressor_decompressed_2)},_zz_IBusSimplePlugin_decompressor_decompressed_1},_zz_IBusSimplePlugin_decompressor_decompressed_24},_zz_IBusSimplePlugin_decompressor_decompressed_1},(_zz_IBusSimplePlugin_decompressor_decompressed_22 ? 7'h13 : 7'h33)};
      end
      5'h0d : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_15[20],_zz_IBusSimplePlugin_decompressor_decompressed_15[10 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_15[11]},_zz_IBusSimplePlugin_decompressor_decompressed_15[19 : 12]},_zz_IBusSimplePlugin_decompressor_decompressed_19},7'h6f};
      end
      5'h0e : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_18[12],_zz_IBusSimplePlugin_decompressor_decompressed_18[10 : 5]},_zz_IBusSimplePlugin_decompressor_decompressed_19},_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed_18[4 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_18[11]},7'h63};
      end
      5'h0f : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_18[12],_zz_IBusSimplePlugin_decompressor_decompressed_18[10 : 5]},_zz_IBusSimplePlugin_decompressor_decompressed_19},_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b001},_zz_IBusSimplePlugin_decompressor_decompressed_18[4 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_18[11]},7'h63};
      end
      5'h10 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{7'h00,_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2]},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b001},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h12 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{4'b0000,_zz_IBusSimplePlugin_decompressor_decompressed[3 : 2]},_zz_IBusSimplePlugin_decompressor_decompressed[12]},_zz_IBusSimplePlugin_decompressor_decompressed[6 : 4]},2'b00},_zz_IBusSimplePlugin_decompressor_decompressed_21},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h03};
      end
      5'h14 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_IBusSimplePlugin_decompressor_decompressed[12 : 2] == 11'h400) ? 32'h00100073 : ((_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2] == 5'h00) ? {{{{12'h000,_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b000},(_zz_IBusSimplePlugin_decompressor_decompressed[12] ? _zz_IBusSimplePlugin_decompressor_decompressed_20 : _zz_IBusSimplePlugin_decompressor_decompressed_19)},7'h67} : {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_33,_zz_IBusSimplePlugin_decompressor_decompressed_34},(_zz_IBusSimplePlugin_decompressor_decompressed_35 ? _zz_IBusSimplePlugin_decompressor_decompressed_36 : _zz_IBusSimplePlugin_decompressor_decompressed_19)},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h33}));
      end
      5'h16 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_37[11 : 5],_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2]},_zz_IBusSimplePlugin_decompressor_decompressed_21},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed_38[4 : 0]},7'h23};
      end
      default : begin
      end
    endcase
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_1 = {2'b01,_zz_IBusSimplePlugin_decompressor_decompressed[9 : 7]};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_2 = {2'b01,_zz_IBusSimplePlugin_decompressor_decompressed[4 : 2]};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_3 = {{{{5'h00,_zz_IBusSimplePlugin_decompressor_decompressed[5]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 10]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},2'b00};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_4 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_5[11] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[10] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[9] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[8] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[7] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[6] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[5] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[4 : 0] = _zz_IBusSimplePlugin_decompressor_decompressed[6 : 2];
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_6 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_7[9] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[8] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[7] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[6] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[5] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[4] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[3] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[2] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[1] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[0] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_8 = {{{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_7,_zz_IBusSimplePlugin_decompressor_decompressed[8]},_zz_IBusSimplePlugin_decompressor_decompressed[10 : 9]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},_zz_IBusSimplePlugin_decompressor_decompressed[7]},_zz_IBusSimplePlugin_decompressor_decompressed[2]},_zz_IBusSimplePlugin_decompressor_decompressed[11]},_zz_IBusSimplePlugin_decompressor_decompressed[5 : 3]},1'b0};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_9 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_10[14] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[13] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[12] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[11] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[10] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[9] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[8] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[7] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[6] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[5] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[4] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[3] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[2] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[1] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[0] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_11 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_12[2] = _zz_IBusSimplePlugin_decompressor_decompressed_11;
    _zz_IBusSimplePlugin_decompressor_decompressed_12[1] = _zz_IBusSimplePlugin_decompressor_decompressed_11;
    _zz_IBusSimplePlugin_decompressor_decompressed_12[0] = _zz_IBusSimplePlugin_decompressor_decompressed_11;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_13 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_14[9] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[8] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[7] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[6] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[5] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[4] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[3] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[2] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[1] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[0] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_15 = {{{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_14,_zz_IBusSimplePlugin_decompressor_decompressed[8]},_zz_IBusSimplePlugin_decompressor_decompressed[10 : 9]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},_zz_IBusSimplePlugin_decompressor_decompressed[7]},_zz_IBusSimplePlugin_decompressor_decompressed[2]},_zz_IBusSimplePlugin_decompressor_decompressed[11]},_zz_IBusSimplePlugin_decompressor_decompressed[5 : 3]},1'b0};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_16 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_17[4] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[3] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[2] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[1] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[0] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_18 = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_17,_zz_IBusSimplePlugin_decompressor_decompressed[6 : 5]},_zz_IBusSimplePlugin_decompressor_decompressed[2]},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10]},_zz_IBusSimplePlugin_decompressor_decompressed[4 : 3]},1'b0};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_19 = 5'h00;
  assign _zz_IBusSimplePlugin_decompressor_decompressed_20 = 5'h01;
  assign _zz_IBusSimplePlugin_decompressor_decompressed_21 = 5'h02;
  assign switch_Misc_l44 = {_zz_IBusSimplePlugin_decompressor_decompressed[1 : 0],_zz_IBusSimplePlugin_decompressor_decompressed[15 : 13]};
  assign when_Misc_l47 = (_zz_IBusSimplePlugin_decompressor_decompressed[12 : 2] == 11'h000);
  assign _zz_IBusSimplePlugin_decompressor_decompressed_22 = (_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] != 2'b11);
  assign switch_Misc_l241 = _zz_IBusSimplePlugin_decompressor_decompressed[11 : 10];
  assign switch_Misc_l241_1 = _zz_IBusSimplePlugin_decompressor_decompressed[6 : 5];
  always @(*) begin
    case(switch_Misc_l241_1)
      2'b00 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b000;
      end
      2'b01 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b100;
      end
      2'b10 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b110;
      end
      default : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b111;
      end
    endcase
  end

  always @(*) begin
    case(switch_Misc_l241)
      2'b00 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = 3'b101;
      end
      2'b01 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = 3'b101;
      end
      2'b10 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = 3'b111;
      end
      default : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = _zz_IBusSimplePlugin_decompressor_decompressed_23;
      end
    endcase
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_25 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_26[6] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[5] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[4] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[3] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[2] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[1] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[0] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
  end

  assign IBusSimplePlugin_decompressor_output_valid = (IBusSimplePlugin_decompressor_input_valid && (! ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_bufferValid)) && (! IBusSimplePlugin_decompressor_isInputHighRvc))));
  assign IBusSimplePlugin_decompressor_output_payload_pc = IBusSimplePlugin_decompressor_input_payload_pc;
  assign IBusSimplePlugin_decompressor_output_payload_isRvc = IBusSimplePlugin_decompressor_isRvc;
  assign IBusSimplePlugin_decompressor_output_payload_rsp_inst = (IBusSimplePlugin_decompressor_isRvc ? IBusSimplePlugin_decompressor_decompressed : IBusSimplePlugin_decompressor_raw);
  assign IBusSimplePlugin_decompressor_input_ready = (IBusSimplePlugin_decompressor_output_ready && (((! IBusSimplePlugin_iBusRsp_stages_2_input_valid) || IBusSimplePlugin_decompressor_flushNext) || ((! (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc)) && (! (((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc)))));
  assign IBusSimplePlugin_decompressor_output_fire = (IBusSimplePlugin_decompressor_output_valid && IBusSimplePlugin_decompressor_output_ready);
  assign IBusSimplePlugin_decompressor_bufferFill = (((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && (! IBusSimplePlugin_decompressor_isInputHighRvc)) || (IBusSimplePlugin_decompressor_bufferValid && (! IBusSimplePlugin_decompressor_isInputHighRvc))) || ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_isRvc)) && (! IBusSimplePlugin_decompressor_isInputHighRvc)));
  assign when_Fetcher_l285 = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign when_Fetcher_l288 = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign when_Fetcher_l293 = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_decompressor_consumeCurrent);
  assign IBusSimplePlugin_decompressor_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_IBusSimplePlugin_injector_decodeInput_valid;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign when_Fetcher_l331 = (! 1'b0);
  assign when_Fetcher_l331_1 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l331_2 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l331_3 = (! writeBack_arbitration_isStuck);
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
    case(IBusSimplePlugin_injector_port_state)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
    if(IBusSimplePlugin_forceNoDecodeCond) begin
      decode_arbitration_isValid = 1'b0;
    end
  end

  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_IBusSimplePlugin_pending_next - _zz_IBusSimplePlugin_pending_next_3);
  assign IBusSimplePlugin_cmdFork_pendingFull = (IBusSimplePlugin_pending_value == 3'b111);
  assign IBusSimplePlugin_cmd_fire = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_cmdFork_enterTheMarket = (((IBusSimplePlugin_iBusRsp_stages_1_input_valid && (! IBusSimplePlugin_cmdFork_pendingFull)) && (! IBusSimplePlugin_cmdFork_cmdFired)) && (! IBusSimplePlugin_cmdFork_cmdKeep));
  assign when_IBusSimplePlugin_l317 = ((IBusSimplePlugin_cmdFork_pendingFull && (! IBusSimplePlugin_cmdFork_cmdFired)) && (! IBusSimplePlugin_cmdFork_cmdKeep));
  assign when_IBusSimplePlugin_l318 = ((! IBusSimplePlugin_cmd_ready) && (! IBusSimplePlugin_cmdFork_cmdFired));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_cmdFork_enterTheMarket || IBusSimplePlugin_cmdFork_cmdKeep);
  assign IBusSimplePlugin_pending_inc = IBusSimplePlugin_cmdFork_enterTheMarket;
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_1_input_payload[31 : 2],2'b00};
  assign iBus_rsp_toStream_valid = iBus_rsp_valid;
  assign iBus_rsp_toStream_payload_error = iBus_rsp_payload_error;
  assign iBus_rsp_toStream_payload_inst = iBus_rsp_payload_inst;
  assign iBus_rsp_toStream_ready = IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign system_core_cpu_IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready);
  assign IBusSimplePlugin_pending_dec = system_core_cpu_IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  always @(*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if(when_IBusSimplePlugin_l376) begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign when_IBusSimplePlugin_l376 = (! IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_2_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_rspJoin_join_fire = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_valid ? IBusSimplePlugin_rspJoin_join_fire : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = IBusSimplePlugin_rspJoin_join_fire;
  assign _zz_IBusSimplePlugin_iBusRsp_output_valid = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_dBus_cmd_valid = 1'b0;
  always @(*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT) begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_dBus_cmd_payload_data = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_dBus_cmd_payload_data = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_dBus_cmd_payload_data = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_dBus_cmd_payload_data;
  assign when_DBusSimplePlugin_l436 = ((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0001;
      end
      2'b01 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0011;
      end
      default : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_execute_DBusSimplePlugin_formalMask <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign when_DBusSimplePlugin_l490 = (((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0));
  always @(*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign switch_Misc_l241_2 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_writeBack_DBusSimplePlugin_rspFormated = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[31] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[30] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[29] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[28] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[27] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[26] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[25] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[24] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[23] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[22] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[21] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[20] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[19] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[18] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[17] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[16] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[15] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[14] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[13] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[12] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[11] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[10] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[9] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[8] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_writeBack_DBusSimplePlugin_rspFormated_2 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[31] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[30] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[29] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[28] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[27] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[26] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[25] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[24] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[23] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[22] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[21] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[20] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[19] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[18] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[17] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[16] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l241_2)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_1;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_3;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign when_DBusSimplePlugin_l566 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_decode_IS_CSR_1 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_IS_CSR_2 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_decode_IS_CSR_3 = ((decode_INSTRUCTION & 32'h00000018) == 32'h00000000);
  assign _zz_decode_IS_CSR_4 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_IS_CSR_5 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_IS_CSR_6 = ((decode_INSTRUCTION & 32'h00000030) == 32'h00000010);
  assign _zz_decode_IS_CSR_7 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00000000);
  assign _zz_decode_IS_CSR_8 = ((decode_INSTRUCTION & 32'h10103050) == 32'h00100050);
  assign _zz_decode_IS_CSR = {(|{_zz_decode_IS_CSR_5,(_zz__zz_decode_IS_CSR == _zz__zz_decode_IS_CSR_1)}),{(|(_zz__zz_decode_IS_CSR_2 == _zz__zz_decode_IS_CSR_3)),{(|_zz_decode_IS_CSR_8),{(|_zz__zz_decode_IS_CSR_4),{_zz__zz_decode_IS_CSR_5,{_zz__zz_decode_IS_CSR_8,_zz__zz_decode_IS_CSR_10}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_IS_CSR[1 : 0];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_IS_CSR[6 : 5];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_IS_CSR[14 : 13];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_IS_CSR[17 : 16];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_IS_CSR[20 : 19];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_ENV_CTRL_2 = _zz_decode_IS_CSR[28 : 26];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_2 = _zz_decode_IS_CSR[31 : 30];
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL_2;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign when_RegFilePlugin_l63 = (decode_INSTRUCTION[11 : 7] == 5'h00);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_RegFilePlugin_regFile_port0;
  assign decode_RegFilePlugin_rs2Data = _zz_RegFilePlugin_regFile_port1;
  always @(*) begin
    lastStageRegFileWrite_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
    if(_zz_5) begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
    if(_zz_5) begin
      lastStageRegFileWrite_payload_address = 5'h00;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_data = _zz_decode_RS2_2;
    if(_zz_5) begin
      lastStageRegFileWrite_payload_data = 32'h00000000;
    end
  end

  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      AluBitwiseCtrlEnum_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_BITWISE : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_IntAluPlugin_bitwise;
      end
      AluCtrlEnum_SLT_SLTU : begin
        _zz_execute_REGFILE_WRITE_DATA = {31'd0, _zz__zz_execute_REGFILE_WRITE_DATA};
      end
      default : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : begin
        _zz_execute_SRC1 = execute_RS1;
      end
      Src1CtrlEnum_PC_INCREMENT : begin
        _zz_execute_SRC1 = {29'd0, _zz__zz_execute_SRC1};
      end
      Src1CtrlEnum_IMU : begin
        _zz_execute_SRC1 = {execute_INSTRUCTION[31 : 12],12'h000};
      end
      default : begin
        _zz_execute_SRC1 = {27'd0, _zz__zz_execute_SRC1_1};
      end
    endcase
  end

  assign _zz_execute_SRC2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_SRC2_1[19] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[18] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[17] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[16] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[15] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[14] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[13] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[12] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[11] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[10] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[9] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[8] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[7] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[6] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[5] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[4] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[3] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[2] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[1] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[0] = _zz_execute_SRC2;
  end

  assign _zz_execute_SRC2_2 = _zz__zz_execute_SRC2_2[11];
  always @(*) begin
    _zz_execute_SRC2_3[19] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[18] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[17] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[16] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[15] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[14] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[13] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[12] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[11] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[10] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[9] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[8] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[7] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[6] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[5] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[4] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[3] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[2] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[1] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[0] = _zz_execute_SRC2_2;
  end

  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : begin
        _zz_execute_SRC2_4 = execute_RS2;
      end
      Src2CtrlEnum_IMI : begin
        _zz_execute_SRC2_4 = {_zz_execute_SRC2_1,execute_INSTRUCTION[31 : 20]};
      end
      Src2CtrlEnum_IMS : begin
        _zz_execute_SRC2_4 = {_zz_execute_SRC2_3,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_execute_SRC2_4 = _zz_execute_to_memory_PC;
      end
    endcase
  end

  always @(*) begin
    execute_SrcPlugin_addSub = _zz_execute_SrcPlugin_addSub;
    if(execute_SRC2_FORCE_ZERO) begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @(*) begin
    _zz_execute_FullBarrelShifterPlugin_reversed[0] = execute_SRC1[31];
    _zz_execute_FullBarrelShifterPlugin_reversed[1] = execute_SRC1[30];
    _zz_execute_FullBarrelShifterPlugin_reversed[2] = execute_SRC1[29];
    _zz_execute_FullBarrelShifterPlugin_reversed[3] = execute_SRC1[28];
    _zz_execute_FullBarrelShifterPlugin_reversed[4] = execute_SRC1[27];
    _zz_execute_FullBarrelShifterPlugin_reversed[5] = execute_SRC1[26];
    _zz_execute_FullBarrelShifterPlugin_reversed[6] = execute_SRC1[25];
    _zz_execute_FullBarrelShifterPlugin_reversed[7] = execute_SRC1[24];
    _zz_execute_FullBarrelShifterPlugin_reversed[8] = execute_SRC1[23];
    _zz_execute_FullBarrelShifterPlugin_reversed[9] = execute_SRC1[22];
    _zz_execute_FullBarrelShifterPlugin_reversed[10] = execute_SRC1[21];
    _zz_execute_FullBarrelShifterPlugin_reversed[11] = execute_SRC1[20];
    _zz_execute_FullBarrelShifterPlugin_reversed[12] = execute_SRC1[19];
    _zz_execute_FullBarrelShifterPlugin_reversed[13] = execute_SRC1[18];
    _zz_execute_FullBarrelShifterPlugin_reversed[14] = execute_SRC1[17];
    _zz_execute_FullBarrelShifterPlugin_reversed[15] = execute_SRC1[16];
    _zz_execute_FullBarrelShifterPlugin_reversed[16] = execute_SRC1[15];
    _zz_execute_FullBarrelShifterPlugin_reversed[17] = execute_SRC1[14];
    _zz_execute_FullBarrelShifterPlugin_reversed[18] = execute_SRC1[13];
    _zz_execute_FullBarrelShifterPlugin_reversed[19] = execute_SRC1[12];
    _zz_execute_FullBarrelShifterPlugin_reversed[20] = execute_SRC1[11];
    _zz_execute_FullBarrelShifterPlugin_reversed[21] = execute_SRC1[10];
    _zz_execute_FullBarrelShifterPlugin_reversed[22] = execute_SRC1[9];
    _zz_execute_FullBarrelShifterPlugin_reversed[23] = execute_SRC1[8];
    _zz_execute_FullBarrelShifterPlugin_reversed[24] = execute_SRC1[7];
    _zz_execute_FullBarrelShifterPlugin_reversed[25] = execute_SRC1[6];
    _zz_execute_FullBarrelShifterPlugin_reversed[26] = execute_SRC1[5];
    _zz_execute_FullBarrelShifterPlugin_reversed[27] = execute_SRC1[4];
    _zz_execute_FullBarrelShifterPlugin_reversed[28] = execute_SRC1[3];
    _zz_execute_FullBarrelShifterPlugin_reversed[29] = execute_SRC1[2];
    _zz_execute_FullBarrelShifterPlugin_reversed[30] = execute_SRC1[1];
    _zz_execute_FullBarrelShifterPlugin_reversed[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == ShiftCtrlEnum_SLL_1) ? _zz_execute_FullBarrelShifterPlugin_reversed : execute_SRC1);
  always @(*) begin
    _zz_decode_RS2_3[0] = execute_SHIFT_RIGHT[31];
    _zz_decode_RS2_3[1] = execute_SHIFT_RIGHT[30];
    _zz_decode_RS2_3[2] = execute_SHIFT_RIGHT[29];
    _zz_decode_RS2_3[3] = execute_SHIFT_RIGHT[28];
    _zz_decode_RS2_3[4] = execute_SHIFT_RIGHT[27];
    _zz_decode_RS2_3[5] = execute_SHIFT_RIGHT[26];
    _zz_decode_RS2_3[6] = execute_SHIFT_RIGHT[25];
    _zz_decode_RS2_3[7] = execute_SHIFT_RIGHT[24];
    _zz_decode_RS2_3[8] = execute_SHIFT_RIGHT[23];
    _zz_decode_RS2_3[9] = execute_SHIFT_RIGHT[22];
    _zz_decode_RS2_3[10] = execute_SHIFT_RIGHT[21];
    _zz_decode_RS2_3[11] = execute_SHIFT_RIGHT[20];
    _zz_decode_RS2_3[12] = execute_SHIFT_RIGHT[19];
    _zz_decode_RS2_3[13] = execute_SHIFT_RIGHT[18];
    _zz_decode_RS2_3[14] = execute_SHIFT_RIGHT[17];
    _zz_decode_RS2_3[15] = execute_SHIFT_RIGHT[16];
    _zz_decode_RS2_3[16] = execute_SHIFT_RIGHT[15];
    _zz_decode_RS2_3[17] = execute_SHIFT_RIGHT[14];
    _zz_decode_RS2_3[18] = execute_SHIFT_RIGHT[13];
    _zz_decode_RS2_3[19] = execute_SHIFT_RIGHT[12];
    _zz_decode_RS2_3[20] = execute_SHIFT_RIGHT[11];
    _zz_decode_RS2_3[21] = execute_SHIFT_RIGHT[10];
    _zz_decode_RS2_3[22] = execute_SHIFT_RIGHT[9];
    _zz_decode_RS2_3[23] = execute_SHIFT_RIGHT[8];
    _zz_decode_RS2_3[24] = execute_SHIFT_RIGHT[7];
    _zz_decode_RS2_3[25] = execute_SHIFT_RIGHT[6];
    _zz_decode_RS2_3[26] = execute_SHIFT_RIGHT[5];
    _zz_decode_RS2_3[27] = execute_SHIFT_RIGHT[4];
    _zz_decode_RS2_3[28] = execute_SHIFT_RIGHT[3];
    _zz_decode_RS2_3[29] = execute_SHIFT_RIGHT[2];
    _zz_decode_RS2_3[30] = execute_SHIFT_RIGHT[1];
    _zz_decode_RS2_3[31] = execute_SHIFT_RIGHT[0];
  end

  always @(*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l48) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l48_1) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l48_2) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l105) begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @(*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l51) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l51_1) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l51_2) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l108) begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_decode_RS2_2;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l47 = 1'b1;
  assign when_HazardSimplePlugin_l48 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58 = (1'b0 || (! when_HazardSimplePlugin_l47));
  assign when_HazardSimplePlugin_l48_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_1 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign when_HazardSimplePlugin_l48_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_2 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign when_HazardSimplePlugin_l105 = (! decode_RS1_USE);
  assign when_HazardSimplePlugin_l108 = (! decode_RS2_USE);
  assign when_HazardSimplePlugin_l113 = (decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard));
  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  assign switch_MulPlugin_l87 = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign writeBack_MulPlugin_result = ($signed(_zz_writeBack_MulPlugin_result) + $signed(_zz_writeBack_MulPlugin_result_1));
  assign when_MulPlugin_l147 = (writeBack_arbitration_isValid && writeBack_IS_MUL);
  assign switch_MulPlugin_l148 = writeBack_INSTRUCTION[13 : 12];
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @(*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(when_MulDivIterativePlugin_l162) begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @(*) begin
    if(memory_DivPlugin_div_counter_willOverflow) begin
      memory_DivPlugin_div_counter_valueNext = 6'h00;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_memory_DivPlugin_div_counter_valueNext);
    end
    if(memory_DivPlugin_div_counter_willClear) begin
      memory_DivPlugin_div_counter_valueNext = 6'h00;
    end
  end

  assign when_MulDivIterativePlugin_l126 = (memory_DivPlugin_div_counter_value == 6'h20);
  assign when_MulDivIterativePlugin_l126_1 = (! memory_arbitration_isStuck);
  assign when_MulDivIterativePlugin_l128 = (memory_arbitration_isValid && memory_IS_DIV);
  assign when_MulDivIterativePlugin_l129 = ((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done));
  assign when_MulDivIterativePlugin_l132 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_memory_DivPlugin_div_stage_0_remainderShifted = memory_DivPlugin_rs1[31 : 0];
  assign memory_DivPlugin_div_stage_0_remainderShifted = {memory_DivPlugin_accumulator[31 : 0],_zz_memory_DivPlugin_div_stage_0_remainderShifted[31]};
  assign memory_DivPlugin_div_stage_0_remainderMinusDenominator = (memory_DivPlugin_div_stage_0_remainderShifted - _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator);
  assign memory_DivPlugin_div_stage_0_outRemainder = ((! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_memory_DivPlugin_div_stage_0_outRemainder : _zz_memory_DivPlugin_div_stage_0_outRemainder_1);
  assign memory_DivPlugin_div_stage_0_outNumerator = _zz_memory_DivPlugin_div_stage_0_outNumerator[31:0];
  assign when_MulDivIterativePlugin_l151 = (memory_DivPlugin_div_counter_value == 6'h20);
  assign _zz_memory_DivPlugin_div_result = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign when_MulDivIterativePlugin_l162 = (! memory_arbitration_isStuck);
  assign _zz_memory_DivPlugin_rs2 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_memory_DivPlugin_rs1 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @(*) begin
    _zz_memory_DivPlugin_rs1_1[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_memory_DivPlugin_rs1_1[31 : 0] = execute_RS1;
  end

  always @(*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire) begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0001100;
  assign CsrPlugin_mtvec_mode = 2'b00;
  assign _zz_when_CsrPlugin_l1302 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_when_CsrPlugin_l1302_1 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_when_CsrPlugin_l1302_2 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(decodeExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(CsrPlugin_selfException_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(memory_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign when_CsrPlugin_l1259 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l1259_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1259_2 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1259_3 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1272 = (|{CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}});
  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign when_CsrPlugin_l1296 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l1302 = ((_zz_when_CsrPlugin_l1302 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1302_1 = ((_zz_when_CsrPlugin_l1302_1 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1302_2 = ((_zz_when_CsrPlugin_l1302_2 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l1335 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1335_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1335_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1340 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(when_CsrPlugin_l1346) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign when_CsrPlugin_l1346 = (|{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}});
  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @(*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException) begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @(*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException) begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  assign CsrPlugin_trapCauseEbreakDebug = 1'b0;
  always @(*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign CsrPlugin_trapEnterDebug = 1'b0;
  assign when_CsrPlugin_l1390 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign when_CsrPlugin_l1398 = (! CsrPlugin_trapEnterDebug);
  assign when_CsrPlugin_l1456 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET));
  assign switch_CsrPlugin_l1460 = writeBack_INSTRUCTION[29 : 28];
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1519 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_WFI));
  assign when_CsrPlugin_l1521 = (! execute_CsrPlugin_wfiWake);
  assign when_CsrPlugin_l1527 = (|{(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == EnvCtrlEnum_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET))}});
  assign execute_CsrPlugin_blockedBySideEffects = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) || 1'b0);
  always @(*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_3857) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3858) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3859) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3860) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_769) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_768) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_832) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_835) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2816) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2944) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2818) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2946) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_3072) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3200) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(CsrPlugin_csrMapping_allowCsrSignal) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(when_CsrPlugin_l1725) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if(when_CsrPlugin_l1547) begin
      if(when_CsrPlugin_l1548) begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @(*) begin
    CsrPlugin_selfException_valid = 1'b0;
    if(when_CsrPlugin_l1540) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(when_CsrPlugin_l1555) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(when_CsrPlugin_l1565) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(when_CsrPlugin_l1540) begin
      CsrPlugin_selfException_payload_code = 4'b0010;
    end
    if(when_CsrPlugin_l1555) begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = 4'b1000;
        end
        default : begin
          CsrPlugin_selfException_payload_code = 4'b1011;
        end
      endcase
    end
    if(when_CsrPlugin_l1565) begin
      CsrPlugin_selfException_payload_code = 4'b0011;
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  assign when_CsrPlugin_l1540 = (execute_CsrPlugin_illegalAccess || execute_CsrPlugin_illegalInstruction);
  assign when_CsrPlugin_l1547 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET));
  assign when_CsrPlugin_l1548 = (CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]);
  assign when_CsrPlugin_l1555 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_ECALL));
  assign when_CsrPlugin_l1565 = ((execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_EBREAK)) && CsrPlugin_allowEbreakException);
  always @(*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign CsrPlugin_csrMapping_hazardFree = (! execute_CsrPlugin_blockedBySideEffects);
  assign execute_CsrPlugin_readToWriteData = CsrPlugin_csrMapping_readDataSignal;
  assign switch_Misc_l241_3 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l241_3)
      1'b0 : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = execute_SRC1;
      end
      default : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign CsrPlugin_csrMapping_writeDataSignal = _zz_CsrPlugin_csrMapping_writeDataSignal;
  assign when_CsrPlugin_l1587 = (execute_arbitration_isValid && execute_IS_CSR);
  assign when_CsrPlugin_l1591 = (execute_arbitration_isValid && (execute_IS_CSR || 1'b0));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign switch_Misc_l241_4 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    case(switch_Misc_l241_4)
      3'b000 : begin
        _zz_execute_BRANCH_DO = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_DO = (! execute_BranchPlugin_eq);
      end
      3'b101 : begin
        _zz_execute_BRANCH_DO = (! execute_SRC_LESS);
      end
      3'b111 : begin
        _zz_execute_BRANCH_DO = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_DO = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : begin
        _zz_execute_BRANCH_DO_1 = 1'b0;
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BRANCH_DO_1 = 1'b1;
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BRANCH_DO_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_DO_1 = _zz_execute_BRANCH_DO;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == BranchCtrlEnum_JALR) ? execute_RS1 : execute_PC);
  assign _zz_execute_BranchPlugin_branch_src2 = _zz__zz_execute_BranchPlugin_branch_src2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[10] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[9] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[8] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[7] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[6] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[5] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[4] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[3] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[2] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[1] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[0] = _zz_execute_BranchPlugin_branch_src2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_3[19] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[18] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[17] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[16] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[15] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[14] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[13] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[12] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[11] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[10] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[9] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[8] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[7] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[6] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[5] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[4] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[3] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[2] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[1] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[0] = _zz_execute_BranchPlugin_branch_src2_2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_4 = _zz__zz_execute_BranchPlugin_branch_src2_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_5[18] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[17] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[16] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[15] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[14] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[13] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[12] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[11] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[10] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[9] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[8] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[7] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[6] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[5] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[4] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[3] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[2] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[1] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[0] = _zz_execute_BranchPlugin_branch_src2_4;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JAL : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {{_zz_execute_BranchPlugin_branch_src2_1,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {_zz_execute_BranchPlugin_branch_src2_3,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {{_zz_execute_BranchPlugin_branch_src2_5,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_execute_BranchPlugin_branch_src2_6;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign when_DebugPlugin_l238 = (DebugPlugin_haltIt && (! DebugPlugin_isPipBusy));
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @(*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l280)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            debug_bus_cmd_ready = DebugPlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if(when_DebugPlugin_l257) begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign when_DebugPlugin_l257 = (! _zz_when_DebugPlugin_l257);
  always @(*) begin
    DebugPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l280)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign DebugPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign switch_DebugPlugin_l280 = debug_bus_cmd_payload_address[7 : 2];
  assign when_DebugPlugin_l284 = debug_bus_cmd_payload_data[16];
  assign when_DebugPlugin_l284_1 = debug_bus_cmd_payload_data[24];
  assign when_DebugPlugin_l285 = debug_bus_cmd_payload_data[17];
  assign when_DebugPlugin_l285_1 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l286 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l287 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l288 = debug_bus_cmd_payload_data[18];
  assign when_DebugPlugin_l288_1 = debug_bus_cmd_payload_data[26];
  assign when_DebugPlugin_l308 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign when_DebugPlugin_l311 = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) == 1'b0);
  assign when_DebugPlugin_l324 = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign when_DebugPlugin_l344 = (DebugPlugin_haltIt || DebugPlugin_stepIt);
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = ((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack));
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_9 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_to_execute_SRC1_CTRL_1 = decode_SRC1_CTRL;
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC1_CTRL = decode_to_execute_SRC1_CTRL;
  assign when_Pipeline_l124_11 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_12 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_13 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_14 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_to_execute_SRC2_CTRL_1 = decode_SRC2_CTRL;
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_15 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC2_CTRL = decode_to_execute_SRC2_CTRL;
  assign when_Pipeline_l124_16 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_17 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_18 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_21 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_22 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_23 = (! memory_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_24 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign when_Pipeline_l124_25 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_26 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_27 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_28 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_29 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_30 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_31 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_32 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_33 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_34 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_35 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_36 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_37 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_38 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  assign when_Pipeline_l124_39 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_40 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_41 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_42 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_43 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_44 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_45 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_46 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_47 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_48 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_49 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_50 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_51 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_52 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_53 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_54 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_55 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_56 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_57 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_58 = (! writeBack_arbitration_isStuck);
  assign decode_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}}));
  assign execute_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,memory_arbitration_flushNext}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}}));
  assign memory_arbitration_isFlushed = ((|writeBack_arbitration_flushNext) || (|{writeBack_arbitration_flushIt,memory_arbitration_flushIt}));
  assign writeBack_arbitration_isFlushed = (1'b0 || (|writeBack_arbitration_flushIt));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  always @(*) begin
    DebugPlugin_injectionPort_ready = 1'b0;
    case(IBusSimplePlugin_injector_port_state)
      3'b100 : begin
        DebugPlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Fetcher_l373 = (IBusSimplePlugin_injector_port_state != 3'b000);
  assign when_Fetcher_l391 = (! decode_arbitration_isStuck);
  assign when_Fetcher_l411 = (IBusSimplePlugin_injector_port_state != 3'b000);
  assign when_CsrPlugin_l1669 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_2 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_3 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_4 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_5 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_6 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_7 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_8 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_9 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_10 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_11 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_12 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_13 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_14 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_15 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_16 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_17 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_18 = (! execute_arbitration_isStuck);
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit = 32'h00000000;
    if(execute_CsrPlugin_csr_769) begin
      _zz_CsrPlugin_csrMapping_readDataInit[31 : 30] = CsrPlugin_misa_base;
      _zz_CsrPlugin_csrMapping_readDataInit[25 : 0] = CsrPlugin_misa_extensions;
    end
  end

  assign switch_CsrPlugin_l1031 = CsrPlugin_csrMapping_writeDataSignal[12 : 11];
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_1 = 32'h00000000;
    if(execute_CsrPlugin_csr_768) begin
      _zz_CsrPlugin_csrMapping_readDataInit_1[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_CsrPlugin_csrMapping_readDataInit_1[3 : 3] = CsrPlugin_mstatus_MIE;
      _zz_CsrPlugin_csrMapping_readDataInit_1[12 : 11] = CsrPlugin_mstatus_MPP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_2 = 32'h00000000;
    if(execute_CsrPlugin_csr_836) begin
      _zz_CsrPlugin_csrMapping_readDataInit_2[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_CsrPlugin_csrMapping_readDataInit_2[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_CsrPlugin_csrMapping_readDataInit_2[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_3 = 32'h00000000;
    if(execute_CsrPlugin_csr_772) begin
      _zz_CsrPlugin_csrMapping_readDataInit_3[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_3[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_CsrPlugin_csrMapping_readDataInit_3[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_4 = 32'h00000000;
    if(execute_CsrPlugin_csr_773) begin
      _zz_CsrPlugin_csrMapping_readDataInit_4[31 : 2] = CsrPlugin_mtvec_base;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_5 = 32'h00000000;
    if(execute_CsrPlugin_csr_833) begin
      _zz_CsrPlugin_csrMapping_readDataInit_5[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_6 = 32'h00000000;
    if(execute_CsrPlugin_csr_832) begin
      _zz_CsrPlugin_csrMapping_readDataInit_6[31 : 0] = CsrPlugin_mscratch;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_7 = 32'h00000000;
    if(execute_CsrPlugin_csr_834) begin
      _zz_CsrPlugin_csrMapping_readDataInit_7[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_7[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_8 = 32'h00000000;
    if(execute_CsrPlugin_csr_835) begin
      _zz_CsrPlugin_csrMapping_readDataInit_8[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_9 = 32'h00000000;
    if(execute_CsrPlugin_csr_2816) begin
      _zz_CsrPlugin_csrMapping_readDataInit_9[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_10 = 32'h00000000;
    if(execute_CsrPlugin_csr_2944) begin
      _zz_CsrPlugin_csrMapping_readDataInit_10[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_11 = 32'h00000000;
    if(execute_CsrPlugin_csr_2818) begin
      _zz_CsrPlugin_csrMapping_readDataInit_11[31 : 0] = CsrPlugin_minstret[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_12 = 32'h00000000;
    if(execute_CsrPlugin_csr_2946) begin
      _zz_CsrPlugin_csrMapping_readDataInit_12[31 : 0] = CsrPlugin_minstret[63 : 32];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_13 = 32'h00000000;
    if(execute_CsrPlugin_csr_3072) begin
      _zz_CsrPlugin_csrMapping_readDataInit_13[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_14 = 32'h00000000;
    if(execute_CsrPlugin_csr_3200) begin
      _zz_CsrPlugin_csrMapping_readDataInit_14[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = (((((_zz_CsrPlugin_csrMapping_readDataInit_15 | _zz_CsrPlugin_csrMapping_readDataInit_16) | (_zz_CsrPlugin_csrMapping_readDataInit_17 | _zz_CsrPlugin_csrMapping_readDataInit_18)) | ((_zz_CsrPlugin_csrMapping_readDataInit | _zz_CsrPlugin_csrMapping_readDataInit_1) | (_zz_CsrPlugin_csrMapping_readDataInit_2 | _zz_CsrPlugin_csrMapping_readDataInit_3))) | (((_zz_CsrPlugin_csrMapping_readDataInit_4 | _zz_CsrPlugin_csrMapping_readDataInit_5) | (_zz_CsrPlugin_csrMapping_readDataInit_6 | _zz_CsrPlugin_csrMapping_readDataInit_7)) | ((_zz_CsrPlugin_csrMapping_readDataInit_8 | _zz_CsrPlugin_csrMapping_readDataInit_9) | (_zz_CsrPlugin_csrMapping_readDataInit_10 | _zz_CsrPlugin_csrMapping_readDataInit_11)))) | ((_zz_CsrPlugin_csrMapping_readDataInit_12 | _zz_CsrPlugin_csrMapping_readDataInit_13) | _zz_CsrPlugin_csrMapping_readDataInit_14));
  assign when_CsrPlugin_l1702 = ((execute_arbitration_isValid && execute_IS_CSR) && (({execute_CsrPlugin_csrAddress[11 : 2],2'b00} == 12'h3a0) || ({execute_CsrPlugin_csrAddress[11 : 4],4'b0000} == 12'h3b0)));
  assign _zz_when_CsrPlugin_l1709 = (execute_CsrPlugin_csrAddress & 12'hf60);
  assign when_CsrPlugin_l1709 = (((execute_arbitration_isValid && execute_IS_CSR) && (5'h03 <= execute_CsrPlugin_csrAddress[4 : 0])) && (((_zz_when_CsrPlugin_l1709 == 12'hb00) || (((_zz_when_CsrPlugin_l1709 == 12'hc00) && (! execute_CsrPlugin_writeInstruction)) && (CsrPlugin_privilege == 2'b11))) || ((execute_CsrPlugin_csrAddress & 12'hfe0) == 12'h320)));
  always @(*) begin
    when_CsrPlugin_l1719 = CsrPlugin_csrMapping_doForceFailCsr;
    if(when_CsrPlugin_l1717) begin
      when_CsrPlugin_l1719 = 1'b1;
    end
  end

  assign when_CsrPlugin_l1717 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1725 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_flush = 1'b0;
  always @(posedge _zz_7) begin
    if(!_zz_8) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'ha0000000;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      IBusSimplePlugin_decodePc_pcReg <= 32'ha0000000;
      _zz_IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_valid <= 1'b0;
      _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
      _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_cmdFork_cmdKeep <= 1'b0;
      IBusSimplePlugin_cmdFork_cmdFired <= 1'b0;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
      _zz_5 <= 1'b1;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      memory_DivPlugin_div_counter_value <= 6'h00;
      CsrPlugin_mtvec_base <= 30'h28000000;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_mcycle <= 64'h0000000000000000;
      CsrPlugin_minstret <= 64'h0000000000000000;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_lastStageWasWfi <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      IBusSimplePlugin_injector_port_state <= 3'b000;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_output_fire) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l133) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_output_fire) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l133_1) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l160) begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if(when_Fetcher_l182) begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_decodePc_pcPlus;
      end
      if(when_Fetcher_l194) begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_jump_pcLoad_payload;
      end
      if(IBusSimplePlugin_iBusRsp_flush) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_stages_0_output_ready) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_valid <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusSimplePlugin_iBusRsp_flush) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_stages_1_output_ready) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= (IBusSimplePlugin_iBusRsp_stages_1_output_valid && (! IBusSimplePlugin_iBusRsp_flush));
      end
      if(IBusSimplePlugin_decompressor_output_fire) begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= ((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc) || (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc));
      end
      if(when_Fetcher_l285) begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(when_Fetcher_l288) begin
        if(IBusSimplePlugin_decompressor_bufferFill) begin
          IBusSimplePlugin_decompressor_bufferValid <= 1'b1;
        end
      end
      if(when_Fetcher_l293) begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(decode_arbitration_removeIt) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      end
      if(IBusSimplePlugin_decompressor_output_ready) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= (IBusSimplePlugin_decompressor_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if(when_Fetcher_l331) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l331_1) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l331_2) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l331_3) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      if(IBusSimplePlugin_cmdFork_enterTheMarket) begin
        IBusSimplePlugin_cmdFork_cmdKeep <= 1'b1;
      end
      if(IBusSimplePlugin_cmd_ready) begin
        IBusSimplePlugin_cmdFork_cmdKeep <= 1'b0;
      end
      if(IBusSimplePlugin_cmd_fire) begin
        IBusSimplePlugin_cmdFork_cmdFired <= 1'b1;
      end
      if(IBusSimplePlugin_iBusRsp_stages_1_input_ready) begin
        IBusSimplePlugin_cmdFork_cmdFired <= 1'b0;
      end
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter);
      if(IBusSimplePlugin_iBusRsp_flush) begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= IBusSimplePlugin_pending_next;
      end
      _zz_5 <= 1'b0;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
      if(writeBack_arbitration_isFiring) begin
        CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
      end
      if(when_CsrPlugin_l1259) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if(when_CsrPlugin_l1259_1) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if(when_CsrPlugin_l1259_2) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if(when_CsrPlugin_l1259_3) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(when_CsrPlugin_l1296) begin
        if(when_CsrPlugin_l1302) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_1) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_2) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      CsrPlugin_lastStageWasWfi <= (writeBack_arbitration_isFiring && (writeBack_ENV_CTRL == EnvCtrlEnum_WFI));
      if(CsrPlugin_pipelineLiberator_active) begin
        if(when_CsrPlugin_l1335) begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if(when_CsrPlugin_l1335_1) begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if(when_CsrPlugin_l1335_2) begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(when_CsrPlugin_l1340) begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump) begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(when_CsrPlugin_l1390) begin
        if(when_CsrPlugin_l1398) begin
          case(CsrPlugin_targetPrivilege)
            2'b11 : begin
              CsrPlugin_mstatus_MIE <= 1'b0;
              CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
              CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
            end
            default : begin
            end
          endcase
        end
      end
      if(when_CsrPlugin_l1456) begin
        case(switch_CsrPlugin_l1460)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= ((|{_zz_when_CsrPlugin_l1302_2,{_zz_when_CsrPlugin_l1302_1,_zz_when_CsrPlugin_l1302}}) || CsrPlugin_thirdPartyWake);
      if(when_Pipeline_l151) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(IBusSimplePlugin_injector_port_state)
        3'b000 : begin
          if(DebugPlugin_injectionPort_valid) begin
            IBusSimplePlugin_injector_port_state <= 3'b001;
          end
        end
        3'b001 : begin
          IBusSimplePlugin_injector_port_state <= 3'b010;
        end
        3'b010 : begin
          IBusSimplePlugin_injector_port_state <= 3'b011;
        end
        3'b011 : begin
          if(when_Fetcher_l391) begin
            IBusSimplePlugin_injector_port_state <= 3'b100;
          end
        end
        3'b100 : begin
          IBusSimplePlugin_injector_port_state <= 3'b000;
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mstatus_MPIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mstatus_MIE <= CsrPlugin_csrMapping_writeDataSignal[3];
          case(switch_CsrPlugin_l1031)
            2'b11 : begin
              CsrPlugin_mstatus_MPP <= 2'b11;
            end
            default : begin
            end
          endcase
        end
      end
      if(execute_CsrPlugin_csr_772) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mie_MEIE <= CsrPlugin_csrMapping_writeDataSignal[11];
          CsrPlugin_mie_MTIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mie_MSIE <= CsrPlugin_csrMapping_writeDataSignal[3];
        end
      end
      if(execute_CsrPlugin_csr_773) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mtvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
        end
      end
      if(execute_CsrPlugin_csr_2816) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mcycle[31 : 0] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
      if(execute_CsrPlugin_csr_2944) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mcycle[63 : 32] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
      if(execute_CsrPlugin_csr_2818) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_minstret[31 : 0] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
      if(execute_CsrPlugin_csr_2946) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_minstret[63 : 32] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
    end
  end

  always @(posedge _zz_7) begin
    if(IBusSimplePlugin_iBusRsp_stages_0_output_ready) begin
      _zz_IBusSimplePlugin_iBusRsp_stages_0_output_m2sPipe_payload <= IBusSimplePlugin_iBusRsp_stages_0_output_payload;
    end
    if(IBusSimplePlugin_iBusRsp_stages_1_output_ready) begin
      _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload <= IBusSimplePlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusSimplePlugin_decompressor_input_valid) begin
      IBusSimplePlugin_decompressor_bufferValidLatch <= IBusSimplePlugin_decompressor_bufferValid;
    end
    if(IBusSimplePlugin_decompressor_input_valid) begin
      IBusSimplePlugin_decompressor_throw2BytesLatch <= IBusSimplePlugin_decompressor_throw2Bytes;
    end
    if(when_Fetcher_l288) begin
      IBusSimplePlugin_decompressor_bufferData <= IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16];
    end
    if(IBusSimplePlugin_decompressor_output_ready) begin
      _zz_IBusSimplePlugin_injector_decodeInput_payload_pc <= IBusSimplePlugin_decompressor_output_payload_pc;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error <= IBusSimplePlugin_decompressor_output_payload_rsp_error;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst <= IBusSimplePlugin_decompressor_output_payload_rsp_inst;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc <= IBusSimplePlugin_decompressor_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready) begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_decompressor_raw;
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    if(when_MulDivIterativePlugin_l126) begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if(when_MulDivIterativePlugin_l126_1) begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_DivPlugin_rs1[31 : 0] <= memory_DivPlugin_div_stage_0_outNumerator;
        memory_DivPlugin_accumulator[31 : 0] <= memory_DivPlugin_div_stage_0_outRemainder;
        if(when_MulDivIterativePlugin_l151) begin
          memory_DivPlugin_div_result <= _zz_memory_DivPlugin_div_result_1[31:0];
        end
      end
    end
    if(when_MulDivIterativePlugin_l162) begin
      memory_DivPlugin_accumulator <= 65'h00000000000000000;
      memory_DivPlugin_rs1 <= ((_zz_memory_DivPlugin_rs1 ? (~ _zz_memory_DivPlugin_rs1_1) : _zz_memory_DivPlugin_rs1_1) + _zz_memory_DivPlugin_rs1_2);
      memory_DivPlugin_rs2 <= ((_zz_memory_DivPlugin_rs2 ? (~ execute_RS2) : execute_RS2) + _zz_memory_DivPlugin_rs2_1);
      memory_DivPlugin_div_needRevert <= ((_zz_memory_DivPlugin_rs1 ^ (_zz_memory_DivPlugin_rs2 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h00000000) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    if(decodeExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= decodeExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= decodeExceptionPort_payload_badAddr;
    end
    if(CsrPlugin_selfException_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(when_CsrPlugin_l1296) begin
      if(when_CsrPlugin_l1302) begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_1) begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_2) begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(when_CsrPlugin_l1390) begin
      if(when_CsrPlugin_l1398) begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
            CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
            CsrPlugin_mepc <= writeBack_PC;
            if(CsrPlugin_hadException) begin
              CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
            end
          end
          default : begin
          end
        endcase
      end
    end
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= decode_PC;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= _zz_execute_to_memory_PC;
    end
    if(when_Pipeline_l124_2) begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if(when_Pipeline_l124_3) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l124_4) begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l124_5) begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if(when_Pipeline_l124_6) begin
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if(when_Pipeline_l124_7) begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_memory_to_writeBack_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_SRC1_CTRL <= _zz_decode_to_execute_SRC1_CTRL;
    end
    if(when_Pipeline_l124_11) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_12) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_13) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_14) begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_15) begin
      decode_to_execute_SRC2_CTRL <= _zz_decode_to_execute_SRC2_CTRL;
    end
    if(when_Pipeline_l124_16) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_17) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_18) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_19) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_20) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_21) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_22) begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if(when_Pipeline_l124_23) begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if(when_Pipeline_l124_24) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_25) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_26) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_27) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_28) begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if(when_Pipeline_l124_29) begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if(when_Pipeline_l124_30) begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if(when_Pipeline_l124_31) begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if(when_Pipeline_l124_32) begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if(when_Pipeline_l124_33) begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if(when_Pipeline_l124_34) begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if(when_Pipeline_l124_35) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_36) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_37) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_38) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_39) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_40) begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if(when_Pipeline_l124_41) begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if(when_Pipeline_l124_42) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_43) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_44) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_45) begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if(when_Pipeline_l124_46) begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_47) begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_48) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_49) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2;
    end
    if(when_Pipeline_l124_50) begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if(when_Pipeline_l124_51) begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if(when_Pipeline_l124_52) begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if(when_Pipeline_l124_53) begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if(when_Pipeline_l124_54) begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if(when_Pipeline_l124_55) begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if(when_Pipeline_l124_56) begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if(when_Pipeline_l124_57) begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if(when_Pipeline_l124_58) begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if(when_Fetcher_l411) begin
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst <= DebugPlugin_injectionPort_payload;
    end
    if(when_CsrPlugin_l1669) begin
      execute_CsrPlugin_csr_3857 <= (decode_INSTRUCTION[31 : 20] == 12'hf11);
    end
    if(when_CsrPlugin_l1669_1) begin
      execute_CsrPlugin_csr_3858 <= (decode_INSTRUCTION[31 : 20] == 12'hf12);
    end
    if(when_CsrPlugin_l1669_2) begin
      execute_CsrPlugin_csr_3859 <= (decode_INSTRUCTION[31 : 20] == 12'hf13);
    end
    if(when_CsrPlugin_l1669_3) begin
      execute_CsrPlugin_csr_3860 <= (decode_INSTRUCTION[31 : 20] == 12'hf14);
    end
    if(when_CsrPlugin_l1669_4) begin
      execute_CsrPlugin_csr_769 <= (decode_INSTRUCTION[31 : 20] == 12'h301);
    end
    if(when_CsrPlugin_l1669_5) begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if(when_CsrPlugin_l1669_6) begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if(when_CsrPlugin_l1669_7) begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if(when_CsrPlugin_l1669_8) begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if(when_CsrPlugin_l1669_9) begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if(when_CsrPlugin_l1669_10) begin
      execute_CsrPlugin_csr_832 <= (decode_INSTRUCTION[31 : 20] == 12'h340);
    end
    if(when_CsrPlugin_l1669_11) begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(when_CsrPlugin_l1669_12) begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if(when_CsrPlugin_l1669_13) begin
      execute_CsrPlugin_csr_2816 <= (decode_INSTRUCTION[31 : 20] == 12'hb00);
    end
    if(when_CsrPlugin_l1669_14) begin
      execute_CsrPlugin_csr_2944 <= (decode_INSTRUCTION[31 : 20] == 12'hb80);
    end
    if(when_CsrPlugin_l1669_15) begin
      execute_CsrPlugin_csr_2818 <= (decode_INSTRUCTION[31 : 20] == 12'hb02);
    end
    if(when_CsrPlugin_l1669_16) begin
      execute_CsrPlugin_csr_2946 <= (decode_INSTRUCTION[31 : 20] == 12'hb82);
    end
    if(when_CsrPlugin_l1669_17) begin
      execute_CsrPlugin_csr_3072 <= (decode_INSTRUCTION[31 : 20] == 12'hc00);
    end
    if(when_CsrPlugin_l1669_18) begin
      execute_CsrPlugin_csr_3200 <= (decode_INSTRUCTION[31 : 20] == 12'hc80);
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_832) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mscratch <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_834) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mcause_interrupt <= CsrPlugin_csrMapping_writeDataSignal[31];
        CsrPlugin_mcause_exceptionCode <= CsrPlugin_csrMapping_writeDataSignal[3 : 0];
      end
    end
    if(execute_CsrPlugin_csr_835) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mtval <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  always @(posedge _zz_9) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready) begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= ((|{writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}}) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid) begin
      DebugPlugin_busReadDataReg <= _zz_decode_RS2_2;
    end
    _zz_when_DebugPlugin_l257 <= debug_bus_cmd_payload_address[2];
    if(when_DebugPlugin_l308) begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @(posedge _zz_9) begin
    if(!_zz_10) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_debugUsed <= 1'b0;
      DebugPlugin_disableEbreak <= 1'b0;
      _zz_6 <= 1'b0;
    end else begin
      if(when_DebugPlugin_l238) begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        DebugPlugin_debugUsed <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        case(switch_DebugPlugin_l280)
          6'h00 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(when_DebugPlugin_l284) begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(when_DebugPlugin_l284_1) begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(when_DebugPlugin_l285) begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(when_DebugPlugin_l285_1) begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(when_DebugPlugin_l286) begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(when_DebugPlugin_l287) begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(when_DebugPlugin_l288) begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(when_DebugPlugin_l288_1) begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
      if(when_DebugPlugin_l308) begin
        if(when_DebugPlugin_l311) begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(when_DebugPlugin_l324) begin
        if(decode_arbitration_isValid) begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      _zz_6 <= (DebugPlugin_stepIt && decode_arbitration_isFiring);
    end
  end


endmodule

module ClockControllerCtrl (
  output wire [1:0]    io_clocks,
  input  wire [1:0]    io_buildConnection_clocks,
  input  wire [1:0]    io_config_enable,
  output wire          _zz_3,
  output wire          _zz_4
);

  wire                _zz_1;
  wire                _zz_2;

  assign io_clocks = io_buildConnection_clocks;
  assign _zz_1 = io_buildConnection_clocks[0];
  assign _zz_2 = io_buildConnection_clocks[1];
  assign _zz_3 = _zz_1;
  assign _zz_4 = _zz_2;

endmodule

module ResetControllerCtrl (
  output wire [1:0]    io_resets,
  input  wire [1:0]    io_trigger,
  input  wire [1:0]    io_buildConnection_resets,
  output wire [1:0]    io_buildConnection_trigger,
  input  wire [1:0]    io_config_enable,
  input  wire [1:0]    io_config_trigger,
  input  wire          io_config_acknowledge,
  output wire          _zz_3,
  output wire          _zz_4
);

  reg        [1:0]    ctrlTrigger;
  wire                _zz_1;
  wire                _zz_2;

  assign io_resets = io_buildConnection_resets;
  always @(*) begin
    ctrlTrigger = 2'b00;
    if(io_config_acknowledge) begin
      ctrlTrigger = io_config_trigger;
    end
  end

  assign io_buildConnection_trigger = (io_config_enable & (io_trigger | ctrlTrigger));
  assign _zz_1 = io_resets[0];
  assign _zz_2 = io_resets[1];
  assign _zz_3 = _zz_1;
  assign _zz_4 = _zz_2;

endmodule

//InterruptCtrl_3 replaced by InterruptCtrl

//InterruptCtrl_2 replaced by InterruptCtrl

//InterruptCtrl_1 replaced by InterruptCtrl

module InterruptCtrl (
  input  wire [3:0]    io_inputs,
  input  wire [3:0]    io_clears,
  input  wire [3:0]    io_masks,
  output wire [3:0]    io_pendings,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  reg        [3:0]    pendings;

  assign io_pendings = (pendings & io_masks);
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      pendings <= 4'b0000;
    end else begin
      pendings <= ((pendings & (~ io_clears)) | io_inputs);
    end
  end


endmodule

module GpioCtrl (
  input  wire [3:0]    io_gpio_pins_read,
  output wire [3:0]    io_gpio_pins_write,
  output wire [3:0]    io_gpio_pins_writeEnable,
  input  wire [3:0]    io_config_write,
  input  wire [3:0]    io_config_direction,
  output wire [3:0]    io_value,
  output wire          io_interrupt,
  output wire [3:0]    io_irqHigh_valid,
  input  wire [3:0]    io_irqHigh_pending,
  output wire [3:0]    io_irqLow_valid,
  input  wire [3:0]    io_irqLow_pending,
  output wire [3:0]    io_irqRise_valid,
  input  wire [3:0]    io_irqRise_pending,
  output wire [3:0]    io_irqFall_valid,
  input  wire [3:0]    io_irqFall_pending,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire       [3:0]    io_gpio_pins_read_buffercc_io_dataOut;
  wire       [3:0]    io_gpio_pins_read_buffercc_1_io_dataOut;
  wire       [3:0]    synchronized;
  reg        [3:0]    last;

  BufferCC_2 io_gpio_pins_read_buffercc (
    .io_dataIn  (io_gpio_pins_read[3:0]                    ), //i
    .io_dataOut (io_gpio_pins_read_buffercc_io_dataOut[3:0]), //o
    ._zz_1      (_zz_1                                     ), //i
    ._zz_2      (_zz_2                                     )  //i
  );
  BufferCC_3 io_gpio_pins_read_buffercc_1 (
    .io_dataIn  (io_gpio_pins_read[3:0]                      ), //i
    .io_dataOut (io_gpio_pins_read_buffercc_1_io_dataOut[3:0]), //o
    ._zz_1      (_zz_1                                       ), //i
    ._zz_2      (_zz_2                                       )  //i
  );
  assign io_value = io_gpio_pins_read_buffercc_io_dataOut;
  assign io_gpio_pins_write = io_config_write;
  assign io_gpio_pins_writeEnable = io_config_direction;
  assign synchronized = io_gpio_pins_read_buffercc_1_io_dataOut;
  assign io_irqHigh_valid = synchronized;
  assign io_irqLow_valid = (~ synchronized);
  assign io_irqRise_valid = (synchronized & (~ last));
  assign io_irqFall_valid = ((~ synchronized) & last);
  assign io_interrupt = (|(((io_irqHigh_pending | io_irqLow_pending) | io_irqRise_pending) | io_irqFall_pending));
  always @(posedge _zz_1) begin
    last <= synchronized;
  end


endmodule

module InterruptCtrl_4 (
  input  wire [1:0]    io_inputs,
  input  wire [1:0]    io_clears,
  input  wire [1:0]    io_masks,
  output wire [1:0]    io_pendings,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  reg        [1:0]    pendings;

  assign io_pendings = (pendings & io_masks);
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      pendings <= 2'b00;
    end else begin
      pendings <= ((pendings & (~ io_clears)) | io_inputs);
    end
  end


endmodule

//StreamFifo_1 replaced by StreamFifo

module StreamFifo (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [8:0]    io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [8:0]    io_pop_payload,
  input  wire          io_flush,
  output wire [6:0]    io_occupancy,
  output wire [6:0]    io_availability,
  input  wire          _zz_4,
  input  wire          _zz_5
);

  reg        [8:0]    _zz_logic_ram_port1;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [6:0]    logic_ptr_push;
  reg        [6:0]    logic_ptr_pop;
  wire       [6:0]    logic_ptr_occupancy;
  wire       [6:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [5:0]    logic_push_onRam_write_payload_address;
  wire       [8:0]    logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [5:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [5:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [5:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [5:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [8:0]    logic_pop_sync_readPort_rsp;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [8:0]    logic_pop_sync_readArbitation_translated_payload;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [6:0]    logic_pop_sync_popReg;
  reg [8:0] logic_ram [0:63];

  always @(posedge _zz_4) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= logic_push_onRam_write_payload_data;
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 7'h40) == 7'h00);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[5:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[5:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign logic_pop_sync_readPort_rsp = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload = logic_pop_sync_readPort_rsp;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload = logic_pop_sync_readArbitation_translated_payload;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (7'h40 - logic_ptr_occupancy);
  always @(posedge _zz_4) begin
    if(!_zz_5) begin
      logic_ptr_push <= 7'h00;
      logic_ptr_pop <= 7'h00;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 7'h00;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 7'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 7'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 7'h00;
        logic_ptr_pop <= 7'h00;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 7'h00;
      end
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module UartCtrl (
  input  wire [19:0]   io_config_clockDivider,
  input  wire [1:0]    io_frameConfig_parity,
  input  wire [0:0]    io_frameConfig_stop,
  input  wire [3:0]    io_frameConfig_dataLength,
  output wire          io_uart_txd,
  input  wire          io_uart_rxd,
  input  wire          io_uart_cts,
  output wire          io_uart_rts,
  output wire          io_interrupt,
  input  wire [1:0]    io_pendingInterrupts,
  input  wire          io_write_valid,
  output wire          io_write_ready,
  input  wire [8:0]    io_write_payload,
  output wire          io_read_valid,
  input  wire          io_read_ready,
  output wire [8:0]    io_read_payload,
  input  wire          io_readIsFull,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam ParityType_NONE = 2'd0;
  localparam ParityType_EVEN = 2'd1;
  localparam ParityType_ODD = 2'd2;
  localparam StopType_ONE = 1'd0;
  localparam StopType_TWO = 1'd1;

  wire                tx_io_cts;
  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [8:0]    rx_io_read_payload;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  `ifndef SYNTHESIS
  reg [31:0] io_frameConfig_parity_string;
  reg [23:0] io_frameConfig_stop_string;
  `endif


  UartCtrlTx tx (
    .io_config_parity     (io_frameConfig_parity[1:0]    ), //i
    .io_config_stop       (io_frameConfig_stop           ), //i
    .io_config_dataLength (io_frameConfig_dataLength[3:0]), //i
    .io_samplingTick      (clockDivider_tick             ), //i
    .io_write_valid       (io_write_valid                ), //i
    .io_write_ready       (tx_io_write_ready             ), //o
    .io_write_payload     (io_write_payload[8:0]         ), //i
    .io_txd               (tx_io_txd                     ), //o
    .io_cts               (tx_io_cts                     ), //i
    ._zz_1                (_zz_1                         ), //i
    ._zz_2                (_zz_2                         )  //i
  );
  UartCtrlRx rx (
    .io_config_parity     (io_frameConfig_parity[1:0]    ), //i
    .io_config_stop       (io_frameConfig_stop           ), //i
    .io_config_dataLength (io_frameConfig_dataLength[3:0]), //i
    .io_samplingTick      (clockDivider_tick             ), //i
    .io_read_valid        (rx_io_read_valid              ), //o
    .io_read_ready        (io_read_ready                 ), //i
    .io_read_payload      (rx_io_read_payload[8:0]       ), //o
    .io_rxd               (io_uart_rxd                   ), //i
    ._zz_1                (_zz_1                         ), //i
    ._zz_2                (_zz_2                         )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_frameConfig_parity)
      ParityType_NONE : io_frameConfig_parity_string = "NONE";
      ParityType_EVEN : io_frameConfig_parity_string = "EVEN";
      ParityType_ODD : io_frameConfig_parity_string = "ODD ";
      default : io_frameConfig_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(io_frameConfig_stop)
      StopType_ONE : io_frameConfig_stop_string = "ONE";
      StopType_TWO : io_frameConfig_stop_string = "TWO";
      default : io_frameConfig_stop_string = "???";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h00000);
  assign io_interrupt = (|io_pendingInterrupts);
  assign io_write_ready = tx_io_write_ready;
  assign io_uart_txd = tx_io_txd;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_rts = io_readIsFull;
  assign tx_io_cts = (! io_uart_cts);
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      clockDivider_counter <= 20'h00000;
    end else begin
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick) begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module MachineTimerCtrl (
  input  wire [63:0]   io_config_compare,
  output wire [63:0]   io_counter,
  input  wire          io_clear,
  output wire          io_interrupt,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire       [63:0]   _zz_when_MachineTimerCtrl_l49;
  reg        [63:0]   counter;
  reg                 hit;
  reg                 lock;
  wire                when_MachineTimerCtrl_l43;
  wire                when_MachineTimerCtrl_l47;
  wire                when_MachineTimerCtrl_l49;

  assign _zz_when_MachineTimerCtrl_l49 = (counter - io_config_compare);
  assign io_counter = counter;
  assign when_MachineTimerCtrl_l43 = (! lock);
  assign when_MachineTimerCtrl_l47 = (io_clear || lock);
  assign when_MachineTimerCtrl_l49 = (! _zz_when_MachineTimerCtrl_l49[63]);
  assign io_interrupt = hit;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      counter <= 64'h0000000000000001;
      hit <= 1'b0;
      lock <= 1'b1;
    end else begin
      if(io_clear) begin
        lock <= 1'b0;
      end
      if(when_MachineTimerCtrl_l43) begin
        counter <= (counter + 64'h0000000000000001);
      end
      if(when_MachineTimerCtrl_l47) begin
        hit <= 1'b0;
      end else begin
        if(when_MachineTimerCtrl_l49) begin
          hit <= 1'b1;
        end
      end
    end
  end


endmodule

//StreamFifoLowLatency replaced by StreamFifoLowLatency_1

module StreamArbiter (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [19:0]   io_inputs_0_payload_addr,
  input  wire [3:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire          io_inputs_0_payload_write,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [19:0]   io_output_payload_addr,
  output wire [3:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire          io_output_payload_write,
  output wire [0:0]    io_chosenOH,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire       [1:0]    _zz__zz_maskProposal_0_2;
  wire       [1:0]    _zz__zz_maskProposal_0_2_1;
  wire       [0:0]    _zz__zz_maskProposal_0_2_2;
  wire       [0:0]    _zz_maskProposal_0_3;
  reg                 locked;
  wire                maskProposal_0;
  reg                 maskLocked_0;
  wire                maskRouted_0;
  wire       [0:0]    _zz_maskProposal_0;
  wire       [1:0]    _zz_maskProposal_0_1;
  wire       [1:0]    _zz_maskProposal_0_2;
  wire                io_output_fire;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = maskLocked_0;
  assign _zz__zz_maskProposal_0_2_1 = {1'd0, _zz__zz_maskProposal_0_2_2};
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[1 : 1] | _zz_maskProposal_0_2[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_maskProposal_0 = io_inputs_0_valid;
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_output_payload_write = io_inputs_0_payload_write;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamArbiter_1 (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [19:0]   io_inputs_0_payload_addr,
  input  wire [2:0]    io_inputs_0_payload_id,
  input  wire [3:0]    io_inputs_0_payload_region,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire [0:0]    io_inputs_0_payload_lock,
  input  wire [3:0]    io_inputs_0_payload_cache,
  input  wire [3:0]    io_inputs_0_payload_qos,
  input  wire [2:0]    io_inputs_0_payload_prot,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire [19:0]   io_inputs_1_payload_addr,
  input  wire [2:0]    io_inputs_1_payload_id,
  input  wire [3:0]    io_inputs_1_payload_region,
  input  wire [7:0]    io_inputs_1_payload_len,
  input  wire [2:0]    io_inputs_1_payload_size,
  input  wire [1:0]    io_inputs_1_payload_burst,
  input  wire [0:0]    io_inputs_1_payload_lock,
  input  wire [3:0]    io_inputs_1_payload_cache,
  input  wire [3:0]    io_inputs_1_payload_qos,
  input  wire [2:0]    io_inputs_1_payload_prot,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [19:0]   io_output_payload_addr,
  output wire [2:0]    io_output_payload_id,
  output wire [3:0]    io_output_payload_region,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire [0:0]    io_output_payload_lock,
  output wire [3:0]    io_output_payload_cache,
  output wire [3:0]    io_output_payload_qos,
  output wire [2:0]    io_output_payload_prot,
  output wire [0:0]    io_chosen,
  output wire [1:0]    io_chosenOH,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire       [3:0]    _zz__zz_maskProposal_0_2;
  wire       [3:0]    _zz__zz_maskProposal_0_2_1;
  wire       [1:0]    _zz__zz_maskProposal_0_2_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_0;
  wire       [3:0]    _zz_maskProposal_0_1;
  wire       [3:0]    _zz_maskProposal_0_2;
  wire       [1:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_0,maskLocked_1};
  assign _zz__zz_maskProposal_0_2_1 = {2'd0, _zz__zz_maskProposal_0_2_2};
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_0 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[3 : 2] | _zz_maskProposal_0_2[1 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_region = (maskRouted_0 ? io_inputs_0_payload_region : io_inputs_1_payload_region);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_output_payload_lock = (maskRouted_0 ? io_inputs_0_payload_lock : io_inputs_1_payload_lock);
  assign io_output_payload_cache = (maskRouted_0 ? io_inputs_0_payload_cache : io_inputs_1_payload_cache);
  assign io_output_payload_qos = (maskRouted_0 ? io_inputs_0_payload_qos : io_inputs_1_payload_qos);
  assign io_output_payload_prot = (maskRouted_0 ? io_inputs_0_payload_prot : io_inputs_1_payload_prot);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamFifoLowLatency_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [2:0]    fifo_io_occupancy;
  wire       [2:0]    fifo_io_availability;

  StreamFifo_6 fifo (
    .io_push_valid   (io_push_valid            ), //i
    .io_push_ready   (fifo_io_push_ready       ), //o
    .io_pop_valid    (fifo_io_pop_valid        ), //o
    .io_pop_ready    (io_pop_ready             ), //i
    .io_flush        (io_flush                 ), //i
    .io_occupancy    (fifo_io_occupancy[2:0]   ), //o
    .io_availability (fifo_io_availability[2:0]), //o
    ._zz_1           (_zz_1                    ), //i
    ._zz_2           (_zz_2                    )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

module StreamArbiter_2 (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [31:0]   io_inputs_0_payload_addr,
  input  wire [2:0]    io_inputs_0_payload_id,
  input  wire [3:0]    io_inputs_0_payload_region,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire [0:0]    io_inputs_0_payload_lock,
  input  wire [3:0]    io_inputs_0_payload_cache,
  input  wire [3:0]    io_inputs_0_payload_qos,
  input  wire [2:0]    io_inputs_0_payload_prot,
  input  wire          io_inputs_0_payload_write,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire [31:0]   io_inputs_1_payload_addr,
  input  wire [2:0]    io_inputs_1_payload_id,
  input  wire [3:0]    io_inputs_1_payload_region,
  input  wire [7:0]    io_inputs_1_payload_len,
  input  wire [2:0]    io_inputs_1_payload_size,
  input  wire [1:0]    io_inputs_1_payload_burst,
  input  wire [0:0]    io_inputs_1_payload_lock,
  input  wire [3:0]    io_inputs_1_payload_cache,
  input  wire [3:0]    io_inputs_1_payload_qos,
  input  wire [2:0]    io_inputs_1_payload_prot,
  input  wire          io_inputs_1_payload_write,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [31:0]   io_output_payload_addr,
  output wire [2:0]    io_output_payload_id,
  output wire [3:0]    io_output_payload_region,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire [0:0]    io_output_payload_lock,
  output wire [3:0]    io_output_payload_cache,
  output wire [3:0]    io_output_payload_qos,
  output wire [2:0]    io_output_payload_prot,
  output wire          io_output_payload_write,
  output wire [0:0]    io_chosen,
  output wire [1:0]    io_chosenOH,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire       [3:0]    _zz__zz_maskProposal_0_2;
  wire       [3:0]    _zz__zz_maskProposal_0_2_1;
  wire       [1:0]    _zz__zz_maskProposal_0_2_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_0;
  wire       [3:0]    _zz_maskProposal_0_1;
  wire       [3:0]    _zz_maskProposal_0_2;
  wire       [1:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_0,maskLocked_1};
  assign _zz__zz_maskProposal_0_2_1 = {2'd0, _zz__zz_maskProposal_0_2_2};
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_0 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[3 : 2] | _zz_maskProposal_0_2[1 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_region = (maskRouted_0 ? io_inputs_0_payload_region : io_inputs_1_payload_region);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_output_payload_lock = (maskRouted_0 ? io_inputs_0_payload_lock : io_inputs_1_payload_lock);
  assign io_output_payload_cache = (maskRouted_0 ? io_inputs_0_payload_cache : io_inputs_1_payload_cache);
  assign io_output_payload_qos = (maskRouted_0 ? io_inputs_0_payload_qos : io_inputs_1_payload_qos);
  assign io_output_payload_prot = (maskRouted_0 ? io_inputs_0_payload_prot : io_inputs_1_payload_prot);
  assign io_output_payload_write = (maskRouted_0 ? io_inputs_0_payload_write : io_inputs_1_payload_write);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module Axi4SharedErrorSlave (
  input  wire          io_axi_arw_valid,
  output wire          io_axi_arw_ready,
  input  wire [31:0]   io_axi_arw_payload_addr,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [3:0]    io_axi_arw_payload_cache,
  input  wire [2:0]    io_axi_arw_payload_prot,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [1:0]    io_axi_b_payload_resp,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  reg                 consumeData;
  reg                 sendReadRsp;
  reg                 sendWriteRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_arw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4ErrorSlave_l92;
  wire                io_axi_b_fire;

  assign remainingZero = (remaining == 8'h00);
  assign io_axi_arw_ready = (! ((consumeData || sendWriteRsp) || sendReadRsp));
  assign io_axi_arw_fire = (io_axi_arw_valid && io_axi_arw_ready);
  assign io_axi_w_ready = consumeData;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4ErrorSlave_l92 = (io_axi_w_fire && io_axi_w_payload_last);
  assign io_axi_b_valid = sendWriteRsp;
  assign io_axi_b_payload_resp = 2'b11;
  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  assign io_axi_r_valid = sendReadRsp;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      consumeData <= 1'b0;
      sendReadRsp <= 1'b0;
      sendWriteRsp <= 1'b0;
    end else begin
      if(io_axi_arw_fire) begin
        consumeData <= io_axi_arw_payload_write;
        sendReadRsp <= (! io_axi_arw_payload_write);
      end
      if(when_Axi4ErrorSlave_l92) begin
        consumeData <= 1'b0;
        sendWriteRsp <= 1'b1;
      end
      if(io_axi_b_fire) begin
        sendWriteRsp <= 1'b0;
      end
      if(sendReadRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendReadRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge _zz_1) begin
    if(io_axi_arw_fire) begin
      remaining <= 8'h00;
    end
    if(sendReadRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module Axi4ReadOnlyErrorSlave (
  input  wire          io_axi_ar_valid,
  output wire          io_axi_ar_ready,
  input  wire [31:0]   io_axi_ar_payload_addr,
  input  wire [3:0]    io_axi_ar_payload_cache,
  input  wire [2:0]    io_axi_ar_payload_prot,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  reg                 sendRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_ar_fire;

  assign remainingZero = (remaining == 8'h00);
  assign io_axi_ar_ready = (! sendRsp);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = sendRsp;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_ar_fire) begin
        sendRsp <= 1'b1;
      end
      if(sendRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge _zz_1) begin
    if(io_axi_ar_fire) begin
      remaining <= 8'h00;
    end
    if(sendRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module SpiControllerCtrl_1 (
  input  wire          io_bus_ar_valid,
  output reg           io_bus_ar_ready,
  input  wire [19:0]   io_bus_ar_payload_addr,
  input  wire [3:0]    io_bus_ar_payload_id,
  input  wire [3:0]    io_bus_ar_payload_region,
  input  wire [7:0]    io_bus_ar_payload_len,
  input  wire [2:0]    io_bus_ar_payload_size,
  input  wire [1:0]    io_bus_ar_payload_burst,
  input  wire [0:0]    io_bus_ar_payload_lock,
  input  wire [3:0]    io_bus_ar_payload_cache,
  input  wire [3:0]    io_bus_ar_payload_qos,
  input  wire [2:0]    io_bus_ar_payload_prot,
  output reg           io_bus_r_valid,
  input  wire          io_bus_r_ready,
  output wire [31:0]   io_bus_r_payload_data,
  output wire [3:0]    io_bus_r_payload_id,
  output wire [1:0]    io_bus_r_payload_resp,
  output reg           io_bus_r_payload_last,
  output wire          io_cmd_valid,
  input  wire          io_cmd_ready,
  output wire [0:0]    io_cmd_payload_mode,
  output wire [8:0]    io_cmd_payload_args,
  input  wire          io_rsp_valid,
  input  wire [7:0]    io_rsp_payload,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam CmdMode_1_DATA = 1'd0;
  localparam CmdMode_1_CS = 1'd1;
  localparam State_IDLE = 3'd0;
  localparam State_ENABLESPI = 3'd1;
  localparam State_COMMAND = 3'd2;
  localparam State_ADDRESS = 3'd3;
  localparam State_DATA = 3'd4;
  localparam State_DISABLESPI = 3'd5;

  reg                 rspFifo_io_pop_ready;
  wire                rspFifo_io_flush;
  wire                rspFifo_io_push_ready;
  wire                rspFifo_io_pop_valid;
  wire       [7:0]    rspFifo_io_pop_payload;
  wire       [4:0]    rspFifo_io_occupancy;
  wire       [4:0]    rspFifo_io_availability;
  wire       [5:0]    _zz_rspHandler_data;
  wire       [0:0]    _zz_cmdStream_payload_args;
  wire       [5:0]    _zz_cmdStream_payload_args_1;
  wire       [0:0]    _zz_cmdStream_payload_args_2;
  reg                 cmdStream_valid;
  wire                cmdStream_ready;
  reg        [0:0]    cmdStream_payload_mode;
  reg        [8:0]    cmdStream_payload_args;
  reg        [23:0]   burst_address;
  reg        [7:0]    burst_count;
  reg        [7:0]    burst_countResponse;
  reg        [2:0]    burst_size;
  reg        [1:0]    burst_burstType;
  reg        [3:0]    burst_id;
  reg        [31:0]   rspHandler_data;
  reg        [1:0]    rspHandler_counter;
  reg                 rspHandler_push;
  wire                when_SpiXipControllerCtrl_l53;
  wire                when_SpiXipControllerCtrl_l57;
  wire                when_SpiXipControllerCtrl_l63;
  wire                io_bus_r_fire;
  reg        [2:0]    stateMachine_state;
  reg        [1:0]    stateMachine_counter_value;
  wire                when_SpiXipControllerCtrl_l134;
  wire                when_SpiXipControllerCtrl_l152;
  wire                when_SpiXipControllerCtrl_l155;
  `ifndef SYNTHESIS
  reg [31:0] io_cmd_payload_mode_string;
  reg [31:0] cmdStream_payload_mode_string;
  reg [79:0] stateMachine_state_string;
  `endif


  assign _zz_rspHandler_data = (4'b1000 * rspHandler_counter);
  assign _zz_cmdStream_payload_args = 1'b1;
  assign _zz_cmdStream_payload_args_1 = (4'b1000 * stateMachine_counter_value);
  assign _zz_cmdStream_payload_args_2 = 1'b0;
  StreamFifo_7 rspFifo (
    .io_push_valid   (io_rsp_valid                ), //i
    .io_push_ready   (rspFifo_io_push_ready       ), //o
    .io_push_payload (io_rsp_payload[7:0]         ), //i
    .io_pop_valid    (rspFifo_io_pop_valid        ), //o
    .io_pop_ready    (rspFifo_io_pop_ready        ), //i
    .io_pop_payload  (rspFifo_io_pop_payload[7:0] ), //o
    .io_flush        (rspFifo_io_flush            ), //i
    .io_occupancy    (rspFifo_io_occupancy[4:0]   ), //o
    .io_availability (rspFifo_io_availability[4:0]), //o
    ._zz_4           (_zz_1                       ), //i
    ._zz_5           (_zz_2                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cmd_payload_mode)
      CmdMode_1_DATA : io_cmd_payload_mode_string = "DATA";
      CmdMode_1_CS : io_cmd_payload_mode_string = "CS  ";
      default : io_cmd_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(cmdStream_payload_mode)
      CmdMode_1_DATA : cmdStream_payload_mode_string = "DATA";
      CmdMode_1_CS : cmdStream_payload_mode_string = "CS  ";
      default : cmdStream_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      State_IDLE : stateMachine_state_string = "IDLE      ";
      State_ENABLESPI : stateMachine_state_string = "ENABLESPI ";
      State_COMMAND : stateMachine_state_string = "COMMAND   ";
      State_ADDRESS : stateMachine_state_string = "ADDRESS   ";
      State_DATA : stateMachine_state_string = "DATA      ";
      State_DISABLESPI : stateMachine_state_string = "DISABLESPI";
      default : stateMachine_state_string = "??????????";
    endcase
  end
  `endif

  always @(*) begin
    cmdStream_valid = 1'b0;
    case(stateMachine_state)
      State_IDLE : begin
      end
      State_ENABLESPI : begin
        cmdStream_valid = 1'b1;
      end
      State_COMMAND : begin
        cmdStream_valid = 1'b1;
      end
      State_ADDRESS : begin
        cmdStream_valid = 1'b1;
      end
      State_DATA : begin
        cmdStream_valid = 1'b1;
      end
      default : begin
        cmdStream_valid = 1'b1;
      end
    endcase
  end

  always @(*) begin
    cmdStream_payload_mode = CmdMode_1_DATA;
    case(stateMachine_state)
      State_IDLE : begin
      end
      State_ENABLESPI : begin
        cmdStream_payload_mode = CmdMode_1_CS;
      end
      State_COMMAND : begin
        cmdStream_payload_mode = CmdMode_1_DATA;
      end
      State_ADDRESS : begin
        cmdStream_payload_mode = CmdMode_1_DATA;
      end
      State_DATA : begin
        cmdStream_payload_mode = CmdMode_1_DATA;
      end
      default : begin
        cmdStream_payload_mode = CmdMode_1_CS;
      end
    endcase
  end

  always @(*) begin
    cmdStream_payload_args = 9'h000;
    case(stateMachine_state)
      State_IDLE : begin
      end
      State_ENABLESPI : begin
        cmdStream_payload_args = {8'd0, _zz_cmdStream_payload_args};
      end
      State_COMMAND : begin
        cmdStream_payload_args = {1'b0,8'h03};
      end
      State_ADDRESS : begin
        cmdStream_payload_args = {1'b0,burst_address[_zz_cmdStream_payload_args_1 +: 8]};
      end
      State_DATA : begin
        cmdStream_payload_args = {1'b1,8'h00};
      end
      default : begin
        cmdStream_payload_args = {8'd0, _zz_cmdStream_payload_args_2};
      end
    endcase
  end

  assign io_cmd_valid = cmdStream_valid;
  assign cmdStream_ready = io_cmd_ready;
  assign io_cmd_payload_mode = cmdStream_payload_mode;
  assign io_cmd_payload_args = cmdStream_payload_args;
  always @(*) begin
    io_bus_r_valid = 1'b0;
    if(rspHandler_push) begin
      io_bus_r_valid = 1'b1;
    end
  end

  assign io_bus_r_payload_resp = 2'b00;
  always @(*) begin
    io_bus_r_payload_last = 1'b0;
    if(rspHandler_push) begin
      if(when_SpiXipControllerCtrl_l63) begin
        io_bus_r_payload_last = 1'b1;
      end
    end
  end

  assign io_bus_r_payload_id = burst_id;
  always @(*) begin
    rspFifo_io_pop_ready = 1'b0;
    if(when_SpiXipControllerCtrl_l53) begin
      rspFifo_io_pop_ready = 1'b1;
    end
  end

  assign when_SpiXipControllerCtrl_l53 = (rspFifo_io_pop_valid && (! rspHandler_push));
  assign when_SpiXipControllerCtrl_l57 = (rspHandler_counter == 2'b11);
  assign when_SpiXipControllerCtrl_l63 = (burst_countResponse == 8'h00);
  assign io_bus_r_fire = (io_bus_r_valid && io_bus_r_ready);
  assign io_bus_r_payload_data = rspHandler_data;
  always @(*) begin
    io_bus_ar_ready = 1'b0;
    case(stateMachine_state)
      State_IDLE : begin
        if(io_bus_ar_valid) begin
          io_bus_ar_ready = 1'b1;
        end
      end
      State_ENABLESPI : begin
      end
      State_COMMAND : begin
      end
      State_ADDRESS : begin
      end
      State_DATA : begin
      end
      default : begin
      end
    endcase
  end

  assign when_SpiXipControllerCtrl_l134 = (stateMachine_counter_value == 2'b00);
  assign when_SpiXipControllerCtrl_l152 = (stateMachine_counter_value == 2'b00);
  assign when_SpiXipControllerCtrl_l155 = (burst_count == 8'h00);
  assign rspFifo_io_flush = 1'b0;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      rspHandler_counter <= 2'b00;
      rspHandler_push <= 1'b0;
      stateMachine_state <= State_IDLE;
    end else begin
      if(when_SpiXipControllerCtrl_l53) begin
        rspHandler_counter <= (rspHandler_counter + 2'b01);
        if(when_SpiXipControllerCtrl_l57) begin
          rspHandler_push <= 1'b1;
        end
      end
      if(rspHandler_push) begin
        if(io_bus_r_fire) begin
          rspHandler_push <= 1'b0;
        end
      end
      case(stateMachine_state)
        State_IDLE : begin
          if(io_bus_ar_valid) begin
            stateMachine_state <= State_ENABLESPI;
          end
        end
        State_ENABLESPI : begin
          if(cmdStream_ready) begin
            stateMachine_state <= State_COMMAND;
          end
        end
        State_COMMAND : begin
          if(cmdStream_ready) begin
            stateMachine_state <= State_ADDRESS;
          end
        end
        State_ADDRESS : begin
          if(cmdStream_ready) begin
            if(when_SpiXipControllerCtrl_l134) begin
              stateMachine_state <= State_DATA;
            end
          end
        end
        State_DATA : begin
          if(cmdStream_ready) begin
            if(when_SpiXipControllerCtrl_l152) begin
              if(when_SpiXipControllerCtrl_l155) begin
                stateMachine_state <= State_DISABLESPI;
              end
            end
          end
        end
        default : begin
          if(cmdStream_ready) begin
            stateMachine_state <= State_IDLE;
          end
        end
      endcase
    end
  end

  always @(posedge _zz_1) begin
    if(when_SpiXipControllerCtrl_l53) begin
      rspHandler_data[_zz_rspHandler_data +: 8] <= rspFifo_io_pop_payload;
    end
    if(rspHandler_push) begin
      if(io_bus_r_fire) begin
        burst_countResponse <= (burst_countResponse - 8'h01);
      end
    end
    case(stateMachine_state)
      State_IDLE : begin
        if(io_bus_ar_valid) begin
          burst_address <= {4'd0, io_bus_ar_payload_addr};
          burst_count <= io_bus_ar_payload_len;
          burst_countResponse <= io_bus_ar_payload_len;
          burst_size <= io_bus_ar_payload_size;
          burst_burstType <= io_bus_ar_payload_burst;
          burst_id <= io_bus_ar_payload_id;
        end
      end
      State_ENABLESPI : begin
      end
      State_COMMAND : begin
        stateMachine_counter_value <= 2'b10;
      end
      State_ADDRESS : begin
        if(cmdStream_ready) begin
          if(when_SpiXipControllerCtrl_l134) begin
            stateMachine_counter_value <= 2'b11;
          end else begin
            stateMachine_counter_value <= (stateMachine_counter_value - 2'b01);
          end
        end
      end
      State_DATA : begin
        if(cmdStream_ready) begin
          if(when_SpiXipControllerCtrl_l152) begin
            stateMachine_counter_value <= 2'b11;
            burst_count <= (burst_count - 8'h01);
          end else begin
            stateMachine_counter_value <= (stateMachine_counter_value - 2'b01);
          end
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module SpiControllerCtrl (
  input  wire [15:0]   io_config_clockDivider,
  input  wire [0:0]    io_config_cs_activeHigh,
  input  wire [15:0]   io_config_cs_setup,
  input  wire [15:0]   io_config_cs_hold,
  input  wire [15:0]   io_config_cs_disable,
  input  wire          io_modeConfig_cpol,
  input  wire          io_modeConfig_cpha,
  output wire [0:0]    io_spi_cs,
  output wire          io_spi_sclk,
  input  wire [1:0]    io_spi_dq_read,
  output reg  [1:0]    io_spi_dq_write,
  output reg  [1:0]    io_spi_dq_writeEnable,
  output wire          io_interrupt,
  input  wire [1:0]    io_pendingInterrupts,
  input  wire          io_cmd_valid,
  output reg           io_cmd_ready,
  input  wire [0:0]    io_cmd_payload_mode,
  input  wire [8:0]    io_cmd_payload_args,
  output wire          io_rsp_valid,
  output wire [7:0]    io_rsp_payload,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam CmdMode_1_DATA = 1'd0;
  localparam CmdMode_1_CS = 1'd1;

  wire       [3:0]    _zz_fsm_counter_valueNext;
  wire       [0:0]    _zz_fsm_counter_valueNext_1;
  wire       [8:0]    _zz_fsm_buffer;
  wire                _zz_when;
  wire       [7:0]    _zz__zz_io_spi_dq_write;
  wire       [2:0]    _zz__zz_io_spi_dq_write_1;
  wire       [2:0]    _zz__zz_io_spi_dq_write_2;
  reg        [15:0]   timer_counter;
  reg                 timer_reset;
  wire                timer_cs_setupHit;
  wire                timer_cs_holdHit;
  wire                timer_cs_disableHit;
  wire                timer_clockDividerHit;
  reg                 fsm_counter_willIncrement;
  wire                fsm_counter_willClear;
  reg        [3:0]    fsm_counter_valueNext;
  reg        [3:0]    fsm_counter_value;
  wire                fsm_counter_willOverflowIfInc;
  wire                fsm_counter_willOverflow;
  reg        [7:0]    fsm_buffer;
  reg        [0:0]    fsm_cs;
  wire                when_SpiControllerCtrl_l62;
  wire                when_SpiControllerCtrl_l67;
  wire                when_SpiControllerCtrl_l78;
  wire                io_cmd_fire;
  reg                 _zz_io_rsp_valid;
  wire                when_SpiControllerCtrl_l102;
  reg                 _zz_io_spi_sclk;
  reg                 _zz_io_spi_dq_write;
  `ifndef SYNTHESIS
  reg [31:0] io_cmd_payload_mode_string;
  `endif

  function [1:0] zz_io_spi_dq_writeEnable(input dummy);
    begin
      zz_io_spi_dq_writeEnable[0] = 1'b1;
      zz_io_spi_dq_writeEnable[1] = 1'b0;
    end
  endfunction
  wire [1:0] _zz_3;

  assign _zz_when = io_cmd_payload_args[0];
  assign _zz_fsm_counter_valueNext_1 = fsm_counter_willIncrement;
  assign _zz_fsm_counter_valueNext = {3'd0, _zz_fsm_counter_valueNext_1};
  assign _zz_fsm_buffer = {fsm_buffer,io_spi_dq_read[1]};
  assign _zz__zz_io_spi_dq_write = io_cmd_payload_args[7 : 0];
  assign _zz__zz_io_spi_dq_write_1 = (3'b111 - _zz__zz_io_spi_dq_write_2);
  assign _zz__zz_io_spi_dq_write_2 = (fsm_counter_value >>> 1'd1);
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cmd_payload_mode)
      CmdMode_1_DATA : io_cmd_payload_mode_string = "DATA";
      CmdMode_1_CS : io_cmd_payload_mode_string = "CS  ";
      default : io_cmd_payload_mode_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    timer_reset = 1'b0;
    if(io_cmd_valid) begin
      if(when_SpiControllerCtrl_l62) begin
        if(timer_clockDividerHit) begin
          timer_reset = 1'b1;
        end
      end else begin
        if(!_zz_when) begin
          if(when_SpiControllerCtrl_l78) begin
            if(timer_cs_holdHit) begin
              timer_reset = 1'b1;
            end
          end
        end
      end
    end
    if(when_SpiControllerCtrl_l102) begin
      timer_reset = 1'b1;
    end
  end

  assign timer_cs_setupHit = (timer_counter == io_config_cs_setup);
  assign timer_cs_holdHit = (timer_counter == io_config_cs_hold);
  assign timer_cs_disableHit = (timer_counter == io_config_cs_disable);
  assign timer_clockDividerHit = (timer_counter == io_config_clockDivider);
  always @(*) begin
    fsm_counter_willIncrement = 1'b0;
    if(io_cmd_valid) begin
      if(when_SpiControllerCtrl_l62) begin
        if(timer_clockDividerHit) begin
          fsm_counter_willIncrement = 1'b1;
        end
      end else begin
        if(!_zz_when) begin
          if(when_SpiControllerCtrl_l78) begin
            if(timer_cs_holdHit) begin
              fsm_counter_willIncrement = 1'b1;
            end
          end
        end
      end
    end
  end

  assign fsm_counter_willClear = 1'b0;
  assign fsm_counter_willOverflowIfInc = (fsm_counter_value == 4'b1111);
  assign fsm_counter_willOverflow = (fsm_counter_willOverflowIfInc && fsm_counter_willIncrement);
  always @(*) begin
    fsm_counter_valueNext = (fsm_counter_value + _zz_fsm_counter_valueNext);
    if(fsm_counter_willClear) begin
      fsm_counter_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    io_cmd_ready = 1'b0;
    if(io_cmd_valid) begin
      if(when_SpiControllerCtrl_l62) begin
        if(timer_clockDividerHit) begin
          io_cmd_ready = fsm_counter_willOverflowIfInc;
        end
      end else begin
        if(_zz_when) begin
          if(timer_cs_setupHit) begin
            io_cmd_ready = 1'b1;
          end
        end else begin
          if(!when_SpiControllerCtrl_l78) begin
            if(timer_cs_disableHit) begin
              io_cmd_ready = 1'b1;
            end
          end
        end
      end
    end
  end

  assign when_SpiControllerCtrl_l62 = (io_cmd_payload_mode == CmdMode_1_DATA);
  assign when_SpiControllerCtrl_l67 = fsm_counter_value[0];
  assign when_SpiControllerCtrl_l78 = (! fsm_counter_value[0]);
  assign io_cmd_fire = (io_cmd_valid && io_cmd_ready);
  assign io_rsp_valid = _zz_io_rsp_valid;
  assign io_rsp_payload = fsm_buffer;
  assign when_SpiControllerCtrl_l102 = ((! io_cmd_valid) || io_cmd_ready);
  assign io_spi_cs = (fsm_cs ^ io_config_cs_activeHigh);
  assign io_spi_sclk = _zz_io_spi_sclk;
  always @(*) begin
    io_spi_dq_write[0] = _zz_io_spi_dq_write;
    io_spi_dq_write[1] = 1'b0;
  end

  assign _zz_3 = zz_io_spi_dq_writeEnable(1'b0);
  always @(*) io_spi_dq_writeEnable = _zz_3;
  assign io_interrupt = (|io_pendingInterrupts);
  always @(posedge _zz_1) begin
    timer_counter <= (timer_counter + 16'h0001);
    if(timer_reset) begin
      timer_counter <= 16'h0000;
    end
    if(io_cmd_valid) begin
      if(when_SpiControllerCtrl_l62) begin
        if(timer_clockDividerHit) begin
          if(when_SpiControllerCtrl_l67) begin
            fsm_buffer <= _zz_fsm_buffer[7:0];
          end
        end
      end
    end
    _zz_io_spi_sclk <= (((io_cmd_valid && (io_cmd_payload_mode == CmdMode_1_DATA)) && (fsm_counter_value[0] ^ io_modeConfig_cpha)) ^ io_modeConfig_cpol);
    _zz_io_spi_dq_write <= _zz__zz_io_spi_dq_write[_zz__zz_io_spi_dq_write_1];
  end

  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      fsm_counter_value <= 4'b0000;
      fsm_cs <= 1'b1;
      _zz_io_rsp_valid <= 1'b0;
    end else begin
      fsm_counter_value <= fsm_counter_valueNext;
      if(io_cmd_valid) begin
        if(!when_SpiControllerCtrl_l62) begin
          if(_zz_when) begin
            fsm_cs[0] <= 1'b0;
          end else begin
            if(!when_SpiControllerCtrl_l78) begin
              fsm_cs[0] <= 1'b1;
            end
          end
        end
      end
      _zz_io_rsp_valid <= ((io_cmd_fire && (io_cmd_payload_mode == CmdMode_1_DATA)) && io_cmd_payload_args[8]);
      if(when_SpiControllerCtrl_l102) begin
        fsm_counter_value <= 4'b0000;
      end
    end
  end


endmodule

module StreamFifo_3 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [7:0]    io_push_payload_data,
  input  wire          io_push_payload_last,
  input  wire          io_push_payload_error,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [7:0]    io_pop_payload_data,
  output wire          io_pop_payload_last,
  output wire          io_pop_payload_error,
  input  wire          io_flush,
  output wire [3:0]    io_occupancy,
  output wire [3:0]    io_availability,
  input  wire          _zz_4,
  input  wire          _zz_5
);

  reg        [9:0]    _zz_logic_ram_port1;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter_1;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_2;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter_3;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_4;
  wire       [9:0]    _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [3:0]    logic_ptr_push;
  reg        [3:0]    logic_ptr_pop;
  wire       [3:0]    logic_ptr_occupancy;
  wire       [3:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                when_Stream_l1240;
  wire                when_Stream_l1244;
  reg        [3:0]    logic_ptr_notPow2_counter;
  wire                io_push_fire;
  wire                io_pop_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [7:0]    logic_push_onRam_write_payload_data_data;
  wire                logic_push_onRam_write_payload_data_last;
  wire                logic_push_onRam_write_payload_data_error;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [3:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [7:0]    logic_pop_sync_readPort_rsp_data;
  wire                logic_pop_sync_readPort_rsp_last;
  wire                logic_pop_sync_readPort_rsp_error;
  wire       [9:0]    _zz_logic_pop_sync_readPort_rsp_data;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [7:0]    logic_pop_sync_readArbitation_translated_payload_data;
  wire                logic_pop_sync_readArbitation_translated_payload_last;
  wire                logic_pop_sync_readArbitation_translated_payload_error;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [3:0]    logic_pop_sync_popReg;
  reg [9:0] logic_ram [0:11];

  assign _zz_logic_ptr_notPow2_counter = (logic_ptr_notPow2_counter + _zz_logic_ptr_notPow2_counter_1);
  assign _zz_logic_ptr_notPow2_counter_2 = io_push_fire;
  assign _zz_logic_ptr_notPow2_counter_1 = {3'd0, _zz_logic_ptr_notPow2_counter_2};
  assign _zz_logic_ptr_notPow2_counter_4 = io_pop_fire;
  assign _zz_logic_ptr_notPow2_counter_3 = {3'd0, _zz_logic_ptr_notPow2_counter_4};
  assign _zz_logic_ram_port = {logic_push_onRam_write_payload_data_error,{logic_push_onRam_write_payload_data_last,logic_push_onRam_write_payload_data_data}};
  always @(posedge _zz_4) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = ((logic_ptr_push == logic_ptr_popOnIo) && logic_ptr_wentUp);
  assign logic_ptr_empty = ((logic_ptr_push == logic_ptr_pop) && (! logic_ptr_wentUp));
  assign when_Stream_l1240 = (logic_ptr_push == 4'b1011);
  assign when_Stream_l1244 = (logic_ptr_pop == 4'b1011);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign logic_ptr_occupancy = logic_ptr_notPow2_counter;
  assign io_push_ready = (! logic_ptr_full);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push;
  assign logic_push_onRam_write_payload_data_data = io_push_payload_data;
  assign logic_push_onRam_write_payload_data_last = io_push_payload_last;
  assign logic_push_onRam_write_payload_data_error = io_push_payload_error;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop;
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_data = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_rsp_data = _zz_logic_pop_sync_readPort_rsp_data[7 : 0];
  assign logic_pop_sync_readPort_rsp_last = _zz_logic_pop_sync_readPort_rsp_data[8];
  assign logic_pop_sync_readPort_rsp_error = _zz_logic_pop_sync_readPort_rsp_data[9];
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload_data = logic_pop_sync_readPort_rsp_data;
  assign logic_pop_sync_readArbitation_translated_payload_last = logic_pop_sync_readPort_rsp_last;
  assign logic_pop_sync_readArbitation_translated_payload_error = logic_pop_sync_readPort_rsp_error;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_data = logic_pop_sync_readArbitation_translated_payload_data;
  assign io_pop_payload_last = logic_pop_sync_readArbitation_translated_payload_last;
  assign io_pop_payload_error = logic_pop_sync_readArbitation_translated_payload_error;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (4'b1100 - logic_ptr_occupancy);
  always @(posedge _zz_4) begin
    if(!_zz_5) begin
      logic_ptr_push <= 4'b0000;
      logic_ptr_pop <= 4'b0000;
      logic_ptr_wentUp <= 1'b0;
      logic_ptr_notPow2_counter <= 4'b0000;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 4'b0000;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 4'b0001);
        if(when_Stream_l1240) begin
          logic_ptr_push <= 4'b0000;
        end
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 4'b0001);
        if(when_Stream_l1244) begin
          logic_ptr_pop <= 4'b0000;
        end
      end
      if(io_flush) begin
        logic_ptr_push <= 4'b0000;
        logic_ptr_pop <= 4'b0000;
      end
      logic_ptr_notPow2_counter <= (_zz_logic_ptr_notPow2_counter - _zz_logic_ptr_notPow2_counter_3);
      if(io_flush) begin
        logic_ptr_notPow2_counter <= 4'b0000;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 4'b0000;
      end
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module StreamFifo_2 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [1:0]    io_push_payload_mode,
  input  wire [9:0]    io_push_payload_args,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [1:0]    io_pop_payload_mode,
  output wire [9:0]    io_pop_payload_args,
  input  wire          io_flush,
  output wire [3:0]    io_occupancy,
  output wire [3:0]    io_availability,
  input  wire          _zz_4,
  input  wire          _zz_5
);
  localparam CmdMode_CS = 2'd0;
  localparam CmdMode_ADDR = 2'd1;
  localparam CmdMode_DATA = 2'd2;

  reg        [11:0]   _zz_logic_ram_port1;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter_1;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_2;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter_3;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_4;
  wire       [11:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [3:0]    logic_ptr_push;
  reg        [3:0]    logic_ptr_pop;
  wire       [3:0]    logic_ptr_occupancy;
  wire       [3:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                when_Stream_l1240;
  wire                when_Stream_l1244;
  reg        [3:0]    logic_ptr_notPow2_counter;
  wire                io_push_fire;
  wire                io_pop_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [1:0]    logic_push_onRam_write_payload_data_mode;
  wire       [9:0]    logic_push_onRam_write_payload_data_args;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [3:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [1:0]    logic_pop_sync_readPort_rsp_mode;
  wire       [9:0]    logic_pop_sync_readPort_rsp_args;
  wire       [1:0]    _zz_logic_pop_sync_readPort_rsp_mode;
  wire       [11:0]   _zz_logic_pop_sync_readPort_rsp_args;
  wire       [1:0]    _zz_logic_pop_sync_readPort_rsp_mode_1;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [1:0]    logic_pop_sync_readArbitation_translated_payload_mode;
  wire       [9:0]    logic_pop_sync_readArbitation_translated_payload_args;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [3:0]    logic_pop_sync_popReg;
  `ifndef SYNTHESIS
  reg [31:0] io_push_payload_mode_string;
  reg [31:0] io_pop_payload_mode_string;
  reg [31:0] logic_push_onRam_write_payload_data_mode_string;
  reg [31:0] logic_pop_sync_readPort_rsp_mode_string;
  reg [31:0] _zz_logic_pop_sync_readPort_rsp_mode_string;
  reg [31:0] _zz_logic_pop_sync_readPort_rsp_mode_1_string;
  reg [31:0] logic_pop_sync_readArbitation_translated_payload_mode_string;
  `endif

  reg [11:0] logic_ram [0:11];

  assign _zz_logic_ptr_notPow2_counter = (logic_ptr_notPow2_counter + _zz_logic_ptr_notPow2_counter_1);
  assign _zz_logic_ptr_notPow2_counter_2 = io_push_fire;
  assign _zz_logic_ptr_notPow2_counter_1 = {3'd0, _zz_logic_ptr_notPow2_counter_2};
  assign _zz_logic_ptr_notPow2_counter_4 = io_pop_fire;
  assign _zz_logic_ptr_notPow2_counter_3 = {3'd0, _zz_logic_ptr_notPow2_counter_4};
  assign _zz_logic_ram_port = {logic_push_onRam_write_payload_data_args,logic_push_onRam_write_payload_data_mode};
  always @(posedge _zz_4) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(io_push_payload_mode)
      CmdMode_CS : io_push_payload_mode_string = "CS  ";
      CmdMode_ADDR : io_push_payload_mode_string = "ADDR";
      CmdMode_DATA : io_push_payload_mode_string = "DATA";
      default : io_push_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(io_pop_payload_mode)
      CmdMode_CS : io_pop_payload_mode_string = "CS  ";
      CmdMode_ADDR : io_pop_payload_mode_string = "ADDR";
      CmdMode_DATA : io_pop_payload_mode_string = "DATA";
      default : io_pop_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(logic_push_onRam_write_payload_data_mode)
      CmdMode_CS : logic_push_onRam_write_payload_data_mode_string = "CS  ";
      CmdMode_ADDR : logic_push_onRam_write_payload_data_mode_string = "ADDR";
      CmdMode_DATA : logic_push_onRam_write_payload_data_mode_string = "DATA";
      default : logic_push_onRam_write_payload_data_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(logic_pop_sync_readPort_rsp_mode)
      CmdMode_CS : logic_pop_sync_readPort_rsp_mode_string = "CS  ";
      CmdMode_ADDR : logic_pop_sync_readPort_rsp_mode_string = "ADDR";
      CmdMode_DATA : logic_pop_sync_readPort_rsp_mode_string = "DATA";
      default : logic_pop_sync_readPort_rsp_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_logic_pop_sync_readPort_rsp_mode)
      CmdMode_CS : _zz_logic_pop_sync_readPort_rsp_mode_string = "CS  ";
      CmdMode_ADDR : _zz_logic_pop_sync_readPort_rsp_mode_string = "ADDR";
      CmdMode_DATA : _zz_logic_pop_sync_readPort_rsp_mode_string = "DATA";
      default : _zz_logic_pop_sync_readPort_rsp_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_logic_pop_sync_readPort_rsp_mode_1)
      CmdMode_CS : _zz_logic_pop_sync_readPort_rsp_mode_1_string = "CS  ";
      CmdMode_ADDR : _zz_logic_pop_sync_readPort_rsp_mode_1_string = "ADDR";
      CmdMode_DATA : _zz_logic_pop_sync_readPort_rsp_mode_1_string = "DATA";
      default : _zz_logic_pop_sync_readPort_rsp_mode_1_string = "????";
    endcase
  end
  always @(*) begin
    case(logic_pop_sync_readArbitation_translated_payload_mode)
      CmdMode_CS : logic_pop_sync_readArbitation_translated_payload_mode_string = "CS  ";
      CmdMode_ADDR : logic_pop_sync_readArbitation_translated_payload_mode_string = "ADDR";
      CmdMode_DATA : logic_pop_sync_readArbitation_translated_payload_mode_string = "DATA";
      default : logic_pop_sync_readArbitation_translated_payload_mode_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = ((logic_ptr_push == logic_ptr_popOnIo) && logic_ptr_wentUp);
  assign logic_ptr_empty = ((logic_ptr_push == logic_ptr_pop) && (! logic_ptr_wentUp));
  assign when_Stream_l1240 = (logic_ptr_push == 4'b1011);
  assign when_Stream_l1244 = (logic_ptr_pop == 4'b1011);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign logic_ptr_occupancy = logic_ptr_notPow2_counter;
  assign io_push_ready = (! logic_ptr_full);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push;
  assign logic_push_onRam_write_payload_data_mode = io_push_payload_mode;
  assign logic_push_onRam_write_payload_data_args = io_push_payload_args;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop;
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_args = _zz_logic_ram_port1;
  assign _zz_logic_pop_sync_readPort_rsp_mode_1 = _zz_logic_pop_sync_readPort_rsp_args[1 : 0];
  assign _zz_logic_pop_sync_readPort_rsp_mode = _zz_logic_pop_sync_readPort_rsp_mode_1;
  assign logic_pop_sync_readPort_rsp_mode = _zz_logic_pop_sync_readPort_rsp_mode;
  assign logic_pop_sync_readPort_rsp_args = _zz_logic_pop_sync_readPort_rsp_args[11 : 2];
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload_mode = logic_pop_sync_readPort_rsp_mode;
  assign logic_pop_sync_readArbitation_translated_payload_args = logic_pop_sync_readPort_rsp_args;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_mode = logic_pop_sync_readArbitation_translated_payload_mode;
  assign io_pop_payload_args = logic_pop_sync_readArbitation_translated_payload_args;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (4'b1100 - logic_ptr_occupancy);
  always @(posedge _zz_4) begin
    if(!_zz_5) begin
      logic_ptr_push <= 4'b0000;
      logic_ptr_pop <= 4'b0000;
      logic_ptr_wentUp <= 1'b0;
      logic_ptr_notPow2_counter <= 4'b0000;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 4'b0000;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 4'b0001);
        if(when_Stream_l1240) begin
          logic_ptr_push <= 4'b0000;
        end
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 4'b0001);
        if(when_Stream_l1244) begin
          logic_ptr_pop <= 4'b0000;
        end
      end
      if(io_flush) begin
        logic_ptr_push <= 4'b0000;
        logic_ptr_pop <= 4'b0000;
      end
      logic_ptr_notPow2_counter <= (_zz_logic_ptr_notPow2_counter - _zz_logic_ptr_notPow2_counter_3);
      if(io_flush) begin
        logic_ptr_notPow2_counter <= 4'b0000;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 4'b0000;
      end
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

//BufferCC_1 replaced by BufferCC_4

module BufferCC (
  input  wire [7:0]    io_dataIn,
  output wire [7:0]    io_dataOut,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  (* async_reg = "true" *) reg        [7:0]    buffers_0;
  (* async_reg = "true" *) reg        [7:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge _zz_1) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module StreamFifo_4 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [3:0]    io_push_payload_id,
  input  wire [3:0]    io_push_payload_size,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [3:0]    io_pop_payload_id,
  output wire [3:0]    io_pop_payload_size,
  input  wire          io_flush,
  output wire [3:0]    io_occupancy,
  output wire [3:0]    io_availability,
  input  wire          _zz_4,
  input  wire          _zz_5
);

  reg        [7:0]    _zz_logic_ram_port1;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter_1;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_2;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter_3;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_4;
  wire       [7:0]    _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [3:0]    logic_ptr_push;
  reg        [3:0]    logic_ptr_pop;
  wire       [3:0]    logic_ptr_occupancy;
  wire       [3:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                when_Stream_l1240;
  wire                when_Stream_l1244;
  reg        [3:0]    logic_ptr_notPow2_counter;
  wire                io_push_fire;
  wire                io_pop_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [3:0]    logic_push_onRam_write_payload_data_id;
  wire       [3:0]    logic_push_onRam_write_payload_data_size;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [3:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [3:0]    logic_pop_sync_readPort_rsp_id;
  wire       [3:0]    logic_pop_sync_readPort_rsp_size;
  wire       [7:0]    _zz_logic_pop_sync_readPort_rsp_id;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [3:0]    logic_pop_sync_readArbitation_translated_payload_id;
  wire       [3:0]    logic_pop_sync_readArbitation_translated_payload_size;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [3:0]    logic_pop_sync_popReg;
  reg [7:0] logic_ram [0:11];

  assign _zz_logic_ptr_notPow2_counter = (logic_ptr_notPow2_counter + _zz_logic_ptr_notPow2_counter_1);
  assign _zz_logic_ptr_notPow2_counter_2 = io_push_fire;
  assign _zz_logic_ptr_notPow2_counter_1 = {3'd0, _zz_logic_ptr_notPow2_counter_2};
  assign _zz_logic_ptr_notPow2_counter_4 = io_pop_fire;
  assign _zz_logic_ptr_notPow2_counter_3 = {3'd0, _zz_logic_ptr_notPow2_counter_4};
  assign _zz_logic_ram_port = {logic_push_onRam_write_payload_data_size,logic_push_onRam_write_payload_data_id};
  always @(posedge _zz_4) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = ((logic_ptr_push == logic_ptr_popOnIo) && logic_ptr_wentUp);
  assign logic_ptr_empty = ((logic_ptr_push == logic_ptr_pop) && (! logic_ptr_wentUp));
  assign when_Stream_l1240 = (logic_ptr_push == 4'b1011);
  assign when_Stream_l1244 = (logic_ptr_pop == 4'b1011);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign logic_ptr_occupancy = logic_ptr_notPow2_counter;
  assign io_push_ready = (! logic_ptr_full);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push;
  assign logic_push_onRam_write_payload_data_id = io_push_payload_id;
  assign logic_push_onRam_write_payload_data_size = io_push_payload_size;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop;
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_id = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_rsp_id = _zz_logic_pop_sync_readPort_rsp_id[3 : 0];
  assign logic_pop_sync_readPort_rsp_size = _zz_logic_pop_sync_readPort_rsp_id[7 : 4];
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload_id = logic_pop_sync_readPort_rsp_id;
  assign logic_pop_sync_readArbitation_translated_payload_size = logic_pop_sync_readPort_rsp_size;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_id = logic_pop_sync_readArbitation_translated_payload_id;
  assign io_pop_payload_size = logic_pop_sync_readArbitation_translated_payload_size;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (4'b1100 - logic_ptr_occupancy);
  always @(posedge _zz_4) begin
    if(!_zz_5) begin
      logic_ptr_push <= 4'b0000;
      logic_ptr_pop <= 4'b0000;
      logic_ptr_wentUp <= 1'b0;
      logic_ptr_notPow2_counter <= 4'b0000;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 4'b0000;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 4'b0001);
        if(when_Stream_l1240) begin
          logic_ptr_push <= 4'b0000;
        end
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 4'b0001);
        if(when_Stream_l1244) begin
          logic_ptr_pop <= 4'b0000;
        end
      end
      if(io_flush) begin
        logic_ptr_push <= 4'b0000;
        logic_ptr_pop <= 4'b0000;
      end
      logic_ptr_notPow2_counter <= (_zz_logic_ptr_notPow2_counter - _zz_logic_ptr_notPow2_counter_3);
      if(io_flush) begin
        logic_ptr_notPow2_counter <= 4'b0000;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 4'b0000;
      end
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module Apb3HyperBus (
  input  wire [11:0]   io_bus_PADDR,
  input  wire [0:0]    io_bus_PSEL,
  input  wire          io_bus_PENABLE,
  output wire          io_bus_PREADY,
  input  wire          io_bus_PWRITE,
  input  wire [31:0]   io_bus_PWDATA,
  output reg  [31:0]   io_bus_PRDATA,
  output wire          io_bus_PSLVERROR,
  output wire          io_phy_cmd_valid,
  input  wire          io_phy_cmd_ready,
  output wire [1:0]    io_phy_cmd_payload_mode,
  output wire [9:0]    io_phy_cmd_payload_args,
  input  wire          io_phy_rsp_valid,
  output wire          io_phy_rsp_ready,
  input  wire [7:0]    io_phy_rsp_payload_data,
  input  wire          io_phy_rsp_payload_last,
  input  wire          io_phy_rsp_payload_error,
  output wire [6:0]    io_phy_config_reset_pulse,
  output wire [7:0]    io_phy_config_reset_halt,
  output wire          io_phy_config_reset_trigger,
  output wire          io_frontend_valid,
  input  wire          io_frontend_ready,
  output wire [5:0]    io_frontend_payload_id,
  output wire          io_frontend_payload_read,
  output wire [31:0]   io_frontend_payload_data,
  output wire          io_frontend_payload_last,
  output wire          io_frontend_payload_error,
  input  wire          io_controller_valid,
  output wire          io_controller_ready,
  input  wire [5:0]    io_controller_payload_id,
  input  wire          io_controller_payload_read,
  input  wire          io_controller_payload_memory,
  input  wire          io_controller_payload_unaligned,
  input  wire [31:0]   io_controller_payload_addr,
  input  wire [31:0]   io_controller_payload_data,
  input  wire [3:0]    io_controller_payload_strobe,
  input  wire          io_controller_payload_last,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam CmdMode_CS = 2'd0;
  localparam CmdMode_ADDR = 2'd1;
  localparam CmdMode_DATA = 2'd2;

  reg                 ctrl_io_config_phy_reset_trigger;
  wire                mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_flush;
  reg                 hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_pop_ready;
  wire                hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_flush;
  wire                ctrl_io_phy_cmd_valid;
  wire       [1:0]    ctrl_io_phy_cmd_payload_mode;
  wire       [9:0]    ctrl_io_phy_cmd_payload_args;
  wire                ctrl_io_phy_rsp_ready;
  wire       [6:0]    ctrl_io_phy_config_reset_pulse;
  wire       [7:0]    ctrl_io_phy_config_reset_halt;
  wire                ctrl_io_phy_config_reset_trigger;
  wire                ctrl_io_frontend_valid;
  wire       [5:0]    ctrl_io_frontend_payload_id;
  wire                ctrl_io_frontend_payload_read;
  wire       [31:0]   ctrl_io_frontend_payload_data;
  wire                ctrl_io_frontend_payload_last;
  wire                ctrl_io_frontend_payload_error;
  wire                ctrl_io_controller_ready;
  wire                ctrl_io_config_cmd_ready;
  wire                ctrl_io_config_rsp_valid;
  wire       [16:0]   ctrl_io_config_rsp_payload;
  wire                mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_push_ready;
  wire                mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid;
  wire       [31:0]   mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload;
  wire       [2:0]    mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_occupancy;
  wire       [2:0]    mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_availability;
  wire                hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_push_ready;
  wire                hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_pop_valid;
  wire       [16:0]   hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_pop_payload;
  wire       [2:0]    hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_occupancy;
  wire       [2:0]    hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_availability;
  wire                _zz_io_bus_PSLVERROR;
  wire                _zz_io_bus_PSLVERROR_1;
  wire                _zz_io_bus_PSLVERROR_2;
  wire                _zz_io_bus_PSLVERROR_3;
  reg        [6:0]    mapper_resetPulse;
  reg        [7:0]    mapper_resetHalt;
  reg        [2:0]    mapper_latencyCycles;
  reg                 _zz_mapper_cmdLogic_streamUnbuffered_valid;
  wire                mapper_cmdLogic_streamUnbuffered_valid;
  wire                mapper_cmdLogic_streamUnbuffered_ready;
  wire       [31:0]   mapper_cmdLogic_streamUnbuffered_payload;
  `ifndef SYNTHESIS
  reg [31:0] io_phy_cmd_payload_mode_string;
  `endif


  HyperBusCtrl ctrl (
    .io_phy_cmd_valid                (ctrl_io_phy_cmd_valid                                                      ), //o
    .io_phy_cmd_ready                (io_phy_cmd_ready                                                           ), //i
    .io_phy_cmd_payload_mode         (ctrl_io_phy_cmd_payload_mode[1:0]                                          ), //o
    .io_phy_cmd_payload_args         (ctrl_io_phy_cmd_payload_args[9:0]                                          ), //o
    .io_phy_rsp_valid                (io_phy_rsp_valid                                                           ), //i
    .io_phy_rsp_ready                (ctrl_io_phy_rsp_ready                                                      ), //o
    .io_phy_rsp_payload_data         (io_phy_rsp_payload_data[7:0]                                               ), //i
    .io_phy_rsp_payload_last         (io_phy_rsp_payload_last                                                    ), //i
    .io_phy_rsp_payload_error        (io_phy_rsp_payload_error                                                   ), //i
    .io_phy_config_reset_pulse       (ctrl_io_phy_config_reset_pulse[6:0]                                        ), //o
    .io_phy_config_reset_halt        (ctrl_io_phy_config_reset_halt[7:0]                                         ), //o
    .io_phy_config_reset_trigger     (ctrl_io_phy_config_reset_trigger                                           ), //o
    .io_frontend_valid               (ctrl_io_frontend_valid                                                     ), //o
    .io_frontend_ready               (io_frontend_ready                                                          ), //i
    .io_frontend_payload_id          (ctrl_io_frontend_payload_id[5:0]                                           ), //o
    .io_frontend_payload_read        (ctrl_io_frontend_payload_read                                              ), //o
    .io_frontend_payload_data        (ctrl_io_frontend_payload_data[31:0]                                        ), //o
    .io_frontend_payload_last        (ctrl_io_frontend_payload_last                                              ), //o
    .io_frontend_payload_error       (ctrl_io_frontend_payload_error                                             ), //o
    .io_controller_valid             (io_controller_valid                                                        ), //i
    .io_controller_ready             (ctrl_io_controller_ready                                                   ), //o
    .io_controller_payload_id        (io_controller_payload_id[5:0]                                              ), //i
    .io_controller_payload_read      (io_controller_payload_read                                                 ), //i
    .io_controller_payload_memory    (io_controller_payload_memory                                               ), //i
    .io_controller_payload_unaligned (io_controller_payload_unaligned                                            ), //i
    .io_controller_payload_addr      (io_controller_payload_addr[31:0]                                           ), //i
    .io_controller_payload_data      (io_controller_payload_data[31:0]                                           ), //i
    .io_controller_payload_strobe    (io_controller_payload_strobe[3:0]                                          ), //i
    .io_controller_payload_last      (io_controller_payload_last                                                 ), //i
    .io_config_phy_reset_pulse       (mapper_resetPulse[6:0]                                                     ), //i
    .io_config_phy_reset_halt        (mapper_resetHalt[7:0]                                                      ), //i
    .io_config_phy_reset_trigger     (ctrl_io_config_phy_reset_trigger                                           ), //i
    .io_config_latencyCycles         (mapper_latencyCycles[2:0]                                                  ), //i
    .io_config_cmd_valid             (mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid        ), //i
    .io_config_cmd_ready             (ctrl_io_config_cmd_ready                                                   ), //o
    .io_config_cmd_payload           (mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload[31:0]), //i
    .io_config_rsp_valid             (ctrl_io_config_rsp_valid                                                   ), //o
    .io_config_rsp_ready             (hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_push_ready               ), //i
    .io_config_rsp_payload           (ctrl_io_config_rsp_payload[16:0]                                           ), //o
    ._zz_1                           (_zz_1                                                                      ), //i
    ._zz_2                           (_zz_2                                                                      )  //i
  );
  StreamFifo_8 mapper_cmdLogic_streamUnbuffered_queueWithAvailability (
    .io_push_valid   (mapper_cmdLogic_streamUnbuffered_valid                                     ), //i
    .io_push_ready   (mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_push_ready       ), //o
    .io_push_payload (mapper_cmdLogic_streamUnbuffered_payload[31:0]                             ), //i
    .io_pop_valid    (mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid        ), //o
    .io_pop_ready    (ctrl_io_config_cmd_ready                                                   ), //i
    .io_pop_payload  (mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload[31:0]), //o
    .io_flush        (mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_flush            ), //i
    .io_occupancy    (mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_occupancy[2:0]   ), //o
    .io_availability (mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_availability[2:0]), //o
    ._zz_4           (_zz_1                                                                      ), //i
    ._zz_5           (_zz_2                                                                      )  //i
  );
  StreamFifo_9 hyperbus_ctrl_io_config_rsp_queueWithOccupancy (
    .io_push_valid   (ctrl_io_config_rsp_valid                                           ), //i
    .io_push_ready   (hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_push_ready       ), //o
    .io_push_payload (ctrl_io_config_rsp_payload[16:0]                                   ), //i
    .io_pop_valid    (hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_pop_valid        ), //o
    .io_pop_ready    (hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_pop_ready        ), //i
    .io_pop_payload  (hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_pop_payload[16:0]), //o
    .io_flush        (hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_flush            ), //i
    .io_occupancy    (hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_occupancy[2:0]   ), //o
    .io_availability (hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_availability[2:0]), //o
    ._zz_4           (_zz_1                                                              ), //i
    ._zz_5           (_zz_2                                                              )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_phy_cmd_payload_mode)
      CmdMode_CS : io_phy_cmd_payload_mode_string = "CS  ";
      CmdMode_ADDR : io_phy_cmd_payload_mode_string = "ADDR";
      CmdMode_DATA : io_phy_cmd_payload_mode_string = "DATA";
      default : io_phy_cmd_payload_mode_string = "????";
    endcase
  end
  `endif

  assign io_phy_cmd_valid = ctrl_io_phy_cmd_valid;
  assign io_phy_cmd_payload_mode = ctrl_io_phy_cmd_payload_mode;
  assign io_phy_cmd_payload_args = ctrl_io_phy_cmd_payload_args;
  assign io_phy_rsp_ready = ctrl_io_phy_rsp_ready;
  assign io_phy_config_reset_pulse = ctrl_io_phy_config_reset_pulse;
  assign io_phy_config_reset_halt = ctrl_io_phy_config_reset_halt;
  assign io_phy_config_reset_trigger = ctrl_io_phy_config_reset_trigger;
  assign io_frontend_valid = ctrl_io_frontend_valid;
  assign io_frontend_payload_id = ctrl_io_frontend_payload_id;
  assign io_frontend_payload_read = ctrl_io_frontend_payload_read;
  assign io_frontend_payload_data = ctrl_io_frontend_payload_data;
  assign io_frontend_payload_last = ctrl_io_frontend_payload_last;
  assign io_frontend_payload_error = ctrl_io_frontend_payload_error;
  assign io_controller_ready = ctrl_io_controller_ready;
  assign _zz_io_bus_PSLVERROR = 1'b0;
  assign _zz_io_bus_PSLVERROR_1 = 1'b0;
  assign io_bus_PREADY = 1'b1;
  always @(*) begin
    io_bus_PRDATA = 32'h00000000;
    case(io_bus_PADDR)
      12'h014 : begin
        io_bus_PRDATA[6 : 0] = mapper_resetPulse;
      end
      12'h018 : begin
        io_bus_PRDATA[7 : 0] = mapper_resetHalt;
      end
      12'h020 : begin
        io_bus_PRDATA[2 : 0] = mapper_latencyCycles;
      end
      12'h030 : begin
        io_bus_PRDATA[31 : 31] = (hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_pop_valid ^ 1'b0);
        io_bus_PRDATA[16 : 0] = hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_pop_payload;
      end
      12'h034 : begin
        io_bus_PRDATA[18 : 16] = mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_availability;
        io_bus_PRDATA[2 : 0] = hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_occupancy;
      end
      default : begin
      end
    endcase
  end

  assign _zz_io_bus_PSLVERROR_2 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign _zz_io_bus_PSLVERROR_3 = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign io_bus_PSLVERROR = ((_zz_io_bus_PSLVERROR_2 && _zz_io_bus_PSLVERROR_1) || (_zz_io_bus_PSLVERROR_3 && _zz_io_bus_PSLVERROR));
  always @(*) begin
    ctrl_io_config_phy_reset_trigger = 1'b0;
    case(io_bus_PADDR)
      12'h010 : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          ctrl_io_config_phy_reset_trigger = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_mapper_cmdLogic_streamUnbuffered_valid = 1'b0;
    case(io_bus_PADDR)
      12'h030 : begin
        if(_zz_io_bus_PSLVERROR_2) begin
          _zz_mapper_cmdLogic_streamUnbuffered_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign mapper_cmdLogic_streamUnbuffered_valid = _zz_mapper_cmdLogic_streamUnbuffered_valid;
  assign mapper_cmdLogic_streamUnbuffered_payload = io_bus_PWDATA[31 : 0];
  assign mapper_cmdLogic_streamUnbuffered_ready = mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_push_ready;
  always @(*) begin
    hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_pop_ready = 1'b0;
    case(io_bus_PADDR)
      12'h030 : begin
        if(_zz_io_bus_PSLVERROR_3) begin
          hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_pop_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign mapper_cmdLogic_streamUnbuffered_queueWithAvailability_io_flush = 1'b0;
  assign hyperbus_ctrl_io_config_rsp_queueWithOccupancy_io_flush = 1'b0;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      mapper_resetPulse <= 7'h14;
      mapper_resetHalt <= 8'h14;
      mapper_latencyCycles <= 3'b111;
    end else begin
      case(io_bus_PADDR)
        12'h014 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            mapper_resetPulse <= io_bus_PWDATA[6 : 0];
          end
        end
        12'h018 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            mapper_resetHalt <= io_bus_PWDATA[7 : 0];
          end
        end
        12'h020 : begin
          if(_zz_io_bus_PSLVERROR_2) begin
            mapper_latencyCycles <= io_bus_PWDATA[2 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module FlowCCByToggle (
  input  wire          io_input_valid,
  input  wire          io_input_payload_last,
  input  wire [0:0]    io_input_payload_fragment,
  output wire          io_output_valid,
  output wire          io_output_payload_last,
  output wire [0:0]    io_output_payload_fragment,
  input  wire          io_jtag_tck,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire                inputArea_target_buffercc_io_dataOut;
  reg                 inputArea_target;
  reg                 inputArea_data_last;
  reg        [0:0]    inputArea_data_fragment;
  wire                outputArea_target;
  reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire                outputArea_flow_payload_last;
  wire       [0:0]    outputArea_flow_payload_fragment;
  reg                 outputArea_flow_m2sPipe_valid;
  (* async_reg = "true" *) reg                 outputArea_flow_m2sPipe_payload_last;
  (* async_reg = "true" *) reg        [0:0]    outputArea_flow_m2sPipe_payload_fragment;

  BufferCC_4 inputArea_target_buffercc (
    .io_dataIn  (inputArea_target                    ), //i
    .io_dataOut (inputArea_target_buffercc_io_dataOut), //o
    ._zz_1      (_zz_1                               ), //i
    ._zz_2      (_zz_2                               )  //i
  );
  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_m2sPipe_valid;
  assign io_output_payload_last = outputArea_flow_m2sPipe_payload_last;
  assign io_output_payload_fragment = outputArea_flow_m2sPipe_payload_fragment;
  always @(posedge io_jtag_tck) begin
    if(io_input_valid) begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @(posedge _zz_1) begin
    outputArea_hit <= outputArea_target;
    if(outputArea_flow_valid) begin
      outputArea_flow_m2sPipe_payload_last <= outputArea_flow_payload_last;
      outputArea_flow_m2sPipe_payload_fragment <= outputArea_flow_payload_fragment;
    end
  end

  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
    end else begin
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
    end
  end


endmodule

module StreamFifoLowLatency_2 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload_error,
  input  wire [31:0]   io_push_payload_inst,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire          io_pop_payload_error,
  output wire [31:0]   io_pop_payload_inst,
  input  wire          io_flush,
  output wire [1:0]    io_occupancy,
  output wire [1:0]    io_availability,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire                fifo_io_pop_payload_error;
  wire       [31:0]   fifo_io_pop_payload_inst;
  wire       [1:0]    fifo_io_occupancy;
  wire       [1:0]    fifo_io_availability;

  StreamFifo_10 fifo (
    .io_push_valid         (io_push_valid                 ), //i
    .io_push_ready         (fifo_io_push_ready            ), //o
    .io_push_payload_error (io_push_payload_error         ), //i
    .io_push_payload_inst  (io_push_payload_inst[31:0]    ), //i
    .io_pop_valid          (fifo_io_pop_valid             ), //o
    .io_pop_ready          (io_pop_ready                  ), //i
    .io_pop_payload_error  (fifo_io_pop_payload_error     ), //o
    .io_pop_payload_inst   (fifo_io_pop_payload_inst[31:0]), //o
    .io_flush              (io_flush                      ), //i
    .io_occupancy          (fifo_io_occupancy[1:0]        ), //o
    .io_availability       (fifo_io_availability[1:0]     ), //o
    ._zz_4                 (_zz_1                         ), //i
    ._zz_5                 (_zz_2                         )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_pop_payload_error = fifo_io_pop_payload_error;
  assign io_pop_payload_inst = fifo_io_pop_payload_inst;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

module BufferCC_3 (
  input  wire [3:0]    io_dataIn,
  output wire [3:0]    io_dataOut,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge _zz_1) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module BufferCC_2 (
  input  wire [3:0]    io_dataIn,
  output wire [3:0]    io_dataOut,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;
  (* async_reg = "true" *) reg        [3:0]    buffers_2;

  assign io_dataOut = buffers_2;
  always @(posedge _zz_1) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
    buffers_2 <= buffers_1;
  end


endmodule

module UartCtrlRx (
  input  wire [1:0]    io_config_parity,
  input  wire [0:0]    io_config_stop,
  input  wire [3:0]    io_config_dataLength,
  input  wire          io_samplingTick,
  output wire          io_read_valid,
  input  wire          io_read_ready,
  output wire [8:0]    io_read_payload,
  input  wire          io_rxd,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam ParityType_NONE = 2'd0;
  localparam ParityType_EVEN = 2'd1;
  localparam ParityType_ODD = 2'd2;
  localparam StopType_ONE = 1'd0;
  localparam StopType_TWO = 1'd1;
  localparam State_1_IDLE = 3'd0;
  localparam State_1_START = 3'd1;
  localparam State_1_DATA = 3'd2;
  localparam State_1_PARITY = 3'd3;
  localparam State_1_STOP = 3'd4;

  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_sampler_value;
  wire                _zz_sampler_value_1;
  wire                _zz_sampler_value_2;
  wire                _zz_sampler_value_3;
  wire                _zz_sampler_value_4;
  wire                _zz_sampler_value_5;
  wire                _zz_sampler_value_6;
  wire       [3:0]    _zz_when_UartCtrlRx_l125;
  wire       [0:0]    _zz_when_UartCtrlRx_l125_1;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  wire                when_UartCtrlRx_l45;
  reg        [3:0]    bitCounter_value;
  reg        [2:0]    stateMachine_state;
  reg                 stateMachine_parity;
  reg        [8:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  wire                when_UartCtrlRx_l79;
  wire                when_UartCtrlRx_l90;
  wire                when_UartCtrlRx_l98;
  wire                when_UartCtrlRx_l100;
  wire                when_UartCtrlRx_l112;
  wire                when_UartCtrlRx_l123;
  wire                when_UartCtrlRx_l125;
  `ifndef SYNTHESIS
  reg [31:0] io_config_parity_string;
  reg [23:0] io_config_stop_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_when_UartCtrlRx_l125_1 = ((io_config_stop == StopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlRx_l125 = {3'd0, _zz_when_UartCtrlRx_l125_1};
  assign _zz_sampler_value = ((((1'b0 || ((_zz_sampler_value_1 && sampler_samples_1) && sampler_samples_2)) || (((_zz_sampler_value_2 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_sampler_value_3 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_sampler_value_4 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_sampler_value_5 = (1'b1 && sampler_samples_1);
  assign _zz_sampler_value_6 = 1'b1;
  assign _zz_sampler_value_1 = (1'b1 && sampler_samples_0);
  assign _zz_sampler_value_2 = 1'b1;
  BufferCC_5 io_rxd_buffercc (
    .io_dataIn  (io_rxd                    ), //i
    .io_dataOut (io_rxd_buffercc_io_dataOut), //o
    ._zz_1      (_zz_1                     ), //i
    ._zz_2      (_zz_2                     )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_parity)
      ParityType_NONE : io_config_parity_string = "NONE";
      ParityType_EVEN : io_config_parity_string = "EVEN";
      ParityType_ODD : io_config_parity_string = "ODD ";
      default : io_config_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(io_config_stop)
      StopType_ONE : io_config_stop_string = "ONE";
      StopType_TWO : io_config_stop_string = "TWO";
      default : io_config_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      State_1_IDLE : stateMachine_state_string = "IDLE  ";
      State_1_START : stateMachine_state_string = "START ";
      State_1_DATA : stateMachine_state_string = "DATA  ";
      State_1_PARITY : stateMachine_state_string = "PARITY";
      State_1_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @(*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick) begin
      if(when_UartCtrlRx_l45) begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign when_UartCtrlRx_l45 = (bitTimer_counter == 3'b000);
  assign io_read_valid = stateMachine_validReg;
  assign when_UartCtrlRx_l79 = (sampler_tick && (! sampler_value));
  assign when_UartCtrlRx_l90 = (sampler_value == 1'b1);
  assign when_UartCtrlRx_l98 = (bitCounter_value == io_config_dataLength);
  assign when_UartCtrlRx_l100 = (io_config_parity == ParityType_NONE);
  assign when_UartCtrlRx_l112 = (stateMachine_parity == sampler_value);
  assign when_UartCtrlRx_l123 = (! sampler_value);
  assign when_UartCtrlRx_l125 = (bitCounter_value == _zz_when_UartCtrlRx_l125);
  assign io_read_payload = stateMachine_shifter;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      stateMachine_state <= State_1_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      if(io_samplingTick) begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick) begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick) begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick) begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_sampler_value || _zz_sampler_value_3) || (_zz_sampler_value_4 && sampler_samples_4)) || ((_zz_sampler_value_5 && sampler_samples_2) && sampler_samples_4)) || (((_zz_sampler_value_6 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        State_1_IDLE : begin
          if(when_UartCtrlRx_l79) begin
            stateMachine_state <= State_1_START;
          end
        end
        State_1_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= State_1_DATA;
            if(when_UartCtrlRx_l90) begin
              stateMachine_state <= State_1_IDLE;
            end
          end
        end
        State_1_DATA : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l98) begin
              if(when_UartCtrlRx_l100) begin
                stateMachine_state <= State_1_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= State_1_PARITY;
              end
            end
          end
        end
        State_1_PARITY : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l112) begin
              stateMachine_state <= State_1_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= State_1_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l123) begin
              stateMachine_state <= State_1_IDLE;
            end else begin
              if(when_UartCtrlRx_l125) begin
                stateMachine_state <= State_1_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @(posedge _zz_1) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 4'b0001);
    end
    if(bitTimer_tick) begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      State_1_IDLE : begin
        if(when_UartCtrlRx_l79) begin
          bitTimer_counter <= 3'b010;
        end
      end
      State_1_START : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 4'b0000;
          stateMachine_parity <= (io_config_parity == ParityType_ODD);
          stateMachine_shifter <= 9'h000;
        end
      end
      State_1_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(when_UartCtrlRx_l98) begin
            bitCounter_value <= 4'b0000;
          end
        end
      end
      State_1_PARITY : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 4'b0000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input  wire [1:0]    io_config_parity,
  input  wire [0:0]    io_config_stop,
  input  wire [3:0]    io_config_dataLength,
  input  wire          io_samplingTick,
  input  wire          io_write_valid,
  output reg           io_write_ready,
  input  wire [8:0]    io_write_payload,
  output wire          io_txd,
  input  wire          io_cts,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam ParityType_NONE = 2'd0;
  localparam ParityType_EVEN = 2'd1;
  localparam ParityType_ODD = 2'd2;
  localparam StopType_ONE = 1'd0;
  localparam StopType_TWO = 1'd1;
  localparam State_1_IDLE = 3'd0;
  localparam State_1_START = 3'd1;
  localparam State_1_DATA = 3'd2;
  localparam State_1_PARITY = 3'd3;
  localparam State_1_STOP = 3'd4;

  wire       [2:0]    _zz_txCtrl_clockDivider_counter_valueNext;
  wire       [0:0]    _zz_txCtrl_clockDivider_counter_valueNext_1;
  wire       [3:0]    _zz_when_UartCtrlTx_l91;
  wire       [0:0]    _zz_when_UartCtrlTx_l91_1;
  reg                 txEnable;
  wire                txCtrl_newClockEnable;
  reg                 txCtrl_clockDivider_counter_willIncrement;
  wire                txCtrl_clockDivider_counter_willClear;
  reg        [2:0]    txCtrl_clockDivider_counter_valueNext;
  reg        [2:0]    txCtrl_clockDivider_counter_value;
  wire                txCtrl_clockDivider_counter_willOverflowIfInc;
  wire                txCtrl_clockDivider_counter_willOverflow;
  reg        [3:0]    txCtrl_tickCounter_value;
  reg        [2:0]    txCtrl_stateMachine_state;
  reg                 txCtrl_stateMachine_parity;
  reg                 txCtrl_stateMachine_txd;
  wire                when_UartCtrlTx_l55;
  wire                when_UartCtrlTx_l70;
  wire                when_UartCtrlTx_l73;
  wire                when_UartCtrlTx_l91;
  wire       [2:0]    _zz_txCtrl_stateMachine_state;
  wire                when_UartCtrlTx_l99;
  reg                 txCtrl_stateMachine_txd_regNext;
  `ifndef SYNTHESIS
  reg [31:0] io_config_parity_string;
  reg [23:0] io_config_stop_string;
  reg [47:0] txCtrl_stateMachine_state_string;
  reg [47:0] _zz_txCtrl_stateMachine_state_string;
  `endif


  assign _zz_txCtrl_clockDivider_counter_valueNext_1 = txCtrl_clockDivider_counter_willIncrement;
  assign _zz_txCtrl_clockDivider_counter_valueNext = {2'd0, _zz_txCtrl_clockDivider_counter_valueNext_1};
  assign _zz_when_UartCtrlTx_l91_1 = ((io_config_stop == StopType_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlTx_l91 = {3'd0, _zz_when_UartCtrlTx_l91_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_parity)
      ParityType_NONE : io_config_parity_string = "NONE";
      ParityType_EVEN : io_config_parity_string = "EVEN";
      ParityType_ODD : io_config_parity_string = "ODD ";
      default : io_config_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(io_config_stop)
      StopType_ONE : io_config_stop_string = "ONE";
      StopType_TWO : io_config_stop_string = "TWO";
      default : io_config_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(txCtrl_stateMachine_state)
      State_1_IDLE : txCtrl_stateMachine_state_string = "IDLE  ";
      State_1_START : txCtrl_stateMachine_state_string = "START ";
      State_1_DATA : txCtrl_stateMachine_state_string = "DATA  ";
      State_1_PARITY : txCtrl_stateMachine_state_string = "PARITY";
      State_1_STOP : txCtrl_stateMachine_state_string = "STOP  ";
      default : txCtrl_stateMachine_state_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_txCtrl_stateMachine_state)
      State_1_IDLE : _zz_txCtrl_stateMachine_state_string = "IDLE  ";
      State_1_START : _zz_txCtrl_stateMachine_state_string = "START ";
      State_1_DATA : _zz_txCtrl_stateMachine_state_string = "DATA  ";
      State_1_PARITY : _zz_txCtrl_stateMachine_state_string = "PARITY";
      State_1_STOP : _zz_txCtrl_stateMachine_state_string = "STOP  ";
      default : _zz_txCtrl_stateMachine_state_string = "??????";
    endcase
  end
  `endif

  assign txCtrl_newClockEnable = (1'b1 && txEnable);
  always @(*) begin
    txCtrl_clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick) begin
      txCtrl_clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign txCtrl_clockDivider_counter_willClear = 1'b0;
  assign txCtrl_clockDivider_counter_willOverflowIfInc = (txCtrl_clockDivider_counter_value == 3'b111);
  assign txCtrl_clockDivider_counter_willOverflow = (txCtrl_clockDivider_counter_willOverflowIfInc && txCtrl_clockDivider_counter_willIncrement);
  always @(*) begin
    txCtrl_clockDivider_counter_valueNext = (txCtrl_clockDivider_counter_value + _zz_txCtrl_clockDivider_counter_valueNext);
    if(txCtrl_clockDivider_counter_willClear) begin
      txCtrl_clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    txCtrl_stateMachine_txd = 1'b1;
    case(txCtrl_stateMachine_state)
      State_1_IDLE : begin
      end
      State_1_START : begin
        txCtrl_stateMachine_txd = 1'b0;
      end
      State_1_DATA : begin
        txCtrl_stateMachine_txd = io_write_payload[txCtrl_tickCounter_value];
      end
      State_1_PARITY : begin
        txCtrl_stateMachine_txd = txCtrl_stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_write_ready = 1'b0;
    case(txCtrl_stateMachine_state)
      State_1_IDLE : begin
      end
      State_1_START : begin
      end
      State_1_DATA : begin
        if(txCtrl_clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l70) begin
            io_write_ready = 1'b1;
          end
        end
      end
      State_1_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UartCtrlTx_l55 = ((io_write_valid && txCtrl_clockDivider_counter_willOverflow) && io_cts);
  assign when_UartCtrlTx_l70 = (txCtrl_tickCounter_value == io_config_dataLength);
  assign when_UartCtrlTx_l73 = (io_config_parity == ParityType_NONE);
  assign when_UartCtrlTx_l91 = (txCtrl_tickCounter_value == _zz_when_UartCtrlTx_l91);
  assign _zz_txCtrl_stateMachine_state = (io_write_valid ? State_1_START : State_1_IDLE);
  assign when_UartCtrlTx_l99 = (io_write_valid || (! (txCtrl_stateMachine_state == State_1_IDLE)));
  assign io_txd = txCtrl_stateMachine_txd_regNext;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      txEnable <= 1'b1;
      txCtrl_stateMachine_txd_regNext <= 1'b1;
    end else begin
      if(when_UartCtrlTx_l99) begin
        txEnable <= 1'b1;
      end else begin
        txEnable <= 1'b0;
      end
      txCtrl_stateMachine_txd_regNext <= txCtrl_stateMachine_txd;
    end
  end

  always @(posedge _zz_1) begin
    if(txCtrl_newClockEnable) begin
      if(!_zz_2) begin
      txCtrl_clockDivider_counter_value <= 3'b000;
      txCtrl_stateMachine_state <= State_1_IDLE;
      end else begin
        txCtrl_clockDivider_counter_value <= txCtrl_clockDivider_counter_valueNext;
        case(txCtrl_stateMachine_state)
          State_1_IDLE : begin
            if(when_UartCtrlTx_l55) begin
              txCtrl_stateMachine_state <= State_1_START;
            end
          end
          State_1_START : begin
            if(txCtrl_clockDivider_counter_willOverflow) begin
              txCtrl_stateMachine_state <= State_1_DATA;
            end
          end
          State_1_DATA : begin
            if(txCtrl_clockDivider_counter_willOverflow) begin
              if(when_UartCtrlTx_l70) begin
                if(when_UartCtrlTx_l73) begin
                  txCtrl_stateMachine_state <= State_1_STOP;
                end else begin
                  txCtrl_stateMachine_state <= State_1_PARITY;
                end
              end
            end
          end
          State_1_PARITY : begin
            if(txCtrl_clockDivider_counter_willOverflow) begin
              txCtrl_stateMachine_state <= State_1_STOP;
            end
          end
          default : begin
            if(txCtrl_clockDivider_counter_willOverflow) begin
              if(when_UartCtrlTx_l91) begin
                txCtrl_stateMachine_state <= _zz_txCtrl_stateMachine_state;
              end
            end
          end
        endcase
      end
    end
  end

  always @(posedge _zz_1) begin
    if(txCtrl_newClockEnable) begin
      if(txCtrl_clockDivider_counter_willOverflow) begin
        txCtrl_tickCounter_value <= (txCtrl_tickCounter_value + 4'b0001);
      end
      if(txCtrl_clockDivider_counter_willOverflow) begin
        txCtrl_stateMachine_parity <= (txCtrl_stateMachine_parity ^ txCtrl_stateMachine_txd);
      end
      case(txCtrl_stateMachine_state)
        State_1_IDLE : begin
        end
        State_1_START : begin
          if(txCtrl_clockDivider_counter_willOverflow) begin
            txCtrl_stateMachine_parity <= (io_config_parity == ParityType_ODD);
            txCtrl_tickCounter_value <= 4'b0000;
          end
        end
        State_1_DATA : begin
          if(txCtrl_clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l70) begin
              txCtrl_tickCounter_value <= 4'b0000;
            end
          end
        end
        State_1_PARITY : begin
          if(txCtrl_clockDivider_counter_willOverflow) begin
            txCtrl_tickCounter_value <= 4'b0000;
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

//StreamFifo_5 replaced by StreamFifo_6

module StreamFifo_6 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  output reg           io_pop_valid,
  input  wire          io_pop_ready,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  reg                 logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [2:0]    logic_ptr_push;
  reg        [2:0]    logic_ptr_pop;
  wire       [2:0]    logic_ptr_occupancy;
  wire       [2:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_write_payload_address;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 3'b100) == 3'b000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  always @(*) begin
    logic_ptr_doPush = io_push_fire;
    if(logic_ptr_empty) begin
      if(io_pop_ready) begin
        logic_ptr_doPush = 1'b0;
      end
    end
  end

  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[1:0];
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[1:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  always @(*) begin
    io_pop_valid = logic_pop_addressGen_translated_valid;
    if(logic_ptr_empty) begin
      io_pop_valid = io_push_valid;
    end
  end

  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (3'b100 - logic_ptr_occupancy);
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      logic_ptr_push <= 3'b000;
      logic_ptr_pop <= 3'b000;
      logic_ptr_wentUp <= 1'b0;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 3'b001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 3'b001);
      end
      if(io_flush) begin
        logic_ptr_push <= 3'b000;
        logic_ptr_pop <= 3'b000;
      end
    end
  end


endmodule

module StreamFifo_7 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [7:0]    io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [7:0]    io_pop_payload,
  input  wire          io_flush,
  output wire [4:0]    io_occupancy,
  output wire [4:0]    io_availability,
  input  wire          _zz_4,
  input  wire          _zz_5
);

  reg        [7:0]    _zz_logic_ram_port1;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [4:0]    logic_ptr_push;
  reg        [4:0]    logic_ptr_pop;
  wire       [4:0]    logic_ptr_occupancy;
  wire       [4:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [7:0]    logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [3:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [7:0]    logic_pop_sync_readPort_rsp;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [7:0]    logic_pop_sync_readArbitation_translated_payload;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [4:0]    logic_pop_sync_popReg;
  reg [7:0] logic_ram [0:15];

  always @(posedge _zz_4) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= logic_push_onRam_write_payload_data;
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h00);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[3:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[3:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign logic_pop_sync_readPort_rsp = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload = logic_pop_sync_readPort_rsp;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload = logic_pop_sync_readArbitation_translated_payload;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge _zz_4) begin
    if(!_zz_5) begin
      logic_ptr_push <= 5'h00;
      logic_ptr_pop <= 5'h00;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h00;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 5'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 5'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 5'h00;
        logic_ptr_pop <= 5'h00;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h00;
      end
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module StreamFifo_9 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [16:0]   io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [16:0]   io_pop_payload,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          _zz_4,
  input  wire          _zz_5
);

  reg        [16:0]   _zz_logic_ram_port1;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [2:0]    logic_ptr_push;
  reg        [2:0]    logic_ptr_pop;
  wire       [2:0]    logic_ptr_occupancy;
  wire       [2:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_write_payload_address;
  wire       [16:0]   logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [1:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [1:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [1:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [16:0]   logic_pop_sync_readPort_rsp;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [16:0]   logic_pop_sync_readArbitation_translated_payload;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [2:0]    logic_pop_sync_popReg;
  reg [16:0] logic_ram [0:3];

  always @(posedge _zz_4) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= logic_push_onRam_write_payload_data;
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 3'b100) == 3'b000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[1:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[1:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign logic_pop_sync_readPort_rsp = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload = logic_pop_sync_readPort_rsp;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload = logic_pop_sync_readArbitation_translated_payload;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (3'b100 - logic_ptr_occupancy);
  always @(posedge _zz_4) begin
    if(!_zz_5) begin
      logic_ptr_push <= 3'b000;
      logic_ptr_pop <= 3'b000;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 3'b000;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 3'b001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 3'b001);
      end
      if(io_flush) begin
        logic_ptr_push <= 3'b000;
        logic_ptr_pop <= 3'b000;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 3'b000;
      end
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module StreamFifo_8 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [31:0]   io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [31:0]   io_pop_payload,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          _zz_4,
  input  wire          _zz_5
);

  reg        [31:0]   _zz_logic_ram_port1;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [2:0]    logic_ptr_push;
  reg        [2:0]    logic_ptr_pop;
  wire       [2:0]    logic_ptr_occupancy;
  wire       [2:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_write_payload_address;
  wire       [31:0]   logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [1:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [1:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [1:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [31:0]   logic_pop_sync_readPort_rsp;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [31:0]   logic_pop_sync_readArbitation_translated_payload;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [2:0]    logic_pop_sync_popReg;
  reg [31:0] logic_ram [0:3];

  always @(posedge _zz_4) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= logic_push_onRam_write_payload_data;
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 3'b100) == 3'b000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[1:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[1:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign logic_pop_sync_readPort_rsp = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload = logic_pop_sync_readPort_rsp;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload = logic_pop_sync_readArbitation_translated_payload;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (3'b100 - logic_ptr_occupancy);
  always @(posedge _zz_4) begin
    if(!_zz_5) begin
      logic_ptr_push <= 3'b000;
      logic_ptr_pop <= 3'b000;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 3'b000;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 3'b001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 3'b001);
      end
      if(io_flush) begin
        logic_ptr_push <= 3'b000;
        logic_ptr_pop <= 3'b000;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 3'b000;
      end
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module HyperBusCtrl (
  output reg           io_phy_cmd_valid,
  input  wire          io_phy_cmd_ready,
  output reg  [1:0]    io_phy_cmd_payload_mode,
  output reg  [9:0]    io_phy_cmd_payload_args,
  input  wire          io_phy_rsp_valid,
  output reg           io_phy_rsp_ready,
  input  wire [7:0]    io_phy_rsp_payload_data,
  input  wire          io_phy_rsp_payload_last,
  input  wire          io_phy_rsp_payload_error,
  output wire [6:0]    io_phy_config_reset_pulse,
  output wire [7:0]    io_phy_config_reset_halt,
  output wire          io_phy_config_reset_trigger,
  output reg           io_frontend_valid,
  input  wire          io_frontend_ready,
  output wire [5:0]    io_frontend_payload_id,
  output wire          io_frontend_payload_read,
  output reg  [31:0]   io_frontend_payload_data,
  output wire          io_frontend_payload_last,
  output reg           io_frontend_payload_error,
  input  wire          io_controller_valid,
  output reg           io_controller_ready,
  input  wire [5:0]    io_controller_payload_id,
  input  wire          io_controller_payload_read,
  input  wire          io_controller_payload_memory,
  input  wire          io_controller_payload_unaligned,
  input  wire [31:0]   io_controller_payload_addr,
  input  wire [31:0]   io_controller_payload_data,
  input  wire [3:0]    io_controller_payload_strobe,
  input  wire          io_controller_payload_last,
  input  wire [6:0]    io_config_phy_reset_pulse,
  input  wire [7:0]    io_config_phy_reset_halt,
  input  wire          io_config_phy_reset_trigger,
  input  wire [2:0]    io_config_latencyCycles,
  input  wire          io_config_cmd_valid,
  output reg           io_config_cmd_ready,
  input  wire [31:0]   io_config_cmd_payload,
  output reg           io_config_rsp_valid,
  input  wire          io_config_rsp_ready,
  output reg  [16:0]   io_config_rsp_payload,
  input  wire          _zz_1,
  input  wire          _zz_2
);
  localparam CmdMode_CS = 2'd0;
  localparam CmdMode_ADDR = 2'd1;
  localparam CmdMode_DATA = 2'd2;
  localparam funnel_enumDef_BOOT = 2'd0;
  localparam funnel_enumDef_init = 2'd1;
  localparam funnel_enumDef_axiBurst = 2'd2;
  localparam fsm_enumDef_BOOT = 3'd0;
  localparam fsm_enumDef_init = 3'd1;
  localparam fsm_enumDef_cmdAddr = 3'd2;
  localparam fsm_enumDef_write = 3'd3;
  localparam fsm_enumDef_read = 3'd4;
  localparam fsm_enumDef_response = 3'd5;
  localparam fsm_enumDef_error = 3'd6;

  reg                 frontend_io_push_valid;
  reg        [5:0]    frontend_io_push_payload_id;
  reg                 frontend_io_push_payload_read;
  reg                 frontend_io_push_payload_memory;
  reg                 frontend_io_push_payload_unaligned;
  reg        [31:0]   frontend_io_push_payload_addr;
  reg        [31:0]   frontend_io_push_payload_data;
  reg        [3:0]    frontend_io_push_payload_strobe;
  reg                 frontend_io_push_payload_last;
  reg                 frontend_io_pop_ready;
  wire                frontend_io_flush;
  wire                frontend_io_push_ready;
  wire                frontend_io_pop_valid;
  wire       [5:0]    frontend_io_pop_payload_id;
  wire                frontend_io_pop_payload_read;
  wire                frontend_io_pop_payload_memory;
  wire                frontend_io_pop_payload_unaligned;
  wire       [31:0]   frontend_io_pop_payload_addr;
  wire       [31:0]   frontend_io_pop_payload_data;
  wire       [3:0]    frontend_io_pop_payload_strobe;
  wire                frontend_io_pop_payload_last;
  wire       [3:0]    frontend_io_occupancy;
  wire       [3:0]    frontend_io_availability;
  wire       [31:0]   _zz_fsm_ca;
  wire       [31:0]   _zz_fsm_ca_1;
  wire       [4:0]    _zz_io_phy_cmd_payload_args_9;
  wire                funnel_wantExit;
  reg                 funnel_wantStart;
  wire                funnel_wantKill;
  reg        [31:0]   partitions_0_low;
  reg        [31:0]   partitions_0_high;
  reg                 partitions_0_readable;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [2:0]    fsm_counter;
  reg        [47:0]   fsm_ca;
  reg        [31:0]   fsm_data;
  reg        [1:0]    funnel_stateReg;
  reg        [1:0]    funnel_stateNext;
  wire                ctrl_frontend_io_push_fire;
  wire                when_HyperBusCtrl_l147;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  reg        [2:0]    _zz_io_phy_cmd_payload_args;
  wire                when_HyperBusCtrl_l225;
  reg        [7:0]    _zz_io_phy_cmd_payload_args_1;
  wire                when_HyperBusCtrl_l255;
  reg        [7:0]    _zz_io_phy_cmd_payload_args_2;
  reg                 _zz_io_phy_cmd_payload_args_3;
  reg                 _zz_io_phy_cmd_payload_args_4;
  wire                when_HyperBusCtrl_l270;
  wire                when_HyperBusCtrl_l272;
  wire                when_HyperBusCtrl_l275;
  wire                when_HyperBusCtrl_l278;
  wire                when_HyperBusCtrl_l282;
  reg        [7:0]    _zz_io_phy_cmd_payload_args_5;
  wire                when_HyperBusCtrl_l289;
  wire                when_HyperBusCtrl_l292;
  reg        [7:0]    _zz_io_phy_cmd_payload_args_6;
  wire                when_HyperBusCtrl_l302;
  wire                when_HyperBusCtrl_l307;
  wire                when_HyperBusCtrl_l308;
  reg        [7:0]    _zz_io_phy_cmd_payload_args_7;
  wire                when_HyperBusCtrl_l317;
  reg        [7:0]    _zz_io_phy_cmd_payload_args_8;
  wire                when_HyperBusCtrl_l328;
  wire                when_HyperBusCtrl_l331;
  wire                when_HyperBusCtrl_l342;
  wire                when_HyperBusCtrl_l346;
  wire                when_HyperBusCtrl_l359;
  wire                when_HyperBusCtrl_l360;
  wire                when_HyperBusCtrl_l363;
  wire                when_HyperBusCtrl_l367;
  reg        [31:0]   _zz_fsm_data;
  reg        [31:0]   _zz_fsm_data_1;
  wire                when_HyperBusCtrl_l382;
  reg        [31:0]   _zz_fsm_data_2;
  reg        [31:0]   _zz_fsm_data_3;
  wire                when_HyperBusCtrl_l415;
  wire                io_frontend_fire;
  wire                when_HyperBusCtrl_l425;
  wire                io_config_rsp_fire;
  `ifndef SYNTHESIS
  reg [31:0] io_phy_cmd_payload_mode_string;
  reg [63:0] funnel_stateReg_string;
  reg [63:0] funnel_stateNext_string;
  reg [63:0] fsm_stateReg_string;
  reg [63:0] fsm_stateNext_string;
  `endif


  assign _zz_fsm_ca = frontend_io_pop_payload_addr;
  assign _zz_fsm_ca_1 = frontend_io_pop_payload_addr;
  assign _zz_io_phy_cmd_payload_args_9 = {frontend_io_pop_payload_read,{_zz_io_phy_cmd_payload_args,1'b0}};
  StreamFifo_11 frontend (
    .io_push_valid             (frontend_io_push_valid              ), //i
    .io_push_ready             (frontend_io_push_ready              ), //o
    .io_push_payload_id        (frontend_io_push_payload_id[5:0]    ), //i
    .io_push_payload_read      (frontend_io_push_payload_read       ), //i
    .io_push_payload_memory    (frontend_io_push_payload_memory     ), //i
    .io_push_payload_unaligned (frontend_io_push_payload_unaligned  ), //i
    .io_push_payload_addr      (frontend_io_push_payload_addr[31:0] ), //i
    .io_push_payload_data      (frontend_io_push_payload_data[31:0] ), //i
    .io_push_payload_strobe    (frontend_io_push_payload_strobe[3:0]), //i
    .io_push_payload_last      (frontend_io_push_payload_last       ), //i
    .io_pop_valid              (frontend_io_pop_valid               ), //o
    .io_pop_ready              (frontend_io_pop_ready               ), //i
    .io_pop_payload_id         (frontend_io_pop_payload_id[5:0]     ), //o
    .io_pop_payload_read       (frontend_io_pop_payload_read        ), //o
    .io_pop_payload_memory     (frontend_io_pop_payload_memory      ), //o
    .io_pop_payload_unaligned  (frontend_io_pop_payload_unaligned   ), //o
    .io_pop_payload_addr       (frontend_io_pop_payload_addr[31:0]  ), //o
    .io_pop_payload_data       (frontend_io_pop_payload_data[31:0]  ), //o
    .io_pop_payload_strobe     (frontend_io_pop_payload_strobe[3:0] ), //o
    .io_pop_payload_last       (frontend_io_pop_payload_last        ), //o
    .io_flush                  (frontend_io_flush                   ), //i
    .io_occupancy              (frontend_io_occupancy[3:0]          ), //o
    .io_availability           (frontend_io_availability[3:0]       ), //o
    ._zz_4                     (_zz_1                               ), //i
    ._zz_5                     (_zz_2                               )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_phy_cmd_payload_mode)
      CmdMode_CS : io_phy_cmd_payload_mode_string = "CS  ";
      CmdMode_ADDR : io_phy_cmd_payload_mode_string = "ADDR";
      CmdMode_DATA : io_phy_cmd_payload_mode_string = "DATA";
      default : io_phy_cmd_payload_mode_string = "????";
    endcase
  end
  always @(*) begin
    case(funnel_stateReg)
      funnel_enumDef_BOOT : funnel_stateReg_string = "BOOT    ";
      funnel_enumDef_init : funnel_stateReg_string = "init    ";
      funnel_enumDef_axiBurst : funnel_stateReg_string = "axiBurst";
      default : funnel_stateReg_string = "????????";
    endcase
  end
  always @(*) begin
    case(funnel_stateNext)
      funnel_enumDef_BOOT : funnel_stateNext_string = "BOOT    ";
      funnel_enumDef_init : funnel_stateNext_string = "init    ";
      funnel_enumDef_axiBurst : funnel_stateNext_string = "axiBurst";
      default : funnel_stateNext_string = "????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT    ";
      fsm_enumDef_init : fsm_stateReg_string = "init    ";
      fsm_enumDef_cmdAddr : fsm_stateReg_string = "cmdAddr ";
      fsm_enumDef_write : fsm_stateReg_string = "write   ";
      fsm_enumDef_read : fsm_stateReg_string = "read    ";
      fsm_enumDef_response : fsm_stateReg_string = "response";
      fsm_enumDef_error : fsm_stateReg_string = "error   ";
      default : fsm_stateReg_string = "????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT    ";
      fsm_enumDef_init : fsm_stateNext_string = "init    ";
      fsm_enumDef_cmdAddr : fsm_stateNext_string = "cmdAddr ";
      fsm_enumDef_write : fsm_stateNext_string = "write   ";
      fsm_enumDef_read : fsm_stateNext_string = "read    ";
      fsm_enumDef_response : fsm_stateNext_string = "response";
      fsm_enumDef_error : fsm_stateNext_string = "error   ";
      default : fsm_stateNext_string = "????????";
    endcase
  end
  `endif

  assign io_phy_config_reset_pulse = io_config_phy_reset_pulse;
  assign io_phy_config_reset_halt = io_config_phy_reset_halt;
  assign io_phy_config_reset_trigger = io_config_phy_reset_trigger;
  always @(*) begin
    frontend_io_pop_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
      end
      fsm_enumDef_cmdAddr : begin
      end
      fsm_enumDef_write : begin
      end
      fsm_enumDef_read : begin
      end
      fsm_enumDef_response : begin
        if(frontend_io_pop_payload_memory) begin
          if(io_frontend_fire) begin
            frontend_io_pop_ready = 1'b1;
          end
        end else begin
          if(io_config_rsp_fire) begin
            frontend_io_pop_ready = 1'b1;
          end
        end
      end
      fsm_enumDef_error : begin
        if(frontend_io_pop_payload_memory) begin
          if(io_frontend_fire) begin
            frontend_io_pop_ready = 1'b1;
          end
        end else begin
          if(io_config_rsp_fire) begin
            frontend_io_pop_ready = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign funnel_wantExit = 1'b0;
  always @(*) begin
    funnel_wantStart = 1'b0;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
      end
      funnel_enumDef_axiBurst : begin
      end
      default : begin
        funnel_wantStart = 1'b1;
      end
    endcase
  end

  assign funnel_wantKill = 1'b0;
  always @(*) begin
    frontend_io_push_valid = 1'b0;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(io_config_cmd_valid) begin
          frontend_io_push_valid = 1'b1;
        end else begin
          if(io_controller_valid) begin
            frontend_io_push_valid = 1'b1;
          end
        end
      end
      funnel_enumDef_axiBurst : begin
        if(io_controller_valid) begin
          frontend_io_push_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    frontend_io_push_payload_id = io_controller_payload_id;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(io_config_cmd_valid) begin
          frontend_io_push_payload_id = 6'h00;
        end
      end
      funnel_enumDef_axiBurst : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    frontend_io_push_payload_read = io_controller_payload_read;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(io_config_cmd_valid) begin
          frontend_io_push_payload_read = io_config_cmd_payload[15];
        end
      end
      funnel_enumDef_axiBurst : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    frontend_io_push_payload_memory = io_controller_payload_memory;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(io_config_cmd_valid) begin
          frontend_io_push_payload_memory = 1'b0;
        end
      end
      funnel_enumDef_axiBurst : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    frontend_io_push_payload_unaligned = io_controller_payload_unaligned;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(io_config_cmd_valid) begin
          frontend_io_push_payload_unaligned = 1'b0;
        end
      end
      funnel_enumDef_axiBurst : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    frontend_io_push_payload_addr = io_controller_payload_addr;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(io_config_cmd_valid) begin
          frontend_io_push_payload_addr = {17'h00000,io_config_cmd_payload[14 : 0]};
        end
      end
      funnel_enumDef_axiBurst : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    frontend_io_push_payload_data = io_controller_payload_data;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(io_config_cmd_valid) begin
          frontend_io_push_payload_data = {16'h0000,io_config_cmd_payload[31 : 16]};
        end
      end
      funnel_enumDef_axiBurst : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    frontend_io_push_payload_strobe = io_controller_payload_strobe;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(io_config_cmd_valid) begin
          frontend_io_push_payload_strobe = 4'b0011;
        end
      end
      funnel_enumDef_axiBurst : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    frontend_io_push_payload_last = io_controller_payload_last;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(io_config_cmd_valid) begin
          frontend_io_push_payload_last = 1'b1;
        end
      end
      funnel_enumDef_axiBurst : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_config_cmd_ready = 1'b0;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(io_config_cmd_valid) begin
          if(ctrl_frontend_io_push_fire) begin
            io_config_cmd_ready = 1'b1;
          end
        end
      end
      funnel_enumDef_axiBurst : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_controller_ready = 1'b0;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(!io_config_cmd_valid) begin
          if(io_controller_valid) begin
            if(ctrl_frontend_io_push_fire) begin
              io_controller_ready = 1'b1;
            end
          end
        end
      end
      funnel_enumDef_axiBurst : begin
        if(io_controller_valid) begin
          if(ctrl_frontend_io_push_fire) begin
            io_controller_ready = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_phy_cmd_payload_mode = CmdMode_CS;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
      end
      fsm_enumDef_cmdAddr : begin
        io_phy_cmd_payload_mode = CmdMode_ADDR;
      end
      fsm_enumDef_write : begin
        io_phy_cmd_payload_mode = CmdMode_DATA;
      end
      fsm_enumDef_read : begin
      end
      fsm_enumDef_response : begin
      end
      fsm_enumDef_error : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_phy_cmd_payload_args = 10'h000;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
        if(frontend_io_pop_valid) begin
          io_phy_cmd_payload_args = {5'd0, _zz_io_phy_cmd_payload_args_9};
        end
      end
      fsm_enumDef_cmdAddr : begin
        io_phy_cmd_payload_args = {2'd0, _zz_io_phy_cmd_payload_args_1};
      end
      fsm_enumDef_write : begin
        io_phy_cmd_payload_args = {_zz_io_phy_cmd_payload_args_4,{_zz_io_phy_cmd_payload_args_3,_zz_io_phy_cmd_payload_args_2}};
      end
      fsm_enumDef_read : begin
      end
      fsm_enumDef_response : begin
      end
      fsm_enumDef_error : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_phy_cmd_valid = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
        if(frontend_io_pop_valid) begin
          io_phy_cmd_valid = 1'b1;
        end
      end
      fsm_enumDef_cmdAddr : begin
        io_phy_cmd_valid = 1'b1;
      end
      fsm_enumDef_write : begin
        io_phy_cmd_valid = 1'b1;
      end
      fsm_enumDef_read : begin
      end
      fsm_enumDef_response : begin
      end
      fsm_enumDef_error : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_phy_rsp_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
      end
      fsm_enumDef_cmdAddr : begin
      end
      fsm_enumDef_write : begin
      end
      fsm_enumDef_read : begin
        if(io_phy_rsp_valid) begin
          io_phy_rsp_ready = 1'b1;
        end
      end
      fsm_enumDef_response : begin
      end
      fsm_enumDef_error : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_frontend_valid = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
      end
      fsm_enumDef_cmdAddr : begin
      end
      fsm_enumDef_write : begin
      end
      fsm_enumDef_read : begin
      end
      fsm_enumDef_response : begin
        if(frontend_io_pop_payload_memory) begin
          io_frontend_valid = 1'b1;
        end
      end
      fsm_enumDef_error : begin
        if(frontend_io_pop_payload_memory) begin
          io_frontend_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign io_frontend_payload_id = frontend_io_pop_payload_id;
  assign io_frontend_payload_read = frontend_io_pop_payload_read;
  always @(*) begin
    io_frontend_payload_data = 32'h00000000;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
      end
      fsm_enumDef_cmdAddr : begin
      end
      fsm_enumDef_write : begin
      end
      fsm_enumDef_read : begin
      end
      fsm_enumDef_response : begin
        if(frontend_io_pop_payload_memory) begin
          io_frontend_payload_data = fsm_data;
          if(when_HyperBusCtrl_l415) begin
            io_frontend_payload_data = 32'h00000000;
          end
        end
      end
      fsm_enumDef_error : begin
      end
      default : begin
      end
    endcase
  end

  assign io_frontend_payload_last = frontend_io_pop_payload_last;
  always @(*) begin
    io_frontend_payload_error = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
      end
      fsm_enumDef_cmdAddr : begin
      end
      fsm_enumDef_write : begin
      end
      fsm_enumDef_read : begin
      end
      fsm_enumDef_response : begin
      end
      fsm_enumDef_error : begin
        if(frontend_io_pop_payload_memory) begin
          io_frontend_payload_error = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
      end
      fsm_enumDef_cmdAddr : begin
      end
      fsm_enumDef_write : begin
      end
      fsm_enumDef_read : begin
      end
      fsm_enumDef_response : begin
      end
      fsm_enumDef_error : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    io_config_rsp_valid = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
      end
      fsm_enumDef_cmdAddr : begin
      end
      fsm_enumDef_write : begin
      end
      fsm_enumDef_read : begin
      end
      fsm_enumDef_response : begin
        if(!frontend_io_pop_payload_memory) begin
          io_config_rsp_valid = 1'b1;
        end
      end
      fsm_enumDef_error : begin
        if(!frontend_io_pop_payload_memory) begin
          io_config_rsp_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_config_rsp_payload = 17'h00000;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
      end
      fsm_enumDef_cmdAddr : begin
      end
      fsm_enumDef_write : begin
      end
      fsm_enumDef_read : begin
      end
      fsm_enumDef_response : begin
        if(!frontend_io_pop_payload_memory) begin
          io_config_rsp_payload = {1'b0,fsm_data[15 : 0]};
          if(when_HyperBusCtrl_l425) begin
            io_config_rsp_payload = 17'h00000;
          end
        end
      end
      fsm_enumDef_error : begin
        if(!frontend_io_pop_payload_memory) begin
          io_config_rsp_payload = {1'b1,fsm_data[15 : 0]};
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    funnel_stateNext = funnel_stateReg;
    case(funnel_stateReg)
      funnel_enumDef_init : begin
        if(!io_config_cmd_valid) begin
          if(io_controller_valid) begin
            if(ctrl_frontend_io_push_fire) begin
              if(when_HyperBusCtrl_l147) begin
                funnel_stateNext = funnel_enumDef_axiBurst;
              end
            end
          end
        end
      end
      funnel_enumDef_axiBurst : begin
        if(io_controller_valid) begin
          if(ctrl_frontend_io_push_fire) begin
            if(io_controller_payload_last) begin
              funnel_stateNext = funnel_enumDef_init;
            end
          end
        end
      end
      default : begin
      end
    endcase
    if(funnel_wantStart) begin
      funnel_stateNext = funnel_enumDef_init;
    end
    if(funnel_wantKill) begin
      funnel_stateNext = funnel_enumDef_BOOT;
    end
  end

  assign ctrl_frontend_io_push_fire = (frontend_io_push_valid && frontend_io_push_ready);
  assign when_HyperBusCtrl_l147 = (! io_controller_payload_last);
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
        if(frontend_io_pop_valid) begin
          if(io_phy_cmd_ready) begin
            fsm_stateNext = fsm_enumDef_cmdAddr;
          end
        end
      end
      fsm_enumDef_cmdAddr : begin
        if(io_phy_cmd_ready) begin
          if(when_HyperBusCtrl_l255) begin
            fsm_stateNext = fsm_enumDef_write;
          end
        end
      end
      fsm_enumDef_write : begin
        if(io_phy_cmd_ready) begin
          if(when_HyperBusCtrl_l342) begin
            fsm_stateNext = fsm_enumDef_read;
          end
          if(when_HyperBusCtrl_l346) begin
            fsm_stateNext = fsm_enumDef_read;
          end
        end
      end
      fsm_enumDef_read : begin
        if(io_phy_rsp_valid) begin
          if(io_phy_rsp_payload_last) begin
            fsm_stateNext = fsm_enumDef_response;
          end
        end
      end
      fsm_enumDef_response : begin
        if(frontend_io_pop_payload_memory) begin
          if(io_frontend_fire) begin
            fsm_stateNext = fsm_enumDef_init;
          end
        end else begin
          if(io_config_rsp_fire) begin
            fsm_stateNext = fsm_enumDef_init;
          end
        end
      end
      fsm_enumDef_error : begin
        if(frontend_io_pop_payload_memory) begin
          if(io_frontend_fire) begin
            fsm_stateNext = fsm_enumDef_init;
          end
        end else begin
          if(io_config_rsp_fire) begin
            fsm_stateNext = fsm_enumDef_init;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_init;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  always @(*) begin
    _zz_io_phy_cmd_payload_args = io_config_latencyCycles;
    if(when_HyperBusCtrl_l225) begin
      _zz_io_phy_cmd_payload_args = 3'b000;
    end
  end

  assign when_HyperBusCtrl_l225 = ((! frontend_io_pop_payload_memory) && (! frontend_io_pop_payload_read));
  always @(*) begin
    case(fsm_counter)
      3'b000 : begin
        _zz_io_phy_cmd_payload_args_1 = fsm_ca[47 : 40];
      end
      3'b001 : begin
        _zz_io_phy_cmd_payload_args_1 = fsm_ca[39 : 32];
      end
      3'b010 : begin
        _zz_io_phy_cmd_payload_args_1 = fsm_ca[31 : 24];
      end
      3'b011 : begin
        _zz_io_phy_cmd_payload_args_1 = fsm_ca[23 : 16];
      end
      3'b100 : begin
        _zz_io_phy_cmd_payload_args_1 = fsm_ca[15 : 8];
      end
      3'b101 : begin
        _zz_io_phy_cmd_payload_args_1 = fsm_ca[7 : 0];
      end
      default : begin
        _zz_io_phy_cmd_payload_args_1 = 8'h00;
      end
    endcase
  end

  assign when_HyperBusCtrl_l255 = (fsm_counter == 3'b101);
  always @(*) begin
    _zz_io_phy_cmd_payload_args_2 = 8'h00;
    if(when_HyperBusCtrl_l270) begin
      _zz_io_phy_cmd_payload_args_2 = frontend_io_pop_payload_data[7 : 0];
    end
    if(when_HyperBusCtrl_l282) begin
      if(frontend_io_pop_payload_unaligned) begin
        _zz_io_phy_cmd_payload_args_2 = _zz_io_phy_cmd_payload_args_5;
      end else begin
        _zz_io_phy_cmd_payload_args_2 = _zz_io_phy_cmd_payload_args_6;
      end
    end
    if(when_HyperBusCtrl_l307) begin
      if(when_HyperBusCtrl_l308) begin
        _zz_io_phy_cmd_payload_args_2 = _zz_io_phy_cmd_payload_args_7;
      end else begin
        _zz_io_phy_cmd_payload_args_2 = _zz_io_phy_cmd_payload_args_8;
      end
    end
  end

  always @(*) begin
    _zz_io_phy_cmd_payload_args_3 = 1'b1;
    if(when_HyperBusCtrl_l270) begin
      if(when_HyperBusCtrl_l272) begin
        _zz_io_phy_cmd_payload_args_3 = 1'b0;
      end
      if(when_HyperBusCtrl_l275) begin
        _zz_io_phy_cmd_payload_args_3 = 1'b0;
      end
    end
    if(when_HyperBusCtrl_l282) begin
      if(frontend_io_pop_payload_unaligned) begin
        if(when_HyperBusCtrl_l289) begin
          _zz_io_phy_cmd_payload_args_3 = 1'b0;
        end
      end else begin
        _zz_io_phy_cmd_payload_args_3 = 1'b0;
      end
    end
    if(when_HyperBusCtrl_l307) begin
      if(when_HyperBusCtrl_l308) begin
        _zz_io_phy_cmd_payload_args_3 = 1'b0;
      end else begin
        if(when_HyperBusCtrl_l328) begin
          _zz_io_phy_cmd_payload_args_3 = 1'b0;
        end
      end
    end
  end

  always @(*) begin
    _zz_io_phy_cmd_payload_args_4 = 1'b0;
    if(when_HyperBusCtrl_l270) begin
      if(when_HyperBusCtrl_l278) begin
        _zz_io_phy_cmd_payload_args_4 = 1'b1;
      end
    end
    if(when_HyperBusCtrl_l282) begin
      if(frontend_io_pop_payload_unaligned) begin
        if(when_HyperBusCtrl_l292) begin
          _zz_io_phy_cmd_payload_args_4 = 1'b1;
        end
      end else begin
        if(when_HyperBusCtrl_l302) begin
          _zz_io_phy_cmd_payload_args_4 = 1'b1;
        end
      end
    end
    if(when_HyperBusCtrl_l307) begin
      if(when_HyperBusCtrl_l308) begin
        if(when_HyperBusCtrl_l317) begin
          _zz_io_phy_cmd_payload_args_4 = 1'b1;
        end
      end else begin
        if(when_HyperBusCtrl_l331) begin
          _zz_io_phy_cmd_payload_args_4 = 1'b1;
        end
      end
    end
  end

  assign when_HyperBusCtrl_l270 = (frontend_io_pop_payload_strobe == 4'b0001);
  assign when_HyperBusCtrl_l272 = (frontend_io_pop_payload_unaligned && (fsm_counter == 3'b000));
  assign when_HyperBusCtrl_l275 = ((! frontend_io_pop_payload_unaligned) && (fsm_counter == 3'b001));
  assign when_HyperBusCtrl_l278 = (fsm_counter == 3'b001);
  assign when_HyperBusCtrl_l282 = (frontend_io_pop_payload_strobe == 4'b0011);
  always @(*) begin
    case(fsm_counter)
      3'b000 : begin
        _zz_io_phy_cmd_payload_args_5 = frontend_io_pop_payload_data[7 : 0];
      end
      3'b011 : begin
        _zz_io_phy_cmd_payload_args_5 = frontend_io_pop_payload_data[15 : 8];
      end
      default : begin
        _zz_io_phy_cmd_payload_args_5 = 8'h00;
      end
    endcase
  end

  assign when_HyperBusCtrl_l289 = ((fsm_counter == 3'b001) || (fsm_counter == 3'b011));
  assign when_HyperBusCtrl_l292 = (fsm_counter == 3'b011);
  always @(*) begin
    case(fsm_counter)
      3'b000 : begin
        _zz_io_phy_cmd_payload_args_6 = frontend_io_pop_payload_data[15 : 8];
      end
      3'b001 : begin
        _zz_io_phy_cmd_payload_args_6 = frontend_io_pop_payload_data[7 : 0];
      end
      default : begin
        _zz_io_phy_cmd_payload_args_6 = 8'h00;
      end
    endcase
  end

  assign when_HyperBusCtrl_l302 = (fsm_counter == 3'b001);
  assign when_HyperBusCtrl_l307 = (frontend_io_pop_payload_strobe == 4'b1111);
  assign when_HyperBusCtrl_l308 = (! frontend_io_pop_payload_unaligned);
  always @(*) begin
    case(fsm_counter)
      3'b000 : begin
        _zz_io_phy_cmd_payload_args_7 = frontend_io_pop_payload_data[15 : 8];
      end
      3'b001 : begin
        _zz_io_phy_cmd_payload_args_7 = frontend_io_pop_payload_data[7 : 0];
      end
      3'b010 : begin
        _zz_io_phy_cmd_payload_args_7 = frontend_io_pop_payload_data[31 : 24];
      end
      3'b011 : begin
        _zz_io_phy_cmd_payload_args_7 = frontend_io_pop_payload_data[23 : 16];
      end
      default : begin
        _zz_io_phy_cmd_payload_args_7 = 8'h00;
      end
    endcase
  end

  assign when_HyperBusCtrl_l317 = (fsm_counter == 3'b011);
  always @(*) begin
    case(fsm_counter)
      3'b000 : begin
        _zz_io_phy_cmd_payload_args_8 = frontend_io_pop_payload_data[7 : 0];
      end
      3'b010 : begin
        _zz_io_phy_cmd_payload_args_8 = frontend_io_pop_payload_data[23 : 16];
      end
      3'b011 : begin
        _zz_io_phy_cmd_payload_args_8 = frontend_io_pop_payload_data[15 : 8];
      end
      3'b101 : begin
        _zz_io_phy_cmd_payload_args_8 = frontend_io_pop_payload_data[31 : 24];
      end
      default : begin
        _zz_io_phy_cmd_payload_args_8 = 8'h00;
      end
    endcase
  end

  assign when_HyperBusCtrl_l328 = ((((fsm_counter == 3'b001) || (fsm_counter == 3'b010)) || (fsm_counter == 3'b011)) || (fsm_counter == 3'b101));
  assign when_HyperBusCtrl_l331 = (fsm_counter == 3'b011);
  assign when_HyperBusCtrl_l342 = (frontend_io_pop_payload_memory && _zz_io_phy_cmd_payload_args_4);
  assign when_HyperBusCtrl_l346 = ((! frontend_io_pop_payload_memory) && (fsm_counter == 3'b001));
  assign when_HyperBusCtrl_l359 = (frontend_io_pop_payload_strobe == 4'b0001);
  assign when_HyperBusCtrl_l360 = (frontend_io_pop_payload_unaligned && (fsm_counter == 3'b000));
  assign when_HyperBusCtrl_l363 = ((! frontend_io_pop_payload_unaligned) && (fsm_counter == 3'b001));
  assign when_HyperBusCtrl_l367 = (frontend_io_pop_payload_strobe == 4'b0011);
  always @(*) begin
    case(fsm_counter)
      3'b000 : begin
        _zz_fsm_data = {fsm_data[31 : 8],io_phy_rsp_payload_data};
      end
      3'b011 : begin
        _zz_fsm_data = {{fsm_data[31 : 16],io_phy_rsp_payload_data},fsm_data[7 : 0]};
      end
      default : begin
        _zz_fsm_data = fsm_data;
      end
    endcase
  end

  always @(*) begin
    case(fsm_counter)
      3'b000 : begin
        _zz_fsm_data_1 = {{fsm_data[31 : 16],io_phy_rsp_payload_data},fsm_data[7 : 0]};
      end
      3'b001 : begin
        _zz_fsm_data_1 = {fsm_data[31 : 8],io_phy_rsp_payload_data};
      end
      default : begin
        _zz_fsm_data_1 = fsm_data;
      end
    endcase
  end

  assign when_HyperBusCtrl_l382 = (frontend_io_pop_payload_strobe == 4'b1111);
  always @(*) begin
    case(fsm_counter)
      3'b000 : begin
        _zz_fsm_data_2 = {fsm_data[31 : 8],io_phy_rsp_payload_data};
      end
      3'b010 : begin
        _zz_fsm_data_2 = {{fsm_data[31 : 24],io_phy_rsp_payload_data},fsm_data[15 : 0]};
      end
      3'b011 : begin
        _zz_fsm_data_2 = {{fsm_data[31 : 16],io_phy_rsp_payload_data},fsm_data[7 : 0]};
      end
      3'b101 : begin
        _zz_fsm_data_2 = {io_phy_rsp_payload_data,fsm_data[23 : 0]};
      end
      default : begin
        _zz_fsm_data_2 = fsm_data;
      end
    endcase
  end

  always @(*) begin
    case(fsm_counter)
      3'b000 : begin
        _zz_fsm_data_3 = {{fsm_data[31 : 16],io_phy_rsp_payload_data},fsm_data[7 : 0]};
      end
      3'b001 : begin
        _zz_fsm_data_3 = {fsm_data[31 : 8],io_phy_rsp_payload_data};
      end
      3'b010 : begin
        _zz_fsm_data_3 = {io_phy_rsp_payload_data,fsm_data[23 : 0]};
      end
      3'b011 : begin
        _zz_fsm_data_3 = {{fsm_data[31 : 24],io_phy_rsp_payload_data},fsm_data[15 : 0]};
      end
      default : begin
        _zz_fsm_data_3 = fsm_data;
      end
    endcase
  end

  assign when_HyperBusCtrl_l415 = (! frontend_io_pop_payload_read);
  assign io_frontend_fire = (io_frontend_valid && io_frontend_ready);
  assign when_HyperBusCtrl_l425 = (! frontend_io_pop_payload_read);
  assign io_config_rsp_fire = (io_config_rsp_valid && io_config_rsp_ready);
  assign frontend_io_flush = 1'b0;
  always @(posedge _zz_1) begin
    partitions_0_low <= 32'h00000000;
    partitions_0_high <= 32'h00800000;
    partitions_0_readable <= 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_init : begin
        if(frontend_io_pop_valid) begin
          fsm_counter <= 3'b000;
          fsm_data <= 32'h00000000;
          fsm_ca[47] <= frontend_io_pop_payload_read;
          fsm_ca[46] <= (! frontend_io_pop_payload_memory);
          fsm_ca[45] <= 1'b1;
          fsm_ca[44 : 16] <= _zz_fsm_ca[31 : 3];
          fsm_ca[15 : 3] <= 13'h0000;
          fsm_ca[2 : 0] <= _zz_fsm_ca_1[2 : 0];
        end
      end
      fsm_enumDef_cmdAddr : begin
        if(io_phy_cmd_ready) begin
          fsm_counter <= (fsm_counter + 3'b001);
          if(when_HyperBusCtrl_l255) begin
            fsm_counter <= 3'b000;
          end
        end
      end
      fsm_enumDef_write : begin
        if(io_phy_cmd_ready) begin
          fsm_counter <= (fsm_counter + 3'b001);
          if(when_HyperBusCtrl_l342) begin
            fsm_counter <= 3'b000;
          end
          if(when_HyperBusCtrl_l346) begin
            fsm_counter <= 3'b000;
          end
        end
      end
      fsm_enumDef_read : begin
        if(io_phy_rsp_valid) begin
          if(when_HyperBusCtrl_l359) begin
            if(when_HyperBusCtrl_l360) begin
              fsm_data[7 : 0] <= io_phy_rsp_payload_data;
            end
            if(when_HyperBusCtrl_l363) begin
              fsm_data[7 : 0] <= io_phy_rsp_payload_data;
            end
          end
          if(when_HyperBusCtrl_l367) begin
            if(frontend_io_pop_payload_unaligned) begin
              fsm_data <= _zz_fsm_data;
            end else begin
              fsm_data <= _zz_fsm_data_1;
            end
          end
          if(when_HyperBusCtrl_l382) begin
            if(frontend_io_pop_payload_unaligned) begin
              fsm_data <= _zz_fsm_data_2;
            end else begin
              fsm_data <= _zz_fsm_data_3;
            end
          end
          fsm_counter <= (fsm_counter + 3'b001);
          if(io_phy_rsp_payload_last) begin
            fsm_counter <= 3'b000;
          end
        end
      end
      fsm_enumDef_response : begin
      end
      fsm_enumDef_error : begin
      end
      default : begin
      end
    endcase
  end

  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      funnel_stateReg <= funnel_enumDef_BOOT;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      funnel_stateReg <= funnel_stateNext;
      fsm_stateReg <= fsm_stateNext;
    end
  end


endmodule

module BufferCC_4 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge _zz_1) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module StreamFifo_10 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload_error,
  input  wire [31:0]   io_push_payload_inst,
  output reg           io_pop_valid,
  input  wire          io_pop_ready,
  output reg           io_pop_payload_error,
  output reg  [31:0]   io_pop_payload_inst,
  input  wire          io_flush,
  output wire [1:0]    io_occupancy,
  output wire [1:0]    io_availability,
  input  wire          _zz_4,
  input  wire          _zz_5
);

  wire       [32:0]   _zz_logic_ram_port1;
  wire       [32:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  reg                 logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [1:0]    logic_ptr_push;
  reg        [1:0]    logic_ptr_pop;
  wire       [1:0]    logic_ptr_occupancy;
  wire       [1:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [0:0]    logic_push_onRam_write_payload_address;
  wire                logic_push_onRam_write_payload_data_error;
  wire       [31:0]   logic_push_onRam_write_payload_data_inst;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [0:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_async_readed_error;
  wire       [31:0]   logic_pop_async_readed_inst;
  wire       [32:0]   _zz_logic_pop_async_readed_error;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;
  wire                logic_pop_addressGen_translated_payload_error;
  wire       [31:0]   logic_pop_addressGen_translated_payload_inst;
  (* ram_style = "distributed" *) reg [32:0] logic_ram [0:1];

  assign _zz_logic_ram_port = {logic_push_onRam_write_payload_data_inst,logic_push_onRam_write_payload_data_error};
  always @(posedge _zz_4) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  assign _zz_logic_ram_port1 = logic_ram[logic_pop_addressGen_payload];
  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 2'b10) == 2'b00);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  always @(*) begin
    logic_ptr_doPush = io_push_fire;
    if(logic_ptr_empty) begin
      if(io_pop_ready) begin
        logic_ptr_doPush = 1'b0;
      end
    end
  end

  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[0:0];
  assign logic_push_onRam_write_payload_data_error = io_push_payload_error;
  assign logic_push_onRam_write_payload_data_inst = io_push_payload_inst;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[0:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign _zz_logic_pop_async_readed_error = _zz_logic_ram_port1;
  assign logic_pop_async_readed_error = _zz_logic_pop_async_readed_error[0];
  assign logic_pop_async_readed_inst = _zz_logic_pop_async_readed_error[32 : 1];
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  assign logic_pop_addressGen_translated_payload_error = logic_pop_async_readed_error;
  assign logic_pop_addressGen_translated_payload_inst = logic_pop_async_readed_inst;
  always @(*) begin
    io_pop_valid = logic_pop_addressGen_translated_valid;
    if(logic_ptr_empty) begin
      io_pop_valid = io_push_valid;
    end
  end

  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  always @(*) begin
    io_pop_payload_error = logic_pop_addressGen_translated_payload_error;
    if(logic_ptr_empty) begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @(*) begin
    io_pop_payload_inst = logic_pop_addressGen_translated_payload_inst;
    if(logic_ptr_empty) begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (2'b10 - logic_ptr_occupancy);
  always @(posedge _zz_4) begin
    if(!_zz_5) begin
      logic_ptr_push <= 2'b00;
      logic_ptr_pop <= 2'b00;
      logic_ptr_wentUp <= 1'b0;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 2'b01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 2'b01);
      end
      if(io_flush) begin
        logic_ptr_push <= 2'b00;
        logic_ptr_pop <= 2'b00;
      end
    end
  end


endmodule

module BufferCC_5 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          _zz_1,
  input  wire          _zz_2
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge _zz_1) begin
    if(!_zz_2) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module StreamFifo_11 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [5:0]    io_push_payload_id,
  input  wire          io_push_payload_read,
  input  wire          io_push_payload_memory,
  input  wire          io_push_payload_unaligned,
  input  wire [31:0]   io_push_payload_addr,
  input  wire [31:0]   io_push_payload_data,
  input  wire [3:0]    io_push_payload_strobe,
  input  wire          io_push_payload_last,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [5:0]    io_pop_payload_id,
  output wire          io_pop_payload_read,
  output wire          io_pop_payload_memory,
  output wire          io_pop_payload_unaligned,
  output wire [31:0]   io_pop_payload_addr,
  output wire [31:0]   io_pop_payload_data,
  output wire [3:0]    io_pop_payload_strobe,
  output wire          io_pop_payload_last,
  input  wire          io_flush,
  output wire [3:0]    io_occupancy,
  output wire [3:0]    io_availability,
  input  wire          _zz_4,
  input  wire          _zz_5
);

  reg        [77:0]   _zz_logic_ram_port1;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter_1;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_2;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter_3;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_4;
  wire       [77:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [3:0]    logic_ptr_push;
  reg        [3:0]    logic_ptr_pop;
  wire       [3:0]    logic_ptr_occupancy;
  wire       [3:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                when_Stream_l1240;
  wire                when_Stream_l1244;
  reg        [3:0]    logic_ptr_notPow2_counter;
  wire                io_push_fire;
  wire                io_pop_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [5:0]    logic_push_onRam_write_payload_data_id;
  wire                logic_push_onRam_write_payload_data_read;
  wire                logic_push_onRam_write_payload_data_memory;
  wire                logic_push_onRam_write_payload_data_unaligned;
  wire       [31:0]   logic_push_onRam_write_payload_data_addr;
  wire       [31:0]   logic_push_onRam_write_payload_data_data;
  wire       [3:0]    logic_push_onRam_write_payload_data_strobe;
  wire                logic_push_onRam_write_payload_data_last;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [3:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [5:0]    logic_pop_sync_readPort_rsp_id;
  wire                logic_pop_sync_readPort_rsp_read;
  wire                logic_pop_sync_readPort_rsp_memory;
  wire                logic_pop_sync_readPort_rsp_unaligned;
  wire       [31:0]   logic_pop_sync_readPort_rsp_addr;
  wire       [31:0]   logic_pop_sync_readPort_rsp_data;
  wire       [3:0]    logic_pop_sync_readPort_rsp_strobe;
  wire                logic_pop_sync_readPort_rsp_last;
  wire       [77:0]   _zz_logic_pop_sync_readPort_rsp_id;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire       [5:0]    logic_pop_sync_readArbitation_translated_payload_id;
  wire                logic_pop_sync_readArbitation_translated_payload_read;
  wire                logic_pop_sync_readArbitation_translated_payload_memory;
  wire                logic_pop_sync_readArbitation_translated_payload_unaligned;
  wire       [31:0]   logic_pop_sync_readArbitation_translated_payload_addr;
  wire       [31:0]   logic_pop_sync_readArbitation_translated_payload_data;
  wire       [3:0]    logic_pop_sync_readArbitation_translated_payload_strobe;
  wire                logic_pop_sync_readArbitation_translated_payload_last;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [3:0]    logic_pop_sync_popReg;
  reg [77:0] logic_ram [0:11];

  assign _zz_logic_ptr_notPow2_counter = (logic_ptr_notPow2_counter + _zz_logic_ptr_notPow2_counter_1);
  assign _zz_logic_ptr_notPow2_counter_2 = io_push_fire;
  assign _zz_logic_ptr_notPow2_counter_1 = {3'd0, _zz_logic_ptr_notPow2_counter_2};
  assign _zz_logic_ptr_notPow2_counter_4 = io_pop_fire;
  assign _zz_logic_ptr_notPow2_counter_3 = {3'd0, _zz_logic_ptr_notPow2_counter_4};
  assign _zz_logic_ram_port = {logic_push_onRam_write_payload_data_last,{logic_push_onRam_write_payload_data_strobe,{logic_push_onRam_write_payload_data_data,{logic_push_onRam_write_payload_data_addr,{logic_push_onRam_write_payload_data_unaligned,{logic_push_onRam_write_payload_data_memory,{logic_push_onRam_write_payload_data_read,logic_push_onRam_write_payload_data_id}}}}}}};
  always @(posedge _zz_4) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = ((logic_ptr_push == logic_ptr_popOnIo) && logic_ptr_wentUp);
  assign logic_ptr_empty = ((logic_ptr_push == logic_ptr_pop) && (! logic_ptr_wentUp));
  assign when_Stream_l1240 = (logic_ptr_push == 4'b1011);
  assign when_Stream_l1244 = (logic_ptr_pop == 4'b1011);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign logic_ptr_occupancy = logic_ptr_notPow2_counter;
  assign io_push_ready = (! logic_ptr_full);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push;
  assign logic_push_onRam_write_payload_data_id = io_push_payload_id;
  assign logic_push_onRam_write_payload_data_read = io_push_payload_read;
  assign logic_push_onRam_write_payload_data_memory = io_push_payload_memory;
  assign logic_push_onRam_write_payload_data_unaligned = io_push_payload_unaligned;
  assign logic_push_onRam_write_payload_data_addr = io_push_payload_addr;
  assign logic_push_onRam_write_payload_data_data = io_push_payload_data;
  assign logic_push_onRam_write_payload_data_strobe = io_push_payload_strobe;
  assign logic_push_onRam_write_payload_data_last = io_push_payload_last;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop;
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_id = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_rsp_id = _zz_logic_pop_sync_readPort_rsp_id[5 : 0];
  assign logic_pop_sync_readPort_rsp_read = _zz_logic_pop_sync_readPort_rsp_id[6];
  assign logic_pop_sync_readPort_rsp_memory = _zz_logic_pop_sync_readPort_rsp_id[7];
  assign logic_pop_sync_readPort_rsp_unaligned = _zz_logic_pop_sync_readPort_rsp_id[8];
  assign logic_pop_sync_readPort_rsp_addr = _zz_logic_pop_sync_readPort_rsp_id[40 : 9];
  assign logic_pop_sync_readPort_rsp_data = _zz_logic_pop_sync_readPort_rsp_id[72 : 41];
  assign logic_pop_sync_readPort_rsp_strobe = _zz_logic_pop_sync_readPort_rsp_id[76 : 73];
  assign logic_pop_sync_readPort_rsp_last = _zz_logic_pop_sync_readPort_rsp_id[77];
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload_id = logic_pop_sync_readPort_rsp_id;
  assign logic_pop_sync_readArbitation_translated_payload_read = logic_pop_sync_readPort_rsp_read;
  assign logic_pop_sync_readArbitation_translated_payload_memory = logic_pop_sync_readPort_rsp_memory;
  assign logic_pop_sync_readArbitation_translated_payload_unaligned = logic_pop_sync_readPort_rsp_unaligned;
  assign logic_pop_sync_readArbitation_translated_payload_addr = logic_pop_sync_readPort_rsp_addr;
  assign logic_pop_sync_readArbitation_translated_payload_data = logic_pop_sync_readPort_rsp_data;
  assign logic_pop_sync_readArbitation_translated_payload_strobe = logic_pop_sync_readPort_rsp_strobe;
  assign logic_pop_sync_readArbitation_translated_payload_last = logic_pop_sync_readPort_rsp_last;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_id = logic_pop_sync_readArbitation_translated_payload_id;
  assign io_pop_payload_read = logic_pop_sync_readArbitation_translated_payload_read;
  assign io_pop_payload_memory = logic_pop_sync_readArbitation_translated_payload_memory;
  assign io_pop_payload_unaligned = logic_pop_sync_readArbitation_translated_payload_unaligned;
  assign io_pop_payload_addr = logic_pop_sync_readArbitation_translated_payload_addr;
  assign io_pop_payload_data = logic_pop_sync_readArbitation_translated_payload_data;
  assign io_pop_payload_strobe = logic_pop_sync_readArbitation_translated_payload_strobe;
  assign io_pop_payload_last = logic_pop_sync_readArbitation_translated_payload_last;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (4'b1100 - logic_ptr_occupancy);
  always @(posedge _zz_4) begin
    if(!_zz_5) begin
      logic_ptr_push <= 4'b0000;
      logic_ptr_pop <= 4'b0000;
      logic_ptr_wentUp <= 1'b0;
      logic_ptr_notPow2_counter <= 4'b0000;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 4'b0000;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 4'b0001);
        if(when_Stream_l1240) begin
          logic_ptr_push <= 4'b0000;
        end
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 4'b0001);
        if(when_Stream_l1244) begin
          logic_ptr_pop <= 4'b0000;
        end
      end
      if(io_flush) begin
        logic_ptr_push <= 4'b0000;
        logic_ptr_pop <= 4'b0000;
      end
      logic_ptr_notPow2_counter <= (_zz_logic_ptr_notPow2_counter - _zz_logic_ptr_notPow2_counter_3);
      if(io_flush) begin
        logic_ptr_notPow2_counter <= 4'b0000;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 4'b0000;
      end
    end
  end

  always @(posedge _zz_4) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule
