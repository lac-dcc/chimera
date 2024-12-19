// Seed: 1696303189
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_5;
  assign module_1.type_8 = 0;
  assign id_1 = 1;
  wor id_8;
  wire id_9, id_10, id_11;
  supply1 id_12;
  assign id_8 = id_1;
  reg id_13;
  id_14(
      1, id_12, 1, id_7 - id_3
  ); id_15 :
  assert property (@(posedge id_3) id_5)
  else id_13 <= 1;
endmodule
module module_1;
  uwire id_1;
  assign id_1 = 1'b0;
  wor id_2, id_3;
  wor id_4;
  assign id_4 = 1;
  wire id_5, id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1,
      id_4,
      id_5
  );
endmodule
