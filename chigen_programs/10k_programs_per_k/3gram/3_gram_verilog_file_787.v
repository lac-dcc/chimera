// Seed: 1646911822
module module_0 (
    output tri1 id_0,
    output uwire id_1,
    output tri0 id_2,
    input wand id_3,
    output supply1 id_4,
    input tri1 id_5,
    input uwire id_6,
    output supply1 id_7,
    output tri1 id_8,
    input wor id_9,
    input tri id_10,
    output tri1 id_11,
    output tri0 id_12,
    input wor id_13,
    output wor id_14,
    input supply1 id_15,
    input tri0 id_16,
    output uwire id_17,
    input wand id_18,
    output tri id_19,
    input wor id_20,
    input wand id_21,
    output tri0 id_22,
    output tri id_23,
    input tri0 id_24,
    input tri1 id_25,
    input supply0 id_26,
    input tri0 id_27,
    input tri1 id_28
);
  wire id_30 = id_13;
  logic [7:0] id_31;
  assign id_31[1] = 1'd0;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input wand id_2
);
  assign {id_2 !== id_0, 1} = id_2;
  module_0(
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0
  );
endmodule
