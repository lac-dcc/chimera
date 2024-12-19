// Seed: 230578995
module module_0 (
    output supply1 id_0,
    output wor id_1,
    output wire id_2,
    input wor id_3,
    input wire id_4,
    input tri id_5,
    output wand id_6,
    input wire id_7,
    output tri1 id_8,
    output supply0 id_9,
    input uwire id_10,
    input tri id_11,
    input tri1 id_12
);
  wire id_14;
endmodule
module module_1 (
    output uwire id_0,
    output tri0 id_1,
    input tri id_2
    , id_7,
    input tri1 id_3,
    input tri1 id_4,
    output supply1 id_5
);
  wire #(1) id_8, id_9;
  nor primCall (id_5, id_8, id_2, id_9, id_3, id_7, id_4);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_5,
      id_3,
      id_0,
      id_0,
      id_4,
      id_4,
      id_2
  );
  assign modCall_1.type_2 = 0;
endmodule
