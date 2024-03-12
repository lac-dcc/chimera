`include "mfp_ahb_lite_matrix_config.vh"

module de0_cv
(
    input           CLOCK2_50,
    input           CLOCK3_50,
    inout           CLOCK4_50,
    input           CLOCK_50,
                   
    input           RESET_N,

    input   [ 3:0]  KEY,
    input   [ 9:0]  SW,

    output  [ 9:0]  LEDR,

    output  [ 6:0]  HEX0,
    output  [ 6:0]  HEX1,
    output  [ 6:0]  HEX2,
    output  [ 6:0]  HEX3,
    output  [ 6:0]  HEX4,
    output  [ 6:0]  HEX5,
                   
    output  [12:0]  DRAM_ADDR,
    output  [ 1:0]  DRAM_BA,
    output          DRAM_CAS_N,
    output          DRAM_CKE,
    output          DRAM_CLK,
    output          DRAM_CS_N,
    inout   [15:0]  DRAM_DQ,
    output          DRAM_LDQM,
    output          DRAM_RAS_N,
    output          DRAM_UDQM,
    output          DRAM_WE_N,
                   
    output  [ 3:0]  VGA_B,
    output  [ 3:0]  VGA_G,
    output          VGA_HS,
    output  [ 3:0]  VGA_R,
    output          VGA_VS,

    inout           PS2_CLK,
    inout           PS2_CLK2,
    inout           PS2_DAT,
    inout           PS2_DAT2,
                   
    output          SD_CLK,
    inout           SD_CMD,
    inout   [ 3:0]  SD_DATA,
                   
    inout   [35:0]  GPIO_0,
    inout   [35:0]  GPIO_1
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

    assign IO_Switches = { { `MFP_N_SWITCHES - 10 { 1'b0 } } ,   SW  [9:0] };
    assign IO_Buttons  = { { `MFP_N_BUTTONS  -  4 { 1'b0 } } , ~ KEY [3:0] };

    assign LEDR = IO_GreenLEDs [9:0];

    wire [31:0] HADDR, HRDATA, HWDATA;
    wire        HWRITE;

    `define MFP_EJTAG_DEBUGGER
    `ifdef MFP_EJTAG_DEBUGGER
        // MIPSfpga EJTAG BusBluster 3 connector pinout
        // EJTAG     DIRECTION    PIN       CONN      PIN    DIRECTION EJTAG 
        // =====     ========= ========== ========= ======== ========= ======
        //  VCC       output   GPIO_1[12]  15 | 16  GPIO_1[13]  output    VCC  
        //  GND       output   GPIO_1[14]  17 | 18  GPIO_1[15]  output    GND  
        //  NC        output   GPIO_1[16]  19 | 20  GPIO_1[17]  input    EJ_TCK
        //  NC        output   GPIO_1[18]  21 | 22  GPIO_1[19]  output   EJ_TDO
        //  EJ_RST    input    GPIO_1[20]  23 | 24  GPIO_1[21]  input    EJ_TDI
        //  EJ_TRST   input    GPIO_1[22]  25 | 26  GPIO_1[23]  input    EJ_TMS

        wire EJ_VCC  = 1'b1;
        wire EJ_GND  = 1'b0;
        wire EJ_NC   = 1'bz;
        wire EJ_TCK  = GPIO_1[17];
        wire EJ_RST  = GPIO_1[20];
        wire EJ_TDI  = GPIO_1[21];
        wire EJ_TRST = GPIO_1[22];
        wire EJ_TMS  = GPIO_1[23];
        wire EJ_DINT = 1'b0;
        wire EJ_TDO;

        assign GPIO_1[12] = EJ_VCC;
        assign GPIO_1[13] = EJ_VCC;
        assign GPIO_1[14] = EJ_GND;
        assign GPIO_1[15] = EJ_GND;
        assign GPIO_1[16] = EJ_NC;
        assign GPIO_1[18] = EJ_NC;
        assign GPIO_1[19] = EJ_TDO;
    `endif

    `ifdef MFP_DEMO_LIGHT_SENSOR
        //  ALS   CONN    PIN          DIRECTION
        // ===== ======  =====       =============
        //  VCC  JP2 29  3.3V
        //  GND  JP2 31  GPIO_1[26]   output
        //  SCK  JP2 33  GPIO_1[28]   output
        //  SDO  JP2 35  GPIO_1[30]   input
        //  NC   JP2 37  GPIO_1[32]   not connected
        //  CS   JP2 39  GPIO_1[34]   output

        wire    ALS_GND = 1'b0;
        wire    ALS_SCK;
        wire    ALS_SDO;
        wire    ALS_NC  = 1'bz;
        wire    ALS_CS;

        assign GPIO_1[26] = ALS_GND;
        assign GPIO_1[28] = ALS_SCK;
        assign ALS_SDO    = GPIO_1[30];
        assign GPIO_1[32] = ALS_NC;
        assign GPIO_1[34] = ALS_CS;
    `endif

    mfp_system mfp_system
    (
        .SI_ClkIn         (   clk             ),
        .SI_Reset         ( ~ RESET_N         ),
                          
        .HADDR            (   HADDR           ),
        .HRDATA           (   HRDATA          ),
        .HWDATA           (   HWDATA          ),
        .HWRITE           (   HWRITE          ),

        `ifdef MFP_USE_SDRAM_MEMORY
        .SDRAM_CKE        (   DRAM_CKE        ),
        .SDRAM_CSn        (   DRAM_CS_N       ),
        .SDRAM_RASn       (   DRAM_RAS_N      ),
        .SDRAM_CASn       (   DRAM_CAS_N      ),
        .SDRAM_WEn        (   DRAM_WE_N       ),
        .SDRAM_ADDR       (   DRAM_ADDR       ),
        .SDRAM_BA         (   DRAM_BA         ),
        .SDRAM_DQ         (   DRAM_DQ         ),
        .SDRAM_DQM   ( {DRAM_UDQM, DRAM_LDQM} ),
        `endif

        `ifdef MFP_EJTAG_DEBUGGER
        .EJ_TRST_N_probe  (   EJ_TRST         ),
        .EJ_TDI           (   EJ_TDI          ),
        .EJ_TDO           (   EJ_TDO          ),
        .EJ_TMS           (   EJ_TMS          ),
        .EJ_TCK           (   EJ_TCK          ),
        .SI_ColdReset     ( ~ EJ_RST          ),
        .EJ_DINT          (   EJ_DINT         ),
        `endif

        .IO_Switches      (   IO_Switches     ),
        .IO_Buttons       (   IO_Buttons      ),
        .IO_RedLEDs       (   IO_RedLEDs      ),
        .IO_GreenLEDs     (   IO_GreenLEDs    ), 
        .IO_7_SegmentHEX  (   IO_7_SegmentHEX ),

        `ifdef MFP_DEMO_LIGHT_SENSOR
        .SPI_CS           (   ALS_CS          ),
        .SPI_SCK          (   ALS_SCK         ),
        .SPI_SDO          (   ALS_SDO         ),
        `endif
                                              
        .UART_RX          (   GPIO_1 [31]     ),
        .UART_TX          (   /* TODO */      )
    );

    `ifdef MFP_USE_SDRAM_MEMORY
        //SDRAM controller delay params
        defparam mfp_system.matrix_loader.matrix.ram.DELAY_nCKE          = `SDRAM_DELAY_nCKE;
        defparam mfp_system.matrix_loader.matrix.ram.DELAY_tREF          = `SDRAM_DELAY_tREF;
        defparam mfp_system.matrix_loader.matrix.ram.DELAY_tRP           = `SDRAM_DELAY_tRP;
        defparam mfp_system.matrix_loader.matrix.ram.DELAY_tRFC          = `SDRAM_DELAY_tRFC;
        defparam mfp_system.matrix_loader.matrix.ram.DELAY_tMRD          = `SDRAM_DELAY_tMRD;
        defparam mfp_system.matrix_loader.matrix.ram.DELAY_tRCD          = `SDRAM_DELAY_tRCD;
        defparam mfp_system.matrix_loader.matrix.ram.DELAY_tCAS          = `SDRAM_DELAY_tCAS;
        defparam mfp_system.matrix_loader.matrix.ram.DELAY_afterREAD     = `SDRAM_DELAY_afterREAD;
        defparam mfp_system.matrix_loader.matrix.ram.DELAY_afterWRITE    = `SDRAM_DELAY_afterWRITE;
        defparam mfp_system.matrix_loader.matrix.ram.COUNT_initAutoRef   = `SDRAM_COUNT_initAutoRef;
    `endif

    mfp_single_digit_seven_segment_display digit_5 ( IO_7_SegmentHEX [23:20] , HEX5 );
    mfp_single_digit_seven_segment_display digit_4 ( IO_7_SegmentHEX [19:16] , HEX4 );
    mfp_single_digit_seven_segment_display digit_3 ( IO_7_SegmentHEX [15:12] , HEX3 );
    mfp_single_digit_seven_segment_display digit_2 ( IO_7_SegmentHEX [11: 8] , HEX2 );
    mfp_single_digit_seven_segment_display digit_1 ( IO_7_SegmentHEX [ 7: 4] , HEX1 );
    mfp_single_digit_seven_segment_display digit_0 ( IO_7_SegmentHEX [ 3: 0] , HEX0 );

endmodule
