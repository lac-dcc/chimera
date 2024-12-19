// Seed: 3751735399
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input wor id_2,
    input uwire id_3,
    input tri0 id_4,
    output tri0 id_5,
    output supply0 id_6,
    input supply0 id_7,
    output wire id_8,
    inout supply0 id_9
);
  wire id_11;
endmodule
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    output supply0 id_2,
    output wand id_3,
    output supply1 id_4,
    inout wand id_5,
    output tri id_6,
    output uwire id_7,
    output wire id_8
    , id_12,
    output supply1 id_9,
    input wire id_10
);
  wire id_13;
  nand primCall (id_8, id_5, id_12, id_1, id_10, id_13);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_5,
      id_1,
      id_9,
      id_7,
      id_10,
      id_6,
      id_5
  );
  assign modCall_1.type_15 = 0;
endmodule
