// Seed: 4121573587
module module_0 (
    output wand id_0,
    output supply0 id_1,
    output wor id_2,
    input tri0 id_3,
    output tri0 id_4,
    input wand id_5,
    output tri1 id_6,
    input tri1 id_7,
    input wand id_8
    , id_13,
    output wor id_9,
    input tri0 id_10
    , id_14,
    output supply0 id_11
);
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input wor id_2,
    input tri1 id_3
);
  initial begin : LABEL_0
    id_5 <= 'b0;
  end
  uwire id_6 = id_2;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_1,
      id_6,
      id_3,
      id_6,
      id_6,
      id_2,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.type_17 = 0;
  wand id_7 = id_6;
  wire id_8;
  wire id_9;
  wire id_10;
endmodule
