// Seed: 2806093356
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [-1 : -1 'b0] id_5 = -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd52
) (
    input supply0 _id_0,
    output tri0 id_1,
    output tri1 id_2
);
  wire  [  id_0  :  1 'b0 ]  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  [  -1  :  id_0  ]  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ;
  logic id_26;
  ;
  module_0 modCall_1 (
      id_21,
      id_9,
      id_26,
      id_8
  );
  id_27 :
  assert property (@(posedge id_12) id_26 == id_0)
  else $unsigned(57);
  ;
  timeprecision 1ps;
endmodule
