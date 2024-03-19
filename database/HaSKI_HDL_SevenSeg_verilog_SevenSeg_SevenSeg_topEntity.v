// Automatically generated Verilog-2001
module SevenSeg_topEntity(input_0_0
                         ,input_0_1
                         ,input_0_2
                         ,input_0_3
                         ,// clock
                         system1000
                         ,// asynchronous reset: active low
                         system1000_rstn
                         ,output_0_0
                         ,output_0_1);
  input [31:0] input_0_0;
  input [31:0] input_0_1;
  input [31:0] input_0_2;
  input [31:0] input_0_3;
  input system1000;
  input system1000_rstn;
  output [3:0] output_0_0;
  output [7:0] output_0_1;
  wire [127:0] input_0;
  wire [11:0] output_0;
  assign input_0 = {input_0_0
                   ,input_0_1
                   ,input_0_2
                   ,input_0_3};
  
  SevenSeg_topEntity_0 SevenSeg_topEntity_0_inst
  (.outputs_i1 (input_0)
  ,.system1000 (system1000)
  ,.system1000_rstn (system1000_rstn)
  ,.bodyVar_o (output_0));
  
  assign output_0_0 = output_0[11:8];
  
  assign output_0_1 = output_0[7:0];
endmodule
