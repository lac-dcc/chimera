// Seed: 300685648
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input uwire id_2,
    input wor id_3,
    output supply1 id_4,
    input uwire id_5,
    input tri1 id_6,
    output wire id_7,
    input supply0 id_8,
    output wire id_9
);
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    output tri1 id_2,
    input wand id_3,
    input uwire id_4,
    output supply0 id_5,
    input supply0 id_6,
    input supply0 id_7,
    input wor id_8,
    output wire id_9,
    output wire id_10,
    input tri id_11,
    output supply1 id_12,
    input wire id_13,
    input tri id_14,
    output supply1 id_15,
    input tri0 id_16,
    input wire id_17,
    input tri id_18,
    input supply0 id_19,
    input wire id_20,
    input wire id_21,
    input supply1 id_22,
    input tri0 id_23
);
  assign id_2 = id_6;
  xnor primCall (
      id_9,
      id_20,
      id_1,
      id_6,
      id_13,
      id_14,
      id_16,
      id_17,
      id_3,
      id_7,
      id_18,
      id_4,
      id_0,
      id_8,
      id_21,
      id_22,
      id_23,
      id_11,
      id_19
  );
  module_0 modCall_1 (
      id_7,
      id_18,
      id_13,
      id_13,
      id_12,
      id_16,
      id_18,
      id_15,
      id_22,
      id_9
  );
  assign modCall_1.id_4 = 0;
endmodule
