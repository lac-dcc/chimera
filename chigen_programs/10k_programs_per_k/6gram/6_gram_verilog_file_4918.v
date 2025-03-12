// Seed: 41233751
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input tri1 id_2,
    output tri1 id_3,
    input uwire id_4,
    input tri0 id_5,
    input tri1 id_6,
    output wor id_7
);
  logic id_9;
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    input tri1 id_2,
    output wire id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri id_6,
    output supply0 id_7
);
  assign id_7 = id_2 ? id_4 : id_4 ^ -1'b0;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_5,
      id_3,
      id_6,
      id_4,
      id_5,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
