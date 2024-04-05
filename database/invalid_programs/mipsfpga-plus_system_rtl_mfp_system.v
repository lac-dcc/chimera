`include "m14k_const.vh"
`include "mfp_ahb_lite_matrix_config.vh"
`include "mfp_eic_core.vh"

module mfp_system
(
    input         SI_ClkIn,
    input         SI_ColdReset,
    input         SI_Reset,

    output [31:0] HADDR,
    output [31:0] HRDATA,
    output [31:0] HWDATA,
    output        HWRITE,
    output        HREADY,
    output [ 1:0] HTRANS,

    input         EJ_TRST_N_probe,
    input         EJ_TDI,
    output        EJ_TDO,
    input         EJ_TMS,
    input         EJ_TCK,
    input         EJ_DINT,

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

    `ifdef MFP_DEMO_LIGHT_SENSOR
    output                                  SPI_CS,
    output                                  SPI_SCK,
    input                                   SPI_SDO,
    `endif

    input         UART_RX,
    output        UART_TX,

    `ifdef MFP_USE_DUPLEX_UART
    input         UART_SRX,
    output        UART_STX,
    `endif

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
    `endif //MFP_USE_ADC_MAX10

    input  [`MFP_N_SWITCHES          - 1:0] IO_Switches,
    input  [`MFP_N_BUTTONS           - 1:0] IO_Buttons,
    output [`MFP_N_RED_LEDS          - 1:0] IO_RedLEDs,
    output [`MFP_N_GREEN_LEDS        - 1:0] IO_GreenLEDs,
    output [`MFP_7_SEGMENT_HEX_WIDTH - 1:0] IO_7_SegmentHEX
);

    wire MFP_Reset;

    wire [  0:0] BistIn;
    wire [  0:0] BistOut;
    wire [  0:0] CP2_fromcp2;
    wire [  0:0] CP2_tocp2;
    wire [  0:0] DSP_fromdsp;
    wire [  0:0] DSP_todsp;
    wire         EJ_DebugM;
//  wire         EJ_DINT;
    wire         EJ_DINTsup;
    wire         EJ_DisableProbeDebug;
    wire         EJ_ECREjtagBrk;
    wire [ 10:0] EJ_ManufID;
    wire [ 15:0] EJ_PartNumber;
    wire         EJ_PerRst;
    wire         EJ_PrRst;
    wire         EJ_SRstE;
//  wire         EJ_TCK;
//  wire         EJ_TDI;
//  wire         EJ_TDO;
    wire         EJ_TDOzstate;
//  wire         EJ_TMS;
    wire         EJ_TRST_N;
    wire [  3:0] EJ_Version;
    wire [  7:0] gmb_dc_algorithm;
    wire         gmbddfail;
    wire         gmbdifail;
    wire         gmbdone;
    wire [  7:0] gmb_ic_algorithm;
    wire         gmbinvoke;
    wire [  7:0] gmb_isp_algorithm;
    wire         gmbispfail;
    wire [  7:0] gmb_sp_algorithm;
    wire         gmbspfail;
    wire         gmbtdfail;
    wire         gmbtifail;
    wire         gmbwdfail;
    wire         gmbwifail;
    wire         gscanenable;
    wire [  0:0] gscanin;
    wire         gscanmode;
    wire [  0:0] gscanout;
    wire         gscanramwr;
//  wire [ 31:0] HADDR;
    wire [  2:0] HBURST;
    wire         HCLK;
    wire         HMASTLOCK;
    wire [  3:0] HPROT;
//  wire [ 31:0] HRDATA;
//  wire         HREADY;
    wire         HRESETn;
    wire         HRESP;
    wire [  2:0] HSIZE;
//  wire [  1:0] HTRANS;
//  wire [ 31:0] HWDATA;
//  wire         HWRITE;
    wire [  0:0] ISP_fromisp;
    wire [  0:0] ISP_toisp;
    wire         PM_InstnComplete;
    wire         SI_AHBStb;
    wire         SI_BootExcISAMode;
//  wire         SI_ClkIn;
    wire         SI_ClkOut;
//  wire         SI_ColdReset;
    wire [  9:0] SI_CPUNum;
    wire [  3:0] SI_Dbs;
    wire         SI_EICPresent;
    wire [  5:0] SI_EICVector;
    wire [  3:0] SI_EISS;
    wire         SI_Endian;
    wire         SI_ERL;
    wire         SI_EXL;
    wire         SI_FDCInt;
    wire         SI_IAck;
    wire [  7:0] SI_Ibs;
    wire [  7:0] SI_Int;
    wire [ 17:1] SI_ION;
    wire [  2:0] SI_IPFDCI;
    wire [  7:0] SI_IPL;
    wire [  2:0] SI_IPPCI;
    wire [  2:0] SI_IPTI;
    wire [  5:0] SI_IVN;
    wire [  1:0] SI_MergeMode;
    wire         SI_NESTERL;
    wire         SI_NESTEXL;
    wire         SI_NMI;
    wire         SI_NMITaken;
    wire [ 17:1] SI_Offset;
    wire         SI_PCInt;
//  wire         SI_Reset;
    wire         SI_RP;
    wire         SI_Sleep;
    wire [  3:0] SI_SRSDisable;
    wire [  1:0] SI_SWInt;
    wire         SI_TimerInt;
    wire         SI_TraceDisable;
    wire [  2:0] TC_ClockRatio;
    wire [ 63:0] TC_Data;
    wire         TC_PibPresent;
    wire         TC_Stall;
    wire         TC_Valid;
    wire [127:0] UDI_fromudi;
    wire [127:0] UDI_toudi;

`ifdef MFP_DEMO_PIPE_BYPASS
    wire         mpc_aselres_e;
    wire         mpc_aselwr_e;
    wire         mpc_bselall_e;
    wire         mpc_bselres_e;
`endif

    wire         uart_interrupt;

    `ifdef MFP_USE_ADC_MAX10
        wire ADC_Interrupt;

        //TODO: in future it will be connected to advanced timer output
        wire ADC_Trigger    = 1'b0;
    `else
        wire ADC_Interrupt  = 1'b0;
    `endif

    m14k_top m14k_top
    (
        .BistIn                ( BistIn                ),
        .BistOut               ( BistOut               ),
        .CP2_fromcp2           ( CP2_fromcp2           ),
        .CP2_tocp2             ( CP2_tocp2             ),
        .DSP_fromdsp           ( DSP_fromdsp           ),
        .DSP_todsp             ( DSP_todsp             ),
        .EJ_DebugM             ( EJ_DebugM             ),
        .EJ_DINT               ( EJ_DINT               ),
        .EJ_DINTsup            ( EJ_DINTsup            ),
        .EJ_DisableProbeDebug  ( EJ_DisableProbeDebug  ),
        .EJ_ECREjtagBrk        ( EJ_ECREjtagBrk        ),
        .EJ_ManufID            ( EJ_ManufID            ),
        .EJ_PartNumber         ( EJ_PartNumber         ),
        .EJ_PerRst             ( EJ_PerRst             ),
        .EJ_PrRst              ( EJ_PrRst              ),
        .EJ_SRstE              ( EJ_SRstE              ),
        .EJ_TCK                ( EJ_TCK                ),
        .EJ_TDI                ( EJ_TDI                ),
        .EJ_TDO                ( EJ_TDO                ),
        .EJ_TDOzstate          ( EJ_TDOzstate          ),
        .EJ_TMS                ( EJ_TMS                ),
        .EJ_TRST_N             ( EJ_TRST_N             ),
        .EJ_Version            ( EJ_Version            ),
        .gmb_dc_algorithm      ( gmb_dc_algorithm      ),
        .gmbddfail             ( gmbddfail             ),
        .gmbdifail             ( gmbdifail             ),
        .gmbdone               ( gmbdone               ),
        .gmb_ic_algorithm      ( gmb_ic_algorithm      ),
        .gmbinvoke             ( gmbinvoke             ),
        .gmb_isp_algorithm     ( gmb_isp_algorithm     ),
        .gmbispfail            ( gmbispfail            ),
        .gmb_sp_algorithm      ( gmb_sp_algorithm      ),
        .gmbspfail             ( gmbspfail             ),
        .gmbtdfail             ( gmbtdfail             ),
        .gmbtifail             ( gmbtifail             ),
        .gmbwdfail             ( gmbwdfail             ),
        .gmbwifail             ( gmbwifail             ),
        .gscanenable           ( gscanenable           ),
        .gscanin               ( gscanin               ),
        .gscanmode             ( gscanmode             ),
        .gscanout              ( gscanout              ),
        .gscanramwr            ( gscanramwr            ),
        .HADDR                 ( HADDR                 ),
        .HBURST                ( HBURST                ),
        .HCLK                  ( HCLK                  ),
        .HMASTLOCK             ( HMASTLOCK             ),
        .HPROT                 ( HPROT                 ),
        .HRDATA                ( HRDATA                ),
        .HREADY                ( HREADY                ),
        .HRESETn               ( HRESETn               ),
        .HRESP                 ( HRESP                 ),
        .HSIZE                 ( HSIZE                 ),
        .HTRANS                ( HTRANS                ),
        .HWDATA                ( HWDATA                ),
        .HWRITE                ( HWRITE                ),
        .ISP_fromisp           ( ISP_fromisp           ),
        .ISP_toisp             ( ISP_toisp             ),
        .PM_InstnComplete      ( PM_InstnComplete      ),
        .SI_AHBStb             ( SI_AHBStb             ),
        .SI_BootExcISAMode     ( SI_BootExcISAMode     ),
        .SI_ClkIn              ( SI_ClkIn              ),
        .SI_ClkOut             ( SI_ClkOut             ),
        .SI_ColdReset          ( SI_ColdReset          ),
        .SI_CPUNum             ( SI_CPUNum             ),
        .SI_Dbs                ( SI_Dbs                ),
        .SI_EICPresent         ( SI_EICPresent         ),
        .SI_EICVector          ( SI_EICVector          ),
        .SI_EISS               ( SI_EISS               ),
        .SI_Endian             ( SI_Endian             ),
        .SI_ERL                ( SI_ERL                ),
        .SI_EXL                ( SI_EXL                ),
        .SI_FDCInt             ( SI_FDCInt             ),
        .SI_IAck               ( SI_IAck               ),
        .SI_Ibs                ( SI_Ibs                ),
        .SI_Int                ( SI_Int                ),
        .SI_ION                ( SI_ION                ),
        .SI_IPFDCI             ( SI_IPFDCI             ),
        .SI_IPL                ( SI_IPL                ),
        .SI_IPPCI              ( SI_IPPCI              ),
        .SI_IPTI               ( SI_IPTI               ),
        .SI_IVN                ( SI_IVN                ),
        .SI_MergeMode          ( SI_MergeMode          ),
        .SI_NESTERL            ( SI_NESTERL            ),
        .SI_NESTEXL            ( SI_NESTEXL            ),
        .SI_NMI                ( SI_NMI                ),
        .SI_NMITaken           ( SI_NMITaken           ),
        .SI_Offset             ( SI_Offset             ),
        .SI_PCInt              ( SI_PCInt              ),
        .SI_Reset              ( SI_Reset | MFP_Reset  ),
        .SI_RP                 ( SI_RP                 ),
        .SI_Sleep              ( SI_Sleep              ),
        .SI_SRSDisable         ( SI_SRSDisable         ),
        .SI_SWInt              ( SI_SWInt              ),
        .SI_TimerInt           ( SI_TimerInt           ),
        .SI_TraceDisable       ( SI_TraceDisable       ),
        .TC_ClockRatio         ( TC_ClockRatio         ),
        .TC_Data               ( TC_Data               ),
        .TC_PibPresent         ( TC_PibPresent         ),
        .TC_Stall              ( TC_Stall              ),
        .TC_Valid              ( TC_Valid              ),
        .UDI_fromudi           ( UDI_fromudi           ),
        .UDI_toudi             ( UDI_toudi             )

`ifdef MFP_DEMO_PIPE_BYPASS
        ,
        .mpc_aselres_e         ( mpc_aselres_e         ),     
        .mpc_aselwr_e          ( mpc_aselwr_e          ),     
        .mpc_bselall_e         ( mpc_bselall_e         ),     
        .mpc_bselres_e         ( mpc_bselres_e         )      
`endif

    );

        assign BistIn                =   1'b0;
        assign CP2_tocp2             =   1'b0;
        assign DSP_todsp             =   1'b0;
    //  assign EJ_DINT               =   1'b0;
        assign EJ_DINTsup            =   1'b0;
        assign EJ_DisableProbeDebug  =   1'b0;
    //  assign EJ_ManufID            =  11'b0;
    //  assign EJ_PartNumber         =  16'b0;
    //  assign EJ_TCK                =   1'b0;
    //  assign EJ_TDI                =   1'b0;
    //  assign EJ_TMS                =   1'b0;
    //  assign EJ_TRST_N             =   1'b0;
        assign EJ_Version            =   4'b0;
        assign gmb_dc_algorithm      =   8'b0;
        assign gmb_ic_algorithm      =   8'b0;
        assign gmbinvoke             =   1'b0;
        assign gmb_isp_algorithm     =   8'b0;
        assign gmb_sp_algorithm      =   8'b0;
        assign gscanenable           =   1'b0;
        assign gscanin               =   1'b0;
        assign gscanmode             =   1'b0;
        assign gscanramwr            =   1'b0;
    //  assign HRDATA                =  32'b0;
    //  assign HREADY                =   1'b0;
    //  assign HRESP                 =   1'b0;
        assign ISP_toisp             =   1'b0;
    //  assign SI_AHBStb             =   1'b0;
        assign SI_BootExcISAMode     =   1'b0;
    //  assign SI_ClkIn              =   1'b0;
    //  assign SI_ColdReset          =   1'b0;
        assign SI_CPUNum             =  10'b0;
    //  assign SI_EICPresent         =   1'b0;
    //  assign SI_EICVector          =   6'b0;
    //  assign SI_EISS               =   4'b0;
        assign SI_Endian             =   1'b0;
    //  assign SI_Int                =   8'b0;
        assign SI_IPFDCI             =   3'b0;
        assign SI_IPPCI              =   3'b0;
    //  assign SI_IPTI               =   3'b0;
        assign SI_MergeMode          =   2'b0;
        assign SI_NMI                =   1'b0;
    //  assign SI_Offset             =  17'b0;
    //  assign SI_Reset              =   1'b0;
    //  assign SI_SRSDisable         =   4'b0;
    //  assign SI_TraceDisable       =   1'b0;
        assign TC_PibPresent         =   1'b0;
        assign TC_Stall              =   1'b0;
        assign UDI_toudi             = 128'b0;


    `ifdef MFP_USE_MPSSE_DEBUGGER
        // reset module is not used because mfp_reset_controller interferes
        // with work of debugger. This is not good: this configutation faults
        // inside the simulator but works on hardware (Altera MAX10)
        //
        // TODO: create universal reset module (power/cold/hot/ejtag)
        assign EJ_TRST_N        = 1'b1;
        assign EJ_ManufID       = 11'h02;
        assign EJ_PartNumber    = 16'hF1;
    `else
        // Module for hardware reset of EJTAG just after FPGA configuration
        // It pulses EJ_TRST_N low for 16 clock cycles.
        mfp_reset_controller reset_control (.clk (SI_ClkIn), .trst_n (trst_n));

        assign EJ_TRST_N        = trst_n & EJ_TRST_N_probe;
        assign EJ_ManufID       = 11'b0;
        assign EJ_PartNumber    = 16'b0;
    `endif //MFP_USE_MPSSE_DEBUGGER

    // Interrupt settings
    //     
    //     vector                vector 
    //      mode   eic mode  IntCtl.VS=0x1   destination
    //     ------  --------  -------------  -------------
    //              ...
    //   ^  hw7     eic9        .320        
    // p |  hw6     eic8        .300        
    // r |  hw5     eic7        .2E0        timer int
    // i |  hw4     eic6        .2C0        adc int
    // o |  hw3     eic5        .2A0        uart int
    // r |  hw2     eic4        .280        
    // i |  hw1     eic3        .260        
    // t |  hw0     eic2        .240        
    // y |  sw1     eic1        .220        software int 1
    //   |  sw0     eic0        .200        software int 0

    `ifdef MFP_USE_IRQ_EIC
        wire  [ `EIC_CHANNELS - 1 : 0 ] EIC_input;
        assign EIC_input[`EIC_CHANNELS - 1:8] = {`EIC_CHANNELS - 6 {1'b0}};
        assign EIC_input[7]   =  SI_TimerInt;
        assign EIC_input[6]   =  ADC_Interrupt;
        assign EIC_input[5]   =  uart_interrupt;
        assign EIC_input[4:2] =  3'b0;
        assign EIC_input[1]   =  SI_SWInt[1];
        assign EIC_input[0]   =  SI_SWInt[0];
        assign SI_IPTI        =  3'h0;
    `else
        assign SI_Offset      = 17'b0;
        assign SI_EISS        =  4'b0;
        assign SI_Int[7:5]    =  4'b0;
        assign SI_Int[4]      =  ADC_Interrupt;
        assign SI_Int[3]      =  uart_interrupt;

        `ifdef MFP_DEMO_INTERRUPTS
        assign SI_Int[2:0]    =  IO_Buttons [2:0];
        `else
        assign SI_Int[2:0]    =  3'b0;
        `endif
 
        assign SI_EICVector   =  6'b0;
        assign SI_EICPresent  =  1'b0;
        assign SI_IPTI        =  3'h7; //enable MIPS timer interrupt on HW5
    `endif //MFP_USE_IRQ_EIC

    //other settings
    assign SI_SRSDisable   = 4'b1111;  // Disable banks of shadow sets
    assign SI_TraceDisable = 1'b1;     // Disables trace hardware
    assign SI_AHBStb       = 1'b1;     // AHB: Signal indicating phase and frequency relationship between clk and hclk.

    `ifdef MFP_DEMO_CACHE_MISSES

         wire burst = (HTRANS == `HTRANS_NONSEQ && HBURST == `HBURST_WRAP4);

        `ifdef MFP_DEMO_PIPE_BYPASS

            assign IO_GreenLEDs =
            {
                { `MFP_N_GREEN_LEDS - (1 + 1 + 4 + 4) { 1'b0 } },
                HCLK,
                burst,
                HADDR [7:4],
                mpc_aselwr_e,   // Bypass res_w as src A
                mpc_bselall_e,  // Bypass res_w as src B
                mpc_aselres_e,  // Bypass res_m as src A
                mpc_bselres_e   // Bypass res_m as src B
            };

        `else

            assign IO_GreenLEDs =
            {
                { `MFP_N_GREEN_LEDS - (1 + 1 + 6) { 1'b0 } },
                HCLK,
                burst,
                HADDR [7:2]
            };
            
        `endif

    `elsif MFP_DEMO_PIPE_BYPASS

        assign IO_GreenLEDs =
        {
            { `MFP_N_GREEN_LEDS - 5 { 1'b0 } },
            HCLK,
            mpc_aselwr_e,   // Bypass res_w as src A
            mpc_bselall_e,  // Bypass res_w as src B
            mpc_aselres_e,  // Bypass res_m as src A
            mpc_bselres_e   // Bypass res_m as src B
        };

    `endif

    mfp_ahb_lite_matrix_with_loader matrix_loader
    (
        .HCLK             (   HCLK              ),
        .HRESETn          ( ~ SI_Reset          ),  // Not HRESETn - this is necessary for serial loader
        .HADDR            (   HADDR             ),
        .HBURST           (   HBURST            ),
        .HMASTLOCK        (   HMASTLOCK         ),
        .HPROT            (   HPROT             ),
        .HSIZE            (   HSIZE             ),
        .HTRANS           (   HTRANS            ),
        .HWDATA           (   HWDATA            ),
        .HWRITE           (   HWRITE            ),
        .HRDATA           (   HRDATA            ),
        .HREADY           (   HREADY            ),
        .HRESP            (   HRESP             ),
        .SI_Endian        (   SI_Endian         ),
        
        `ifdef MFP_USE_SDRAM_MEMORY
        .SDRAM_CKE        (   SDRAM_CKE         ),
        .SDRAM_CSn        (   SDRAM_CSn         ),
        .SDRAM_RASn       (   SDRAM_RASn        ),
        .SDRAM_CASn       (   SDRAM_CASn        ),
        .SDRAM_WEn        (   SDRAM_WEn         ),
        .SDRAM_ADDR       (   SDRAM_ADDR        ),
        .SDRAM_BA         (   SDRAM_BA          ),
        .SDRAM_DQ         (   SDRAM_DQ          ),
        .SDRAM_DQM        (   SDRAM_DQM         ),
        `endif
                                                
        .IO_Switches      (   IO_Switches       ),
        .IO_Buttons       (   IO_Buttons        ),
        .IO_RedLEDs       (   IO_RedLEDs        ),

        `ifdef MFP_DEMO_CACHE_MISSES
        .IO_GreenLEDs     (                    ),
        `elsif MFP_DEMO_PIPE_BYPASS
        .IO_GreenLEDs     (                    ),
        `else
        .IO_GreenLEDs     (   IO_GreenLEDs     ),
        `endif

        .IO_7_SegmentHEX  (   IO_7_SegmentHEX   ),
                                               
        `ifdef MFP_DEMO_LIGHT_SENSOR           
        .SPI_CS           ( SPI_CS              ),
        .SPI_SCK          ( SPI_SCK             ),
        .SPI_SDO          ( SPI_SDO             ),
        `endif                                 
                                               
        .UART_RX          (   UART_RX           ), 
        .UART_TX          (   UART_TX           ),

        `ifdef MFP_USE_DUPLEX_UART
        .UART_SRX         (   UART_SRX          ), 
        .UART_STX         (   UART_STX          ),
        `endif //MFP_USE_DUPLEX_UART
        .UART_INT         (   uart_interrupt    ),

        `ifdef MFP_USE_IRQ_EIC
        .EIC_input        (   EIC_input         ),
        .EIC_Offset       (   SI_Offset         ),
        .EIC_ShadowSet    (   SI_EISS           ),
        .EIC_Interrupt    (   SI_Int            ),
        .EIC_Vector       (   SI_EICVector      ),
        .EIC_Present      (   SI_EICPresent     ),
        .EIC_IAck         (   SI_IAck           ),
        .EIC_IPL          (   SI_IPL            ),
        .EIC_IVN          (   SI_IVN            ),
        .EIC_ION          (   SI_ION            ),
        `endif //MFP_USE_IRQ_EIC

        `ifdef MFP_USE_ADC_MAX10
        .ADC_C_Valid      (   ADC_C_Valid       ),
        .ADC_C_Channel    (   ADC_C_Channel     ),
        .ADC_C_SOP        (   ADC_C_SOP         ),
        .ADC_C_EOP        (   ADC_C_EOP         ),
        .ADC_C_Ready      (   ADC_C_Ready       ),
        .ADC_R_Valid      (   ADC_R_Valid       ),
        .ADC_R_Channel    (   ADC_R_Channel     ),
        .ADC_R_Data       (   ADC_R_Data        ),
        .ADC_R_SOP        (   ADC_R_SOP         ),
        .ADC_R_EOP        (   ADC_R_EOP         ),
        .ADC_Trigger      (   ADC_Trigger       ),
        .ADC_Interrupt    (   ADC_Interrupt     ),
        `endif //MFP_USE_ADC_MAX10

        .MFP_Reset        (   MFP_Reset         )
    );

endmodule

//--------------------------------------------------------------------

module mfp_reset_controller
(
    input      clk,
    output reg trst_n
);

    reg [3:0] trst_delay;
  
    always @ (posedge clk)
    begin
        if (trst_delay == 4'hf)
            trst_n     <= 1'b1;
        else
        begin
            trst_n     <= 1'b0;
            trst_delay <= trst_delay + 4'b1;
        end
    end

endmodule
