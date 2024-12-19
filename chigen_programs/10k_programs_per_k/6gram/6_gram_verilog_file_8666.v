// Seed: 4139561645
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    input wire id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wand id_5
);
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    input uwire id_2,
    input tri id_3,
    input supply0 id_4,
    input wor id_5,
    input wand id_6,
    input wand id_7,
    input tri0 id_8,
    input supply1 id_9,
    input wor id_10,
    input wor id_11,
    input wire id_12,
    input supply0 id_13,
    input supply1 id_14,
    output supply1 id_15
);
  tri id_17;
  supply0 id_18;
  assign #id_19 id_17 = id_3;
  module_0 modCall_1 (
      id_4,
      id_17,
      id_6,
      id_5,
      id_1,
      id_3
  );
  assign modCall_1.type_9 = 0;
  assign id_18 = 1'b0;
  wire id_20;
  and primCall (id_15, id_0, id_18, id_13, id_19);
  assign id_15 = 1 ** 1'b0 + 1;
endmodule
