// Seed: 541160560
module module_0 (
    input wand id_0,
    output tri1 id_1,
    input supply0 id_2,
    output wor id_3,
    input supply1 id_4,
    input wire id_5,
    input wor id_6,
    output supply0 id_7,
    input tri0 id_8,
    input tri0 id_9,
    output wire id_10,
    input wire id_11,
    output wire id_12,
    output wire id_13,
    output tri0 id_14,
    input wor id_15,
    input tri0 id_16,
    output supply1 id_17,
    output uwire id_18
    , id_34,
    input supply0 id_19,
    output supply1 id_20,
    output supply1 id_21
    , id_35,
    output wire id_22,
    output uwire id_23,
    output uwire id_24,
    input tri id_25,
    input tri id_26,
    input tri0 id_27,
    output tri1 id_28,
    input tri0 id_29,
    input tri0 id_30,
    input supply1 id_31,
    input supply0 id_32
);
  wire id_36;
  wire id_37;
endmodule
module module_1 #(
    parameter id_1  = 32'd27,
    parameter id_11 = 32'd90
) (
    output uwire id_0,
    input wor _id_1,
    input wor id_2,
    input uwire id_3,
    input uwire id_4,
    input uwire id_5
    , id_13,
    input tri id_6,
    input wand id_7,
    output wire id_8,
    output wor id_9,
    input supply0 id_10,
    input supply1 _id_11
);
  assign id_8 = 1;
  assign id_13[id_11-id_1] = id_2;
  wand id_14 = 1;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_4,
      id_8,
      id_6,
      id_5,
      id_5,
      id_9,
      id_10,
      id_7,
      id_0,
      id_10,
      id_9,
      id_0,
      id_0,
      id_5,
      id_5,
      id_8,
      id_8,
      id_3,
      id_0,
      id_0,
      id_8,
      id_8,
      id_8,
      id_5,
      id_10,
      id_7,
      id_9,
      id_7,
      id_5,
      id_6,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
