`include "mfp_ahb_lite_matrix_config.vh"

module de10_lite
(
    input           ADC_CLK_10,
    input           MAX10_CLK1_50,
    input           MAX10_CLK2_50,

    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 7:0]  HEX0,
    output  [ 7:0]  HEX1,
    output  [ 7:0]  HEX2,
    output  [ 7:0]  HEX3,
    output  [ 7:0]  HEX4,
    output  [ 7:0]  HEX5,
    output  [ 9:0]  LEDR,

    `ifdef MFP_USE_SDRAM_MEMORY
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
    `endif
    
    `ifdef UNUSED
        output  [ 3:0]  VGA_B,
        output  [ 3:0]  VGA_G,
        output          VGA_HS,
        output  [ 3:0]  VGA_R,
        output          VGA_VS,
        output          GSENSOR_CS_N,
        input   [ 2:1]  GSENSOR_INT,
        output          GSENSOR_SCLK,
        inout           GSENSOR_SDI,
        inout           GSENSOR_SDO,
        inout   [15:0]  ARDUINO_IO,
        inout           ARDUINO_RESET_N,
    `endif

    inout   [35:0]  GPIO
);

    // global clock signals
    wire clk;
    wire ADC_CLK;
    wire clk200;  //for phase shift debug with logic analyser

    `ifdef MFP_USE_SDRAM_MEMORY
        wire CLK_Lock;
        pll pll(MAX10_CLK1_50, ADC_CLK, clk, DRAM_CLK, clk200, CLK_Lock);

    `elsif MFP_USE_ADC_MAX10
        wire CLK_Lock;
        pll pll(MAX10_CLK1_50, ADC_CLK, clk, DRAM_CLK, clk200, CLK_Lock);

    `elsif MFP_USE_SLOW_CLOCK_AND_CLOCK_MUX

        wire       CLK_Lock = 1'b1;
        wire       muxed_clk;
        wire [1:0] sw_db;

        mfp_multi_switch_or_button_sync_and_debouncer
        # (.WIDTH (2))
        mfp_multi_switch_or_button_sync_and_debouncer
        (   
            .clk    ( MAX10_CLK1_50 ),
            .sw_in  ( SW [1:0] ),
            .sw_out ( sw_db    )
        );

        mfp_clock_divider_50_MHz_to_25_MHz_12_Hz_0_75_Hz 
        mfp_clock_divider_50_MHz_to_25_MHz_12_Hz_0_75_Hz
        (
            .clki    ( MAX10_CLK1_50  ),
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
        wire   CLK_Lock = 1'b1;
        assign clk = MAX10_CLK1_50;
    `endif

    wire [`MFP_N_SWITCHES          - 1:0] IO_Switches;
    wire [`MFP_N_BUTTONS           - 1:0] IO_Buttons;
    wire [`MFP_N_RED_LEDS          - 1:0] IO_RedLEDs;
    wire [`MFP_N_GREEN_LEDS        - 1:0] IO_GreenLEDs;
    wire [`MFP_7_SEGMENT_HEX_WIDTH - 1:0] IO_7_SegmentHEX;

    assign IO_Switches = { { `MFP_N_SWITCHES - 10 { 1'b0 } } ,   SW  [9:0] };
    assign IO_Buttons  = { { `MFP_N_BUTTONS  -  2 { 1'b0 } } , ~ KEY [1:0] };

    wire [31:0] HADDR, HRDATA, HWDATA;
    wire        HWRITE;

    `ifdef MFP_USE_SDRAM_MEMORY
        assign LEDR[9] = ~DRAM_CKE;
        assign LEDR[8:0] = IO_RedLEDs [8:0];
    `elsif MFP_USE_SLOW_CLOCK_AND_CLOCK_MUX
        assign LEDR = (sw_db == 2'b00 ? IO_RedLEDs [9:0] : IO_GreenLEDs [9:0]);
    `else
        assign LEDR = IO_RedLEDs [9:0];
    `endif

    `ifdef MFP_USE_ADC_MAX10
        wire          ADC_C_Valid;
        wire [  4:0 ] ADC_C_Channel;
        wire          ADC_C_SOP;
        wire          ADC_C_EOP;
        wire          ADC_C_Ready;
        wire          ADC_R_Valid;
        wire [  4:0 ] ADC_R_Channel;
        wire [ 11:0 ] ADC_R_Data;
        wire          ADC_R_SOP;
        wire          ADC_R_EOP;
    `endif

    `define MFP_EJTAG_DEBUGGER
    `ifdef MFP_EJTAG_DEBUGGER
        // MIPSfpga EJTAG BusBluster 3 connector pinout
        // EJTAG     DIRECTION   PIN      CONN      PIN    DIRECTION EJTAG 
        // =====     ========= ======== ========= ======== ========= ======
        //  VCC       output   GPIO[12]  15 | 16  GPIO[13]  output    VCC  
        //  GND       output   GPIO[14]  17 | 18  GPIO[15]  output    GND  
        //  NC        output   GPIO[16]  19 | 20  GPIO[17]  input    EJ_TCK
        //  NC        output   GPIO[18]  21 | 22  GPIO[19]  output   EJ_TDO
        //  EJ_RST    input    GPIO[20]  23 | 24  GPIO[21]  input    EJ_TDI
        //  EJ_TRST   input    GPIO[22]  25 | 26  GPIO[23]  input    EJ_TMS

        wire EJ_VCC  = 1'b1;
        wire EJ_GND  = 1'b0;
        wire EJ_NC   = 1'bz;
        wire EJ_TCK  = GPIO[17];
        wire EJ_RST  = GPIO[20];
        wire EJ_TDI  = GPIO[21];
        wire EJ_TRST = GPIO[22];
        wire EJ_TMS  = GPIO[23];
        wire EJ_DINT = 1'b0;
        wire EJ_TDO;

        assign GPIO[12] = EJ_VCC;
        assign GPIO[13] = EJ_VCC;
        assign GPIO[14] = EJ_GND;
        assign GPIO[15] = EJ_GND;
        assign GPIO[16] = EJ_NC;
        assign GPIO[18] = EJ_NC;
        assign GPIO[19] = EJ_TDO;
    `endif

    `ifdef MFP_DEMO_LIGHT_SENSOR
        //  ALS   CONN   PIN         DIRECTION
        // ===== ====== =====      =============
        //  VCC    29   3.3V
        //  GND    31   GPIO[26]   output
        //  SCK    33   GPIO[28]   output
        //  SDO    35   GPIO[30]   input
        //  NC     37   GPIO[32]   not connected
        //  CS     39   GPIO[34]   output

        wire    ALS_GND = 1'b0;
        wire    ALS_SCK;
        wire    ALS_SDO;
        wire    ALS_NC  = 1'bz;
        wire    ALS_CS;

        assign GPIO[26] = ALS_GND;
        assign GPIO[28] = ALS_SCK;
        assign ALS_SDO  = GPIO[30];
        assign GPIO[32] = ALS_NC;
        assign GPIO[34] = ALS_CS;
    `endif

    //This is a workaround to make EJTAG working
    //TODO: add complex reset signals handling module
    wire RESETn = KEY [0] & GPIO [20] & CLK_Lock;

    mfp_system mfp_system
    (
        .SI_ClkIn         (   clk             ),
        .SI_Reset         (   ~RESETn         ),
                          
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

        `ifdef MFP_USE_DUPLEX_UART
        .UART_SRX         (   GPIO [33]       ), 
        .UART_STX         (   GPIO [35]       ),
        `endif

        `ifdef MFP_DEMO_LIGHT_SENSOR
        .SPI_CS           (   ALS_CS          ),
        .SPI_SCK          (   ALS_SCK         ),
        .SPI_SDO          (   ALS_SDO         ),
        `endif

        `ifdef MFP_USE_ADC_MAX10
        .ADC_C_Valid      (  ADC_C_Valid      ),
        .ADC_C_Channel    (  ADC_C_Channel    ),
        .ADC_C_SOP        (  ADC_C_SOP        ),
        .ADC_C_EOP        (  ADC_C_EOP        ),
        .ADC_C_Ready      (  ADC_C_Ready      ),
        .ADC_R_Valid      (  ADC_R_Valid      ),
        .ADC_R_Channel    (  ADC_R_Channel    ),
        .ADC_R_Data       (  ADC_R_Data       ),
        .ADC_R_SOP        (  ADC_R_SOP        ),
        .ADC_R_EOP        (  ADC_R_EOP        ),
        `endif

        .UART_RX          (   GPIO [31]       ),
        .UART_TX          (   GPIO [32]       )
    );

    `ifdef MFP_USE_ADC_MAX10
        adc adc
        (
            .adc_pll_clock_clk      ( ADC_CLK       ),
            .adc_pll_locked_export  ( CLK_Lock      ),
            .clock_clk              ( clk           ),
            .command_valid          ( ADC_C_Valid   ),
            .command_channel        ( ADC_C_Channel ),
            .command_startofpacket  ( ADC_C_SOP     ),
            .command_endofpacket    ( ADC_C_EOP     ),
            .command_ready          ( ADC_C_Ready   ),
            .reset_sink_reset_n     ( RESETn        ),
            .response_valid         ( ADC_R_Valid   ),
            .response_channel       ( ADC_R_Channel ),
            .response_data          ( ADC_R_Data    ),
            .response_startofpacket ( ADC_R_SOP     ),
            .response_endofpacket   ( ADC_R_EOP     ) 
        );
    `endif

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

    assign HEX0 [ 7] = 1'b1;
    assign HEX1 [ 7] = 1'b1;
    assign HEX2 [ 7] = 1'b1;
    assign HEX3 [ 7] = 1'b1;
    assign HEX4 [ 7] = 1'b1;
    assign HEX5 [ 7] = 1'b1;

    mfp_single_digit_seven_segment_display digit_5 ( IO_7_SegmentHEX [23:20] , HEX5 [6:0] );
    mfp_single_digit_seven_segment_display digit_4 ( IO_7_SegmentHEX [19:16] , HEX4 [6:0] );
    mfp_single_digit_seven_segment_display digit_3 ( IO_7_SegmentHEX [15:12] , HEX3 [6:0] );
    mfp_single_digit_seven_segment_display digit_2 ( IO_7_SegmentHEX [11: 8] , HEX2 [6:0] );
    mfp_single_digit_seven_segment_display digit_1 ( IO_7_SegmentHEX [ 7: 4] , HEX1 [6:0] );
    mfp_single_digit_seven_segment_display digit_0 ( IO_7_SegmentHEX [ 3: 0] , HEX0 [6:0] );

endmodule
