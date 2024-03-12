`include "mfp_ahb_lite_matrix_config.vh"

module de2_115
(
    input         CLOCK_50,
    input         CLOCK2_50,
    input         CLOCK3_50,
    input         ENETCLK_25,

    // Sma

    input         SMA_CLKIN,
    output        SMA_CLKOUT,

    // LED

    output [ 8:0] LEDG,
    output [17:0] LEDR,

    // KEY

    input  [ 3:0] KEY,

    // SW

    input  [17:0] SW,

    // SEG7

    output [ 6:0] HEX0,
    output [ 6:0] HEX1,
    output [ 6:0] HEX2,
    output [ 6:0] HEX3,
    output [ 6:0] HEX4,
    output [ 6:0] HEX5,
    output [ 6:0] HEX6,
    output [ 6:0] HEX7,

`ifdef UNUSED

    // LCD

    output        LCD_BLON,
    inout  [ 7:0] LCD_DATA,
    output        LCD_EN,
    output        LCD_ON,
    output        LCD_RS,
    output        LCD_RW,

    // RS232

    output        UART_CTS,
    input         UART_RTS,
    input         UART_RXD,
    output        UART_TXD,

    // PS2

    inout         PS2_CLK,
    inout         PS2_DAT,
    inout         PS2_CLK2,
    inout         PS2_DAT2,

    // SDCARD

    output        SD_CLK,
    inout         SD_CMD,
    inout  [ 3:0] SD_DAT,
    input         SD_WP_N,

    // VGA

    output [ 7:0] VGA_B,
    output        VGA_BLANK_N,
    output        VGA_CLK,
    output [ 7:0] VGA_G,
    output        VGA_HS,
    output [ 7:0] VGA_R,
    output        VGA_SYNC_N,
    output        VGA_VS,

    // Audio

    input         AUD_ADCDAT,
    inout         AUD_ADCLRCK,
    inout         AUD_BCLK,
    output        AUD_DACDAT,
    inout         AUD_DACLRCK,
    output        AUD_XCK,

    // I2C for EEPROM

    output        EEP_I2C_SCLK,
    inout         EEP_I2C_SDAT,

    // I2C for Audio and Tv-Decode

    output        I2C_SCLK,
    inout         I2C_SDAT,

    // Ethernet 0

    output        ENET0_GTX_CLK,
    input         ENET0_INT_N,
    output        ENET0_MDC,
    input         ENET0_MDIO,
    output        ENET0_RST_N,
    input         ENET0_RX_CLK,
    input         ENET0_RX_COL,
    input         ENET0_RX_CRS,
    input  [ 3:0] ENET0_RX_DATA,
    input         ENET0_RX_DV,
    input         ENET0_RX_ER,
    input         ENET0_TX_CLK,
    output [ 3:0] ENET0_TX_DATA,
    output        ENET0_TX_EN,
    output        ENET0_TX_ER,
    input         ENET0_LINK100,

    // Ethernet 1

    output        ENET1_GTX_CLK,
    input         ENET1_INT_N,
    output        ENET1_MDC,
    input         ENET1_MDIO,
    output        ENET1_RST_N,
    input         ENET1_RX_CLK,
    input         ENET1_RX_COL,
    input         ENET1_RX_CRS,
    input  [ 3:0] ENET1_RX_DATA,
    input         ENET1_RX_DV,
    input         ENET1_RX_ER,
    input         ENET1_TX_CLK,
    output [ 3:0] ENET1_TX_DATA,
    output        ENET1_TX_EN,
    output        ENET1_TX_ER,
    input         ENET1_LINK100,

    // TV Decoder 1

    input         TD_CLK27,
    input  [ 7:0] TD_DATA,
    input         TD_HS,
    output        TD_RESET_N,
    input         TD_VS,


    // USB OTG controller

    inout  [15:0] OTG_DATA,
    output [ 1:0] OTG_ADDR,
    output        OTG_CS_N,
    output        OTG_WR_N,
    output        OTG_RD_N,
    input         OTG_INT,
    output        OTG_RST_N,

    // IR Receiver

    input         IRDA_RXD,

    // SDRAM

    output [12:0] DRAM_ADDR,
    output [ 1:0] DRAM_BA,
    output        DRAM_CAS_N,
    output        DRAM_CKE,
    output        DRAM_CLK,
    output        DRAM_CS_N,
    inout  [31:0] DRAM_DQ,
    output [ 3:0] DRAM_DQM,
    output        DRAM_RAS_N,
    output        DRAM_WE_N,

    // SRAM

    output [19:0] SRAM_ADDR,
    output        SRAM_CE_N,
    inout  [15:0] SRAM_DQ,
    output        SRAM_LB_N,
    output        SRAM_OE_N,
    output        SRAM_UB_N,
    output        SRAM_WE_N,

    // Flash

    output [22:0] FL_ADDR,
    output        FL_CE_N,
    inout  [ 7:0] FL_DQ,
    output        FL_OE_N,
    output        FL_RST_N,
    input         FL_RY,
    output        FL_WE_N,
    output        FL_WP_N,

`endif

    // GPIO

    inout  [35:0] GPIO,

`ifdef UNUSED

    // HSMC (LVDS)

 // input         HSMC_CLKIN_N1,
 // input         HSMC_CLKIN_N2,
    input         HSMC_CLKIN_P1,
    input         HSMC_CLKIN_P2,
    input         HSMC_CLKIN0,
 // output        HSMC_CLKOUT_N1,
 // output        HSMC_CLKOUT_N2,
    output        HSMC_CLKOUT_P1,
    output        HSMC_CLKOUT_P2,
    output        HSMC_CLKOUT0,
    inout  [ 3:0] HSMC_D,
 // input  [16:0] HSMC_RX_D_N,
    input  [16:0] HSMC_RX_D_P,
 // output [16:0] HSMC_TX_D_N,
    output [16:0] HSMC_TX_D_P,

`endif

    // EXTEND IO

    inout  [ 6:0] EX_IO
);

    wire clk;

    `ifdef MFP_USE_SLOW_CLOCK_AND_CLOCK_MUX

    wire       muxed_clk;
    wire [1:0] sw_db;

    mfp_multi_switch_or_button_sync_and_debouncer
    # (.WIDTH (2))
    mfp_multi_switch_or_button_sync_and_debouncer
    (   
        .clk    ( CLOCK_50 ),
        .sw_in  ( SW [1:0] ),
        .sw_out ( sw_db    )
    );

    mfp_clock_divider_50_MHz_to_25_MHz_12_Hz_0_75_Hz 
    mfp_clock_divider_50_MHz_to_25_MHz_12_Hz_0_75_Hz
    (
        .clki    ( CLOCK_50  ),
        .sel_lo  ( sw_db [0] ),
        .sel_mid ( sw_db [1] ),
        .clko    ( muxed_clk )
    );

    global gclk
    (
        .in     ( muxed_clk  ), 
        .out    ( clk        )
    );

    `else

    assign clk = CLOCK_50;

    `endif

    wire [`MFP_N_SWITCHES          - 1:0] IO_Switches;
    wire [`MFP_N_BUTTONS           - 1:0] IO_Buttons;
    wire [`MFP_N_RED_LEDS          - 1:0] IO_RedLEDs;
    wire [`MFP_N_GREEN_LEDS        - 1:0] IO_GreenLEDs;
    wire [`MFP_7_SEGMENT_HEX_WIDTH - 1:0] IO_7_SegmentHEX;

    assign IO_Switches = { { `MFP_N_SWITCHES - 18 { 1'b0 } } ,   SW  [17:0] };
    assign IO_Buttons  = { { `MFP_N_BUTTONS  -  4 { 1'b0 } } , ~ KEY [ 3:0] };

    assign LEDG = IO_GreenLEDs [ 8:0];
    assign LEDR = IO_RedLEDs   [17:0];

    wire [31:0] HADDR, HRDATA, HWDATA;
    wire        HWRITE;

    mfp_system mfp_system
    (
        .SI_ClkIn         (   clk              ),
        .SI_Reset         ( ~ KEY [0]          ),
                          
        .HADDR            (   HADDR            ),
        .HRDATA           (   HRDATA           ),
        .HWDATA           (   HWDATA           ),
        .HWRITE           (   HWRITE           ),

        `ifdef MFP_USE_GPIO_FOR_EJTAG
                          
        .EJ_TRST_N_probe  (   GPIO [22]        ),
        .EJ_TDI           (   GPIO [21]        ),
        .EJ_TDO           (   GPIO [19]        ),
        .EJ_TMS           (   GPIO [23]        ),
        .EJ_TCK           (   GPIO [17]        ),
        .SI_ColdReset     ( ~ GPIO [20]        ),
        .EJ_DINT          (   1'b0             ),

        `else                                  
                                               
        .EJ_TRST_N_probe  (   EX_IO [6]        ),
        .EJ_TDI           (   EX_IO [5]        ),
        .EJ_TDO           (   EX_IO [4]        ),
        .EJ_TMS           (   EX_IO [3]        ),
        .EJ_TCK           (   EX_IO [2]        ),
        .SI_ColdReset     ( ~ EX_IO [1]        ),
        .EJ_DINT          (   EX_IO [0]        ),
                                               
        `endif

        .IO_Switches      (   IO_Switches      ),
        .IO_Buttons       (   IO_Buttons       ),
        .IO_RedLEDs       (   IO_RedLEDs       ),
        .IO_GreenLEDs     (   IO_GreenLEDs     ), 
        .IO_7_SegmentHEX  (   IO_7_SegmentHEX  ),
                                               
        .UART_RX          (   GPIO [31]        ),
        .UART_TX          (   /* TODO */       ),

        .SPI_CS           (   GPIO [34]        ),
        .SPI_SCK          (   GPIO [28]        ),
        .SPI_SDO          (   GPIO [30]        )
    );

    assign GPIO [15] = 1'b0;
    assign GPIO [14] = 1'b0;
    assign GPIO [13] = 1'b1;
    assign GPIO [12] = 1'b1;

    assign GPIO [26] = 1'b0;

    mfp_single_digit_seven_segment_display digit_7 ( IO_7_SegmentHEX [31:28] , HEX7 );
    mfp_single_digit_seven_segment_display digit_6 ( IO_7_SegmentHEX [27:24] , HEX6 );
    mfp_single_digit_seven_segment_display digit_5 ( IO_7_SegmentHEX [23:20] , HEX5 );
    mfp_single_digit_seven_segment_display digit_4 ( IO_7_SegmentHEX [19:16] , HEX4 );
    mfp_single_digit_seven_segment_display digit_3 ( IO_7_SegmentHEX [15:12] , HEX3 );
    mfp_single_digit_seven_segment_display digit_2 ( IO_7_SegmentHEX [11: 8] , HEX2 );
    mfp_single_digit_seven_segment_display digit_1 ( IO_7_SegmentHEX [ 7: 4] , HEX1 );
    mfp_single_digit_seven_segment_display digit_0 ( IO_7_SegmentHEX [ 3: 0] , HEX0 );

endmodule
