// Seed: 1606790435
module module_0 (
    id_1
);
  inout wire id_1;
  wor id_2;
  always id_2 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_4(
      1 + id_1
  );
  uwire id_5;
  assign id_5 = id_2 - 1;
  module_0 modCall_1 (id_5);
  wire id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_2 = 0;
  assign id_5 = id_4;
  id_7 :
  assert property (@(id_6) id_6 * id_7)
  else;
  assign id_4[1'b0] = id_5;
endmodule
