// Seed: 1390537146
module module_0 (
    input tri id_0,
    output uwire id_1,
    input wor id_2,
    input tri0 id_3,
    input wire id_4,
    output tri1 id_5,
    output uwire id_6,
    input supply1 id_7,
    output tri id_8,
    output tri0 id_9,
    output tri0 id_10,
    input wand id_11,
    input uwire id_12,
    input wand id_13,
    input supply0 id_14
    , id_27,
    output wire id_15,
    output tri1 id_16,
    input supply0 id_17,
    input supply1 id_18,
    output wor id_19,
    output supply0 id_20,
    output wire id_21,
    output supply0 id_22,
    input wand id_23,
    input supply0 id_24,
    input tri id_25
);
  assign id_10 = {1, id_12 + 1} ? id_23 : 1;
  wire id_28;
  assign id_8 = id_7;
endmodule
module module_1 (
    output supply0 id_0,
    input uwire id_1,
    output wire id_2
);
  assign #id_4 id_2 = 1'b0;
  module_0(
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1
  );
endmodule
