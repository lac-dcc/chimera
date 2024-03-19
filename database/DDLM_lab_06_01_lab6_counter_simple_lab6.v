// simple_counter.v

module simple_counter
#(
  parameter WIDTH=8
)
(
 input                  clk,
 input                  rst_n,
 output reg [WIDTH-1:0] cnt
 );
          
   always@(posedge clk or negedge rst_n)
     begin
        if(!rst_n)
          cnt <= {WIDTH{1'b0}};
        else
          cnt <= cnt + 1'b1;
     end
   
endmodule // simple_counter

   

