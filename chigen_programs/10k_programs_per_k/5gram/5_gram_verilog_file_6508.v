// Seed: 1270805354
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  tri1 id_6 = 1, id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_2;
  wire id_4;
  wire id_5;
  id_6(
      .id_0(id_3 & id_1 & id_3), .id_1(1 == id_2), .id_2(1'b0)
  );
  module_0 modCall_1 (
      id_4,
      id_5,
      id_3,
      id_4,
      id_3
  );
  assign modCall_1.id_7 = 0;
endmodule
