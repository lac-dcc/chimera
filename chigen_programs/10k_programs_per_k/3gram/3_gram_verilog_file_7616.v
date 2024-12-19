// Seed: 2789646605
module module_0 (
    output supply1 id_0,
    output wire id_1,
    input tri1 id_2,
    input wor id_3,
    input wor id_4,
    input supply1 id_5,
    output tri0 id_6
);
  wire id_8;
  xnor primCall (id_1, id_8, id_3, id_4, id_2);
  module_2 modCall_1 (
      id_1,
      id_0,
      id_6,
      id_0,
      id_6,
      id_4,
      id_5
  );
endmodule
module module_1 (
    input  wor  id_0,
    output tri1 id_1,
    output tri1 id_2
);
  id_4(
      .id_0(), .id_1((1)), .id_2(1), .id_3(1)
  );
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    output wor id_0,
    output wor id_1,
    output supply0 id_2,
    output supply1 id_3,
    output tri1 id_4,
    input uwire id_5,
    input wor id_6
);
  wire id_8;
  assign module_0.id_6 = 0;
endmodule
