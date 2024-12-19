// Seed: 1323651564
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_4 = id_3 - 1'b0 | 1;
endmodule
module module_1 ();
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_3 = id_1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_8(
      .id_0(id_4 == 1), .id_1(1), .id_2(id_5), .id_3(1), .id_4(id_6), .id_5(1)
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
