module hcsr04
#(
  parameter clk_freq = 50000000,
            width    = 8
)
(
 input                    clk,
 input                    rst_n,
 input                    echo,
 output reg               trig,
 output reg [width - 1:0] distance
);

  localparam 
    max_distance_cm        = 400,
                          
    trigger_in_us          = 10,
                          
    measurment_cycle_ms    = 200,
                          
    vel_of_sound_m_per_s   = 340,
                          
    measurment_cycle_tick  = ( clk_freq/1000 * measurment_cycle_ms ),
                          
    trigger_in_tick        = ( trigger_in_us*clk_freq/1000000),
                          
    max_echo_tick          = ( clk_freq/vel_of_sound_m_per_s/100) * max_distance_cm * 2, 
      
                          
    trig_cnt_width         = $clog2(measurment_cycle_tick),
    echo_cnt_width         = $clog2(max_echo_tick+1);

 
  reg [trig_cnt_width - 1 : 0] trig_cnt;
  reg [echo_cnt_width - 1 : 0] echo_cnt;
  reg                          echo_buff;
  wire                         echo_rise;
  wire                         echo_fall;
  
  
  always@(posedge clk or negedge rst_n)
    if(!rst_n)
      trig_cnt <= 0;
    else if(trig_cnt == measurment_cycle_tick -1)
      trig_cnt <= 0;
    else
      trig_cnt <= trig_cnt + 1'b1;

  always@(posedge clk or negedge rst_n)
    if(!rst_n)
      trig <= 1'b0;
    else if(trig_cnt == measurment_cycle_tick - trigger_in_tick -1)
      trig <= 1'b1;
    else if(trig_cnt == measurment_cycle_tick - 1)
      trig <= 1'b0;

 
                     
  always@(posedge clk or negedge rst_n)
    if(!rst_n)
      echo_buff <= 0;
    else
      echo_buff <= echo;
  
  assign echo_rise = echo  & !echo_buff;
  assign echo_fall = !echo & echo_buff;
  
  
  always@(posedge clk or negedge rst_n)
    if(!rst_n)begin
      echo_cnt <= 0;
      distance <= 0;
    end
    else if(echo_rise)
      echo_cnt <= 0;
    else if(echo_fall)
      distance <= echo_cnt[echo_cnt_width - 1 : echo_cnt_width - width];
    else
      echo_cnt <= echo_cnt + 1'b1;
  
  
endmodule // hcsr04
