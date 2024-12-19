// Seed: 4005025934
module module_0 (
    input uwire id_0,
    input wand id_1,
    output wor id_2,
    input tri id_3,
    input supply1 id_4,
    output wor id_5,
    input supply1 id_6,
    output tri id_7,
    input wand id_8,
    output supply0 id_9,
    input wor id_10,
    input wor id_11,
    input tri id_12,
    output wire id_13,
    input wire id_14,
    input supply1 id_15,
    input tri id_16,
    input tri1 id_17,
    output tri0 id_18,
    output wand id_19,
    input wire id_20,
    input wor id_21
);
  wire id_23 = id_3 >= 1;
  wire id_24;
  tri0 id_25 = 1;
  supply0 id_26;
  wire id_27, id_28;
  assign id_26 = 1;
  assign id_13 = 1;
  tri id_29 = 1'h0 ? 1'b0 : id_23;
  supply1 id_30 = id_1;
endmodule
module module_1 (
    output tri id_0,
    output supply1 module_1,
    input wor id_2,
    output wire id_3,
    output supply1 id_4,
    input supply1 id_5,
    output supply0 id_6,
    output supply1 id_7,
    output wand id_8,
    output wire id_9,
    input wire id_10,
    input wire id_11,
    input supply1 id_12,
    output tri0 id_13,
    input tri1 id_14,
    output tri id_15,
    output wire id_16,
    input wire id_17
);
  genvar id_19;
  module_0 modCall_1 (
      id_5,
      id_17,
      id_6,
      id_2,
      id_2,
      id_3,
      id_14,
      id_7,
      id_12,
      id_0,
      id_5,
      id_17,
      id_17,
      id_13,
      id_11,
      id_12,
      id_10,
      id_11,
      id_8,
      id_4,
      id_10,
      id_11
  );
  assign modCall_1.id_10 = 0;
endmodule
