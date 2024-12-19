// Seed: 1737438954
module module_0 (
    output uwire id_0,
    output tri0 id_1,
    input tri id_2,
    input tri id_3,
    input supply0 id_4
);
  id_6(
      .id_0(1), .id_1(id_1), .id_2(id_2)
  );
  wire id_8, id_9;
  assign module_1.type_1 = 0;
  wire id_10;
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    output wire id_2,
    input tri id_3,
    input tri1 id_4,
    output wand id_5,
    input wor id_6
);
  always_comb @(id_4 or posedge id_4) disable id_8#(.id_9(1));
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_6,
      id_4
  );
endmodule
