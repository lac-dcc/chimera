// Seed: 173391528
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = {1};
  assign id_3 = (1 && -1 < id_2);
  assign id_3 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always_ff id_5 = id_8;
  assign id_5 = id_8 - 1;
  xor primCall (id_6, id_7, id_1, id_8);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_6
  );
  assign modCall_1.id_3 = 0;
endprogram
