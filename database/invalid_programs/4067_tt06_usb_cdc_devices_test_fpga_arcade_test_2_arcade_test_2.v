// This program was cloned from: https://github.com/mbalestrini/tt06_usb_cdc_devices
// License: Apache License 2.0

`default_nettype none

module arcade_test_2
  (
   input  clk, // 16MHz Clock
   output led, // User LED ON=1, OFF=0
   inout  usb_p, // USB+
   inout  usb_n, // USB-
   output usb_pu,  // USB 1.5kOhm Pullup EN

   input [7:0] device_inputs,

   output debug_usb_configured,
   output debug_usb_tx_en,
   output [3:0] debug_usb_frame_partial   
   );

   localparam CHANNELS = 'd1;
   localparam BIT_SAMPLES = 'd4;
   localparam [6:0] DIVF = 12*BIT_SAMPLES-1;
   localparam [2:0] DIVQ = 3'd4; // 48MHz

   wire  clk_pll;
   wire  lock;
   wire  rstn;
   wire  usb_clk;

   wire  usb_dp_pu;
   wire  usb_dp_rx;
   wire  usb_dn_rx;
   wire  usb_dp_tx;
   wire  usb_dn_tx;
   wire  usb_tx_en;
   
   wire debug_usb_configured;
   wire debug_usb_tx_en;
   wire [3:0] debug_usb_frame_partial;
   wire [10:0] debug_usb_frame;
   wire [7:0] device_inputs;

   assign rstn = lock;
   assign usb_clk = clk_pll;

   assign debug_usb_frame_partial[3:0] = debug_usb_frame[3:0];


    
   usb_cdc_devices u_usb_cdc_devices (
         .clk(usb_clk), 
         .rstn_i(rstn),

         .dp_pu_o(usb_dp_pu), // USB 1.5kOhm Pullup EN

         .tx_en_o(usb_tx_en), // USB+- tristate control
         .dp_tx_o(usb_dp_tx), // USB+
         .dp_rx_i(usb_dp_rx),  // USB+
         .dn_tx_o(usb_dn_tx), // USB-
         .dn_rx_i(usb_dn_rx),   // USB-

         .debug_led_o(led), // User LED ON=1, OFF=0
         .inputs_i({device_inputs}),

        .debug_usb_configured_o(debug_usb_configured), // While USB_CDC is in configured state, configured_o shall be high.
        .debug_usb_tx_en_o(debug_usb_tx_en),
        .debug_usb_frame_o(debug_usb_frame), // frame_o shall be last recognized USB frame number sent by USB host.

  );

   // if FEEDBACK_PATH = SIMPLE:
   // clk_freq = (ref_freq * (DIVF + 1)) / (2**DIVQ * (DIVR + 1));
   SB_PLL40_CORE #(.DIVR(4'd0),
                   .DIVF(DIVF),
                   .DIVQ(DIVQ),
                   .FILTER_RANGE(3'b001),
                   .FEEDBACK_PATH("SIMPLE"),
                   .DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
                   .FDA_FEEDBACK(4'b0000),
                   .DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
                   .FDA_RELATIVE(4'b0000),
                   .SHIFTREG_DIV_MODE(2'b00),
                   .PLLOUT_SELECT("GENCLK"),
                   .ENABLE_ICEGATE(1'b0))
   u_pll (.REFERENCECLK(clk), // 16MHz
          .PLLOUTCORE(),
          .PLLOUTGLOBAL(clk_pll),
          .EXTFEEDBACK(1'b0),
          .DYNAMICDELAY(8'd0),
          .LOCK(lock),
          .BYPASS(1'b0),
          .RESETB(1'b1),
          .SDI(1'b0),
          .SDO(),
          .SCLK(1'b0),
          .LATCHINPUTVALUE(1'b1));

   

   SB_IO #(.PIN_TYPE(6'b101001),
           .PULLUP(1'b0))
   u_usb_p (.PACKAGE_PIN(usb_p),
            .OUTPUT_ENABLE(usb_tx_en),
            .D_OUT_0(usb_dp_tx),
            .D_IN_0(usb_dp_rx),
            .D_OUT_1(1'b0),
            .D_IN_1(),
            .CLOCK_ENABLE(1'b0),
            .LATCH_INPUT_VALUE(1'b0),
            .INPUT_CLK(1'b0),
            .OUTPUT_CLK(1'b0));

   SB_IO #(.PIN_TYPE(6'b101001),
           .PULLUP(1'b0))
   u_usb_n (.PACKAGE_PIN(usb_n),
            .OUTPUT_ENABLE(usb_tx_en),
            .D_OUT_0(usb_dn_tx),
            .D_IN_0(usb_dn_rx),
            .D_OUT_1(1'b0),
            .D_IN_1(),
            .CLOCK_ENABLE(1'b0),
            .LATCH_INPUT_VALUE(1'b0),
            .INPUT_CLK(1'b0),
            .OUTPUT_CLK(1'b0));

   // drive usb_pu to 3.3V or to high impedance
   SB_IO #(.PIN_TYPE(6'b101001),
           .PULLUP(1'b0))
   u_usb_pu (.PACKAGE_PIN(usb_pu),
             .OUTPUT_ENABLE(usb_dp_pu),
             .D_OUT_0(1'b1),
             .D_IN_0(),
             .D_OUT_1(1'b0),
             .D_IN_1(),
             .CLOCK_ENABLE(1'b0),
             .LATCH_INPUT_VALUE(1'b0),
             .INPUT_CLK(1'b0),
             .OUTPUT_CLK(1'b0));

endmodule
