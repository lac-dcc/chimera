`default_nettype none

module top (
    input wire CLK100MHZ,
    output wire [3:0] led,
    output wire ck_io0,
    output wire ck_io1
);

   wire clk100;
   wire clk50;
   wire locked;
   wire clkbfout;

   PLLE2_BASE #(
      .BANDWIDTH("OPTIMIZED"),  // OPTIMIZED, HIGH, LOW
      .CLKFBOUT_MULT(10),        // Multiply value for all CLKOUT, (2-64)
      .CLKFBOUT_PHASE(0.0),     // Phase offset in degrees of CLKFB, (-360.000-360.000).
      .CLKIN1_PERIOD(8),      // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
      .CLKOUT0_DIVIDE(10),
      .CLKOUT1_DIVIDE(20),
      .CLKOUT2_DIVIDE(1),
      .CLKOUT3_DIVIDE(1),
      .CLKOUT4_DIVIDE(1),
      .CLKOUT5_DIVIDE(1),
      // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
      .CLKOUT0_DUTY_CYCLE(0.5),
      .CLKOUT1_DUTY_CYCLE(0.5),
      .CLKOUT2_DUTY_CYCLE(0.5),
      .CLKOUT3_DUTY_CYCLE(0.5),
      .CLKOUT4_DUTY_CYCLE(0.5),
      .CLKOUT5_DUTY_CYCLE(0.5),
      // CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
      .CLKOUT0_PHASE(0.0),
      .CLKOUT1_PHASE(0.0),
      .CLKOUT2_PHASE(0.0),
      .CLKOUT3_PHASE(0.0),
      .CLKOUT4_PHASE(0.0),
      .CLKOUT5_PHASE(0.0),
      .DIVCLK_DIVIDE(1),        // Master division value, (1-56)
      .REF_JITTER1(0.0),        // Reference input jitter in UI, (0.000-0.999).
      .STARTUP_WAIT("FALSE")    // Delay DONE until PLL Locks, ("TRUE"/"FALSE")
   )
   PLLE2_BASE_inst (
      // Clock Outputs: 1-bit (each) output: User configurable clock outputs
      .CLKOUT0(clk100),   // 1-bit output: CLKOUT0
      .CLKOUT1(clk50),   // 1-bit output: CLKOUT1
      //.CLKOUT2(CLKOUT2),   // 1-bit output: CLKOUT2
      //.CLKOUT3(CLKOUT3),   // 1-bit output: CLKOUT3
      //.CLKOUT4(CLKOUT4),   // 1-bit output: CLKOUT4
      //.CLKOUT5(CLKOUT5),   // 1-bit output: CLKOUT5
      // Feedback Clocks: 1-bit (each) output: Clock feedback ports
      .CLKFBOUT(clkbfout), // 1-bit output: Feedback clock
      .LOCKED(locked),     // 1-bit output: LOCK
      .CLKIN1(CLK100MHZ),     // 1-bit input: Input clock
      // Control Ports: 1-bit (each) input: PLL control ports
      .PWRDWN(0),     // 1-bit input: Power-down
      .RST(0),           // 1-bit input: Reset
      // Feedback Clocks: 1-bit (each) input: Clock feedback ports
      .CLKFBIN(clkbfout)    // 1-bit input: Feedback clock
   );

   // End of PLLE2_BASE_inst instantiation
   
  // issue with BRAM initialization, keep CPU in reset for some number of clocks. 127 seems to be ok, 63 does not route
  reg [5:0] resetCounter = 0;
  wire isRunning = resetCounter == 63;
  always @(posedge clk50) begin
    if (resetCounter < 63) begin
      resetCounter <= resetCounter + 1;
    end
  end
  
  wire tlReset = !isRunning || !locked;
  Quokka_MainController_TopLevel Quokka_MainController_TopLevel
  (
    .Clock (clk50),
    .Reset (!tlReset),
    .AggregatorLED1 (led),
    .AggregatorRXD (1),
    .AggregatorServo (ck_io0),
    .AggregatorServoInf (ck_io1)
  );
endmodule
