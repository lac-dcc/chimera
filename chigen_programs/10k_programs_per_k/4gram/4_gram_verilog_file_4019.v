// Seed: 616043537
module module_0 (
    input tri id_0,
    input tri1 id_1,
    input wand id_2,
    output tri0 id_3,
    input tri1 id_4
    , id_24,
    input supply0 id_5,
    input wand id_6,
    input wor id_7,
    output wand id_8,
    output uwire id_9,
    input wire id_10,
    input wand id_11,
    input tri0 id_12
    , id_25,
    input wand id_13,
    output tri1 id_14,
    output tri1 id_15,
    output tri0 id_16,
    input wand id_17,
    output uwire id_18,
    input uwire id_19,
    input wire id_20
    , id_26,
    input uwire id_21,
    output supply1 id_22
);
  wire id_27;
  wire id_28;
  always @(id_20 or posedge id_4);
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    output tri0 id_2,
    input supply1 id_3,
    output tri1 id_4,
    input supply0 id_5,
    output supply0 id_6,
    output supply0 id_7,
    input tri0 id_8,
    input supply1 id_9,
    input wor id_10,
    output wand id_11,
    input tri0 id_12,
    input uwire id_13,
    output wor id_14,
    input uwire id_15
);
  supply0 id_17;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_3,
      id_11,
      id_1,
      id_5,
      id_8,
      id_12,
      id_2,
      id_7,
      id_9,
      id_9,
      id_10,
      id_0,
      id_14,
      id_2,
      id_2,
      id_9,
      id_6,
      id_9,
      id_12,
      id_15,
      id_14
  );
  assign modCall_1.id_13 = 0;
  wire id_18;
  assign id_17 = 1;
endmodule
