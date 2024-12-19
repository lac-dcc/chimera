// Seed: 2753826986
module module_0 (
    input wor id_0,
    input uwire id_1,
    output uwire id_2,
    output tri id_3,
    output wand id_4,
    output wire id_5,
    output wor id_6,
    input uwire id_7,
    input uwire id_8,
    input uwire id_9,
    output wor id_10,
    input supply0 id_11,
    input tri id_12,
    output tri id_13,
    output supply1 id_14,
    input wire id_15,
    output wire id_16,
    output supply0 id_17,
    output supply1 id_18,
    output wand id_19,
    input supply1 id_20,
    output supply0 id_21,
    output supply1 id_22
    , id_28,
    input tri id_23,
    input wor id_24,
    input tri1 id_25,
    output tri id_26
);
  always @(id_23 or posedge id_24) id_13 = 1;
  assign id_19 = 1'd0 == id_11;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output wire id_0,
    input wor id_1,
    input wire id_2,
    input tri0 id_3,
    input supply1 id_4,
    output supply0 id_5,
    output supply1 id_6,
    input tri0 id_7,
    input wand id_8
);
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_5,
      id_5,
      id_6,
      id_1,
      id_3,
      id_2,
      id_6,
      id_8,
      id_7,
      id_6,
      id_5,
      id_1,
      id_6,
      id_6,
      id_5,
      id_5,
      id_2,
      id_0,
      id_6,
      id_2,
      id_2,
      id_8,
      id_6
  );
  wire id_10;
endmodule
