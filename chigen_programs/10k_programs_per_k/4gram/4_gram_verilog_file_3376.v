// Seed: 3406682333
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    output wand id_2,
    input tri0 id_3,
    output wor id_4,
    output tri1 id_5,
    output supply1 id_6,
    input supply1 id_7
);
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input tri1 id_2,
    input tri0 id_3
);
  supply0 id_5;
  id_6(
      !id_3 + 1 - id_5 - 1, 1, 1, id_0, 1'd0, 1, id_3
  );
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.type_3 = 0;
endmodule
