// Seed: 311827376
module module_0 (
    output supply0 id_0,
    output wor id_1,
    input wor id_2,
    input wor id_3,
    output tri1 id_4,
    output wand id_5,
    input tri1 id_6,
    output wand id_7,
    input wire id_8,
    output tri1 id_9,
    input tri1 id_10,
    input tri id_11,
    output tri0 id_12,
    input wor id_13,
    output tri id_14,
    input tri id_15,
    output uwire id_16,
    input tri1 id_17,
    input tri0 id_18,
    output tri0 id_19,
    input wand id_20
    , id_35,
    input wand id_21,
    output supply0 id_22,
    input wor id_23,
    input wor id_24,
    input tri0 id_25,
    input supply0 id_26,
    output tri id_27,
    output tri0 id_28,
    input supply0 id_29,
    input supply1 id_30,
    input supply0 id_31,
    input supply0 id_32,
    output wand id_33
);
  always #1 begin : LABEL_0
    {id_31} += id_20 ^ 1 ^ 1 ~^ 1;
  end
endmodule
module module_1 (
    output supply0 id_0,
    input wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    output supply1 id_5,
    output wor id_6,
    output wire id_7,
    input wand id_8,
    output tri id_9,
    input uwire id_10,
    inout uwire id_11,
    input wor id_12
);
  wor id_14;
  assign id_9  = id_1;
  assign id_5  = 1;
  assign id_0  = 1 - 1;
  assign id_11 = 1;
  wire id_15;
  tri  id_16 = id_8;
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2,
      id_12,
      id_16,
      id_5,
      id_8,
      id_11,
      id_2,
      id_7,
      id_4,
      id_2,
      id_3,
      id_12,
      id_7,
      id_12,
      id_3,
      id_2,
      id_16,
      id_9,
      id_12,
      id_16,
      id_3,
      id_12,
      id_2,
      id_16,
      id_11,
      id_6,
      id_0,
      id_1,
      id_1,
      id_4,
      id_16,
      id_11
  );
  assign modCall_1.id_4 = 0;
  assign id_14 = 1;
  wire id_18;
endmodule
