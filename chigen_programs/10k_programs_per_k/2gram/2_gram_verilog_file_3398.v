// Seed: 1282680953
module module_0 (
    input wire id_0,
    input tri1 id_1,
    input uwire id_2,
    input uwire id_3,
    input tri id_4,
    input supply1 id_5,
    input supply1 id_6,
    input wand id_7,
    output tri0 id_8,
    input tri1 id_9,
    output supply0 id_10,
    output wire id_11,
    input wor id_12
);
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    input wor id_2,
    input supply1 id_3,
    output tri id_4,
    input tri0 id_5,
    input tri id_6,
    output wor id_7,
    input tri1 id_8,
    output tri0 id_9
    , id_14,
    input wire id_10,
    output tri0 id_11,
    output wire id_12
);
  assign {(1'b0), id_3, 1} = id_2;
  assign id_14 = id_6;
  nor primCall (id_4, id_2, id_14, id_1, id_0, id_3, id_5, id_6, id_10, id_8);
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_3,
      id_5,
      id_8,
      id_6,
      id_14,
      id_4,
      id_2,
      id_12,
      id_9,
      id_2
  );
  assign modCall_1.type_4 = 0;
endmodule
