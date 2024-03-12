`include "mfp_ahb_lite_matrix_config.vh"

module de10_nano(

	//////////// ADC //////////
	output		          		ADC_CONVST,
	output		          		ADC_SCK,
	output		          		ADC_SDI,
	input 		          		ADC_SDO,

	//////////// ARDUINO //////////
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N,

	//////////// CLOCK //////////
	input 		          		FPGA_CLK1_50,
	input 		          		FPGA_CLK2_50,
	input 		          		FPGA_CLK3_50,

	//////////// HDMI //////////
	inout 		          		HDMI_I2C_SCL,
	inout 		          		HDMI_I2C_SDA,
	inout 		          		HDMI_I2S,
	inout 		          		HDMI_LRCLK,
	inout 		          		HDMI_MCLK,
	inout 		          		HDMI_SCLK,
	output		          		HDMI_TX_CLK,
	output		          		HDMI_TX_DE,
	output		    [23:0]		HDMI_TX_D,
	output		          		HDMI_TX_HS,
	input 		          		HDMI_TX_INT,
	output		          		HDMI_TX_VS,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [7:0]		LED,

	//////////// SW //////////
	input 		     [3:0]		SW,

	//////////// GPIO_0, GPIO connect to GPIO Default //////////
	inout 		    [35:0]		GPIO_0,

	//////////// GPIO_1, GPIO connect to GPIO Default //////////
	inout 		    [35:0]		GPIO_1
);

    // global clock signals
    wire clk;

    `ifdef MFP_USE_SLOW_CLOCK_AND_CLOCK_MUX

        wire       muxed_clk;
        wire [1:0] sw_db;

        mfp_multi_switch_or_button_sync_and_debouncer
        # (.WIDTH (2))
        mfp_multi_switch_or_button_sync_and_debouncer
        (   
            .clk    ( FPGA_CLK1_50 ),
            .sw_in  ( SW [1:0]     ),
            .sw_out ( sw_db        )
        );

        mfp_clock_divider_50_MHz_to_25_MHz_12_Hz_0_75_Hz 
        mfp_clock_divider_50_MHz_to_25_MHz_12_Hz_0_75_Hz
        (
            .clki    ( FPGA_CLK1_50  ),
            .sel_lo  ( sw_db [0]     ),
            .sel_mid ( sw_db [1]     ),
            .clko    ( muxed_clk     )
        );

        global gclk
        (
            .in     ( muxed_clk  ), 
            .out    ( clk        )
        );

    `else
        assign clk = FPGA_CLK1_50;
    `endif

    wire [`MFP_N_SWITCHES          - 1:0] IO_Switches;
    wire [`MFP_N_BUTTONS           - 1:0] IO_Buttons;
    wire [`MFP_N_RED_LEDS          - 1:0] IO_RedLEDs;
    wire [`MFP_N_GREEN_LEDS        - 1:0] IO_GreenLEDs;
    wire [`MFP_7_SEGMENT_HEX_WIDTH - 1:0] IO_7_SegmentHEX;

    assign IO_Switches = { { `MFP_N_SWITCHES - 4 { 1'b0 } } ,   SW  [3:0] };
    assign IO_Buttons  = { { `MFP_N_BUTTONS  - 2 { 1'b0 } } , ~ KEY [1:0] };

    wire [31:0] HADDR, HRDATA, HWDATA;
    wire        HWRITE;

	assign LED = IO_GreenLEDs [7:0];

    //This is a workaround to make EJTAG working
    //TODO: add complex reset signals handling module
    wire RESETn = KEY [0] & GPIO_0 [20];

    mfp_system mfp_system
    (
        .SI_ClkIn         (   clk             ),
        .SI_Reset         (   ~RESETn         ),
                          
        .HADDR            (   HADDR           ),
        .HRDATA           (   HRDATA          ),
        .HWDATA           (   HWDATA          ),
        .HWRITE           (   HWRITE          ),

        .EJ_TRST_N_probe  (   GPIO_0 [22]     ),
        .EJ_TDI           (   GPIO_0 [21]     ),
        .EJ_TDO           (   GPIO_0 [19]     ),
        .EJ_TMS           (   GPIO_0 [23]     ),
        .EJ_TCK           (   GPIO_0 [17]     ),
        .SI_ColdReset     ( ~ GPIO_0 [20]     ),
        .EJ_DINT          (   1'b0            ),

        .IO_Switches      (   IO_Switches     ),
        .IO_Buttons       (   IO_Buttons      ),
        .IO_RedLEDs       (   IO_RedLEDs      ),
        .IO_GreenLEDs     (   IO_GreenLEDs    ), 
        .IO_7_SegmentHEX  (   IO_7_SegmentHEX ),

        .UART_RX          (   GPIO_0 [31]     ),
        .UART_TX          (   GPIO_0 [32]     ),

        `ifdef MFP_USE_DUPLEX_UART
        .UART_SRX         (   GPIO_0 [33]     ), 
        .UART_STX         (   GPIO_0 [35]     ),
        `endif

        .SPI_CS           (   GPIO_0 [34]     ),
        .SPI_SCK          (   GPIO_0 [28]     ),
        .SPI_SDO          (   GPIO_0 [30]     )
    );

    assign GPIO_0 [15] = 1'b0;
    assign GPIO_0 [14] = 1'b0;
    assign GPIO_0 [13] = 1'b1;
    assign GPIO_0 [12] = 1'b1;
   
    assign GPIO_0 [26] = 1'b0;

endmodule
