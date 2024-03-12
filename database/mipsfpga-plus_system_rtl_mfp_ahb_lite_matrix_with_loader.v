`include "mfp_ahb_lite_matrix_config.vh"
`include "mfp_ahb_lite.vh"
`include "mfp_eic_core.vh"

module mfp_ahb_lite_matrix_with_loader
(
    input         HCLK,
    input         HRESETn,
    input  [31:0] HADDR,
    input  [ 2:0] HBURST,
    input         HMASTLOCK,
    input  [ 3:0] HPROT,
    input  [ 2:0] HSIZE,
    input  [ 1:0] HTRANS,
    input  [31:0] HWDATA,
    input         HWRITE,
    output [31:0] HRDATA,
    output        HREADY,
    output        HRESP,
    input         SI_Endian,

    `ifdef MFP_USE_SDRAM_MEMORY
    output                                  SDRAM_CKE,
    output                                  SDRAM_CSn,
    output                                  SDRAM_RASn,
    output                                  SDRAM_CASn,
    output                                  SDRAM_WEn,
    output [`SDRAM_ADDR_BITS - 1 : 0 ]      SDRAM_ADDR,
    output [`SDRAM_BA_BITS   - 1 : 0 ]      SDRAM_BA,
    inout  [`SDRAM_DQ_BITS   - 1 : 0 ]      SDRAM_DQ,
    output [`SDRAM_DM_BITS   - 1 : 0 ]      SDRAM_DQM,
    `endif

    input  [`MFP_N_SWITCHES          - 1:0] IO_Switches,
    input  [`MFP_N_BUTTONS           - 1:0] IO_Buttons,
    output [`MFP_N_RED_LEDS          - 1:0] IO_RedLEDs,
    output [`MFP_N_GREEN_LEDS        - 1:0] IO_GreenLEDs,
    output [`MFP_7_SEGMENT_HEX_WIDTH - 1:0] IO_7_SegmentHEX,

    `ifdef MFP_DEMO_LIGHT_SENSOR
    output                                  SPI_CS,
    output                                  SPI_SCK,
    input                                   SPI_SDO,
    `endif

    //reset uart
    input         UART_RX,
    output        UART_TX,
    output        UART_INT,

    `ifdef MFP_USE_DUPLEX_UART
    //communication uart
    input         UART_SRX,
    output        UART_STX,
    `endif

    `ifdef MFP_USE_IRQ_EIC
    input  [ `EIC_CHANNELS        - 1 : 0 ] EIC_input,
    output [                       17 : 1 ] EIC_Offset,
    output [                        3 : 0 ] EIC_ShadowSet,
    output [                        7 : 0 ] EIC_Interrupt,
    output [                        5 : 0 ] EIC_Vector,
    output                                  EIC_Present,
    input                                   EIC_IAck,
    input  [                        7 : 0 ] EIC_IPL,
    input  [                        5 : 0 ] EIC_IVN,
    input  [                       17 : 1 ] EIC_ION,
    `endif //MFP_USE_IRQ_EIC

    `ifdef MFP_USE_ADC_MAX10
    output                                  ADC_C_Valid,
    output [                        4 : 0 ] ADC_C_Channel,
    output                                  ADC_C_SOP,
    output                                  ADC_C_EOP,
    input                                   ADC_C_Ready,
    input                                   ADC_R_Valid,
    input [                         4 : 0 ] ADC_R_Channel,
    input [                        11 : 0 ] ADC_R_Data,
    input                                   ADC_R_SOP,
    input                                   ADC_R_EOP,
    input                                   ADC_Trigger,
    output                                  ADC_Interrupt,
    `endif //MFP_USE_ADC_MAX10

    output        MFP_Reset
);
    wire   in_progress;
    assign MFP_Reset = in_progress;

    wire [31:0] loader_HADDR;
    wire [ 2:0] loader_HBURST;
    wire        loader_HMASTLOCK;
    wire [ 3:0] loader_HPROT;
    wire [ 2:0] loader_HSIZE;
    wire [ 1:0] loader_HTRANS;
    wire [31:0] loader_HWDATA;
    wire        loader_HWRITE;

    mfp_uart_loader loader
    (
        .HCLK             ( HCLK             ),
        .HRESETn          ( HRESETn          ),
        .loader_HADDR     ( loader_HADDR     ),
        .loader_HBURST    ( loader_HBURST    ),
        .loader_HMASTLOCK ( loader_HMASTLOCK ),
        .loader_HPROT     ( loader_HPROT     ),
        .loader_HSIZE     ( loader_HSIZE     ),
        .loader_HTRANS    ( loader_HTRANS    ),
        .loader_HWDATA    ( loader_HWDATA    ),
        .loader_HWRITE    ( loader_HWRITE    ),

        .UART_RX          ( UART_RX          ),

        .loader_Busy      ( in_progress      )
    );

    mfp_ahb_lite_matrix matrix
    (
        .HCLK             ( HCLK            ),
        .HRESETn          ( HRESETn         ),
                         
        .HADDR            ( in_progress ? loader_HADDR     : HADDR     ),
        .HBURST           ( in_progress ? loader_HBURST    : HBURST    ),
        .HMASTLOCK        ( in_progress ? loader_HMASTLOCK : HMASTLOCK ),
        .HPROT            ( in_progress ? loader_HPROT     : HPROT     ),
        .HSIZE            ( in_progress ? loader_HSIZE     : HSIZE     ),
        .HTRANS           ( in_progress ? loader_HTRANS    : HTRANS    ),
        .HWDATA           ( in_progress ? loader_HWDATA    : HWDATA    ),
        .HWRITE           ( in_progress ? loader_HWRITE    : HWRITE    ),
                         
        .HRDATA           ( HRDATA          ),
        .HREADY           ( HREADY          ),
        .HRESP            ( HRESP           ),
        .SI_Endian        ( SI_Endian       ),

        `ifdef MFP_USE_SDRAM_MEMORY
        .SDRAM_CKE        ( SDRAM_CKE       ),
        .SDRAM_CSn        ( SDRAM_CSn       ),
        .SDRAM_RASn       ( SDRAM_RASn      ),
        .SDRAM_CASn       ( SDRAM_CASn      ),
        .SDRAM_WEn        ( SDRAM_WEn       ),
        .SDRAM_ADDR       ( SDRAM_ADDR      ),
        .SDRAM_BA         ( SDRAM_BA        ),
        .SDRAM_DQ         ( SDRAM_DQ        ),
        .SDRAM_DQM        ( SDRAM_DQM       ),
        `endif  // MFP_USE_SDRAM_MEMORY
                                             
        `ifdef MFP_DEMO_LIGHT_SENSOR
        .SPI_CS           ( SPI_CS          ),
        .SPI_SCK          ( SPI_SCK         ),
        .SPI_SDO          ( SPI_SDO         ),
        `endif

        `ifdef MFP_USE_DUPLEX_UART
        .UART_RX          ( UART_SRX        ), 
        .UART_TX          ( UART_STX        ),
        `else
        .UART_RX          ( 1'b0            ), 
        .UART_TX          ( UART_TX         ),
        `endif //MFP_USE_DUPLEX_UART
        .UART_INT         ( UART_INT        ),

        `ifdef MFP_USE_IRQ_EIC
        .EIC_input        ( EIC_input       ),
        .EIC_Offset       ( EIC_Offset      ),
        .EIC_ShadowSet    ( EIC_ShadowSet   ),
        .EIC_Interrupt    ( EIC_Interrupt   ),
        .EIC_Vector       ( EIC_Vector      ),
        .EIC_Present      ( EIC_Present     ),
        .EIC_IAck         ( EIC_IAck        ),
        .EIC_IPL          ( EIC_IPL         ),
        .EIC_IVN          ( EIC_IVN         ),
        .EIC_ION          ( EIC_ION         ),
        `endif //MFP_USE_IRQ_EIC

        `ifdef MFP_USE_ADC_MAX10
        .ADC_C_Valid      ( ADC_C_Valid     ),
        .ADC_C_Channel    ( ADC_C_Channel   ),
        .ADC_C_SOP        ( ADC_C_SOP       ),
        .ADC_C_EOP        ( ADC_C_EOP       ),
        .ADC_C_Ready      ( ADC_C_Ready     ),
        .ADC_R_Valid      ( ADC_R_Valid     ),
        .ADC_R_Channel    ( ADC_R_Channel   ),
        .ADC_R_Data       ( ADC_R_Data      ),
        .ADC_R_SOP        ( ADC_R_SOP       ),
        .ADC_R_EOP        ( ADC_R_EOP       ),
        .ADC_Trigger      ( ADC_Trigger     ),
        .ADC_Interrupt    ( ADC_Interrupt   ),
        `endif //MFP_USE_ADC_MAX10

        .IO_Switches      ( IO_Switches     ),
        .IO_Buttons       ( IO_Buttons      ),
        .IO_RedLEDs       ( IO_RedLEDs      ),
        .IO_GreenLEDs     ( IO_GreenLEDs    ), 
        .IO_7_SegmentHEX  ( IO_7_SegmentHEX )
    );
endmodule
