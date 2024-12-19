// Seed: 1151172709
module module_0 (
    input supply1 id_0
    , id_25,
    output tri1 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input uwire id_4,
    output supply1 id_5,
    input tri0 id_6,
    output supply0 id_7,
    input supply1 id_8,
    input supply0 id_9,
    input supply0 id_10,
    input uwire id_11,
    input tri id_12,
    input wor id_13,
    input wand id_14,
    input supply0 id_15,
    input wor id_16,
    output wand id_17,
    output wire id_18,
    output tri1 id_19,
    input wand id_20,
    input uwire id_21,
    input wor id_22,
    output tri0 id_23
);
endmodule
module module_1 (
    input wor id_0,
    input wand id_1
    , id_9,
    output wire id_2,
    output tri id_3,
    input uwire id_4
    , id_10,
    input supply0 id_5,
    output supply1 id_6,
    output wand id_7
);
  wire id_11;
  reg  id_12;
  assign id_7 = id_10;
  module_0 modCall_1 (
      id_10,
      id_3,
      id_9,
      id_4,
      id_5,
      id_6,
      id_4,
      id_6,
      id_1,
      id_0,
      id_0,
      id_1,
      id_4,
      id_0,
      id_10,
      id_0,
      id_4,
      id_7,
      id_7,
      id_10,
      id_10,
      id_0,
      id_5,
      id_10
  );
  assign modCall_1.type_4 = 0;
  id_13(
      .id_0(1), .id_1((1)), .id_2(id_10), .id_3(id_12)
  );
  always repeat (1) id_12 <= ~1'b0;
  reg id_14, id_15;
  wire id_16;
  initial begin : LABEL_0
    id_14 <= id_9 | 1 - id_14;
  end
endmodule
