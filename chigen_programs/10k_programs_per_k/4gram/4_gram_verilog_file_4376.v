// Seed: 41323822
module module_0 (
    input supply0 id_0,
    input wire id_1,
    output wor id_2,
    output tri0 id_3,
    input tri1 id_4,
    output tri0 id_5,
    output wor id_6,
    input wire id_7,
    input supply0 id_8,
    input supply1 id_9,
    input tri id_10,
    input supply1 id_11,
    output wor id_12,
    input tri id_13,
    input uwire id_14
);
  assign id_6 = 1'b0;
  wire id_16;
endmodule
module module_1 (
    output wand id_0,
    output tri1 id_1,
    input  wor  id_2
);
  assign id_1 = {id_2, id_2, 1, 1'b0, 1, 1'b0};
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.type_4 = 0;
endmodule
