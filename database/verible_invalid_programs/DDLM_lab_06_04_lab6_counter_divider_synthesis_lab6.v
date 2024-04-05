module de10_lite
(
  input        CLOCK_50,
  input [0:0]  KEY,
  
  output [7:0] HEX3,
  output [7:0] HEX2,
  output [7:0] HEX1,
  output [7:0] HEX0
);

   localparam CNT_W = 8;
   
   wire               clk_slow;
   wire               clk_global;
   wire               clk_div_slow;
   wire               clk_out_div;
   wire [CNT_W - 1:0] cnt_to_seg7_fast;
   wire [CNT_W - 1:0] cnt_to_seg7_slow;
   
 //Clk divide for demonstration
   
 clk_divider #(.WIDTH(24)) clk_div1
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
/*------------------------------
 Clock divide for example
 ------------------------------ */ 
   
  cnt_div #(.DIV_CNT(16))  clk_div2
  
   (
      .clk_in  ( clk_global ),
      .rst_n   ( KEY[0]     ),
      .clk_out ( clk_out_div)
   );

   global global_net2
   (
      .in  ( clk_out_div   ),
      .out ( clk_div_slow  )
   );
  
   
   simple_counter #(.WIDTH(CNT_W)) cnt_fast
   (
       .clk   ( clk_global      ),
       .rst_n ( KEY[0]          ),
       .cnt   ( cnt_to_seg7_fast)
   );

   simple_counter #(.WIDTH(CNT_W)) cnt_slow
   (
       .clk   ( clk_div_slow    ),
       .rst_n ( KEY[0]          ),
       .cnt   ( cnt_to_seg7_slow)
   );

   
/*------------------------------
 Different counter speed
 ------------------------------*/
   led7 #(.COUNT(2))
   led7_fast
   (
      .data(cnt_to_seg7_fast),
      .leds({HEX1,HEX0})
   );
   

   led7 #(.COUNT(2))
   led7_slow
   (
      .data(cnt_to_seg7_slow),
      .leds({HEX3,HEX2})
   );              
           
endmodule
