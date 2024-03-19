//Simple PWM

module pwm
#(
  parameter PWM_WIDTH=16
)
(
 input                 clk,
 input                 rst_n,
 input [PWM_WIDTH-1:0] imp_width,
 output                pwm_out
 );

   reg [PWM_WIDTH-1:0] cnt;
   
   
   always@(posedge clk or negedge rst_n)
     begin
        if(!rst_n)
          cnt <= {PWM_WIDTH{1'b0}};
        else
          cnt <= cnt + 1'b1;
     end
  
   assign pwm_out = (imp_width > cnt) ? 1'b1 : 1'b0;
   
endmodule // pwm
