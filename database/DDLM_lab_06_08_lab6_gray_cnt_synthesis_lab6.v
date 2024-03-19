module de10_lite
(
 input        CLOCK_50,
 input [1:0]  KEY,
 output [3:0] LEDR,
 output [7:0] HEX0
);
  
  localparam cnt_size = 4;
  
  wire                  strobe;
  wire                  next_cnt;
  wire [cnt_size - 1:0] bin_to_led;
  wire [cnt_size - 1:0] gray_data;
  
  strobe_gen #(.div(24))
  strobe_en
    (
     .clk    ( CLOCK_50 ),
     .rst_n  ( KEY[0]   ),
     .strobe ( strobe   )
    );

  assign next_cnt = (!KEY[1]) ? strobe : 1'b0;
  
  // Gray counter on ledr
  gray_cnt #(.WIDTH(cnt_size))
  gcnt
    (
     .clk    ( CLOCK_50  ),
     .rst_n  ( KEY[0]    ),
     .enable ( next_cnt  ),
     .gray   ( gray_data )
    );

  assign LEDR = gray_data;
  
  // Binary representation

  gray2bin #(.WIDTH(cnt_size))
  hex_cnt
    (
     .gray ( gray_data  ),
     .bin  ( bin_to_led )
    );

  led7 #(.COUNT(1)) led7_inst
   (
    .data ( bin_to_led ),
    .leds ( HEX0       )
   );

  
endmodule // de10_lite
