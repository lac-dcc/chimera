// Seed: 3353602396
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input wand id_2,
    input tri id_3
    , id_31,
    output supply1 id_4,
    output supply0 id_5,
    input uwire id_6,
    input wand id_7,
    input supply0 id_8,
    input wire id_9,
    output wor id_10,
    output tri0 id_11,
    output supply1 id_12,
    output wand id_13,
    output tri0 id_14,
    input tri id_15,
    input tri1 id_16,
    input uwire id_17,
    input uwire id_18,
    input tri0 id_19,
    input supply1 id_20,
    input wire id_21,
    input supply1 id_22,
    output tri id_23,
    input uwire id_24,
    input tri id_25,
    output tri1 id_26,
    input uwire id_27,
    output tri1 id_28,
    input wor id_29
);
  wire id_32;
  id_33(
      .id_0(id_18), .id_1(id_25), .id_2(), .id_3(""), .id_4(id_20), .id_5(1)
  );
  assign id_14 = id_24;
  wire id_34;
  wire id_35;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    input tri0 id_2,
    output wor id_3,
    input wor id_4,
    input supply0 id_5,
    output tri1 id_6,
    input supply1 id_7,
    input uwire id_8,
    output wand id_9,
    output wand id_10
);
  assign id_9 = 1 & 1'h0;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_1,
      id_7,
      id_9,
      id_6,
      id_8,
      id_8,
      id_0,
      id_8,
      id_10,
      id_9,
      id_6,
      id_3,
      id_6,
      id_4,
      id_7,
      id_7,
      id_4,
      id_1,
      id_0,
      id_2,
      id_4,
      id_3,
      id_7,
      id_1,
      id_10,
      id_0,
      id_3,
      id_2
  );
  assign modCall_1.id_12 = 0;
endmodule
