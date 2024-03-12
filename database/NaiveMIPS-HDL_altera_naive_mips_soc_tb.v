`default_nettype none
`timescale 1ns/100ps

module naive_mips_soc_tb();

///////// LEDG /////////
wire                        [8:0]                LEDG;

///////// LEDR /////////
wire                        [17:0]               LEDR;

///////// DRAM /////////
wire                        [12:0]               DRAM_ADDR;
wire                        [1:0]                DRAM_BA;
wire                                             DRAM_CAS_N;
wire                                             DRAM_CKE;
wire                                             DRAM_CLK;
wire                                             DRAM_CS_N;
wire                        [31:0]               DRAM_DQ;
wire                        [3:0]                DRAM_DQM;
wire                                             DRAM_RAS_N;
wire                                             DRAM_WE_N;

wire                                             UART_RXD;
wire                                             UART_TXD;
wire                        [17:0]               SW;
wire                        [35:0]               GPIO;

reg CLOCK_50=0;
always #10 CLOCK_50=~CLOCK_50;

assign UART_RXD = 1;
assign SW = 1;
assign GPIO[1] = 1;

wire clk_high,clk_high_shift,clk,locked,locked_other,rst_n,rst_other_n;
wire clk_uart, clk_uart_pll;
wire clk_tick;

sys_pll pll1(
    .areset(1'b0),
    .inclk0(CLOCK_50),
    .c0(clk),
    //.c1(clk2x),
    .c2(clk_uart_pll),
    .c3(clk_tick),
    .locked(locked));
clk_ctrl clk_ctrl1(/*autoinst*/
         .rst_out_n(rst_n),
         .clk(clk),
         .rst_in_n(locked));
hf_pll pll2(
	.areset(1'b0),
	.inclk0(CLOCK_50),
	.c0(clk_high),
	.c1(clk_high_shift),
	.locked(locked_other));
clk_ctrl clk_ctrl2(/*autoinst*/
         .rst_out_n(rst_other_n),
         .clk(clk_high),
         .rst_in_n(locked_other));

naive_mips_soc_cache soc(
		.clk_cpu_clk(clk),                    //   clk_cpu.clk
		.clk_other_clk(clk_high),                  // clk_other.clk
		.clk_uart_clk(clk_uart_pll),                   //  clk_uart.clk
		.debugger_dbg_txd(GPIO[0]), // debugger.dbg_txd
		.debugger_dbg_rxd(GPIO[1]), //         .dbg_rxd
        .led_export({LEDR,LEDG}),       //      led.export
		.rst_cpu_reset_n(rst_n),  //  rst_cpu.reset_n
		.rst_other_reset_n(rst_other_n),              // rst_other.reset_n
        .sdram_addr(DRAM_ADDR),       //    sdram.addr
        .sdram_ba(DRAM_BA),         //         .ba
        .sdram_cas_n(DRAM_CAS_N),      //         .cas_n
        .sdram_cke(DRAM_CKE),        //         .cke
        .sdram_cs_n(DRAM_CS_N),       //         .cs_n
        .sdram_dq(DRAM_DQ),         //         .dq
        .sdram_dqm(DRAM_DQM),        //         .dqm
        .sdram_ras_n(DRAM_RAS_N),      //         .ras_n
        .sdram_we_n(DRAM_WE_N),       //         .we_n
		.sdram_clk_clk(DRAM_CLK),      // sdram_clk.clk
        .sw_export(SW),        //       sw.export
        .uart_rxd(UART_RXD),         //     uart.rxd
        .uart_txd(UART_TXD)          //         .txd
    );

naive_mips_soc_cache_main_ram_test_component dram(
                                                      // inputs:
                                                       .clk(DRAM_CLK),
                                                       .zs_addr(DRAM_ADDR),
                                                       .zs_ba(DRAM_BA),
                                                       .zs_cas_n(DRAM_CAS_N),
                                                       .zs_cke(DRAM_CKE),
                                                       .zs_cs_n(DRAM_CS_N),
                                                       .zs_dqm(DRAM_DQM),
                                                       .zs_ras_n(DRAM_RAS_N),
                                                       .zs_we_n(DRAM_WE_N),

                                                      // outputs:
                                                       .zs_dq(DRAM_DQ)
                                                    );
endmodule
