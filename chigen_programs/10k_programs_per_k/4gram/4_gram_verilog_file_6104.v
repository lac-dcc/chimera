// Seed: 3962507805
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input wor id_2,
    input supply0 id_3,
    input uwire id_4,
    input wire id_5,
    output wire id_6,
    input supply0 id_7,
    input wire id_8,
    output supply0 id_9,
    output tri1 id_10,
    input uwire id_11,
    input tri1 id_12,
    input wire id_13,
    output tri0 id_14,
    output uwire id_15,
    input tri id_16,
    output supply1 id_17,
    input supply1 id_18,
    output tri0 id_19
);
  assign id_6 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output supply1 id_1,
    input wand id_2,
    input tri0 id_3,
    input tri1 id_4,
    output wire id_5,
    input tri1 id_6
);
  wire id_8;
  id_9(
      .id_0({1{1}}), .id_1({1, id_3, 1})
  );
  or primCall (id_5, id_6, id_4, id_3, id_8, id_2, id_9, id_0);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_3,
      id_3,
      id_5,
      id_6,
      id_3,
      id_5,
      id_1,
      id_0,
      id_0,
      id_6,
      id_1,
      id_1,
      id_2,
      id_1,
      id_4,
      id_5
  );
  assign modCall_1.id_12 = 0;
endmodule
