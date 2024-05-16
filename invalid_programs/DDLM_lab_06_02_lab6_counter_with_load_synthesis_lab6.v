module de10_lite
  (
  input        CLOCK_50,
  input [1:0]  KEY,
  input [7:0]  SW,
  output [7:0] HEX1,
  output [7:0] HEX0
);

   localparam CNT_W = 8;
   
   wire               clk_slow;
   wire               clk_global;
   wire [CNT_W - 1:0] cnt_to_seg7;
   wire               load;
               
   assign load = !KEY[1];
    
 clk_divider #(.WIDTH(24)) clk_div
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

  cnt_load #(.WIDTH(CNT_W))
   cnt
     (
      .clk       ( clk_global  ),
      .rst_n     ( KEY[0]      ),
      .load      ( load        ),
      .data_load ( SW          ),
      .cnt       ( cnt_to_seg7 )
      );
       
  
  led7 #(.COUNT(2)) led7_4
  (
    .data(cnt_to_seg7),
    .leds({HEX1,HEX0})
  );
  
                          
endmodule
