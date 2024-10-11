// This program was cloned from: https://github.com/esda-inesc-id/pt-float
// License: MIT License

`timescale 1ns / 1ps

module iob_cls
  #(
    parameter DATA_W = 32
    )
   (
    input [DATA_W-1:0]                data_i,
    output reg [$clog2(DATA_W+1)-1:0] count_o
    );

   wire [DATA_W-1:0]                  data;
   assign data = data_i[DATA_W-1]? ~data_i: data_i;

   integer                            i;
   always @* begin
      count_o = (DATA_W-1);
      for (i=0; i < (DATA_W-1); i=i+1) begin
         if (data[i]) begin
            count_o = (DATA_W-2) - i;
         end
      end
   end

endmodule
