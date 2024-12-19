// Seed: 177622317
module module_0 (
    input uwire id_0,
    input wor id_1,
    output uwire id_2,
    output wor id_3,
    output uwire id_4,
    output uwire id_5,
    output tri id_6,
    output wand id_7,
    input uwire id_8,
    input supply0 id_9,
    input tri id_10,
    input tri id_11,
    input supply1 id_12,
    output wire id_13,
    output wire id_14,
    input tri1 id_15,
    input supply1 id_16,
    output tri1 id_17,
    output wire id_18,
    output wor id_19,
    output supply0 id_20,
    input supply1 id_21,
    input wand id_22,
    input supply1 id_23,
    input supply0 id_24,
    input supply1 id_25,
    output tri id_26
);
  assign id_6 = 1'b0 - id_12;
endmodule
module module_1 (
    input  tri1 id_0,
    input  wire id_1,
    output tri  id_2,
    inout  tri0 id_3,
    output tri  id_4
);
  assign id_2 = 1 == id_3;
  assign id_3 = {1'h0, id_3};
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_2,
      id_4,
      id_3,
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_2,
      id_4,
      id_4,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.id_16 = 0;
endmodule
