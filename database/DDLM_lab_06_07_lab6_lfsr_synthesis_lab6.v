// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module de10_lite
(
  input        CLOCK_50,
  input [0:0]  KEY,
  
  output [7:0] LEDR,
 
  output [7:0] HEX1,
  output [7:0] HEX0
);

   localparam CNT_W = 8;
   
   wire               clk_slow;
   wire               clk_global;
   wire [CNT_W - 1:0] cnt_to_seg7;
   
   assign LEDR = cnt_to_seg7;
   
 //Set WIDTH=18 for demostration this example
   clk_divider #(.WIDTH(25)) clk_div
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

   
   lfsr psrg
   (
      .clk     ( clk_global   ),
      .rst_n   ( KEY[0]       ),
      .prg_out ( cnt_to_seg7  )
   );
   
 
   led7 #(.COUNT(2)) led7_4
   (
    .data(cnt_to_seg7),
    .leds({HEX1,HEX0})
   );
  
                          
endmodule
