// Seed: 1894505104
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input wor id_2,
    output wand id_3,
    input uwire id_4,
    output tri0 id_5,
    input tri1 id_6,
    output tri0 id_7,
    output tri1 id_8
    , id_27,
    input uwire id_9,
    input tri1 id_10,
    input uwire id_11,
    input tri1 id_12,
    input uwire id_13,
    input tri0 id_14,
    input tri0 id_15,
    output wire id_16,
    output supply0 id_17,
    input wand id_18,
    input tri0 id_19,
    input wire id_20,
    input uwire id_21,
    input tri1 id_22,
    input uwire id_23,
    input wand id_24,
    output tri0 id_25
);
  wire id_28;
  initial id_27 = {-1, id_15, 1, id_1, id_20, id_19, ""};
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd40
) (
    output tri id_0,
    input wand id_1,
    input wire _id_2,
    input wand id_3,
    output uwire id_4,
    input uwire id_5,
    input uwire id_6,
    input tri1 id_7,
    input uwire id_8,
    input supply0 id_9
);
  wire [id_2 : 1] id_11;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_0,
      id_5,
      id_0,
      id_7,
      id_0,
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_9,
      id_3,
      id_4,
      id_4,
      id_8,
      id_7,
      id_7,
      id_6,
      id_1,
      id_1,
      id_9,
      id_4
  );
endmodule
