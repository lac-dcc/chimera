// Seed: 2598190684
module module_0 (
    output supply1 id_0,
    input wand id_1,
    output supply1 id_2,
    output tri id_3,
    input wor id_4,
    input tri1 id_5,
    input tri id_6,
    output supply0 id_7,
    input supply1 id_8,
    input supply0 id_9,
    input wor id_10,
    input wire id_11,
    output wand id_12,
    output tri id_13,
    input uwire id_14
);
  uwire id_16;
  wor   id_17 = id_6 == |id_11, id_18;
  wire  id_19;
  assign id_16 = 1'd0 ? id_18 : 1;
endmodule
module module_1 (
    input tri0 id_0,
    output wand id_1,
    output tri0 id_2,
    output supply0 id_3,
    output wor id_4,
    output tri0 id_5,
    output tri id_6,
    output supply1 id_7,
    input uwire id_8,
    input supply1 id_9,
    input tri id_10,
    output supply1 id_11,
    output tri id_12,
    output supply0 id_13,
    output uwire id_14
);
  supply0 id_16 = 1;
  wire id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25, id_26;
  wire id_27;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_14,
      id_11,
      id_10,
      id_10,
      id_8,
      id_14,
      id_10,
      id_10,
      id_9,
      id_9,
      id_1,
      id_1,
      id_8
  );
  assign modCall_1.type_22 = 0;
endmodule
