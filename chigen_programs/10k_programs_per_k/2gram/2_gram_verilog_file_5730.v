// Seed: 4060186441
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1;
  wire id_1;
  module_0(
      id_1, id_1, id_1, id_1, id_1
  );
  wire id_2, id_3, id_4, id_5;
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  assign id_1 = 1;
  tri1 id_2;
  id_3(
      .id_0(id_2 == id_1),
      .id_1(id_2),
      .id_2({1, id_2, id_2 || id_1 - 1'd0}),
      .id_3(id_1),
      .id_4(id_1),
      .id_5(1 <-> 1)
  ); module_0(
      id_2, id_2, id_2, id_1, id_2
  );
endmodule
