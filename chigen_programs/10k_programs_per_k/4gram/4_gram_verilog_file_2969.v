// Seed: 1797853849
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_11 :
  assert property (@(posedge id_8) id_5)
  else $unsigned(61);
  ;
  assign id_11 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd34
) (
    input tri1  id_0,
    input uwire _id_1
);
  tri id_3;
  logic [-1 : id_1] id_4;
  ;
  assign id_3 = -1;
  assign id_4 = -1'b0;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_11 = 0;
endmodule
