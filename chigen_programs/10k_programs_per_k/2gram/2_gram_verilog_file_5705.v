// Seed: 721236430
module module_0 (
    input  wand  id_0,
    output uwire id_1,
    output wand  id_2,
    output tri1  id_3,
    input  tri0  id_4
);
  supply1 id_6 = 1'b0;
  module_2 modCall_1 (
      id_4,
      id_0,
      id_0,
      id_4,
      id_0,
      id_3,
      id_4,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input wand id_3,
    input wand id_4,
    output tri0 id_5
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input wor id_0,
    input tri0 id_1,
    input tri0 id_2,
    input uwire id_3,
    input tri1 id_4,
    output supply0 id_5,
    input uwire id_6,
    output tri0 id_7
);
  id_9(
      .id_0(1'b0), .id_1(1), .id_2(1), .id_3(1), .id_4(!1 ^ 1 - 1)
  );
  assign id_5 = 1'b0;
endmodule
