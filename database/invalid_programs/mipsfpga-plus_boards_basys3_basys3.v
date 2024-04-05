`include "mfp_ahb_lite_matrix_config.vh"

module basys3
(
    input         clk,

    input         btnC,
    input         btnU,
    input         btnL,
    input         btnR,
    input         btnD,

    input  [15:0] sw,

    output [15:0] led,

    output [ 6:0] seg,
    output        dp,
    output [ 3:0] an,

    inout  [ 7:0] JA,
    inout  [ 7:0] JB,

    input         RsRx
);

    wire clock;
    wire reset = btnU;

    `define MFP_USE_SLOW_CLOCK_AND_CLOCK_MUX
    `ifdef MFP_USE_SLOW_CLOCK_AND_CLOCK_MUX

    wire       muxed_clk;
    wire [1:0] sw_db;

    mfp_multi_switch_or_button_sync_and_debouncer
    # (.WIDTH (2))
    mfp_multi_switch_or_button_sync_and_debouncer
    (   
        .clk    ( clk      ),
        .sw_in  ( sw [1:0] ),
        .sw_out ( sw_db    )
    );

    mfp_clock_divider_100_MHz_to_25_MHz_12_Hz_0_75_Hz 
    mfp_clock_divider_100_MHz_to_25_MHz_12_Hz_0_75_Hz
    (
        .clki    ( clk       ),
        .sel_lo  ( sw_db [0] ),
        .sel_mid ( sw_db [1] ),
        .clko    ( muxed_clk )
    );

    BUFG BUFG_slow_clk (.O ( clock ), .I ( muxed_clk ));

    `else

    clk_wiz_0 clk_wiz_0 (.clk_in1 (clk), .clk_out1 (clock));

    `endif

    wire [`MFP_N_SWITCHES          - 1:0] IO_Switches;
    wire [`MFP_N_BUTTONS           - 1:0] IO_Buttons;
    wire [`MFP_N_RED_LEDS          - 1:0] IO_RedLEDs;
    wire [`MFP_N_GREEN_LEDS        - 1:0] IO_GreenLEDs;
    wire [`MFP_7_SEGMENT_HEX_WIDTH - 1:0] IO_7_SegmentHEX;

    assign IO_Switches = { { `MFP_N_SWITCHES - 16 { 1'b0 } } , sw  [15:0] };

    assign IO_Buttons  = { { `MFP_N_BUTTONS  -  5 { 1'b0 } } ,
                           btnU, btnD, btnL, btnC, btnR };

    assign led = IO_GreenLEDs [15:0];

    wire [31:0] HADDR, HRDATA, HWDATA;
    wire        HWRITE;

    wire ejtag_tck_in, ejtag_tck;

    IBUF IBUF           (.O ( ejtag_tck_in ), .I ( JB [3]       ));
    BUFG BUFG_ejtag_tck (.O ( ejtag_tck    ), .I ( ejtag_tck_in ));

    mfp_system mfp_system
    (
        .SI_ClkIn         ( clock           ),
        .SI_Reset         ( reset           ),
                          
        .HADDR            ( HADDR           ),
        .HRDATA           ( HRDATA          ),
        .HWDATA           ( HWDATA          ),
        .HWRITE           ( HWRITE          ),

        .EJ_TRST_N_probe  (   JB [4]        ),
        .EJ_TDI           (   JB [1]        ),
        .EJ_TDO           (   JB [2]        ),
        .EJ_TMS           (   JB [0]        ),
        .EJ_TCK           (   ejtag_tck_in  ),
        .SI_ColdReset     ( ~ JB [5]        ),
        .EJ_DINT          (   1'b0          ),

        .IO_Switches      ( IO_Switches      ),
        .IO_Buttons       ( IO_Buttons       ),
        .IO_RedLEDs       ( IO_RedLEDs       ),
        .IO_GreenLEDs     ( IO_GreenLEDs     ), 
        .IO_7_SegmentHEX  ( IO_7_SegmentHEX  ),

        .UART_RX          ( RsRx /* Alternative: JA [7] */ ),
        .UART_TX          ( /* TODO */       ),

        .SPI_CS           (   JA [0]         ),
        .SPI_SCK          (   JA [3]         ),
        .SPI_SDO          (   JA [2]         )
    );

    assign JA [4] = 1'b0;

    wire display_clock;

    mfp_clock_divider_100_MHz_to_763_Hz mfp_clock_divider_100_MHz_to_763_Hz
        (clk, display_clock);

    wire [7:0] anodes;
    assign an = anodes [3:0];

    mfp_multi_digit_display multi_digit_display
    (
        .clock          (   display_clock   ),
        .resetn         ( ~ reset           ),
        .number         (   IO_7_SegmentHEX ),

        .seven_segments (   seg             ),
        .dot            (   dp              ),
        .anodes         (   anodes          )
    );

endmodule
