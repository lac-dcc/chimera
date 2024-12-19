// Seed: 2103115277
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
endmodule
module module_1 (
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
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_8(
      .id_0(1'b0), .id_1(id_5), .id_2(id_1), .id_3(1)
  );
  xor primCall (id_6, id_3, id_8, id_7);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_6
  );
endmodule
