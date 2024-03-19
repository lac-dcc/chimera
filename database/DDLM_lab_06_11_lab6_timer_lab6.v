module timer
#(
  // Reference clock value in Hz
  parameter ref_clock = 50000000 
 )

(
 input            clk,
 input            rst_n,
 output reg [7:0] seconds,
 output reg [7:0] minuts
 );

  localparam 
    sec_tick = ref_clock,
    period   = 60;
  
  reg [31:0]      tick_cnt;
  wire            tick_en;
  wire            sec_en;
  
  //System time
  always@(posedge clk or negedge rst_n)
    if(!rst_n)
      tick_cnt <= 0;
    else if(tick_cnt == sec_tick - 1)
      tick_cnt <= 0;
    else
      tick_cnt <= tick_cnt + 1'b1;
  
  //Seconds
  always@(posedge clk or negedge rst_n)
    if(!rst_n)
      seconds <= 0;
    else if(tick_cnt == sec_tick - 1)
      if(seconds == period -1)
        seconds <= 0;
      else
        seconds <= seconds + 1'b1;
  
  // Minuts
  always@(posedge clk or negedge rst_n)
    if(!rst_n)
      minuts <= 0;
    else if(seconds == period - 1 && tick_cnt == sec_tick -1)
      if(minuts == period -1)
        minuts <= 0;
      else
        minuts <= minuts + 1'b1;
    
  
endmodule // timer
