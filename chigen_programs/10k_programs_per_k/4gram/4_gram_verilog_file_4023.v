// Seed: 3915569419
module module_0 (
    input uwire id_0,
    output tri id_1,
    input wand id_2,
    input tri1 id_3,
    input wor id_4,
    input tri0 id_5,
    input uwire id_6,
    input uwire id_7,
    output uwire id_8,
    input wire id_9,
    input uwire id_10,
    input uwire id_11,
    output wand id_12,
    input supply1 id_13,
    input supply1 id_14,
    output tri id_15
);
  wire id_17;
  wire id_18;
endmodule
module module_1 (
    output uwire id_0,
    output supply1 id_1,
    input tri1 id_2,
    output tri0 id_3
);
  buf primCall (id_0, id_2);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.type_22 = 0;
endmodule
