// Seed: 2170436570
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    output uwire id_2,
    output tri1 id_3,
    input supply1 id_4,
    output tri1 id_5,
    input uwire id_6,
    output supply1 id_7,
    input supply0 id_8,
    output tri id_9,
    input wor id_10,
    output wand id_11,
    input supply0 id_12,
    input wor id_13,
    input wand id_14,
    input supply1 id_15,
    output tri1 id_16,
    output uwire id_17,
    output supply1 id_18,
    input tri0 id_19,
    input supply0 id_20,
    input wire id_21,
    output tri1 id_22,
    input wand id_23,
    input uwire id_24,
    input wor id_25,
    input tri0 id_26,
    input tri1 id_27,
    input wand id_28,
    input tri0 id_29,
    input tri0 id_30
);
  logic id_32;
endmodule
module module_1 #(
    parameter id_2 = 32'd11,
    parameter id_8 = 32'd28
) (
    output wand id_0,
    input supply1 id_1,
    input uwire _id_2,
    output tri0 id_3,
    output wand id_4,
    input wand id_5,
    output tri id_6,
    input wand id_7,
    input supply0 _id_8,
    input tri1 id_9,
    input wire id_10,
    output wor id_11,
    output wire id_12,
    input tri0 id_13,
    input wire id_14,
    output tri0 id_15,
    input tri0 id_16,
    output wire id_17
);
  logic id_19;
  ;
  assign id_15 = ~(id_9);
  wire id_20;
  module_0 modCall_1 (
      id_14,
      id_16,
      id_17,
      id_3,
      id_13,
      id_12,
      id_5,
      id_6,
      id_5,
      id_17,
      id_10,
      id_15,
      id_14,
      id_1,
      id_10,
      id_7,
      id_15,
      id_17,
      id_11,
      id_9,
      id_5,
      id_7,
      id_11,
      id_1,
      id_16,
      id_14,
      id_1,
      id_10,
      id_1,
      id_14,
      id_14
  );
  assign modCall_1.id_27 = 0;
  wire [id_2 : id_8] id_21;
endmodule
