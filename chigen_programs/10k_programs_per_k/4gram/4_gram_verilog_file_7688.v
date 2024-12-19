// Seed: 1658464443
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input tri id_2,
    input tri1 id_3,
    input wire id_4
    , id_20,
    output wire id_5
    , id_21,
    input supply1 id_6,
    output wand id_7,
    input supply0 id_8,
    input wand id_9,
    output wor id_10,
    output wire id_11,
    input wire id_12,
    input tri0 id_13,
    output supply1 id_14,
    input supply0 id_15,
    input supply1 id_16,
    input tri id_17,
    output tri id_18
);
  assign id_5 = id_9;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    output supply1 id_2,
    input tri id_3
    , id_17,
    output wor id_4,
    output tri1 id_5,
    output tri id_6,
    output supply1 id_7,
    input supply0 id_8,
    input wor id_9,
    output wire id_10,
    output wand id_11,
    output tri id_12
    , id_18,
    output uwire id_13,
    output supply0 id_14,
    output uwire id_15
);
  initial begin : LABEL_0
    #1 id_17 += (id_3);
    cover (id_9);
  end
  wire id_19;
  wire id_20;
  assign id_15 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_9,
      id_1,
      id_6,
      id_3,
      id_11,
      id_9,
      id_9,
      id_6,
      id_5,
      id_3,
      id_8,
      id_2,
      id_8,
      id_9,
      id_3,
      id_10
  );
  assign modCall_1.id_15 = 0;
endmodule
