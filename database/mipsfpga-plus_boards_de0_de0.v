`include "mfp_ahb_lite_matrix_config.vh"

module de0
(
    input         CLOCK_50,
    input         CLOCK_50_2,
    input  [ 2:0] BUTTON,
    input  [ 9:0] SW,
    output [ 6:0] HEX0_D,
    output        HEX0_DP,
    output [ 6:0] HEX1_D,
    output        HEX1_DP,
    output [ 6:0] HEX2_D,
    output        HEX2_DP,
    output [ 6:0] HEX3_D,
    output        HEX3_DP,
    output [ 9:0] LEDG,

`ifdef UNUSED

    output        UART_TXD,
    input         UART_RXD,
    output        UART_CTS,
    input         UART_RTS,
    inout  [15:0] DRAM_DQ,
    output [12:0] DRAM_ADDR,
    output        DRAM_LDQM,
    output        DRAM_UDQM,
    output        DRAM_WE_N,
    output        DRAM_CAS_N,
    output        DRAM_RAS_N,
    output        DRAM_CS_N,
    output        DRAM_BA_0,
    output        DRAM_BA_1,
    output        DRAM_CLK,
    output        DRAM_CKE,
    inout  [14:0] FL_DQ,
    inout         FL_DQ15_AM1,
    output [21:0] FL_ADDR,
    output        FL_WE_N,
    output        FL_RST_N,
    output        FL_OE_N,
    output        FL_CE_N,
    output        FL_WP_N,
    output        FL_BYTE_N,
    input         FL_RY,
    inout  [ 7:0] LCD_DATA,
    output        LCD_BLON,
    output        LCD_RW,
    output        LCD_EN,
    output        LCD_RS,
    inout         SD_DAT0,
    inout         SD_DAT3,
    inout         SD_CMD,
    output        SD_CLK,
    input         SD_WP_N,
    inout         PS2_KBDAT,
    inout         PS2_KBCLK,
    inout         PS2_MSDAT,
    inout         PS2_MSCLK,
    output        VGA_HS,
    output        VGA_VS,
    output [ 3:0] VGA_R,
    output [ 3:0] VGA_G,
    output [ 3:0] VGA_B,

`endif

    input  [ 1:0] GPIO0_CLKIN,
    output [ 1:0] GPIO0_CLKOUT,
    inout  [31:0] GPIO0_D,
    input  [ 1:0] GPIO1_CLKIN,
    output [ 1:0] GPIO1_CLKOUT,
    inout  [31:0] GPIO1_D
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

    assign IO_Switches = { { `MFP_N_SWITCHES - 10 { 1'b0 } } ,   SW     [9:0] };
    assign IO_Buttons  = { { `MFP_N_BUTTONS  -  3 { 1'b0 } } , ~ BUTTON [2:0] };

    assign LEDG = IO_GreenLEDs [9:0];

    wire [31:0] HADDR, HRDATA, HWDATA;
    wire        HWRITE;

    mfp_system mfp_system
    (
        .SI_ClkIn         (   clk            ),
        .SI_Reset         ( ~ BUTTON [0]     ),
                          
        .HADDR            ( HADDR            ),
        .HRDATA           ( HRDATA           ),
        .HWDATA           ( HWDATA           ),
        .HWRITE           ( HWRITE           ),

        .EJ_TRST_N_probe  (   GPIO1_D [18]   ),
        .EJ_TDI           (   GPIO1_D [17]   ),
        .EJ_TDO           (   GPIO1_D [15]   ),
        .EJ_TMS           (   GPIO1_D [19]   ),
        .EJ_TCK           (   GPIO1_D [14]   ),
        .SI_ColdReset     ( ~ GPIO1_D [16]   ),
        .EJ_DINT          (   1'b0           ),

        .IO_Switches      ( IO_Switches      ),
        .IO_Buttons       ( IO_Buttons       ),
        .IO_RedLEDs       ( IO_RedLEDs       ),
        .IO_GreenLEDs     ( IO_GreenLEDs     ), 
        .IO_7_SegmentHEX  ( IO_7_SegmentHEX  ),

        .UART_RX          ( GPIO1_D [27]    ),
        .UART_TX          ( /* TODO */      ),

        .SPI_CS           ( GPIO1_D [30]    ),
        .SPI_SCK          ( GPIO1_D [24]    ),
        .SPI_SDO          ( GPIO1_D [26]    )
    );

    assign GPIO1_D [13] = 1'b0;
    assign GPIO1_D [12] = 1'b0;
    assign GPIO1_D [11] = 1'b1;
    assign GPIO1_D [10] = 1'b1;

    assign GPIO1_D [22] = 1'b0;

    assign HEX0_DP = 1'b1;
    assign HEX1_DP = 1'b1;
    assign HEX2_DP = 1'b1;
    assign HEX3_DP = 1'b1;

    mfp_single_digit_seven_segment_display digit_3 ( IO_7_SegmentHEX [15:12] , HEX3_D );
    mfp_single_digit_seven_segment_display digit_2 ( IO_7_SegmentHEX [11: 8] , HEX2_D );
    mfp_single_digit_seven_segment_display digit_1 ( IO_7_SegmentHEX [ 7: 4] , HEX1_D );
    mfp_single_digit_seven_segment_display digit_0 ( IO_7_SegmentHEX [ 3: 0] , HEX0_D );

endmodule
