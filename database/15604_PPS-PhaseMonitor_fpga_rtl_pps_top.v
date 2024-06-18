// This program was cloned from: https://github.com/kingyoPiyo/PPS-PhaseMonitor
// License: MIT License

module pps_top (
    input   wire            MCO,        // Onboard 50MHz
    input   wire            RST_N,      // Onboard RST SW
    input   wire    [3:0]   USER_PB,    // Low Active
    input   wire    [5:0]   USER_DIPSW, // ON = Low
    input   wire            REF_CLK,    // REF 5MHz

    // PPS Input
    input   wire            PPS1,       // PMODB_D0(J9-1)
    input   wire            PPS2,       // PMODB_D1(J9-2)
    input   wire            PPS3,       // PMODB_D2(J9-3)
    input   wire            PPS4,       // PMODB_D3(J9-4)

    // PPS Output
    output  wire            PPSO1,      // PMODA_D0(J8-1)

    // UART
    output  wire            UART_TX,
    input   wire            UART_RX,

    // SFP
    input   wire            SFP_LOS,
    output  wire            SFP_TXD,
    input   wire            SFP_RXD,

    // LED
    output  wire    [3:0]   PANEL_LED,  // High Active
    output  wire            PANEL_PPS,  // PPS
    output  wire            PANEL_ERR,  // ERROR
    output  wire    [4:0]   ONB_LED     // Low Active
    );


    // Wire
    wire    w_clk500m;
    wire    w_clk250m;
    wire    w_clk50m;
    wire    w_pll_locked;
    wire    w_ref10m;
    wire    w_ref100m;
    wire    w_refpll_locked;
    wire    w_res_n1;
    wire    w_res_n2;
    wire    w_ph_en;
    wire    [29:0]  w_ph1;
    wire    [29:0]  w_ph2;
    wire    [29:0]  w_ph3;
    wire    [29:0]  w_ph4;
    wire    [29:0]  w_ph5;
    wire    [27:0]  w_freq;
    wire    [7:0]   w_uart_rx_data;
    wire            w_uart_rx_den;


    // Clock generator from Onboard OSC
    pll	pll_inst (
        .areset ( ~RST_N ),
        .inclk0 ( MCO ),        // 50MHz
        .c0 ( w_clk500m ),      // 500MHz
        .c1 ( w_clk250m ),      // 250MHz
        .c2 ( w_clk50m ),       // 50MHz
        .locked ( w_pll_locked )
	);

    // Clock generator from External Ref-clock
    pll_ref	pll_ref_inst (
        .areset ( ~RST_N ),
        .inclk0 ( REF_CLK ),
        .c0 ( w_ref10m ),       // 10MHz
        .c1 ( w_ref100m ),      // 100MHz
        .locked ( w_refpll_locked )
	);

    // Reset **TODO**
    reset_gen reset_gen_main_pll (
        .i_clk ( w_clk50m ),
        .i_res_n ( RST_N & w_pll_locked ),
        .o_res_n ( w_res_n1 )
    );
    reset_gen reset_gen_ref_pll (
        .i_clk ( w_ref100m ),
        .i_res_n ( RST_N & w_refpll_locked ),
        .o_res_n ( w_res_n2 )
    );

    assign SFP_TXD = w_ref10m;  // Debug
    
    // Phase measurement
    phase_meas phase_meas_inst (
        .i_res_n ( w_res_n1 ),
        .i_fclk ( w_clk500m ),  // DDR Sampling clock
        .i_pclk ( w_clk250m ),  // Parallel clock
        .i_lclk ( w_clk50m ),   // Output clock
        .i_pps1 ( PPS1 ),
        .i_pps2 ( PPS2 ),
        .i_pps3 ( PPS3 ),
        .i_pps4 ( PPS4 ),
        .i_pps5 ( PPSO1 ),
        .o_ph_en ( w_ph_en ),   // ** 50MHz **
        .o_ph1 ( w_ph1[29:0] ), // ** 50MHz **
        .o_ph2 ( w_ph2[29:0] ), // ** 50MHz **
        .o_ph3 ( w_ph3[29:0] ), // ** 50MHz **
        .o_ph4 ( w_ph4[29:0] ), // ** 50MHz **
        .o_ph5 ( w_ph5[29:0] )  // ** 50MHz **
    );


    // Frequency counter
    //  - Target : REF_CLK
    //  - Gate   : PPS1
    freq_counter freq_counter_inst (
        .i_clk ( w_ref100m ),   // Ref 100MHz
        .i_res_n ( w_res_n2 ),
        .i_pps ( PPS1 ),        // 1PPS signal from GPS
        .o_freq ( w_freq[27:0] )
    );


    // UART TX
    ans_proc ans_proc_inst (
        .i_clk ( w_clk50m ),
        .i_rst_n ( w_res_n1 ),
        .i_ph1 ( w_ph1[29:0] ),
        .i_ph2 ( w_ph2[29:0] ),
        .i_ph3 ( w_ph3[29:0] ),
        .i_ph4 ( w_ph4[29:0] ),
        .i_ph5 ( w_ph5[29:0] ),
        .i_freq ( w_freq[27:0] ),
        .i_tx_start ( w_ph_en ),
        .o_uart_tx ( UART_TX )
    );
    
    
    // UART RX
    uart_rx uart_rx_inst (
        .i_clk ( w_clk50m ),
        .i_rst_n ( w_res_n1 ),
        .i_uart_mosi ( UART_RX ),
        .o_data ( w_uart_rx_data[7:0] ),
        .o_dataen ( w_uart_rx_den )
    );


    // 1PPS signal generator
    pps_gen pps_gen_inst (
        .i_clk ( w_ref100m ),
        .i_res_n ( w_res_n2 ),
        .i_ph_sync ( PPS1 & ~USER_PB[0] ),
        .o_pps ( PPSO1 )
    );


    // LED
    assign ONB_LED[0] = ~PPS1;
    assign ONB_LED[1] = ~PPS2;
    assign ONB_LED[2] = ~PPS3;
    assign ONB_LED[3] = ~PPS4;
    assign ONB_LED[4] = 1'b1;

    assign PANEL_LED[0] = PPS1;
    assign PANEL_LED[1] = PPS2;
    assign PANEL_LED[2] = PPS3;
    assign PANEL_LED[3] = PPS4;
    
    assign PANEL_PPS = PPSO1;
    assign PANEL_ERR = ~w_refpll_locked;

endmodule
