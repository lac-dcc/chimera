// Seed: 2563839813
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    output tri1 id_4,
    input uwire id_5,
    output tri0 id_6,
    output tri1 id_7,
    output wire id_8,
    input tri1 id_9,
    input wor id_10,
    output tri0 id_11,
    output supply1 id_12,
    output tri id_13,
    input tri0 id_14,
    input wor id_15,
    input supply0 id_16,
    input tri0 id_17,
    output wire id_18,
    input tri id_19,
    input tri0 id_20,
    output supply1 id_21,
    input tri0 id_22,
    output supply0 id_23
);
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    output tri0 id_2
);
  logic [7:0] id_4, id_5;
  wire id_6;
  assign id_1 = id_4[-1];
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_21 = 0;
  assign id_2 = id_7;
endmodule
