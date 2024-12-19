// Seed: 3429754587
module module_0 (
    input  tri1 id_0,
    input  wor  id_1,
    output tri0 id_2
);
  specify
    (id_4 => id_5) = 0;
    specparam id_6 = id_0;
  endspecify
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    output uwire id_1,
    input  wire  id_2,
    output tri0  id_3
);
  id_5(
      .id_0(id_3), .id_1(1'b0), .id_2((1)), .id_3((id_1)), .id_4(1), .id_5(id_1 & id_2), .id_6(1)
  ); id_6(
      .id_0(), .id_1(1)
  );
  always force id_3 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0
  );
endmodule
