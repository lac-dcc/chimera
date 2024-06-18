// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module lifo( 
    input [3:0] dataIn,
    input rd_en, wr_en, rst, clk,
    output  reg empty, full,    
    output reg [3:0] dataOut
    );

reg [3:0] stack_mem[0:3];
reg  [2:0] stack_ptr;
integer i;
  always @ (posedge clk)
begin
 if (wr_en==0);
 else begin
    if (rst==1) begin
      stack_ptr = 3'd4;
      empty = stack_ptr[2];
      dataOut = 4'h0;
      for (i=0;i<4;i=i+1) begin
        stack_mem[i]= 0;
      end
     end
  else if (rst==0) begin
    full = stack_ptr? 0:1;
    empty  = stack_ptr[2];
    dataOut = 4'hx;
    if (full == 1'b0 && rd_en == 1'b0) begin
       stack_ptr = stack_ptr-1'b1;
       full = stack_ptr? 0:1;
       empty = stack_ptr[2];
       stack_mem[stack_ptr] = dataIn;
     end
   else if (empty == 1'b0 && rd_en == 1'b1) begin
       dataOut = stack_mem[stack_ptr];
       stack_mem[stack_ptr] = 0;
       stack_ptr = stack_ptr+1;
       full = stack_ptr? 0:1;
       empty = stack_ptr[2];
    end
  end
 end
end
endmodule
