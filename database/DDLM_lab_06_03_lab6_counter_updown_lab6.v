// Up-down counter 

module cnt_updown 
#( 
  parameter WIDTH=16
)
(
 input                  clk,
 input                  rst_n,
 input                  up_down, 
 output reg [WIDTH-1:0] cnt
 );
   
   always@(posedge clk or negedge rst_n)
     begin
        if(!rst_n)
          cnt <= {WIDTH{1'b0}};
        else if(up_down)
          cnt <= cnt + 1'b1;
        else
          cnt <= cnt - 1'b1;
     end
   
endmodule // cnt_updown
