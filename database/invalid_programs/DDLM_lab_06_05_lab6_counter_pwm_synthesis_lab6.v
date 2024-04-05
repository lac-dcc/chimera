module de10_lite
(
  input        CLOCK_50,
  input [0:0]  KEY,
 
  input [7:0]  SW,
 
  output [0:0] LEDR,
 
  output [7:0] HEX1,
  output [7:0] HEX0
);

   localparam CNT_W = 8;
   
   wire               clk_slow;
   wire               clk_global;
   wire [CNT_W - 1:0] cnt_to_seg7;
   
 //Set WIDTH=18 for demostration this example
 clk_divider #(.WIDTH(18)) clk_div
 ( 
    .clk_in  ( CLOCK_50 ),
    .rst_n   ( KEY[0]   ),
    .clk_out ( clk_slow )
 );
   
  global glob_net
  (
     .in ( clk_slow   ),
     .out( clk_global )
  );

   pwm #(.PWM_WIDTH(8)) pwm_inst
   (
      .clk       ( clk_global ),
      .rst_n     ( KEY[0]     ),
      .imp_width ( SW         ),
      .pwm_out   ( LEDR       ),
   );
   
  
  led7 #(.COUNT(2)) led7_4
  (
    .data(SW),
    .leds({HEX1,HEX0})
  );
  
                          
endmodule
