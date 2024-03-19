/*
 * freq = (CLKFBOUT_MULT * 1000) / (CLKIN1_PERIOD * DIVCLK_DIVIDE)
 * freq sould be in [800 - 1600]
 * output freq = freq / CLKOUT0_DIVIDE
 * 
 * CLKIN1_PERIOD = 10 (ARTY internal clock = 100 MHz)
 * freq = 80 to 160 MHz: use CLKFBOUT_MULT = freq/10, DIVCLK_DIVIDE=1 and CLKOUT0_DIVIDE=10
 */ 

 module femtoPLL #(
    parameter freq = 50
 ) (
    input wire pclk,
    output wire clk
 );

 wire clk_feedback;
 wire clk_internal;

 PLLE2_ADV #(
    .CLKFBOUT_MULT(freq/10),  // Multiply value for all CLKOUT (2-64)
    .DIVCLK_DIVIDE(1),        // Master division value , (1-56)
    .CLKOUT0_DIVIDE(10),      // 
    .BANDWIDTH("OPTIMIZED"),  // OPTIMIZED, HIGH, LOW
    .CLKFBOUT_PHASE(0.0),     // Phase offset in degrees of CLKFB, (-360-360)
    .CLKIN1_PERIOD(10.0),     // Input clock period in ns to ps resolution
    .CLKOUT0_DUTY_CYCLE(0.5),
    .CLKOUT0_PHASE(0.0),
    .REF_JITTER1(0.0),      // Reference input jitter in UI (0.000-0.999)
    .STARTUP_WAIT("FALSE")  // Delayu DONE until PLL Locks, ("TRUE"/"FALSE")
 ) genclock(
     .CLKOUT0(clk_internal),
     .CLKFBOUT(clk_feedback), // 1-bit output, feedback clock
     .CLKIN1(pclk),
     .PWRDWN(1'b0),
     .RST(1'b0),
     .CLKFBIN(clk_feedback),  // 1-bit input, feedback clock
     
     .CLKOUT1(), .CLKOUT2(), .CLKOUT3(), .CLKOUT4(), .CLKOUT5(),
     .DO(), .DRDY(), .LOCKED(), 
     .CLKIN2(), .CLKINSEL(),
     .DADDR(), .DCLK(), .DEN(), .DI(), .DWE()
 );

 BUFG bufg(
     .I(clk_internal),
     .O(clk)
 );

 endmodule
