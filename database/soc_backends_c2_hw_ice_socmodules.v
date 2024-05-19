// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

/* Memory mapped modules */

`ifdef ICE_DEBUG
wire [7:0] PCdebug;

assign PCdebug1 = PCdebug[0];
assign PCdebug2 = PCdebug[1];
assign PCdebug3 = PCdebug[2];
assign PCdebug4 = PCdebug[3];
assign PCdebug5 = PCdebug[4];
assign PCdebug6 = PCdebug[5];
assign PCdebug7 = PCdebug[6];
assign PCdebug8 = PCdebug[7];
`endif

// We cannot simulate PLL:
`ifdef ICE_ROUTED_SIM
   assign clk = sys_clk_in;
`else
   // Generate 35.250MHz
   SB_PLL40_CORE #(.FEEDBACK_PATH("SIMPLE"),
                   .PLLOUT_SELECT("GENCLK"),
                   .DIVR(0),
                   .DIVF(46),
                   .DIVQ(4),
                   .FILTER_RANGE(3'b001),
                   ) pll1 (
                           .REFERENCECLK(sys_clk_in),
                           .PLLOUTCORE(clk),
                           .RESETB(1'b1),
                           .BYPASS(1'b0)
                           );
`endif

   assign rst = sys_reset;

   wire [7:0]           LED;
   wire [7:0]           LEDr;

   outpin led0 (.clk(clk), .we(1'b1), .pin(LED1), .wd(LED[0]), .rd(LEDr[0]));
   outpin led1 (.clk(clk), .we(1'b1), .pin(LED2), .wd(LED[1]), .rd(LEDr[1]));
   outpin led2 (.clk(clk), .we(1'b1), .pin(LED3), .wd(LED[2]), .rd(LEDr[2]));
   outpin led3 (.clk(clk), .we(1'b1), .pin(LED4), .wd(LED[3]), .rd(LEDr[3]));
   outpin led4 (.clk(clk), .we(1'b1), .pin(LED5), .wd(LED[4]), .rd(LEDr[4]));
   outpin led5 (.clk(clk), .we(1'b1), .pin(LED6), .wd(LED[5]), .rd(LEDr[5]));
   outpin led6 (.clk(clk), .we(1'b1), .pin(LED7), .wd(LED[6]), .rd(LEDr[6]));
   outpin led7 (.clk(clk), .we(1'b1), .pin(LED8), .wd(LED[7]), .rd(LEDr[7]));

   ledwriter ledwr1 (.clk(clk),
                     .rst(rst),
                     
                     .LED(LED),
                     
                     .addr_b(ram_addr_in_b),
                     .data_b_in(ram_data_out_b),
                     .data_b_we(ram_we_out));


   wire [31:0]     data_bus_in_uart;
   wire            data_bus_strobe_uart;

`ifdef ENABLE_UART

   uartmm uart1(.clk(clk),
                .rst(rst),

                // Module external signals: TODO: generate?
                .TX(TX),
                .RX(RX),
                //////////
                
                .data_b(data_bus_in_uart),
                .addr_b(ram_addr_in_b),
                .strobe_b(data_bus_strobe_uart),
                .data_b_in(ram_data_out_b),
                .data_b_we(ram_we_out)
                );
`else // !`ifdef ENABLE_UART

   assign data_bus_strobe_uart = 0;

`endif
