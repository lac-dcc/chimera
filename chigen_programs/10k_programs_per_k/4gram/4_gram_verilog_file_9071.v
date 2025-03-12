// Seed: 3681159245
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
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_11 :
  assert property (@(posedge id_6) id_6 * 1 - 1)
  else $unsigned(81);
  ;
  wor id_12 = 1;
  uwire [1 : -1] id_13 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd91
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  inout logic [7:0] id_4;
  output wire id_3;
  input wire id_2;
  inout wire _id_1;
  assign id_4[(-1'd0)] = 1;
  assign id_4 = id_4[id_1];
  parameter id_5 = -1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3,
      id_5,
      id_5
  );
  uwire [1 : id_1] id_6 = {1, id_5};
endmodule
