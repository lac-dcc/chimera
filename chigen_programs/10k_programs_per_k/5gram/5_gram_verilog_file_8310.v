// Seed: 143157727
module module_0;
  generate
    for (id_1 = id_1; id_1 ==? 1; id_1 = id_1) begin : LABEL_0
      wire id_2 = id_1;
    end
  endgenerate
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd10,
    parameter id_5 = 32'd5
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6
);
  output wire id_6;
  module_0 modCall_1 ();
  inout wire _id_5;
  input wire _id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  id_7 :
  assert property (@(posedge -1) id_4)
  else $clog2(28);
  ;
  wire [1 'b0 ==  id_4 : {  1  ==  1  ,  id_4  ,  id_5  ,  -1  }] id_8;
endmodule
