`timescale 1ns/1ps

module hold1clk(
clk,
reset,
stage_enable_in,
stage_enable_out
);


input clk;
input reset;
input stage_enable_in;
output  stage_enable_out;

reg stage_enable_out;


always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    stage_enable_out <= 1'b0;
      end
    else
      begin
          if(stage_enable_in == 1'b1)
            begin
               stage_enable_out <= 1'b1;
            end
          else stage_enable_out <= 1'b0;
      end
end

























endmodule
