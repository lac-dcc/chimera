// Seed: 2079150641
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input supply1 id_2,
    output tri id_3,
    input uwire id_4
    , id_22,
    output tri0 id_5,
    output wire id_6,
    output tri1 id_7,
    input uwire id_8,
    input uwire id_9,
    input wire id_10,
    output wand id_11,
    output tri id_12,
    input uwire id_13,
    output uwire id_14,
    output tri1 id_15,
    output wor id_16,
    input tri0 id_17,
    output uwire id_18,
    input tri1 id_19,
    output supply0 id_20
    , id_23
);
  assign id_14 = 1;
  assign module_1.id_16 = 0;
endmodule
module module_1 #(
    parameter id_18 = 32'd57
) (
    input wand id_0,
    input supply0 id_1,
    input tri1 id_2,
    input wor id_3,
    input uwire id_4,
    output wor id_5,
    input wire id_6,
    input wand id_7,
    output wor id_8,
    output wand id_9,
    output tri0 id_10,
    output wand id_11,
    output tri1 id_12,
    output tri1 id_13,
    output wor id_14
    , id_26,
    output wor id_15,
    output supply0 id_16,
    output supply1 id_17,
    input supply0 _id_18,
    output supply0 id_19,
    input wor id_20,
    input wand id_21,
    output wor id_22,
    input supply0 id_23,
    output wor id_24
);
  reg [1 : id_18] id_27;
  id_28 :
  assert property (@(negedge id_18) id_6 == "") id_27 <= -1;
  wire id_29;
  module_0 modCall_1 (
      id_3,
      id_13,
      id_4,
      id_19,
      id_6,
      id_22,
      id_13,
      id_24,
      id_21,
      id_20,
      id_7,
      id_24,
      id_8,
      id_20,
      id_9,
      id_17,
      id_12,
      id_4,
      id_5,
      id_20,
      id_11
  );
  assign id_26 = 1;
  always
  `define pp_30 0
  assign id_17 = id_21;
endmodule
