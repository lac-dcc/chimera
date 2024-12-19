// Seed: 2473984358
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  id_5(
      .id_0(1), .id_1(id_1), .id_2(id_1 + id_3), .id_3((1)), .id_4(1), .id_5(id_1)
  );
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  id_3(
      .id_0(1), .id_1(id_1), .id_2(id_2), .id_3(id_1[1'b0])
  );
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
