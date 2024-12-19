// Seed: 4242828670
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = id_3 ? 1 : {1'b0, id_3 & id_3};
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  tri id_7 = 1 != id_3;
  assign id_2 = (id_7);
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_1
  );
  id_8(
      .id_0(id_1), .id_1(id_2), .id_2((id_7) == id_2)
  );
endmodule
