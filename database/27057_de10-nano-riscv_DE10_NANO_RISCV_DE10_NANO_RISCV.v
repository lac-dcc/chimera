// This program was cloned from: https://github.com/thinkoco/de10-nano-riscv
// License: Apache License 2.0

//`define ENABLE_HPS

module DE10_NANO_RISCV(

      ///////// ADC /////////
      output             ADC_CONVST       ,
      output             ADC_SCK          ,
      output             ADC_SDI          ,
      input              ADC_SDO          ,

      ///////// ARDUINO /////////
      inout       [15:0] ARDUINO_IO       ,
      inout              ARDUINO_RESET_N  ,

      ///////// FPGA /////////
      input              FPGA_CLK1_50     ,
      input              FPGA_CLK2_50     ,
      input              FPGA_CLK3_50     ,

      ///////// GPIO /////////
      inout       [35:0] GPIO_0           ,
      //inout       [35:12] GPIO_1           ,

      ///////// HDMI /////////
      inout              HDMI_I2C_SCL     ,
      inout              HDMI_I2C_SDA     ,
      inout              HDMI_I2S         ,
      inout              HDMI_LRCLK       ,
      inout              HDMI_MCLK        ,
      inout              HDMI_SCLK        ,
      output             HDMI_TX_CLK      ,
      output      [23:0] HDMI_TX_D        ,
      output             HDMI_TX_DE       ,
      output             HDMI_TX_HS       ,
      input              HDMI_TX_INT      ,
      output             HDMI_TX_VS       ,

`ifdef ENABLE_HPS
      ///////// HPS /////////
      inout              HPS_CONV_USB_N   ,
      output      [14:0] HPS_DDR3_ADDR    ,
      output      [2:0]  HPS_DDR3_BA      ,
      output             HPS_DDR3_CAS_N   ,
      output             HPS_DDR3_CKE     ,
      output             HPS_DDR3_CK_N    ,
      output             HPS_DDR3_CK_P    ,
      output             HPS_DDR3_CS_N    ,
      output      [3:0]  HPS_DDR3_DM      ,
      inout       [31:0] HPS_DDR3_DQ      ,
      inout       [3:0]  HPS_DDR3_DQS_N   ,
      inout       [3:0]  HPS_DDR3_DQS_P   ,
      output             HPS_DDR3_ODT     ,
      output             HPS_DDR3_RAS_N   ,
      output             HPS_DDR3_RESET_N ,
      input              HPS_DDR3_RZQ     ,
      output             HPS_DDR3_WE_N    ,
      output             HPS_ENET_GTX_CLK ,
      inout              HPS_ENET_INT_N   ,
      output             HPS_ENET_MDC     ,
      inout              HPS_ENET_MDIO    ,
      input              HPS_ENET_RX_CLK  ,
      input       [3:0]  HPS_ENET_RX_DATA ,
      input              HPS_ENET_RX_DV   ,
      output      [3:0]  HPS_ENET_TX_DATA ,
      output             HPS_ENET_TX_EN   ,
      inout              HPS_GSENSOR_INT  ,
      inout              HPS_I2C0_SCLK    ,
      inout              HPS_I2C0_SDAT    ,
      inout              HPS_I2C1_SCLK    ,
      inout              HPS_I2C1_SDAT    ,
      inout              HPS_KEY          ,
      inout              HPS_LED          ,
      inout              HPS_LTC_GPIO     ,
      output             HPS_SD_CLK       ,
      inout              HPS_SD_CMD       ,
      inout       [3:0]  HPS_SD_DATA      ,
      output             HPS_SPIM_CLK     ,
      input              HPS_SPIM_MISO    ,
      output             HPS_SPIM_MOSI    ,
      inout              HPS_SPIM_SS      ,
      input              HPS_UART_RX      ,
      output             HPS_UART_TX      ,
      input              HPS_USB_CLKOUT   ,
      inout       [7:0]  HPS_USB_DATA     ,
      input              HPS_USB_DIR      ,
      input              HPS_USB_NXT      ,
      output             HPS_USB_STP      ,
`endif /*ENABLE_HPS*/

      input              RISCV_UART_RX    , // GPIO_1[0]
      output             RISCV_UART_TX    , // GPIO_1[1]

      input              RISCV_JTAG_TCK   , // GPIO_1[2]
      input              RISCV_JTAG_TMS   , // GPIO_1[3]
      output             RISCV_JTAG_TDO   , // GPIO_1[4]
      input              RISCV_JTAG_TDI   , // GPIO_1[5]

      output             RISCV_QSPI_CS    ,
      output             RISCV_QSPI_SCK   ,
      inout       [3:0]  RISCV_QSPI_DQ    ,
      ///////// KEY /////////
      input       [1:0]  KEY              ,

      ///////// LED /////////
      output      [7:0]  LED              ,

      ///////// SW /////////
      input       [3:0]  SW
);


//=======================================================
//  REG/WIRE declarations
//=======================================================


  wire        mmcm_locked                   ;
  wire        reset_periph                  ;
  // All wires connected to the chip top
  wire        dut_clock                     ;
  wire        dut_reset                     ;

  wire        e203_jtag_TCK_i_ival          ;
  wire        e203_jtag_TMS_i_ival          ;
  wire        e203_jtag_TMS_o_oval          ;
  wire        e203_jtag_TMS_o_oe            ;
  wire        e203_jtag_TMS_o_ie            ;
  wire        e203_jtag_TMS_o_pue           ;
  wire        e203_jtag_TMS_o_ds            ;
  wire        e203_jtag_TDI_i_ival          ;
  wire        e203_jtag_TDO_o_oval          ;
  wire        e203_jtag_TDO_o_oe            ;

  wire [31:0] e203_i_ival_gpio              ;
  wire [31:0] e203_o_oval_gpio              ;
  wire [31:0] e203_o_oe_gpio                ;
  wire [31:0] e203_o_ie_gpio                ;
  wire [31:0] e203_o_pue_gpio               ;
  wire [31:0] e203_o_ds_gpio                ;

  wire        e203_qspi_sck_o_oval          ;
  wire        e203_qspi_cs_0_o_oval         ;
  wire [ 3:0] e203_qspi_i_ival_dq           ;
  wire [ 3:0] e203_qspi_o_oval_dq           ;
  wire [ 3:0] e203_qspi_o_oe_dq             ;
  wire [ 3:0] e203_qspi_o_ie_dq             ;
  wire [ 3:0] e203_qspi_o_pue_dq            ;
  wire [ 3:0] e203_qspi_o_ds_dq             ;

  wire        e203_aon_erst_n_i_ival        ;
  wire        e203_aon_pmu_dwakeup_n_i_ival ;
  wire        e203_aon_pmu_vddpaden_o_oval  ;
  wire        e203_aon_pmu_padrst_o_oval    ;
  wire        e203_bootrom_n_i_ival         ;
  wire        e203_dbgmode0_n_i_ival        ;
  wire        e203_dbgmode1_n_i_ival        ;
  wire        e203_dbgmode2_n_i_ival        ;

  //=================================================
  // Clock & Reset

  wire clk_8388 ;
  wire clk_16M  ;
  wire slowclk  ;
  
  riscv_pll  riscv_pll_inst (
		                     .refclk   ( FPGA_CLK1_50 ) ,  //  refclk.clk
		                     .rst      ( 1'b0         ) ,  //   reset.reset
		                     .outclk_0 ( clk_16M      ) ,  //16MHz
		                     .outclk_1 ( clk_8388     ) ,  //  8.388 MHz = 32.768 kHz * 256
		                     .locked   ( mmcm_locked  )    //  locked.export
	                        );

  clkdivider slowclkgen (
                         .clk     ( clk_8388     ) ,// We use this clock divide to 32.768KHz
                         .reset   ( ~mmcm_locked ) ,
                         .clk_out ( slowclk      )
                        );

  reset_sys ip_reset_sys (
                          .slowest_sync_clk     ( slowclk         ) ,
                          //.ext_reset_in       ( KEY[0] & SRST_n ) , // Active-low
                          .ext_reset_in         ( KEY[0]          ) , // Active-low
                          .aux_reset_in         ( 1'b1            ) ,
                          .mb_debug_sys_rst     ( 1'b0            ) ,
                          .dcm_locked           ( mmcm_locked     ) ,
                          .mb_reset             (                 ) ,
                          .bus_struct_reset     (                 ) ,
                          .peripheral_reset     ( reset_periph    ) ,
                          .interconnect_aresetn (                 ) ,
                          .peripheral_aresetn   (                 )
                        );

  //=================================================
  // SPI Interface

  wire [3:0] qspi_ui_dq_o ;
  wire [3:0] qspi_ui_dq_oe;
  wire [3:0] qspi_ui_dq_i ;
   
  assign RISCV_QSPI_DQ[0]   = qspi_ui_dq_oe ? qspi_ui_dq_o[0] : 1'bz;
  assign RISCV_QSPI_DQ[1]   = qspi_ui_dq_oe ? qspi_ui_dq_o[1] : 1'bz;
  assign RISCV_QSPI_DQ[2]   = qspi_ui_dq_oe ? qspi_ui_dq_o[2] : 1'bz;
  assign RISCV_QSPI_DQ[3]   = qspi_ui_dq_oe ? qspi_ui_dq_o[3] : 1'bz;

  assign qspi_ui_dq_i[0] = RISCV_QSPI_DQ[0]; 
  assign qspi_ui_dq_i[1] = RISCV_QSPI_DQ[1]; 
  assign qspi_ui_dq_i[2] = RISCV_QSPI_DQ[2]; 
  assign qspi_ui_dq_i[3] = RISCV_QSPI_DQ[3]; 
 
  assign qspi_ui_dq_o        = e203_qspi_o_oval_dq;
  assign qspi_ui_dq_oe       = e203_qspi_o_oe_dq;
  assign e203_qspi_i_ival_dq = qspi_ui_dq_i;
  assign RISCV_QSPI_SCK      = e203_qspi_sck_o_oval;
  assign RISCV_QSPI_CS       = e203_qspi_cs_0_o_oval;

  //=================================================
  // IOBUF instantiation for GPIOs
  
  
  assign GPIO_0[00] = e203_o_oe_gpio[00] ? e203_o_oval_gpio[00] : 1'bz;
  assign GPIO_0[01] = e203_o_oe_gpio[01] ? e203_o_oval_gpio[01] : 1'bz;
  assign GPIO_0[02] = e203_o_oe_gpio[02] ? e203_o_oval_gpio[02] : 1'bz;
  assign GPIO_0[03] = e203_o_oe_gpio[03] ? e203_o_oval_gpio[03] : 1'bz;
  assign GPIO_0[04] = e203_o_oe_gpio[04] ? e203_o_oval_gpio[04] : 1'bz;
  assign GPIO_0[05] = e203_o_oe_gpio[05] ? e203_o_oval_gpio[05] : 1'bz;
  assign GPIO_0[06] = e203_o_oe_gpio[06] ? e203_o_oval_gpio[06] : 1'bz;
  assign GPIO_0[07] = e203_o_oe_gpio[07] ? e203_o_oval_gpio[07] : 1'bz;
  assign GPIO_0[08] = e203_o_oe_gpio[08] ? e203_o_oval_gpio[08] : 1'bz;
  assign GPIO_0[09] = e203_o_oe_gpio[09] ? e203_o_oval_gpio[09] : 1'bz;
  assign GPIO_0[10] = e203_o_oe_gpio[10] ? e203_o_oval_gpio[10] : 1'bz;
  assign GPIO_0[11] = e203_o_oe_gpio[11] ? e203_o_oval_gpio[11] : 1'bz;
  assign GPIO_0[12] = e203_o_oe_gpio[12] ? e203_o_oval_gpio[12] : 1'bz;
  assign GPIO_0[13] = e203_o_oe_gpio[13] ? e203_o_oval_gpio[13] : 1'bz;
  assign GPIO_0[14] = e203_o_oe_gpio[14] ? e203_o_oval_gpio[14] : 1'bz;
  assign GPIO_0[15] = e203_o_oe_gpio[15] ? e203_o_oval_gpio[15] : 1'bz;
  assign GPIO_0[16] = e203_o_oe_gpio[16] ? e203_o_oval_gpio[16] : 1'bz;
  assign GPIO_0[17] = e203_o_oe_gpio[17] ? e203_o_oval_gpio[17] : 1'bz;
  assign GPIO_0[18] = e203_o_oe_gpio[18] ? e203_o_oval_gpio[18] : 1'bz;
  assign GPIO_0[19] = e203_o_oe_gpio[19] ? e203_o_oval_gpio[19] : 1'bz;
  assign GPIO_0[20] = e203_o_oe_gpio[20] ? e203_o_oval_gpio[20] : 1'bz;
  assign GPIO_0[21] = e203_o_oe_gpio[21] ? e203_o_oval_gpio[21] : 1'bz;
  assign GPIO_0[22] = e203_o_oe_gpio[22] ? e203_o_oval_gpio[22] : 1'bz;
  assign GPIO_0[23] = e203_o_oe_gpio[23] ? e203_o_oval_gpio[23] : 1'bz;
  assign GPIO_0[24] = e203_o_oe_gpio[24] ? e203_o_oval_gpio[24] : 1'bz;
  assign GPIO_0[25] = e203_o_oe_gpio[25] ? e203_o_oval_gpio[25] : 1'bz;
  assign GPIO_0[26] = e203_o_oe_gpio[26] ? e203_o_oval_gpio[26] : 1'bz;
  assign GPIO_0[27] = e203_o_oe_gpio[27] ? e203_o_oval_gpio[27] : 1'bz;
  assign GPIO_0[28] = e203_o_oe_gpio[28] ? e203_o_oval_gpio[28] : 1'bz;
  assign GPIO_0[29] = e203_o_oe_gpio[29] ? e203_o_oval_gpio[29] : 1'bz;
  assign GPIO_0[30] = e203_o_oe_gpio[30] ? e203_o_oval_gpio[30] : 1'bz;
  assign GPIO_0[31] = e203_o_oe_gpio[31] ? e203_o_oval_gpio[31] : 1'bz;
 
 assign e203_i_ival_gpio[00] = GPIO_0[00] & e203_o_ie_gpio[00];
 assign e203_i_ival_gpio[01] = GPIO_0[01] & e203_o_ie_gpio[01];
 assign e203_i_ival_gpio[02] = GPIO_0[02] & e203_o_ie_gpio[02];
 assign e203_i_ival_gpio[03] = GPIO_0[03] & e203_o_ie_gpio[03];
 assign e203_i_ival_gpio[04] = GPIO_0[04] & e203_o_ie_gpio[04];
 assign e203_i_ival_gpio[05] = GPIO_0[05] & e203_o_ie_gpio[05];
 assign e203_i_ival_gpio[06] = GPIO_0[06] & e203_o_ie_gpio[06];
 assign e203_i_ival_gpio[07] = GPIO_0[07] & e203_o_ie_gpio[07];
 assign e203_i_ival_gpio[08] = GPIO_0[08] & e203_o_ie_gpio[08];
 assign e203_i_ival_gpio[09] = GPIO_0[09] & e203_o_ie_gpio[09];
 assign e203_i_ival_gpio[10] = GPIO_0[10] & e203_o_ie_gpio[10];
 assign e203_i_ival_gpio[11] = GPIO_0[11] & e203_o_ie_gpio[11];
 assign e203_i_ival_gpio[12] = GPIO_0[12] & e203_o_ie_gpio[12];
 assign e203_i_ival_gpio[13] = GPIO_0[13] & e203_o_ie_gpio[13];
 assign e203_i_ival_gpio[14] = GPIO_0[14] & e203_o_ie_gpio[14];
 assign e203_i_ival_gpio[15] = GPIO_0[15] & e203_o_ie_gpio[15];
 //assign e203_i_ival_gpio[16] = GPIO_0[16] & e203_o_ie_gpio[16];
 assign e203_i_ival_gpio[17] = GPIO_0[17] & e203_o_ie_gpio[17];
 assign e203_i_ival_gpio[18] = GPIO_0[18] & e203_o_ie_gpio[18];
 assign e203_i_ival_gpio[19] = GPIO_0[19] & e203_o_ie_gpio[19];
 assign e203_i_ival_gpio[20] = GPIO_0[20] & e203_o_ie_gpio[20];
 assign e203_i_ival_gpio[21] = GPIO_0[21] & e203_o_ie_gpio[21];
 assign e203_i_ival_gpio[22] = GPIO_0[22] & e203_o_ie_gpio[22];
 assign e203_i_ival_gpio[23] = GPIO_0[23] & e203_o_ie_gpio[23];
 assign e203_i_ival_gpio[24] = GPIO_0[24] & e203_o_ie_gpio[24];
 assign e203_i_ival_gpio[25] = GPIO_0[25] & e203_o_ie_gpio[25];
 assign e203_i_ival_gpio[26] = GPIO_0[26] & e203_o_ie_gpio[26];
 assign e203_i_ival_gpio[27] = GPIO_0[27] & e203_o_ie_gpio[27];
 assign e203_i_ival_gpio[28] = GPIO_0[28] & e203_o_ie_gpio[28];
 assign e203_i_ival_gpio[29] = GPIO_0[29] & e203_o_ie_gpio[29];
 assign e203_i_ival_gpio[30] = GPIO_0[30] & e203_o_ie_gpio[30];
 assign e203_i_ival_gpio[31] = GPIO_0[31] & e203_o_ie_gpio[31];
 

  // This GPIO input is shared between FTDI TX pin and Arduino shield pin using SW[3]
  // see below for details
  //assign e203_i_ival_gpio[16] = sw_3 ? (iobuf_gpio[16] & e203_o_ie_gpio[16]) : (uart_txd_in & e203_o_ie_gpio[16]);
  //Bob: I hacked this, just let it always come from FDTI, and free the sw_3
  
  assign e203_i_ival_gpio[16] = (RISCV_UART_RX & e203_o_ie_gpio[16]);
  assign RISCV_UART_TX        = (e203_o_oval_gpio[17] & e203_o_oe_gpio[17]);

  //=================================================
  // JTAG IOBUFs

   assign e203_jtag_TCK_i_ival = RISCV_JTAG_TCK;
   assign e203_jtag_TMS_i_ival = RISCV_JTAG_TMS;
   assign e203_jtag_TDI_i_ival = RISCV_JTAG_TDI;
   assign RISCV_JTAG_TDO       = e203_jtag_TDO_o_oe ? e203_jtag_TDO_o_oval : 1'bz;

  //=================================================

  assign LED[0] = e203_o_oval_gpio[0] & e203_o_oe_gpio[0];
  assign LED[1] = e203_o_oval_gpio[1] & e203_o_oe_gpio[1];
  assign LED[2] = e203_o_oval_gpio[2] & e203_o_oe_gpio[2];
  assign LED[3] = e203_o_oval_gpio[3] & e203_o_oe_gpio[3];
  assign LED[7] = 1'b1;
 
  // model select
  //all set to 1
  assign e203_bootrom_n_i_ival  = 1'b0;
  assign e203_dbgmode0_n_i_ival = 1'b1;
  assign e203_dbgmode1_n_i_ival = 1'b1;
  assign e203_dbgmode2_n_i_ival = 1'b1;
  
  // Assign reasonable values to otherwise unconnected inputs to chip top
  assign e203_aon_pmu_dwakeup_n_i_ival = ~KEY[1]       ; //??  1'b0?
  assign e203_aon_erst_n_i_ival        = ~reset_periph ;
  assign e203_aon_pmu_vddpaden_i_ival  = 1'b1          ;

  e203_soc_top dut
  (
    .hfextclk                                                  ( clk_16M                       ) ,
    .hfxoscen                                                  (                               ) ,

    .lfextclk                                                  ( slowclk                       ) ,
    .lfxoscen                                                  (                               ) ,

       // Note: this is the real SoC top AON domain slow clock
    .io_pads_jtag_TCK_i_ival                                   ( e203_jtag_TCK_i_ival          ) ,
    .io_pads_jtag_TMS_i_ival                                   ( e203_jtag_TMS_i_ival          ) ,
    .io_pads_jtag_TDI_i_ival                                   ( e203_jtag_TDI_i_ival          ) ,
    .io_pads_jtag_TDO_o_oval                                   ( e203_jtag_TDO_o_oval          ) ,
    .io_pads_jtag_TDO_o_oe                                     ( e203_jtag_TDO_o_oe            ) ,
    .io_pads_gpio_0_i_ival                                     ( e203_i_ival_gpio    [ 0]      ) ,
    .io_pads_gpio_0_o_oval                                     ( e203_o_oval_gpio    [ 0]      ) ,
    .io_pads_gpio_0_o_oe                                       ( e203_o_oe_gpio      [ 0]      ) ,
    .io_pads_gpio_0_o_ie                                       ( e203_o_ie_gpio      [ 0]      ) ,
    .io_pads_gpio_0_o_pue                                      ( e203_o_pue_gpio     [ 0]      ) ,
    .io_pads_gpio_0_o_ds                                       ( e203_o_ds_gpio      [ 0]      ) ,
    .io_pads_gpio_1_i_ival                                     ( e203_i_ival_gpio    [ 1]      ) ,
    .io_pads_gpio_1_o_oval                                     ( e203_o_oval_gpio    [ 1]      ) ,
    .io_pads_gpio_1_o_oe                                       ( e203_o_oe_gpio      [ 1]      ) ,
    .io_pads_gpio_1_o_ie                                       ( e203_o_ie_gpio      [ 1]      ) ,
    .io_pads_gpio_1_o_pue                                      ( e203_o_pue_gpio     [ 1]      ) ,
    .io_pads_gpio_1_o_ds                                       ( e203_o_ds_gpio      [ 1]      ) ,
    .io_pads_gpio_2_i_ival                                     ( e203_i_ival_gpio    [ 2]      ) ,
    .io_pads_gpio_2_o_oval                                     ( e203_o_oval_gpio    [ 2]      ) ,
    .io_pads_gpio_2_o_oe                                       ( e203_o_oe_gpio      [ 2]      ) ,
    .io_pads_gpio_2_o_ie                                       ( e203_o_ie_gpio      [ 2]      ) ,
    .io_pads_gpio_2_o_pue                                      ( e203_o_pue_gpio     [ 2]      ) ,
    .io_pads_gpio_2_o_ds                                       ( e203_o_ds_gpio      [ 2]      ) ,
    .io_pads_gpio_3_i_ival                                     ( e203_i_ival_gpio    [ 3]      ) ,
    .io_pads_gpio_3_o_oval                                     ( e203_o_oval_gpio    [ 3]      ) ,
    .io_pads_gpio_3_o_oe                                       ( e203_o_oe_gpio      [ 3]      ) ,
    .io_pads_gpio_3_o_ie                                       ( e203_o_ie_gpio      [ 3]      ) ,
    .io_pads_gpio_3_o_pue                                      ( e203_o_pue_gpio     [ 3]      ) ,
    .io_pads_gpio_3_o_ds                                       ( e203_o_ds_gpio      [ 3]      ) ,
    .io_pads_gpio_4_i_ival                                     ( e203_i_ival_gpio    [ 4]      ) ,
    .io_pads_gpio_4_o_oval                                     ( e203_o_oval_gpio    [ 4]      ) ,
    .io_pads_gpio_4_o_oe                                       ( e203_o_oe_gpio      [ 4]      ) ,
    .io_pads_gpio_4_o_ie                                       ( e203_o_ie_gpio      [ 4]      ) ,
    .io_pads_gpio_4_o_pue                                      ( e203_o_pue_gpio     [ 4]      ) ,
    .io_pads_gpio_4_o_ds                                       ( e203_o_ds_gpio      [ 4]      ) ,
    .io_pads_gpio_5_i_ival                                     ( e203_i_ival_gpio    [ 5]      ) ,
    .io_pads_gpio_5_o_oval                                     ( e203_o_oval_gpio    [ 5]      ) ,
    .io_pads_gpio_5_o_oe                                       ( e203_o_oe_gpio      [ 5]      ) ,
    .io_pads_gpio_5_o_ie                                       ( e203_o_ie_gpio      [ 5]      ) ,
    .io_pads_gpio_5_o_pue                                      ( e203_o_pue_gpio     [ 5]      ) ,
    .io_pads_gpio_5_o_ds                                       ( e203_o_ds_gpio      [ 5]      ) ,
    .io_pads_gpio_6_i_ival                                     ( e203_i_ival_gpio    [ 6]      ) ,
    .io_pads_gpio_6_o_oval                                     ( e203_o_oval_gpio    [ 6]      ) ,
    .io_pads_gpio_6_o_oe                                       ( e203_o_oe_gpio      [ 6]      ) ,
    .io_pads_gpio_6_o_ie                                       ( e203_o_ie_gpio      [ 6]      ) ,
    .io_pads_gpio_6_o_pue                                      ( e203_o_pue_gpio     [ 6]      ) ,
    .io_pads_gpio_6_o_ds                                       ( e203_o_ds_gpio      [ 6]      ) ,
    .io_pads_gpio_7_i_ival                                     ( e203_i_ival_gpio    [ 7]      ) ,
    .io_pads_gpio_7_o_oval                                     ( e203_o_oval_gpio    [ 7]      ) ,
    .io_pads_gpio_7_o_oe                                       ( e203_o_oe_gpio      [ 7]      ) ,
    .io_pads_gpio_7_o_ie                                       ( e203_o_ie_gpio      [ 7]      ) ,
    .io_pads_gpio_7_o_pue                                      ( e203_o_pue_gpio     [ 7]      ) ,
    .io_pads_gpio_7_o_ds                                       ( e203_o_ds_gpio      [ 7]      ) ,
    .io_pads_gpio_8_i_ival                                     ( e203_i_ival_gpio    [ 8]      ) ,
    .io_pads_gpio_8_o_oval                                     ( e203_o_oval_gpio    [ 8]      ) ,
    .io_pads_gpio_8_o_oe                                       ( e203_o_oe_gpio      [ 8]      ) ,
    .io_pads_gpio_8_o_ie                                       ( e203_o_ie_gpio      [ 8]      ) ,
    .io_pads_gpio_8_o_pue                                      ( e203_o_pue_gpio     [ 8]      ) ,
    .io_pads_gpio_8_o_ds                                       ( e203_o_ds_gpio      [ 8]      ) ,
    .io_pads_gpio_9_i_ival                                     ( e203_i_ival_gpio    [ 9]      ) ,
    .io_pads_gpio_9_o_oval                                     ( e203_o_oval_gpio    [ 9]      ) ,
    .io_pads_gpio_9_o_oe                                       ( e203_o_oe_gpio      [ 9]      ) ,
    .io_pads_gpio_9_o_ie                                       ( e203_o_ie_gpio      [ 9]      ) ,
    .io_pads_gpio_9_o_pue                                      ( e203_o_pue_gpio     [ 9]      ) ,
    .io_pads_gpio_9_o_ds                                       ( e203_o_ds_gpio      [ 9]      ) ,
    .io_pads_gpio_10_i_ival                                    ( e203_i_ival_gpio    [10]      ) ,
    .io_pads_gpio_10_o_oval                                    ( e203_o_oval_gpio    [10]      ) ,
    .io_pads_gpio_10_o_oe                                      ( e203_o_oe_gpio      [10]      ) ,
    .io_pads_gpio_10_o_ie                                      ( e203_o_ie_gpio      [10]      ) ,
    .io_pads_gpio_10_o_pue                                     ( e203_o_pue_gpio     [10]      ) ,
    .io_pads_gpio_10_o_ds                                      ( e203_o_ds_gpio      [10]      ) ,
    .io_pads_gpio_11_i_ival                                    ( e203_i_ival_gpio    [11]      ) ,
    .io_pads_gpio_11_o_oval                                    ( e203_o_oval_gpio    [11]      ) ,
    .io_pads_gpio_11_o_oe                                      ( e203_o_oe_gpio      [11]      ) ,
    .io_pads_gpio_11_o_ie                                      ( e203_o_ie_gpio      [11]      ) ,
    .io_pads_gpio_11_o_pue                                     ( e203_o_pue_gpio     [11]      ) ,
    .io_pads_gpio_11_o_ds                                      ( e203_o_ds_gpio      [11]      ) ,
    .io_pads_gpio_12_i_ival                                    ( e203_i_ival_gpio    [12]      ) ,
    .io_pads_gpio_12_o_oval                                    ( e203_o_oval_gpio    [12]      ) ,
    .io_pads_gpio_12_o_oe                                      ( e203_o_oe_gpio      [12]      ) ,
    .io_pads_gpio_12_o_ie                                      ( e203_o_ie_gpio      [12]      ) ,
    .io_pads_gpio_12_o_pue                                     ( e203_o_pue_gpio     [12]      ) ,
    .io_pads_gpio_12_o_ds                                      ( e203_o_ds_gpio      [12]      ) ,
    .io_pads_gpio_13_i_ival                                    ( e203_i_ival_gpio    [13]      ) ,
    .io_pads_gpio_13_o_oval                                    ( e203_o_oval_gpio    [13]      ) ,
    .io_pads_gpio_13_o_oe                                      ( e203_o_oe_gpio      [13]      ) ,
    .io_pads_gpio_13_o_ie                                      ( e203_o_ie_gpio      [13]      ) ,
    .io_pads_gpio_13_o_pue                                     ( e203_o_pue_gpio     [13]      ) ,
    .io_pads_gpio_13_o_ds                                      ( e203_o_ds_gpio      [13]      ) ,
    .io_pads_gpio_14_i_ival                                    ( e203_i_ival_gpio    [14]      ) ,
    .io_pads_gpio_14_o_oval                                    ( e203_o_oval_gpio    [14]      ) ,
    .io_pads_gpio_14_o_oe                                      ( e203_o_oe_gpio      [14]      ) ,
    .io_pads_gpio_14_o_ie                                      ( e203_o_ie_gpio      [14]      ) ,
    .io_pads_gpio_14_o_pue                                     ( e203_o_pue_gpio     [14]      ) ,
    .io_pads_gpio_14_o_ds                                      ( e203_o_ds_gpio      [14]      ) ,
    .io_pads_gpio_15_i_ival                                    ( e203_i_ival_gpio    [15]      ) ,
    .io_pads_gpio_15_o_oval                                    ( e203_o_oval_gpio    [15]      ) ,
    .io_pads_gpio_15_o_oe                                      ( e203_o_oe_gpio      [15]      ) ,
    .io_pads_gpio_15_o_ie                                      ( e203_o_ie_gpio      [15]      ) ,
    .io_pads_gpio_15_o_pue                                     ( e203_o_pue_gpio     [15]      ) ,
    .io_pads_gpio_15_o_ds                                      ( e203_o_ds_gpio      [15]      ) ,
    .io_pads_gpio_16_i_ival                                    ( e203_i_ival_gpio    [16]      ) ,
    .io_pads_gpio_16_o_oval                                    ( e203_o_oval_gpio    [16]      ) ,
    .io_pads_gpio_16_o_oe                                      ( e203_o_oe_gpio      [16]      ) ,
    .io_pads_gpio_16_o_ie                                      ( e203_o_ie_gpio      [16]      ) ,
    .io_pads_gpio_16_o_pue                                     ( e203_o_pue_gpio     [16]      ) ,
    .io_pads_gpio_16_o_ds                                      ( e203_o_ds_gpio      [16]      ) ,
    .io_pads_gpio_17_i_ival                                    ( e203_i_ival_gpio    [17]      ) ,
    .io_pads_gpio_17_o_oval                                    ( e203_o_oval_gpio    [17]      ) ,
    .io_pads_gpio_17_o_oe                                      ( e203_o_oe_gpio      [17]      ) ,
    .io_pads_gpio_17_o_ie                                      ( e203_o_ie_gpio      [17]      ) ,
    .io_pads_gpio_17_o_pue                                     ( e203_o_pue_gpio     [17]      ) ,
    .io_pads_gpio_17_o_ds                                      ( e203_o_ds_gpio      [17]      ) ,
    .io_pads_gpio_18_i_ival                                    ( e203_i_ival_gpio    [18]      ) ,
    .io_pads_gpio_18_o_oval                                    ( e203_o_oval_gpio    [18]      ) ,
    .io_pads_gpio_18_o_oe                                      ( e203_o_oe_gpio      [18]      ) ,
    .io_pads_gpio_18_o_ie                                      ( e203_o_ie_gpio      [18]      ) ,
    .io_pads_gpio_18_o_pue                                     ( e203_o_pue_gpio     [18]      ) ,
    .io_pads_gpio_18_o_ds                                      ( e203_o_ds_gpio      [18]      ) ,
    .io_pads_gpio_19_i_ival                                    ( e203_i_ival_gpio    [19]      ) ,
    .io_pads_gpio_19_o_oval                                    ( e203_o_oval_gpio    [19]      ) ,
    .io_pads_gpio_19_o_oe                                      ( e203_o_oe_gpio      [19]      ) ,
    .io_pads_gpio_19_o_ie                                      ( e203_o_ie_gpio      [19]      ) ,
    .io_pads_gpio_19_o_pue                                     ( e203_o_pue_gpio     [19]      ) ,
    .io_pads_gpio_19_o_ds                                      ( e203_o_ds_gpio      [19]      ) ,
    .io_pads_gpio_20_i_ival                                    ( e203_i_ival_gpio    [20]      ) ,
    .io_pads_gpio_20_o_oval                                    ( e203_o_oval_gpio    [20]      ) ,
    .io_pads_gpio_20_o_oe                                      ( e203_o_oe_gpio      [20]      ) ,
    .io_pads_gpio_20_o_ie                                      ( e203_o_ie_gpio      [20]      ) ,
    .io_pads_gpio_20_o_pue                                     ( e203_o_pue_gpio     [20]      ) ,
    .io_pads_gpio_20_o_ds                                      ( e203_o_ds_gpio      [20]      ) ,
    .io_pads_gpio_21_i_ival                                    ( e203_i_ival_gpio    [21]      ) ,
    .io_pads_gpio_21_o_oval                                    ( e203_o_oval_gpio    [21]      ) ,
    .io_pads_gpio_21_o_oe                                      ( e203_o_oe_gpio      [21]      ) ,
    .io_pads_gpio_21_o_ie                                      ( e203_o_ie_gpio      [21]      ) ,
    .io_pads_gpio_21_o_pue                                     ( e203_o_pue_gpio     [21]      ) ,
    .io_pads_gpio_21_o_ds                                      ( e203_o_ds_gpio      [21]      ) ,
    .io_pads_gpio_22_i_ival                                    ( e203_i_ival_gpio    [22]      ) ,
    .io_pads_gpio_22_o_oval                                    ( e203_o_oval_gpio    [22]      ) ,
    .io_pads_gpio_22_o_oe                                      ( e203_o_oe_gpio      [22]      ) ,
    .io_pads_gpio_22_o_ie                                      ( e203_o_ie_gpio      [22]      ) ,
    .io_pads_gpio_22_o_pue                                     ( e203_o_pue_gpio     [22]      ) ,
    .io_pads_gpio_22_o_ds                                      ( e203_o_ds_gpio      [22]      ) ,
    .io_pads_gpio_23_i_ival                                    ( e203_i_ival_gpio    [23]      ) ,
    .io_pads_gpio_23_o_oval                                    ( e203_o_oval_gpio    [23]      ) ,
    .io_pads_gpio_23_o_oe                                      ( e203_o_oe_gpio      [23]      ) ,
    .io_pads_gpio_23_o_ie                                      ( e203_o_ie_gpio      [23]      ) ,
    .io_pads_gpio_23_o_pue                                     ( e203_o_pue_gpio     [23]      ) ,
    .io_pads_gpio_23_o_ds                                      ( e203_o_ds_gpio      [23]      ) ,
    .io_pads_gpio_24_i_ival                                    ( e203_i_ival_gpio    [24]      ) ,
    .io_pads_gpio_24_o_oval                                    ( e203_o_oval_gpio    [24]      ) ,
    .io_pads_gpio_24_o_oe                                      ( e203_o_oe_gpio      [24]      ) ,
    .io_pads_gpio_24_o_ie                                      ( e203_o_ie_gpio      [24]      ) ,
    .io_pads_gpio_24_o_pue                                     ( e203_o_pue_gpio     [24]      ) ,
    .io_pads_gpio_24_o_ds                                      ( e203_o_ds_gpio      [24]      ) ,
    .io_pads_gpio_25_i_ival                                    ( e203_i_ival_gpio    [25]      ) ,
    .io_pads_gpio_25_o_oval                                    ( e203_o_oval_gpio    [25]      ) ,
    .io_pads_gpio_25_o_oe                                      ( e203_o_oe_gpio      [25]      ) ,
    .io_pads_gpio_25_o_ie                                      ( e203_o_ie_gpio      [25]      ) ,
    .io_pads_gpio_25_o_pue                                     ( e203_o_pue_gpio     [25]      ) ,
    .io_pads_gpio_25_o_ds                                      ( e203_o_ds_gpio      [25]      ) ,
    .io_pads_gpio_26_i_ival                                    ( e203_i_ival_gpio    [26]      ) ,
    .io_pads_gpio_26_o_oval                                    ( e203_o_oval_gpio    [26]      ) ,
    .io_pads_gpio_26_o_oe                                      ( e203_o_oe_gpio      [26]      ) ,
    .io_pads_gpio_26_o_ie                                      ( e203_o_ie_gpio      [26]      ) ,
    .io_pads_gpio_26_o_pue                                     ( e203_o_pue_gpio     [26]      ) ,
    .io_pads_gpio_26_o_ds                                      ( e203_o_ds_gpio      [26]      ) ,
    .io_pads_gpio_27_i_ival                                    ( e203_i_ival_gpio    [27]      ) ,
    .io_pads_gpio_27_o_oval                                    ( e203_o_oval_gpio    [27]      ) ,
    .io_pads_gpio_27_o_oe                                      ( e203_o_oe_gpio      [27]      ) ,
    .io_pads_gpio_27_o_ie                                      ( e203_o_ie_gpio      [27]      ) ,
    .io_pads_gpio_27_o_pue                                     ( e203_o_pue_gpio     [27]      ) ,
    .io_pads_gpio_27_o_ds                                      ( e203_o_ds_gpio      [27]      ) ,
    .io_pads_gpio_28_i_ival                                    ( e203_i_ival_gpio    [28]      ) ,
    .io_pads_gpio_28_o_oval                                    ( e203_o_oval_gpio    [28]      ) ,
    .io_pads_gpio_28_o_oe                                      ( e203_o_oe_gpio      [28]      ) ,
    .io_pads_gpio_28_o_ie                                      ( e203_o_ie_gpio      [28]      ) ,
    .io_pads_gpio_28_o_pue                                     ( e203_o_pue_gpio     [28]      ) ,
    .io_pads_gpio_28_o_ds                                      ( e203_o_ds_gpio      [28]      ) ,
    .io_pads_gpio_29_i_ival                                    ( e203_i_ival_gpio    [29]      ) ,
    .io_pads_gpio_29_o_oval                                    ( e203_o_oval_gpio    [29]      ) ,
    .io_pads_gpio_29_o_oe                                      ( e203_o_oe_gpio      [29]      ) ,
    .io_pads_gpio_29_o_ie                                      ( e203_o_ie_gpio      [29]      ) ,
    .io_pads_gpio_29_o_pue                                     ( e203_o_pue_gpio     [29]      ) ,
    .io_pads_gpio_29_o_ds                                      ( e203_o_ds_gpio      [29]      ) ,
    .io_pads_gpio_30_i_ival                                    ( e203_i_ival_gpio    [30]      ) ,
    .io_pads_gpio_30_o_oval                                    ( e203_o_oval_gpio    [30]      ) ,
    .io_pads_gpio_30_o_oe                                      ( e203_o_oe_gpio      [30]      ) ,
    .io_pads_gpio_30_o_ie                                      ( e203_o_ie_gpio      [30]      ) ,
    .io_pads_gpio_30_o_pue                                     ( e203_o_pue_gpio     [30]      ) ,
    .io_pads_gpio_30_o_ds                                      ( e203_o_ds_gpio      [30]      ) ,
    .io_pads_gpio_31_i_ival                                    ( e203_i_ival_gpio    [31]      ) ,
    .io_pads_gpio_31_o_oval                                    ( e203_o_oval_gpio    [31]      ) ,
    .io_pads_gpio_31_o_oe                                      ( e203_o_oe_gpio      [31]      ) ,
    .io_pads_gpio_31_o_ie                                      ( e203_o_ie_gpio      [31]      ) ,
    .io_pads_gpio_31_o_pue                                     ( e203_o_pue_gpio     [31]      ) ,
    .io_pads_gpio_31_o_ds                                      ( e203_o_ds_gpio      [31]      ) ,
    .io_pads_qspi_sck_o_oval                                   ( e203_qspi_sck_o_oval          ) ,
    .io_pads_qspi_dq_0_i_ival                                  ( e203_qspi_i_ival_dq [ 0]      ) ,
    .io_pads_qspi_dq_0_o_oval                                  ( e203_qspi_o_oval_dq [ 0]      ) ,
    .io_pads_qspi_dq_0_o_oe                                    ( e203_qspi_o_oe_dq   [ 0]      ) ,
    .io_pads_qspi_dq_0_o_ie                                    ( e203_qspi_o_ie_dq   [ 0]      ) ,
    .io_pads_qspi_dq_0_o_pue                                   ( e203_qspi_o_pue_dq  [ 0]      ) ,
    .io_pads_qspi_dq_0_o_ds                                    ( e203_qspi_o_ds_dq   [ 0]      ) ,
    .io_pads_qspi_dq_1_i_ival                                  ( e203_qspi_i_ival_dq [ 1]      ) ,
    .io_pads_qspi_dq_1_o_oval                                  ( e203_qspi_o_oval_dq [ 1]      ) ,
    .io_pads_qspi_dq_1_o_oe                                    ( e203_qspi_o_oe_dq   [ 1]      ) ,
    .io_pads_qspi_dq_1_o_ie                                    ( e203_qspi_o_ie_dq   [ 1]      ) ,
    .io_pads_qspi_dq_1_o_pue                                   ( e203_qspi_o_pue_dq  [ 1]      ) ,
    .io_pads_qspi_dq_1_o_ds                                    ( e203_qspi_o_ds_dq   [ 1]      ) ,
    .io_pads_qspi_dq_2_i_ival                                  ( e203_qspi_i_ival_dq [ 2]      ) ,
    .io_pads_qspi_dq_2_o_oval                                  ( e203_qspi_o_oval_dq [ 2]      ) ,
    .io_pads_qspi_dq_2_o_oe                                    ( e203_qspi_o_oe_dq   [ 2]      ) ,
    .io_pads_qspi_dq_2_o_ie                                    ( e203_qspi_o_ie_dq   [ 2]      ) ,
    .io_pads_qspi_dq_2_o_pue                                   ( e203_qspi_o_pue_dq  [ 2]      ) ,
    .io_pads_qspi_dq_2_o_ds                                    ( e203_qspi_o_ds_dq   [ 2]      ) ,
    .io_pads_qspi_dq_3_i_ival                                  ( e203_qspi_i_ival_dq [ 3]      ) ,
    .io_pads_qspi_dq_3_o_oval                                  ( e203_qspi_o_oval_dq [ 3]      ) ,
    .io_pads_qspi_dq_3_o_oe                                    ( e203_qspi_o_oe_dq   [ 3]      ) ,
    .io_pads_qspi_dq_3_o_ie                                    ( e203_qspi_o_ie_dq   [ 3]      ) ,
    .io_pads_qspi_dq_3_o_pue                                   ( e203_qspi_o_pue_dq  [ 3]      ) ,
    .io_pads_qspi_dq_3_o_ds                                    ( e203_qspi_o_ds_dq   [ 3]      ) ,
    .io_pads_qspi_cs_0_o_oval                                  ( e203_qspi_cs_0_o_oval         ) ,
       // Note: this is the real SoC top level reset signal
    .io_pads_aon_erst_n_i_ival                                 ( e203_aon_erst_n_i_ival        ) ,
    .io_pads_aon_pmu_dwakeup_n_i_ival                          ( e203_aon_pmu_dwakeup_n_i_ival ) ,
    .io_pads_aon_pmu_vddpaden_o_oval                           ( e203_aon_pmu_vddpaden_o_oval  ) ,

    .io_pads_aon_pmu_padrst_o_oval                             ( e203_aon_pmu_padrst_o_oval    ) ,

    .io_pads_bootrom_n_i_ival                                  ( e203_bootrom_n_i_ival         ) ,

    .io_pads_dbgmode0_n_i_ival                                 ( e203_dbgmode0_n_i_ival        ) ,
    .io_pads_dbgmode1_n_i_ival                                 ( e203_dbgmode1_n_i_ival        ) ,
    .io_pads_dbgmode2_n_i_ival                                 ( e203_dbgmode2_n_i_ival        )
  );

endmodule
