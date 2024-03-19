// Counter with load data

module cnt_load
#(
  parameter WIDTH=16
  )
(
 input                  clk,
 input                  rst_n,
 input                  load,
 input [WIDTH-1:0]      data_load,
 output reg [WIDTH-1:0] cnt
 );

   always@(posedge clk or negedge rst_n)
     begin:cnt_with_load
        if(!rst_n)
          cnt <= {WIDTH{1'b0}};
        else if(load)
          cnt <= data_load;
        else
          cnt <= cnt + 1'b1;
     end
   
endmodule // cnt_load
