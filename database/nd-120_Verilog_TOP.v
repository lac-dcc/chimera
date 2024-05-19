// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MEMORY MANAGEMENT and MEMORY                               **
**                                                                       **
** TOP LEVEL FOR FPGA IMPLEMENTATION                                     **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/


module top (
    input sysclk,
    input btn1, // mapped to button 4 on the board (s1, not labled)
    input btn2,
    output [5:0] led,
    input uartRx,
    output uartTx    
);


//TODO: Add signals for SD CARD interface

// helpers
wire s_high;
wire s_low;
wire sys_rst_n;
assign s_high = 1'b1;
assign s_low = 1'b0;

// input signals
wire clk1;
wire clk2;
wire [1:0] oc_select;

wire [1:0] s_SEL_TESTMUX;
assign s_SEL_TESTMUX = 2'b00; // 00=TESTMUX=0

wire [4:0] s_baud_rate_switch;
assign s_baud_rate_switch = 5'b00000; // 00000=9600 baud

// output wire from CPU
wire [5:0] s_cpu_led; // LED  0=CPU RED, 1=CPU GREEN, 2=LED4_RED_PARITY_ERROR, 3=LED_CPU_GRANT_INDICATOR, 4=LED_BUS_GRANT_INDICATOR, 5=LED1 from MMU

wire s_run;
wire [4:0] s_test_4_0;
wire [4:0] s_dp_5_1_n;
wire s_tp1_intrq_n;


// TODO: Modify clock ? 
assign clk1 = sysclk;  // XTAL1 = 39.3216MHZ
assign clk2 = sysclk;  // XTAL2 = 35 MHZ (for slow operations?)

assign sys_rst_n = btn1;

assign oc_select = 2'b11; // 11= Choose clock input = XTAL1 (full speed)
wire [63:0] s_csbits;


// Assign som lights to the LED's (Inverted because the nano is led's are active low)

assign led[1:0]=~s_cpu_led[1:0];  //  0=RED,1=GREEN 
assign led[2] = !s_run;
assign led[3] = !s_cpu_led[3]; // LED CPU GRANT INDICATOR
//assign led[4] = !s_cpu_led[4] // LED BUS GRANT INDICATOR
assign led[4] = !uartRx;
assign led[5] = !uartTx;

ND3202D CPU_BOARD (
   .sysclk(sysclk),
   .sys_rst_n(sys_rst_n),
   .BINT10_n(s_high),
   .BINT11_n(s_high),
   .BINT12_n(s_high),
   .BINT13_n(s_high),
   .BINT15_n(s_high),
   .BREQ_n(s_high),
   .CLOCK_1(clk1),
   .CLOCK_2(clk1),
   .CONSOLE_n (s_high),
   .CONTINUE_n(s_high),
   .EAUTO_n (s_high),
   .LOAD_n(s_high),
   .LOCK_n(s_high),
   .OC_1_0(oc_select),
   .OSCCL_n(s_high),
   .RXD(uartRx),   
   .STOP_n (s_high),
   .SW1_CONSOLE(s_high),
   .SWMCL_n(s_high),
   .XTR(s_low),
   .SEL_TESTMUX(s_SEL_TESTMUX),
   .BAUD_RATE_SWITCH(s_baud_rate_switch), // 5 bits

    // outputs
   .CSBITS(s_csbits),
   .DP_5_1_n(s_dp_5_1_n ),
   .RUN_n(s_run),
   .TEST_4_0(s_test_4_0),
   .TP1_INTRQ_n(s_tp1_intrq_n),
   .TXD(uartTx),
   .LED(s_cpu_led[5:0]) // LED  0=CPU RED, 1=CPU GREEN, 2=LED4_RED_PARITY_ERROR, 3=LED_CPU_GRANT_INDICATOR, 4=LED_BUS_GRANT_INDICATOR, 5=LED1 from MMU
);

endmodule