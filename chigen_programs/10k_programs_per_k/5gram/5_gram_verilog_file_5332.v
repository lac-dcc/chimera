// Seed: 587501494
module module_0 (
    input tri0 id_0,
    output wor id_1,
    input uwire id_2,
    input tri0 id_3,
    input wand id_4,
    output tri id_5,
    input tri0 id_6,
    input tri0 id_7,
    input uwire id_8,
    input tri1 id_9,
    output supply0 id_10,
    input wire id_11,
    output wand id_12,
    output supply0 id_13,
    input supply1 id_14,
    input uwire id_15
);
  assign id_13 = 1;
  wand id_17, id_18, id_19, id_20, id_21, id_22;
  wire id_23;
  assign id_17 = id_0;
  wire id_24;
  generate
    supply0 id_25 = id_7 + id_24;
    assign id_12 = 1 | id_15;
  endgenerate
  wire id_26;
endmodule
module module_1 (
    input supply1 id_0
    , id_8,
    input supply0 id_1,
    input supply1 id_2,
    input wire id_3,
    input uwire id_4,
    output uwire id_5,
    output tri id_6
);
  tri id_9 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_1,
      id_0,
      id_3,
      id_5,
      id_0,
      id_1,
      id_3,
      id_2,
      id_6,
      id_0,
      id_5,
      id_6,
      id_3,
      id_0
  );
  assign modCall_1.type_18 = 0;
endmodule
